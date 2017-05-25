class CocktailsController < ApplicationController

  def index
    @cocktails = Cocktail.all
  end


def show
    set_cocktail
    @doses = @cocktail.doses
    # @reviews = @restaurant.review
  end

  def new

    @cocktail = Cocktail.new

  end

  def create
    @cocktail = Cocktail.new(cocktail_params)
    @cocktail.save
    redirect_to cocktails_path
  end


  def set_cocktail
     @cocktail = Cocktail.find(params[:id])
  end

  def cocktail_params
    params.require(:cocktail).permit(:name)
  end

end
