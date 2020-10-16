Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 90E82290805
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Oct 2020 17:13:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2409823AbgJPPNh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 16 Oct 2020 11:13:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32936 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2409810AbgJPPNg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 16 Oct 2020 11:13:36 -0400
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5401AC061755;
        Fri, 16 Oct 2020 08:13:36 -0700 (PDT)
Received: by mail-wm1-x341.google.com with SMTP id e2so3355324wme.1;
        Fri, 16 Oct 2020 08:13:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=4caXpkclqb0kte1ui2rZGOT3gO9tw5QkWF6WaM5340U=;
        b=bw0C7RL0+fhKMO0EAe8XGEcHwb8wyybaCpfl8P7sGnfdkZI9j4tysI6uZ0YoR29/ha
         YOX4aILlakJ066q+xevlet5l+Z+N9q/nV7+KQ/NKKo3PoqCwvkqKc4MR4ryRAmfVyqTJ
         uz9QwYlBWj2ZUFkyZ/iB50AZoKJOmHEFk3aQyW2Q+ljkXeftI1rA7efNHa+FZThIiT4K
         wnmZSuOqxrB01w27tBcLSH/JQmZ6evhSO/vqsZliSKtLWCHF4Bm+V6PvS55UoVIl4rIy
         DKgs589sQo9GoZg5GOugVRSrxKtqGwZuZqZxIpdhnOn/1/ZjONqYyoPkPZqi0JtPd9tA
         H/bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4caXpkclqb0kte1ui2rZGOT3gO9tw5QkWF6WaM5340U=;
        b=URbglXgCr8xtVv0EEkKQ0fcCFjJHrE24DHS/T3tmMgzSK6jhpfEH1K4+KvUlmynPC6
         WlV7eG3ZxdDaiA0+Ail4WK41i2OliIHKpd5P1zpNZQh01pbgnZCX7g+U/78QBhHWZaHV
         PW3exzLKDJgcGxdOuw7NojZyyMDGBECKAbfYGtEm29Ki5lWu1Y7n+Ss42TQ6MTY2p11G
         Wibe0Xf1+aR555EIfMQNrNt0QbAu8gUgCbPuOUg49+/sJEHOrbrrcuV1n2IOInt592r4
         uD8CRJu9RJU3WfMEFG5iyhlFYMe2FtzdZ7Xorv3jLwIQwvxYeXnofJ7kgRF/6frt/lR8
         tF3w==
X-Gm-Message-State: AOAM5315qmZa+Nx4ZGrLD0ZPM38bRZBjAat2Qh2diZJ9f46x5OpOjXiV
        FHZNwVwhHI83Vz0+8dZsBRrP39eptYnsKe6MzYDIQPxKUWs=
X-Google-Smtp-Source: ABdhPJzr3VYyUdzLIDtBlIsdA+pEKl3QsosK5nMd+7onCOzT6+6p6L4hMZjIv11pJzsNcjZWS7NXyiKQkqyJvnToGuo=
X-Received: by 2002:a05:600c:2241:: with SMTP id a1mr4437272wmm.49.1602861212981;
 Fri, 16 Oct 2020 08:13:32 -0700 (PDT)
MIME-Version: 1.0
References: <1602857443-27317-1-git-send-email-mkrishn@codeaurora.org>
In-Reply-To: <1602857443-27317-1-git-send-email-mkrishn@codeaurora.org>
From:   Rob Clark <robdclark@gmail.com>
Date:   Fri, 16 Oct 2020 08:13:18 -0700
Message-ID: <CAF6AEGuc967Ooq+YJSej5nmyD9pqAYkN83odieOJ=4fRsdwdeA@mail.gmail.com>
Subject: Re: [v3] drm/msm: Fix race condition in msm driver with async layer updates
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

On Fri, Oct 16, 2020 at 7:11 AM Krishna Manikandan
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
> Changes in v2:
>         - Use an array of mutexes in kms to handle commit
>           lock per crtc. (Rob Clark)
>
> Changes in v3:
>         - Add wrapper functions to handle lock and unlock of
>           commit_lock for each crtc. (Rob Clark)
>
> Signed-off-by: Krishna Manikandan <mkrishn@codeaurora.org>

Reviewed-by: Rob Clark <robdclark@gmail.com>

> ---
>  drivers/gpu/drm/msm/msm_atomic.c | 37 ++++++++++++++++++++++++-------------
>  drivers/gpu/drm/msm/msm_kms.h    |  6 ++++--
>  2 files changed, 28 insertions(+), 15 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/msm_atomic.c b/drivers/gpu/drm/msm/msm_atomic.c
> index 561bfa4..575e9af 100644
> --- a/drivers/gpu/drm/msm/msm_atomic.c
> +++ b/drivers/gpu/drm/msm/msm_atomic.c
> @@ -55,16 +55,32 @@ static void vblank_put(struct msm_kms *kms, unsigned crtc_mask)
>         }
>  }
>
> +static void lock_crtcs(struct msm_kms *kms, unsigned int crtc_mask)
> +{
> +       struct drm_crtc *crtc;
> +
> +       for_each_crtc_mask(kms->dev, crtc, crtc_mask)
> +               mutex_lock(&kms->commit_lock[drm_crtc_index(crtc)]);
> +}
> +
> +static void unlock_crtcs(struct msm_kms *kms, unsigned int crtc_mask)
> +{
> +       struct drm_crtc *crtc;
> +
> +       for_each_crtc_mask(kms->dev, crtc, crtc_mask)
> +               mutex_unlock(&kms->commit_lock[drm_crtc_index(crtc)]);
> +}
> +
>  static void msm_atomic_async_commit(struct msm_kms *kms, int crtc_idx)
>  {
>         unsigned crtc_mask = BIT(crtc_idx);
>
>         trace_msm_atomic_async_commit_start(crtc_mask);
>
> -       mutex_lock(&kms->commit_lock);
> +       lock_crtcs(kms, crtc_mask);
>
>         if (!(kms->pending_crtc_mask & crtc_mask)) {
> -               mutex_unlock(&kms->commit_lock);
> +               unlock_crtcs(kms, crtc_mask);
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
> +       unlock_crtcs(kms, crtc_mask);
>         kms->funcs->disable_commit(kms);
>
>  out:
> @@ -189,12 +203,11 @@ void msm_atomic_commit_tail(struct drm_atomic_state *state)
>          * Ensure any previous (potentially async) commit has
>          * completed:
>          */
> +       lock_crtcs(kms, crtc_mask);
>         trace_msm_atomic_wait_flush_start(crtc_mask);
>         kms->funcs->wait_flush(kms, crtc_mask);
>         trace_msm_atomic_wait_flush_finish(crtc_mask);
>
> -       mutex_lock(&kms->commit_lock);
> -
>         /*
>          * Now that there is no in-progress flush, prepare the
>          * current update:
> @@ -232,8 +245,7 @@ void msm_atomic_commit_tail(struct drm_atomic_state *state)
>                 }
>
>                 kms->funcs->disable_commit(kms);
> -               mutex_unlock(&kms->commit_lock);
> -
> +               unlock_crtcs(kms, crtc_mask);
>                 /*
>                  * At this point, from drm core's perspective, we
>                  * are done with the atomic update, so we can just
> @@ -260,8 +272,7 @@ void msm_atomic_commit_tail(struct drm_atomic_state *state)
>          */
>         trace_msm_atomic_flush_commit(crtc_mask);
>         kms->funcs->flush_commit(kms, crtc_mask);
> -       mutex_unlock(&kms->commit_lock);
> -
> +       unlock_crtcs(kms, crtc_mask);
>         /*
>          * Wait for flush to complete:
>          */
> @@ -271,9 +282,9 @@ void msm_atomic_commit_tail(struct drm_atomic_state *state)
>
>         vblank_put(kms, crtc_mask);
>
> -       mutex_lock(&kms->commit_lock);
> +       lock_crtcs(kms, crtc_mask);
>         kms->funcs->complete_commit(kms, crtc_mask);
> -       mutex_unlock(&kms->commit_lock);
> +       unlock_crtcs(kms, crtc_mask);
>         kms->funcs->disable_commit(kms);
>
>         drm_atomic_helper_commit_hw_done(state);
> diff --git a/drivers/gpu/drm/msm/msm_kms.h b/drivers/gpu/drm/msm/msm_kms.h
> index 1cbef6b..2049847 100644
> --- a/drivers/gpu/drm/msm/msm_kms.h
> +++ b/drivers/gpu/drm/msm/msm_kms.h
> @@ -155,7 +155,7 @@ struct msm_kms {
>          * For async commit, where ->flush_commit() and later happens
>          * from the crtc's pending_timer close to end of the frame:
>          */
> -       struct mutex commit_lock;
> +       struct mutex commit_lock[MAX_CRTCS];
>         unsigned pending_crtc_mask;
>         struct msm_pending_timer pending_timers[MAX_CRTCS];
>  };
> @@ -165,7 +165,9 @@ static inline void msm_kms_init(struct msm_kms *kms,
>  {
>         unsigned i;
>
> -       mutex_init(&kms->commit_lock);
> +       for (i = 0; i < ARRAY_SIZE(kms->commit_lock); i++)
> +               mutex_init(&kms->commit_lock[i]);
> +
>         kms->funcs = funcs;
>
>         for (i = 0; i < ARRAY_SIZE(kms->pending_timers); i++)
> --
> 2.7.4
>
