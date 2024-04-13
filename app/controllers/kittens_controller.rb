class KittensController < ApplicationController
  before_action :set_kitten, only: [:show, :edit, :update, :destroy]

  def index
    @kittens = Kitten.all
    respond_to do |format|
      format.html # Render HTML view
      format.json { render json: @kittens }
    end
  end

  def show
    respond_to do |format|
      format.html # Render HTML view
      format.json { render json: @kitten } # Render JSON format
    end
  end

  def new
    @kitten = Kitten.new
  end

  def edit
  end

  def create
    @kitten = Kitten.new(kitten_params)

    if @kitten.save
      flash[:success] = "Kitten created successfully!"
      redirect_to @kitten
    else
      flash.now[:error] = "Failed to create kitten"
      render :new
    end
  end

  def update
    if @kitten.update(kitten_params)
      flash[:success] = "Kitten updated successfully!"
      redirect_to @kitten
    else
      flash.now[:error] = "Failed to update kitten"
      render :edit
    end
  end

  def destroy
    @kitten.destroy
    flash[:success] = "Kitten deleted successfully!"
    redirect_to kittens_url
  end

  private

  def set_kitten
    @kitten = Kitten.find(params[:id])
  end

  def kitten_params
    params.require(:kitten).permit(:name, :age, :cuteness, :softness)
  end
  
end
