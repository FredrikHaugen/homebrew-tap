class Wake < Formula
  desc "Keep your Mac awake with a countdown that fills the terminal"
  homepage "https://github.com/FredrikHaugen/wake"
  url "https://github.com/FredrikHaugen/wake/archive/refs/tags/v1.1.0.tar.gz"
  sha256 "fd0e463dcf143bf6ec97062aeb179e3081519264c5333adb28c3d1b9c1b81314"
  license "MIT"

  depends_on :macos
  depends_on "node"

  def install
    libexec.install "bin", "src", "package.json"
    (bin/"wake").write_env_script libexec/"bin/wake.js", PATH: "#{formula_opt_bin("node")}:$PATH"
  end

  test do
    assert_match "Usage: wake [duration]", shell_output("#{bin}/wake --help")
    assert_match "is not a duration", shell_output("#{bin}/wake 3x 2>&1", 2)
  end
end
