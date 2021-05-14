require 'report'

describe Report do
  describe '#load_csv' do
    it('receives a string and returns an array') do
      report_array = Report.load_csv('1,2,3,4')
      expect(report_array).to be_instance_of Array
    end

    it('returns an array with the string split by commas') do
      expect(Report.load_csv("Green, Green, Red, Amber, Red")).to eq ["Green", "Green", "Red", "Amber", "Red"]
    end
  end

  describe '#create_hash' do
    it('counts each item in array') do
      arr = Report.load_csv("Green, Green, Red, Amber, Red")
      expect(Report.create_hash(arr)).to include('Amber' => 1, 'Green'=> 2, 'Red'=> 2)
    end
  end

  describe '#create_report' do
    it('converts hash into report') do
      arr = Report.load_csv("Green, Green, Red, Amber, Red")
      counter = Report.create_hash(arr)
      expect(Report.create_report(counter)).to eq "Green: 2\nAmber: 1\nRed: 2"
    end
  end
end