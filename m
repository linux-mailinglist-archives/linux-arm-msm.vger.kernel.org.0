Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0BD43276665
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Sep 2020 04:29:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726469AbgIXC3b (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 23 Sep 2020 22:29:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59732 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726196AbgIXC3a (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 23 Sep 2020 22:29:30 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE4E5C0613CE;
        Wed, 23 Sep 2020 19:29:29 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id m6so2094546wrn.0;
        Wed, 23 Sep 2020 19:29:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=LmgnskKNdRwe1qMZiFFEjTpDq5C71vnbi9wDTaf6LeQ=;
        b=AIX/e+6ZaAmWlWsJjmnct4HwhoY/jjEdZVhwWwSbA5B4Drk//ccsh6V30yNcRItNLy
         micW54cd0LeJXdNQ0waKSVXr36c0LL5HVXya0nXmQggKaUC+8YsJ3oWjC/dEbBDbvl1h
         kCpZlZP8+gd3z/A6o4B5qBfR5DNO8H4mECAGCdgmslRqm4tI29nZO+Rt/5aQk4kLRxqV
         9vtRiRUgn9UnnxvLgLh7VYDe1Awv1Qynyi7/dzEpfwcHillGUvxWQpMCytYpbUZsT4ap
         IwtUXWZFfPjJP34wE7TCCfmxvcUwDC3xB8XhCWIs1wAxWsMQzu97KIqly05RmYD503aU
         +Glg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=LmgnskKNdRwe1qMZiFFEjTpDq5C71vnbi9wDTaf6LeQ=;
        b=sPdYQswLRu79Evt5/1cCm+NtCjyQH/Bud38LmI0ezjpnsFrbwvZhEoMJ+SW+7NY9bN
         ROxOTt4SrEwJ92lokn/RDxaAY7X32AQg1kBU2fGaKDQ0NaMF2vTnzBxc3gESvB457DTd
         JKYe9kFF8Nrb5LDh/qJCgroHR7h8KYjGqXZ3ZDUDfZ+2z2dykWwCuxwYOKbgJ4offgB2
         7ELHSusUfszzM+UEOhGAT4+LRa+BgFP/5XssLST0OboxY8HXSwpvyzIErGwgz0O4XM0G
         6qEHWeY5uTPTkwiIPkkt7f8bdlhR1saPeXj/zfH0z22abx364mI+mKzHbNBZjH6pRxxf
         NzuQ==
X-Gm-Message-State: AOAM5317O6yidayyFY6QVRyk2+KnqIs5cYJI90MIdSIXcwo4+I4Hv6yH
        fjfQFKJKQtcdzruGWHVJbUTjHHwxA4E2SHsWuBA=
X-Google-Smtp-Source: ABdhPJxpETAyf8GANMGmvUcaximmB2hVNwam1RsIPn05W2wNiL2ekIeh8YoLaFtl0uLCB+H2VgDcF9RKQgpd9Ingb58=
X-Received: by 2002:adf:e6c7:: with SMTP id y7mr2320238wrm.147.1600914568494;
 Wed, 23 Sep 2020 19:29:28 -0700 (PDT)
MIME-Version: 1.0
References: <1600786527-7343-1-git-send-email-akhilpo@codeaurora.org>
 <20200923145047.GB31425@jcrouse1-lnx.qualcomm.com> <df7a93b7-240f-bb52-9e3c-eeb346a4574e@codeaurora.org>
In-Reply-To: <df7a93b7-240f-bb52-9e3c-eeb346a4574e@codeaurora.org>
From:   Rob Clark <robdclark@gmail.com>
Date:   Wed, 23 Sep 2020 19:29:17 -0700
Message-ID: <CAF6AEGsfrjOH4ZGga6Tg706vRwJohU97gV7eVML2i3DSDD8tXg@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] drm/msm: Fix premature purging of BO
To:     Akhil P Oommen <akhilpo@codeaurora.org>
Cc:     freedreno <freedreno@lists.freedesktop.org>,
        dri-devel@freedesktop.org,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Jonathan <jonathan@marek.ca>,
        Douglas Anderson <dianders@chromium.org>,
        Jordan Crouse <jcrouse@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Sep 23, 2020 at 11:28 AM Akhil P Oommen <akhilpo@codeaurora.org> wrote:
>
> On 9/23/2020 8:20 PM, Jordan Crouse wrote:
> > On Tue, Sep 22, 2020 at 08:25:26PM +0530, Akhil P Oommen wrote:
> >> In the case where we have a back-to-back submission that shares the same
> >> BO, this BO will be prematurely moved to inactive_list while retiring the
> >> first submit. But it will be still part of the second submit which is
> >> being processed by the GPU. Now, if the shrinker happens to be triggered at
> >> this point, it will result in a premature purging of this BO.
> >>
> >> To fix this, we need to refcount BO while doing submit and retire. Then,
> >> it should be moved to inactive list when this refcount becomes 0.
> >>
> >> Signed-off-by: Akhil P Oommen <akhilpo@codeaurora.org>
> >> ---
> >> Changes in v2:
> >>      1. Keep Active List around
> >>      2. Put back the deleted WARN_ON
> >>
> >>   drivers/gpu/drm/msm/msm_drv.h |  5 ++---
> >>   drivers/gpu/drm/msm/msm_gem.c | 32 ++++++++++++++++----------------
> >>   drivers/gpu/drm/msm/msm_gem.h |  4 +++-
> >>   drivers/gpu/drm/msm/msm_gpu.c | 11 +++++++----
> >>   4 files changed, 28 insertions(+), 24 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
> >> index 3193274..28e3c8d 100644
> >> --- a/drivers/gpu/drm/msm/msm_drv.h
> >> +++ b/drivers/gpu/drm/msm/msm_drv.h
> >> @@ -309,9 +309,8 @@ void msm_gem_put_vaddr(struct drm_gem_object *obj);
> >>   int msm_gem_madvise(struct drm_gem_object *obj, unsigned madv);
> >>   int msm_gem_sync_object(struct drm_gem_object *obj,
> >>              struct msm_fence_context *fctx, bool exclusive);
> >> -void msm_gem_move_to_active(struct drm_gem_object *obj,
> >> -            struct msm_gpu *gpu, bool exclusive, struct dma_fence *fence);
> >> -void msm_gem_move_to_inactive(struct drm_gem_object *obj);
> >> +void msm_gem_active_get(struct drm_gem_object *obj, struct msm_gpu *gpu);
> >> +void msm_gem_active_put(struct drm_gem_object *obj);
> >>   int msm_gem_cpu_prep(struct drm_gem_object *obj, uint32_t op, ktime_t *timeout);
> >>   int msm_gem_cpu_fini(struct drm_gem_object *obj);
> >>   void msm_gem_free_object(struct drm_gem_object *obj);
> >> diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
> >> index 76a6c52..14e14ca 100644
> >> --- a/drivers/gpu/drm/msm/msm_gem.c
> >> +++ b/drivers/gpu/drm/msm/msm_gem.c
> >> @@ -743,31 +743,31 @@ int msm_gem_sync_object(struct drm_gem_object *obj,
> >>      return 0;
> >>   }
> >>
> >> -void msm_gem_move_to_active(struct drm_gem_object *obj,
> >> -            struct msm_gpu *gpu, bool exclusive, struct dma_fence *fence)
> >> +void msm_gem_active_get(struct drm_gem_object *obj, struct msm_gpu *gpu)
> >>   {
> >>      struct msm_gem_object *msm_obj = to_msm_bo(obj);
> >> +    WARN_ON(!mutex_is_locked(&obj->dev->struct_mutex));
> >>      WARN_ON(msm_obj->madv != MSM_MADV_WILLNEED);
> >> -    msm_obj->gpu = gpu;
> >> -    if (exclusive)
> >> -            dma_resv_add_excl_fence(obj->resv, fence);
> >> -    else
> >> -            dma_resv_add_shared_fence(obj->resv, fence);
> >> -    list_del_init(&msm_obj->mm_list);
> >> -    list_add_tail(&msm_obj->mm_list, &gpu->active_list);
> >> +
> >> +    if (!atomic_fetch_inc(&msm_obj->active_count)) {
> >> +            msm_obj->gpu = gpu;
> >> +            list_del_init(&msm_obj->mm_list);
> >> +            list_add_tail(&msm_obj->mm_list, &gpu->active_list);
> >> +    }
> >
> > I'm not sure if all the renaming and reorganization are really needed here -
> > this is the meat of the change and it would have fit in reasonably well with the
> > existing function design.
> This happened due to the way I implemented the v1 patch. In the
> hindsight, I think you are right.
>

fwiw, I'd already pushed v2 to msm-next.. I guess it could have been a
smaller diff-stat, but I don't really object to the other changes
(which were replacing things that were already a result of how things
had previously evolved)

BR,
-R

> Akhil.
> >
> >>   }
> >>
> >> -void msm_gem_move_to_inactive(struct drm_gem_object *obj)
> >> +void msm_gem_active_put(struct drm_gem_object *obj)
> >>   {
> >> -    struct drm_device *dev = obj->dev;
> >> -    struct msm_drm_private *priv = dev->dev_private;
> >>      struct msm_gem_object *msm_obj = to_msm_bo(obj);
> >> +    struct msm_drm_private *priv = obj->dev->dev_private;
> >>
> >> -    WARN_ON(!mutex_is_locked(&dev->struct_mutex));
> >> +    WARN_ON(!mutex_is_locked(&obj->dev->struct_mutex));
> >>
> >> -    msm_obj->gpu = NULL;
> >> -    list_del_init(&msm_obj->mm_list);
> >> -    list_add_tail(&msm_obj->mm_list, &priv->inactive_list);
> >> +    if (!atomic_dec_return(&msm_obj->active_count)) {
> >> +            msm_obj->gpu = NULL;
> >> +            list_del_init(&msm_obj->mm_list);
> >> +            list_add_tail(&msm_obj->mm_list, &priv->inactive_list);
> >> +    }
> >
> > Same.
> >
> > Jordan
> >>   }
> >>
> >>   int msm_gem_cpu_prep(struct drm_gem_object *obj, uint32_t op, ktime_t *timeout)
> >> diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
> >> index 7b1c7a5..a1bf741 100644
> >> --- a/drivers/gpu/drm/msm/msm_gem.h
> >> +++ b/drivers/gpu/drm/msm/msm_gem.h
> >> @@ -88,12 +88,14 @@ struct msm_gem_object {
> >>      struct mutex lock; /* Protects resources associated with bo */
> >>
> >>      char name[32]; /* Identifier to print for the debugfs files */
> >> +
> >> +    atomic_t active_count;
> >>   };
> >>   #define to_msm_bo(x) container_of(x, struct msm_gem_object, base)
> >>
> >>   static inline bool is_active(struct msm_gem_object *msm_obj)
> >>   {
> >> -    return msm_obj->gpu != NULL;
> >> +    return atomic_read(&msm_obj->active_count);
> >>   }
> >>
> >>   static inline bool is_purgeable(struct msm_gem_object *msm_obj)
> >> diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
> >> index 29c8d73c..55d1648 100644
> >> --- a/drivers/gpu/drm/msm/msm_gpu.c
> >> +++ b/drivers/gpu/drm/msm/msm_gpu.c
> >> @@ -698,8 +698,8 @@ static void retire_submit(struct msm_gpu *gpu, struct msm_ringbuffer *ring,
> >>
> >>      for (i = 0; i < submit->nr_bos; i++) {
> >>              struct msm_gem_object *msm_obj = submit->bos[i].obj;
> >> -            /* move to inactive: */
> >> -            msm_gem_move_to_inactive(&msm_obj->base);
> >> +
> >> +            msm_gem_active_put(&msm_obj->base);
> >>              msm_gem_unpin_iova(&msm_obj->base, submit->aspace);
> >>              drm_gem_object_put_locked(&msm_obj->base);
> >>      }
> >> @@ -774,6 +774,7 @@ void msm_gpu_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
> >>
> >>      for (i = 0; i < submit->nr_bos; i++) {
> >>              struct msm_gem_object *msm_obj = submit->bos[i].obj;
> >> +            struct drm_gem_object *drm_obj = &msm_obj->base;
> >>              uint64_t iova;
> >>
> >>              /* can't happen yet.. but when we add 2d support we'll have
> >> @@ -786,9 +787,11 @@ void msm_gpu_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
> >>              msm_gem_get_and_pin_iova(&msm_obj->base, submit->aspace, &iova);
> >>
> >>              if (submit->bos[i].flags & MSM_SUBMIT_BO_WRITE)
> >> -                    msm_gem_move_to_active(&msm_obj->base, gpu, true, submit->fence);
> >> +                    dma_resv_add_excl_fence(drm_obj->resv, submit->fence);
> >>              else if (submit->bos[i].flags & MSM_SUBMIT_BO_READ)
> >> -                    msm_gem_move_to_active(&msm_obj->base, gpu, false, submit->fence);
> >> +                    dma_resv_add_shared_fence(drm_obj->resv, submit->fence);
> >> +
> >> +            msm_gem_active_get(drm_obj, gpu);
> >>      }
> >>
> >>      gpu->funcs->submit(gpu, submit);
> >> --
> >> 2.7.4
> >>
> >
>
