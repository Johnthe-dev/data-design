drop table if exists articleHistory;
drop table if exists profile;
drop table if exists article;


create table profile(
	profileId binary(16) not null,
	profileActivationToken char(32),
	profileEmail varchar(128) not null,
	profileUsername varchar(50) not null,
	unique(profileUsername),
	index(profileEmail),
	primary key(profileId)
);

create table article(
	articleId binary(16) not null,
	articleInitialAuthor varchar(50),
	primary key(articleId)
);

create table articleHistory(
	articleHistoryId binary(16) not null,
	articleHistoryArticleId binary(16) not null,
	articleHistoryProfileId binary(16) not null,
	articleHistoryContent blob not null,
	articleHistoryDate datetime(6) not null,
	foreign key(articleHistoryArticleId) references article(articleId),
	foreign key(articleHistoryProfileId) references profile(profileId),
	primary key(articleHistoryId)
);
