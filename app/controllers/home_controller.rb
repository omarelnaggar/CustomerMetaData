class HomeController < ApplicationController
  
  around_filter :shopify_session, :except => 'welcome'
  
  def welcome
    current_host = "#{request.host}#{':' + request.port.to_s if request.port != 80}"
    @callback_url = "http://#{current_host}/login"
  end
  
  def index
    # get 5 products
    # Currently don't have access, change in config\initializers\omniauth.rb
    # @products = ShopifyAPI::Product.find(:all, :params => {:limit => 10})

    # get latest 5 orders
    # Currently don't have access, change in config\initializers\omniauth.rb
    # @orders   = ShopifyAPI::Order.find(:all, :params => {:limit => 5, :order => "created_at DESC" })
    @customers = ShopifyAPI::Customer.find(:all, :params => {:limit => 10})
  end
  
end