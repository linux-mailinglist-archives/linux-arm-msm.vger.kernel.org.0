Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 33A357563F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jul 2019 19:51:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726543AbfGYRvv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 25 Jul 2019 13:51:51 -0400
Received: from mail-ed1-f68.google.com ([209.85.208.68]:41839 "EHLO
        mail-ed1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725808AbfGYRvv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 25 Jul 2019 13:51:51 -0400
Received: by mail-ed1-f68.google.com with SMTP id p15so50968824eds.8;
        Thu, 25 Jul 2019 10:51:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=97fri+3r1FAcvuw8LVzrovOMIcXnR72VCH8YJtIr1e4=;
        b=uHKrJgmwlIqEoDxjOTUzBLc9kAllmjkLF55HjS+IWQAUT2Hmn5Bf6fgZMGGw8zO44i
         RGnxbfYx6wMkmks5bSIN4Ir+PC8ozBlGTduhMNEdOcCie0+rd7bHsAt94tSG23hM0aft
         TO0m37zjBXbWRnzJZOQ4WxHjZ2XnGjVso0jvTmuP7mIBFHcdsCUyxyB+WwE6anT9Mfi8
         0gBNq6eBMd3Y8OAmvgMo7vOIRTWLzOSXPJBvQN6ktPLPi5New4ARNM6lAeL4poBe/xGi
         8TGHofNVbm8q7vWoU/c2AmvuOW/95bnbWtut38SEXw2n+wMe2GokuZzwkKnm61QvBa+3
         3W6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=97fri+3r1FAcvuw8LVzrovOMIcXnR72VCH8YJtIr1e4=;
        b=Yre61KuH3oi84YFLl6dwuShKOSEDn/2skmKXpOW0HB1X/+UMFbLhjm61wxxvnOx9z8
         lEMqBd/O53z/koDaKI2EF02BSeU8NqvGvW25oguC2XbAanA+SFQniBBh74JYbtnEEfCS
         Q7abhGzhntvBxIlaTIGvhGFy/BmCEuUvLeHWsGfP7nAT6/RHlO5HCo1oyDBMpUg8b/rM
         flteSXfpQPi44KD2nRj6eF4WpDvUZ1kiUN8HIK8JbLErDbiaypKfb2oVEd8svynumRie
         ju480BevwFELwhg1wNpbPbnjtoNIB3AyzP1JRjtwDX1dwSfy2LvtriSt0p/8aZqr5+uu
         lvuQ==
X-Gm-Message-State: APjAAAX6vv9Yi1h4JV/mMt/zWUP/X2YH7FkCfho5NY1ALG13xetGO8hI
        wKhjE3O9BMKLxW+ryyoV/tmcZoboMV4fsfKrpKHb4sUY
X-Google-Smtp-Source: APXvYqx2kvyqKBVqw6NG0DNxrRYhDsWU4ao7mYS8G/wN3qwn0j5rHe8GcTS1YqPynQt7nyC73VUNukd1Q0EcQMrO0Qs=
X-Received: by 2002:a50:9177:: with SMTP id f52mr78488871eda.294.1564077109052;
 Thu, 25 Jul 2019 10:51:49 -0700 (PDT)
MIME-Version: 1.0
References: <1564073635-27998-1-git-send-email-jcrouse@codeaurora.org>
In-Reply-To: <1564073635-27998-1-git-send-email-jcrouse@codeaurora.org>
From:   Rob Clark <robdclark@gmail.com>
Date:   Thu, 25 Jul 2019 10:51:38 -0700
Message-ID: <CAF6AEGvGWWZz718AAyQmKr7fVoi4EU_tj6xVC7JsvfY+ZvMO0Q@mail.gmail.com>
Subject: Re: [PATCH] drm/msm: Use generic bulk clock function
To:     Jordan Crouse <jcrouse@codeaurora.org>
Cc:     freedreno <freedreno@lists.freedesktop.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Sean Paul <sean@poorly.run>,
        Stephen Boyd <swboyd@chromium.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Sharat Masetty <smasetty@codeaurora.org>,
        Andy Gross <andy.gross@linaro.org>,
        Douglas Anderson <dianders@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Mamta Shukla <mamtashukla555@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Jul 25, 2019 at 9:54 AM Jordan Crouse <jcrouse@codeaurora.org> wrote:
>
> Remove the homebrewed bulk clock get function and replace it with
> devm_clk_bulk_get_all().
>
> Signed-off-by: Jordan Crouse <jcrouse@codeaurora.org>

nice cleanup

Reviewed-by: Rob Clark <robdclark@gmail.com>

> ---
>
>  drivers/gpu/drm/msm/adreno/a6xx_gmu.c |  2 +-
>  drivers/gpu/drm/msm/msm_drv.c         | 40 -----------------------------------
>  drivers/gpu/drm/msm/msm_drv.h         |  1 -
>  drivers/gpu/drm/msm/msm_gpu.c         |  2 +-
>  4 files changed, 2 insertions(+), 43 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> index 2ca470e..85f14fe 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> @@ -1172,7 +1172,7 @@ static int a6xx_gmu_pwrlevels_probe(struct a6xx_gmu *gmu)
>
>  static int a6xx_gmu_clocks_probe(struct a6xx_gmu *gmu)
>  {
> -       int ret = msm_clk_bulk_get(gmu->dev, &gmu->clocks);
> +       int ret = devm_clk_bulk_get_all(gmu->dev, &gmu->clocks);
>
>         if (ret < 1)
>                 return ret;
> diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
> index 0e0fca1..96fe24c 100644
> --- a/drivers/gpu/drm/msm/msm_drv.c
> +++ b/drivers/gpu/drm/msm/msm_drv.c
> @@ -75,46 +75,6 @@ module_param(modeset, bool, 0600);
>   * Util/helpers:
>   */
>
> -int msm_clk_bulk_get(struct device *dev, struct clk_bulk_data **bulk)
> -{
> -       struct property *prop;
> -       const char *name;
> -       struct clk_bulk_data *local;
> -       int i = 0, ret, count;
> -
> -       count = of_property_count_strings(dev->of_node, "clock-names");
> -       if (count < 1)
> -               return 0;
> -
> -       local = devm_kcalloc(dev, sizeof(struct clk_bulk_data *),
> -               count, GFP_KERNEL);
> -       if (!local)
> -               return -ENOMEM;
> -
> -       of_property_for_each_string(dev->of_node, "clock-names", prop, name) {
> -               local[i].id = devm_kstrdup(dev, name, GFP_KERNEL);
> -               if (!local[i].id) {
> -                       devm_kfree(dev, local);
> -                       return -ENOMEM;
> -               }
> -
> -               i++;
> -       }
> -
> -       ret = devm_clk_bulk_get(dev, count, local);
> -
> -       if (ret) {
> -               for (i = 0; i < count; i++)
> -                       devm_kfree(dev, (void *) local[i].id);
> -               devm_kfree(dev, local);
> -
> -               return ret;
> -       }
> -
> -       *bulk = local;
> -       return count;
> -}
> -
>  struct clk *msm_clk_bulk_get_clock(struct clk_bulk_data *bulk, int count,
>                 const char *name)
>  {
> diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
> index ee7b512..843c68f 100644
> --- a/drivers/gpu/drm/msm/msm_drv.h
> +++ b/drivers/gpu/drm/msm/msm_drv.h
> @@ -399,7 +399,6 @@ static inline void msm_perf_debugfs_cleanup(struct msm_drm_private *priv) {}
>  #endif
>
>  struct clk *msm_clk_get(struct platform_device *pdev, const char *name);
> -int msm_clk_bulk_get(struct device *dev, struct clk_bulk_data **bulk);
>
>  struct clk *msm_clk_bulk_get_clock(struct clk_bulk_data *bulk, int count,
>         const char *name);
> diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
> index 4edb874..445a9f8 100644
> --- a/drivers/gpu/drm/msm/msm_gpu.c
> +++ b/drivers/gpu/drm/msm/msm_gpu.c
> @@ -783,7 +783,7 @@ static irqreturn_t irq_handler(int irq, void *data)
>
>  static int get_clocks(struct platform_device *pdev, struct msm_gpu *gpu)
>  {
> -       int ret = msm_clk_bulk_get(&pdev->dev, &gpu->grp_clks);
> +       int ret = devm_clk_bulk_get_all(&pdev->dev, &gpu->grp_clks);
>
>         if (ret < 1) {
>                 gpu->nr_clocks = 0;
> --
> 2.7.4
>
