Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C9C9F403EA8
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Sep 2021 19:53:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350232AbhIHRyp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 8 Sep 2021 13:54:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50280 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349870AbhIHRyd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 8 Sep 2021 13:54:33 -0400
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE733C061575;
        Wed,  8 Sep 2021 10:53:24 -0700 (PDT)
Received: by mail-wm1-x335.google.com with SMTP id z9-20020a7bc149000000b002e8861aff59so2288878wmi.0;
        Wed, 08 Sep 2021 10:53:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=DrXy0xzY/SuJzzbVtLGjPK3qrj6bNKiyQZIbUKn3RUs=;
        b=GVHvSOp/iRE0CQ3HupCl+2kDLJZ5MahdTCUafVs84pITnPzRZ5CeEmYDbpvZEPlpPO
         AmoeHB0HuUz9uczE7rM8z7eEs7MNWrqK7XCn56yr/ZAYvNbUZhBAJPVh+Jyhw+Ifh7+m
         hlUJbp+EmYMkcx8LdqlK2auJVOkgpdSPj7dU5KucDAdm0LDUB0J/8Fswnp530js+d92k
         5QRq9vIZpmE2lxyd4o+0BD7N6gQ8yvRG6kFLtgt7gGEWy1xJVop8BXN8XGnaEGY1JBsL
         QYg9PbckOgrheWrVbtxbd1RjpKuJlmY/FAm3z6jNA/tkTfBGrkvaSfSyam+i8MR+DKqx
         AEZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DrXy0xzY/SuJzzbVtLGjPK3qrj6bNKiyQZIbUKn3RUs=;
        b=HACegyrYhjLMX9Qs5i62lK5YOEOh0ZeooRVAIBojntB8ecxK/Rs1tpLb4zu/HZ6x7o
         +N0GQrE76rbTqlbLeom5r53vmgD0a0v0bU9ze5n2BMeIdMRQ8h7jkl0xbPkk0mGL3tt9
         xJ8hNKtVVC6rWsmhX71Gr+CoMMKAusktUsOe61JHCg9LEm9FumKekj56V6xruaKwIisx
         GmfSm8tpBZlGmsxcsfFzACv/VJp1S9EZI5ofwuNY2CVVlTfQbCGW27J7pwt1jZYL4BHy
         cLjlKxLYn1IrnnVvLNiZTSMBjJKLXQfedabmkNDXHc+eJbGXDIGHSB7ngiyf0ZfjCYfD
         USzQ==
X-Gm-Message-State: AOAM53130XHseJrQe5xLfy1/ypXEVIpkhq9DTpnngqWw2ANTkpuQBZMC
        sZQT3L0d1Ul54Z5E/foLTUwpbWAdQR44nKAEfvIS3kRC
X-Google-Smtp-Source: ABdhPJwECZKbWtNkx9rznn+cE7LOnEY5yksxQHPSpkWOmdScXnX1PwojOKyMVeco+WJ+6xLdibtn2s0ea9IQkSwuJoY=
X-Received: by 2002:a05:600c:5110:: with SMTP id o16mr4852655wms.44.1631123603209;
 Wed, 08 Sep 2021 10:53:23 -0700 (PDT)
MIME-Version: 1.0
References: <20210903184806.1680887-1-robdclark@gmail.com> <20210903184806.1680887-6-robdclark@gmail.com>
 <YTj3akinO0jVbCFc@phenom.ffwll.local>
In-Reply-To: <YTj3akinO0jVbCFc@phenom.ffwll.local>
From:   Rob Clark <robdclark@gmail.com>
Date:   Wed, 8 Sep 2021 10:57:41 -0700
Message-ID: <CAF6AEGusOJNZrex2xiVBRcasCF-CqspDSgqBvS5PQ2-xUQupTA@mail.gmail.com>
Subject: Re: [PATCH v3 5/9] drm/msm: Add deadline based boost support
To:     Rob Clark <robdclark@gmail.com>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        "moderated list:DMA BUFFER SHARING FRAMEWORK" 
        <linaro-mm-sig@lists.linaro.org>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
        =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel@daenzer.net>,
        Pekka Paalanen <ppaalanen@gmail.com>,
        Rob Clark <robdclark@chromium.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <linux-arm-msm@vger.kernel.org>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <freedreno@lists.freedesktop.org>,
        open list <linux-kernel@vger.kernel.org>,
        "open list:DMA BUFFER SHARING FRAMEWORK" 
        <linux-media@vger.kernel.org>
Cc:     Daniel Vetter <daniel@ffwll.ch>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Sep 8, 2021 at 10:48 AM Daniel Vetter <daniel@ffwll.ch> wrote:
>
> On Fri, Sep 03, 2021 at 11:47:56AM -0700, Rob Clark wrote:
> > From: Rob Clark <robdclark@chromium.org>
> >
> > Signed-off-by: Rob Clark <robdclark@chromium.org>
>
> Why do you need a kthread_work here? Is this just to make sure you're
> running at realtime prio? Maybe a comment to that effect would be good.

Mostly because we are already using a kthread_worker for things the
GPU needs to kick off to a different context.. but I think this is
something we'd want at a realtime prio

BR,
-R

> -Daniel
>
> > ---
> >  drivers/gpu/drm/msm/msm_fence.c       | 76 +++++++++++++++++++++++++++
> >  drivers/gpu/drm/msm/msm_fence.h       | 20 +++++++
> >  drivers/gpu/drm/msm/msm_gpu.h         |  1 +
> >  drivers/gpu/drm/msm/msm_gpu_devfreq.c | 20 +++++++
> >  4 files changed, 117 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/msm/msm_fence.c b/drivers/gpu/drm/msm/msm_fence.c
> > index f2cece542c3f..67c2a96e1c85 100644
> > --- a/drivers/gpu/drm/msm/msm_fence.c
> > +++ b/drivers/gpu/drm/msm/msm_fence.c
> > @@ -8,6 +8,37 @@
> >
> >  #include "msm_drv.h"
> >  #include "msm_fence.h"
> > +#include "msm_gpu.h"
> > +
> > +static inline bool fence_completed(struct msm_fence_context *fctx, uint32_t fence);
> > +
> > +static struct msm_gpu *fctx2gpu(struct msm_fence_context *fctx)
> > +{
> > +     struct msm_drm_private *priv = fctx->dev->dev_private;
> > +     return priv->gpu;
> > +}
> > +
> > +static enum hrtimer_restart deadline_timer(struct hrtimer *t)
> > +{
> > +     struct msm_fence_context *fctx = container_of(t,
> > +                     struct msm_fence_context, deadline_timer);
> > +
> > +     kthread_queue_work(fctx2gpu(fctx)->worker, &fctx->deadline_work);
> > +
> > +     return HRTIMER_NORESTART;
> > +}
> > +
> > +static void deadline_work(struct kthread_work *work)
> > +{
> > +     struct msm_fence_context *fctx = container_of(work,
> > +                     struct msm_fence_context, deadline_work);
> > +
> > +     /* If deadline fence has already passed, nothing to do: */
> > +     if (fence_completed(fctx, fctx->next_deadline_fence))
> > +             return;
> > +
> > +     msm_devfreq_boost(fctx2gpu(fctx), 2);
> > +}
> >
> >
> >  struct msm_fence_context *
> > @@ -26,6 +57,13 @@ msm_fence_context_alloc(struct drm_device *dev, volatile uint32_t *fenceptr,
> >       fctx->fenceptr = fenceptr;
> >       spin_lock_init(&fctx->spinlock);
> >
> > +     hrtimer_init(&fctx->deadline_timer, CLOCK_MONOTONIC, HRTIMER_MODE_ABS);
> > +     fctx->deadline_timer.function = deadline_timer;
> > +
> > +     kthread_init_work(&fctx->deadline_work, deadline_work);
> > +
> > +     fctx->next_deadline = ktime_get();
> > +
> >       return fctx;
> >  }
> >
> > @@ -49,6 +87,8 @@ void msm_update_fence(struct msm_fence_context *fctx, uint32_t fence)
> >  {
> >       spin_lock(&fctx->spinlock);
> >       fctx->completed_fence = max(fence, fctx->completed_fence);
> > +     if (fence_completed(fctx, fctx->next_deadline_fence))
> > +             hrtimer_cancel(&fctx->deadline_timer);
> >       spin_unlock(&fctx->spinlock);
> >  }
> >
> > @@ -79,10 +119,46 @@ static bool msm_fence_signaled(struct dma_fence *fence)
> >       return fence_completed(f->fctx, f->base.seqno);
> >  }
> >
> > +static void msm_fence_set_deadline(struct dma_fence *fence, ktime_t deadline)
> > +{
> > +     struct msm_fence *f = to_msm_fence(fence);
> > +     struct msm_fence_context *fctx = f->fctx;
> > +     unsigned long flags;
> > +     ktime_t now;
> > +
> > +     spin_lock_irqsave(&fctx->spinlock, flags);
> > +     now = ktime_get();
> > +
> > +     if (ktime_after(now, fctx->next_deadline) ||
> > +                     ktime_before(deadline, fctx->next_deadline)) {
> > +             fctx->next_deadline = deadline;
> > +             fctx->next_deadline_fence =
> > +                     max(fctx->next_deadline_fence, (uint32_t)fence->seqno);
> > +
> > +             /*
> > +              * Set timer to trigger boost 3ms before deadline, or
> > +              * if we are already less than 3ms before the deadline
> > +              * schedule boost work immediately.
> > +              */
> > +             deadline = ktime_sub(deadline, ms_to_ktime(3));
> > +
> > +             if (ktime_after(now, deadline)) {
> > +                     kthread_queue_work(fctx2gpu(fctx)->worker,
> > +                                     &fctx->deadline_work);
> > +             } else {
> > +                     hrtimer_start(&fctx->deadline_timer, deadline,
> > +                                     HRTIMER_MODE_ABS);
> > +             }
> > +     }
> > +
> > +     spin_unlock_irqrestore(&fctx->spinlock, flags);
> > +}
> > +
> >  static const struct dma_fence_ops msm_fence_ops = {
> >       .get_driver_name = msm_fence_get_driver_name,
> >       .get_timeline_name = msm_fence_get_timeline_name,
> >       .signaled = msm_fence_signaled,
> > +     .set_deadline = msm_fence_set_deadline,
> >  };
> >
> >  struct dma_fence *
> > diff --git a/drivers/gpu/drm/msm/msm_fence.h b/drivers/gpu/drm/msm/msm_fence.h
> > index 4783db528bcc..d34e853c555a 100644
> > --- a/drivers/gpu/drm/msm/msm_fence.h
> > +++ b/drivers/gpu/drm/msm/msm_fence.h
> > @@ -50,6 +50,26 @@ struct msm_fence_context {
> >       volatile uint32_t *fenceptr;
> >
> >       spinlock_t spinlock;
> > +
> > +     /*
> > +      * TODO this doesn't really deal with multiple deadlines, like
> > +      * if userspace got multiple frames ahead.. OTOH atomic updates
> > +      * don't queue, so maybe that is ok
> > +      */
> > +
> > +     /** next_deadline: Time of next deadline */
> > +     ktime_t next_deadline;
> > +
> > +     /**
> > +      * next_deadline_fence:
> > +      *
> > +      * Fence value for next pending deadline.  The deadline timer is
> > +      * canceled when this fence is signaled.
> > +      */
> > +     uint32_t next_deadline_fence;
> > +
> > +     struct hrtimer deadline_timer;
> > +     struct kthread_work deadline_work;
> >  };
> >
> >  struct msm_fence_context * msm_fence_context_alloc(struct drm_device *dev,
> > diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
> > index 0e4b45bff2e6..e031c9b495ed 100644
> > --- a/drivers/gpu/drm/msm/msm_gpu.h
> > +++ b/drivers/gpu/drm/msm/msm_gpu.h
> > @@ -425,6 +425,7 @@ void msm_devfreq_init(struct msm_gpu *gpu);
> >  void msm_devfreq_cleanup(struct msm_gpu *gpu);
> >  void msm_devfreq_resume(struct msm_gpu *gpu);
> >  void msm_devfreq_suspend(struct msm_gpu *gpu);
> > +void msm_devfreq_boost(struct msm_gpu *gpu, unsigned factor);
> >  void msm_devfreq_active(struct msm_gpu *gpu);
> >  void msm_devfreq_idle(struct msm_gpu *gpu);
> >
> > diff --git a/drivers/gpu/drm/msm/msm_gpu_devfreq.c b/drivers/gpu/drm/msm/msm_gpu_devfreq.c
> > index 0a1ee20296a2..8a8d7b9028a3 100644
> > --- a/drivers/gpu/drm/msm/msm_gpu_devfreq.c
> > +++ b/drivers/gpu/drm/msm/msm_gpu_devfreq.c
> > @@ -144,6 +144,26 @@ void msm_devfreq_suspend(struct msm_gpu *gpu)
> >       devfreq_suspend_device(gpu->devfreq.devfreq);
> >  }
> >
> > +void msm_devfreq_boost(struct msm_gpu *gpu, unsigned factor)
> > +{
> > +     struct msm_gpu_devfreq *df = &gpu->devfreq;
> > +     unsigned long freq;
> > +
> > +     /*
> > +      * Hold devfreq lock to synchronize with get_dev_status()/
> > +      * target() callbacks
> > +      */
> > +     mutex_lock(&df->devfreq->lock);
> > +
> > +     freq = get_freq(gpu);
> > +
> > +     freq *= factor;
> > +
> > +     msm_devfreq_target(&gpu->pdev->dev, &freq, 0);
> > +
> > +     mutex_unlock(&df->devfreq->lock);
> > +}
> > +
> >  void msm_devfreq_active(struct msm_gpu *gpu)
> >  {
> >       struct msm_gpu_devfreq *df = &gpu->devfreq;
> > --
> > 2.31.1
> >
>
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
