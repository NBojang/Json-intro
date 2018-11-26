describe 'Testing the exchange' do

  before(:all) do
    @exchange_rates = ParseJson.new('json_exchange_rates.json')
  end

  it "should be a hash " do
    expect(@exchange_rates.json_file).to be_kind_of(Hash)
  end

  it "should be euro" do
    expect(@exchange_rates.json_file.first.last).to eq 'EUR'
  end
  it "should contain the base be euro" do
    expect(@exchange_rates.get_base).to eq 'EUR'
  end

  it "should have the correct date " do
    expect(@exchange_rates.get_date).to eq '2017-07-26'
  end

  it "should have 31 strings of rates" do
    expect(@exchange_rates.get_rates).to eq 31
  end

  it "should have only strings" do
    expect(@exchange_rates.finding_strings).to eq true
  end

  it "should  be an floats" do
    expect(@exchange_rates.content_of_hash).to be true
  end

  it "should have the correct date " do
    expect(@exchange_rates.date_of_year).to eq true
  end

  it "should be greater zero " do
    @exchange_rates.json_file["rates"].values.each do |value|
      expect(value).to be > 0
    end
  end

end
