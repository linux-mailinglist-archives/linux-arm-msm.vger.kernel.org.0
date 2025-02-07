Return-Path: <linux-arm-msm+bounces-47067-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 52FC1A2B7A8
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Feb 2025 02:13:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CC4901887F05
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Feb 2025 01:13:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 344027EF09;
	Fri,  7 Feb 2025 01:13:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EAdwoC4q"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B693200CD
	for <linux-arm-msm@vger.kernel.org>; Fri,  7 Feb 2025 01:13:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738890799; cv=none; b=bZvYgFnpaFB/wIODEif3Ryf7ogWZxGNrLLAVqkTdAAreHBdJCAVjQst5KVg8jftVjR3z+Z8v8UDfaAVTB4rlvtI2nN7xY0aL3YFDmGvcVaRsKQHFQ92nEkEkWGF+6fDLV8lLLpB09YyVUUcI/SNOYTE7lTNuOBdk0VRfsMmshjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738890799; c=relaxed/simple;
	bh=ucaP57Z4CG/wLty2S2lG0pABPKr1uFpZFwzJgcqJ4yY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nO64wrqDaT6bgIG0O9HG3NGDL0D2BPOJnTLnQYHVP0QbH6CvChwNsMkkkPU7uqMBPpHa3EfAKNx+284YdR4ZDUvdPX5bSCE6mhhBz49lyljD7Ssm6WtBKDKkmcSfQnRJazi6LrmghpSb8UnXBfBwAlHlzMnQjTzkx3uV142hguw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EAdwoC4q; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-53f22fd6887so1724813e87.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Feb 2025 17:13:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738890793; x=1739495593; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=mD8MU9ia7DeQdTywSD1JdEVbwh8ZTx//S8otRz+v9E0=;
        b=EAdwoC4qPOtNtDy6LNw9zESrGNzbpAEnoLpThfU3aJCOpbscC9jGoY2aY+s6Clfx/h
         C3mEPXI8yvV7biiDQ0rpx64bKP98YklHr5KFILNQ9i5tr87qfMBD7/TFOxZ6TKuusvly
         KdzM0/4oKI+YiwmdWHvMlaDofInRF9ZPD6KmNL+cUY6+vNjyd4+mjLGqTbTYHAf4Esyp
         3VqQQU8cNKeaequMlZww5YG5rwkv6Kp0BYcU31blZatf+DkpMZevOObgqlqJ3+i+k/S4
         00+zEvCUJLbdua3PFAsYCPxlV0M+VeNhr4SUg58g2JbWXP79yklsv1SDIQfSfbI6lCJo
         QFvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738890793; x=1739495593;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mD8MU9ia7DeQdTywSD1JdEVbwh8ZTx//S8otRz+v9E0=;
        b=PoZ/2tXiiDoEjI+UpFzGLsvMISzOhBL7jsjeR4QuOqcahBfIZweBHPiMeHGm/zhWA6
         9tITHp7B3CuPTNH5CBCCIK6F+8K/arb3v12KZ2JNYO9r5Dp5QNwG0TrioKwRNpTlgNyj
         NjLIWyLS4NmwSZ5faBb+DpbKZSevv0DVIRWvNKKcT+G7dYvaHBWp85m3kLzj+ll2uw/A
         fxKLFLlYB7YD7HukqQ43G3AOfCnfvDdlUB9R1H662ZY/qByjyppcI/WnIbrQ3xfs3rI4
         bBkZ42w8dpTsWYipGskdsIZzqdODfI+Tu6zViCOvohGtNRA3sqRBcExcFRDNdXNZJqAu
         3LiA==
X-Forwarded-Encrypted: i=1; AJvYcCWFUtwlZWelmzd8fD+VSIfAkrr0zUL7JLXWyMPxIgqjkGkHgsZY7aKW1fY3YU+QpIYhmVZvxrqwk8spzDrY@vger.kernel.org
X-Gm-Message-State: AOJu0YwwdggXCwUkwh/XcSbQ78DSlo4qYPNHbbfCnJxI9XWKfkJlyJbw
	Kq0pvr7g04QP2Ef1juLFrwUHVYn3XrL0wLheqTyRj9NnIbgBJ+kQpS2cgWnjRMs=
X-Gm-Gg: ASbGncuV8VtdY1jAk9dNpwmBAgNpZzP1H7ApvR+fu6sOqJUsYw3KIDWfIK4TauKFGDn
	KVKzbkLVjS+dIaxfbepNyYhMEs+HMosKF988rT0ztZHB8/9pu6KFv0p6umkXz8e7bzv89/ltgmM
	he+ioIKvdtD6UcTHPLBSDtdXtUk1uI7+AxsAK75g2Z+a8TzP5URtnZ6fFs48OrpaBC2EEgowo34
	6aDGKuyQtTsWfbm6U+Zz+HIadJAby6MOV+LN3NO5jfGXzYoDFbYGlwKFXelX1gM6X5sjW2oBPr/
	E17VTZZlMcaIMBT9h2FtE990tyO1IpgUM99qOzjtIQCaMQ+lx1Wa1VB6AWaYUHZdivveoAs=
X-Google-Smtp-Source: AGHT+IHYSIRsZahPUyPRN1+iXP2PIJf6L3Nw7RCM9yJa976O/YLBqbJ7cTIOY78DUwa2dGHV/JS28Q==
X-Received: by 2002:a05:6512:a8f:b0:544:12df:8726 with SMTP id 2adb3069b0e04-54414ab6a8bmr261997e87.22.1738890793184;
        Thu, 06 Feb 2025 17:13:13 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-544105e5bc8sm284054e87.166.2025.02.06.17.13.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2025 17:13:11 -0800 (PST)
Date: Fri, 7 Feb 2025 03:13:09 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, quic_abhinavk@quicinc.com, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Simona Vetter <simona@ffwll.ch>, Simona Vetter <simona.vetter@ffwll.ch>, 
	quic_ebharadw@quicinc.com, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, Rob Clark <robdclark@chromium.org>, 
	Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH v5 02/14] drm/msm/dpu: move resource allocation to CRTC
Message-ID: <e3lws3vo5x5folczeb2ygscgrnv5jejuaayjzon47ir6kpbhnn@pglvman2jugg>
References: <20250128-concurrent-wb-v5-0-6464ca5360df@quicinc.com>
 <20250128-concurrent-wb-v5-2-6464ca5360df@quicinc.com>
 <34zk3jbcjlbux7737t2ve3xcwbt2uxsalbqih6os4ykqeklyfa@phy4izanhn3d>
 <16986655-0c51-49ac-8088-6548317be7e6@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <16986655-0c51-49ac-8088-6548317be7e6@quicinc.com>

On Thu, Feb 06, 2025 at 03:49:53PM -0800, Jessica Zhang wrote:
> 
> 
> On 1/29/2025 2:04 PM, Dmitry Baryshkov wrote:
> > On Tue, Jan 28, 2025 at 07:20:34PM -0800, Jessica Zhang wrote:
> > > From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > 
> > > All resource allocation is centered around the LMs. Then other blocks
> > > (except DSCs) are allocated basing on the LMs that was selected, and LM
> > > powers up the CRTC rather than the encoder.
> > > 
> > > Moreover if at some point the driver supports encoder cloning,
> > > allocating resources from the encoder will be incorrect, as all clones
> > > will have different encoder IDs, while LMs are to be shared by these
> > > encoders.
> > > 
> > > In addition, move mode_changed() to dpu_crtc as encoder no longer has
> > > access to topology information
> > > 
> > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > [quic_abhinavk@quicinc.com: Refactored resource allocation for CDM]
> > > Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> > > [quic_jesszhan@quicinc.com: Changed to grabbing exising global state]
> > > Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> > > 
> > > ---
> > > Changes in v5:
> > > - Reordered to prevent breaking CI and upon partial applciation
> > > - Moved mode_changed() from dpu_encoder to dpu_crtc
> > > - Dropped dpu_encoder_needs_dsc_merge() refactor to clean up commit
> > > - In dpu_encoder_update_topology(), grab DSC config using dpu_encoder
> > >    helper as dpu_encoder->dsc hasn't been set yet
> > > ---
> > >   drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c    |  79 +++++++++++++
> > >   drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h    |   2 +
> > >   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 174 +++++++++-------------------
> > >   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h |  11 +-
> > >   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c     |  19 +--
> > >   5 files changed, 144 insertions(+), 141 deletions(-)
> > > 
> > 
> > > -/**
> > > - * dpu_encoder_virt_check_mode_changed: check if full modeset is required
> > > - * @drm_enc:    Pointer to drm encoder structure
> > > - * @crtc_state:	Corresponding CRTC state to be checked
> > > - * @conn_state: Corresponding Connector's state to be checked
> > > - *
> > > - * Check if the changes in the object properties demand full mode set.
> > > - */
> > > -int dpu_encoder_virt_check_mode_changed(struct drm_encoder *drm_enc,
> > > -					struct drm_crtc_state *crtc_state,
> > > -					struct drm_connector_state *conn_state)
> > > +bool dpu_encoder_needs_modeset(struct drm_encoder *drm_enc, struct drm_atomic_state *state)
> > >   {
> > > +	struct drm_connector *connector;
> > > +	struct drm_connector_state *conn_state;
> > > +	struct drm_framebuffer *fb;
> > >   	struct dpu_encoder_virt *dpu_enc = to_dpu_encoder_virt(drm_enc);
> > > -	struct msm_display_topology topology;
> > > -
> > > -	DPU_DEBUG_ENC(dpu_enc, "\n");
> > > -
> > > -	/* Using mode instead of adjusted_mode as it wasn't computed yet */
> > > -	topology = dpu_encoder_get_topology(dpu_enc, &crtc_state->mode, crtc_state, conn_state);
> > > -
> > > -	if (topology.needs_cdm && !dpu_enc->cur_master->hw_cdm)
> > > -		crtc_state->mode_changed = true;
> > > -	else if (!topology.needs_cdm && dpu_enc->cur_master->hw_cdm)
> > > -		crtc_state->mode_changed = true;
> > > -
> > > -	return 0;
> > > -}
> > > -
> > > -static int dpu_encoder_virt_atomic_check(
> > > -		struct drm_encoder *drm_enc,
> > > -		struct drm_crtc_state *crtc_state,
> > > -		struct drm_connector_state *conn_state)
> > > -{
> > > -	struct dpu_encoder_virt *dpu_enc;
> > > -	struct msm_drm_private *priv;
> > > -	struct dpu_kms *dpu_kms;
> > > -	struct drm_display_mode *adj_mode;
> > > -	struct msm_display_topology topology;
> > > -	struct dpu_global_state *global_state;
> > > -	int ret = 0;
> > > -
> > > -	if (!drm_enc || !crtc_state || !conn_state) {
> > > -		DPU_ERROR("invalid arg(s), drm_enc %d, crtc/conn state %d/%d\n",
> > > -				drm_enc != NULL, crtc_state != NULL, conn_state != NULL);
> > > -		return -EINVAL;
> > > -	}
> > > -
> > > -	dpu_enc = to_dpu_encoder_virt(drm_enc);
> > > -	DPU_DEBUG_ENC(dpu_enc, "\n");
> > > -
> > > -	priv = drm_enc->dev->dev_private;
> > > -	dpu_kms = to_dpu_kms(priv->kms);
> > > -	adj_mode = &crtc_state->adjusted_mode;
> > > -	global_state = dpu_kms_get_global_state(crtc_state->state);
> > > -	if (IS_ERR(global_state))
> > > -		return PTR_ERR(global_state);
> > > -	trace_dpu_enc_atomic_check(DRMID(drm_enc));
> > > +	if (!drm_enc || !state)
> > > +		return false;
> > > -	topology = dpu_encoder_get_topology(dpu_enc, adj_mode, crtc_state, conn_state);
> > > +	connector = drm_atomic_get_new_connector_for_encoder(state, drm_enc);
> > > +	if (!connector)
> > > +		return false;
> > > -	/*
> > > -	 * Release and Allocate resources on every modeset
> > > -	 */
> > > -	if (drm_atomic_crtc_needs_modeset(crtc_state)) {
> > > -		dpu_rm_release(global_state, drm_enc);
> > > +	conn_state = drm_atomic_get_new_connector_state(state, connector);
> > > -		if (crtc_state->enable)
> > > -			ret = dpu_rm_reserve(&dpu_kms->rm, global_state,
> > > -					drm_enc, crtc_state, &topology);
> > > +	if (dpu_enc->disp_info.intf_type == INTF_WB && conn_state->writeback_job) {
> > > +		fb = conn_state->writeback_job->fb;
> > > +		if (fb && MSM_FORMAT_IS_YUV(msm_framebuffer_format(fb))) {
> > > +			if (!dpu_enc->cur_master->hw_cdm)
> > > +				return true;
> > > +		} else {
> > > +			if (dpu_enc->cur_master->hw_cdm)
> > > +				return true;
> > > +		}
> > 
> > Nit: this is duplicating a part of the dpu_encoder_update_topology(). It
> > would be nice to have a comment here. If there is no need for a new
> > versoion, I can probably write something when applying.
> 
> Sure, I can add a note that we need to duplicate these checks in
> *_needs_modeset() since topology info is not stored in the encoder or crtc

Yes, please. I was thinking about having a helper function, but I don't
think that it makes real sense.


-- 
With best wishes
Dmitry

