Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 643E420C32B
	for <lists+linux-arm-msm@lfdr.de>; Sat, 27 Jun 2020 19:09:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725930AbgF0RJr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 27 Jun 2020 13:09:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34224 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725882AbgF0RJr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 27 Jun 2020 13:09:47 -0400
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com [IPv6:2a00:1450:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A0DBAC061794;
        Sat, 27 Jun 2020 10:09:46 -0700 (PDT)
Received: by mail-ed1-x542.google.com with SMTP id g20so9068954edm.4;
        Sat, 27 Jun 2020 10:09:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Z0GB5ATaLVK7sa/BJElOVWK3jMO1+UU+ndSjuuUCcDQ=;
        b=pX4PYXsppnxXZN7ARLZ6bjdBU2pMX3kilpUbKpoWOtgZKWmf8/wMcA6r45s1eT1j+3
         Q0iC3VRsfVa6m5TFuXkLsfNfbH9XuunFjREtlhltY1yfCePuN2HUKqqK7cx8gCb7k+Al
         0q8vyljKd8lDzL5L5eutyvNDkKPGTwn2dhIWcyhYmGZmee0URrqMAiqyeCwcUHskwVLL
         ShUToGP2iVq74Wdb3/W1JIidW/eKcuLPorOeGfIHZrYi+lh09k97F7DpvelDii5kGBKX
         2PtY+YcVCOyJwWNspB6hQobVqqKQXI077a/UZtWNIcSw7YEZcu4j5qbwzTYZWXm9sfIb
         qMKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Z0GB5ATaLVK7sa/BJElOVWK3jMO1+UU+ndSjuuUCcDQ=;
        b=RjM4zB1lTTDNAGxxBDRTF2VAWNbiWE335PJnV4r9Wluhrdmsfz30jB/7nn8Mu0MMy6
         yZrUZ0wcKlzBdbsm3uhf5+cWAPEM++sY79/8+/OgAl0G+WBFqIDszRkCGoQThtmjzHaY
         YCOupvwGu/o6/yNOo1YBhx4SIdKkArmmd2PsaTPhMM2q22HX6Mie/c7J0AnpsnTRqxPk
         E+hacOmIMF77Fm9BITnA5r/rZ9fwFaAa3nSajyIJui+sqROK5Y1+72jh3sHCMz9Arjl4
         kmaxKdQsZGsiMJi6WFXeNvDxADgxgpJwMxgAVt1gqIeGwIdBShV4smUQdPZ6aNmD5kkE
         Xi+Q==
X-Gm-Message-State: AOAM5312Tnd0s0iBfMXRuCj8ByZwc2XIC2by5WsK364GstuKlCiGUfLq
        hqAehVKI1cegNHUNRn5ISOhLJqL4RPNQ7fKl2aA=
X-Google-Smtp-Source: ABdhPJwuv8UKuJB24fZa+J6oFLwClzsveXOv9mXx9mOerBaR5o787gw6Sa0+gP5ZKeJAif51Vmu6nLs4OdCSklFPULE=
X-Received: by 2002:a05:6402:1512:: with SMTP id f18mr9553573edw.101.1593277785336;
 Sat, 27 Jun 2020 10:09:45 -0700 (PDT)
MIME-Version: 1.0
References: <20200626200042.13713-1-jcrouse@codeaurora.org> <20200626200042.13713-7-jcrouse@codeaurora.org>
In-Reply-To: <20200626200042.13713-7-jcrouse@codeaurora.org>
From:   Rob Clark <robdclark@gmail.com>
Date:   Sat, 27 Jun 2020 10:10:14 -0700
Message-ID: <CAF6AEGuNSAYNMG6CH6VMuyjiz5dfRoLWQ9OAFxPJrFmBrHe+Wg@mail.gmail.com>
Subject: Re: [Freedreno] [PATCH v9 6/7] drm/msm: Set the global virtual
 address range from the IOMMU domain
To:     Jordan Crouse <jcrouse@codeaurora.org>
Cc:     linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        David Airlie <airlied@linux.ie>, Sean Paul <sean@poorly.run>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Takashi Iwai <tiwai@suse.de>,
        "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>, Joerg
        Roedel <joro@8bytes.org>," <iommu@lists.linux-foundation.org>,
        John Stultz <john.stultz@linaro.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        Shawn Guo <shawn.guo@linaro.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Brian Masney <masneyb@onstation.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Jun 26, 2020 at 1:01 PM Jordan Crouse <jcrouse@codeaurora.org> wrote:
>
> Use the aperture settings from the IOMMU domain to set up the virtual
> address range for the GPU. This allows us to transparently deal with
> IOMMU side features (like split pagetables).
>
> Signed-off-by: Jordan Crouse <jcrouse@codeaurora.org>
> ---
>
>  drivers/gpu/drm/msm/adreno/adreno_gpu.c | 13 +++++++++++--
>  drivers/gpu/drm/msm/msm_iommu.c         |  7 +++++++
>  2 files changed, 18 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> index 5db06b590943..3e717c1ebb7f 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> @@ -192,9 +192,18 @@ adreno_iommu_create_address_space(struct msm_gpu *gpu,
>         struct iommu_domain *iommu = iommu_domain_alloc(&platform_bus_type);
>         struct msm_mmu *mmu = msm_iommu_new(&pdev->dev, iommu);
>         struct msm_gem_address_space *aspace;
> +       u64 start, size;
>
> -       aspace = msm_gem_address_space_create(mmu, "gpu", SZ_16M,
> -               0xffffffff - SZ_16M);
> +       /*
> +        * Use the aperture start or SZ_16M, whichever is greater. This will
> +        * ensure that we align with the allocated pagetable range while still
> +        * allowing room in the lower 32 bits for GMEM and whatnot
> +        */
> +       start = max_t(u64, SZ_16M, iommu->geometry.aperture_start);
> +       size = iommu->geometry.aperture_end - start + 1;
> +
> +       aspace = msm_gem_address_space_create(mmu, "gpu",
> +               start & GENMASK(48, 0), size);

hmm, I kinda think this isn't going to play well for the 32b gpus
(pre-a5xx).. possibly we should add address space size to 'struct
adreno_info'?

Or I guess it is always going to be the same for all devices within a
generation?  So it could just be passed in to adreno_gpu_init()

Hopefully that makes things smoother if we someday had more than 48bits..

BR,
-R

>
>         if (IS_ERR(aspace) && !IS_ERR(mmu))
>                 mmu->funcs->destroy(mmu);
> diff --git a/drivers/gpu/drm/msm/msm_iommu.c b/drivers/gpu/drm/msm/msm_iommu.c
> index 3a381a9674c9..1b6635504069 100644
> --- a/drivers/gpu/drm/msm/msm_iommu.c
> +++ b/drivers/gpu/drm/msm/msm_iommu.c
> @@ -36,6 +36,10 @@ static int msm_iommu_map(struct msm_mmu *mmu, uint64_t iova,
>         struct msm_iommu *iommu = to_msm_iommu(mmu);
>         size_t ret;
>
> +       /* The arm-smmu driver expects the addresses to be sign extended */
> +       if (iova & BIT_ULL(48))
> +               iova |= GENMASK_ULL(63, 49);
> +
>         ret = iommu_map_sg(iommu->domain, iova, sgt->sgl, sgt->nents, prot);
>         WARN_ON(!ret);
>
> @@ -46,6 +50,9 @@ static int msm_iommu_unmap(struct msm_mmu *mmu, uint64_t iova, size_t len)
>  {
>         struct msm_iommu *iommu = to_msm_iommu(mmu);
>
> +       if (iova & BIT_ULL(48))
> +               iova |= GENMASK_ULL(63, 49);
> +
>         iommu_unmap(iommu->domain, iova, len);
>
>         return 0;
> --
> 2.17.1
>
> _______________________________________________
> Freedreno mailing list
> Freedreno@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/freedreno
