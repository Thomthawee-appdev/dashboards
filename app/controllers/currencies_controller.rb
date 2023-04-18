class CurrenciesController < ApplicationController
  def first_currency


    render({ :template => "currency_templates/step_one.html.erb"})

  end




end
