require "minitest/autorun"
require "minitest/trump"

module TestMinitest; end

class TestMinitest::TestTrump < Minitest::Test
  def test_golf_swing
    skip "Responsibility"
  rescue ::Minitest::Skip => e
    assert_equal "Golfing", e.result_label
    assert_equal "GOLF", e.result_code
  end

  def test_sanity_failure
    assert_equal 1, 2
  rescue Minitest::Assertion => e
    assert_equal "FAKE NEWS!", e.result_label
  end

  def test_sanity_error
    raise "bad"
  rescue => e
    e = Minitest::UnexpectedError.new(e)
    assert_equal "Alt-Fact", e.result_label
  end

  if ENV["ALL"] then
    def test_golf_swing
      skip "Responsibility"
    end

    def test_show_failure
      assert_equal 1, 2
    end

    def test_show_error
      raise "bad"
    end
  end

end
