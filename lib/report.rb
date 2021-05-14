class Report
  def self.load_csv(str)
    str.split(', ')
  end

  def self.create_hash(arr)
    counts = Hash.new(0)
    arr.each { |grade| counts[grade] += 1 }
    counts
  end

  def self.create_report(counter)
    "Green: #{counter['Green']}\nAmber: #{counter['Amber']}\nRed: #{counter['Red']}"
  end

end