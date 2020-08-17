Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C3E16247360
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Aug 2020 20:55:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388361AbgHQSzE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 17 Aug 2020 14:55:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37112 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730900AbgHQPux (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 17 Aug 2020 11:50:53 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 14217C061389;
        Mon, 17 Aug 2020 08:50:53 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id r15so5573259wrp.13;
        Mon, 17 Aug 2020 08:50:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=jKI5clZPrZ4Jqu6uUpcqQ57WB/OBO82GFDEjFCojj/w=;
        b=V6CPKwMAJRLSM1MVBQUOg0gnYOCPxI4VZg4ERJmzHWK57EhwKRvgU6yUnPOLwlshJU
         KyTSa4oMkNFO0sUpdBjGpUNEipfBFB3AMaC23Rm5ABCiRO9Q19uBIlw7VhVmfRFadg9L
         9SE7eMpRUewXvI8UPcMlmZCyYOe3N3YEYef2pkDfpPqTt+0iR9HG7DrFGwnDUS5AS6FN
         2ICeBS3F790kUXjk3CBQ0h0vc0jpC8PdzpYL7NWTpIG45VA38l/cVxbTQ8p89NdfNR1G
         X0ajG0nq8N3F4kn6Q1w7x46jUcELgF1r8q8drwKdFjVl0AjfY+lzlGROsz44l2CC0/dz
         OpNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jKI5clZPrZ4Jqu6uUpcqQ57WB/OBO82GFDEjFCojj/w=;
        b=cNxnvx7kryMLmEnWVnGrqU8GJDPiA2EtVLgwx3LrLDXLB5kR4hoKzSarZ/Ppa7yljP
         I5DMkMBtYib/9b6Fe9W+n46jgklXBCWR0XYMpuzdfooyhKXk8sGXxJaT/Hpc6ci5MGaI
         4HLgKzdq+Z7pmU1+vF1NW3bB/KL/Kdgbc+feHkgEmzWbtQBIyDuNXpBJ6EgLGFGe9Q9k
         TBTA4uQMk7b5HtSQ5UPfZxHIYygulMJQIEeMiQnT3RrGdZnGiiZwKOmIDAnTvt22v3s7
         GVYQ+4cX985ChfzrTYHiRndzNzNsix07k+4Em0R6TMMo+sXvDZT3QCm/3SD0f81W4uh1
         bdFQ==
X-Gm-Message-State: AOAM531HqA+jCFrvRaz4+r+mwOnfxPlo5gIo2obZ4pBmDgDVIuM/g1mq
        Z6BiNK/aQTVZ5U2RV3wFBNzfbVq9soX6KTw2TGEsel84HZTYMA==
X-Google-Smtp-Source: ABdhPJyOhG2biF/vdiHZ1nhfamK6O9emvv13ODZuNcQj1KGBpFVcav7FNLK/Xw73wUK16Nwrlo8Ql1Oe/DF+f4GHZ00=
X-Received: by 2002:adf:ec04:: with SMTP id x4mr15303734wrn.28.1597679451602;
 Mon, 17 Aug 2020 08:50:51 -0700 (PDT)
MIME-Version: 1.0
References: <20200810222657.1841322-1-jcrouse@codeaurora.org>
 <20200814024114.1177553-17-robdclark@gmail.com> <7c130df7-c7f4-8694-c7be-ce3debe01662@codeaurora.org>
In-Reply-To: <7c130df7-c7f4-8694-c7be-ce3debe01662@codeaurora.org>
From:   Rob Clark <robdclark@gmail.com>
Date:   Mon, 17 Aug 2020 08:51:39 -0700
Message-ID: <CAF6AEGtUG0yR6T3ZzOi2qmy4isGLJe9AV=-Yy0qUfgrqKgHC0w@mail.gmail.com>
Subject: Re: [PATCH 16/19] drm/msm/a6xx: Add support for per-instance pagetables
To:     Akhil P Oommen <akhilpo@codeaurora.org>
Cc:     dri-devel <dri-devel@lists.freedesktop.org>,
        "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>, Joerg
        Roedel <joro@8bytes.org>," <iommu@lists.linux-foundation.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Will Deacon <will@kernel.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Sibi Sankar <sibis@codeaurora.org>,
        Vivek Gautam <vivek.gautam@codeaurora.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Rob Clark <robdclark@chromium.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Jonathan Marek <jonathan@marek.ca>,
        Sharat Masetty <smasetty@codeaurora.org>,
        Eric Anholt <eric@anholt.net>,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Aug 17, 2020 at 8:41 AM Akhil P Oommen <akhilpo@codeaurora.org> wrote:
>
> On 8/14/2020 8:11 AM, Rob Clark wrote:
> > From: Jordan Crouse <jcrouse@codeaurora.org>
> >
> > Add support for using per-instance pagetables if all the dependencies are
> > available.
> >
> > Signed-off-by: Jordan Crouse <jcrouse@codeaurora.org>
> > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > ---
> >   drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 70 +++++++++++++++++++++++++++
> >   drivers/gpu/drm/msm/adreno/a6xx_gpu.h |  1 +
> >   drivers/gpu/drm/msm/msm_ringbuffer.h  |  1 +
> >   3 files changed, 72 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> > index 5eabb0109577..9653ac9b3cb8 100644
> > --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> > +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> > @@ -81,6 +81,56 @@ static void get_stats_counter(struct msm_ringbuffer *ring, u32 counter,
> >       OUT_RING(ring, upper_32_bits(iova));
> >   }
> >
> > +static void a6xx_set_pagetable(struct a6xx_gpu *a6xx_gpu,
> > +             struct msm_ringbuffer *ring, struct msm_file_private *ctx)
> > +{
> > +     phys_addr_t ttbr;
> > +     u32 asid;
> > +     u64 memptr = rbmemptr(ring, ttbr0);
> > +
> > +     if (ctx == a6xx_gpu->cur_ctx)
> > +             return;
> > +
> > +     if (msm_iommu_pagetable_params(ctx->aspace->mmu, &ttbr, &asid))
> > +             return;
> > +
> > +     /* Execute the table update */
> > +     OUT_PKT7(ring, CP_SMMU_TABLE_UPDATE, 4);
> > +     OUT_RING(ring, CP_SMMU_TABLE_UPDATE_0_TTBR0_LO(lower_32_bits(ttbr)));
> > +
> > +     /*
> > +      * For now ignore the asid since the smmu driver uses a TLBIASID to
> > +      * flush the TLB when we use iommu_flush_tlb_all() and the smmu driver
> > +      * isn't aware that the asid changed.  Instead, keep the default asid
> > +      * (0, same as the context bank) to make sure the TLB is properly
> > +      * flushed.
> > +      */
> > +     OUT_RING(ring,
> > +             CP_SMMU_TABLE_UPDATE_1_TTBR0_HI(upper_32_bits(ttbr)) |
> > +             CP_SMMU_TABLE_UPDATE_1_ASID(0));
> > +     OUT_RING(ring, CP_SMMU_TABLE_UPDATE_2_CONTEXTIDR(0));
> > +     OUT_RING(ring, CP_SMMU_TABLE_UPDATE_3_CONTEXTBANK(0));
> > +
> > +     /*
> > +      * Write the new TTBR0 to the memstore. This is good for debugging.
> > +      */
> > +     OUT_PKT7(ring, CP_MEM_WRITE, 4);
> > +     OUT_RING(ring, CP_MEM_WRITE_0_ADDR_LO(lower_32_bits(memptr)));
> > +     OUT_RING(ring, CP_MEM_WRITE_1_ADDR_HI(upper_32_bits(memptr)));
> > +     OUT_RING(ring, lower_32_bits(ttbr));
> > +     OUT_RING(ring, (0 << 16) | upper_32_bits(ttbr));
> why (0 << 16) is required here?

That would normally be (asid << 16), except due to the way we
currently flush tlb, we need to use asid==0..

(Although msm_iommu_pagetable_params() should return asid==0, I fixed
that in msm_iommu_pagetable_create() and didn't notice that Jordan had
fixed that here instead)

BR,
-R

> > +
> > +     /*
> > +      * And finally, trigger a uche flush to be sure there isn't anything
> > +      * lingering in that part of the GPU
> > +      */
> > +
> > +     OUT_PKT7(ring, CP_EVENT_WRITE, 1);
> > +     OUT_RING(ring, 0x31);
> This may be unnecessary, but no harm in keeping it. SMMU_TABLE_UPDATE is
> supposed to do a UCHE flush.
>
> -Akhil
> > +
> > +     a6xx_gpu->cur_ctx = ctx;
> > +}
> > +
> >   static void a6xx_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
> >   {
> >       unsigned int index = submit->seqno % MSM_GPU_SUBMIT_STATS_COUNT;
> > @@ -90,6 +140,8 @@ static void a6xx_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
> >       struct msm_ringbuffer *ring = submit->ring;
> >       unsigned int i;
> >
> > +     a6xx_set_pagetable(a6xx_gpu, ring, submit->queue->ctx);
> > +
> >       get_stats_counter(ring, REG_A6XX_RBBM_PERFCTR_CP_0_LO,
> >               rbmemptr_stats(ring, index, cpcycles_start));
> >
> > @@ -696,6 +748,8 @@ static int a6xx_hw_init(struct msm_gpu *gpu)
> >       /* Always come up on rb 0 */
> >       a6xx_gpu->cur_ring = gpu->rb[0];
> >
> > +     a6xx_gpu->cur_ctx = NULL;
> > +
> >       /* Enable the SQE_to start the CP engine */
> >       gpu_write(gpu, REG_A6XX_CP_SQE_CNTL, 1);
> >
> > @@ -1008,6 +1062,21 @@ static unsigned long a6xx_gpu_busy(struct msm_gpu *gpu)
> >       return (unsigned long)busy_time;
> >   }
> >
> > +static struct msm_gem_address_space *
> > +a6xx_create_private_address_space(struct msm_gpu *gpu)
> > +{
> > +     struct msm_gem_address_space *aspace = NULL;
> > +     struct msm_mmu *mmu;
> > +
> > +     mmu = msm_iommu_pagetable_create(gpu->aspace->mmu);
> > +
> > +     if (!IS_ERR(mmu))
> > +             aspace = msm_gem_address_space_create(mmu,
> > +                     "gpu", 0x100000000ULL, 0x1ffffffffULL);
> > +
> > +     return aspace;
> > +}
> > +
> >   static const struct adreno_gpu_funcs funcs = {
> >       .base = {
> >               .get_param = adreno_get_param,
> > @@ -1031,6 +1100,7 @@ static const struct adreno_gpu_funcs funcs = {
> >               .gpu_state_put = a6xx_gpu_state_put,
> >   #endif
> >               .create_address_space = adreno_iommu_create_address_space,
> > +             .create_private_address_space = a6xx_create_private_address_space,
> >       },
> >       .get_timestamp = a6xx_get_timestamp,
> >   };
> > diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
> > index 03ba60d5b07f..da22d7549d9b 100644
> > --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
> > +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
> > @@ -19,6 +19,7 @@ struct a6xx_gpu {
> >       uint64_t sqe_iova;
> >
> >       struct msm_ringbuffer *cur_ring;
> > +     struct msm_file_private *cur_ctx;
> >
> >       struct a6xx_gmu gmu;
> >   };
> > diff --git a/drivers/gpu/drm/msm/msm_ringbuffer.h b/drivers/gpu/drm/msm/msm_ringbuffer.h
> > index 7764373d0ed2..0987d6bf848c 100644
> > --- a/drivers/gpu/drm/msm/msm_ringbuffer.h
> > +++ b/drivers/gpu/drm/msm/msm_ringbuffer.h
> > @@ -31,6 +31,7 @@ struct msm_rbmemptrs {
> >       volatile uint32_t fence;
> >
> >       volatile struct msm_gpu_submit_stats stats[MSM_GPU_SUBMIT_STATS_COUNT];
> > +     volatile u64 ttbr0;
> >   };
> >
> >   struct msm_ringbuffer {
> >
>
