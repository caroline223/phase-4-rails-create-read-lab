class PlantsController < ApplicationController
    
    #GET plants
    def index
        plants = Plant.all
        render json: plants
    end

    def show
        plant = Plant.find(params[:id])
        if plant
           render json: plant
        else
            render json: {error: "Plant not found"}, status: :not_found
        end
    end

    def create
        plant = Plant.create(plant_params)
        render json: plant, status: :created
    end

    def plant_params
        params.permit(:name, :image, :price)
    end
    
end
