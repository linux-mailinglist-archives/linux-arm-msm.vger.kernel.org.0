Return-Path: <linux-arm-msm+bounces-41875-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 247DF9F0185
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Dec 2024 02:05:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C49FF281CCF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Dec 2024 01:05:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A433A184;
	Fri, 13 Dec 2024 01:05:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tyLYcYYB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7916840855
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Dec 2024 01:05:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734051932; cv=none; b=lO/KjSuUqDlOEh7FXoY2tJdYXMt9dC6cEyTTIjFhk5306B5P+uyQxQjfL5ilfgNO7W8i8pAadBJxK0wwOF9t5JIFFKvcggrDfIJETW8EdWigbsl+ed+7Avksb1L8RUsvdWy7fhTRW7+Rgh6kQLsIjW3UzcBge5l4wPEAfxFGt5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734051932; c=relaxed/simple;
	bh=ScM5/9Ay7Vkz7tAjQ2Z6vwqow41NuqfSG2EgI0jzjJk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y13j49tnGfNftGIFmOlUP02CP8KSeFPGOE+fZm857of8oj3bsgeYIeMIMMHHL6H0vsZq6k6CVcb1RYdvIyrBqUTUXsXxg9av3T21kMyH/yLIQeBCuIgvEK7W4bnRVVUFNn4P1/OJ0bjl7B4QgZoMFqVuC/44fhOoX5DGPEatPkk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tyLYcYYB; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2ffd6b7d77aso13199281fa.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Dec 2024 17:05:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734051929; x=1734656729; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=O84U3RWKov9iL5zvKm0AQk1apvgpcPjBJGZeGo9vHKY=;
        b=tyLYcYYByBoQVedEovDK1nso3msSmxwLouKdJYKZYjrTQ9f+hzYOylKq8lZqL+mvuU
         y4zrtuKe2btGcephY8f0/Y+iC8CqQl7opTGHbi6xBFcp33UvRBGRa6gaM01O54IGc4NT
         pmBhkR4sPNxtZVo1ZGz3QsF0q76ILSj9xg9ezeOCgD3V2juclCOzNRF3St7Pp9k34rH5
         BlbF/nvx2ohEjChP/ROMcx0Jk/I75IORvai12C4fDf3rzPPVTygnvTSyngqSq2EeVszJ
         lG9ZXiFmx3lwRcjKu+5lEb5hrhZPd0qUcL/H+KcvK39PeI4b7/OVbZ+qsoqBezYbZjRy
         GIMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734051929; x=1734656729;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O84U3RWKov9iL5zvKm0AQk1apvgpcPjBJGZeGo9vHKY=;
        b=XYBnI8HccuhVTOAfAO8zX5QG9GoIarZ9DA3tgiCLAA87s+fMxsxAsHFLoIn0cx2DYc
         QeUgKpTIQHsmmTKpdFN3lxAEDJEG0rgrRJo8yoCRaPi8q+TFn2hN/pUaIiCi6Wy2vbik
         DKlN7LMeDqPTvj+AvL8djbQh0bdfQ98+AQ87TB5/Gbfa1ABa8wnEfvsem+VRo+DVJu7l
         fuIIECqYNFjr7D01zmDTr33eop/U0erNBK+bagkbhlXqrWruuATYsTiEhBqGVah77hVH
         VFNeIGE6833BIg2N80woTH3nKgOy2fV/9tVuS3+RmBpA8YMz/PKYPrXG5xnYDc335B+I
         RRkw==
X-Forwarded-Encrypted: i=1; AJvYcCU8oTpuMfbnBgxaO/XKfJNVa448+ocgHrWl8bZd3qMGPU389fhCAMFX5Uga3HEol0CCwVknvmSPr16mXn5t@vger.kernel.org
X-Gm-Message-State: AOJu0Ywjc9PqZKlnwvGc5LXdsNeOC+qXbjT3JHLPrMieSuBeb3zMO4fD
	5B+6//qPKKk9KZQFY3pke2BsLkL3UpeyXtQvA6xGc3Xi3lMXjR7gr2bx83wR9jE=
X-Gm-Gg: ASbGnctldQMJUeJRQ2dYcspSQPDvLx6iLQxuhxOKpUc0zq+GQGPqRACvx3+fBetQAsi
	r9DC7f6IyoBBjIwefxSgrIzS2RqGf1wJe7xD3KDbRfbVzgrzyjgqvz7fs4QwT2i0DFOgnMZfcCZ
	HUZcnQLdUf9LxWvBboxhWxEr828gLPWqMgKQ8p67AHad+5106p4LD0qaCzhWTTqN3UlbK9LfMvR
	8DjMOxcGlYhXUwPZKxJdqebqK1Xn/MBirlbHE0ClTYrKVF+RXtMhMUrq0nl7Vym+I3tad9iuvsU
	WU+IjbezL3CJCJ7bp4Un1f9oYLfhLcTrfLmp
X-Google-Smtp-Source: AGHT+IElifT8QoUNzxHAVYbqMQx4DiVI2tllM0h7CLeS8lFzZ7Esr23V8mawY8s6S56t+ueici+FJQ==
X-Received: by 2002:a05:6512:3d0f:b0:540:22bd:e25c with SMTP id 2adb3069b0e04-54099b729f6mr127691e87.50.1734051928607;
        Thu, 12 Dec 2024 17:05:28 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5402bfd8d20sm632306e87.26.2024.12.12.17.05.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Dec 2024 17:05:27 -0800 (PST)
Date: Fri, 13 Dec 2024 03:05:24 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, quic_abhinavk@quicinc.com, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm/dpu: Filter modes based on adjusted mode clock
Message-ID: <onavg2s7uamgwh34ozhbt56c74ktj5chp3jnn4bw5m22y5sdjr@fktyn5yt4gmw>
References: <20241212-filter-mode-clock-v1-1-f4441988d6aa@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241212-filter-mode-clock-v1-1-f4441988d6aa@quicinc.com>

On Thu, Dec 12, 2024 at 11:11:54AM -0800, Jessica Zhang wrote:
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
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c | 29 +++++++++++++++++++--------
>  drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h |  3 +++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c      | 12 +++++++++++
>  3 files changed, 36 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
> index 6f0a37f954fe8797a4e3a34e7876a93d5e477642..0afd7c81981c722a1a9176062250c418255fe6d0 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
> @@ -31,6 +31,26 @@ enum dpu_perf_mode {
>  	DPU_PERF_MODE_MAX
>  };
>  
> +/**
> + * dpu_core_perf_adjusted_crtc_clk - Adjust given crtc clock rate according to

Nit: CRTC (here and further)

> + *   the perf clock factor.
> + * @crtc_clk_rate - Unadjusted crtc clock rate
> + * @perf_cfg: performance configuration
> + */
> +u64 dpu_core_perf_adjusted_crtc_clk(u64 crtc_clk_rate,
> +				    const struct dpu_perf_cfg *perf_cfg)

It's not just the CRTC clocks

> +{
> +	u32 clk_factor;
> +
> +	clk_factor = perf_cfg->clk_inefficiency_factor;
> +	if (clk_factor) {
> +		crtc_clk_rate *= clk_factor;
> +		do_div(crtc_clk_rate, 100);
> +	}
> +
> +	return crtc_clk_rate;
> +}
> +
>  /**
>   * _dpu_core_perf_calc_bw() - to calculate BW per crtc
>   * @perf_cfg: performance configuration
> @@ -76,7 +96,6 @@ static u64 _dpu_core_perf_calc_clk(const struct dpu_perf_cfg *perf_cfg,
>  	struct dpu_plane_state *pstate;
>  	struct drm_display_mode *mode;
>  	u64 crtc_clk;

While you are at it, could you please also add a patch, replacing height
* vidth * vrefresh with mode->clock * 1000? The former one has limited
precision.

> -	u32 clk_factor;
>  
>  	mode = &state->adjusted_mode;
>  
> @@ -90,13 +109,7 @@ static u64 _dpu_core_perf_calc_clk(const struct dpu_perf_cfg *perf_cfg,
>  		crtc_clk = max(pstate->plane_clk, crtc_clk);
>  	}

This function calculates crtc_clk as max(plane_clk, crtc_clk). Shouldn't
we also reject the atomic_state if for any of the planes the corrected
clock is lower than max_core_clk_rate

>  
> -	clk_factor = perf_cfg->clk_inefficiency_factor;
> -	if (clk_factor) {
> -		crtc_clk *= clk_factor;
> -		do_div(crtc_clk, 100);
> -	}
> -
> -	return crtc_clk;
> +	return dpu_core_perf_adjusted_crtc_clk(crtc_clk, perf_cfg);
>  }
>  
>  static struct dpu_kms *_dpu_crtc_get_kms(struct drm_crtc *crtc)
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h
> index 451bf8021114d9d4a2dfdbb81ed4150fc559c681..c3bcd567cdfb66647c83682d1feedd69e33f0680 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h
> @@ -54,6 +54,9 @@ struct dpu_core_perf {
>  	u64 fix_core_ab_vote;
>  };
>  
> +u64 dpu_core_perf_adjusted_crtc_clk(u64 clk_rate,
> +				    const struct dpu_perf_cfg *perf_cfg);
> +
>  int dpu_core_perf_crtc_check(struct drm_crtc *crtc,
>  		struct drm_crtc_state *state);
>  
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> index ad3462476a143ec01a3b8817a2c85b0f50435a9e..cd7b84ab57a7526948c2beb7c5cefdddcbe4f6d9 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> @@ -1257,6 +1257,7 @@ static enum drm_mode_status dpu_crtc_mode_valid(struct drm_crtc *crtc,
>  						const struct drm_display_mode *mode)
>  {
>  	struct dpu_kms *dpu_kms = _dpu_crtc_get_kms(crtc);
> +	u64 adjusted_mode_clk;
>  
>  	/* if there is no 3d_mux block we cannot merge LMs so we cannot
>  	 * split the large layer into 2 LMs, filter out such modes
> @@ -1264,6 +1265,17 @@ static enum drm_mode_status dpu_crtc_mode_valid(struct drm_crtc *crtc,
>  	if (!dpu_kms->catalog->caps->has_3d_merge &&
>  	    mode->hdisplay > dpu_kms->catalog->caps->max_mixer_width)
>  		return MODE_BAD_HVALUE;
> +
> +	adjusted_mode_clk = dpu_core_perf_adjusted_crtc_clk(mode->clock,
> +							    dpu_kms->perf.perf_cfg);
> +
> +	/*
> +	 * The given mode, adjusted for the perf clock factor, should not exceed
> +	 * the max core clock rate
> +	 */
> +	if (adjusted_mode_clk > dpu_kms->perf.max_core_clk_rate / 1000)
> +		return MODE_CLOCK_HIGH;
> +
>  	/*
>  	 * max crtc width is equal to the max mixer width * 2 and max height is 4K
>  	 */
> 
> ---
> base-commit: 423c1c96d6b2d3bb35072e33a5fdd8db6d2c0a74
> change-id: 20241212-filter-mode-clock-8cb2e769f05b
> 
> Best regards,
> -- 
> Jessica Zhang <quic_jesszhan@quicinc.com>
> 

-- 
With best wishes
Dmitry

