DROP DATABASE IF EXISTS topster;

CREATE DATABASE topster;

create table tb_album
(
    id           bigint auto_increment
        primary key,
    artist       varchar(255) null,
    image        varchar(255) null,
    release_date varchar(255) null,
    title        varchar(255) null
);

create table tb_song
(
    id       bigint auto_increment
        primary key,
    songname varchar(255) null,
    album_id bigint       null,
    constraint FK6k9il66m0xkg4x316so0rlqqv
        foreign key (album_id) references tb_album (id)
);

create table users
(
    id          bigint auto_increment
        primary key,
    created_at  datetime(6)            null,
    modified_at datetime(6)            null,
    email       varchar(255)           not null,
    intro       varchar(255)           null,
    kakao_id    bigint                 null,
    nickname    varchar(255)           not null,
    password    varchar(255)           not null,
    role        enum ('USER', 'ADMIN') not null,
    username    varchar(255)           not null
);

create table tb_topster
(
    id          bigint auto_increment
        primary key,
    created_at  datetime(6)  null,
    modified_at datetime(6)  null,
    content     varchar(255) null,
    like_count  bigint       null,
    title       varchar(255) null,
    user_id     bigint       null,
    constraint FKge9ykabmelnaqn2hug88198a9
        foreign key (user_id) references users (id)
);

create table tb_post
(
    id          bigint auto_increment
        primary key,
    created_at  datetime(6)  null,
    modified_at datetime(6)  null,
    content     varchar(255) null,
    title       varchar(255) null,
    topster_id  bigint       null,
    user_id     bigint       null,
    constraint FKcxpanrt30kj3vujrfpvnjhj1h
        foreign key (user_id) references users (id),
    constraint FKda35kamxkqm2hhb2te4k5fk6b
        foreign key (topster_id) references tb_topster (id)
);

create table tb_comment
(
    id          bigint auto_increment
        primary key,
    created_at  datetime(6)  null,
    modified_at datetime(6)  null,
    content     varchar(255) null,
    post_id     bigint       null,
    user_id     bigint       null,
    constraint FKaafvuqn8jlqvh5bqct48pdtga
        foreign key (user_id) references users (id),
    constraint FKebak8c8m45519djplq0wanuj3
        foreign key (post_id) references tb_post (id)
);

create table tb_topster_album
(
    id          bigint auto_increment
        primary key,
    created_at  datetime(6) null,
    modified_at datetime(6) null,
    album_id    bigint      null,
    topster_id  bigint      null,
    constraint FK8lqcoyyiakak08t5h2ofta8cj
        foreign key (topster_id) references tb_topster (id),
    constraint FKmwgpxi4aw4fjhrf1ockmbnkgi
        foreign key (album_id) references tb_album (id)
);

create table tb_topster_like
(
    id          bigint auto_increment
        primary key,
    created_at  datetime(6) null,
    modified_at datetime(6) null,
    topster_id  bigint      null,
    user_id     bigint      null,
    constraint FK34iahupku6qapwgn8kn21agss
        foreign key (topster_id) references tb_topster (id),
    constraint FKlsobr4m5kefddqh41sru1magc
        foreign key (user_id) references users (id)
);