Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0A97445165F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Nov 2021 22:20:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346941AbhKOVXA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 15 Nov 2021 16:23:00 -0500
Received: from m43-7.mailgun.net ([69.72.43.7]:19594 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1350786AbhKOU03 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 15 Nov 2021 15:26:29 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1637007798; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=Bv/Y7Y/+6cknd0M5LlQUGT/BUE+wICPZcHMkzR1XZ5E=;
 b=V6ktO1E/2pmcD6NG5RvmskFI/GYFgZVnfl7KWAy7NvhPFvBdxis7jNHLmpvat8cMz2LQqSof
 daOUGR+scuosoYBDgloNay0lOPUCxx5AsZTJtfvNd2XQ78Jo4NQK1TxYKHwE1E/YUhpctqk+
 ppAFlIXFjRZj5egTIUP/R9rVEfo=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-east-1.postgun.com with SMTP id
 6192c1b23374c73cb5831d47 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 15 Nov 2021 20:23:14
 GMT
Sender: khsieh=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 32261C43164; Mon, 15 Nov 2021 20:23:10 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: khsieh)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 574F4C43618;
        Mon, 15 Nov 2021 20:23:03 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Mon, 15 Nov 2021 12:23:02 -0800
From:   khsieh@codeaurora.org
To:     Kuogee Hsieh <quic_khsieh@quicinc.com>
Cc:     robdclark@gmail.com, sean@poorly.run, swboyd@chromium.org,
        vkoul@kernel.org, daniel@ffwll.ch, airlied@linux.ie,
        agross@kernel.org, dmitry.baryshkov@linaro.org,
        bjorn.andersson@linaro.org, quic_abhinavk@quicinc.com,
        aravindh@codeaurora.org, freedreno@lists.freedesktop.org,
        dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] drm/msm/dp: do not initialize phy until plugin
 interrupt received
In-Reply-To: <1636493893-7600-1-git-send-email-quic_khsieh@quicinc.com>
References: <1636493893-7600-1-git-send-email-quic_khsieh@quicinc.com>
Message-ID: <200efcdff2978dbb30943dcdd8850090@codeaurora.org>
X-Sender: khsieh@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-11-09 13:38, Kuogee Hsieh wrote:
> From: Kuogee Hsieh <khsieh@codeaurora.org>
> 
> Current DP drivers have regulators, clocks, irq and phy are grouped
> together within a function and executed not in a symmetric manner.
> This increase difficulty of code maintenance and limited code 
> scalability.
> This patch divided the driver life cycle of operation into four states,
> resume (including booting up), dongle plugin, dongle unplugged and 
> suspend.
> Regulators, core clocks and irq are grouped together and enabled at 
> resume
> (or booting up) so that the DP controller is armed and ready to receive 
> HPD
> plugin interrupts. HPD plugin interrupt is generated when a dongle 
> plugs
> into DUT (device under test). Once HPD plugin interrupt is received, DP
> controller will initialize phy so that dpcd read/write will function 
> and
> following link training can be proceeded successfully. DP phy will be
> disabled after main link is teared down at end of unplugged HPD 
> interrupt
> handle triggered by dongle unplugged out of DUT. Finally regulators, 
> code
> clocks and irq are disabled at corresponding suspension.
> 
> Changes in V2:
> -- removed unnecessary dp_ctrl NULL check
> -- removed unnecessary phy init_count and power_count DRM_DEBUG_DP logs
> -- remove flip parameter out of dp_ctrl_irq_enable()
> -- add fixes tag
> 
> Changes in V3:
> -- call dp_display_host_phy_init() instead of dp_ctrl_phy_init() at
> 	dp_display_host_init() for eDP
> 
> Changes in V4:
> -- rewording commit text to match this commit changes
> 
> Fixes: e91e3065a806 ("drm/msm/dp: Add DP compliance tests on
> Snapdragon Chipsets")
> 
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> ---

any more comments?

>  drivers/gpu/drm/msm/dp/dp_ctrl.c    | 87 
> ++++++++++++++++---------------------
>  drivers/gpu/drm/msm/dp/dp_ctrl.h    |  9 ++--
>  drivers/gpu/drm/msm/dp/dp_display.c | 83 
> ++++++++++++++++++++++++++---------
>  3 files changed, 105 insertions(+), 74 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c 
> b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> index 7ec155d..4788e8c 100644
> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> @@ -1364,60 +1364,54 @@ static int dp_ctrl_enable_stream_clocks(struct
> dp_ctrl_private *ctrl)
>  	return ret;
>  }
> 
> -int dp_ctrl_host_init(struct dp_ctrl *dp_ctrl, bool flip, bool reset)
> +void dp_ctrl_irq_enable(struct dp_ctrl *dp_ctrl)
> +{
> +	struct dp_ctrl_private *ctrl;
> +
> +	ctrl = container_of(dp_ctrl, struct dp_ctrl_private, dp_ctrl);
> +
> +	dp_catalog_ctrl_reset(ctrl->catalog);
> +
> +	dp_catalog_ctrl_enable_irq(ctrl->catalog, true);
> +}
> +
> +void dp_ctrl_irq_disable(struct dp_ctrl *dp_ctrl)
> +{
> +	struct dp_ctrl_private *ctrl;
> +
> +	ctrl = container_of(dp_ctrl, struct dp_ctrl_private, dp_ctrl);
> +
> +	dp_catalog_ctrl_reset(ctrl->catalog);
> +
> +	dp_catalog_ctrl_enable_irq(ctrl->catalog, false);
> +}
> +
> +void dp_ctrl_phy_init(struct dp_ctrl *dp_ctrl)
>  {
>  	struct dp_ctrl_private *ctrl;
>  	struct dp_io *dp_io;
>  	struct phy *phy;
> 
> -	if (!dp_ctrl) {
> -		DRM_ERROR("Invalid input data\n");
> -		return -EINVAL;
> -	}
> -
>  	ctrl = container_of(dp_ctrl, struct dp_ctrl_private, dp_ctrl);
>  	dp_io = &ctrl->parser->io;
>  	phy = dp_io->phy;
> 
> -	ctrl->dp_ctrl.orientation = flip;
> -
> -	if (reset)
> -		dp_catalog_ctrl_reset(ctrl->catalog);
> -
> -	DRM_DEBUG_DP("flip=%d\n", flip);
>  	dp_catalog_ctrl_phy_reset(ctrl->catalog);
>  	phy_init(phy);
> -	dp_catalog_ctrl_enable_irq(ctrl->catalog, true);
> -
> -	return 0;
>  }
> 
> -/**
> - * dp_ctrl_host_deinit() - Uninitialize DP controller
> - * @dp_ctrl: Display Port Driver data
> - *
> - * Perform required steps to uninitialize DP controller
> - * and its resources.
> - */
> -void dp_ctrl_host_deinit(struct dp_ctrl *dp_ctrl)
> +void dp_ctrl_phy_exit(struct dp_ctrl *dp_ctrl)
>  {
>  	struct dp_ctrl_private *ctrl;
>  	struct dp_io *dp_io;
>  	struct phy *phy;
> 
> -	if (!dp_ctrl) {
> -		DRM_ERROR("Invalid input data\n");
> -		return;
> -	}
> -
>  	ctrl = container_of(dp_ctrl, struct dp_ctrl_private, dp_ctrl);
>  	dp_io = &ctrl->parser->io;
>  	phy = dp_io->phy;
> 
> -	dp_catalog_ctrl_enable_irq(ctrl->catalog, false);
> +	dp_catalog_ctrl_phy_reset(ctrl->catalog);
>  	phy_exit(phy);
> -
> -	DRM_DEBUG_DP("Host deinitialized successfully\n");
>  }
> 
>  static bool dp_ctrl_use_fixed_nvid(struct dp_ctrl_private *ctrl)
> @@ -1895,8 +1889,14 @@ int dp_ctrl_off_link_stream(struct dp_ctrl 
> *dp_ctrl)
>  		return ret;
>  	}
> 
> +	DRM_DEBUG_DP("Before, phy=%x init_count=%d power_on=%d\n",
> +		(u32)(uintptr_t)phy, phy->init_count, phy->power_count);
> +
>  	phy_power_off(phy);
> 
> +	DRM_DEBUG_DP("After, phy=%x init_count=%d power_on=%d\n",
> +		(u32)(uintptr_t)phy, phy->init_count, phy->power_count);
> +
>  	/* aux channel down, reinit phy */
>  	phy_exit(phy);
>  	phy_init(phy);
> @@ -1905,23 +1905,6 @@ int dp_ctrl_off_link_stream(struct dp_ctrl 
> *dp_ctrl)
>  	return ret;
>  }
> 
> -void dp_ctrl_off_phy(struct dp_ctrl *dp_ctrl)
> -{
> -	struct dp_ctrl_private *ctrl;
> -	struct dp_io *dp_io;
> -	struct phy *phy;
> -
> -	ctrl = container_of(dp_ctrl, struct dp_ctrl_private, dp_ctrl);
> -	dp_io = &ctrl->parser->io;
> -	phy = dp_io->phy;
> -
> -	dp_catalog_ctrl_reset(ctrl->catalog);
> -
> -	phy_exit(phy);
> -
> -	DRM_DEBUG_DP("DP off phy done\n");
> -}
> -
>  int dp_ctrl_off(struct dp_ctrl *dp_ctrl)
>  {
>  	struct dp_ctrl_private *ctrl;
> @@ -1949,10 +1932,14 @@ int dp_ctrl_off(struct dp_ctrl *dp_ctrl)
>  		DRM_ERROR("Failed to disable link clocks. ret=%d\n", ret);
>  	}
> 
> +	DRM_DEBUG_DP("Before, phy=%x init_count=%d power_on=%d\n",
> +		(u32)(uintptr_t)phy, phy->init_count, phy->power_count);
> +
>  	phy_power_off(phy);
> -	phy_exit(phy);
> 
> -	DRM_DEBUG_DP("DP off done\n");
> +	DRM_DEBUG_DP("After, phy=%x init_count=%d power_on=%d\n",
> +		(u32)(uintptr_t)phy, phy->init_count, phy->power_count);
> +
>  	return ret;
>  }
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.h 
> b/drivers/gpu/drm/msm/dp/dp_ctrl.h
> index 2363a2d..30f9414 100644
> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.h
> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.h
> @@ -19,12 +19,9 @@ struct dp_ctrl {
>  	u32 pixel_rate;
>  };
> 
> -int dp_ctrl_host_init(struct dp_ctrl *dp_ctrl, bool flip, bool reset);
> -void dp_ctrl_host_deinit(struct dp_ctrl *dp_ctrl);
>  int dp_ctrl_on_link(struct dp_ctrl *dp_ctrl);
>  int dp_ctrl_on_stream(struct dp_ctrl *dp_ctrl);
>  int dp_ctrl_off_link_stream(struct dp_ctrl *dp_ctrl);
> -void dp_ctrl_off_phy(struct dp_ctrl *dp_ctrl);
>  int dp_ctrl_off(struct dp_ctrl *dp_ctrl);
>  void dp_ctrl_push_idle(struct dp_ctrl *dp_ctrl);
>  void dp_ctrl_isr(struct dp_ctrl *dp_ctrl);
> @@ -34,4 +31,10 @@ struct dp_ctrl *dp_ctrl_get(struct device *dev,
> struct dp_link *link,
>  			struct dp_power *power, struct dp_catalog *catalog,
>  			struct dp_parser *parser);
> 
> +void dp_ctrl_irq_enable(struct dp_ctrl *dp_ctrl);
> +void dp_ctrl_irq_disable(struct dp_ctrl *dp_ctrl);
> +void dp_ctrl_phy_init(struct dp_ctrl *dp_ctrl);
> +void dp_ctrl_phy_exit(struct dp_ctrl *dp_ctrl);
> +void dp_ctrl_irq_phy_exit(struct dp_ctrl *dp_ctrl);
> +
>  #endif /* _DP_CTRL_H_ */
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c
> b/drivers/gpu/drm/msm/dp/dp_display.c
> index e41dd40..2f113ff 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -84,6 +84,7 @@ struct dp_display_private {
> 
>  	/* state variables */
>  	bool core_initialized;
> +	bool phy_initialized;
>  	bool hpd_irq_on;
>  	bool audio_supported;
> 
> @@ -387,7 +388,29 @@ static int dp_display_process_hpd_high(struct
> dp_display_private *dp)
>  	return rc;
>  }
> 
> -static void dp_display_host_init(struct dp_display_private *dp, int 
> reset)
> +static void dp_display_host_phy_init(struct dp_display_private *dp)
> +{
> +	DRM_DEBUG_DP("core_init=%d phy_init=%d\n",
> +			dp->core_initialized, dp->phy_initialized);
> +
> +	if (!dp->phy_initialized) {
> +		dp_ctrl_phy_init(dp->ctrl);
> +		dp->phy_initialized = true;
> +	}
> +}
> +
> +static void dp_display_host_phy_exit(struct dp_display_private *dp)
> +{
> +	DRM_DEBUG_DP("core_init=%d phy_init=%d\n",
> +			dp->core_initialized, dp->phy_initialized);
> +
> +	if (dp->phy_initialized) {
> +		dp_ctrl_phy_exit(dp->ctrl);
> +		dp->phy_initialized = false;
> +	}
> +}
> +
> +static void dp_display_host_init(struct dp_display_private *dp)
>  {
>  	bool flip = false;
> 
> @@ -400,8 +423,16 @@ static void dp_display_host_init(struct
> dp_display_private *dp, int reset)
>  	if (dp->usbpd->orientation == ORIENTATION_CC2)
>  		flip = true;
> 
> -	dp_power_init(dp->power, flip);
> -	dp_ctrl_host_init(dp->ctrl, flip, reset);
> +	dp_power_init(dp->power, false);
> +	dp_ctrl_irq_enable(dp->ctrl);
> +
> +	/*
> +	 * eDP is the embedded primary display and has its own phy
> +	 * initialize phy immediately
> +	 */
> +	if (dp->dp_display.connector_type == DRM_MODE_CONNECTOR_eDP)
> +		dp_display_host_phy_init(dp);
> +
>  	dp_aux_init(dp->aux);
>  	dp->core_initialized = true;
>  }
> @@ -413,7 +444,7 @@ static void dp_display_host_deinit(struct
> dp_display_private *dp)
>  		return;
>  	}
> 
> -	dp_ctrl_host_deinit(dp->ctrl);
> +	dp_ctrl_irq_disable(dp->ctrl);
>  	dp_aux_deinit(dp->aux);
>  	dp_power_deinit(dp->power);
> 
> @@ -424,7 +455,7 @@ static int dp_display_usbpd_configure_cb(struct 
> device *dev)
>  {
>  	struct dp_display_private *dp = dev_get_dp_display_private(dev);
> 
> -	dp_display_host_init(dp, true);
> +	dp_display_host_phy_init(dp);
> 
>  	return dp_display_process_hpd_high(dp);
>  }
> @@ -551,7 +582,7 @@ static int dp_hpd_plug_handle(struct
> dp_display_private *dp, u32 data)
>  		dp->hpd_state = ST_DISCONNECTED;
> 
>  		if (ret == -ECONNRESET) { /* cable unplugged */
> -			dp->core_initialized = false;
> +			dp->phy_initialized = false;
>  		}
> 
>  	} else {
> @@ -623,9 +654,8 @@ static int dp_hpd_unplug_handle(struct
> dp_display_private *dp, u32 data)
>  	if (state == ST_DISCONNECTED) {
>  		/* triggered by irq_hdp with sink_count = 0 */
>  		if (dp->link->sink_count == 0) {
> -			dp_ctrl_off_phy(dp->ctrl);
> +			dp_display_host_phy_exit(dp);
>  			hpd->hpd_high = 0;
> -			dp->core_initialized = false;
>  		}
>  		mutex_unlock(&dp->event_mutex);
>  		return 0;
> @@ -716,7 +746,7 @@ static int dp_irq_hpd_handle(struct
> dp_display_private *dp, u32 data)
> 
>  	ret = dp_display_usbpd_attention_cb(&dp->pdev->dev);
>  	if (ret == -ECONNRESET) { /* cable unplugged */
> -		dp->core_initialized = false;
> +		dp->phy_initialized = false;
>  	}
>  	DRM_DEBUG_DP("hpd_state=%d\n", state);
> 
> @@ -918,12 +948,19 @@ static int dp_display_disable(struct
> dp_display_private *dp, u32 data)
> 
>  	dp_display->audio_enabled = false;
> 
> -	/* triggered by irq_hpd with sink_count = 0 */
>  	if (dp->link->sink_count == 0) {
> +		/*
> +		 * irq_hpd with sink_count = 0
> +		 * hdmi unplugged out of dongle
> +		 */
>  		dp_ctrl_off_link_stream(dp->ctrl);
>  	} else {
> +		/*
> +		 * unplugged interrupt
> +		 * dongle unplugged out of DUT
> +		 */
>  		dp_ctrl_off(dp->ctrl);
> -		dp->core_initialized = false;
> +		dp_display_host_phy_exit(dp);
>  	}
> 
>  	dp_power_panel_on(dp->power, false);
> @@ -1059,7 +1096,7 @@ void msm_dp_snapshot(struct msm_disp_state
> *disp_state, struct msm_dp *dp)
>  static void dp_display_config_hpd(struct dp_display_private *dp)
>  {
> 
> -	dp_display_host_init(dp, true);
> +	dp_display_host_init(dp);
>  	dp_catalog_ctrl_hpd_config(dp->catalog);
> 
>  	/* Enable interrupt first time
> @@ -1338,20 +1375,22 @@ static int dp_pm_resume(struct device *dev)
>  	dp->hpd_state = ST_DISCONNECTED;
> 
>  	/* turn on dp ctrl/phy */
> -	dp_display_host_init(dp, true);
> +	dp_display_host_init(dp);
> 
>  	dp_catalog_ctrl_hpd_config(dp->catalog);
> 
> -	/*
> -	 * set sink to normal operation mode -- D0
> -	 * before dpcd read
> -	 */
> -	dp_link_psm_config(dp->link, &dp->panel->link_info, false);
> -
>  	if (dp_catalog_link_is_connected(dp->catalog)) {
> +		/*
> +		 * set sink to normal operation mode -- D0
> +		 * before dpcd read
> +		 */
> +		dp_display_host_phy_init(dp);
> +		dp_link_psm_config(dp->link, &dp->panel->link_info, false);
>  		sink_count = drm_dp_read_sink_count(dp->aux);
>  		if (sink_count < 0)
>  			sink_count = 0;
> +
> +		dp_display_host_phy_exit(dp);
>  	}
> 
>  	dp->link->sink_count = sink_count;
> @@ -1399,6 +1438,8 @@ static int dp_pm_suspend(struct device *dev)
>  		dp_display_host_deinit(dp);
>  	}
> 
> +	dp_display_host_phy_exit(dp);
> +
>  	dp->hpd_state = ST_SUSPENDED;
> 
>  	/* host_init will be called at pm_resume */
> @@ -1473,7 +1514,7 @@ void msm_dp_irq_postinstall(struct msm_dp 
> *dp_display)
>  		enable_irq(dp->irq);
>  		dp_hpd_connect(dp->usbpd, true);
>  	} else {
> -		dp_add_event(dp, EV_HPD_INIT_SETUP, 0, dp->id * 10);
> +		dp_add_event(dp, EV_HPD_INIT_SETUP, 0, 0);
>  	}
>  }
> 
> @@ -1567,7 +1608,7 @@ int msm_dp_display_enable(struct msm_dp *dp,
> struct drm_encoder *encoder)
>  	state =  dp_display->hpd_state;
> 
>  	if (state == ST_DISPLAY_OFF)
> -		dp_display_host_init(dp_display, true);
> +		dp_display_host_phy_init(dp_display);
> 
>  	dp_display_enable(dp_display, 0);
