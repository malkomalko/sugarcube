class NSDate
  def timezone
    return _calendar_components(NSTimeZoneCalendarUnit).timeZone
  end
  alias timeZone timezone

  # In the rare case you actually get an NSDate object - not a Time object - this
  # method is actually useful.
  def utc_offset
    return self.timezone.secondsFromGMT
  end

  def leap_year?
    self.year % 4 == 0 and self.year % 100 != 0 or self.year % 400 == 0
  end

  #  (main)> t = Time.new
  #  => 2012-09-27 11:29:12 +0900
  #  (main)> t.time_array
  #  => [2012, 9, 27]
  def date_array
    return [self.year, self.month, self.day]
  end

  #  (main)> t = Time.new
  #  => 2012-09-27 11:29:12 +0900
  #  (main)> t.time_array
  #  => [11, 29, 12]
  def time_array
    return [self.hour, self.min, self.sec]
  end

  #  (main)> t = Time.new
  #  => 2012-09-27 11:29:12 +0900
  #  (main)> t.time_array
  #  => [2012, 9, 12, 11, 29, 12]
  def datetime_array
    return [self.year, self.month, self.day, self.hour, self.min, self.sec]
  end

  #  (main)> t = Time.new
  #  => 2012-09-27 11:29:12 +0900
  #  (main)> t.start_of_day
  #  => 2012-09-27 00:00:00 +0900
  def start_of_day
    time_interval = self.hour.hours + self.min.minutes + self.sec
    return self - time_interval
  end

  #  (main)> t = Time.new
  #  => 2012-09-27 11:29:12 +0900
  #  (main)> t.end_of_day
  #  => 2012-09-28 00:00:00 +0900
  def end_of_day
    time_interval = (23 - self.hour).hours + (59 - self.min).minutes - self.sec + 60
    return self + time_interval
  end

  def days_in_month
    NSCalendar.currentCalendar.rangeOfUnit(NSDayCalendarUnit, inUnit:NSMonthCalendarUnit, forDate:self).length
  end

  def days_in_year
    NSCalendar.currentCalendar.rangeOfUnit(NSDayCalendarUnit, inUnit:NSYearCalendarUnit, forDate:self).length
  end

  private
  def _calendar_components(components)
    return NSCalendar.currentCalendar.components(components, fromDate:self)
  end
end
