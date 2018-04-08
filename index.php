<?php
/* 
	Appointment: Главная страница
	File: index.php
	Author: f0rt1 
	Engine: Vii Engine
	Copyright: NiceWeb Group (с) 2011
	e-mail: niceweb@i.ua
	URL: http://www.niceweb.in.ua/
	ICQ: 427-825-959
	Данный код защищен авторскими правами
*/
if(isset($_POST["PHPSESSID"])){
	session_id($_POST["PHPSESSID"]);
}
@session_start();
@ob_start();
@ob_implicit_flush(0);

@error_reporting(E_ALL ^ E_WARNING ^ E_NOTICE);

define('MOZG', true);
define('ROOT_DIR', dirname (__FILE__));
define('ENGINE_DIR', ROOT_DIR.'/system');

header('Content-type: text/html; charset=utf-8');

//AJAX
$ajax = $_POST['ajax'];

$logged = false;
$user_info = false;

include ENGINE_DIR.'/init.php';

//Если юзер перешел по реф ссылке, то добавляем id реферала в сессию
if($_GET['reg']) $_SESSION['ref_id'] = intval($_GET['reg']);

//Определиние браузера
if(stristr($_SERVER['HTTP_USER_AGENT'], 'MSIE 6.0')) $xBrowser = 'ie6';
elseif(stristr($_SERVER['HTTP_USER_AGENT'], 'MSIE 7.0')) $xBrowser = 'ie7';
elseif(stristr($_SERVER['HTTP_USER_AGENT'], 'MSIE 8.0')) $xBrowser = 'ie8';
if($xBrowser == 'ie6' OR $xBrowser == 'ie7' OR $xBrowser == 'ie8')
	header("Location: /badbrowser.php");

//Загружаем количество новых новостей
$CacheNews = mozg_cache('user_'.$user_info['user_id'].'/new_news');
if($CacheNews){
	$new_news = '<div class="newac">+'.$CacheNews.'</div>';
	$news_link = '/notifications';
}

//Загружаем количество новых подарков
$CacheGift = mozg_cache("user_{$user_info['user_id']}/new_gift");
if($CacheGift){
	$new_ubm = '<div class="newac">+'.$CacheGift.'</div>';
	$gifts_link = "/gifts{$user_info['user_id']}?new=1";
} else
	$gifts_link = '/balance';

//Новые сообщения
$user_pm_num = $user_info['user_pm_num'];
if($user_pm_num)
	$user_pm_num = '<div class="newac">+'.$user_pm_num.'</div>';
else
	$user_pm_num = '';
	
//Новые друзья
$user_friends_demands = $user_info['user_friends_demands'];
if($user_friends_demands){
	$demands = '<div class="newac">+'.$user_friends_demands.'</div>';
	$requests_link = '/requests';
} else
	$demands = '';
	
//Тех. Поддержка
$user_support = $user_info['user_support'];
if($user_support)
	$support = '<div class="newac">+'.$user_support.'</div>';
else
	$support = '';
	
//Отметки на фото
if($user_info['user_new_mark_photos']){
	$new_photos_link = 'newphotos';
	$new_photos = '<div class="newac">+'.$user_info['user_new_mark_photos'].'</div>';
} else {
	$new_photos = '';
	$new_photos_link = $user_info['user_id'];
}

//Если включен AJAX то загружаем стр.
if($ajax == 'yes'){

	//Если есть POST Запрос и значение AJAX, а $ajax не равняется "yes" то не пропускаем
	if($_SERVER['REQUEST_METHOD'] == 'POST' AND $ajax != 'yes')
		die('An unknown error has occurred');

	if($spBar)
		$ajaxSpBar = "$('#speedbar').show().html('{$speedbar}')";
	else
		$ajaxSpBar = "$('#speedbar').hide()";

	$result_ajax = "<script type=\"text/javascript\">document.title = '{$metatags['title']}';{$ajaxSpBar};
	document.getElementById('new_msg').innerHTML = '{$user_pm_num}';
	document.getElementById('new_news').innerHTML = '{$new_news}';
	document.getElementById('new_ubm').innerHTML = '{$new_ubm}';
	document.getElementById('ubm_link').setAttribute('href', '{$gifts_link}');
	document.getElementById('new_support').innerHTML = '{$support}';
	document.getElementById('news_link').setAttribute('href', '/news{$news_link}');
	document.getElementById('new_requests').innerHTML = '{$demands}';
	document.getElementById('new_photos').innerHTML = '{$new_photos}';
	document.getElementById('requests_link_new_photos').setAttribute('href', '/albums/{$new_photos_link}');
	document.getElementById('requests_link').setAttribute('href', '/friends{$requests_link}');
	</script>
	{$tpl->result['info']}{$tpl->result['content']}";
	
	echo str_replace('{theme}', '/templates/'.$config['temp'], $result_ajax);

	$tpl->global_clear();
	$db->close();

	if($config['gzip'] == 'yes')
		GzipOut();
		
	die();
} 

//Если обращение к главной странице и юзер не авторизован то показываем страницу входа
if($go == 'register' OR $go == 'main' AND !$logged)
	include ENGINE_DIR.'/modules/main.php';

$tpl->load_template('index.tpl');

//Если юзер залогинен
if($logged){
	$tpl->set_block("'\\[not-logged\\](.*?)\\[/not-logged\\]'si","");
	$tpl->set('[logged]','');
	$tpl->set('[/logged]','');
	$tpl->set('{my-page-link}', '/u'.$user_info['user_id']);
	$tpl->set('{my-id}', $user_info['user_id']);
	
	//Заявки в друзья
	$user_friends_demands = $user_info['user_friends_demands'];
	if($user_friends_demands){
		$tpl->set('{demands}', $demands);
		$tpl->set('{requests-link}', $requests_link);
	} else {
		$tpl->set('{demands}', '');
		$tpl->set('{requests-link}', '');
	}
	
	//Новости
	if($CacheNews){
		$tpl->set('{new-news}', $new_news);
		$tpl->set('{news-link}', $news_link);
	} else {
		$tpl->set('{new-news}', '');
		$tpl->set('{news-link}', '');
	}
	
	//Сообщения
	if($user_pm_num)
		$tpl->set('{msg}', $user_pm_num);
	else 
		$tpl->set('{msg}', '');
	
	//Поддержка
	if($user_support)
		$tpl->set('{new-support}', $support);
	else 
		$tpl->set('{new-support}', '');
	
	//Отметки на фото
	if($user_info['user_new_mark_photos']){
		$tpl->set('{my-id}', 'newphotos');
		$tpl->set('{new_photos}', $new_photos);
	} else 
		$tpl->set('{new_photos}', '');

	//Новый подарок
	if($CacheGift){
		$tpl->set('{new-ubm}', $new_ubm);
		$tpl->set('{ubm-link}', $gifts_link);
	} else {
		$tpl->set('{new-ubm}', '');
		$tpl->set('{ubm-link}', $gifts_link);
	}

} else {
	$tpl->set_block("'\\[logged\\](.*?)\\[/logged\\]'si","");
	$tpl->set('[not-logged]','');
	$tpl->set('[/not-logged]','');
	$tpl->set('{my-page-link}', '');
}

$tpl->set('{header}', $headers);
$tpl->set('{speedbar}', $speedbar);
$tpl->set('{mobile-speedbar}', $mobile_speedbar);
$tpl->set('{info}', $tpl->result['info']);

// FOR MOBILE VERSION 1.0
if($config['temp'] == 'mobile'){

	$tpl->result['content'] = str_replace('onClick="Page.Go(this.href); return false"', '', $tpl->result['content']);
	
	if($user_info['user_status'])
		$tpl->set('{status-mobile}', '<span style="font-size:11px;color:#000">'.$user_info['user_status'].'</span>');
	else
		$tpl->set('{status-mobile}', '<span style="font-size:11px;color:#999">'.$lang['lang_202'].'</span>');
	
	$new_actions = $user_friends_demands+$user_support+$CacheNews+$CacheGift+$user_info['user_pm_num'];

	if($new_actions)
		$tpl->set('{new-actions}', "<div class=\"headm_newac\" style=\"margin-top:5px;margin-left:30px\">+{$new_actions}</div>");
	else
		$tpl->set('{new-actions}', "");
	
}

$tpl->set('{content}', $tpl->result['content']);

if($spBar)
	$tpl->set_block("'\\[speedbar\\](.*?)\\[/speedbar\\]'si","");
else {
	$tpl->set('[speedbar]','');
	$tpl->set('[/speedbar]','');
}

//BUILD JS
if($config['gzip_js'] == 'yes')
	if($logged)
		$tpl->set('{js}', '<script type="text/javascript" src="/min/index.php?charset=windows-1251&amp;g=general&amp;6"></script>');
	else
		$tpl->set('{js}', '<script type="text/javascript" src="/min/index.php?charset=windows-1251&amp;g=no_general&amp;6"></script>');
else
	if($logged)
		$tpl->set('{js}', 
		'<script type="text/javascript" src="{theme}/js/jquery.lib.js"></script>
		<script type="text/javascript" src="{theme}/js/'.$checkLang.'/lang.js"></script>
		<script type="text/javascript" src="{theme}/js/main.js"></script>
		<script type="text/javascript" src="{theme}/js/profile.js"></script>');
	else
		$tpl->set('{js}', 
		'<script type="text/javascript" src="{theme}/js/jquery.lib.js"></script>
		<script type="text/javascript" src="{theme}/js/'.$checkLang.'/lang.js"></script>
		<script type="text/javascript" src="{theme}/js/main.js"></script>');

// FOR MOBILE VERSION 1.0
if($user_info['user_photo']) $tpl->set('{my-ava}', "/uploads/users/{$user_info['user_id']}/50_{$user_info['user_photo']}");
else $tpl->set('{my-ava}', "{theme}/images/no_ava_50.png");
$tpl->set('{my-name}', $user_info['user_search_pref']);

if($check_smartphone) $tpl->set('{mobile-link}', '<a href="/index.php?act=change_mobile">'.$lang['lang_731'].'</a>');
else $tpl->set('{mobile-link}', '');

$tpl->set('{lang}', $rMyLang);

$countAllUser = $db->super_query("SELECT COUNT(*) as cnt FROM `".PREFIX."_users`");
$countAllUser_stln = strlen($countAllUser['cnt']);
$arrayAllUser = $countAllUser['cnt'];
$resultAllUser = '';
for($i = 0; $i < $countAllUser_stln; $i++){
	$resultAllUser .= '<li>'.$arrayAllUser{$i}.'</li>';
}
$tpl->set('{all_user_num}', $resultAllUser);

$tpl->compile('main');

echo str_replace('{theme}', '/templates/'.$config['temp'], $tpl->result['main']);

$tpl->global_clear();
$db->close();

if($config['gzip'] == 'yes')
	GzipOut();
?>