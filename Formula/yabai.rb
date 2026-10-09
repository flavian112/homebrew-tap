class Yabai < Formula
  desc "Tiling window manager for macOS (fork with macOS 27 support)"
  homepage "https://github.com/flavian112/yabai"
  url "https://github.com/flavian112/yabai/releases/download/v7.1.25-flavian.1/yabai-v7.1.25-flavian.1.tar.gz"
  version "7.1.25-flavian.1"
  sha256 "9895cd6d2444959685610b8dc112821d73cd4cdbc2524043d43efb40691a80b4"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  depends_on :macos

  conflicts_with "asmvik/formulae/yabai", because: "both install a `yabai` binary"

  def install
    # prebuilt, Developer ID signed and notarized; building from source would
    # replace the signature and reset the Accessibility permission on every update
    bin.install "bin/yabai"
    man1.install "doc/yabai.1"
    (pkgshare/"examples").install Dir["examples/*"]
  end

  def caveats
    <<~EOS
      The scripting addition is loaded with sudo; after installing or upgrading,
      update the sudoers rule, which pins the binary's hash:
        echo "$(whoami) ALL=(root) NOPASSWD: sha256:$(shasum -a 256 #{opt_bin}/yabai | cut -d " " -f 1) #{HOMEBREW_PREFIX}/bin/yabai --load-sa" \\
          | sudo tee /private/etc/sudoers.d/yabai
    EOS
  end

  test do
    assert_match "yabai-v#{version}", shell_output("#{bin}/yabai --version")
  end
end
