{*
 * @name      EosAlpha BBS
 * @copyright 2011 Alex Vie silvercircle(AT)gmail(DOT)com
 *
 * This software is a derived product, based on:
 *
 * Simple Machines Forum (SMF)
 * copyright: 2011 Simple Machines (http://www.simplemachines.org)
 * license:   BSD, See included LICENSE.TXT for terms and conditions.
 *
 * @version 1.0pre
 *
 * this is what index.template was in SMF. All pages that display a "full
 * page" must extend this skeleton template. It outputs header / footer
 * and includes the content block.
 *}
<!DOCTYPE html >
{include 'generics.tpl'}
{$collapsed_containers = (!empty($_COOKIE.SF_collapsed)) ? (","|explode:$_COOKIE.SF_collapsed) : array()}
<html id="_S_" lang="en-US">
  <head>
    <meta name="viewport" content="width=device-width; initial-scale=1.0; maximum-scale=2.0; user-scalable=1;" />
    <link rel="stylesheet" type="text/css" href="{$S.theme_url}/css/base.css{$C.jsver}" />
    <link rel="stylesheet" type="text/css" href="{$S.primary_css}.css{$C.jsver}" />
    {if $C.right_to_left > 0}
      <link rel="stylesheet" type="text/css" href="{$S.theme_url}/css/rtl.css" />
    {/if}

    {if $M.jQueryFromGoogleCDN}
      <script type="text/javascript" src="{($C.is_https) ? 'https://' : 'http://'}ajax.googleapis.com/ajax/libs/jquery/{$C.jquery_version}/jquery.min.js"></script>
    {else}
      <script type="text/javascript" src="{$S.default_theme_url}/scripts/min/jquery.js?v=162"></script>
    {/if}
    <script type="text/javascript" src="{$S.default_theme_url}/scripts/script.js{$C.jsver}"></script>
    <script type="text/javascript">
    // <![CDATA[
      var smf_theme_url = '{$S.theme_url}';
      var smf_default_theme_url = '{$S.default_theme_url}';
      var smf_images_url = '{$S.images_url}';
      var smf_scripturl = '{$SCRIPTURL}';
      var smf_iso_case_folding = {($C.server.iso_case_folding) ? "true" : "false"};
      var smf_charset = 'UTF-8';
      var sSessionId = '{$C.session_id}';
      var sSessionVar = '{$C.session_var}';
      var disableDynamicTime = {(empty($O.disable_dynatime)) ? 0 : 1};
      var memberTimeFormat = '{$U.time_format}';
      var textSizeMax = 16;
      var textSizeMin = 8;
      var textSizeDefault = 10;
      var sideBarWidth = 250;
      var sidebar_content_loaded = 0;
      var cookie = readCookie('EOS_textsize');
      var ssp_imgpath = '{$S.images_url}/share';
      var textsize = cookie ? parseInt(cookie) : textSizeDefault;
      var anchor = document.getElementsByTagName('SCRIPT')[0];
      var t2 = document.createElement('SCRIPT');
      var _cname = '{$COOKIENAME}';
      var _mqcname = '{$C.multiquote_cookiename}';
      var is_am_pm = (memberTimeFormat.indexOf('%p') != -1);
      t2.type = "text/javascript";
      t2.async = true;
      t2.src = '{$S.default_theme_url}/scripts/footer.js{$C.jsver}';
      anchor.parentNode.insertBefore(t2, anchor);
    // ]]>
    </script>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="description" content="{$C.page_description_html_safe}" />
    {if $C.meta_keywords}
    <meta name="keywords" content="{$C.meta_keywords}" />
    {/if}
    <title>{$C.page_title_html_safe}</title>

    {if $U.is_guest}
    <script type="text/javascript">
    // <![CDATA[
      function calculate_time_zone() {
        var rightNow = new Date();
        var jan1 = new Date(rightNow.getFullYear(), 0, 1, 0, 0, 0, 0);  // jan 1st
        var june1 = new Date(rightNow.getFullYear(), 6, 1, 0, 0, 0, 0); // june 1st
        var temp = jan1.toGMTString();
        var jan2 = new Date(temp.substring(0, temp.lastIndexOf(" ")-1));
        temp = june1.toGMTString();
        var june2 = new Date(temp.substring(0, temp.lastIndexOf(" ")-1));
        var std_time_offset = (jan1 - jan2) / (1000 * 60 * 60);
        var daylight_time_offset = (june1 - june2) / (1000 * 60 * 60);
        var dst;
        if (std_time_offset == daylight_time_offset) {
          dst = "0"; // daylight savings time is NOT observed
        } else {
          var hemisphere = std_time_offset - daylight_time_offset;
          if (hemisphere >= 0)
            std_time_offset = daylight_time_offset;
          dst = "1"; // daylight savings time is observed
        }
        var i;
        // check just to avoid error messages
        if (document.getElementById('timezone')) {
          for (i = 0; i < document.getElementById('timezone').options.length; i++) {
            if (document.getElementById('timezone').options[i].value == convert(std_time_offset)+","+dst) {
              document.getElementById('timezone').selectedIndex = i;
              break;
            }
          }
        }
        return(parseInt(std_time_offset) + parseInt(dst));
      }

      function convert(value) {
        var hours = parseInt(value);
        value -= parseInt(value);
        value *= 60;
        var mins = parseInt(value);
        value -= parseInt(value);
        value *= 60;
        var secs = parseInt(value);
        var display_hours = hours;
        // handle GMT case (00:00)
        if (hours == 0) {
          display_hours = "00";
        } else if (hours > 0) {
          display_hours = (hours < 10) ? "+0"+hours : "+"+hours;
        } else {
          display_hours = (hours > -10) ? "-0"+Math.abs(hours) : hours;
        }

        mins = (mins < 10) ? "0"+mins : mins;
        return display_hours+":"+mins;
      }
        var guest_time_offset = calculate_time_zone();
        sendXMLDocument(smf_prepareScriptUrl(smf_scripturl) + 'action=xmlhttp;sa=tzoffset;o=' + guest_time_offset + ';xml', '', function() {});
    // ]]>
    </script>
    {/if}

    {if isset($C.robot_no_index)}
      <meta name="robots" content="noindex" />
    {/if}
    {* Present a canonical url for search engines to prevent duplicate content in their indices. *}
    {if isset($C.canonical_url)}
      <link rel="canonical" href="{$C.canonical_url}" data-href="{(!empty($C.share_url)) ? $C.share_url : ''}" />
    {/if}
    {* Show all the relative links, such as help, search, contents, and the like. *}
    <link rel="search" href="{$SCRIPTURL}?action=search" />
    {* If RSS feeds are enabled, advertise the presence of one. *}
    {if $M.xmlnews_enable and ($M.allow_guestAccess or $C.user.is_logged)}
    <link rel="alternate" type="application/rss+xml" title="{$C.forum_name_html_safe} - {$T.rss}" href="{$SCRIPTURL}?type=rss;action=.xml" />
    {/if}

    {* If we're viewing a topic, these should be the previous and next topics, respectively. *}
    {if isset($C.current_topic)}
    <link rel="prev" href="{$SCRIPTURL}?topic={$C.current_topic}.0;prev_next=prev" />
    <link rel="next" href="{$SCRIPTURL}?topic={$C.current_topic}.0;prev_next=next" />
    {/if}

    {* If we're in a board, or a topic for that matter, the index will be the board's index. *}
    {if isset($C.current_board)}
    <link rel="index" href="{$SCRIPTURL}?board={$C.current_board}.0" />
    {/if}
    {* Output any remaining HTML headers. (from mods, maybe?) *}
    {$C.html_headers}
    <style>
    </style>
  </head>
  <body>
  {$alerts = ($U.notify_count > 0) ? $U.notify_count : ''}
  {$scope = 0}
  {$search_label = $T.search_all_boards}
  {$astream_link = '<a rel="nofollow" data-board="all" href="'|cat:$SCRIPTURL|cat:'?action=astream;sa=get;all">Recent activity</a>'}

  {if isset($C.current_topic)}
    {$search_label = $T.search_topic}
    {$scope = 2}
  {elseif isset($C.current_board)}
  {* If we're on a certain board, limit it to this board ;). *}
    {$search_label = $T.search_board}
    {$scope = 1}
    {$astream_link = '<a data-board="'|cat:$C.current_board|cat:'" href="'|cat:$SCRIPTURL|cat:'?action=astream;sa=get;b='|cat:$C.current_board|cat:'">Recent activity</a>'}
  {/if}
  <div id="__t_script" style="display:none;"></div>
  <div id="jsconfirm" style="width:450px;" class="jqmWindow"><div class="jqmWindow_container"><div class="glass jsconfirm title"></div><div class="jsconfirm content blue_container norounded smallpadding mediummargin tinytext"></div><div class="floatright mediummargin"><span class="button default" id="c_yes">Yes</span><span class="button" id="c_no">No</span><span class="button" id="c_ok">Ok</span></div><div class="clear"></div></div></div>
  <div id="ajaxbusy" style="display:none;"><img src="{$S.images_url}/ajax-loader.gif" alt="loader" /></div>
  <div id="mcard" style="display:none;"><div onclick="mcardClose();" id="mcard_close">X</div><div id="mcard_inner"></div></div>
  <div id="wrap" style="width:100%;">
  <header>
  <div id="header">
    {include 'header.tpl'}
  <nav>
  {* Show the menu here, according to the menu sub template. *}
  </nav>
  <script>
    // <![CDATA[
      setTextSize(textsize);
    // ]]>
  </script>
  </div>
  </header>
  {* The main content should go here. *}
  <div id="content_section">
  <div id="main_content_section">
  {include file = "linktree.tpl"}
  {* Show the navigation tree. *}
  <div class="clear cContainer_end"></div>
  {$C.additional_admin_errors}
  
  {if $C.news_item_count}
    {include file="notices_list.tpl"}
  {/if}
  <div id="container">
  {block 'content'}
  {/block}
  <div class="clear"></div>
  </div></div></div>
  {* Show the "Powered by" and "Valid" logos, as well as the copyright. Remember, the copyright must be somewhere! *}
  <script type="text/javascript">
  // <![CDATA[
  {if isset($C.need_pager_script_fragment)}
  jQuery(document).ready(function() {
    $('.pagelinks .prefix').click(function() {
      if($('#directpager').length <= 0) {
        $(this).attr('data-save', $(this).html());
        $(this).html('<form action="' + $(this).attr('data-urltemplate') + '" id="directpager" method="post">{$T.page_go_to}<input name="directpager_pagenr" id="directpager_pagenr" size=3 /></form>');
        $('#directpager_pagenr').focus();
      }
      $('#directpager').submit(function() {

        var newstart = (parseInt($('#directpager_pagenr').val()) - 1) * parseInt($(this).parent().attr('data-perpage'));
        if(newstart < 0)
          newstart = 0;
        $(this).attr('action', $(this).attr('action').replace(/\[\[PAGE\]\]/g, newstart));
        $(this).submit();
        return(false);
      });
    });

    $('.pagelinks .prefix').live('mouseleave',function(event) {
      $(this).html($(this).attr('data-save'));
    });
    return;
  });
  {/if}
  {if isset($C.need_synhlt)}
    var t3 = document.createElement('SCRIPT');
    t3.type = "text/javascript";
    t3.async = true;
    t3.src = "{$S.theme_url}/scripts/shlt.js?ver=1.1.0";
    anchor.parentNode.insertBefore(t3, anchor);
  {/if}

  {if isset($C.want_GA_embedded)}
    var _gaq = _gaq || [];
    _gaq.push(['_setAccount', '{$M.GA_tracker_id}']);
    _gaq.push(['_setDomainName', '{$M.GA_domain_name}']);
    _gaq.push(['_trackPageview']);
  
    var ga = document.createElement('script');
    var sa = document.getElementsByTagName('script')[0];
    ga.async = true;
    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
    sa.parentNode.insertBefore(ga, sa);
  {/if}
  // ]]>
  </script>
  <footer>
  {* Show the load time? *}
  {if !empty($C.show_load_time)}
    {$loadtime = '@%%__loadtime__%%@'}
  {else}
    {$loadtime = ''}
  {/if}
  {include 'footer.tpl'}
  </footer>
  {if isset($C.want_piwik_embedded)}
    <script src="{$M.piwik_uri}/piwik.js"></script>
    <script>
    var pkBaseURL = "{$M.piwik_uri}";
    try {
      var piwikTracker = Piwik.getTracker(pkBaseURL + "/piwik.php", {$M.piwik_tracker_id});
      piwikTracker.trackPageView();
      piwikTracker.enableLinkTracking();
    }
    catch( err ) {
    }
    </script>
    <noscript>
      <div style="width:0px;height:0px;"><img src="{$M.piwik_uri}/piwik.php?idsite=1" style="border:0" alt="" /></div>
    </noscript>
  {/if}
  </div>
  {* output additional scripts defined in the code *}
  {$SUPPORT->footer_scripts()}
  {block 'footerscripts'}
  {* output additional scripts defined in the template *}
  {/block}
  </body>
</html>
