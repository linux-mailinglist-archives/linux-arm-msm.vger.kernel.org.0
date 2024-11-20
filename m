Return-Path: <linux-arm-msm+bounces-38461-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A6AE19D394C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Nov 2024 12:18:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 40F5C1F2165A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Nov 2024 11:18:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CB1B19EED2;
	Wed, 20 Nov 2024 11:18:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Wr68UkY+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4588019CD1B
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 Nov 2024 11:18:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732101530; cv=none; b=MlUPEYIDOGkm1SnVvgzirzZCrCNjvq5VIo3TDA7SQiorpc1WVr1Kg14RLHkeRhuJ/ycz2wPo8tOCQy6P0ksWp8rxh03vDeLWvQquVKCMIQ7Rv+2zuhDiyfKf2aAbdFDjnHuF8UZbyZXaocbBOsi05jA2N3PJQ3qBz5k3eDX58B8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732101530; c=relaxed/simple;
	bh=n//zpU57aqTzto9kBIOjfzz5DdBmIgch4t2oqLL6uwg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mxlUFkZHeuhtHu8PdGw2mX/sqxKKCpoyNi1Q/3jQhzi8SygX3Kra/z0r2pOLmrYbSyeIPDC4Fwj/sQX08O992luwMrmBWhTEFJP2AXv5VMzbcADVrjguXCcDps+Q/KjiWIksCECsNGzec5nkGWrck81llP0DtXQm7mK/kJqFies=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Wr68UkY+; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-539e63c8678so4750746e87.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 Nov 2024 03:18:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732101525; x=1732706325; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=r98JRbkNHT9qAPDcDMFbKhAW5brAUGwlvcxwfaBzA8I=;
        b=Wr68UkY+O5Xe7WCgJLGtGUNWYJ1OFi6hED/sm766ioOdOKPgu9ZDV+DaDwnodd7TWB
         df9otnOAjDtrtVYrtiyU/yuo2HefdQxcmWKIGfW2RGKNS0aTnDEE3vAtbN0YUZbrCo2p
         XEMkI5gKVlp54rrX65KoVurtzYo60PL5+xndVjKMwqli5zVNwqkE4MdKS1uVNa5uadE6
         EghtIxYf5KXFJlkSiTLCQ0JCDLjuw3mVzCkIk+mJSWMIYZkxluivgrFtsvVvRlyBoxO3
         PZ0enGPi1P6txza0POPmgvJXvmlGis9SjWxvvc1D9oLcNLZiXosKn0Gc9tJqiZ6JdEIr
         S6oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732101525; x=1732706325;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r98JRbkNHT9qAPDcDMFbKhAW5brAUGwlvcxwfaBzA8I=;
        b=o0fK+T0H/7BMygHYJHmnnyOOxn8G5whruqsJqaM6aQ8t6OpxBwYl7F1EOmUHkzNvd5
         CexXqYLr2YbiDF3DKG34lNds5BzyNLhm21OoXYKE8CMN4NgFAVIz7yrRwhPy52JkHyk6
         exuw008g0bx4S30nFbBinfxk01Etp9nG3P9DnzNtSbyU8PglhA0huThNeh5uy2BB79kZ
         xKRaSXvjexfJc7APZ5rM2wUEAjyRXIwHhSTLPqzRlryQj2WBs2HXIuphvO0XkSScIDcv
         mNelYHb5pSuAaetnKhb/u9gJKYkmrdP566cRUyaRN9ypyRJvkTva7NUVFmKSCPNdc0Xj
         l7XA==
X-Forwarded-Encrypted: i=1; AJvYcCWlYixeFwPkGPtEUgMGOaBBikOudo1yfb2Av5irKdNOFV+Ib4v+53cBte7W7BSLYxKHiR9qvx8LS/SvQQJ/@vger.kernel.org
X-Gm-Message-State: AOJu0YxKlE1t4vvl2qTs80Xy+JAJ3OuIBR8cNSSGIZvpanWHvUeRg+f1
	B1pxKGYSVplOl7w6JxpbJrvdIelluxt2TPKMfY3n9XmW+mO12W1qpe604nyIdbY=
X-Google-Smtp-Source: AGHT+IEGQPNp9SIKJuYJWqBPnVInvfWWAGoF5yLxeIVZG2S0tAcaAoIolD/cc/TtRpao+k8gWOKZpg==
X-Received: by 2002:a05:6512:a8b:b0:52c:9468:c991 with SMTP id 2adb3069b0e04-53dc1337665mr1132049e87.14.1732101525342;
        Wed, 20 Nov 2024 03:18:45 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53dbf9d9813sm355254e87.136.2024.11.20.03.18.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Nov 2024 03:18:43 -0800 (PST)
Date: Wed, 20 Nov 2024 13:18:41 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Akhil P Oommen <quic_akhilpo@quicinc.com>, 
	Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>, Stephen Boyd <sboyd@kernel.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
	Konrad Dybcio <konradybcio@kernel.org>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Bjorn Andersson <andersson@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Connor Abbott <cwabbott0@gmail.com>, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 03/11] drm/msm: adreno: move features bits in a
 separate variable
Message-ID: <fkezpguictntg2wkouwqipnaaiauo6vu46n7a2xzvlorzvyeaw@bbcpj3bs5eko>
References: <20241119-topic-sm8x50-gpu-bw-vote-v2-0-4deb87be2498@linaro.org>
 <20241119-topic-sm8x50-gpu-bw-vote-v2-3-4deb87be2498@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241119-topic-sm8x50-gpu-bw-vote-v2-3-4deb87be2498@linaro.org>

On Tue, Nov 19, 2024 at 06:56:38PM +0100, Neil Armstrong wrote:
> Now the features defines have the right name, introduce a features
> bitfield and move the features defines in it, fixing all code checking
> for them.
> 
> No functional changes intended.

I think it might be better to squahs this patch into the previous one,
it would simplify checking that we use .quirks for ADRENO_QUIRK_foo and
.features for ADRENO_FEAT_bar.

> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_catalog.c  | 34 +++++++++++++++---------------
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c      |  4 ++--
>  drivers/gpu/drm/msm/adreno/adreno_device.c |  2 +-
>  drivers/gpu/drm/msm/adreno/adreno_gpu.h    |  7 +++---
>  4 files changed, 24 insertions(+), 23 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> index 825c820def315968d508973c8ae40c7c7b646569..93f0d4bf50ba773ecde93e6c29a2fcec24ebb7b3 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> @@ -743,7 +743,7 @@ static const struct adreno_info a6xx_gpus[] = {
>  		},
>  		.gmem = SZ_512K,
>  		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
> -		.quirks = ADRENO_FEAT_HAS_CACHED_COHERENT,
> +		.features = ADRENO_FEAT_HAS_CACHED_COHERENT,
>  		.init = a6xx_gpu_init,
>  		.zapfw = "a615_zap.mbn",
>  		.a6xx = &(const struct a6xx_info) {
> @@ -769,7 +769,7 @@ static const struct adreno_info a6xx_gpus[] = {
>  		},
>  		.gmem = SZ_512K,
>  		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
> -		.quirks = ADRENO_FEAT_HAS_CACHED_COHERENT,
> +		.features = ADRENO_FEAT_HAS_CACHED_COHERENT,
>  		.init = a6xx_gpu_init,
>  		.a6xx = &(const struct a6xx_info) {
>  			.protect = &a630_protect,
> @@ -839,7 +839,7 @@ static const struct adreno_info a6xx_gpus[] = {
>  		},
>  		.gmem = SZ_512K,
>  		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
> -		.quirks = ADRENO_FEAT_HAS_CACHED_COHERENT,
> +		.features = ADRENO_FEAT_HAS_CACHED_COHERENT,
>  		.init = a6xx_gpu_init,
>  		.zapfw = "a615_zap.mdt",
>  		.a6xx = &(const struct a6xx_info) {
> @@ -864,7 +864,7 @@ static const struct adreno_info a6xx_gpus[] = {
>  		},
>  		.gmem = SZ_512K,
>  		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
> -		.quirks = ADRENO_FEAT_HAS_CACHED_COHERENT |
> +		.features = ADRENO_FEAT_HAS_CACHED_COHERENT |
>  			  ADRENO_FEAT_HAS_HW_APRIV,
>  		.init = a6xx_gpu_init,
>  		.zapfw = "a620_zap.mbn",
> @@ -892,7 +892,7 @@ static const struct adreno_info a6xx_gpus[] = {
>  		},
>  		.gmem = SZ_1M,
>  		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
> -		.quirks = ADRENO_FEAT_HAS_CACHED_COHERENT,
> +		.features = ADRENO_FEAT_HAS_CACHED_COHERENT,
>  		.init = a6xx_gpu_init,
>  		.zapfw = "a630_zap.mdt",
>  		.a6xx = &(const struct a6xx_info) {
> @@ -911,7 +911,7 @@ static const struct adreno_info a6xx_gpus[] = {
>  		},
>  		.gmem = SZ_1M,
>  		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
> -		.quirks = ADRENO_FEAT_HAS_CACHED_COHERENT,
> +		.features = ADRENO_FEAT_HAS_CACHED_COHERENT,
>  		.init = a6xx_gpu_init,
>  		.zapfw = "a640_zap.mdt",
>  		.a6xx = &(const struct a6xx_info) {
> @@ -934,7 +934,7 @@ static const struct adreno_info a6xx_gpus[] = {
>  		},
>  		.gmem = SZ_1M + SZ_128K,
>  		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
> -		.quirks = ADRENO_FEAT_HAS_CACHED_COHERENT |
> +		.features = ADRENO_FEAT_HAS_CACHED_COHERENT |
>  			ADRENO_FEAT_HAS_HW_APRIV,
>  		.init = a6xx_gpu_init,
>  		.zapfw = "a650_zap.mdt",
> @@ -961,7 +961,7 @@ static const struct adreno_info a6xx_gpus[] = {
>  		},
>  		.gmem = SZ_1M + SZ_512K,
>  		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
> -		.quirks = ADRENO_FEAT_HAS_CACHED_COHERENT |
> +		.features = ADRENO_FEAT_HAS_CACHED_COHERENT |
>  			ADRENO_FEAT_HAS_HW_APRIV,
>  		.init = a6xx_gpu_init,
>  		.zapfw = "a660_zap.mdt",
> @@ -981,7 +981,7 @@ static const struct adreno_info a6xx_gpus[] = {
>  		},
>  		.gmem = SZ_1M + SZ_512K,
>  		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
> -		.quirks = ADRENO_FEAT_HAS_CACHED_COHERENT |
> +		.features = ADRENO_FEAT_HAS_CACHED_COHERENT |
>  			ADRENO_FEAT_HAS_HW_APRIV,
>  		.init = a6xx_gpu_init,
>  		.a6xx = &(const struct a6xx_info) {
> @@ -1000,7 +1000,7 @@ static const struct adreno_info a6xx_gpus[] = {
>  		},
>  		.gmem = SZ_512K,
>  		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
> -		.quirks = ADRENO_FEAT_HAS_CACHED_COHERENT |
> +		.features = ADRENO_FEAT_HAS_CACHED_COHERENT |
>  			ADRENO_FEAT_HAS_HW_APRIV,
>  		.init = a6xx_gpu_init,
>  		.zapfw = "a660_zap.mbn",
> @@ -1028,7 +1028,7 @@ static const struct adreno_info a6xx_gpus[] = {
>  		},
>  		.gmem = SZ_2M,
>  		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
> -		.quirks = ADRENO_FEAT_HAS_CACHED_COHERENT,
> +		.features = ADRENO_FEAT_HAS_CACHED_COHERENT,
>  		.init = a6xx_gpu_init,
>  		.zapfw = "a640_zap.mdt",
>  		.a6xx = &(const struct a6xx_info) {
> @@ -1046,7 +1046,7 @@ static const struct adreno_info a6xx_gpus[] = {
>  		},
>  		.gmem = SZ_4M,
>  		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
> -		.quirks = ADRENO_FEAT_HAS_CACHED_COHERENT |
> +		.features = ADRENO_FEAT_HAS_CACHED_COHERENT |
>  			ADRENO_FEAT_HAS_HW_APRIV,
>  		.init = a6xx_gpu_init,
>  		.zapfw = "a690_zap.mdt",
> @@ -1331,7 +1331,7 @@ static const struct adreno_info a7xx_gpus[] = {
>  		},
>  		.gmem = SZ_128K,
>  		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
> -		.quirks = ADRENO_FEAT_HAS_HW_APRIV,
> +		.features = ADRENO_FEAT_HAS_HW_APRIV,
>  		.init = a6xx_gpu_init,
>  		.zapfw = "a702_zap.mbn",
>  		.a6xx = &(const struct a6xx_info) {
> @@ -1355,7 +1355,7 @@ static const struct adreno_info a7xx_gpus[] = {
>  		},
>  		.gmem = SZ_2M,
>  		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
> -		.quirks = ADRENO_FEAT_HAS_CACHED_COHERENT |
> +		.features = ADRENO_FEAT_HAS_CACHED_COHERENT |
>  			  ADRENO_FEAT_HAS_HW_APRIV |
>  			  ADRENO_FEAT_PREEMPTION,
>  		.init = a6xx_gpu_init,
> @@ -1377,7 +1377,7 @@ static const struct adreno_info a7xx_gpus[] = {
>  		},
>  		.gmem = 3 * SZ_1M,
>  		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
> -		.quirks = ADRENO_FEAT_HAS_CACHED_COHERENT |
> +		.features = ADRENO_FEAT_HAS_CACHED_COHERENT |
>  			  ADRENO_FEAT_HAS_HW_APRIV |
>  			  ADRENO_FEAT_PREEMPTION,
>  		.init = a6xx_gpu_init,
> @@ -1400,7 +1400,7 @@ static const struct adreno_info a7xx_gpus[] = {
>  		},
>  		.gmem = 3 * SZ_1M,
>  		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
> -		.quirks = ADRENO_FEAT_HAS_CACHED_COHERENT |
> +		.features = ADRENO_FEAT_HAS_CACHED_COHERENT |
>  			  ADRENO_FEAT_HAS_HW_APRIV |
>  			  ADRENO_FEAT_PREEMPTION,
>  		.init = a6xx_gpu_init,
> @@ -1422,7 +1422,7 @@ static const struct adreno_info a7xx_gpus[] = {
>  		},
>  		.gmem = 3 * SZ_1M,
>  		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
> -		.quirks = ADRENO_FEAT_HAS_CACHED_COHERENT |
> +		.features = ADRENO_FEAT_HAS_CACHED_COHERENT |
>  			  ADRENO_FEAT_HAS_HW_APRIV |
>  			  ADRENO_FEAT_PREEMPTION,
>  		.init = a6xx_gpu_init,
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> index 2ebd3fac212576a1507e0b6afe2560cd0408dd89..654d0cff421f15901cd4bf33b41e70004634ec75 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -2478,7 +2478,7 @@ struct msm_gpu *a6xx_gpu_init(struct drm_device *dev)
>  	adreno_gpu->gmu_is_wrapper = of_device_is_compatible(node, "qcom,adreno-gmu-wrapper");
>  
>  	adreno_gpu->base.hw_apriv =
> -		!!(config->info->quirks & ADRENO_FEAT_HAS_HW_APRIV);
> +		!!(config->info->features & ADRENO_FEAT_HAS_HW_APRIV);
>  
>  	/* gpu->info only gets assigned in adreno_gpu_init() */
>  	is_a7xx = config->info->family == ADRENO_7XX_GEN1 ||
> @@ -2495,7 +2495,7 @@ struct msm_gpu *a6xx_gpu_init(struct drm_device *dev)
>  	}
>  
>  	if ((enable_preemption == 1) || (enable_preemption == -1 &&
> -	    (config->info->quirks & ADRENO_FEAT_PREEMPTION)))
> +	    (config->info->features & ADRENO_FEAT_PREEMPTION)))
>  		ret = adreno_gpu_init(dev, pdev, adreno_gpu, &funcs_a7xx, 4);
>  	else if (is_a7xx)
>  		ret = adreno_gpu_init(dev, pdev, adreno_gpu, &funcs_a7xx, 1);
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
> index 09d4569f77528c2a20cabc814668c4c930dd07f1..11a228472fa0cef3b6e4e21a366470fbbc3ea8df 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_device.c
> +++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
> @@ -207,7 +207,7 @@ static int adreno_bind(struct device *dev, struct device *master, void *data)
>  
>  	priv->is_a2xx = info->family < ADRENO_3XX;
>  	priv->has_cached_coherent =
> -		!!(info->quirks & ADRENO_FEAT_HAS_CACHED_COHERENT);
> +		!!(info->features & ADRENO_FEAT_HAS_CACHED_COHERENT);
>  
>  	gpu = info->init(drm);
>  	if (IS_ERR(gpu)) {
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> index 8782c25e8a393ec7d9dc23ad450908d039bd08c5..4702d4cfca3b58fb3cbb25cb6805f1c19be2ebcb 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> @@ -55,9 +55,9 @@ enum adreno_family {
>  #define ADRENO_QUIRK_FAULT_DETECT_MASK		BIT(1)
>  #define ADRENO_QUIRK_LMLOADKILL_DISABLE		BIT(2)
>  
> -#define ADRENO_FEAT_HAS_HW_APRIV		BIT(3)
> -#define ADRENO_FEAT_HAS_CACHED_COHERENT		BIT(4)
> -#define ADRENO_FEAT_PREEMPTION			BIT(5)
> +#define ADRENO_FEAT_HAS_HW_APRIV		BIT(0)
> +#define ADRENO_FEAT_HAS_CACHED_COHERENT		BIT(1)
> +#define ADRENO_FEAT_PREEMPTION			BIT(2)
>  
>  /* Helper for formating the chip_id in the way that userspace tools like
>   * crashdec expect.
> @@ -98,6 +98,7 @@ struct adreno_info {
>  	uint32_t revn;
>  	const char *fw[ADRENO_FW_MAX];
>  	uint32_t gmem;
> +	u64 features;
>  	u64 quirks;
>  	struct msm_gpu *(*init)(struct drm_device *dev);
>  	const char *zapfw;
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

