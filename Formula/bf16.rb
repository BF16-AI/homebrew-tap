class Bf16 < Formula
  desc "Official CLI for bf16.ai — run Claude Code, Codex, OpenCode, Goose, and Pi on uncensored 1M-context models"
  homepage "https://bf16.ai"
  url "https://registry.npmjs.org/bf16ai/-/bf16ai-1.0.0.tgz"
  sha256 "f8f3822bdc75f4d6fa45ff75325ee501369ef550f67ea2f51ebf1804f10ce2e9"
  license "MIT"

  depends_on "node"

  def install
    libexec.install Dir["*"]
    (bin/"bf16").write_env_script Formula["node"].opt_bin/"node", "#{libexec}/bin/bf16.mjs", {}
    (bin/"bf16ai").write_env_script Formula["node"].opt_bin/"node", "#{libexec}/bin/bf16.mjs", {}
  end

  test do
    assert_match "1.0.0", shell_output("#{bin}/bf16 --version")
  end
end
