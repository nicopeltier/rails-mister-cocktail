class DosesController < ApplicationController


  def new

    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new(cocktail_id: @cocktail.id)

  end

  def create
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new(doses_params)
    @dose.cocktail = @cocktail
    @dose.save
    redirect_to cocktail_path(@cocktail)
  end

  def destroy

    @dose = Dose.find(params[:id])
    @dose.destroy
    redirect_to cocktail_path
  end

  def set_dose
      @dose = Dose.find(params[:cocktail_id, :ingredient_id])
  end

private

 def doses_params
    params.require(:dose).permit(:description, :ingredient_id, :cocktail_id)
end


end
