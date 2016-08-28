class AddListNameAndDueDateToTodoList < ActiveRecord::Migration
  def change
    add_column :todo_lists, :list_name, :string
    add_column :todo_lists, :list_due_date, :date    
  end
end
