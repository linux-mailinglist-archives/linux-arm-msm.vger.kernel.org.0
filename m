Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E4B2428F5A7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Oct 2020 17:15:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388364AbgJOPPp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 15 Oct 2020 11:15:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36226 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388086AbgJOPPo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 15 Oct 2020 11:15:44 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C617C061755;
        Thu, 15 Oct 2020 08:15:44 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id s9so3942173wro.8;
        Thu, 15 Oct 2020 08:15:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=YIFgqJIvZsmeRtV2K8O58xOmfJpO6lYc6Fjxru8DXiQ=;
        b=QA9VcerBtrSSn6LTddkzx9rBBCDBJKMc2M0PPRxQHXiKZCxSAQkBWJEqzG88aphHwM
         NtBu9H6p+rIKe9PD/BEaH+l6XNAxeIYSok097kDm6TyYV5VQJdG7952JMcMVUiLHZI5z
         ODvDZoxdgxNNXH3QifA8fiVI8FmKLj/PIkGC1dHJxdegwrmB1y6GCqHKCeylY75PJ1uy
         OeHHdOuwfxCQ0oSVYDuwqDpXnT+RJX7fgV3SBhM9zZ98ERS8h8UBRVBCftEqEz9KhQQE
         +HI7TrHs4Oxci154R/+CSBwdagvYShJ+/hoXjMwOmSBV0sAaSxXM9JxukAQT/MLS+zrk
         rS/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=YIFgqJIvZsmeRtV2K8O58xOmfJpO6lYc6Fjxru8DXiQ=;
        b=O/1XSYronihjWHAlPT/cMZnL5i/ZdbQlZiNAop67GrxdL71xtUpZyk8aL+oS6Ybe0x
         WDiqdhBksJNtRuygJPpvO5q441fRlVapfkhYaO8WEfgfkFoTKRVF9tb4MyUducV3P7eN
         qkiZdMPTswcCTP2VNIMnW3HxQB2NTMzhBOTU74JItpGhz4qoPaTychpvYP6lFkQDogGl
         tWEWUOphjmFgeVsK2W4KFIaMaqZ3a9whNv3wQBKVDitczkXFyfkkv6tae4S6hNy0Cc+x
         Y+sfSZ0Oae73m7Z7ArU5Bg3PnZBWyvhpiYsDwgmDVa1lDoMoKehlGGF76j/gwRnX76dT
         Rt1A==
X-Gm-Message-State: AOAM532C48IvfVOYqCzP3er2swINp+2WVI7I4GZDKqaSDCWy8ff2lQ/F
        RoxJ8iVruxAFMCg17NbVf11IMBK265CLjv+vklg=
X-Google-Smtp-Source: ABdhPJzv0seZ4eeR8XIu7L9Q2J9C311t2z/alrYlN6Fe40zEkxrgTiVhUDea3rZfQ40QX3nJQ7eybie9w2iqnT+oIuE=
X-Received: by 2002:adf:bc0f:: with SMTP id s15mr4965982wrg.83.1602774943141;
 Thu, 15 Oct 2020 08:15:43 -0700 (PDT)
MIME-Version: 1.0
References: <1602753310-22105-1-git-send-email-mkrishn@codeaurora.org>
In-Reply-To: <1602753310-22105-1-git-send-email-mkrishn@codeaurora.org>
From:   Rob Clark <robdclark@gmail.com>
Date:   Thu, 15 Oct 2020 08:15:31 -0700
Message-ID: <CAF6AEGva6tqc3v5J62LhdZsb8mqKZ+NXFmaL-HwF355uct2d7g@mail.gmail.com>
Subject: Re: [v2] drm/msm: Fix race condition in msm driver with async layer updates
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

On Thu, Oct 15, 2020 at 2:15 AM Krishna Manikandan
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
> Signed-off-by: Krishna Manikandan <mkrishn@codeaurora.org>
> ---
>  drivers/gpu/drm/msm/msm_atomic.c | 32 +++++++++++++++++++-------------
>  drivers/gpu/drm/msm/msm_kms.h    |  6 ++++--
>  2 files changed, 23 insertions(+), 15 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/msm_atomic.c b/drivers/gpu/drm/msm/msm_atomic.c
> index 561bfa4..f9bd472 100644
> --- a/drivers/gpu/drm/msm/msm_atomic.c
> +++ b/drivers/gpu/drm/msm/msm_atomic.c
> @@ -61,10 +61,10 @@ static void msm_atomic_async_commit(struct msm_kms *kms, int crtc_idx)
>
>         trace_msm_atomic_async_commit_start(crtc_mask);
>
> -       mutex_lock(&kms->commit_lock);
> +       mutex_lock(&kms->commit_lock[crtc_idx]);
>
>         if (!(kms->pending_crtc_mask & crtc_mask)) {
> -               mutex_unlock(&kms->commit_lock);
> +               mutex_unlock(&kms->commit_lock[crtc_idx]);
>                 goto out;
>         }
>
> @@ -79,7 +79,6 @@ static void msm_atomic_async_commit(struct msm_kms *kms, int crtc_idx)
>          */
>         trace_msm_atomic_flush_commit(crtc_mask);
>         kms->funcs->flush_commit(kms, crtc_mask);
> -       mutex_unlock(&kms->commit_lock);
>
>         /*
>          * Wait for flush to complete:
> @@ -90,9 +89,8 @@ static void msm_atomic_async_commit(struct msm_kms *kms, int crtc_idx)
>
>         vblank_put(kms, crtc_mask);
>
> -       mutex_lock(&kms->commit_lock);
>         kms->funcs->complete_commit(kms, crtc_mask);
> -       mutex_unlock(&kms->commit_lock);
> +       mutex_unlock(&kms->commit_lock[crtc_idx]);
>         kms->funcs->disable_commit(kms);
>
>  out:
> @@ -171,6 +169,16 @@ static unsigned get_crtc_mask(struct drm_atomic_state *state)
>         return mask;
>  }
>
> +static int get_crtc_id(struct msm_kms *kms, unsigned int crtc_mask)
> +{
> +       struct drm_crtc *crtc;
> +
> +       for_each_crtc_mask(kms->dev, crtc, crtc_mask)
> +               return drm_crtc_index(crtc);
> +
> +       return 0;
> +}

this is closer, but a commit could still touch multiple CRTCs, I think
what you should do is add a lock/unlock helper, similar to
vblank_get/put(), ie:

static void lock_crtcs(struct msm_kms *kms, unsigned crtc_mask)
{
  struct drm_crtc *crtc;

  for_each_crtc_mask(kms->dev, crtc, crtc_mask)
    mutex_lock(&kms->commit_lock[drm_crtc_index(crtc)]);
}

and use that everywhere

(Technically we only go down the async path if there is only a single
crtc, but no reason not to use the lock/unlock helpers in both cases)

BR,
-R

> +
>  void msm_atomic_commit_tail(struct drm_atomic_state *state)
>  {
>         struct drm_device *dev = state->dev;
> @@ -180,6 +188,7 @@ void msm_atomic_commit_tail(struct drm_atomic_state *state)
>         unsigned crtc_mask = get_crtc_mask(state);
>         bool async = kms->funcs->vsync_time &&
>                         can_do_async(state, &async_crtc);
> +       int crtc_idx = get_crtc_id(kms, crtc_mask);
>
>         trace_msm_atomic_commit_tail_start(async, crtc_mask);
>
> @@ -189,12 +198,11 @@ void msm_atomic_commit_tail(struct drm_atomic_state *state)
>          * Ensure any previous (potentially async) commit has
>          * completed:
>          */
> +       mutex_lock(&kms->commit_lock[crtc_idx]);
>         trace_msm_atomic_wait_flush_start(crtc_mask);
>         kms->funcs->wait_flush(kms, crtc_mask);
>         trace_msm_atomic_wait_flush_finish(crtc_mask);
>
> -       mutex_lock(&kms->commit_lock);
> -
>         /*
>          * Now that there is no in-progress flush, prepare the
>          * current update:
> @@ -232,8 +240,7 @@ void msm_atomic_commit_tail(struct drm_atomic_state *state)
>                 }
>
>                 kms->funcs->disable_commit(kms);
> -               mutex_unlock(&kms->commit_lock);
> -
> +               mutex_unlock(&kms->commit_lock[crtc_idx]);
>                 /*
>                  * At this point, from drm core's perspective, we
>                  * are done with the atomic update, so we can just
> @@ -260,8 +267,7 @@ void msm_atomic_commit_tail(struct drm_atomic_state *state)
>          */
>         trace_msm_atomic_flush_commit(crtc_mask);
>         kms->funcs->flush_commit(kms, crtc_mask);
> -       mutex_unlock(&kms->commit_lock);
> -
> +       mutex_unlock(&kms->commit_lock[crtc_idx]);
>         /*
>          * Wait for flush to complete:
>          */
> @@ -271,9 +277,9 @@ void msm_atomic_commit_tail(struct drm_atomic_state *state)
>
>         vblank_put(kms, crtc_mask);
>
> -       mutex_lock(&kms->commit_lock);
> +       mutex_lock(&kms->commit_lock[crtc_idx]);
>         kms->funcs->complete_commit(kms, crtc_mask);
> -       mutex_unlock(&kms->commit_lock);
> +       mutex_unlock(&kms->commit_lock[crtc_idx]);
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
