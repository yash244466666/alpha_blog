class ArticlesController < ApplicationController
    before_action :set_article, only: [:show, :edit, :update, :destroy]

    def show
        # @article = Article.find(params[:id])
    end

    def index
        @articles = Article.all
    end

    def new
        @article = Article.new

    end

    def edit
        # @article = Article.find(params[:id])
    end

    def create
        @article = Article.new(article_params)
        @article.user = User.first
        respond_to do |format|
            if @article.save
              format.html { redirect_to article_url(@article), notice: "Article was successfully created." }
            else
              format.html { render :new, status: :unprocessable_entity }
            end
          end
    end

    def update
        # @article = Article.find(params[:id])
        respond_to do |format|
            if @article.update(article_params)
                format.html { redirect_to article_url(@article), notice: "Article was successfully updated ." }
            else
                format.html { render :edit, status: :unprocessable_entity }
            end
        end
    end

    def destroy
        # @article = Article.find(params[:id])
        @article.destroy
        respond_to do |format|
            format.html { redirect_to articles_url(@article), notice: "Article was successfully destroyed." }
        end
    end

    private

    def set_article
        @article = Article.find(params[:id])
    end

    def article_params
        params.require(:article).permit(:title, :description)
    end
end