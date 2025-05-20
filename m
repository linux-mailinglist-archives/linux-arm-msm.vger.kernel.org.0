Return-Path: <linux-arm-msm+bounces-58641-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DAA7ABD132
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 May 2025 09:58:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 10AB61BA0DBA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 May 2025 07:58:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D18B23BD0E;
	Tue, 20 May 2025 07:58:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="s8ua7tN+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BB4320E6E2
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 May 2025 07:58:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747727913; cv=none; b=SB9CA//8NU7gRrwRPVoBNpUHsYGwJmlLBEmQaNn+bIbGrQt3wqLnUP4ZjDDUWoi7vHeYOaQJTwz+ATyMzZXrFAE1RuHoxESFOA+atHRfvDozxVNnLFh3/pTYazt+oAULAw6USw6ZQDxO+FK7L7zx9M4/zl4WJRkOTIE+8ySqSuc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747727913; c=relaxed/simple;
	bh=9L60daJmELb7qQdhSrkJjAJZlYPWJsA3mGloGTsnBts=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=ZP5KuXgCmk2S1m+VaThvHsprNpIgNl3Y8y4RLBoK2d8+eWk9dNCY5nPBJEbrd8IhEKhXLlJNptWh8Lqs9HCmIQaNstY5o+yNl8YURBHSpmQgi7ZCzIq8ycyZ8ZE9J9+KTNlFdBW/1+gG4C5ZD8Nvdr3AgjlRv0bUhlv3JAdk5Tw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=s8ua7tN+; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3a0ac853894so4604294f8f.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 May 2025 00:58:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747727909; x=1748332709; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8dMTe43DqjT8zfacMTf3DDsqNF1vc7vtPkUiQOYQzjQ=;
        b=s8ua7tN+dSlojZnc7A1tpbginNaAks8ohsHXh+mPIfqFlETWN6pTIYzWyMTqk4hGyc
         K2LiokG9qdDvcdl0Q8PTbe7zG75WOkFBhqS3XZtTLBXarlfyWqy4EBh9mnYeWG0ZV9JB
         yR/T1MBJpYq5NEVWPdiUU0eM7tsTxS2YHTwGLFl4Qq7JGiNpReeYRPgfGmuBqs1gg1Sk
         KMKeNayqxUC4ZMvBwt5Z61KOhIkf7HGG39XR4jSb0e6TqcaTW5/Qk9zobwlfC+MAyGQ0
         w57N4RX4lJ5MBHfiJ+Q7CPLrHO91EGPWjXAwnPr8fTQlA9xc+F4EEPMj8wjGgs5p+vf2
         l7Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747727909; x=1748332709;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=8dMTe43DqjT8zfacMTf3DDsqNF1vc7vtPkUiQOYQzjQ=;
        b=AL5N6hmwddrAKvfrdrh9s1yL2S5kWXKUn4ex82tW3VVGa3p5SQn8kNxXk2rMMGeYMT
         4h/9XOM1QL4cAAjpdAI09fz7XBUe9amZlBbjiWoPUrqNpf3dMvy2JZlWnbWZeP0LR3Rz
         zPs837FHkupNlms60lIotqU1D0R3xrxdztAmFci/Ggi6fBhDoGexeg+vdO1TDkb6NVs1
         eR0ZRrCKAWWq2z9BBOZz32e5ZCZkAcT/cPukj3rt3EVdUb2wXFmv4cwLkH9/XsM4wRxE
         jbl1htrRhgroioA1dBbYvHkK2p2w/9DhBDvkIPPmN/lvMSGaVlgGc2gXKhO4HIXwHv0d
         kw3Q==
X-Gm-Message-State: AOJu0YyXzP5aO0NiScWi7Wj6JlcoNkF529WeOYKMsu8jZbTFGNT5MeoQ
	H8cln+SZ+JRylnKEZNmfHmz/SHYTJkbk8plgZlusslnOlgqCBPZ8djFll0Azu0p8BC0=
X-Gm-Gg: ASbGnctWE9AHClPjQmhGcekQbC5N0xjWlpJ6TeL4hEJgM4M4OIzdP+KfvMvEb7CPO6x
	h3H4bZ/PtbJ03W5YP5IDDG4lg7sHpKqp8QN1yjzsh6ePZVJgAXWVLhN1AinfUEwPWRvRia4ViCL
	WMsmQCYn8Bp43526O4oroIhF8UnkwAkXs5iupGFgnRXEp9/n0oxe86MvGmLK+VFTVsp8clAnmOY
	WF2V0AJfafBLrcvu6KOUxWHdLK3+j7cgES8yiCZzokFYgrCpiWURC52AeQxUnOaQOzsbDduOH8i
	yGkKraEaRG5wDaW3kP1yBI7n8gcpG3AHEbj/tBj1iziuW/e7tCP7xiUEfhUdlsBvsEFcyCWe1wn
	787OoOodbKqPFp4MLPtWYXjLSdiWjxuGq2XCKgfI=
X-Google-Smtp-Source: AGHT+IFZoaWmCYifcMFayB18cdJmveuso7TaUw5NNZJ6gTqnaVttpAzLaUcUAwtCDz+T1sDWD0g7xA==
X-Received: by 2002:a05:6000:220b:b0:3a3:6c61:9d49 with SMTP id ffacd0b85a97d-3a36c619f4bmr7338711f8f.12.1747727908441;
        Tue, 20 May 2025 00:58:28 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:fb2e:6266:4e39:ce68? ([2a01:e0a:3d9:2080:fb2e:6266:4e39:ce68])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-447f3dd99f9sm21001435e9.40.2025.05.20.00.58.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 May 2025 00:58:28 -0700 (PDT)
Message-ID: <2d494c0f-3e0a-4506-a857-46b15d1a648f@linaro.org>
Date: Tue, 20 May 2025 09:58:27 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v4 07/30] drm/msm/dpu: remove DSPP_SC7180_MASK
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Vinod Koul <vkoul@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <20250519-dpu-drop-features-v4-0-6c5e88e31383@oss.qualcomm.com>
 <20250519-dpu-drop-features-v4-7-6c5e88e31383@oss.qualcomm.com>
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
In-Reply-To: <20250519-dpu-drop-features-v4-7-6c5e88e31383@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 19/05/2025 18:04, Dmitry Baryshkov wrote:
> From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 
> Stop declaring DPU_DSPP_PCC as a part of the DSPP features, use the
> presence of the PCC sblk to check whether PCC is present in the hardware
> or not.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h  | 4 ----
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_14_msm8937.h | 1 -
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_15_msm8917.h | 1 -
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_16_msm8953.h | 1 -
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_7_msm8996.h  | 2 --
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h  | 2 --
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_2_sdm660.h   | 2 --
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_3_sdm630.h   | 1 -
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h   | 4 ----
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_1_sdm670.h   | 2 --
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h   | 4 ----
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h  | 4 ----
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h   | 2 --
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h   | 1 -
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h   | 1 -
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h   | 4 ----
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h   | 1 -
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h   | 1 -
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h   | 1 -
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h  | 1 -
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h   | 1 -
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h   | 4 ----
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h   | 1 -
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h | 4 ----
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h   | 4 ----
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h  | 4 ----
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h   | 4 ----
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_1_sar2130p.h | 4 ----
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h | 4 ----
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c           | 2 --
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c              | 2 +-
>   31 files changed, 1 insertion(+), 73 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h
> index 61420821a5f2dd5e56b8336c898290a2552c77fa..b14d0d6886f019c8fa06047baf734e38696f14ce 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h
> @@ -189,22 +189,18 @@ static const struct dpu_dspp_cfg sm8650_dspp[] = {
>   	{
>   		.name = "dspp_0", .id = DSPP_0,
>   		.base = 0x54000, .len = 0x1800,
> -		.features = DSPP_SC7180_MASK,
>   		.sblk = &sdm845_dspp_sblk,
>   	}, {
>   		.name = "dspp_1", .id = DSPP_1,
>   		.base = 0x56000, .len = 0x1800,
> -		.features = DSPP_SC7180_MASK,
>   		.sblk = &sdm845_dspp_sblk,
>   	}, {
>   		.name = "dspp_2", .id = DSPP_2,
>   		.base = 0x58000, .len = 0x1800,
> -		.features = DSPP_SC7180_MASK,
>   		.sblk = &sdm845_dspp_sblk,
>   	}, {
>   		.name = "dspp_3", .id = DSPP_3,
>   		.base = 0x5a000, .len = 0x1800,
> -		.features = DSPP_SC7180_MASK,
>   		.sblk = &sdm845_dspp_sblk,
>   	},
>   };
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_14_msm8937.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_14_msm8937.h
> index 39027a21c6feecfba2d164799d9d982fc282d06b..c0b4db94777c42efd941fdd52993b854ab54c694 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_14_msm8937.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_14_msm8937.h
> @@ -116,7 +116,6 @@ static const struct dpu_dspp_cfg msm8937_dspp[] = {
>   	{
>   		.name = "dspp_0", .id = DSPP_0,
>   		.base = 0x54000, .len = 0x1800,
> -		.features = DSPP_SC7180_MASK,
>   		.sblk = &msm8998_dspp_sblk,
>   	},
>   };
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_15_msm8917.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_15_msm8917.h
> index 8d1b43ea1663cfbf35bed7b913d5d0bd16757162..d3e4c48be306a04b457cc002910eb018a3f13154 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_15_msm8917.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_15_msm8917.h
> @@ -103,7 +103,6 @@ static const struct dpu_dspp_cfg msm8917_dspp[] = {
>   	{
>   		.name = "dspp_0", .id = DSPP_0,
>   		.base = 0x54000, .len = 0x1800,
> -		.features = DSPP_SC7180_MASK,
>   		.sblk = &msm8998_dspp_sblk,
>   	},
>   };
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_16_msm8953.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_16_msm8953.h
> index 16c12499b24bb4cb4a7f126dd6580d9d366142d8..c488b88332d0e69cfb23bcf4e41a2e4f4be6844d 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_16_msm8953.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_16_msm8953.h
> @@ -116,7 +116,6 @@ static const struct dpu_dspp_cfg msm8953_dspp[] = {
>   	{
>   		.name = "dspp_0", .id = DSPP_0,
>   		.base = 0x54000, .len = 0x1800,
> -		.features = DSPP_SC7180_MASK,
>   		.sblk = &msm8998_dspp_sblk,
>   	},
>   };
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_7_msm8996.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_7_msm8996.h
> index 91f514d28ac62deeafa843b5fbd0c8eb856fa49e..8fe07a5683f734a058e7e7250f0811e3b7b7cf07 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_7_msm8996.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_7_msm8996.h
> @@ -223,12 +223,10 @@ static const struct dpu_dspp_cfg msm8996_dspp[] = {
>   	{
>   		.name = "dspp_0", .id = DSPP_0,
>   		.base = 0x54000, .len = 0x1800,
> -		.features = DSPP_SC7180_MASK,
>   		.sblk = &msm8998_dspp_sblk,
>   	}, {
>   		.name = "dspp_1", .id = DSPP_1,
>   		.base = 0x56000, .len = 0x1800,
> -		.features = DSPP_SC7180_MASK,
>   		.sblk = &msm8998_dspp_sblk,
>   	},
>   };
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
> index 413cd59dc0c4270973b34fc3a19405feff5b47e3..91285519c540025abce5c51f2f28442ed9d479b0 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
> @@ -212,12 +212,10 @@ static const struct dpu_dspp_cfg msm8998_dspp[] = {
>   	{
>   		.name = "dspp_0", .id = DSPP_0,
>   		.base = 0x54000, .len = 0x1800,
> -		.features = DSPP_SC7180_MASK,
>   		.sblk = &msm8998_dspp_sblk,
>   	}, {
>   		.name = "dspp_1", .id = DSPP_1,
>   		.base = 0x56000, .len = 0x1800,
> -		.features = DSPP_SC7180_MASK,
>   		.sblk = &msm8998_dspp_sblk,
>   	},
>   };
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_2_sdm660.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_2_sdm660.h
> index b2eb7ca699e3ddacee441216be647784c9bbfcb5..50e0e3aec23c02acc1ce2d2a8a5658d6d49a62ac 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_2_sdm660.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_2_sdm660.h
> @@ -183,12 +183,10 @@ static const struct dpu_dspp_cfg sdm660_dspp[] = {
>   	{
>   		.name = "dspp_0", .id = DSPP_0,
>   		.base = 0x54000, .len = 0x1800,
> -		.features = DSPP_SC7180_MASK,
>   		.sblk = &msm8998_dspp_sblk,
>   	}, {
>   		.name = "dspp_1", .id = DSPP_1,
>   		.base = 0x56000, .len = 0x1800,
> -		.features = DSPP_SC7180_MASK,
>   		.sblk = &msm8998_dspp_sblk,
>   	},
>   };
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_3_sdm630.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_3_sdm630.h
> index 85e121ad84a0f35fe2ba45cb76856ad83effdf44..1c299491e61f0465a164be74b7a754435f347cb6 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_3_sdm630.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_3_sdm630.h
> @@ -133,7 +133,6 @@ static const struct dpu_dspp_cfg sdm630_dspp[] = {
>   	{
>   		.name = "dspp_0", .id = DSPP_0,
>   		.base = 0x54000, .len = 0x1800,
> -		.features = DSPP_SC7180_MASK,
>   		.sblk = &msm8998_dspp_sblk,
>   	},
>   };
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
> index 49363d7d5b9384dd66ed02ee9ada05b24355f1bf..50e40405a5271ea6b12caa7a931ff7fe3f2478a8 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
> @@ -170,22 +170,18 @@ static const struct dpu_dspp_cfg sdm845_dspp[] = {
>   	{
>   		.name = "dspp_0", .id = DSPP_0,
>   		.base = 0x54000, .len = 0x1800,
> -		.features = DSPP_SC7180_MASK,
>   		.sblk = &sdm845_dspp_sblk,
>   	}, {
>   		.name = "dspp_1", .id = DSPP_1,
>   		.base = 0x56000, .len = 0x1800,
> -		.features = DSPP_SC7180_MASK,
>   		.sblk = &sdm845_dspp_sblk,
>   	}, {
>   		.name = "dspp_2", .id = DSPP_2,
>   		.base = 0x58000, .len = 0x1800,
> -		.features = DSPP_SC7180_MASK,
>   		.sblk = &sdm845_dspp_sblk,
>   	}, {
>   		.name = "dspp_3", .id = DSPP_3,
>   		.base = 0x5a000, .len = 0x1800,
> -		.features = DSPP_SC7180_MASK,
>   		.sblk = &sdm845_dspp_sblk,
>   	},
>   };
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_1_sdm670.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_1_sdm670.h
> index c2fde980fb521d9259a9f1e3bf88cc81f46fdfe8..3a60432a758a942eb1541f143018bd466b2bdf20 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_1_sdm670.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_1_sdm670.h
> @@ -103,12 +103,10 @@ static const struct dpu_dspp_cfg sdm670_dspp[] = {
>   	{
>   		.name = "dspp_0", .id = DSPP_0,
>   		.base = 0x54000, .len = 0x1800,
> -		.features = DSPP_SC7180_MASK,
>   		.sblk = &sdm845_dspp_sblk,
>   	}, {
>   		.name = "dspp_1", .id = DSPP_1,
>   		.base = 0x56000, .len = 0x1800,
> -		.features = DSPP_SC7180_MASK,
>   		.sblk = &sdm845_dspp_sblk,
>   	},
>   };
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
> index 08d38e1d420c1ceb9cc527b260c08edcddb139f4..b2ee5ee01870507d9f01020443c30dc573414c72 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
> @@ -193,22 +193,18 @@ static const struct dpu_dspp_cfg sm8150_dspp[] = {
>   	{
>   		.name = "dspp_0", .id = DSPP_0,
>   		.base = 0x54000, .len = 0x1800,
> -		.features = DSPP_SC7180_MASK,
>   		.sblk = &sdm845_dspp_sblk,
>   	}, {
>   		.name = "dspp_1", .id = DSPP_1,
>   		.base = 0x56000, .len = 0x1800,
> -		.features = DSPP_SC7180_MASK,
>   		.sblk = &sdm845_dspp_sblk,
>   	}, {
>   		.name = "dspp_2", .id = DSPP_2,
>   		.base = 0x58000, .len = 0x1800,
> -		.features = DSPP_SC7180_MASK,
>   		.sblk = &sdm845_dspp_sblk,
>   	}, {
>   		.name = "dspp_3", .id = DSPP_3,
>   		.base = 0x5a000, .len = 0x1800,
> -		.features = DSPP_SC7180_MASK,
>   		.sblk = &sdm845_dspp_sblk,
>   	},
>   };
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
> index d6f8b1030c68a428a144428b422b63b960c2fdba..6db04c668a87a9f7baea01a9ea2a0f1bbb1212bf 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
> @@ -193,22 +193,18 @@ static const struct dpu_dspp_cfg sc8180x_dspp[] = {
>   	{
>   		.name = "dspp_0", .id = DSPP_0,
>   		.base = 0x54000, .len = 0x1800,
> -		.features = DSPP_SC7180_MASK,
>   		.sblk = &sdm845_dspp_sblk,
>   	}, {
>   		.name = "dspp_1", .id = DSPP_1,
>   		.base = 0x56000, .len = 0x1800,
> -		.features = DSPP_SC7180_MASK,
>   		.sblk = &sdm845_dspp_sblk,
>   	}, {
>   		.name = "dspp_2", .id = DSPP_2,
>   		.base = 0x58000, .len = 0x1800,
> -		.features = DSPP_SC7180_MASK,
>   		.sblk = &sdm845_dspp_sblk,
>   	}, {
>   		.name = "dspp_3", .id = DSPP_3,
>   		.base = 0x5a000, .len = 0x1800,
> -		.features = DSPP_SC7180_MASK,
>   		.sblk = &sdm845_dspp_sblk,
>   	},
>   };
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h
> index 71ba48b0565648a02044d444d0242fe04cb34478..6f61ce85c536e36b65b98ba4740711cb495a7c9a 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h
> @@ -150,12 +150,10 @@ static const struct dpu_dspp_cfg sm7150_dspp[] = {
>   	{
>   		.name = "dspp_0", .id = DSPP_0,
>   		.base = 0x54000, .len = 0x1800,
> -		.features = DSPP_SC7180_MASK,
>   		.sblk = &sdm845_dspp_sblk,
>   	}, {
>   		.name = "dspp_1", .id = DSPP_1,
>   		.base = 0x56000, .len = 0x1800,
> -		.features = DSPP_SC7180_MASK,
>   		.sblk = &sdm845_dspp_sblk,
>   	},
>   };
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h
> index da11830d44072666e47b0505e2edc3ae7717eb23..dc6d8fd05c2e3afbe5182b1ae8dd9fea8b6543e5 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h
> @@ -136,7 +136,6 @@ static const struct dpu_dspp_cfg sm6150_dspp[] = {
>   	{
>   		.name = "dspp_0", .id = DSPP_0,
>   		.base = 0x54000, .len = 0x1800,
> -		.features = DSPP_SC7180_MASK,
>   		.sblk = &sdm845_dspp_sblk,
>   	},
>   };
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h
> index fcfb3774f7a18d8e01546a3ac72aa29f7b750443..192e90b570dbf8f5c3c24f572443e111f6cf3db2 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h
> @@ -117,7 +117,6 @@ static const struct dpu_dspp_cfg sm6125_dspp[] = {
>   	{
>   		.name = "dspp_0", .id = DSPP_0,
>   		.base = 0x54000, .len = 0x1800,
> -		.features = DSPP_SC7180_MASK,
>   		.sblk = &sdm845_dspp_sblk,
>   	},
>   };
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
> index a86fdb33ebddc7f2a9914ef04899397e3271b79e..bdd92b5a61eabc6a1d5e0bfe740ed6d9f1e8e94f 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
> @@ -191,22 +191,18 @@ static const struct dpu_dspp_cfg sm8250_dspp[] = {
>   	{
>   		.name = "dspp_0", .id = DSPP_0,
>   		.base = 0x54000, .len = 0x1800,
> -		.features = DSPP_SC7180_MASK,
>   		.sblk = &sdm845_dspp_sblk,
>   	}, {
>   		.name = "dspp_1", .id = DSPP_1,
>   		.base = 0x56000, .len = 0x1800,
> -		.features = DSPP_SC7180_MASK,
>   		.sblk = &sdm845_dspp_sblk,
>   	}, {
>   		.name = "dspp_2", .id = DSPP_2,
>   		.base = 0x58000, .len = 0x1800,
> -		.features = DSPP_SC7180_MASK,
>   		.sblk = &sdm845_dspp_sblk,
>   	}, {
>   		.name = "dspp_3", .id = DSPP_3,
>   		.base = 0x5a000, .len = 0x1800,
> -		.features = DSPP_SC7180_MASK,
>   		.sblk = &sdm845_dspp_sblk,
>   	},
>   };
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
> index 842fcc5887fef15789fbc686fe2156b6b509b45c..ce2ec6af5f53e2177009ca8826ca510fa08c03c7 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
> @@ -106,7 +106,6 @@ static const struct dpu_dspp_cfg sc7180_dspp[] = {
>   	{
>   		.name = "dspp_0", .id = DSPP_0,
>   		.base = 0x54000, .len = 0x1800,
> -		.features = DSPP_SC7180_MASK,
>   		.sblk = &sdm845_dspp_sblk,
>   	},
>   };
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h
> index c5fd89dd7c89046bdbf1b1bf223aac2e3c4c0b26..986179b53f8b59200d10f5159cac630732dc7196 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h
> @@ -69,7 +69,6 @@ static const struct dpu_dspp_cfg sm6115_dspp[] = {
>   	{
>   		.name = "dspp_0", .id = DSPP_0,
>   		.base = 0x54000, .len = 0x1800,
> -		.features = DSPP_SC7180_MASK,
>   		.sblk = &sdm845_dspp_sblk,
>   	},
>   };
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h
> index a234bb289d247d065b336564faea8dc35b00def9..c2321a4a7d3894d85062d083b45402950122007b 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h
> @@ -115,7 +115,6 @@ static const struct dpu_dspp_cfg sm6350_dspp[] = {
>   	{
>   		.name = "dspp_0", .id = DSPP_0,
>   		.base = 0x54000, .len = 0x1800,
> -		.features = DSPP_SC7180_MASK,
>   		.sblk = &sdm845_dspp_sblk,
>   	},
>   };
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h
> index 53f3be28f6f61bb7e3f519b0efa4cb2f68d38810..c3dd2383bd5f32926b50d98c937da25ed59d7cb3 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h
> @@ -69,7 +69,6 @@ static const struct dpu_dspp_cfg qcm2290_dspp[] = {
>   	{
>   		.name = "dspp_0", .id = DSPP_0,
>   		.base = 0x54000, .len = 0x1800,
> -		.features = DSPP_SC7180_MASK,
>   		.sblk = &sdm845_dspp_sblk,
>   	},
>   };
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h
> index 3a3bc8e429be0ba86185741b6b27d8a62489779f..abeaa2b8e06fdf6ce5cec2c1a4fd025a342f5a2f 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h
> @@ -71,7 +71,6 @@ static const struct dpu_dspp_cfg sm6375_dspp[] = {
>   	{
>   		.name = "dspp_0", .id = DSPP_0,
>   		.base = 0x54000, .len = 0x1800,
> -		.features = DSPP_SC7180_MASK,
>   		.sblk = &sdm845_dspp_sblk,
>   	},
>   };
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
> index e887e78059a81569fac8a4246ad63856dc48cfcb..bbef0e1c597299d24a923e1f0d977c99afedb8fb 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
> @@ -191,22 +191,18 @@ static const struct dpu_dspp_cfg sm8350_dspp[] = {
>   	{
>   		.name = "dspp_0", .id = DSPP_0,
>   		.base = 0x54000, .len = 0x1800,
> -		.features = DSPP_SC7180_MASK,
>   		.sblk = &sdm845_dspp_sblk,
>   	}, {
>   		.name = "dspp_1", .id = DSPP_1,
>   		.base = 0x56000, .len = 0x1800,
> -		.features = DSPP_SC7180_MASK,
>   		.sblk = &sdm845_dspp_sblk,
>   	}, {
>   		.name = "dspp_2", .id = DSPP_2,
>   		.base = 0x58000, .len = 0x1800,
> -		.features = DSPP_SC7180_MASK,
>   		.sblk = &sdm845_dspp_sblk,
>   	}, {
>   		.name = "dspp_3", .id = DSPP_3,
>   		.base = 0x5a000, .len = 0x1800,
> -		.features = DSPP_SC7180_MASK,
>   		.sblk = &sdm845_dspp_sblk,
>   	},
>   };
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
> index 1edec0644b078ac1fff129354d4d02eec015a331..281826170da082fc90a05c641060901ece0fbed3 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
> @@ -117,7 +117,6 @@ static const struct dpu_dspp_cfg sc7280_dspp[] = {
>   	{
>   		.name = "dspp_0", .id = DSPP_0,
>   		.base = 0x54000, .len = 0x1800,
> -		.features = DSPP_SC7180_MASK,
>   		.sblk = &sdm845_dspp_sblk,
>   	},
>   };
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
> index 9d60208745138bf29a7bdbd14ef28a2102f36f9f..1dd0a1aa222d65f03013d634a87371dc552b5bd8 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
> @@ -191,22 +191,18 @@ static const struct dpu_dspp_cfg sc8280xp_dspp[] = {
>   	{
>   		.name = "dspp_0", .id = DSPP_0,
>   		.base = 0x54000, .len = 0x1800,
> -		.features = DSPP_SC7180_MASK,
>   		.sblk = &sdm845_dspp_sblk,
>   	}, {
>   		.name = "dspp_1", .id = DSPP_1,
>   		.base = 0x56000, .len = 0x1800,
> -		.features = DSPP_SC7180_MASK,
>   		.sblk = &sdm845_dspp_sblk,
>   	}, {
>   		.name = "dspp_2", .id = DSPP_2,
>   		.base = 0x58000, .len = 0x1800,
> -		.features = DSPP_SC7180_MASK,
>   		.sblk = &sdm845_dspp_sblk,
>   	}, {
>   		.name = "dspp_3", .id = DSPP_3,
>   		.base = 0x5a000, .len = 0x1800,
> -		.features = DSPP_SC7180_MASK,
>   		.sblk = &sdm845_dspp_sblk,
>   	},
>   };
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
> index 631154059c31e8ce1b9e3631552ce49aa589d4cf..50142b14e24eb875e72e5cff3b28ff8aba89fc9c 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
> @@ -192,22 +192,18 @@ static const struct dpu_dspp_cfg sm8450_dspp[] = {
>   	{
>   		.name = "dspp_0", .id = DSPP_0,
>   		.base = 0x54000, .len = 0x1800,
> -		.features = DSPP_SC7180_MASK,
>   		.sblk = &sdm845_dspp_sblk,
>   	}, {
>   		.name = "dspp_1", .id = DSPP_1,
>   		.base = 0x56000, .len = 0x1800,
> -		.features = DSPP_SC7180_MASK,
>   		.sblk = &sdm845_dspp_sblk,
>   	}, {
>   		.name = "dspp_2", .id = DSPP_2,
>   		.base = 0x58000, .len = 0x1800,
> -		.features = DSPP_SC7180_MASK,
>   		.sblk = &sdm845_dspp_sblk,
>   	}, {
>   		.name = "dspp_3", .id = DSPP_3,
>   		.base = 0x5a000, .len = 0x1800,
> -		.features = DSPP_SC7180_MASK,
>   		.sblk = &sdm845_dspp_sblk,
>   	},
>   };
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h
> index 3547fdfb28cae6cd8d1909b268b88676afad0be7..264cd6d3640be1bf321fda429748ecdafbeed214 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h
> @@ -191,22 +191,18 @@ static const struct dpu_dspp_cfg sa8775p_dspp[] = {
>   	{
>   		.name = "dspp_0", .id = DSPP_0,
>   		.base = 0x54000, .len = 0x1800,
> -		.features = DSPP_SC7180_MASK,
>   		.sblk = &sdm845_dspp_sblk,
>   	}, {
>   		.name = "dspp_1", .id = DSPP_1,
>   		.base = 0x56000, .len = 0x1800,
> -		.features = DSPP_SC7180_MASK,
>   		.sblk = &sdm845_dspp_sblk,
>   	}, {
>   		.name = "dspp_2", .id = DSPP_2,
>   		.base = 0x58000, .len = 0x1800,
> -		.features = DSPP_SC7180_MASK,
>   		.sblk = &sdm845_dspp_sblk,
>   	}, {
>   		.name = "dspp_3", .id = DSPP_3,
>   		.base = 0x5a000, .len = 0x1800,
> -		.features = DSPP_SC7180_MASK,
>   		.sblk = &sdm845_dspp_sblk,
>   	},
>   };
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
> index e16e47a6f426359548434569ad632aa68f32908d..4c5785332b5240109af36a1256d4ea29c348bced 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
> @@ -189,22 +189,18 @@ static const struct dpu_dspp_cfg sm8550_dspp[] = {
>   	{
>   		.name = "dspp_0", .id = DSPP_0,
>   		.base = 0x54000, .len = 0x1800,
> -		.features = DSPP_SC7180_MASK,
>   		.sblk = &sdm845_dspp_sblk,
>   	}, {
>   		.name = "dspp_1", .id = DSPP_1,
>   		.base = 0x56000, .len = 0x1800,
> -		.features = DSPP_SC7180_MASK,
>   		.sblk = &sdm845_dspp_sblk,
>   	}, {
>   		.name = "dspp_2", .id = DSPP_2,
>   		.base = 0x58000, .len = 0x1800,
> -		.features = DSPP_SC7180_MASK,
>   		.sblk = &sdm845_dspp_sblk,
>   	}, {
>   		.name = "dspp_3", .id = DSPP_3,
>   		.base = 0x5a000, .len = 0x1800,
> -		.features = DSPP_SC7180_MASK,
>   		.sblk = &sdm845_dspp_sblk,
>   	},
>   };
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_1_sar2130p.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_1_sar2130p.h
> index f85d5d7ae51d64203647a8bcec91f524c6e33528..960c68f33074e0cec0f33aa7d4f8f3b4cc69bac5 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_1_sar2130p.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_1_sar2130p.h
> @@ -189,22 +189,18 @@ static const struct dpu_dspp_cfg sar2130p_dspp[] = {
>   	{
>   		.name = "dspp_0", .id = DSPP_0,
>   		.base = 0x54000, .len = 0x1800,
> -		.features = DSPP_SC7180_MASK,
>   		.sblk = &sdm845_dspp_sblk,
>   	}, {
>   		.name = "dspp_1", .id = DSPP_1,
>   		.base = 0x56000, .len = 0x1800,
> -		.features = DSPP_SC7180_MASK,
>   		.sblk = &sdm845_dspp_sblk,
>   	}, {
>   		.name = "dspp_2", .id = DSPP_2,
>   		.base = 0x58000, .len = 0x1800,
> -		.features = DSPP_SC7180_MASK,
>   		.sblk = &sdm845_dspp_sblk,
>   	}, {
>   		.name = "dspp_3", .id = DSPP_3,
>   		.base = 0x5a000, .len = 0x1800,
> -		.features = DSPP_SC7180_MASK,
>   		.sblk = &sdm845_dspp_sblk,
>   	},
>   };
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h
> index 0d6511f90975508b36b0fa00a92349a82eff4d52..85dcf577b844995fe11322ec506885bc4a85e33c 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h
> @@ -188,22 +188,18 @@ static const struct dpu_dspp_cfg x1e80100_dspp[] = {
>   	{
>   		.name = "dspp_0", .id = DSPP_0,
>   		.base = 0x54000, .len = 0x1800,
> -		.features = DSPP_SC7180_MASK,
>   		.sblk = &sdm845_dspp_sblk,
>   	}, {
>   		.name = "dspp_1", .id = DSPP_1,
>   		.base = 0x56000, .len = 0x1800,
> -		.features = DSPP_SC7180_MASK,
>   		.sblk = &sdm845_dspp_sblk,
>   	}, {
>   		.name = "dspp_2", .id = DSPP_2,
>   		.base = 0x58000, .len = 0x1800,
> -		.features = DSPP_SC7180_MASK,
>   		.sblk = &sdm845_dspp_sblk,
>   	}, {
>   		.name = "dspp_3", .id = DSPP_3,
>   		.base = 0x5a000, .len = 0x1800,
> -		.features = DSPP_SC7180_MASK,
>   		.sblk = &sdm845_dspp_sblk,
>   	},
>   };
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> index d383368c743b202d7256f6759deecaf9d756bb02..00e6f3e56ed1f9af581bad9845971fad315ef83c 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> @@ -113,8 +113,6 @@
>   #define CTL_SM8550_MASK \
>   	(CTL_SC7280_MASK | BIT(DPU_CTL_HAS_LAYER_EXT4))
>   
> -#define DSPP_SC7180_MASK BIT(DPU_DSPP_PCC)
> -
>   #define INTF_SC7180_MASK \
>   	(BIT(DPU_INTF_INPUT_CTRL) | \
>   	 BIT(DPU_INTF_STATUS_SUPPORTED) | \
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c
> index 0f5a74398e66642fba48c112db41ffc75ae2a79f..11fb1bc54fa92a5d9926addb437bc4b8f283723b 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c
> @@ -90,7 +90,7 @@ struct dpu_hw_dspp *dpu_hw_dspp_init(struct drm_device *dev,
>   	/* Assign ops */
>   	c->idx = cfg->id;
>   	c->cap = cfg;
> -	if (test_bit(DPU_DSPP_PCC, &c->cap->features))
> +	if (c->cap->sblk->pcc.base)
>   		c->ops.setup_pcc = dpu_setup_dspp_pcc;
>   
>   	return c;
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

