require 'active_support'
require 'active_support/core_ext'
require 'byebug'


class RecurringMoment
  def initialize(start:, interval:, period:)
    @start = start
    @interval = interval
    @period = period
  end

  def match(date)
    current = @start
    month_count = 0

    # byebug
    while current <= date
      if current == date
        return true
      end

      if @period == 'monthly'
        current = @start
        month_count += @interval
        current = current.advance(months: month_count)
      elsif @period == 'weekly'
        current = current.advance(weeks: @interval)
      elsif @period == 'daily'
        current = current.advance(days: @interval)
      end
    end

    # byebug
    return current == date
  end
end
