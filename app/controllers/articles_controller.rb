class ArticlesController < ApplicationController

  http_basic_authenticate_with name: "dhh", password: "secret", except: [:index, :show]

  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

# The reason why we added @article = Article.new in the ArticlesController 
# is that otherwise @article would be nil in our view, and calling 
# @article.errors.any? would throw an error.
  
  def new
  @article = Article.new #creating a new instance varible called article
  end

  def edit
    @article = Article.find(params[:id])
  end

  def create

      @article = Article.new(article_params)

     if @article.save
      redirect_to @article
     else
      render 'new' #calls the new view... which initiates the new method above
     end

  end

  def update
    @article = Article.find(params[:id])
   
    if @article.update(article_params)
      redirect_to @article
    else
      render 'edit'
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
   
    redirect_to articles_path
  end

  private 

  #white lists controller parameters, and privetizes this function, so it can be manipulated
  #you would not be able to add/remove extra keys publicly outside of this instance method.
 
  def article_params
      params.require(:article).permit(:title, :text)  
  end                                              

end

