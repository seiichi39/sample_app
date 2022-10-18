class ArticlesController < ApplicationController
  before_action :set_article, only: [:edit, :update, :show, :destroy]
  before_action :correct_user, only: [:index, :show, :new, :create, :edit, :update, :destroy]

  def index
    @articles = Article.all
  end

  def show
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      flash[:success] = '新規作成に成功しました'
      redirect_to articles_url
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @article.update(article_params)
      flash[:success] = "更新しました。"
      redirect_to articles_url
    else
      render :edit
    end
  end

  def destroy
    @article.destroy
    flash[:success] = "#{@article.title}のデータを削除しました。"
    redirect_to articles_url
  end

  private

    def article_params
      params.require(:article).permit(:title, :content, :image, :remove_image)
    end

    def set_article
      @article = Article.find(params[:id])
    end

end
