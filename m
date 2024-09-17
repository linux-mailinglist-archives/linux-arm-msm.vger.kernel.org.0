Return-Path: <linux-arm-msm+bounces-31938-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AD5497B53D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Sep 2024 23:32:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B7D891C21866
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Sep 2024 21:32:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03C46189F30;
	Tue, 17 Sep 2024 21:32:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uUsd9osz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E87211531C5
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Sep 2024 21:32:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726608722; cv=none; b=CHVPV9s5s48tSwt53nuto8DB2m/xCAlkWNOo9Dlnhju23HVCPkvOnapUl0TeGsIZswvb8X6qISTKY90Stivr54MT+SuxZZBKk5THwYc/ZaOiwUf2lNhpq8iYP9QqEPhZbAxUa5Eb0ue+fv7rna4GbBq7/OnqyAvWBckeoUJ5dNA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726608722; c=relaxed/simple;
	bh=7imgg8MHnR9gxNsCcaxlqJr1rg23llfOC/+tu1YfRZw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fjZG81nwj38/50VD+2oTskerp3XQOD6TVsAm8OXr9AQnKp7wO5eOQlw8cObp0Cop1E6cx7OwQ2PU4f4veVCGXPzpSUOkaHgTlYtpszagi5XanO1AjDCae8+bSswyIOo44OG1ilZT7F3lCk2dnAAEtGOgGcdVoAypbdzP4evxw7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uUsd9osz; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-53653682246so7257086e87.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Sep 2024 14:32:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726608719; x=1727213519; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1R6BTw3CyHrPVMyIN0XqxDT3g5ElbidWKYOyL9ivcME=;
        b=uUsd9oszLmhHzREMuF0DhArJ4j2m5ClBXdtpkH+QKKaNONHEPw08MffuFNnr5FCPQm
         UhiwHTDwAgxy+FuP0cGTnjDxw6knaz7SwqKK+MtXgmq8nSFu7ASc02aQgPZbbCvBLoAB
         le/BVaBe6J2iWYF+AAXmsv1JsuKcHjpNyb++Ko68YxygnmSy74snzr5V+qGqfPvyCyR2
         /Aw7zChbVFahu12GTlqSBCH80ErbSuMqfmphE4WXvs8sPgzbKjVxH8qvlKdfcfl72CZ7
         wi3TJKSa2slxY+Lf6PSunKn2/ZKPGNb7QPxhh97nLedb83RbccMXA5RFgpsPNUjjBGNI
         ef8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726608719; x=1727213519;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1R6BTw3CyHrPVMyIN0XqxDT3g5ElbidWKYOyL9ivcME=;
        b=dQih6CYTHVCQsZ8uu96FkTeA1lDzzECKRouZhAua8zYkzJFeKgimmoUquwHCv/HzE/
         fsuMZL/FZbYdktoFy9Szq4XW/t0bMowI+TQ2a2fUJpqgmk2Z77ilcYaD2f9HCvnUdb2U
         pVhk+LdFEa+loi83A/8JrFCXkjCer2GtypGvBxSb77kPUUP9X8bX9ZVSTu1LX9TzsLEJ
         BxnYVlYBVr+tv700vyaf7AJ6TfZE4GX14DsZ+qdC825QPwlHaoPHIldMhzF5unqQOyuS
         cYIfkheDJzMXvniI/mQPo+WRW+BULYqUPeWqFo4WnO6DueiBEBUptfYCBwTWRdrc3kjw
         JRcw==
X-Forwarded-Encrypted: i=1; AJvYcCWYc4j/bLwT1/BB0sTthytASANbCpH0IAJJ+OWR1mopRTjVbFWRvj1bH0pKx7aiE6CfOz3efiHemcwoAMbk@vger.kernel.org
X-Gm-Message-State: AOJu0YwHZdjj7VUk0uhrtZVSqlt9fgLtp3nRuyBaDJBgCV/20XxJGsap
	0WpbnZZJfgYBT/pGKnUepAIqx2+cW4NH9zzZW4xUk2pyTavUGHHmeFfQf+c1lp8=
X-Google-Smtp-Source: AGHT+IHhcqmPzBEx+mRQGBWjo5mWxJ/GGeo4PSbS+lWwhv89D5TADe1zKDPSG1PO6BnyN1AO9gTdww==
X-Received: by 2002:a05:6512:3995:b0:52c:e326:f4cf with SMTP id 2adb3069b0e04-53678fb4606mr12705813e87.3.1726608718749;
        Tue, 17 Sep 2024 14:31:58 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5368704def1sm1313577e87.84.2024.09.17.14.31.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Sep 2024 14:31:57 -0700 (PDT)
Date: Wed, 18 Sep 2024 00:31:55 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Akhil P Oommen <quic_akhilpo@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	Puranam V G Tejaswi <quic_pvgtejas@quicinc.com>
Subject: Re: [PATCH 1/3] drm/msm/a6xx: Add support for A663
Message-ID: <vahykyu4cck26sstulzukl323rskjoqebogz4ckv2aoibb2eo6@kmbrw7voa5tx>
References: <20240918-a663-gpu-support-v1-0-25fea3f3d64d@quicinc.com>
 <20240918-a663-gpu-support-v1-1-25fea3f3d64d@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240918-a663-gpu-support-v1-1-25fea3f3d64d@quicinc.com>

On Wed, Sep 18, 2024 at 02:08:41AM GMT, Akhil P Oommen wrote:
> From: Puranam V G Tejaswi <quic_pvgtejas@quicinc.com>
> 
> Add support for Adreno 663 found on sa8775p based platforms.
> 
> Signed-off-by: Puranam V G Tejaswi <quic_pvgtejas@quicinc.com>
> Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 19 ++++++++++++++++++
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c     |  8 +++++++-
>  drivers/gpu/drm/msm/adreno/a6xx_hfi.c     | 33 +++++++++++++++++++++++++++++++
>  drivers/gpu/drm/msm/adreno/adreno_gpu.h   |  5 +++++
>  4 files changed, 64 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> index 0312b6ee0356..8d8d0d7630f0 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> @@ -972,6 +972,25 @@ static const struct adreno_info a6xx_gpus[] = {
>  			.prim_fifo_threshold = 0x00300200,
>  		},
>  		.address_space_size = SZ_16G,
> +	}, {
> +		.chip_ids = ADRENO_CHIP_IDS(0x06060300),
> +		.family = ADRENO_6XX_GEN4,
> +		.fw = {
> +			[ADRENO_FW_SQE] = "a660_sqe.fw",
> +			[ADRENO_FW_GMU] = "a663_gmu.bin",
> +		},
> +		.gmem = SZ_1M + SZ_512K,
> +		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
> +		.quirks = ADRENO_QUIRK_HAS_CACHED_COHERENT |
> +			ADRENO_QUIRK_HAS_HW_APRIV,
> +		.init = a6xx_gpu_init,
> +		.a6xx = &(const struct a6xx_info) {
> +			.hwcg = a690_hwcg,
> +			.protect = &a660_protect,
> +			.gmu_cgc_mode = 0x00020200,
> +			.prim_fifo_threshold = 0x00300200,
> +		},
> +		.address_space_size = SZ_16G,
>  	}, {
>  		.chip_ids = ADRENO_CHIP_IDS(0x06030500),
>  		.family = ADRENO_6XX_GEN4,
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> index 06cab2c6fd66..e317780caeae 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -541,6 +541,12 @@ static void a6xx_calc_ubwc_config(struct adreno_gpu *gpu)
>  		gpu->ubwc_config.macrotile_mode = 1;
>  	}
>  
> +	if (adreno_is_a663(gpu)) {
> +		gpu->ubwc_config.highest_bank_bit = 13;
> +		gpu->ubwc_config.ubwc_swizzle = 0x4;
> +		gpu->ubwc_config.macrotile_mode = 1;

If this looks like A660 / A690, shouldn't the driver also enable .amsbc,
.rgb565_predicator and .uavflagprd_inv?

> +	}
> +
>  	if (adreno_is_7c3(gpu)) {
>  		gpu->ubwc_config.highest_bank_bit = 14;
>  		gpu->ubwc_config.amsbc = 1;
> @@ -1062,7 +1068,7 @@ static int hw_init(struct msm_gpu *gpu)
>  	if (adreno_is_a690(adreno_gpu))
>  		gpu_write(gpu, REG_A6XX_UCHE_CMDQ_CONFIG, 0x90);
>  	/* Set dualQ + disable afull for A660 GPU */
> -	else if (adreno_is_a660(adreno_gpu))
> +	else if (adreno_is_a660(adreno_gpu) || adreno_is_a663(adreno_gpu))
>  		gpu_write(gpu, REG_A6XX_UCHE_CMDQ_CONFIG, 0x66906);
>  	else if (adreno_is_a7xx(adreno_gpu))
>  		gpu_write(gpu, REG_A6XX_UCHE_CMDQ_CONFIG,
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_hfi.c b/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
> index cdb3f6e74d3e..f1196d66055c 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
> @@ -478,6 +478,37 @@ static void a660_build_bw_table(struct a6xx_hfi_msg_bw_table *msg)
>  	msg->cnoc_cmds_data[1][0] =  0x60000001;
>  }
>  
> +static void a663_build_bw_table(struct a6xx_hfi_msg_bw_table *msg)
> +{
> +	/*
> +	 * Send a single "off" entry just to get things running
> +	 * TODO: bus scaling
> +	 */
> +	msg->bw_level_num = 1;
> +
> +	msg->ddr_cmds_num = 3;
> +	msg->ddr_wait_bitmask = 0x07;
> +
> +	msg->ddr_cmds_addrs[0] = 0x50004;
> +	msg->ddr_cmds_addrs[1] = 0x50000;
> +	msg->ddr_cmds_addrs[2] = 0x500b4;
> +
> +	msg->ddr_cmds_data[0][0] =  0x40000000;
> +	msg->ddr_cmds_data[0][1] =  0x40000000;
> +	msg->ddr_cmds_data[0][2] =  0x40000000;
> +
> +	/*
> +	 * These are the CX (CNOC) votes - these are used by the GMU but the
> +	 * votes are known and fixed for the target
> +	 */
> +	msg->cnoc_cmds_num = 1;
> +	msg->cnoc_wait_bitmask = 0x01;
> +
> +	msg->cnoc_cmds_addrs[0] = 0x50058;
> +	msg->cnoc_cmds_data[0][0] =  0x40000000;
> +	msg->cnoc_cmds_data[1][0] =  0x60000001;
> +}
> +
>  static void adreno_7c3_build_bw_table(struct a6xx_hfi_msg_bw_table *msg)
>  {
>  	/*
> @@ -646,6 +677,8 @@ static int a6xx_hfi_send_bw_table(struct a6xx_gmu *gmu)
>  		adreno_7c3_build_bw_table(&msg);
>  	else if (adreno_is_a660(adreno_gpu))
>  		a660_build_bw_table(&msg);
> +	else if (adreno_is_a663(adreno_gpu))
> +		a663_build_bw_table(&msg);
>  	else if (adreno_is_a690(adreno_gpu))
>  		a690_build_bw_table(&msg);
>  	else if (adreno_is_a730(adreno_gpu))
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> index 58d7e7915c57..10f8f25d8826 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> @@ -455,6 +455,11 @@ static inline int adreno_is_a680(const struct adreno_gpu *gpu)
>  	return adreno_is_revn(gpu, 680);
>  }
>  
> +static inline int adreno_is_a663(const struct adreno_gpu *gpu)
> +{
> +	return gpu->info->chip_ids[0] == 0x06060300;
> +}
> +
>  static inline int adreno_is_a690(const struct adreno_gpu *gpu)
>  {
>  	return gpu->info->chip_ids[0] == 0x06090000;
> 
> -- 
> 2.45.2
> 

-- 
With best wishes
Dmitry

