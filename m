Return-Path: <linux-arm-msm+bounces-39121-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A591E9D8A99
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Nov 2024 17:46:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 65754289144
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Nov 2024 16:46:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46CC91B3946;
	Mon, 25 Nov 2024 16:46:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kU+H2+Zg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50BB12500CB
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 Nov 2024 16:46:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732553205; cv=none; b=Dr132fmi3TW7YoiOr5GGTYJw/aQ/96n7TBwhJj9wVzkfvONPNtK29zjm2fWSp3IOxxGkFW+rspqigB2sBzqHLzGD/QY0IGDJezE+yp8aruhKlh2Pky4R+QSWpqnWKCZmAD5YZOlKilGWhuXsM+By3eoTBH3lF1jJQOudTpFShLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732553205; c=relaxed/simple;
	bh=TmhDZh4uJYsIr4ZcPM6+teizhg5NlbWqFLasKlVHwa4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GEumkcHVpH1V2k6ThQDukgjqtUIBJD5d0QqjGlaj0NFWsNNnDutnYkXA+XKqLzf1eFq27+BtzdModqf1O8fzmjzNmkeEDa7HAsZXuOLDH9M+GGkcX62K8z/6cSw3W1ggscem4/QmC1C6OyDpggt//b95UWS5PhaMSwBKO4dmxFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kU+H2+Zg; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-53dd59a2bc1so3633516e87.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Nov 2024 08:46:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732553201; x=1733158001; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8ykbKQkuo2I4PEhIhBhe30Yc7TSw4jX5a63Tm3U6voo=;
        b=kU+H2+ZgF2TSFVlz8DTyOx6BsROdtw4Cq99440/bkF8sW8b5BclVXQY1pLpTspStIs
         oFpKPLOmSb111kf7ofKCkcpAgXLf0FM2agZApr4tKSK0vW8sPAGgtqw9uUfCc5c8lyA9
         7/ogpUvmHX2a1q+jq6qYKDDRlLK9WubjHChdGWuXOOML3eRgYtJpT6/S6T7mxZlmPCZn
         DLIo4oCyduvvw9Q9BnBwHbdKRP1VUjTMXmC4iH8MKvoMr+PXZV9w9vxMRiosjGQ9G2n/
         mv7UDzCUA2Ha78wZsTHYUIdOx5oWn19m+yvEjeoRQNU3X00mSYZpGpaWyaJu84icjKbN
         Z/xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732553201; x=1733158001;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8ykbKQkuo2I4PEhIhBhe30Yc7TSw4jX5a63Tm3U6voo=;
        b=IlU2cQAADYS11TlSTlT+d0iADhm4iglyZNwyampliq1s7GXXI/wMr2nUJPj9F7rRG5
         AXdk6IXqxZeYbM04rkKEC1Xx2NGT8CmIruLSeAe29nf3zqrpjs+p9fECjmDVO78lKtlm
         /2ezQvLVhGwxVZfjbYUXh44EPshMrHFXpuBdQAikzATtEKnEHKESDsP5uCP1NfV6hNBK
         pc9vLNOc/yPxhGT2tQpst/lsUZ04bCKVhgsxh92ptdBBmFG8dR9/4qJ7jRXvT2BUJu10
         SlklGDrh3zpVyt5uBLXdiCDL2brtsQveyZUw1GW/21aLdorFFd1uGx3obBvVoOvkY2C4
         kHKQ==
X-Forwarded-Encrypted: i=1; AJvYcCXUXR6x8AQhTumP98w4e/DzaV1m5vASe3LMUmcvF9rqWjAahv4KBji+M1JbtofHX7xKbVNWfcnXxHJ7umL8@vger.kernel.org
X-Gm-Message-State: AOJu0YyT23b1vfZHW+CMKJHND3XllB27TJBJcwcmT5BTXRcxGJbGAneW
	ZdQzJ1eh0duZL8dWEY4hSq1KESmuIS8Ad6idFmnX3/EvMxlH2otyPEMkxpYO400=
X-Gm-Gg: ASbGnctKkCAaAB2YXQctJyZG8tuBwwyLr0u74nQrBi56khk3egVrAFN7WvwGAifQQs9
	lkG7gOnD64qz8vm7seQgMT1Ug4DbRB+JUPe/RpPtGMDDJZQ3626DihA4YWbQkCyNso7S0yFq13M
	PRdkV4RuzI0WA0Txo1ZgutbW8qIg4hKJr9HVH5bRkohYacgI9f+H9sQFJHcnOYwvOKPZueqNJGB
	iNxV/yxm2I/FRY45nyoaTScfyfInaUiozEf5sAl0VpLry9DJTyb9W7puAagTWZOYcdmSvRv6JuG
	EAlYtySF18w4d+52pnfCjsLHPbrEEg==
X-Google-Smtp-Source: AGHT+IEIEs10x32BmBHwyCvNs3GkmUc0gOFBfdig3YObcsa/6Cquloa5nXm0+6tXaumC980PBV2hcw==
X-Received: by 2002:a05:6512:1593:b0:53d:dd50:1a94 with SMTP id 2adb3069b0e04-53ddd501c1dmr3313733e87.53.1732553201410;
        Mon, 25 Nov 2024 08:46:41 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53dd2451091sm1715437e87.65.2024.11.25.08.46.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Nov 2024 08:46:40 -0800 (PST)
Date: Mon, 25 Nov 2024 18:46:37 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Akhil P Oommen <quic_akhilpo@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
	Konrad Dybcio <konradybcio@kernel.org>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] drm/msm/adreno: Introduce ADRENO_QUIRK_NO_SYSCACHE
Message-ID: <vfbklrbereo3j5dp2w4pvctef364sb2dqogccmaevjerkm5u43@jytwobqwvuv2>
References: <20241125-a612-gpu-support-v2-0-b7cc38e60191@quicinc.com>
 <20241125-a612-gpu-support-v2-1-b7cc38e60191@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241125-a612-gpu-support-v2-1-b7cc38e60191@quicinc.com>

On Mon, Nov 25, 2024 at 10:03:00PM +0530, Akhil P Oommen wrote:
> There are a few chipsets which don't have system cache a.k.a LLC.
> Currently, the assumption in the driver is that the system cache
> availability correlates with the presence of GMU or RPMH, which
> is not true. For instance, Snapdragon 6 Gen 1 has RPMH and a GPU
> with a full blown GMU, but doesnot have a system cache. So,
> introduce an Adreno Quirk flag to check support for system cache
> instead of using gmu_wrapper flag.
> 
> Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 3 ++-
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c     | 7 +------
>  drivers/gpu/drm/msm/adreno/adreno_gpu.h   | 1 +
>  3 files changed, 4 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> index 0c560e84ad5a..5e389f6b8b8a 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> @@ -682,6 +682,7 @@ static const struct adreno_info a6xx_gpus[] = {
>  		},
>  		.gmem = (SZ_128K + SZ_4K),
>  		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
> +		.quirks = ADRENO_QUIRK_NO_SYSCACHE,
>  		.init = a6xx_gpu_init,
>  		.zapfw = "a610_zap.mdt",
>  		.a6xx = &(const struct a6xx_info) {
> @@ -1331,7 +1332,7 @@ static const struct adreno_info a7xx_gpus[] = {
>  		},
>  		.gmem = SZ_128K,
>  		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
> -		.quirks = ADRENO_QUIRK_HAS_HW_APRIV,
> +		.quirks = ADRENO_QUIRK_HAS_HW_APRIV | ADRENO_QUIRK_NO_SYSCACHE,
>  		.init = a6xx_gpu_init,
>  		.zapfw = "a702_zap.mbn",
>  		.a6xx = &(const struct a6xx_info) {
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> index 019610341df1..a8b928d0f320 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -1863,10 +1863,6 @@ static void a7xx_llc_activate(struct a6xx_gpu *a6xx_gpu)
>  
>  static void a6xx_llc_slices_destroy(struct a6xx_gpu *a6xx_gpu)
>  {
> -	/* No LLCC on non-RPMh (and by extension, non-GMU) SoCs */
> -	if (adreno_has_gmu_wrapper(&a6xx_gpu->base))
> -		return;
> -

Shouldn't it also be a NO_SYSCACHE check?

>  	llcc_slice_putd(a6xx_gpu->llc_slice);
>  	llcc_slice_putd(a6xx_gpu->htw_llc_slice);
>  }
> @@ -1876,8 +1872,7 @@ static void a6xx_llc_slices_init(struct platform_device *pdev,
>  {
>  	struct device_node *phandle;
>  
> -	/* No LLCC on non-RPMh (and by extension, non-GMU) SoCs */
> -	if (adreno_has_gmu_wrapper(&a6xx_gpu->base))
> +	if (a6xx_gpu->base.info->quirks & ADRENO_QUIRK_NO_SYSCACHE)
>  		return;
>  
>  	/*
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> index e71f420f8b3a..398be2218110 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> @@ -57,6 +57,7 @@ enum adreno_family {
>  #define ADRENO_QUIRK_HAS_HW_APRIV		BIT(3)
>  #define ADRENO_QUIRK_HAS_CACHED_COHERENT	BIT(4)
>  #define ADRENO_QUIRK_PREEMPTION			BIT(5)
> +#define ADRENO_QUIRK_NO_SYSCACHE		BIT(6)
>  
>  /* Helper for formating the chip_id in the way that userspace tools like
>   * crashdec expect.
> 
> -- 
> 2.45.2
> 

-- 
With best wishes
Dmitry

