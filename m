Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 64123369519
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Apr 2021 16:50:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231478AbhDWOv1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 23 Apr 2021 10:51:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46826 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231274AbhDWOv1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 23 Apr 2021 10:51:27 -0400
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com [IPv6:2607:f8b0:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B915FC06174A
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Apr 2021 07:50:50 -0700 (PDT)
Received: by mail-oi1-x22f.google.com with SMTP id i81so49415421oif.6
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Apr 2021 07:50:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=f26salV1YONwthrr9i5IByzy2v+Ur3hR9OqqinAL1Ug=;
        b=HCf1U1iQ4B4smQ+qxODrbF29uSIY+cWfhHMTASKdmajsJcSAgNlRFEOv1jVm32LR9U
         xD3SoRkKn5gItx+pabT3s0MQCxRnKoJB0UeFiMWtWCT6hwOn8O971+5oBXnzU6sZbK+1
         cC6qa3DrbBxN5vceGGgMfKYcS8qNzxt6tZUYSGJmyweS4huG2zmNa1XlM1PW3Rl//kp8
         Qu5oYOGhNwlEhE7h/qNbgJrWY0He4thJKrqwfJXkcdOY9c1ALoxyN302hU9TU3cK7JWS
         so+f+n6rNIlRcOFcschbb95/pFDuqwPkpR/8bP1B/HlME1VAKv9/p3bxm52+RLmfevfV
         tBvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=f26salV1YONwthrr9i5IByzy2v+Ur3hR9OqqinAL1Ug=;
        b=pUnxXi7RChVZy41KxdnrYkwtjtFG6fSSNP8CHcQCO4/FfxUn8T9CPRkz3xiSCNUw9U
         8FzaveM4DTiY8sInm+i8jtpxFP3eFjIGZdPy1fmIZfHFEGYB/3kpITzazEKTkN1LhDwq
         nvCrIPzsvEfZgHVFE8nKAjJIjW31jJ9pS03QT6eS17MxuESzRDN5suIil5jDMO4TGQhA
         zUu7hallemtyUdFa0wrWt38ZetLwOJq89m2NlL2hAJRZRFhB85emhw8ktZLb/KJ9NGub
         2yg5JAU8QV9zhS99kW5jfE1LTglRCKOfc6WaBS8PCEc/jNJQgK60EXoOfi36LNUPZOyt
         6a2g==
X-Gm-Message-State: AOAM531huS0AZALeYK8YS4FpAgPl27naZ0LDi1SDRd1Crwje2VcSWqOX
        TW5EMSeYuo3OTwZV0oTvR7MCPg==
X-Google-Smtp-Source: ABdhPJyWTiOMQqGgTo0m+fFWWeOjgdIvyqP6jE16dXn/PMChAYrJ+ebmGllRDk6dz3Nt1YvTqqZ82g==
X-Received: by 2002:aca:dfc1:: with SMTP id w184mr3145515oig.79.1619189450134;
        Fri, 23 Apr 2021 07:50:50 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id l9sm1244933oog.32.2021.04.23.07.50.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Apr 2021 07:50:49 -0700 (PDT)
Date:   Fri, 23 Apr 2021 09:50:47 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Douglas Anderson <dianders@chromium.org>
Cc:     Andrzej Hajda <a.hajda@samsung.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Sam Ravnborg <sam@ravnborg.org>, Wolfram Sang <wsa@kernel.org>,
        Stephen Boyd <swboyd@chromium.org>, robdclark@chromium.org,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>,
        Steev Klimaszewski <steev@kali.org>,
        linux-arm-msm@vger.kernel.org, Linus W <linus.walleij@linaro.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Thierry Reding <thierry.reding@gmail.com>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 16/27] drm/panel: panel-simple: Get rid of hacky HPD
 chicken-and-egg code
Message-ID: <YILex5oaMUQy5zs/@builder.lan>
References: <20210416223950.3586967-1-dianders@chromium.org>
 <20210416153909.v4.16.I40eeedc23459d1e3fc96fa6cdad775d88c6e706c@changeid>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210416153909.v4.16.I40eeedc23459d1e3fc96fa6cdad775d88c6e706c@changeid>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri 16 Apr 17:39 CDT 2021, Douglas Anderson wrote:

> When I added support for the hpd-gpio to simple-panel in commit
> 48834e6084f1 ("drm/panel-simple: Support hpd-gpios for delaying
> prepare()"), I added a special case to handle a circular dependency I
> was running into on the ti-sn65dsi86 bridge chip. On my board the
> hpd-gpio is actually provided by the bridge chip. That was causing
> some circular dependency problems that I had to work around by getting
> the hpd-gpio late.
> 
> I've now reorganized the ti-sn65dsi86 bridge chip driver to be a
> collection of sub-drivers. Now the GPIO part can probe separately and
> that breaks the chain. Let's get rid of the old code to clean things
> up.
> 

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
> 
> (no changes since v1)
> 
>  drivers/gpu/drm/panel/panel-simple.c | 24 +++++-------------------
>  1 file changed, 5 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
> index 6b22872b3281..90a17ca79d06 100644
> --- a/drivers/gpu/drm/panel/panel-simple.c
> +++ b/drivers/gpu/drm/panel/panel-simple.c
> @@ -366,8 +366,7 @@ static int panel_simple_unprepare(struct drm_panel *panel)
>  	return 0;
>  }
>  
> -static int panel_simple_get_hpd_gpio(struct device *dev,
> -				     struct panel_simple *p, bool from_probe)
> +static int panel_simple_get_hpd_gpio(struct device *dev, struct panel_simple *p)
>  {
>  	int err;
>  
> @@ -375,17 +374,10 @@ static int panel_simple_get_hpd_gpio(struct device *dev,
>  	if (IS_ERR(p->hpd_gpio)) {
>  		err = PTR_ERR(p->hpd_gpio);
>  
> -		/*
> -		 * If we're called from probe we won't consider '-EPROBE_DEFER'
> -		 * to be an error--we'll leave the error code in "hpd_gpio".
> -		 * When we try to use it we'll try again.  This allows for
> -		 * circular dependencies where the component providing the
> -		 * hpd gpio needs the panel to init before probing.
> -		 */
> -		if (err != -EPROBE_DEFER || !from_probe) {
> +		if (err != -EPROBE_DEFER)
>  			dev_err(dev, "failed to get 'hpd' GPIO: %d\n", err);
> -			return err;
> -		}
> +
> +		return err;
>  	}
>  
>  	return 0;
> @@ -416,12 +408,6 @@ static int panel_simple_prepare_once(struct panel_simple *p)
>  		msleep(delay);
>  
>  	if (p->hpd_gpio) {
> -		if (IS_ERR(p->hpd_gpio)) {
> -			err = panel_simple_get_hpd_gpio(dev, p, false);
> -			if (err)
> -				goto error;
> -		}
> -
>  		if (p->desc->delay.hpd_absent_delay)
>  			hpd_wait_us = p->desc->delay.hpd_absent_delay * 1000UL;
>  		else
> @@ -682,7 +668,7 @@ static int panel_simple_probe(struct device *dev, const struct panel_desc *desc)
>  
>  	panel->no_hpd = of_property_read_bool(dev->of_node, "no-hpd");
>  	if (!panel->no_hpd) {
> -		err = panel_simple_get_hpd_gpio(dev, panel, true);
> +		err = panel_simple_get_hpd_gpio(dev, panel);
>  		if (err)
>  			return err;
>  	}
> -- 
> 2.31.1.368.gbe11c130af-goog
> 
