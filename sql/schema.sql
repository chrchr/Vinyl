begin;

create table if not exists artists (
    artist_id integer primary key,
    display_name text not null,
    sort_name text not null
);
create table if not exists albums (
    album_id integer primary key,
    display_name text not null,
    sort_name text not null,
    album_artist_id integer references artists (artist_id),
    sides_count integer,
    compilation_p integer not null default 0
);
create table if not exists album_sides (
    album_id integer not null references albums (album_id),
    side_number integer not null,
    tracks_count integer,
    primary key (album_id, side_number)
);
create table if not exists genres (
    genre_id integer primary key,
    name text not null
);
create table if not exists composers (
    composer_id integer primary key,
    display_name text not null,
    sort_name text not null
);
create table if not exists groupings (
    grouping_id integer primary key,
    name text not null
);
create table if not exists tracks (
    track_id integer primary key,
    filename text not null unique,
    display_name text not null,
    sort_name text not null,
    album_id integer references albums (album_id),
    track_artist_id integer references artist (artist_id),
    genre_id integer references genres (genre_id),
    composer_id integer references composers (composer_id),
    grouping_id integer references groupings (grouping_id),
    side_number integer,
    track_number integer,
    duration_time real not null,
    year text,
    comments text
);

create table if not exists playlist_folders (
    playlist_folder_id integer primary key,
    name text not null,
    position integer unique not null
);
create table if not exists playlists (
    playlist_id integer primary key,
    name text not null,
    playlist_folder_id integer references playlist_folders (playlist_folder_id),
    position integer not null,
    unique (playlist_folder_id, position)
);
create table if not exists playlist_tracks (
    playlist_id integer references playlists (playlist_id) not null,
    track_id integer references tracks (track_id) not null,
    position integer not null,
    primary key (playlist_id, track_id, position),
    unique (playlist_id, position)
);

create table if not exists album_options (
    album_id integer primary key references albums (album_id),
    rating integer
);
create table if not exists track_options (
    track_id integer primary key references tracks (track_id),
    enabled_p integer not null default 0,
    rating integer,
    start_time real,
    end_time real,
    play_count integer not null default 0,
    added_date integer,
    modified_date integer,
    played_date integer
);

commit;
