Return-Path: <linux-arm-msm+bounces-32378-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 58A25984F01
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Sep 2024 01:33:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7AEC21C20F68
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Sep 2024 23:33:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07E7E15623A;
	Tue, 24 Sep 2024 23:33:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bkHJo6IB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C226613DBBC
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Sep 2024 23:33:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727220795; cv=none; b=YZ3EOukAdse7tp56rV6dtyCUtNCXLVgkFK7PewhHYuINR4Vgow2Opxt832VECQe1y69aPH9CAFTvcPs9NHcPnuL3Ltl/uQKk5E+8FVK4SERFGEdzii3LXx1waiDzl28tXBodpcgCvkiJZYFYhGuw2AXcHweK2GH7Iz84QMUXYkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727220795; c=relaxed/simple;
	bh=Kz4EteGBnEcdT6WBTAi5msqfDeHPNtCY/bIVxqiq53Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Mz623MkxlE6VNdfiz/sKURiG3rnonBYNTUwFZz7w2V0LtmQvPnW5paSrErn006lN1SCKvgbNlM9qIsPS0zqjUdD/b1KnRLAlcLKqVW1ORjCTHqrk411QpL6CErEmP9vthEUbFn7mqM8sbF42old1Jr6O2nrcN5cr2OE/DEOe6lU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bkHJo6IB; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2f759b87f83so64982051fa.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Sep 2024 16:33:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727220792; x=1727825592; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hRlv8s8GoItuIpeQU419MkcSoMXZV/bPMhcqrG6dwwI=;
        b=bkHJo6IBpNIUJ26Md/r4nqzDLlH5Pw5KWZEH2MT/ilZEN0tp3rm0Bmi5LO1DYaqmYI
         5OPFf6aIZmCNm7msxic5cyNW15O7kRdPxYrNPftfjTfYunGTUIPwKrPgDPDvbDMlNwWZ
         cqj7YBLHb4pDpznXfdsT8j2UdB6lEPMH4ZczOlEYW0smx0IKRxBz+9PlqnHNekViqXXe
         COrv1fdqDl1Gwn2NBm9ETxrTa02zrjeLqh4mwHQM//oPrRJ7zMMpyCRmEWhHWPUEQzj8
         UXsN4u4k2atMwHdtRi6zEa48B+aPqQCTRRsLO0R/rNVJfKdJ8v1jNJ+UkPlm0I/urrCv
         IfJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727220792; x=1727825592;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hRlv8s8GoItuIpeQU419MkcSoMXZV/bPMhcqrG6dwwI=;
        b=Vwa3h2bbvnF1PzF+T5ah91bNSfokGZk8rW3Ie3fkLLC/gcjdVP5zqfaee4iZT4QOy0
         PuvZD70OO4U17+hwKk1ic5+BYhICjGkK/+AotePH++L+yoiBgSfsaEoQzAcu8alq0Wya
         D0kJgNA9EkxrLH6/7avKxyYL8+VVKaA2XMQFeTp5B5UgPD97wC9mYgCE7YR0gjFkoiYK
         CxLXuCUdXASGj4uFG3pynJPzjlfvMGdOYL9AwoVf/7DjzAiwkHvggPeGEXVc3qXe8aj7
         K6pv65RQyfn9YxXfIscv6etOkeYfLWM/E7qFN0B2UwgcQf2b2bbdAWV3tQXBVUWQAv52
         6r2A==
X-Forwarded-Encrypted: i=1; AJvYcCUbCTZke5qTK409d+CRrxhrG8P5QPUICMdoL2TMwMMM+hZzmuYhEcRnAuotfKaK9q+nmM7FNMXnXtC9DsvX@vger.kernel.org
X-Gm-Message-State: AOJu0YzdKWmGnrYaueWaS2j9Zayp/OZxWXKbnPTwsPlgynKyCZHFAMuH
	Ky+hDUFerrUSb5IUCFOvaDY8CjiK+SjvPQK+GWhVECV7AVs+8461gy9XSh8tVm8=
X-Google-Smtp-Source: AGHT+IHnBmWYzwQDUD394Srxn+hiP6zYOXP+PHgD5N0zIrFFjdx0/JXyGO/S6L6DEekiStAGgMFsLQ==
X-Received: by 2002:a2e:4a0a:0:b0:2ef:1784:a20 with SMTP id 38308e7fff4ca-2f91ca68786mr4246941fa.38.1727220791577;
        Tue, 24 Sep 2024 16:33:11 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2f8d282fcb8sm3562201fa.4.2024.09.24.16.33.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Sep 2024 16:33:10 -0700 (PDT)
Date: Wed, 25 Sep 2024 02:33:07 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, quic_abhinavk@quicinc.com, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, quic_ebharadw@quicinc.com, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	Rob Clark <robdclark@chromium.org>, Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH v2 15/22] drm/msm/dpu: Reserve resources for CWB
Message-ID: <zjm4lyjyvdbbixhcwrcttavukxgmw63a2b2fn742advjrahq3a@auykiy6vwtrj>
References: <20240924-concurrent-wb-v2-0-7849f900e863@quicinc.com>
 <20240924-concurrent-wb-v2-15-7849f900e863@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240924-concurrent-wb-v2-15-7849f900e863@quicinc.com>

On Tue, Sep 24, 2024 at 03:59:31PM GMT, Jessica Zhang wrote:
> Add support for RM to reserve dedicated CWB pingpongs and CWB muxes
> 
> For concurrent writeback, even-indexed CWB muxes must be assigned to
> even-indexed LMs and odd-indexed CWB muxes for odd-indexed LMs. The same
> even/odd rule applies for dedicated CWB pingpongs.
> 
> Track the CWB muxes in the global state and add a CWB-specific helper to
> reserve the correct CWB muxes and dedicated pingpongs following the
> even/odd rule.
> 
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 34 ++++++++++--
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h |  2 +
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h     |  1 +
>  drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c      | 84 +++++++++++++++++++++++++++++
>  4 files changed, 117 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index 36b677cf9c7a..b2f0bf412451 100644
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
> @@ -1053,7 +1058,10 @@ static void dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
>  	struct dpu_hw_blk *hw_pp[MAX_CHANNELS_PER_ENC];
>  	struct dpu_hw_blk *hw_ctl[MAX_CHANNELS_PER_ENC];
>  	struct dpu_hw_blk *hw_dsc[MAX_CHANNELS_PER_ENC];
> +	struct dpu_hw_blk *hw_cwb[MAX_CHANNELS_PER_ENC];
>  	int num_pp, num_dsc;
> +	int num_cwb = 0;
> +	bool is_cwb_encoder;
>  	unsigned int dsc_mask = 0;
>  	int i;
>  
> @@ -1067,6 +1075,8 @@ static void dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
>  
>  	priv = drm_enc->dev->dev_private;
>  	dpu_kms = to_dpu_kms(priv->kms);
> +	is_cwb_encoder = drm_crtc_in_clone_mode(crtc_state) &&
> +			dpu_enc->disp_info.intf_type == INTF_WB;
>  
>  	global_state = dpu_kms_get_existing_global_state(dpu_kms);
>  	if (IS_ERR_OR_NULL(global_state)) {
> @@ -1077,9 +1087,25 @@ static void dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
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
>  	dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
>  			drm_enc->crtc, DPU_HW_BLK_CTL, hw_ctl, ARRAY_SIZE(hw_ctl));
>  
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
> index c43cb55fe1d2..34195bf4e270 100644
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
> index 4fdc5f933261..a078b5334dc1 100644
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
> index 04df3056d75a..429e432e2163 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> @@ -223,6 +223,54 @@ static int _dpu_rm_get_lm_peer(struct dpu_rm *rm, int primary_idx)
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
> +	 * Reserve additional dedicated CWB pingpong blocks and muxes for each

s/pingpong/PINGPONG/ globally

> +	 * mixer
> +	 *
> +	 * TODO: add support for reserving non-dedicated CWB pingpong blocks

... on platforms with no dedicated PINGPONG_CWB

> +	 */
> +	for (int i = 0; i < ARRAY_SIZE(rm->mixer_blks) &&
> +	     cwb_pp_count < num_cwb_pp; i++) {
> +		for (int j = cwb_pp_start_idx;
> +		     j < ARRAY_SIZE(rm->pingpong_blks); j++) {
> +			/*
> +			 * Odd LMs must be assigned to odd pingpongs and even
> +			 * LMs with even pingpongs
> +			 */
> +			if (reserved_by_other(global_state->pingpong_to_crtc_id,
> +					      j, crtc_id) || i % 2 != j % 2)

Carriage return after ||, please. Maybe use single line for
reserved_by_other call, it's easier to read this way.

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
> +		DPU_ERROR("Unable to reserve all cwb pingpongs\n");
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
> @@ -603,6 +651,14 @@ static int _dpu_rm_make_reservation(
>  		return ret;
>  	}
>  
> +	if (topology->cwb_enabled) {
> +		ret = _dpu_rm_reserve_cwb_mux_and_pingpongs(rm, global_state,
> +							    crtc_id, topology);
> +		if (ret) {
> +			DPU_ERROR("unable to find appropriate dcwb pingpongs\n");

Can we have a single error please? There was already one in the
reserve-cwb-and-pp function.

> +			return ret;
> +		}
> +	}
>  
>  	ret = _dpu_rm_reserve_ctls(rm, global_state, crtc_id,
>  			topology);
> @@ -653,6 +709,8 @@ void dpu_rm_release(struct dpu_global_state *global_state,
>  	_dpu_rm_clear_mapping(global_state->dspp_to_crtc_id,
>  			ARRAY_SIZE(global_state->dspp_to_crtc_id), crtc_id);
>  	_dpu_rm_clear_mapping(&global_state->cdm_to_crtc_id, 1, crtc_id);
> +	_dpu_rm_clear_mapping(global_state->cwb_to_crtc_id,
> +			ARRAY_SIZE(global_state->cwb_to_crtc_id), crtc_id);
>  }
>  
>  int dpu_rm_reserve(
> @@ -692,6 +750,7 @@ int dpu_rm_get_assigned_resources(struct dpu_rm *rm,
>  
>  	switch (type) {
>  	case DPU_HW_BLK_PINGPONG:
> +	case DPU_HW_BLK_DCWB_PINGPONG:
>  		hw_blks = rm->pingpong_blks;
>  		hw_to_crtc_id = global_state->pingpong_to_crtc_id;
>  		max_blks = ARRAY_SIZE(rm->pingpong_blks);
> @@ -721,6 +780,11 @@ int dpu_rm_get_assigned_resources(struct dpu_rm *rm,
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
> @@ -731,6 +795,20 @@ int dpu_rm_get_assigned_resources(struct dpu_rm *rm,
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
> @@ -801,4 +879,10 @@ void dpu_rm_print_state(struct drm_printer *p,
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

