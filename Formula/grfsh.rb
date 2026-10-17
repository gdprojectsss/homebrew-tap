class Grfsh < Formula
  desc "Small Unix shell with bash style scripting, typed tables and an agent mode"
  homepage "https://grf.sh"
  version "1.0.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/gdprojectsss/goRustlyFast/releases/download/v1.0.0/grfsh-v1.0.0-aarch64-apple-darwin.tar.gz"
      sha256 "cf4dcd9e99060b0d638ab4297ddda469bfe9e269aeff2b4e1223ddf1904d8737"
    end
    on_intel do
      url "https://github.com/gdprojectsss/goRustlyFast/releases/download/v1.0.0/grfsh-v1.0.0-x86_64-apple-darwin.tar.gz"
      sha256 "02e649e9c4956216e94794f0b55ee668e48e9a9d531c0214eb996767c47e14d9"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/gdprojectsss/goRustlyFast/releases/download/v1.0.0/grfsh-v1.0.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "7f796ffa1849f3f13f47cd4bc3eb83d8b2a41f9f342a1b886632ad28e8ca3f7b"
    end
    on_intel do
      url "https://github.com/gdprojectsss/goRustlyFast/releases/download/v1.0.0/grfsh-v1.0.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "b3f6856a598a19625f3bdf5a04a7038245fee40f2690fc8501999cf62d18847d"
    end
  end

  def install
    bin.install "grfsh"
    man1.install "grfsh.1"
  end

  def caveats
    <<~EOS
      To make grfsh your login shell:
        echo #{HOMEBREW_PREFIX}/bin/grfsh | sudo tee -a /etc/shells
        chsh -s #{HOMEBREW_PREFIX}/bin/grfsh
    EOS
  end

  test do
    assert_equal "42\n", shell_output("#{bin}/grfsh -c 'echo $((6 * 7))'")
    assert_match version.to_s, shell_output("#{bin}/grfsh --version")
  end
end
