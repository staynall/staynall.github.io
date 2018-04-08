-- phpMyAdmin SQL Dump
-- version 3.5.1
-- http://www.phpmyadmin.net
--
-- Хост: 127.0.0.1
-- Время создания: Дек 17 2013 г., 22:28
-- Версия сервера: 5.5.25
-- Версия PHP: 5.3.13

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- База данных: `ahiska`
--

-- --------------------------------------------------------

--
-- Структура таблицы `ahiska_albums`
--

CREATE TABLE IF NOT EXISTS `ahiska_albums` (
  `aid` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `descr` varchar(255) NOT NULL,
  `photo_num` smallint(6) NOT NULL,
  `comm_num` mediumint(8) NOT NULL,
  `ahash` varchar(32) NOT NULL,
  `adate` datetime NOT NULL,
  `cover` varchar(25) NOT NULL,
  `position` smallint(6) NOT NULL,
  `privacy` varchar(3) NOT NULL,
  PRIMARY KEY (`aid`),
  KEY `user_id` (`user_id`),
  KEY `photo_num` (`photo_num`),
  KEY `position` (`position`),
  KEY `privacy` (`privacy`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `ahiska_antispam`
--

CREATE TABLE IF NOT EXISTS `ahiska_antispam` (
  `act` tinyint(3) NOT NULL,
  `user_id` int(11) NOT NULL,
  `date` int(11) NOT NULL,
  `txt` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `ahiska_attach`
--

CREATE TABLE IF NOT EXISTS `ahiska_attach` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `photo` varchar(255) NOT NULL,
  `ouser_id` int(11) NOT NULL,
  `acomm_num` mediumint(8) NOT NULL,
  `public_id` int(11) NOT NULL,
  `add_date` varchar(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `photo` (`photo`),
  KEY `public_id` (`public_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `ahiska_attach_comm`
--

CREATE TABLE IF NOT EXISTS `ahiska_attach_comm` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `forphoto` varchar(30) NOT NULL,
  `auser_id` int(11) NOT NULL,
  `text` text NOT NULL,
  `adate` varchar(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `forphoto` (`forphoto`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `ahiska_audio`
--

CREATE TABLE IF NOT EXISTS `ahiska_audio` (
  `aid` int(11) NOT NULL AUTO_INCREMENT,
  `auser_id` int(11) NOT NULL,
  `url` text NOT NULL,
  `artist` varchar(50) NOT NULL,
  `name` varchar(50) NOT NULL,
  `adate` varchar(10) NOT NULL,
  PRIMARY KEY (`aid`),
  KEY `auser_id` (`auser_id`),
  FULLTEXT KEY `artist` (`artist`,`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `ahiska_banned`
--

CREATE TABLE IF NOT EXISTS `ahiska_banned` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descr` text NOT NULL,
  `date` varchar(15) NOT NULL,
  `always` smallint(4) NOT NULL,
  `ip` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `ahiska_blog`
--

CREATE TABLE IF NOT EXISTS `ahiska_blog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(65) NOT NULL,
  `story` text NOT NULL,
  `date` varchar(15) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `ahiska_city`
--

CREATE TABLE IF NOT EXISTS `ahiska_city` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_country` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_country` (`id_country`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `ahiska_communities`
--

CREATE TABLE IF NOT EXISTS `ahiska_communities` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `admin` text NOT NULL,
  `title` varchar(60) NOT NULL,
  `descr` text NOT NULL,
  `cat` smallint(6) NOT NULL,
  `type` tinyint(3) NOT NULL,
  `traf` int(11) NOT NULL,
  `ulist` text NOT NULL,
  `date` datetime NOT NULL,
  `photo` varchar(25) NOT NULL,
  `feedback` smallint(6) NOT NULL,
  `comments` tinyint(1) NOT NULL,
  `real_admin` int(11) NOT NULL,
  `rec_num` int(11) NOT NULL,
  `photos_num` int(11) NOT NULL,
  `del` tinyint(2) NOT NULL,
  `ban` tinyint(2) NOT NULL,
  `adres` varchar(40) NOT NULL,
  `audio_num` mediumint(8) NOT NULL,
  `forum_num` mediumint(8) NOT NULL,
  `discussion` tinyint(1) NOT NULL,
  `status_text` varchar(255) NOT NULL,
  `web` varchar(255) NOT NULL,
  `videos_num` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  FULLTEXT KEY `title` (`title`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `ahiska_communities_audio`
--

CREATE TABLE IF NOT EXISTS `ahiska_communities_audio` (
  `aid` int(11) NOT NULL AUTO_INCREMENT,
  `public_id` int(11) NOT NULL,
  `url` text NOT NULL,
  `artist` varchar(50) NOT NULL,
  `name` varchar(50) NOT NULL,
  `adate` varchar(10) NOT NULL,
  PRIMARY KEY (`aid`),
  KEY `auser_id` (`public_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `ahiska_communities_feedback`
--

CREATE TABLE IF NOT EXISTS `ahiska_communities_feedback` (
  `cid` int(11) NOT NULL,
  `fuser_id` int(11) NOT NULL,
  `office` varchar(30) NOT NULL,
  `fphone` varchar(15) NOT NULL,
  `femail` varchar(40) NOT NULL,
  `fdate` varchar(10) NOT NULL,
  KEY `cid` (`cid`),
  KEY `fuser_id` (`fuser_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `ahiska_communities_forum`
--

CREATE TABLE IF NOT EXISTS `ahiska_communities_forum` (
  `fid` int(11) NOT NULL AUTO_INCREMENT,
  `public_id` int(11) NOT NULL,
  `fuser_id` int(11) NOT NULL,
  `title` varchar(65) NOT NULL,
  `text` text NOT NULL,
  `attach` text NOT NULL,
  `fdate` varchar(10) NOT NULL,
  `msg_num` mediumint(8) NOT NULL,
  `lastdate` varchar(10) NOT NULL,
  `lastuser_id` int(11) NOT NULL,
  `fixed` tinyint(2) NOT NULL,
  `status` tinyint(2) NOT NULL,
  `vote` mediumint(8) NOT NULL,
  PRIMARY KEY (`fid`),
  KEY `public_id` (`public_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `ahiska_communities_forum_msg`
--

CREATE TABLE IF NOT EXISTS `ahiska_communities_forum_msg` (
  `mid` int(11) NOT NULL AUTO_INCREMENT,
  `fid` int(11) NOT NULL,
  `muser_id` int(11) NOT NULL,
  `msg` text NOT NULL,
  `attach` text NOT NULL,
  `mdate` varchar(10) NOT NULL,
  PRIMARY KEY (`mid`),
  KEY `fid` (`fid`),
  KEY `muser_id` (`muser_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `ahiska_communities_wall`
--

CREATE TABLE IF NOT EXISTS `ahiska_communities_wall` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `public_id` int(11) NOT NULL,
  `text` text NOT NULL,
  `add_date` varchar(15) NOT NULL,
  `fast_comm_id` int(11) NOT NULL,
  `fasts_num` mediumint(8) NOT NULL,
  `likes_num` mediumint(8) NOT NULL,
  `likes_users` text NOT NULL,
  `attach` text NOT NULL,
  `tell_uid` int(11) NOT NULL,
  `tell_date` varchar(10) NOT NULL,
  `public` tinyint(1) NOT NULL,
  `tell_comm` text NOT NULL,
  `fixed` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fast_comm_id` (`fast_comm_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `ahiska_communities_wall_like`
--

CREATE TABLE IF NOT EXISTS `ahiska_communities_wall_like` (
  `rec_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `date` varchar(10) NOT NULL,
  KEY `rec_id` (`rec_id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `ahiska_country`
--

CREATE TABLE IF NOT EXISTS `ahiska_country` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `ahiska_doc`
--

CREATE TABLE IF NOT EXISTS `ahiska_doc` (
  `did` int(11) NOT NULL AUTO_INCREMENT,
  `duser_id` int(11) NOT NULL,
  `dname` varchar(255) NOT NULL,
  `dsize` varchar(10) NOT NULL,
  `ddate` varchar(10) NOT NULL,
  `ddownload_name` varchar(30) NOT NULL,
  PRIMARY KEY (`did`),
  KEY `duser_id` (`duser_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `ahiska_fave`
--

CREATE TABLE IF NOT EXISTS `ahiska_fave` (
  `user_id` int(11) NOT NULL,
  `fave_id` int(11) NOT NULL,
  `date` datetime NOT NULL,
  KEY `for_fast_select1` (`user_id`,`fave_id`,`date`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `ahiska_friends`
--

CREATE TABLE IF NOT EXISTS `ahiska_friends` (
  `user_id` int(11) NOT NULL,
  `friend_id` int(11) NOT NULL,
  `friends_date` datetime NOT NULL,
  `subscriptions` tinyint(3) NOT NULL,
  `views` mediumint(8) NOT NULL,
  KEY `for_fast_select1` (`user_id`,`friend_id`,`friends_date`),
  KEY `subscriptions` (`subscriptions`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `ahiska_friends_demands`
--

CREATE TABLE IF NOT EXISTS `ahiska_friends_demands` (
  `for_user_id` int(11) NOT NULL,
  `from_user_id` int(11) NOT NULL,
  `demand_date` datetime NOT NULL,
  KEY `for_fast_select1` (`for_user_id`,`from_user_id`,`demand_date`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `ahiska_games`
--

CREATE TABLE IF NOT EXISTS `ahiska_games` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `poster` varchar(25) NOT NULL,
  `title` varchar(200) NOT NULL,
  `descr` text NOT NULL,
  `flash` varchar(255) NOT NULL,
  `traf` int(11) NOT NULL,
  `date` varchar(10) NOT NULL,
  `width` smallint(6) NOT NULL,
  `height` smallint(6) NOT NULL,
  PRIMARY KEY (`id`),
  FULLTEXT KEY `title` (`title`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `ahiska_games_activity`
--

CREATE TABLE IF NOT EXISTS `ahiska_games_activity` (
  `user_id` int(11) NOT NULL,
  `action` tinyint(2) NOT NULL,
  `date` varchar(10) NOT NULL,
  `game_id` int(11) NOT NULL,
  KEY `for_select` (`user_id`,`game_id`),
  KEY `game_id` (`game_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `ahiska_games_files`
--

CREATE TABLE IF NOT EXISTS `ahiska_games_files` (
  `game_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `file` varchar(25) NOT NULL,
  `hash` varchar(32) NOT NULL,
  `type` varchar(20) NOT NULL,
  KEY `hash` (`hash`,`type`),
  KEY `for_select_3` (`hash`,`user_id`),
  KEY `game_id` (`game_id`),
  KEY `for_select_4` (`game_id`,`type`),
  KEY `user_id` (`user_id`,`type`,`game_id`),
  KEY `for_select` (`hash`,`user_id`,`type`,`game_id`),
  KEY `file` (`file`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `ahiska_games_users`
--

CREATE TABLE IF NOT EXISTS `ahiska_games_users` (
  `user_id` int(11) NOT NULL,
  `game_id` int(11) NOT NULL,
  `setdate` varchar(10) NOT NULL,
  `lastdate` varchar(10) NOT NULL,
  KEY `for_select` (`user_id`,`game_id`),
  KEY `game_id` (`game_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `ahiska_gifts`
--

CREATE TABLE IF NOT EXISTS `ahiska_gifts` (
  `gid` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `from_uid` int(11) NOT NULL,
  `gift` smallint(6) NOT NULL,
  `msg` varchar(200) NOT NULL,
  `privacy` tinyint(3) NOT NULL,
  `gdate` varchar(10) NOT NULL,
  `status` tinyint(3) NOT NULL,
  PRIMARY KEY (`gid`),
  KEY `uid` (`uid`),
  KEY `from_uid` (`from_uid`),
  KEY `status` (`status`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `ahiska_gifts_category`
--

CREATE TABLE IF NOT EXISTS `ahiska_gifts_category` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `ahiska_gifts_list`
--

CREATE TABLE IF NOT EXISTS `ahiska_gifts_list` (
  `gid` int(11) NOT NULL AUTO_INCREMENT,
  `img` varchar(50) NOT NULL,
  `price` mediumint(8) NOT NULL,
  `category` int(11) NOT NULL,
  PRIMARY KEY (`gid`),
  KEY `img` (`img`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `ahiska_history`
--

CREATE TABLE IF NOT EXISTS `ahiska_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `text` text NOT NULL,
  `aid` int(11) NOT NULL,
  `data` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `ahiska_im`
--

CREATE TABLE IF NOT EXISTS `ahiska_im` (
  `iuser_id` int(11) NOT NULL,
  `im_user_id` int(11) NOT NULL,
  `idate` varchar(10) NOT NULL,
  `msg_num` mediumint(8) NOT NULL,
  `all_msg_num` int(11) NOT NULL,
  KEY `iuser_id` (`iuser_id`),
  KEY `im_user_id` (`im_user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `ahiska_invites`
--

CREATE TABLE IF NOT EXISTS `ahiska_invites` (
  `uid` int(11) NOT NULL,
  `ruid` int(11) NOT NULL,
  KEY `uid` (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `ahiska_log`
--

CREATE TABLE IF NOT EXISTS `ahiska_log` (
  `uid` int(11) NOT NULL,
  `browser` text NOT NULL,
  `ip` varchar(15) NOT NULL,
  KEY `uid` (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `ahiska_mail_tpl`
--

CREATE TABLE IF NOT EXISTS `ahiska_mail_tpl` (
  `id` mediumint(8) NOT NULL AUTO_INCREMENT,
  `text` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `ahiska_messages`
--

CREATE TABLE IF NOT EXISTS `ahiska_messages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `theme` varchar(255) NOT NULL,
  `text` text NOT NULL,
  `for_user_id` int(11) NOT NULL,
  `from_user_id` int(11) NOT NULL,
  `history_user_id` int(11) NOT NULL,
  `date` varchar(15) NOT NULL,
  `pm_read` char(3) NOT NULL,
  `folder` varchar(10) NOT NULL,
  `attach` text NOT NULL,
  `tell_uid` int(11) NOT NULL,
  `tell_date` varchar(10) NOT NULL,
  `public` tinyint(2) NOT NULL,
  `tell_comm` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `for_fast_select1` (`for_user_id`,`from_user_id`,`folder`,`history_user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `ahiska_miss`
--

CREATE TABLE IF NOT EXISTS `ahiska_miss` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `rate` int(11) NOT NULL,
  `list` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `ahiska_news`
--

CREATE TABLE IF NOT EXISTS `ahiska_news` (
  `ac_id` int(11) NOT NULL AUTO_INCREMENT,
  `ac_user_id` int(11) NOT NULL,
  `action_type` tinyint(4) NOT NULL,
  `action_text` text NOT NULL,
  `obj_id` int(11) NOT NULL,
  `action_time` int(11) NOT NULL,
  `for_user_id` int(11) NOT NULL,
  `answer_text` text NOT NULL,
  `link` varchar(200) NOT NULL,
  PRIMARY KEY (`ac_id`),
  KEY `for_fast_select1` (`ac_user_id`,`action_time`),
  KEY `for_fast_select2` (`ac_user_id`,`action_type`,`action_time`),
  KEY `for_user_id` (`for_user_id`),
  KEY `obj_id` (`obj_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `ahiska_notes`
--

CREATE TABLE IF NOT EXISTS `ahiska_notes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `owner_user_id` int(11) NOT NULL,
  `title` varchar(65) NOT NULL,
  `full_text` text NOT NULL,
  `date` datetime NOT NULL,
  `comm_num` mediumint(8) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `owner_user_id` (`owner_user_id`),
  FULLTEXT KEY `title` (`title`,`full_text`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `ahiska_notes_comments`
--

CREATE TABLE IF NOT EXISTS `ahiska_notes_comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `note_id` int(11) NOT NULL,
  `from_user_id` int(11) NOT NULL,
  `text` text NOT NULL,
  `add_date` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `note_id` (`note_id`),
  KEY `from_user_id` (`from_user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `ahiska_photos`
--

CREATE TABLE IF NOT EXISTS `ahiska_photos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `album_id` int(11) NOT NULL,
  `photo_name` varchar(25) NOT NULL,
  `user_id` int(11) NOT NULL,
  `descr` text NOT NULL,
  `comm_num` mediumint(8) NOT NULL,
  `date` datetime NOT NULL,
  `position` int(11) NOT NULL,
  `likes_num` mediumint(8) NOT NULL,
  `likes_users` text NOT NULL,
  `rating_num` int(11) NOT NULL,
  `rating_all` int(11) NOT NULL,
  `rating_max` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `album_id` (`album_id`),
  KEY `user_id` (`user_id`),
  KEY `position` (`position`),
  KEY `date` (`date`),
  KEY `photo_name` (`photo_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `ahiska_photos_comments`
--

CREATE TABLE IF NOT EXISTS `ahiska_photos_comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `owner_id` int(11) NOT NULL,
  `album_id` int(11) NOT NULL,
  `pid` int(11) NOT NULL,
  `user_id` mediumint(8) NOT NULL,
  `text` text NOT NULL,
  `date` datetime NOT NULL,
  `hash` varchar(32) NOT NULL,
  `photo_name` varchar(25) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `owner_id` (`owner_id`),
  KEY `album_id` (`album_id`),
  KEY `user_id` (`user_id`),
  KEY `hash` (`hash`),
  KEY `photo_name` (`photo_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `ahiska_photos_like`
--

CREATE TABLE IF NOT EXISTS `ahiska_photos_like` (
  `pid` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  `date` varchar(10) NOT NULL,
  KEY `pid` (`pid`,`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

-- --------------------------------------------------------

--
-- Структура таблицы `ahiska_photos_mark`
--

CREATE TABLE IF NOT EXISTS `ahiska_photos_mark` (
  `muser_id` int(11) NOT NULL,
  `mphoto_id` int(11) NOT NULL,
  `mphoto_name` varchar(50) NOT NULL,
  `mdate` varchar(15) NOT NULL,
  `msettings_pos` varchar(90) NOT NULL,
  `mmark_user_id` int(11) NOT NULL,
  `mapprove` tinyint(1) NOT NULL,
  KEY `muser_id` (`muser_id`),
  KEY `mphoto_id` (`mphoto_id`),
  FULLTEXT KEY `mphoto_name` (`mphoto_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `ahiska_photos_rating`
--

CREATE TABLE IF NOT EXISTS `ahiska_photos_rating` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `photo_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `date` varchar(10) NOT NULL,
  `rating` tinyint(3) NOT NULL,
  `owner_user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `for_select_1` (`id`,`user_id`),
  KEY `for_select_2` (`photo_id`,`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `ahiska_report`
--

CREATE TABLE IF NOT EXISTS `ahiska_report` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `act` varchar(10) NOT NULL,
  `type` smallint(5) NOT NULL,
  `text` text NOT NULL,
  `mid` int(11) NOT NULL,
  `date` varchar(10) NOT NULL,
  `ruser_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ruser_id` (`ruser_id`),
  KEY `mid` (`mid`),
  KEY `act` (`act`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `ahiska_restore`
--

CREATE TABLE IF NOT EXISTS `ahiska_restore` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(50) NOT NULL,
  `hash` varchar(32) NOT NULL,
  `ip` varchar(15) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `email` (`email`),
  KEY `hash` (`hash`),
  KEY `ip` (`ip`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `ahiska_sms_log`
--

CREATE TABLE IF NOT EXISTS `ahiska_sms_log` (
  `user_id` int(11) NOT NULL,
  `from_u` varchar(20) NOT NULL,
  `msg` varchar(100) NOT NULL,
  `operator_id` int(11) NOT NULL,
  `country` int(11) NOT NULL,
  `short_number` varchar(50) NOT NULL,
  `abonent_cost` float NOT NULL,
  `date` varchar(10) NOT NULL,
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `ahiska_static`
--

CREATE TABLE IF NOT EXISTS `ahiska_static` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `alt_name` varchar(50) NOT NULL,
  `title` varchar(150) NOT NULL,
  `text` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `alt_name` (`alt_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `ahiska_statuses`
--

CREATE TABLE IF NOT EXISTS `ahiska_statuses` (
  `uid` int(11) NOT NULL,
  `text` text NOT NULL,
  `date` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

-- --------------------------------------------------------

--
-- Структура таблицы `ahiska_support`
--

CREATE TABLE IF NOT EXISTS `ahiska_support` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(65) NOT NULL,
  `question` text NOT NULL,
  `suser_id` int(11) NOT NULL,
  `sfor_user_id` int(11) NOT NULL,
  `sdate` varchar(15) NOT NULL,
  `сdate` varchar(15) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `suser_id` (`suser_id`),
  KEY `сdate` (`сdate`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `ahiska_support_answers`
--

CREATE TABLE IF NOT EXISTS `ahiska_support_answers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `qid` int(11) NOT NULL,
  `auser_id` int(11) NOT NULL,
  `adate` varchar(15) NOT NULL,
  `answer` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `qid` (`qid`),
  KEY `auser_id` (`auser_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `ahiska_updates`
--

CREATE TABLE IF NOT EXISTS `ahiska_updates` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `for_user_id` mediumint(8) NOT NULL,
  `from_user_id` mediumint(8) NOT NULL,
  `type` smallint(6) NOT NULL,
  `date` varchar(10) NOT NULL,
  `text` text NOT NULL,
  `lnk` varchar(100) NOT NULL,
  `user_search_pref` varchar(50) NOT NULL,
  `user_photo` varchar(25) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `for_user_id` (`for_user_id`),
  KEY `date` (`date`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `ahiska_users`
--

CREATE TABLE IF NOT EXISTS `ahiska_users` (
  `user_id` mediumint(11) NOT NULL AUTO_INCREMENT,
  `user_email` varchar(50) NOT NULL,
  `user_password` varchar(32) NOT NULL,
  `user_name` varchar(30) NOT NULL,
  `user_lastname` varchar(30) NOT NULL,
  `user_photo` varchar(255) NOT NULL,
  `user_wall_id` int(11) NOT NULL,
  `user_birthday` varchar(30) NOT NULL,
  `user_sex` varchar(3) NOT NULL,
  `user_day` varchar(3) NOT NULL,
  `user_month` varchar(3) NOT NULL,
  `user_year` varchar(4) NOT NULL,
  `user_country` varchar(6) NOT NULL,
  `user_city` varchar(6) NOT NULL,
  `user_reg_date` varchar(20) NOT NULL,
  `user_lastdate` varchar(20) NOT NULL,
  `user_group` varchar(1) NOT NULL,
  `user_hid` varchar(64) NOT NULL,
  `user_country_city_name` varchar(100) NOT NULL,
  `user_search_pref` varchar(60) NOT NULL,
  `user_xfields` text NOT NULL,
  `xfields` text NOT NULL,
  `user_xfields_all` text NOT NULL,
  `user_albums_num` smallint(6) NOT NULL,
  `user_friends_demands` int(11) NOT NULL,
  `user_friends_num` mediumint(8) NOT NULL,
  `user_last_visit` varchar(15) NOT NULL,
  `user_fave_num` mediumint(8) NOT NULL,
  `user_pm_num` mediumint(8) NOT NULL,
  `user_notes_num` mediumint(8) NOT NULL,
  `user_subscriptions_num` mediumint(8) NOT NULL,
  `user_videos_num` mediumint(8) NOT NULL,
  `user_wall_num` int(11) NOT NULL,
  `user_status` varchar(255) NOT NULL,
  `user_privacy` varchar(250) NOT NULL,
  `user_blacklist_num` mediumint(8) NOT NULL,
  `user_blacklist` text NOT NULL,
  `user_sp` varchar(10) NOT NULL,
  `user_support` smallint(6) NOT NULL,
  `user_balance` mediumint(8) NOT NULL,
  `user_lastupdate` varchar(10) NOT NULL,
  `user_gifts` mediumint(8) NOT NULL,
  `user_public_num` mediumint(8) NOT NULL,
  `user_audio` int(11) NOT NULL,
  `user_msg_type` tinyint(2) NOT NULL,
  `user_delet` tinyint(3) NOT NULL,
  `user_ban` tinyint(3) NOT NULL,
  `user_ban_date` varchar(10) NOT NULL,
  `user_new_mark_photos` mediumint(8) NOT NULL,
  `user_doc_num` mediumint(8) NOT NULL,
  `user_logged_mobile` tinyint(1) NOT NULL,
  `user_cover` varchar(255) NOT NULL,
  `user_cover_pos` varchar(255) NOT NULL,
  `see_guests` text NOT NULL,
  `user_new_groups` int(11) NOT NULL,
  `user_phone` varchar(255) NOT NULL,
  `user_sms_hash` int(11) NOT NULL,
  `user_sms` int(11) NOT NULL,
  PRIMARY KEY (`user_id`),
  KEY `user_logged_hash` (`user_hid`),
  KEY `user_password` (`user_password`),
  KEY `user_email` (`user_email`),
  KEY `user_country` (`user_country`),
  KEY `user_city` (`user_city`),
  KEY `user_photo` (`user_photo`),
  KEY `user_sex` (`user_sex`),
  KEY `user_day` (`user_day`),
  KEY `user_month` (`user_month`),
  KEY `user_year` (`user_year`),
  KEY `user_delet` (`user_delet`),
  KEY `user_ban` (`user_ban`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `ahiska_users_rating`
--

CREATE TABLE IF NOT EXISTS `ahiska_users_rating` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `for_user_id` int(11) NOT NULL,
  `addnum` int(11) NOT NULL,
  `date` varchar(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `for_select` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `ahiska_videos`
--

CREATE TABLE IF NOT EXISTS `ahiska_videos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `owner_user_id` int(11) NOT NULL,
  `video` text NOT NULL,
  `photo` varchar(255) NOT NULL,
  `title` varchar(65) NOT NULL,
  `descr` text NOT NULL,
  `comm_num` mediumint(8) NOT NULL,
  `add_date` datetime NOT NULL,
  `privacy` tinyint(3) NOT NULL,
  `views` mediumint(8) NOT NULL,
  `public_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `owner_user_id` (`owner_user_id`),
  KEY `privacy` (`privacy`),
  FULLTEXT KEY `title` (`title`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `ahiska_videos_comments`
--

CREATE TABLE IF NOT EXISTS `ahiska_videos_comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `author_user_id` int(11) NOT NULL,
  `video_id` int(11) NOT NULL,
  `text` text NOT NULL,
  `add_date` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `for_fast_select1` (`author_user_id`,`video_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `ahiska_votes`
--

CREATE TABLE IF NOT EXISTS `ahiska_votes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(80) NOT NULL,
  `answers` text NOT NULL,
  `answer_num` mediumint(8) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `ahiska_votes_result`
--

CREATE TABLE IF NOT EXISTS `ahiska_votes_result` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `vote_id` int(11) NOT NULL,
  `answer` tinyint(3) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `vote_id` (`vote_id`),
  KEY `answer` (`answer`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `ahiska_wall`
--

CREATE TABLE IF NOT EXISTS `ahiska_wall` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `graffiti` mediumint(5) NOT NULL,
  `author_user_id` int(11) NOT NULL,
  `for_user_id` int(11) NOT NULL,
  `text` text NOT NULL,
  `add_date` varchar(15) NOT NULL,
  `fast_comm_id` int(11) NOT NULL,
  `fasts_num` mediumint(8) NOT NULL,
  `likes_num` mediumint(8) NOT NULL,
  `likes_users` text NOT NULL,
  `tell_uid` int(11) NOT NULL,
  `tell_date` varchar(11) NOT NULL,
  `type` varchar(100) NOT NULL,
  `public` tinyint(1) NOT NULL,
  `attach` text NOT NULL,
  `tell_comm` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `for_fast_select1` (`for_user_id`,`author_user_id`),
  KEY `fast_comm_id` (`fast_comm_id`),
  KEY `tell_uid` (`tell_uid`,`tell_date`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `ahiska_wall_like`
--

CREATE TABLE IF NOT EXISTS `ahiska_wall_like` (
  `rec_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `date` varchar(15) NOT NULL,
  KEY `for_fast_select1` (`rec_id`,`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
