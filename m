Return-Path: <linux-arm-msm+bounces-20426-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2911C8CEAC8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 May 2024 22:22:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1AC69B21372
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 May 2024 20:22:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9DB1A5336D;
	Fri, 24 May 2024 20:22:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gagLc95D"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AD8F46542
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 May 2024 20:22:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716582163; cv=none; b=K9b0/Wv9lql2JJQjaFKywd8YSmsH+ZF4dwvAz1M+sa+U4iEtigJRZZMBdnl9kXezRY3K70wDaOGEXnlw9SQIticD1cPc+eQ6T+5EE+X1FlVUBWuvPi2HrFmRfd0t+PF1m19q5JiY+ifyPUh48+JnxksTMqbOVd2clXpsfmTL4gU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716582163; c=relaxed/simple;
	bh=rlQuNkwuhNzTZcB6k4GgHTpFJG9eNq1ermiwtIOiwI8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d9LXEuMy2ZVA9Ap9KoJy1rVLQdAdrgNX9OXqPneTcarIgH/5MoYHBOSQIsWq4xnxA2VmYjfpDBA5t+2NBkpv+g0KEX+Imfc/mHFCODQnahERGnv2achsvtBghi2/XvtpOAMQvHUhs0YC77IfNIFhK6QFZHlSx36GUPuawoiJTUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gagLc95D; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-52389c1308dso9388144e87.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 May 2024 13:22:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716582159; x=1717186959; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1MgeblJxPy58TBGh5pybMM0oa+aydVdTgEiJurlLMwM=;
        b=gagLc95D/XqMnd7fg9vJ+iXRYDdL0iZhh37uV80C7ApMAWUAPjCYKEWs16FIgyekJf
         BlqcoKE3B1zYrskY2aHyx4OOL6x0mfnCYLj5EgUhy4zu/IFHqD8NMNTsse7Apkqbu7Vr
         2DMX0KHnTTD20UvOZIP8BnTbyX0f/o3fVGCSB++f5+w6lteGyb9BFSwwPp1XeP+FPBaU
         dyw4Zp+pS190e1fkhJiCQHFIYzCl5oyZR8W77V7ac+J0AC1lIr1lXNyD3ZBc5UAEw5+n
         dcdRSAomGL/zCOIoTDbGPnNIhJV13jomYNvqHjYsG2iJMJJSwEsB+yWgwMrZ2L/xarWX
         hZrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716582159; x=1717186959;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1MgeblJxPy58TBGh5pybMM0oa+aydVdTgEiJurlLMwM=;
        b=sZoAKWVP2aBwmYo0Qo0RDBUx1wuBMGAQWFRD/2ViD6YO5dIP6X1yozgzE4FWZZi2sB
         0caYxHnxLfWrEt6tqehtyRPQP9mhaIdMF/PN97mJCzoSqmNY6Y/1tnnH2Ezc8H642Gna
         FsZinRzTD5zoHdT9OzBdZ51d/DWVdx7kDowgpWrW+sLa8n4FwqAFCREXgGdRl2nNbvwh
         FamZaLwufdxHKZTT++NRnCRr1VxPfXCK3/tWh+8wAWJY9EeW/EaFdDyzrx/eCQsfa3v8
         r1I+jNFLxtwoQHkYFic3YLywY88Jcxx5GZ3q0aulGLD882ciRwFV9iZDgQ3T44rZ4CwZ
         yOug==
X-Forwarded-Encrypted: i=1; AJvYcCUdgroguhAfUdBjLNaIo9F4ZAkyPhz6nZVnjI+gvQKrA8zF4I36FsMuXVltU3vBNo8HtNLjhGuoXhjno0qw/1lgl9Jn7uFPNUrAOIOvAg==
X-Gm-Message-State: AOJu0YwH+zSW0hDD5vFBoxHGSVxe9KjOzbd/tpSIJLcEybeGwFFGSI3E
	GgjIumMK3qLzzg/y+oQo87nueJtIPMOPKNRmScuQbza+5yMHYCKGJKqX9EPpO0Y=
X-Google-Smtp-Source: AGHT+IGTUbO1EEtax07D7wbZuUgh3krzOHgdx5bxprH5hmeMsYV4ihjCDnNkgAJlWJIiqVb8dhlibA==
X-Received: by 2002:a05:6512:3498:b0:523:8702:7855 with SMTP id 2adb3069b0e04-52964aba87amr2020820e87.21.1716582159328;
        Fri, 24 May 2024 13:22:39 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52970c33e10sm231607e87.213.2024.05.24.13.22.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 May 2024 13:22:38 -0700 (PDT)
Date: Fri, 24 May 2024 23:22:37 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] Revert "drm/msm/dpu: drop
 dpu_encoder_phys_ops.atomic_mode_set"
Message-ID: <2qm32wkjdxynmovw5gd5xh4awy2gh4byt3ddkpvuvi4lq7f67d@y3dntcusfwxs>
References: <20240522-dpu-revert-ams-v2-1-b37825d708e1@linaro.org>
 <d9a502a2-9ad3-3b95-670a-3a67887ef54b@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d9a502a2-9ad3-3b95-670a-3a67887ef54b@quicinc.com>

On Fri, May 24, 2024 at 12:58:53PM -0700, Abhinav Kumar wrote:
> 
> 
> On 5/22/2024 3:24 AM, Dmitry Baryshkov wrote:
> > In the DPU driver blank IRQ handling is called from a vblank worker and
> > can happen outside of the irq_enable / irq_disable pair. Using the
> > worker makes that completely asynchronous with the rest of the code.
> > Revert commit d13f638c9b88 ("drm/msm/dpu: drop
> > dpu_encoder_phys_ops.atomic_mode_set") to fix vblank IRQ assignment for
> > CMD DSI panels.
> > 
> > Call trace:
> >   dpu_encoder_phys_cmd_control_vblank_irq+0x218/0x294
> >    dpu_encoder_toggle_vblank_for_crtc+0x160/0x194
> >    dpu_crtc_vblank+0xbc/0x228
> >    dpu_kms_enable_vblank+0x18/0x24
> >    vblank_ctrl_worker+0x34/0x6c
> >    process_one_work+0x218/0x620
> >    worker_thread+0x1ac/0x37c
> >    kthread+0x114/0x118
> >    ret_from_fork+0x10/0x20
> > 
> 
> Thanks for the stack.
> 
> Agreed that vblank can be controlled asynchronously through the worker.
> 
> And I am guessing that the worker thread ran and printed this error message
> because phys_enc->irq[INTR_IDX_VSYNC] was not valid as modeset had not
> happened by then?

modeset happened, but the vblanks can be enabled and disabled
afterwards.

> 
> 272 end:
> 273 	if (ret) {
> 274 		DRM_ERROR("vblank irq err id:%u pp:%d ret:%d, enable %s/%d\n",
> 275 			  DRMID(phys_enc->parent),
> 276 			  phys_enc->hw_pp->idx - PINGPONG_0, ret,
> 277 			  enable ? "true" : "false", refcount);
> 278 	}
> 
> But how come this did not happen even with this revert.
> 
> IOW, I am still missing how moving the irq assignment back to modeset from
> enable is fixing this?

It removes clearing of the IRQ fields in the irq_disable path, which
removes a requirement that vblank IRQ manipulations are called only
within the irq_enable/irq_disable brackets. I didn't have time to debug
this further on, so I think it's better to revert it now and return to
this cleanup later.

> 
> > Fixes: d13f638c9b88 ("drm/msm/dpu: drop dpu_encoder_phys_ops.atomic_mode_set")
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> > Changes in v2:
> > - Expanded commit message to describe the reason for revert and added a
> >    call trace (Abhinav)
> > - Link to v1: https://lore.kernel.org/r/20240514-dpu-revert-ams-v1-1-b13623d6cd5f@linaro.org
> > ---
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c        |  2 ++
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h   |  5 ++++
> >   .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c   | 32 ++++++++++++----------
> >   .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c   | 13 +++++++--
> >   .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c    | 11 +++++++-
> >   5 files changed, 46 insertions(+), 17 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> > index 119f3ea50a7c..a7d8ecf3f5be 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> > @@ -1200,6 +1200,8 @@ static void dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
> >   		phys->hw_ctl = to_dpu_hw_ctl(hw_ctl[i]);
> >   		phys->cached_mode = crtc_state->adjusted_mode;
> > +		if (phys->ops.atomic_mode_set)
> > +			phys->ops.atomic_mode_set(phys, crtc_state, conn_state);
> >   	}
> >   }
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
> > index 002e89cc1705..30470cd15a48 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
> > @@ -69,6 +69,8 @@ struct dpu_encoder_phys;
> >    * @is_master:			Whether this phys_enc is the current master
> >    *				encoder. Can be switched at enable time. Based
> >    *				on split_role and current mode (CMD/VID).
> > + * @atomic_mode_set:		DRM Call. Set a DRM mode.
> > + *				This likely caches the mode, for use at enable.
> >    * @enable:			DRM Call. Enable a DRM mode.
> >    * @disable:			DRM Call. Disable mode.
> >    * @control_vblank_irq		Register/Deregister for VBLANK IRQ
> > @@ -93,6 +95,9 @@ struct dpu_encoder_phys;
> >   struct dpu_encoder_phys_ops {
> >   	void (*prepare_commit)(struct dpu_encoder_phys *encoder);
> >   	bool (*is_master)(struct dpu_encoder_phys *encoder);
> > +	void (*atomic_mode_set)(struct dpu_encoder_phys *encoder,
> > +			struct drm_crtc_state *crtc_state,
> > +			struct drm_connector_state *conn_state);
> >   	void (*enable)(struct dpu_encoder_phys *encoder);
> >   	void (*disable)(struct dpu_encoder_phys *encoder);
> >   	int (*control_vblank_irq)(struct dpu_encoder_phys *enc, bool enable);
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
> > index 489be1c0c704..95cd39b49668 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
> > @@ -142,6 +142,23 @@ static void dpu_encoder_phys_cmd_underrun_irq(void *arg)
> >   	dpu_encoder_underrun_callback(phys_enc->parent, phys_enc);
> >   }
> > +static void dpu_encoder_phys_cmd_atomic_mode_set(
> > +		struct dpu_encoder_phys *phys_enc,
> > +		struct drm_crtc_state *crtc_state,
> > +		struct drm_connector_state *conn_state)
> > +{
> > +	phys_enc->irq[INTR_IDX_CTL_START] = phys_enc->hw_ctl->caps->intr_start;
> > +
> > +	phys_enc->irq[INTR_IDX_PINGPONG] = phys_enc->hw_pp->caps->intr_done;
> > +
> > +	if (phys_enc->has_intf_te)
> > +		phys_enc->irq[INTR_IDX_RDPTR] = phys_enc->hw_intf->cap->intr_tear_rd_ptr;
> > +	else
> > +		phys_enc->irq[INTR_IDX_RDPTR] = phys_enc->hw_pp->caps->intr_rdptr;
> > +
> > +	phys_enc->irq[INTR_IDX_UNDERRUN] = phys_enc->hw_intf->cap->intr_underrun;
> > +}
> > +
> >   static int _dpu_encoder_phys_cmd_handle_ppdone_timeout(
> >   		struct dpu_encoder_phys *phys_enc)
> >   {
> > @@ -280,14 +297,6 @@ static void dpu_encoder_phys_cmd_irq_enable(struct dpu_encoder_phys *phys_enc)
> >   					  phys_enc->hw_pp->idx - PINGPONG_0,
> >   					  phys_enc->vblank_refcount);
> > -	phys_enc->irq[INTR_IDX_CTL_START] = phys_enc->hw_ctl->caps->intr_start;
> > -	phys_enc->irq[INTR_IDX_PINGPONG] = phys_enc->hw_pp->caps->intr_done;
> > -
> > -	if (phys_enc->has_intf_te)
> > -		phys_enc->irq[INTR_IDX_RDPTR] = phys_enc->hw_intf->cap->intr_tear_rd_ptr;
> > -	else
> > -		phys_enc->irq[INTR_IDX_RDPTR] = phys_enc->hw_pp->caps->intr_rdptr;
> > -
> >   	dpu_core_irq_register_callback(phys_enc->dpu_kms,
> >   				       phys_enc->irq[INTR_IDX_PINGPONG],
> >   				       dpu_encoder_phys_cmd_pp_tx_done_irq,
> > @@ -318,10 +327,6 @@ static void dpu_encoder_phys_cmd_irq_disable(struct dpu_encoder_phys *phys_enc)
> >   	dpu_core_irq_unregister_callback(phys_enc->dpu_kms, phys_enc->irq[INTR_IDX_UNDERRUN]);
> >   	dpu_encoder_phys_cmd_control_vblank_irq(phys_enc, false);
> >   	dpu_core_irq_unregister_callback(phys_enc->dpu_kms, phys_enc->irq[INTR_IDX_PINGPONG]);
> > -
> > -	phys_enc->irq[INTR_IDX_CTL_START] = 0;
> > -	phys_enc->irq[INTR_IDX_PINGPONG] = 0;
> > -	phys_enc->irq[INTR_IDX_RDPTR] = 0;
> >   }
> >   static void dpu_encoder_phys_cmd_tearcheck_config(
> > @@ -698,6 +703,7 @@ static void dpu_encoder_phys_cmd_init_ops(
> >   		struct dpu_encoder_phys_ops *ops)
> >   {
> >   	ops->is_master = dpu_encoder_phys_cmd_is_master;
> > +	ops->atomic_mode_set = dpu_encoder_phys_cmd_atomic_mode_set;
> >   	ops->enable = dpu_encoder_phys_cmd_enable;
> >   	ops->disable = dpu_encoder_phys_cmd_disable;
> >   	ops->control_vblank_irq = dpu_encoder_phys_cmd_control_vblank_irq;
> > @@ -736,8 +742,6 @@ struct dpu_encoder_phys *dpu_encoder_phys_cmd_init(struct drm_device *dev,
> >   	dpu_encoder_phys_cmd_init_ops(&phys_enc->ops);
> >   	phys_enc->intf_mode = INTF_MODE_CMD;
> > -	phys_enc->irq[INTR_IDX_UNDERRUN] = phys_enc->hw_intf->cap->intr_underrun;
> > -
> >   	cmd_enc->stream_sel = 0;
> >   	if (!phys_enc->hw_intf) {
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
> > index ef69c2f408c3..636a97432d51 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
> > @@ -356,6 +356,16 @@ static bool dpu_encoder_phys_vid_needs_single_flush(
> >   	return phys_enc->split_role != ENC_ROLE_SOLO;
> >   }
> > +static void dpu_encoder_phys_vid_atomic_mode_set(
> > +		struct dpu_encoder_phys *phys_enc,
> > +		struct drm_crtc_state *crtc_state,
> > +		struct drm_connector_state *conn_state)
> > +{
> > +	phys_enc->irq[INTR_IDX_VSYNC] = phys_enc->hw_intf->cap->intr_vsync;
> > +
> > +	phys_enc->irq[INTR_IDX_UNDERRUN] = phys_enc->hw_intf->cap->intr_underrun;
> > +}
> > +
> >   static int dpu_encoder_phys_vid_control_vblank_irq(
> >   		struct dpu_encoder_phys *phys_enc,
> >   		bool enable)
> > @@ -699,6 +709,7 @@ static int dpu_encoder_phys_vid_get_frame_count(
> >   static void dpu_encoder_phys_vid_init_ops(struct dpu_encoder_phys_ops *ops)
> >   {
> >   	ops->is_master = dpu_encoder_phys_vid_is_master;
> > +	ops->atomic_mode_set = dpu_encoder_phys_vid_atomic_mode_set;
> >   	ops->enable = dpu_encoder_phys_vid_enable;
> >   	ops->disable = dpu_encoder_phys_vid_disable;
> >   	ops->control_vblank_irq = dpu_encoder_phys_vid_control_vblank_irq;
> > @@ -737,8 +748,6 @@ struct dpu_encoder_phys *dpu_encoder_phys_vid_init(struct drm_device *dev,
> >   	dpu_encoder_phys_vid_init_ops(&phys_enc->ops);
> >   	phys_enc->intf_mode = INTF_MODE_VIDEO;
> > -	phys_enc->irq[INTR_IDX_VSYNC] = phys_enc->hw_intf->cap->intr_vsync;
> > -	phys_enc->irq[INTR_IDX_UNDERRUN] = phys_enc->hw_intf->cap->intr_underrun;
> >   	DPU_DEBUG_VIDENC(phys_enc, "created intf idx:%d\n", p->hw_intf->idx);
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
> > index d3ea91c1d7d2..356dca5e5ea9 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
> > @@ -404,6 +404,15 @@ static void dpu_encoder_phys_wb_irq_disable(struct dpu_encoder_phys *phys)
> >   		dpu_core_irq_unregister_callback(phys->dpu_kms, phys->irq[INTR_IDX_WB_DONE]);
> >   }
> > +static void dpu_encoder_phys_wb_atomic_mode_set(
> > +		struct dpu_encoder_phys *phys_enc,
> > +		struct drm_crtc_state *crtc_state,
> > +		struct drm_connector_state *conn_state)
> > +{
> > +
> > +	phys_enc->irq[INTR_IDX_WB_DONE] = phys_enc->hw_wb->caps->intr_wb_done;
> > +}
> > +
> >   static void _dpu_encoder_phys_wb_handle_wbdone_timeout(
> >   		struct dpu_encoder_phys *phys_enc)
> >   {
> > @@ -640,6 +649,7 @@ static bool dpu_encoder_phys_wb_is_valid_for_commit(struct dpu_encoder_phys *phy
> >   static void dpu_encoder_phys_wb_init_ops(struct dpu_encoder_phys_ops *ops)
> >   {
> >   	ops->is_master = dpu_encoder_phys_wb_is_master;
> > +	ops->atomic_mode_set = dpu_encoder_phys_wb_atomic_mode_set;
> >   	ops->enable = dpu_encoder_phys_wb_enable;
> >   	ops->disable = dpu_encoder_phys_wb_disable;
> >   	ops->wait_for_commit_done = dpu_encoder_phys_wb_wait_for_commit_done;
> > @@ -685,7 +695,6 @@ struct dpu_encoder_phys *dpu_encoder_phys_wb_init(struct drm_device *dev,
> >   	dpu_encoder_phys_wb_init_ops(&phys_enc->ops);
> >   	phys_enc->intf_mode = INTF_MODE_WB_LINE;
> > -	phys_enc->irq[INTR_IDX_WB_DONE] = phys_enc->hw_wb->caps->intr_wb_done;
> >   	atomic_set(&wb_enc->wbirq_refcount, 0);
> > 
> > ---
> > base-commit: 75fa778d74b786a1608d55d655d42b480a6fa8bd
> > change-id: 20240514-dpu-revert-ams-9410abc1ee48
> > 
> > Best regards,

-- 
With best wishes
Dmitry

