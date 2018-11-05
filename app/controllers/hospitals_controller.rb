class HospitalsController < ApplicationController
  def index
    @hospitals = Hospital.all
  end

  def new
    @hospital = Hospital.new
  end
  
  def create
    unless Hospital.exists?(hospital_params)
    
    hospital = Hospital.create(hospital_params)
    if hospital.persisted?
      redirect_to hospitals_path, notice: 'Hospital added'
    else
      redirect_to hospitals_path, notice: 'Hospital already exists. Your hospital could not be saved'
      end
    end
  end

  def show
    @hospitals = Hospital.find(params[:id])
  end

  private

  def hospital_params
    params.require(:hospital).permit(:name)
  end
end
