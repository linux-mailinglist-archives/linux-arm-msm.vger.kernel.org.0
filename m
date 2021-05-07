Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2019D3768F6
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 May 2021 18:40:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238354AbhEGQlQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 7 May 2021 12:41:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57394 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238330AbhEGQlK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 7 May 2021 12:41:10 -0400
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 79602C061574
        for <linux-arm-msm@vger.kernel.org>; Fri,  7 May 2021 09:40:09 -0700 (PDT)
Received: by mail-wr1-x434.google.com with SMTP id a4so9918223wrr.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 07 May 2021 09:40:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=4CPL9h5x73Ann+qEMsFApvYh7VXBIJ0G23zuIDn8I8U=;
        b=t1PyZwNJLMv1CVdAjugYlsAJBVrx49OS6K0/fhwHP+SgVoCj6/CtKIWcs0leAN6bbC
         2tWxTB6cCQQfV0QfmkzTHI6G5AuKBm18CgLNCLd+Yy8ur6+yl1RNSo7sABmcz1k4yjvL
         oFy5G5QK/YIm/Bz0EZvX89gSPE8M05mgMRjaWomy0pBWUxyf7Jjv2lm6TbWTFD5+THrf
         bta6ged9xZpO2CCHYUbhG+g6vrfY1PNmecBSldEFehVe0lTqWreD/z8+deYvc5DJkahz
         BYcC82VQmSvOzwm47t1p6r+17dJUs7Y2nw6c5xCaslmByqk8ggMFjZ2tehIY70T5kLrR
         /SVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4CPL9h5x73Ann+qEMsFApvYh7VXBIJ0G23zuIDn8I8U=;
        b=Xg3+ziImvkNClzcUMmtiaumnu4yElUKMj9TVCmuRLkEO1qxSeVA+TWYnYYiSNLODlk
         NwW7IPjR+1j/BLQDhd+pPk8f/f9qhh0S1K5N91vLiYrPZRaGYZ+Nq+/NkBee74OlyiAI
         QFTB//sj7Yfth7tPTZb4+m+JK3ST8MKFg/22qU+KHsqrd8urBZgbJJvI1wly6ioZnmgp
         YauN8bi7Blb22fDmmPrortqD8O9fd9NrGNWDI7LmfASHjOb8fJNNZjzuUlZKzHm8LQSE
         bLugZ/FSJCzmVoyPpDZwamCJVfqf4Qh+HMHnat1XJuwXAGd+4wX9a1pvmdgNbZjIQdF1
         MC0Q==
X-Gm-Message-State: AOAM5324+YfuFbI8LjRcbsbyY65jqfCe+L7k42SGG53rFwk/+ppvT/Uw
        itFWg5nR/OQNBiFvPGKVb/cJotI9CUbJD7ofC+w=
X-Google-Smtp-Source: ABdhPJy/CbdmIsf9tcYDuxSphsOaELuRqHDDX3ibDwIcYNNk/6Zcf87iyHOMtlu2NSlD5XV+ynLnOr/toQ8iwy97/rA=
X-Received: by 2002:adf:e510:: with SMTP id j16mr13847766wrm.28.1620405608069;
 Fri, 07 May 2021 09:40:08 -0700 (PDT)
MIME-Version: 1.0
References: <20210507141651.2887-1-sean@poorly.run>
In-Reply-To: <20210507141651.2887-1-sean@poorly.run>
From:   Rob Clark <robdclark@gmail.com>
Date:   Fri, 7 May 2021 09:43:48 -0700
Message-ID: <CAF6AEGutiv+0QMNo6QQ8jSDYwxhJ5+62_TZ5zsiT_WxgDm+JiA@mail.gmail.com>
Subject: Re: [PATCH] drm/msm: Fix uninitialized var usage in dsi_phy_28nm_8960.c
To:     Sean Paul <sean@poorly.run>
Cc:     dri-devel <dri-devel@lists.freedesktop.org>,
        Sean Paul <seanpaul@chromium.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        Rob Clark <robdclark@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        freedreno <freedreno@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, May 7, 2021 at 7:16 AM Sean Paul <sean@poorly.run> wrote:
>
> From: Sean Paul <seanpaul@chromium.org>
>
> This patch fixes the following error:
>
> drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c:425:11: error: variable 'parent_name' is uninitialized when used here
> [-Werror,-Wuninitialized]
>         snprintf(parent_name, 32, "dsi%dvco_clk", pll_28nm->phy->id);
>                  ^~~~~~~~~~~
> drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c:385:30:
> note: initialize the variable 'parent_name' to silence this warning
>         char *clk_name, *parent_name, *vco_name;
>                                     ^
>                                      = NULL
> 1 error generated.
> make[5]: ***
> [scripts/Makefile.build:279: drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.o] Error 1
>
> It looks like the allocation was inadvertently deleted.
>
> Fixes: 5d13459650b3 ("drm/msm/dsi: push provided clocks handling into a generic code")
>
> Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Cc: Stephen Boyd <swboyd@chromium.org>
> Cc: Abhinav Kumar <abhinavk@codeaurora.org>
> Cc: Rob Clark <robdclark@chromium.org>
> Signed-off-by: Sean Paul <seanpaul@chromium.org>

Thanks, I'll pick this up for next -fixes pr

BR,
-R

> ---
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c
> index 582b1428f971..86e40a0d41a3 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c
> @@ -405,6 +405,10 @@ static int pll_28nm_register(struct dsi_pll_28nm *pll_28nm, struct clk_hw **prov
>         if (!vco_name)
>                 return -ENOMEM;
>
> +       parent_name = devm_kzalloc(dev, 32, GFP_KERNEL);
> +       if (!parent_name)
> +               return -ENOMEM;
> +
>         clk_name = devm_kzalloc(dev, 32, GFP_KERNEL);
>         if (!clk_name)
>                 return -ENOMEM;
> --
> Sean Paul, Software Engineer, Google / Chromium OS
>
