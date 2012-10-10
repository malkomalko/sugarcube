class Numeric
  def seconds
    self
  end
  alias second seconds
  alias sec seconds
  alias secs seconds

  def minutes
    self * 60
  end
  alias minute minutes
  alias min minutes
  alias mins minutes

  def hours
    self * 3600
  end
  alias hour hours

  def days
    self.hours * 24
  end
  alias day days

  def weeks
    self.days * 7
  end
  alias week weeks

  def months
    self.days * 30
  end
  alias month months

  def years
    self.days * 365
  end
  alias year years

  def later(user_info=nil, &fire)
    NSTimer.scheduledTimerWithTimeInterval(self.to_f, target: fire, selector: 'call:', userInfo: user_info, repeats: false)
  end

  def every(user_info=nil, &fire)
    NSTimer.scheduledTimerWithTimeInterval(self.to_f, target: fire, selector: 'call:', userInfo: user_info, repeats: true)
  end
end


module SugarCube
  module Timer
    module_function

    def every(time, user_info=nil, &fire)
      time.every user_info, &fire
    end

    def after(time, user_info=nil, &fire)
      time.later user_info, &fire
    end
  end
end
