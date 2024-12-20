Return-Path: <linux-arm-msm+bounces-42902-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 88D519F8C05
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Dec 2024 06:52:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4334E7A068A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Dec 2024 05:52:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB4B725949A;
	Fri, 20 Dec 2024 05:52:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cxp+BZTU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8520113D53B
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Dec 2024 05:52:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734673956; cv=none; b=G83dkxcIayUCg/UnwFhOuNHUn5hQ/h0rjVF8PnRf89/zl8HQzFz/U0mlmR5g9qiTdDI5SCanEU1cBi7c2PGQ/gh8n+8zII1zcrB0TU1+Vad+Zwra1X8Uid9xs1yOxbIcsH1EDYY7yV8x3+RcNausk9jKPxY8zURouzzUFPkIibc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734673956; c=relaxed/simple;
	bh=GuqksWkIYJoSBrehZXqfxTCKAE+9Qd8R5tbWf4tTWFc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CGvrDcgMarDtoViy/461o68DYs8UxA7O1TDJ9gXMWcytX7/zRWEo4atYNo594BZlrx79DwCg4AbY2TldGtBTviBqNq9dWwUOX1gqGh4ElPegEI8nbhnWd/0zwf/QAZBWn7xGrxAx1kvX2S0tsDQnKJmOtJF5HVyEDB+ChmS8Cf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cxp+BZTU; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-53ff1f7caaeso1532401e87.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Dec 2024 21:52:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734673953; x=1735278753; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=PrsCL1WIlb94zCZ6gHV9m1qClAQqxJTULwk6ciOdNEc=;
        b=cxp+BZTUYvSrIzxR4mnTkpYkPa2gfa58qCX9JPUOaMfQMDOgKfZ77nnFVC5BYd1wod
         yJ3QTnbYYPyAnlwewsxMwS7rNZQa0sGLm6FUAjK66xtfj58gCjMBgISxuN/CKR83B/SP
         KO2j7o02tA6NgqjEKFPKHWT4GA8Fck+suG5EOBE0FAf0TZyx/hhrwyku2gKOnuDAHiaT
         ZrzqrYgjpGhJzMdraa1YtfqGMxvRkEkKHeP8M/hluUbB1RgYlugp+jZ91CoWctcqfS9v
         nZ3rDoBQeICUXJe8vdPWYGQXhcibBJ1F4lPRQer2JxJMyKpam9abKj8qReSSKxtX7yy1
         ePLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734673953; x=1735278753;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PrsCL1WIlb94zCZ6gHV9m1qClAQqxJTULwk6ciOdNEc=;
        b=In1oPF8T9YplxPEqpcVAiWmHCA3GSFMOs2XTciK/c2OQmSsj/RgwDC8e0Jtb9GXqJd
         mm/Sda6p0mW+tRy8f7I6TNDJ/0F2lA55mQaOatyLjmKW5Hmb5xoxfc6oSojDp6PWGJmV
         4q0CiSD0UemzyQKunh/cRWohvBeAM65IGjIatbPncEWR+4d7FzX7CP+bZ5qq2hI7zhb+
         VInP1mhyM8hfIC5xAdAbnhE33EiI+3dfflR1JOO9F85P36AMEtgPmPgxoeNPSBOesSOL
         45HnQuD8TFkGmOHfGTShvrbDvRhX6+CchktvOH5nh8Df71gGZOadu3IDyWeXKEbBvYb0
         d1zw==
X-Forwarded-Encrypted: i=1; AJvYcCXoE3vgxXfuSLpIonb/w2vFfhqfun8A1fpaQr5vIBrAewdAt/1EN1D3D9/JbOtmmd55ZF/Zg9W4arkoD0qn@vger.kernel.org
X-Gm-Message-State: AOJu0YxDP/M6+QI4aadthEiLyzHUy4PPT90PLaUnIzuLY+FKurKy8V9y
	/tM0CNiiFC8iw3T3tnYGZU6yDMhO6VWnbefBsbi1U0UeuF4FfhqCEsN/+a+LmZ0=
X-Gm-Gg: ASbGncu+rOy7s8TzaRyrHXaE4AdnHlfS74xmmBfWmEK30PDPFx+LpE4CDbafo9m4PfL
	/U+E3BV5we80cznCuUKUhj5zy8qtHESIAX2oLiWnedIaRqLIT59vukce1KEUD617VRYQItZ4moB
	ux152HoUdJF0C06EUJ8ixWNv8BnaOf4MmLbtGNZpSfgdlCmDyAmKEVSi+n2mFv4WjzEAfYf/vD6
	1VZJJ51eS/u4E8F17F23MzG+MttYJicRbejb40wVqh3jBgI2gF+IHxk1xnz+/y1OvPUeiw1bEdm
	GV9NCgH30lciTv1A7ELrYiQlyc4fojDy6PRa
X-Google-Smtp-Source: AGHT+IExWCCDGaDuBm5lhld9UEbZy11jgAUpDlC5Wr7bUL0jQ9Ik9GGih1dg0p5/U+a2cm3HxdVWsg==
X-Received: by 2002:a05:6512:1055:b0:53f:167e:390f with SMTP id 2adb3069b0e04-5422956bd7dmr361940e87.53.1734673952612;
        Thu, 19 Dec 2024 21:52:32 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3045ad6cae6sm4279521fa.23.2024.12.19.21.52.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Dec 2024 21:52:31 -0800 (PST)
Date: Fri, 20 Dec 2024 07:52:29 +0200
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
Subject: Re: [PATCH v4 18/25] drm/msm/dpu: Reserve resources for CWB
Message-ID: <z6pebzm5yxaqqmktu4jjjy4rojkdarrqrwo4ikmv6jzku7foyf@cc325q3dfgif>
References: <20241216-concurrent-wb-v4-0-fe220297a7f0@quicinc.com>
 <20241216-concurrent-wb-v4-18-fe220297a7f0@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241216-concurrent-wb-v4-18-fe220297a7f0@quicinc.com>

On Mon, Dec 16, 2024 at 04:43:29PM -0800, Jessica Zhang wrote:
> Add support for RM to reserve dedicated CWB PINGPONGs and CWB muxes
> 
> For concurrent writeback, even-indexed CWB muxes must be assigned to
> even-indexed LMs and odd-indexed CWB muxes for odd-indexed LMs. The same
> even/odd rule applies for dedicated CWB PINGPONGs.
> 
> Track the CWB muxes in the global state and add a CWB-specific helper to
> reserve the correct CWB muxes and dedicated PINGPONGs following the
> even/odd rule.
> 
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 34 ++++++++++--
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h |  2 +
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h     |  1 +
>  drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c      | 83 +++++++++++++++++++++++++++++
>  4 files changed, 116 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index a895d48fe81ccc71d265e089992786e8b6268b1b..a95dc1f0c6a422485c7ba98743e944e1a4f43539 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -2,7 +2,7 @@
>  /*
>   * Copyright (C) 2013 Red Hat
>   * Copyright (c) 2014-2018, 2020-2021 The Linux Foundation. All rights reserved.
> - * Copyright (c) 2022-2023 Qualcomm Innovation Center, Inc. All rights reserved.
> + * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
>   *
>   * Author: Rob Clark <robdclark@gmail.com>
>   */
> @@ -28,6 +28,7 @@
>  #include "dpu_hw_dsc.h"
>  #include "dpu_hw_merge3d.h"
>  #include "dpu_hw_cdm.h"
> +#include "dpu_hw_cwb.h"
>  #include "dpu_formats.h"
>  #include "dpu_encoder_phys.h"
>  #include "dpu_crtc.h"
> @@ -133,6 +134,9 @@ enum dpu_enc_rc_states {
>   * @cur_slave:		As above but for the slave encoder.
>   * @hw_pp:		Handle to the pingpong blocks used for the display. No.
>   *			pingpong blocks can be different than num_phys_encs.
> + * @hw_cwb:		Handle to the CWB muxes used for concurrent writeback
> + *			display. Number of CWB muxes can be different than
> + *			num_phys_encs.
>   * @hw_dsc:		Handle to the DSC blocks used for the display.
>   * @dsc_mask:		Bitmask of used DSC blocks.
>   * @intfs_swapped:	Whether or not the phys_enc interfaces have been swapped
> @@ -177,6 +181,7 @@ struct dpu_encoder_virt {
>  	struct dpu_encoder_phys *cur_master;
>  	struct dpu_encoder_phys *cur_slave;
>  	struct dpu_hw_pingpong *hw_pp[MAX_CHANNELS_PER_ENC];
> +	struct dpu_hw_cwb *hw_cwb[MAX_CHANNELS_PER_ENC];
>  	struct dpu_hw_dsc *hw_dsc[MAX_CHANNELS_PER_ENC];
>  
>  	unsigned int dsc_mask;
> @@ -1138,7 +1143,10 @@ static void dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
>  	struct dpu_hw_blk *hw_pp[MAX_CHANNELS_PER_ENC];
>  	struct dpu_hw_blk *hw_ctl[MAX_CHANNELS_PER_ENC];
>  	struct dpu_hw_blk *hw_dsc[MAX_CHANNELS_PER_ENC];
> +	struct dpu_hw_blk *hw_cwb[MAX_CHANNELS_PER_ENC];
>  	int num_pp, num_dsc, num_ctl;
> +	int num_cwb = 0;
> +	bool is_cwb_encoder;
>  	unsigned int dsc_mask = 0;
>  	int i;
>  
> @@ -1152,6 +1160,8 @@ static void dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
>  
>  	priv = drm_enc->dev->dev_private;
>  	dpu_kms = to_dpu_kms(priv->kms);
> +	is_cwb_encoder = drm_crtc_in_clone_mode(crtc_state) &&
> +			dpu_enc->disp_info.intf_type == INTF_WB;
>  
>  	global_state = dpu_kms_get_existing_global_state(dpu_kms);
>  	if (IS_ERR_OR_NULL(global_state)) {
> @@ -1162,9 +1172,25 @@ static void dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
>  	trace_dpu_enc_mode_set(DRMID(drm_enc));
>  
>  	/* Query resource that have been reserved in atomic check step. */
> -	num_pp = dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
> -		drm_enc->crtc, DPU_HW_BLK_PINGPONG, hw_pp,
> -		ARRAY_SIZE(hw_pp));
> +	if (is_cwb_encoder) {
> +		num_pp = dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
> +						       drm_enc->crtc,
> +						       DPU_HW_BLK_DCWB_PINGPONG,
> +						       hw_pp, ARRAY_SIZE(hw_pp));
> +		num_cwb = dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
> +						       drm_enc->crtc,
> +						       DPU_HW_BLK_CWB,
> +						       hw_cwb, ARRAY_SIZE(hw_cwb));
> +	} else {
> +		num_pp = dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
> +						       drm_enc->crtc,
> +						       DPU_HW_BLK_PINGPONG, hw_pp,
> +						       ARRAY_SIZE(hw_pp));
> +	}
> +
> +	for (i = 0; i < num_cwb; i++)
> +		dpu_enc->hw_cwb[i] = to_dpu_hw_cwb(hw_cwb[i]);
> +
>  	num_ctl = dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
>  			drm_enc->crtc, DPU_HW_BLK_CTL, hw_ctl, ARRAY_SIZE(hw_ctl));
>  
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
> index ba7bb05efe9b8cac01a908e53121117e130f91ec..8d820cd1b5545d247515763039b341184e814e32 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
> @@ -77,12 +77,14 @@ enum dpu_hw_blk_type {
>  	DPU_HW_BLK_LM,
>  	DPU_HW_BLK_CTL,
>  	DPU_HW_BLK_PINGPONG,
> +	DPU_HW_BLK_DCWB_PINGPONG,
>  	DPU_HW_BLK_INTF,
>  	DPU_HW_BLK_WB,
>  	DPU_HW_BLK_DSPP,
>  	DPU_HW_BLK_MERGE_3D,
>  	DPU_HW_BLK_DSC,
>  	DPU_HW_BLK_CDM,
> +	DPU_HW_BLK_CWB,
>  	DPU_HW_BLK_MAX,
>  };
>  
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
> index 48d756d8f8c6e4ab94b72bac0418320f7dc8cda8..1fc8abda927fc094b369e0d1efc795b71d6a7fcb 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
> @@ -128,6 +128,7 @@ struct dpu_global_state {
>  	uint32_t dspp_to_crtc_id[DSPP_MAX - DSPP_0];
>  	uint32_t dsc_to_crtc_id[DSC_MAX - DSC_0];
>  	uint32_t cdm_to_crtc_id;
> +	uint32_t cwb_to_crtc_id[CWB_MAX - CWB_0];
>  };
>  
>  struct dpu_global_state
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> index 85adaf256b2c705d2d7df378b6ffc0e578f52bc3..ead24bb0ceb5d8ec4705f0d32330294d0b45b216 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> @@ -234,6 +234,55 @@ static int _dpu_rm_get_lm_peer(struct dpu_rm *rm, int primary_idx)
>  	return -EINVAL;
>  }
>  
> +static int _dpu_rm_reserve_cwb_mux_and_pingpongs(struct dpu_rm *rm,
> +						 struct dpu_global_state *global_state,
> +						 uint32_t crtc_id,
> +						 struct msm_display_topology *topology)
> +{
> +	int num_cwb_pp = topology->num_lm, cwb_pp_count = 0;
> +	int cwb_pp_start_idx = PINGPONG_CWB_0 - PINGPONG_0;
> +	int cwb_pp_idx[MAX_BLOCKS];
> +	int cwb_mux_idx[MAX_BLOCKS];
> +
> +	/*
> +	 * Reserve additional dedicated CWB PINGPONG blocks and muxes for each
> +	 * mixer
> +	 *
> +	 * TODO: add support reserving resources for platforms with no
> +	 *       PINGPONG_CWB

What about doing it other way around: allocate CWBs first as required
(even/odd, proper count, etc). Then for each of CWBs allocate a PP block
(I think it's enough to simply make CWB blocks have a corresponding PP
index as a property). This way the driver can handle both legacy and
current platforms.

> +	 */
> +	for (int i = 0; i < ARRAY_SIZE(rm->mixer_blks) &&
> +	     cwb_pp_count < num_cwb_pp; i++) {
> +		for (int j = cwb_pp_start_idx;
> +		     j < ARRAY_SIZE(rm->pingpong_blks); j++) {
> +			/*
> +			 * Odd LMs must be assigned to odd PINGPONGs and even
> +			 * LMs with even PINGPONGs
> +			 */
> +			if (reserved_by_other(global_state->pingpong_to_crtc_id, j, crtc_id) ||
> +			    i % 2 != j % 2)
> +				continue;
> +
> +			cwb_pp_idx[cwb_pp_count] = j;
> +			cwb_mux_idx[cwb_pp_count] = j - cwb_pp_start_idx;
> +			cwb_pp_count++;
> +			break;
> +		}
> +	}
> +
> +	if (cwb_pp_count != num_cwb_pp) {
> +		DPU_ERROR("Unable to reserve all CWB PINGPONGs\n");
> +		return -ENAVAIL;
> +	}
> +
> +	for (int i = 0; i < cwb_pp_count; i++) {
> +		global_state->pingpong_to_crtc_id[cwb_pp_idx[i]] = crtc_id;
> +		global_state->cwb_to_crtc_id[cwb_mux_idx[i]] = crtc_id;
> +	}
> +
> +	return 0;
> +}
> +
>  /**
>   * _dpu_rm_check_lm_and_get_connected_blks - check if proposed layer mixer meets
>   *	proposed use case requirements, incl. hardwired dependent blocks like
> @@ -614,6 +663,12 @@ static int _dpu_rm_make_reservation(
>  		return ret;
>  	}
>  
> +	if (topology->cwb_enabled) {
> +		ret = _dpu_rm_reserve_cwb_mux_and_pingpongs(rm, global_state,
> +							    crtc_id, topology);
> +		if (ret)
> +			return ret;
> +	}
>  
>  	ret = _dpu_rm_reserve_ctls(rm, global_state, crtc_id,
>  			topology);
> @@ -671,6 +726,8 @@ void dpu_rm_release(struct dpu_global_state *global_state,
>  	_dpu_rm_clear_mapping(global_state->dspp_to_crtc_id,
>  			ARRAY_SIZE(global_state->dspp_to_crtc_id), crtc_id);
>  	_dpu_rm_clear_mapping(&global_state->cdm_to_crtc_id, 1, crtc_id);
> +	_dpu_rm_clear_mapping(global_state->cwb_to_crtc_id,
> +			ARRAY_SIZE(global_state->cwb_to_crtc_id), crtc_id);
>  }
>  
>  /**
> @@ -733,6 +790,7 @@ int dpu_rm_get_assigned_resources(struct dpu_rm *rm,
>  
>  	switch (type) {
>  	case DPU_HW_BLK_PINGPONG:
> +	case DPU_HW_BLK_DCWB_PINGPONG:
>  		hw_blks = rm->pingpong_blks;
>  		hw_to_crtc_id = global_state->pingpong_to_crtc_id;
>  		max_blks = ARRAY_SIZE(rm->pingpong_blks);
> @@ -762,6 +820,11 @@ int dpu_rm_get_assigned_resources(struct dpu_rm *rm,
>  		hw_to_crtc_id = &global_state->cdm_to_crtc_id;
>  		max_blks = 1;
>  		break;
> +	case DPU_HW_BLK_CWB:
> +		hw_blks = rm->cwb_blks;
> +		hw_to_crtc_id = global_state->cwb_to_crtc_id;
> +		max_blks = ARRAY_SIZE(rm->cwb_blks);
> +		break;
>  	default:
>  		DPU_ERROR("blk type %d not managed by rm\n", type);
>  		return 0;
> @@ -772,6 +835,20 @@ int dpu_rm_get_assigned_resources(struct dpu_rm *rm,
>  		if (hw_to_crtc_id[i] != crtc_id)
>  			continue;
>  
> +		if (type == DPU_HW_BLK_PINGPONG) {
> +			struct dpu_hw_pingpong *pp = to_dpu_hw_pingpong(hw_blks[i]);
> +
> +			if (pp->idx >= PINGPONG_CWB_0)
> +				continue;
> +		}
> +
> +		if (type == DPU_HW_BLK_DCWB_PINGPONG) {
> +			struct dpu_hw_pingpong *pp = to_dpu_hw_pingpong(hw_blks[i]);
> +
> +			if (pp->idx < PINGPONG_CWB_0)
> +				continue;
> +		}
> +
>  		if (num_blks == blks_size) {
>  			DPU_ERROR("More than %d resources assigned to crtc %d\n",
>  				  blks_size, crtc_id);
> @@ -847,4 +924,10 @@ void dpu_rm_print_state(struct drm_printer *p,
>  	dpu_rm_print_state_helper(p, rm->cdm_blk,
>  				  global_state->cdm_to_crtc_id);
>  	drm_puts(p, "\n");
> +
> +	drm_puts(p, "\tcwb=");
> +	for (i = 0; i < ARRAY_SIZE(global_state->cwb_to_crtc_id); i++)
> +		dpu_rm_print_state_helper(p, rm->cwb_blks[i],
> +					  global_state->cwb_to_crtc_id[i]);
> +	drm_puts(p, "\n");
>  }
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

