# frozen_string_literal: true

module Advent2024
  class Day03
    NUMBER = /\d{1,3}/
    PART_ONE_REGEX = /mul\(\d{1,3},\d{1,3}\)/
    attr_reader :sample

    def initialize(sample = nil)
      @sample = sample || daily_input
    end

    def part_one
      multiply_and_sum_matches(sample.scan(PART_ONE_REGEX))
    end

    # match on "do()" or "don't()" or a MUL call
    # scanning sequentially, enable and disable
    # multiplication depending on match
    #
    # if the match data doesn't include do() or don't(),
    # multiply the second and third groups
    PART_TWO_REGEX = /do(n't)?\(\)|mul\((\d+),(\d+)\)/
    def part_two
      sum = 0
      enabled = true
      sample.scan(PART_TWO_REGEX) do
        if ::Regexp.last_match(0) == 'do()'
          enabled = true
        elsif ::Regexp.last_match(0) == "don't()"
          enabled = false
        elsif enabled
          sum += ::Regexp.last_match(2).to_i * ::Regexp.last_match(3).to_i
        end
      end

      sum
    end

    private

    def multiply_and_sum_matches(matches)
      matches.map do |match|
        num1, num2 = match.scan(NUMBER).map(&:to_i)
        num1 * num2
      end.sum
    end

    def daily_input
      File.read('input/day03')
    end
  end
end
