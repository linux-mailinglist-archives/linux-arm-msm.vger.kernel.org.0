Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7AEB322E182
	for <lists+linux-arm-msm@lfdr.de>; Sun, 26 Jul 2020 19:00:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726427AbgGZRAz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 26 Jul 2020 13:00:55 -0400
Received: from asavdk4.altibox.net ([109.247.116.15]:51726 "EHLO
        asavdk4.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726042AbgGZRAz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 26 Jul 2020 13:00:55 -0400
Received: from ravnborg.org (unknown [188.228.123.71])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by asavdk4.altibox.net (Postfix) with ESMTPS id 62D19804D5;
        Sun, 26 Jul 2020 19:00:52 +0200 (CEST)
Date:   Sun, 26 Jul 2020 19:00:50 +0200
From:   Sam Ravnborg <sam@ravnborg.org>
To:     Douglas Anderson <dianders@chromium.org>
Cc:     Thierry Reding <thierry.reding@gmail.com>, robdclark@chromium.org,
        David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
        steev@kali.org, bjorn.andersson@linaro.org,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm: panel: simple: Delay HPD checking on
 boe_nv133fhm_n61 for 15 ms
Message-ID: <20200726170050.GB3275923@ravnborg.org>
References: <20200716132120.1.I01e738cd469b61fc9b28b3ef1c6541a4f48b11bf@changeid>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200716132120.1.I01e738cd469b61fc9b28b3ef1c6541a4f48b11bf@changeid>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=aP3eV41m c=1 sm=1 tr=0
        a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
        a=kj9zAlcOel0A:10 a=cm27Pg_UAAAA:8 a=e5mUnYsNAAAA:8
        a=HFeEii_lzHUU_VTM28UA:9 a=CjuIK1q_8ugA:10 a=xmb-EsYY8bH0VWELuYED:22
        a=Vxmtnl_E_bksehYqCbjh:22
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Jul 16, 2020 at 01:21:22PM -0700, Douglas Anderson wrote:
> On boe_nv133fhm_n62 (and presumably on boe_nv133fhm_n61) a scope shows
> a small spike on the HPD line right when you power the panel on.  The
> picture looks something like this:
> 
>          +--------------------------------------
>          |
>          |
>          |
> Power ---+
>                                            +---
>                                            |
>               ++                           |
>          +----+|                           |
> HPD -----+     +---------------------------+
> 
> So right when power is applied there's a little bump in HPD and then
> there's small spike right before it goes low.  The total time of the
> little bump plus the spike was measured on one panel as being 8 ms
> long.  The total time for the HPD to go high on the same panel was
> 51.2 ms, though the datasheet only promises it is < 200 ms.
> 
> When asked about this glitch, BOE indicated that it was expected and
> persisted until the TCON has been initialized.
> 
> If this was a real hotpluggable DP panel then this wouldn't matter a
> whole lot.  We'd debounce the HPD signal for a really long time and so
> the little blip wouldn't hurt.  However, this is not a hotpluggable DP
> panel and the the debouncing logic isn't needed and just shows down
> the time needed to get the display working.  This is why the code in
> panel_simple_prepare() doesn't do debouncing and just waits for HPD to
> go high once.  Unfortunately if we get unlucky and happen to poll the
> HPD line right at the spike we can try talking to the panel before
> it's ready.
> 
> Let's handle this situation by putting in a 15 ms prepare delay and
> decreasing the "hpd absent delay" by 15 ms.  That means:
> * If you don't have HPD hooked up at all you've still got the
>   hardcoded 200 ms delay.
> * If you've got HPD hooked up you will always wait at least 15 ms
>   before checking HPD.  The only case where this could be bad is if
>   the panel is sharing a voltage rail with something else in the
>   system and was already turned on long before the panel came up.  In
>   such a case we'll be delaying 15 ms for no reason, but it's not a
>   huge delay and I don't see any other good solution to handle that
>   case.
> 
> Even though the delay was measured as 8 ms, 15 ms was chosen to give a
> bit of margin.
> 
> Signed-off-by: Douglas Anderson <dianders@chromium.org>

Nice drawing and good explanation.
Applied to drm-misc-fixes.

	Sam

> ---
> I don't actually have a device in front of me that is exhibiting these
> problems.  I believe that it is only some devices and some of the
> time.  Still, this patch seems safe and seems likely to fix the issue
> given the scope shots.
> 
>  drivers/gpu/drm/panel/panel-simple.c | 16 +++++++++++++++-
>  1 file changed, 15 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
> index 88493538a147..046a06b55800 100644
> --- a/drivers/gpu/drm/panel/panel-simple.c
> +++ b/drivers/gpu/drm/panel/panel-simple.c
> @@ -1260,7 +1260,21 @@ static const struct panel_desc boe_nv133fhm_n61 = {
>  		.height = 165,
>  	},
>  	.delay = {
> -		.hpd_absent_delay = 200,
> +		/*
> +		 * When power is first given to the panel there's a short
> +		 * spike on the HPD line.  It was explained that this spike
> +		 * was until the TCON data download was complete.  On
> +		 * one system this was measured at 8 ms.  We'll put 15 ms
> +		 * in the prepare delay just to be safe and take it away
> +		 * from the hpd_absent_delay (which would otherwise be 200 ms)
> +		 * to handle this.  That means:
> +		 * - If HPD isn't hooked up you still have 200 ms delay.
> +		 * - If HPD is hooked up we won't try to look at it for the
> +		 *   first 15 ms.
> +		 */
> +		.prepare = 15,
> +		.hpd_absent_delay = 185,
> +
>  		.unprepare = 500,
>  	},
>  	.bus_format = MEDIA_BUS_FMT_RGB888_1X24,
> -- 
> 2.28.0.rc0.105.gf9edc3c819-goog
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
