# homebrew-clay

Homebrew tap for [Clay](https://github.com/EasonYan7/clay), which turns
AI-generated HTML into an editable visual canvas.

## Install

```sh
brew tap EasonYan7/clay
brew trust --tap EasonYan7/clay
brew install --cask clay
```

Requires Homebrew 7 or later (run `brew update` first). Homebrew refuses to
load casks from non-official taps until you trust them with `brew trust`, and
the cask uses `postflight_steps`, which older Homebrew versions cannot parse.

## Upgrade

```sh
brew update
brew upgrade --cask clay
```

## Uninstall

```sh
brew uninstall --cask clay
# also remove app data, preferences and caches:
brew uninstall --cask --zap clay
```

## Unsigned build

Clay is not signed or notarized by Apple. The cask removes the
`com.apple.quarantine` attribute from `Clay.app` after install so macOS
Gatekeeper does not block the first launch. If you would rather keep Gatekeeper
in the loop, install from the
[releases page](https://github.com/EasonYan7/clay/releases) manually and, on
first launch, allow it under System Settings → Privacy & Security → Open Anyway.

Requires macOS 12 (Monterey) or later, on Apple Silicon or Intel.

## Source

Application source, issues and releases: <https://github.com/EasonYan7/clay>
