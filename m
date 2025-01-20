Return-Path: <linux-arm-msm+bounces-45588-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C59EA16D37
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Jan 2025 14:16:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 66AC13A2A97
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Jan 2025 13:15:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E09BD1E1C3B;
	Mon, 20 Jan 2025 13:15:20 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from relay03.th.seeweb.it (relay03.th.seeweb.it [5.144.164.164])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE3091E1C03;
	Mon, 20 Jan 2025 13:15:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.144.164.164
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737378920; cv=none; b=isfm2Sp/Aw8uBh3pZMOA1qxTFE7NCYaAbpSTieKC2RiZz1A6Wbu5F2GGe8pa3DtyL+he+IQ96DjU9g1PQ+gfR8Lq5X64KAJosZRJ2u6p7azQ43PXGmsWYA49P+RuHHquzre5djSp5vY4JBjflSisBORthfPjivtXgrd4c8fG5ys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737378920; c=relaxed/simple;
	bh=qQmFBnOdsh3eOhYVBYKnv643wOTpBuLnPTaD6AtInMI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qMj86eClB03FfaZwmM4UgJ+TcAS3+2jEKw3Ka5uIQXql5w70T7pz8cEhh936hjIROL89mOLMXIKiWWQ2wCHcxuKLXoo18KZRpVFcS72Imtq0eBIULfOf/5EtV4wk9WZG5s4VXg2/lGGcH7U55XOdyVEZkiQzqX6QxuvOfJF6u/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=somainline.org; spf=pass smtp.mailfrom=somainline.org; arc=none smtp.client-ip=5.144.164.164
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=somainline.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=somainline.org
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl [94.211.6.86])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 34FBD201E9;
	Mon, 20 Jan 2025 14:15:15 +0100 (CET)
Date: Mon, 20 Jan 2025 14:15:13 +0100
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Jun Nie <jun.nie@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	Jessica Zhang <quic_jesszhan@quicinc.com>
Subject: Re: [PATCH v5 08/15] drm/msm/dpu: bind correct pingpong for quad pipe
Message-ID: <6n655caflr2snsgmqtmpzxt4jynrwjqdjurnixujfuefldxhxj@uunzpzfezfqy>
References: <20250118-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-33-v5-0-9701a16340da@linaro.org>
 <20250118-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-33-v5-8-9701a16340da@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250118-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-33-v5-8-9701a16340da@linaro.org>

On 2025-01-18 00:00:51, Jun Nie wrote:
> There are 2 interfaces and 4 pingpong in quad pipe. Map the 2nd
> interface to 3rd PP instead of the 2nd PP.

Can you explain why this patch uses the number of LMs, instead of dividing the
number of PPs divided by the number of physical encoders?  This detail is not
explained at all, or that we're filling hw_lm now for no other reason.

- Marijn

> Signed-off-by: Jun Nie <jun.nie@linaro.org>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 15 +++++++++++++--
>  1 file changed, 13 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index 018a1a49ca7d1..b0cab3ccbb57c 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -1220,7 +1220,8 @@ static void dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
>  	struct dpu_hw_blk *hw_pp[MAX_CHANNELS_PER_ENC];
>  	struct dpu_hw_blk *hw_ctl[MAX_CHANNELS_PER_ENC];
>  	struct dpu_hw_blk *hw_dsc[MAX_CHANNELS_PER_ENC];
> -	int num_ctl, num_pp, num_dsc;
> +	struct dpu_hw_blk *hw_lm[MAX_CHANNELS_PER_ENC];
> +	int num_lm, num_ctl, num_pp, num_dsc, num_pp_per_intf;
>  	unsigned int dsc_mask = 0;
>  	int i;
>  
> @@ -1275,11 +1276,21 @@ static void dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
>  		dpu_enc->cur_master->hw_cdm = hw_cdm ? to_dpu_hw_cdm(hw_cdm) : NULL;
>  	}
>  
> +	num_lm = dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
> +		drm_enc->crtc, DPU_HW_BLK_LM, hw_lm, ARRAY_SIZE(hw_lm));
> +
> +
> +	/*
> +	 * There may be 4 PP and 2 INTF for quad pipe case, so INTF is not
> +	 * mapped to PP 1:1. Let's calculate the stride with pipe/INTF
> +	 */
> +	num_pp_per_intf = num_lm / dpu_enc->num_phys_encs;
> +
>  	for (i = 0; i < dpu_enc->num_phys_encs; i++) {
>  		struct dpu_encoder_phys *phys = dpu_enc->phys_encs[i];
>  		struct dpu_hw_ctl *ctl0 = to_dpu_hw_ctl(hw_ctl[0]);
>  
> -		phys->hw_pp = dpu_enc->hw_pp[i];
> +		phys->hw_pp = dpu_enc->hw_pp[num_pp_per_intf * i];
>  		if (!phys->hw_pp) {
>  			DPU_ERROR_ENC(dpu_enc,
>  				"no pp block assigned at idx: %d\n", i);
> 
> -- 
> 2.34.1
> 

