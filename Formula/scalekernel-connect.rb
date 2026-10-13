class ScalekernelConnect < Formula
  desc "Log in to a product from your own computer for a ScaleKernel audit"
  homepage "https://github.com/ScaleKernel/connect"
  version "0.1.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/ScaleKernel/connect/releases/download/v0.1.0/scalekernel-connect-0.1.0-macos-arm64.tar.gz"
      sha256 "62a3e6eb992883e326b66ac43949b3ec1235665fe040e34ee68f3e52e1ef892a"
    end
    on_intel do
      url "https://github.com/ScaleKernel/connect/releases/download/v0.1.0/scalekernel-connect-0.1.0-macos-x64.tar.gz"
      sha256 "2c19f9ff238a47666245ad2bcfd597c1d8631b04a507abf2fa469aca2d61005d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ScaleKernel/connect/releases/download/v0.1.0/scalekernel-connect-0.1.0-linux-arm64.tar.gz"
      sha256 "99e770ce18b87bd30ed2256f0df442c51e56d8916cdc6b58ef7cb5fa0695d187"
    end
    on_intel do
      url "https://github.com/ScaleKernel/connect/releases/download/v0.1.0/scalekernel-connect-0.1.0-linux-x64.tar.gz"
      sha256 "0768f858c0d038ca8d220c3be144bfb9727da4d978b2c3feff72169f6dd6b000"
    end
  end

  def install
    libexec.install Dir["*"]
    bin.install_symlink libexec/"scalekernel-connect"
  end

  def caveats
    <<~EOS
      Needs Google Chrome (or Chromium, Edge, Brave). Run the command an audit shows you:
        scalekernel-connect <login link>
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/scalekernel-connect --version")
  end
end
