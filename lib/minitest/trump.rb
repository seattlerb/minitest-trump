require "minitest"

module Minitest
  class Trump
    VERSION = "1.0.0"
  end

  class Assertion
    alias old_result_label result_label
    def result_label
      "FAKE NEWS!"
    end
  end

  class UnexpectedError
    alias old_result_label result_label
    def result_label
      "Alt-Fact"
    end
  end
end
