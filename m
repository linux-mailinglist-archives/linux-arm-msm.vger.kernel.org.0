Return-Path: <linux-arm-msm+bounces-44501-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EA49A06CE2
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jan 2025 05:24:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id ED2CC7A236C
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jan 2025 04:24:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58A201547CC;
	Thu,  9 Jan 2025 04:24:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nAwir3Rk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 535932D052
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Jan 2025 04:24:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736396665; cv=none; b=O9Kiw3WaZhHcJUxJAaXIHZV8FZHXSmr5UbX5Mkhi/kzWS4xNfPGQIbgWBh3KxRLmAIvVfNrhRqOqcFvk980eEMqyspW27THP1JtZbIBXPaN/8hx/PUY43tRlf3thi2yyWUmSfI4Lz8rOjXpJxtDOps6oUodCLRDC7lPc8IK2QHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736396665; c=relaxed/simple;
	bh=5fcisnDbKzXR2Egvj3B6ZYgL/vuEmDgnRQekju1VirQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pdkG820OtHYpGmzgzYDXHX46RU/870jxZ/br3ACy5+V6VgEKFHVzgb/CMQ0LLX/FF4e5lWdKllv1a4aYCZdqG0rZS5YyeWv0aH0y4Ac7rCsT5L3442OaG9oStt0D3qZGYurT7nT+2vbZo+vz4KNhcyyOfFqHg5YvT7EgSd4VjWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nAwir3Rk; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5401fb9fa03so404526e87.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jan 2025 20:24:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736396661; x=1737001461; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RI105FXbZ+6c9MUX+ILr2CPbzR00w0PPtPZAHqBYykY=;
        b=nAwir3RkzIGKy4Zq59Ap1ZBhldA7D1c5M/80UXAzMEvWS6Rr8anaPb9PpGNKQqXqWX
         9Mh+WrHGLTN1DVheZbqt9D8/4rBKg/OsaQ4Qn+nVvbYnJ5ifchFiBot8q/zr0XVPNNX7
         MDRt5n7WKsuoNhKts2e/1HbpLY1o+qxYdDRhT5m4Af9T1u/lQAuKMZ9Ct7ZhQnC4kOIU
         r4VuUNmARD+KBg6D1Fwhn6nRQOKWEMPj17ZQQKcs6GII3goYcjFenk4PKDo0SFlU53AI
         EQn81NULbaupitFUUV5Ij+oZq0ATQjun5oIh99eY4O3y/bSshvzCfwCj6qd36dAZWgXj
         Y8rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736396661; x=1737001461;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RI105FXbZ+6c9MUX+ILr2CPbzR00w0PPtPZAHqBYykY=;
        b=YHUIt59Dn3AjRZ/algufc8AmOurT4auPas0pjfN3br7PDQiCtUp7c6WALni2a3zLk0
         2EHI9+6XI+suC95O05sQmIcOxVhib+vmVvIpeXoKwVd/2/8v4UwFDa5h+Nbo6p+V+kVA
         kq+c7GanG+giKrDigu/JM2l2WfisA8bNCnua3UqQH4Zap/t5xjkWIytBnWBIoKxiRoq9
         gYMUW7k74vMPbR0jjXH33EkmA0ROmVa37tnsFkVgUyHPP9Mdx7i0wR6Qjh9wTvva1QQC
         PkaJyV82f2TBlTVuoKNDbXJYA2hFwvhRPo8Cwej1QFKcsEgcSSu5CxjgDH7ISbR1WzlN
         08IA==
X-Forwarded-Encrypted: i=1; AJvYcCW6mmCmkr+rPccFRgdTkz+5kSUd2RY9vmdgl6ZAJYUi+qdepZC7Gd3u92peUq7XDA51rkRYD5O6rEkpHunM@vger.kernel.org
X-Gm-Message-State: AOJu0YxVegEwQUcg1xyCrG8wR0Sc6lsmq0gtgl+CuvnmcNgMuqlBtWuO
	+/AvA4jpwkHB0xGNkcqc51v8Q6Frk1bYHb1gtAvIoLlTlm8NQRUKD66k4PWqJPE=
X-Gm-Gg: ASbGncuUMP/0NSm7cyntkGBKBLiBxpwP2tvTa0xxzVfjeIYlfqTIePdPcm6LB35DLZb
	XIbkFFQ+8Ea3TDIm8cHM56tD7+MFAenTTXT1Y9Co0n/tzH0Q/Q9w4kKWOdYiuF/PrGUOj2YNvxo
	uq4GYxtNnGph+PQ0h+EkFbu1rFsfevQA9Qt4E8BCuURHhnxjL/T7ghCuWHxycb7aE+xvBBlZDu/
	KS7f3AA0ZuX+HjBE6GTYnT3ZOL+21MyFDdaHkzXnIpFVhRgOQIOpJr4mbAWK9jGfU05dWN/ytrv
	SWEBJZFTMqq2yyYT4eRc7phZVPf42FZeyTMw
X-Google-Smtp-Source: AGHT+IHEZuHRIaKqakNLtv5UXX2C9mvMRn31Oci3NY2kR1ylrkyMAvDePp+/dCdXLT4ozAK/6FWpMw==
X-Received: by 2002:ac2:4c4a:0:b0:542:7f34:4df8 with SMTP id 2adb3069b0e04-5428c1cfe56mr228114e87.2.1736396661334;
        Wed, 08 Jan 2025 20:24:21 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5428be4a029sm71282e87.54.2025.01.08.20.24.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jan 2025 20:24:20 -0800 (PST)
Date: Thu, 9 Jan 2025 06:24:17 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Clark <robdclark@gmail.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	Chandan Uddaraju <chandanu@codeaurora.org>, Jeykumar Sankaran <jsanka@codeaurora.org>, 
	Jordan Crouse <jordan@cosmicpenguin.net>, Sravanthi Kollukuduru <skolluku@codeaurora.org>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	Archit Taneja <architt@codeaurora.org>, Rajesh Yadav <ryadav@codeaurora.org>, 
	linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, 
	Simona Vetter <simona.vetter@ffwll.ch>
Subject: Re: [PATCH 6/6] drm/msm/dpu: don't set crtc_state->mode_changed from
 atomic_check()
Message-ID: <ag7drc3bwzlmktbknoo2gzulaziva2mj7d2ze4wc26ng23336k@f5o6ue2skit5>
References: <20241222-drm-dirty-modeset-v1-0-0e76a53eceb9@linaro.org>
 <20241222-drm-dirty-modeset-v1-6-0e76a53eceb9@linaro.org>
 <91dff265-5e13-45db-b46d-0eef4a95f5f6@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <91dff265-5e13-45db-b46d-0eef4a95f5f6@quicinc.com>

On Wed, Jan 08, 2025 at 06:27:13PM -0800, Abhinav Kumar wrote:
> 
> 
> On 12/21/2024 9:00 PM, Dmitry Baryshkov wrote:
> > The MSM driver uses drm_atomic_helper_check() which mandates that none
> > of the atomic_check() callbacks toggles crtc_state->mode_changed.
> > Perform corresponding check before calling the drm_atomic_helper_check()
> > function.
> > 
> > Fixes: 8b45a26f2ba9 ("drm/msm/dpu: reserve cdm blocks for writeback in case of YUV output")
> > Reported-by: Simona Vetter <simona.vetter@ffwll.ch>
> > Closes: https://lore.kernel.org/dri-devel/ZtW_S0j5AEr4g0QW@phenom.ffwll.local/
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 32 +++++++++++++++++++++++++----
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h |  4 ++++
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c     | 26 +++++++++++++++++++++++
> >   drivers/gpu/drm/msm/msm_atomic.c            | 13 +++++++++++-
> >   drivers/gpu/drm/msm/msm_kms.h               |  7 +++++++
> >   5 files changed, 77 insertions(+), 5 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> > index 209e6fb605b2d8724935b62001032e7d39540366..b7c3aa8d0e2ca58091deacdeaccb0819d2bf045c 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> > @@ -753,6 +753,34 @@ static void dpu_encoder_assign_crtc_resources(struct dpu_kms *dpu_kms,
> >   	cstate->num_mixers = num_lm;
> >   }
> > +/**
> > + * dpu_encoder_virt_check_mode_changed: check if full modeset is required
> > + * @drm_enc:    Pointer to drm encoder structure
> > + * @crtc_state:	Corresponding CRTC state to be checked
> > + * @conn_state: Corresponding Connector's state to be checked
> > + *
> > + * Check if the changes in the object properties demand full mode set.
> > + */
> > +int dpu_encoder_virt_check_mode_changed(struct drm_encoder *drm_enc,
> > +					struct drm_crtc_state *crtc_state,
> > +					struct drm_connector_state *conn_state)
> > +{
> > +	struct dpu_encoder_virt *dpu_enc = to_dpu_encoder_virt(drm_enc);
> > +	struct msm_display_topology topology;
> > +
> > +	DPU_DEBUG_ENC(dpu_enc, "\n");
> > +
> > +	/* Using mode instead of adjusted_mode as it wasn't computed yet */
> > +	topology = dpu_encoder_get_topology(dpu_enc, &crtc_state->mode, crtc_state, conn_state);
> > +
> > +	if (topology.needs_cdm && !dpu_enc->cur_master->hw_cdm)
> > +		crtc_state->mode_changed = true;
> > +	else if (!topology.needs_cdm && dpu_enc->cur_master->hw_cdm)
> > +		crtc_state->mode_changed = true;
> > +
> > +	return 0;
> > +}
> 
> How will this work exactly?
> 
> needs_cdm is set in the encoder's atomic_check which is called inside
> drm_atomic_helper_check(). But this function is called before that.
> 
> So needs_cdm will never hit.
> 

Please refer to the previous patch, it should answer your question.

> 
> > +
> >   static int dpu_encoder_virt_atomic_check(
> >   		struct drm_encoder *drm_enc,
> >   		struct drm_crtc_state *crtc_state,
> > @@ -786,10 +814,6 @@ static int dpu_encoder_virt_atomic_check(
> >   	topology = dpu_encoder_get_topology(dpu_enc, adj_mode, crtc_state, conn_state);
> > -	if (topology.needs_cdm && !dpu_enc->cur_master->hw_cdm)
> > -		crtc_state->mode_changed = true;
> > -	else if (!topology.needs_cdm && dpu_enc->cur_master->hw_cdm)
> > -		crtc_state->mode_changed = true;
> >   	/*
> >   	 * Release and Allocate resources on every modeset
> >   	 */

-- 
With best wishes
Dmitry

