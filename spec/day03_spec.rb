# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Advent2024::Day03 do
  describe '#part_one' do
    it 'multiplies the results of valid `mul` calls' do
      sample = 'xmul(2,4)%&mul[3,7]!@^do_not_mul(5,5)+mul(32,64]then(mul(11,8)mul(8,5))'

      expect(described_class.new(sample).part_one).to eq(161)
    end

    it 'parses the daily file' do
      expect(described_class.new.part_one).to eq(167_090_022)
    end
  end

  describe '#part_two' do
    it 'multiplies the reuslts of valid `mul` calls' do
      sample = "xmul(2,4)&mul[3,7]!^don't()_mul(5,5)+mul(32,64](mul(11,8)undo()?mul(8,5))"

      expect(described_class.new(sample).part_two).to eq(48)
    end

    it 'multiplies the reuslts of valid `mul` calls' do
      expect(described_class.new.part_two).to eq(89_823_704)
    end
  end
end
