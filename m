Return-Path: <linux-arm-msm+bounces-50904-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AF6DA5B9AA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Mar 2025 08:22:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1E4EF3A2785
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Mar 2025 07:22:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 109D12206AB;
	Tue, 11 Mar 2025 07:22:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jf88mcdk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05E311F09AC
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Mar 2025 07:22:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741677738; cv=none; b=rXQLIZriVR2SPY4dQSTuoqsQVgnLK+x5HIUsm7a/5sMDrTTtqBPoqeW9joXVs9CuZ+ZBj3+cur5fTQH10EArUXwfQLpQDIQDtbbFPBeXL2qHjj6ucD1FwM6GsANb8lnXDcSqqMjFOEWPc3ysW3nx7y+2Etu48PPu5oLWAs756ns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741677738; c=relaxed/simple;
	bh=A/zgvG4tcMyh5JCbd0v4U7uD9NDLhEQx/G76Rqzs7fM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N4rUweDNsKVY5GQSg+nqM1+VzITGEKruWMwCiAR+Vayl7Ylb9FyDY3BNz7clNXyJOCegCPL79CFf22zFrSCPQqER0FVdpE70zmL2AEhTXV5pvU+aeL7kkI776taTapr7F44mcna9l460vRDw15EUEX5ToJ4G6LXgharIGTPaUrA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jf88mcdk; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-43cf06eabdaso23571345e9.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Mar 2025 00:22:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741677734; x=1742282534; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=76PI8U0C3grhZ+WuGPDq/YmQnaoHPH4xWIdsOpqhIzo=;
        b=jf88mcdkrXgaaDzlbYLnaBb4T4n2aVKnjvG1A9Uss/uCz+bqcS7+9dauNc11+qQHaW
         2XUzGy1a6KUhZY8lK6M8nNL3T+9ZgZpobvT1HdWGbcMUoYphvFGstjh+i/a/oNRCnhIR
         dVZ0CTH5ksdYY/CdxXGkYleJV8bkH+ycndSDLCSgD+sXXoeckzs9+Zii2ma/0lXYU6QQ
         Ow0SC3uCDIEaAbDXjekoQtkpxikiknhUppUGsUGz7gG3aNT0pi/X8kmBjmge3fYEBWW8
         lGIDnU1ahYP1f0sTi0DGLLNamJE6vFIQCVl2MCc3gkq47tydI/PjILTbJFvpgeohccUW
         XpYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741677734; x=1742282534;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=76PI8U0C3grhZ+WuGPDq/YmQnaoHPH4xWIdsOpqhIzo=;
        b=ICP9XLA7YI/QXXsIoPlILqB5jhbU/25LKM9HyHKBqY7xjW4tbBiwa6HmgCTWFccfBD
         5pxLK63S2IFEiPRPD6gqriwPz2ywnuAq9KGyDPi77A1iiV4V9qwqnKn0a45JmuqMGIz5
         CkZK7x12ROGRMU+5qfv4CtZII4+cophJ+3jBL7zaMDZqiMaOur7hfJbPVmsdVrvnRGcG
         UMlLOqdn1ShCdNaBppl+VDX9a02ElbAxibSl0OOpTPmYPKEKfZjXOPlRs+Ss339xLrtE
         LcxJGtKdOt9Dq0R4wpJF/xetbs8OrJINV5Rrxy8q6pGowZSVIMg1ZvgZaip8TPE/YJmK
         BFJQ==
X-Forwarded-Encrypted: i=1; AJvYcCVNTeWvkQvbM2QBx9P1rJ9+dUbGmZnI5qTq7MS8SKafUeGeHrnkucKV1V46d+I6CIr+XdFQdEy7/qgf2tNB@vger.kernel.org
X-Gm-Message-State: AOJu0YzMwf/65Np5ly2/P5M8zChYp0uncZT3LFKBdDZG2PAnvSbIYIEg
	Xg6aklfm/P7l52dvq/OS077bIYG+6bLFACh5mocXN6ZkIuXl5ljnWtXTbCwL2KU=
X-Gm-Gg: ASbGncsjZotS2UV/7rJ1RoKPMRBZ+5u+NNAoflbclZQEeA1TYjBWJ17SfbYV6sf+WpV
	ohFSXPVdOZstt8cHTR7x/E+WR+JYmLiKjtf264GFkYytBPj2kYOHtTrQykO9Mlmn7w/9Fjwf3AT
	ytaXokcHayt1IzVnEA1zEzMh6KWyYJdlA0TORmCUwhuujeuwljMAVeaWX4jnHI7MvnMMFrvmyXP
	x42uwco4fUrB9lnOYJVIDW7KBbShySidXT4kUcXbmFvG2CdvUyyZI65fmvlB7VAajs4cliTi71k
	xi7h1qJHqWNZ+WZdFpTILP/5Bem+0f6veH/whPBs7w==
X-Google-Smtp-Source: AGHT+IHpxAncgrnL4ALrjetV1ziQLeJlcqXChyQIooItqRdevyNiOEaTJs5Dyo8WU/a2A84bNO/4SA==
X-Received: by 2002:a05:6000:1564:b0:38d:d666:5457 with SMTP id ffacd0b85a97d-39132da24cfmr13958644f8f.42.1741677734190;
        Tue, 11 Mar 2025 00:22:14 -0700 (PDT)
Received: from linaro.org ([62.231.96.41])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3912c0e1d67sm17233831f8f.74.2025.03.11.00.22.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Mar 2025 00:22:13 -0700 (PDT)
Date: Tue, 11 Mar 2025 09:22:11 +0200
From: Abel Vesa <abel.vesa@linaro.org>
To: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	Rob Clark <robdclark@gmail.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	laurentiu.tudor1@dell.com, johan@kernel.org
Subject: Re: [PATCH v1 1/2] drm/msm/dp: Fix support of LTTPR handling
Message-ID: <Z8/ko76QAGPE46R/@linaro.org>
References: <20250310211039.29843-1-alex.vinarskis@gmail.com>
 <20250310211039.29843-2-alex.vinarskis@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250310211039.29843-2-alex.vinarskis@gmail.com>

On 25-03-10 22:05:51, Aleksandrs Vinarskis wrote:
> Take into account LTTPR capabilities when selecting maximum allowed
> link rate, number of data lines. Initialize LTTPR before
> msm_dp_panel_read_sink_caps, as
> a) Link params computation need to take into account LTTPR's caps
> b) It appears DPTX shall (re)read DPRX caps after LTTPR detection
> 
> Return lttpr_count to prepare for per-segment link training.
> 
> Signed-off-by: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 31 +++++++++++++++++++----------
>  drivers/gpu/drm/msm/dp/dp_panel.c   | 30 +++++++++++++++++++---------
>  drivers/gpu/drm/msm/dp/dp_panel.h   |  2 ++
>  3 files changed, 44 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index bbc47d86ae9e..2edbc6adfde5 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -108,6 +108,8 @@ struct msm_dp_display_private {
>  	struct msm_dp_event event_list[DP_EVENT_Q_MAX];
>  	spinlock_t event_lock;
>  
> +	u8 lttpr_common_caps[DP_LTTPR_COMMON_CAP_SIZE];
> +
>  	bool wide_bus_supported;
>  
>  	struct msm_dp_audio *audio;
> @@ -367,17 +369,21 @@ static int msm_dp_display_send_hpd_notification(struct msm_dp_display_private *d
>  	return 0;
>  }
>  
> -static void msm_dp_display_lttpr_init(struct msm_dp_display_private *dp)
> +static int msm_dp_display_lttpr_init(struct msm_dp_display_private *dp, u8 *dpcd)
>  {
> -	u8 lttpr_caps[DP_LTTPR_COMMON_CAP_SIZE];
> -	int rc;
> +	int rc, lttpr_count;
>  
> -	if (drm_dp_read_lttpr_common_caps(dp->aux, dp->panel->dpcd, lttpr_caps))
> -		return;
> +	if (drm_dp_read_lttpr_common_caps(dp->aux, dpcd, dp->lttpr_common_caps))
> +		return 0;
>  
> -	rc = drm_dp_lttpr_init(dp->aux, drm_dp_lttpr_count(lttpr_caps));
> -	if (rc)
> -		DRM_ERROR("failed to set LTTPRs transparency mode, rc=%d\n", rc);
> +	lttpr_count = drm_dp_lttpr_count(dp->lttpr_common_caps);
> +	rc = drm_dp_lttpr_init(dp->aux, lttpr_count);
> +	if (rc) {
> +		DRM_ERROR("fialed to set LTTPRs transparency mode, rc=%d\n", rc);

Nitpick: failed

With that fixed, LGTM:

Reviewed-by: Abel Vesa <abel.vesa@linaro.org>

> +		return 0;
> +	}
> +
> +	return lttpr_count;
>  }
>  
>  static int msm_dp_display_process_hpd_high(struct msm_dp_display_private *dp)
> @@ -385,12 +391,17 @@ static int msm_dp_display_process_hpd_high(struct msm_dp_display_private *dp)
>  	struct drm_connector *connector = dp->msm_dp_display.connector;
>  	const struct drm_display_info *info = &connector->display_info;
>  	int rc = 0;
> +	u8 dpcd[DP_RECEIVER_CAP_SIZE];
>  
> -	rc = msm_dp_panel_read_sink_caps(dp->panel, connector);
> +	rc = drm_dp_read_dpcd_caps(dp->aux, dpcd);
>  	if (rc)
>  		goto end;
>  
> -	msm_dp_display_lttpr_init(dp);
> +	msm_dp_display_lttpr_init(dp, dpcd);
> +
> +	rc = msm_dp_panel_read_sink_caps(dp->panel, dp->lttpr_common_caps, connector);
> +	if (rc)
> +		goto end;
>  
>  	msm_dp_link_process_request(dp->link);
>  
> diff --git a/drivers/gpu/drm/msm/dp/dp_panel.c b/drivers/gpu/drm/msm/dp/dp_panel.c
> index 92415bf8aa16..f41b4cf7002e 100644
> --- a/drivers/gpu/drm/msm/dp/dp_panel.c
> +++ b/drivers/gpu/drm/msm/dp/dp_panel.c
> @@ -45,9 +45,12 @@ static void msm_dp_panel_read_psr_cap(struct msm_dp_panel_private *panel)
>  	}
>  }
>  
> -static int msm_dp_panel_read_dpcd(struct msm_dp_panel *msm_dp_panel)
> +static int msm_dp_panel_read_dpcd(struct msm_dp_panel *msm_dp_panel,
> +				  const u8 lttpr_common_caps[DP_LTTPR_COMMON_CAP_SIZE])
>  {
>  	int rc;
> +	int max_sink_lanes, max_source_lanes, max_lttpr_lanes;
> +	int max_sink_rate, max_source_rate, max_lttpr_rate;
>  	struct msm_dp_panel_private *panel;
>  	struct msm_dp_link_info *link_info;
>  	u8 *dpcd, major, minor;
> @@ -64,16 +67,24 @@ static int msm_dp_panel_read_dpcd(struct msm_dp_panel *msm_dp_panel)
>  	major = (link_info->revision >> 4) & 0x0f;
>  	minor = link_info->revision & 0x0f;
>  
> -	link_info->rate = drm_dp_max_link_rate(dpcd);
> -	link_info->num_lanes = drm_dp_max_lane_count(dpcd);
> +	max_source_lanes = msm_dp_panel->max_dp_lanes;
> +	max_source_rate = msm_dp_panel->max_dp_link_rate;
>  
> -	/* Limit data lanes from data-lanes of endpoint property of dtsi */
> -	if (link_info->num_lanes > msm_dp_panel->max_dp_lanes)
> -		link_info->num_lanes = msm_dp_panel->max_dp_lanes;
> +	max_sink_lanes = drm_dp_max_lane_count(dpcd);
> +	max_sink_rate = drm_dp_max_link_rate(dpcd);
> +
> +	max_lttpr_lanes = drm_dp_lttpr_max_lane_count(lttpr_common_caps);
> +	max_lttpr_rate = drm_dp_lttpr_max_link_rate(lttpr_common_caps);
>  
> +	if (max_lttpr_lanes)
> +		max_sink_lanes = min(max_sink_lanes, max_lttpr_lanes);
> +	if (max_lttpr_rate)
> +		max_sink_rate = min(max_sink_rate, max_lttpr_rate);
> +
> +	/* Limit data lanes from data-lanes of endpoint property of dtsi */
> +	link_info->num_lanes = min(max_sink_lanes, max_source_lanes);
>  	/* Limit link rate from link-frequencies of endpoint property of dtsi */
> -	if (link_info->rate > msm_dp_panel->max_dp_link_rate)
> -		link_info->rate = msm_dp_panel->max_dp_link_rate;
> +	link_info->rate = min(max_sink_rate, max_source_rate);
>  
>  	drm_dbg_dp(panel->drm_dev, "version: %d.%d\n", major, minor);
>  	drm_dbg_dp(panel->drm_dev, "link_rate=%d\n", link_info->rate);
> @@ -109,6 +120,7 @@ static u32 msm_dp_panel_get_supported_bpp(struct msm_dp_panel *msm_dp_panel,
>  }
>  
>  int msm_dp_panel_read_sink_caps(struct msm_dp_panel *msm_dp_panel,
> +	const u8 lttpr_common_caps[DP_LTTPR_COMMON_CAP_SIZE],
>  	struct drm_connector *connector)
>  {
>  	int rc, bw_code;
> @@ -125,7 +137,7 @@ int msm_dp_panel_read_sink_caps(struct msm_dp_panel *msm_dp_panel,
>  	drm_dbg_dp(panel->drm_dev, "max_lanes=%d max_link_rate=%d\n",
>  		msm_dp_panel->max_dp_lanes, msm_dp_panel->max_dp_link_rate);
>  
> -	rc = msm_dp_panel_read_dpcd(msm_dp_panel);
> +	rc = msm_dp_panel_read_dpcd(msm_dp_panel, lttpr_common_caps);
>  	if (rc) {
>  		DRM_ERROR("read dpcd failed %d\n", rc);
>  		return rc;
> diff --git a/drivers/gpu/drm/msm/dp/dp_panel.h b/drivers/gpu/drm/msm/dp/dp_panel.h
> index 4906f4f09f24..d89e17a9add5 100644
> --- a/drivers/gpu/drm/msm/dp/dp_panel.h
> +++ b/drivers/gpu/drm/msm/dp/dp_panel.h
> @@ -7,6 +7,7 @@
>  #define _DP_PANEL_H_
>  
>  #include <drm/msm_drm.h>
> +#include <drm/display/drm_dp_helper.h>
>  
>  #include "dp_aux.h"
>  #include "dp_link.h"
> @@ -49,6 +50,7 @@ int msm_dp_panel_init_panel_info(struct msm_dp_panel *msm_dp_panel);
>  int msm_dp_panel_deinit(struct msm_dp_panel *msm_dp_panel);
>  int msm_dp_panel_timing_cfg(struct msm_dp_panel *msm_dp_panel);
>  int msm_dp_panel_read_sink_caps(struct msm_dp_panel *msm_dp_panel,
> +		const u8 lttpr_common_caps[DP_LTTPR_COMMON_CAP_SIZE],
>  		struct drm_connector *connector);
>  u32 msm_dp_panel_get_mode_bpp(struct msm_dp_panel *msm_dp_panel, u32 mode_max_bpp,
>  			u32 mode_pclk_khz);
> -- 
> 2.45.2
> 

