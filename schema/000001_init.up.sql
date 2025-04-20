CREATE TABLE users (
    id serial PRIMARY KEY,
    name varchar(255) not null,
    username varchar(255) not null unique,
    password_hash varchar(255) not null
);

CREATE TABLE todo_lists (
    id serial PRIMARY KEY,
    title varchar(255) not null,
    description varchar(255)
);

CREATE TABLE user_lists (
    id serial PRIMARY KEY,
    user_id int REFERENCES users(id) ON DELETE CASCADE not null,
    list_id int REFERENCES todo_lists(id) ON DELETE CASCADE not null,
    UNIQUE(user_id, list_id)
);

CREATE TABLE todo_items (
    id serial PRIMARY KEY,
    title varchar(255) not null,
    description varchar(255),
    done boolean not null default false
);

CREATE TABLE lists_items (
    id serial PRIMARY KEY,
    item_id int REFERENCES todo_items(id) ON DELETE CASCADE not null,
    list_id int REFERENCES todo_lists(id) ON DELETE CASCADE not null,
    UNIQUE(item_id, list_id)
);