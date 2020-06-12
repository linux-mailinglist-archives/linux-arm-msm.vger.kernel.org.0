Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6FB7B1F726B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jun 2020 05:22:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726349AbgFLDWG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 11 Jun 2020 23:22:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37894 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726321AbgFLDWG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 11 Jun 2020 23:22:06 -0400
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com [IPv6:2a00:1450:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B10BFC03E96F;
        Thu, 11 Jun 2020 20:22:04 -0700 (PDT)
Received: by mail-ej1-x644.google.com with SMTP id mb16so8641679ejb.4;
        Thu, 11 Jun 2020 20:22:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=B4Mrm1gIXHBqQrJzDMxE7hny1sPLrSiwXYO/60LCrf4=;
        b=hPVYoqh8jPs/l54Gc1r4kVaNzjMB73wKzEjspttHVKjphYyFYBNLvFvhAQHgCVuMXD
         UrW+7t7+BjCCRAb619IpW+4HHRVsgemrpBPTZgHjC/3gzR+obgnFNZvECSNXA9/pCqXz
         HhQmCLyRPV4bDpj/WbkqT06lRQ5NGJDrYyClx7y0Pw1u1IrVuE89/OQi/G/Xfxj2P6/A
         q50xVFJ9qf09Fj3gXSwSGq/TCkNbFQz1FMxOxyxexgyiUDja4LM8/ZfhMrlDakdtj+7B
         mLQMDgcvIZWW4w4wgQpH4a5uPbkhNBMMS2LzQSmi1fC6hyZj/87JizBAF+eT4jMoDrjk
         jv8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=B4Mrm1gIXHBqQrJzDMxE7hny1sPLrSiwXYO/60LCrf4=;
        b=HXWtGI/tJK1qM+zTGlmFOHpesYKYSogma80wl7UCfnvHQnNMlX5bZsrVxb5sZMhxge
         oYz1fT8eENDeWGDd3MLzymdlaQ56iUVIkVVnDi1XkVUBSVTDDzi/x126pMWu5f5il1LW
         vwq6PJSLpzUYHit1w8UhlKDrKM+PdUL5ShyJfitEYMbmKXP8tMdbA2L8utFQeS28KUIP
         9UfIZWPJwfKw+Lz0Cl1wzrKI/TL9kQnNShF/1unR1P1M08HzqeM5ggW417U0VV/5KxK6
         lb3RjjN3r8jW+r+Z3LURCD+Qiv9bf+rSh2OQY5kJak0ijB2RdDQM9uIX2ANtAS9xRCwB
         MOcA==
X-Gm-Message-State: AOAM531fznmuSqhRFC2FQowPFa64TR9JUBtavo/ZkpEz485gI1IRdwYQ
        Fc6xTgXwKF6PV36WMDHZ5So07Ywfn++fQUjMP5k=
X-Google-Smtp-Source: ABdhPJyzNHPsnPsZMtc0S9NLfKpqe1fzAhLdA7GvVWT23D3A2fUYLq5KDR2bpDt/AdIyu5RKOlbarT8SJfsSUirryUA=
X-Received: by 2002:a17:906:1088:: with SMTP id u8mr11881278eju.428.1591932123108;
 Thu, 11 Jun 2020 20:22:03 -0700 (PDT)
MIME-Version: 1.0
References: <20200611222921.464-1-jcrouse@codeaurora.org> <20200611222921.464-7-jcrouse@codeaurora.org>
In-Reply-To: <20200611222921.464-7-jcrouse@codeaurora.org>
From:   Rob Clark <robdclark@gmail.com>
Date:   Thu, 11 Jun 2020 20:22:29 -0700
Message-ID: <CAF6AEGuyqgYKZsnBPCii4W=jxPcFU7JYKn4NBd8JVq7Pt1kR_Q@mail.gmail.com>
Subject: Re: [PATCH 6/6] drm/msm/a6xx: Add support for per-instance pagetables
To:     Jordan Crouse <jcrouse@codeaurora.org>
Cc:     linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>, Joerg
        Roedel <joro@8bytes.org>," <iommu@lists.linux-foundation.org>,
        Akhil P Oommen <akhilpo@codeaurora.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>, Eric Anholt <eric@anholt.net>,
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

On Thu, Jun 11, 2020 at 3:29 PM Jordan Crouse <jcrouse@codeaurora.org> wrote:
>
> Add support for using per-instance pagetables if all the dependencies are
> available.
>
> Signed-off-by: Jordan Crouse <jcrouse@codeaurora.org>
> ---
>
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 69 ++++++++++++++++++++++++++-
>  drivers/gpu/drm/msm/msm_ringbuffer.h  |  1 +
>  2 files changed, 69 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> index a1589e040c57..5e82b85d4d55 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -79,6 +79,58 @@ static void get_stats_counter(struct msm_ringbuffer *ring, u32 counter,
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
> +       OUT_PKT7(ring, CP_SET_PROTECTED_MODE, 1);
> +       OUT_RING(ring, 0);
> +
> +       /* Turn on APIV mode to access critical regions */
> +       OUT_PKT4(ring, REG_A6XX_CP_MISC_CNTL, 1);
> +       OUT_RING(ring, 1);
> +
> +       /* Make sure the ME is synchronized before staring the update */
> +       OUT_PKT7(ring, CP_WAIT_FOR_ME, 0);
> +
> +       /* Execute the table update */
> +       OUT_PKT7(ring, CP_SMMU_TABLE_UPDATE, 4);
> +       OUT_RING(ring, lower_32_bits(ttbr));
> +       OUT_RING(ring, (((u64) asid) << 48) | upper_32_bits(ttbr));
> +       /* CONTEXTIDR is currently unused */
> +       OUT_RING(ring, 0);
> +       /* CONTEXTBANK is currently unused */
> +       OUT_RING(ring, 0);

I can add this to xml (on userspace side, we've been describing packet
payload in xml and using the generated builders), and update generated
headers, if you agree to not add more open-coded pkt7 building ;-)

> +
> +       /*
> +        * Write the new TTBR0 to the memstore. This is good for debugging.
> +        */
> +       OUT_PKT7(ring, CP_MEM_WRITE, 4);
> +       OUT_RING(ring, lower_32_bits(rbmemptr(ring, ttbr0)));
> +       OUT_RING(ring, upper_32_bits(rbmemptr(ring, ttbr0)));
> +       OUT_RING(ring, lower_32_bits(ttbr));
> +       OUT_RING(ring, (((u64) asid) << 48) | upper_32_bits(ttbr));
> +
> +       /* Invalidate the draw state so we start off fresh */
> +       OUT_PKT7(ring, CP_SET_DRAW_STATE, 3);
> +       OUT_RING(ring, 0x40000);
> +       OUT_RING(ring, 1);
> +       OUT_RING(ring, 0);

Ie, this would look like:

    OUT_PKT7(ring, CP_SET_DRAW_STATE, 3);
    OUT_RING(ring, CP_SET_DRAW_STATE__0_COUNT(0) |
            CP_SET_DRAW_STATE__0_DISABLE_ALL_GROUPS |
            CP_SET_DRAW_STATE__0_GROUP_ID(0));
    OUT_RING(ring, CP_SET_DRAW_STATE__1_ADDR_LO(1));
    OUT_RING(ring, CP_SET_DRAW_STATE__2_ADDR_HI(0));

.. but written that way, I think you meant ADDR_LO to be zero?

(it is possible we need to regen headers for that to work, the kernel
headers are somewhat out of date by now)

BR,
-R

> +
> +       /* Turn off APRIV */
> +       OUT_PKT4(ring, REG_A6XX_CP_MISC_CNTL, 1);
> +       OUT_RING(ring, 0);
> +
> +       /* Turn off protected mode */
> +       OUT_PKT7(ring, CP_SET_PROTECTED_MODE, 1);
> +       OUT_RING(ring, 1);
> +}
> +
>  static void a6xx_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit,
>         struct msm_file_private *ctx)
>  {
> @@ -89,6 +141,8 @@ static void a6xx_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit,
>         struct msm_ringbuffer *ring = submit->ring;
>         unsigned int i;
>
> +       a6xx_set_pagetable(gpu, ring, ctx);
> +
>         get_stats_counter(ring, REG_A6XX_RBBM_PERFCTR_CP_0_LO,
>                 rbmemptr_stats(ring, index, cpcycles_start));
>
> @@ -872,6 +926,18 @@ static unsigned long a6xx_gpu_busy(struct msm_gpu *gpu)
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
> @@ -893,8 +959,9 @@ static const struct adreno_gpu_funcs funcs = {
>  #if defined(CONFIG_DRM_MSM_GPU_STATE)
>                 .gpu_state_get = a6xx_gpu_state_get,
>                 .gpu_state_put = a6xx_gpu_state_put,
> -               .create_address_space = adreno_iommu_create_address_space,
>  #endif
> +               .create_address_space = adreno_iommu_create_address_space,
> +               .address_space_instance = a6xx_address_space_instance,
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
