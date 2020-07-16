Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2FAEA222F2E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Jul 2020 01:39:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726629AbgGPXjR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 16 Jul 2020 19:39:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48210 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726593AbgGPXjQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 16 Jul 2020 19:39:16 -0400
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com [IPv6:2607:f8b0:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 14F0FC08C5C0
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2020 16:39:16 -0700 (PDT)
Received: by mail-pl1-x643.google.com with SMTP id 72so4609831ple.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2020 16:39:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=9oHa47gfKI9QmR65SUF1rvQNADNvlDAdjFiIPSLoVXs=;
        b=dTIcNZ+11g5DyzH6w35LYiPWb05ksCqZzXOZ8J1YtKVqZFcgpHULXXEdduvwz4z0SB
         8hGqAqEKwXOY/i2HmMEEh5fwS6cVcpniahu0M9QvebNvhCqtOJZnYBWWWel5OqRB3/je
         vETEw/bMfmxaZ0BBXVQUZ6g8kdk2wpNEDU2VguAWoEXl9yrxeKgttVVUM/WY+LXSPQFd
         mWB7M0SuPkuwipFMzrD88MBcFbMgkC2YBf24wVaB4AX1gG8SJPeMZjhvkC0PGXwTBNHI
         aJ2PX6sUNJh1wWPAnmZh2ouO/BcuTwnDL0DHAf8R7T/0QCwCb94VAs7dWvogDDKvwl7f
         mmSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=9oHa47gfKI9QmR65SUF1rvQNADNvlDAdjFiIPSLoVXs=;
        b=Hp5UOjs5H7C/tUUBMQ/a2N5Jyuo5BbsHzt4cbVTZrhOufUEIULqKiTh+zP5NdFpqoR
         nUQinqJfpOj2UjBM3GUD1Wxv33WtP2Ism5fXlO1F5e3AM1nMNFl4UbWKBkUlNfJhnA1l
         s9GwmqnfGpzVnXfTld1CC/dftGRPaLP5+LAjUdkjZD6n9xZTcD6SjBwrDeVNlZGCgUIh
         oMeO6QFigHWmUlEnXU+rJO0TXyoaUesi+Wb+J4dX88ir4BGiP7+ysONg5vSCZwQeE0Ly
         BulNGgZYRk7mbUaHk+cX2Kx5rZ/EwEGT+kbegnPdQqbp8PZ9IoI5jo+TIcvvvlBBzHMo
         vuHw==
X-Gm-Message-State: AOAM530KtgpZx3msjTT/TH29ngZcqnXPr4CjBiT0Z4WYaggNh0KPwCse
        O8wPu+pGYZ9tE0lKnBiP6Q9YvA==
X-Google-Smtp-Source: ABdhPJx5eJ7MS/+h2zn9G2VhzGMPJCRL02QcLw0I/lSZZjkg4FKCzHEV01zXlnzNYk/7DL6hkv6Rqw==
X-Received: by 2002:a17:902:59c1:: with SMTP id d1mr5667786plj.78.1594942755392;
        Thu, 16 Jul 2020 16:39:15 -0700 (PDT)
Received: from yoga (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id t73sm5897854pfc.78.2020.07.16.16.39.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2020 16:39:14 -0700 (PDT)
Date:   Thu, 16 Jul 2020 16:39:12 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Douglas Anderson <dianders@chromium.org>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>, robdclark@chromium.org,
        steev@kali.org, linux-arm-msm@vger.kernel.org,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm: panel: simple: Delay HPD checking on
 boe_nv133fhm_n61 for 15 ms
Message-ID: <20200716233912.GA61202@yoga>
References: <20200716132120.1.I01e738cd469b61fc9b28b3ef1c6541a4f48b11bf@changeid>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200716132120.1.I01e738cd469b61fc9b28b3ef1c6541a4f48b11bf@changeid>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu 16 Jul 13:21 PDT 2020, Douglas Anderson wrote:

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

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

> Signed-off-by: Douglas Anderson <dianders@chromium.org>
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
