class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_comment, only: [:show, :edit, :update, :destroy]
  before_action :set_course

  # GET /comments
  # GET /comments.json
  def index
    @comments = Comment.all
  end


  # GET /comments/1
  # GET /comments/1.json
  def show
    @comments= Comment.all
  end

  # GET /comments/new

  def new
    @comment = Comment.new
  end

  # GET /comments/1/edit
  def edit
  end

  # POST /comments
  # POST /comments.json
  def create
    #@course = Course.friendly.find(params[:course_id])
    @comment = @course.comments.build(comment_params)
    @comment.user_id = current_user.id

    respond_to do |format|
      if @comment.save
        format.html { redirect_to @course }
        format.js {} # renders create.js.erb
      else
        format.html { render :new }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /comments/1
  # PATCH/PUT /comments/1.json
  def update
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to @course, notice: 'Modification enregistrée.' }
        format.js
      else
        format.html { render :edit }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to courses_url, notice: 'Message supprimé.' }
      format.js
    end
  end

  private

    # => find course_id reference
    def set_course
      @course = Course.friendly.find(params[:course_id])
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:content, :course_id, :user_id)
    end

end
