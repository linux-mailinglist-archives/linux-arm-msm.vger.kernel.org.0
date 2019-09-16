Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1148CB41EC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Sep 2019 22:35:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733193AbfIPUfK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 16 Sep 2019 16:35:10 -0400
Received: from mail-ed1-f65.google.com ([209.85.208.65]:33735 "EHLO
        mail-ed1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1733068AbfIPUfJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 16 Sep 2019 16:35:09 -0400
Received: by mail-ed1-f65.google.com with SMTP id c4so1308100edl.0;
        Mon, 16 Sep 2019 13:35:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Q/rebv9wsO+q8MVXmYG+p/JA3CBBmZHyA6AXxuPQmzE=;
        b=lduYPSOPBWb/QNwuuKaHgbUDwiu9BOLUDjJ8mujRs+fp6/iKrUb0zwi+0RaW5k4+zX
         JJzjlW8gwNE4+jllQDkwjXl2cV35WgzxqC2i2RKB227EkxILI5SfXpl1oRsT3vrHpcsM
         GfiMrutdZYxMpTGP032Tbry8R+cdeDbd6NTXgoLOvwOW+GPvkB5C611fdBGrQ948aRN0
         3xsd4mqLj3jzY2N8ZZPMyr8ZTc/WkOaBw22voPB7ZS+ZZ/h6NaZ51vT991gbiR38kBhj
         RC8x8/T8C3eOMSuNh6a1aC0zt7smPW0Dlv8d2ihnkyXy7xfKw/MeEAQMZcRtT87ijq9K
         QzEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Q/rebv9wsO+q8MVXmYG+p/JA3CBBmZHyA6AXxuPQmzE=;
        b=OkcRWZV/xdohxCl2EGd8IewmHe1yN6E7zga+aHy5Ces82DgFabxl/abyxl6LHU8UQa
         20apMi+9Qj5hXg53vfOiMXZoR1hnfblzOOyBl/peJrXMzxrENQQ08YPsuMRDTfeYQoFO
         X6aNGA9T33JJA4Y0+ksepKdbvrGyUjg6+irtvauKdjqW6jkbtywYJs8chGm8BRpII7W3
         bQV0WhGY7aiT+zDIix7RlCzs9HoyfZhTWiUxYhNFnMfcDMl3ld15LAtSW6DY0NakXo72
         LopQqbuz60tRUAuZq0DPIbbwzjY/UwgG8oHXPwASbp8WHtGOjQJ8zr5mdcvaOFoVZVYI
         MY8Q==
X-Gm-Message-State: APjAAAVrZTbeBjgLpefGhALuJ9vgA+1sNAPh82HkTpv2AuLBkvjaID1/
        7rjoWSwnUahRIC5mhc+CnnFf4OUbm+PXKw4fXa0=
X-Google-Smtp-Source: APXvYqxnZrbgwzQkVpTi0seq+qXX7utxHe2jpUINK2klL8SmspHXd1INix8kI1bAC6Gnn6hyzrRo6kH9l4pIWIgD78g=
X-Received: by 2002:a50:935d:: with SMTP id n29mr1215602eda.294.1568666106912;
 Mon, 16 Sep 2019 13:35:06 -0700 (PDT)
MIME-Version: 1.0
References: <20190916201154.212465-1-ddavenport@chromium.org>
In-Reply-To: <20190916201154.212465-1-ddavenport@chromium.org>
From:   Rob Clark <robdclark@gmail.com>
Date:   Mon, 16 Sep 2019 13:34:55 -0700
Message-ID: <CAF6AEGurXuCMj=bc5=9CwBqzNM_BKEaJupk+-V7=aYou=wgmDQ@mail.gmail.com>
Subject: Re: [PATCH] drm/msm: Remove unused function arguments
To:     Drew Davenport <ddavenport@chromium.org>
Cc:     dri-devel <dri-devel@lists.freedesktop.org>,
        Sean Paul <sean@poorly.run>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        David Airlie <airlied@linux.ie>,
        Thomas Gleixner <tglx@linutronix.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Jeykumar Sankaran <jsanka@codeaurora.org>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Sravanthi Kollukuduru <skolluku@codeaurora.org>,
        Enrico Weigelt <info@metux.net>,
        Bruce Wang <bzwang@chromium.org>,
        Sam Ravnborg <sam@ravnborg.org>,
        Brian Masney <masneyb@onstation.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Georgi Djakov <georgi.djakov@linaro.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        Mamta Shukla <mamtashukla555@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Sep 16, 2019 at 1:12 PM Drew Davenport <ddavenport@chromium.org> wrote:
>
> The arguments related to IOMMU port name have been unused since
> commit 944fc36c31ed ("drm/msm: use upstream iommu") and can be removed.
>
> Signed-off-by: Drew Davenport <ddavenport@chromium.org>
> ---
> Rob, in the original commit the port name stuff was left intentionally.
> Would it be alright to remove it now?

Upstream support for snapdragon has improved considerably since then,
it's been at least a couple years since I've had to backport drm to a
downstream android vendor kernel.  (And I think the downstream vendor
kernel is getting closer to upstream.)  So I think we can drop things
that were originally left in place to simplify backporting to vendor
kernel.

(Also, some of the regulator usage falls into this category.. at one
point the downstream kernel modeled gdsc's as regulators, but upstream
uses genpd.)

BR,
-R

>
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c  | 10 ++--------
>  drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c | 10 ++--------
>  drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c | 10 ++--------
>  drivers/gpu/drm/msm/msm_gpu.c            |  5 ++---
>  drivers/gpu/drm/msm/msm_gpummu.c         |  6 ++----
>  drivers/gpu/drm/msm/msm_iommu.c          |  6 ++----
>  drivers/gpu/drm/msm/msm_mmu.h            |  4 ++--
>  7 files changed, 14 insertions(+), 37 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> index 58b0485dc375..3165c2db2541 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> @@ -30,10 +30,6 @@
>  #define CREATE_TRACE_POINTS
>  #include "dpu_trace.h"
>
> -static const char * const iommu_ports[] = {
> -               "mdp_0",
> -};
> -
>  /*
>   * To enable overall DRM driver logging
>   * # echo 0x2 > /sys/module/drm/parameters/debug
> @@ -725,8 +721,7 @@ static void _dpu_kms_mmu_destroy(struct dpu_kms *dpu_kms)
>
>         mmu = dpu_kms->base.aspace->mmu;
>
> -       mmu->funcs->detach(mmu, (const char **)iommu_ports,
> -                       ARRAY_SIZE(iommu_ports));
> +       mmu->funcs->detach(mmu);
>         msm_gem_address_space_put(dpu_kms->base.aspace);
>
>         dpu_kms->base.aspace = NULL;
> @@ -752,8 +747,7 @@ static int _dpu_kms_mmu_init(struct dpu_kms *dpu_kms)
>                 return PTR_ERR(aspace);
>         }
>
> -       ret = aspace->mmu->funcs->attach(aspace->mmu, iommu_ports,
> -                       ARRAY_SIZE(iommu_ports));
> +       ret = aspace->mmu->funcs->attach(aspace->mmu);
>         if (ret) {
>                 DPU_ERROR("failed to attach iommu %d\n", ret);
>                 msm_gem_address_space_put(aspace);
> diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
> index 50711ccc8691..dda05436f716 100644
> --- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
> +++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
> @@ -157,10 +157,6 @@ static long mdp4_round_pixclk(struct msm_kms *kms, unsigned long rate,
>         }
>  }
>
> -static const char * const iommu_ports[] = {
> -       "mdp_port0_cb0", "mdp_port1_cb0",
> -};
> -
>  static void mdp4_destroy(struct msm_kms *kms)
>  {
>         struct mdp4_kms *mdp4_kms = to_mdp4_kms(to_mdp_kms(kms));
> @@ -172,8 +168,7 @@ static void mdp4_destroy(struct msm_kms *kms)
>         drm_gem_object_put_unlocked(mdp4_kms->blank_cursor_bo);
>
>         if (aspace) {
> -               aspace->mmu->funcs->detach(aspace->mmu,
> -                               iommu_ports, ARRAY_SIZE(iommu_ports));
> +               aspace->mmu->funcs->detach(aspace->mmu);
>                 msm_gem_address_space_put(aspace);
>         }
>
> @@ -524,8 +519,7 @@ struct msm_kms *mdp4_kms_init(struct drm_device *dev)
>
>                 kms->aspace = aspace;
>
> -               ret = aspace->mmu->funcs->attach(aspace->mmu, iommu_ports,
> -                               ARRAY_SIZE(iommu_ports));
> +               ret = aspace->mmu->funcs->attach(aspace->mmu);
>                 if (ret)
>                         goto fail;
>         } else {
> diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
> index 91cd76a2bab1..f8bd0bfcf4b0 100644
> --- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
> +++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
> @@ -19,10 +19,6 @@
>  #include "msm_mmu.h"
>  #include "mdp5_kms.h"
>
> -static const char *iommu_ports[] = {
> -               "mdp_0",
> -};
> -
>  static int mdp5_hw_init(struct msm_kms *kms)
>  {
>         struct mdp5_kms *mdp5_kms = to_mdp5_kms(to_mdp_kms(kms));
> @@ -233,8 +229,7 @@ static void mdp5_kms_destroy(struct msm_kms *kms)
>                 mdp5_pipe_destroy(mdp5_kms->hwpipes[i]);
>
>         if (aspace) {
> -               aspace->mmu->funcs->detach(aspace->mmu,
> -                               iommu_ports, ARRAY_SIZE(iommu_ports));
> +               aspace->mmu->funcs->detach(aspace->mmu);
>                 msm_gem_address_space_put(aspace);
>         }
>  }
> @@ -737,8 +732,7 @@ struct msm_kms *mdp5_kms_init(struct drm_device *dev)
>
>                 kms->aspace = aspace;
>
> -               ret = aspace->mmu->funcs->attach(aspace->mmu, iommu_ports,
> -                               ARRAY_SIZE(iommu_ports));
> +               ret = aspace->mmu->funcs->attach(aspace->mmu);
>                 if (ret) {
>                         DRM_DEV_ERROR(&pdev->dev, "failed to attach iommu: %d\n",
>                                 ret);
> diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
> index a052364a5d74..122199af0381 100644
> --- a/drivers/gpu/drm/msm/msm_gpu.c
> +++ b/drivers/gpu/drm/msm/msm_gpu.c
> @@ -838,7 +838,7 @@ msm_gpu_create_address_space(struct msm_gpu *gpu, struct platform_device *pdev,
>                 return ERR_CAST(aspace);
>         }
>
> -       ret = aspace->mmu->funcs->attach(aspace->mmu, NULL, 0);
> +       ret = aspace->mmu->funcs->attach(aspace->mmu);
>         if (ret) {
>                 msm_gem_address_space_put(aspace);
>                 return ERR_PTR(ret);
> @@ -995,8 +995,7 @@ void msm_gpu_cleanup(struct msm_gpu *gpu)
>         msm_gem_kernel_put(gpu->memptrs_bo, gpu->aspace, false);
>
>         if (!IS_ERR_OR_NULL(gpu->aspace)) {
> -               gpu->aspace->mmu->funcs->detach(gpu->aspace->mmu,
> -                       NULL, 0);
> +               gpu->aspace->mmu->funcs->detach(gpu->aspace->mmu);
>                 msm_gem_address_space_put(gpu->aspace);
>         }
>  }
> diff --git a/drivers/gpu/drm/msm/msm_gpummu.c b/drivers/gpu/drm/msm/msm_gpummu.c
> index 34f643a0c28a..34980d8eb7ad 100644
> --- a/drivers/gpu/drm/msm/msm_gpummu.c
> +++ b/drivers/gpu/drm/msm/msm_gpummu.c
> @@ -21,14 +21,12 @@ struct msm_gpummu {
>  #define GPUMMU_PAGE_SIZE SZ_4K
>  #define TABLE_SIZE (sizeof(uint32_t) * GPUMMU_VA_RANGE / GPUMMU_PAGE_SIZE)
>
> -static int msm_gpummu_attach(struct msm_mmu *mmu, const char * const *names,
> -               int cnt)
> +static int msm_gpummu_attach(struct msm_mmu *mmu)
>  {
>         return 0;
>  }
>
> -static void msm_gpummu_detach(struct msm_mmu *mmu, const char * const *names,
> -               int cnt)
> +static void msm_gpummu_detach(struct msm_mmu *mmu)
>  {
>  }
>
> diff --git a/drivers/gpu/drm/msm/msm_iommu.c b/drivers/gpu/drm/msm/msm_iommu.c
> index 8c95c31e2b12..ad58cfe5998e 100644
> --- a/drivers/gpu/drm/msm/msm_iommu.c
> +++ b/drivers/gpu/drm/msm/msm_iommu.c
> @@ -23,16 +23,14 @@ static int msm_fault_handler(struct iommu_domain *domain, struct device *dev,
>         return 0;
>  }
>
> -static int msm_iommu_attach(struct msm_mmu *mmu, const char * const *names,
> -                           int cnt)
> +static int msm_iommu_attach(struct msm_mmu *mmu)
>  {
>         struct msm_iommu *iommu = to_msm_iommu(mmu);
>
>         return iommu_attach_device(iommu->domain, mmu->dev);
>  }
>
> -static void msm_iommu_detach(struct msm_mmu *mmu, const char * const *names,
> -                            int cnt)
> +static void msm_iommu_detach(struct msm_mmu *mmu)
>  {
>         struct msm_iommu *iommu = to_msm_iommu(mmu);
>
> diff --git a/drivers/gpu/drm/msm/msm_mmu.h b/drivers/gpu/drm/msm/msm_mmu.h
> index 871d56303697..67a623f14319 100644
> --- a/drivers/gpu/drm/msm/msm_mmu.h
> +++ b/drivers/gpu/drm/msm/msm_mmu.h
> @@ -10,8 +10,8 @@
>  #include <linux/iommu.h>
>
>  struct msm_mmu_funcs {
> -       int (*attach)(struct msm_mmu *mmu, const char * const *names, int cnt);
> -       void (*detach)(struct msm_mmu *mmu, const char * const *names, int cnt);
> +       int (*attach)(struct msm_mmu *mmu);
> +       void (*detach)(struct msm_mmu *mmu);
>         int (*map)(struct msm_mmu *mmu, uint64_t iova, struct sg_table *sgt,
>                         unsigned len, int prot);
>         int (*unmap)(struct msm_mmu *mmu, uint64_t iova, unsigned len);
> --
> 2.20.1
>
