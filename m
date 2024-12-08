Return-Path: <linux-arm-msm+bounces-40894-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 500299E83DF
	for <lists+linux-arm-msm@lfdr.de>; Sun,  8 Dec 2024 07:25:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0BC7C281AAC
	for <lists+linux-arm-msm@lfdr.de>; Sun,  8 Dec 2024 06:25:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E42C05A4D5;
	Sun,  8 Dec 2024 06:25:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HJxxKwbi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C13CB1B960
	for <linux-arm-msm@vger.kernel.org>; Sun,  8 Dec 2024 06:25:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733639121; cv=none; b=XCrHerDST1b1OISjafi52B3qov7gFFjr0nUd/V3iV6c/zdqzhmCmagRIP3ftryRzB5llW7NviI/myfns0jH0LK1Vyar0mza3EsQEFe5k92QGnS4PK8t2+AzHJebIRYs8mW0vQoN6RPrM9z5rsfNRqJ9PC5jeo5tADR8H5ozWnAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733639121; c=relaxed/simple;
	bh=tjPxzmEid0ktMri0N6SNinB0M1uftQA3QuvagWpSqZI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YUbt9toXYz0jPheo9W6khRf0Po4SOxGdL2t00k9EO7tMpjU7cKD/h/apJGwG1DrnooyjxYyz458NB9FZ0+u23bpcEXk/kSgfnqvJR7fKJmjN9XPJlxvg3SUOPEac+qFZpswnyQGEL/Y2qy4z6DscGRFylWvu143DIM7d8GVxyIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HJxxKwbi; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-53de92be287so3293984e87.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 07 Dec 2024 22:25:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733639117; x=1734243917; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Yv4ZZLZ8246YBWnXODcwZp0cvCag8q8Zfn9GevZqfKI=;
        b=HJxxKwbiDKalBgcNJZsd+GfpBmgwIMG06vbj/MaUa6j+vl+2bM1HKq1OSREHQW/q4e
         5Y6SksRB3o+IEJZgFiqAQ6377i5JyAeSVbxplNJD/tWzyEEGqNNvKqpwEU890xFyhDKk
         hu6lLT9FRYgp1Urf6YC2E20HZkHO7qsoMsBl720fSBFREupFLfMhOOz3yhiRA84YuKHw
         40Ac8SsmGwcrWz/dNQ1LJ+ahs9zRRkfbQs7PYSAIuvoV41GmwhvPk0NhJDpx8rtSOt/O
         jGP19GHDzTbvxJ8NagIU1qK6GW08yT2CxJBU/drqrXzZ0EJVd09l5adjQIMMtrlCf437
         BnbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733639117; x=1734243917;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Yv4ZZLZ8246YBWnXODcwZp0cvCag8q8Zfn9GevZqfKI=;
        b=WuEo2NbkFepZgHUH3QI4ahqBs9zKIF+1LdL93X68mJd95A4lap639tZBmoSnFsuVTF
         Bl9XrWq7DSDRzwXoJuqTMqx8ZFPtLSNYUOJ5ab5cJeF2Vu9JC6GEQaByR/GzxyHJZXd/
         dG34u3xQN+ogqCRItm54jI7xNwdS3WPBwtFpBWuriydM5D3NXc2sfQRq1nq0UDsXCFBn
         CEXbZEomZR3xTSAbjPGz3Y2y3ut5tz6ILCCgb5iX1bH1pOzkLBixNZJKWQNJsjDIhYdo
         /FGrX7u3NTScaVO72Gl8e4gwwNjHT216aU2OEUWO7OomNbKyrFI0GH29oE3tFFtpwvSb
         Oi2w==
X-Forwarded-Encrypted: i=1; AJvYcCX5MHBAGlbu7ZY/Pkp7xhVpnfnJbVvmc6MWSgufLFemKxd45xTPV/EOOlzqElYpo96xZsYw555HlF8SeCo6@vger.kernel.org
X-Gm-Message-State: AOJu0YymoBOTL6SW+LsUd4jglDRk2o9izVomeE4WPZxozv1mv+KZ2z6h
	tjwaK3F0I6TCZWUU/al3bzPNdDM6gxjT5Ne5VfnQUIykz/wgJFyL8pHjq3DxMCg=
X-Gm-Gg: ASbGncsk6YP9o/O/Uz7mDgbHQc+tXYji4YtKFLkBZHwUAYu1aeXdqAicna7C8v4FKyv
	IVD0O8X8FL6eVLMGm0+WoqYXtOldaa5iPCV0QLdB4oYD+Sa+Mr5RweNGZthkTPi711N0/qVxHVG
	LsWoE+ZWs26v0h1/ugcMTZtf/maV4JtFFjxH4GsyCucbLdy5PF07vFziu7Klo0pewYaSZHOBEJ9
	g5EJ7Ord/Pe6Dm/+jsuVwSG7ZV8JFMAldLtmOKvoBF0uBIv7fDCtyeSx5lq7uCCl2RC23B5rqPU
	Jd+DAP/BBgq8Oc0WcxbcNj9k2C8/1Q==
X-Google-Smtp-Source: AGHT+IGa1+MAojS5l8TzrI/MuTB4uRPj9iAMmq7CXItu4qXq8cd0Vcz5ffDdDRwGNtUlkqf4/FMk3g==
X-Received: by 2002:a05:6512:691:b0:53e:1ee1:25b3 with SMTP id 2adb3069b0e04-53e2c2bc74dmr2506384e87.27.1733639116847;
        Sat, 07 Dec 2024 22:25:16 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54019f8afdesm246135e87.165.2024.12.07.22.25.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Dec 2024 22:25:15 -0800 (PST)
Date: Sun, 8 Dec 2024 08:25:13 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Stephen Boyd <swboyd@chromium.org>, 
	Chandan Uddaraju <chandanu@codeaurora.org>, Guenter Roeck <groeck@chromium.org>, 
	Kuogee Hsieh <quic_khsieh@quicinc.com>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Vara Reddy <quic_varar@quicinc.com>, Rob Clark <robdclark@chromium.org>, 
	Tanmay Shah <tanmay@codeaurora.org>, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	Jessica Zhang <quic_jesszhan@quicinc.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH 38/45] drm/msm: initialize DRM MST encoders for DP
 controllers
Message-ID: <ce67owjhtxwa3oy6fmmkmosqzzojny2ajofjjnk3lessly7t2b@artmywxh6hzq>
References: <20241205-dp_mst-v1-0-f8618d42a99a@quicinc.com>
 <20241205-dp_mst-v1-38-f8618d42a99a@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241205-dp_mst-v1-38-f8618d42a99a@quicinc.com>

On Thu, Dec 05, 2024 at 08:32:09PM -0800, Abhinav Kumar wrote:
> Initiliaze a DPMST encoder for each  MST capable DP controller
> and the number of encoders it supports depends on the number
> of streams it supports. Replace the opencoded instances of max_stream
> with the newly introduced API to centralize the usage.
> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h |  2 ++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c     | 23 ++++++++++++++++++++++-
>  drivers/gpu/drm/msm/dp/dp_display.c         | 26 +++++++++++++++++++++-----
>  drivers/gpu/drm/msm/msm_drv.h               | 14 ++++++++++++++

Split into two commits

>  4 files changed, 59 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
> index 92b5ee390788d16e85e195a664417896a2bf1cae..618a5b6f8222882ed8c972a78a26f8c25ca389a8 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
> @@ -28,6 +28,7 @@
>   * @h_tile_instance:    Controller instance used per tile. Number of elements is
>   *                      based on num_of_h_tiles
>   * @is_cmd_mode		Boolean to indicate if the CMD mode is requested
> + * @stream_id		stream id for which the interface needs to be acquired
>   * @vsync_source:	Source of the TE signal for DSI CMD devices
>   */
>  struct msm_display_info {
> @@ -35,6 +36,7 @@ struct msm_display_info {
>  	uint32_t num_of_h_tiles;
>  	uint32_t h_tile_instance[MAX_H_TILES_PER_DISPLAY];
>  	bool is_cmd_mode;
> +	int stream_id;
>  	enum dpu_vsync_source vsync_source;
>  };
>  
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> index 8b251f87a0520da0807b9b7aed17493990e41627..359de04abf4bbead3daa5e8b357a3c34216e3e65 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> @@ -636,7 +636,8 @@ static int _dpu_kms_initialize_displayport(struct drm_device *dev,
>  	struct msm_display_info info;
>  	bool yuv_supported;
>  	int rc;
> -	int i;
> +	int i, stream_id;
> +	int stream_cnt;
>  
>  	for (i = 0; i < ARRAY_SIZE(priv->dp); i++) {
>  		if (!priv->dp[i])
> @@ -659,6 +660,26 @@ static int _dpu_kms_initialize_displayport(struct drm_device *dev,
>  			DPU_ERROR("modeset_init failed for DP, rc = %d\n", rc);
>  			return rc;
>  		}
> +
> +		stream_cnt = msm_dp_get_mst_max_stream(priv->dp[i]);

Is there any reason for this not being a part of the DPU catalog? DPU
can support required number of DPMST streams even if DP doesn't

> +
> +		if (stream_cnt > 1) {
> +			for (stream_id = 0; stream_id < stream_cnt; stream_id++) {
> +				info.stream_id = stream_id;
> +				encoder = dpu_encoder_init(dev, DRM_MODE_ENCODER_DPMST, &info);
> +				if (IS_ERR(encoder)) {
> +					DPU_ERROR("encoder init failed for dp mst display\n");
> +					return PTR_ERR(encoder);
> +				}
> +
> +				rc = msm_dp_mst_bridge_init(priv->dp[i], encoder);
> +				if (rc) {
> +					DPU_ERROR("dp mst bridge %d init failed, %d\n",
> +						  stream_id, rc);
> +					continue;
> +				}
> +			}
> +		}
>  	}
>  
>  	return 0;
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index 80df79a7c2077d49184cdeb7b801bf0699ff4ece..eafec9ab4f83cb44e861687e7550748b4d9b7ece 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -432,7 +432,8 @@ static int msm_dp_display_process_hpd_high(struct msm_dp_display_private *dp)
>  	if (rc)
>  		goto end;
>  
> -	if (dp->max_stream <= DEFAULT_STREAM_COUNT || !msm_dp_panel_read_mst_cap(dp->panel)) {
> +	if (msm_dp_get_mst_max_stream(dp_display) <= DEFAULT_STREAM_COUNT ||
> +	    !msm_dp_panel_read_mst_cap(dp->panel)) {
>  		rc = msm_dp_panel_read_edid(dp->panel, connector);
>  		if (rc)
>  			goto end;
> @@ -457,7 +458,8 @@ static int msm_dp_display_process_hpd_high(struct msm_dp_display_private *dp)
>  	 */
>  	msm_dp_link_psm_config(dp->link, &dp->panel->link_info, false);
>  
> -	if (dp->max_stream > DEFAULT_STREAM_COUNT && msm_dp_panel_read_mst_cap(dp->panel))
> +	if (msm_dp_get_mst_max_stream(dp_display) > DEFAULT_STREAM_COUNT &&
> +	    msm_dp_panel_read_mst_cap(dp->panel))
>  		msm_dp_display_mst_init(dp);
>  
>  	msm_dp_link_reset_phy_params_vx_px(dp->link);
> @@ -977,7 +979,7 @@ static int msm_dp_display_enable(struct msm_dp_display_private *dp,
>  
>  	drm_dbg_dp(dp->drm_dev, "sink_count=%d\n", dp->link->sink_count);
>  
> -	rc = msm_dp_ctrl_on_stream(dp->ctrl, msm_dp_panel, dp->max_stream);
> +	rc = msm_dp_ctrl_on_stream(dp->ctrl, msm_dp_panel, msm_dp_get_mst_max_stream(&dp->msm_dp_display));
>  
>  	return rc;
>  }
> @@ -1444,6 +1446,20 @@ static int msm_dp_display_get_connector_type(struct platform_device *pdev,
>  	return connector_type;
>  }
>  
> +int msm_dp_get_mst_max_stream(const struct msm_dp *dp_display)
> +{
> +	struct msm_dp_display_private *dp_priv;
> +
> +	dp_priv = container_of(dp_display, struct msm_dp_display_private, msm_dp_display);
> +
> +	return dp_priv->max_stream;
> +}
> +
> +int msm_dp_mst_bridge_init(struct msm_dp *dp_display, struct drm_encoder *encoder)
> +{
> +	return msm_dp_mst_drm_bridge_init(dp_display, encoder);
> +}
> +
>  static int msm_dp_display_probe(struct platform_device *pdev)
>  {
>  	int rc = 0;
> @@ -1745,12 +1761,12 @@ void msm_dp_display_disable_helper(struct msm_dp *dp, struct msm_dp_panel *msm_d
>  		return;
>  	}
>  
> -	if (msm_dp_display->max_stream > DEFAULT_STREAM_COUNT)
> +	if (msm_dp_get_mst_max_stream(dp) > DEFAULT_STREAM_COUNT)
>  		msm_dp_ctrl_push_vcpf(msm_dp_display->ctrl, msm_dp_panel);
>  	else
>  		msm_dp_ctrl_push_idle(msm_dp_display->ctrl);
>  
> -	if (msm_dp_display->max_stream > DEFAULT_STREAM_COUNT) {
> +	if (msm_dp_get_mst_max_stream(dp) > DEFAULT_STREAM_COUNT) {
>  		msm_dp_ctrl_mst_stream_channel_slot_setup(msm_dp_display->ctrl,
>  							  msm_dp_display->max_stream);
>  		msm_dp_ctrl_mst_send_act(msm_dp_display->ctrl);
> diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
> index 1616a4682795f6b9b30cc0bef2baf448ccc62bc0..12b50a797772f574122481cd8a1c7c88aacb8250 100644
> --- a/drivers/gpu/drm/msm/msm_drv.h
> +++ b/drivers/gpu/drm/msm/msm_drv.h
> @@ -372,6 +372,10 @@ bool msm_dp_needs_periph_flush(const struct msm_dp *dp_display,
>  			       const struct drm_display_mode *mode);
>  bool msm_dp_wide_bus_available(const struct msm_dp *dp_display);
>  
> +int msm_dp_get_mst_max_stream(const struct msm_dp *dp_display);
> +
> +int msm_dp_mst_bridge_init(struct msm_dp *dp_display, struct drm_encoder *encoder);
> +
>  #else
>  static inline int __init msm_dp_register(void)
>  {
> @@ -388,6 +392,16 @@ static inline int msm_dp_modeset_init(struct msm_dp *dp_display,
>  	return -EINVAL;
>  }
>  
> +static inline int msm_dp_get_mst_max_stream(struct msm_dp *dp_display)
> +{
> +	return -EINVAL;
> +}
> +
> +int msm_dp_mst_bridge_init(struct msm_dp *dp_display, struct drm_encoder *encoder)
> +{
> +	return -EINVAL;
> +}
> +
>  static inline void msm_dp_snapshot(struct msm_disp_state *disp_state, struct msm_dp *dp_display)
>  {
>  }
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

