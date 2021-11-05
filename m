Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 30CFB446ABF
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Nov 2021 23:02:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233934AbhKEWE5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 5 Nov 2021 18:04:57 -0400
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39]:53958 "EHLO
        alexa-out-sd-02.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233278AbhKEWE4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 5 Nov 2021 18:04:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1636149737; x=1667685737;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=9vPpygTUT+ucbds6ubBKq3TTxZjFilapGsXXxAj2r5A=;
  b=iFyURNdT+mvsr2C0e8lVGSyLGcO0sgMLkt2/Uiiy5/sbN2kaRy1GS6aS
   jD/n056zVFF1eGovULzul4AKisSpWBgit003vIPH8eCBXwmfL32m7tttS
   C9CY9xZiZ2toJSEuGLDafSXZRvuc3rRAU5TgYwzC6exy0x56JSUocvrz4
   M=;
Received: from unknown (HELO ironmsg05-sd.qualcomm.com) ([10.53.140.145])
  by alexa-out-sd-02.qualcomm.com with ESMTP; 05 Nov 2021 15:02:16 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg05-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2021 15:02:16 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.7;
 Fri, 5 Nov 2021 15:02:15 -0700
Received: from [10.110.18.92] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.7; Fri, 5 Nov 2021
 15:02:14 -0700
Message-ID: <ca48882a-3e75-d782-d990-ed4916b4d648@quicinc.com>
Date:   Fri, 5 Nov 2021 15:02:14 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Subject: Re: [PATCH] drm/msm/dp: do not initialize phy until plugin interrupt
 received
Content-Language: en-US
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
CC:     <robdclark@gmail.com>, <sean@poorly.run>, <swboyd@chromium.org>,
        <vkoul@kernel.org>, <daniel@ffwll.ch>, <airlied@linux.ie>,
        <agross@kernel.org>, <dmitry.baryshkov@linaro.org>,
        <quic_abhinavk@quicinc.com>, <aravindh@codeaurora.org>,
        <freedreno@lists.freedesktop.org>,
        <dri-devel@lists.freedesktop.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Kuogee Hsieh <khsieh@codeaurora.org>
References: <1636133291-10551-1-git-send-email-quic_khsieh@quicinc.com>
 <YYVudQzp8Kxweewq@ripper>
From:   Kuogee Hsieh <quic_khsieh@quicinc.com>
In-Reply-To: <YYVudQzp8Kxweewq@ripper>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 11/5/2021 10:48 AM, Bjorn Andersson wrote:
> On Fri 05 Nov 10:28 PDT 2021, Kuogee Hsieh wrote:
>
>> From: Kuogee Hsieh <khsieh@codeaurora.org>
>>
>> Combo phy supports both USB and DP simultaneously. There may has a
>> possible conflict during phy initialization phase between USB and
>> DP driver which may cause USB phy timeout when USB tries to power
>> up its phy. This patch has the DP driver not initialize its phy
>> during DP driver initialization phase. Instead DP driver only enable
>> required regulators and clocks so that it is able to receive HPD
>> interrupts after completion of initialization phase. DP driver will
>> initialize its phy when HPD plug-in interrupt received.
> Is this a hardware requirement, or is this a issue with the current
> implementation of the QMP combo phy driver? We should not hack up the DP
> driver to circumvent the latter.
>
> Also, I don't suppose there's anything here that prevents the HPD to
> come before the USB PHY is powered up? Even though that seems less
> likely in practice...

No, I do not think it is hardware limitation. I had asked usb team looks 
into this issue too and submit their patch to address this issue 
accordingly. This is from usb side.

 From display side, this patch is not hacked but provides finer control  
of dp driver with side effects of synchronization between usb and dp.

HPD is go through protocol handshakes between EC and USB device and it 
will not generated until usb device power delivery negotiation done and 
dp device detected.

Also DP HPD controller do provide mask bits to enable HPD interrupts be 
received by DP driver after completed 100ms HDP pulse de bouncing.

Please review this patch asap.

Thanks,

kuogee


>> This patch also provides a positive side effects which balance regulator
>> enable count since regulator only enabled at initialize phase and resume
>> and disabled at followed suspend.
>>
> Is this something that needs to be fixed separately, so that it can be
> backported to stable kernels?
>
> Regards,
> Bjorn
>
>> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
>> ---
>>   drivers/gpu/drm/msm/dp/dp_ctrl.c    | 97 ++++++++++++++++++++++---------------
>>   drivers/gpu/drm/msm/dp/dp_ctrl.h    |  9 ++--
>>   drivers/gpu/drm/msm/dp/dp_display.c | 71 ++++++++++++++++++++-------
>>   3 files changed, 119 insertions(+), 58 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
>> index 7ec155d..e0e5dc9 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
>> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
>> @@ -1364,7 +1364,41 @@ static int dp_ctrl_enable_stream_clocks(struct dp_ctrl_private *ctrl)
>>   	return ret;
>>   }
>>   
>> -int dp_ctrl_host_init(struct dp_ctrl *dp_ctrl, bool flip, bool reset)
>> +void dp_ctrl_irq_enable(struct dp_ctrl *dp_ctrl, bool flip)
>> +{
>> +	struct dp_ctrl_private *ctrl;
>> +
>> +	if (!dp_ctrl) {
>> +		DRM_ERROR("Invalid input data\n");
>> +		return;
>> +	}
>> +
>> +	ctrl = container_of(dp_ctrl, struct dp_ctrl_private, dp_ctrl);
>> +
>> +	ctrl->dp_ctrl.orientation = flip;
>> +
>> +	dp_catalog_ctrl_reset(ctrl->catalog);
>> +
>> +	dp_catalog_ctrl_enable_irq(ctrl->catalog, true);
>> +}
>> +
>> +void dp_ctrl_irq_disable(struct dp_ctrl *dp_ctrl)
>> +{
>> +	struct dp_ctrl_private *ctrl;
>> +
>> +	if (!dp_ctrl) {
>> +		DRM_ERROR("Invalid input data\n");
>> +		return;
>> +	}
>> +
>> +	ctrl = container_of(dp_ctrl, struct dp_ctrl_private, dp_ctrl);
>> +
>> +	dp_catalog_ctrl_reset(ctrl->catalog);
>> +
>> +	dp_catalog_ctrl_enable_irq(ctrl->catalog, false);
>> +}
>> +
>> +void dp_ctrl_phy_init(struct dp_ctrl *dp_ctrl)
>>   {
>>   	struct dp_ctrl_private *ctrl;
>>   	struct dp_io *dp_io;
>> @@ -1372,34 +1406,24 @@ int dp_ctrl_host_init(struct dp_ctrl *dp_ctrl, bool flip, bool reset)
>>   
>>   	if (!dp_ctrl) {
>>   		DRM_ERROR("Invalid input data\n");
>> -		return -EINVAL;
>> +		return;
>>   	}
>>   
>>   	ctrl = container_of(dp_ctrl, struct dp_ctrl_private, dp_ctrl);
>>   	dp_io = &ctrl->parser->io;
>>   	phy = dp_io->phy;
>>   
>> -	ctrl->dp_ctrl.orientation = flip;
>> -
>> -	if (reset)
>> -		dp_catalog_ctrl_reset(ctrl->catalog);
>> +	DRM_DEBUG_DP("Before, phy=%x init_count=%d power_on=%d\n",
>> +		(u32)(uintptr_t)phy, phy->init_count, phy->power_count);
>>   
>> -	DRM_DEBUG_DP("flip=%d\n", flip);
>>   	dp_catalog_ctrl_phy_reset(ctrl->catalog);
>>   	phy_init(phy);
>> -	dp_catalog_ctrl_enable_irq(ctrl->catalog, true);
>>   
>> -	return 0;
>> +	DRM_DEBUG_DP("After, phy=%x init_count=%d power_on=%d\n",
>> +		(u32)(uintptr_t)phy, phy->init_count, phy->power_count);
>>   }
>>   
>> -/**
>> - * dp_ctrl_host_deinit() - Uninitialize DP controller
>> - * @dp_ctrl: Display Port Driver data
>> - *
>> - * Perform required steps to uninitialize DP controller
>> - * and its resources.
>> - */
>> -void dp_ctrl_host_deinit(struct dp_ctrl *dp_ctrl)
>> +void dp_ctrl_phy_exit(struct dp_ctrl *dp_ctrl)
>>   {
>>   	struct dp_ctrl_private *ctrl;
>>   	struct dp_io *dp_io;
>> @@ -1414,10 +1438,14 @@ void dp_ctrl_host_deinit(struct dp_ctrl *dp_ctrl)
>>   	dp_io = &ctrl->parser->io;
>>   	phy = dp_io->phy;
>>   
>> -	dp_catalog_ctrl_enable_irq(ctrl->catalog, false);
>> +	DRM_DEBUG_DP("Before, phy=%x init_count=%d power_on=%d\n",
>> +		(u32)(uintptr_t)phy, phy->init_count, phy->power_count);
>> +
>> +	dp_catalog_ctrl_phy_reset(ctrl->catalog);
>>   	phy_exit(phy);
>>   
>> -	DRM_DEBUG_DP("Host deinitialized successfully\n");
>> +	DRM_DEBUG_DP("After, phy=%x init_count=%d power_on=%d\n",
>> +		(u32)(uintptr_t)phy, phy->init_count, phy->power_count);
>>   }
>>   
>>   static bool dp_ctrl_use_fixed_nvid(struct dp_ctrl_private *ctrl)
>> @@ -1895,8 +1923,14 @@ int dp_ctrl_off_link_stream(struct dp_ctrl *dp_ctrl)
>>   		return ret;
>>   	}
>>   
>> +	DRM_DEBUG_DP("Before, phy=%x init_count=%d power_on=%d\n",
>> +		(u32)(uintptr_t)phy, phy->init_count, phy->power_count);
>> +
>>   	phy_power_off(phy);
>>   
>> +	DRM_DEBUG_DP("After, phy=%x init_count=%d power_on=%d\n",
>> +		(u32)(uintptr_t)phy, phy->init_count, phy->power_count);
>> +
>>   	/* aux channel down, reinit phy */
>>   	phy_exit(phy);
>>   	phy_init(phy);
>> @@ -1905,23 +1939,6 @@ int dp_ctrl_off_link_stream(struct dp_ctrl *dp_ctrl)
>>   	return ret;
>>   }
>>   
>> -void dp_ctrl_off_phy(struct dp_ctrl *dp_ctrl)
>> -{
>> -	struct dp_ctrl_private *ctrl;
>> -	struct dp_io *dp_io;
>> -	struct phy *phy;
>> -
>> -	ctrl = container_of(dp_ctrl, struct dp_ctrl_private, dp_ctrl);
>> -	dp_io = &ctrl->parser->io;
>> -	phy = dp_io->phy;
>> -
>> -	dp_catalog_ctrl_reset(ctrl->catalog);
>> -
>> -	phy_exit(phy);
>> -
>> -	DRM_DEBUG_DP("DP off phy done\n");
>> -}
>> -
>>   int dp_ctrl_off(struct dp_ctrl *dp_ctrl)
>>   {
>>   	struct dp_ctrl_private *ctrl;
>> @@ -1949,10 +1966,14 @@ int dp_ctrl_off(struct dp_ctrl *dp_ctrl)
>>   		DRM_ERROR("Failed to disable link clocks. ret=%d\n", ret);
>>   	}
>>   
>> +	DRM_DEBUG_DP("Before, phy=%x init_count=%d power_on=%d\n",
>> +		(u32)(uintptr_t)phy, phy->init_count, phy->power_count);
>> +
>>   	phy_power_off(phy);
>> -	phy_exit(phy);
>>   
>> -	DRM_DEBUG_DP("DP off done\n");
>> +	DRM_DEBUG_DP("After, phy=%x init_count=%d power_on=%d\n",
>> +		(u32)(uintptr_t)phy, phy->init_count, phy->power_count);
>> +
>>   	return ret;
>>   }
>>   
>> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.h b/drivers/gpu/drm/msm/dp/dp_ctrl.h
>> index 2363a2d..c1e4b1b 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.h
>> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.h
>> @@ -19,12 +19,9 @@ struct dp_ctrl {
>>   	u32 pixel_rate;
>>   };
>>   
>> -int dp_ctrl_host_init(struct dp_ctrl *dp_ctrl, bool flip, bool reset);
>> -void dp_ctrl_host_deinit(struct dp_ctrl *dp_ctrl);
>>   int dp_ctrl_on_link(struct dp_ctrl *dp_ctrl);
>>   int dp_ctrl_on_stream(struct dp_ctrl *dp_ctrl);
>>   int dp_ctrl_off_link_stream(struct dp_ctrl *dp_ctrl);
>> -void dp_ctrl_off_phy(struct dp_ctrl *dp_ctrl);
>>   int dp_ctrl_off(struct dp_ctrl *dp_ctrl);
>>   void dp_ctrl_push_idle(struct dp_ctrl *dp_ctrl);
>>   void dp_ctrl_isr(struct dp_ctrl *dp_ctrl);
>> @@ -34,4 +31,10 @@ struct dp_ctrl *dp_ctrl_get(struct device *dev, struct dp_link *link,
>>   			struct dp_power *power, struct dp_catalog *catalog,
>>   			struct dp_parser *parser);
>>   
>> +void dp_ctrl_irq_enable(struct dp_ctrl *dp_ctrl, bool flip);
>> +void dp_ctrl_irq_disable(struct dp_ctrl *dp_ctrl);
>> +void dp_ctrl_phy_init(struct dp_ctrl *dp_ctrl);
>> +void dp_ctrl_phy_exit(struct dp_ctrl *dp_ctrl);
>> +void dp_ctrl_irq_phy_exit(struct dp_ctrl *dp_ctrl);
>> +
>>   #endif /* _DP_CTRL_H_ */
>> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
>> index e41dd40..17d2d5c 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_display.c
>> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
>> @@ -84,6 +84,7 @@ struct dp_display_private {
>>   
>>   	/* state variables */
>>   	bool core_initialized;
>> +	bool phy_initialized;
>>   	bool hpd_irq_on;
>>   	bool audio_supported;
>>   
>> @@ -387,7 +388,7 @@ static int dp_display_process_hpd_high(struct dp_display_private *dp)
>>   	return rc;
>>   }
>>   
>> -static void dp_display_host_init(struct dp_display_private *dp, int reset)
>> +static void dp_display_host_init(struct dp_display_private *dp)
>>   {
>>   	bool flip = false;
>>   
>> @@ -400,12 +401,37 @@ static void dp_display_host_init(struct dp_display_private *dp, int reset)
>>   	if (dp->usbpd->orientation == ORIENTATION_CC2)
>>   		flip = true;
>>   
>> -	dp_power_init(dp->power, flip);
>> -	dp_ctrl_host_init(dp->ctrl, flip, reset);
>> +	dp_power_init(dp->power, false);
>> +	dp_ctrl_irq_enable(dp->ctrl, flip);
>> +
>> +	if (dp->dp_display.connector_type == DRM_MODE_CONNECTOR_eDP)
>> +		dp_ctrl_phy_init(dp->ctrl);
>> +
>>   	dp_aux_init(dp->aux);
>>   	dp->core_initialized = true;
>>   }
>>   
>> +static void dp_display_host_phy_init(struct dp_display_private *dp)
>> +{
>> +	DRM_DEBUG_DP("core_init=%d phy_init=%d\n",
>> +			dp->core_initialized, dp->phy_initialized);
>> +	if (dp->phy_initialized == false) {
>> +		dp_ctrl_phy_init(dp->ctrl);
>> +		dp->phy_initialized = true;
>> +	}
>> +}
>> +
>> +static void dp_display_host_phy_exit(struct dp_display_private *dp)
>> +{
>> +	DRM_DEBUG_DP("core_init=%d phy_init=%d\n",
>> +			dp->core_initialized, dp->phy_initialized);
>> +
>> +	if (dp->phy_initialized == true) {
>> +		dp_ctrl_phy_exit(dp->ctrl);
>> +		dp->phy_initialized = false;
>> +	}
>> +}
>> +
>>   static void dp_display_host_deinit(struct dp_display_private *dp)
>>   {
>>   	if (!dp->core_initialized) {
>> @@ -413,7 +439,7 @@ static void dp_display_host_deinit(struct dp_display_private *dp)
>>   		return;
>>   	}
>>   
>> -	dp_ctrl_host_deinit(dp->ctrl);
>> +	dp_ctrl_irq_disable(dp->ctrl);
>>   	dp_aux_deinit(dp->aux);
>>   	dp_power_deinit(dp->power);
>>   
>> @@ -424,7 +450,7 @@ static int dp_display_usbpd_configure_cb(struct device *dev)
>>   {
>>   	struct dp_display_private *dp = dev_get_dp_display_private(dev);
>>   
>> -	dp_display_host_init(dp, true);
>> +	dp_display_host_phy_init(dp);
>>   
>>   	return dp_display_process_hpd_high(dp);
>>   }
>> @@ -551,7 +577,7 @@ static int dp_hpd_plug_handle(struct dp_display_private *dp, u32 data)
>>   		dp->hpd_state = ST_DISCONNECTED;
>>   
>>   		if (ret == -ECONNRESET) { /* cable unplugged */
>> -			dp->core_initialized = false;
>> +			dp->phy_initialized = false;
>>   		}
>>   
>>   	} else {
>> @@ -623,9 +649,8 @@ static int dp_hpd_unplug_handle(struct dp_display_private *dp, u32 data)
>>   	if (state == ST_DISCONNECTED) {
>>   		/* triggered by irq_hdp with sink_count = 0 */
>>   		if (dp->link->sink_count == 0) {
>> -			dp_ctrl_off_phy(dp->ctrl);
>> +			dp_display_host_phy_exit(dp);
>>   			hpd->hpd_high = 0;
>> -			dp->core_initialized = false;
>>   		}
>>   		mutex_unlock(&dp->event_mutex);
>>   		return 0;
>> @@ -716,7 +741,7 @@ static int dp_irq_hpd_handle(struct dp_display_private *dp, u32 data)
>>   
>>   	ret = dp_display_usbpd_attention_cb(&dp->pdev->dev);
>>   	if (ret == -ECONNRESET) { /* cable unplugged */
>> -		dp->core_initialized = false;
>> +		dp->phy_initialized = false;
>>   	}
>>   	DRM_DEBUG_DP("hpd_state=%d\n", state);
>>   
>> @@ -918,12 +943,19 @@ static int dp_display_disable(struct dp_display_private *dp, u32 data)
>>   
>>   	dp_display->audio_enabled = false;
>>   
>> -	/* triggered by irq_hpd with sink_count = 0 */
>>   	if (dp->link->sink_count == 0) {
>> +		/*
>> +		 * irq_hpd with sink_count = 0
>> +		 * hdmi unplugged out of dongle
>> +		 */
>>   		dp_ctrl_off_link_stream(dp->ctrl);
>>   	} else {
>> +		/*
>> +		 * unplugged interrupt
>> +		 * dongle unplugged out of DUT
>> +		 */
>>   		dp_ctrl_off(dp->ctrl);
>> -		dp->core_initialized = false;
>> +		dp_display_host_phy_exit(dp);
>>   	}
>>   
>>   	dp_power_panel_on(dp->power, false);
>> @@ -1059,7 +1091,7 @@ void msm_dp_snapshot(struct msm_disp_state *disp_state, struct msm_dp *dp)
>>   static void dp_display_config_hpd(struct dp_display_private *dp)
>>   {
>>   
>> -	dp_display_host_init(dp, true);
>> +	dp_display_host_init(dp);
>>   	dp_catalog_ctrl_hpd_config(dp->catalog);
>>   
>>   	/* Enable interrupt first time
>> @@ -1338,7 +1370,7 @@ static int dp_pm_resume(struct device *dev)
>>   	dp->hpd_state = ST_DISCONNECTED;
>>   
>>   	/* turn on dp ctrl/phy */
>> -	dp_display_host_init(dp, true);
>> +	dp_display_host_init(dp);
>>   
>>   	dp_catalog_ctrl_hpd_config(dp->catalog);
>>   
>> @@ -1346,12 +1378,15 @@ static int dp_pm_resume(struct device *dev)
>>   	 * set sink to normal operation mode -- D0
>>   	 * before dpcd read
>>   	 */
>> -	dp_link_psm_config(dp->link, &dp->panel->link_info, false);
>> -
>>   	if (dp_catalog_link_is_connected(dp->catalog)) {
>> +		dp_display_host_phy_init(dp);
>> +
>> +		dp_link_psm_config(dp->link, &dp->panel->link_info, false);
>>   		sink_count = drm_dp_read_sink_count(dp->aux);
>>   		if (sink_count < 0)
>>   			sink_count = 0;
>> +
>> +		dp_display_host_phy_exit(dp);
>>   	}
>>   
>>   	dp->link->sink_count = sink_count;
>> @@ -1399,6 +1434,8 @@ static int dp_pm_suspend(struct device *dev)
>>   		dp_display_host_deinit(dp);
>>   	}
>>   
>> +	dp_display_host_phy_exit(dp);
>> +
>>   	dp->hpd_state = ST_SUSPENDED;
>>   
>>   	/* host_init will be called at pm_resume */
>> @@ -1473,7 +1510,7 @@ void msm_dp_irq_postinstall(struct msm_dp *dp_display)
>>   		enable_irq(dp->irq);
>>   		dp_hpd_connect(dp->usbpd, true);
>>   	} else {
>> -		dp_add_event(dp, EV_HPD_INIT_SETUP, 0, dp->id * 10);
>> +		dp_add_event(dp, EV_HPD_INIT_SETUP, 0, 0);
>>   	}
>>   }
>>   
>> @@ -1567,7 +1604,7 @@ int msm_dp_display_enable(struct msm_dp *dp, struct drm_encoder *encoder)
>>   	state =  dp_display->hpd_state;
>>   
>>   	if (state == ST_DISPLAY_OFF)
>> -		dp_display_host_init(dp_display, true);
>> +		dp_display_host_phy_init(dp_display);
>>   
>>   	dp_display_enable(dp_display, 0);
>>   
>> -- 
>> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
>> a Linux Foundation Collaborative Project
>>
