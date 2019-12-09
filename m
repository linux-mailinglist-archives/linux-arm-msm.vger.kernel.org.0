Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E203B117726
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Dec 2019 21:14:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726509AbfLIUOV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 9 Dec 2019 15:14:21 -0500
Received: from mail-ed1-f67.google.com ([209.85.208.67]:39700 "EHLO
        mail-ed1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726502AbfLIUOV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 9 Dec 2019 15:14:21 -0500
Received: by mail-ed1-f67.google.com with SMTP id v16so13843868edy.6;
        Mon, 09 Dec 2019 12:14:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ywh/fPF8YzV1CmuZ62hC+sb8SV7PDn0YD92J60m8Z5M=;
        b=i+oqJhwOCqolWGBm00Kb49q5F64UWzI4eKGPOYSg82c77Vcdy6MUKcUvq221GTIz+Y
         UNZAZVriHXUTQMby8Ri8wlpb6vsz13OBffGka5hubzb1+7hly/pgr0P8fA+PHuaGqZAH
         oYYGOWx1X4xP91ed1+nvJ8sEaxcec6AWEMcBpZjq9e78oCtTSAC2i6zzL+2hvmq6GVA0
         o0ZOVBJLNkNVhl48ndCk2TWWRzfDGckM7hwbd4fEk1+iWJrZmf/moO0nBEADNffU9oG4
         CUxvRsITqNEf0gHOUb7zGqEj21+5CwCLsIpaL5wVHjwdhH1DD7Kv+EsCSr+4lU/uaHZS
         LFmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ywh/fPF8YzV1CmuZ62hC+sb8SV7PDn0YD92J60m8Z5M=;
        b=kEDTamuNip4F6nrx5F6MP+Xyg6C9DfZqetnWTb4ncEwfh28Y9/xRiSoWc6iVgHd55t
         udU/pByh5W/zBkJRubjhCKpqMWaHAeN21EM1ts9zHVPx0x3xYETHnQMesVSUZKYbrGsi
         ow5cVpiq/m6ODw557+NpKdXD2r+hzxsryQXpVLGwrxCVX+H1v0eDWAiKhKM3PpxGgAYU
         9LBd4+6c/gEq/zfbGi0ch0sYkR77DaTVk5ixTuDKCHyzRvOJOclIBzgeiB8rEHrIRw86
         RJjMV8NOQLAa8BQ5PPkd6Eh7Dv6O4oVzXTreYbjIB5GDaQBJG+TeyN9pTiOw9tqNke0w
         jnhw==
X-Gm-Message-State: APjAAAXEKjumUjMX7S5aFzON7EBfnWJxq7v6qiPBNuY6Vo5CTiYfEcKE
        WyUMFQY2Ll9Uf+zCJFjx+0KxzWs+l2Xbmw1DoQw/B3NS
X-Google-Smtp-Source: APXvYqzgxjpqpYC6B6Zbo5mF6q/AeeF6hOLuvtN36iCGgPkDFJqnxamFeKgiFqz282EOMtXmox2F5xwbxEqK8nJSMaQ=
X-Received: by 2002:a17:906:958e:: with SMTP id r14mr32492382ejx.228.1575922458351;
 Mon, 09 Dec 2019 12:14:18 -0800 (PST)
MIME-Version: 1.0
References: <1574465484-7115-1-git-send-email-jcrouse@codeaurora.org> <0101016e95755c16-5ab6f6e7-83bb-4d01-b746-7cc6ea265ad7-000000@us-west-2.amazonses.com>
In-Reply-To: <0101016e95755c16-5ab6f6e7-83bb-4d01-b746-7cc6ea265ad7-000000@us-west-2.amazonses.com>
From:   Rob Clark <robdclark@gmail.com>
Date:   Mon, 9 Dec 2019 12:14:08 -0800
Message-ID: <CAF6AEGt4G5y0obhhwm==ZWXaajH5fte0nhGQw3RAy6_2GQKkyw@mail.gmail.com>
Subject: Re: [PATCH v2 6/8] drm/msm: Refactor address space initialization
To:     Jordan Crouse <jcrouse@codeaurora.org>
Cc:     "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>, Joerg
        Roedel <joro@8bytes.org>," <iommu@lists.linux-foundation.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Will Deacon <will@kernel.org>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Sean Paul <sean@poorly.run>,
        Sharat Masetty <smasetty@codeaurora.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        David Airlie <airlied@linux.ie>,
        Allison Randal <allison@lohutok.net>,
        Ben Dooks <ben.dooks@codethink.co.uk>,
        Thomas Gleixner <tglx@linutronix.de>,
        Douglas Anderson <dianders@chromium.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        Wen Yang <wen.yang99@zte.com.cn>,
        Alexios Zavras <alexios.zavras@intel.com>,
        Jeykumar Sankaran <jsanka@codeaurora.org>,
        AngeloGioacchino Del Regno <kholk11@gmail.com>,
        Bruce Wang <bzwang@chromium.org>,
        Sam Ravnborg <sam@ravnborg.org>,
        Brian Masney <masneyb@onstation.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Drew Davenport <ddavenport@chromium.org>,
        Georgi Djakov <georgi.djakov@linaro.org>,
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
> Refactor how address space initialization works. Instead of having the
> address space function create the MMU object (and thus require separate but
> equal functions for gpummu and iommu) use a single function and pass the
> MMU struct in. Make the generic code cleaner by using target specific
> functions to create the address space so a2xx can do its own thing in its
> own space.  For all the other targets use a generic helper to initialize
> IOMMU but leave the door open for newer targets to use customization
> if they need it.
>
> Signed-off-by: Jordan Crouse <jcrouse@codeaurora.org>

Reviewed-by: Rob Clark <robdclark@gmail.com>

> ---
>
>  drivers/gpu/drm/msm/adreno/a2xx_gpu.c    | 16 ++++++++++
>  drivers/gpu/drm/msm/adreno/a3xx_gpu.c    |  1 +
>  drivers/gpu/drm/msm/adreno/a4xx_gpu.c    |  1 +
>  drivers/gpu/drm/msm/adreno/a5xx_gpu.c    |  1 +
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c    |  1 +
>  drivers/gpu/drm/msm/adreno/adreno_gpu.c  | 23 ++++++++++----
>  drivers/gpu/drm/msm/adreno/adreno_gpu.h  |  8 +++++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c  | 10 +++---
>  drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c | 14 +++++----
>  drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c |  4 ---
>  drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c | 11 +++++--
>  drivers/gpu/drm/msm/msm_drv.h            |  8 ++---
>  drivers/gpu/drm/msm/msm_gem_vma.c        | 52 +++++---------------------------
>  drivers/gpu/drm/msm/msm_gpu.c            | 40 ++----------------------
>  drivers/gpu/drm/msm/msm_gpu.h            |  4 +--
>  drivers/gpu/drm/msm/msm_iommu.c          |  3 ++
>  16 files changed, 83 insertions(+), 114 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/adreno/a2xx_gpu.c b/drivers/gpu/drm/msm/adreno/a2xx_gpu.c
> index 1f83bc1..60f6472 100644
> --- a/drivers/gpu/drm/msm/adreno/a2xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a2xx_gpu.c
> @@ -401,6 +401,21 @@ static struct msm_gpu_state *a2xx_gpu_state_get(struct msm_gpu *gpu)
>         return state;
>  }
>
> +static struct msm_gem_address_space *
> +a2xx_create_address_space(struct msm_gpu *gpu, struct platform_device *pdev)
> +{
> +       struct msm_mmu *mmu = msm_gpummu_new(&pdev->dev, gpu);
> +       struct msm_gem_address_space *aspace;
> +
> +       aspace = msm_gem_address_space_create(mmu, "gpu", SZ_16M,
> +               SZ_16M + 0xfff * SZ_64K);
> +
> +       if (IS_ERR(aspace) && !IS_ERR(mmu))
> +               mmu->funcs->destroy(mmu);
> +
> +       return aspace;
> +}
> +
>  /* Register offset defines for A2XX - copy of A3XX */
>  static const unsigned int a2xx_register_offsets[REG_ADRENO_REGISTER_MAX] = {
>         REG_ADRENO_DEFINE(REG_ADRENO_CP_RB_BASE, REG_AXXX_CP_RB_BASE),
> @@ -429,6 +444,7 @@ static const struct adreno_gpu_funcs funcs = {
>  #endif
>                 .gpu_state_get = a2xx_gpu_state_get,
>                 .gpu_state_put = adreno_gpu_state_put,
> +               .create_address_space = a2xx_create_address_space,
>         },
>  };
>
> diff --git a/drivers/gpu/drm/msm/adreno/a3xx_gpu.c b/drivers/gpu/drm/msm/adreno/a3xx_gpu.c
> index 7ad1493..41e51e0 100644
> --- a/drivers/gpu/drm/msm/adreno/a3xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a3xx_gpu.c
> @@ -441,6 +441,7 @@ static const struct adreno_gpu_funcs funcs = {
>  #endif
>                 .gpu_state_get = a3xx_gpu_state_get,
>                 .gpu_state_put = adreno_gpu_state_put,
> +               .create_address_space = adreno_iommu_create_address_space,
>         },
>  };
>
> diff --git a/drivers/gpu/drm/msm/adreno/a4xx_gpu.c b/drivers/gpu/drm/msm/adreno/a4xx_gpu.c
> index b01388a..3655440 100644
> --- a/drivers/gpu/drm/msm/adreno/a4xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a4xx_gpu.c
> @@ -532,6 +532,7 @@ static const struct adreno_gpu_funcs funcs = {
>  #endif
>                 .gpu_state_get = a4xx_gpu_state_get,
>                 .gpu_state_put = adreno_gpu_state_put,
> +               .create_address_space = adreno_iommu_create_address_space,
>         },
>         .get_timestamp = a4xx_get_timestamp,
>  };
> diff --git a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
> index b02e204..0f5db72 100644
> --- a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
> @@ -1432,6 +1432,7 @@ static const struct adreno_gpu_funcs funcs = {
>                 .gpu_busy = a5xx_gpu_busy,
>                 .gpu_state_get = a5xx_gpu_state_get,
>                 .gpu_state_put = a5xx_gpu_state_put,
> +               .create_address_space = adreno_iommu_create_address_space,
>         },
>         .get_timestamp = a5xx_get_timestamp,
>  };
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> index dc8ec2c..5dc0b2c 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -832,6 +832,7 @@ static const struct adreno_gpu_funcs funcs = {
>  #if defined(CONFIG_DRM_MSM_GPU_STATE)
>                 .gpu_state_get = a6xx_gpu_state_get,
>                 .gpu_state_put = a6xx_gpu_state_put,
> +               .create_address_space = adreno_iommu_create_address_space,
>  #endif
>         },
>         .get_timestamp = a6xx_get_timestamp,
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> index 0783e4b..09c57891 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> @@ -157,6 +157,23 @@ int adreno_zap_shader_load(struct msm_gpu *gpu, u32 pasid)
>         return zap_shader_load_mdt(gpu, adreno_gpu->info->zapfw, pasid);
>  }
>
> +struct msm_gem_address_space *
> +adreno_iommu_create_address_space(struct msm_gpu *gpu,
> +               struct platform_device *pdev)
> +{
> +       struct iommu_domain *iommu = iommu_domain_alloc(&platform_bus_type);
> +       struct msm_mmu *mmu = msm_iommu_new(&pdev->dev, iommu);
> +       struct msm_gem_address_space *aspace;
> +
> +       aspace = msm_gem_address_space_create(mmu, "gpu", SZ_16M,
> +               0xfffffff);
> +
> +       if (IS_ERR(aspace) && !IS_ERR(mmu))
> +               mmu->funcs->destroy(mmu);
> +
> +       return aspace;
> +}
> +
>  int adreno_get_param(struct msm_gpu *gpu, uint32_t param, uint64_t *value)
>  {
>         struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
> @@ -949,12 +966,6 @@ int adreno_gpu_init(struct drm_device *drm, struct platform_device *pdev,
>
>         adreno_gpu_config.ioname = "kgsl_3d0_reg_memory";
>
> -       adreno_gpu_config.va_start = SZ_16M;
> -       adreno_gpu_config.va_end = 0xffffffff;
> -       /* maximum range of a2xx mmu */
> -       if (adreno_is_a2xx(adreno_gpu))
> -               adreno_gpu_config.va_end = SZ_16M + 0xfff * SZ_64K;
> -
>         adreno_gpu_config.nr_rings = nr_rings;
>
>         adreno_get_pwrlevels(&pdev->dev, gpu);
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> index e71a757..5c1aa12 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> @@ -263,6 +263,14 @@ int adreno_gpu_state_get(struct msm_gpu *gpu, struct msm_gpu_state *state);
>  int adreno_gpu_state_put(struct msm_gpu_state *state);
>
>  /*
> + * Common helper function to initialize the default address space for arm-smmu
> + * attached targets
> + */
> +struct msm_gem_address_space *
> +adreno_iommu_create_address_space(struct msm_gpu *gpu,
> +               struct platform_device *pdev);
> +
> +/*
>   * For a5xx and a6xx targets load the zap shader that is used to pull the GPU
>   * out of secure mode
>   */
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> index b082b23..4e6ebbd 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> @@ -704,18 +704,18 @@ static int _dpu_kms_mmu_init(struct dpu_kms *dpu_kms)
>  {
>         struct iommu_domain *domain;
>         struct msm_gem_address_space *aspace;
> +       struct msm_mmu *mmu;
>
>         domain = iommu_domain_alloc(&platform_bus_type);
>         if (!domain)
>                 return 0;
>
> -       domain->geometry.aperture_start = 0x1000;
> -       domain->geometry.aperture_end = 0xffffffff;
> +       mmu = msm_iommu_new(dpu_kms->dev->dev, domain);
> +       aspace = msm_gem_address_space_create(mmu, "dpu1",
> +               0x1000, 0xfffffff);
>
> -       aspace = msm_gem_address_space_create(dpu_kms->dev->dev,
> -                       domain, "dpu1");
>         if (IS_ERR(aspace)) {
> -               iommu_domain_free(domain);
> +               mmu->funcs->destroy(mmu);
>                 return PTR_ERR(aspace);
>         }
>
> diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
> index 9dba37c..0889718 100644
> --- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
> +++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
> @@ -510,9 +510,15 @@ struct msm_kms *mdp4_kms_init(struct drm_device *dev)
>         mdelay(16);
>
>         if (config->iommu) {
> -               aspace = msm_gem_address_space_create(&pdev->dev,
> -                               config->iommu, "mdp4");
> +               struct msm_mmu *mmu = msm_iommu_new(&pdev->dev,
> +                       config->iommu);
> +
> +               aspace  = msm_gem_address_space_create(mmu,
> +                       "mdp4", 0x1000, 0xffffffff);
> +
>                 if (IS_ERR(aspace)) {
> +                       if (!IS_ERR(mmu))
> +                               mmu->funcs->destroy(mmu);
>                         ret = PTR_ERR(aspace);
>                         goto fail;
>                 }
> @@ -565,10 +571,6 @@ static struct mdp4_platform_config *mdp4_get_config(struct platform_device *dev)
>         /* TODO: Chips that aren't apq8064 have a 200 Mhz max_clk */
>         config.max_clk = 266667000;
>         config.iommu = iommu_domain_alloc(&platform_bus_type);
> -       if (config.iommu) {
> -               config.iommu->geometry.aperture_start = 0x1000;
> -               config.iommu->geometry.aperture_end = 0xffffffff;
> -       }
>
>         return &config;
>  }
> diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c
> index 1f48f64..ebd651a 100644
> --- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c
> +++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c
> @@ -941,10 +941,6 @@ static struct mdp5_cfg_platform *mdp5_get_config(struct platform_device *dev)
>         static struct mdp5_cfg_platform config = {};
>
>         config.iommu = iommu_domain_alloc(&platform_bus_type);
> -       if (config.iommu) {
> -               config.iommu->geometry.aperture_start = 0x1000;
> -               config.iommu->geometry.aperture_end = 0xffffffff;
> -       }
>
>         return &config;
>  }
> diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
> index 653dab2..20bdff9 100644
> --- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
> +++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
> @@ -724,13 +724,20 @@ struct msm_kms *mdp5_kms_init(struct drm_device *dev)
>         mdelay(16);
>
>         if (config->platform.iommu) {
> +               struct msm_mmu *mmu;
> +
>                 iommu_dev = &pdev->dev;
>                 if (!iommu_dev->iommu_fwspec)
>                         iommu_dev = iommu_dev->parent;
>
> -               aspace = msm_gem_address_space_create(iommu_dev,
> -                               config->platform.iommu, "mdp5");
> +               mmu = msm_iommu_new(iommu_dev, config->platform.iommu);
> +
> +               aspace = msm_gem_address_space_create(mmu, "mdp5",
> +                       0x1000, 0xffffffff);
> +
>                 if (IS_ERR(aspace)) {
> +                       if (!IS_ERR(mmu))
> +                               mmu->funcs->destroy(mmu);
>                         ret = PTR_ERR(aspace);
>                         goto fail;
>                 }
> diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
> index 71547e7..2203729 100644
> --- a/drivers/gpu/drm/msm/msm_drv.h
> +++ b/drivers/gpu/drm/msm/msm_drv.h
> @@ -247,12 +247,8 @@ void msm_gem_close_vma(struct msm_gem_address_space *aspace,
>  void msm_gem_address_space_put(struct msm_gem_address_space *aspace);
>
>  struct msm_gem_address_space *
> -msm_gem_address_space_create(struct device *dev, struct iommu_domain *domain,
> -               const char *name);
> -
> -struct msm_gem_address_space *
> -msm_gem_address_space_create_a2xx(struct device *dev, struct msm_gpu *gpu,
> -               const char *name, uint64_t va_start, uint64_t va_end);
> +msm_gem_address_space_create(struct msm_mmu *mmu, const char *name,
> +               u64 va_start, u64 va_end);
>
>  int msm_register_mmu(struct drm_device *dev, struct msm_mmu *mmu);
>  void msm_unregister_mmu(struct drm_device *dev, struct msm_mmu *mmu);
> diff --git a/drivers/gpu/drm/msm/msm_gem_vma.c b/drivers/gpu/drm/msm/msm_gem_vma.c
> index 91d993a..075ce52 100644
> --- a/drivers/gpu/drm/msm/msm_gem_vma.c
> +++ b/drivers/gpu/drm/msm/msm_gem_vma.c
> @@ -125,63 +125,25 @@ int msm_gem_init_vma(struct msm_gem_address_space *aspace,
>         return 0;
>  }
>
> -
>  struct msm_gem_address_space *
> -msm_gem_address_space_create(struct device *dev, struct iommu_domain *domain,
> -               const char *name)
> -{
> -       struct msm_gem_address_space *aspace;
> -       u64 start = domain->geometry.aperture_start;
> -       u64 size = domain->geometry.aperture_end - start;
> -
> -       aspace = kzalloc(sizeof(*aspace), GFP_KERNEL);
> -       if (!aspace)
> -               return ERR_PTR(-ENOMEM);
> -
> -       spin_lock_init(&aspace->lock);
> -       aspace->name = name;
> -       aspace->mmu = msm_iommu_new(dev, domain);
> -       if (IS_ERR(aspace->mmu)) {
> -               int ret = PTR_ERR(aspace->mmu);
> -
> -               kfree(aspace);
> -               return ERR_PTR(ret);
> -       }
> -
> -       /*
> -        * Attaching the IOMMU device changes the aperture values so use the
> -        * cached values instead
> -        */
> -       drm_mm_init(&aspace->mm, start >> PAGE_SHIFT, size >> PAGE_SHIFT);
> -
> -       kref_init(&aspace->kref);
> -
> -       return aspace;
> -}
> -
> -struct msm_gem_address_space *
> -msm_gem_address_space_create_a2xx(struct device *dev, struct msm_gpu *gpu,
> -               const char *name, uint64_t va_start, uint64_t va_end)
> +msm_gem_address_space_create(struct msm_mmu *mmu, const char *name,
> +               u64 va_start, u64 va_end)
>  {
>         struct msm_gem_address_space *aspace;
>         u64 size = va_end - va_start;
>
> +       if (IS_ERR(mmu))
> +               return ERR_CAST(mmu);
> +
>         aspace = kzalloc(sizeof(*aspace), GFP_KERNEL);
>         if (!aspace)
>                 return ERR_PTR(-ENOMEM);
>
>         spin_lock_init(&aspace->lock);
>         aspace->name = name;
> -       aspace->mmu = msm_gpummu_new(dev, gpu);
> -       if (IS_ERR(aspace->mmu)) {
> -               int ret = PTR_ERR(aspace->mmu);
> -
> -               kfree(aspace);
> -               return ERR_PTR(ret);
> -       }
> +       aspace->mmu = mmu;
>
> -       drm_mm_init(&aspace->mm, (va_start >> PAGE_SHIFT),
> -               size >> PAGE_SHIFT);
> +       drm_mm_init(&aspace->mm, va_start >> PAGE_SHIFT, size >> PAGE_SHIFT);
>
>         kref_init(&aspace->kref);
>
> diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
> index f7bf80e..f11df53 100644
> --- a/drivers/gpu/drm/msm/msm_gpu.c
> +++ b/drivers/gpu/drm/msm/msm_gpu.c
> @@ -803,42 +803,6 @@ static int get_clocks(struct platform_device *pdev, struct msm_gpu *gpu)
>         return 0;
>  }
>
> -static struct msm_gem_address_space *
> -msm_gpu_create_address_space(struct msm_gpu *gpu, struct platform_device *pdev,
> -               uint64_t va_start, uint64_t va_end)
> -{
> -       struct msm_gem_address_space *aspace;
> -
> -       /*
> -        * Setup IOMMU.. eventually we will (I think) do this once per context
> -        * and have separate page tables per context.  For now, to keep things
> -        * simple and to get something working, just use a single address space:
> -        */
> -       if (!adreno_is_a2xx(to_adreno_gpu(gpu))) {
> -               struct iommu_domain *iommu = iommu_domain_alloc(&platform_bus_type);
> -               if (!iommu)
> -                       return NULL;
> -
> -               iommu->geometry.aperture_start = va_start;
> -               iommu->geometry.aperture_end = va_end;
> -
> -               DRM_DEV_INFO(gpu->dev->dev, "%s: using IOMMU\n", gpu->name);
> -
> -               aspace = msm_gem_address_space_create(&pdev->dev, iommu, "gpu");
> -               if (IS_ERR(aspace))
> -                       iommu_domain_free(iommu);
> -       } else {
> -               aspace = msm_gem_address_space_create_a2xx(&pdev->dev, gpu, "gpu",
> -                       va_start, va_end);
> -       }
> -
> -       if (IS_ERR(aspace))
> -               DRM_DEV_ERROR(gpu->dev->dev, "failed to init mmu: %ld\n",
> -                       PTR_ERR(aspace));
> -
> -       return aspace;
> -}
> -
>  int msm_gpu_init(struct drm_device *drm, struct platform_device *pdev,
>                 struct msm_gpu *gpu, const struct msm_gpu_funcs *funcs,
>                 const char *name, struct msm_gpu_config *config)
> @@ -911,8 +875,8 @@ int msm_gpu_init(struct drm_device *drm, struct platform_device *pdev,
>
>         msm_devfreq_init(gpu);
>
> -       gpu->aspace = msm_gpu_create_address_space(gpu, pdev,
> -               config->va_start, config->va_end);
> +
> +       gpu->aspace = gpu->funcs->create_address_space(gpu, pdev);
>
>         if (gpu->aspace == NULL)
>                 DRM_DEV_INFO(drm->dev, "%s: no IOMMU, fallback to VRAM carveout!\n", name);
> diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
> index ab8f0f9c..41d86c2 100644
> --- a/drivers/gpu/drm/msm/msm_gpu.h
> +++ b/drivers/gpu/drm/msm/msm_gpu.h
> @@ -21,8 +21,6 @@ struct msm_gpu_state;
>
>  struct msm_gpu_config {
>         const char *ioname;
> -       uint64_t va_start;
> -       uint64_t va_end;
>         unsigned int nr_rings;
>  };
>
> @@ -64,6 +62,8 @@ struct msm_gpu_funcs {
>         int (*gpu_state_put)(struct msm_gpu_state *state);
>         unsigned long (*gpu_get_freq)(struct msm_gpu *gpu);
>         void (*gpu_set_freq)(struct msm_gpu *gpu, unsigned long freq);
> +       struct msm_gem_address_space *(*create_address_space)
> +               (struct msm_gpu *gpu, struct platform_device *pdev);
>  };
>
>  struct msm_gpu {
> diff --git a/drivers/gpu/drm/msm/msm_iommu.c b/drivers/gpu/drm/msm/msm_iommu.c
> index 544c519..e773ef8 100644
> --- a/drivers/gpu/drm/msm/msm_iommu.c
> +++ b/drivers/gpu/drm/msm/msm_iommu.c
> @@ -70,6 +70,9 @@ struct msm_mmu *msm_iommu_new(struct device *dev, struct iommu_domain *domain)
>         struct msm_iommu *iommu;
>         int ret;
>
> +       if (!domain)
> +               return ERR_PTR(-ENODEV);
> +
>         iommu = kzalloc(sizeof(*iommu), GFP_KERNEL);
>         if (!iommu)
>                 return ERR_PTR(-ENOMEM);
> --
> 2.7.4
>
