# Kindle Capture for Hammerspoon

このリポジトリは、Kindleアプリのページを連続でスクリーンショットし、デスクトップに保存するHammerspoon用Luaスクリプトです。

## 機能概要
- Kindleアプリのページを自動でキャプチャし、`~/Desktop/kindle_screens/` フォルダに保存します。
- ホットキーでキャプチャ開始・停止が可能です。

## 必要条件
- macOS
- [Hammerspoon](https://www.hammerspoon.org/) がインストールされていること
- Kindleアプリ（Mac版）

## インストール方法
1. このリポジトリの `kindle_capture.lua` をダウンロードします。
2. Hammerspoonの設定ディレクトリ（通常は `~/.hammerspoon/`）にファイルを配置するか、`init.lua` からこのスクリプトを `require` してください。

## 使い方
1. Kindleアプリを起動し、キャプチャしたい本を開きます。
2. 以下のホットキーでキャプチャを開始します：
   - `⌘ + Shift + Option + K` でキャプチャ開始
3. キャプチャを停止したい場合は：
   - `⌘ + Esc` で停止
4. スクリーンショットは `~/Desktop/kindle_screens/` フォルダに `page_001.png` などの形式で保存されます。

## 注意事項
- ページ送りは左矢印キーで行われます。必要に応じてスクリプト内の `turnPage()` 関数を修正してください。
- スクリーンショット範囲（`screencapture` の `-R` オプション）はご自身の環境に合わせて調整してください。

## ライセンス
MIT License
