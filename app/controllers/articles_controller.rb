class ArticlesController < ApplicationController

  def new
  end

  def create

      @article = Article.new(article_params)

      @article.save
      redirect_to @article
  end
      
  private 

  #white lists controller parameters, and privetizes this function, so it can be manipulated
  #you would not be able to add/remove extra keys publicly outside of this instance method.
 
  def article_params
      params.require(:article).permit(:title, :text)  
  end                                              #

end
