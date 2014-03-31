class DogsController < ApplicationController
  def new
    @dog = Dog.new
  end

   def create
    @dog = Dog.new(dog_params)
    if @dog.save
      redirect_to dogs_path, notice: 'Dog was successfully created.'
    else
      render action: 'new'
    end
  end

  def index
    @dogs = Dog.all
  end

  private
    def dog_params
      params.require(:dog).permit(:first_name, :last_name, :dog_name, :email)
    end
end
