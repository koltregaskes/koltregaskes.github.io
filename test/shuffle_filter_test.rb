require 'minitest/autorun'

# Stub Liquid's filter registration to avoid requiring the full gem
module Liquid
  class Template
    def self.register_filter(mod); end
  end
end

require_relative '../_plugins/filters/shuffle'

class ShuffleFilterTest < Minitest::Test
  include Jekyll::ShuffleFilter

  def test_shuffle_returns_same_elements_different_order
    array = [1, 2, 3, 4, 5]
    shuffled = shuffle(array)
    assert_equal array.sort, shuffled.sort, 'shuffled array should contain same elements'
    refute_equal array, shuffled, 'shuffled array should be in different order'
  end
end
