Return-Path: <linux-arm-msm+bounces-40904-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 16BFC9E84A1
	for <lists+linux-arm-msm@lfdr.de>; Sun,  8 Dec 2024 12:22:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CB05E18849FA
	for <lists+linux-arm-msm@lfdr.de>; Sun,  8 Dec 2024 11:22:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFBB613E02E;
	Sun,  8 Dec 2024 11:22:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WY3d4a/W"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DAB913AD22
	for <linux-arm-msm@vger.kernel.org>; Sun,  8 Dec 2024 11:22:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733656945; cv=none; b=XAAmDWinS2lZYnE8Kn1uD+lRi6g28rcNN6NoksF9S/VtGQKUJimJ8t8DBBDZSP/tXLd1PJ5ug4AX+jAtTP9as286WNgSj1OwQz8je/HM22/yOg7yhYZnx6FgJXSvVPq4qov9n4PtanTG52Fq70dQeMbh0QUAFac/hZmXNTFoTME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733656945; c=relaxed/simple;
	bh=s9ah4dDybeJGC2Ib0Xi6rmbv2wogRONi64xq8l+LEGU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HRCayJmIjIfOj+VTFxTcW4/z1BbPYSqtX9rHJHlaCIhaYZZ2l3rE/GlB4mNcvaQZVpZils9ehMbKaAr/P5uxJ2MapTzIDW9eowbOfxYyK6RLed0iVBiBj1Mh1b1KUOml7HmL0dRV8UB460Qn0DemrNsH4L894Ed1ohDXUStAVMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WY3d4a/W; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5401bd6cdb7so291436e87.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 08 Dec 2024 03:22:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733656942; x=1734261742; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=O8HOMo9wrXsrXSw3Pdto//KG7R5dE8+B8LOhUZamqZI=;
        b=WY3d4a/WO7qbMBI+5uOxhiNRodS3lVlYiXB8pee7mppxFEEkqe4LTK9sbkqwr60Z5M
         y/n9FqmPmqZrauHe8aoJYKcISX4CDDZsW31mKWNxywHTQ8ANCkgSo2FZOF7dgd9lqn8r
         nuUc390vl9SHtdmYXS8bcq4JTledLwYWeJ8cs2SPJDs1wU0bk5DX2vxEK385h3aNjfYm
         c+FstCsw7s1dCIQUzQotcsvzfo1oHJ7h9+T/GYFTL+o+YtmNxJByKpfFxVwtEmzg3vGp
         bN8svMfdCuryZkbwwmH4/WPGJtv43vzDEQzZFswUbsskOl4gzaNNcp1ZN12w4UWU13mf
         bjjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733656942; x=1734261742;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O8HOMo9wrXsrXSw3Pdto//KG7R5dE8+B8LOhUZamqZI=;
        b=D1Axgr4v7qwIoAr+AcSTAqFZpY243c76Cbw8nhhsWh6EE6I6IDOStkR392UK4b9Uwp
         Va1NH5qjOCQe7FPZaj+vyPiRCXLWwXTMUESruUTvoOrUO/PzOWmyswZA2b6cotGWklHH
         4t0O9nUnOvRoeEsx1mUfbz8C+uUDcCF1Q067f+Skf1ujuepnfex1UgeN9RvUvw4AY/vv
         GWF/Y8bFxJMDcIqk/SgXqr2uAazu23mLItmKMu2G87/zLEwUqsF5rHgBpsHe6/ldr5re
         wqlabjDOLRKRMaN+FiXc6d+AFXXLTiooPRStqjh1CpU/SEhUJedyRRQyirye9GvBZZRL
         MYEQ==
X-Forwarded-Encrypted: i=1; AJvYcCUIUL+X4lJHerhwV8QWunM6MbYMkFDmMRh0h3N47Rh2KjDdryxjAxlRek834p7nxjb2JG+26ELckN0Xyj+8@vger.kernel.org
X-Gm-Message-State: AOJu0YwLmzxsz8IFcoIZJJGMsd7AWLUZysjoYEx7kGtbpbCBIVesDrCN
	AlDrkPxdgo6fp34wcqwm36iqaNFxEMeZPpzh3Q07duutoxHbiV4gqZZi7RP4FVs=
X-Gm-Gg: ASbGncs8eapPM1SS3WAfQmK2Mrz7vWZMJbe77xLwVUvKn50GlmNcI32p2esxTbLw6u5
	F8PttNy2sZswbIRXLq8w7ALyBvcyg3YaJvTLuuC2QKKeyp55dWqGsVf2fgsAgNOyeoXa+dmVHlQ
	m8I7hUpqOGInmQvVRHrdRLWPjg5GfcAW6pHlw32kS9BxhTn1swoVrh5I0sPm0f1JBIS2PBm2ET7
	kvJZbxcbJACEDxscheP5r694teAk0CZONmqjPeJIMdnYxud1ib44lvPVUu+mVRKHVRy7pQPxnSh
	6nCRlYu0x4OwmJT4Ig0YMyGrNYmG/w==
X-Google-Smtp-Source: AGHT+IFpFEK603OeGwG/42nEcZt3RcpXNh8GhTnL6wbdgKRQrZewGgj40jJkYf904XnwvY3tVXejnQ==
X-Received: by 2002:a05:6512:3d28:b0:53e:2bdf:5f29 with SMTP id 2adb3069b0e04-53e2c2e8a52mr3726760e87.39.1733656941544;
        Sun, 08 Dec 2024 03:22:21 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53e36d52a38sm668305e87.272.2024.12.08.03.22.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Dec 2024 03:22:20 -0800 (PST)
Date: Sun, 8 Dec 2024 13:22:18 +0200
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
Subject: Re: [PATCH 14/45] drm/msm/dp: introduce stream_id for each DP panel
Message-ID: <fmnrfoooqmiaw5aer4k5qayga72itpx6wxajdestupj4rysbvr@panfxl37wbhm>
References: <20241205-dp_mst-v1-0-f8618d42a99a@quicinc.com>
 <20241205-dp_mst-v1-14-f8618d42a99a@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241205-dp_mst-v1-14-f8618d42a99a@quicinc.com>

On Thu, Dec 05, 2024 at 08:31:45PM -0800, Abhinav Kumar wrote:
> With MST, each DP controller can handle multiple streams.
> There shall be one dp_panel for each stream but the dp_display
> object shall be shared among them. To represent this abstraction,
> create a stream_id for each DP panel which shall be set by the
> MST stream. For SST, default this to stream 0.
> 
> Use the stream ID to control the pixel clock of that respective
> stream by extending the clock handles and state tracking of the
> DP pixel clock to an array of max supported streams.
> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_catalog.h |  9 +++++++
>  drivers/gpu/drm/msm/dp/dp_ctrl.c    | 50 +++++++++++++++++++++++--------------
>  drivers/gpu/drm/msm/dp/dp_ctrl.h    |  2 +-
>  drivers/gpu/drm/msm/dp/dp_display.c | 28 ++++++++++++++++++++-
>  drivers/gpu/drm/msm/dp/dp_display.h |  3 +++
>  drivers/gpu/drm/msm/dp/dp_panel.h   |  2 ++
>  6 files changed, 73 insertions(+), 21 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.h b/drivers/gpu/drm/msm/dp/dp_catalog.h
> index e932b17eecbf514070cd8cd0b98ca0fefbe81ab7..edeebf1f313f50e9c54feee1e5aa6aa2dbba3058 100644
> --- a/drivers/gpu/drm/msm/dp/dp_catalog.h
> +++ b/drivers/gpu/drm/msm/dp/dp_catalog.h
> @@ -51,6 +51,15 @@ struct msm_dp_catalog {
>  	bool wide_bus_en;
>  };
>  
> +/* stream id */
> +enum msm_dp_stream_id {
> +	DP_STREAM_0,
> +	DP_STREAM_1,
> +	DP_STREAM_2,
> +	DP_STREAM_3,
> +	DP_STREAM_MAX,
> +};
> +
>  /* Debug module */
>  void msm_dp_catalog_snapshot(struct msm_dp_catalog *msm_dp_catalog, struct msm_disp_state *disp_state);
>  
> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> index 485339eb998cc6c8c1e8ab0a88b5c5d6ef300a1f..0648831df956dfc7afa1cbfb0dea2c32b02ff74e 100644
> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> @@ -86,7 +86,8 @@ struct msm_dp_ctrl_private {
>  	unsigned int num_link_clks;
>  	struct clk_bulk_data *link_clks;
>  
> -	struct clk *pixel_clk;
> +	struct clk *pixel_clk[DP_STREAM_MAX];
> +	unsigned int num_pixel_clks;
>  
>  	union phy_configure_opts phy_opts;
>  
> @@ -96,7 +97,7 @@ struct msm_dp_ctrl_private {
>  
>  	bool core_clks_on;
>  	bool link_clks_on;
> -	bool stream_clks_on;
> +	bool stream_clks_on[DP_STREAM_MAX];
>  };
>  
>  static int msm_dp_aux_link_configure(struct drm_dp_aux *aux,
> @@ -1698,25 +1699,26 @@ static bool msm_dp_ctrl_send_phy_test_pattern(struct msm_dp_ctrl_private *ctrl)
>  	return success;
>  }
>  
> -static int msm_dp_ctrl_stream_clk_on(struct msm_dp_ctrl_private *ctrl, unsigned long pixel_rate)
> +static int msm_dp_ctrl_stream_clk_on(struct msm_dp_ctrl_private *ctrl, unsigned long pixel_rate,
> +				     enum msm_dp_stream_id stream_id)
>  {
>  	int ret;
>  
> -	ret = clk_set_rate(ctrl->pixel_clk, pixel_rate * 1000);
> +	ret = clk_set_rate(ctrl->pixel_clk[stream_id], pixel_rate * 1000);
>  	if (ret) {
>  		DRM_ERROR("Failed to set pixel clock rate. ret=%d\n", ret);
>  		return ret;
>  	}
>  
> -	if (ctrl->stream_clks_on) {
> +	if (ctrl->stream_clks_on[stream_id]) {
>  		drm_dbg_dp(ctrl->drm_dev, "pixel clks already enabled\n");
>  	} else {
> -		ret = clk_prepare_enable(ctrl->pixel_clk);
> +		ret = clk_prepare_enable(ctrl->pixel_clk[stream_id]);
>  		if (ret) {
>  			DRM_ERROR("Failed to start pixel clocks. ret=%d\n", ret);
>  			return ret;
>  		}
> -		ctrl->stream_clks_on = true;
> +		ctrl->stream_clks_on[stream_id] = true;
>  	}
>  
>  	return ret;
> @@ -1739,7 +1741,7 @@ static int msm_dp_ctrl_process_phy_test_request(struct msm_dp_ctrl_private *ctrl
>  	 * running. Add the global reset just before disabling the
>  	 * link clocks and core clocks.
>  	 */
> -	msm_dp_ctrl_stream_clk_off(&ctrl->msm_dp_ctrl);
> +	msm_dp_ctrl_stream_clk_off(&ctrl->msm_dp_ctrl, msm_dp_panel);
>  	msm_dp_ctrl_off_link(&ctrl->msm_dp_ctrl);
>  
>  	ret = msm_dp_ctrl_on_link(&ctrl->msm_dp_ctrl);
> @@ -1749,7 +1751,7 @@ static int msm_dp_ctrl_process_phy_test_request(struct msm_dp_ctrl_private *ctrl
>  	}
>  
>  	pixel_rate = msm_dp_panel->msm_dp_mode.drm_mode.clock;
> -	ret = msm_dp_ctrl_stream_clk_on(ctrl, pixel_rate);
> +	ret = msm_dp_ctrl_stream_clk_on(ctrl, pixel_rate, msm_dp_panel->stream_id);

Why does msm_dp_ctrl_stream_clk_on() get stream_id, while
msm_dp_ctrl_stream_clk_off() gets the panel? I'd expect that they are
symmetrical.

>  
>  	msm_dp_ctrl_send_phy_test_pattern(ctrl);
>  
> @@ -1969,8 +1971,8 @@ int msm_dp_ctrl_prepare_stream_on(struct msm_dp_ctrl *msm_dp_ctrl, bool force_li
>  		   ctrl->link->link_params.num_lanes);
>  
>  	drm_dbg_dp(ctrl->drm_dev,
> -		   "core_clk_on=%d link_clk_on=%d stream_clk_on=%d\n",
> -		   ctrl->core_clks_on, ctrl->link_clks_on, ctrl->stream_clks_on);
> +		   "core_clk_on=%d link_clk_on=%d\n",
> +		   ctrl->core_clks_on, ctrl->link_clks_on);
>  
>  	if (!ctrl->link_clks_on) { /* link clk is off */
>  		ret = msm_dp_ctrl_enable_mainlink_clocks(ctrl);
> @@ -2009,7 +2011,7 @@ int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl, struct msm_dp_panel *
>  
>  	drm_dbg_dp(ctrl->drm_dev, "pixel_rate=%lu\n", pixel_rate);
>  
> -	ret = msm_dp_ctrl_stream_clk_on(ctrl, pixel_rate);
> +	ret = msm_dp_ctrl_stream_clk_on(ctrl, pixel_rate, msm_dp_panel->stream_id);
>  	if (ret) {
>  		DRM_ERROR("failed to enable stream pixel clk\n");
>  		return ret;
> @@ -2043,15 +2045,15 @@ int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl, struct msm_dp_panel *
>  	return ret;
>  }
>  
> -void msm_dp_ctrl_stream_clk_off(struct msm_dp_ctrl *msm_dp_ctrl)
> +void msm_dp_ctrl_stream_clk_off(struct msm_dp_ctrl *msm_dp_ctrl, struct msm_dp_panel *msm_dp_panel)
>  {
>  	struct msm_dp_ctrl_private *ctrl;
>  
>  	ctrl = container_of(msm_dp_ctrl, struct msm_dp_ctrl_private, msm_dp_ctrl);
>  
> -	if (ctrl->stream_clks_on) {
> -		clk_disable_unprepare(ctrl->pixel_clk);
> -		ctrl->stream_clks_on = false;
> +	if (ctrl->stream_clks_on[msm_dp_panel->stream_id]) {
> +		clk_disable_unprepare(ctrl->pixel_clk[msm_dp_panel->stream_id]);
> +		ctrl->stream_clks_on[msm_dp_panel->stream_id] = false;
>  	}
>  }
>  
> @@ -2199,9 +2201,19 @@ static int msm_dp_ctrl_clk_init(struct msm_dp_ctrl *msm_dp_ctrl)
>  	if (rc)
>  		return rc;
>  
> -	ctrl->pixel_clk = devm_clk_get(dev, "stream_pixel");
> -	if (IS_ERR(ctrl->pixel_clk))
> -		return PTR_ERR(ctrl->pixel_clk);
> +	ctrl->num_pixel_clks = 0;
> +
> +	ctrl->pixel_clk[DP_STREAM_0] = devm_clk_get(dev, "stream_pixel");
> +	if (IS_ERR(ctrl->pixel_clk[DP_STREAM_0]))
> +		return PTR_ERR(ctrl->pixel_clk[DP_STREAM_0]);
> +
> +	ctrl->num_pixel_clks++;
> +
> +	ctrl->pixel_clk[DP_STREAM_1] = devm_clk_get(dev, "stream_1_pixel");
> +	if (IS_ERR(ctrl->pixel_clk[DP_STREAM_1]))
> +		DRM_ERROR("failed to get stream_1_pixel clock");
> +	else
> +		ctrl->num_pixel_clks++;
>  
>  	return 0;
>  }
> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.h b/drivers/gpu/drm/msm/dp/dp_ctrl.h
> index 887cf5a866f07cb9038887a0634d3e1a0375879c..d422fd683b65d6f5e459710d0327e472a12c30b0 100644
> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.h
> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.h
> @@ -22,7 +22,7 @@ int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl, struct msm_dp_panel *
>  int msm_dp_ctrl_prepare_stream_on(struct msm_dp_ctrl *dp_ctrl, bool force_link_train);
>  void msm_dp_ctrl_off_link_stream(struct msm_dp_ctrl *msm_dp_ctrl);
>  void msm_dp_ctrl_off_link(struct msm_dp_ctrl *msm_dp_ctrl);
> -void msm_dp_ctrl_stream_clk_off(struct msm_dp_ctrl *msm_dp_ctrl);
> +void msm_dp_ctrl_stream_clk_off(struct msm_dp_ctrl *msm_dp_ctrl, struct msm_dp_panel *msm_dp_panel);
>  void msm_dp_ctrl_push_idle(struct msm_dp_ctrl *msm_dp_ctrl);
>  irqreturn_t msm_dp_ctrl_isr(struct msm_dp_ctrl *msm_dp_ctrl);
>  void msm_dp_ctrl_handle_sink_request(struct msm_dp_ctrl *msm_dp_ctrl);
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index 02282f58f1b31594601692b406215cee4ca41032..b506159191184a2a2c83d0735260ac040a33be98 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -911,7 +911,7 @@ static int msm_dp_display_disable(struct msm_dp_display_private *dp)
>  	if (dp->link->sink_count == 0)
>  		msm_dp_ctrl_psm_config(dp->ctrl);
>  
> -	msm_dp_ctrl_stream_clk_off(dp->ctrl);
> +	msm_dp_ctrl_stream_clk_off(dp->ctrl, dp->panel);
>  
>  	msm_dp_ctrl_off_link(dp->ctrl);
>  
> @@ -940,6 +940,30 @@ int msm_dp_display_set_plugged_cb(struct msm_dp *msm_dp_display,
>  	return 0;
>  }
>  
> +int msm_dp_display_set_stream_id(struct msm_dp *dp,
> +				 struct msm_dp_panel *panel, u32 strm_id)

stream_id, there is no need be cryptic.

> +{
> +	int rc = 0;
> +	struct msm_dp_display_private *msm_dp_display;
> +
> +	msm_dp_display = container_of(dp, struct msm_dp_display_private, msm_dp_display);
> +
> +	if (!msm_dp_display) {
> +		DRM_ERROR("invalid input\n");
> +		return -EINVAL;
> +	}
> +
> +	if (strm_id >= DP_STREAM_MAX) {
> +		DRM_ERROR("invalid stream id:%d\n", strm_id);
> +		return -EINVAL;

Who can actually check for this error? Please try moving stream IDs to
the state and assign them during atomic_check().

> +	}
> +
> +	if (panel)
> +		panel->stream_id = strm_id;
> +
> +	return rc;
> +}
> +
>  /**
>   * msm_dp_bridge_mode_valid - callback to determine if specified mode is valid
>   * @dp: Pointer to dp display structure
> @@ -1555,6 +1579,8 @@ void msm_dp_display_atomic_enable(struct msm_dp *dp)
>  
>  	mutex_lock(&msm_dp_display->event_mutex);
>  
> +	msm_dp_display_set_stream_id(dp, msm_dp_display->panel, 0);
> +
>  	if (dp->prepared) {
>  		rc = msm_dp_display_enable(msm_dp_display);
>  		if (rc)
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.h b/drivers/gpu/drm/msm/dp/dp_display.h
> index 46912a9855b512d9dc6a4edff91ffd21df46e22a..8ce8ba254b1bfe5b4c000df83eceef5823772780 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.h
> +++ b/drivers/gpu/drm/msm/dp/dp_display.h
> @@ -34,6 +34,7 @@ struct msm_dp {
>  
>  int msm_dp_display_set_plugged_cb(struct msm_dp *msm_dp_display,
>  		hdmi_codec_plugged_cb fn, struct device *codec_dev);
> +
>  int msm_dp_display_get_modes(struct msm_dp *msm_dp_display);
>  bool msm_dp_display_check_video_test(struct msm_dp *msm_dp_display);
>  int msm_dp_display_get_test_bpp(struct msm_dp *msm_dp_display);
> @@ -51,5 +52,7 @@ void msm_dp_display_mode_set(struct msm_dp *dp,
>  enum drm_mode_status msm_dp_display_mode_valid(struct msm_dp *dp,
>  					       const struct drm_display_info *info,
>  					       const struct drm_display_mode *mode);
> +int msm_dp_display_set_stream_id(struct msm_dp *dp,
> +				 struct msm_dp_panel *panel, u32 strm_id);
>  
>  #endif /* _DP_DISPLAY_H_ */
> diff --git a/drivers/gpu/drm/msm/dp/dp_panel.h b/drivers/gpu/drm/msm/dp/dp_panel.h
> index 363b416e4cbe290f9c0e6171d6c0c5170f9fea62..9af2272da697e7aa49377c02abdb97e72f07c0bd 100644
> --- a/drivers/gpu/drm/msm/dp/dp_panel.h
> +++ b/drivers/gpu/drm/msm/dp/dp_panel.h
> @@ -46,6 +46,8 @@ struct msm_dp_panel {
>  	bool video_test;
>  	bool vsc_sdp_supported;
>  
> +	enum msm_dp_stream_id stream_id;
> +
>  	u32 max_dp_lanes;
>  	u32 max_dp_link_rate;
>  
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

