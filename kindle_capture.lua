-- kindleアプリのページを連続でスクリーンショットし、デスクトップに保存するHammerspoonスクリプトです。
-- kindle上でhotkeyを押す->キャプチャ, 終了はcomand + Escで終了.

-- 設定
local kindleAppName = "Kindle"
local screenshotFolder = os.getenv("HOME") .. "/Desktop/kindle_screens/"
local interval = 0.3       -- 撮影間隔（秒）

-- 状態管理
local capturing = false
local captureTimer = nil

-- 準備
hs.fs.mkdir(screenshotFolder)

-- スクショ関数
function capturePage(index)
  local filename = string.format("%s/page_%03d.png", screenshotFolder, index)
  hs.execute("screencapture -x -R0,50,1709,1106 " .. filename)
end

-- ページ送り関数（右矢印キー送信）
function turnPage()
  hs.eventtap.keyStroke({}, "left")
end

-- キャプチャループ
function captureLoop(index)
  if not capturing then return end
  capturePage(index)
  turnPage()
  captureTimer = hs.timer.doAfter(interval, function()
    captureLoop(index + 1)
  end)
end

-- メインループ開始
function startCapture()
  if capturing then return end
  capturing = true
  hs.application.launchOrFocus(kindleAppName)
  hs.timer.doAfter(1, function()
    captureLoop(1)
  end)
end

-- キャプチャ停止
function stopCapture()
  capturing = false
  if captureTimer then
    captureTimer:stop()
    captureTimer = nil
  end
  hs.alert("🖐️ キャプチャ停止")
end

-- 起動キー（cmd + shift + K でスタート）
hs.hotkey.bind({"cmd", "shift", "alt"}, "K", function()
  hs.alert("🚀 Kindleキャプチャ開始！")
  hs.timer.doAfter(1, function()
    startCapture()
  end)
end)

-- 停止キー（cmd + Esc で停止）
hs.hotkey.bind({"cmd"}, "escape", function()
  stopCapture()
end)