Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 180091EA1EA
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Jun 2020 12:35:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725976AbgFAKfa (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 1 Jun 2020 06:35:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51182 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725925AbgFAKf3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 1 Jun 2020 06:35:29 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6EAE3C03E96F
        for <linux-arm-msm@vger.kernel.org>; Mon,  1 Jun 2020 03:35:28 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id h5so5032073wrc.7
        for <linux-arm-msm@vger.kernel.org>; Mon, 01 Jun 2020 03:35:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=3yMprJOB6nqOhrN9jr1CF0yapMmZvuaPTqFeKcrw+2Y=;
        b=fsw1L05Qz/4FDV8NzCwmgd24FTeN28K+QoS34P7sLlUDVcWvQzTF46QJ8D54tpZ+pK
         Zqru6wXiRVK45evrX8qENtf06g41rzGGo/nZeEobKUEe30CKm8I7EU4CbGx/ZEhbpRvR
         bnw7PX2ghTL7/gm7A3+DKDOCuFuxMWaKILZpTbWFeCrKIbr/hSd9LkAdZAcKb+l29KI9
         AQ6s7mglmQKCN6Us6VPNjmp8KvzLsRSMOMvO96k4bjlyfTc2VFdd7EJwbr4fTeunD47s
         5rVP4836MSuKRtKApwBdvlfDrWXWbgvbffz7Ntxi5Fehbr1btqKhIIdhHxMB9HRA51i+
         KspA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=3yMprJOB6nqOhrN9jr1CF0yapMmZvuaPTqFeKcrw+2Y=;
        b=Po5wQ1kXYZZWze3u2EPDhXRDrxn0llJ7yu7ni9uj/DBQ+gkWUTsjED/pTP7vnS1BR0
         UCorPDyB4/RE0qdKmjdokcQ15rKJjQDR5ojAMnw+LMQueu5I4uNN9nGGvVpEGkAwMYCS
         97HpndHNuzLSLCDJ+A9eKGFBYvki+hEefRFGqD7NxyDwQT5ZSJ8qw1sHdm19GDG+4WtB
         8LpyTGQP5aCmjsIW9ml0MzaMNPaLGwqzf9S2qRjhapAuA5kI/H8uE1f+Lmyemidite0v
         oCeHu/YrIQ6tpJ+QfqDqK1kPNknbJnQuIHm5Ki4maPW1rmXnKfnd5fu4dtShkDBHDBXX
         gS4A==
X-Gm-Message-State: AOAM531JXsqHXNKBLO57l5Cj4k5kCriLPAvkGP8/vETDVqI5c0MPfMoC
        T/hNsR3nJQPJxBtyiKXKRt4pbw==
X-Google-Smtp-Source: ABdhPJz1z5Xyl0EPe0FMzDrgOajVzdCQh/7ByOZrzFwdH9HFfHFURa8zQ834mH8R2xVkmWzkakVlyw==
X-Received: by 2002:a5d:4390:: with SMTP id i16mr20377364wrq.186.1591007727070;
        Mon, 01 Jun 2020 03:35:27 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net. [86.9.19.6])
        by smtp.gmail.com with ESMTPSA id i10sm4557577wrw.51.2020.06.01.03.35.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2020 03:35:26 -0700 (PDT)
Date:   Mon, 1 Jun 2020 11:35:24 +0100
From:   Daniel Thompson <daniel.thompson@linaro.org>
To:     Sam Ravnborg <sam@ravnborg.org>
Cc:     dri-devel@lists.freedesktop.org, Jingoo Han <jingoohan1@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Emil Velikov <emil.l.velikov@gmail.com>,
        Jonathan Corbet <corbet@lwn.net>,
        linux-arm-msm@vger.kernel.org, linux-pwm@vger.kernel.org,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Michael Hennerich <michael.hennerich@analog.com>,
        patches@opensource.cirrus.com,
        Support Opensource <support.opensource@diasemi.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Uwe Kleine-Konig <u.kleine-koenig@pengutronix.de>,
        Peter Ujfalusi <peter.ujfalusi@ti.com>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [PATCH v3 12/13] backlight: as3711_bl: introduce
 backlight_is_blank()
Message-ID: <20200601103524.7s6523ijpfqcolrm@holly.lan>
References: <20200601065207.492614-1-sam@ravnborg.org>
 <20200601065207.492614-13-sam@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200601065207.492614-13-sam@ravnborg.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Jun 01, 2020 at 08:52:06AM +0200, Sam Ravnborg wrote:
> Replaces the open-coded checks of the state, with the
> backlight_is_blank() helper. This increases readability
> of the code and aling the functionality across the drivers.
> 
> Futhermore drop the debug prints in update_status().
> If we need debug printing then we can add it to the backlight core.
> 
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>


> Cc: Lee Jones <lee.jones@linaro.org>
> Cc: Daniel Thompson <daniel.thompson@linaro.org>
> Cc: Jingoo Han <jingoohan1@gmail.com>
> Cc: Emil Velikov <emil.l.velikov@gmail.com>
> ---
>  drivers/video/backlight/as3711_bl.c | 8 +-------
>  1 file changed, 1 insertion(+), 7 deletions(-)
> 
> diff --git a/drivers/video/backlight/as3711_bl.c b/drivers/video/backlight/as3711_bl.c
> index 33f0f0f2e8b3..cc5628beaffd 100644
> --- a/drivers/video/backlight/as3711_bl.c
> +++ b/drivers/video/backlight/as3711_bl.c
> @@ -107,13 +107,7 @@ static int as3711_bl_update_status(struct backlight_device *bl)
>  	int brightness = bl->props.brightness;
>  	int ret = 0;
>  
> -	dev_dbg(&bl->dev, "%s(): brightness %u, pwr %x, blank %x, state %x\n",
> -		__func__, bl->props.brightness, bl->props.power,
> -		bl->props.fb_blank, bl->props.state);
> -
> -	if (bl->props.power != FB_BLANK_UNBLANK ||
> -	    bl->props.fb_blank != FB_BLANK_UNBLANK ||
> -	    bl->props.state & (BL_CORE_SUSPENDED | BL_CORE_FBBLANK))
> +	if (backlight_is_blank(bl))
>  		brightness = 0;
>  
>  	if (data->type == AS3711_BL_SU1) {
> -- 
> 2.25.1
> 
