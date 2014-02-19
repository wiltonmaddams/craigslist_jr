class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.string :price
      t.string :description
      t.string :email
      t.string :category_name
      t.string :edit_key

      t.timestamps
    end
  end
end
