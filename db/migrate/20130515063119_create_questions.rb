class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.text           :content
      t.references     :survey
      t.timestamps
    end
  end
end
