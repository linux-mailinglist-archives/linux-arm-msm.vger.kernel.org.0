Return-Path: <linux-arm-msm+bounces-10599-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E8DD85117B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Feb 2024 11:51:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 426231C23595
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Feb 2024 10:51:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0759938FA8;
	Mon, 12 Feb 2024 10:46:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CV+PBQfX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0965539FD3
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Feb 2024 10:46:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707734782; cv=none; b=ZbNm+Jb8iuvKjCXsXhnnGGB+Nsqu7qJgb0A6xREKcIhb8xha0eQSfFU7mh9joiqWqO/hF/kD7E5Qrka4h3ZWNGmQsr6uDn/wSk7nhc8jycidI/VZ15MX0l+bY5HrgPrQheyMeiYN3jrSxuktrzgXWqBcUPl4U5+YBepaKsIbkDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707734782; c=relaxed/simple;
	bh=fnaDeTgMz2/uVnKFVasJe7ruBBIoDSdVC37+5zyiZhc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LVarH4gHRvKJD0mAyWvyFbwWskTRPYxrLSPkhBC8tJ6NC6QMA9GR41kFaRq9zze8FGVoZNKGZsdTz/z8xqsxppYRYmE0IvE3F7qEyLvHsrWidUeKBEKGXlCn6BfhXx9Idn3sXOeoYTs7wTjpCu6WvByRm6lKSmWh+1CwvLnuflM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CV+PBQfX; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-a3c309236c1so193078666b.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Feb 2024 02:46:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707734778; x=1708339578; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=q1QBZwTVdWuMyu/B+/xwznlESDGZfR140XLprl5iQ1M=;
        b=CV+PBQfXbf9lxJ/EYfzi4os30qZQeqqKlbXcNkwbpfiCBVoAssEeSPGKU4Pth8lQIk
         k0XHp6dTwX9Lv3IvQbm+i9LY0SXgszi6IatgaddNNas8xLVZuXrw98UoanPDrpV79OEr
         bd6ZcrLGBNFjx0d1K4fcrhnJrZuPjhyTTuQMcm+imwCW/m7PYHZGUQeR0NhyMBV3W3TE
         LCy63lhl37rhKwrlHG38/J+ACe36fHSLk0lDqA/ahS+ZtFsSivry9YXqS6oQGeY4JWCJ
         einxnP9+Gw05aEZCLPul7PDiKFhH34daJvf06zUeogS/dihpAJbo4K4gmbDykviCARyq
         funA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707734778; x=1708339578;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=q1QBZwTVdWuMyu/B+/xwznlESDGZfR140XLprl5iQ1M=;
        b=fskydhpD9gra7EREVuGBslBb61TGsG2q2DFaThFQyWc8Dpx7xvrbIFxg0h4QErYJOU
         VmHDvbLViQ4A5fUfDG1ytVAtY1utD8SruHvKKFUq5pdgRFH9wENcdOv/YtpPVaOpbJz8
         wWwXPCU+ZH6EjA3wRUefScdtISg4TENoUErmcvi40aY6rAvaisvTj0iHIHvbIOM03mgy
         C5QcMUU4rOw/R/NwLctr9sVwnFArrHlFqiPOq0skWvYiD+/J14Ay9o4BfB4ufIw9Ut32
         kA+SdNWoWKO2KBeYgKXzqqByG4eqJS2a4WEGdujc6Rk1Js46JwbXO+z33jts1mYtloFo
         XA2A==
X-Gm-Message-State: AOJu0YzQmd3nRj3h5Yb9WO0FE0vNMagzv6qQUDPN9NV27sgFDRWVKTOP
	DWWQYuaEQagvfKcMbZaifj+XpDjKTZJXdVAQHP0WlDwnMRwUviMYgdNr3s4Rf6Q=
X-Google-Smtp-Source: AGHT+IHpubciOuLgoFxIYuWkjxQ9dY9wKTeVR9Xa9qhEX1yHDLlAU9mxQVzNOBcaocUHoFgQyZF7GQ==
X-Received: by 2002:a17:906:f80d:b0:a3c:a75e:7e3a with SMTP id kh13-20020a170906f80d00b00a3ca75e7e3amr1239304ejb.47.1707734778242;
        Mon, 12 Feb 2024 02:46:18 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXRkgvsOgQDe7v5rAf/j/cGyiCixW9YFFhwkbuXr5VwKH/B6syvBXSDq8ImuLUVd92psJdlqV28dLSbPr9b2jM4mhdI23OxpEQAgIlNahJx1UcTZGGXPSttgSK8zD5B13M5YXdgxBhAg5iQx35l7F9RyNc2JURvrNwD+//VCrOSLdZlzl+QdCNSEdDAfevMRR+wOXfTwr7SSUKGuDc734+GEog5g8KOXES+z2YLDgv6i6SxOBv4zk0V+vlcJyFg9vJExPmY0Wwgv/keRSYvvmPAZ7LbUWqZuN88TbAE2Qy5XLaG3riT2iH2hW3t/pGgd7yffS1Elxw+xTO8AfbYvrkAhjLVBQ+1g6JpPnDRrq3H+b+3sYlrqYDLRIjNuGjJhnVoraACEk4rNoFCFEE0emW8jHwQu38IJtS4i8EHI9eC3n2ofw2o5F0WXgLvgbnUXmApjoFdFXCiMd6Lp/XQ2bhTTZ/meUQShd8J8lbYu0o1/iLZNtogf4zmtPZlokMOy7TxvUsMEAt/bLhqktfM5Buu07EXEg0TVoA904jyUXj56LctpenNlptgz5Df7U/VJFjtIh841+Z0I8iAPoSOf70x2wZuBYJtmuebS5MnxR4O73YTT24fh0x6sI7/KdxjXVsEwdPyy68nncCjG/QAjuYlJQZcvPQygbCiw0fLTG2aAOGShq2C9kQbyKA+5HJ2xcs1njkjTgABq72x5aki7ROj0EVb6rOKrZahk6iSJc4iowWh8/F7an9F7tRK6trbU+56Nbrc5vMLPwfLTwwf6iHM2cN8DyhOr4B10Kdk+bA46FVeR3xsSU+jC1Jr
Received: from [192.168.192.135] (037008245233.garwolin.vectranet.pl. [37.8.245.233])
        by smtp.gmail.com with ESMTPSA id l26-20020a1709061c5a00b00a3891fb4c0esm73964ejg.107.2024.02.12.02.46.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Feb 2024 02:46:17 -0800 (PST)
Message-ID: <b5d76a25-045a-4acd-ad20-d28855b40222@linaro.org>
Date: Mon, 12 Feb 2024 11:46:15 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] drm: msm: add support for A750 GPU
Content-Language: en-US
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
 Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 iommu@lists.linux.dev
References: <20240212-topic-sm8650-gpu-v1-0-708a40b747b5@linaro.org>
 <20240212-topic-sm8650-gpu-v1-3-708a40b747b5@linaro.org>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <20240212-topic-sm8650-gpu-v1-3-708a40b747b5@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12.02.2024 11:37, Neil Armstrong wrote:
> Add support for the A750 GPU found on the SM8650 platform
> 
> Unlike the the very close A740 GPU on the SM8550 SoC, the A750 GPU
> doesn't have an HWCFG block but a separate register set.
> 
> The missing registers are added in the a6xx.xml.h file that would
> require a subsequent sync and the non-existent hwcfg is handled
> in a6xx_set_hwcg().

These should also be submitted to mesa to make sure the next header sync
doesn't wipe them

[...]

> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -958,10 +958,11 @@ static void a6xx_set_hwcg(struct msm_gpu *gpu, bool state)
>  	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
>  	struct a6xx_gmu *gmu = &a6xx_gpu->gmu;
>  	const struct adreno_reglist *reg;
> +	bool skip_programming = !(adreno_gpu->info->hwcg || adreno_is_a7xx(adreno_gpu));

is_a750?

>  	unsigned int i;
>  	u32 val, clock_cntl_on, cgc_mode;
>  
> -	if (!adreno_gpu->info->hwcg)
> +	if (skip_programming)
>  		return;
>  
>  	if (adreno_is_a630(adreno_gpu))
> @@ -982,6 +983,25 @@ static void a6xx_set_hwcg(struct msm_gpu *gpu, bool state)
>  			  state ? 0x5555 : 0);
>  	}
>  
> +	if (!adreno_gpu->info->hwcg) {

I don't think this block of code is reachable now, no?

Maybe remove the skip_programming and if_a750 here?

> +		gpu_write(gpu, REG_A7XX_RBBM_CLOCK_CNTL_GLOBAL, 1);
> +		gpu_write(gpu, REG_A7XX_RBBM_CGC_GLOBAL_LOAD_CMD, state ? 1 : 0);
> +
> +		if (state) {
> +			gpu_write(gpu, REG_A7XX_RBBM_CGC_P2S_TRIG_CMD, 1);
> +
> +			if (gpu_poll_timeout(gpu, REG_A7XX_RBBM_CGC_P2S_STATUS, val,
> +					     val & BIT(0), 1, 10)) {

We should define that bit name (the err suggests it's
REG_A7XX_RBBM_GCC_P2S_STATUS_TXDONE or so)

[...]

> +static inline int adreno_is_a750(struct adreno_gpu *gpu)
> +{
> +	return gpu->info->chip_ids[0] == 0x43051401;
> +}
> +
>  /* Placeholder to make future diffs smaller */

Please also remove this comment now that it's invalid

Konrad

