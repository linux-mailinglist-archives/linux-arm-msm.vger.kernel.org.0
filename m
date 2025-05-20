Return-Path: <linux-arm-msm+bounces-58628-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B3DCABD0F9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 May 2025 09:53:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9ADD13B7F26
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 May 2025 07:53:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DABAE25B1C5;
	Tue, 20 May 2025 07:53:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jI+DSvAs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7F882116E0
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 May 2025 07:53:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747727627; cv=none; b=VPd3ImdZlQpQXA7Q9FCKzfXJ4bOEmLf1JYgpVMKN6pcqAwPaFg0Q+HC+A5SQ8z0cQ8dcaCi0wDbpIIOzo7o++HAGIcZIg87qbm8GbtXRY1eRu4bcykgxAfqz4/nwRP419szfBFB5FH6UNR33lzkZlkE2ghZKgceGsjPUwqScIuE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747727627; c=relaxed/simple;
	bh=nD/vfymEUXW+/yiJ1iIB1bemGEf1cCUCjaPsbj2Lkx0=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=oSAvs32EEmTPxFm75D4BcMxD60Xt7skiOFOlp0SzJfTj2d2M2JK0E2IBO39/NItwNBNwS6YsuHh3K7uT5mWRSR0q1U2UwMLOD5wtfMjWD48lqAZPWFgRFLhQRNnfaoUkZjPQSRX5B3YXeCtX6XdLimZ48cD/Z+8EfPBumqTW/kM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jI+DSvAs; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3a3771c0f8cso714700f8f.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 May 2025 00:53:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747727624; x=1748332424; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pqIA/ECFbgjRZMqQH31Wh+NeKgfBysFqVWpEKA5YoBA=;
        b=jI+DSvAs0HWffSIuxNA0DdAnnFBuI9hW8rZ+KCWNLUBs+NZbzZvIZ0ioM4CiVJ6WAX
         PfXyRLIKbEabVHxxJ3LDUpTkN43S8ARuaYskPr0kXphk3p8DCpSfanP7+BL9ZeovLuin
         Sje/xiju5gXqTrSjOc65jEqKGER/vR2DgdpK22MMc2lIndRixy8r6z4UhPBbF8PDKjPY
         OBx1SHEuODibeN0uLtC0KaY053VKBJthlJIT+m7T+1spQ3t0rs6kDgWVOJ3ZJTi8bcaM
         Eg4jwF0sxkb/CzZLm9G7D5+rTcXhc7tg+HNGTML0ZVue+iNDtVc3vpFhbcbGKnKAIvwR
         Lgbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747727624; x=1748332424;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=pqIA/ECFbgjRZMqQH31Wh+NeKgfBysFqVWpEKA5YoBA=;
        b=rjN4PR0ab8fKG+3D+rFGiUvLMCKJfGDqHbytTKcVui86W0d1Mzj/It0/k/35PT5IIv
         lMxjJbzvkrs7Qgf7aL/jnrHzH0YVn7vlMxK+/H3VojimAfUQ7ipwi8KBxfdwi1CD8aZX
         C0fn+tRXFS5nMz1e/5/RzvbM/kqs9NRqXQkDiBAdHpjajOPGeQFbu1+hYbEKcNfiauhw
         c12xIZFEi9eE29EAVuY6WTzyL6Hxf83qp7C5VhOcC2XNpBYYMY/0MTgoBecKOBf/Dd47
         npIqw3qba8zP6nTm1LiwP9rBFQSGNYninAZEkf2kkcZV3rqKOJq7kPjfI3SEfqzkJD+S
         xwYA==
X-Gm-Message-State: AOJu0YzKN1PCsQ89SW6sYuBUj2zoIZv4ICIAs9nnRYhNDFE0eU+PLi/m
	w2Zcl9Va+H1HuB/GRb9i4x5UwCy1EZe6Zl2KWWO7W9xuCyjQpCm0MwDQI/BwF7VXHPU=
X-Gm-Gg: ASbGncuRmZOUKuk2DX2ANbR+pqOiUJlvmyUeXKzk6WHKztoxUzn/5nJhXpeRmy1eaHs
	kdUM6HYVWxkA0b760RJO8+oWncQiZS3dotGdJtdfHv18vbh/CJJzbkyU3/2GntAxbVS9GmMW9dH
	yIF/AI0DcUUjdOgGkFjF1HI0Qc5WGfnX5TIbR/2Gfv4z8gPiW75BdGgWvC8zwWURadK2P179bkA
	wN7kPvCJ4GFI4CI5CTYREQYOq09VN4XvjEHSoJSPN92G1SAk185vAgCqD+YtC7omtHFf8ZxlL7S
	UXwxP/bmVfE7NsUr+MFWe47tYONYdEWfWZFE2tIJML9AxWK3vhCtep8ZF5+h+J/zCRRyNshq9GT
	N8Fhh1FdoFpUzbN7EIqP/8lpBhWnj
X-Google-Smtp-Source: AGHT+IEI12u+0JzU8Dw2TE1yYstJIWJV0XyjXtSQP5XMbSxjpixoaVXb0TBg8cX4ao3XbPRrbWp9BA==
X-Received: by 2002:a05:6000:178a:b0:3a3:79cb:8aec with SMTP id ffacd0b85a97d-3a379cb8cd7mr1160622f8f.58.1747727624072;
        Tue, 20 May 2025 00:53:44 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:fb2e:6266:4e39:ce68? ([2a01:e0a:3d9:2080:fb2e:6266:4e39:ce68])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-447f1ef035csm20152255e9.11.2025.05.20.00.53.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 May 2025 00:53:43 -0700 (PDT)
Message-ID: <ab430c92-ac4f-47a9-9808-ebf5c77f5a86@linaro.org>
Date: Tue, 20 May 2025 09:53:42 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v4 20/30] drm/msm/dpu: get rid of DPU_MDP_AUDIO_SELECT
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Vinod Koul <vkoul@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <20250519-dpu-drop-features-v4-0-6c5e88e31383@oss.qualcomm.com>
 <20250519-dpu-drop-features-v4-20-6c5e88e31383@oss.qualcomm.com>
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
In-Reply-To: <20250519-dpu-drop-features-v4-20-6c5e88e31383@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 19/05/2025 18:04, Dmitry Baryshkov wrote:
> From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 
> Continue migration to the MDSS-revision based checks and replace
> DPU_MDP_AUDIO_SELECT feature bit with the core_major_ver == 8 ||
> core_major_ver == 5 check.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h  | 1 -
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_1_sdm670.h  | 1 -
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h  | 1 -
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h | 1 -
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h  | 1 -
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h          | 1 -
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c              | 3 ++-
>   7 files changed, 2 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
> index 3e66feb3e18dcc1d9ed5403a42989d97f84a8edc..72a7257b4d7ba5bfe89ec76bac19550e023a2b50 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
> @@ -23,7 +23,6 @@ static const struct dpu_caps sdm845_dpu_caps = {
>   static const struct dpu_mdp_cfg sdm845_mdp = {
>   	.name = "top_0",
>   	.base = 0x0, .len = 0x45c,
> -	.features = BIT(DPU_MDP_AUDIO_SELECT),
>   	.clk_ctrls = {
>   		[DPU_CLK_CTRL_VIG0] = { .reg_off = 0x2ac, .bit_off = 0 },
>   		[DPU_CLK_CTRL_VIG1] = { .reg_off = 0x2b4, .bit_off = 0 },
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_1_sdm670.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_1_sdm670.h
> index 3a60432a758a942eb1541f143018bd466b2bdf20..ce169a610e195cbb6f0fee1362bcaaf05df777cb 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_1_sdm670.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_1_sdm670.h
> @@ -11,7 +11,6 @@
>   static const struct dpu_mdp_cfg sdm670_mdp = {
>   	.name = "top_0",
>   	.base = 0x0, .len = 0x45c,
> -	.features = BIT(DPU_MDP_AUDIO_SELECT),
>   	.clk_ctrls = {
>   		[DPU_CLK_CTRL_VIG0] = { .reg_off = 0x2ac, .bit_off = 0 },
>   		[DPU_CLK_CTRL_VIG1] = { .reg_off = 0x2b4, .bit_off = 0 },
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
> index e07c2cc4188bb12e2253068ca8666ce9364c69c1..23a3a458dd5c260399a42e5f4d4361b3c4e82c4f 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
> @@ -23,7 +23,6 @@ static const struct dpu_caps sm8150_dpu_caps = {
>   static const struct dpu_mdp_cfg sm8150_mdp = {
>   	.name = "top_0",
>   	.base = 0x0, .len = 0x45c,
> -	.features = BIT(DPU_MDP_AUDIO_SELECT),
>   	.clk_ctrls = {
>   		[DPU_CLK_CTRL_VIG0] = { .reg_off = 0x2ac, .bit_off = 0 },
>   		[DPU_CLK_CTRL_VIG1] = { .reg_off = 0x2b4, .bit_off = 0 },
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
> index b350dba28caed77e542d6a41ceac191a93e165a7..75f8f69123a4a6afe8234a9de21ce68b23c11605 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
> @@ -23,7 +23,6 @@ static const struct dpu_caps sc8180x_dpu_caps = {
>   static const struct dpu_mdp_cfg sc8180x_mdp = {
>   	.name = "top_0",
>   	.base = 0x0, .len = 0x45c,
> -	.features = BIT(DPU_MDP_AUDIO_SELECT),
>   	.clk_ctrls = {
>   		[DPU_CLK_CTRL_VIG0] = { .reg_off = 0x2ac, .bit_off = 0 },
>   		[DPU_CLK_CTRL_VIG1] = { .reg_off = 0x2b4, .bit_off = 0 },
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h
> index 27c71a8a1f31921e5e1f4b6b15e0efc25fb63537..6b895eca2fac53505f7a1d857d30bb8a5d23d4c8 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h
> @@ -23,7 +23,6 @@ static const struct dpu_caps sm7150_dpu_caps = {
>   static const struct dpu_mdp_cfg sm7150_mdp = {
>   	.name = "top_0",
>   	.base = 0x0, .len = 0x45c,
> -	.features = BIT(DPU_MDP_AUDIO_SELECT),
>   	.clk_ctrls = {
>   		[DPU_CLK_CTRL_VIG0] = { .reg_off = 0x2ac, .bit_off = 0 },
>   		[DPU_CLK_CTRL_VIG1] = { .reg_off = 0x2b4, .bit_off = 0 },
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> index d3a7f46488a21e81a24a9af5071a9a7f5f48cdac..9ba9e273f81ab1966db1865b4ce28f8c18f750b8 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> @@ -38,7 +38,6 @@
>   enum {
>   	DPU_MDP_PANIC_PER_PIPE = 0x1,
>   	DPU_MDP_10BIT_SUPPORT,
> -	DPU_MDP_AUDIO_SELECT,
>   	DPU_MDP_MAX
>   };
>   
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c
> index c49a67da86b0d46d12c32466981be7f00519974c..5c811f0142d5e2a012d7e9b3a918818f22ec11cf 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c
> @@ -280,7 +280,8 @@ static void _setup_mdp_ops(struct dpu_hw_mdp_ops *ops,
>   	if (mdss_rev->core_major_ver >= 5)
>   		ops->dp_phy_intf_sel = dpu_hw_dp_phy_intf_sel;
>   
> -	if (cap & BIT(DPU_MDP_AUDIO_SELECT))
> +	if (mdss_rev->core_major_ver == 4 ||
> +	    mdss_rev->core_major_ver == 5)

Commit message says: core_major_ver == 8 || core_major_ver == 5

Which one is right ?

Neil

>   		ops->intf_audio_select = dpu_hw_intf_audio_select;
>   }
>   
> 


