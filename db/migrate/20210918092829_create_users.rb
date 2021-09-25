class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|

      t.text :introduction
      t.integer :profile_image_id

      t.timestamps
    end
  end
end
