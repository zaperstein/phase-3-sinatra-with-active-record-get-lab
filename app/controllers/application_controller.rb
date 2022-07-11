class ApplicationController < Sinatra::Base

  #sets the Content-Type header in the response to application/json
    set :default_content_type, 'application/json'

    get '/bakeries' do
      #get all the bakeries from the database
     bakeries = Bakery.all
      #send them back as a json array (array of objects)
      bakeries.to_json
    end

    get '/bakeries/:id' do
      #look up the bakery in the database using its ID
      bakery = Bakery.find(params[:id])
      #send a JSON-formatted response of the bakery data
      bakery.to_json(include: :baked_goods)
    end

    get '/baked_goods/by_price' do
    baked_goods = BakedGood.by_price
    baked_goods.to_json
    end

    get '/baked_goods/most_expensive' do
      baked_good = BakedGood.by_price.first
      baked_good.to_json
    end

  # add routes

end
