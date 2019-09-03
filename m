Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 52C8AA75A4
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Sep 2019 22:51:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726946AbfICUvv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 3 Sep 2019 16:51:51 -0400
Received: from mail-yb1-f194.google.com ([209.85.219.194]:40091 "EHLO
        mail-yb1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726440AbfICUvv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 3 Sep 2019 16:51:51 -0400
Received: by mail-yb1-f194.google.com with SMTP id t15so6460154ybg.7
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Sep 2019 13:51:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=poorly.run; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=gSUCY4B834Nphwg0sEbybkFY2gK57eyiLujfDDe3NRc=;
        b=Dp8c4eEWXPP2wgh2cjpwnB/3s/hzJnMzziyBdoEoAiNGrRnbHs/EGtQH27I1xYS1BW
         Ii/LYnaWNJZGfAV2ZTBx/zRkYsN/Fs2LlfSER9zllXudk11H1UxdySVCX3amr5FSgWta
         eoM7P8RAZuP4Yn4PIqjuQ+WgVWCESFcWx9020OXDAUopEkGW6PEtK3kf6U6kxSZL7U1U
         w3XE+FhltLVTuYnSfYhc+2NWAp2naUBL3MEHgFhf7VWDzDR+QZWjHqfpKsKqjwaRpA8O
         7lq6wOuqQNozBfVVmwiiOgl6sSn/sPIo1FMtStGWNqVTzsPmKe2v52sqfKZ0VJAUemni
         tREw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=gSUCY4B834Nphwg0sEbybkFY2gK57eyiLujfDDe3NRc=;
        b=lEn7bs+tA+Btmn3f/PVvSC7sYRalLUUxeROCi0rYjLsWyQ3bgeSyhZyNLvAAGz7c2V
         vzdrrwSUrswERTdkjkbbfLlUO3oN4JH05GDoO8pA3JMJy5KmnVcHb3/GWyPK96ixCUER
         3fR1GWur6hfFr71uK+ECpdWahnROd3JiWH2ApCqRvBtnkHpUe7GK2fxT3j2F5jdXElrZ
         S2JF4N7DaQGBWZqLRFO7261yOYBBpZQ3XjCU4W1qStn2IyqPWF9LlURvpM+1AMobiYda
         Fa5K7I5uVGwK5XnVB8OUigtmvEc7TbYGLAklMkthwrviRlunaYuBCMznSTQ/4qvYgN1t
         SbHw==
X-Gm-Message-State: APjAAAX6/YJSZKWX3pVqoce7qpXRFYziuL8kgRVzcX/WU4GGFXUcUjRx
        8yPGCvRNEvhIC7zyhmfAeIxgBw==
X-Google-Smtp-Source: APXvYqw6JUU1m40BfrgrovCUfw7eKPuuHGWqGQTWACdSedLCO0OQS4AtOrn6dhIzvBLDUX6VcR4znQ==
X-Received: by 2002:a25:aa30:: with SMTP id s45mr24064656ybi.64.1567543910054;
        Tue, 03 Sep 2019 13:51:50 -0700 (PDT)
Received: from localhost ([2620:0:1013:11:89c6:2139:5435:371d])
        by smtp.gmail.com with ESMTPSA id v193sm1656569ywv.12.2019.09.03.13.51.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Sep 2019 13:51:49 -0700 (PDT)
Date:   Tue, 3 Sep 2019 16:51:49 -0400
From:   Sean Paul <sean@poorly.run>
To:     Rob Clark <robdclark@gmail.com>
Cc:     dri-devel@lists.freedesktop.org,
        Rob Clark <robdclark@chromium.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <linux-arm-msm@vger.kernel.org>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <freedreno@lists.freedesktop.org>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 08/10] drm/msm: async commit support
Message-ID: <20190903205149.GM218215@art_vandelay>
References: <20190829164601.11615-1-robdclark@gmail.com>
 <20190829164601.11615-9-robdclark@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190829164601.11615-9-robdclark@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Aug 29, 2019 at 09:45:16AM -0700, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> Now that flush/wait/complete is decoupled from the "synchronous" part of
> atomic commit_tail(), add support to defer flush to a timer that expires
> shortly before vblank for async commits.  In this way, multiple atomic
> commits (for example, cursor updates) can be coalesced into a single
> flush at the end of the frame.
> 
> v2: don't hold lock over ->wait_flush(), to avoid locking interaction
>     that was causing fps drop when combining page flips or non-async
>     atomic commits and lots of legacy cursor updates
> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>

Some nits, with them addressed,

Reviewed-by: Sean Paul <sean@poorly.run>


> ---
>  drivers/gpu/drm/msm/msm_atomic.c | 156 ++++++++++++++++++++++++++++++-
>  drivers/gpu/drm/msm/msm_drv.c    |   1 +
>  drivers/gpu/drm/msm/msm_drv.h    |   4 +
>  drivers/gpu/drm/msm/msm_kms.h    |  50 ++++++++++
>  4 files changed, 210 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/msm_atomic.c b/drivers/gpu/drm/msm/msm_atomic.c
> index 614fb9c5bb58..8f8f74337cb4 100644
> --- a/drivers/gpu/drm/msm/msm_atomic.c
> +++ b/drivers/gpu/drm/msm/msm_atomic.c
> @@ -29,6 +29,95 @@ int msm_atomic_prepare_fb(struct drm_plane *plane,
>  	return msm_framebuffer_prepare(new_state->fb, kms->aspace);
>  }
>  
> +static void msm_atomic_async_commit(struct msm_kms *kms, int crtc_idx)
> +{
> +	unsigned crtc_mask = BIT(crtc_idx);
> +
> +	mutex_lock(&kms->commit_lock);
> +
> +	if (!(kms->pending_crtc_mask & crtc_mask)) {
> +		mutex_unlock(&kms->commit_lock);
> +		return;
> +	}
> +
> +	kms->pending_crtc_mask &= ~crtc_mask;
> +
> +	kms->funcs->enable_commit(kms);
> +
> +	/*
> +	 * Flush hardware updates:
> +	 */
> +	DRM_DEBUG_ATOMIC("triggering async commit\n");
> +	kms->funcs->flush_commit(kms, crtc_mask);
> +	mutex_unlock(&kms->commit_lock);
> +
> +	/*
> +	 * Wait for flush to complete:
> +	 */
> +	kms->funcs->wait_flush(kms, crtc_mask);
> +
> +	mutex_lock(&kms->commit_lock);
> +	kms->funcs->complete_commit(kms, crtc_mask);
> +	mutex_unlock(&kms->commit_lock);
> +	kms->funcs->disable_commit(kms);
> +}
> +
> +static enum hrtimer_restart msm_atomic_pending_timer(struct hrtimer *t)
> +{
> +	struct msm_pending_timer *timer = container_of(t,
> +			struct msm_pending_timer, timer);
> +	struct msm_drm_private *priv = timer->kms->dev->dev_private;
> +

As discussed on IRC, a TODO here explaining that we'd like to remove this worker eventually but there are mutexes further down that need to be removed.

> +	queue_work(priv->wq, &timer->work);
> +
> +	return HRTIMER_NORESTART;
> +}
> +
> +static void msm_atomic_pending_work(struct work_struct *work)
> +{
> +	struct msm_pending_timer *timer = container_of(work,
> +			struct msm_pending_timer, work);
> +
> +	msm_atomic_async_commit(timer->kms, timer->crtc_idx);
> +}
> +
> +void msm_atomic_init_pending_timer(struct msm_pending_timer *timer,
> +		struct msm_kms *kms, int crtc_idx)
> +{
> +	timer->kms = kms;
> +	timer->crtc_idx = crtc_idx;
> +	hrtimer_init(&timer->timer, CLOCK_MONOTONIC, HRTIMER_MODE_ABS);
> +	timer->timer.function = msm_atomic_pending_timer;
> +	INIT_WORK(&timer->work, msm_atomic_pending_work);
> +}
> +
> +static bool can_do_async(struct drm_atomic_state *state,
> +		struct drm_crtc **async_crtc)
> +{
> +	struct drm_connector_state *connector_state;
> +	struct drm_connector *connector;
> +	struct drm_crtc_state *crtc_state;
> +	struct drm_crtc *crtc;
> +	int i, num_crtcs = 0;
> +
> +	if (!(state->legacy_cursor_update || state->async_update))
> +		return false;
> +
> +	/* any connector change, means slow path: */
> +	for_each_new_connector_in_state(state, connector, connector_state, i)
> +		return false;
> +
> +	for_each_new_crtc_in_state(state, crtc, crtc_state, i) {
> +		if (drm_atomic_crtc_needs_modeset(crtc_state))
> +			return false;
> +		if (++num_crtcs > 1)
> +			return false;
> +		*async_crtc = crtc;
> +	}
> +
> +	return true;
> +}
> +
>  /* Get bitmask of crtcs that will need to be flushed.  The bitmask
>   * can be used with for_each_crtc_mask() iterator, to iterate
>   * effected crtcs without needing to preserve the atomic state.
> @@ -50,9 +139,25 @@ void msm_atomic_commit_tail(struct drm_atomic_state *state)
>  	struct drm_device *dev = state->dev;
>  	struct msm_drm_private *priv = dev->dev_private;
>  	struct msm_kms *kms = priv->kms;
> +	struct drm_crtc *async_crtc = NULL;
>  	unsigned crtc_mask = get_crtc_mask(state);
> +	bool async = kms->funcs->vsync_time &&
> +			can_do_async(state, &async_crtc);
>  
>  	kms->funcs->enable_commit(kms);
> +
> +	/*
> +	 * Ensure any previous (potentially async) commit has
> +	 * completed:
> +	 */
> +	kms->funcs->wait_flush(kms, crtc_mask);
> +
> +	mutex_lock(&kms->commit_lock);
> +
> +	/*
> +	 * Now that there is no in-progress flush is complete,

s/is complete//

> +	 * prepare the current update:
> +	 */
>  	kms->funcs->prepare_commit(kms, state);
>  
>  	/*
> @@ -62,6 +167,49 @@ void msm_atomic_commit_tail(struct drm_atomic_state *state)
>  	drm_atomic_helper_commit_planes(dev, state, 0);
>  	drm_atomic_helper_commit_modeset_enables(dev, state);
>  
> +	if (async) {
> +		struct msm_pending_timer *timer =
> +			&kms->pending_timers[drm_crtc_index(async_crtc)];
> +
> +		/* async updates are limited to single-crtc updates: */
> +		WARN_ON(crtc_mask != drm_crtc_mask(async_crtc));

Put this in can_do_async()?

> +
> +		/*
> +		 * Start timer if we don't already have an update pending
> +		 * on this crtc:
> +		 */
> +		if (!(kms->pending_crtc_mask & crtc_mask)) {
> +			ktime_t vsync_time, wakeup_time;
> +
> +			kms->pending_crtc_mask |= crtc_mask;
> +
> +			vsync_time = kms->funcs->vsync_time(kms, async_crtc);
> +			wakeup_time = ktime_sub(vsync_time, ms_to_ktime(1));
> +
> +			hrtimer_start(&timer->timer, wakeup_time,
> +					HRTIMER_MODE_ABS);
> +		}
> +
> +		kms->funcs->disable_commit(kms);

enable and disable are pretty loaded. How about begin/end instead?

> +		mutex_unlock(&kms->commit_lock);
> +
> +		/*
> +		 * At this point, from drm core's perspective, we
> +		 * are done with the atomic update, so we can just
> +		 * go ahead and signal that it is done:
> +		 */
> +		drm_atomic_helper_commit_hw_done(state);
> +		drm_atomic_helper_cleanup_planes(dev, state);
> +
> +		return;
> +	}
> +
> +	/*
> +	 * If there is any async flush pending on updated crtcs, fold
> +	 * them into the current flush.
> +	 */
> +	kms->pending_crtc_mask &= ~crtc_mask;
> +
>  	/*
>  	 * Flush hardware updates:
>  	 */
> @@ -70,12 +218,18 @@ void msm_atomic_commit_tail(struct drm_atomic_state *state)
>  		kms->funcs->commit(kms, state);
>  	}
>  	kms->funcs->flush_commit(kms, crtc_mask);
> +	mutex_unlock(&kms->commit_lock);
>  
> +	/*
> +	 * Wait for flush to complete:
> +	 */
>  	kms->funcs->wait_flush(kms, crtc_mask);
> +
> +	mutex_lock(&kms->commit_lock);
>  	kms->funcs->complete_commit(kms, crtc_mask);
> +	mutex_unlock(&kms->commit_lock);
>  	kms->funcs->disable_commit(kms);
>  
>  	drm_atomic_helper_commit_hw_done(state);
> -
>  	drm_atomic_helper_cleanup_planes(dev, state);
>  }
> diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
> index 336a6d0a4cd3..65262a993440 100644
> --- a/drivers/gpu/drm/msm/msm_drv.c
> +++ b/drivers/gpu/drm/msm/msm_drv.c
> @@ -532,6 +532,7 @@ static int msm_drm_init(struct device *dev, struct drm_driver *drv)
>  	ddev->mode_config.normalize_zpos = true;
>  
>  	if (kms) {
> +		kms->dev = ddev;
>  		ret = kms->funcs->hw_init(kms);
>  		if (ret) {
>  			DRM_DEV_ERROR(dev, "kms hw init failed: %d\n", ret);
> diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
> index 79d480a7d97d..7d164d5c18b4 100644
> --- a/drivers/gpu/drm/msm/msm_drv.h
> +++ b/drivers/gpu/drm/msm/msm_drv.h
> @@ -222,8 +222,12 @@ struct msm_format {
>  	uint32_t pixel_format;
>  };
>  
> +struct msm_pending_timer;
> +
>  int msm_atomic_prepare_fb(struct drm_plane *plane,
>  			  struct drm_plane_state *new_state);
> +void msm_atomic_init_pending_timer(struct msm_pending_timer *timer,
> +		struct msm_kms *kms, int crtc_idx);
>  void msm_atomic_commit_tail(struct drm_atomic_state *state);
>  struct drm_atomic_state *msm_atomic_state_alloc(struct drm_device *dev);
>  void msm_atomic_state_clear(struct drm_atomic_state *state);
> diff --git a/drivers/gpu/drm/msm/msm_kms.h b/drivers/gpu/drm/msm/msm_kms.h
> index 811f5e2c2405..5eafc9686d29 100644
> --- a/drivers/gpu/drm/msm/msm_kms.h
> +++ b/drivers/gpu/drm/msm/msm_kms.h
> @@ -33,6 +33,20 @@ struct msm_kms_funcs {
>  
>  	/*
>  	 * Atomic commit handling:
> +	 *
> +	 * Note that in the case of async commits, the funcs which take
> +	 * a crtc_mask (ie. ->flush_commit(), and ->complete_commit())
> +	 * might not be evenly balanced with ->prepare_commit(), however
> +	 * each crtc that effected by a ->perpare_commit() (potentially

s/perpare/prepare/

> +	 * multiple times) will eventually (at end of vsync period) be
> +	 * flushed and completed.
> +	 *
> +	 * This has some implications about tracking of cleanup state,
> +	 * for example SMP blocks to release after commit completes.  Ie.
> +	 * cleanup state should be also duplicated in the various
> +	 * duplicate_state() methods, as the current cleanup state at
> +	 * ->complete_commit() time may have accumulated cleanup work
> +	 * from multiple commits.
>  	 */
>  
>  	/**
> @@ -45,6 +59,14 @@ struct msm_kms_funcs {
>  	void (*enable_commit)(struct msm_kms *kms);
>  	void (*disable_commit)(struct msm_kms *kms);
>  
> +	/**
> +	 * If the kms backend supports async commit, it should implement
> +	 * this method to return the time of the next vsync.  This is
> +	 * used to determine a time slightly before vsync, for the async
> +	 * commit timer to run and complete an async commit.
> +	 */
> +	ktime_t (*vsync_time)(struct msm_kms *kms, struct drm_crtc *crtc);
> +
>  	/**
>  	 * Prepare for atomic commit.  This is called after any previous
>  	 * (async or otherwise) commit has completed.
> @@ -109,20 +131,48 @@ struct msm_kms_funcs {
>  #endif
>  };
>  
> +struct msm_kms;
> +
> +/*
> + * A per-crtc timer for pending async atomic flushes.  Scheduled to expire
> + * shortly before vblank to flush pending async updates.
> + */
> +struct msm_pending_timer {
> +	struct hrtimer timer;
> +	struct work_struct work;
> +	struct msm_kms *kms;
> +	unsigned crtc_idx;
> +};
> +
>  struct msm_kms {
>  	const struct msm_kms_funcs *funcs;
> +	struct drm_device *dev;
>  
>  	/* irq number to be passed on to drm_irq_install */
>  	int irq;
>  
>  	/* mapper-id used to request GEM buffer mapped for scanout: */
>  	struct msm_gem_address_space *aspace;
> +
> +	/*
> +	 * For async commit, where ->flush_commit() and later happens
> +	 * from the crtc's pending_timer close to end of the frame:
> +	 */
> +	struct mutex commit_lock;
> +	unsigned pending_crtc_mask;
> +	struct msm_pending_timer pending_timers[MAX_CRTCS];
>  };
>  
>  static inline void msm_kms_init(struct msm_kms *kms,
>  		const struct msm_kms_funcs *funcs)
>  {
> +	unsigned i;
> +
> +	mutex_init(&kms->commit_lock);
>  	kms->funcs = funcs;
> +
> +	for (i = 0; i < ARRAY_SIZE(kms->pending_timers); i++)
> +		msm_atomic_init_pending_timer(&kms->pending_timers[i], kms, i);
>  }
>  
>  struct msm_kms *mdp4_kms_init(struct drm_device *dev);
> -- 
> 2.21.0
> 

-- 
Sean Paul, Software Engineer, Google / Chromium OS
