cask "clay" do
  arch arm: "arm64", intel: "x64"

  version "0.1.0"
  sha256 arm:   "0000000000000000000000000000000000000000000000000000000000000000",
         intel: "0000000000000000000000000000000000000000000000000000000000000001"

  url "https://github.com/EasonYan7/clay/releases/download/v#{version}/Clay-#{version}-#{arch}.dmg"
  name "Clay"
  desc "Visual canvas editor for AI-generated HTML"
  homepage "https://github.com/EasonYan7/clay"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :monterey

  app "Clay.app"

  # Clay is not signed or notarized (no Apple Developer account). Strip the
  # quarantine flag so Gatekeeper does not block the first launch.
  postflight_steps do
    run "/usr/bin/xattr",
        args:           ["-dr", "com.apple.quarantine", "{{appdir}}/Clay.app"],
        writable_paths: ["Clay.app"],
        writable_base:  :appdir,
        must_succeed:   false
  end

  zap trash: [
    "~/Library/Application Support/Clay",
    "~/Library/Caches/Clay",
    "~/Library/Caches/com.clay.editor",
    "~/Library/HTTPStorages/com.clay.editor",
    "~/Library/Logs/Clay",
    "~/Library/Preferences/com.clay.editor.plist",
    "~/Library/Saved Application State/com.clay.editor.savedState",
  ]

  caveats <<~EOS
    Clay is not notarized by Apple. The quarantine attribute was removed from
    Clay.app on install so it can launch; only install builds you trust.
  EOS
end
