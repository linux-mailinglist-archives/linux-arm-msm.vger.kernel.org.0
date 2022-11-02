Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 43561617177
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Nov 2022 00:11:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229637AbiKBXLY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 2 Nov 2022 19:11:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55592 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229770AbiKBXLX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 2 Nov 2022 19:11:23 -0400
Received: from mail-oa1-x33.google.com (mail-oa1-x33.google.com [IPv6:2001:4860:4864:20::33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 19EF5BC0C
        for <linux-arm-msm@vger.kernel.org>; Wed,  2 Nov 2022 16:11:22 -0700 (PDT)
Received: by mail-oa1-x33.google.com with SMTP id 586e51a60fabf-13b6c1c89bdso317057fac.13
        for <linux-arm-msm@vger.kernel.org>; Wed, 02 Nov 2022 16:11:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=PIl0mGjj/CrMRYegN97Dwb3kCJ6v6H5AvzAZVnT5LZQ=;
        b=Hm1lI7DgzuPkbRCBt57ZK/yF3H0XXEYtaIGtp5+vVleKO0/tm8d2DAbltQSGf8rXal
         JplrO9KWlMIpsuffh6Suuh9ypMxwIVAzL1t03R0p9OSagxFK5gh7hKe2kp8TKxUl1Jl+
         kzezsctwDWnRSxAdtLfoRRnenOJj2odHJN3iXULFRXsW5KyJzqBNViEwrPJpeFQlURTH
         1qJwrwu7DveeNN9PHTDZqjFNpmJAe+HdCCzRG1ZRT72Ws6f4S4EENt6BvcoQTi6DMk8l
         sQPnJoEixCl3sUzIs52ca0sep8wMPZGRV6lSGGUOdlUWIP/1ghxP/muEeZpylKQb14G9
         0g4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PIl0mGjj/CrMRYegN97Dwb3kCJ6v6H5AvzAZVnT5LZQ=;
        b=23nL+mnuKoAVEnwkRaqSt+M0NSTzhKSiWQqdcXNqCIygABP3HD9V5ShejiyzMFuNAp
         HFPNqh5bb+iizoS1anilGODFSpzYBNKyw9xJ3unujXVEUvFlbvbO0T6TBSJtK+23nOqN
         McwkEzLqQILBJT9vJrjyMqTRxBTpxiahXeu53/bJdn8xc8JusKSr/haXbnNYKlPjizaw
         xxD8FRf6FIe4fgiQ6Ar2Hk3VtKpJ1ix5Cf+Glu22DWdilOf/0aagfqmjsDTijwrKzxGF
         iLqxjBKD3elZEE5gO4hgzC13o5T0mMR8pTBQArBT8GgCkC7jj46kCLG8ljm/Fi6sdWkG
         Lr7w==
X-Gm-Message-State: ACrzQf0U4A3VUUnOhEaUWRdCVTG/29oGsSx5tdAmn1r9Z+38v3OhV0R/
        /JTGzA62g63BA4b9TVcM6WKLjln0QXpGeJNuCho=
X-Google-Smtp-Source: AMsMyM5kzmMPQ9XouyY8/PefAxQvZK8KMNsmkCxgJqoTJX8Cd348CRQmzKodTg4LQPghp1Eu3E+V+itCKCRjDL1H3t4=
X-Received: by 2002:a05:6871:6a4:b0:13b:a056:f97f with SMTP id
 l36-20020a05687106a400b0013ba056f97fmr16028366oao.38.1667430681200; Wed, 02
 Nov 2022 16:11:21 -0700 (PDT)
MIME-Version: 1.0
References: <20221102175449.452283-1-dmitry.baryshkov@linaro.org> <20221102175449.452283-2-dmitry.baryshkov@linaro.org>
In-Reply-To: <20221102175449.452283-2-dmitry.baryshkov@linaro.org>
From:   Rob Clark <robdclark@gmail.com>
Date:   Wed, 2 Nov 2022 16:11:38 -0700
Message-ID: <CAF6AEGt35yxO2vX+o7CzxG0nZuO5Q56x+Y3HmkBpJ1jzg7cPWg@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] drm/msm: move domain allocation into msm_iommu_new()
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Nov 2, 2022 at 10:54 AM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> After the msm_iommu instance is created, the IOMMU domain is completely
> handled inside the msm_iommu code. Move the iommu_domain_alloc() call
> into the msm_iommu_new() to simplify callers code.
>
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Reviewed-by: Rob Clark <robdclark@gmail.com>

> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gmu.c    | 12 +++++-------
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c    | 23 +++++++++++-----------
>  drivers/gpu/drm/msm/adreno/adreno_gpu.c  | 25 +++++++++---------------
>  drivers/gpu/drm/msm/adreno/adreno_gpu.h  |  2 --
>  drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c | 19 +++++++++---------
>  drivers/gpu/drm/msm/msm_drv.c            | 18 ++++++++---------
>  drivers/gpu/drm/msm/msm_iommu.c          | 20 ++++++++++++++++---
>  drivers/gpu/drm/msm/msm_mmu.h            |  3 ++-
>  8 files changed, 62 insertions(+), 60 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> index e033d6a67a20..6484b97c5344 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> @@ -1213,19 +1213,17 @@ static int a6xx_gmu_memory_alloc(struct a6xx_gmu *gmu, struct a6xx_gmu_bo *bo,
>
>  static int a6xx_gmu_memory_probe(struct a6xx_gmu *gmu)
>  {
> -       struct iommu_domain *domain;
>         struct msm_mmu *mmu;
>
> -       domain = iommu_domain_alloc(&platform_bus_type);
> -       if (!domain)
> +       mmu = msm_iommu_new(gmu->dev, 0);
> +       if (!mmu)
>                 return -ENODEV;
> +       if (IS_ERR(mmu))
> +               return PTR_ERR(mmu);
>
> -       mmu = msm_iommu_new(gmu->dev, domain);
>         gmu->aspace = msm_gem_address_space_create(mmu, "gmu", 0x0, 0x80000000);
> -       if (IS_ERR(gmu->aspace)) {
> -               iommu_domain_free(domain);
> +       if (IS_ERR(gmu->aspace))
>                 return PTR_ERR(gmu->aspace);
> -       }
>
>         return 0;
>  }
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> index fdc578016e0b..db4b3a48c708 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -1786,35 +1786,34 @@ a6xx_create_address_space(struct msm_gpu *gpu, struct platform_device *pdev)
>  {
>         struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
>         struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
> -       struct iommu_domain *iommu;
> +       struct iommu_domain_geometry *geometry;
>         struct msm_mmu *mmu;
>         struct msm_gem_address_space *aspace;
>         u64 start, size;
> -
> -       iommu = iommu_domain_alloc(&platform_bus_type);
> -       if (!iommu)
> -               return NULL;
> +       unsigned long quirks = 0;
>
>         /*
>          * This allows GPU to set the bus attributes required to use system
>          * cache on behalf of the iommu page table walker.
>          */
>         if (!IS_ERR_OR_NULL(a6xx_gpu->htw_llc_slice))
> -               adreno_set_llc_attributes(iommu);
> +               quirks |= IO_PGTABLE_QUIRK_ARM_OUTER_WBWA;
>
> -       mmu = msm_iommu_new(&pdev->dev, iommu);
> -       if (IS_ERR(mmu)) {
> -               iommu_domain_free(iommu);
> +       mmu = msm_iommu_new(&pdev->dev, quirks);
> +       if (IS_ERR_OR_NULL(mmu))
>                 return ERR_CAST(mmu);
> -       }
> +
> +       geometry = msm_iommu_get_geometry(mmu);
> +       if (IS_ERR(geometry))
> +               return ERR_CAST(geometry);
>
>         /*
>          * Use the aperture start or SZ_16M, whichever is greater. This will
>          * ensure that we align with the allocated pagetable range while still
>          * allowing room in the lower 32 bits for GMEM and whatnot
>          */
> -       start = max_t(u64, SZ_16M, iommu->geometry.aperture_start);
> -       size = iommu->geometry.aperture_end - start + 1;
> +       start = max_t(u64, SZ_16M, geometry->aperture_start);
> +       size = geometry->aperture_end - start + 1;
>
>         aspace = msm_gem_address_space_create(mmu, "gpu",
>                 start & GENMASK_ULL(48, 0), size);
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> index 382fb7f9e497..12d0497f57e1 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> @@ -191,37 +191,30 @@ int adreno_zap_shader_load(struct msm_gpu *gpu, u32 pasid)
>         return zap_shader_load_mdt(gpu, adreno_gpu->info->zapfw, pasid);
>  }
>
> -void adreno_set_llc_attributes(struct iommu_domain *iommu)
> -{
> -       iommu_set_pgtable_quirks(iommu, IO_PGTABLE_QUIRK_ARM_OUTER_WBWA);
> -}
> -
>  struct msm_gem_address_space *
>  adreno_iommu_create_address_space(struct msm_gpu *gpu,
>                 struct platform_device *pdev)
>  {
> -       struct iommu_domain *iommu;
> +       struct iommu_domain_geometry *geometry;
>         struct msm_mmu *mmu;
>         struct msm_gem_address_space *aspace;
>         u64 start, size;
>
> -       iommu = iommu_domain_alloc(&platform_bus_type);
> -       if (!iommu)
> -               return NULL;
> -
> -       mmu = msm_iommu_new(&pdev->dev, iommu);
> -       if (IS_ERR(mmu)) {
> -               iommu_domain_free(iommu);
> +       mmu = msm_iommu_new(&pdev->dev, 0);
> +       if (IS_ERR_OR_NULL(mmu))
>                 return ERR_CAST(mmu);
> -       }
> +
> +       geometry = msm_iommu_get_geometry(mmu);
> +       if (IS_ERR(geometry))
> +               return ERR_CAST(geometry);
>
>         /*
>          * Use the aperture start or SZ_16M, whichever is greater. This will
>          * ensure that we align with the allocated pagetable range while still
>          * allowing room in the lower 32 bits for GMEM and whatnot
>          */
> -       start = max_t(u64, SZ_16M, iommu->geometry.aperture_start);
> -       size = iommu->geometry.aperture_end - start + 1;
> +       start = max_t(u64, SZ_16M, geometry->aperture_start);
> +       size = geometry->aperture_end - start + 1;
>
>         aspace = msm_gem_address_space_create(mmu, "gpu",
>                 start & GENMASK_ULL(48, 0), size);
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> index e7adc5c632d0..707273339969 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> @@ -338,8 +338,6 @@ struct msm_gem_address_space *
>  adreno_iommu_create_address_space(struct msm_gpu *gpu,
>                 struct platform_device *pdev);
>
> -void adreno_set_llc_attributes(struct iommu_domain *iommu);
> -
>  int adreno_read_speedbin(struct device *dev, u32 *speedbin);
>
>  /*
> diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
> index 964573d26d26..9a1a0769575d 100644
> --- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
> +++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
> @@ -387,7 +387,7 @@ static int mdp4_kms_init(struct drm_device *dev)
>         struct msm_drm_private *priv = dev->dev_private;
>         struct mdp4_kms *mdp4_kms;
>         struct msm_kms *kms = NULL;
> -       struct iommu_domain *iommu;
> +       struct msm_mmu *mmu;
>         struct msm_gem_address_space *aspace;
>         int irq, ret;
>         u32 major, minor;
> @@ -499,10 +499,15 @@ static int mdp4_kms_init(struct drm_device *dev)
>         mdp4_disable(mdp4_kms);
>         mdelay(16);
>
> -       iommu = iommu_domain_alloc(pdev->dev.bus);
> -       if (iommu) {
> -               struct msm_mmu *mmu = msm_iommu_new(&pdev->dev, iommu);
> -
> +       mmu = msm_iommu_new(&pdev->dev, 0);
> +       if (IS_ERR(mmu)) {
> +               ret = PTR_ERR(mmu);
> +               goto fail;
> +       } else if (!mmu) {
> +               DRM_DEV_INFO(dev->dev, "no iommu, fallback to phys "
> +                               "contig buffers for scanout\n");
> +               aspace = NULL;
> +       } else {
>                 aspace  = msm_gem_address_space_create(mmu,
>                         "mdp4", 0x1000, 0x100000000 - 0x1000);
>
> @@ -514,10 +519,6 @@ static int mdp4_kms_init(struct drm_device *dev)
>                 }
>
>                 kms->aspace = aspace;
> -       } else {
> -               DRM_DEV_INFO(dev->dev, "no iommu, fallback to phys "
> -                               "contig buffers for scanout\n");
> -               aspace = NULL;
>         }
>
>         ret = modeset_init(mdp4_kms);
> diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
> index 28034c21f6bc..be32b4460e94 100644
> --- a/drivers/gpu/drm/msm/msm_drv.c
> +++ b/drivers/gpu/drm/msm/msm_drv.c
> @@ -276,7 +276,6 @@ static int msm_drm_uninit(struct device *dev)
>
>  struct msm_gem_address_space *msm_kms_init_aspace(struct drm_device *dev)
>  {
> -       struct iommu_domain *domain;
>         struct msm_gem_address_space *aspace;
>         struct msm_mmu *mmu;
>         struct device *mdp_dev = dev->dev;
> @@ -292,22 +291,21 @@ struct msm_gem_address_space *msm_kms_init_aspace(struct drm_device *dev)
>         else
>                 iommu_dev = mdss_dev;
>
> -       domain = iommu_domain_alloc(iommu_dev->bus);
> -       if (!domain) {
> +       mmu = msm_iommu_new(iommu_dev, 0);
> +       if (IS_ERR(mmu))
> +               return ERR_CAST(mmu);
> +
> +       if (!mmu) {
>                 drm_info(dev, "no IOMMU, fallback to phys contig buffers for scanout\n");
>                 return NULL;
>         }
>
> -       mmu = msm_iommu_new(iommu_dev, domain);
> -       if (IS_ERR(mmu)) {
> -               iommu_domain_free(domain);
> -               return ERR_CAST(mmu);
> -       }
> -
>         aspace = msm_gem_address_space_create(mmu, "mdp_kms",
>                 0x1000, 0x100000000 - 0x1000);
> -       if (IS_ERR(aspace))
> +       if (IS_ERR(aspace)) {
> +               dev_err(mdp_dev, "aspace create, error %pe\n", aspace);
>                 mmu->funcs->destroy(mmu);
> +       }
>
>         return aspace;
>  }
> diff --git a/drivers/gpu/drm/msm/msm_iommu.c b/drivers/gpu/drm/msm/msm_iommu.c
> index 5577cea7c009..c2507582ecf3 100644
> --- a/drivers/gpu/drm/msm/msm_iommu.c
> +++ b/drivers/gpu/drm/msm/msm_iommu.c
> @@ -186,6 +186,13 @@ int msm_iommu_pagetable_params(struct msm_mmu *mmu,
>         return 0;
>  }
>
> +struct iommu_domain_geometry *msm_iommu_get_geometry(struct msm_mmu *mmu)
> +{
> +       struct msm_iommu *iommu = to_msm_iommu(mmu);
> +
> +       return &iommu->domain->geometry;
> +}
> +
>  static const struct msm_mmu_funcs pagetable_funcs = {
>                 .map = msm_iommu_pagetable_map,
>                 .unmap = msm_iommu_pagetable_unmap,
> @@ -367,17 +374,23 @@ static const struct msm_mmu_funcs funcs = {
>                 .resume_translation = msm_iommu_resume_translation,
>  };
>
> -struct msm_mmu *msm_iommu_new(struct device *dev, struct iommu_domain *domain)
> +struct msm_mmu *msm_iommu_new(struct device *dev, unsigned long quirks)
>  {
> +       struct iommu_domain *domain;
>         struct msm_iommu *iommu;
>         int ret;
>
> +       domain = iommu_domain_alloc(dev->bus);
>         if (!domain)
> -               return ERR_PTR(-ENODEV);
> +               return NULL;
> +
> +       iommu_set_pgtable_quirks(domain, quirks);
>
>         iommu = kzalloc(sizeof(*iommu), GFP_KERNEL);
> -       if (!iommu)
> +       if (!iommu) {
> +               iommu_domain_free(domain);
>                 return ERR_PTR(-ENOMEM);
> +       }
>
>         iommu->domain = domain;
>         msm_mmu_init(&iommu->base, dev, &funcs, MSM_MMU_IOMMU);
> @@ -386,6 +399,7 @@ struct msm_mmu *msm_iommu_new(struct device *dev, struct iommu_domain *domain)
>
>         ret = iommu_attach_device(iommu->domain, dev);
>         if (ret) {
> +               iommu_domain_free(domain);
>                 kfree(iommu);
>                 return ERR_PTR(ret);
>         }
> diff --git a/drivers/gpu/drm/msm/msm_mmu.h b/drivers/gpu/drm/msm/msm_mmu.h
> index de158e1bf765..74cd81e701ff 100644
> --- a/drivers/gpu/drm/msm/msm_mmu.h
> +++ b/drivers/gpu/drm/msm/msm_mmu.h
> @@ -40,7 +40,7 @@ static inline void msm_mmu_init(struct msm_mmu *mmu, struct device *dev,
>         mmu->type = type;
>  }
>
> -struct msm_mmu *msm_iommu_new(struct device *dev, struct iommu_domain *domain);
> +struct msm_mmu *msm_iommu_new(struct device *dev, unsigned long quirks);
>  struct msm_mmu *msm_gpummu_new(struct device *dev, struct msm_gpu *gpu);
>
>  static inline void msm_mmu_set_fault_handler(struct msm_mmu *mmu, void *arg,
> @@ -58,5 +58,6 @@ void msm_gpummu_params(struct msm_mmu *mmu, dma_addr_t *pt_base,
>
>  int msm_iommu_pagetable_params(struct msm_mmu *mmu, phys_addr_t *ttbr,
>                 int *asid);
> +struct iommu_domain_geometry *msm_iommu_get_geometry(struct msm_mmu *mmu);
>
>  #endif /* __MSM_MMU_H__ */
> --
> 2.35.1
>
