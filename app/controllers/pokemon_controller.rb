class PokemonController < ApplicationController

  def index
    header = {
      api_key: ENV["GIPHY_MYAPP_KEY"]
     }
    res = Typhoeus.get("http://pokeapi.co/api/v2/pokemon/pikachu/", followlocation: true, headers: header)
    body = JSON.parse(res.body)
     # should be "pikachu"
    render json:
    {
      id: body["id"],
      name: body["name"],
      types: body["types"].first["type"]["name"]
    }
  end





end
