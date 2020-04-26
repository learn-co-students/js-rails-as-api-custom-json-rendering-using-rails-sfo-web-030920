class BirdsController < ApplicationController
  def index
    birds = Bird.all
    render json: birds, only: [:id, :name, :species]
  end

  def show
    bird = Bird.find_by(id: params[:id])
    # Also add an error message if bird record not found
    # Option 1:
    # if bird
    #   render json: {
    #   id: bird.id, 
    #   name: bird.name, 
    #   species: bird.species
    #   }
    # else
    #   render json: { message: 'Bird not found' }
    # end

    # Option 2: slice method returns a new hash to be rendered
    if bird
      render json: bird.slice(:id, :name, :species)
    else
      render json: { message: 'Bird not found' }
    end
  end
end