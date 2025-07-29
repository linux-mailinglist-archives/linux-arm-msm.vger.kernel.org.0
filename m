Return-Path: <linux-arm-msm+bounces-67014-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7215BB14F0E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Jul 2025 16:06:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0E97B18928FC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Jul 2025 14:07:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDDAA1C862B;
	Tue, 29 Jul 2025 14:06:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OYFyL98V"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D44AD1B424D
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Jul 2025 14:06:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753797999; cv=none; b=gkCKLiGjvdlx12uX31EawvKPBgjVbV4b7HZ65qtou35EIoq4s16U5g0baIztRGjH0f68sbTfFY2a3Zc8JuBUZeJPBOMkSnW7oz7OxanMW5gdSxScuCaaIMD+sUsemUr7+OC+b83849A0+YojVZCEKcRZkXbyZ/RdYVH5Nng0Yns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753797999; c=relaxed/simple;
	bh=Rj3k2uCkIW34APxKx+WCZyC5uQQbNJ5NxrHyVRTFA3s=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=M2Eh+3l4yCRN4paKJ/3XPEwPrKH5YVR7FcfyRN74w+9Klc8899nEFhMZer5bY3Z+kysaSPFxHKakQm6VdH4tYvERVcGIqKtxTKDf2H42ttRVK1cqBI22zDKX5KK7K7KHxmd1JIvX2KluZfqu19sPQ0vusZGReSNw229f5Inq9v8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OYFyL98V; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-455b00339c8so35456665e9.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Jul 2025 07:06:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753797994; x=1754402794; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Fn497pBIb31Sx7BbH71sH1wCChN0m96yZl9gFKIrt2U=;
        b=OYFyL98V+IRTRY/92U0aEtqMPyA9aR77Cjymdl7chwdmxZDkD7biY/bw89wX2de887
         0Mm2c0BZBS5xcjpJRD89lWTvWZSQxBbGy1yuyT30HtOZjLA39Vypp+Fycd/DGiuKMgB+
         UufKdIjA4qgtb9vQ+fZ0VdivMmuvZikPAu2mJM6Oxi936IFXLXH3htV049Ktkz+LSj4B
         DUJxgkAxT96qjf3OKEeHU5LvTEQy9qL4d77Z27FO/PDcO4yZFZd8EZP3hZejile3CZwx
         NMzD51QOwYRGp8kqvp6/Ur4IbgWEC2DBenqohI0L/x0zFDe7ushW0Y1JR7/wchoBGZEl
         BpSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753797994; x=1754402794;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Fn497pBIb31Sx7BbH71sH1wCChN0m96yZl9gFKIrt2U=;
        b=IlBjGK7olqORzRTQ/PtP0pgklEf8+jAqnf3OKLKXffhf2mq1kBvbE62iayxD4LlC/t
         uA90RVL53/PLRneGmEE7Fz33muA/HB0fAtQNBHvfImMFE6ypW8mv6H4Q5mKWB6Vzr66d
         xqcO4uHMPvV3UrsbHhu/nVWErrI3Y0vCmwsvVOj7P02RZBaGN/cLlf14yk8pK3FlOJp4
         +qQjW/T4MEpHOqA3nmJOa5RFoj98Vw1Zo3GlNL43RBSSYr5jtPdMZsCrX3gnQjL4JGvZ
         0dadsx/RdtgllPJXCe+pxVdS2odQ8qwOAK66aEXUK4VE1KlErkjrEriGzCH38572fWD/
         UB8A==
X-Gm-Message-State: AOJu0YxAHLzNbKvI5lajbOJzyi/R3MXJUwT+3ef/l8i5TXAVcKFEfR/W
	LlIdHBeCciVg6/7EIgOUIML8ru9r6D785fI5JUgUEvda8SZRn4vq0jg+ZssVALUTuABuWwP43LY
	+Bw37
X-Gm-Gg: ASbGnctriW2wQuysdUOhGA0rgc7MNeI99d9T2AqcjaxpQ2p2Pbc2/LqySW9GeBy/4rq
	TrHIqUMT2lCxVBvktPqTKLoiq16CuFi2LzidXhLzuQkzBjhuzOiv2McMSCmcvOQOON67wW5QmXn
	l7L3HukYkD5CoKrBPjByVhetRXFYOP3IbvNSReEx0IScbuOvXOdzwD/EWLtp3YN1PD0Yh5wAVg3
	aNsMDe3uzFX1JBNKuJzlbyHklzSFXdWWPzdQhrAaLBlpYKQ3e+mHn/Y+4aE6qbpIhBpGL8N11HW
	deH27W6ZrT4zLi+XCRqqawVOVePDsmgLTc/euvcIR6RlbnDN8HhLEt7sn6pAqMTlYidhQrEjR9u
	Dca9PphZ52Rn6z2eK2F4zHKYL0OFr4SHF7tLySBRIDlB54CfUe0DF/gc5B0+j1nPYLvuv2nFG
X-Google-Smtp-Source: AGHT+IF0jH8WRN0uj1ieZOTFoPYfy4emJn+MHYxU9ZEF0XGbevulltaVbFmdQE5WJDFjaDKAdfUMXQ==
X-Received: by 2002:a05:600c:3e0c:b0:456:18f3:b951 with SMTP id 5b1f17b1804b1-45892814760mr1387415e9.15.1753797993672;
        Tue, 29 Jul 2025 07:06:33 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:3ae8:20b:c783:9328? ([2a01:e0a:3d9:2080:3ae8:20b:c783:9328])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b78dd6cb0fsm3231780f8f.29.2025.07.29.07.06.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Jul 2025 07:06:33 -0700 (PDT)
Message-ID: <cfbad162-e629-45c9-8436-74bb6fc416f2@linaro.org>
Date: Tue, 29 Jul 2025 16:06:32 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 16/17] drm/msm/a6xx: Enable IFPC on Adreno X1-85
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250720-ifpc-support-v1-0-9347aa5bcbd6@oss.qualcomm.com>
 <20250720-ifpc-support-v1-16-9347aa5bcbd6@oss.qualcomm.com>
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
In-Reply-To: <20250720-ifpc-support-v1-16-9347aa5bcbd6@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 20/07/2025 14:16, Akhil P Oommen wrote:
> Add the IFPC restore register list and enable IFPC support on Adreno
> X1-85 gpu.
> 
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---
>   drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 67 ++++++++++++++++++++++++++++++-
>   drivers/gpu/drm/msm/adreno/a6xx_gpu.c     | 15 +++++--
>   drivers/gpu/drm/msm/adreno/a6xx_gpu.h     |  1 +
>   3 files changed, 78 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> index 70f7ad806c34076352d84f32d62c2833422b6e5e..07fcabed472c3b9ca47faf1a8b3f7cf580801981 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> @@ -1343,6 +1343,69 @@ static const uint32_t a7xx_pwrup_reglist_regs[] = {
>   

<snip>

> +
>   static const struct adreno_info a7xx_gpus[] = {
>   	{
>   		.chip_ids = ADRENO_CHIP_IDS(0x07000200),
> @@ -1432,12 +1495,13 @@ static const struct adreno_info a7xx_gpus[] = {
>   		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
>   		.quirks = ADRENO_QUIRK_HAS_CACHED_COHERENT |
>   			  ADRENO_QUIRK_HAS_HW_APRIV |
> -			  ADRENO_QUIRK_PREEMPTION,
> +			  ADRENO_QUIRK_PREEMPTION | ADRENO_QUIRK_IFPC,
>   		.init = a6xx_gpu_init,
>   		.a6xx = &(const struct a6xx_info) {
>   			.hwcg = a740_hwcg,
>   			.protect = &a730_protect,
>   			.pwrup_reglist = &a7xx_pwrup_reglist,
> +			.ifpc_reglist = &a750_ifpc_reglist,
>   			.gmu_chipid = 0x7050001,
>   			.gmu_cgc_mode = 0x00020202,
>   		},
> @@ -1459,6 +1523,7 @@ static const struct adreno_info a7xx_gpus[] = {
>   		.a6xx = &(const struct a6xx_info) {
>   			.protect = &a730_protect,
>   			.pwrup_reglist = &a7xx_pwrup_reglist,
> +			.ifpc_reglist = &a750_ifpc_reglist,

So far it's stable on a750 so I think can safely add ADRENO_QUIRK_IFPC here aswell.

Neil

<snip>


