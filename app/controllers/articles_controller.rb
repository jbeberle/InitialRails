class ArticlesController < ApplicationController
  before_action :set_article, only: [ :show, :edit, :update, :destroy ]

  # GET /articles or /articles.json
  def index
    @articles = Article.all
  end

  # GET /articles/1 or /articles/1.json
  def show
  end

  # # GET /articles/new
  def new
    @article = Article.new
  end

  # POST /articles or /articles.json
  def create
    @article = Article.new(article_params)
    if @article.save
      flash[:notice] = "Article was succesfully created"
      redirect_to @article
    else
      render 'new'
    end
  end

  #
  # # GET /articles/1/edit
  def edit
  end
  #
  #
  # # PATCH/PUT /articles/1 or /articles/1.json
  def update
    if @article.update(article_params)
      flash[:notice] = "Article was updated"
      redirect_to @article
    else
      render = 'edit'
    end
  end

  #
  # # DELETE /articles/1 or /articles/1.json
  def destroy
    if @article.destroy
      flash[:notice] = "Article was deleted"
      redirect_to articles_path
    else
      render = 'edit'
    end
  #
  #   respond_to do |format|
  #     format.html { redirect_to articles_url, notice: "Article was successfully destroyed." }
  #     format.json { head :no_content }
  #   end
  end
  #
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = Article.find(params[:id])
    end

  #
    # Only allow a list of trusted parameters through.
    def article_params
      params.require(:article).permit(:title, :description)
    end

end
