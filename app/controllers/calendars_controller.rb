class CalendarsController < ApplicationController
  def index
    @calendars = Calendar.all
    @calendar = Calendar.new
  end
  
  def new
    @calendar = Calendar.new
  end

  def show
    puts params[:id]
    @calendar = Calendar.find(params[:id])
  end

  def create
    #Calendar.create(calendar_parameter)
    #redirect_to calendars_path
    @calendar = Calendar.new(calendar_parameter) # ここを追加

    if @calendar.save
      redirect_to calendars_path, notice: 'カレンダーを登録しました！'
    else
      redirect_to calendars_path, notice: '登録できませんでした。タイトルと内容を確認してください。'
    end
  end

  def destroy
    @calendar = Calendar.find(params[:id])
    @calendar.destroy!
    redirect_to calendars_path, notice: 'カレンダーを削除しました。'
  end

  def edit
    @calendar = Calendar.find(params[:id])
  end

  def update
    @calendar = Calendar.find(params[:id])
    if @calendar.update(calendar_parameter)
      redirect_to calendars_path, notice: "編集しました"
    else
      render 'edit'
    end
  end

  private

  def calendar_parameter
    params.require(:calendar).permit(:title, :content, :start_time)
  end
end
