# homebrew-tap

Personal Homebrew tap.

```sh
brew tap flavian112/tap
brew install flavian112/tap/<formula>
```

## Formulae

| Formula | Description                                                                 |
|---------|-----------------------------------------------------------------------------|
| `yabai` | [flavian112/yabai](https://github.com/flavian112/yabai): yabai with macOS 27 support, Developer ID signed and notarized |

## Updating `yabai`

Releases are built in the fork with `scripts/release --publish`, which prints
the new `url` and `sha256`. Then:

1. Update `url`, `version` and `sha256` in `Formula/yabai.rb`.
2. Commit and push.
3. `brew upgrade yabai`, then refresh the sudoers rule (see the formula caveats).

`brew livecheck flavian112/tap/yabai` shows whether the fork has a newer release.
