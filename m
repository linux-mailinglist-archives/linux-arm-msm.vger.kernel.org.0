Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AD0942AC92A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Nov 2020 00:15:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729585AbgKIXPc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 9 Nov 2020 18:15:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60440 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729452AbgKIXPc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 9 Nov 2020 18:15:32 -0500
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2DED8C0613CF;
        Mon,  9 Nov 2020 15:15:32 -0800 (PST)
Received: by mail-wr1-x441.google.com with SMTP id 23so10644079wrc.8;
        Mon, 09 Nov 2020 15:15:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=jUkkMN1k1Nmarfzi7mdyLkenP8Z0h5fFEFf0HHFDPZ4=;
        b=ERHXmS2szbTgYa05ljx7O5X0mTDvdDks2MuN/zp3YSM8pX1qXceo7SGtE86Ka9CNL2
         HfweYJHgB/qUs1UUfwR9JbWIUeho+oCiaBfxMxPuXi3qqrSY44STV3yzq1FV3kGUNvV+
         27i4junuhfNr84Ic884l4UCstwWM7QVOv5e3yIzfo6gvT4VlasPUS+hAQxd53BfR2UKp
         zIx/rwaokOFMDe8xyOZAq69YrHVo/yjy4dIKp0vTalaWFSsSulesn0AF3PCrMY6Yzk4B
         Ghgu4xGBWfPM16E7gZC6uXv3xQPwcqXBkuRgR8wWkkEB39hXAzE+nRoqL8O3d0mQaLBV
         5tKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jUkkMN1k1Nmarfzi7mdyLkenP8Z0h5fFEFf0HHFDPZ4=;
        b=BXfMYSSRqhTcNIWaya1UxKy6gst2IcD0q9LxRD7ANKbo1t9ORih/nbgYwswScFSFf9
         Ip4HNLbKgsVzB+a/uhsUc0yb6MPzVHbVFncGwfpnagd3h9Ft0rn9B3Kv0SbGv9MzD/EI
         eZNujVe0h92zDQoAUEcTcFJT1ukYVYUVAELorWImCulpL5i0eDGyM0QsfF/AOoCZflfM
         Eh2FMnIo2z4p/WPlo77LV+m9Y4b64frENwxc5K+DETgQOpUgPirUL2MH5Y/84p26giHq
         A4t32TfUKMRVr0LO7nFVd/auPlPIOyJK60ySw1ITik9mAd0ZbwsxzKjsVXkPZLk6OWAd
         U/Fw==
X-Gm-Message-State: AOAM53178L4kQOyUWCL1NdatVB3gTN8eXs7/YpnbV1qqZAeRjEurmy4I
        pduGndHWazroPS1ZdNhTaBUCUjHGO7m833URazg=
X-Google-Smtp-Source: ABdhPJwY/yfydI5jTWgl7hfVjHqfW7lZxoPtyf6NY7E9mEhooa8PH5OQTyqJO0WobeHFQ3ppbO770JerF5rHoCRrB98=
X-Received: by 2002:a05:6000:7:: with SMTP id h7mr20949037wrx.83.1604963730827;
 Mon, 09 Nov 2020 15:15:30 -0800 (PST)
MIME-Version: 1.0
References: <20201109222319.2630557-1-jcrouse@codeaurora.org> <20201109222319.2630557-4-jcrouse@codeaurora.org>
In-Reply-To: <20201109222319.2630557-4-jcrouse@codeaurora.org>
From:   Rob Clark <robdclark@gmail.com>
Date:   Mon, 9 Nov 2020 15:15:19 -0800
Message-ID: <CAF6AEGvUpjO5W=jYO3KjA-1RpzQTqUxvyABmF13CPEa-8_zTfg@mail.gmail.com>
Subject: Re: [RFC PATCH v1 3/3] drm/msm: Improve the a6xx page fault handler
To:     Jordan Crouse <jcrouse@codeaurora.org>
Cc:     linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Will Deacon <will@kernel.org>,
        "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>, Joerg
        Roedel <joro@8bytes.org>," <iommu@lists.linux-foundation.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Emil Velikov <emil.velikov@collabora.com>,
        Eric Anholt <eric@anholt.net>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Sam Ravnborg <sam@ravnborg.org>, Sean Paul <sean@poorly.run>,
        Sharat Masetty <smasetty@codeaurora.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Nov 9, 2020 at 2:23 PM Jordan Crouse <jcrouse@codeaurora.org> wrote:
>
> Use the new adreno-smmu-priv fault info function to get more SMMU
> debug registers and print the current TTBR0 to debug per-instance
> pagetables and figure out which GPU block generated the request.
>
> Signed-off-by: Jordan Crouse <jcrouse@codeaurora.org>
> ---
>
>  drivers/gpu/drm/msm/adreno/a5xx_gpu.c |  4 +-
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 76 +++++++++++++++++++++++++--
>  drivers/gpu/drm/msm/msm_iommu.c       | 11 +++-
>  drivers/gpu/drm/msm/msm_mmu.h         |  4 +-
>  4 files changed, 87 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
> index d6804a802355..ed4cb81af874 100644
> --- a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
> @@ -933,7 +933,7 @@ bool a5xx_idle(struct msm_gpu *gpu, struct msm_ringbuffer *ring)
>         return true;
>  }
>
> -static int a5xx_fault_handler(void *arg, unsigned long iova, int flags)
> +static int a5xx_fault_handler(void *arg, unsigned long iova, int flags, void *data)
>  {
>         struct msm_gpu *gpu = arg;
>         pr_warn_ratelimited("*** gpu fault: iova=%08lx, flags=%d (%u,%u,%u,%u)\n",
> @@ -943,7 +943,7 @@ static int a5xx_fault_handler(void *arg, unsigned long iova, int flags)
>                         gpu_read(gpu, REG_A5XX_CP_SCRATCH_REG(6)),
>                         gpu_read(gpu, REG_A5XX_CP_SCRATCH_REG(7)));
>
> -       return -EFAULT;
> +       return 0;
>  }
>
>  static void a5xx_cp_err_irq(struct msm_gpu *gpu)
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> index 948f3656c20c..ac6e8cd5cf1a 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -905,18 +905,88 @@ static void a6xx_recover(struct msm_gpu *gpu)
>         msm_gpu_hw_init(gpu);
>  }
>
> -static int a6xx_fault_handler(void *arg, unsigned long iova, int flags)
> +static const char *a6xx_uche_fault_block(struct msm_gpu *gpu, u32 mid)
> +{
> +       static const char *uche_clients[7] = {
> +               "VFD", "SP", "VSC", "VPC", "HLSQ", "PC", "LRZ",
> +       };
> +       u32 val;
> +
> +       if (mid < 1 || mid > 3)
> +               return "UNKNOWN";
> +
> +       /*
> +        * The source of the data depends on the mid ID read from FSYNR1.
> +        * and the client ID read from the UCHE block
> +        */
> +       val = gpu_read(gpu, REG_A6XX_UCHE_CLIENT_PF);
> +
> +       /* mid = 3 is most precise and refers to only one block per client */
> +       if (mid == 3)
> +               return uche_clients[val & 7];
> +
> +       /* For mid=2 the source is TP or VFD except when the client id is 0 */
> +       if (mid == 2)
> +               return ((val & 7) == 0) ? "TP" : "TP|VFD";
> +
> +       /* For mid=1 just return "UCHE" as a catchall for everything else */
> +       return "UCHE";
> +}
> +
> +static const char *a6xx_fault_block(struct msm_gpu *gpu, u32 id)
> +{
> +       if (id == 0)
> +               return "CP";
> +       else if (id == 4)
> +               return "CCU";
> +       else if (id == 6)
> +               return "CDP Prefetch";
> +
> +       return a6xx_uche_fault_block(gpu, id);
> +}
> +
> +#define ARM_SMMU_FSR_TF                 BIT(1)
> +#define ARM_SMMU_FSR_PF                        BIT(3)
> +#define ARM_SMMU_FSR_EF                        BIT(4)
> +
> +static int a6xx_fault_handler(void *arg, unsigned long iova, int flags, void *data)
>  {
>         struct msm_gpu *gpu = arg;
> +       struct adreno_smmu_fault_info *info = data;
> +       const char *type = "UNKNOWN";
>
> -       pr_warn_ratelimited("*** gpu fault: iova=%08lx, flags=%d (%u,%u,%u,%u)\n",
> +       /*
> +        * Print a default message if we couldn't get the data from the
> +        * adreno-smmu-priv
> +        */
> +       if (!info) {
> +               pr_warn_ratelimited("*** gpu fault: iova=%.16lx flags=%d (%u,%u,%u,%u)\n",
>                         iova, flags,
>                         gpu_read(gpu, REG_A6XX_CP_SCRATCH_REG(4)),
>                         gpu_read(gpu, REG_A6XX_CP_SCRATCH_REG(5)),
>                         gpu_read(gpu, REG_A6XX_CP_SCRATCH_REG(6)),
>                         gpu_read(gpu, REG_A6XX_CP_SCRATCH_REG(7)));
>
> -       return -EFAULT;
> +               return 0;
> +       }
> +
> +       if (info->fsr & ARM_SMMU_FSR_TF)
> +               type = "TRANSLATION";
> +       else if (info->fsr & ARM_SMMU_FSR_PF)
> +               type = "PERMISSION";
> +       else if (info->fsr & ARM_SMMU_FSR_EF)
> +               type = "EXTERNAL";
> +
> +       pr_warn_ratelimited("*** gpu fault: ttbr0=%.16llx iova=%.16lx dir=%s type=%s source=%s (%u,%u,%u,%u)\n",
> +                       info->ttbr0, iova,
> +                       flags & IOMMU_FAULT_WRITE ? "WRITE" : "READ", type,
> +                       a6xx_fault_block(gpu, info->fsynr1 & 0xff),
> +                       gpu_read(gpu, REG_A6XX_CP_SCRATCH_REG(4)),
> +                       gpu_read(gpu, REG_A6XX_CP_SCRATCH_REG(5)),
> +                       gpu_read(gpu, REG_A6XX_CP_SCRATCH_REG(6)),
> +                       gpu_read(gpu, REG_A6XX_CP_SCRATCH_REG(7)));
> +
> +       return 0;
>  }
>
>  static void a6xx_cp_hw_err_irq(struct msm_gpu *gpu)
> diff --git a/drivers/gpu/drm/msm/msm_iommu.c b/drivers/gpu/drm/msm/msm_iommu.c
> index 22ac7c692a81..dc04575fc323 100644
> --- a/drivers/gpu/drm/msm/msm_iommu.c
> +++ b/drivers/gpu/drm/msm/msm_iommu.c
> @@ -212,8 +212,17 @@ static int msm_fault_handler(struct iommu_domain *domain, struct device *dev,
>                 unsigned long iova, int flags, void *arg)
>  {
>         struct msm_iommu *iommu = arg;
> +       struct adreno_smmu_priv *adreno_smmu = dev_get_drvdata(iommu->base.dev);
> +       struct adreno_smmu_fault_info info, *ptr = NULL;
> +
> +       if (adreno_smmu->cookie) {

I suppose, to better deal with whichever order drm vs iommu stuff is merged:

   if (adreno_smmu->get_fault_info) {
    ...
  }

I don't think there is a reason to have ->get_fault_info set but ->cookie unset

BR,
-R

> +               adreno_smmu->get_fault_info(adreno_smmu->cookie, &info);
> +               ptr = &info;
> +       }
> +
>         if (iommu->base.handler)
> -               return iommu->base.handler(iommu->base.arg, iova, flags);
> +               return iommu->base.handler(iommu->base.arg, iova, flags, ptr);
> +
>         pr_warn_ratelimited("*** fault: iova=%16lx, flags=%d\n", iova, flags);
>         return 0;
>  }
> diff --git a/drivers/gpu/drm/msm/msm_mmu.h b/drivers/gpu/drm/msm/msm_mmu.h
> index 61ade89d9e48..a88f44c3268d 100644
> --- a/drivers/gpu/drm/msm/msm_mmu.h
> +++ b/drivers/gpu/drm/msm/msm_mmu.h
> @@ -26,7 +26,7 @@ enum msm_mmu_type {
>  struct msm_mmu {
>         const struct msm_mmu_funcs *funcs;
>         struct device *dev;
> -       int (*handler)(void *arg, unsigned long iova, int flags);
> +       int (*handler)(void *arg, unsigned long iova, int flags, void *data);
>         void *arg;
>         enum msm_mmu_type type;
>  };
> @@ -43,7 +43,7 @@ struct msm_mmu *msm_iommu_new(struct device *dev, struct iommu_domain *domain);
>  struct msm_mmu *msm_gpummu_new(struct device *dev, struct msm_gpu *gpu);
>
>  static inline void msm_mmu_set_fault_handler(struct msm_mmu *mmu, void *arg,
> -               int (*handler)(void *arg, unsigned long iova, int flags))
> +               int (*handler)(void *arg, unsigned long iova, int flags, void *data))
>  {
>         mmu->arg = arg;
>         mmu->handler = handler;
> --
> 2.25.1
>
