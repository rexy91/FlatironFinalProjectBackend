# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_02_29_030121) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "checkings", force: :cascade do |t|
    t.bigint "user_id"
    t.integer "acc_num"
    t.float "balance", default: 0.0
    t.boolean "status", default: true
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_checkings_on_user_id"
  end

  create_table "savings", force: :cascade do |t|
    t.bigint "user_id"
    t.float "balance", default: 0.0
    t.integer "acc_num"
    t.boolean "status", default: true
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_savings_on_user_id"
  end

  create_table "transactions", force: :cascade do |t|
    t.string "trans_type"
    t.float "amount"
    t.string "description"
    t.string "accountable_type"
    t.bigint "accountable_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "date"
    t.index ["accountable_type", "accountable_id"], name: "index_transactions_on_accountable_type_and_accountable_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "first_name"
    t.string "last_name"
    t.string "password_digest"
    t.string "email"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "checkings", "users"
  add_foreign_key "savings", "users"
end
