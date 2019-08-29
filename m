Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8124DA1AA6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Aug 2019 15:04:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727182AbfH2NEu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 29 Aug 2019 09:04:50 -0400
Received: from mail-yb1-f194.google.com ([209.85.219.194]:37995 "EHLO
        mail-yb1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727176AbfH2NEu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 29 Aug 2019 09:04:50 -0400
Received: by mail-yb1-f194.google.com with SMTP id j199so1153607ybg.5
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Aug 2019 06:04:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=poorly.run; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=tvJNWYMvJA/G6Rdd1ai/v3++cBaw7Tof/WctnqR3Glo=;
        b=AMg6HMnZOOzLQ05y/zHnlpWZX/h5j2mH87Rus3lJ24OeblYgsGwuBFQV6oNnCAXe3E
         UC42t/GPknHbrRiVRuHcVxFKJhGCb+igMOyIqafnxCZ2bIySj4WxrPRsk8CorDsX8uP0
         Yn6rUF1LJvqE7kW0ohJkBqi50HoBMyW+DWr05lkjJ1XrFZ+xhOzgXu0Xe67SxxznydxN
         MsCnNBJo7mediPT/wncqlatjYhAR32Jk7HIyz4vECcOlG3sRkt9oEEQHEmOGdROFaN7Q
         fLQwHT1OQBwvIgCDjEifJJhBeeGEGRULoCrs0FThQjx3OeRI4BwZBd+J8djxuDNGtsEc
         qc7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=tvJNWYMvJA/G6Rdd1ai/v3++cBaw7Tof/WctnqR3Glo=;
        b=tiVtSVbdOn4oUekcq3Gv5eBKkugt035TRLy9sJFBn7BPWquF6f82eFneZFZGSnaYRo
         hxfTfVjhl2g3sJbx45zySydGIY6zxRYByHlDJ5v8QUrUXrPWSzlvlGYBUEmbrz0UFPZR
         EUna2LYmGnJY1dhhz8Bu37vFAuZUROx2p+ZXB/OSMoj1znhJjSLwosKvxz5xYnOikZqv
         0Ub+xrIpxqSg9ekc8ZkU+KwsboZ3+FIDIPvefoI3B0xOX/TmPkwPx3ESkMsP6uHyApeM
         DenS7DoBRgCpnipCEPRXWkLMzsgk/5wIwUzGsyIU85z4mAqCk5gsUcr4HsHF2vyBL+8C
         hDFg==
X-Gm-Message-State: APjAAAXYD2OK1eE+shLAgbN9dqL33Unmhh5GjOIIh2eM8eMibXdcYls0
        u3zZB/PHLMP50F744mfRqoKW1Q==
X-Google-Smtp-Source: APXvYqzBJh1z/VJTjZgdcXKiel+Kpba9/6xd0lkwSBRa5Kz6xahceVpVlaO/ZF0Tw5Y4Y0//jPhI5A==
X-Received: by 2002:a25:9803:: with SMTP id a3mr6723537ybo.27.1567083889248;
        Thu, 29 Aug 2019 06:04:49 -0700 (PDT)
Received: from localhost ([2620:0:1013:11:89c6:2139:5435:371d])
        by smtp.gmail.com with ESMTPSA id e12sm466936ywe.85.2019.08.29.06.04.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2019 06:04:48 -0700 (PDT)
Date:   Thu, 29 Aug 2019 09:04:48 -0400
From:   Sean Paul <sean@poorly.run>
To:     Rob Clark <robdclark@gmail.com>
Cc:     dri-devel@lists.freedesktop.org,
        Rob Clark <robdclark@chromium.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Jeykumar Sankaran <jsanka@codeaurora.org>,
        Bruce Wang <bzwang@chromium.org>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Sravanthi Kollukuduru <skolluku@codeaurora.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        Fritz Koenig <frkoenig@google.com>,
        Alexios Zavras <alexios.zavras@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <linux-arm-msm@vger.kernel.org>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <freedreno@lists.freedesktop.org>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/9] drm/msm/dpu: unwind async commit handling
Message-ID: <20190829130448.GF218215@art_vandelay>
References: <20190827213421.21917-1-robdclark@gmail.com>
 <20190827213421.21917-2-robdclark@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190827213421.21917-2-robdclark@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Aug 27, 2019 at 02:33:31PM -0700, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> It attempted to avoid fps drops in the presence of cursor updates.  But
> it is racing, and can result in hw updates after flush before vblank,
> which leads to underruns.
> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>

Reviewed-by: Sean Paul <sean@poorly.run>

> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c    | 41 ++++++++++-----------
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h    |  3 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 39 +++++++-------------
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h |  3 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c     |  5 +--
>  drivers/gpu/drm/msm/msm_atomic.c            |  3 +-
>  6 files changed, 37 insertions(+), 57 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> index a52439e029c9..c3f7154017c4 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> @@ -610,7 +610,7 @@ static int _dpu_crtc_wait_for_frame_done(struct drm_crtc *crtc)
>  	return rc;
>  }
>  
> -void dpu_crtc_commit_kickoff(struct drm_crtc *crtc, bool async)
> +void dpu_crtc_commit_kickoff(struct drm_crtc *crtc)
>  {
>  	struct drm_encoder *encoder;
>  	struct dpu_crtc *dpu_crtc = to_dpu_crtc(crtc);
> @@ -636,35 +636,32 @@ void dpu_crtc_commit_kickoff(struct drm_crtc *crtc, bool async)
>  				  crtc->state->encoder_mask)
>  		dpu_encoder_prepare_for_kickoff(encoder);
>  
> -	if (!async) {
> -		/* wait for previous frame_event_done completion */
> -		DPU_ATRACE_BEGIN("wait_for_frame_done_event");
> -		ret = _dpu_crtc_wait_for_frame_done(crtc);
> -		DPU_ATRACE_END("wait_for_frame_done_event");
> -		if (ret) {
> -			DPU_ERROR("crtc%d wait for frame done failed;frame_pending%d\n",
> -					crtc->base.id,
> -					atomic_read(&dpu_crtc->frame_pending));
> -			goto end;
> -		}
> +	/* wait for previous frame_event_done completion */
> +	DPU_ATRACE_BEGIN("wait_for_frame_done_event");
> +	ret = _dpu_crtc_wait_for_frame_done(crtc);
> +	DPU_ATRACE_END("wait_for_frame_done_event");
> +	if (ret) {
> +		DPU_ERROR("crtc%d wait for frame done failed;frame_pending%d\n",
> +				crtc->base.id,
> +				atomic_read(&dpu_crtc->frame_pending));
> +		goto end;
> +	}
>  
> -		if (atomic_inc_return(&dpu_crtc->frame_pending) == 1) {
> -			/* acquire bandwidth and other resources */
> -			DPU_DEBUG("crtc%d first commit\n", crtc->base.id);
> -		} else
> -			DPU_DEBUG("crtc%d commit\n", crtc->base.id);
> +	if (atomic_inc_return(&dpu_crtc->frame_pending) == 1) {
> +		/* acquire bandwidth and other resources */
> +		DPU_DEBUG("crtc%d first commit\n", crtc->base.id);
> +	} else
> +		DPU_DEBUG("crtc%d commit\n", crtc->base.id);
>  
> -		dpu_crtc->play_count++;
> -	}
> +	dpu_crtc->play_count++;
>  
>  	dpu_vbif_clear_errors(dpu_kms);
>  
>  	drm_for_each_encoder_mask(encoder, crtc->dev, crtc->state->encoder_mask)
> -		dpu_encoder_kickoff(encoder, async);
> +		dpu_encoder_kickoff(encoder);
>  
>  end:
> -	if (!async)
> -		reinit_completion(&dpu_crtc->frame_done_comp);
> +	reinit_completion(&dpu_crtc->frame_done_comp);
>  	DPU_ATRACE_END("crtc_commit");
>  }
>  
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
> index 5181f079a6a1..10f78459f6c2 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
> @@ -238,9 +238,8 @@ void dpu_crtc_vblank_callback(struct drm_crtc *crtc);
>  /**
>   * dpu_crtc_commit_kickoff - trigger kickoff of the commit for this crtc
>   * @crtc: Pointer to drm crtc object
> - * @async: true if the commit is asynchronous, false otherwise
>   */
> -void dpu_crtc_commit_kickoff(struct drm_crtc *crtc, bool async);
> +void dpu_crtc_commit_kickoff(struct drm_crtc *crtc);
>  
>  /**
>   * dpu_crtc_complete_commit - callback signalling completion of current commit
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index 627c57594221..ac2d534bf59e 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -1421,8 +1421,7 @@ static void dpu_encoder_off_work(struct work_struct *work)
>   * extra_flush_bits: Additional bit mask to include in flush trigger
>   */
>  static void _dpu_encoder_trigger_flush(struct drm_encoder *drm_enc,
> -		struct dpu_encoder_phys *phys, uint32_t extra_flush_bits,
> -		bool async)
> +		struct dpu_encoder_phys *phys, uint32_t extra_flush_bits)
>  {
>  	struct dpu_hw_ctl *ctl;
>  	int pending_kickoff_cnt;
> @@ -1439,10 +1438,7 @@ static void _dpu_encoder_trigger_flush(struct drm_encoder *drm_enc,
>  		return;
>  	}
>  
> -	if (!async)
> -		pending_kickoff_cnt = dpu_encoder_phys_inc_pending(phys);
> -	else
> -		pending_kickoff_cnt = atomic_read(&phys->pending_kickoff_cnt);
> +	pending_kickoff_cnt = dpu_encoder_phys_inc_pending(phys);
>  
>  	if (extra_flush_bits && ctl->ops.update_pending_flush)
>  		ctl->ops.update_pending_flush(ctl, extra_flush_bits);
> @@ -1553,8 +1549,7 @@ static void dpu_encoder_helper_hw_reset(struct dpu_encoder_phys *phys_enc)
>   *	a time.
>   * dpu_enc: Pointer to virtual encoder structure
>   */
> -static void _dpu_encoder_kickoff_phys(struct dpu_encoder_virt *dpu_enc,
> -				      bool async)
> +static void _dpu_encoder_kickoff_phys(struct dpu_encoder_virt *dpu_enc)
>  {
>  	struct dpu_hw_ctl *ctl;
>  	uint32_t i, pending_flush;
> @@ -1581,13 +1576,12 @@ static void _dpu_encoder_kickoff_phys(struct dpu_encoder_virt *dpu_enc,
>  		 * for async commits. So don't set this for async, since it'll
>  		 * roll over to the next commit.
>  		 */
> -		if (!async && phys->split_role != ENC_ROLE_SLAVE)
> +		if (phys->split_role != ENC_ROLE_SLAVE)
>  			set_bit(i, dpu_enc->frame_busy_mask);
>  
>  		if (!phys->ops.needs_single_flush ||
>  				!phys->ops.needs_single_flush(phys))
> -			_dpu_encoder_trigger_flush(&dpu_enc->base, phys, 0x0,
> -						   async);
> +			_dpu_encoder_trigger_flush(&dpu_enc->base, phys, 0x0);
>  		else if (ctl->ops.get_pending_flush)
>  			pending_flush |= ctl->ops.get_pending_flush(ctl);
>  	}
> @@ -1597,7 +1591,7 @@ static void _dpu_encoder_kickoff_phys(struct dpu_encoder_virt *dpu_enc,
>  		_dpu_encoder_trigger_flush(
>  				&dpu_enc->base,
>  				dpu_enc->cur_master,
> -				pending_flush, async);
> +				pending_flush);
>  	}
>  
>  	_dpu_encoder_trigger_start(dpu_enc->cur_master);
> @@ -1815,11 +1809,12 @@ void dpu_encoder_prepare_for_kickoff(struct drm_encoder *drm_enc)
>  	}
>  }
>  
> -void dpu_encoder_kickoff(struct drm_encoder *drm_enc, bool async)
> +void dpu_encoder_kickoff(struct drm_encoder *drm_enc)
>  {
>  	struct dpu_encoder_virt *dpu_enc;
>  	struct dpu_encoder_phys *phys;
>  	ktime_t wakeup_time;
> +	unsigned long timeout_ms;
>  	unsigned int i;
>  
>  	DPU_ATRACE_BEGIN("encoder_kickoff");
> @@ -1827,23 +1822,15 @@ void dpu_encoder_kickoff(struct drm_encoder *drm_enc, bool async)
>  
>  	trace_dpu_enc_kickoff(DRMID(drm_enc));
>  
> -	/*
> -	 * Asynchronous frames don't handle FRAME_DONE events. As such, they
> -	 * shouldn't enable the frame_done watchdog since it will always time
> -	 * out.
> -	 */
> -	if (!async) {
> -		unsigned long timeout_ms;
> -		timeout_ms = DPU_ENCODER_FRAME_DONE_TIMEOUT_FRAMES * 1000 /
> +	timeout_ms = DPU_ENCODER_FRAME_DONE_TIMEOUT_FRAMES * 1000 /
>  			drm_mode_vrefresh(&drm_enc->crtc->state->adjusted_mode);
>  
> -		atomic_set(&dpu_enc->frame_done_timeout_ms, timeout_ms);
> -		mod_timer(&dpu_enc->frame_done_timer,
> -			  jiffies + msecs_to_jiffies(timeout_ms));
> -	}
> +	atomic_set(&dpu_enc->frame_done_timeout_ms, timeout_ms);
> +	mod_timer(&dpu_enc->frame_done_timer,
> +			jiffies + msecs_to_jiffies(timeout_ms));
>  
>  	/* All phys encs are ready to go, trigger the kickoff */
> -	_dpu_encoder_kickoff_phys(dpu_enc, async);
> +	_dpu_encoder_kickoff_phys(dpu_enc);
>  
>  	/* allow phys encs to handle any post-kickoff business */
>  	for (i = 0; i < dpu_enc->num_phys_encs; i++) {
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
> index 997d131c2440..8465b37adf3b 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
> @@ -82,9 +82,8 @@ void dpu_encoder_trigger_kickoff_pending(struct drm_encoder *encoder);
>   * dpu_encoder_kickoff - trigger a double buffer flip of the ctl path
>   *	(i.e. ctl flush and start) immediately.
>   * @encoder:	encoder pointer
> - * @async:	true if this is an asynchronous commit
>   */
> -void dpu_encoder_kickoff(struct drm_encoder *encoder, bool async);
> +void dpu_encoder_kickoff(struct drm_encoder *encoder);
>  
>  /**
>   * dpu_encoder_wait_for_event - Waits for encoder events
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> index b8d264bd15df..31454cc5d8c5 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> @@ -298,7 +298,7 @@ void dpu_kms_encoder_enable(struct drm_encoder *encoder)
>  			continue;
>  
>  		trace_dpu_kms_enc_enable(DRMID(crtc));
> -		dpu_crtc_commit_kickoff(crtc, false);
> +		dpu_crtc_commit_kickoff(crtc);
>  	}
>  }
>  
> @@ -315,8 +315,7 @@ static void dpu_kms_commit(struct msm_kms *kms, struct drm_atomic_state *state)
>  
>  		if (crtc->state->active) {
>  			trace_dpu_kms_commit(DRMID(crtc));
> -			dpu_crtc_commit_kickoff(crtc,
> -						state->legacy_cursor_update);
> +			dpu_crtc_commit_kickoff(crtc);
>  		}
>  	}
>  }
> diff --git a/drivers/gpu/drm/msm/msm_atomic.c b/drivers/gpu/drm/msm/msm_atomic.c
> index dd16babdd8c0..e5aae1645933 100644
> --- a/drivers/gpu/drm/msm/msm_atomic.c
> +++ b/drivers/gpu/drm/msm/msm_atomic.c
> @@ -70,8 +70,7 @@ void msm_atomic_commit_tail(struct drm_atomic_state *state)
>  		kms->funcs->commit(kms, state);
>  	}
>  
> -	if (!state->legacy_cursor_update)
> -		msm_atomic_wait_for_commit_done(dev, state);
> +	msm_atomic_wait_for_commit_done(dev, state);
>  
>  	kms->funcs->complete_commit(kms, state);
>  
> -- 
> 2.21.0
> 

-- 
Sean Paul, Software Engineer, Google / Chromium OS
