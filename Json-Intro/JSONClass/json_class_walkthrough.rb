require 'json'
require 'date'

class ParseJson
  attr_accessor :json_file
    def initialize(json_file)
      @json_file = JSON.parse(File.read(json_file))
    end

  def get_base
    #return base
    json_file["base"]
  end
  def greater_than_zero
    json_file["rates"]
  end
  def get_date
    json_file["date"]
  end

  def get_rates
    json_file["rates"].length
  end

  def finding_strings
    json_file["rates"].all? {|key, value| key.is_a? String}
  end

  def content_of_hash
    json_file["rates"].all? {|key, value| value.is_a? Float}
    end

    def date_of_year
      yyyy, mm, dd = json_file['date'].split '-'
      Date.valid_date? yyyy.to_i, mm.to_i, dd.to_i
    end

    # def greater_than_zero
    #   json_file["rates"].each? {|key, value| value < 3}
    # end

end
# run = ParseJson.new('json_exchange_rates.json')
# p run.json_file
