class PostsController < ApplicationController

before_action :set_post, only: [:show, :edit, :update, :destroy]

  #indexアクションを定義--------------------
  def index
    @posts = Post.all #allはActive Recordが用意したCRUD一式に入ってるのでそのまま使える
  end

  #newアクションを定義--------------------
  def new
    @post = Post.new #インスタンスの作成
  end

  #showアクションを定義--------------------
  ##上のフックのところで@postに指定したidのpost内容入れてるからなんも書かなくていい
  def show
  end

  #editアクションを定義--------------------
  def edit
  end


  #createアクションを定義--------------------
  def create
    @post = Post.new(post_params) #インスタンスの作成

    # 保存に成功した場合はその旨をメッセージとして表示しつつ投稿の詳細画面にリダイレクトし、
    # 失敗した場合はやはりその旨を知らせつつ入力画面にバックする、という処理
   
      if @post.save #インスタンスに対するメソッド
        redirect_to @post, notice: '投稿が完了しました！' 
      else
        render :new
      end
   
  end


  #updateアクションを定義--------------------
  def update
    
      if @post.update(post_params)
        redirect_to post_url(@post), notice: '更新が完了しました！'
      else
        render :edit, status: :unprocessable_entity 
      end
    
  end


  #destroyアクションを定義--------------------
  def destroy
    @post.destroy 
       redirect_to posts_url, notice: '削除が完了しました！'
  end



  private
      def set_post
        @post = Post.find(params[:id])
      end
  
      # コンテンツしか受け入れないようにするストロングパラメータ {"content"=>"xxx"}みたいな戻り値
      def post_params
        params.require(:post).permit(:content)
      end



end
