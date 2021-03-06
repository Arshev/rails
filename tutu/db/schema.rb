# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20161113184116) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "carriages", force: :cascade do |t|
    t.integer  "number"
    t.integer  "top_seats"
    t.integer  "bottom_seats"
    t.integer  "side_top_seats"
    t.integer  "side_bottom_seats"
    t.integer  "seating_seats"
    t.integer  "train_id"
    t.string   "type"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.index ["train_id"], name: "index_carriages_on_train_id", using: :btree
  end

  create_table "railway_stations", force: :cascade do |t|
    t.string   "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "railway_stations_routes", force: :cascade do |t|
    t.integer "railway_station_id"
    t.integer "route_id"
    t.integer "number_station"
    t.integer "position"
    t.text    "arrival"
    t.text    "departure"
  end

  create_table "routes", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tickets", force: :cascade do |t|
    t.string   "serial_number"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.integer  "departure_station_id"
    t.integer  "arrival_station_id"
    t.integer  "user_id"
    t.integer  "train_id"
    t.text     "passport"
    t.text     "user_name"
    t.integer  "start_station_id"
    t.integer  "end_station_id"
    t.index ["end_station_id"], name: "index_tickets_on_end_station_id", using: :btree
    t.index ["start_station_id"], name: "index_tickets_on_start_station_id", using: :btree
  end

  create_table "trains", force: :cascade do |t|
    t.string   "number_train"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.integer  "current_station_id"
    t.integer  "route_id"
    t.boolean  "sort_wagons"
    t.index ["current_station_id"], name: "index_trains_on_current_station_id", using: :btree
    t.index ["route_id"], name: "index_trains_on_route_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.integer  "{:index=>true}_id"
    t.boolean  "admin",                  default: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
    t.index ["{:index=>true}_id"], name: "index_users_on_{:index=>true}_id", using: :btree
  end

  create_table "wagons", force: :cascade do |t|
    t.integer  "quantity_top_place"
    t.integer  "quantity_down_place"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.integer  "train_id"
    t.integer  "number_wagon"
    t.integer  "top_seats"
    t.integer  "bottom_seats"
    t.integer  "side_top_seats"
    t.integer  "side_bottom_seats"
    t.integer  "seating_seats"
    t.string   "type"
    t.index ["id", "type"], name: "index_wagons_on_id_and_type", using: :btree
    t.index ["train_id"], name: "index_wagons_on_train_id", using: :btree
  end

end
