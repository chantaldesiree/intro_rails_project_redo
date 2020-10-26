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

ActiveRecord::Schema.define(version: 2020_10_25_000900) do

  create_table "pokemons", force: :cascade do |t|
    t.string "name"
    t.string "pokemon_type"
    t.integer "region_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "pokemon_front"
    t.string "pokemon_back"
    t.string "description"
  end

  create_table "regions", force: :cascade do |t|
    t.integer "trainer_id", null: false
    t.integer "pokemon_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name"
    t.index ["pokemon_id"], name: "index_regions_on_pokemon_id"
    t.index ["trainer_id"], name: "index_regions_on_trainer_id"
  end

  create_table "trainer_pokemons", force: :cascade do |t|
    t.integer "trainer_id", null: false
    t.integer "pokemon_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["pokemon_id"], name: "index_trainer_pokemons_on_pokemon_id"
    t.index ["trainer_id"], name: "index_trainer_pokemons_on_trainer_id"
  end

  create_table "trainers", force: :cascade do |t|
    t.string "name"
    t.integer "region_id"
    t.string "trainer_pokemon"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "age"
    t.string "gender"
  end

  add_foreign_key "regions", "pokemons"
  add_foreign_key "regions", "trainers"
  add_foreign_key "trainer_pokemons", "pokemons"
  add_foreign_key "trainer_pokemons", "trainers"
end
