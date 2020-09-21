Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 82F37272A85
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Sep 2020 17:44:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726720AbgIUPoU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 21 Sep 2020 11:44:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53010 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727838AbgIUPoO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 21 Sep 2020 11:44:14 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3557FC061755;
        Mon, 21 Sep 2020 08:44:14 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id a17so13285192wrn.6;
        Mon, 21 Sep 2020 08:44:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Ncg6avQQOalfPHkzs1oRhLRgvZCdQBKt01aCszcvetU=;
        b=NVNaMJ7ITtRUOps26faZunIJcz7uDjSlVkq44z9Vb6PRdsl3FspBnfrIk5sFVha0Ow
         qMbe468oFXIBzIb+4Uq8OrAdKLiz7qUiBlH2TOdvVYn45lWGOVNWlapPdm1ny4NfmKGK
         amuj1DbOl50HYxz6xUnzbJlkd/feqQb9eCz5lf6F7q3wkZ6Ae4qXWXRBJm0CUTXi38+X
         2LlO4Ed3ZxcNJqQQVly3N7z53PwEgOycJn2PpxMfPubxLt844j49+/X5xmrofNkLnSZ2
         aVhcABfKb63PtOzjMWTkehpuwU6I+XUT++pSWd4jZCKZVrJ4PU441k9W4a0aXyytgv58
         qsdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Ncg6avQQOalfPHkzs1oRhLRgvZCdQBKt01aCszcvetU=;
        b=ixC7MzS9lDW3+WEqBmHyS98ifwrLe0kxjbzHlxlJZizolb4XJVFkf3KPGfHFqH2OJZ
         mhFWu5CYOEDSlGITelOR3jIhHIAwKCG8WMByll+qYPpLZgtMpy6HWIjkSI/i470vPHOd
         eP2M9KyYmVOUFbUt6iyyR+Nvwtoc+UBc8rtuPBL0JUEfwn4m9A+WwNrl18RDfrITw2oc
         ij3ZKguT3MDWTV3aLoFo03dUILM9mYwXKikWawXWl1QDetb+RpcqT/VZ7TINPEUdBHM6
         EDfvWHyM2fVVV9dTlJazJSLxz/W95wxAE93Z8QjBW4hSqKTfVRPUwUrHwRaoKlng0KaK
         z0eQ==
X-Gm-Message-State: AOAM532D8yNv4QzCX+2mCF023eeyS1S8I9vrFJd1P5neNNBZsOfYEJ3u
        prS8+dhtED0IHkfElriG/UjBSJEfgsnt6kfnrqo=
X-Google-Smtp-Source: ABdhPJzMA87ZO84z3m+xAsODxCz2vLvFZSGF0VaQEONo6ODJ2wz9ldoFqrzXAwmy2Vm3nccYC3OUqXZWfNX2mh/BAyY=
X-Received: by 2002:a5d:4a0c:: with SMTP id m12mr380766wrq.83.1600703052626;
 Mon, 21 Sep 2020 08:44:12 -0700 (PDT)
MIME-Version: 1.0
References: <1600702038-10893-1-git-send-email-akhilpo@codeaurora.org>
In-Reply-To: <1600702038-10893-1-git-send-email-akhilpo@codeaurora.org>
From:   Rob Clark <robdclark@gmail.com>
Date:   Mon, 21 Sep 2020 08:44:01 -0700
Message-ID: <CAF6AEGvspAXr3RFzBF_WB83QXNCzNEAzWj7_UqHWc=1gtAbgqw@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm/msm: Replace active_list with refcount
To:     Akhil P Oommen <akhilpo@codeaurora.org>
Cc:     freedreno <freedreno@lists.freedesktop.org>,
        dri-devel@freedesktop.org,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Jonathan <jonathan@marek.ca>,
        Douglas Anderson <dianders@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Sep 21, 2020 at 8:27 AM Akhil P Oommen <akhilpo@codeaurora.org> wrote:
>
> In the case where we have a back-to-back submission that shares the same
> BO, this BO will be prematurely moved to inactive_list while retiring the
> first submit. But it will be still part of the second submit which is
> being processed by the GPU. Now, if the shrinker happens to be triggered at
> this point, it will result in premature purging of this BO.
>
> To fix this, we can replace the active_list with reference counting and
> move the BO to inactive list only when this count becomes zero.
>
> Signed-off-by: Akhil P Oommen <akhilpo@codeaurora.org>
> ---
>  drivers/gpu/drm/msm/msm_drv.h |  5 ++---
>  drivers/gpu/drm/msm/msm_gem.c | 30 ++++++++++++++++--------------
>  drivers/gpu/drm/msm/msm_gem.h |  4 +++-
>  drivers/gpu/drm/msm/msm_gpu.c | 11 +++++++----
>  4 files changed, 28 insertions(+), 22 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
> index 3193274..28e3c8d 100644
> --- a/drivers/gpu/drm/msm/msm_drv.h
> +++ b/drivers/gpu/drm/msm/msm_drv.h
> @@ -309,9 +309,8 @@ void msm_gem_put_vaddr(struct drm_gem_object *obj);
>  int msm_gem_madvise(struct drm_gem_object *obj, unsigned madv);
>  int msm_gem_sync_object(struct drm_gem_object *obj,
>                 struct msm_fence_context *fctx, bool exclusive);
> -void msm_gem_move_to_active(struct drm_gem_object *obj,
> -               struct msm_gpu *gpu, bool exclusive, struct dma_fence *fence);
> -void msm_gem_move_to_inactive(struct drm_gem_object *obj);
> +void msm_gem_active_get(struct drm_gem_object *obj, struct msm_gpu *gpu);
> +void msm_gem_active_put(struct drm_gem_object *obj);
>  int msm_gem_cpu_prep(struct drm_gem_object *obj, uint32_t op, ktime_t *timeout);
>  int msm_gem_cpu_fini(struct drm_gem_object *obj);
>  void msm_gem_free_object(struct drm_gem_object *obj);
> diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
> index 76a6c52..accc106 100644
> --- a/drivers/gpu/drm/msm/msm_gem.c
> +++ b/drivers/gpu/drm/msm/msm_gem.c
> @@ -743,33 +743,36 @@ int msm_gem_sync_object(struct drm_gem_object *obj,
>         return 0;
>  }
>
> -void msm_gem_move_to_active(struct drm_gem_object *obj,
> -               struct msm_gpu *gpu, bool exclusive, struct dma_fence *fence)
> +void msm_gem_active_get(struct drm_gem_object *obj, struct msm_gpu *gpu)
>  {
>         struct msm_gem_object *msm_obj = to_msm_bo(obj);
> +       WARN_ON(!mutex_is_locked(&obj->dev->struct_mutex));
>         WARN_ON(msm_obj->madv != MSM_MADV_WILLNEED);
> +
>         msm_obj->gpu = gpu;
> -       if (exclusive)
> -               dma_resv_add_excl_fence(obj->resv, fence);
> -       else
> -               dma_resv_add_shared_fence(obj->resv, fence);
>         list_del_init(&msm_obj->mm_list);
> -       list_add_tail(&msm_obj->mm_list, &gpu->active_list);
> +       atomic_inc(&msm_obj->active_count);

I don't think we want to get rid of active_list, but just supplement
it with a refcnt.

I suspect as-is, this breaks $debugfs/gem (which iterates the active
and inactive list)

>  }
>
> -void msm_gem_move_to_inactive(struct drm_gem_object *obj)
> +static void move_to_inactive(struct msm_gem_object *msm_obj)
>  {
> -       struct drm_device *dev = obj->dev;
> +       struct drm_device *dev = msm_obj->base.dev;
>         struct msm_drm_private *priv = dev->dev_private;
> -       struct msm_gem_object *msm_obj = to_msm_bo(obj);
> -
> -       WARN_ON(!mutex_is_locked(&dev->struct_mutex));
>
>         msm_obj->gpu = NULL;
> -       list_del_init(&msm_obj->mm_list);
>         list_add_tail(&msm_obj->mm_list, &priv->inactive_list);
>  }
>
> +void msm_gem_active_put(struct drm_gem_object *obj)
> +{
> +       struct msm_gem_object *msm_obj = to_msm_bo(obj);
> +
> +       WARN_ON(!mutex_is_locked(&obj->dev->struct_mutex));
> +
> +       if (atomic_dec_and_test(&msm_obj->active_count))
> +               move_to_inactive(msm_obj);
> +}
> +
>  int msm_gem_cpu_prep(struct drm_gem_object *obj, uint32_t op, ktime_t *timeout)
>  {
>         bool write = !!(op & MSM_PREP_WRITE);
> @@ -1104,7 +1107,6 @@ static struct drm_gem_object *_msm_gem_new(struct drm_device *dev,
>         }
>
>         if (struct_mutex_locked) {
> -               WARN_ON(!mutex_is_locked(&dev->struct_mutex));

This looks unrelated (and I don't think we want to drop this WARN_ON())

BR,
-R

>                 list_add_tail(&msm_obj->mm_list, &priv->inactive_list);
>         } else {
>                 mutex_lock(&dev->struct_mutex);
> diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
> index 7b1c7a5..a1bf741 100644
> --- a/drivers/gpu/drm/msm/msm_gem.h
> +++ b/drivers/gpu/drm/msm/msm_gem.h
> @@ -88,12 +88,14 @@ struct msm_gem_object {
>         struct mutex lock; /* Protects resources associated with bo */
>
>         char name[32]; /* Identifier to print for the debugfs files */
> +
> +       atomic_t active_count;
>  };
>  #define to_msm_bo(x) container_of(x, struct msm_gem_object, base)
>
>  static inline bool is_active(struct msm_gem_object *msm_obj)
>  {
> -       return msm_obj->gpu != NULL;
> +       return atomic_read(&msm_obj->active_count);
>  }
>
>  static inline bool is_purgeable(struct msm_gem_object *msm_obj)
> diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
> index 29c8d73c..55d1648 100644
> --- a/drivers/gpu/drm/msm/msm_gpu.c
> +++ b/drivers/gpu/drm/msm/msm_gpu.c
> @@ -698,8 +698,8 @@ static void retire_submit(struct msm_gpu *gpu, struct msm_ringbuffer *ring,
>
>         for (i = 0; i < submit->nr_bos; i++) {
>                 struct msm_gem_object *msm_obj = submit->bos[i].obj;
> -               /* move to inactive: */
> -               msm_gem_move_to_inactive(&msm_obj->base);
> +
> +               msm_gem_active_put(&msm_obj->base);
>                 msm_gem_unpin_iova(&msm_obj->base, submit->aspace);
>                 drm_gem_object_put_locked(&msm_obj->base);
>         }
> @@ -774,6 +774,7 @@ void msm_gpu_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
>
>         for (i = 0; i < submit->nr_bos; i++) {
>                 struct msm_gem_object *msm_obj = submit->bos[i].obj;
> +               struct drm_gem_object *drm_obj = &msm_obj->base;
>                 uint64_t iova;
>
>                 /* can't happen yet.. but when we add 2d support we'll have
> @@ -786,9 +787,11 @@ void msm_gpu_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
>                 msm_gem_get_and_pin_iova(&msm_obj->base, submit->aspace, &iova);
>
>                 if (submit->bos[i].flags & MSM_SUBMIT_BO_WRITE)
> -                       msm_gem_move_to_active(&msm_obj->base, gpu, true, submit->fence);
> +                       dma_resv_add_excl_fence(drm_obj->resv, submit->fence);
>                 else if (submit->bos[i].flags & MSM_SUBMIT_BO_READ)
> -                       msm_gem_move_to_active(&msm_obj->base, gpu, false, submit->fence);
> +                       dma_resv_add_shared_fence(drm_obj->resv, submit->fence);
> +
> +               msm_gem_active_get(drm_obj, gpu);
>         }
>
>         gpu->funcs->submit(gpu, submit);
> --
> 2.7.4
>
