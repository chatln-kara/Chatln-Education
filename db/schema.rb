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

ActiveRecord::Schema.define(version: 2020_08_06_150815) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.string "username", null: false
    t.string "contact", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "comments", force: :cascade do |t|
    t.text "content"
    t.bigint "user_id"
    t.bigint "course_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "courses", force: :cascade do |t|
    t.string "title"
    t.text "content"
    t.string "slug"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "matiere_id"
    t.bigint "level_id"
    t.index ["level_id"], name: "index_courses_on_level_id"
    t.index ["matiere_id"], name: "index_courses_on_matiere_id"
    t.index ["user_id"], name: "index_courses_on_user_id"
  end

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string "slug", null: false
    t.integer "sluggable_id", null: false
    t.string "sluggable_type", limit: 50
    t.string "scope"
    t.datetime "created_at"
    t.index ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true
    t.index ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type"
    t.index ["sluggable_type", "sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_type_and_sluggable_id"
  end

  create_table "job_posts", force: :cascade do |t|
    t.string "nom_complet"
    t.string "city"
    t.string "matiere"
    t.string "promotion"
    t.string "experience"
    t.string "nb_classe"
    t.string "contact_first"
    t.string "contact_sec"
    t.string "Know_IT"
    t.string "school"
    t.string "gender"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "levels", force: :cascade do |t|
    t.string "title"
    t.string "slug"
    t.bigint "user_id"
    t.bigint "course_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["course_id"], name: "index_levels_on_course_id"
    t.index ["title"], name: "index_levels_on_title", unique: true
    t.index ["user_id"], name: "index_levels_on_user_id"
  end

  create_table "matieres", force: :cascade do |t|
    t.string "title"
    t.string "slug"
    t.bigint "user_id"
    t.bigint "course_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["course_id"], name: "index_matieres_on_course_id"
    t.index ["user_id"], name: "index_matieres_on_user_id"
  end

  create_table "recrutements", force: :cascade do |t|
    t.string "title"
    t.text "content"
    t.string "city"
    t.string "role"
    t.string "status"
    t.string "count_job"
    t.string "slug"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "room_messages", force: :cascade do |t|
    t.bigint "room_id"
    t.bigint "user_id"
    t.text "message"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["room_id"], name: "index_room_messages_on_room_id"
    t.index ["user_id"], name: "index_room_messages_on_user_id"
  end

  create_table "rooms", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "slug"
    t.index ["name"], name: "index_rooms_on_name", unique: true
    t.index ["slug"], name: "index_rooms_on_slug", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.string "username", null: false
    t.string "contact", null: false
    t.string "city"
    t.string "school"
    t.string "level_id"
    t.string "classe"
    t.string "role"
    t.string "resume"
    t.string "gender"
    t.string "matricule"
    t.string "slug"
    t.string "avatar"
    t.boolean "terms"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["contact"], name: "index_users_on_contact", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["slug"], name: "index_users_on_slug", unique: true
  end

  add_foreign_key "comments", "users"
  add_foreign_key "courses", "levels"
  add_foreign_key "courses", "matieres"
  add_foreign_key "courses", "users"
  add_foreign_key "levels", "courses"
  add_foreign_key "levels", "users"
  add_foreign_key "matieres", "courses"
  add_foreign_key "matieres", "users"
  add_foreign_key "room_messages", "rooms"
  add_foreign_key "room_messages", "users"
end
