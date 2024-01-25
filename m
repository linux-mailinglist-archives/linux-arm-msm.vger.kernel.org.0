Return-Path: <linux-arm-msm+bounces-8327-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E5CF083CE71
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jan 2024 22:24:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5CA341F278E5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jan 2024 21:24:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4742613AA43;
	Thu, 25 Jan 2024 21:23:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="B/fph0R1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 333D713AA3A
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jan 2024 21:23:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706217821; cv=none; b=V0ls2P478kn/CP/BNzB2Wez+qhqiwujdKg/eLRoEavNTy4DS1pPoielej6fDITApX8VKdxu1VodZt46aq5E4i8lPzO8E1rX+DuJyi4HPP0Rr1yuTz0ajm7abYLiJ1/ZhOLkk7S+FtVeICCqlVq5jieHDh0R98vEzHCSQ+/wZAjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706217821; c=relaxed/simple;
	bh=0ndVsptsLCZ04wXeCHAod+qI2Mnrpa/RLbMD9+9Cimg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MB+dyEQeTwYRUftVIer2lOBoQEWpd9xFJvjN0wlx7/ve4TBaQ3Pw1EBwnwDMXmycd1sO2qTPHF6qZ3P5uGQM2oA9pvFfjTXRryZX1eAGXOCyvieCzjb6TvbjkOxTjtxtY84ufkVUZ+Le+aYEHFJmpToaIsBr19487y55t0MMU3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=B/fph0R1; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-2cf161b5eadso38910261fa.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jan 2024 13:23:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706217817; x=1706822617; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eMti9UqjOHIvwe2jkr93A4vWwlT/U719vjlZLK4IDo0=;
        b=B/fph0R1KI5lUrPQMDATHaH4mVd/cB0P72xgHoojAcWOSLEMGsdUYRe/ZgbURr+tXy
         T5tolYkNBsxtpScGpObbhukWQHiL2kPeGuhB2YZwnY8UQ+OLzjPt+lt0nGTJaT3W1Mfv
         Wty9NMu+uEXyqKurAZI+HPuAYD4Bc/ExANa7/zp6P2Zp8OrVbk2WWe9dEEsHn4A/AGKv
         Y91m2Fl9Sx1G7ClyuSf9yX4KIU5maFp9G4J5ptkZ/xV4tpyEKkpVhqCPj4IR0h3eiRbr
         8jbY6m3nnAnl9WqhTAgIGalhnQh8qt79HRh6XGfGHtqGqwKD3zwX7HynHPJNOgMqguYT
         j1Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706217817; x=1706822617;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eMti9UqjOHIvwe2jkr93A4vWwlT/U719vjlZLK4IDo0=;
        b=ZFpOeLr7Xyi8mwLYfRqDBY79p41Ip1/d+f3YhxnIfSLZTn+1Pyr8mlV6Xj4elU25QN
         4KSzdz5CAF2YhvocpRrocwvpdPmhPDq1BzEJ/TZIw0IQ+O3svbclDr85Bo+qdqjZWDl0
         mThQi0Nq/RYT41JZ9dWaP6JCn8w0gwFMg5/sY/mlfFSVIxrh7ITirPfWv7NCenqb1Its
         7wEMKf5nInL6ZRjwwo6W1PTq2dBbf8bDct8SIe3gydNs4TMo/n+xl9VAYq1ySkxlNYtL
         q9ruD70Kv48QEzmpNKmDpmlPet1iD36vfxH5MWmGH2JGm7LU+3jHdXG9qEPAfXDeMdow
         FXgA==
X-Gm-Message-State: AOJu0Yy/E3kEx323cRQZuiW6mNF5/+/hYSfIViH1VA13ftrkgWNpVmLJ
	ySLjWqZFmcLDINIjvZaLBLbwZje7S4j6V+frYM8bxzAiLJm19cveTAkvZY2gk5C1g5vPr7CtsRJ
	2
X-Google-Smtp-Source: AGHT+IG5FAYG5wdjdwQXIRiGG2+Js2nBfyyOCgeA+kg/BErh0akK2PU+mxWO9A2x4+tVNk08XmNyAQ==
X-Received: by 2002:ac2:5383:0:b0:510:c31:f6f2 with SMTP id g3-20020ac25383000000b005100c31f6f2mr458862lfh.25.1706217817142;
        Thu, 25 Jan 2024 13:23:37 -0800 (PST)
Received: from [10.10.15.130] ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id w19-20020a05651234d300b005101f0166b6sm199472lfr.14.2024.01.25.13.23.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Jan 2024 13:23:36 -0800 (PST)
Message-ID: <e1a13e45-e87c-4c7b-a5cb-f46d51e66058@linaro.org>
Date: Thu, 25 Jan 2024 23:23:36 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/17] drm/msm/dp: add an API to indicate if sink supports
 VSC SDP
Content-Language: en-GB
To: Paloma Arellano <quic_parellan@quicinc.com>,
 freedreno@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 robdclark@gmail.com, seanpaul@chromium.org, swboyd@chromium.org,
 quic_abhinavk@quicinc.com, quic_jesszhan@quicinc.com,
 quic_khsieh@quicinc.com, marijn.suijten@somainline.org,
 neil.armstrong@linaro.org
References: <20240125193834.7065-1-quic_parellan@quicinc.com>
 <20240125193834.7065-6-quic_parellan@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20240125193834.7065-6-quic_parellan@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 25/01/2024 21:38, Paloma Arellano wrote:
> YUV420 format is supported only in the VSC SDP packet and not through
> MSA. Hence add an API which indicates the sink support which can be used
> by the rest of the DP programming.

This API ideally should go to drm/display/drm_dp_helper.c

> 
> Signed-off-by: Paloma Arellano <quic_parellan@quicinc.com>
> ---
>   drivers/gpu/drm/msm/dp/dp_display.c |  3 ++-
>   drivers/gpu/drm/msm/dp/dp_panel.c   | 35 +++++++++++++++++++++++++----
>   drivers/gpu/drm/msm/dp/dp_panel.h   |  1 +
>   3 files changed, 34 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index ddac55f45a722..f6b3b6ca242f8 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -1617,7 +1617,8 @@ void dp_bridge_mode_set(struct drm_bridge *drm_bridge,
>   		!!(dp_display->dp_mode.drm_mode.flags & DRM_MODE_FLAG_NHSYNC);
>   
>   	dp_display->dp_mode.out_fmt_is_yuv_420 =
> -		drm_mode_is_420_only(&dp->connector->display_info, adjusted_mode);
> +		drm_mode_is_420_only(&dp->connector->display_info, adjusted_mode) &&
> +		dp_panel_vsc_sdp_supported(dp_display->panel);
>   
>   	/* populate wide_bus_support to different layers */
>   	dp_display->ctrl->wide_bus_en =
> diff --git a/drivers/gpu/drm/msm/dp/dp_panel.c b/drivers/gpu/drm/msm/dp/dp_panel.c
> index 127f6af995cd1..af7820b6d35ec 100644
> --- a/drivers/gpu/drm/msm/dp/dp_panel.c
> +++ b/drivers/gpu/drm/msm/dp/dp_panel.c
> @@ -17,6 +17,9 @@ struct dp_panel_private {
>   	struct dp_link *link;
>   	struct dp_catalog *catalog;
>   	bool panel_on;
> +	bool vsc_supported;
> +	u8 major;
> +	u8 minor;
>   };
>   
>   static void dp_panel_read_psr_cap(struct dp_panel_private *panel)
> @@ -43,9 +46,10 @@ static void dp_panel_read_psr_cap(struct dp_panel_private *panel)
>   static int dp_panel_read_dpcd(struct dp_panel *dp_panel)
>   {
>   	int rc;
> +	ssize_t rlen;
>   	struct dp_panel_private *panel;
>   	struct dp_link_info *link_info;
> -	u8 *dpcd, major, minor;
> +	u8 *dpcd, rx_feature;
>   
>   	panel = container_of(dp_panel, struct dp_panel_private, dp_panel);
>   	dpcd = dp_panel->dpcd;
> @@ -53,10 +57,19 @@ static int dp_panel_read_dpcd(struct dp_panel *dp_panel)
>   	if (rc)
>   		return rc;
>   
> +	rlen = drm_dp_dpcd_read(panel->aux, DP_DPRX_FEATURE_ENUMERATION_LIST, &rx_feature, 1);
> +	if (rlen != 1) {
> +		panel->vsc_supported = false;
> +		pr_debug("failed to read DP_DPRX_FEATURE_ENUMERATION_LIST\n");
> +	} else {
> +		panel->vsc_supported = !!(rx_feature & DP_VSC_SDP_EXT_FOR_COLORIMETRY_SUPPORTED);
> +		pr_debug("vsc=%d\n", panel->vsc_supported);
> +	}
> +
>   	link_info = &dp_panel->link_info;
>   	link_info->revision = dpcd[DP_DPCD_REV];
> -	major = (link_info->revision >> 4) & 0x0f;
> -	minor = link_info->revision & 0x0f;
> +	panel->major = (link_info->revision >> 4) & 0x0f;
> +	panel->minor = link_info->revision & 0x0f;
>   
>   	link_info->rate = drm_dp_max_link_rate(dpcd);
>   	link_info->num_lanes = drm_dp_max_lane_count(dpcd);
> @@ -69,7 +82,7 @@ static int dp_panel_read_dpcd(struct dp_panel *dp_panel)
>   	if (link_info->rate > dp_panel->max_dp_link_rate)
>   		link_info->rate = dp_panel->max_dp_link_rate;
>   
> -	drm_dbg_dp(panel->drm_dev, "version: %d.%d\n", major, minor);
> +	drm_dbg_dp(panel->drm_dev, "version: %d.%d\n", panel->major, panel->minor);
>   	drm_dbg_dp(panel->drm_dev, "link_rate=%d\n", link_info->rate);
>   	drm_dbg_dp(panel->drm_dev, "lane_count=%d\n", link_info->num_lanes);
>   
> @@ -280,6 +293,20 @@ void dp_panel_tpg_config(struct dp_panel *dp_panel, bool enable)
>   	dp_catalog_panel_tpg_enable(catalog, &panel->dp_panel.dp_mode.drm_mode);
>   }
>   
> +bool dp_panel_vsc_sdp_supported(struct dp_panel *dp_panel)
> +{
> +	struct dp_panel_private *panel;
> +
> +	if (!dp_panel) {
> +		pr_err("invalid input\n");
> +		return false;
> +	}
> +
> +	panel = container_of(dp_panel, struct dp_panel_private, dp_panel);
> +
> +	return panel->major >= 1 && panel->minor >= 3 && panel->vsc_supported;
> +}
> +
>   void dp_panel_dump_regs(struct dp_panel *dp_panel)
>   {
>   	struct dp_catalog *catalog;
> diff --git a/drivers/gpu/drm/msm/dp/dp_panel.h b/drivers/gpu/drm/msm/dp/dp_panel.h
> index 6ec68be9f2366..590eca5ce304b 100644
> --- a/drivers/gpu/drm/msm/dp/dp_panel.h
> +++ b/drivers/gpu/drm/msm/dp/dp_panel.h
> @@ -66,6 +66,7 @@ int dp_panel_get_modes(struct dp_panel *dp_panel,
>   		struct drm_connector *connector);
>   void dp_panel_handle_sink_request(struct dp_panel *dp_panel);
>   void dp_panel_tpg_config(struct dp_panel *dp_panel, bool enable);
> +bool dp_panel_vsc_sdp_supported(struct dp_panel *dp_panel);
>   
>   /**
>    * is_link_rate_valid() - validates the link rate

-- 
With best wishes
Dmitry


