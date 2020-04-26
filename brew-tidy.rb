class BrewTidy < Formula
    homepage "https://github.com/jrweldon/homebrew-tidy"
    url "https://github.com/jrweldon/homebrew-tidy.git", :tag => "0.1.0"
    desc "External command to find and help remove unused homebrew formulae."
  
    head "https://github.com/jrweldon/homebrew-tidy.git"

    def install
      bin.install "cmd/brew-tidy.sh"
    end
  
    test do
      system "brew", "tidy", "--help"
    end
end