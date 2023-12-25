Return-Path: <linux-arm-msm+bounces-6029-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F27FE81F0D4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Dec 2023 18:18:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 691B71F22105
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Dec 2023 17:18:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 623C246433;
	Wed, 27 Dec 2023 17:17:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=z3ntu.xyz header.i=@z3ntu.xyz header.b="ntejb9aF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from ahti.lucaweiss.eu (ahti.lucaweiss.eu [128.199.32.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BBE846B81;
	Wed, 27 Dec 2023 17:17:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=z3ntu.xyz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=z3ntu.xyz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=z3ntu.xyz; s=s1;
	t=1703697016; bh=EzO2Os7VBSDtEWCulDHnrYefncJjDEnsfBW7sIfrJgM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=ntejb9aFOsla7Wbzu3LBmdgowdkG2XjS3H4uZiDm0ZAv5bAuKExQ3Oo5YL/wLjGHt
	 LQDd6GiV4fNyK+zQb4ZkcFBC+ZsK7/sSCc0LtNzv5bT41/cwsX7aPkitfMzAc1vgiU
	 BsLufPnd9g16HjnIiahMMLSIt79Ig9nBohB+D7Lk=
From: Luca Weiss <luca@z3ntu.xyz>
To: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] drm/msm/adreno: Add A305B support
Date: Mon, 25 Dec 2023 22:12:56 +0100
Message-ID: <2709745.mvXUDI8C0e@z3ntu.xyz>
In-Reply-To: <20231130-msm8226-gpu-v1-2-6bb2f1b29e49@z3ntu.xyz>
References:
 <20231130-msm8226-gpu-v1-0-6bb2f1b29e49@z3ntu.xyz>
 <20231130-msm8226-gpu-v1-2-6bb2f1b29e49@z3ntu.xyz>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Donnerstag, 30. November 2023 21:35:19 CET Luca Weiss wrote:
> Add support for the Adreno 305B GPU that is found in MSM8226(v2) SoC.
> Previously this was mistakenly claimed to be supported but using wrong
> a configuration.
> 
> In MSM8226v1 there's also a A305B but with chipid 0x03000510 which
> should work with the same configuration but due to lack of hardware for
> testing this is not added.
> 
> Signed-off-by: Luca Weiss <luca@z3ntu.xyz>

Hi all,

Any chance this can be picked up for v6.8? The dts patch has already been 
picked up :)

Regards
Luca

> ---
>  drivers/gpu/drm/msm/adreno/a3xx_gpu.c      | 15 ++++++++++++---
>  drivers/gpu/drm/msm/adreno/adreno_device.c | 15 +++++++++++----
>  drivers/gpu/drm/msm/adreno/adreno_gpu.h    |  5 +++++
>  3 files changed, 28 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a3xx_gpu.c
> b/drivers/gpu/drm/msm/adreno/a3xx_gpu.c index c86b377f6f0d..5fc29801c4c7
> 100644
> --- a/drivers/gpu/drm/msm/adreno/a3xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a3xx_gpu.c
> @@ -134,6 +134,13 @@ static int a3xx_hw_init(struct msm_gpu *gpu)
>  		/* Set up AOOO: */
>  		gpu_write(gpu, REG_A3XX_VBIF_OUT_AXI_AOOO_EN, 0x0000003c);
>  		gpu_write(gpu, REG_A3XX_VBIF_OUT_AXI_AOOO, 0x003c003c);
> +	} else if (adreno_is_a305b(adreno_gpu)) {
> +		gpu_write(gpu, REG_A3XX_VBIF_IN_RD_LIM_CONF0, 0x00181818);
> +		gpu_write(gpu, REG_A3XX_VBIF_IN_WR_LIM_CONF0, 0x00181818);
> +		gpu_write(gpu, REG_A3XX_VBIF_OUT_RD_LIM_CONF0, 
0x00000018);
> +		gpu_write(gpu, REG_A3XX_VBIF_OUT_WR_LIM_CONF0, 
0x00000018);
> +		gpu_write(gpu, REG_A3XX_VBIF_DDR_OUT_MAX_BURST, 
0x00000303);
> +		gpu_write(gpu, REG_A3XX_VBIF_ROUND_ROBIN_QOS_ARB, 0x0003);
>  	} else if (adreno_is_a306(adreno_gpu)) {
>  		gpu_write(gpu, REG_A3XX_VBIF_ROUND_ROBIN_QOS_ARB, 0x0003);
>  		gpu_write(gpu, REG_A3XX_VBIF_OUT_RD_LIM_CONF0, 
0x0000000a);
> @@ -230,7 +237,9 @@ static int a3xx_hw_init(struct msm_gpu *gpu)
>  	gpu_write(gpu, REG_A3XX_UCHE_CACHE_MODE_CONTROL_REG, 0x00000001);
> 
>  	/* Enable Clock gating: */
> -	if (adreno_is_a306(adreno_gpu))
> +	if (adreno_is_a305b(adreno_gpu))
> +		gpu_write(gpu, REG_A3XX_RBBM_CLOCK_CTL, 0xaaaaaaaa);
> +	else if (adreno_is_a306(adreno_gpu))
>  		gpu_write(gpu, REG_A3XX_RBBM_CLOCK_CTL, 0xaaaaaaaa);
>  	else if (adreno_is_a320(adreno_gpu))
>  		gpu_write(gpu, REG_A3XX_RBBM_CLOCK_CTL, 0xbfffffff);
> @@ -333,7 +342,7 @@ static int a3xx_hw_init(struct msm_gpu *gpu)
>  				
AXXX_CP_QUEUE_THRESHOLDS_CSQ_IB1_START(2) |
>  				
AXXX_CP_QUEUE_THRESHOLDS_CSQ_IB2_START(6) |
>  				
AXXX_CP_QUEUE_THRESHOLDS_CSQ_ST_START(14));
> -	} else if (adreno_is_a330(adreno_gpu)) {
> +	} else if (adreno_is_a330(adreno_gpu) || 
adreno_is_a305b(adreno_gpu)) {
>  		/* NOTE: this (value take from downstream android driver)
>  		 * includes some bits outside of the known bitfields.  But
>  		 * A330 has this "MERCIU queue" thing too, which might
> @@ -559,7 +568,7 @@ struct msm_gpu *a3xx_gpu_init(struct drm_device *dev)
>  		goto fail;
> 
>  	/* if needed, allocate gmem: */
> -	if (adreno_is_a330(adreno_gpu)) {
> +	if (adreno_is_a330(adreno_gpu) || adreno_is_a305b(adreno_gpu)) {
>  		ret = adreno_gpu_ocmem_init(&adreno_gpu->base.pdev->dev,
>  					    adreno_gpu, &a3xx_gpu-
>ocmem);
>  		if (ret)
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c
> b/drivers/gpu/drm/msm/adreno/adreno_device.c index
> f62ab5257e66..7028d5449956 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_device.c
> +++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
> @@ -55,10 +55,17 @@ static const struct adreno_info gpulist[] = {
>  		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
>  		.init  = a2xx_gpu_init,
>  	}, {
> -		.chip_ids = ADRENO_CHIP_IDS(
> -			0x03000512,
> -			0x03000520
> -		),
> +		.chip_ids = ADRENO_CHIP_IDS(0x03000512),
> +		.family = ADRENO_3XX,
> +		.fw = {
> +			[ADRENO_FW_PM4] = "a330_pm4.fw",
> +			[ADRENO_FW_PFP] = "a330_pfp.fw",
> +		},
> +		.gmem  = SZ_128K,
> +		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
> +		.init  = a3xx_gpu_init,
> +	}, {
> +		.chip_ids = ADRENO_CHIP_IDS(0x03000520),
>  		.family = ADRENO_3XX,
>  		.revn  = 305,
>  		.fw = {
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> b/drivers/gpu/drm/msm/adreno/adreno_gpu.h index 80b3f6312116..c654f21499bb
> 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> @@ -247,6 +247,11 @@ static inline bool adreno_is_a305(const struct
> adreno_gpu *gpu) return adreno_is_revn(gpu, 305);
>  }
> 
> +static inline bool adreno_is_a305b(const struct adreno_gpu *gpu)
> +{
> +	return gpu->info->chip_ids[0] == 0x03000512;
> +}
> +
>  static inline bool adreno_is_a306(const struct adreno_gpu *gpu)
>  {
>  	/* yes, 307, because a305c is 306 */





