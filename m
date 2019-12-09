Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 576AE11770C
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Dec 2019 21:11:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726335AbfLIULs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 9 Dec 2019 15:11:48 -0500
Received: from mail-ed1-f68.google.com ([209.85.208.68]:39318 "EHLO
        mail-ed1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726230AbfLIULs (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 9 Dec 2019 15:11:48 -0500
Received: by mail-ed1-f68.google.com with SMTP id v16so13837255edy.6;
        Mon, 09 Dec 2019 12:11:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=wZ2HOTqwIQ1NAAnGyBsMzZ3ZgaYWTk44q8tb0yDSItU=;
        b=KStCE1zdCoPav3I7cdyQFhCBV5DOWW+tMPDgsnz0bHDBXlJFk+/oAeNNpktiM8ai8G
         +M2zh2KIUP/+eZwy+eNkkDv9L1DWkeUjn0245DOKZUhvUODAC8Yv01KnChdek69IURzH
         /yRnR4O5MnoSHA17qiPKeNo7YKRdqrX10tlkTXtj9vQ29MY/lk54fV4dzhOsj4il2y4P
         0RL43Y+f1RkX8tht0uasZFTCbCh4No/u9+1uZOh/OJilWcq60HWKAR6yOXmLQPwBspGm
         RzxDrBDtK+nwWOI5mlbTWVmcnFJEtYJzzLrshrmR/HPX0gIP8t4y0xP5XJUZGMJUO/uN
         n8ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wZ2HOTqwIQ1NAAnGyBsMzZ3ZgaYWTk44q8tb0yDSItU=;
        b=Iws97n2neqmwqqxhw4WqfJqEbks+9zL86/N4mUUVfD5GXyNOcGkXiQUKYvAdkFAwF/
         SBh3rBxR9TzRvm6M2oXVPf8ksZyBzx8jDHJdUMykxLIFrmKU8P4LiSaq04WZ6+REh3OX
         GRrloJqaR28vvoLmeOfsFHiDZwB7ITMJJThdoxCm/XAQeOqomz5EJVSFkJSNil5K8sTM
         Fab81cCjqLUtx1pf52uG3trQlz+/ca7yz+MhKoUwm4M07aOfbQ7CjXMjYX9YQYCguX+q
         wpo7IU4njwXBthalGsoEHH+12QPUkZTrnWcxJ24QoKto0qokJLZk+yXb6o9qaDyqs0n6
         Sv1A==
X-Gm-Message-State: APjAAAUiNTKaGB4qAPv/9LlpdiEEQJB3CJ2l9ljK4CZEisUUOixZA3il
        j5YuAcTOBbQXwmXkXXbQ1iCH/z4WaEnRdEeirhk=
X-Google-Smtp-Source: APXvYqxNLhd1U+YLI5W6r0mL/L/+plGCkZf16NdFCgs7JirzvWpkN6MvND4INCC+rb/8RpnVv3kc/vAkMgSl4wSOWkE=
X-Received: by 2002:a50:fc85:: with SMTP id f5mr34613985edq.294.1575922304961;
 Mon, 09 Dec 2019 12:11:44 -0800 (PST)
MIME-Version: 1.0
References: <1574465484-7115-1-git-send-email-jcrouse@codeaurora.org> <0101016e95754002-c2fa43aa-b14b-4cff-b6f9-a67c96661e26-000000@us-west-2.amazonses.com>
In-Reply-To: <0101016e95754002-c2fa43aa-b14b-4cff-b6f9-a67c96661e26-000000@us-west-2.amazonses.com>
From:   Rob Clark <robdclark@gmail.com>
Date:   Mon, 9 Dec 2019 12:11:35 -0800
Message-ID: <CAF6AEGuAjSyMTqCauO2i6wQDEq1Q1baNMisCr=WZi3WHeyzxmw@mail.gmail.com>
Subject: Re: [PATCH v2 5/8] drm/msm: Attach the IOMMU device during initialization
To:     Jordan Crouse <jcrouse@codeaurora.org>
Cc:     "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>, Joerg
        Roedel <joro@8bytes.org>," <iommu@lists.linux-foundation.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Will Deacon <will@kernel.org>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        David Airlie <airlied@linux.ie>, Sean Paul <sean@poorly.run>,
        Bruce Wang <bzwang@chromium.org>,
        AngeloGioacchino Del Regno <kholk11@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Jeykumar Sankaran <jsanka@codeaurora.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jonathan Marek <jonathan@marek.ca>,
        Drew Davenport <ddavenport@chromium.org>,
        Georgi Djakov <georgi.djakov@linaro.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        Mamta Shukla <mamtashukla555@gmail.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Daniel Vetter <daniel@ffwll.ch>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Nov 22, 2019 at 3:32 PM Jordan Crouse <jcrouse@codeaurora.org> wrote:
>
> Everywhere an IOMMU object is created by msm_gpu_create_address_space
> the IOMMU device is attached immediately after. Instead of carrying around
> the infrastructure to do the attach from the device specific code do it
> directly in the msm_iommu_init() function. This gets it out of the way for
> more aggressive cleanups that follow.
>
> Signed-off-by: Jordan Crouse <jcrouse@codeaurora.org>

Hmm, yeah, now that we dropped the extra mmu->attach() args (which was
some ancient downstream compat thing), we don't need the separate
attach step.  I suppose we probably should do a similar cleanup for
mmu->detach(), but I guess that can be it's own patch

Reviewed-by: Rob Clark <robdclark@gmail.com>


> ---
>
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c  |  8 --------
>  drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c |  4 ----
>  drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c |  7 -------
>  drivers/gpu/drm/msm/msm_gem_vma.c        | 23 +++++++++++++++++++----
>  drivers/gpu/drm/msm/msm_gpu.c            | 11 +----------
>  drivers/gpu/drm/msm/msm_gpummu.c         |  6 ------
>  drivers/gpu/drm/msm/msm_iommu.c          | 15 +++++++--------
>  drivers/gpu/drm/msm/msm_mmu.h            |  1 -
>  8 files changed, 27 insertions(+), 48 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> index 6c92f0f..b082b23 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> @@ -704,7 +704,6 @@ static int _dpu_kms_mmu_init(struct dpu_kms *dpu_kms)
>  {
>         struct iommu_domain *domain;
>         struct msm_gem_address_space *aspace;
> -       int ret;
>
>         domain = iommu_domain_alloc(&platform_bus_type);
>         if (!domain)
> @@ -720,13 +719,6 @@ static int _dpu_kms_mmu_init(struct dpu_kms *dpu_kms)
>                 return PTR_ERR(aspace);
>         }
>
> -       ret = aspace->mmu->funcs->attach(aspace->mmu);
> -       if (ret) {
> -               DPU_ERROR("failed to attach iommu %d\n", ret);
> -               msm_gem_address_space_put(aspace);
> -               return ret;
> -       }
> -
>         dpu_kms->base.aspace = aspace;
>         return 0;
>  }
> diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
> index dda0543..9dba37c 100644
> --- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
> +++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
> @@ -518,10 +518,6 @@ struct msm_kms *mdp4_kms_init(struct drm_device *dev)
>                 }
>
>                 kms->aspace = aspace;
> -
> -               ret = aspace->mmu->funcs->attach(aspace->mmu);
> -               if (ret)
> -                       goto fail;
>         } else {
>                 DRM_DEV_INFO(dev->dev, "no iommu, fallback to phys "
>                                 "contig buffers for scanout\n");
> diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
> index e43ecd4..653dab2 100644
> --- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
> +++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
> @@ -736,13 +736,6 @@ struct msm_kms *mdp5_kms_init(struct drm_device *dev)
>                 }
>
>                 kms->aspace = aspace;
> -
> -               ret = aspace->mmu->funcs->attach(aspace->mmu);
> -               if (ret) {
> -                       DRM_DEV_ERROR(&pdev->dev, "failed to attach iommu: %d\n",
> -                               ret);
> -                       goto fail;
> -               }
>         } else {
>                 DRM_DEV_INFO(&pdev->dev,
>                          "no iommu, fallback to phys contig buffers for scanout\n");
> diff --git a/drivers/gpu/drm/msm/msm_gem_vma.c b/drivers/gpu/drm/msm/msm_gem_vma.c
> index 1af5354..91d993a 100644
> --- a/drivers/gpu/drm/msm/msm_gem_vma.c
> +++ b/drivers/gpu/drm/msm/msm_gem_vma.c
> @@ -131,8 +131,8 @@ msm_gem_address_space_create(struct device *dev, struct iommu_domain *domain,
>                 const char *name)
>  {
>         struct msm_gem_address_space *aspace;
> -       u64 size = domain->geometry.aperture_end -
> -               domain->geometry.aperture_start;
> +       u64 start = domain->geometry.aperture_start;
> +       u64 size = domain->geometry.aperture_end - start;
>
>         aspace = kzalloc(sizeof(*aspace), GFP_KERNEL);
>         if (!aspace)
> @@ -141,9 +141,18 @@ msm_gem_address_space_create(struct device *dev, struct iommu_domain *domain,
>         spin_lock_init(&aspace->lock);
>         aspace->name = name;
>         aspace->mmu = msm_iommu_new(dev, domain);
> +       if (IS_ERR(aspace->mmu)) {
> +               int ret = PTR_ERR(aspace->mmu);
>
> -       drm_mm_init(&aspace->mm, (domain->geometry.aperture_start >> PAGE_SHIFT),
> -               size >> PAGE_SHIFT);
> +               kfree(aspace);
> +               return ERR_PTR(ret);
> +       }
> +
> +       /*
> +        * Attaching the IOMMU device changes the aperture values so use the
> +        * cached values instead
> +        */
> +       drm_mm_init(&aspace->mm, start >> PAGE_SHIFT, size >> PAGE_SHIFT);
>
>         kref_init(&aspace->kref);
>
> @@ -164,6 +173,12 @@ msm_gem_address_space_create_a2xx(struct device *dev, struct msm_gpu *gpu,
>         spin_lock_init(&aspace->lock);
>         aspace->name = name;
>         aspace->mmu = msm_gpummu_new(dev, gpu);
> +       if (IS_ERR(aspace->mmu)) {
> +               int ret = PTR_ERR(aspace->mmu);
> +
> +               kfree(aspace);
> +               return ERR_PTR(ret);
> +       }
>
>         drm_mm_init(&aspace->mm, (va_start >> PAGE_SHIFT),
>                 size >> PAGE_SHIFT);
> diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
> index 18f3a5c..f7bf80e 100644
> --- a/drivers/gpu/drm/msm/msm_gpu.c
> +++ b/drivers/gpu/drm/msm/msm_gpu.c
> @@ -808,7 +808,6 @@ msm_gpu_create_address_space(struct msm_gpu *gpu, struct platform_device *pdev,
>                 uint64_t va_start, uint64_t va_end)
>  {
>         struct msm_gem_address_space *aspace;
> -       int ret;
>
>         /*
>          * Setup IOMMU.. eventually we will (I think) do this once per context
> @@ -833,17 +832,9 @@ msm_gpu_create_address_space(struct msm_gpu *gpu, struct platform_device *pdev,
>                         va_start, va_end);
>         }
>
> -       if (IS_ERR(aspace)) {
> +       if (IS_ERR(aspace))
>                 DRM_DEV_ERROR(gpu->dev->dev, "failed to init mmu: %ld\n",
>                         PTR_ERR(aspace));
> -               return ERR_CAST(aspace);
> -       }
> -
> -       ret = aspace->mmu->funcs->attach(aspace->mmu);
> -       if (ret) {
> -               msm_gem_address_space_put(aspace);
> -               return ERR_PTR(ret);
> -       }
>
>         return aspace;
>  }
> diff --git a/drivers/gpu/drm/msm/msm_gpummu.c b/drivers/gpu/drm/msm/msm_gpummu.c
> index 34980d8..0ad0f84 100644
> --- a/drivers/gpu/drm/msm/msm_gpummu.c
> +++ b/drivers/gpu/drm/msm/msm_gpummu.c
> @@ -21,11 +21,6 @@ struct msm_gpummu {
>  #define GPUMMU_PAGE_SIZE SZ_4K
>  #define TABLE_SIZE (sizeof(uint32_t) * GPUMMU_VA_RANGE / GPUMMU_PAGE_SIZE)
>
> -static int msm_gpummu_attach(struct msm_mmu *mmu)
> -{
> -       return 0;
> -}
> -
>  static void msm_gpummu_detach(struct msm_mmu *mmu)
>  {
>  }
> @@ -85,7 +80,6 @@ static void msm_gpummu_destroy(struct msm_mmu *mmu)
>  }
>
>  static const struct msm_mmu_funcs funcs = {
> -               .attach = msm_gpummu_attach,
>                 .detach = msm_gpummu_detach,
>                 .map = msm_gpummu_map,
>                 .unmap = msm_gpummu_unmap,
> diff --git a/drivers/gpu/drm/msm/msm_iommu.c b/drivers/gpu/drm/msm/msm_iommu.c
> index ad58cfe..544c519 100644
> --- a/drivers/gpu/drm/msm/msm_iommu.c
> +++ b/drivers/gpu/drm/msm/msm_iommu.c
> @@ -23,13 +23,6 @@ static int msm_fault_handler(struct iommu_domain *domain, struct device *dev,
>         return 0;
>  }
>
> -static int msm_iommu_attach(struct msm_mmu *mmu)
> -{
> -       struct msm_iommu *iommu = to_msm_iommu(mmu);
> -
> -       return iommu_attach_device(iommu->domain, mmu->dev);
> -}
> -
>  static void msm_iommu_detach(struct msm_mmu *mmu)
>  {
>         struct msm_iommu *iommu = to_msm_iommu(mmu);
> @@ -66,7 +59,6 @@ static void msm_iommu_destroy(struct msm_mmu *mmu)
>  }
>
>  static const struct msm_mmu_funcs funcs = {
> -               .attach = msm_iommu_attach,
>                 .detach = msm_iommu_detach,
>                 .map = msm_iommu_map,
>                 .unmap = msm_iommu_unmap,
> @@ -76,6 +68,7 @@ static const struct msm_mmu_funcs funcs = {
>  struct msm_mmu *msm_iommu_new(struct device *dev, struct iommu_domain *domain)
>  {
>         struct msm_iommu *iommu;
> +       int ret;
>
>         iommu = kzalloc(sizeof(*iommu), GFP_KERNEL);
>         if (!iommu)
> @@ -85,5 +78,11 @@ struct msm_mmu *msm_iommu_new(struct device *dev, struct iommu_domain *domain)
>         msm_mmu_init(&iommu->base, dev, &funcs);
>         iommu_set_fault_handler(domain, msm_fault_handler, iommu);
>
> +       ret = iommu_attach_device(iommu->domain, dev);
> +       if (ret) {
> +               kfree(iommu);
> +               return ERR_PTR(ret);
> +       }
> +
>         return &iommu->base;
>  }
> diff --git a/drivers/gpu/drm/msm/msm_mmu.h b/drivers/gpu/drm/msm/msm_mmu.h
> index 67a623f..bae9e8e 100644
> --- a/drivers/gpu/drm/msm/msm_mmu.h
> +++ b/drivers/gpu/drm/msm/msm_mmu.h
> @@ -10,7 +10,6 @@
>  #include <linux/iommu.h>
>
>  struct msm_mmu_funcs {
> -       int (*attach)(struct msm_mmu *mmu);
>         void (*detach)(struct msm_mmu *mmu);
>         int (*map)(struct msm_mmu *mmu, uint64_t iova, struct sg_table *sgt,
>                         unsigned len, int prot);
> --
> 2.7.4
>
