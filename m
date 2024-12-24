Return-Path: <linux-arm-msm+bounces-43183-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C1D29FB961
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Dec 2024 06:02:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A7FCC1883AFA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Dec 2024 05:02:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 464CF219FF;
	Tue, 24 Dec 2024 05:02:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="W/1JkY88"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 859178F5C
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Dec 2024 05:02:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735016539; cv=none; b=ZG6w58/LmlLJCRG4JNW4++XTPxFO4bskIPM1b15+JG3t2a2a/HoCIrC4ANp6fl4P9zAv/eozvYEZBR5krZ+1ZCYTeMfbkeKqq7fN+ew0eNO+U3qHnOGFFr3X4hm/0jxAORlfemsuMWn6ep2yEicYh1IP8tElNxtd4oqxuvpYZgc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735016539; c=relaxed/simple;
	bh=0jeUP7ArH+U/medgZfLZptj4SxbINPfSwmQAvSAUpQw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g371xXh7OQVxLqdeM/cx6bR3u+rSjtTs1YKJNdja7H9OMc4j49kaJdZr4tdD1owRrS71vxGQJ8klIIOW5DkME5dCuOQ7q1oAy/zTqw1fBx7m5HhmmymXLu95qBlDy/LyjwUeBLdhdxgcKqmQCxATESZjQNk+FFTW8FJYmZyKUgs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=W/1JkY88; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5401ab97206so4971206e87.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Dec 2024 21:02:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735016535; x=1735621335; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hqUplIjV+TQuDOCxd/dA3VUIf/gZpdRIKkbJK+V73kk=;
        b=W/1JkY88MMoiz7VcRc2jo4obdPvUHFNWfbrUNSrdAmbjltRTZE+gpNs8aMxIdzjCd+
         hTgBKzqTiE/yppGbKbWgG2CwFjkXsdwUBuQBJr3I5aHJjBV/Pw5FuwDmWB1c/qyUG/Ab
         HLtiT4gyRsmoBMTswHvKsONZSbBRunft0eZVZ9K2lwfLqDhiS5Kbnv3ByzGHjLLXkZJR
         083i+pw1rg6ek3q9nyCsngrqLOIevoWD789Y9npPqHWgo3OCQSJB8G8J6Ry/HeMbffR3
         LebmmQQY1lrkYS5uEa/lo+04gH059kKH2W1+niitLXghZXndbMoS4r3LU9NA5/END+Ch
         qqag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735016535; x=1735621335;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hqUplIjV+TQuDOCxd/dA3VUIf/gZpdRIKkbJK+V73kk=;
        b=K9+RAWLU2AUCrKJlLvthO4h4zQd8W1OgDHgitgdTBfKczti5CFZFHSwvyjntqxYYJB
         uSBR98PdfhhU4Yob7xGb5UT3DbjbB3CSKC5We2CFHBHcCWYak2La3ngq0MYinxk2o5i5
         83SKH7Xwz3XoOCaIIa7P2lvC3JJ9YbR7znHbOITRtrB74CV5bWkv40dMKBHBmv930rdI
         JSFVSfeWd1hn1rqL4RvDH5vgORPZ/aBRuPXZ2t1vqFDbA/OvAypf4N5tZQTfZFFSL3cM
         pW7ucARU7r7Egc2ogFB4w1AkR0sFfurOSRh9pSgyLWO53uteq2A+R99vtZnckjQOwuOE
         Fe9g==
X-Forwarded-Encrypted: i=1; AJvYcCW6mCIEFXypBCJqxTC8oR7D/Y+Tih1tIL/uqJCrXxgvpVQ/qs4s4W6ILRsQlX16ytE74e3s7FdIvLdUiZaX@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9qub2PkCj0GOkaNK8aPpg2kKn/ihop7CL6Iwcrmi30Auv30c5
	RwyNdnxC2qjY9QIfUSwHVKuWsmCARmXtTVmc660wQq37Jo0UL5OYeIrcjn7sYfg=
X-Gm-Gg: ASbGncs3+u7FQUzy/vKSIPi54iQ0HZSVQjZ4rKX1CcLcj/ICKe4gcX5eaN+X7R5rMmw
	Mz2yRo/aJKJ5rRqVwZZ0qvyJdUzrF+yYy/3axPCqcYpsFWr/yavAnQY+vLfq7tzrRGGe5498APY
	hE2AQ7KisHDz4z4k/lgTHmNr4cnjPBnfbskFyuQRQgZpd+uLEgafXmUUgJNApsSlSS755K2E9lx
	fPDXd4ukF5Qe92kG1Tx9m7ndAQR9icCc9txkJlrYM5uE0JZpEoJ68CpR6gXc/Q5arq8hRpyREUH
	D+xou3QOH4MHnHeC7LByfT5IihZjzoYPZPty
X-Google-Smtp-Source: AGHT+IHfZEYnMGS/7Hwur+um5VWcx75oAzisP8vBOaDbrUzOJjcORdmzgFv+PXWI59XIt6+NQBUEKg==
X-Received: by 2002:a05:6512:3d10:b0:53e:350a:72a0 with SMTP id 2adb3069b0e04-54229598a27mr5159963e87.51.1735016534496;
        Mon, 23 Dec 2024 21:02:14 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-542235f66bdsm1478626e87.16.2024.12.23.21.02.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Dec 2024 21:02:13 -0800 (PST)
Date: Tue, 24 Dec 2024 07:02:10 +0200
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
Subject: Re: [PATCH v4 07/25] drm/msm/dpu: move resource allocation to CRTC
Message-ID: <bvaxcfku5lwldww6qcwfe4ukv2xxd2ivaidvewylofgltba2rv@jx65h5ems67g>
References: <20241216-concurrent-wb-v4-0-fe220297a7f0@quicinc.com>
 <20241216-concurrent-wb-v4-7-fe220297a7f0@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241216-concurrent-wb-v4-7-fe220297a7f0@quicinc.com>

On Mon, Dec 16, 2024 at 04:43:18PM -0800, Jessica Zhang wrote:
> From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 
> All resource allocation is centered around the LMs. Then other blocks
> (except DSCs) are allocated basing on the LMs that was selected, and LM
> powers up the CRTC rather than the encoder.
> 
> Moreover if at some point the driver supports encoder cloning,
> allocating resources from the encoder will be incorrect, as all clones
> will have different encoder IDs, while LMs are to be shared by these
> encoders.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> [quic_abhinavk@quicinc.com: Refactored resource allocation for CDM]
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> [quic_jesszhan@quicinc.com: Changed to grabbing exising global state]
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c    |  86 ++++++++++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 256 ++++++++++------------------
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h |   8 +
>  3 files changed, 181 insertions(+), 169 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> index 9f6ffd344693ecfb633095772a31ada5613345dc..186ed84f59f16997716fe216e635b8dce07a63a1 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> @@ -1182,6 +1182,78 @@ static bool dpu_crtc_needs_dirtyfb(struct drm_crtc_state *cstate)
>  	return false;
>  }
>  
> +#define MAX_HDISPLAY_SPLIT 1080
> +
> +static struct msm_display_topology dpu_crtc_get_topology(
> +		struct drm_crtc *crtc,
> +		struct dpu_kms *dpu_kms,
> +		struct drm_crtc_state *crtc_state)
> +{
> +	struct drm_display_mode *mode = &crtc_state->adjusted_mode;
> +	struct msm_display_topology topology = {0};
> +	struct drm_encoder *drm_enc;
> +
> +	drm_for_each_encoder_mask(drm_enc, crtc->dev, crtc_state->encoder_mask)
> +		dpu_encoder_update_topology(drm_enc, &topology, crtc_state->state,
> +					    &crtc_state->adjusted_mode);
> +
> +	/*
> +	 * Datapath topology selection
> +	 *
> +	 * Dual display
> +	 * 2 LM, 2 INTF ( Split display using 2 interfaces)
> +	 *
> +	 * Single display
> +	 * 1 LM, 1 INTF
> +	 * 2 LM, 1 INTF (stream merge to support high resolution interfaces)
> +	 *
> +	 * Add dspps to the reservation requirements if ctm is requested
> +	 */
> +
> +	if (topology.num_intf == 2)
> +		topology.num_lm = 2;
> +	else if (topology.num_dsc == 2)
> +		topology.num_lm = 2;
> +	else if (dpu_kms->catalog->caps->has_3d_merge)
> +		topology.num_lm = (mode->hdisplay > MAX_HDISPLAY_SPLIT) ? 2 : 1;
> +	else
> +		topology.num_lm = 1;
> +
> +	if (crtc_state->ctm)
> +		topology.num_dspp = topology.num_lm;
> +
> +	return topology;
> +}
> +
> +static int dpu_crtc_assign_resources(struct drm_crtc *crtc, struct drm_crtc_state *crtc_state)
> +{
> +	struct dpu_kms *dpu_kms = _dpu_crtc_get_kms(crtc);
> +	struct dpu_global_state *global_state;
> +	struct msm_display_topology topology;
> +	int ret;
> +
> +	/*
> +	 * Release and Allocate resources on every modeset
> +	 * Dont allocate when enable is false.
> +	 */
> +	global_state = dpu_kms_get_existing_global_state(dpu_kms);
> +	if (IS_ERR(global_state))
> +		return PTR_ERR(global_state);
> +
> +	dpu_rm_release(global_state, crtc);
> +
> +	if (!crtc_state->enable)
> +		return 0;
> +
> +	topology = dpu_crtc_get_topology(crtc, dpu_kms, crtc_state);
> +	ret = dpu_rm_reserve(&dpu_kms->rm, global_state,
> +			     crtc, &topology);
> +	if (ret)
> +		return ret;
> +
> +	return 0;
> +}
> +
>  static int dpu_crtc_atomic_check(struct drm_crtc *crtc,
>  		struct drm_atomic_state *state)
>  {
> @@ -1193,10 +1265,24 @@ static int dpu_crtc_atomic_check(struct drm_crtc *crtc,
>  	const struct drm_plane_state *pstate;
>  	struct drm_plane *plane;
>  
> +	struct drm_encoder *drm_enc;
> +
>  	int rc = 0;
>  
>  	bool needs_dirtyfb = dpu_crtc_needs_dirtyfb(crtc_state);
>  
> +	/* there might be cases where encoder needs a modeset too */
> +	drm_for_each_encoder_mask(drm_enc, crtc->dev, crtc_state->encoder_mask) {
> +		if (dpu_encoder_needs_modeset(drm_enc, crtc_state->state))
> +			crtc_state->mode_changed = true;

I will postpone this patch for a while, pending the review of the
drm_atomic_helper_check_modeset() series

https://lore.kernel.org/dri-devel/20241222-drm-dirty-modeset-v1-0-0e76a53eceb9@linaro.org/

Not to mention that this commit looks broken, see below.

> +	}
> +
> +	if (drm_atomic_crtc_needs_modeset(crtc_state)) {
> +		rc = dpu_crtc_assign_resources(crtc, crtc_state);
> +		if (rc < 0)
> +			return rc;
> +	}
> +
>  	if (!crtc_state->enable || !drm_atomic_crtc_effectively_active(crtc_state)) {
>  		DRM_DEBUG_ATOMIC("crtc%d -> enable %d, active %d, skip atomic_check\n",
>  				crtc->base.id, crtc_state->enable,
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index e6f930dd34566d01223823de82c922668e6be300..2b999a0558b2a016644ed5d25bf54ab45c38d1d9 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -58,8 +58,6 @@
>  
>  #define IDLE_SHORT_TIMEOUT	1
>  
> -#define MAX_HDISPLAY_SPLIT 1080
> -
>  /* timeout in frames waiting for frame done */
>  #define DPU_ENCODER_FRAME_DONE_TIMEOUT_FRAMES 5
>  
> @@ -609,206 +607,127 @@ void dpu_encoder_helper_split_config(
>  	}
>  }
>  
> -/**
> - * dpu_encoder_use_dsc_merge - returns true if the encoder uses DSC merge topology.
> - * @drm_enc:    Pointer to previously created drm encoder structure
> - */
> -bool dpu_encoder_use_dsc_merge(struct drm_encoder *drm_enc)
> +void dpu_encoder_update_topology(struct drm_encoder *drm_enc,
> +				 struct msm_display_topology *topology,
> +				 struct drm_atomic_state *state,
> +				 const struct drm_display_mode *adj_mode)
>  {
>  	struct dpu_encoder_virt *dpu_enc = to_dpu_encoder_virt(drm_enc);
> -	int i, intf_count = 0, num_dsc = 0;
> +	struct drm_connector *connector;
> +	struct drm_connector_state *conn_state;
> +	struct msm_display_info *disp_info;
> +	struct drm_framebuffer *fb;
> +	struct msm_drm_private *priv;
> +	int i;
>  
>  	for (i = 0; i < MAX_PHYS_ENCODERS_PER_VIRTUAL; i++)
>  		if (dpu_enc->phys_encs[i])
> -			intf_count++;
> +			topology->num_intf++;
>  
> -	/* See dpu_encoder_get_topology, we only support 2:2:1 topology */
> +	/* We only support 2 DSC mode (with 2 LM and 1 INTF) */
>  	if (dpu_enc->dsc)
> -		num_dsc = 2;
> -
> -	return (num_dsc > 0) && (num_dsc > intf_count);
> -}
> -
> -/**
> - * dpu_encoder_get_dsc_config - get DSC config for the DPU encoder
> - *   This helper function is used by physical encoder to get DSC config
> - *   used for this encoder.
> - * @drm_enc: Pointer to encoder structure
> - */
> -struct drm_dsc_config *dpu_encoder_get_dsc_config(struct drm_encoder *drm_enc)
> -{
> -	struct msm_drm_private *priv = drm_enc->dev->dev_private;
> -	struct dpu_encoder_virt *dpu_enc = to_dpu_encoder_virt(drm_enc);
> -	int index = dpu_enc->disp_info.h_tile_instance[0];
> +		topology->num_dsc += 2;
>  
> -	if (dpu_enc->disp_info.intf_type == INTF_DSI)
> -		return msm_dsi_get_dsc_config(priv->dsi[index]);
> +	connector = drm_atomic_get_new_connector_for_encoder(state, drm_enc);
> +	if (!connector)
> +		return;
> +	conn_state = drm_atomic_get_new_connector_state(state, connector);
> +	if (!conn_state)
> +		return;
>  
> -	return NULL;
> -}
> +	disp_info = &dpu_enc->disp_info;
>  
> -static struct msm_display_topology dpu_encoder_get_topology(
> -			struct dpu_encoder_virt *dpu_enc,
> -			struct dpu_kms *dpu_kms,
> -			struct drm_display_mode *mode,
> -			struct drm_crtc_state *crtc_state,
> -			struct drm_dsc_config *dsc)
> -{
> -	struct msm_display_topology topology = {0};
> -	int i, intf_count = 0;
> +	priv = drm_enc->dev->dev_private;
>  
> -	for (i = 0; i < MAX_PHYS_ENCODERS_PER_VIRTUAL; i++)
> -		if (dpu_enc->phys_encs[i])
> -			intf_count++;
> -
> -	/* Datapath topology selection
> -	 *
> -	 * Dual display
> -	 * 2 LM, 2 INTF ( Split display using 2 interfaces)
> -	 *
> -	 * Single display
> -	 * 1 LM, 1 INTF
> -	 * 2 LM, 1 INTF (stream merge to support high resolution interfaces)
> -	 *
> -	 * Add dspps to the reservation requirements if ctm is requested
> +	/*
> +	 * Use CDM only for writeback or DP at the moment as other interfaces cannot handle it.
> +	 * If writeback itself cannot handle cdm for some reason it will fail in its atomic_check()
> +	 * earlier.
>  	 */
> -	if (intf_count == 2)
> -		topology.num_lm = 2;
> -	else if (!dpu_kms->catalog->caps->has_3d_merge)
> -		topology.num_lm = 1;
> -	else
> -		topology.num_lm = (mode->hdisplay > MAX_HDISPLAY_SPLIT) ? 2 : 1;
> -
> -	if (crtc_state->ctm)
> -		topology.num_dspp = topology.num_lm;
> -
> -	topology.num_intf = intf_count;
> +	if (disp_info->intf_type == INTF_WB && conn_state->writeback_job) {
> +		fb = conn_state->writeback_job->fb;
>  
> -	if (dsc) {
> -		/*
> -		 * In case of Display Stream Compression (DSC), we would use
> -		 * 2 DSC encoders, 2 layer mixers and 1 interface
> -		 * this is power optimal and can drive up to (including) 4k
> -		 * screens
> -		 */
> -		topology.num_dsc = 2;
> -		topology.num_lm = 2;
> -		topology.num_intf = 1;
> +		if (fb && MSM_FORMAT_IS_YUV(msm_framebuffer_format(fb)))
> +			topology->needs_cdm = true;
> +	} else if (disp_info->intf_type == INTF_DP) {
> +		if (msm_dp_is_yuv_420_enabled(priv->dp[disp_info->h_tile_instance[0]], adj_mode))
> +			topology->needs_cdm = true;
>  	}
> -
> -	return topology;
>  }
>  
> -static void dpu_encoder_assign_crtc_resources(struct dpu_kms *dpu_kms,
> -					      struct drm_encoder *drm_enc,
> -					      struct dpu_global_state *global_state,
> -					      struct drm_crtc_state *crtc_state)
> +static bool dpu_encoder_needs_dsc_merge(struct drm_encoder *drm_enc)
>  {
> -	struct dpu_crtc_state *cstate;
> -	struct dpu_hw_blk *hw_ctl[MAX_CHANNELS_PER_ENC];
> -	struct dpu_hw_blk *hw_lm[MAX_CHANNELS_PER_ENC];
> -	struct dpu_hw_blk *hw_dspp[MAX_CHANNELS_PER_ENC];
> -	int num_lm, num_ctl, num_dspp, i;
> -
> -	cstate = to_dpu_crtc_state(crtc_state);
> -
> -	memset(cstate->mixers, 0, sizeof(cstate->mixers));
> -
> -	num_ctl = dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
> -		drm_enc->crtc, DPU_HW_BLK_CTL, hw_ctl, ARRAY_SIZE(hw_ctl));
> -	num_lm = dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
> -		drm_enc->crtc, DPU_HW_BLK_LM, hw_lm, ARRAY_SIZE(hw_lm));
> -	num_dspp = dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
> -		drm_enc->crtc, DPU_HW_BLK_DSPP, hw_dspp,
> -		ARRAY_SIZE(hw_dspp));
> +	struct dpu_encoder_virt *dpu_enc = to_dpu_encoder_virt(drm_enc);
> +	u32 num_intf = 0;
> +	u32 num_dsc = 0;
> +	int i;
>  
> -	for (i = 0; i < num_lm; i++) {
> -		int ctl_idx = (i < num_ctl) ? i : (num_ctl-1);
> +	for (i = 0; i < MAX_PHYS_ENCODERS_PER_VIRTUAL; i++)
> +		if (dpu_enc->phys_encs[i])
> +			num_intf++;
>  
> -		cstate->mixers[i].hw_lm = to_dpu_hw_mixer(hw_lm[i]);
> -		cstate->mixers[i].lm_ctl = to_dpu_hw_ctl(hw_ctl[ctl_idx]);
> -		cstate->mixers[i].hw_dspp = i < num_dspp ? to_dpu_hw_dspp(hw_dspp[i]) : NULL;
> -	}
> +	/* We only support 2 DSC mode (with 2 LM and 1 INTF) */
> +	if (dpu_enc->dsc)
> +		num_dsc += 2;
>  
> -	cstate->num_mixers = num_lm;
> +	return (num_dsc > 0) && (num_dsc > num_intf);

Ok, so after all the rebases this commit removes CRTC resource
assignment from dpu_encoder.c, but they are added to dpu_crtc.c only in
the next commit! So after this one the tree is broken. This isn't really
acceptable. After each commit the tree should work, otherwise git-bisect
might return incorrect results.

Historically this patch just moved the allocation to the
dpu_crtc_atomic_check(), while cstate has been maniputated in
dpu_encoder_virt_atomic_mode_set(). Commit 3ae133b0192b ("drm/msm/dpu:
move CRTC resource assignment to dpu_encoder_virt_atomic_check") moved
resource handling to the atomic_check() stage. I think at this point you
need to take one step back, return to the previous commits, but revert
their order: first move cstate manipulation to happen during the
dpu_crtc_atomic_check() function call, leaving dpu_rm_release() /
dpu_rm_reserve() out of dpu_crtc_assign_resources() (in
dpu_encoder_virt_atomic_check() as they are now). Then can come this
patch, which moves topology handling, resource reservation, etc. to
dpu_crtc.c.

>  }
>  
> -static int dpu_encoder_virt_atomic_check(
> -		struct drm_encoder *drm_enc,
> -		struct drm_crtc_state *crtc_state,
> -		struct drm_connector_state *conn_state)
> +bool dpu_encoder_needs_modeset(struct drm_encoder *drm_enc, struct drm_atomic_state *state)
>  {
> -	struct dpu_encoder_virt *dpu_enc;
> -	struct msm_drm_private *priv;
> -	struct dpu_kms *dpu_kms;
> -	struct drm_display_mode *adj_mode;
> -	struct msm_display_topology topology;
> -	struct msm_display_info *disp_info;
> -	struct dpu_global_state *global_state;
> +	struct drm_connector *connector;
> +	struct drm_connector_state *conn_state;
>  	struct drm_framebuffer *fb;
> -	struct drm_dsc_config *dsc;
> -	int ret = 0;
> -
> -	if (!drm_enc || !crtc_state || !conn_state) {
> -		DPU_ERROR("invalid arg(s), drm_enc %d, crtc/conn state %d/%d\n",
> -				drm_enc != NULL, crtc_state != NULL, conn_state != NULL);
> -		return -EINVAL;
> -	}
> -
> -	dpu_enc = to_dpu_encoder_virt(drm_enc);
> -	DPU_DEBUG_ENC(dpu_enc, "\n");
> -
> -	priv = drm_enc->dev->dev_private;
> -	disp_info = &dpu_enc->disp_info;
> -	dpu_kms = to_dpu_kms(priv->kms);
> -	adj_mode = &crtc_state->adjusted_mode;
> -	global_state = dpu_kms_get_global_state(crtc_state->state);
> -	if (IS_ERR(global_state))
> -		return PTR_ERR(global_state);
> +	struct dpu_encoder_virt *dpu_enc = to_dpu_encoder_virt(drm_enc);
>  
> -	trace_dpu_enc_atomic_check(DRMID(drm_enc));
> +	if (!drm_enc || !state)
> +		return false;
>  
> -	dsc = dpu_encoder_get_dsc_config(drm_enc);
> +	connector = drm_atomic_get_new_connector_for_encoder(state, drm_enc);
> +	if (!connector)
> +		return false;
>  
> -	topology = dpu_encoder_get_topology(dpu_enc, dpu_kms, adj_mode, crtc_state, dsc);
> +	conn_state = drm_atomic_get_new_connector_state(state, connector);
>  
> -	/*
> -	 * Use CDM only for writeback or DP at the moment as other interfaces cannot handle it.
> -	 * If writeback itself cannot handle cdm for some reason it will fail in its atomic_check()
> -	 * earlier.
> -	 */
> -	if (disp_info->intf_type == INTF_WB && conn_state->writeback_job) {
> +	if (dpu_enc->disp_info.intf_type == INTF_WB && conn_state->writeback_job) {
>  		fb = conn_state->writeback_job->fb;
> -
> -		if (fb && MSM_FORMAT_IS_YUV(msm_framebuffer_format(fb)))
> -			topology.needs_cdm = true;
> -	} else if (disp_info->intf_type == INTF_DP) {
> -		if (msm_dp_is_yuv_420_enabled(priv->dp[disp_info->h_tile_instance[0]], adj_mode))
> -			topology.needs_cdm = true;
> +		if (fb && MSM_FORMAT_IS_YUV(msm_framebuffer_format(fb))) {
> +			if (!dpu_enc->cur_master->hw_cdm)
> +				return true;
> +		} else {
> +			if (dpu_enc->cur_master->hw_cdm)
> +				return true;
> +		}
>  	}
>  
> -	if (topology.needs_cdm && !dpu_enc->cur_master->hw_cdm)
> -		crtc_state->mode_changed = true;
> -	else if (!topology.needs_cdm && dpu_enc->cur_master->hw_cdm)
> -		crtc_state->mode_changed = true;
> -	/*
> -	 * Release and Allocate resources on every modeset
> -	 * Dont allocate when active is false.
> -	 */
> -	if (drm_atomic_crtc_needs_modeset(crtc_state)) {
> -		dpu_rm_release(global_state, crtc_state->crtc);
> +	return false;
> +}
>  
> -		if (!crtc_state->active_changed || crtc_state->enable)
> -			ret = dpu_rm_reserve(&dpu_kms->rm, global_state,
> -					crtc_state->crtc, &topology);
> -		if (!ret)
> -			dpu_encoder_assign_crtc_resources(dpu_kms, drm_enc,
> -							  global_state, crtc_state);
> -	}
> +/**
> + * dpu_encoder_get_dsc_config - get DSC config for the DPU encoder
> + *   This helper function is used by physical encoder to get DSC config
> + *   used for this encoder.
> + * @drm_enc: Pointer to encoder structure
> + */
> +struct drm_dsc_config *dpu_encoder_get_dsc_config(struct drm_encoder *drm_enc)
> +{
> +	struct msm_drm_private *priv = drm_enc->dev->dev_private;
> +	struct dpu_encoder_virt *dpu_enc = to_dpu_encoder_virt(drm_enc);
> +	int index = dpu_enc->disp_info.h_tile_instance[0];
>  
> -	trace_dpu_enc_atomic_check_flags(DRMID(drm_enc), adj_mode->flags);
> +	if (dpu_enc->disp_info.intf_type == INTF_DSI)
> +		return msm_dsi_get_dsc_config(priv->dsi[index]);
>  
> -	return ret;
> +	return NULL;
> +}
> +
> +/**
> + * dpu_encoder_use_dsc_merge - returns true if the encoder uses DSC merge topology.
> + * @drm_enc:    Pointer to previously created drm encoder structure
> + */
> +bool dpu_encoder_use_dsc_merge(struct drm_encoder *drm_enc)
> +{
> +	return dpu_encoder_needs_dsc_merge(drm_enc);
>  }
>  
>  static void _dpu_encoder_update_vsync_source(struct dpu_encoder_virt *dpu_enc,
> @@ -2627,7 +2546,6 @@ static const struct drm_encoder_helper_funcs dpu_encoder_helper_funcs = {
>  	.atomic_mode_set = dpu_encoder_virt_atomic_mode_set,
>  	.atomic_disable = dpu_encoder_virt_atomic_disable,
>  	.atomic_enable = dpu_encoder_virt_atomic_enable,
> -	.atomic_check = dpu_encoder_virt_atomic_check,
>  };
>  
>  static const struct drm_encoder_funcs dpu_encoder_funcs = {
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
> index 92b5ee390788d16e85e195a664417896a2bf1cae..3db3ea076c377ad5411ec85006bcf4cd9757eb1d 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
> @@ -11,6 +11,7 @@
>  
>  #include <drm/drm_crtc.h>
>  #include "dpu_hw_mdss.h"
> +#include "dpu_kms.h"
>  
>  #define DPU_ENCODER_FRAME_EVENT_DONE			BIT(0)
>  #define DPU_ENCODER_FRAME_EVENT_ERROR			BIT(1)
> @@ -80,6 +81,13 @@ int dpu_encoder_get_crc(const struct drm_encoder *drm_enc, u32 *crcs, int pos);
>  
>  bool dpu_encoder_use_dsc_merge(struct drm_encoder *drm_enc);
>  
> +void dpu_encoder_update_topology(struct drm_encoder *drm_enc,
> +				 struct msm_display_topology *topology,
> +				 struct drm_atomic_state *state,
> +				 const struct drm_display_mode *adj_mode);
> +
> +bool dpu_encoder_needs_modeset(struct drm_encoder *drm_enc, struct drm_atomic_state *state);
> +
>  void dpu_encoder_prepare_wb_job(struct drm_encoder *drm_enc,
>  		struct drm_writeback_job *job);
>  
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

