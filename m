Return-Path: <linux-arm-msm+bounces-60824-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 48368AD3AC9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Jun 2025 16:12:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 87D2417A48E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Jun 2025 14:12:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9DBC2BDC24;
	Tue, 10 Jun 2025 14:10:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VsEYR77C"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC1A9292933
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Jun 2025 14:10:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749564610; cv=none; b=qB7zFXs0a96HI5PRkHeBbW8c9rcVPcfdORUR/AHLjI21DK12suMuDtyCB7oo6hJ78qCxV9GFgD+dH4tpZAJ6GQNzn05gfWMPS7TYeWCMyZ6nYs5yTuPouVBrt9ZG2PXCdapF0n2Ej1rN9AHtE5OkaWQwFPkXHQQODvwzkCO476w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749564610; c=relaxed/simple;
	bh=PZXZV7FSHjLrW/Xjz4hHaW1Kus7p5ylj0H8R79ZSXO8=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=cYsH2chtpXOD1bQZ8pObGAut3vf9oWVCNnVEvkpPoGqxekm9vQsjXru5QVlcWUzNIBSda5hoAsesL5pKMfNZoJs5I4CSN90pvZuSE7FGS+I8Tc2AGmBMc0i1MFfB3zbUuSyslDIPm1erYOi1rEcQSypf0+v3XQGMWGrpY1d0JVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VsEYR77C; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-43edecbfb94so66110385e9.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Jun 2025 07:10:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749564607; x=1750169407; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z4OxVv8oJv1GqLYHYzTXE75rIdx5RHpc0k5r0cFg+Cw=;
        b=VsEYR77Ck0TXnQEbP3tA1sFGImnHWzecqqlLr95YVslQ99hDOwRgyYplpG7kBDScle
         WDaUqf6iyW7g7xNg1ASrU3q2s7xw7vgAEy3oYNxxPPu4dUIYVjQGlFJwh1rpDTzx0Jt9
         4elTtB4/LJuSmFQCkWBPrt4O2BdAiRh4cwCmi4e9Ab4rooEDlKTsS1RgnlPi+kquib5o
         I5J5wjKXx9FgKQYQVemUD3yJdLgrLwjnoY9GzuO6A3DDons5kaVq6i39w11Lc2WKntM0
         ArEqhssOh0ZS1ua3EkRgMyCkthNxn+ztokG7nqCCTG49QdOL5Qi2urONCQNlwBhFq94V
         asWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749564607; x=1750169407;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=z4OxVv8oJv1GqLYHYzTXE75rIdx5RHpc0k5r0cFg+Cw=;
        b=RTsbLM0ngmuT6FOegsvUUGPT4UKTc/KvhUPBAaIFk8HdlnXVBL0iFPPRqfL6QKNwpD
         iHRX15hyRumd7vU6gTMPjxoPksNrSHuI0t2EQ3yrWZY6MhIgeSdFCWpPVLkq/nNPdfK+
         /uZkDj6NOv8ZONVSFqtEX4cW8fKD8wJMQEgH68oPKoj5D0+4LBZ2UUE7f1JpF1xPL9ZZ
         tQX5gOqeweEUiNUugHGSYL+Rrs9Ry+Z/vwE8LK5OIZjhQFs4rYzoJdyFforI3XXBPsil
         Ff8wDMn4nTHW2/KNhGL32FsfIvgP76VMR9vS3BhqEU6C84IB6oRQq+fmXCU03V9ijjG8
         zeKA==
X-Gm-Message-State: AOJu0YxV4A3F02uVdRrfVqN3q9I2QTX3sko6Fwns6Q28wLr0ntf3Iv0Q
	32vdlnMuwjVUhj8JunuQLQHY5L2qRJ26d8SwIAi20TJqG60Y2ykxi+hd2QAchDuykwM=
X-Gm-Gg: ASbGncuvDAhIdQkU4L5nipM4uKgD/zcy+mXV8cVg/G8FQSAxVh+Wmmp30q7UMJgFlJ7
	oXxtFX1NFS3K4hTR5nDqycK9vWCaUrX/0v2TpjmRu0Y61/QfJB+7CE2JJJ0fzBXdOQbDf8MqqrI
	vszMi+ZCiIGpPKgqOCBCBPtZtcmp9/SD3tiUV40gnQyctbwsBISUzbv1di7hIKkIxAMYWpn0lh9
	wwH0PLCEp8Bj85pipEn2QCs+CAXC8tMgBRqGgmJU3xOWUrr29JnpZXKhEIVB670VYYK04XGfXas
	zrO6mSIo25NkZWy9LU1p3IYBVm3Re0ZKvuiBK0Sleqc7+WSlHIRKBWoYt22jlKEl2HCtP5vx5zX
	1ULkQzMjksLPZEUCv1VpSn4FOxmywg3CWJauz
X-Google-Smtp-Source: AGHT+IEkqCEXSbEGN2qKWC1bgGuh0Dpru4IMLoe0WkTjzMUjiyMf9422e97D4rL4Jdk8panjohDk+w==
X-Received: by 2002:a05:600c:4ecf:b0:450:d61f:dd45 with SMTP id 5b1f17b1804b1-4520134088bmr172213265e9.4.1749564607020;
        Tue, 10 Jun 2025 07:10:07 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:f0b:a9b6:d508:9d14? ([2a01:e0a:3d9:2080:f0b:a9b6:d508:9d14])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a5323b3992sm12497663f8f.35.2025.06.10.07.10.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Jun 2025 07:10:06 -0700 (PDT)
Message-ID: <eb9bd4e4-3032-4f36-94e7-b89ff74bf327@linaro.org>
Date: Tue, 10 Jun 2025 16:10:05 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v6 13/17] drm/msm/dpu: Consistently use u32 instead of
 uint32_t
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 Jonathan Marek <jonathan@marek.ca>, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Clark <robin.clark@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 Abel Vesa <abel.vesa@linaro.org>, Srinivas Kandagatla <srini@kernel.org>
References: <20250610-b4-sm8750-display-v6-0-ee633e3ddbff@linaro.org>
 <20250610-b4-sm8750-display-v6-13-ee633e3ddbff@linaro.org>
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
In-Reply-To: <20250610-b4-sm8750-display-v6-13-ee633e3ddbff@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/06/2025 16:05, Krzysztof Kozlowski wrote:
> Linux coding style asks to use kernel types like u32 instead of uint32_t
> and code already has it in other places, so unify the remaining pieces.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
> 
> Changes in v6:
> 1. New patch
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 9 ++++-----
>   1 file changed, 4 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> index a4b0fe0d9899b32141928f0b6a16503a49b3c27a..92f6c39eee3dc090bd957239e58793e5b0437548 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> @@ -323,8 +323,8 @@ static void _dpu_crtc_setup_blend_cfg(struct dpu_crtc_mixer *mixer,
>   		struct dpu_plane_state *pstate, const struct msm_format *format)
>   {
>   	struct dpu_hw_mixer *lm = mixer->hw_lm;
> -	uint32_t blend_op;
> -	uint32_t fg_alpha, bg_alpha;
> +	u32 blend_op;
> +	u32 fg_alpha, bg_alpha;
>   
>   	fg_alpha = pstate->base.alpha >> 8;
>   	bg_alpha = 0xff - fg_alpha;
> @@ -402,7 +402,7 @@ static void _dpu_crtc_blend_setup_pipe(struct drm_crtc *crtc,
>   				       struct dpu_hw_stage_cfg *stage_cfg
>   				      )
>   {
> -	uint32_t lm_idx;
> +	u32 lm_idx;
>   	enum dpu_sspp sspp_idx;
>   	struct drm_plane_state *state;
>   
> @@ -442,8 +442,7 @@ static void _dpu_crtc_blend_setup_mixer(struct drm_crtc *crtc,
>   	struct dpu_plane_state *pstate = NULL;
>   	const struct msm_format *format;
>   	struct dpu_hw_ctl *ctl = mixer->lm_ctl;
> -
> -	uint32_t lm_idx;
> +	u32 lm_idx;
>   	bool bg_alpha_enable = false;
>   	DECLARE_BITMAP(active_fetch, SSPP_MAX);
>   
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

