Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 322C0312171
	for <lists+linux-arm-msm@lfdr.de>; Sun,  7 Feb 2021 06:18:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229562AbhBGFSm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 7 Feb 2021 00:18:42 -0500
Received: from smtprelay0028.hostedemail.com ([216.40.44.28]:54954 "EHLO
        smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S229510AbhBGFSk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 7 Feb 2021 00:18:40 -0500
X-Greylist: delayed 662 seconds by postgrey-1.27 at vger.kernel.org; Sun, 07 Feb 2021 00:18:40 EST
Received: from smtprelay.hostedemail.com (10.5.19.251.rfc1918.com [10.5.19.251])
        by smtpgrave01.hostedemail.com (Postfix) with ESMTP id 9EF161813C177
        for <linux-arm-msm@vger.kernel.org>; Sun,  7 Feb 2021 05:07:40 +0000 (UTC)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
        by smtprelay03.hostedemail.com (Postfix) with ESMTP id A2B6A837F24A;
        Sun,  7 Feb 2021 05:06:57 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Spam-Summary: 50,3,0,,d41d8cd98f00b204,joe@perches.com,,RULES_HIT:41:355:379:599:968:973:982:988:989:1260:1261:1277:1311:1313:1314:1345:1359:1437:1515:1516:1518:1534:1542:1593:1594:1711:1730:1747:1777:1792:1801:2197:2199:2393:2504:2559:2562:2828:3138:3139:3140:3141:3142:3353:3622:3865:3866:3867:3870:3871:3872:3874:4250:4321:4605:5007:6119:7208:7652:7903:9113:9121:10004:10400:10848:11026:11232:11233:11657:11658:11783:11876:11914:12043:12294:12297:12346:12438:12555:12740:12895:12986:13439:13894:14181:14659:14721:21080:21221:21451:21611:21627:21740:21990:30054:30070:30091,0,RBL:none,CacheIP:none,Bayesian:0.5,0.5,0.5,Netcheck:none,DomainCache:0,MSF:not bulk,SPF:,MSBL:0,DNSBL:none,Custom_rules:0:0:0,LFtime:1,LUA_SUMMARY:none
X-HE-Tag: hat01_1d0aa7e275f3
X-Filterd-Recvd-Size: 3113
Received: from [192.168.1.159] (unknown [47.151.137.21])
        (Authenticated sender: joe@perches.com)
        by omf17.hostedemail.com (Postfix) with ESMTPA;
        Sun,  7 Feb 2021 05:06:55 +0000 (UTC)
Message-ID: <8943f0acd2944144b21b5796c07e79ff5e707aaf.camel@perches.com>
Subject: Re: [PATCH] drm/msm/dp: Add a missing semi-colon
From:   Joe Perches <joe@perches.com>
To:     Stephen Boyd <swboyd@chromium.org>,
        Rob Clark <robdclark@gmail.com>,
        Andrew Morton <akpm@linux-foundation.org>
Cc:     linux-kernel@vger.kernel.org, Sean Paul <sean@poorly.run>,
        Kuogee Hsieh <khsieh@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, Lee Jones <lee.jones@linaro.org>
Date:   Sat, 06 Feb 2021 21:06:54 -0800
In-Reply-To: <20210207041858.3317171-1-swboyd@chromium.org>
References: <20210207041858.3317171-1-swboyd@chromium.org>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sat, 2021-02-06 at 20:18 -0800, Stephen Boyd wrote:
> A missing semicolon here causes my external display to stop working.
> Indeed, missing the semicolon on the return statement leads to
> dp_panel_update_tu_timings() not existing because the compiler thinks
> it's part of the return statement of a void function, so it must not be
> important.
> 
>   $ ./scripts/bloat-o-meter before.o after.o
>   add/remove: 1/1 grow/shrink: 0/1 up/down: 7400/-7540 (-140)
>   Function                                     old     new   delta
>   dp_panel_update_tu_timings                     -    7400   +7400
>   _dp_ctrl_calc_tu.constprop                 18024   17900    -124
>   dp_panel_update_tu_timings.constprop        7416       -   -7416
>   Total: Before=54440, After=54300, chg -0.26%
> 
> Add a semicolon so this function works like it used to.
[]
> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
[]
> @@ -631,7 +631,7 @@ static void _dp_ctrl_calc_tu(struct dp_tu_calc_input *in,
>  
> 
>  	tu = kzalloc(sizeof(*tu), GFP_KERNEL);
>  	if (!tu)
> -		return
> +		return;
>  
> 
>  	dp_panel_update_tu_timings(in, tu);

Wow, that's really unfortunate that dp_panel_update_tu_timings
is also void.

Perhaps this as YA checkpatch warning:

---
 scripts/checkpatch.pl | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index 9a549b009d2f..6df13e5a1557 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -3674,6 +3674,12 @@ sub process {
 			}
 		}
 
+# check only a c90 keyword on the line (except else)
+		if ($sline =~ /^\+\s*($c90_Keywords)\s*$/ && $1 ne 'else') {
+			WARN("BARE_KEYWORD",
+				 "'$1' as the only word on a line is not good style\n" . $herecurr);
+		}
+
 # check multi-line statement indentation matches previous line
 		if ($perl_version_ok &&
 		    $prevline =~ /^\+([ \t]*)((?:$c90_Keywords(?:\s+if)\s*)|(?:$Declare\s*)?(?:$Ident|\(\s*\*\s*$Ident\s*\))\s*|(?:\*\s*)*$Lval\s*=\s*$Ident\s*)\(.*(\&\&|\|\||,)\s*$/) {


