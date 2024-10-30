Return-Path: <linux-arm-msm+bounces-36392-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EFACE9B5FAA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Oct 2024 11:03:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E7A21284C26
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Oct 2024 10:03:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F0B01E2312;
	Wed, 30 Oct 2024 10:03:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NARNE/n4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33E6619884C
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Oct 2024 10:03:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730282612; cv=none; b=M4hYEoefwHRTOt+o33vQjK4b6Od90S3nqRZxSnmSxZoI+q0jV8CuwolB56GVbumlSsP29hRRdRyBCdlEhi7+C2GmLrAH1kugtFLSQQS7MArC7JF2WwECxFU49Va1p1sZHSifS0szF5AvHotFdp38lTarRoB6FqPCOnPHUie7SsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730282612; c=relaxed/simple;
	bh=AkW03X+Q1w5V47bSiAE2bglV8nda8D5ZJFSo8fhlC3E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JFc+QkWKZ94+K0rmvIBIbhKdFlSC2q6HxvDIzF/zhLPWvtj6iROJGugOTK4TI5XFkYCFSE5/3a8ABa2eqOE/l+nEYejpI3rHOjXITWrw8NNIiA3BWnnAibeQw05I2aDINcCLR8XbMNy/H4GmsR4XnAArcLUMd59AXHLGE7EFxFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NARNE/n4; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-539eb97f26aso6696127e87.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Oct 2024 03:03:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730282605; x=1730887405; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Hv/gBvIOihm88jcP9baIrEbE/iwIamkmlzhg/EmCDXI=;
        b=NARNE/n4/gLdHfx4SheocGjSWX74E3IyMnlwKTX3X7w4ha2p5cyVmEfDukRBB1AwKY
         NlJ/D7L67hsehcCE7ObWCQ4ieN7cZUkrd6WBNpj/zStPG5qaAcHPSpndruTlTAXPdFJn
         UTbUFnxTGIbngTcHABlWCvxVOBZbXppn22xu2frgXMQZqWcDytq+ptzZhL8QnmVFXgAn
         bJxr1mgVxGwyNie13ZSUL8mJVqrtBy8rJ0YY++SHMwCssZvLo0DMI+pHU7g5Tahr+ecZ
         kYwJ1+J4PjN+lNFAXFwrbpds92PRWtUzkCXCbkkMXLsvnZmyxvFP3by7QhfFdzYSKQAM
         rvSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730282605; x=1730887405;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Hv/gBvIOihm88jcP9baIrEbE/iwIamkmlzhg/EmCDXI=;
        b=leB/cR/iGqbq9/pjJJNxfV5lFwvh5/oV6QUhKBMGta0A8VGTNMO0EvH+iGcfxGlXgk
         y1LZeciywpQKybFW2tJkxBFEoYkeN9ZI6Nbe0eKVxNl/dg0nmZyzwb1A8vxpHuTyGi1+
         5m1kCs6FX2aKM9caCjieeD836JjZp8jcWML5UFI0rJ3BEeheDfF3oyC17nK8pfqbeusJ
         jWondgGsQv0qF93dQEr07dizwpwF/3gCLVmgQoMO5OZLSOVjwQFCON2qJfzEbGZIeCzE
         pGRc6lC1fKfEKcaNoTo1+rmhLXnuHoQAr/AlNrcNNvBcSED6YJVaMZ8TBrJQ/wGNIXMy
         whVA==
X-Forwarded-Encrypted: i=1; AJvYcCXCWakS3z2RkLIVTKVMOh9YQxuwcRZrqfvWSHnhihWAmFzZji/eQN8obMI9xp91dek/RPHPjdcL30DFCE4T@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4H6xx3u/NOZHnq9gUeNZyd3GrRT62ZnoOPnfDgyVztcV46GcP
	Rkjh2dW4UCqCFw4/EnZt9IXZmP+/29ol2eVFVSGoV00iw5hHhArbguEC83wtTkI=
X-Google-Smtp-Source: AGHT+IGc1/N3seaHX8png3PY60rDjSKWV998xm7xnAOmUc6yHmzuKnSin7MD3bzyPJHDQEXHLHAzrw==
X-Received: by 2002:a05:6512:3d89:b0:539:ee0a:4f8f with SMTP id 2adb3069b0e04-53b7ed18669mr1374900e87.44.1730282605029;
        Wed, 30 Oct 2024 03:03:25 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53bc0d80e1dsm204898e87.305.2024.10.30.03.03.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Oct 2024 03:03:23 -0700 (PDT)
Date: Wed, 30 Oct 2024 12:03:22 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 8/9] drm/msm/dpu: allow using two SSPP blocks for a
 single plane
Message-ID: <6hyyi3sfi4b4iaia4asbckfjq5743rslfwkgtggfpdjeziku4g@4vpuvhfudgiz>
References: <20241025-dpu-virtual-wide-v6-0-0310fd519765@linaro.org>
 <20241025-dpu-virtual-wide-v6-8-0310fd519765@linaro.org>
 <e09a547a-c123-489e-b993-a246ebe32513@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e09a547a-c123-489e-b993-a246ebe32513@quicinc.com>

On Tue, Oct 29, 2024 at 03:07:30PM -0700, Abhinav Kumar wrote:
> 
> 
> On 10/24/2024 5:20 PM, Dmitry Baryshkov wrote:
> > Virtual wide planes give high amount of flexibility, but it is not
> > always enough:
> > 
> > In parallel multirect case only the half of the usual width is supported
> > for tiled formats. Thus the whole width of two tiled multirect
> > rectangles can not be greater than max_linewidth, which is not enough
> > for some platforms/compositors.
> > 
> > Another example is as simple as wide YUV plane. YUV planes can not use
> > multirect, so currently they are limited to max_linewidth too.
> > 
> > Now that the planes are fully virtualized, add support for allocating
> > two SSPP blocks to drive a single DRM plane. This fixes both mentioned
> > cases and allows all planes to go up to 2*max_linewidth (at the cost of
> > making some of the planes unavailable to the user).
> > 
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 163 ++++++++++++++++++++++--------
> >   1 file changed, 119 insertions(+), 44 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> > index 125db3803cf5..ad6cc469f475 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> > @@ -20,7 +20,6 @@
> >   #include "msm_drv.h"
> >   #include "msm_mdss.h"
> >   #include "dpu_kms.h"
> > -#include "dpu_formats.h"
> >   #include "dpu_hw_sspp.h"
> >   #include "dpu_hw_util.h"
> >   #include "dpu_trace.h"
> > @@ -888,6 +887,28 @@ static int dpu_plane_atomic_check_nosspp(struct drm_plane *plane,
> >   	return 0;
> >   }
> > +static int dpu_plane_is_multirect_parallel_capable(struct dpu_sw_pipe *pipe,
> > +						   struct dpu_sw_pipe_cfg *pipe_cfg,
> > +						   const struct msm_format *fmt,
> > +						   uint32_t max_linewidth)
> > +{
> > +	if (drm_rect_width(&pipe_cfg->src_rect) != drm_rect_width(&pipe_cfg->dst_rect) ||
> > +	    drm_rect_height(&pipe_cfg->src_rect) != drm_rect_height(&pipe_cfg->dst_rect))
> > +		return false;
> > +
> > +	if (pipe_cfg->rotation & DRM_MODE_ROTATE_90)
> > +		return false;
> > +
> > +	if (MSM_FORMAT_IS_YUV(fmt))
> > +		return false;
> > +
> > +	if (MSM_FORMAT_IS_UBWC(fmt) &&
> > +	    drm_rect_width(&pipe_cfg->src_rect) > max_linewidth / 2)
> > +		return false;
> > +
> > +	return true;
> > +}
> 
> Dont we also need to check for
> 
> if (!test_bit(DPU_SSPP_SMART_DMA_V1, &pipe->sspp->cap->features) &&
> 		     !test_bit(DPU_SSPP_SMART_DMA_V2, &pipe->sspp->cap->features))?
> 	return false;

In the patch I was checking that after a call to this function, but
maybe you are right. Especially since I was checking only the pipe, not
the r_pipe.

> 
> > +
> >   static int dpu_plane_atomic_check_sspp(struct drm_plane *plane,
> >   				       struct drm_atomic_state *state,
> >   				       const struct drm_crtc_state *crtc_state)
> > @@ -901,7 +922,6 @@ static int dpu_plane_atomic_check_sspp(struct drm_plane *plane,
> >   	const struct msm_format *fmt;
> >   	struct dpu_sw_pipe_cfg *pipe_cfg = &pstate->pipe_cfg;
> >   	struct dpu_sw_pipe_cfg *r_pipe_cfg = &pstate->r_pipe_cfg;
> > -	uint32_t max_linewidth;
> >   	uint32_t supported_rotations;
> >   	const struct dpu_sspp_cfg *pipe_hw_caps;
> >   	const struct dpu_sspp_sub_blks *sblk;
> > @@ -923,8 +943,6 @@ static int dpu_plane_atomic_check_sspp(struct drm_plane *plane,
> >   	fmt = msm_framebuffer_format(new_plane_state->fb);
> > -	max_linewidth = pdpu->catalog->caps->max_linewidth;
> > -
> >   	supported_rotations = DRM_MODE_REFLECT_MASK | DRM_MODE_ROTATE_0;
> >   	if (pipe_hw_caps->features & BIT(DPU_SSPP_INLINE_ROTATION))
> > @@ -940,41 +958,6 @@ static int dpu_plane_atomic_check_sspp(struct drm_plane *plane,
> >   		return ret;
> >   	if (drm_rect_width(&r_pipe_cfg->src_rect) != 0) {
> > -		/*
> > -		 * In parallel multirect case only the half of the usual width
> > -		 * is supported for tiled formats. If we are here, we know that
> > -		 * full width is more than max_linewidth, thus each rect is
> > -		 * wider than allowed.
> > -		 */
> > -		if (MSM_FORMAT_IS_UBWC(fmt) &&
> > -		    drm_rect_width(&pipe_cfg->src_rect) > max_linewidth) {
> > -			DPU_DEBUG_PLANE(pdpu, "invalid src " DRM_RECT_FMT " line:%u, tiled format\n",
> > -					DRM_RECT_ARG(&pipe_cfg->src_rect), max_linewidth);
> > -			return -E2BIG;
> > -		}
> > -
> > -		if (drm_rect_width(&pipe_cfg->src_rect) != drm_rect_width(&pipe_cfg->dst_rect) ||
> > -		    drm_rect_height(&pipe_cfg->src_rect) != drm_rect_height(&pipe_cfg->dst_rect) ||
> > -		    (!test_bit(DPU_SSPP_SMART_DMA_V1, &pipe->sspp->cap->features) &&
> > -		     !test_bit(DPU_SSPP_SMART_DMA_V2, &pipe->sspp->cap->features)) ||
> > -		    pipe_cfg->rotation & DRM_MODE_ROTATE_90 ||
> > -		    MSM_FORMAT_IS_YUV(fmt)) {
> > -			DPU_DEBUG_PLANE(pdpu, "invalid src " DRM_RECT_FMT " line:%u, can't use split source\n",
> > -					DRM_RECT_ARG(&pipe_cfg->src_rect), max_linewidth);
> > -			return -E2BIG;
> > -		}
> > -
> > -		/*
> > -		 * Use multirect for wide plane. We do not support dynamic
> > -		 * assignment of SSPPs, so we know the configuration.
> > -		 */
> > -		pipe->multirect_index = DPU_SSPP_RECT_0;
> > -		pipe->multirect_mode = DPU_SSPP_MULTIRECT_PARALLEL;
> > -
> > -		r_pipe->sspp = pipe->sspp;
> > -		r_pipe->multirect_index = DPU_SSPP_RECT_1;
> > -		r_pipe->multirect_mode = DPU_SSPP_MULTIRECT_PARALLEL;
> > -
> >   		ret = dpu_plane_atomic_check_pipe(pdpu, r_pipe, r_pipe_cfg, fmt,
> >   						  &crtc_state->adjusted_mode);
> >   		if (ret)
> > @@ -995,16 +978,16 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
> >   	struct dpu_kms *dpu_kms = _dpu_plane_get_kms(plane);
> >   	struct dpu_sw_pipe *pipe = &pstate->pipe;
> >   	struct dpu_sw_pipe *r_pipe = &pstate->r_pipe;
> > +	struct dpu_sw_pipe_cfg *pipe_cfg = &pstate->pipe_cfg;
> > +	struct dpu_sw_pipe_cfg *r_pipe_cfg = &pstate->r_pipe_cfg;
> >   	const struct drm_crtc_state *crtc_state = NULL;
> >   	if (new_plane_state->crtc)
> >   		crtc_state = drm_atomic_get_new_crtc_state(state,
> >   							   new_plane_state->crtc);
> > -	if (pdpu->pipe != SSPP_NONE) {
> > -		pipe->sspp = dpu_rm_get_sspp(&dpu_kms->rm, pdpu->pipe);
> > -		r_pipe->sspp = NULL;
> > -	}
> > +	pipe->sspp = dpu_rm_get_sspp(&dpu_kms->rm, pdpu->pipe);
> > +	r_pipe->sspp = NULL;
> >   	if (!pipe->sspp)
> >   		return -EINVAL;
> > @@ -1021,6 +1004,49 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
> >   	r_pipe->multirect_index = DPU_SSPP_RECT_SOLO;
> >   	r_pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
> > +	if (drm_rect_width(&r_pipe_cfg->src_rect) != 0) {
> > +		uint32_t max_linewidth = dpu_kms->catalog->caps->max_linewidth;
> > +		const struct msm_format *fmt;
> > +
> > +		fmt = msm_framebuffer_format(new_plane_state->fb);
> > +
> > +		/*
> > +		 * In parallel multirect case only the half of the usual width
> > +		 * is supported for tiled formats. If we are here, we know that
> > +		 * full width is more than max_linewidth, thus each rect is
> > +		 * wider than allowed.
> > +		 */
> > +		if (MSM_FORMAT_IS_UBWC(fmt) &&
> > +		    drm_rect_width(&pipe_cfg->src_rect) > max_linewidth) {
> > +			DPU_DEBUG_PLANE(pdpu, "invalid src " DRM_RECT_FMT " line:%u, tiled format\n",
> > +					DRM_RECT_ARG(&pipe_cfg->src_rect), max_linewidth);
> > +			return -E2BIG;
> > +		}
> > +
> > +		if (drm_rect_width(&pipe_cfg->src_rect) != drm_rect_width(&pipe_cfg->dst_rect) ||
> > +		    drm_rect_height(&pipe_cfg->src_rect) != drm_rect_height(&pipe_cfg->dst_rect) ||
> > +		    (!test_bit(DPU_SSPP_SMART_DMA_V1, &pipe->sspp->cap->features) &&
> > +		     !test_bit(DPU_SSPP_SMART_DMA_V2, &pipe->sspp->cap->features)) ||
> > +		    pipe_cfg->rotation & DRM_MODE_ROTATE_90 ||
> > +		    MSM_FORMAT_IS_YUV(fmt)) {
> > +			DPU_DEBUG_PLANE(pdpu, "invalid src " DRM_RECT_FMT " line:%u, can't use split source\n",
> > +					DRM_RECT_ARG(&pipe_cfg->src_rect), max_linewidth);
> > +			return -E2BIG;
> > +		}
> 
> Dont the above two conditions translate to
> !dpu_plane_is_multirect_parallel_capable()?


Good idea, I'll change that.

> 
> I think once we have a unified plane atomic check and not a separate one for
> virtual planes (we had to add one to support the modparam), some duplication
> will go away but till then I think this is the best we can do.
> 
> 
> > +
> > +		/*
> > +		 * Use multirect for wide plane. We do not support dynamic
> > +		 * assignment of SSPPs, so we know the configuration.
> > +		 */
> > +		r_pipe->sspp = pipe->sspp;
> > +
> > +		pipe->multirect_index = DPU_SSPP_RECT_0;
> > +		pipe->multirect_mode = DPU_SSPP_MULTIRECT_PARALLEL;
> > +
> > +		r_pipe->multirect_index = DPU_SSPP_RECT_1;
> > +		r_pipe->multirect_mode = DPU_SSPP_MULTIRECT_PARALLEL;
> > +	}
> > +
> >   	return dpu_plane_atomic_check_sspp(plane, state, crtc_state);
> >   }
> > @@ -1054,8 +1080,16 @@ static int dpu_plane_virtual_atomic_check(struct drm_plane *plane,
> >   		return 0;
> >   	}
> > -	/* force resource reallocation if the format of FB has changed */
> > +	/*
> > +	 * Force resource reallocation if the format of FB or src/dst have
> > +	 * changed. We might need to allocate different SSPP or SSPPs for this
> > +	 * plane than the one used previously.
> > +	 */
> >   	if (!old_plane_state || !old_plane_state->fb ||
> > +	    old_plane_state->src_w != plane_state->src_w ||
> > +	    old_plane_state->src_h != plane_state->src_h ||
> > +	    old_plane_state->src_w != plane_state->src_w ||
> > +	    old_plane_state->crtc_h != plane_state->crtc_h ||
> >   	    msm_framebuffer_format(old_plane_state->fb) !=
> >   	    msm_framebuffer_format(plane_state->fb))
> >   		crtc_state->planes_changed = true;
> > @@ -1075,7 +1109,10 @@ static int dpu_plane_virtual_assign_resources(struct drm_crtc *crtc,
> >   	struct dpu_plane_state *pstate;
> >   	struct dpu_sw_pipe *pipe;
> >   	struct dpu_sw_pipe *r_pipe;
> > +	struct dpu_sw_pipe_cfg *pipe_cfg;
> > +	struct dpu_sw_pipe_cfg *r_pipe_cfg;
> >   	const struct msm_format *fmt;
> > +	uint32_t max_linewidth;
> >   	if (plane_state->crtc)
> >   		crtc_state = drm_atomic_get_new_crtc_state(state,
> > @@ -1084,6 +1121,8 @@ static int dpu_plane_virtual_assign_resources(struct drm_crtc *crtc,
> >   	pstate = to_dpu_plane_state(plane_state);
> >   	pipe = &pstate->pipe;
> >   	r_pipe = &pstate->r_pipe;
> > +	pipe_cfg = &pstate->pipe_cfg;
> > +	r_pipe_cfg = &pstate->r_pipe_cfg;
> >   	pipe->sspp = NULL;
> >   	r_pipe->sspp = NULL;
> > @@ -1098,10 +1137,46 @@ static int dpu_plane_virtual_assign_resources(struct drm_crtc *crtc,
> >   	reqs.rot90 = drm_rotation_90_or_270(plane_state->rotation);
> > +	max_linewidth = dpu_kms->catalog->caps->max_linewidth;
> > +
> >   	pipe->sspp = dpu_rm_reserve_sspp(&dpu_kms->rm, global_state, crtc, &reqs);
> >   	if (!pipe->sspp)
> >   		return -ENODEV;
> > +	if (drm_rect_width(&r_pipe_cfg->src_rect) == 0) {
> > +		pipe->multirect_index = DPU_SSPP_RECT_SOLO;
> > +		pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
> > +
> > +		r_pipe->multirect_index = DPU_SSPP_RECT_SOLO;
> > +		r_pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
> > +
> > +		r_pipe->sspp = NULL;
> > +	} else {
> > +		if (dpu_plane_is_multirect_parallel_capable(pipe, pipe_cfg, fmt, max_linewidth) &&
> > +		    dpu_plane_is_multirect_parallel_capable(r_pipe, r_pipe_cfg, fmt, max_linewidth) &&
> > +		    (test_bit(DPU_SSPP_SMART_DMA_V1, &pipe->sspp->cap->features) ||
> > +		     test_bit(DPU_SSPP_SMART_DMA_V2, &pipe->sspp->cap->features))) {
> > +			r_pipe->sspp = pipe->sspp;
> > +
> > +			pipe->multirect_index = DPU_SSPP_RECT_0;
> > +			pipe->multirect_mode = DPU_SSPP_MULTIRECT_PARALLEL;
> > +
> > +			r_pipe->multirect_index = DPU_SSPP_RECT_1;
> > +			r_pipe->multirect_mode = DPU_SSPP_MULTIRECT_PARALLEL;
> > +		} else {
> > +			/* multirect is not possible, use two SSPP blocks */
> > +			r_pipe->sspp = dpu_rm_reserve_sspp(&dpu_kms->rm, global_state, crtc, &reqs);
> > +			if (!r_pipe->sspp)
> > +				return -ENODEV;
> > +
> > +			pipe->multirect_index = DPU_SSPP_RECT_SOLO;
> > +			pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
> > +
> > +			r_pipe->multirect_index = DPU_SSPP_RECT_SOLO;
> > +			r_pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
> > +		}
> > +	}
> > +
> >   	return dpu_plane_atomic_check_sspp(plane, state, crtc_state);
> >   }
> > 

-- 
With best wishes
Dmitry

