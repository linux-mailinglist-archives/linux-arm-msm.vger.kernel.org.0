Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6922C11773A
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Dec 2019 21:18:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726495AbfLIUSG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 9 Dec 2019 15:18:06 -0500
Received: from mail-ed1-f66.google.com ([209.85.208.66]:46764 "EHLO
        mail-ed1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726335AbfLIUSG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 9 Dec 2019 15:18:06 -0500
Received: by mail-ed1-f66.google.com with SMTP id m8so13822110edi.13;
        Mon, 09 Dec 2019 12:18:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=h2yqKOxOZBGE0XueAD5uhzXamZSICOv0vTonYy2m++Q=;
        b=SMQVSBiO2u7Fb5SpKffbCQvDZoPGHmi8wphxbwhMj4d0exd0owRkFxjpbTAwhxstzL
         PcIqghdn1ODiO38nNuxtULQ7kFYYBtlB4UTyHkeimMxte1v13RifPXHF6Vz93hb0dFTw
         ACxTBwDk8OuONNYiGCvtzif1RaZYg6S7no/8ZJr5Rtc1NyHshQ5O/L2XC5w4rsN5cuOy
         UmKUxOyzzh5Jwd2hdRRUhb01wcNmbvrXenst78KwnqSGgdt5W+GEltl7u0owv/ScCOCc
         B4cTZ0FbsZYQyOxRmVL59rrJqlBH7ff3R9ppLQRI0qy+wMia4LChmaIREb9OZJijeQKk
         TtTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=h2yqKOxOZBGE0XueAD5uhzXamZSICOv0vTonYy2m++Q=;
        b=gIU3oj2OxQrVgLWRiYGAQdHX2BvrwSE44DH5ctzFu2Ywy1Jh2K44Zcuc936dOFIRu9
         2YCw6qXq8Kvs163GFw3xKtl89hdJGg+xaHODKlCzFeZ6hZR3rZiB0C4y7sA3KYGeOc6W
         P5yWgDFUke6lTc0/2dLh8HTDCbKefoND5PRgyIy/AoFcoXbXqbGAOueBV2ScH9gBiR/6
         I6dgEAgTpU3jUQy42eoli7YfKtX/H4Sacc4WDi2MVzMNrnuUbnxX5V2WUQAYjmU4Wnqs
         Je1tN1LEOxyixenftc9RTjgt0TAlg6qYDHt9i/tJhiiPBYCHaDWf39D5/9u7JUlFCC4q
         Fuww==
X-Gm-Message-State: APjAAAVlaHkJkytcvYCAtNGfjX1o0PQ/wKl54cyxhD1IvUWJc7D5Slw6
        wQQ4UfSOGO/dm2LjTG9skkQC2MZgulV1FPKpteI=
X-Google-Smtp-Source: APXvYqxJoAfWGwg6T+oY0GTnfrw6XGw523tgFtibpXV6QP979ZIcnXwmJaPC+BaZ7VZ5Fotc0CennR+6m2o6cXTwAmY=
X-Received: by 2002:a17:906:34d7:: with SMTP id h23mr33858892ejb.90.1575922684081;
 Mon, 09 Dec 2019 12:18:04 -0800 (PST)
MIME-Version: 1.0
References: <1574465484-7115-1-git-send-email-jcrouse@codeaurora.org> <0101016e95754ea7-d6414f4c-9e25-4bc4-a852-7116a783bf63-000000@us-west-2.amazonses.com>
In-Reply-To: <0101016e95754ea7-d6414f4c-9e25-4bc4-a852-7116a783bf63-000000@us-west-2.amazonses.com>
From:   Rob Clark <robdclark@gmail.com>
Date:   Mon, 9 Dec 2019 12:17:53 -0800
Message-ID: <CAF6AEGuchn7fa+8j45sCH7Sd2_dz5WokeeinR8RYr8xvY4Uq+g@mail.gmail.com>
Subject: Re: [PATCH v2 7/8] drm/msm/a6xx: Support split pagetables
To:     Jordan Crouse <jcrouse@codeaurora.org>
Cc:     "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>, Joerg
        Roedel <joro@8bytes.org>," <iommu@lists.linux-foundation.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Will Deacon <will@kernel.org>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Sean Paul <sean@poorly.run>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        David Airlie <airlied@linux.ie>,
        freedreno <freedreno@lists.freedesktop.org>,
        Mamta Shukla <mamtashukla555@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Nov 22, 2019 at 3:32 PM Jordan Crouse <jcrouse@codeaurora.org> wrote:
>
> Attempt to enable split pagetables if the arm-smmu driver supports it.
> This will move the default address space from the default region to
> the address range assigned to TTBR1. The behavior should be transparent
> to the driver for now but it gets the default buffers out of the way
> when we want to start swapping TTBR0 for context-specific pagetables.
>
> Signed-off-by: Jordan Crouse <jcrouse@codeaurora.org>
> ---
>
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 46 ++++++++++++++++++++++++++++++++++-
>  1 file changed, 45 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> index 5dc0b2c..96b3b28 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -811,6 +811,50 @@ static unsigned long a6xx_gpu_busy(struct msm_gpu *gpu)
>         return (unsigned long)busy_time;
>  }
>
> +static struct msm_gem_address_space *
> +a6xx_create_address_space(struct msm_gpu *gpu, struct platform_device *pdev)
> +{
> +       struct iommu_domain *iommu = iommu_domain_alloc(&platform_bus_type);
> +       struct msm_gem_address_space *aspace;
> +       struct msm_mmu *mmu;
> +       u64 start, size;
> +       u32 val = 1;
> +       int ret;
> +
> +       if (!iommu)
> +               return ERR_PTR(-ENOMEM);
> +
> +       /* Try to request split pagetables */
> +       iommu_domain_set_attr(iommu, DOMAIN_ATTR_SPLIT_TABLES, &val);
> +
> +       mmu = msm_iommu_new(&pdev->dev, iommu);
> +       if (IS_ERR(mmu)) {
> +               iommu_domain_free(iommu);
> +               return ERR_CAST(mmu);
> +       }
> +
> +       /* Check to see if split pagetables were successful */
> +       ret = iommu_domain_get_attr(iommu, DOMAIN_ATTR_SPLIT_TABLES, &val);

I assume the split between this and iommu_domain_set_attr() is because
attach needs to happen in between?  At any rate, if it needs to be
like this, maybe a comment is in order.  As it is it looks like
something future-self would "cleanup"..

BR,
-R

> +       if (!ret && val) {
> +               /*
> +                * The aperture start will be at the beginning of the TTBR1
> +                * space so use that as a base
> +                */
> +               start = iommu->geometry.aperture_start;
> +               size = 0xffffffff;
> +       } else {
> +               /* Otherwise use the legacy 32 bit region */
> +               start = SZ_16M;
> +               size = 0xffffffff - SZ_16M;
> +       }
> +
> +       aspace = msm_gem_address_space_create(mmu, "gpu", start, size);
> +       if (IS_ERR(aspace))
> +               iommu_domain_free(iommu);
> +
> +       return aspace;
> +}
> +
>  static const struct adreno_gpu_funcs funcs = {
>         .base = {
>                 .get_param = adreno_get_param,
> @@ -832,7 +876,7 @@ static const struct adreno_gpu_funcs funcs = {
>  #if defined(CONFIG_DRM_MSM_GPU_STATE)
>                 .gpu_state_get = a6xx_gpu_state_get,
>                 .gpu_state_put = a6xx_gpu_state_put,
> -               .create_address_space = adreno_iommu_create_address_space,
> +               .create_address_space = a6xx_create_address_space,
>  #endif
>         },
>         .get_timestamp = a6xx_get_timestamp,
> --
> 2.7.4
>
