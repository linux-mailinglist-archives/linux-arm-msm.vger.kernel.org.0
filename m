Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6F94B3696C0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Apr 2021 18:16:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231345AbhDWQRb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 23 Apr 2021 12:17:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38112 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229931AbhDWQRb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 23 Apr 2021 12:17:31 -0400
Received: from mail-oi1-x22b.google.com (mail-oi1-x22b.google.com [IPv6:2607:f8b0:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 63712C061574
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Apr 2021 09:16:53 -0700 (PDT)
Received: by mail-oi1-x22b.google.com with SMTP id u16so32359074oiu.7
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Apr 2021 09:16:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=nOQQqBqjHuvjx+mAlIOMyHNRurAecyF6kdkwHEmgzso=;
        b=tLZ9DmttTeYtxODA8GpoGJD3f0Haev5OEYxrAoEu5x/meFKNZ67Xrn6E7wBOaPuifI
         wNlvV52rK5Y2Mywj2ET9283Zs770zV7NHAs07XT9eYniS6gbUuIJBKyK+2B932VNi9sJ
         RcIF2vnKJocRtzBB+uIaJGPbfUfBTaB1x5X3zXN7rIb/K/+YrxSv76g7tdXH/v7NLeJF
         6y4fg0IDpP2fBw3zv4WDH7ovgaWgetiGIPsn2rRTZs8FHo9D9aURjU9P8iAYP8XWlk3D
         AZrQ1Qqx6AtlJhlZdjsp8KQVqUuo45eacaZnE1gjIqpoB6PNVJ3i1CYRPq5KNULETOPN
         QidQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=nOQQqBqjHuvjx+mAlIOMyHNRurAecyF6kdkwHEmgzso=;
        b=JVZJ+hXXnfcJP6+RVyRx2mP1TsnaFlOUe8dfGll9ceTMgDioYKHb6ErD8JgwYlb8le
         7n8rn0ynuSLZGUZfrTAzHE09xRa8Y1cJ1wt20ikK7uJBX77kVyW6To7ak01VwMWjaAYH
         TnutCQqgZI6/Y/Hx6logyyIrj3xcBw/NhAo3ZFMihPgiqLV2WfpDPnuFxOjne8pePeV9
         sPqZN+QZHlKRkH2e8wIClYDi8QNHv1GH+U7quVL9/82fVkmMIUyxZHIcgb6f/CH5Yvso
         pxxJW2rHPIYFRwtAWdtp4A+Mo0BefQhPE3Wf2DQp8uNLmKcHqSlBDBxlb6zlmyvCqOc5
         8XTg==
X-Gm-Message-State: AOAM533cKe1Zf10aI/H7DyRr4dQnoljFFY9NbaGEZjIvRNOXiz12ASXQ
        HszoSePX6vsNxliET6ZjnX2INg==
X-Google-Smtp-Source: ABdhPJyxj8Hhn+123lQ/JT8X7RLjGQCf0dKzpHIzSwezdnqt5VNuPgWlbYaErNniQIPS+VIKQ6Nmvg==
X-Received: by 2002:aca:db02:: with SMTP id s2mr4534138oig.100.1619194612825;
        Fri, 23 Apr 2021 09:16:52 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id h5sm1359874oth.20.2021.04.23.09.16.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Apr 2021 09:16:52 -0700 (PDT)
Date:   Fri, 23 Apr 2021 11:16:50 -0500
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
Subject: Re: [PATCH v4 27/27] drm/panel: panel-simple: Prepare/unprepare are
 refcounted, not forced
Message-ID: <YILy8jbYcwAt4Bqw@builder.lan>
References: <20210416223950.3586967-1-dianders@chromium.org>
 <20210416153909.v4.27.I502f2a92ddd36c3d28d014dd75e170c2d405a0a5@changeid>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210416153909.v4.27.I502f2a92ddd36c3d28d014dd75e170c2d405a0a5@changeid>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri 16 Apr 17:39 CDT 2021, Douglas Anderson wrote:

> Historically simple-panel had code to make sure that if prepare() was
> called on an already-prepared panel that it was a no-op. Similarly if
> unprepare() was called on an already-unprepared panel it was also a
> no-op. Essentially it means that these functions always "forced" the
> value to be whatever the caller wanted it to be. You can see that the
> forcing behavior dates back at least as far as 2014 by looking at
> commit 613a633e7a56 ("drm/panel: simple: Add proper definition for
> prepare and unprepare").
> 
> Apparently the code supporting the historical behavior may not be
> needed [1] and prepare() / unprepare() are supposed to be
> balanced. Let's try removing it and see if anyone breaks! If they do
> then we can have a debate about whether we should change that code or
> revert this patch. :-) If nobody breaks then we've nicely saved a few
> lines of code and some complexity.
> 
> [1] https://lore.kernel.org/r/YHePsQgqOau1V5lD@pendragon.ideasonboard.com
> 

Acked-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> Suggested-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
> 
> (no changes since v1)
> 
>  drivers/gpu/drm/panel/panel-simple.c | 14 --------------
>  1 file changed, 14 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
> index 5a2953c4ca44..a2c3008af7e5 100644
> --- a/drivers/gpu/drm/panel/panel-simple.c
> +++ b/drivers/gpu/drm/panel/panel-simple.c
> @@ -176,8 +176,6 @@ struct panel_simple {
>  	bool enabled;
>  	bool no_hpd;
>  
> -	bool prepared;
> -
>  	ktime_t prepared_time;
>  	ktime_t unprepared_time;
>  
> @@ -355,18 +353,12 @@ static int panel_simple_suspend(struct device *dev)
>  
>  static int panel_simple_unprepare(struct drm_panel *panel)
>  {
> -	struct panel_simple *p = to_panel_simple(panel);
>  	int ret;
>  
> -	/* Unpreparing when already unprepared is a no-op */
> -	if (!p->prepared)
> -		return 0;
> -
>  	pm_runtime_mark_last_busy(panel->dev);
>  	ret = pm_runtime_put_autosuspend(panel->dev);
>  	if (ret < 0)
>  		return ret;
> -	p->prepared = false;
>  
>  	return 0;
>  }
> @@ -475,18 +467,12 @@ static int panel_simple_prepare(struct drm_panel *panel)
>  	struct panel_simple *p = to_panel_simple(panel);
>  	int ret;
>  
> -	/* Preparing when already prepared is a no-op */
> -	if (p->prepared)
> -		return 0;
> -
>  	ret = pm_runtime_get_sync(panel->dev);
>  	if (ret < 0) {
>  		pm_runtime_put_autosuspend(panel->dev);
>  		return ret;
>  	}
>  
> -	p->prepared = true;
> -
>  	return 0;
>  }
>  
> -- 
> 2.31.1.368.gbe11c130af-goog
> 
