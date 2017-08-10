class DosesController < ApplicationController
  # def index
  #   @doses = Dose.all
  # end

  def show
  end

  def new
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new
  end

  def create
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new(dose_params)
    @dose.cocktail = @cocktail
    if @dose.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  def destroy
    @dose = Dose.find(params[:id])
    @dose.destroy
  end

  # def update
  # end

  # def edit
  # end

  private
  def dose_params
  params.require(:dose).permit(:description, :cocktail_id, :ingredient_id)
  end

end
