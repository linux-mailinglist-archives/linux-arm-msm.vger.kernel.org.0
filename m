Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4282D60B4C3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Oct 2022 20:03:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232235AbiJXSDZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 24 Oct 2022 14:03:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49676 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229536AbiJXSCz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 24 Oct 2022 14:02:55 -0400
Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com [209.85.160.49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D8239189520
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Oct 2022 09:43:39 -0700 (PDT)
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-13be3ef361dso42814fac.12
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Oct 2022 09:43:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=xeOhGRDgXDrLUtCw3GwUFAr/RTS5Lk92rkS+JxJfeEU=;
        b=XH04cOzdUK34weaVsyiw9zis6Gwdq9x/PfNnh18loM4pQ3aQalm4yiTb6XOKtuG4o0
         nrpOJ10hr/kNN/lTRewGGXEcTal1AFpiZyCHrAbX7hqMHuRXLRdwZpzkKj1cpS1M78Kh
         drkd4DuX4nBK93DVdvmeZ6vQb1CA3jwgzeZCVK6W65nwQ7OP25by0KVSbENSySvmW8oN
         vZ4Kr+PxJXy2HkitETdo+ZrM8X8jWhtlYrOYCk6BIWnPBDfsQHmJE9qdiPiDLwNKhHrF
         f4G3fmOgqbfqbWJSNC/lWDsX1UVoRH9kvhsfEf/gGr++9VS1uyTqJPN4vDkVy9YBEuRv
         xLDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xeOhGRDgXDrLUtCw3GwUFAr/RTS5Lk92rkS+JxJfeEU=;
        b=AyTXKmgbGkt0+8qKGLIxG6T1t5/00UQCQja1BzqkFDxSd646gZmXMxNiBu8bD/ucqX
         ooJ6wQmBQMGlOSzF+QqVLNTVLaHJz2KueWfzT34aJ1etsKSJGbg4b1Lv3kAcrz2fC2A6
         d8pjyKQ3TLq2EXyQzc8FXSKaJ4YYs9QEA/k9GQnhW+M3hLQSQtEzqfy4Q6Idq0MCnhQp
         7oHV6k9n9krhG2B0DAZzjF8+UXzxaVi8g4RngSu6rLeaDzxasafkWmWWtHaDuvce4FPL
         0tkh2tZAHS1oyFo358hQbt9IZhwSKdkvEcSYL5s13Xid+nMhQrY6hskQDe83qk6zoSWf
         Ja7Q==
X-Gm-Message-State: ACrzQf0Hsq40DXWF3/bGDufMXahcMu7K2yIocFA1mWfUjQ+ThrSOCtCX
        1Im/twohOpUGB/0wkNeXpT5kGlrInypjzKLIY5DCCXDmIwA=
X-Google-Smtp-Source: AMsMyM6nc4UrsZBx/PUrApBdClGODasswY8rPtxXwnmYhYIUI9EVl9V2f9+K3miL6Y7IoZvRI++1cAbcxJwNm2iuoG4=
X-Received: by 2002:a05:6870:64a0:b0:13b:9044:d229 with SMTP id
 cz32-20020a05687064a000b0013b9044d229mr4651232oab.183.1666627968460; Mon, 24
 Oct 2022 09:12:48 -0700 (PDT)
MIME-Version: 1.0
References: <20221024151444.3208225-1-dmitry.baryshkov@linaro.org>
In-Reply-To: <20221024151444.3208225-1-dmitry.baryshkov@linaro.org>
From:   Rob Clark <robdclark@gmail.com>
Date:   Mon, 24 Oct 2022 09:12:57 -0700
Message-ID: <CAF6AEGviTTOKcTH5YAQJAgzY9kbDD8fX+FrY5R8igamN22T-bg@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] drm/msm: remove duplicated code from a6xx_create_address_space
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Oct 24, 2022 at 8:14 AM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> The function a6xx_create_address_space() is mostly a copy of
> adreno_iommu_create_address_space() with added quirk setting. Reuse the
> original function to do the work, while introducing the wrapper to set
> the quirk.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c   | 31 ++++---------------------
>  drivers/gpu/drm/msm/adreno/adreno_gpu.c |  4 ++--
>  drivers/gpu/drm/msm/adreno/adreno_gpu.h |  2 +-
>  drivers/gpu/drm/msm/msm_iommu.c         |  7 ++++++
>  drivers/gpu/drm/msm/msm_mmu.h           |  1 +
>  5 files changed, 15 insertions(+), 30 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> index fdc578016e0b..7640f5b960d6 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -1786,41 +1786,18 @@ a6xx_create_address_space(struct msm_gpu *gpu, struct platform_device *pdev)
>  {
>         struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
>         struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
> -       struct iommu_domain *iommu;
> -       struct msm_mmu *mmu;
>         struct msm_gem_address_space *aspace;
> -       u64 start, size;
>
> -       iommu = iommu_domain_alloc(&platform_bus_type);
> -       if (!iommu)
> -               return NULL;
> +       aspace = adreno_iommu_create_address_space(gpu, pdev);
> +       if (IS_ERR_OR_NULL(aspace))
> +               return ERR_CAST(aspace);
>
>         /*
>          * This allows GPU to set the bus attributes required to use system
>          * cache on behalf of the iommu page table walker.
>          */
>         if (!IS_ERR_OR_NULL(a6xx_gpu->htw_llc_slice))
> -               adreno_set_llc_attributes(iommu);
> -
> -       mmu = msm_iommu_new(&pdev->dev, iommu);
> -       if (IS_ERR(mmu)) {
> -               iommu_domain_free(iommu);
> -               return ERR_CAST(mmu);
> -       }
> -
> -       /*
> -        * Use the aperture start or SZ_16M, whichever is greater. This will
> -        * ensure that we align with the allocated pagetable range while still
> -        * allowing room in the lower 32 bits for GMEM and whatnot
> -        */
> -       start = max_t(u64, SZ_16M, iommu->geometry.aperture_start);
> -       size = iommu->geometry.aperture_end - start + 1;
> -
> -       aspace = msm_gem_address_space_create(mmu, "gpu",
> -               start & GENMASK_ULL(48, 0), size);
> -
> -       if (IS_ERR(aspace) && !IS_ERR(mmu))
> -               mmu->funcs->destroy(mmu);
> +               adreno_set_llc_attributes(aspace->mmu);
>
>         return aspace;
>  }
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> index 382fb7f9e497..ed26b8dfc789 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> @@ -191,9 +191,9 @@ int adreno_zap_shader_load(struct msm_gpu *gpu, u32 pasid)
>         return zap_shader_load_mdt(gpu, adreno_gpu->info->zapfw, pasid);
>  }
>
> -void adreno_set_llc_attributes(struct iommu_domain *iommu)
> +void adreno_set_llc_attributes(struct msm_mmu *mmu)
>  {
> -       iommu_set_pgtable_quirks(iommu, IO_PGTABLE_QUIRK_ARM_OUTER_WBWA);
> +       msm_iommu_set_pgtable_quirks(mmu, IO_PGTABLE_QUIRK_ARM_OUTER_WBWA);
>  }

This won't actually work.. looking at the arm-smmu code, the quirks
need to be set before attaching the device.  But there is an even
simpler way, just pass the quirks bitmask to msm_iommu_new() and get
rid of adreno_set_llc_attributes(), and msm_iommu_set_pgtable_quirks()

BR,
-R

>
>  struct msm_gem_address_space *
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> index e7adc5c632d0..723729e463e8 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> @@ -338,7 +338,7 @@ struct msm_gem_address_space *
>  adreno_iommu_create_address_space(struct msm_gpu *gpu,
>                 struct platform_device *pdev);
>
> -void adreno_set_llc_attributes(struct iommu_domain *iommu);
> +void adreno_set_llc_attributes(struct msm_mmu *mmu);
>
>  int adreno_read_speedbin(struct device *dev, u32 *speedbin);
>
> diff --git a/drivers/gpu/drm/msm/msm_iommu.c b/drivers/gpu/drm/msm/msm_iommu.c
> index 5577cea7c009..768ab71cc43e 100644
> --- a/drivers/gpu/drm/msm/msm_iommu.c
> +++ b/drivers/gpu/drm/msm/msm_iommu.c
> @@ -186,6 +186,13 @@ int msm_iommu_pagetable_params(struct msm_mmu *mmu,
>         return 0;
>  }
>
> +int msm_iommu_set_pgtable_quirks(struct msm_mmu *mmu, unsigned long quirk)
> +{
> +       struct msm_iommu *iommu = to_msm_iommu(mmu);
> +
> +       return iommu_set_pgtable_quirks(iommu->domain, quirk);
> +}
> +
>  static const struct msm_mmu_funcs pagetable_funcs = {
>                 .map = msm_iommu_pagetable_map,
>                 .unmap = msm_iommu_pagetable_unmap,
> diff --git a/drivers/gpu/drm/msm/msm_mmu.h b/drivers/gpu/drm/msm/msm_mmu.h
> index de158e1bf765..d968d9f8e19c 100644
> --- a/drivers/gpu/drm/msm/msm_mmu.h
> +++ b/drivers/gpu/drm/msm/msm_mmu.h
> @@ -58,5 +58,6 @@ void msm_gpummu_params(struct msm_mmu *mmu, dma_addr_t *pt_base,
>
>  int msm_iommu_pagetable_params(struct msm_mmu *mmu, phys_addr_t *ttbr,
>                 int *asid);
> +int msm_iommu_set_pgtable_quirks(struct msm_mmu *mmu, unsigned long quirk);
>
>  #endif /* __MSM_MMU_H__ */
> --
> 2.35.1
>
