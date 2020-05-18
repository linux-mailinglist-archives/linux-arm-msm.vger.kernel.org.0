Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C05F81D7BE6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2020 16:55:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726918AbgEROzC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 18 May 2020 10:55:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33448 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726997AbgEROzB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 18 May 2020 10:55:01 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7EA6EC05BD09
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2020 07:55:01 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id l18so12231127wrn.6
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2020 07:55:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=sc8LZw1aFYMl/7VH0/CKYrILiudqiq2KGCatolX/Vlo=;
        b=xb+BHHLf1Tatfi2MNt/KTxXmOAgaTICpK/MatIHpslOb28JgiBQOS8/48GvZygyiOj
         gG4DOvymcf097FXDlRqK6LcZXodUXX202ht8WWJpqSJdUywvnzW9UwTh2L1SoER+d5KK
         qgIklbC6gwPC/eR3BYYS/F+cSbuMupDwpIbJlKBIPXhP9Apy+ZDZug4OQdT9y2e+alpN
         eyoR0GEuTULmbFUpZFsmvKYomsAxk7DRB1E2VMEVtq1HHKIJSNnIeWxaQr3W6J3QBILv
         jgnE4DBHlxfJNHfC/nZIeMCL3qAOnBpAVy9f2neAj3jFAvnfuzjCy4AbWAg72r/DdUG/
         k2cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=sc8LZw1aFYMl/7VH0/CKYrILiudqiq2KGCatolX/Vlo=;
        b=YIeYCH7D3F7dU9By0VOZtfeXSOq1N+H379Q2Pty0KYK0jik+a9yp9PPsYyhf0Os0Fs
         ZVWwtvFF2dA8tbvTdR2v6gT0IOn0Hyh3oKcqizvFPLuJokQncmVR7GLZ3Jydme9GHsrY
         80B1HfDwu5CkK5mUsTxjyrr746i5mxhFeb3I6EqnGyIBB2iL+Q369mNdWW+hYov2R+Gz
         o/rI6SgpVbnfqLRd9W0St8PKhYzeFAYmgfQDeYkvyiZm9HOLJKVyZtHx1f5kPIQsGCRO
         D4z2ccIxSJVnleKud8ieKxjsPImY3KOR02Qaa3tFXjIIj0fauVKIgwGM3H9TsPLtXeu4
         jjEA==
X-Gm-Message-State: AOAM531agDTStZNT8mseiewsSOnpdDBseK6auergiODLkID3Vmt9Ey4o
        ZUTaUeL/D65wIwlDsdJ8rWP3lQ==
X-Google-Smtp-Source: ABdhPJyQ+pvcK3hqQHdj+Yb7Twm2o3yI6kGnwEAvQE9nHPKDkHS5qu1gqYNSErT5DehDyzyl1UAQCA==
X-Received: by 2002:a5d:5607:: with SMTP id l7mr20630988wrv.370.1589813700229;
        Mon, 18 May 2020 07:55:00 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net. [86.9.19.6])
        by smtp.gmail.com with ESMTPSA id l19sm17377481wmj.14.2020.05.18.07.54.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2020 07:54:59 -0700 (PDT)
Date:   Mon, 18 May 2020 15:54:57 +0100
From:   Daniel Thompson <daniel.thompson@linaro.org>
To:     Sam Ravnborg <sam@ravnborg.org>
Cc:     dri-devel@lists.freedesktop.org, Jingoo Han <jingoohan1@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        Peter Ujfalusi <peter.ujfalusi@ti.com>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Andy Gross <agross@kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Douglas Anderson <dianders@chromium.org>,
        Jani Nikula <jani.nikula@intel.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-pwm@vger.kernel.org,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Michael Hennerich <michael.hennerich@analog.com>,
        patches@opensource.cirrus.com,
        Russell King <linux@armlinux.org.uk>,
        Support Opensource <support.opensource@diasemi.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Uwe Kleine-Konig <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH v2 02/16] backlight: refactor fb_notifier_callback()
Message-ID: <20200518145457.zonqhzkeybxdrq6b@holly.lan>
References: <20200517190139.740249-1-sam@ravnborg.org>
 <20200517190139.740249-3-sam@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200517190139.740249-3-sam@ravnborg.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sun, May 17, 2020 at 09:01:25PM +0200, Sam Ravnborg wrote:
> Increase readability of fb_notifier_callback() by removing
> a few indent levels.
> No functional change.
> 
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Lee Jones <lee.jones@linaro.org>
> Cc: Daniel Thompson <daniel.thompson@linaro.org>
> Cc: Jingoo Han <jingoohan1@gmail.com>

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>


> ---
>  drivers/video/backlight/backlight.c | 43 +++++++++++++++--------------
>  1 file changed, 22 insertions(+), 21 deletions(-)
> 
> diff --git a/drivers/video/backlight/backlight.c b/drivers/video/backlight/backlight.c
> index cac3e35d7630..17f04cff50ab 100644
> --- a/drivers/video/backlight/backlight.c
> +++ b/drivers/video/backlight/backlight.c
> @@ -58,28 +58,29 @@ static int fb_notifier_callback(struct notifier_block *self,
>  
>  	bd = container_of(self, struct backlight_device, fb_notif);
>  	mutex_lock(&bd->ops_lock);
> -	if (bd->ops)
> -		if (!bd->ops->check_fb ||
> -		    bd->ops->check_fb(bd, evdata->info)) {
> -			fb_blank = *(int *)evdata->data;
> -			if (fb_blank == FB_BLANK_UNBLANK &&
> -			    !bd->fb_bl_on[node]) {
> -				bd->fb_bl_on[node] = true;
> -				if (!bd->use_count++) {
> -					bd->props.state &= ~BL_CORE_FBBLANK;
> -					bd->props.fb_blank = FB_BLANK_UNBLANK;
> -					backlight_update_status(bd);
> -				}
> -			} else if (fb_blank != FB_BLANK_UNBLANK &&
> -				   bd->fb_bl_on[node]) {
> -				bd->fb_bl_on[node] = false;
> -				if (!(--bd->use_count)) {
> -					bd->props.state |= BL_CORE_FBBLANK;
> -					bd->props.fb_blank = fb_blank;
> -					backlight_update_status(bd);
> -				}
> -			}
> +
> +	if (!bd->ops)
> +		goto out;
> +	if (bd->ops->check_fb && !bd->ops->check_fb(bd, evdata->info))
> +		goto out;
> +
> +	fb_blank = *(int *)evdata->data;
> +	if (fb_blank == FB_BLANK_UNBLANK && !bd->fb_bl_on[node]) {
> +		bd->fb_bl_on[node] = true;
> +		if (!bd->use_count++) {
> +			bd->props.state &= ~BL_CORE_FBBLANK;
> +			bd->props.fb_blank = FB_BLANK_UNBLANK;
> +			backlight_update_status(bd);
> +		}
> +	} else if (fb_blank != FB_BLANK_UNBLANK && bd->fb_bl_on[node]) {
> +		bd->fb_bl_on[node] = false;
> +		if (!(--bd->use_count)) {
> +			bd->props.state |= BL_CORE_FBBLANK;
> +			bd->props.fb_blank = fb_blank;
> +			backlight_update_status(bd);
>  		}
> +	}
> +out:
>  	mutex_unlock(&bd->ops_lock);
>  	return 0;
>  }
> -- 
> 2.25.1
> 
