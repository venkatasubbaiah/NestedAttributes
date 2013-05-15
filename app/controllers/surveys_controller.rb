class SurveysController < ApplicationController
  def new
    @survey = Survey.new
    3.times do
      question = @survey.questions.build
      4.times { question.answers.build }
   end

  end

  def create
    @survey = Survey.new(params[:survey])
    if @survey.save
      flash[:notice] = 'Survey successfully saved'
      redirect_to  survey_path(@survey)
    else
      flash[:error] = 'not saved'
      render :new
    end
  end

  def show
    @survey = Survey.find(params[:id])
  end

  def index
      @surveys = Survey.all
  end

  def edit
    @survey = Survey.find(params[:id])
  end

  def update
    @survey = Survey.find(params[:id])
    if @survey.update_attributes(params[:survey])
      flash[:notice] = 'survey successfully update'
      redirect_to survey_path(@survey)
    else
      flash[:error] = 'not edited'
      render :edit
    end

  end
  def destroy
    @survey = Survey.find(params[:id])
    @survey.destroy
    redirect_to surveys_path

  end
end
