class EmployeesController < ApplicationController
    def index
        @employees = Employee.all
    end

    def new
        @employee = Employee.new
    end

    def create
        @employee = Employee.new(employee_params)
        @employee.save
        redirect_to employee_path(@employee)
    end

    def show
        @employee = Employee.find_by(id: params[:id])
    end

    def edit
        @employee = Employee.find_by(id: params[:id])
    end

    def update
        @employee = Employee.find_by(id: params[:id])
        @employee.update(employee_params)
        redirect_to employee_path(@employee)
    end

    private

    def employee_params
        params.require(:employee).permit(:first_name, :last_name, :alias, :title, :office, :dog_id)
    end
end
