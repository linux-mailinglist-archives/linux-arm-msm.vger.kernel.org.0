Return-Path: <linux-arm-msm+bounces-3547-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 57528806FAE
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Dec 2023 13:29:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CF5DC1F21299
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Dec 2023 12:29:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69FFE364BE;
	Wed,  6 Dec 2023 12:29:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LtbUYi9j"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8CD49D45
	for <linux-arm-msm@vger.kernel.org>; Wed,  6 Dec 2023 04:29:03 -0800 (PST)
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-50be58a751cso5411475e87.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 Dec 2023 04:29:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701865742; x=1702470542; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XbeCAkVoLRW1/oUOSwS276hLe38ZJEWn0mKn2xkZbLg=;
        b=LtbUYi9jmGWTCm/kbZyIHSg9J09KNKZmslhZibRrPa1VP4Blvm5ALOGVEcsmt9qenp
         TrSSswE05xjd6r01/GjhFULE1U/XKIshSaH8VnO+wSWHFgv0RF/Oy8WT5UfU7pNOrLLa
         FXzG1bIgMaUjcdvJw/0ec1zbeOxGry7tfEo0gHUyKK7hmIEqtoaJxqm3OLG51N3C5HqT
         NSJnLfo4CAHysPojdLfoNx4O3VezPQS7VhXzK3m21RrW8MXBPc+aM7L1o2zk5zcENmnt
         DV+br3KsweAU1gbLWr+8f0oxjHKxwc+zU6qGGs9xEynUihF/tjNXMkTrQeZtGE9q9+zm
         sj2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701865742; x=1702470542;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XbeCAkVoLRW1/oUOSwS276hLe38ZJEWn0mKn2xkZbLg=;
        b=fKow9xG57MnO4H4IxBes2VbuJoKt1KA4obIctmmHdyz1Up26+fZTLoaSpy4TFHvqwu
         SgRtbS/M0jSnx92PnYTpPHOvEvz9FRpYo1/EUT/YFbp1YaY0lj37M9Hk3Q8KP3kB9J3q
         QOiS3pesNu8PH8xDlOqf5y02KkQWmBULFdSfxvvzogA5GvtiNqwbscerovl7oV64T69t
         LP5ZvQpXaAKS59hrPHG1BsmiMEIy219eNb6pNv9ufRReS5t4CFnER2L2EYCJyePPlxRT
         83uwV4MYfD5Am2dP20NtIjCU9HaLxROCRh8byQYNXO13No/5dksQMBf7a5HrnCpvPxLb
         D2Vg==
X-Gm-Message-State: AOJu0YzNgS85gFULK0vkwbSvJ1FNLs9ZlZU/CDrRgS5vPDxycREefc1n
	UMjT3scsDQ6Q3DmHx4buNg/w1w==
X-Google-Smtp-Source: AGHT+IHXO4wz3BPJVKoSrUkPWIa3dz1+hdplRoJCBOZolWa+GweffzORSxbnuIQaVl9JSecGILn6jg==
X-Received: by 2002:a19:e001:0:b0:50b:f817:14f8 with SMTP id x1-20020a19e001000000b0050bf81714f8mr452276lfg.19.1701865741726;
        Wed, 06 Dec 2023 04:29:01 -0800 (PST)
Received: from [172.30.205.186] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id o12-20020a056512050c00b0050be625999esm1317257lfb.110.2023.12.06.04.28.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Dec 2023 04:29:01 -0800 (PST)
Message-ID: <19ca53ae-b180-4ec6-9294-dd45825af653@linaro.org>
Date: Wed, 6 Dec 2023 13:28:58 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] drm/msm/adreno: Split up giant device table
Content-Language: en-US
To: Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Rob Clark <robdclark@chromium.org>, Abhinav Kumar
 <quic_abhinavk@quicinc.com>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Johan Hovold <johan+linaro@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 open list <linux-kernel@vger.kernel.org>
References: <20231205220526.417719-1-robdclark@gmail.com>
 <20231205220526.417719-2-robdclark@gmail.com>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20231205220526.417719-2-robdclark@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Level: *



On 12/5/23 23:03, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> Split into a separate table per generation, in preparation to move each
> gen's device table to it's own file.
> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>   drivers/gpu/drm/msm/adreno/adreno_device.c | 59 +++++++++++++++++++---
>   1 file changed, 51 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
> index 41b13dec9bef..36392801f929 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_device.c
> +++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
> @@ -20,7 +20,7 @@ bool allow_vram_carveout = false;
>   MODULE_PARM_DESC(allow_vram_carveout, "Allow using VRAM Carveout, in place of IOMMU");
>   module_param_named(allow_vram_carveout, allow_vram_carveout, bool, 0600);
>   
> -static const struct adreno_info gpulist[] = {
> +static const struct adreno_info a2xx_gpus[] = {
>   	{
>   		.chip_ids = ADRENO_CHIP_IDS(0x02000000),
>   		.family = ADRENO_2XX_GEN1,
> @@ -55,6 +55,12 @@ static const struct adreno_info gpulist[] = {
>   		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
>   		.init  = a2xx_gpu_init,
>   	}, {
> +		/* sentinal */
sentinel?

> +	}
> +};
> +
> +static const struct adreno_info a3xx_gpus[] = {
> +	{
>   		.chip_ids = ADRENO_CHIP_IDS(
>   			0x03000512,
>   			0x03000520
> @@ -110,6 +116,12 @@ static const struct adreno_info gpulist[] = {
>   		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
>   		.init  = a3xx_gpu_init,
>   	}, {
> +		/* sentinal */
> +	}
> +};
> +
> +static const struct adreno_info a4xx_gpus[] = {
> +	{
>   		.chip_ids = ADRENO_CHIP_IDS(0x04000500),
>   		.family = ADRENO_4XX,
>   		.revn  = 405,
> @@ -143,6 +155,12 @@ static const struct adreno_info gpulist[] = {
>   		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
>   		.init  = a4xx_gpu_init,
>   	}, {
> +		/* sentinal */
> +	}
> +};
> +
> +static const struct adreno_info a5xx_gpus[] = {
> +	{
>   		.chip_ids = ADRENO_CHIP_IDS(0x05000600),
>   		.family = ADRENO_5XX,
>   		.revn = 506,
> @@ -268,6 +286,12 @@ static const struct adreno_info gpulist[] = {
>   		.init = a5xx_gpu_init,
>   		.zapfw = "a540_zap.mdt",
>   	}, {
> +		/* sentinal */
> +	}
> +};
> +
> +static const struct adreno_info a6xx_gpus[] = {
> +	{
>   		.chip_ids = ADRENO_CHIP_IDS(0x06010000),
>   		.family = ADRENO_6XX_GEN1,
>   		.revn = 610,
> @@ -493,6 +517,12 @@ static const struct adreno_info gpulist[] = {
>   		.hwcg = a690_hwcg,
>   		.address_space_size = SZ_16G,
>   	}, {
> +		/* sentinal */
> +	}
> +};
> +
> +static const struct adreno_info a7xx_gpus[] = {
> +	{
>   		.chip_ids = ADRENO_CHIP_IDS(0x07030001),
>   		.family = ADRENO_7XX_GEN1,
>   		.fw = {
> @@ -522,7 +552,18 @@ static const struct adreno_info gpulist[] = {
>   		.zapfw = "a740_zap.mdt",
>   		.hwcg = a740_hwcg,
>   		.address_space_size = SZ_16G,
> -	},
> +	}, {
> +		/* sentinal */
> +	}
> +};
> +
> +static const struct adreno_info *gpulist[] = {
> +	a2xx_gpus,
> +	a3xx_gpus,
> +	a4xx_gpus,
> +	a5xx_gpus,
> +	a6xx_gpus,
> +	a7xx_gpus,
>   };
>   
>   MODULE_FIRMWARE("qcom/a300_pm4.fw");
> @@ -557,12 +598,14 @@ static const struct adreno_info *adreno_info(uint32_t chip_id)
>   {
>   	/* identify gpu: */
>   	for (int i = 0; i < ARRAY_SIZE(gpulist); i++) {
> -		const struct adreno_info *info = &gpulist[i];
> -		if (info->machine && !of_machine_is_compatible(info->machine))
> -			continue;
> -		for (int j = 0; info->chip_ids[j]; j++)
I'm not sure using sentinels here is a good idea, it adds a
whole lot of stack size. Perhaps gpulist could be a struct
of array pointers and an array of sizes?

Konrad

