Return-Path: <linux-arm-msm+bounces-32379-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CCAB3984F0B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Sep 2024 01:41:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EF6811C22D8D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Sep 2024 23:41:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 344EE1891B2;
	Tue, 24 Sep 2024 23:41:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wldFcCNt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2358D146D78
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Sep 2024 23:41:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727221285; cv=none; b=Xd9yMOjG5PkMPN9J/Bl1bYcU9SDvl2YUHwezQWrWLG/VxFE4ibYrI2EwJUzN2dbLq5Ps9mODrjygrrRgIpX08351jnqtRzYW5E7TvhK6lG7wKldQ7IC/Qn2euJM78TRu842PTGUEh7iHU3dp8e+PS49/neSbHp7BAb59AjKeRdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727221285; c=relaxed/simple;
	bh=qfzk0A5TKpWfM4Pcso8w17fGNMAala27P7ommRtIetY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O+WWtZ8NAQfyUb+4vCZtht9/LAG34Qy415uFegb4NiVJ086/h2mwDOakHvQB7ecDTqf6d2jhN2ZkJz7pKfp4T/jRhZj58Uofft8P3dExkajEMJn9vVejRF7QXqsHtPDR4yM/DF28B0z+5D6UZVN6iqxcPLhU86OnnSLbPSt2OxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wldFcCNt; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2f77be8ffecso61851341fa.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Sep 2024 16:41:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727221281; x=1727826081; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2feo948SmaV8ow3qJ2/9/7VRCJ6SWmFcxCQdCFyNVVw=;
        b=wldFcCNtLl4Ko/jsXJRbqgN1mJJeoX+2V9vZvEKsaX7jFSMyPMfjs+Y5lVUr2oK4Y+
         RzYJytADK3mfHle3roCf8kWLOqwa6AcYPt8O3d4OWcMYJLtRdOEmWKW6tOx0Srb5tU5z
         JUPsw9MXUAVZgiLoDqPZDQpOOWU91CRRVnlnZnqBwx0pmLRaWJhZgQ4nMxhnMMJLH6+E
         OGLT0Yx8xlOQTnNwt1swvwa9F4cGRQLyAVjVKiGpMkOey1Yr6BTpPsh6wTKjWoAXcIlD
         KjGW2rMyeTVeduIl4+HqLPvhKXs+UpF2Fz89kYpx0Aa/0ZAH3JX0+cF+UXkE5vRrjc2p
         fE5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727221281; x=1727826081;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2feo948SmaV8ow3qJ2/9/7VRCJ6SWmFcxCQdCFyNVVw=;
        b=tlUGEtunEesm9A/XuqYSxjnN79HnsZpP/v2mo3LJkEs+BFCLbC1cwTvEdg1haPXG35
         srbT+VrSinbDu8r5x5knb0h7x3KniloDbEbkhmLrjVo/D3vCzy5lQ19m00wIFMKTRVzJ
         1FvGAVHbfKU3yUE4EfUckKufg1lE7IJ/4twfIPbD2HmYOvbf9hYKcH4dX4NOhO5DqEop
         gro2Tydr8kX6aboeWslGWwsM8aWIst7EM4GrbTh4WJqUjXun+8kdgP//hcEogoAqN6cS
         MFwn8E/mV21H3p6EkvEr10O5o33EaGDSMKnlsfRBykhpuEwUFgEFz11L1t6n3wHDRw8b
         Jl5A==
X-Forwarded-Encrypted: i=1; AJvYcCWl4rmnLc++HigefsXxwnmNW7Lkd3PZgr3RPeJw+Nt5PtXuWEIPddz5JJ/V3fiCgE7VgDQxHLqWTZHQgGBo@vger.kernel.org
X-Gm-Message-State: AOJu0YwPRinygBk8TJHkokCCFWbvDzXjVI6yTlgt33+ugRLmS+4xZnx2
	Bw79Lw0qpFDo7SX9sc+Kc6hVdCBdb7Pd0sDPBs3EaSl7/iSjz3Km2LVK2Cp/Ync=
X-Google-Smtp-Source: AGHT+IFdyRu7TASU0zlCTVpDX5/bBlv6G+05vYgnnTIL+dEQFPu7NNL6mllXHkXoMwweXQLGC70+yg==
X-Received: by 2002:a05:6512:2348:b0:52f:cdb0:11c0 with SMTP id 2adb3069b0e04-538704983ffmr412811e87.21.1727221280989;
        Tue, 24 Sep 2024 16:41:20 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-537a864da14sm354777e87.258.2024.09.24.16.41.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Sep 2024 16:41:20 -0700 (PDT)
Date: Wed, 25 Sep 2024 02:41:18 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, quic_abhinavk@quicinc.com, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, quic_ebharadw@quicinc.com, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	Rob Clark <robdclark@chromium.org>, Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH v2 16/22] drm/msm/dpu: Configure CWB in writeback encoder
Message-ID: <qfqvtbc2o2xrv35caonsvhykmq6bvjpc5plnknjgkodrsoez6d@rpobkvdyqeb2>
References: <20240924-concurrent-wb-v2-0-7849f900e863@quicinc.com>
 <20240924-concurrent-wb-v2-16-7849f900e863@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240924-concurrent-wb-v2-16-7849f900e863@quicinc.com>

On Tue, Sep 24, 2024 at 03:59:32PM GMT, Jessica Zhang wrote:
> Cache the CWB block mask in the DPU virtual encoder and configure CWB
> according to the CWB block mask within the writeback phys encoder
> 
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c        | 83 +++++++++++++++++++++-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h   | 16 ++++-
>  .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c    |  4 +-
>  3 files changed, 100 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index b2f0bf412451..2628f2d55cb3 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -24,6 +24,7 @@
>  #include "dpu_hw_catalog.h"
>  #include "dpu_hw_intf.h"
>  #include "dpu_hw_ctl.h"
> +#include "dpu_hw_cwb.h"
>  #include "dpu_hw_dspp.h"
>  #include "dpu_hw_dsc.h"
>  #include "dpu_hw_merge3d.h"
> @@ -139,6 +140,7 @@ enum dpu_enc_rc_states {
>   *			num_phys_encs.
>   * @hw_dsc:		Handle to the DSC blocks used for the display.
>   * @dsc_mask:		Bitmask of used DSC blocks.
> + * @cwb_mask		Bitmask of used CWB muxes
>   * @intfs_swapped:	Whether or not the phys_enc interfaces have been swapped
>   *			for partial update right-only cases, such as pingpong
>   *			split where virtual pingpong does not generate IRQs
> @@ -185,6 +187,7 @@ struct dpu_encoder_virt {
>  	struct dpu_hw_dsc *hw_dsc[MAX_CHANNELS_PER_ENC];
>  
>  	unsigned int dsc_mask;
> +	unsigned int cwb_mask;
>  
>  	bool intfs_swapped;
>  
> @@ -1063,6 +1066,7 @@ static void dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
>  	int num_cwb = 0;
>  	bool is_cwb_encoder;
>  	unsigned int dsc_mask = 0;
> +	unsigned int cwb_mask = 0;
>  	int i;
>  
>  	if (!drm_enc) {
> @@ -1103,8 +1107,12 @@ static void dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
>  						       ARRAY_SIZE(hw_pp));
>  	}
>  
> -	for (i = 0; i < num_cwb; i++)
> +	for (i = 0; i < num_cwb; i++) {
>  		dpu_enc->hw_cwb[i] = to_dpu_hw_cwb(hw_cwb[i]);
> +		cwb_mask |= BIT(dpu_enc->hw_cwb[i]->idx - CWB_0);
> +	}
> +
> +	dpu_enc->cwb_mask = cwb_mask;
>  
>  	dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
>  			drm_enc->crtc, DPU_HW_BLK_CTL, hw_ctl, ARRAY_SIZE(hw_ctl));
> @@ -2071,6 +2079,9 @@ void dpu_encoder_helper_phys_cleanup(struct dpu_encoder_phys *phys_enc)
>  		}
>  	}
>  
> +	if (dpu_enc->cwb_mask)
> +		dpu_encoder_helper_phys_setup_cwb(phys_enc, false);
> +
>  	/* reset the merge 3D HW block */
>  	if (phys_enc->hw_pp && phys_enc->hw_pp->merge_3d) {
>  		phys_enc->hw_pp->merge_3d->ops.setup_3d_mode(phys_enc->hw_pp->merge_3d,
> @@ -2114,6 +2125,68 @@ void dpu_encoder_helper_phys_cleanup(struct dpu_encoder_phys *phys_enc)
>  	ctl->ops.clear_pending_flush(ctl);
>  }
>  
> +void dpu_encoder_helper_phys_setup_cwb(struct dpu_encoder_phys *phys_enc,
> +				       bool enable)
> +{
> +	struct dpu_encoder_virt *dpu_enc = to_dpu_encoder_virt(phys_enc->parent);
> +	struct dpu_hw_cwb *hw_cwb;
> +	struct dpu_hw_cwb_setup_cfg cwb_cfg;
> +
> +	struct dpu_kms *dpu_kms;
> +	struct dpu_global_state *global_state;
> +	struct dpu_hw_blk *rt_pp_list[MAX_CHANNELS_PER_ENC];
> +	int num_pp, rt_pp_idx[MAX_CHANNELS_PER_ENC];
> +
> +	if (!phys_enc || !phys_enc->hw_wb || !dpu_enc->cwb_mask)
> +		return;

We have already dereferened phys_enc, so checking that it's not NULL is
futile. Also we know that the function is only called if cwb_mask is not
zero, so the last check is also useless.

> +
> +	dpu_kms = phys_enc->dpu_kms;
> +	global_state = dpu_kms_get_existing_global_state(dpu_kms);
> +	num_pp = dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
> +					       phys_enc->parent->crtc,
> +					       DPU_HW_BLK_PINGPONG, rt_pp_list,
> +					       ARRAY_SIZE(rt_pp_list));
> +
> +	if (num_pp == 0 || num_pp > MAX_CHANNELS_PER_ENC) {
> +		DPU_DEBUG_ENC(dpu_enc, "invalid num_pp %d\n", num_pp);
> +		return;
> +	}
> +
> +	for (int i = 0; i < num_pp; i++) {
> +		struct dpu_hw_pingpong *hw_pp = to_dpu_hw_pingpong(rt_pp_list[i]);
> +
> +		for (int j = 0; j < ARRAY_SIZE(dpu_enc->hw_cwb); j++) {
> +			hw_cwb = dpu_enc->hw_cwb[i];
> +
> +			/*
> +			 * Even CWB muxes must take input from even real-time
> +			 * pingpongs and odd CWB muxes must take input from odd
> +			 * pingpongs
> +			 */
> +			if (hw_pp->idx % 2 == hw_cwb->idx % 2) {

What about `if (a != b) continue;`?

> +				rt_pp_idx[i] = enable ? hw_pp->idx : PINGPONG_NONE;

Can we call config_cwb() here directly with no intermediate arrays?

> +				break;
> +			}
> +		}
> +	}
> +
> +	/*
> +	 * The CWB mux supports using LM or DSPP as tap points. For now,
> +	 * always use LM tap point
> +	 */
> +	cwb_cfg.input = INPUT_MODE_LM_OUT;
> +
> +	for (int i = 0; i < MAX_CHANNELS_PER_ENC; i++) {
> +		hw_cwb = dpu_enc->hw_cwb[i];
> +		if (!hw_cwb)
> +			continue;
> +
> +		cwb_cfg.pp_idx = rt_pp_idx[i];
> +
> +		hw_cwb->ops.config_cwb(hw_cwb, &cwb_cfg);
> +	}
> +}
> +
>  void dpu_encoder_helper_phys_setup_cdm(struct dpu_encoder_phys *phys_enc,
>  				       const struct msm_format *dpu_fmt,
>  				       u32 output_type)
> @@ -2557,6 +2630,14 @@ enum dpu_intf_mode dpu_encoder_get_intf_mode(struct drm_encoder *encoder)
>  	return INTF_MODE_NONE;
>  }
>  
> +unsigned int dpu_encoder_helper_get_cwb(struct dpu_encoder_phys *phys_enc)

it's called get_cwb, but it returns a mask?

> +{
> +	struct drm_encoder *encoder = phys_enc->parent;
> +	struct dpu_encoder_virt *dpu_enc = to_dpu_encoder_virt(encoder);
> +
> +	return dpu_enc->cwb_mask;
> +}
> +
>  unsigned int dpu_encoder_helper_get_dsc(struct dpu_encoder_phys *phys_enc)
>  {
>  	struct drm_encoder *encoder = phys_enc->parent;
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
> index e77ebe3a68da..d7a02d1f8053 100644
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
> @@ -331,6 +331,12 @@ static inline enum dpu_3d_blend_mode dpu_encoder_helper_get_3d_blend_mode(
>  	return BLEND_3D_NONE;
>  }
>  
> +/**
> + * dpu_encoder_helper_get_cwb - get CWB blocks mask for the DPU encoder
> + * @phys_enc: Pointer to physical encoder structure
> + */

All kerneldoc at the function definition, please. I plan to go through
the existing codebase and move existing docs. It seems to be the only
way to get kerneldoc-related warnings.

> +unsigned int dpu_encoder_helper_get_cwb(struct dpu_encoder_phys *phys_enc);
> +
>  /**
>   * dpu_encoder_helper_get_dsc - get DSC blocks mask for the DPU encoder
>   *   This helper function is used by physical encoder to get DSC blocks mask
> @@ -400,6 +406,14 @@ int dpu_encoder_helper_wait_for_irq(struct dpu_encoder_phys *phys_enc,
>   */
>  void dpu_encoder_helper_phys_cleanup(struct dpu_encoder_phys *phys_enc);
>  
> +/**
> + * dpu_encoder_helper_phys_setup_cwb - helper to configure CWB muxes
> + * @phys_enc: Pointer to physical encoder structure
> + * @enable: Enable CWB mux
> + */
> +void dpu_encoder_helper_phys_setup_cwb(struct dpu_encoder_phys *phys_enc,
> +				       bool enable);
> +
>  /**
>   * dpu_encoder_helper_phys_setup_cdm - setup chroma down sampling block
>   * @phys_enc: Pointer to physical encoder
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
> index 882c717859ce..e88c4d91041f 100644
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
> @@ -342,6 +342,8 @@ static void dpu_encoder_phys_wb_setup(
>  
>  	dpu_encoder_helper_phys_setup_cdm(phys_enc, dpu_fmt, CDM_CDWN_OUTPUT_WB);
>  
> +	dpu_encoder_helper_phys_setup_cwb(phys_enc, true);
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

