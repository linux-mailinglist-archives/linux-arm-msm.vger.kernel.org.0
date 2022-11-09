Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 62CC26237AF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Nov 2022 00:49:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230334AbiKIXtT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 9 Nov 2022 18:49:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47458 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229551AbiKIXtT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 9 Nov 2022 18:49:19 -0500
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B6A76642B;
        Wed,  9 Nov 2022 15:49:17 -0800 (PST)
Received: by mail-ed1-x535.google.com with SMTP id x2so616435edd.2;
        Wed, 09 Nov 2022 15:49:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=rv1MBcXtYiPwkYpiaWjgBIbaqzMUcVB2dQuOicBbdBk=;
        b=mkUzQvsnsqJFLmwZgBf/Hpd9rMm5urLyJIb3VEQntP/rLFx2kV0c73W/gQBhIPdbVD
         ouLOCvHBiDpNDm8cMCxd2bjypokVdq2zVOsFGinUqIAHhdPJLmGMyXg09xfqP+pWmI5v
         PG0hAm2BtB8OnHQKILn3qZVFr1Hu6YDGphiYfpNXVQ4YH+zCfIqzCtmtzxs88LvxXOg5
         wfgGySZ8hEnnV/hDvI99zhykn7jYInWHv0/Ah0/vLsQTFgPPPiWiTYt2UCBwg/gmJ4TW
         l2a922/6Hmm1qrRBsC66c8Akc3WyjDxUvHy8NYM03fiPc3n3PdQeXC24UL1pP/K9W0G8
         Xwsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rv1MBcXtYiPwkYpiaWjgBIbaqzMUcVB2dQuOicBbdBk=;
        b=HZNl+z8oo87KbtjLtyG4JFsEzuywKYq+Q9sV3EnXxIB2eGS2yksuOYjpwHRikdsIgQ
         hcO8p8kEEF8nW+lSeVDiDhVsQLcMpLsr7XDhLpoEXxiLAFjJEV85snk6XnNiS07fTZQc
         ziLL6EuoBP9HSy1dD1pwhS52x+W/FtJoMvj7Igo4wb9E15PUNV3xmhGroX+AynkyJMxH
         HnLHWho7qF1BJMX00ikVpO5gU77kOyE/sMOmFQ2C19bBwAvkh5vMHcb9gYv4+T0sdmbL
         4RxPp7NWJfoQZ4GKGcGr0ae/AxKyVoqNS/qYA93rvdxJv88sf7drebDhuM8cFTQUhGRo
         Ok0Q==
X-Gm-Message-State: ACrzQf0Dm30lMQo5WYleELuBI9MXNnJ1QZezvelkxoKeKv6BtsDEEeO1
        8avgxNhXORF+kxgYYnlN8CCdD9eCxgvBDUd2ODI=
X-Google-Smtp-Source: AMsMyM6wZXT8t5n9QhvdjVWaohXvGtKQZzWfroa1k7acRDl/iQ/3hVPSOgOuJwghmPIXocqU+3903Po1foPlbpHJahc=
X-Received: by 2002:a05:6402:656:b0:464:778:c46c with SMTP id
 u22-20020a056402065600b004640778c46cmr1101715edx.344.1668037755987; Wed, 09
 Nov 2022 15:49:15 -0800 (PST)
MIME-Version: 1.0
References: <20221104150847.525173-1-robdclark@gmail.com> <20221104150847.525173-3-robdclark@gmail.com>
In-Reply-To: <20221104150847.525173-3-robdclark@gmail.com>
From:   Chia-I Wu <olvaffe@gmail.com>
Date:   Wed, 9 Nov 2022 15:49:04 -0800
Message-ID: <CAPaKu7Q=CeiLi-xHei0FN4ZH-S=dJR1r6316w0jhXPBX++viSg@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] drm/msm: Hangcheck progress detection
To:     Rob Clark <robdclark@gmail.com>
Cc:     dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, Rob Clark <robdclark@chromium.org>,
        Akhil P Oommen <quic_akhilpo@quicinc.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Douglas Anderson <dianders@chromium.org>,
        open list <linux-kernel@vger.kernel.org>
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

On Fri, Nov 4, 2022 at 8:08 AM Rob Clark <robdclark@gmail.com> wrote:
>
> From: Rob Clark <robdclark@chromium.org>
>
> If the hangcheck timer expires, check if the fw's position in the
> cmdstream has advanced (changed) since last timer expiration, and
> allow it up to three additional "extensions" to it's alotted time.
> The intention is to continue to catch "shader stuck in a loop" type
> hangs quickly, but allow more time for things that are actually
> making forward progress.
>
> Because we need to sample the CP state twice to detect if there has
> not been progress, this also cuts the the timer's duration in half.
>
> v2: Fix typo (REG_A6XX_CP_CSQ_IB2_STAT), add comment
> v3: Only halve hangcheck timer duration for generations which
>     support progress detection (hdanton); removed unused a5xx
>     progress (without knowing how to adjust for data buffered
>     in ROQ it is too likely to report a false negative)
>
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> Reviewed-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 34 +++++++++++++++++++++++++++
>  drivers/gpu/drm/msm/msm_drv.c         |  1 -
>  drivers/gpu/drm/msm/msm_drv.h         |  8 ++++++-
>  drivers/gpu/drm/msm/msm_gpu.c         | 31 +++++++++++++++++++++++-
>  drivers/gpu/drm/msm/msm_gpu.h         |  3 +++
>  drivers/gpu/drm/msm/msm_ringbuffer.h  | 24 +++++++++++++++++++
>  6 files changed, 98 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> index 1ff605c18ee6..7fe60c65a1eb 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -1843,6 +1843,39 @@ static uint32_t a6xx_get_rptr(struct msm_gpu *gpu, struct msm_ringbuffer *ring)
>         return ring->memptrs->rptr = gpu_read(gpu, REG_A6XX_CP_RB_RPTR);
>  }
>
> +static bool a6xx_progress(struct msm_gpu *gpu, struct msm_ringbuffer *ring)
> +{
> +       struct msm_cp_state cp_state = {
> +               .ib1_base = gpu_read64(gpu, REG_A6XX_CP_IB1_BASE),
> +               .ib2_base = gpu_read64(gpu, REG_A6XX_CP_IB2_BASE),
> +               .ib1_rem  = gpu_read(gpu, REG_A6XX_CP_IB1_REM_SIZE),
> +               .ib2_rem  = gpu_read(gpu, REG_A6XX_CP_IB2_REM_SIZE),
> +       };
> +       bool progress;
> +
> +       /*
> +        * Adjust the remaining data to account for what has already been
> +        * fetched from memory, but not yet consumed by the SQE.
> +        *
> +        * This is not *technically* correct, the amount buffered could
> +        * exceed the IB size due to hw prefetching ahead, but:
> +        *
> +        * (1) We aren't trying to find the exact position, just whether
> +        *     progress has been made
> +        * (2) The CP_REG_TO_MEM at the end of a submit should be enough
> +        *     to prevent prefetching into an unrelated submit.  (And
> +        *     either way, at some point the ROQ will be full.)
> +        */
> +       cp_state.ib1_rem += gpu_read(gpu, REG_A6XX_CP_CSQ_IB1_STAT) >> 16;
> +       cp_state.ib2_rem += gpu_read(gpu, REG_A6XX_CP_CSQ_IB2_STAT) >> 16;
> +
> +       progress = !!memcmp(&cp_state, &ring->last_cp_state, sizeof(cp_state));
> +
> +       ring->last_cp_state = cp_state;
> +
> +       return progress;
> +}
> +
>  static u32 a618_get_speed_bin(u32 fuse)
>  {
>         if (fuse == 0)
> @@ -1961,6 +1994,7 @@ static const struct adreno_gpu_funcs funcs = {
>                 .create_address_space = a6xx_create_address_space,
>                 .create_private_address_space = a6xx_create_private_address_space,
>                 .get_rptr = a6xx_get_rptr,
> +               .progress = a6xx_progress,
>         },
>         .get_timestamp = a6xx_get_timestamp,
>  };
> diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
> index 670651cdfa79..c3b77b44b2aa 100644
> --- a/drivers/gpu/drm/msm/msm_drv.c
> +++ b/drivers/gpu/drm/msm/msm_drv.c
> @@ -419,7 +419,6 @@ static int msm_drm_init(struct device *dev, const struct drm_driver *drv)
>         priv->dev = ddev;
>
>         priv->wq = alloc_ordered_workqueue("msm", 0);
> -       priv->hangcheck_period = DRM_MSM_HANGCHECK_DEFAULT_PERIOD;
>
>         INIT_LIST_HEAD(&priv->objects);
>         mutex_init(&priv->obj_lock);
> diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
> index 0609daf4fa4c..876d8d5eec2f 100644
> --- a/drivers/gpu/drm/msm/msm_drv.h
> +++ b/drivers/gpu/drm/msm/msm_drv.h
> @@ -225,7 +225,13 @@ struct msm_drm_private {
>
>         struct drm_atomic_state *pm_state;
>
> -       /* For hang detection, in ms */
> +       /**
> +        * hangcheck_period: For hang detection, in ms
> +        *
> +        * Note that in practice, a submit/job will get at least two hangcheck
> +        * periods, due to checking for progress being implemented as simply
> +        * "have the CP position registers changed since last time?"
> +        */
>         unsigned int hangcheck_period;
>
>         /**
> diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
> index 3dffee54a951..bfef659d3a5c 100644
> --- a/drivers/gpu/drm/msm/msm_gpu.c
> +++ b/drivers/gpu/drm/msm/msm_gpu.c
> @@ -500,6 +500,21 @@ static void hangcheck_timer_reset(struct msm_gpu *gpu)
>                         round_jiffies_up(jiffies + msecs_to_jiffies(priv->hangcheck_period)));
>  }
>
> +static bool made_progress(struct msm_gpu *gpu, struct msm_ringbuffer *ring)
> +{
> +       if (ring->hangcheck_progress_retries >= DRM_MSM_HANGCHECK_PROGRESS_RETRIES)
> +               return false;
> +
> +       if (!gpu->funcs->progress)
> +               return false;
> +
> +       if (!gpu->funcs->progress(gpu, ring))
> +               return false;
> +
> +       ring->hangcheck_progress_retries++;
> +       return true;
> +}
> +
>  static void hangcheck_handler(struct timer_list *t)
>  {
>         struct msm_gpu *gpu = from_timer(gpu, t, hangcheck_timer);
> @@ -511,9 +526,12 @@ static void hangcheck_handler(struct timer_list *t)
>         if (fence != ring->hangcheck_fence) {
>                 /* some progress has been made.. ya! */
>                 ring->hangcheck_fence = fence;
> -       } else if (fence_before(fence, ring->fctx->last_fence)) {
> +               ring->hangcheck_progress_retries = 0;
> +       } else if (fence_before(fence, ring->fctx->last_fence) &&
> +                       !made_progress(gpu, ring)) {
>                 /* no progress and not done.. hung! */
>                 ring->hangcheck_fence = fence;
> +               ring->hangcheck_progress_retries = 0;
>                 DRM_DEV_ERROR(dev->dev, "%s: hangcheck detected gpu lockup rb %d!\n",
>                                 gpu->name, ring->id);
>                 DRM_DEV_ERROR(dev->dev, "%s:     completed fence: %u\n",
> @@ -845,6 +863,7 @@ int msm_gpu_init(struct drm_device *drm, struct platform_device *pdev,
>                 struct msm_gpu *gpu, const struct msm_gpu_funcs *funcs,
>                 const char *name, struct msm_gpu_config *config)
>  {
> +       struct msm_drm_private *priv = drm->dev_private;
>         int i, ret, nr_rings = config->nr_rings;
>         void *memptrs;
>         uint64_t memptrs_iova;
> @@ -872,6 +891,16 @@ int msm_gpu_init(struct drm_device *drm, struct platform_device *pdev,
>         kthread_init_work(&gpu->recover_work, recover_worker);
>         kthread_init_work(&gpu->fault_work, fault_worker);
>
> +       priv->hangcheck_period = DRM_MSM_HANGCHECK_DEFAULT_PERIOD;
> +
> +       /*
> +        * If progress detection is supported, halve the hangcheck timer
> +        * duration, as it takes two iterations of the hangcheck handler
> +        * to detect a hang.
> +        */
> +       if (funcs->progress)
> +               priv->hangcheck_period /= 2;
> +
>         timer_setup(&gpu->hangcheck_timer, hangcheck_handler, 0);
>
>         spin_lock_init(&gpu->perf_lock);
> diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
> index 585fd9c8d45a..f0fbf6063baa 100644
> --- a/drivers/gpu/drm/msm/msm_gpu.h
> +++ b/drivers/gpu/drm/msm/msm_gpu.h
> @@ -78,6 +78,8 @@ struct msm_gpu_funcs {
>         struct msm_gem_address_space *(*create_private_address_space)
>                 (struct msm_gpu *gpu);
>         uint32_t (*get_rptr)(struct msm_gpu *gpu, struct msm_ringbuffer *ring);
> +
> +       bool (*progress)(struct msm_gpu *gpu, struct msm_ringbuffer *ring);
>  };
>
>  /* Additional state for iommu faults: */
> @@ -237,6 +239,7 @@ struct msm_gpu {
>  #define DRM_MSM_INACTIVE_PERIOD   66 /* in ms (roughly four frames) */
>
>  #define DRM_MSM_HANGCHECK_DEFAULT_PERIOD 500 /* in ms */
> +#define DRM_MSM_HANGCHECK_PROGRESS_RETRIES 3
>         struct timer_list hangcheck_timer;
>
>         /* Fault info for most recent iova fault: */
> diff --git a/drivers/gpu/drm/msm/msm_ringbuffer.h b/drivers/gpu/drm/msm/msm_ringbuffer.h
> index 2a5045abe46e..e3d33bae3380 100644
> --- a/drivers/gpu/drm/msm/msm_ringbuffer.h
> +++ b/drivers/gpu/drm/msm/msm_ringbuffer.h
> @@ -35,6 +35,11 @@ struct msm_rbmemptrs {
>         volatile u64 ttbr0;
>  };
>
> +struct msm_cp_state {
> +       uint64_t ib1_base, ib2_base;
> +       uint32_t ib1_rem, ib2_rem;
> +};
> +
>  struct msm_ringbuffer {
>         struct msm_gpu *gpu;
>         int id;
> @@ -64,6 +69,25 @@ struct msm_ringbuffer {
>         uint64_t memptrs_iova;
>         struct msm_fence_context *fctx;
>
> +       /**
> +        * hangcheck_progress_retries:
> +        *
> +        * The number of extra hangcheck duration cycles that we have given
> +        * due to it appearing that the GPU is making forward progress.
> +        *
> +        * If the GPU appears to be making progress (ie. the CP has advanced
> +        * in the command stream, we'll allow up to DRM_MSM_HANGCHECK_PROGRESS_RETRIES
> +        * expirations of the hangcheck timer before killing the job.  In other
> +        * words we'll let the submit run for up to
> +        * DRM_MSM_HANGCHECK_DEFAULT_PERIOD *  DRM_MSM_HANGCHECK_PROGRESS_RETRIES
Rather than 500*3ms, the effective timeout is 250*4ms if I read
made_progress correctly.  That is, the formula is

  (DRM_MSM_HANGCHECK_DEFAULT_PERIOD / 2) *
(DRM_MSM_HANGCHECK_PROGRESS_RETRIES + 1)

Are you targeting 1500ms or 1000ms?  Either way, series is

Reviewed-by: Chia-I Wu <olvaffe@gmail.com>
Tested-by: Chia-I Wu <olvaffe@gmail.com>
(dEQP-GLES2.functional.flush_finish.wait)

> +        */
> +       int hangcheck_progress_retries;
> +
> +       /**
> +        * last_cp_state: The state of the CP at the last call to gpu->progress()
> +        */
> +       struct msm_cp_state last_cp_state;
> +
>         /*
>          * preempt_lock protects preemption and serializes wptr updates against
>          * preemption.  Can be aquired from irq context.
> --
> 2.38.1
>
