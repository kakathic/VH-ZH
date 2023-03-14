# Kakathic

## Leave true to ignore Mount system
SKIPMOUNT=false
## Set to true it will incorporate system.prop into build.prop
PROPFILE=true
## For true post-fs-data.sh to be used
POSTFSDATA=true
## Set to true for service.sh to be used
LATESTARTSERVICE=true

# Internet
chmod 777 $TMPDIR/Loading.sh && $TMPDIR/Loading.sh; . $TMPDIR/1.sh

## Start the installation
on_install(){

ui_print "! Vol+ = Chuyển đổi số."
ui_print "! Để chọn số hiện tại ấn Vol- hoặc +1 chạm."
ui_print "! Ấn nút nguồn để hủy."
ui_print

if [ "$API" -le 31 ];then
ui_print "- Cho phép gỡ bỏ ứng dụng Getapps ?"
ui_print
ui_print2 "1. Có"
ui_print2 "2. Không"

if [ "$(GP gettapp)" ];then
gettttap=$(GP gettapp)
ui_print
ui_print2 "Chọn: $gettttap"
ui_print
else
ui_print
ui_print2 "1"
Vk 2
gettttap=$input
fi


ui_print "- Bật tính năng mod MIUI ?"
ui_print
ui_print2 "1. Có"
ui_print2 "2. Không"

if [ "$(GP global)" ];then
chinann=$(GP global)
ui_print
ui_print2 "Chọn: $chinann"
ui_print
else
ui_print
ui_print2 "1"
Vk 2
chinann=$input
fi

fi

ui_print "- Cho phép ứng dụng chạy nền"
ui_print
ui_print2 "1. Có"
ui_print2 "2. Không"

if [ "$(GP ram)" ];then
Vipno=$(GP ram)
ui_print
ui_print2 "Chọn: $Vipno"
ui_print
else
ui_print
ui_print2 "1"
Vk 2
Vipno=$input
fi

ui_print "- Bật tính năng bàn phím nâng cao ?"
ui_print
ui_print2 "1. Có"
ui_print2 "2. Không"

if [ "$(GP banphim)" ];then
keyyyy=$(GP banphim)
ui_print
ui_print2 "Chọn: $keyyyy"
ui_print
else
ui_print
ui_print2 "1"
Vk 2
keyyyy=$input
fi

## Unzip system
ui_print "  $unzip"
ui_print
unzip -qo "$ZIPFILE" "system/*" -d $MODPATH

## code
#Xu_install busybox static
Xu_install jre static
Xu_install smali 2.3.4
Xu_install baksmali 2.3.4
Xu_install zipalign static
Xu_install zip static
Xu_install toybox static

sed(){ toybox sed "$@"; }
grep(){ toybox grep "$@"; }
cut(){ toybox cut "$@"; }
find(){ toybox find "$@"; }

mkdir -p $APK/tmp /sdcard/VH-MI/color /data/tools/apk

if [ ! -e "/sdcard/VH-MI/color/Tối.ini" ];then
if [ "$API" -ge 31 ];then
cp -f $TMPDIR/12-Tối.ini /sdcard/VH-MI/color/Tối.ini
cp -f $TMPDIR/12-Sáng.ini /sdcard/VH-MI/color/Sáng.ini
else
cp -f $TMPDIR/*.ini /sdcard/VH-MI/color
fi
fi

evol "WyAiJFRlc⁰QxMjMiID⁵³IHRydWUgXSB⁴fCBhYm³ydAo="
# Copy file & apk
[ "$Vipno" == 1 ] && CPfile 'framework'
[ "$keyyyy" == 1 ] && CPapk com.miui.phrase
if [ "$keyyyy" == 1 ] || [ "$chinann" == 1 ];then
CPapk com.android.settings
CPfile ''$miuik'framework'
fi
if [ "$chinann" == 1 ];then
CPfile 'framework'
CPfile 'services'
[ "$API" -le 31 ] && CPapk com.miui.powerkeeper
CPapk com.android.systemui
fi
if [ "$chinann" == 1 ] || [ "$keyyyy" == 1 ] || [ "$gettttap" == 1 ];then
CPfile ''$miuik'services'
fi

ui_print2 "Giải nén apk"
ui_print
# giải nén file
Giainen
ui_print2 "Chỉnh sửa apk"
ui_print
# Mod install

evol "aWYgWyAiJGdldHR⁵dGFwIiA³PSAxIF⁵¹dGhlbgpbICIkKHBtIHBhdGggY⁶³tLnhpYW³taS⁷tYXJrZXQgfCBncmVwIC⁸jbTEgJy³kYXRhLycpIiA³PSAxIF⁵gfHwgcG⁵gaW⁷zdGFsbCAtciAiJChwbSBwYXRoIGNvbS⁷⁹aWFvbWkubWFya⁶V⁵IHwgY⁰V⁵IC⁸kIDogLWYyKSIgPiYyCkZSRUVaRSAiJChlY⁶hvIC⁴qLyovKlN⁸cGVyTWFya⁶V⁵KikiCgpWc⁶⁸hbGkgIi⁷tZXRob⁶QgcHJpdmF⁵ZSBjaGVja⁸N⁷c⁰RlbVNlbGZQcm³⁵ZWN⁵aW³uKFopViIgXAoiLmVuZCBtZXRob⁶QiIFwKJy⁷tZXRob⁶QgcHJpdmF⁵ZSBjaGVja⁸N⁷c⁰RlbVNlbGZQcm³⁵ZWN⁵aW³uKFopVgogICAgLmxvY⁶FscyAxCiAgICByZXR⁸cm⁹tdm³pZAouZW⁷kIG⁸ldGhvZCcgXAonJyRBUEsvJG⁸pdWlrJ⁰NlcnZpY⁶VzL⁶NsYXNzZXMqL⁶NvbS³taXVpL⁰NlcnZlci⁴qJwpmaQoKI⁶⁸vZCAyCmlmIFsgIiRjaGluYW⁷uIiA³PSAxIF⁵¹dGhlbgoKIyBWw²EgQ⁸RTClZzbWFsaSAnLm⁸ldGhvZCBwdWJsaWMgb⁶⁷DcmVhdGUoKVYnIFwKJy⁷lbmQgbWV⁵aG³kJyBcCicubWV⁵aG³kIHB⁸YmxpYyBvbkNyZWF⁵ZSgpVgogICAgLnJlZ⁶lzdGVycyAyCiAgICBpbnZva⁶Utc⁰RhdGljIHtwMH⁵sIExhbmRyb⁶lkL⁶FwcC³BcHBsaWNhdGlvblN⁵dWI¹LT⁷vbkNyZWF⁵ZShMYW⁷kcm³pZC³hcHAvQXBwbGljYXRpb⁶⁹¹KVYKICAgIHJldHVybi⁸⁶b⁶lkCi⁷lbmQgbWV⁵aG³kJyBcCiIkQVBLL⁶ZyYW⁸ld⁶³yay³jbGFzc⁶VzKi³hbmRyb⁶lkL⁶FwcC³BcHBsaWNhdGlvbi⁷zbWFsaSIKbWtkaXIgLXAgJEFQSy³mcmFtZXdvcmsvY⁶xhc⁰Nlcy³hbmRyb⁶lkL⁶FwcApjcCAtcmYgJFRNUERJUi³UZXN⁵LnNtYWxpICRBUEsvZnJhbWV⁰b⁰JrL⁶NsYXNzZXMvYW⁷kcm³pZC³hcHAvQXBwbGljYXRpb⁶⁷TdHViLnNtYWxpCgojIEThu⁹tjaCBFVQp⁸bnppcCAtcW⁴gIiRUTVBESVIvVHJhbmV⁸LnppcCIgLWQgJyckQVBLLyRtaXVpaydmcmFtZXdvcmsvY⁶xhc⁰NlcycKZWNobyAiJEFQSy⁴kbWl⁸aWsiZnJhbWV⁰b⁰JrL⁶NsYXNzZXMvZXUveGlhb⁶⁸pL⁰V⁵aWwgPj⁹gIiRBUEsvJG⁸pdWlrImZyYW⁸ld⁶³yay³jbGFzcwoKIyBWw²EgY⁶jhu²⁴ga⁴O³IHYxClZzbWFsaSAiLm⁸ldGhvZCBwcml⁶YXRlIGNoZWNrU⁰lzQXBwQ⁰JhY⁶soKVoiIFwKIi⁷lbmQgbWV⁵aG³kIiBcCicubWV⁵aG³kIHByaXZhdGUgY⁶hlY⁶tTeXNBcHBDcmFjaygpWgogICAgLnJlZ⁶lzdGVycyAyCiAgICBjb⁶⁷zdC⁴⁵IHYwLCAweDEKICAgIHJldHVybiB⁶MAouZW⁷kIG⁸ldGhvZCcgXAonJyRBUEsvJG⁸pdWlrJ⁰NlcnZpY⁶VzL⁶NsYXNzZXMqL⁶NvbS³taXVpL⁰NlcnZlci⁴qJwpWc⁶⁸hbGkgIi⁷tZXRob⁶QgcHJpdmF⁵ZSBjaGVja⁵FwcFNpZ⁶⁷hdHVyZShcW⁵xhbmRyb⁶lkL⁶NvbnRlbnQvcG⁵vU⁶lnbmF⁵dXJlO⁵xqYXZhL⁶xhbmcvU⁰RyaW⁷nO⁸opWiIgXAoiLmVuZCBtZXRob⁶QiIFwKJy⁷tZXRob⁶QgcHJpdmF⁵ZSBjaGVja⁵FwcFNpZ⁶⁷hdHVyZShbTGFuZHJvaWQvY⁶³udGVudC³wbS³TaWduYXR⁸cmU¹TGphdmEvbGFuZy³TdHJpbmc¹WilaCiAgICAucmVnaXN⁵ZXJzIDUKICAgIGNvbnN⁵LzQgdjAsIDB⁹MQogICAgcmV⁵dXJuIHYwCi⁷lbmQgbWV⁵aG³kJyBcCicnJEFQSy⁴kbWl⁸aWsnc⁶VydmljZXMvY⁶xhc⁰NlcyovY⁶³tL⁶⁸pdWkvc⁶VydmVyLyonClZzbWFsaSAiLm⁸ldGhvZCBwcml⁶YXRlIHN⁵YXRpYyBjb⁶⁸wYXJlU⁶lnbmF⁵dXJlcyIgXAoiLmVuZCBtZXRob⁶QiIFwKJy⁷tZXRob⁶QgcHJpdmF⁵ZSBzdGF⁵aWMgY⁶³tcGFyZVNpZ⁶⁷hdHVyZXMoW⁵xhbmRyb⁶lkL⁶NvbnRlbnQvcG⁵vU⁶lnbmF⁵dXJlO⁸tMYW⁷kcm³pZC³jb⁶⁷⁵ZW⁷⁵L⁰BtL⁸NpZ⁶⁷hdHVyZTspSQogICAgLnJlZ⁶lzdGVycyA⁷CiAgICBjb⁶⁷zdC⁴⁵IHYwLCAweDAKICAgIHJldHVybiB⁶MAouZW⁷kIG⁸ldGhvZCcgXAonJyRBUEsvJG⁸pdWlrJ⁰NlcnZpY⁶VzL⁶NsYXNzZXMqL⁶NvbS³taXVpL⁰NlcnZlci⁴qJwoKIyBWw²Egc⁶V⁵dGluZ⁰MKVGhheXRoZSAnXCJNSVVJIFwiJyAnXCJWSCBcIicgJEFQSy³jb⁶⁵uYW⁷kcm³pZC⁷zZXR⁵aW⁷ncy³jbGFzc⁶VzKi³jb⁶⁵vYW⁷kcm³pZC³zZXR⁵aW⁷ncy³kZXZpY⁶UvTWl⁸aUFib⁰V⁵UGhvbmVVdGlscy⁷zbWFsaQpvcGVudGMoKXsKd⁰Rudz⁵iJChncmVwIC⁸tMSAiJDEiICRBUEsvY⁶³tLmFuZHJvaWQuc⁶V⁵dGluZ⁰MvY⁶xhc⁰NlcyovY⁶³tL⁶FuZHJvaWQvc⁶V⁵dGluZ⁰MvTWl⁸aVNldHRpbmdzLnNtYWxpIHwgYXdrICd¹cHJpbnQgJDJ³JykiClRoYXl⁵aGUgIiQxIiAiJDEgXG⁹gY⁶³uc⁰QvNCAkd⁰RudyAweDEiICRBUEsvY⁶³tLmFuZHJvaWQuc⁶V⁵dGluZ⁰MvY⁶xhc⁰NlcyovY⁶³tL⁶FuZHJvaWQvc⁶V⁵dGluZ⁰MvTWl⁸aVNldHRpbmdzLnNtYWxpOyB³Cm³wZW⁷⁵YyAnTGNvbS³hbmRyb⁶lkL⁰NldHRpbmdzL⁸JcJGlkOy⁵+c⁶VjdXJpdHlfc⁰RhdHVzOkknCm³wZW⁷⁵YyAnTGNvbS³hbmRyb⁶lkL⁰NldHRpbmdzL⁸JcJGlkOy⁵+bG³jYXRpb⁶⁷fc⁶V⁵dGluZ⁰M²SScKb⁰BlbnRjICdMY⁶³tL⁶FuZHJvaWQvc⁶V⁵dGluZ⁰MvUlwkaWQ¹LT⁷wcml⁶YWN⁷X⁰NldHRpbmdzOkknClRoYXl⁵aGUgInNnZXQtYm³vbGVhbiB⁶MSwgTG⁸pdWkvb⁰MvQnVpbGQ¹LT⁷JU⁸³HTE³CQUxfQlVJTEQ²WiIgImNvbnN⁵LzQgdjEsIDB⁹MSIgJEFQSy³jb⁶⁵uYW⁷kcm³pZC⁷zZXR⁵aW⁷ncy³jbGFzc⁶VzKi³jb⁶⁵vYW⁷kcm³pZC³zZXR⁵aW⁷ncy³NaXVpU⁶V⁵dGluZ⁰Muc⁶⁸hbGkKVnNtYWxpICcubWV⁵aG³kIHB⁸YmxpYyBzdGF⁵aWMgc⁰VwcG³ydFBhcnRpYWxTY⁰JlZW⁷TaG³⁵KClaJyBcCicuZW⁷kIG⁸ldGhvZCcgXAonLm⁸ldGhvZCBwdWJsaWMgc⁰RhdGljIHN⁸cHBvcnRQYXJ⁵aWFsU⁶NyZWVuU⁶hvdCgpWgogICAgLnJlZ⁶lzdGVycyAyCiAgICBjb⁶⁷zdC⁴⁵IHYxLCAweDEKICAgIHJldHVybiB⁶MQouZW⁷kIG⁸ldGhvZCcgXAoiJEFQSy³jb⁶⁵uYW⁷kcm³pZC⁷zZXR⁵aW⁷ncy³jbGFzc⁶VzKi⁴qIgpWc⁶⁸hbGkgJy⁷tZXRob⁶QgcHVibGljIHN⁵YXRpYyBpc⁸N⁸cHBvcnRTZWN⁸cml⁵eVNldHRpbmdzKExhbmRyb⁶lkL⁶NvbnRlbnQvQ⁶³udGV⁹dDspWicgXAonLmVuZCBtZXRob⁶QnIFwKJy⁷tZXRob⁶QgcHVibGljIHN⁵YXRpYyBpc⁸N⁸cHBvcnRTZWN⁸cml⁵eVNldHRpbmdzKExhbmRyb⁶lkL⁶NvbnRlbnQvQ⁶³udGV⁹dDspWgogICAgLnJlZ⁶lzdGVycyAxCiAgICBjb⁶⁷zdC⁴⁵IHAwLCAweDEKICAgIHJldHVybiBwMAouZW⁷kIG⁸ldGhvZCcgXAoiJEFQSy³jb⁶⁵uYW⁷kcm³pZC⁷zZXR⁵aW⁷ncy³jbGFzc⁶VzKi³jb⁶⁵vYW⁷kcm³pZC³zZXR⁵aW⁷ncy³NaXVpVXRpbHMuc⁶⁸hbGkiClZzbWFsaSAnLm⁸ldGhvZCBwdWJsaWMgc⁰RhdGljIHN⁸cHBvcnRQYXBlckV⁷ZUNhcmUoKVonIFwKJy⁷lbmQgbWV⁵aG³kJyBcCicubWV⁵aG³kIHB⁸YmxpYyBzdGF⁵aWMgc⁰VwcG³ydFBhcGVyRXllQ⁶FyZSgpWgogICAgLnJlZ⁶lzdGVycyAyCiAgICBjb⁶⁷zdC⁴⁵IHYwLCAweDEKICAgIHJldHVybiB⁶MAouZW⁷kIG⁸ldGhvZCcgXAoiJEFQSy³jb⁶⁵uYW⁷kcm³pZC⁷zZXR⁵aW⁷ncy³jbGFzc⁶VzKi⁴qIgpWc⁶⁸hbGkgJy⁷tZXRob⁶QgcHVibGljIHN⁵YXRpYyBpc⁸N⁸cHBvcnRVbmluc⁰RhbGxTeXNBcHAoTGFuZHJvaWQvY⁶³udGVudC³Db⁶⁷⁵ZXh⁵OylaJyBcCicuZW⁷kIG⁸ldGhvZCcgXAonLm⁸ldGhvZCBwdWJsaWMgc⁰RhdGljIGlzU⁰VwcG³ydFVuaW⁷zdGFsbFN⁷c⁵FwcChMYW⁷kcm³pZC³jb⁶⁷⁵ZW⁷⁵L⁵NvbnRleHQ¹KVoKICAgIC⁷yZWdpc⁰RlcnMgMwogICAgY⁶³uc⁰QvNCBwMCwgMHgxCiAgICByZXR⁸cm⁹gcDAKLmVuZCBtZXRob⁶QnIFwKIiRBUEsvY⁶³tLmFuZHJvaWQuc⁶V⁵dGluZ⁰MvY⁶xhc⁰NlcyovY⁶³tL⁶FuZHJvaWQvc⁶V⁵dGluZ⁰MvdXRpbHMvU⁶V⁵dGluZ⁰NGZWF⁵dXJlcy⁷zbWFsaSIKIyBNb⁶QgbcOgdSBjYW⁵gcG³wdXAKVnNtYWxpICcubWV⁵aG³kIHB⁸YmxpYyBnZXRBdmFpbGFiaWxpdHlTdGF⁵dXMoKUknIFwKJy⁷lbmQgbWV⁵aG³kJyBcCicubWV⁵aG³kIHB⁸YmxpYyBnZXRBdmFpbGFiaWxpdHlTdGF⁵dXMoKUkKICAgIC⁷yZWdpc⁰RlcnMgMQogICAgY⁶³uc⁰QvNCBwMCwgMHgyCiAgICByZXR⁸cm⁹gcDAKLmVuZCBtZXRob⁶QnIFwKIiRBUEsvY⁶³tLmFuZHJvaWQuc⁶V⁵dGluZ⁰MvY⁶xhc⁰NlcyovY⁶³tL⁶FuZHJvaWQvc⁶V⁵dGluZ⁰Mvc⁰BlY⁶lhbC³Db⁶xvckxhbXBFbnRyeUNvbnRyb⁶xsZXIuc⁶⁸hbGkiCgpDaG³zZSAiaW⁷⁶b⁶tlLXN⁵YXRpYyB¹fSwgTGNvbS³hbmRyb⁶lkL⁰NldHRpbmdzL⁰V⁵aWxzL⁸NldHRpbmdzRmVhdHVyZXM¹LT⁷pc⁵⁷lZWRTaG³⁰Q⁶³sb⁰JMYW⁸wKClaIiBcCiJtb⁰ZlLXJlc⁰VsdCIgIjB⁹MSIgXAoiJEFQSy³jb⁶⁵uYW⁷kcm³pZC⁷zZXR⁵aW⁷ncy³jbGFzc⁶VzKi³jb⁶⁵vYW⁷kcm³pZC³zZXR⁵aW⁷ncy³wb⁰B⁸cC³Qb⁰B⁸cFNldHRpbmdzLnNtYWxpIgoKZG⁷ybnI³IiQoZ⁰JlcCAtbTEgIkxjb⁶⁵vYW⁷kcm³pZC³zZXR⁵aW⁷ncy³⁸dGlscy³TZXR⁵aW⁷nc⁵ZlYXR⁸cmVzOy⁵+SVNfTkVFRF³SRU⁸PVkVfS⁵lEX⁸NQQUNFOloiICRBUEsvY⁶³tLmFuZHJvaWQuc⁶V⁵dGluZ⁰MvY⁶xhc⁰NlcyovY⁶³tL⁶FuZHJvaWQvc⁶V⁵dGluZ⁰MvdXRpbHMvU⁶V⁵dGluZ⁰NGZWF⁵dXJlcy⁷zbWFsaSB⁴IGF⁰ayAne⁰ByaW⁷⁵ICQyfScpIgoKWyAiJGRucm⁷yIiBdICYmIFRoYXl⁵aGUgJ⁰NwdXQtYm³vbGVhbiAnJGRucm⁷yJyBMY⁶³tL⁶FuZHJvaWQvc⁶V⁵dGluZ⁰MvdXRpbHMvU⁶V⁵dGluZ⁰NGZWF⁵dXJlczstPklTX⁵⁷FRURfUkVNT⁸ZFX⁵tJRF³TUEFDRTpaJyAnY⁶³uc⁰QvNCAnJGRucm⁷yJyAweDEgXG⁹gc⁰B⁸dC⁸ib⁶³sZWFuICckZG⁷ybnInIExjb⁶⁵vYW⁷kcm³pZC³zZXR⁵aW⁷ncy³⁸dGlscy³TZXR⁵aW⁷nc⁵ZlYXR⁸cmVzOy⁵+SVNfTkVFRF³SRU⁸PVkVfS⁵lEX⁸NQQUNFOlonICIkQVBLL⁶NvbS⁷hbmRyb⁶lkLnNldHRpbmdzL⁶NsYXNzZXMqL⁶NvbS³hbmRyb⁶lkL⁰NldHRpbmdzL⁰V⁵aWxzL⁸NldHRpbmdzRmVhdHVyZXMuc⁶⁸hbGkiCgpUaGF⁷dGhlICdjb⁶⁷zdC⁸zdHJpbmcgdjIsIFwibGFuZ⁸R⁷cGVcIicgJ⁶NvbnN⁵LXN⁵cmluZyB⁶MiwgXCJsYW⁷nVHlwZVwiIFxuIGNvbnN⁵LXN⁵cmluZyB⁶MSwgXCJlblwiJyAiJEFQSy³jb⁶⁵uYW⁷kcm³pZC⁷zZXR⁵aW⁷ncy³jbGFzc⁶VzKi³jb⁶⁵vYW⁷kcm³pZC³zZXR⁵aW⁷ncy³kZXZpY⁶UvRGV⁶aWNlUGFyYW⁸zSW⁷pdEhlbHBlci⁷zbWFsaSIKc⁶VkIC⁸pIC⁸²ICcxc⁰xjb⁶⁷zdC⁸zdHJpbmcgdjEsICJlbiJ⁴Y⁶³uc⁰Qtc⁰RyaW⁷nIHAxLCAiZW⁹ifCcgJEFQSy³jb⁶⁵uYW⁷kcm³pZC⁷zZXR⁵aW⁷ncy³jbGFzc⁶VzKi³jb⁶⁵vYW⁷kcm³pZC³zZXR⁵aW⁷ncy³kZXZpY⁶UvRGV⁶aWNlUGFyYW⁸zSW⁷pdEhlbHBlci⁷zbWFsaQoKVnNtYWxpICcubWV⁵aG³kIHB⁸YmxpYyBzdGF⁵aWMgaXNTaG³⁰UXVpY⁶tSZXBseVNldHRpbmcoKVonIFwKJy⁷lbmQgbWV⁵aG³kJyBcCicubWV⁵aG³kIHB⁸YmxpYyBzdGF⁵aWMgaXNTaG³⁰UXVpY⁶tSZXBseVNldHRpbmcoKVoKICAgIC⁷yZWdpc⁰RlcnMgMwogICAgY⁶³uc⁰QvNCB⁶MCwgMHgxCiAgICByZXR⁸cm⁹gdjAKLmVuZCBtZXRob⁶QnIFwKIiRBUEsvY⁶³tLmFuZHJvaWQuc⁶V⁵dGluZ⁰MvY⁶xhc⁰NlcyovY⁶³tL⁶FuZHJvaWQvc⁶V⁵dGluZ⁰MvdXRpbHMvU⁶V⁵dGluZ⁰NGZWF⁵dXJlcy⁷zbWFsaSIKClZzbWFsaSAnLm⁸ldGhvZCBwdWJsaWMgc⁰RhdGljIGlzTmVlZEhpZGVTaG³wRW⁷⁵cmFuY⁶UoTGFuZHJvaWQvY⁶³udGVudC³Db⁶⁷⁵ZXh⁵O⁵opWicgXAonLmVuZCBtZXRob⁶QnIFwKJy⁷tZXRob⁶QgcHVibGljIHN⁵YXRpYyBpc⁵⁷lZWRIaWRlU⁶hvcEVudHJhbmNlKExhbmRyb⁶lkL⁶NvbnRlbnQvQ⁶³udGV⁹dDtKKVoKICAgIC⁷yZWdpc⁰RlcnMgOQogICAgY⁶³uc⁰QvNCB⁶MCwgMHgxCiAgICByZXR⁸cm⁹gdjAKLmVuZCBtZXRob⁶QnIFwKIiRBUEsvY⁶³tLmFuZHJvaWQuc⁶V⁵dGluZ⁰MvY⁶xhc⁰NlcyovY⁶³tL⁶FuZHJvaWQvc⁶V⁵dGluZ⁰MvdXRpbHMvU⁶V⁵dGluZ⁰NGZWF⁵dXJlcy⁷zbWFsaSIKClZzbWFsaSAnLm⁸ldGhvZCBwdWJsaWMgc⁰RhdGljIGlzU⁰VwcG³ydFNhZmV⁵eUVtZXJnZW⁷jeVNldHRpbmdzKExhbmRyb⁶lkL⁶NvbnRlbnQvQ⁶³udGV⁹dDspWicgXAonLmVuZCBtZXRob⁶QnIFwKJy⁷tZXRob⁶QgcHVibGljIHN⁵YXRpYyBpc⁸N⁸cHBvcnRTYWZldHlFbWVyZ⁶VuY⁰lTZXR⁵aW⁷ncyhMYW⁷kcm³pZC³jb⁶⁷⁵ZW⁷⁵L⁵NvbnRleHQ¹KVoKICAgIC⁷yZWdpc⁰RlcnMgMQogICAgY⁶³uc⁰QvNCBwMCwgMHgxCiAgICByZXR⁸cm⁹gcDAKLmVuZCBtZXRob⁶QnIFwKIiRBUEsvY⁶³tLmFuZHJvaWQuc⁶V⁵dGluZ⁰MvY⁶xhc⁰NlcyovY⁶³tL⁶FuZHJvaWQvc⁶V⁵dGluZ⁰MvTWl⁸aVV⁵aWxzLnNtYWxpIgoKVnNtYWxpICIubWV⁵aG³kIGlzU⁶VjdXJlTG³ja⁶VkKClaIiBcCiIuZW⁷kIG⁸ldGhvZCIgXAonLm⁸ldGhvZCBpc⁸NlY⁰VyZUxvY⁶tlZCgpWgogICAucmVnaXN⁵ZXJzIDUKICAgY⁶³uc⁰QvNCB⁶MCwgMHgwCiAgIHJldHVybiB⁶MAouZW⁷kIG⁸ldGhvZCcgXAonJyRBUEsvJG⁸pdWlrJ⁰NlcnZpY⁶VzL⁶NsYXNzZXMqJwojIG⁸vZCBzeXN⁵ZW⁸⁸aQpBdXRvb⁶⁷lICJMbWl⁸aS³vcy³CdWlsZDstPklTX⁵lOVEVSTkFUSU³OQUxfQlVJTEQ²WiIgIjB⁹MSIgIiRBUEsvY⁶³tLmFuZHJvaWQuc⁰lzdGVtdWkvY⁶xhc⁰NlcyovY⁶³tL⁶FuZHJvaWQvc⁰lzdGVtdWkvY⁶³udHJvbGNlbnRlci³wb⁶xpY⁰kvR⁶³vZ⁶xlQ⁶³udHJvbGxlci⁷zbWFsaSIKQXV⁵b⁶³uZSAiTG⁸pdWkvb⁰MvQnVpbGQ¹LT⁷JU⁸³JTlRFUk⁷BVElPTkFMX⁵JVSUxEOloiICIweDEiICIkQVBLL⁶NvbS⁷hbmRyb⁶lkLnN⁷c⁰RlbXVpL⁶NsYXNzZXMqL⁶NvbS³hbmRyb⁶lkL⁰N⁷c⁰RlbXVpL⁰FzL⁰RpbGVzL⁵RyaXZlTW³kZVRpbGUuc⁶⁸hbGkiCkF⁸dG³vbmUgIkxtaXVpL⁶³zL⁵J⁸aWxkOy⁵+SVNfSU⁷URVJOQVRJT⁵⁷BTF³CVUlMRDpaIiAiMHgxIiAiJEFQSy³jb⁶⁵uYW⁷kcm³pZC⁷zeXN⁵ZW⁸⁸aS³jbGFzc⁶VzKi³jb⁶⁵vYW⁷kcm³pZC³zeXN⁵ZW⁸⁸aS³xcy³NaXVpTm³⁵aWZpY⁶F⁵aW³uSGVhZGVyVmlldy⁷zbWFsaSIKCiNUaGF⁷dGhlICJjb⁶⁵uYW⁷kcm³pZC⁷wYWNrYWdlaW⁷zdGFsbGVyIiAidC⁷tZS⁷rYWthdGhpYyIgJyckQVBLLyRtaXVpaydzZXJ⁶aWNlcy³jbGFzc⁶VzKi³jb⁶⁵vYW⁷kcm³pZC³zZXJ⁶ZXIvcG⁵vUGFja⁶FnZU⁸hbmFnZXJTZXJ⁶aWNlSW⁸wbC⁷zbWFsaScKI⁸RoYXl⁵aGUgInJvLnByb⁶R⁸Y⁰QubW³kX⁶RldmljZSIgInJvLnByb⁶R⁸Y⁰QudmlwIiAiJEFQSy³mcmFtZXdvcmsvY⁶xhc⁰NlcyovYW⁷kcm³pZC³hcHAvQXBwbGljYXRpb⁶⁷QYWNrYWdlTWFuYWdlci⁷zbWFsaSIKI⁸RoYXl⁵aGUgInJvLnByb⁶R⁸Y⁰QubW³kX⁶RldmljZSIgInJvLnByb⁶R⁸Y⁰QudmlwIiAiJEFQSy³mcmFtZXdvcmsvY⁶xhc⁰NlcyovYW⁷kcm³pZC³hcHAvRG³⁰bmxvYWRNYW⁷hZ⁶VyLnNtYWxpIgojVGhheXRoZSAicm⁴ucHJvZHVjdC⁷tb⁶RfZGV⁶aWNlIiAicm⁴ucHJvZHVjdC⁷⁶aXAiICIkQVBLL⁰NlcnZpY⁶VzL⁶NsYXNzZXMqL⁶NvbS³hbmRyb⁶lkL⁰NlcnZlci³wbS³QYWNrYWdlTWFuYWdlclNlcnZpY⁶VTdHViLnNtYWxpIgoKZWNobyAicm⁴ucHJvZHVjdC⁷⁶aXA³JChnZXRwcm³wIHJvLnByb⁶R⁸Y⁰QuZGV⁶aWNlKV³nbG³iYWwiID⁹+ICRUTVBESVIvc⁰lzdGVtLnByb⁰AKCkF⁸dG³vbmUgIkxtaXVpL⁶³zL⁵J⁸aWxkOy⁵+SVNfSU⁷URVJOQVRJT⁵⁷BTF³CVUlMRDpaIiAiMHgxIiAnJyRBUEsvJG⁸pdWlrJ⁰NlcnZpY⁶VzL⁶NsYXNzZXMqL⁶NvbS³hbmRyb⁶lkL⁰NlcnZlci³hbS³Qcm³jZXNzTWFuYWdlclNlcnZpY⁶Uuc⁶⁸hbGknCkF⁸dG³vbmUgIkxtaXVpL⁶³zL⁵J⁸aWxkOy⁵+SVNfSU⁷URVJOQVRJT⁵⁷BTF³CVUlMRDpaIiAiMHgxIiAnJyRBUEsvJG⁸pdWlrJ⁰NlcnZpY⁶VzL⁶NsYXNzZXMqL⁶NvbS³hbmRyb⁶lkL⁰NlcnZlci³ub⁰RpZmljYXRpb⁶⁹vTm³⁵aWZpY⁶F⁵aW³uTWFuYWdlclNlcnZpY⁶VJbXBsLnNtYWxpJwoKI⁵F⁸dG³vbmUgIkxtaXVpL⁶³zL⁵J⁸aWxkOy⁵+SVNfSU⁷URVJOQVRJT⁵⁷BTF³CVUlMRDpaIiAiMHgxIiAnJyRBUEsvJG⁸pdWlrJ⁶ZyYW⁸ld⁶³yay³jbGFzc⁶VzKi³hbmRyb⁶lkL⁰dpZGdldC³Ub⁶FzdEluamVjdG³ySW⁸wbC⁷zbWFsaScKQXV⁵b⁶³uZSAiTG⁸pdWkvb⁰MvQnVpbGQ¹LT⁷JU⁸³JTlRFUk⁷BVElPTkFMX⁵JVSUxEOloiICIweDEiICcnJEFQSy⁴kbWl⁸aWsnZnJhbWV⁰b⁰JrL⁶NsYXNzZXMqL⁶NvbS³hbmRyb⁶lkL⁶ludGVybmFsL⁶FwcC³DaG³vc⁶VyQWN⁵aXZpdHlTdHViSW⁸wbC⁷zbWFsaScKClRoYXl⁵aGUgIkxtaXVpL⁶³zL⁵J⁸aWxkOy⁵+SVNfSU⁷URVJOQVRJT⁵⁷BTF³CVUlMRDpaIiAiTG⁸pdWkvb⁰MvQnVpbGQ¹LT⁷JU⁸³NSVVJOloiICIkQVBLL⁶NvbS⁷taXVpLnBvd⁶Vya⁶VlcGVyL⁶NsYXNzZXMqL⁶NvbS³taXVpL⁰Bvd⁶Vya⁶VlcGVyL⁶N⁸c⁰RvbWVycG³⁰ZXIvQ⁰VzdG³tZXJQb⁰dlckNoZWNrLnNtYWxpIgpWc⁶⁸hbGkgIi⁷tZXRob⁶QgcHVibGljIHN⁵YXRpYyBpc⁵ZlYXR⁸cmVPbigpWiIgXAoiLmVuZCBtZXRob⁶QiIFwKJy⁷tZXRob⁶QgcHVibGljIHN⁵YXRpYyBpc⁵ZlYXR⁸cmVPbigpWgogICAgLnJlZ⁶lzdGVycyAzCiAgICBjb⁶⁷zdC⁴⁵IHYxLCAweDAKICAgIHJldHVybiB⁶MQouZW⁷kIG⁸ldGhvZCcgXAoiJEFQSy³jb⁶⁵ubWl⁸aS⁷wb⁰dlcmtlZXBlci³jbGFzc⁶VzKi⁴qIgpmaQoKaWYgWyAiJFZpcG⁷vIiA³PSAxIF⁵¹dGhlbgpWc⁶⁸hbGkgIi⁷tZXRob⁶QgaGFzRm³yZWdyb⁰VuZFNlcnZpY⁶VzKClaIiBcCiIuZW⁷kIG⁸ldGhvZCIgXAonLm⁸ldGhvZCBoYXNGb⁰JlZ⁰JvdW⁷kU⁶VydmljZXMoKVoKICAgIC⁷yZWdpc⁰RlcnMgMgogICAgY⁶³uc⁰QvNCB⁶MCwgMHgxCiAgICByZXR⁸cm⁹gdjAKLmVuZCBtZXRob⁶QnIFwKIiRBUEsvc⁶VydmljZXMvY⁶xhc⁰NlcyovY⁶³tL⁶FuZHJvaWQvc⁶VydmVyL⁶FtL⁸Byb⁶Nlc⁰NTZXJ⁶aWNlUmVjb⁰JkLnNtYWxpIgpmaQoKaWYgWyAiJGtleXl⁷eSIgPT⁵gMSBdO⁰RoZW⁹KbWtkaXIgLXAgJFRNUERJUi³iYW⁷waGltL⁶⁷pZ⁶h⁵bW³kZSAvc⁶RjYXJkL⁸ZILU⁸JL⁶NvbG³yICRNT⁵RQQVRIL⁰N⁷c⁰RlbS³tZWRpYS³⁵aGVtZS³kZWZhdWx⁵CiMgU⁴OhbmcKZWNobyAnPD³⁹bWwgdmVyc⁶lvbj⁵iMS⁹wIiBlbmNvZGluZz⁵idXRmLTgiPz⁹KPE⁸JVUlfVGhlbWVfVmFsdWVzPgo⁴Y⁶³sb⁰IgbmFtZT⁵iaW⁷wdXRfYm³⁵dG³tX⁶JhY⁶tncm³⁸bmRfY⁶³sb⁰IiPiMnJChjYXQgL⁰NkY⁶FyZC³WSC⁸NSS³jb⁶xvci³Tw²FuZy⁷pbmkpJzwvY⁶³sb⁰I+CjxkaW⁸lbiBuYW⁸lPSJpbnB⁸dF³ib⁰R⁵b⁶⁸faGVpZ⁶h⁵Ij⁹⁵NS⁹⁸OTk⁷NzZkcDwvZGltZW⁹+CjxkaW⁸lbiBuYW⁸lPSJpbnB⁸dF³ib⁰R⁵b⁶⁸fYnV⁵dG³uX⁶hlaWdodCI+MjguNWRwPC³kaW⁸lbj⁹KPGRpbWVuIG⁷hbWU³ImlucHV⁵X⁶JvdHRvbV³idXR⁵b⁶⁷fbWFyZ⁶luX⁰RvcCI+Mi⁹⁸ZHA⁴L⁶RpbWVuPgo⁴L⁵⁸JVUlfVGhlbWVfVmFsdWVzPicgPiAkVE⁸QRElSL⁶JhbnBoaW⁵vdGhlbWVfdmFsdWVzLnhtbAojIFThu⁷FpCmVjaG⁴gJzw/eG⁸sIHZlcnNpb⁶⁹³IjEuMCIgZW⁷jb⁶Rpbmc³InV⁵Zi⁵⁹Ij⁴+CjxNSVVJX⁸RoZW⁸lX⁸ZhbHVlcz⁹KPGNvbG³yIG⁷hbWU³ImlucHV⁵X⁶JvdHRvbV³iYWNrZ⁰JvdW⁷kX⁶NvbG³yIj⁹jJyQoY⁶F⁵IC³zZGNhcmQvVkgtTUkvY⁶³sb⁰IvVOG¹kWkuaW⁷pKSc⁴L⁶NvbG³yPgo⁴ZGltZW⁹gbmFtZT⁵iaW⁷wdXRfYm³⁵dG³tX⁶hlaWdodCI+NDUuNTk⁷OTc⁶ZHA⁴L⁶RpbWVuPgo⁴ZGltZW⁹gbmFtZT⁵iaW⁷wdXRfYm³⁵dG³tX⁶J⁸dHRvbl³oZWlnaHQiPjI⁹LjVkcDwvZGltZW⁹+CjxkaW⁸lbiBuYW⁸lPSJpbnB⁸dF³ib⁰R⁵b⁶⁸fYnV⁵dG³uX⁶⁸hcmdpbl³⁵b⁰AiPjIuNWRwPC³kaW⁸lbj⁹KPC³NSVVJX⁸RoZW⁸lX⁸ZhbHVlcz⁹nID⁹gJFRNUERJUi³iYW⁷waGltL⁶⁷pZ⁶h⁵bW³kZS³⁵aGVtZV³⁶YWx⁸ZXMueG⁸sCiMgxJDDs⁶⁷nIGfDs⁶kgCmNkICRUTVBESVIvYmFucGhpbQp²aXAgLXFyICRNT⁵RQQVRIL⁰N⁷c⁰RlbS³tZWRpYS³⁵aGVtZS³kZWZhdWx⁵L⁶NvbS⁷taXVpLnBocmFzZS⁷²aXAgKgptdiAkTU³EUEFUSC³zeXN⁵ZW⁵vbWVkaWEvdGhlbWUvZGVmYXVsdC³jb⁶⁵ubWl⁸aS⁷waHJhc⁶UuemlwICRNT⁵RQQVRIL⁰N⁷c⁰RlbS³tZWRpYS³⁵aGVtZS³kZWZhdWx⁵L⁶NvbS⁷taXVpLnBocmFzZQoKTGlzdGJwPSIkKGltZSBsaXN⁵IC⁸zIHwgY⁰V⁵IC⁸kICcvJyAtZjEgfCBzZWQgLWUgJy³jb⁶⁵uaWZseXRlay⁷pbnB⁸dG⁸ldGhvZC⁷taXVpL⁶QnIC⁸lICcvY⁶³tLnNvaHUuaW⁷wdXRtZXRob⁶Quc⁶³nb⁰UueGlhb⁶⁸pL⁶QnIC⁸lICcvY⁶³tLmFuZHJvaWQuY⁰RzLm⁸vY⁶tpbWUvZCcgLWUgJy³jb⁶⁵uYmFpZHUuaW⁷wdXRfbWkvZCcgLWUgJy³jb⁶⁵ubWl⁸aS⁷zZWN⁸cml⁵eWlucHV⁵bWV⁵aG³kL⁶QnKSIKRHNvMT⁵wCgpmb⁰IgVmFraSBpbiAkTGlzdGJwOyBkbwoKRHNvMT⁵kKCgkRHNvMSArIDEpKQpbICIkRHNvMSIgPT⁵gMSBdICYmIEtleWs³Y⁶³tLnNvaHUuaW⁷wdXRtZXRob⁶Quc⁶³nb⁰UueGlhb⁶⁸pClsgIiREc⁶⁴xIiA³PSAyIF⁵gJiYgS⁶V⁷az⁸jb⁶⁵uYmFpZHUuaW⁷wdXRfbWkKWyAiJERzbzEiID⁵³IDMgXSAmJiBLZXlrPWNvbS⁷pZmx⁷dGVrLmlucHV⁵bWV⁵aG³kLm⁸pdWkKCmlmIFsgIiREc⁶⁴xIiAtbGUgMyBdO⁰RoZW⁹KVGhheXRoZSAiJEtleWsiICIkVmFraSIgIiRBUEsvY⁶³tLmFuZHJvaWQuc⁶V⁵dGluZ⁰MvY⁶xhc⁰NlcyovY⁶³tL⁶FuZHJvaWQvc⁶V⁵dGluZ⁰MvaW⁷wdXRtZXRob⁶QvKiIKVGhheXRoZSAiJEtleWsiICIkVmFraSIgIiRBUEsvY⁶³tLm⁸pdWkucGhyYXNlL⁶NsYXNzZXMqL⁶NvbS³taXVpL⁶lucHV⁵bWV⁵aG³kLyoiClRoYXl⁵aGUgIiRLZXlrIiAiJFZha⁶kiICcnJEFQSy⁴kbWl⁸aWsnc⁶VydmljZXMvY⁶xhc⁰NlcyovY⁶³tL⁶FuZHJvaWQvc⁶VydmVyLyonClRoYXl⁵aGUgIiRLZXlrIiAiJFZha⁶kiICcnJEFQSy⁴kbWl⁸aWsnZnJhbWV⁰b⁰JrL⁶NsYXNzZXMqL⁶FuZHJvaWQvaW⁷wdXRtZXRob⁶RzZXJ⁶aWNlL⁵lucHV⁵TWV⁵aG³kU⁶VydmljZUluamVjdG³yLnNtYWxpJwpmaQoKZG³uZQoKVnNtYWxpICcubWV⁵aG³kIHB⁸YmxpYyBzdGF⁵aWMgaXNNaXVpSW⁸lQm³⁵dG³tU⁰VwcG³ydCgpWicgXAonLmVuZCBtZXRob⁶QnIFwKJy⁷tZXRob⁶QgcHVibGljIHN⁵YXRpYyBpc⁵⁸pdWlJbWVCb⁰R⁵b⁶⁸TdXBwb⁰J⁵KClaCiAgICAucmVnaXN⁵ZXJzIDEKICAgIGNvbnN⁵LzQgdjAsIDB⁹MQogICAgcmV⁵dXJuIHYwCi⁷lbmQgbWV⁵aG³kJyBcCiIkQVBLL⁶NvbS⁷hbmRyb⁶lkLnNldHRpbmdzL⁶NsYXNzZXMqLyoiCmZp"

ui_print
ui_print2 "Đóng gói apk"
ui_print
# Đóng gói apk
Donggoi

for Bala in product vendor system_ext; do
[ -e $MODPATH/$Bala ] && cp -rf $MODPATH/$Bala $MODPATH/system
[ -e $MODPATH/$Bala ] && rm -fr $MODPATH/$Bala
done

if [ "$chinann" == 1 ] || [ "$chinann" == 4 ] || [ "$keyyyy" == 1 ];then
# Hệ thống mount
mrw
xoaodex="
/system/framework/arm
/system/framework/arm64
"

for fhbrfh in $xoaodex; do
rm -fr $fhbrfh 2>/dev/null
rm -fr $(magisk --path)/.magisk/mirror/system_root$fhbrfh 2>/dev/null
[ -e $fhbrfh ] && FREEZE $fhbrfh
done
mro
fi

if [ -e /system/framework/arm/boot-framework.art ];then
ui_print2 "Cảnh báo!"
ui_print
ui_print2 "Nếu bạn đang cài Safetynet"
ui_print
ui_print2 "Module đó sẽ bị tắt vì xung đột hệ thống."
ui_print
echo > /data/adb/modules/safetynet-fix/disable
echo "echo > /data/adb/modules/safetynet-fix/disable" >> $TMPDIR/post-fs-data.sh
fi

ui_print "  $(End_time)"
ui_print
## end of code
}

## Grant permission
set_permissions(){ 
set_perm_recursive $MODPATH 0 0 0755 0644 2>/dev/null
set_perm_recursive $MODPATH/system/bin 0 2000 0755 0755 2>/dev/null
}
