class CurrenciesController < ApplicationController
  def first_currency
    require "open-uri"
    @raw_data = open("https://api.exchangerate.host/symbols").read
    @parsed_data = JSON.parse(@raw_data)
    @symbols_hash = @parsed_data.fetch("symbols")


    @array_of_symbols = @symbols_hash.keys
    render({ :template => "currency_templates/step_one.html.erb"})

  end

  def second_currency
    require "open-uri"
    @raw_data = open("https://api.exchangerate.host/symbols").read
    @parsed_data = JSON.parse(@raw_data)
    @symbols_hash = @parsed_data.fetch("symbols")
    @array_of_symbols = @symbols_hash.keys

    @from_symbol = params.fetch("from_currency")

    render({ :template => "currency_templates/step_two.html.erb"})

  end

  def convert_currency

    @first_currency = params.fetch("from_currency")
    @second_currency = params.fetch("to_currency")
    url_name = "https://api.exchangerate.host/convert?from=" +@first_currency+"&to="+@second_currency
    @raw_data = open(url_name).read
    @parsed_data = JSON.parse(@raw_data)
    @ex_rate = @parsed_data.fetch("result")

    render({ :template => "currency_templates/convert.html.erb"})
  end




end
