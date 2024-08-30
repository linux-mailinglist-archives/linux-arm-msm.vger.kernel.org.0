Return-Path: <linux-arm-msm+bounces-30296-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C9D196685A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Aug 2024 19:47:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 556E028356C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Aug 2024 17:47:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15E321BB6A3;
	Fri, 30 Aug 2024 17:47:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aOARZe6A"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1EA714A4EA
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Aug 2024 17:47:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725040066; cv=none; b=e82e7Uf2Llfq2QveyayStmAeWmtRJ5DPuGbsXHmm/kMp749nAUfygOOuWIdsbRWQlox/WWEBjLqKoY2h7E98CjcydsAAJGozGNR9oEUg3uGq0wlqmGOdGnpVixo9l3+Cp/CxQ52U3ClI0HTpBvbl2sf3GXe++mRpBgN5Wdi6GwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725040066; c=relaxed/simple;
	bh=aYcbH58tTp/flf/1fGabGcWvpY3uQjaGZdDGY5W9MDs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=opO8H+7ldetHGQvF9GNatKMIgsr8KzINgo805jyMURVztk+ThaRPKmntYnuacgirvDtnyCYTF0C244yVp9nxAjb+of8hbCd1kKqs4VNMeUiQWXdGLHJ1umeXXaKvlWcy/HBwDzrDxodN8TqzZIwJA0ynP7hRrNCW2C0iGVOyBYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=aOARZe6A; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2f029e9c9cfso25024131fa.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Aug 2024 10:47:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725040061; x=1725644861; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MDJzBf8IGdLmK7elNXUdhXvuq80ykakrzOVJYuBuPkI=;
        b=aOARZe6AKPZru6V0UYe6fGmPUf83x8lJChA7WCWlg70BhlsQjXhMxqpV4OU4YpmeNf
         /tW9n/uKA0+t19N24C5i5rtkWAZxSyAure0VFdRXDLNQEHa2nNW+X0QCxN05i6B3M1fm
         vEdFIaEBfNuJkYbmJT+2BhTANClJXbWV78+8t6k+ta80i1KM8hz/E8DM6upDfwU4iQ2x
         IIN72ezsElTG3vqMgGvMRLXgvtV/lI0gwJKa7OpFmAMQF1QmWOPHLBa5Ulx0lHopWdZf
         h9qeaG+VfLhe4iKsR6dYntc4NBU6Uu7bnWrRdP50D+fH3FHOxXGjZvMpYhBwVklmjp5X
         RyKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725040061; x=1725644861;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MDJzBf8IGdLmK7elNXUdhXvuq80ykakrzOVJYuBuPkI=;
        b=xHnmsF1JBcIqJfEtBruv/BtpMV4WSzK3siThmUQ69H2H0OGDU19xsHb/HtZQ+iGWTD
         l9ZzpJKKv4pU2q7VoPY7d2WbGOdJGYuY1sEOxIzJTdI1p4AFTTZHt1PsVQwLWk1qb5qa
         a0cRLqTSFOlbrzDQb2aFDR7Z7TUhRyUJQ4yIevDqVA+i30mwxOeUxUURJsl60NDEm384
         67UVDVFc7BdaS+5QwcCkM671Fncthq/H5P9q+dqDF1+xzyF+p2QCcg1fmeNh+2jjbtBK
         C/bcYjVXr9Luz/owdiavTUdTrjaLe3bQfAvBAZ3SZzZBAzfZ2xdjqm14IDyNeDGXNHVA
         lCOA==
X-Forwarded-Encrypted: i=1; AJvYcCUyqczLtrC7iLCoMv5TlZrkbvUdTRLcaC6Du5jw7K/0qupSUvRoa29bR5JwXAsbfnjSSDK/fyY6yQboZgmb@vger.kernel.org
X-Gm-Message-State: AOJu0YyhSZk1dvoV7CNuyNQ/lOUp4GoEv73ii7yJoQ9a11eUjijDmeli
	N8124uNUYxtMvv6+haG6FNyWVv76QI6HdWiA95TcGLBCTE/8iy4VyLOROygonTs=
X-Google-Smtp-Source: AGHT+IGhOgDeT4NnElXnb9eyXKISxlR1Soh5IoalIkgVtSveV1EZJKfP2J2U9o3BJG2JKIm356mWVA==
X-Received: by 2002:a2e:bc19:0:b0:2f5:966:c22e with SMTP id 38308e7fff4ca-2f6105d74e3mr66184171fa.11.1725040060101;
        Fri, 30 Aug 2024 10:47:40 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2f615171c70sm7538841fa.85.2024.08.30.10.47.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Aug 2024 10:47:39 -0700 (PDT)
Date: Fri, 30 Aug 2024 20:47:38 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, quic_abhinavk@quicinc.com, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, quic_ebharadw@quicinc.com, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	Rob Clark <robdclark@chromium.org>
Subject: Re: [PATCH 15/21] drm/msm/dpu: Configure CWB in writeback encoder
Message-ID: <ioim2wu73yn425jpnb3qbrhtzbmdio47ri7fauxh4kd5eb57ib@wdmaeyk5yd6n>
References: <20240829-concurrent-wb-v1-0-502b16ae2ebb@quicinc.com>
 <20240829-concurrent-wb-v1-15-502b16ae2ebb@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240829-concurrent-wb-v1-15-502b16ae2ebb@quicinc.com>

On Thu, Aug 29, 2024 at 01:48:36PM GMT, Jessica Zhang wrote:
> Cache the CWB block mask in the DPU virtual encoder and configure CWB
> according to the CWB block mask within the writeback phys encoder
> 
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c           | 29 +++++++++++++++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c        | 43 ++++++++++++++++++++++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h        |  9 ++++-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h   | 18 ++++++++-
>  .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c    | 43 +++++++++++++++++++++-
>  5 files changed, 139 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> index 99eaaca405a4..c8ef59af444c 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> @@ -1236,6 +1236,33 @@ static bool dpu_crtc_has_valid_clones(struct drm_crtc *crtc,
>  	return true;
>  }
>  
> +static void dpu_crtc_set_encoder_cwb_mask(struct drm_crtc *crtc,
> +		struct drm_crtc_state *crtc_state)
> +{
> +	struct drm_encoder *drm_enc;
> +	struct dpu_crtc_state *cstate = to_dpu_crtc_state(crtc_state);
> +	int cwb_idx = 0;
> +	u32 cwb_mask = 0;
> +
> +	/*
> +	 * Since there can only be one CWB session at a time, if the CRTC LM
> +	 * starts with an even index we start with CWB_0. If the LM index is
> +	 * odd, we start with CWB_1

I'd prefer to get indices from RM. They can be set during mode_set /
atomic_check calls.

> +	 */
> +	if (cstate->mixers[0].hw_lm)
> +		cwb_idx = (cstate->mixers[0].hw_lm->idx - LM_0) % 2;
> +
> +	if (drm_crtc_in_clone_mode(crtc_state)) {
> +		for (int i = 0; i < cstate->num_mixers; i++) {
> +			cwb_mask |= (1 << cwb_idx);
> +			cwb_idx++;
> +		}
> +	}
> +
> +	drm_for_each_encoder_mask(drm_enc, crtc->dev, crtc_state->encoder_mask)
> +		dpu_encoder_set_cwb_mask(drm_enc, cwb_mask);

Ugh, no. This function writes to dpu_enc, however there is being called
from atomic_check(). You can not write non-state variables here as the
commit can get completely dropped.

> +}
> +
>  static int dpu_crtc_assign_resources(struct drm_crtc *crtc, struct drm_crtc_state *crtc_state)
>  {
>  	struct dpu_hw_blk *hw_ctl[MAX_CHANNELS_PER_CRTC];
> @@ -1329,6 +1356,8 @@ static int dpu_crtc_atomic_check(struct drm_crtc *crtc,
>  			!dpu_crtc_has_valid_clones(crtc, crtc_state))
>  		return -EINVAL;
>  
> +	dpu_crtc_set_encoder_cwb_mask(crtc, crtc_state);
> +
>  	if (!crtc_state->enable || !drm_atomic_crtc_effectively_active(crtc_state)) {
>  		DRM_DEBUG_ATOMIC("crtc%d -> enable %d, active %d, skip atomic_check\n",
>  				crtc->base.id, crtc_state->enable,
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index f1bd14d1f89e..0f8f6c0182d5 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -162,6 +162,7 @@ enum dpu_enc_rc_states {
>   *				clks and resources after IDLE_TIMEOUT time.
>   * @topology:                   topology of the display
>   * @idle_timeout:		idle timeout duration in milliseconds
> + * @cwb_mask:			current encoder is in clone mode
>   * @wide_bus_en:		wide bus is enabled on this interface
>   * @dsc:			drm_dsc_config pointer, for DSC-enabled encoders
>   */
> @@ -202,6 +203,7 @@ struct dpu_encoder_virt {
>  	struct msm_display_topology topology;
>  
>  	u32 idle_timeout;
> +	u32 cwb_mask;
>  
>  	bool wide_bus_en;
>  
> @@ -638,6 +640,33 @@ bool dpu_encoder_needs_modeset(struct drm_encoder *drm_enc, struct drm_atomic_st
>  	return false;
>  }
>  
> +void dpu_encoder_set_cwb_mask(struct drm_encoder *enc, u32 cwb_mask)
> +{
> +	struct dpu_encoder_virt *dpu_enc = to_dpu_encoder_virt(enc);
> +
> +	dpu_enc->cwb_mask = cwb_mask;
> +}
> +
> +u32 dpu_encoder_get_cwb_mask(struct drm_encoder *enc)
> +{
> +	struct dpu_encoder_virt *dpu_enc = to_dpu_encoder_virt(enc);
> +
> +	if (!dpu_enc)
> +		return 0;
> +
> +	return dpu_enc->cwb_mask;
> +}
> +
> +bool dpu_encoder_in_clone_mode(struct drm_encoder *enc)
> +{
> +	struct dpu_encoder_virt *dpu_enc = to_dpu_encoder_virt(enc);
> +
> +	if (!dpu_enc)
> +		return 0;
> +
> +	return dpu_enc->cwb_mask != 0;
> +}
> +
>  struct drm_dsc_config *dpu_encoder_get_dsc_config(struct drm_encoder *drm_enc)
>  {
>  	struct msm_drm_private *priv = drm_enc->dev->dev_private;
> @@ -2019,6 +2048,7 @@ void dpu_encoder_helper_phys_cleanup(struct dpu_encoder_phys *phys_enc)
>  	struct dpu_hw_ctl *ctl = phys_enc->hw_ctl;
>  	struct dpu_hw_intf_cfg intf_cfg = { 0 };
>  	int i;
> +	enum dpu_cwb cwb_idx;
>  	struct dpu_encoder_virt *dpu_enc;
>  
>  	dpu_enc = to_dpu_encoder_virt(phys_enc->parent);
> @@ -2040,6 +2070,19 @@ void dpu_encoder_helper_phys_cleanup(struct dpu_encoder_phys *phys_enc)
>  		/* mark WB flush as pending */
>  		if (phys_enc->hw_ctl->ops.update_pending_flush_wb)
>  			phys_enc->hw_ctl->ops.update_pending_flush_wb(ctl, phys_enc->hw_wb->idx);
> +
> +		if (dpu_enc->cwb_mask) {
> +			for (i = 0; i < hweight32(dpu_enc->cwb_mask); i++) {

This will break if cwb_mask starts from bit 1: hweight will count bits,
so the loop will not cover the highest bit set.

> +				if (!(dpu_enc->cwb_mask & (1 << i)))
> +					continue;
> +
> +				cwb_idx = i + CWB_0;
> +
> +				if (phys_enc->hw_wb->ops.setup_input_ctrl)
> +					phys_enc->hw_wb->ops.setup_input_ctrl(phys_enc->hw_wb,
> +							cwb_idx, PINGPONG_NONE);
> +			}
> +		}
>  	} else {
>  		for (i = 0; i < dpu_enc->num_phys_encs; i++) {
>  			if (dpu_enc->phys_encs[i] && phys_enc->hw_intf->ops.bind_pingpong_blk)
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
> index 0d27e50384f0..131bb8b2c0ee 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
> @@ -1,6 +1,6 @@
>  /* SPDX-License-Identifier: GPL-2.0-only */
>  /*
> - * Copyright (c) 2022 Qualcomm Innovation Center, Inc. All rights reserved.
> + * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
>   * Copyright (c) 2015-2018, The Linux Foundation. All rights reserved.
>   * Copyright (C) 2013 Red Hat
>   * Author: Rob Clark <robdclark@gmail.com>
> @@ -188,6 +188,13 @@ void dpu_encoder_update_topology(struct drm_encoder *drm_enc,
>   */
>  bool dpu_encoder_needs_modeset(struct drm_encoder *drm_enc, struct drm_atomic_state *state);
>  
> +/**
> + * dpu_encoder_set_cwb_mask - set the CWB blocks mask for the encoder
> + * @drm_enc:    Pointer to previously created drm encoder structure
> + * @cwb_mask:   CWB blocks mask to set for the encoder
> + */
> +void dpu_encoder_set_cwb_mask(struct drm_encoder *drm_enc, u32 cwb_mask);
> +
>  /**
>   * dpu_encoder_prepare_wb_job - prepare writeback job for the encoder.
>   * @drm_enc:    Pointer to previously created drm encoder structure
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
> index e77ebe3a68da..f0e5c5b073e5 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
> @@ -1,6 +1,6 @@
>  /* SPDX-License-Identifier: GPL-2.0-only */
>  /*
> - * Copyright (c) 2022 Qualcomm Innovation Center, Inc. All rights reserved.
> + * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
>   * Copyright (c) 2015-2018 The Linux Foundation. All rights reserved.
>   */
>  
> @@ -339,6 +339,22 @@ static inline enum dpu_3d_blend_mode dpu_encoder_helper_get_3d_blend_mode(
>   */
>  unsigned int dpu_encoder_helper_get_dsc(struct dpu_encoder_phys *phys_enc);
>  
> +/**
> + * dpu_encoder_get_cwb_mask - get CWB blocks mask for DPU encoder
> + *   This helper function is used by physical encoders to get the CWB blocks
> + *   mask used for this encoder.
> + * @enc: Pointer to DRM encoder structure
> + */
> +u32 dpu_encoder_get_cwb_mask(struct drm_encoder *enc);
> +
> +/**
> + * dpu_encoder_in_clone_mode - determine if DPU encoder is in clone mode
> + *   This helper is used by physical encoders to determine if the encoder is in
> + *   clone mode.
> + * @enc: Pointer to DRM encoder structure
> + */
> +bool dpu_encoder_in_clone_mode(struct drm_encoder *enc);
> +
>  /**
>   * dpu_encoder_get_dsc_config - get DSC config for the DPU encoder
>   *   This helper function is used by physical encoder to get DSC config
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
> index 882c717859ce..e1ec64ffc742 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
> @@ -1,6 +1,6 @@
>  // SPDX-License-Identifier: GPL-2.0-only
>  /*
> - * Copyright (c) 2022 Qualcomm Innovation Center, Inc. All rights reserved.
> + * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
>   */
>  
>  #define pr_fmt(fmt)	"[drm:%s:%d] " fmt, __func__, __LINE__
> @@ -264,6 +264,45 @@ static void dpu_encoder_phys_wb_setup_ctl(struct dpu_encoder_phys *phys_enc)
>  	}
>  }
>  
> +static void dpu_encoder_phys_wb_setup_cwb(struct dpu_encoder_phys *phys_enc)
> +{
> +	struct dpu_hw_wb *hw_wb;
> +	struct dpu_hw_ctl *hw_ctl;
> +	struct dpu_hw_pingpong *hw_pp;
> +	u32 cwb_mask, cwb_idx;
> +
> +	if (!phys_enc)
> +		return;
> +
> +	hw_wb = phys_enc->hw_wb;
> +	hw_ctl = phys_enc->hw_ctl;
> +	hw_pp = phys_enc->hw_pp;
> +
> +	if (!hw_wb || !hw_ctl || !hw_pp) {
> +		DPU_DEBUG("[wb:%d] no ctl or pp assigned\n", hw_wb->idx - WB_0);
> +		return;
> +	}
> +
> +	cwb_mask = dpu_encoder_get_cwb_mask(phys_enc->parent);
> +
> +	for (int i = 0; i < hweight32(cwb_mask); i++) {
> +		if (!(cwb_mask & (1 << i)))
> +			continue;
> +
> +		cwb_idx = i + CWB_0;
> +
> +		if (hw_wb->ops.setup_input_ctrl)
> +			hw_wb->ops.setup_input_ctrl(hw_wb, cwb_idx, hw_pp->idx + i);
> +
> +		/*
> +		 * The CWB mux supports using LM or DSPP as tap points. For now,
> +		 * always use DSPP tap point
> +		 */
> +		if (hw_wb->ops.setup_input_mode)
> +			hw_wb->ops.setup_input_mode(hw_wb, cwb_idx, INPUT_MODE_DSPP_OUT);
> +	}
> +}
> +
>  /**
>   * _dpu_encoder_phys_wb_update_flush - flush hardware update
>   * @phys_enc:	Pointer to physical encoder
> @@ -342,6 +381,8 @@ static void dpu_encoder_phys_wb_setup(
>  
>  	dpu_encoder_helper_phys_setup_cdm(phys_enc, dpu_fmt, CDM_CDWN_OUTPUT_WB);
>  
> +	dpu_encoder_phys_wb_setup_cwb(phys_enc);
> +
>  	dpu_encoder_phys_wb_setup_ctl(phys_enc);
>  }
>  
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

