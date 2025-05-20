Return-Path: <linux-arm-msm+bounces-58631-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 027C5ABD106
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 May 2025 09:54:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 724703B8CDC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 May 2025 07:54:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C29F258CD9;
	Tue, 20 May 2025 07:54:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="i+6IvTVe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A9F11E8354
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 May 2025 07:54:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747727682; cv=none; b=Lnh+osdbjEypNrXNnUvH5Zkp9kSfYWKDqSGWCCQZogaj9sQ2/+6qB1H/LcsF10gg6Z+UV0/zyP5uEfgEbKdCtgRpFaytq14JvqIhu7d5NpRf6bZMBpnFdYNi3rpJ4HqtenAwjIaypRcQc2Y+e3vSXHk8dHuEE0F8L7SiCCu4y+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747727682; c=relaxed/simple;
	bh=K1evhkVfsMS0rsOp2GRW+Jezn2+YrecQnjlOxEcrMU0=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=tqSRexR2Lg5X13yTm2RBKU4cWLteXy1b6P5rVoCcKIbhO5W8CnRorKJNZjx9+61OTlbduzN3sLYq36s5G9cQL1+vH0jb9uZXTOBweqa6LhS9GkZKNgIIGk+Jcmisvi99osPnrFg0alHpsaTtxASU+MZ+ZKrnkAETLmiZZAf0ea4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=i+6IvTVe; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-43cfdc2c8c9so31028315e9.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 May 2025 00:54:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747727677; x=1748332477; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6cvE/C6yPe+4SrZI2Lutz8ETjiuz12KYDKwdyJk+vb0=;
        b=i+6IvTVesEcH7tJIygT8FI3leK13oQ1QW5TS5kM1Hq2UTk9gW6iPxFO5ZbTbiJjs82
         aSyJ1hxhhsEwFQjrE0Gvc1ZHFT/TOlpy15KtzwqqRWY5l1TuS8h/pm1boDyiHrT6sC0c
         pIlcWwV2G9nOxHbgx/KJr22L04n9M1MGdaJHNul3/X0VgJ5/y8jNotFqm/MzHzTpI7kB
         FfTxw7Yspf06wRxYgZ0jksyvUP/SO12btpyWrfvvZyZx0+B++SqQ5CdEVHzd8GUBwD3B
         1eVq+p+SwjgviHq/72eYRIFUeNm4UYAewbVwxWzftmvobO5TyQCeDvRQj16LVaBM9jKA
         xzhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747727677; x=1748332477;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=6cvE/C6yPe+4SrZI2Lutz8ETjiuz12KYDKwdyJk+vb0=;
        b=FYNUgT//MLxUgspEpekSmu+1UHYTZcgK3VbQ71+8KbCLnKJNcWJYlX1Lz68sQNqWTZ
         NPEpLHcotX0HQYyzZEW3lxGlwUPfNb1WAnVSTi+CzJnKRHMga8f8SOOBpJ/NO3qCpzNR
         DyjWoT7vzqzeiU3sXqnnCshw9PdQyA1XVBvVahgTNrK7epibGAgwlhExw+s9E3iaghnV
         L8mBY4cOfbw+cQAqLiCPH/7Oc8A9Nh2GKIgRJ8LshjsMoYz7Wdm9zIbionTGIa7BVvOY
         7Mk/gfRk4BooaBz+cD2vSRdpQmttTTIYN2KHXSvSHwLN/PzJ4oL2BAoito4Ri4SaXlRQ
         6dUg==
X-Gm-Message-State: AOJu0YwMUcP4xSFFKS1JPY9UKoG/ScpPFa/Lgvg2O2W4VOXU+58TbANH
	utwRMmUeVVLYr7Y1dy//5q5mURtXjksInN4lYzc36+VqqGrab/ZCT/4ttGkDGWmfSpE=
X-Gm-Gg: ASbGncshzyvq3J6sJLjiKB70k4BxI/GrFt0hZup3+zGRaVPTUdXxkamDCYTJQeP0q/j
	qIoF/705Jzf+1FA5P1TPkIFQTCZAjl3g7/D10gYfuCD5k10lEIguGOgENf6BpSfidxxlD2RF3xL
	s28aJQh4b2B/mxOk9J7HhwW9iehUO05wmvf1kHsASTq2r72L36r5NDFjO7mxu+t0mNx0E7dTZkd
	sF+VZforVTqJQjXcllnpd+mbSThLTcIPuIFYJM8hq2sMWlTw7yro7YtAgJN2BVgRMC554eUW7Tb
	7qMUQuEwTAOPWfPIYuRMm9qJQ5W7SfdT5fWHctTlOeduEhOYXZJyj+Ubvh8P9SWxYadcc17npOU
	l7uhM1T5PSpUUOYBBTRbKFzbCVOxG
X-Google-Smtp-Source: AGHT+IEqy44/1yEsZI7LkjAl1mZciuas5iPl8OChryycS2UbxVLXCPM523K12JzWALf4EsyKIQ1fUw==
X-Received: by 2002:a05:600c:4449:b0:441:ac58:ead5 with SMTP id 5b1f17b1804b1-442fd67591fmr166862525e9.31.1747727677272;
        Tue, 20 May 2025 00:54:37 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:fb2e:6266:4e39:ce68? ([2a01:e0a:3d9:2080:fb2e:6266:4e39:ce68])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a35ca5a79asm15191593f8f.25.2025.05.20.00.54.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 May 2025 00:54:36 -0700 (PDT)
Message-ID: <801020b7-cbbd-4aaf-b60d-0b34e746dc41@linaro.org>
Date: Tue, 20 May 2025 09:54:36 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v4 17/30] drm/msm/dpu: get rid of DPU_PINGPONG_DITHER
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Vinod Koul <vkoul@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <20250519-dpu-drop-features-v4-0-6c5e88e31383@oss.qualcomm.com>
 <20250519-dpu-drop-features-v4-17-6c5e88e31383@oss.qualcomm.com>
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
In-Reply-To: <20250519-dpu-drop-features-v4-17-6c5e88e31383@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 19/05/2025 18:04, Dmitry Baryshkov wrote:
> From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 
> Continue migration to the MDSS-revision based checks and replace
> DPU_PINGPONG_DITHER feature bit with the core_major_ver >= 3 check.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h  | 10 ----------
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h  |  4 ----
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_2_sdm660.h   |  4 ----
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_3_sdm630.h   |  2 --
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h   |  4 ----
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h   |  6 ------
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h  |  6 ------
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h   |  4 ----
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h   |  3 ---
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h   |  2 --
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h   |  6 ------
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h   |  2 --
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h   |  1 -
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h   |  2 --
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h  |  1 -
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h   |  1 -
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h   |  6 ------
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h   |  4 ----
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h |  6 ------
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h   |  8 --------
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h  |  8 --------
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h   |  8 --------
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_1_sar2130p.h |  8 --------
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h |  8 --------
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c           |  6 ------
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h           |  2 --
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c          |  2 +-
>   27 files changed, 1 insertion(+), 123 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h
> index 88582fc257dea342f05b93dae6afe986eb7f32d0..37c88b393c12d8a04395b6e5dffb67211d2db9cd 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h
> @@ -203,67 +203,57 @@ static const struct dpu_pingpong_cfg sm8650_pp[] = {
>   	{
>   		.name = "pingpong_0", .id = PINGPONG_0,
>   		.base = 0x69000, .len = 0,
> -		.features = BIT(DPU_PINGPONG_DITHER),
>   		.sblk = &sc7280_pp_sblk,
>   		.merge_3d = MERGE_3D_0,
>   		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
>   	}, {
>   		.name = "pingpong_1", .id = PINGPONG_1,
>   		.base = 0x6a000, .len = 0,
> -		.features = BIT(DPU_PINGPONG_DITHER),
>   		.sblk = &sc7280_pp_sblk,
>   		.merge_3d = MERGE_3D_0,
>   		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 9),
>   	}, {
>   		.name = "pingpong_2", .id = PINGPONG_2,
>   		.base = 0x6b000, .len = 0,
> -		.features = BIT(DPU_PINGPONG_DITHER),
>   		.sblk = &sc7280_pp_sblk,
>   		.merge_3d = MERGE_3D_1,
>   		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 10),
>   	}, {
>   		.name = "pingpong_3", .id = PINGPONG_3,
>   		.base = 0x6c000, .len = 0,
> -		.features = BIT(DPU_PINGPONG_DITHER),
>   		.sblk = &sc7280_pp_sblk,
>   		.merge_3d = MERGE_3D_1,
>   		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 11),
>   	}, {
>   		.name = "pingpong_4", .id = PINGPONG_4,
>   		.base = 0x6d000, .len = 0,
> -		.features = BIT(DPU_PINGPONG_DITHER),
>   		.sblk = &sc7280_pp_sblk,
>   		.merge_3d = MERGE_3D_2,
>   		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 30),
>   	}, {
>   		.name = "pingpong_5", .id = PINGPONG_5,
>   		.base = 0x6e000, .len = 0,
> -		.features = BIT(DPU_PINGPONG_DITHER),
>   		.sblk = &sc7280_pp_sblk,
>   		.merge_3d = MERGE_3D_2,
>   		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 31),
>   	}, {
>   		.name = "pingpong_cwb_0", .id = PINGPONG_CWB_0,
>   		.base = 0x66000, .len = 0,
> -		.features = BIT(DPU_PINGPONG_DITHER),
>   		.sblk = &sc7280_pp_sblk,
>   		.merge_3d = MERGE_3D_3,
>   	}, {
>   		.name = "pingpong_cwb_1", .id = PINGPONG_CWB_1,
>   		.base = 0x66400, .len = 0,
> -		.features = BIT(DPU_PINGPONG_DITHER),
>   		.sblk = &sc7280_pp_sblk,
>   		.merge_3d = MERGE_3D_3,
>   	}, {
>   		.name = "pingpong_cwb_2", .id = PINGPONG_CWB_2,
>   		.base = 0x7e000, .len = 0,
> -		.features = BIT(DPU_PINGPONG_DITHER),
>   		.sblk = &sc7280_pp_sblk,
>   		.merge_3d = MERGE_3D_4,
>   	}, {
>   		.name = "pingpong_cwb_3", .id = PINGPONG_CWB_3,
>   		.base = 0x7e400, .len = 0,
> -		.features = BIT(DPU_PINGPONG_DITHER),
>   		.sblk = &sc7280_pp_sblk,
>   		.merge_3d = MERGE_3D_4,
>   	},
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
> index 91285519c540025abce5c51f2f28442ed9d479b0..f2ec30837f9ccbff1041f0465d0123382a00355a 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
> @@ -170,28 +170,24 @@ static const struct dpu_pingpong_cfg msm8998_pp[] = {
>   	{
>   		.name = "pingpong_0", .id = PINGPONG_0,
>   		.base = 0x70000, .len = 0xd4,
> -		.features = PINGPONG_SDM845_MASK,
>   		.sblk = &sdm845_pp_sblk,
>   		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
>   		.intr_rdptr = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 12),
>   	}, {
>   		.name = "pingpong_1", .id = PINGPONG_1,
>   		.base = 0x70800, .len = 0xd4,
> -		.features = PINGPONG_SDM845_MASK,
>   		.sblk = &sdm845_pp_sblk,
>   		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 9),
>   		.intr_rdptr = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 13),
>   	}, {
>   		.name = "pingpong_2", .id = PINGPONG_2,
>   		.base = 0x71000, .len = 0xd4,
> -		.features = PINGPONG_SDM845_MASK,
>   		.sblk = &sdm845_pp_sblk,
>   		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 10),
>   		.intr_rdptr = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 14),
>   	}, {
>   		.name = "pingpong_3", .id = PINGPONG_3,
>   		.base = 0x71800, .len = 0xd4,
> -		.features = PINGPONG_SDM845_MASK,
>   		.sblk = &sdm845_pp_sblk,
>   		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 11),
>   		.intr_rdptr = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 15),
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_2_sdm660.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_2_sdm660.h
> index 50e0e3aec23c02acc1ce2d2a8a5658d6d49a62ac..26f39acd82e07c71cbeaaa72c14d9b7e14d2dcc3 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_2_sdm660.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_2_sdm660.h
> @@ -141,28 +141,24 @@ static const struct dpu_pingpong_cfg sdm660_pp[] = {
>   	{
>   		.name = "pingpong_0", .id = PINGPONG_0,
>   		.base = 0x70000, .len = 0xd4,
> -		.features = PINGPONG_SDM845_MASK,
>   		.sblk = &sdm845_pp_sblk,
>   		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
>   		.intr_rdptr = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 12),
>   	}, {
>   		.name = "pingpong_1", .id = PINGPONG_1,
>   		.base = 0x70800, .len = 0xd4,
> -		.features = PINGPONG_SDM845_MASK,
>   		.sblk = &sdm845_pp_sblk,
>   		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 9),
>   		.intr_rdptr = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 13),
>   	}, {
>   		.name = "pingpong_2", .id = PINGPONG_2,
>   		.base = 0x71000, .len = 0xd4,
> -		.features = PINGPONG_SDM845_MASK,
>   		.sblk = &sdm845_pp_sblk,
>   		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 10),
>   		.intr_rdptr = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 14),
>   	}, {
>   		.name = "pingpong_3", .id = PINGPONG_3,
>   		.base = 0x71800, .len = 0xd4,
> -		.features = PINGPONG_SDM845_MASK,
>   		.sblk = &sdm845_pp_sblk,
>   		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 11),
>   		.intr_rdptr = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 15),
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_3_sdm630.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_3_sdm630.h
> index 1c299491e61f0465a164be74b7a754435f347cb6..657f733c9ffff73f9eb5051ba55ed2e4e7bb496d 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_3_sdm630.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_3_sdm630.h
> @@ -115,14 +115,12 @@ static const struct dpu_pingpong_cfg sdm630_pp[] = {
>   	{
>   		.name = "pingpong_0", .id = PINGPONG_0,
>   		.base = 0x70000, .len = 0xd4,
> -		.features = BIT(DPU_PINGPONG_DITHER),
>   		.sblk = &sdm845_pp_sblk,
>   		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
>   		.intr_rdptr = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 12),
>   	}, {
>   		.name = "pingpong_2", .id = PINGPONG_2,
>   		.base = 0x71000, .len = 0xd4,
> -		.features = BIT(DPU_PINGPONG_DITHER),
>   		.sblk = &sdm845_pp_sblk,
>   		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 10),
>   		.intr_rdptr = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 14),
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
> index 50e40405a5271ea6b12caa7a931ff7fe3f2478a8..15da5ded19267711e6df8605d576539475fe634c 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
> @@ -190,28 +190,24 @@ static const struct dpu_pingpong_cfg sdm845_pp[] = {
>   	{
>   		.name = "pingpong_0", .id = PINGPONG_0,
>   		.base = 0x70000, .len = 0xd4,
> -		.features = PINGPONG_SDM845_MASK,
>   		.sblk = &sdm845_pp_sblk,
>   		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
>   		.intr_rdptr = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 12),
>   	}, {
>   		.name = "pingpong_1", .id = PINGPONG_1,
>   		.base = 0x70800, .len = 0xd4,
> -		.features = PINGPONG_SDM845_MASK,
>   		.sblk = &sdm845_pp_sblk,
>   		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 9),
>   		.intr_rdptr = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 13),
>   	}, {
>   		.name = "pingpong_2", .id = PINGPONG_2,
>   		.base = 0x71000, .len = 0xd4,
> -		.features = PINGPONG_SDM845_MASK,
>   		.sblk = &sdm845_pp_sblk,
>   		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 10),
>   		.intr_rdptr = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 14),
>   	}, {
>   		.name = "pingpong_3", .id = PINGPONG_3,
>   		.base = 0x71800, .len = 0xd4,
> -		.features = PINGPONG_SDM845_MASK,
>   		.sblk = &sdm845_pp_sblk,
>   		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 11),
>   		.intr_rdptr = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 15),
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
> index bcab869aafbe1e23e0267bbad377fc10d8c6256d..e07c2cc4188bb12e2253068ca8666ce9364c69c1 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
> @@ -207,42 +207,36 @@ static const struct dpu_pingpong_cfg sm8150_pp[] = {
>   	{
>   		.name = "pingpong_0", .id = PINGPONG_0,
>   		.base = 0x70000, .len = 0xd4,
> -		.features = PINGPONG_SM8150_MASK,
>   		.sblk = &sdm845_pp_sblk,
>   		.merge_3d = MERGE_3D_0,
>   		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
>   	}, {
>   		.name = "pingpong_1", .id = PINGPONG_1,
>   		.base = 0x70800, .len = 0xd4,
> -		.features = PINGPONG_SM8150_MASK,
>   		.sblk = &sdm845_pp_sblk,
>   		.merge_3d = MERGE_3D_0,
>   		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 9),
>   	}, {
>   		.name = "pingpong_2", .id = PINGPONG_2,
>   		.base = 0x71000, .len = 0xd4,
> -		.features = PINGPONG_SM8150_MASK,
>   		.sblk = &sdm845_pp_sblk,
>   		.merge_3d = MERGE_3D_1,
>   		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 10),
>   	}, {
>   		.name = "pingpong_3", .id = PINGPONG_3,
>   		.base = 0x71800, .len = 0xd4,
> -		.features = PINGPONG_SM8150_MASK,
>   		.sblk = &sdm845_pp_sblk,
>   		.merge_3d = MERGE_3D_1,
>   		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 11),
>   	}, {
>   		.name = "pingpong_4", .id = PINGPONG_4,
>   		.base = 0x72000, .len = 0xd4,
> -		.features = PINGPONG_SM8150_MASK,
>   		.sblk = &sdm845_pp_sblk,
>   		.merge_3d = MERGE_3D_2,
>   		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 30),
>   	}, {
>   		.name = "pingpong_5", .id = PINGPONG_5,
>   		.base = 0x72800, .len = 0xd4,
> -		.features = PINGPONG_SM8150_MASK,
>   		.sblk = &sdm845_pp_sblk,
>   		.merge_3d = MERGE_3D_2,
>   		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 31),
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
> index 4b61bc7eb79f00a184c95b2319b737fcee6c4cbb..b350dba28caed77e542d6a41ceac191a93e165a7 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
> @@ -207,42 +207,36 @@ static const struct dpu_pingpong_cfg sc8180x_pp[] = {
>   	{
>   		.name = "pingpong_0", .id = PINGPONG_0,
>   		.base = 0x70000, .len = 0xd4,
> -		.features = PINGPONG_SM8150_MASK,
>   		.sblk = &sdm845_pp_sblk,
>   		.merge_3d = MERGE_3D_0,
>   		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
>   	}, {
>   		.name = "pingpong_1", .id = PINGPONG_1,
>   		.base = 0x70800, .len = 0xd4,
> -		.features = PINGPONG_SM8150_MASK,
>   		.sblk = &sdm845_pp_sblk,
>   		.merge_3d = MERGE_3D_0,
>   		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 9),
>   	}, {
>   		.name = "pingpong_2", .id = PINGPONG_2,
>   		.base = 0x71000, .len = 0xd4,
> -		.features = PINGPONG_SM8150_MASK,
>   		.sblk = &sdm845_pp_sblk,
>   		.merge_3d = MERGE_3D_1,
>   		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 10),
>   	}, {
>   		.name = "pingpong_3", .id = PINGPONG_3,
>   		.base = 0x71800, .len = 0xd4,
> -		.features = PINGPONG_SM8150_MASK,
>   		.sblk = &sdm845_pp_sblk,
>   		.merge_3d = MERGE_3D_1,
>   		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 11),
>   	}, {
>   		.name = "pingpong_4", .id = PINGPONG_4,
>   		.base = 0x72000, .len = 0xd4,
> -		.features = PINGPONG_SM8150_MASK,
>   		.sblk = &sdm845_pp_sblk,
>   		.merge_3d = MERGE_3D_2,
>   		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 30),
>   	}, {
>   		.name = "pingpong_5", .id = PINGPONG_5,
>   		.base = 0x72800, .len = 0xd4,
> -		.features = PINGPONG_SM8150_MASK,
>   		.sblk = &sdm845_pp_sblk,
>   		.merge_3d = MERGE_3D_2,
>   		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 31),
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h
> index 2e7ae68f7e922e9b71d79627806042f645cb4ad2..27c71a8a1f31921e5e1f4b6b15e0efc25fb63537 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h
> @@ -156,28 +156,24 @@ static const struct dpu_pingpong_cfg sm7150_pp[] = {
>   	{
>   		.name = "pingpong_0", .id = PINGPONG_0,
>   		.base = 0x70000, .len = 0xd4,
> -		.features = PINGPONG_SM8150_MASK,
>   		.sblk = &sdm845_pp_sblk,
>   		.merge_3d = MERGE_3D_0,
>   		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
>   	}, {
>   		.name = "pingpong_1", .id = PINGPONG_1,
>   		.base = 0x70800, .len = 0xd4,
> -		.features = PINGPONG_SM8150_MASK,
>   		.sblk = &sdm845_pp_sblk,
>   		.merge_3d = MERGE_3D_0,
>   		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 9),
>   	}, {
>   		.name = "pingpong_2", .id = PINGPONG_2,
>   		.base = 0x71000, .len = 0xd4,
> -		.features = PINGPONG_SM8150_MASK,
>   		.sblk = &sdm845_pp_sblk,
>   		.merge_3d = MERGE_3D_1,
>   		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 10),
>   	}, {
>   		.name = "pingpong_3", .id = PINGPONG_3,
>   		.base = 0x71800, .len = 0xd4,
> -		.features = PINGPONG_SM8150_MASK,
>   		.sblk = &sdm845_pp_sblk,
>   		.merge_3d = MERGE_3D_1,
>   		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 11),
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h
> index a99c99ca37703cc3a7d4403d3f026f234b693319..e2306d314ef8f8b59078a8ca8c529f2e56385c98 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h
> @@ -138,19 +138,16 @@ static const struct dpu_pingpong_cfg sm6150_pp[] = {
>   	{
>   		.name = "pingpong_0", .id = PINGPONG_0,
>   		.base = 0x70000, .len = 0xd4,
> -		.features = PINGPONG_SM8150_MASK,
>   		.sblk = &sdm845_pp_sblk,
>   		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
>   	}, {
>   		.name = "pingpong_1", .id = PINGPONG_1,
>   		.base = 0x70800, .len = 0xd4,
> -		.features = PINGPONG_SM8150_MASK,
>   		.sblk = &sdm845_pp_sblk,
>   		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 9),
>   	}, {
>   		.name = "pingpong_2", .id = PINGPONG_2,
>   		.base = 0x71000, .len = 0xd4,
> -		.features = PINGPONG_SM8150_MASK,
>   		.sblk = &sdm845_pp_sblk,
>   		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 10),
>   	},
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h
> index 72f1328deda87ccc0b97f3f03d5840a77426b2b7..62136811a530a6072accbd1ab3e02e7e24220ccb 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h
> @@ -119,14 +119,12 @@ static const struct dpu_pingpong_cfg sm6125_pp[] = {
>   	{
>   		.name = "pingpong_0", .id = PINGPONG_0,
>   		.base = 0x70000, .len = 0xd4,
> -		.features = PINGPONG_SM8150_MASK,
>   		.merge_3d = 0,
>   		.sblk = &sdm845_pp_sblk,
>   		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
>   	}, {
>   		.name = "pingpong_1", .id = PINGPONG_1,
>   		.base = 0x70800, .len = 0xd4,
> -		.features = PINGPONG_SM8150_MASK,
>   		.merge_3d = 0,
>   		.sblk = &sdm845_pp_sblk,
>   		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 9),
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
> index aee4adb3b73d2efb074abc58dff7d213a73207d9..34f11fb084c02cf994c272196299bb9f7bced4f1 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
> @@ -205,42 +205,36 @@ static const struct dpu_pingpong_cfg sm8250_pp[] = {
>   	{
>   		.name = "pingpong_0", .id = PINGPONG_0,
>   		.base = 0x70000, .len = 0xd4,
> -		.features = PINGPONG_SM8150_MASK,
>   		.sblk = &sdm845_pp_sblk,
>   		.merge_3d = MERGE_3D_0,
>   		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
>   	}, {
>   		.name = "pingpong_1", .id = PINGPONG_1,
>   		.base = 0x70800, .len = 0xd4,
> -		.features = PINGPONG_SM8150_MASK,
>   		.sblk = &sdm845_pp_sblk,
>   		.merge_3d = MERGE_3D_0,
>   		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 9),
>   	}, {
>   		.name = "pingpong_2", .id = PINGPONG_2,
>   		.base = 0x71000, .len = 0xd4,
> -		.features = PINGPONG_SM8150_MASK,
>   		.sblk = &sdm845_pp_sblk,
>   		.merge_3d = MERGE_3D_1,
>   		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 10),
>   	}, {
>   		.name = "pingpong_3", .id = PINGPONG_3,
>   		.base = 0x71800, .len = 0xd4,
> -		.features = PINGPONG_SM8150_MASK,
>   		.sblk = &sdm845_pp_sblk,
>   		.merge_3d = MERGE_3D_1,
>   		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 11),
>   	}, {
>   		.name = "pingpong_4", .id = PINGPONG_4,
>   		.base = 0x72000, .len = 0xd4,
> -		.features = PINGPONG_SM8150_MASK,
>   		.sblk = &sdm845_pp_sblk,
>   		.merge_3d = MERGE_3D_2,
>   		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 30),
>   	}, {
>   		.name = "pingpong_5", .id = PINGPONG_5,
>   		.base = 0x72800, .len = 0xd4,
> -		.features = PINGPONG_SM8150_MASK,
>   		.sblk = &sdm845_pp_sblk,
>   		.merge_3d = MERGE_3D_2,
>   		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 31),
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
> index 05c0f81b263c4a9aab8adbfa487f6cd20ce94079..135b4f8171360493e58a1945105f8722d513d720 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
> @@ -111,14 +111,12 @@ static const struct dpu_pingpong_cfg sc7180_pp[] = {
>   	{
>   		.name = "pingpong_0", .id = PINGPONG_0,
>   		.base = 0x70000, .len = 0xd4,
> -		.features = PINGPONG_SM8150_MASK,
>   		.sblk = &sdm845_pp_sblk,
>   		.merge_3d = 0,
>   		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
>   	}, {
>   		.name = "pingpong_1", .id = PINGPONG_1,
>   		.base = 0x70800, .len = 0xd4,
> -		.features = PINGPONG_SM8150_MASK,
>   		.sblk = &sdm845_pp_sblk,
>   		.merge_3d = 0,
>   		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 9),
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h
> index b729a01e8ff8443721bf993726ae9ebe21e89440..1189a5ecb3b7b50430eb275280c2309ee9d90b63 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h
> @@ -76,7 +76,6 @@ static const struct dpu_pingpong_cfg sm6115_pp[] = {
>   	{
>   		.name = "pingpong_0", .id = PINGPONG_0,
>   		.base = 0x70000, .len = 0xd4,
> -		.features = PINGPONG_SM8150_MASK,
>   		.sblk = &sdm845_pp_sblk,
>   		.merge_3d = 0,
>   		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h
> index 25f56c55f373ef5e57082448bc1a1d1d17968b06..13ff6bdcc517fd566e7701f7a7cefe5ff19c5421 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h
> @@ -119,14 +119,12 @@ static struct dpu_pingpong_cfg sm6350_pp[] = {
>   	{
>   		.name = "pingpong_0", .id = PINGPONG_0,
>   		.base = 0x70000, .len = 0xd4,
> -		.features = PINGPONG_SM8150_MASK,
>   		.sblk = &sdm845_pp_sblk,
>   		.merge_3d = 0,
>   		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
>   	}, {
>   		.name = "pingpong_1", .id = PINGPONG_1,
>   		.base = 0x70800, .len = 0xd4,
> -		.features = PINGPONG_SM8150_MASK,
>   		.sblk = &sdm845_pp_sblk,
>   		.merge_3d = 0,
>   		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 9),
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h
> index 20b12a68fb9dfe0291486ca827c6ca25a1711014..d4c2d2da91aac0bce46c4d65079f01484a769ae3 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h
> @@ -76,7 +76,6 @@ static const struct dpu_pingpong_cfg qcm2290_pp[] = {
>   	{
>   		.name = "pingpong_0", .id = PINGPONG_0,
>   		.base = 0x70000, .len = 0xd4,
> -		.features = PINGPONG_SM8150_MASK,
>   		.sblk = &sdm845_pp_sblk,
>   		.merge_3d = 0,
>   		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h
> index 6935ff7da3162dd7b86f3786b0f604d113e51649..9135853a0225fa60acb80d17f627153d25c612e6 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h
> @@ -78,7 +78,6 @@ static const struct dpu_pingpong_cfg sm6375_pp[] = {
>   	{
>   		.name = "pingpong_0", .id = PINGPONG_0,
>   		.base = 0x70000, .len = 0xd4,
> -		.features = PINGPONG_SM8150_MASK,
>   		.sblk = &sdm845_pp_sblk,
>   		.merge_3d = 0,
>   		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
> index b6b1a4383efa72fc0bc8a6feac1c3adb7773ba42..6503f11f65c11806c5b9558a0f9fd05b228340be 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
> @@ -205,42 +205,36 @@ static const struct dpu_pingpong_cfg sm8350_pp[] = {
>   	{
>   		.name = "pingpong_0", .id = PINGPONG_0,
>   		.base = 0x69000, .len = 0,
> -		.features = BIT(DPU_PINGPONG_DITHER),
>   		.sblk = &sc7280_pp_sblk,
>   		.merge_3d = MERGE_3D_0,
>   		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
>   	}, {
>   		.name = "pingpong_1", .id = PINGPONG_1,
>   		.base = 0x6a000, .len = 0,
> -		.features = BIT(DPU_PINGPONG_DITHER),
>   		.sblk = &sc7280_pp_sblk,
>   		.merge_3d = MERGE_3D_0,
>   		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 9),
>   	}, {
>   		.name = "pingpong_2", .id = PINGPONG_2,
>   		.base = 0x6b000, .len = 0,
> -		.features = BIT(DPU_PINGPONG_DITHER),
>   		.sblk = &sc7280_pp_sblk,
>   		.merge_3d = MERGE_3D_1,
>   		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 10),
>   	}, {
>   		.name = "pingpong_3", .id = PINGPONG_3,
>   		.base = 0x6c000, .len = 0,
> -		.features = BIT(DPU_PINGPONG_DITHER),
>   		.sblk = &sc7280_pp_sblk,
>   		.merge_3d = MERGE_3D_1,
>   		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 11),
>   	}, {
>   		.name = "pingpong_4", .id = PINGPONG_4,
>   		.base = 0x6d000, .len = 0,
> -		.features = BIT(DPU_PINGPONG_DITHER),
>   		.sblk = &sc7280_pp_sblk,
>   		.merge_3d = MERGE_3D_2,
>   		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 30),
>   	}, {
>   		.name = "pingpong_5", .id = PINGPONG_5,
>   		.base = 0x6e000, .len = 0,
> -		.features = BIT(DPU_PINGPONG_DITHER),
>   		.sblk = &sc7280_pp_sblk,
>   		.merge_3d = MERGE_3D_2,
>   		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 31),
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
> index d1dd895acbf666ceab39f9c38ae11bda100b5953..202de6f9b0c65c6f2caa9e9d5232f5b92d8bdf01 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
> @@ -121,28 +121,24 @@ static const struct dpu_pingpong_cfg sc7280_pp[] = {
>   	{
>   		.name = "pingpong_0", .id = PINGPONG_0,
>   		.base = 0x69000, .len = 0,
> -		.features = BIT(DPU_PINGPONG_DITHER),
>   		.sblk = &sc7280_pp_sblk,
>   		.merge_3d = 0,
>   		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
>   	}, {
>   		.name = "pingpong_1", .id = PINGPONG_1,
>   		.base = 0x6a000, .len = 0,
> -		.features = BIT(DPU_PINGPONG_DITHER),
>   		.sblk = &sc7280_pp_sblk,
>   		.merge_3d = 0,
>   		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 9),
>   	}, {
>   		.name = "pingpong_2", .id = PINGPONG_2,
>   		.base = 0x6b000, .len = 0,
> -		.features = BIT(DPU_PINGPONG_DITHER),
>   		.sblk = &sc7280_pp_sblk,
>   		.merge_3d = 0,
>   		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 10),
>   	}, {
>   		.name = "pingpong_3", .id = PINGPONG_3,
>   		.base = 0x6c000, .len = 0,
> -		.features = BIT(DPU_PINGPONG_DITHER),
>   		.sblk = &sc7280_pp_sblk,
>   		.merge_3d = 0,
>   		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 11),
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
> index 481d36b80c4eddda53d2f9963392d9499f966792..785ca2b2e60f073b0a2db0c0c4ed3b2722de033c 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
> @@ -205,42 +205,36 @@ static const struct dpu_pingpong_cfg sc8280xp_pp[] = {
>   	{
>   		.name = "pingpong_0", .id = PINGPONG_0,
>   		.base = 0x69000, .len = 0,
> -		.features = BIT(DPU_PINGPONG_DITHER),
>   		.sblk = &sc7280_pp_sblk,
>   		.merge_3d = MERGE_3D_0,
>   		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
>   	}, {
>   		.name = "pingpong_1", .id = PINGPONG_1,
>   		.base = 0x6a000, .len = 0,
> -		.features = BIT(DPU_PINGPONG_DITHER),
>   		.sblk = &sc7280_pp_sblk,
>   		.merge_3d = MERGE_3D_0,
>   		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 9),
>   	}, {
>   		.name = "pingpong_2", .id = PINGPONG_2,
>   		.base = 0x6b000, .len = 0,
> -		.features = BIT(DPU_PINGPONG_DITHER),
>   		.sblk = &sc7280_pp_sblk,
>   		.merge_3d = MERGE_3D_1,
>   		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 10),
>   	}, {
>   		.name = "pingpong_3", .id = PINGPONG_3,
>   		.base = 0x6c000, .len = 0,
> -		.features = BIT(DPU_PINGPONG_DITHER),
>   		.sblk = &sc7280_pp_sblk,
>   		.merge_3d = MERGE_3D_1,
>   		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 11),
>   	}, {
>   		.name = "pingpong_4", .id = PINGPONG_4,
>   		.base = 0x6d000, .len = 0,
> -		.features = BIT(DPU_PINGPONG_DITHER),
>   		.sblk = &sc7280_pp_sblk,
>   		.merge_3d = MERGE_3D_2,
>   		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 30),
>   	}, {
>   		.name = "pingpong_5", .id = PINGPONG_5,
>   		.base = 0x6e000, .len = 0,
> -		.features = BIT(DPU_PINGPONG_DITHER),
>   		.sblk = &sc7280_pp_sblk,
>   		.merge_3d = MERGE_3D_2,
>   		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 31),
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
> index 32649f25fdcbc1fe45d7028352dfd4c0daa11d84..1401a84e0da5754fd2a3661d1421bb9b998271ca 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
> @@ -206,55 +206,47 @@ static const struct dpu_pingpong_cfg sm8450_pp[] = {
>   	{
>   		.name = "pingpong_0", .id = PINGPONG_0,
>   		.base = 0x69000, .len = 0,
> -		.features = BIT(DPU_PINGPONG_DITHER),
>   		.sblk = &sc7280_pp_sblk,
>   		.merge_3d = MERGE_3D_0,
>   		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
>   	}, {
>   		.name = "pingpong_1", .id = PINGPONG_1,
>   		.base = 0x6a000, .len = 0,
> -		.features = BIT(DPU_PINGPONG_DITHER),
>   		.sblk = &sc7280_pp_sblk,
>   		.merge_3d = MERGE_3D_0,
>   		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 9),
>   	}, {
>   		.name = "pingpong_2", .id = PINGPONG_2,
>   		.base = 0x6b000, .len = 0,
> -		.features = BIT(DPU_PINGPONG_DITHER),
>   		.sblk = &sc7280_pp_sblk,
>   		.merge_3d = MERGE_3D_1,
>   		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 10),
>   	}, {
>   		.name = "pingpong_3", .id = PINGPONG_3,
>   		.base = 0x6c000, .len = 0,
> -		.features = BIT(DPU_PINGPONG_DITHER),
>   		.sblk = &sc7280_pp_sblk,
>   		.merge_3d = MERGE_3D_1,
>   		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 11),
>   	}, {
>   		.name = "pingpong_4", .id = PINGPONG_4,
>   		.base = 0x6d000, .len = 0,
> -		.features = BIT(DPU_PINGPONG_DITHER),
>   		.sblk = &sc7280_pp_sblk,
>   		.merge_3d = MERGE_3D_2,
>   		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 30),
>   	}, {
>   		.name = "pingpong_5", .id = PINGPONG_5,
>   		.base = 0x6e000, .len = 0,
> -		.features = BIT(DPU_PINGPONG_DITHER),
>   		.sblk = &sc7280_pp_sblk,
>   		.merge_3d = MERGE_3D_2,
>   		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 31),
>   	}, {
>   		.name = "pingpong_cwb_0", .id = PINGPONG_CWB_0,
>   		.base = 0x65800, .len = 0,
> -		.features = BIT(DPU_PINGPONG_DITHER),
>   		.sblk = &sc7280_pp_sblk,
>   		.merge_3d = MERGE_3D_3,
>   	}, {
>   		.name = "pingpong_cwb_1", .id = PINGPONG_CWB_1,
>   		.base = 0x65c00, .len = 0,
> -		.features = BIT(DPU_PINGPONG_DITHER),
>   		.sblk = &sc7280_pp_sblk,
>   		.merge_3d = MERGE_3D_3,
>   	},
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h
> index 4679b7e47d50e21d5b6df69fd0479b804ac69979..fbbdce36f0ad99d0b1d32d90627ff5b7f3fc2fc9 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h
> @@ -205,55 +205,47 @@ static const struct dpu_pingpong_cfg sa8775p_pp[] = {
>   	{
>   		.name = "pingpong_0", .id = PINGPONG_0,
>   		.base = 0x69000, .len = 0,
> -		.features = BIT(DPU_PINGPONG_DITHER),
>   		.sblk = &sc7280_pp_sblk,
>   		.merge_3d = MERGE_3D_0,
>   		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
>   	}, {
>   		.name = "pingpong_1", .id = PINGPONG_1,
>   		.base = 0x6a000, .len = 0,
> -		.features = BIT(DPU_PINGPONG_DITHER),
>   		.sblk = &sc7280_pp_sblk,
>   		.merge_3d = MERGE_3D_0,
>   		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 9),
>   	}, {
>   		.name = "pingpong_2", .id = PINGPONG_2,
>   		.base = 0x6b000, .len = 0,
> -		.features = BIT(DPU_PINGPONG_DITHER),
>   		.sblk = &sc7280_pp_sblk,
>   		.merge_3d = MERGE_3D_1,
>   		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 10),
>   	}, {
>   		.name = "pingpong_3", .id = PINGPONG_3,
>   		.base = 0x6c000, .len = 0,
> -		.features = BIT(DPU_PINGPONG_DITHER),
>   		.sblk = &sc7280_pp_sblk,
>   		.merge_3d = MERGE_3D_1,
>   		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 11),
>   	}, {
>   		.name = "pingpong_4", .id = PINGPONG_4,
>   		.base = 0x6d000, .len = 0,
> -		.features = BIT(DPU_PINGPONG_DITHER),
>   		.sblk = &sc7280_pp_sblk,
>   		.merge_3d = MERGE_3D_2,
>   		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 30),
>   	}, {
>   		.name = "pingpong_5", .id = PINGPONG_5,
>   		.base = 0x6e000, .len = 0,
> -		.features = BIT(DPU_PINGPONG_DITHER),
>   		.sblk = &sc7280_pp_sblk,
>   		.merge_3d = MERGE_3D_2,
>   		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 31),
>   	}, {
>   		.name = "pingpong_6", .id = PINGPONG_CWB_0,
>   		.base = 0x65800, .len = 0,
> -		.features = BIT(DPU_PINGPONG_DITHER),
>   		.sblk = &sc7280_pp_sblk,
>   		.merge_3d = MERGE_3D_3,
>   	}, {
>   		.name = "pingpong_7", .id = PINGPONG_CWB_1,
>   		.base = 0x65c00, .len = 0,
> -		.features = BIT(DPU_PINGPONG_DITHER),
>   		.sblk = &sc7280_pp_sblk,
>   		.merge_3d = MERGE_3D_3,
>   	},
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
> index def7c161d787d9cecd219b4db0482158d3e5bc12..cc4413432cfdc636e38a56011d39f18d7e94c23a 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
> @@ -202,55 +202,47 @@ static const struct dpu_pingpong_cfg sm8550_pp[] = {
>   	{
>   		.name = "pingpong_0", .id = PINGPONG_0,
>   		.base = 0x69000, .len = 0,
> -		.features = BIT(DPU_PINGPONG_DITHER),
>   		.sblk = &sc7280_pp_sblk,
>   		.merge_3d = MERGE_3D_0,
>   		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
>   	}, {
>   		.name = "pingpong_1", .id = PINGPONG_1,
>   		.base = 0x6a000, .len = 0,
> -		.features = BIT(DPU_PINGPONG_DITHER),
>   		.sblk = &sc7280_pp_sblk,
>   		.merge_3d = MERGE_3D_0,
>   		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 9),
>   	}, {
>   		.name = "pingpong_2", .id = PINGPONG_2,
>   		.base = 0x6b000, .len = 0,
> -		.features = BIT(DPU_PINGPONG_DITHER),
>   		.sblk = &sc7280_pp_sblk,
>   		.merge_3d = MERGE_3D_1,
>   		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 10),
>   	}, {
>   		.name = "pingpong_3", .id = PINGPONG_3,
>   		.base = 0x6c000, .len = 0,
> -		.features = BIT(DPU_PINGPONG_DITHER),
>   		.sblk = &sc7280_pp_sblk,
>   		.merge_3d = MERGE_3D_1,
>   		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 11),
>   	}, {
>   		.name = "pingpong_4", .id = PINGPONG_4,
>   		.base = 0x6d000, .len = 0,
> -		.features = BIT(DPU_PINGPONG_DITHER),
>   		.sblk = &sc7280_pp_sblk,
>   		.merge_3d = MERGE_3D_2,
>   		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 30),
>   	}, {
>   		.name = "pingpong_5", .id = PINGPONG_5,
>   		.base = 0x6e000, .len = 0,
> -		.features = BIT(DPU_PINGPONG_DITHER),
>   		.sblk = &sc7280_pp_sblk,
>   		.merge_3d = MERGE_3D_2,
>   		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 31),
>   	}, {
>   		.name = "pingpong_cwb_0", .id = PINGPONG_CWB_0,
>   		.base = 0x66000, .len = 0,
> -		.features = BIT(DPU_PINGPONG_DITHER),
>   		.sblk = &sc7280_pp_sblk,
>   		.merge_3d = MERGE_3D_3,
>   	}, {
>   		.name = "pingpong_cwb_1", .id = PINGPONG_CWB_1,
>   		.base = 0x66400, .len = 0,
> -		.features = BIT(DPU_PINGPONG_DITHER),
>   		.sblk = &sc7280_pp_sblk,
>   		.merge_3d = MERGE_3D_3,
>   	},
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_1_sar2130p.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_1_sar2130p.h
> index 979a674517d8b270309a4ce92534face0f2ba855..32f88533154584dc98a515b1ddef27ab2005fecd 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_1_sar2130p.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_1_sar2130p.h
> @@ -202,55 +202,47 @@ static const struct dpu_pingpong_cfg sar2130p_pp[] = {
>   	{
>   		.name = "pingpong_0", .id = PINGPONG_0,
>   		.base = 0x69000, .len = 0,
> -		.features = BIT(DPU_PINGPONG_DITHER),
>   		.sblk = &sc7280_pp_sblk,
>   		.merge_3d = MERGE_3D_0,
>   		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
>   	}, {
>   		.name = "pingpong_1", .id = PINGPONG_1,
>   		.base = 0x6a000, .len = 0,
> -		.features = BIT(DPU_PINGPONG_DITHER),
>   		.sblk = &sc7280_pp_sblk,
>   		.merge_3d = MERGE_3D_0,
>   		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 9),
>   	}, {
>   		.name = "pingpong_2", .id = PINGPONG_2,
>   		.base = 0x6b000, .len = 0,
> -		.features = BIT(DPU_PINGPONG_DITHER),
>   		.sblk = &sc7280_pp_sblk,
>   		.merge_3d = MERGE_3D_1,
>   		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 10),
>   	}, {
>   		.name = "pingpong_3", .id = PINGPONG_3,
>   		.base = 0x6c000, .len = 0,
> -		.features = BIT(DPU_PINGPONG_DITHER),
>   		.sblk = &sc7280_pp_sblk,
>   		.merge_3d = MERGE_3D_1,
>   		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 11),
>   	}, {
>   		.name = "pingpong_4", .id = PINGPONG_4,
>   		.base = 0x6d000, .len = 0,
> -		.features = BIT(DPU_PINGPONG_DITHER),
>   		.sblk = &sc7280_pp_sblk,
>   		.merge_3d = MERGE_3D_2,
>   		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 30),
>   	}, {
>   		.name = "pingpong_5", .id = PINGPONG_5,
>   		.base = 0x6e000, .len = 0,
> -		.features = BIT(DPU_PINGPONG_DITHER),
>   		.sblk = &sc7280_pp_sblk,
>   		.merge_3d = MERGE_3D_2,
>   		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 31),
>   	}, {
>   		.name = "pingpong_cwb_0", .id = PINGPONG_CWB_0,
>   		.base = 0x66000, .len = 0,
> -		.features = BIT(DPU_PINGPONG_DITHER),
>   		.sblk = &sc7280_pp_sblk,
>   		.merge_3d = MERGE_3D_3,
>   	}, {
>   		.name = "pingpong_cwb_1", .id = PINGPONG_CWB_1,
>   		.base = 0x66400, .len = 0,
> -		.features = BIT(DPU_PINGPONG_DITHER),
>   		.sblk = &sc7280_pp_sblk,
>   		.merge_3d = MERGE_3D_3,
>   	},
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h
> index ffee0740ddb5c13dbbd2ca0d70855cba27f73ca6..e053324d76a2e5020e6a7477ddadc9f7d94fe57e 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h
> @@ -202,55 +202,47 @@ static const struct dpu_pingpong_cfg x1e80100_pp[] = {
>   	{
>   		.name = "pingpong_0", .id = PINGPONG_0,
>   		.base = 0x69000, .len = 0,
> -		.features = BIT(DPU_PINGPONG_DITHER),
>   		.sblk = &sc7280_pp_sblk,
>   		.merge_3d = MERGE_3D_0,
>   		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
>   	}, {
>   		.name = "pingpong_1", .id = PINGPONG_1,
>   		.base = 0x6a000, .len = 0,
> -		.features = BIT(DPU_PINGPONG_DITHER),
>   		.sblk = &sc7280_pp_sblk,
>   		.merge_3d = MERGE_3D_0,
>   		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 9),
>   	}, {
>   		.name = "pingpong_2", .id = PINGPONG_2,
>   		.base = 0x6b000, .len = 0,
> -		.features = BIT(DPU_PINGPONG_DITHER),
>   		.sblk = &sc7280_pp_sblk,
>   		.merge_3d = MERGE_3D_1,
>   		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 10),
>   	}, {
>   		.name = "pingpong_3", .id = PINGPONG_3,
>   		.base = 0x6c000, .len = 0,
> -		.features = BIT(DPU_PINGPONG_DITHER),
>   		.sblk = &sc7280_pp_sblk,
>   		.merge_3d = MERGE_3D_1,
>   		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 11),
>   	}, {
>   		.name = "pingpong_4", .id = PINGPONG_4,
>   		.base = 0x6d000, .len = 0,
> -		.features = BIT(DPU_PINGPONG_DITHER),
>   		.sblk = &sc7280_pp_sblk,
>   		.merge_3d = MERGE_3D_2,
>   		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 30),
>   	}, {
>   		.name = "pingpong_5", .id = PINGPONG_5,
>   		.base = 0x6e000, .len = 0,
> -		.features = BIT(DPU_PINGPONG_DITHER),
>   		.sblk = &sc7280_pp_sblk,
>   		.merge_3d = MERGE_3D_2,
>   		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 31),
>   	}, {
>   		.name = "pingpong_cwb_0", .id = PINGPONG_CWB_0,
>   		.base = 0x66000, .len = 0,
> -		.features = BIT(DPU_PINGPONG_DITHER),
>   		.sblk = &sc7280_pp_sblk,
>   		.merge_3d = MERGE_3D_3,
>   	}, {
>   		.name = "pingpong_cwb_1", .id = PINGPONG_CWB_1,
>   		.base = 0x66400, .len = 0,
> -		.features = BIT(DPU_PINGPONG_DITHER),
>   		.sblk = &sc7280_pp_sblk,
>   		.merge_3d = MERGE_3D_3,
>   	},
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> index 75b679cd2bd27dd25971489a2d3a6f516b248235..4777a4a852da0d65e20cebc31fd05647e0b4c4b2 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> @@ -95,12 +95,6 @@
>   #define MIXER_QCM2290_MASK \
>   	(BIT(DPU_DIM_LAYER) | BIT(DPU_MIXER_COMBINED_ALPHA))
>   
> -#define PINGPONG_SDM845_MASK \
> -	(BIT(DPU_PINGPONG_DITHER))
> -
> -#define PINGPONG_SM8150_MASK \
> -	(BIT(DPU_PINGPONG_DITHER))
> -
>   #define WB_SDM845_MASK (BIT(DPU_WB_LINE_MODE) | \
>   			 BIT(DPU_WB_UBWC) | \
>   			 BIT(DPU_WB_YUV_CONFIG) | \
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> index ac63f753b43615f7c34d2da51fce919fd77142bf..d48c26a7cb6b69961cebc19576e3f7fc3b8dd2c5 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> @@ -117,13 +117,11 @@ enum {
>    * PINGPONG sub-blocks
>    * @DPU_PINGPONG_SPLIT      PP block supports split fifo
>    * @DPU_PINGPONG_SLAVE      PP block is a suitable slave for split fifo
> - * @DPU_PINGPONG_DITHER     Dither blocks
>    * @DPU_PINGPONG_MAX
>    */
>   enum {
>   	DPU_PINGPONG_SPLIT = 0x1,
>   	DPU_PINGPONG_SLAVE,
> -	DPU_PINGPONG_DITHER,
>   	DPU_PINGPONG_MAX
>   };
>   
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c
> index 49e03ecee9e8b567a3f809b977deb83731006ac0..138071be56496da9fdcaff902f68ebb09a212e2e 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c
> @@ -325,7 +325,7 @@ struct dpu_hw_pingpong *dpu_hw_pingpong_init(struct drm_device *dev,
>   		c->ops.disable_dsc = dpu_hw_pp_dsc_disable;
>   	}
>   
> -	if (test_bit(DPU_PINGPONG_DITHER, &cfg->features))
> +	if (mdss_rev->core_major_ver >= 3)
>   		c->ops.setup_dither = dpu_hw_pp_setup_dither;
>   
>   	return c;
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

