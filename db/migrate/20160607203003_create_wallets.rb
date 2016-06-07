class CreateWallets < ActiveRecord::Migration
  def change
    create_table :wallets do |t|
      t.references :user, index: true, foreign_key: true
      t.binary :private_key

      t.timestamps null: false
    end
  end
end
