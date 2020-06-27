Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F1CA820C3E7
	for <lists+linux-arm-msm@lfdr.de>; Sat, 27 Jun 2020 21:55:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725975AbgF0Tzm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 27 Jun 2020 15:55:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59502 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725900AbgF0Tzm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 27 Jun 2020 15:55:42 -0400
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com [IPv6:2a00:1450:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C0C77C061794;
        Sat, 27 Jun 2020 12:55:41 -0700 (PDT)
Received: by mail-ej1-x642.google.com with SMTP id a1so12452515ejg.12;
        Sat, 27 Jun 2020 12:55:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=QOPfoXRxkPWp2u0z5mv5D29mlE3sBKTSjg6aVVNHMmI=;
        b=ADOMlQVgmyn0JbKIm7nurXpb8KAlP8vwxxcUdXLQDZaEWBo6nqINqhDqQzbDVtcuGu
         dcG4BcF6ktIIdoYhiVl5rZR9ZZxfZeXAJ90oi/HD374aYjhBBXXP2XESpFGCQLGWqHg9
         4I7qe4sQPaxIiQCiotoKnAwJT7aDVwt+rPgHcQcZFt9yz+Q+3MeZsYxzD3hmtCAlj+Lt
         bzhja5CD1NZpdVH1wtlZY0s6GYPUr5PxaR4DrE0PREvMK6OGxgkPE5oXcjdEdl7UjCWO
         6PUAXoefoiHafUucYJhqJyEPgRGt4xiipf82dkDZpQspI4KGFpZSEitw43zE1Mhzm6al
         NYrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=QOPfoXRxkPWp2u0z5mv5D29mlE3sBKTSjg6aVVNHMmI=;
        b=b9d5EzqwLzT6DkEHVpj8cmT7RONcsd/Pc6l29rbsbPEGt/8g0sLpbeNV/+4R4X/54i
         IHaDttfdyFlgUMDcFHSWW6RwcgKL3aXLDXLYMI8KSRXkS2m21JXTZFzdQUv2301LInNq
         1OJNrQd/pa0/FNjPEY9sJqet5RyKFwjjm7hITlp1c+NndqqfxaIM5HcAIXvcBxje7Ckq
         Fw3esDhJhMYLll3eXtnbNLOlhSaL6xlLk7kQ8Dcw0rjz/pbIIznJlQt2wwNq9PFvWg/L
         vb2bFm7FUPXKXceMqLSGvEY7rhuvL7vpcI7t3CMKQRbLZFKa0IfCnUtFJS4XlrBuRkqS
         FCQg==
X-Gm-Message-State: AOAM530HQWn3tz1RIos8hGLP0oSDIkFy89FfgmtMwTDJt2G1+8hA2uUX
        ACZ0nr4Wbmawx2L0rjRegYfh5vzTVwe0rGtQcis=
X-Google-Smtp-Source: ABdhPJyr67bO1u4l0SujwKghbBcBSRSMmsE0uuFjMfuxxLWVEf5xomeGYdDv+Tk2qeoHV4EBherSjl1CPzPASNo+sb4=
X-Received: by 2002:a17:906:494a:: with SMTP id f10mr8135393ejt.428.1593287740217;
 Sat, 27 Jun 2020 12:55:40 -0700 (PDT)
MIME-Version: 1.0
References: <20200626200414.14382-1-jcrouse@codeaurora.org> <20200626200414.14382-7-jcrouse@codeaurora.org>
In-Reply-To: <20200626200414.14382-7-jcrouse@codeaurora.org>
From:   Rob Clark <robdclark@gmail.com>
Date:   Sat, 27 Jun 2020 12:56:09 -0700
Message-ID: <CAF6AEGvFPtiFcBg5j3An5piPWy3Sg3=-o2k8Xzzf6anzVi9_ZA@mail.gmail.com>
Subject: Re: [PATCH v2 6/6] drm/msm/a6xx: Add support for per-instance pagetables
To:     Jordan Crouse <jcrouse@codeaurora.org>
Cc:     linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>, Joerg
        Roedel <joro@8bytes.org>," <iommu@lists.linux-foundation.org>,
        John Stultz <john.stultz@linaro.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        Akhil P Oommen <akhilpo@codeaurora.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Emil Velikov <emil.velikov@collabora.com>,
        Eric Anholt <eric@anholt.net>,
        Jonathan Marek <jonathan@marek.ca>,
        Sean Paul <sean@poorly.run>,
        Sharat Masetty <smasetty@codeaurora.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Jun 26, 2020 at 1:04 PM Jordan Crouse <jcrouse@codeaurora.org> wrote:
>
> Add support for using per-instance pagetables if all the dependencies are
> available.
>
> Signed-off-by: Jordan Crouse <jcrouse@codeaurora.org>
> ---
>
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 43 +++++++++++++++++++++++++++
>  drivers/gpu/drm/msm/msm_ringbuffer.h  |  1 +
>  2 files changed, 44 insertions(+)
>
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> index aa53f47b7e8b..95ed2ceac121 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -79,6 +79,34 @@ static void get_stats_counter(struct msm_ringbuffer *ring, u32 counter,
>         OUT_RING(ring, upper_32_bits(iova));
>  }
>
> +static void a6xx_set_pagetable(struct msm_gpu *gpu, struct msm_ringbuffer *ring,
> +               struct msm_file_private *ctx)
> +{
> +       phys_addr_t ttbr;
> +       u32 asid;
> +
> +       if (msm_iommu_pagetable_params(ctx->aspace->mmu, &ttbr, &asid))
> +               return;
> +
> +       /* Execute the table update */
> +       OUT_PKT7(ring, CP_SMMU_TABLE_UPDATE, 4);
> +       OUT_RING(ring, lower_32_bits(ttbr));
> +       OUT_RING(ring, (((u64) asid) << 48) | upper_32_bits(ttbr));
> +       /* CONTEXTIDR is currently unused */
> +       OUT_RING(ring, 0);
> +       /* CONTEXTBANK is currently unused */
> +       OUT_RING(ring, 0);
> +
> +       /*
> +        * Write the new TTBR0 to the memstore. This is good for debugging.
> +        */
> +       OUT_PKT7(ring, CP_MEM_WRITE, 4);
> +       OUT_RING(ring, lower_32_bits(rbmemptr(ring, ttbr0)));
> +       OUT_RING(ring, upper_32_bits(rbmemptr(ring, ttbr0)));
> +       OUT_RING(ring, lower_32_bits(ttbr));
> +       OUT_RING(ring, (((u64) asid) << 48) | upper_32_bits(ttbr));
> +}
> +
>  static void a6xx_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit,
>         struct msm_file_private *ctx)
>  {
> @@ -89,6 +117,8 @@ static void a6xx_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit,
>         struct msm_ringbuffer *ring = submit->ring;
>         unsigned int i;
>
> +       a6xx_set_pagetable(gpu, ring, ctx);
> +
>         get_stats_counter(ring, REG_A6XX_RBBM_PERFCTR_CP_0_LO,
>                 rbmemptr_stats(ring, index, cpcycles_start));
>
> @@ -872,6 +902,18 @@ static unsigned long a6xx_gpu_busy(struct msm_gpu *gpu)
>         return (unsigned long)busy_time;
>  }
>
> +struct msm_gem_address_space *a6xx_address_space_instance(struct msm_gpu *gpu)
> +{
> +       struct msm_mmu *mmu;
> +
> +       mmu = msm_iommu_pagetable_create(gpu->aspace->mmu);
> +       if (IS_ERR(mmu))
> +               return msm_gem_address_space_get(gpu->aspace);
> +
> +       return msm_gem_address_space_create(mmu,
> +               "gpu", 0x100000000ULL, 0x1ffffffffULL);
> +}
> +
>  static const struct adreno_gpu_funcs funcs = {
>         .base = {
>                 .get_param = adreno_get_param,
> @@ -895,6 +937,7 @@ static const struct adreno_gpu_funcs funcs = {
>                 .gpu_state_put = a6xx_gpu_state_put,
>  #endif
>                 .create_address_space = adreno_iommu_create_address_space,
> +               .address_space_instance = a6xx_address_space_instance,

Hmm, maybe instead of .address_space_instance, something like
.create_context_address_space?

Since like .create_address_space, it is creating an address space..
the difference is that it is a per context/process aspace..

BR,
-R

>         },
>         .get_timestamp = a6xx_get_timestamp,
>  };
> diff --git a/drivers/gpu/drm/msm/msm_ringbuffer.h b/drivers/gpu/drm/msm/msm_ringbuffer.h
> index 7764373d0ed2..0987d6bf848c 100644
> --- a/drivers/gpu/drm/msm/msm_ringbuffer.h
> +++ b/drivers/gpu/drm/msm/msm_ringbuffer.h
> @@ -31,6 +31,7 @@ struct msm_rbmemptrs {
>         volatile uint32_t fence;
>
>         volatile struct msm_gpu_submit_stats stats[MSM_GPU_SUBMIT_STATS_COUNT];
> +       volatile u64 ttbr0;
>  };
>
>  struct msm_ringbuffer {
> --
> 2.17.1
>
