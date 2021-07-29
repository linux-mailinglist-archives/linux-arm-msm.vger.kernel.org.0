Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7951C3DA783
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Jul 2021 17:24:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237846AbhG2PY6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 29 Jul 2021 11:24:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46480 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238020AbhG2PXV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 29 Jul 2021 11:23:21 -0400
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 281B4C0613D3;
        Thu, 29 Jul 2021 08:23:17 -0700 (PDT)
Received: by mail-wm1-x332.google.com with SMTP id l4-20020a05600c1d04b02902506f89ad2dso5975353wms.1;
        Thu, 29 Jul 2021 08:23:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=rBpQQ4PrkRZY0WtM7KbjU/FjfELe0vopn+N+lTuqMUk=;
        b=Dr+kc8ks6iyXT9LWSb5Du3HdAHPz7RDalBOKm0Og6v/tOp9R0FVfTLQLEb6YjgcFAZ
         OODEOtCXWQbWffIcrKm4DBgFkXgZzYwHrt+TnvY8sHMYbODXN5+AC287YYQ1Ml2myFyc
         lrSos/ncgWbQkBjX/3rJpjjDb/w6OxPEEKcNHNnikoGDo+nLRGD2Lw+wleq+XK+7sWBw
         xn+dBHPBJMl5k0iAstt3pf8RPQLevB6s/P7bjl/Cxbw+u1yMBrE24gQMmZmmeVacKJeS
         a5VfkAXtDy6sJ6hPFJv0pet+bPSamucYCLdgJS/zhsmD74VZ85w4fHPzJiF4Ge1OKqbA
         dyDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rBpQQ4PrkRZY0WtM7KbjU/FjfELe0vopn+N+lTuqMUk=;
        b=AC/GqKdxpMX74r0opqPEx49hHRW1AKZL3PWeD6PCGT42KhhUyt2hHkFNBf1Hg26AdX
         /OrOEaZjqbR5Tz42pXdXCzXv/BpfkHYYM2E3rZmH81ivBd8gc+o4bPBpu3t+Jw9Q/Ijt
         ITYOSUWntHJK6mj9eOBlA+eWiN7Yqt5xzQ1IH79W5Rbuh/NsFNNGuc/ef5AIi755Gy6o
         jg1JOkNkkHkwZjxBWgFS86DfrMsP43J15lOIu7K0z9NCGpmjgsX+6tFG95VgEx61Y5ZL
         9tloEcabfJzHBJywkFqGKFr7mC2+4OhN/yvi1NnJUh6ieH6x6VbnsUSRptMnFc+RXslN
         Ax5A==
X-Gm-Message-State: AOAM530qMHgLVVSzaaAJrERTs4c5hOVgv9rYEQofvZGWEEzL9A24zMcC
        zbm2/8/V8ACdJj7W8B44BoBegxNSRRyo79hEXs8=
X-Google-Smtp-Source: ABdhPJxzPEUgqOVmodbHdeZsVfk006v7VDK8qP5MqAnzI/Dj02PkT1mP2Sz1xjDX1yMh4Lyhth6wY2YnuSQUJxmpC8s=
X-Received: by 2002:a05:600c:4401:: with SMTP id u1mr15603401wmn.49.1627572195705;
 Thu, 29 Jul 2021 08:23:15 -0700 (PDT)
MIME-Version: 1.0
References: <20210729200230.v2.1.I110b87677ef16d97397fb7c81c07a16e1f5d211e@changeid>
 <20210729200230.v2.2.I286ef007fcadd9e6ee3b2c0ad948f990735f9610@changeid>
In-Reply-To: <20210729200230.v2.2.I286ef007fcadd9e6ee3b2c0ad948f990735f9610@changeid>
From:   Rob Clark <robdclark@gmail.com>
Date:   Thu, 29 Jul 2021 08:27:25 -0700
Message-ID: <CAF6AEGtv0R=SjwpV7NEX6-4sHTF_CxbqgFXNWN+PT9hJJb7N2A@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] drm/msm/a6xx: Use rev to identify SKU
To:     Akhil P Oommen <akhilpo@codeaurora.org>
Cc:     freedreno <freedreno@lists.freedesktop.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        Matthias Kaehlcke <mka@chromium.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Douglas Anderson <dianders@chromium.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Sean Paul <sean@poorly.run>,
        Sharat Masetty <smasetty@codeaurora.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Jul 29, 2021 at 7:33 AM Akhil P Oommen <akhilpo@codeaurora.org> wrote:
>
> Use rev instead of revn to identify the SKU. This is in
> preparation to the introduction of 7c3 gpu which won't have a
> revn.
>
> Signed-off-by: Akhil P Oommen <akhilpo@codeaurora.org>
> ---
>
> (no changes since v1)
>
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 11 +++++------
>  1 file changed, 5 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> index 183b9f9..0da1a66 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -1675,11 +1675,11 @@ static u32 a618_get_speed_bin(u32 fuse)
>         return UINT_MAX;
>  }
>
> -static u32 fuse_to_supp_hw(struct device *dev, u32 revn, u32 fuse)
> +static u32 fuse_to_supp_hw(struct device *dev, struct adreno_rev rev, u32 fuse)
>  {
>         u32 val = UINT_MAX;
>
> -       if (revn == 618)
> +       if (adreno_cmp_rev(ADRENO_REV(6, 1, 8, ANY_ID), rev))

Looks like adreno_cmp_rev() ended up in patch 3/3 when it should have
been in this patch..

But I guess we could also move this into adreno_is_a618() and use that here

BR,
-R

>                 val = a618_get_speed_bin(fuse);
>
>         if (val == UINT_MAX) {
> @@ -1692,8 +1692,7 @@ static u32 fuse_to_supp_hw(struct device *dev, u32 revn, u32 fuse)
>         return (1 << val);
>  }
>
> -static int a6xx_set_supported_hw(struct device *dev, struct a6xx_gpu *a6xx_gpu,
> -               u32 revn)
> +static int a6xx_set_supported_hw(struct device *dev, struct adreno_rev rev)
>  {
>         u32 supp_hw = UINT_MAX;
>         u16 speedbin;
> @@ -1714,7 +1713,7 @@ static int a6xx_set_supported_hw(struct device *dev, struct a6xx_gpu *a6xx_gpu,
>         }
>         speedbin = le16_to_cpu(speedbin);
>
> -       supp_hw = fuse_to_supp_hw(dev, revn, speedbin);
> +       supp_hw = fuse_to_supp_hw(dev, rev, speedbin);
>
>  done:
>         ret = devm_pm_opp_set_supported_hw(dev, &supp_hw, 1);
> @@ -1785,7 +1784,7 @@ struct msm_gpu *a6xx_gpu_init(struct drm_device *dev)
>
>         a6xx_llc_slices_init(pdev, a6xx_gpu);
>
> -       ret = a6xx_set_supported_hw(&pdev->dev, a6xx_gpu, info->revn);
> +       ret = a6xx_set_supported_hw(&pdev->dev, config->rev);
>         if (ret) {
>                 a6xx_destroy(&(a6xx_gpu->base.base));
>                 return ERR_PTR(ret);
> --
> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
> of Code Aurora Forum, hosted by The Linux Foundation.
>
