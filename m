Return-Path: <linux-arm-msm+bounces-58629-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 34143ABD0FD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 May 2025 09:54:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CADCD164889
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 May 2025 07:54:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1586F258CD9;
	Tue, 20 May 2025 07:54:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="v5552+JC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F09D825DB0A
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 May 2025 07:54:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747727646; cv=none; b=t7R/LGRLXhVKjFGSviRMCRrtIwPevBLNR8+c2uMKUlJqN2fDCrSGZMT073RhpPf3pCoUDUfNIWxE3J2ve1oRHgolIpeWZA6aDBQ4HBg5jj1B3HoSy/Aa+dMha97+SukC8rWJ4tHTY1uBoJ8MWXV1MEuLywGCAJJmEYsqbOuGyIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747727646; c=relaxed/simple;
	bh=w4lXjlcDwaFEsxfT4UsvKVeBztHC5fHX+wTJTfgNYqU=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=VNaON+SJ6f+4Y6lWdpkUFvVGfms5a6dXSYOolSUw6/wTq6xs65P79dxyJ+ZXYHcZaeoDznHN2F3tloXsSQFY7uGHjd3TvhoU5xYd+hCn/wxWukycIWxuWJm9hwvr4zZ6OhZ8w8HKmB//8PXpVKrgnyRYpmzg2i1xj1Ag463zgkE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=v5552+JC; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-441d437cfaaso31906455e9.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 May 2025 00:54:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747727642; x=1748332442; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iwxXhJDiipz/57dudIGfdbcWOZE/F3Ufyh9hAR1d1X4=;
        b=v5552+JC/vn5XgiZfNPro/kFSeOGeuDx81hOx9P8Pu0BtPcNaajyI2/AYqyUzLOKuk
         f+1jym0V9koAbX3lBWUPAGVUrwCXU8Rf8Ufc1BbM2IK0Zn5+tloan9vMIwGptFqTAikx
         2PuH4LBAU++K9he5EljbQUHryUfufk9TFCj23as1IkV1fpweVlb5APyOkHN9IGPqwNW0
         B45EJ4QMK68Xxzps/xiPAbTgWy37YtGkF3P7h0231PmY9S7dM7KreWLC5BWDdR3LKSYF
         XLwpjYGjtACUBtIGLtjjGeDxVUId7uGXu28jbsJLLb+0Js+WW79Gbu8jkkQ3+0ytvXVU
         HkEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747727642; x=1748332442;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=iwxXhJDiipz/57dudIGfdbcWOZE/F3Ufyh9hAR1d1X4=;
        b=FG5hT2aYe8rcHHtHXQWGudMPDG0Bxzqa9Ni8hY36ZTJYb/Ges4t1rSwII94e7+HDdz
         QmDrbI8p1gr5G13wltliHynycPyAz7+WsCD+GI6XfNIQ0EpXIKZRd6j9fsXwpFrY1wGP
         brkcNvrFsgMs83ZWHeWC51Ic8uktNq7SkfCf1I+0ygSRLuvmgHiUw0e6ybm8XT0kf4Lt
         bhqvmMBZo/QdAU2hIU9It8Xs6Hz2gGnmM2Ru9WYPFhpAU0aL02PVqQnwfdIww6dZsIws
         ZLKtW0htcMVjAcRYD9GL26Qnw2eb9mrRmZgTI+Equ0558Z60eZdi8G4rybvS3Kz7NVrS
         mN6g==
X-Gm-Message-State: AOJu0YwGrIU/Wcpk9DvJz9/1KSWrojaHAhn6j2np1fn/9T1A1dijPwrc
	YRDYFLNgiNKzNfV/kXmO9PaHNCR0ZyAUoI2iTAMxRI3gqEZ+p3FbdRzAy+shuFSTfDI=
X-Gm-Gg: ASbGncspiVn1E4ELsuEnzsXf39BlklaYpTNEJajN9GqqdcBX32E95jkuaCBV6aNCRel
	ItY9/OfLKzUn30B9v37gO2vpzxdb5dkIOn73UhubNENYsiv+mIwBlQ5LChpanMcgrbGQI7U2csA
	+9gjIjppqOGVUEEkjo0ykunIcsY1U/IWCKssIAgRAbxAHy0SY/HWPqLMNS1xjjumSuuHQFChmpV
	dwbCtVIPDsRFU9OxRkbkAMO7t7Tim70KkZbGhWFHI9oOe3fn9TY5epq8NvE9Uf9QnaFfkeW7A0H
	p5N5luzGpxzFi351+6LchU4dfOarjf915pDvDauLgcoWjofy3oXD2X372rgf8VmqPf0yHtLerzk
	fd8u0RbNyQyKA0npYfJYZZJ3SO+oB
X-Google-Smtp-Source: AGHT+IHChTSQJWbolNv/DcCddwZO2Jlvl4QPMM9JW8HH7kkMA3qIuYI8odpu3mJa0ymgEqyC2nap8A==
X-Received: by 2002:a05:600c:3acb:b0:440:9b1a:cd78 with SMTP id 5b1f17b1804b1-442fefee292mr145813695e9.10.1747727642169;
        Tue, 20 May 2025 00:54:02 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:fb2e:6266:4e39:ce68? ([2a01:e0a:3d9:2080:fb2e:6266:4e39:ce68])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-447f1ef0b20sm20801145e9.14.2025.05.20.00.54.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 May 2025 00:54:01 -0700 (PDT)
Message-ID: <33f10e0b-bc7b-42d2-a3d8-67c18bab3c59@linaro.org>
Date: Tue, 20 May 2025 09:54:01 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v4 19/30] drm/msm/dpu: get rid of DPU_MDP_PERIPH_0_REMOVED
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Vinod Koul <vkoul@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <20250519-dpu-drop-features-v4-0-6c5e88e31383@oss.qualcomm.com>
 <20250519-dpu-drop-features-v4-19-6c5e88e31383@oss.qualcomm.com>
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
In-Reply-To: <20250519-dpu-drop-features-v4-19-6c5e88e31383@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 19/05/2025 18:04, Dmitry Baryshkov wrote:
> From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 
> Continue migration to the MDSS-revision based checks and replace
> DPU_MDP_PERIPH_0_REMOVED feature bit with the core_major_ver >= 8 check.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h  | 1 -
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h | 1 -
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h   | 1 -
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h  | 1 -
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h   | 1 -
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_1_sar2130p.h | 1 -
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h | 1 -
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h           | 3 ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c               | 2 +-
>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c                  | 2 +-
>   10 files changed, 2 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h
> index 37c88b393c12d8a04395b6e5dffb67211d2db9cd..ae66c338250664f9306a7d431cfa18ca07a916a5 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h
> @@ -21,7 +21,6 @@ static const struct dpu_caps sm8650_dpu_caps = {
>   static const struct dpu_mdp_cfg sm8650_mdp = {
>   	.name = "top_0",
>   	.base = 0, .len = 0x494,
> -	.features = BIT(DPU_MDP_PERIPH_0_REMOVED),
>   	.clk_ctrls = {
>   		[DPU_CLK_CTRL_REG_DMA] = { .reg_off = 0x2bc, .bit_off = 20 },
>   	},
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
> index 785ca2b2e60f073b0a2db0c0c4ed3b2722de033c..85778071bc1347008dbe4522aeb9ca4fd21aa097 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
> @@ -21,7 +21,6 @@ static const struct dpu_caps sc8280xp_dpu_caps = {
>   static const struct dpu_mdp_cfg sc8280xp_mdp = {
>   	.name = "top_0",
>   	.base = 0x0, .len = 0x494,
> -	.features = BIT(DPU_MDP_PERIPH_0_REMOVED),
>   	.clk_ctrls = {
>   		[DPU_CLK_CTRL_VIG0] = { .reg_off = 0x2ac, .bit_off = 0 },
>   		[DPU_CLK_CTRL_VIG1] = { .reg_off = 0x2b4, .bit_off = 0 },
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
> index 1401a84e0da5754fd2a3661d1421bb9b998271ca..f9676f804f9132296467bc751e11036696afa942 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
> @@ -21,7 +21,6 @@ static const struct dpu_caps sm8450_dpu_caps = {
>   static const struct dpu_mdp_cfg sm8450_mdp = {
>   	.name = "top_0",
>   	.base = 0x0, .len = 0x494,
> -	.features = BIT(DPU_MDP_PERIPH_0_REMOVED),
>   	.clk_ctrls = {
>   		[DPU_CLK_CTRL_VIG0] = { .reg_off = 0x2ac, .bit_off = 0 },
>   		[DPU_CLK_CTRL_VIG1] = { .reg_off = 0x2b4, .bit_off = 0 },
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h
> index fbbdce36f0ad99d0b1d32d90627ff5b7f3fc2fc9..7462cfc4cf8de4a10326c83d3341dbee76e437e8 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h
> @@ -20,7 +20,6 @@ static const struct dpu_caps sa8775p_dpu_caps = {
>   static const struct dpu_mdp_cfg sa8775p_mdp = {
>   	.name = "top_0",
>   	.base = 0x0, .len = 0x494,
> -	.features = BIT(DPU_MDP_PERIPH_0_REMOVED),
>   	.clk_ctrls = {
>   		[DPU_CLK_CTRL_VIG0] = { .reg_off = 0x2ac, .bit_off = 0 },
>   		[DPU_CLK_CTRL_VIG1] = { .reg_off = 0x2b4, .bit_off = 0 },
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
> index cc4413432cfdc636e38a56011d39f18d7e94c23a..695ae7581a88b36fa1f28aa3cd0c9166090e940c 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
> @@ -21,7 +21,6 @@ static const struct dpu_caps sm8550_dpu_caps = {
>   static const struct dpu_mdp_cfg sm8550_mdp = {
>   	.name = "top_0",
>   	.base = 0, .len = 0x494,
> -	.features = BIT(DPU_MDP_PERIPH_0_REMOVED),
>   	.clk_ctrls = {
>   		[DPU_CLK_CTRL_REG_DMA] = { .reg_off = 0x2bc, .bit_off = 20 },
>   	},
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_1_sar2130p.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_1_sar2130p.h
> index 32f88533154584dc98a515b1ddef27ab2005fecd..9a25113df5aec527baa514aaa61f2b47c2443d27 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_1_sar2130p.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_1_sar2130p.h
> @@ -21,7 +21,6 @@ static const struct dpu_caps sar2130p_dpu_caps = {
>   static const struct dpu_mdp_cfg sar2130p_mdp = {
>   	.name = "top_0",
>   	.base = 0, .len = 0x494,
> -	.features = BIT(DPU_MDP_PERIPH_0_REMOVED),
>   	.clk_ctrls = {
>   		[DPU_CLK_CTRL_REG_DMA] = { .reg_off = 0x2bc, .bit_off = 20 },
>   	},
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h
> index e053324d76a2e5020e6a7477ddadc9f7d94fe57e..54815c613f087454aa7b4befc84462265d8dfc23 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h
> @@ -20,7 +20,6 @@ static const struct dpu_caps x1e80100_dpu_caps = {
>   static const struct dpu_mdp_cfg x1e80100_mdp = {
>   	.name = "top_0",
>   	.base = 0, .len = 0x494,
> -	.features = BIT(DPU_MDP_PERIPH_0_REMOVED),
>   	.clk_ctrls = {
>   		[DPU_CLK_CTRL_REG_DMA] = { .reg_off = 0x2bc, .bit_off = 20 },
>   	},
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> index 92dfbb5e7f916bf32afeffdb6b843f1da3f3fd44..d3a7f46488a21e81a24a9af5071a9a7f5f48cdac 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> @@ -32,8 +32,6 @@
>    * MDP TOP BLOCK features
>    * @DPU_MDP_PANIC_PER_PIPE Panic configuration needs to be done per pipe
>    * @DPU_MDP_10BIT_SUPPORT, Chipset supports 10 bit pixel formats
> - * @DPU_MDP_PERIPH_0_REMOVED Indicates that access to periph top0 block results
> - *			   in a failure
>    * @DPU_MDP_MAX            Maximum value
>   
>    */
> @@ -41,7 +39,6 @@ enum {
>   	DPU_MDP_PANIC_PER_PIPE = 0x1,
>   	DPU_MDP_10BIT_SUPPORT,
>   	DPU_MDP_AUDIO_SELECT,
> -	DPU_MDP_PERIPH_0_REMOVED,
>   	DPU_MDP_MAX
>   };
>   
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c
> index cebe7ce7b258fc178a687770906f7c4c20aa0d4c..c49a67da86b0d46d12c32466981be7f00519974c 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c
> @@ -272,7 +272,7 @@ static void _setup_mdp_ops(struct dpu_hw_mdp_ops *ops,
>   
>   	if (mdss_rev->core_major_ver < 5)
>   		ops->setup_vsync_source = dpu_hw_setup_vsync_sel;
> -	else if (!(cap & BIT(DPU_MDP_PERIPH_0_REMOVED)))
> +	else if (mdss_rev->core_major_ver < 8)
>   		ops->setup_vsync_source = dpu_hw_setup_wd_timer;
>   
>   	ops->get_safe_status = dpu_hw_get_safe_status;
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> index 1fd82b6747e9058ce11dc2620729921492d5ebdd..80ffd46cbfe69fc90afcdc1a144fc5de7bb6af42 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> @@ -1022,7 +1022,7 @@ static void dpu_kms_mdp_snapshot(struct msm_disp_state *disp_state, struct msm_k
>   				dpu_kms->mmio + cat->wb[i].base, "%s",
>   				cat->wb[i].name);
>   
> -	if (cat->mdp[0].features & BIT(DPU_MDP_PERIPH_0_REMOVED)) {
> +	if (dpu_kms->catalog->mdss_ver->core_major_ver >= 8) {
>   		msm_disp_snapshot_add_block(disp_state, MDP_PERIPH_TOP0,
>   				dpu_kms->mmio + cat->mdp[0].base, "top");
>   		msm_disp_snapshot_add_block(disp_state, cat->mdp[0].len - MDP_PERIPH_TOP0_END,
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

