Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C5F2728E343
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Oct 2020 17:25:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727434AbgJNPZ6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 14 Oct 2020 11:25:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40222 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727056AbgJNPZ6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 14 Oct 2020 11:25:58 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3EA02C061755;
        Wed, 14 Oct 2020 08:25:58 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id e18so4340130wrw.9;
        Wed, 14 Oct 2020 08:25:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=YxBEZ2zwOvQ2OmfgqDWhyS8kAvpMsA83AdcbbwSb0EE=;
        b=ZAbFPWTQcSXPMYVBlmCH8uVilNTpEpqaXnTk/l4eTYe1Awp8Uwl8piKKbLJ1Eyxq5g
         GWM9HleNnX99p1uU/DahMgxpyJsHW0q2LBpDB9RRBaEiuZgWq6DBb/Wn69wj+v88GnnG
         Hm4xrXgEs873m2WQGe5LMS1rSRZWlcAL53JArHEZ49L38f5Djsoh0PGeNrykglNxoDeE
         lca5l7W4CcIaT50qHfCClXbgXBEA4R2ygx6JkIs03VwN/sJsTYYmNOGTk+yi3THqB6OH
         rXzS9wisOxT0mRtI5yoIJ9rFVbpgUHIDcAK+3QzwsmhQj5/XUnhts6DDN6J3sVKMC7ta
         1qRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=YxBEZ2zwOvQ2OmfgqDWhyS8kAvpMsA83AdcbbwSb0EE=;
        b=lZheBI5RPGF/JamJ9VR0FENFo99rTdDYWlGtqaDfFaCuyVyNElvcuanC7becGVl2PD
         nVeXvo8CNq6fqSoA8OfU1ZzuNvqODvcLl/nF19StWWhz7SgXPXeQVxwEvbHTuzti8Lug
         bbEgGRnpasIIBXSD9TL3DlGOsLP9NJU6t5oDVeecP2JXwit5K4ukgHAbAD5JJ0+OTbpB
         99UoBfNNpqJcWxM/UuRUNJiBKKMrX1f96m1GrBUAlJq1fRLXmhLiRC2DN0mQftrVkAFV
         vg73hdWOAP7lESuMdh+LttKNxh1MOrQh5gWBF4JJLpSoqIhJqGyqJNyhJlA2Iw41jjQs
         GwjQ==
X-Gm-Message-State: AOAM531H4egS/i7IxKI1JM4wMDZY75fD161GYf/16hQZfeU6vru23nhb
        OvF5UJ6uLGuTYAVVKak50HtUYeFjc7IxNHyWVt8=
X-Google-Smtp-Source: ABdhPJxt0hbMDz45mCBTIX0MF07E2kkg25OjgQEakXS6TJkZaNMfzplAhXY+OSjSSksFO8J1W8Fb6qb0EV+aalIxPaY=
X-Received: by 2002:a05:6000:1633:: with SMTP id v19mr5814473wrb.147.1602689156795;
 Wed, 14 Oct 2020 08:25:56 -0700 (PDT)
MIME-Version: 1.0
References: <1602680296-8965-1-git-send-email-mkrishn@codeaurora.org>
In-Reply-To: <1602680296-8965-1-git-send-email-mkrishn@codeaurora.org>
From:   Rob Clark <robdclark@gmail.com>
Date:   Wed, 14 Oct 2020 08:25:45 -0700
Message-ID: <CAF6AEGtQEbGVQdNPSaHy41gqsiLV19X8kxMVCRUy8y1SzjTZGw@mail.gmail.com>
Subject: Re: [v1] drm/msm: Fix race condition in msm driver with async layer updates
To:     Krishna Manikandan <mkrishn@codeaurora.org>
Cc:     dri-devel <dri-devel@lists.freedesktop.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Sean Paul <seanpaul@chromium.org>,
        "Kristian H. Kristensen" <hoegsberg@chromium.org>,
        Kalyan Thota <kalyan_t@codeaurora.org>,
        Douglas Anderson <dianders@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Oct 14, 2020 at 5:58 AM Krishna Manikandan
<mkrishn@codeaurora.org> wrote:
>
> When there are back to back commits with async cursor update,
> there is a case where second commit can program the DPU hw
> blocks while first didn't complete flushing config to HW.
>
> Synchronize the compositions such that second commit waits
> until first commit flushes the composition.
>
> This change also introduces per crtc commit lock, such that
> commits on different crtcs are not blocked by each other.
>
> Signed-off-by: Krishna Manikandan <mkrishn@codeaurora.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c |  1 +
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h |  1 +
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c  | 26 ++++++++++++++++++++++++
>  drivers/gpu/drm/msm/msm_atomic.c         | 35 ++++++++++++++++++++++----------
>  drivers/gpu/drm/msm/msm_kms.h            |  5 +++++
>  5 files changed, 57 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> index c2729f7..9024719 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> @@ -1383,6 +1383,7 @@ struct drm_crtc *dpu_crtc_init(struct drm_device *dev, struct drm_plane *plane,
>
>         /* initialize event handling */
>         spin_lock_init(&dpu_crtc->event_lock);
> +       mutex_init(&dpu_crtc->commit_lock);
>
>         DPU_DEBUG("%s: successfully initialized crtc\n", dpu_crtc->name);
>         return crtc;
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
> index cec3474..1eeb73d 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
> @@ -169,6 +169,7 @@ struct dpu_crtc {
>
>         /* for handling internal event thread */
>         spinlock_t event_lock;
> +       struct mutex commit_lock;
>
>         struct dpu_core_perf_params cur_perf;
>
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> index c0a4d4e..f99ae7a 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> @@ -445,6 +445,30 @@ static void dpu_kms_wait_flush(struct msm_kms *kms, unsigned crtc_mask)
>                 dpu_kms_wait_for_commit_done(kms, crtc);
>  }
>
> +static void dpu_kms_commit_lock(struct msm_kms *kms, unsigned int crtc_mask)
> +{
> +       struct dpu_kms *dpu_kms = to_dpu_kms(kms);
> +       struct drm_crtc *crtc;
> +       struct dpu_crtc *dpu_crtc;
> +
> +       for_each_crtc_mask(dpu_kms->dev, crtc, crtc_mask) {
> +               dpu_crtc = to_dpu_crtc(crtc);
> +               mutex_lock(&dpu_crtc->commit_lock);
> +       }
> +}
> +
> +static void dpu_kms_commit_unlock(struct msm_kms *kms, unsigned int crtc_mask)
> +{
> +       struct dpu_kms *dpu_kms = to_dpu_kms(kms);
> +       struct drm_crtc *crtc;
> +       struct dpu_crtc *dpu_crtc;
> +
> +       for_each_crtc_mask(dpu_kms->dev, crtc, crtc_mask) {
> +               dpu_crtc = to_dpu_crtc(crtc);
> +               mutex_unlock(&dpu_crtc->commit_lock);
> +       }
> +}
> +
>  static int _dpu_kms_initialize_dsi(struct drm_device *dev,
>                                     struct msm_drm_private *priv,
>                                     struct dpu_kms *dpu_kms)
> @@ -738,6 +762,8 @@ static const struct msm_kms_funcs kms_funcs = {
>  #ifdef CONFIG_DEBUG_FS
>         .debugfs_init    = dpu_kms_debugfs_init,
>  #endif
> +       .commit_lock     = dpu_kms_commit_lock,
> +       .commit_unlock   = dpu_kms_commit_unlock,
>  };
>
>  static void _dpu_kms_mmu_destroy(struct dpu_kms *dpu_kms)
> diff --git a/drivers/gpu/drm/msm/msm_atomic.c b/drivers/gpu/drm/msm/msm_atomic.c
> index 561bfa4..d33253f 100644
> --- a/drivers/gpu/drm/msm/msm_atomic.c
> +++ b/drivers/gpu/drm/msm/msm_atomic.c
> @@ -55,16 +55,32 @@ static void vblank_put(struct msm_kms *kms, unsigned crtc_mask)
>         }
>  }
>
> +static void msm_commit_lock(struct msm_kms *kms, unsigned int crtc_mask)
> +{
> +       if (kms->funcs->commit_lock)
> +               kms->funcs->commit_lock(kms, crtc_mask);
> +       else
> +               mutex_lock(&kms->commit_lock);
> +}
> +
> +static void msm_commit_unlock(struct msm_kms *kms, unsigned int crtc_mask)
> +{
> +       if (kms->funcs->commit_unlock)
> +               kms->funcs->commit_unlock(kms, crtc_mask);
> +       else
> +               mutex_unlock(&kms->commit_lock);
> +}

Hi, I think the per-crtc commit-lock, and the updated
locking/unlocking points are the right thing to do, but I don't think
we need to touch dpu for this.  Just change kms->commit_lock to an
array of mutexes, and drop the vfunc indirection.  All the same
locking logic applies to mdp4/mdp5 as well (ie. don't touch the hw
until it has flushed)

BR,
-R

> +
>  static void msm_atomic_async_commit(struct msm_kms *kms, int crtc_idx)
>  {
>         unsigned crtc_mask = BIT(crtc_idx);
>
>         trace_msm_atomic_async_commit_start(crtc_mask);
>
> -       mutex_lock(&kms->commit_lock);
> +       msm_commit_lock(kms, crtc_mask);
>
>         if (!(kms->pending_crtc_mask & crtc_mask)) {
> -               mutex_unlock(&kms->commit_lock);
> +               msm_commit_unlock(kms, crtc_mask);
>                 goto out;
>         }
>
> @@ -79,7 +95,6 @@ static void msm_atomic_async_commit(struct msm_kms *kms, int crtc_idx)
>          */
>         trace_msm_atomic_flush_commit(crtc_mask);
>         kms->funcs->flush_commit(kms, crtc_mask);
> -       mutex_unlock(&kms->commit_lock);
>
>         /*
>          * Wait for flush to complete:
> @@ -90,9 +105,8 @@ static void msm_atomic_async_commit(struct msm_kms *kms, int crtc_idx)
>
>         vblank_put(kms, crtc_mask);
>
> -       mutex_lock(&kms->commit_lock);
>         kms->funcs->complete_commit(kms, crtc_mask);
> -       mutex_unlock(&kms->commit_lock);
> +       msm_commit_unlock(kms, crtc_mask);
>         kms->funcs->disable_commit(kms);
>
>  out:
> @@ -189,12 +203,11 @@ void msm_atomic_commit_tail(struct drm_atomic_state *state)
>          * Ensure any previous (potentially async) commit has
>          * completed:
>          */
> +       msm_commit_lock(kms, crtc_mask);
>         trace_msm_atomic_wait_flush_start(crtc_mask);
>         kms->funcs->wait_flush(kms, crtc_mask);
>         trace_msm_atomic_wait_flush_finish(crtc_mask);
>
> -       mutex_lock(&kms->commit_lock);
> -
>         /*
>          * Now that there is no in-progress flush, prepare the
>          * current update:
> @@ -232,7 +245,7 @@ void msm_atomic_commit_tail(struct drm_atomic_state *state)
>                 }
>
>                 kms->funcs->disable_commit(kms);
> -               mutex_unlock(&kms->commit_lock);
> +               msm_commit_unlock(kms, crtc_mask);
>
>                 /*
>                  * At this point, from drm core's perspective, we
> @@ -260,7 +273,7 @@ void msm_atomic_commit_tail(struct drm_atomic_state *state)
>          */
>         trace_msm_atomic_flush_commit(crtc_mask);
>         kms->funcs->flush_commit(kms, crtc_mask);
> -       mutex_unlock(&kms->commit_lock);
> +       msm_commit_unlock(kms, crtc_mask);
>
>         /*
>          * Wait for flush to complete:
> @@ -271,9 +284,9 @@ void msm_atomic_commit_tail(struct drm_atomic_state *state)
>
>         vblank_put(kms, crtc_mask);
>
> -       mutex_lock(&kms->commit_lock);
> +       msm_commit_lock(kms, crtc_mask);
>         kms->funcs->complete_commit(kms, crtc_mask);
> -       mutex_unlock(&kms->commit_lock);
> +       msm_commit_unlock(kms, crtc_mask);
>         kms->funcs->disable_commit(kms);
>
>         drm_atomic_helper_commit_hw_done(state);
> diff --git a/drivers/gpu/drm/msm/msm_kms.h b/drivers/gpu/drm/msm/msm_kms.h
> index 1cbef6b..f02e73e 100644
> --- a/drivers/gpu/drm/msm/msm_kms.h
> +++ b/drivers/gpu/drm/msm/msm_kms.h
> @@ -126,6 +126,11 @@ struct msm_kms_funcs {
>         /* debugfs: */
>         int (*debugfs_init)(struct msm_kms *kms, struct drm_minor *minor);
>  #endif
> +       /* commit lock for crtc */
> +       void (*commit_lock)(struct msm_kms *kms, unsigned int crtc_mask);
> +
> +       /* commit unlock for crtc */
> +       void (*commit_unlock)(struct msm_kms *kms, unsigned int crtc_mask);
>  };
>
>  struct msm_kms;
> --
> 2.7.4
>
