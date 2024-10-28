Return-Path: <linux-arm-msm+bounces-36144-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D62D89B2D3D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Oct 2024 11:46:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 67B441F21BA0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Oct 2024 10:46:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 124B215E8B;
	Mon, 28 Oct 2024 10:46:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uggDzW3u"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 908BC17E473
	for <linux-arm-msm@vger.kernel.org>; Mon, 28 Oct 2024 10:46:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730112377; cv=none; b=EWfOFC6xpF1iDJA9UPqrMdP0npava/b1Wqp0qkusElig0wbRdOipRJAY+QeFijtxj5d38tmMRjc1lWEHoNOuOLLPfHGNDPWEO9JMhMG//y+PIy3SEqagwiY5yeZRTjrN4yFQ5rHFm/eAA6AbhoHynNZwRKNwN8sdEDkbjq+EDOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730112377; c=relaxed/simple;
	bh=SICDd0axSbFMeeXlp6VHRRv/+xJ5dkoI5WjGJ3O261w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=diqrvFBpwbfTXRKAkBEiqq1Ae/YbWeS5DKO8xPVMkxpifvjmGyniHmOB3LccjncXyLml15f/iy0+u+Tk+9x+wW1xX0r6/+nMV1siHNvg/9u0gPPDyozC907kyBShmI1DRazTQuYKGBV1xUyKtdo+wNPs3yoCuQwA7l1wdLz2kQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uggDzW3u; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-539fe02c386so4777558e87.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Oct 2024 03:46:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730112373; x=1730717173; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=CHj4nYgiHaKiW5aEYPKVHro023TFgtEOxg1MzyObDrg=;
        b=uggDzW3u0b4VFzlE14W7VYG3K00IJ9oKSdhJ2o0fZe4O0j9FGIFU86GHwLxamuBCEJ
         FjgLAxxCaI01Yegsmm+hj4VUwhdvekYATtaeLptVAN4gtDsteeG2tn4Tm6+l/meQEdEG
         jOfwcRiKnQKjO12izR3OzlUUMmfvcL0KG4nk2Afvex+H1NR2nxcoeEnYNWeRV5/Zad1y
         1Rgkq9BEk5pCZxzjWcIqj7HjozmK5iRFTNqaXxXJm8r3Kx6l48B5RowF0ub7eY1h0AbN
         UyJeVgxs/eE2ps+Cu5zD1V/X3AMAIYifE5ifajj4fU8EM9IgCy7AEXUfUaRyIOWUTINa
         C8fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730112373; x=1730717173;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CHj4nYgiHaKiW5aEYPKVHro023TFgtEOxg1MzyObDrg=;
        b=BmS82MBzHq4xUAHuJndvOkd+bwyfuyMeVwds0s2me/DlO/00F6Ig18Y8I5Z9ggxAQv
         up+e51S9fJ9SlDaMqr3Dj+J3XkrLS+55iVVF75VFLE47LCsk5UBaeSw/cLH+qQOdDYbd
         EcRpbEHZp0ByqmqL4UerNsnvA7YcqzrIV7l+RIgxgEqOriYrM1TH6XoNw4Qqc3ujw2WU
         lb0MoouMMI1u/pRaoYTX09cx+w44U361KKom1370nG15E1i2JpQb9YkyKaOfeRbXljY+
         K3rOD5gS36S29iWKLDBWEDug1UzIWeopZ8VVCZ0hImzpEiEwCQxUa3py8are8rrH5W2y
         l6IQ==
X-Forwarded-Encrypted: i=1; AJvYcCUWwHb1PEjxHsrbhicVTg2QtbN1YJ7frROg7TaQ/xsT5LRT98LF1XOsIGaIqjxjsI722Xsa0hDOv3wXfcqV@vger.kernel.org
X-Gm-Message-State: AOJu0YwV3PLae65aAVj9aF/tabfBnFh+sMx1pyQVEBDoqSiIr7AqJJkS
	sbDggECJoR2/NXXfItlzmvdy0QgQZJ2NA6IHxOrl/zcQFxY7gPMajHNzwcDcOIRjiJTa2klgBbF
	V
X-Google-Smtp-Source: AGHT+IHmdmeAg2Am8DAe8AvOhZdn+dyWxgaURYqcx9xeJb14r6Mw3+xvZqYxW/k7eyS8xGuqbReo7g==
X-Received: by 2002:a19:6a12:0:b0:539:fd75:2b6c with SMTP id 2adb3069b0e04-53b2375231dmr3431313e87.21.1730112372556;
        Mon, 28 Oct 2024 03:46:12 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53b2e1cbe9dsm1053140e87.225.2024.10.28.03.46.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2024 03:46:12 -0700 (PDT)
Date: Mon, 28 Oct 2024 12:46:10 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 2/9] drm/msm/dpu: move pstate->pipe initialization to
 dpu_plane_atomic_check
Message-ID: <jk4tfzg3zw4g23pg7rpre2pn32h6h46u2rc5ydnzuwo7mk3mam@ybw64lkaidyb>
References: <20241025-dpu-virtual-wide-v6-0-0310fd519765@linaro.org>
 <20241025-dpu-virtual-wide-v6-2-0310fd519765@linaro.org>
 <1dcf786e-463f-4e51-af71-66ee6077b5f1@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1dcf786e-463f-4e51-af71-66ee6077b5f1@quicinc.com>

On Fri, Oct 25, 2024 at 12:00:20PM -0700, Abhinav Kumar wrote:
> 
> 
> On 10/24/2024 5:20 PM, Dmitry Baryshkov wrote:
> > In preparation for virtualized planes support, move pstate->pipe
> > initialization from dpu_plane_reset() to dpu_plane_atomic_check(). In
> > case of virtual planes the plane's pipe will not be known up to the
> > point of atomic_check() callback.
> > 
> 
> I had R-bed this in v5. Did anything change in v6?

No, nothing. I'm sorry for forgetting to run `b4 trailers -u`.

> But one comment below.
> 
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 25 +++++++++++--------------
> >   1 file changed, 11 insertions(+), 14 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> > index 37faf5b238b0..725c9a5826fd 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> > @@ -797,13 +797,22 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
> >   	uint32_t max_linewidth;
> >   	unsigned int rotation;
> >   	uint32_t supported_rotations;
> > -	const struct dpu_sspp_cfg *pipe_hw_caps = pstate->pipe.sspp->cap;
> > -	const struct dpu_sspp_sub_blks *sblk = pstate->pipe.sspp->cap->sblk;
> > +	const struct dpu_sspp_cfg *pipe_hw_caps;
> > +	const struct dpu_sspp_sub_blks *sblk;
> >   	if (new_plane_state->crtc)
> >   		crtc_state = drm_atomic_get_new_crtc_state(state,
> >   							   new_plane_state->crtc);
> > +	pipe->sspp = dpu_rm_get_sspp(&kms->rm, pdpu->pipe);
> > +	r_pipe->sspp = NULL;
> > +
> > +	if (!pipe->sspp)
> > +		return -EINVAL;
> > +
> > +	pipe_hw_caps = pipe->sspp->cap;
> > +	sblk = pipe->sspp->cap->sblk;
> > +
> >   	min_scale = FRAC_16_16(1, sblk->maxupscale);
> >   	ret = drm_atomic_helper_check_plane_state(new_plane_state, crtc_state,
> >   						  min_scale,
> 
> Do you think it will be better to move the get_sspp() call after the
> drm_atomic_helper_check_plane_state()?

I'd say, it makes no difference. I'll check your suggestion if I have to
send another iteration.

> 
> > @@ -820,7 +829,6 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
> >   	pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
> >   	r_pipe->multirect_index = DPU_SSPP_RECT_SOLO;
> >   	r_pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
> > -	r_pipe->sspp = NULL;
> >   	pstate->stage = DPU_STAGE_0 + pstate->base.normalized_zpos;
> >   	if (pstate->stage >= pdpu->catalog->caps->max_mixer_blendstages) {
> > @@ -1286,7 +1294,6 @@ static void dpu_plane_reset(struct drm_plane *plane)
> >   {
> >   	struct dpu_plane *pdpu;
> >   	struct dpu_plane_state *pstate;
> > -	struct dpu_kms *dpu_kms = _dpu_plane_get_kms(plane);
> >   	if (!plane) {
> >   		DPU_ERROR("invalid plane\n");
> > @@ -1308,16 +1315,6 @@ static void dpu_plane_reset(struct drm_plane *plane)
> >   		return;
> >   	}
> > -	/*
> > -	 * Set the SSPP here until we have proper virtualized DPU planes.
> > -	 * This is the place where the state is allocated, so fill it fully.
> > -	 */
> > -	pstate->pipe.sspp = dpu_rm_get_sspp(&dpu_kms->rm, pdpu->pipe);
> > -	pstate->pipe.multirect_index = DPU_SSPP_RECT_SOLO;
> > -	pstate->pipe.multirect_mode = DPU_SSPP_MULTIRECT_NONE;
> > -
> > -	pstate->r_pipe.sspp = NULL;
> > -
> >   	__drm_atomic_helper_plane_reset(plane, &pstate->base);
> >   }
> > 

-- 
With best wishes
Dmitry

