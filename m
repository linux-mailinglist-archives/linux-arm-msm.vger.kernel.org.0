Return-Path: <linux-arm-msm+bounces-79128-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 558C9C1395A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Oct 2025 09:43:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EF9874673A6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Oct 2025 08:43:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADF7F2D6E4A;
	Tue, 28 Oct 2025 08:43:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="D4w28jer"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67F382D9498
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Oct 2025 08:43:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761640983; cv=none; b=ThehsyCFSAEU/WtYdS6UrMDZKmLgnay8CWI3JFcc5epME1v6tlyEL/4B6xZJ3Ko2Z+D2acm+VUwH/+hZXY5Yz1PADU0blJougnoeT0NJjjFuD8lA27dBfV4VkgQM9i9miR6uLmUpWelng/UqFwFgJQx11pOf3899UfHBFRm6nXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761640983; c=relaxed/simple;
	bh=sPMLj2+gzqONVmj0i86jMJ1BYUAdNqaKTE73qOT8SY0=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=h4fmOPLR9Jk9HRNwFxGln65eT+YIuFnR3riZh4o5wKJu7X4KiV+XbMshw65CIGxkqe748mtXXndqxxadTmGLlBf0nmxeSCJfGb9faSOxUdJOK2EN8KVg0COJUeorYxPpISh6lZooMMjIZ1uHTpL5DE2tUpa4OsDqAjg85W73Irw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=D4w28jer; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3ee64bc6b85so5802184f8f.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Oct 2025 01:43:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761640980; x=1762245780; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6NXCKjRFgrYiAfp2xjDLu8YxTLQNZXtyNLdLhXM4zbE=;
        b=D4w28jer3xggzjI4CaE78EWQWoWxAXPDQONfFG2V+xsTDxzFAbdAOwsBPFYSWyVajE
         6PPSiJa9xyr5g2ANpKn+NEDQ7dzHvCUDw90rrvGMWhNg81qdhbE9Id7aQ3sMrDPJ3+8/
         7FAYtKavQU0k+KVv2PQs4ZDBVAQvhaYgc7+XpBKivhunwail0eSYXL7s7MePCGejqQOJ
         RxUM8v7Op6QaiFccqHZBJD6eEbWF03f4MLy4c/YucKoeJ9iU91ywHux/rA0Cm01tJzn3
         8rAQkLzk0jUtb5z/6lvoRhOAO/0wtlRR7tLCBv2Qc50ZPEknMWMoQN0eapC7rETQs8EC
         DrTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761640980; x=1762245780;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=6NXCKjRFgrYiAfp2xjDLu8YxTLQNZXtyNLdLhXM4zbE=;
        b=D6agc8UPXDyFAiz4DiCHirdm+7e3hrVsh5pSAKIpD/LhnB1WU98J7D6kJF28HMguwD
         +KZo3nyXrWD+5tJg1KJIvXVrrvhcncPIIaLHwjEC1lddchawo7+FodKVtabW8d32oSLK
         uL5YBApRmiFbXAEdZR9YOQEWMLt1FYBbIX7boecP1WcMRDi1HqQ38zIL1QpzLOf779rW
         XW0uPpFT+QpcR1FG1g9bJuKUweE8S6U8/c6xfqNF9t30KTv1GKk49d2ALMIlMXjJvTAw
         8rJQBKpI4IbRnch7pIRZTRNN+U+fc6yCN4ELiGt8cPO9yx2pSPgfPSOnOan+1SwwmiJc
         0eAg==
X-Forwarded-Encrypted: i=1; AJvYcCVQsqg3MTfT9Aqrp4uspSsZw/qPxwvu2kkcn+cAKNwaMtPuAFfSdAvc9afp9Mdmv+A9Wt0uZYbGK7tL3cEt@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5xzq7DVFHpopUetEhzOG7qbIk+yYBkPp9/SYuoalbTjPD15H+
	No6UjpYpz8fpovtTZLKOvI34aLhBEP2yvvuc57QZr28/Vr+9ofBowg6TP0MUJqrSkZE=
X-Gm-Gg: ASbGncvVTHhHjeej+n+WFCGupJ6aXszzsrmzrgpnH9wEaa5zdRjL9gUihnk5nFH43n3
	AURCdShMGHJXGEbpwGOMmGHllSvn64awfj09g5UwDFido3A30vN3nwl49wjEMauFMzZ9wuDwN2m
	5sFxkGfG3KRO1QzYKX9MBVqhwXyMMFG9bKdSeKmfy5DpPcESmoIUGQcUnbhdyTmOc7xxMVknqQO
	EIq8mcF/OnUEi7moERyzsUdZWqzdJZ+tKlO+XNk6MYdsYPEF7Ogd7W12U2zfKbyOgz0yJwPNoTC
	G1mTBdLtMuEV5Ow9d/BxPzn/197izVYLx2liPlpuoLesn+oIWobMwU6FicjGWUfaSUMIF0Vjvxt
	qRX2C6h/+VBdpahVIKNKwZjXo9Ziq6Z1jxTNFOCHB5ajkNW+BKZRkiPkAyAanVNyHsVSpUk5daw
	2jkkKLxfyjFGmtrNOyou8Dp50QwGqF6ptzTaIlGO2kJcVLzH6HJQ==
X-Google-Smtp-Source: AGHT+IGO/CrRm+czlEY/95+Qqx9U6VFPdwHdnit4aNOq5qYQYeiVQ3qkFspoLXuMWyUgnNASWVZ6rg==
X-Received: by 2002:a05:6000:1861:b0:427:928:787f with SMTP id ffacd0b85a97d-429a7e4ee59mr1933860f8f.21.1761640979509;
        Tue, 28 Oct 2025 01:42:59 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:cad:2140:ebe6:df10:d28d:aa5? ([2a01:e0a:cad:2140:ebe6:df10:d28d:aa5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429952e2e06sm19118388f8f.46.2025.10.28.01.42.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Oct 2025 01:42:59 -0700 (PDT)
Message-ID: <6381550a-4c1a-429d-b6c1-8c7ae77bf325@linaro.org>
Date: Tue, 28 Oct 2025 09:42:57 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2] drm/msm/dpu: Filter modes based on adjusted mode clock
To: Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Rob Clark <robdclark@gmail.com>, Dmitry Baryshkov <lumag@kernel.org>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20250506-filter-modes-v2-1-c20a0b7aa241@oss.qualcomm.com>
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
In-Reply-To: <20250506-filter-modes-v2-1-c20a0b7aa241@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/7/25 03:38, Jessica Zhang wrote:
> Filter out modes that have a clock rate greater than the max core clock
> rate when adjusted for the perf clock factor
> 
> This is especially important for chipsets such as QCS615 that have lower
> limits for the MDP max core clock.
> 
> Since the core CRTC clock is at least the mode clock (adjusted for the
> perf clock factor) [1], the modes supported by the driver should be less
> than the max core clock rate.
> 
> [1] https://elixir.bootlin.com/linux/v6.12.4/source/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c#L83
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
> ---
> Changes in v2:
> - *crtc_clock -> *mode_clock (Dmitry)
> - Changed adjusted_mode_clk check to use multiplication (Dmitry)
> - Switch from quic_* email to OSS email
> - Link to v1: https://lore.kernel.org/lkml/20241212-filter-mode-clock-v1-1-f4441988d6aa@quicinc.com/
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c | 35 ++++++++++++++++++---------
>   drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h |  3 +++
>   drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c      | 12 +++++++++
>   3 files changed, 39 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
> index 0fb5789c60d0..13cc658065c5 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
> @@ -31,6 +31,26 @@ enum dpu_perf_mode {
>   	DPU_PERF_MODE_MAX
>   };
>   
> +/**
> + * dpu_core_perf_adjusted_mode_clk - Adjust given mode clock rate according to
> + *   the perf clock factor.
> + * @crtc_clk_rate - Unadjusted mode clock rate
> + * @perf_cfg: performance configuration
> + */
> +u64 dpu_core_perf_adjusted_mode_clk(u64 mode_clk_rate,
> +				    const struct dpu_perf_cfg *perf_cfg)
> +{
> +	u32 clk_factor;
> +
> +	clk_factor = perf_cfg->clk_inefficiency_factor;
> +	if (clk_factor) {
> +		mode_clk_rate *= clk_factor;
> +		do_div(mode_clk_rate, 100);
> +	}
> +
> +	return mode_clk_rate;
> +}
> +
>   /**
>    * _dpu_core_perf_calc_bw() - to calculate BW per crtc
>    * @perf_cfg: performance configuration
> @@ -75,28 +95,21 @@ static u64 _dpu_core_perf_calc_clk(const struct dpu_perf_cfg *perf_cfg,
>   	struct drm_plane *plane;
>   	struct dpu_plane_state *pstate;
>   	struct drm_display_mode *mode;
> -	u64 crtc_clk;
> -	u32 clk_factor;
> +	u64 mode_clk;
>   
>   	mode = &state->adjusted_mode;
>   
> -	crtc_clk = (u64)mode->vtotal * mode->hdisplay * drm_mode_vrefresh(mode);
> +	mode_clk = (u64)mode->vtotal * mode->hdisplay * drm_mode_vrefresh(mode);
>   
>   	drm_atomic_crtc_for_each_plane(plane, crtc) {
>   		pstate = to_dpu_plane_state(plane->state);
>   		if (!pstate)
>   			continue;
>   
> -		crtc_clk = max(pstate->plane_clk, crtc_clk);
> -	}
> -
> -	clk_factor = perf_cfg->clk_inefficiency_factor;
> -	if (clk_factor) {
> -		crtc_clk *= clk_factor;
> -		do_div(crtc_clk, 100);
> +		mode_clk = max(pstate->plane_clk, mode_clk);
>   	}
>   
> -	return crtc_clk;
> +	return dpu_core_perf_adjusted_mode_clk(mode_clk, perf_cfg);
>   }
>   
>   static struct dpu_kms *_dpu_crtc_get_kms(struct drm_crtc *crtc)
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h
> index d2f21d34e501..3740bc97422c 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h
> @@ -54,6 +54,9 @@ struct dpu_core_perf {
>   	u32 fix_core_ab_vote;
>   };
>   
> +u64 dpu_core_perf_adjusted_mode_clk(u64 clk_rate,
> +				    const struct dpu_perf_cfg *perf_cfg);
> +
>   int dpu_core_perf_crtc_check(struct drm_crtc *crtc,
>   		struct drm_crtc_state *state);
>   
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> index 0714936d8835..5e3c34fed63b 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> @@ -1501,6 +1501,7 @@ static enum drm_mode_status dpu_crtc_mode_valid(struct drm_crtc *crtc,
>   						const struct drm_display_mode *mode)
>   {
>   	struct dpu_kms *dpu_kms = _dpu_crtc_get_kms(crtc);
> +	u64 adjusted_mode_clk;
>   
>   	/* if there is no 3d_mux block we cannot merge LMs so we cannot
>   	 * split the large layer into 2 LMs, filter out such modes
> @@ -1508,6 +1509,17 @@ static enum drm_mode_status dpu_crtc_mode_valid(struct drm_crtc *crtc,
>   	if (!dpu_kms->catalog->caps->has_3d_merge &&
>   	    mode->hdisplay > dpu_kms->catalog->caps->max_mixer_width)
>   		return MODE_BAD_HVALUE;
> +
> +	adjusted_mode_clk = dpu_core_perf_adjusted_mode_clk(mode->clock,
> +							    dpu_kms->perf.perf_cfg);
> +
> +	/*
> +	 * The given mode, adjusted for the perf clock factor, should not exceed
> +	 * the max core clock rate
> +	 */
> +	if (dpu_kms->perf.max_core_clk_rate < adjusted_mode_clk * 1000)
> +		return MODE_CLOCK_HIGH;

This test doesn't take in account if the mode is for a bonded DSI mode, which
is the same mode on 2 interfaces doubled, but it's valid since we could literally
set both modes separately. In bonded DSI this mode_clk must be again divided bv 2
in addition to the fix:
https://lore.kernel.org/linux-arm-msm/20250923-modeclk-fix-v2-1-01fcd0b2465a@oss.qualcomm.com/

I'm trying to find a correct way to handle that, I have tried that:
===========================><========================================
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index 48c3aef1cfc2..6aa5db1996e3 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -1684,8 +1684,10 @@ static int dpu_crtc_atomic_check(struct drm_crtc *crtc,
  static enum drm_mode_status dpu_crtc_mode_valid(struct drm_crtc *crtc,
  						const struct drm_display_mode *mode)
  {
+	struct drm_encoder *encoder = get_encoder_from_crtc(crtc);
  	struct dpu_kms *dpu_kms = _dpu_crtc_get_kms(crtc);
  	u64 adjusted_mode_clk;
+	unsigned int intfs;

  	/* if there is no 3d_mux block we cannot merge LMs so we cannot
  	 * split the large layer into 2 LMs, filter out such modes
@@ -1700,12 +1702,18 @@ static enum drm_mode_status dpu_crtc_mode_valid(struct drm_crtc *crtc,
  	if (dpu_kms->catalog->caps->has_3d_merge)
  		adjusted_mode_clk /= 2;

+	intfs = dpu_encoder_get_intf_count(encoder);
+	if (intfs)
+		adjusted_mode_clk /= intfs;
+
  	/*
  	 * The given mode, adjusted for the perf clock factor, should not exceed
  	 * the max core clock rate
  	 */
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 3dd202e0ce94..862239b7d4bc 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -2892,6 +2892,23 @@ enum dpu_intf_mode dpu_encoder_get_intf_mode(struct drm_encoder *encoder)
  	return INTF_MODE_NONE;
  }

+/**
+ * dpu_encoder_get_intf_count - get interface count of the given encoder
+ * @encoder: Pointer to drm encoder object
+ */
+unsigned int dpu_encoder_get_intf_count(struct drm_encoder *encoder)
+{
+	struct dpu_encoder_virt *dpu_enc = NULL;
+
+	if (!encoder) {
+		DPU_ERROR("invalid encoder\n");
+		return 0;
+	}
+	dpu_enc = to_dpu_encoder_virt(encoder);
+
+	return dpu_enc->num_phys_encs;
+}
+
  /**
   * dpu_encoder_helper_get_cwb_mask - get CWB blocks mask for the DPU encoder
   * @phys_enc: Pointer to physical encoder structure
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
index ca1ca2e51d7e..f10ad297b379 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
@@ -58,6 +58,8 @@ int dpu_encoder_wait_for_tx_complete(struct drm_encoder *drm_encoder);

  enum dpu_intf_mode dpu_encoder_get_intf_mode(struct drm_encoder *encoder);

+unsigned int dpu_encoder_get_intf_count(struct drm_encoder *encoder);
+
  void dpu_encoder_virt_runtime_resume(struct drm_encoder *encoder);

  uint32_t dpu_encoder_get_clones(struct drm_encoder *drm_enc);
====================================><========================================

But this doesn't work since the crtc hasn't been associated to the encoder yet....

Neil

> +
>   	/*
>   	 * max crtc width is equal to the max mixer width * 2 and max height is 4K
>   	 */
> 
> ---
> base-commit: db76003ade5953d4a83c2bdc6e15c2d1c33e7350
> change-id: 20250506-filter-modes-c60b4332769f
> 
> Best regards,


