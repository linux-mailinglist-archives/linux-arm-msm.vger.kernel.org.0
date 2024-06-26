Return-Path: <linux-arm-msm+bounces-24246-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CBFD5917C8D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Jun 2024 11:33:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 830F52857D1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Jun 2024 09:33:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2073B1684A4;
	Wed, 26 Jun 2024 09:33:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="F04Prc8d"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F2311684B9
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Jun 2024 09:33:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719394418; cv=none; b=sgRXifm7RyLpuvkxXPD8qn18hy1qytFZRi3idDONdWT0ojTS0URUXAjhSl7vQQOrnjuUfGGPk6OENMRRTHe6XjfVgCksn7Ra5rJ/ZIMdEKeTXahBcb0LGLTWcKR45xhLrsTcxRbr3vts22/ynv3vIvIz4+e/htsDuAh/eo2ElqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719394418; c=relaxed/simple;
	bh=Lw31CT6E16u6PZq7YxoteCCn7cdyfNmsPxMeXXhNSmU=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=byEDZZwilFP+Kv2qnKVnyn02XMJwskMmyAZ168aMo/yCXyb12aQuNTKnIlzBYwHYnP8FasTwVZFAmiQaTSdzXqGKE1+JmNiCXHIckM/6UE4FGUEnbb9+hOa8jWI2zmPyX0CAhdi9V9xBhof2ImaMPLzS5KsAjpDXzHIxvQBA+Z8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=F04Prc8d; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2ec0f3b9cfeso77057701fa.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Jun 2024 02:33:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719394414; x=1719999214; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oHVqwG7CV7dXA+zoW6ktcBpM8EFPhI/ooPQVV0T1bws=;
        b=F04Prc8dAq/s+ShhePW/S48UYL9Or7SkUhBZyBkcAp0Wo0MJWQ9RSAu4dU3EpPZi+l
         K5NeYeq+CJRCzrDr9zN4e1FZ6OGQY91nR8WjVclmq6TcUv41WCQuE659XCLYHfyp66Rl
         dqXICYtmbx6coN9k1sprTp6IBEeAJH9tSBsT1vmg4O05CilXZiZ2PQswhmbnYXQQHNtb
         J2YYBT1MVu7YlBLJQ+SsW20ZAg0vjiAi5Ne6yZQWjQyxAQmQEbLqzO4CxXCPRpFgwOjL
         MdV+uq0n/YTNchl7b8GOZ4UmUUBMqnq5kcJmRXNtw3+XC03VTR/Ku7SW6Yha7wrm+0q9
         kRrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719394414; x=1719999214;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=oHVqwG7CV7dXA+zoW6ktcBpM8EFPhI/ooPQVV0T1bws=;
        b=B7AmUuGC3Hf6AHGg+rzpYD48wKGsA16RGi/qaY793wiMttWTFWywK3/Am4Rpxk3kHo
         dDd5+6Ezbjp1glm6pIMyTgVmdqfCzm4c4VSvmbCCwA6lSYFJYiZFoVAY2OEgp6F0ZJkZ
         N16P0krh3ir5KPWXsJ9jxp7j0jRpzphNTL2xTTPHsOlem03QpXKzspfFisRfFGiU3sCr
         7xsnCUJ3nzrQ14WrGOaCwtdvmTYaVNQoj9rhFESpx7VVnmyNkPpdUIU11KmzygMJw4Ae
         M5StHJ9MoB0SMoFsgxC9k4D9+lZo3wo5OYvsmRr2vv9PyzAqr4ywsbFYs9eJ7dIhO9lA
         nEzQ==
X-Gm-Message-State: AOJu0YwCKVBROX6Esa8SmPhRm2kQst5UmkgjIR+OqebCSqFMpoVsPNSR
	Q+5QmpBvYVW4JUapQR8M+4cOoZNF1Occ7CULA2e2EAk85zDCZSJAzY5nUkzz+AM=
X-Google-Smtp-Source: AGHT+IEelKYvWkYkyGr0G2EaNvwR0FAUSvgDKm3EKmHTbMJ03MKsE2AiTc+5ces06NxmFaYADpd5IQ==
X-Received: by 2002:a2e:9a8b:0:b0:2ec:5843:2fbd with SMTP id 38308e7fff4ca-2ec594d0425mr60201951fa.41.1719394413834;
        Wed, 26 Jun 2024 02:33:33 -0700 (PDT)
Received: from ?IPV6:2a01:cb1c:fcf:4600:a281:d23c:1a8b:ab6? ([2a01:cb1c:fcf:4600:a281:d23c:1a8b:ab6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-424c8245da9sm18776015e9.1.2024.06.26.02.33.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Jun 2024 02:33:33 -0700 (PDT)
Message-ID: <041cbf33-9fce-4f72-be90-23bc7d215b10@linaro.org>
Date: Wed, 26 Jun 2024 11:33:30 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH v3 4/6] drm/msm/a7xx: Initialize a750 "software fuse"
To: Connor Abbott <cwabbott0@gmail.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Jun Nie <jun.nie@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 freedreno@lists.freedesktop.org
References: <20240430-a750-raytracing-v3-0-7f57c5ac082d@gmail.com>
 <20240430-a750-raytracing-v3-4-7f57c5ac082d@gmail.com>
Content-Language: en-US, fr
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro
In-Reply-To: <20240430-a750-raytracing-v3-4-7f57c5ac082d@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 30/04/2024 12:43, Connor Abbott wrote:
> On all Qualcomm platforms with a7xx GPUs, qcom_scm provides a method to
> initialize cx_mem. Copy this from downstream (minus BCL which we
> currently don't support). On a750, this includes a new "fuse" register
> which can be used by qcom_scm to fuse off certain features like
> raytracing in software. The fuse is default off, and is initialized by
> calling the method. Afterwards we have to read it to find out which
> features were enabled.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Connor Abbott <cwabbott0@gmail.com>
> ---
>   drivers/gpu/drm/msm/adreno/a6xx_gpu.c   | 91 ++++++++++++++++++++++++++++++++-
>   drivers/gpu/drm/msm/adreno/adreno_gpu.h |  2 +
>   2 files changed, 92 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> index cf0b1de1c071..52b080206090 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -10,6 +10,7 @@
>   
>   #include <linux/bitfield.h>
>   #include <linux/devfreq.h>
> +#include <linux/firmware/qcom/qcom_scm.h>
>   #include <linux/pm_domain.h>
>   #include <linux/soc/qcom/llcc-qcom.h>
>   
> @@ -1686,7 +1687,8 @@ static int a6xx_zap_shader_init(struct msm_gpu *gpu)
>   		       A6XX_RBBM_INT_0_MASK_RBBM_HANG_DETECT | \
>   		       A6XX_RBBM_INT_0_MASK_UCHE_OOB_ACCESS | \
>   		       A6XX_RBBM_INT_0_MASK_UCHE_TRAP_INTR | \
> -		       A6XX_RBBM_INT_0_MASK_TSBWRITEERROR)
> +		       A6XX_RBBM_INT_0_MASK_TSBWRITEERROR | \
> +		       A6XX_RBBM_INT_0_MASK_SWFUSEVIOLATION)
>   
>   #define A7XX_APRIV_MASK (A6XX_CP_APRIV_CNTL_ICACHE | \
>   			 A6XX_CP_APRIV_CNTL_RBFETCH | \
> @@ -2356,6 +2358,27 @@ static void a6xx_fault_detect_irq(struct msm_gpu *gpu)
>   	kthread_queue_work(gpu->worker, &gpu->recover_work);
>   }
>   
> +static void a7xx_sw_fuse_violation_irq(struct msm_gpu *gpu)
> +{
> +	u32 status;
> +
> +	status = gpu_read(gpu, REG_A7XX_RBBM_SW_FUSE_INT_STATUS);
> +	gpu_write(gpu, REG_A7XX_RBBM_SW_FUSE_INT_MASK, 0);
> +
> +	dev_err_ratelimited(&gpu->pdev->dev, "SW fuse violation status=%8.8x\n", status);
> +
> +	/*
> +	 * Ignore FASTBLEND violations, because the HW will silently fall back
> +	 * to legacy blending.
> +	 */
> +	if (status & (A7XX_CX_MISC_SW_FUSE_VALUE_RAYTRACING |
> +		      A7XX_CX_MISC_SW_FUSE_VALUE_LPAC)) {
> +		del_timer(&gpu->hangcheck_timer);
> +
> +		kthread_queue_work(gpu->worker, &gpu->recover_work);
> +	}
> +}
> +
>   static irqreturn_t a6xx_irq(struct msm_gpu *gpu)
>   {
>   	struct msm_drm_private *priv = gpu->dev->dev_private;
> @@ -2384,6 +2407,9 @@ static irqreturn_t a6xx_irq(struct msm_gpu *gpu)
>   	if (status & A6XX_RBBM_INT_0_MASK_UCHE_OOB_ACCESS)
>   		dev_err_ratelimited(&gpu->pdev->dev, "UCHE | Out of bounds access\n");
>   
> +	if (status & A6XX_RBBM_INT_0_MASK_SWFUSEVIOLATION)
> +		a7xx_sw_fuse_violation_irq(gpu);
> +
>   	if (status & A6XX_RBBM_INT_0_MASK_CP_CACHE_FLUSH_TS)
>   		msm_gpu_retire(gpu);
>   
> @@ -2525,6 +2551,61 @@ static void a6xx_llc_slices_init(struct platform_device *pdev,
>   		a6xx_gpu->llc_mmio = ERR_PTR(-EINVAL);
>   }
>   
> +static int a7xx_cx_mem_init(struct a6xx_gpu *a6xx_gpu)
> +{
> +	struct adreno_gpu *adreno_gpu = &a6xx_gpu->base;
> +	struct msm_gpu *gpu = &adreno_gpu->base;
> +	u32 fuse_val;
> +	int ret;
> +
> +	if (adreno_is_a750(adreno_gpu)) {
> +		/*
> +		 * Assume that if qcom scm isn't available, that whatever
> +		 * replacement allows writing the fuse register ourselves.
> +		 * Users of alternative firmware need to make sure this
> +		 * register is writeable or indicate that it's not somehow.
> +		 * Print a warning because if you mess this up you're about to
> +		 * crash horribly.
> +		 */
> +		if (!qcom_scm_is_available()) {
> +			dev_warn_once(gpu->dev->dev,
> +				"SCM is not available, poking fuse register\n");
> +			a6xx_llc_write(a6xx_gpu, REG_A7XX_CX_MISC_SW_FUSE_VALUE,
> +				A7XX_CX_MISC_SW_FUSE_VALUE_RAYTRACING |
> +				A7XX_CX_MISC_SW_FUSE_VALUE_FASTBLEND |
> +				A7XX_CX_MISC_SW_FUSE_VALUE_LPAC);
> +			adreno_gpu->has_ray_tracing = true;
> +			return 0;
> +		}
> +
> +		ret = qcom_scm_gpu_init_regs(QCOM_SCM_GPU_ALWAYS_EN_REQ |
> +					     QCOM_SCM_GPU_TSENSE_EN_REQ);
> +		if (ret)
> +			return ret;
> +
> +		/*
> +		 * On a750 raytracing may be disabled by the firmware, find out
> +		 * whether that's the case. The scm call above sets the fuse
> +		 * register.
> +		 */
> +		fuse_val = a6xx_llc_read(a6xx_gpu,
> +					 REG_A7XX_CX_MISC_SW_FUSE_VALUE);
> +		adreno_gpu->has_ray_tracing =
> +			!!(fuse_val & A7XX_CX_MISC_SW_FUSE_VALUE_RAYTRACING);
> +	} else {
> +		if (adreno_is_a740(adreno_gpu)) {
> +			/* Raytracing is always enabled on a740 */
> +			adreno_gpu->has_ray_tracing = true;
> +		}
> +
> +		if (qcom_scm_is_available())
> +			return qcom_scm_gpu_init_regs(QCOM_SCM_GPU_ALWAYS_EN_REQ);
> +	}
> +
> +	return 0;
> +}
> +
> +
>   #define GBIF_CLIENT_HALT_MASK		BIT(0)
>   #define GBIF_ARB_HALT_MASK		BIT(1)
>   #define VBIF_XIN_HALT_CTRL0_MASK	GENMASK(3, 0)
> @@ -3094,6 +3175,14 @@ struct msm_gpu *a6xx_gpu_init(struct drm_device *dev)
>   		return ERR_PTR(ret);
>   	}
>   
> +	if (adreno_is_a7xx(adreno_gpu)) {
> +		ret = a7xx_cx_mem_init(a6xx_gpu);
> +		if (ret) {
> +			a6xx_destroy(&(a6xx_gpu->base.base));
> +			return ERR_PTR(ret);
> +		}
> +	}
> +
>   	if (gpu->aspace)
>   		msm_mmu_set_fault_handler(gpu->aspace->mmu, gpu,
>   				a6xx_fault_handler);
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> index 77526892eb8c..4180f3149dd8 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> @@ -182,6 +182,8 @@ struct adreno_gpu {
>   	 */
>   	const unsigned int *reg_offsets;
>   	bool gmu_is_wrapper;
> +
> +	bool has_ray_tracing;
>   };
>   #define to_adreno_gpu(x) container_of(x, struct adreno_gpu, base)
>   
> 

This patch break GPU init on SM8450-HDK and SM8550-HDK, call to
qcom_scm_gpu_init_regs(QCOM_SCM_GPU_ALWAYS_EN_REQ) returns -5.

On which device did you test this ?

Neil

