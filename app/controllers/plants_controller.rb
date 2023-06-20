class PlantsController < ApplicationController
 wrap_parameters format: []
    def index
        plants = Plant.all 
        render json: plants, status: :ok
    end

    def show
        plant = Plant.find_by(id: params[:id])
        if  plant
            render json: plant
        else
            render json: {error: "Plant not found"}, status: :not_found
        end  


    end

    def create
        new_plant = Plant.create(plants_params)
        render json: new_plant, status: :created

    end

    private
    def plants_params
        params.permit(:name,:image,:price)
    end
end
