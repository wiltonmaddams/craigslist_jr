

get '/' do
  # Look in app/views/index.erb
  erb :index
end

get '/categories' do

  erb :categories
end

get '/new_post' do

  erb :new_post
end

get '/base_edit' do

  erb :secret_key_prompt
end

post '/add_post_to_db' do
  @title = params[:post][:title]
  @description = params[:post][:description]
  @category_name = params[:post][:select]
  @price = params[:post][:price]
  @email = params[:post][:email]
  @edit_key = (0...8).map { (65 + rand(26)).chr }.join

  Post.create(title: @title, description: @description, price: @price, email: @email, category_name: @category_name, edit_key: "#{@edit_key}")

  erb :post_completed
end

get '/posts/home' do
  @posts = Post.where(category_name: 'Home')

  erb :posts
end

get '/posts/garden' do
  @posts = Post.where(category_name: 'Garden')

  erb :posts
end

get '/posts/car' do
  @posts = Post.where(category_name: 'Car')

  erb :posts
end

get '/posts/body' do
  @posts = Post.where(category_name: 'Body')

  erb :posts
end

get "/edit_my_record" do
  @edit_key = params[:post][:secret_key]

  @record = Post.where(edit_key: @edit_key)

  erb :edit_my_post
end

post "/update_post_to_db" do

  @title = params[:post][:title]
  @description = params[:post][:description]
  @category_name = params[:post][:select]
  @price = params[:post][:price]
  @email = params[:post][:email]
  @edit_key = params[:post][:secret_key]

  edited_post = Post.where('edit_key = ?', @edit_key).first
  edited_post.update_attributes(title: @title, description: @description, category_name: @category_name, price: @price, email: @email)

  erb :post_completed
end

