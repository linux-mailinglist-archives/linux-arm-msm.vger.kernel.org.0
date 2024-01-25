Return-Path: <linux-arm-msm+bounces-8331-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A8BFF83CE9F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jan 2024 22:29:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 583B12963B3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jan 2024 21:29:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D85245B1E8;
	Thu, 25 Jan 2024 21:29:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OEP/T0ee"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C70A613A265
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jan 2024 21:29:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706218194; cv=none; b=oDxsXi2+loOqKoTK5Ez8xI4XcHj86ZmMkr5zxa5urOAAXolXEmLKIwsDT+ec28r9hWEPp0u8wHG+1d1X8rYIC+1+L4skXgpijZYM1f4Yh2K9X/EhfpnV2Ih/XQ0dUujOimd1sjadKgJcDBIMUlmkTNNxPpt+saqYKCcrvMjybUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706218194; c=relaxed/simple;
	bh=Yex9VsrVlixr8sY5jasY8v+NYvotkfA+N+DL/LHKqYI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YVSUdaOa1MtIYUKhsjFthq8tNfwm4JxtZA/joVmAr7g3L7+dGUQ59ZYrlxnDwaZP1p5qB6MjLhOtgRhzYb7pDeYzZmZiGch+O9AFMJxY18pbDlPwFhb3mzhXCjBghnZwG1EfD+S8HUtIfJqysY3y6cEWEA6jzmUhkan0101gjHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OEP/T0ee; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5101ae8ac40so1683435e87.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jan 2024 13:29:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706218191; x=1706822991; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Lk9rlFBsXVkQA8btAj6OVvojdjZuuLJwebzFzpRha/c=;
        b=OEP/T0eeQHUNjbmmcBSSfcBJwfef55DY+QXBlKZ2H+mw9MAI9VUJZkngIfQV5O2Q65
         B4yarjQ4unoGQdU8iPE1iVCfFuSe9y/ZKSqnR2IzVHp5tu/SAiCjvIkJyQ6J/4V9W5Wi
         JbOJG/vbuBwWLBAuE1cBAM+U6xO3AiiNvPkFtEfNkvk0Qw/dA8yuMO+1sqNq6PqDzYPn
         /mMhZKqtRv+yx4g5rdW6MT9uDSGQVOUBKZaBmzIGCkDdeuDnRXv1LliFt4NQqW+wU66q
         TVLXZ7XZi90vxDaOMzJDMTeK6F12oeIRU0Ax4NYjVVkgIEoTJp+wxczd7pn05OjQ1PIJ
         cLbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706218191; x=1706822991;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Lk9rlFBsXVkQA8btAj6OVvojdjZuuLJwebzFzpRha/c=;
        b=XnB1YeVgaIoMplJcWriliOy8rtbGs5gKKxSXF5+MMmEmYtjqQHQmJc+K83toMSt77u
         uwaWZQXQLCJL6chBOdwDQyjnfWxUIye72SZTkvo3p2kE3RsmCSjBe1WoEfDniVDCoWZK
         MybCZq2wZ5MGVUpKAdIpdMpiAQv5Gnco+Wa4QpE3jHgXaqMvU2Wxby0t85h/C82M7zXr
         8qCaZtiDWQUn6EiMB1KXltpnNVZZUvZnwbg30CBHPuCZNhZbt3NoTXi3rGnQTaNbhQMF
         8OUa6pHRto6d2ujY6rsmrm59yycgCGVL8LI/ktbkKZqr165588Yix+ZQv39NVxYxgP5A
         DGRA==
X-Gm-Message-State: AOJu0YwfUKZvcnSn0cq1BtQyV7vdX2CoIP0WGAPH2Kstcj7Zym3GObgg
	I4WUJprKt4IWHFf48Gh+V23akrFo1vOJ+TA0BbHi3+VB8QffPtEuJdWBaxDTUxY=
X-Google-Smtp-Source: AGHT+IEYuOP0FfJHektk6Ge/erp3gH2Gecc+r0Bkz4NRWvQkr3RbDmai1scG5LACq6AR8Iz9HlioXg==
X-Received: by 2002:a05:6512:2089:b0:50f:1c06:f9ba with SMTP id t9-20020a056512208900b0050f1c06f9bamr213218lfr.64.1706218190583;
        Thu, 25 Jan 2024 13:29:50 -0800 (PST)
Received: from [10.10.15.130] ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id j22-20020ac24556000000b00510210f7befsm153522lfm.49.2024.01.25.13.29.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Jan 2024 13:29:50 -0800 (PST)
Message-ID: <c666a271-e12c-41ad-af38-42d0c5b513b1@linaro.org>
Date: Thu, 25 Jan 2024 23:29:49 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/17] drm/msm/dp: change YUV420 related programming for
 DP
Content-Language: en-GB
To: Paloma Arellano <quic_parellan@quicinc.com>,
 freedreno@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 robdclark@gmail.com, seanpaul@chromium.org, swboyd@chromium.org,
 quic_abhinavk@quicinc.com, quic_jesszhan@quicinc.com,
 quic_khsieh@quicinc.com, marijn.suijten@somainline.org,
 neil.armstrong@linaro.org
References: <20240125193834.7065-1-quic_parellan@quicinc.com>
 <20240125193834.7065-9-quic_parellan@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20240125193834.7065-9-quic_parellan@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 25/01/2024 21:38, Paloma Arellano wrote:
> Change all relevant DP controller related programming for YUV420 cases.
> Namely, change the pixel clock math to consider YUV420, program the
> configuration control to indicate YUV420, as well as modify the MVID
> programming to consider YUV420.

Too many items for a single commit.

> 
> Signed-off-by: Paloma Arellano <quic_parellan@quicinc.com>
> ---
>   drivers/gpu/drm/msm/dp/dp_catalog.c |  5 ++++-
>   drivers/gpu/drm/msm/dp/dp_catalog.h |  2 +-
>   drivers/gpu/drm/msm/dp/dp_ctrl.c    | 12 +++++++++---
>   drivers/gpu/drm/msm/dp/dp_display.c |  8 +++++++-
>   drivers/gpu/drm/msm/msm_kms.h       |  3 +++
>   5 files changed, 24 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.c b/drivers/gpu/drm/msm/dp/dp_catalog.c
> index 5142aeb705a44..5d84c089e520a 100644
> --- a/drivers/gpu/drm/msm/dp/dp_catalog.c
> +++ b/drivers/gpu/drm/msm/dp/dp_catalog.c
> @@ -442,7 +442,7 @@ void dp_catalog_ctrl_config_misc(struct dp_catalog *dp_catalog,
>   
>   void dp_catalog_ctrl_config_msa(struct dp_catalog *dp_catalog,
>   					u32 rate, u32 stream_rate_khz,
> -					bool fixed_nvid)
> +					bool fixed_nvid, bool is_ycbcr_420)
>   {
>   	u32 pixel_m, pixel_n;
>   	u32 mvid, nvid, pixel_div = 0, dispcc_input_rate;
> @@ -485,6 +485,9 @@ void dp_catalog_ctrl_config_msa(struct dp_catalog *dp_catalog,
>   		nvid = temp;
>   	}
>   
> +	if (is_ycbcr_420)
> +		mvid /= 2;
> +
>   	if (link_rate_hbr2 == rate)
>   		nvid *= 2;
>   
> diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.h b/drivers/gpu/drm/msm/dp/dp_catalog.h
> index 38786e855b51a..6cb5e2a243de2 100644
> --- a/drivers/gpu/drm/msm/dp/dp_catalog.h
> +++ b/drivers/gpu/drm/msm/dp/dp_catalog.h
> @@ -96,7 +96,7 @@ void dp_catalog_ctrl_mainlink_ctrl(struct dp_catalog *dp_catalog, bool enable);
>   void dp_catalog_ctrl_psr_mainlink_enable(struct dp_catalog *dp_catalog, bool enable);
>   void dp_catalog_ctrl_config_misc(struct dp_catalog *dp_catalog, u32 cc, u32 tb);
>   void dp_catalog_ctrl_config_msa(struct dp_catalog *dp_catalog, u32 rate,
> -				u32 stream_rate_khz, bool fixed_nvid);
> +				u32 stream_rate_khz, bool fixed_nvid, bool is_ycbcr_420);
>   int dp_catalog_ctrl_set_pattern_state_bit(struct dp_catalog *dp_catalog, u32 pattern);
>   u32 dp_catalog_hw_revision(const struct dp_catalog *dp_catalog);
>   void dp_catalog_ctrl_reset(struct dp_catalog *dp_catalog);
> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> index 77a8d9366ed7b..209cf2a35642f 100644
> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> @@ -128,6 +128,9 @@ static void dp_ctrl_config_ctrl(struct dp_ctrl_private *ctrl)
>   	/* Default-> LSCLK DIV: 1/4 LCLK  */
>   	config |= (2 << DP_CONFIGURATION_CTRL_LSCLK_DIV_SHIFT);
>   
> +	if (ctrl->panel->dp_mode.out_fmt_is_yuv_420)
> +		config |= DP_CONFIGURATION_CTRL_RGB_YUV; /* YUV420 */
> +

This definitely is not related to clock rate calculations.

>   	/* Scrambler reset enable */
>   	if (drm_dp_alternate_scrambler_reset_cap(dpcd))
>   		config |= DP_CONFIGURATION_CTRL_ASSR;
> @@ -957,7 +960,7 @@ static void dp_ctrl_calc_tu_parameters(struct dp_ctrl_private *ctrl,
>   	in.hporch = drm_mode->htotal - drm_mode->hdisplay;
>   	in.nlanes = ctrl->link->link_params.num_lanes;
>   	in.bpp = ctrl->panel->dp_mode.bpp;
> -	in.pixel_enc = 444;
> +	in.pixel_enc = ctrl->panel->dp_mode.out_fmt_is_yuv_420 ? 420 : 444;
>   	in.dsc_en = 0;
>   	in.async_en = 0;
>   	in.fec_en = 0;
> @@ -1763,6 +1766,8 @@ int dp_ctrl_on_link(struct dp_ctrl *dp_ctrl)
>   		ctrl->link->link_params.rate = rate;
>   		ctrl->link->link_params.num_lanes =
>   			ctrl->panel->link_info.num_lanes;
> +		if (ctrl->panel->dp_mode.out_fmt_is_yuv_420)
> +			pixel_rate >>= 1;
>   	}
>   
>   	drm_dbg_dp(ctrl->drm_dev, "rate=%d, num_lanes=%d, pixel_rate=%lu\n",
> @@ -1878,7 +1883,7 @@ int dp_ctrl_on_stream(struct dp_ctrl *dp_ctrl, bool force_link_train)
>   
>   	pixel_rate = pixel_rate_orig = ctrl->panel->dp_mode.drm_mode.clock;
>   
> -	if (dp_ctrl->wide_bus_en)
> +	if (dp_ctrl->wide_bus_en || ctrl->panel->dp_mode.out_fmt_is_yuv_420)
>   		pixel_rate >>= 1;
>   
>   	drm_dbg_dp(ctrl->drm_dev, "rate=%d, num_lanes=%d, pixel_rate=%lu\n",
> @@ -1917,7 +1922,8 @@ int dp_ctrl_on_stream(struct dp_ctrl *dp_ctrl, bool force_link_train)
>   
>   	dp_catalog_ctrl_config_msa(ctrl->catalog,
>   		ctrl->link->link_params.rate,
> -		pixel_rate_orig, dp_ctrl_use_fixed_nvid(ctrl));
> +		pixel_rate_orig, dp_ctrl_use_fixed_nvid(ctrl),
> +		ctrl->panel->dp_mode.out_fmt_is_yuv_420);
>   
>   	dp_ctrl_setup_tr_unit(ctrl);
>   
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index f6b3b6ca242f8..6d764f5b08727 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -916,9 +916,10 @@ enum drm_mode_status dp_bridge_mode_valid(struct drm_bridge *bridge,
>   	const u32 num_components = 3, default_bpp = 24;
>   	struct dp_display_private *dp_display;
>   	struct dp_link_info *link_info;
> -	u32 mode_rate_khz = 0, supported_rate_khz = 0, mode_bpp = 0;
>   	struct msm_dp *dp;
>   	int mode_pclk_khz = mode->clock;
> +	int rate_ratio = RGB_24BPP_TMDS_CHAR_RATE_RATIO;
> +	u32 mode_rate_khz = 0, supported_rate_khz = 0, mode_bpp = 0;
>   
>   	dp = to_dp_bridge(bridge)->dp_display;
>   
> @@ -933,6 +934,11 @@ enum drm_mode_status dp_bridge_mode_valid(struct drm_bridge *bridge,
>   	dp_display = container_of(dp, struct dp_display_private, dp_display);
>   	link_info = &dp_display->panel->link_info;
>   
> +	if (drm_mode_is_420_only(&dp->connector->display_info, mode))
> +		rate_ratio = YUV420_24BPP_TMDS_CHAR_RATE_RATIO;
> +
> +	mode_pclk_khz /= rate_ratio;

I think it will be more obvious and simple to write:

if (drm_mode_is_420...)
     mode_pclk_khz /= 2;


> +
>   	mode_bpp = dp->connector->display_info.bpc * num_components;
>   	if (!mode_bpp)
>   		mode_bpp = default_bpp;
> diff --git a/drivers/gpu/drm/msm/msm_kms.h b/drivers/gpu/drm/msm/msm_kms.h
> index 44aa435d68ce2..66e8151951807 100644
> --- a/drivers/gpu/drm/msm/msm_kms.h
> +++ b/drivers/gpu/drm/msm/msm_kms.h
> @@ -15,6 +15,9 @@
>   
>   #define MAX_PLANE	4
>   
> +#define RGB_24BPP_TMDS_CHAR_RATE_RATIO		1
> +#define YUV420_24BPP_TMDS_CHAR_RATE_RATIO	2
> +
>   /* As there are different display controller blocks depending on the
>    * snapdragon version, the kms support is split out and the appropriate
>    * implementation is loaded at runtime.  The kms module is responsible

-- 
With best wishes
Dmitry


