class StudentsController < ApplicationController
    def index
        if params[:name]
            students =
                Student.where("UPPER(first_name)=UPPER(?)", params[:name]).or(
                    Student.where("UPPER(last_name)=UPPER(?)", params[:name]),
                )
            render json: students
        else
            students = Student.all
            render json: students
        end
    end

    def show
        student = Student.find(params[:id])
        render json: student
    end
end
