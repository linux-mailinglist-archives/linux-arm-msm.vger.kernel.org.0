Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E90243D6A5D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jul 2021 01:51:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234055AbhGZXKw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 26 Jul 2021 19:10:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46376 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233945AbhGZXKv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 26 Jul 2021 19:10:51 -0400
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com [IPv6:2607:f8b0:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E22BCC061760
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jul 2021 16:51:18 -0700 (PDT)
Received: by mail-oi1-x22a.google.com with SMTP id o185so12961648oih.13
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jul 2021 16:51:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=6Gx3kdJFNm/135gslaiOBYRLWUB5Dek5XFa229mUI8k=;
        b=jE3Q3MYLf8EehxqYQYMhN3W4udoK0AqV8y3DHFgmw3ceKxfLhUI71lkzfZrz+ljuKv
         vgdCCNqFN491gJMsmja2VQ+r3WokPgTpKxjj4V2QWxJYr3TqYRBEo+7b/DfhtpezmTih
         94hnhrJ86/UPMDU7prDAkEsDJ/9AFUY4mA4X0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=6Gx3kdJFNm/135gslaiOBYRLWUB5Dek5XFa229mUI8k=;
        b=XV2Qhaad2sPMBH7+1VvCWRKb1VTOh/R5+f3Wg3QYVyDjPRvYfEFS5szHzTO5Eu+YWm
         lbJA+UpRFUpvpTApt9C1XrDY+Y84FUE3sldGxwWpPHTBeLGBn3CP5csG/Ntr4GFcxZpe
         VxKxvcHO2qo9MG6ncq7BPh6yT7rZ9yk8UutpGsJRrUwHgkZfGANTII3126ijea0OGoeW
         +v2R5HiSjE2gJYp4aeaT3FNM4y4o//nh/pM3XTwOAvS/AF7bLRVBKisoAuwkdFiqnZMi
         w9U+oA4WIrN1QY22BDwfZo4gvwWOFJNdgaoM5smZIunosHIw92MkOWLEaQOZG+dHUsvg
         zUGA==
X-Gm-Message-State: AOAM5336t5DDD0vnfC7iciI92lwBAZGYAvD5cromyKUbsoNV18WHp+4B
        qS/n/mCkP1p9LfKHAMC6wLOa1bZvL5VzjFJIEnspJA==
X-Google-Smtp-Source: ABdhPJyR/hPMj/JBDgQ7Gosvnha3oraHTfsR7P5yO7OaGxEOEaPtHvNbLcPBMmuLS2GpEGUajwjsuJ8amjXs6GxaPP4=
X-Received: by 2002:a05:6808:114a:: with SMTP id u10mr13160515oiu.19.1627343478345;
 Mon, 26 Jul 2021 16:51:18 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 26 Jul 2021 19:51:17 -0400
MIME-Version: 1.0
In-Reply-To: <20210725042436.3967173-4-bjorn.andersson@linaro.org>
References: <20210725042436.3967173-1-bjorn.andersson@linaro.org> <20210725042436.3967173-4-bjorn.andersson@linaro.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Mon, 26 Jul 2021 19:51:17 -0400
Message-ID: <CAE-0n53k8k6jOmLDpUhKENP8jReodm8dMXG0U82HrnuSvaUouw@mail.gmail.com>
Subject: Re: [PATCH 3/5] drm/msm/dp: Support up to 3 DP controllers
To:     Abhinav Kumar <abhinavk@codeaurora.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Kalyan Thota <kalyan_t@codeaurora.org>,
        Kuogee Hsieh <khsieh@codeaurora.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
Cc:     Rob Herring <robh+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Bjorn Andersson (2021-07-24 21:24:33)
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index 59ffd6c8f41f..92b7646a1bb7 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -238,8 +251,11 @@ static int dp_display_bind(struct device *dev, struct device *master,
>         }
>
>         rc = dp_register_audio_driver(dev, dp->audio);
> -       if (rc)
> +       if (rc) {
>                 DRM_ERROR("Audio registration Dp failed\n");
> +               goto end;
> +       }
> +
>
>  end:
>         return rc;

This hunk looks useless. Drop it?

> @@ -1205,6 +1221,26 @@ int dp_display_request_irq(struct msm_dp *dp_display)
>         return 0;
>  }
>
> +static int dp_display_get_id(struct platform_device *pdev)
> +{
> +       const struct msm_dp_config *cfg = of_device_get_match_data(&pdev->dev);
> +       struct resource *res;
> +       int i;
> +
> +
> +       res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +       if (!res)
> +               return -EINVAL;
> +
> +       for (i = 0; i < cfg->num_dp; i++) {
> +               if (cfg->io_start[i] == res->start)
> +                       return i;
> +       }
> +
> +       dev_err(&pdev->dev, "unknown displayport instance\n");
> +       return -EINVAL;
> +}
> +
>  static int dp_display_probe(struct platform_device *pdev)
>  {
>         int rc = 0;
> @@ -1219,6 +1255,10 @@ static int dp_display_probe(struct platform_device *pdev)
>         if (!dp)
>                 return -ENOMEM;
>
> +       dp->id = dp_display_get_id(pdev);
> +       if (dp->id < 0)
> +               return -EINVAL;
> +
>         dp->pdev = pdev;
>         dp->name = "drm_dp";
>
> diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
> index e9232032b266..62d54ef6c2c4 100644
> --- a/drivers/gpu/drm/msm/msm_drv.h
> +++ b/drivers/gpu/drm/msm/msm_drv.h
> @@ -161,7 +161,7 @@ struct msm_drm_private {
>         /* DSI is shared by mdp4 and mdp5 */
>         struct msm_dsi *dsi[2];
>
> -       struct msm_dp *dp;
> +       struct msm_dp *dp[3];

It would be nice to either make this dynamically sized (probably little
gain), somehow make a BUILD_BUG_ON(), or have a WARN_ON if
ARRAY_SIZE(dp) is less than a num_dp so we know somebody messed up.
