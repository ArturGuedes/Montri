#!/usr/bin/perl

use Language;
%txt = %Language::pt_br;


sub notify {
    print "NOTIFICATION:@_[0]\n";
}
sub actionShow {
    system("defaults write com.apple.finder AppleShowAllFiles -bool true");
    system("killall Finder");
    notify("$txt{msgshow}");
}

sub actionHide {
    system("defaults write com.apple.finder AppleShowAllFiles -bool false");
    system("killall Finder");
    notify("$txt{msghide}");
}

sub actionAbout {
    print "ALERT:Montri|$txt{msgabout}\n";
}

sub actionPage {
    system("open https://github.com/ArturGuedes/Montri");
}



if (!scalar(@ARGV)) {
    print "$txt{show}\n";
    print "$txt{hide}\n";
    print "----\n";
    print "SUBMENU|$txt{help}|$txt{about}|$txt{page}\n";
} else {
    sub get {
        if($ARGV[0] eq "$txt{@_[0]}"){
            return 1;
        }
    }
    
    if(get("show")){
        actionShow;
    }
    if(get("hide")){
        actionHide;
    }
    if(get("about")){
        actionAbout;
    }
    if(get("page")){
        actionPage;
    }
}