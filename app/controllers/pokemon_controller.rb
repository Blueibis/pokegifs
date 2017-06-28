class PokemonController < ApplicationController

  def show

    res = Typhoeus.get("http://pokeapi.co/api/v2/pokemon/#{params[:id]}/", followlocation: true)
    body = JSON.parse(res.body)
    res2 = Typhoeus.get("https://api.giphy.com/v1/gifs/search?api_key=#{ENV["GIPHY_MYAPP_KEY"]}&q=#{body["name"]}&rating=g", followlocation: true)
    body2 = JSON.parse(res2.body)
     # should be "pikachu"
    render json:
    {
      id: body["id"],
      name: body["name"],
      types: body["types"].first["type"]["name"],
      gif: body2["data"].sample["embed_url"]
    }
  end





end
