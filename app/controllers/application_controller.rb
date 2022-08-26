class ApplicationController < Sinatra::Base
    set :default_content_type, 'application/json'
  # add routes
    get '/bakeries' do 
      Bakery.all.to_json
    end

    get '/bakeries/:id' do 
      kitchen = Bakery.find(params[:id])
      kitchen.to_json(include: :baked_goods)
    end

    get '/baked_goods/by_price' do
      treats = BakedGood.by_price
      treats.to_json 
    end

    get '/baked_goods/most_expensive' do
      desserts = BakedGood.by_price.first
      desserts.to_json
    end

end
