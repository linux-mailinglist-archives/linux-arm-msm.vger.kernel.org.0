Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5290E423158
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Oct 2021 22:11:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231266AbhJEUNm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 5 Oct 2021 16:13:42 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:11804 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229851AbhJEUNm (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 5 Oct 2021 16:13:42 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1633464711; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=P0DRo+mb9v24WUz418XHZJLSk+CMLADwzwicec1u7rc=;
 b=rld50psNmv8bwPCj7j8MWCwZH+JMH2fYUvdSEHrRdnoUDfi+9CCqntxzOZOTUMdwxaHXxpux
 F80+swIlNtcWz3ghzZwYLjmksBdIl5+/mIvVIe4qLrT7Ul6a4GbiWEq3M8m9ZLvdKJkTaS86
 3uN1AcqTsHFZIqcfed1lK0m8Wro=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-east-1.postgun.com with SMTP id
 615cb17d4ccdf4fe575f4e01 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 05 Oct 2021 20:11:41
 GMT
Sender: abhinavk=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 30B9FC43616; Tue,  5 Oct 2021 20:11:39 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: abhinavk)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id BDEF2C4360D;
        Tue,  5 Oct 2021 20:11:36 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Tue, 05 Oct 2021 13:11:36 -0700
From:   abhinavk@codeaurora.org
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Kalyan Thota <kalyan_t@codeaurora.org>,
        Kuogee Hsieh <khsieh@codeaurora.org>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [Freedreno] [PATCH v3 1/5] drm/msm/dp: Remove global g_dp_display
 variable
In-Reply-To: <20211001180058.1021913-2-bjorn.andersson@linaro.org>
References: <20211001180058.1021913-1-bjorn.andersson@linaro.org>
 <20211001180058.1021913-2-bjorn.andersson@linaro.org>
Message-ID: <4e36028549fcadd5e31a6b5694d6be8f@codeaurora.org>
X-Sender: abhinavk@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-10-01 11:00, Bjorn Andersson wrote:
> As the Qualcomm DisplayPort driver only supports a single instance of
> the driver the commonly used struct dp_display is kept in a global
> variable. As we introduce additional instances this obviously doesn't
> work.
> 
> Replace this with a combination of existing references to adjacent
> objects and drvdata.
> 
> Reviewed-by: Stephen Boyd <swboyd@chromium.org>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Reviewed-by: Abhinav Kumar <abhinavk@codeaurora.org>
> ---
> 
> Changes since v2:
> - None
> 
>  drivers/gpu/drm/msm/dp/dp_display.c | 80 ++++++++---------------------
>  1 file changed, 21 insertions(+), 59 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c
> b/drivers/gpu/drm/msm/dp/dp_display.c
> index fbe4c2cd52a3..5d3ee5ef07c2 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -27,7 +27,6 @@
>  #include "dp_audio.h"
>  #include "dp_debug.h"
> 
> -static struct msm_dp *g_dp_display;
>  #define HPD_STRING_SIZE 30
> 
>  enum {
> @@ -121,6 +120,13 @@ static const struct of_device_id dp_dt_match[] = {
>  	{}
>  };
> 
> +static struct dp_display_private *dev_get_dp_display_private(struct
> device *dev)
> +{
> +	struct msm_dp *dp = dev_get_drvdata(dev);
> +
> +	return container_of(dp, struct dp_display_private, dp_display);
> +}
> +
>  static int dp_add_event(struct dp_display_private *dp_priv, u32 event,
>  						u32 data, u32 delay)
>  {
> @@ -197,15 +203,12 @@ static int dp_display_bind(struct device *dev,
> struct device *master,
>  			   void *data)
>  {
>  	int rc = 0;
> -	struct dp_display_private *dp;
> -	struct drm_device *drm;
> +	struct dp_display_private *dp = dev_get_dp_display_private(dev);
>  	struct msm_drm_private *priv;
> +	struct drm_device *drm;
> 
>  	drm = dev_get_drvdata(master);
> 
> -	dp = container_of(g_dp_display,
> -			struct dp_display_private, dp_display);
> -
>  	dp->dp_display.drm_dev = drm;
>  	priv = drm->dev_private;
>  	priv->dp = &(dp->dp_display);
> @@ -240,13 +243,10 @@ static int dp_display_bind(struct device *dev,
> struct device *master,
>  static void dp_display_unbind(struct device *dev, struct device 
> *master,
>  			      void *data)
>  {
> -	struct dp_display_private *dp;
> +	struct dp_display_private *dp = dev_get_dp_display_private(dev);
>  	struct drm_device *drm = dev_get_drvdata(master);
>  	struct msm_drm_private *priv = drm->dev_private;
> 
> -	dp = container_of(g_dp_display,
> -			struct dp_display_private, dp_display);
> -
>  	dp_power_client_deinit(dp->power);
>  	dp_aux_unregister(dp->aux);
>  	priv->dp = NULL;
> @@ -379,38 +379,17 @@ static void dp_display_host_deinit(struct
> dp_display_private *dp)
> 
>  static int dp_display_usbpd_configure_cb(struct device *dev)
>  {
> -	int rc = 0;
> -	struct dp_display_private *dp;
> -
> -	if (!dev) {
> -		DRM_ERROR("invalid dev\n");
> -		rc = -EINVAL;
> -		goto end;
> -	}
> -
> -	dp = container_of(g_dp_display,
> -			struct dp_display_private, dp_display);
> +	struct dp_display_private *dp = dev_get_dp_display_private(dev);
> 
>  	dp_display_host_init(dp, false);
> 
> -	rc = dp_display_process_hpd_high(dp);
> -end:
> -	return rc;
> +	return dp_display_process_hpd_high(dp);
>  }
> 
>  static int dp_display_usbpd_disconnect_cb(struct device *dev)
>  {
>  	int rc = 0;
> -	struct dp_display_private *dp;
> -
> -	if (!dev) {
> -		DRM_ERROR("invalid dev\n");
> -		rc = -EINVAL;
> -		return rc;
> -	}
> -
> -	dp = container_of(g_dp_display,
> -			struct dp_display_private, dp_display);
> +	struct dp_display_private *dp = dev_get_dp_display_private(dev);
> 
>  	dp_add_event(dp, EV_USER_NOTIFICATION, false, 0);
> 
> @@ -472,15 +451,7 @@ static int dp_display_usbpd_attention_cb(struct
> device *dev)
>  {
>  	int rc = 0;
>  	u32 sink_request;
> -	struct dp_display_private *dp;
> -
> -	if (!dev) {
> -		DRM_ERROR("invalid dev\n");
> -		return -EINVAL;
> -	}
> -
> -	dp = container_of(g_dp_display,
> -			struct dp_display_private, dp_display);
> +	struct dp_display_private *dp = dev_get_dp_display_private(dev);
> 
>  	/* check for any test request issued by sink */
>  	rc = dp_link_process_request(dp->link);
> @@ -647,7 +618,7 @@ static int dp_hpd_unplug_handle(struct
> dp_display_private *dp, u32 data)
> 
>  	DRM_DEBUG_DP("hpd_state=%d\n", state);
>  	/* signal the disconnect event early to ensure proper teardown */
> -	dp_display_handle_plugged_change(g_dp_display, false);
> +	dp_display_handle_plugged_change(&dp->dp_display, false);
> 
>  	/* enable HDP plug interrupt to prepare for next plugin */
>  	dp_catalog_hpd_config_intr(dp->catalog, DP_DP_HPD_PLUG_INT_MASK, 
> true);
> @@ -842,9 +813,7 @@ static int dp_display_prepare(struct msm_dp *dp)
>  static int dp_display_enable(struct dp_display_private *dp, u32 data)
>  {
>  	int rc = 0;
> -	struct msm_dp *dp_display;
> -
> -	dp_display = g_dp_display;
> +	struct msm_dp *dp_display = &dp->dp_display;
> 
>  	DRM_DEBUG_DP("sink_count=%d\n", dp->link->sink_count);
>  	if (dp_display->power_on) {
> @@ -880,9 +849,7 @@ static int dp_display_post_enable(struct msm_dp 
> *dp_display)
> 
>  static int dp_display_disable(struct dp_display_private *dp, u32 data)
>  {
> -	struct msm_dp *dp_display;
> -
> -	dp_display = g_dp_display;
> +	struct msm_dp *dp_display = &dp->dp_display;
> 
>  	if (!dp_display->power_on)
>  		return 0;
> @@ -1237,14 +1204,13 @@ static int dp_display_probe(struct
> platform_device *pdev)
>  	}
> 
>  	mutex_init(&dp->event_mutex);
> -	g_dp_display = &dp->dp_display;
> 
>  	/* Store DP audio handle inside DP display */
> -	g_dp_display->dp_audio = dp->audio;
> +	dp->dp_display.dp_audio = dp->audio;
> 
>  	init_completion(&dp->audio_comp);
> 
> -	platform_set_drvdata(pdev, g_dp_display);
> +	platform_set_drvdata(pdev, &dp->dp_display);
> 
>  	rc = component_add(&pdev->dev, &dp_display_comp_ops);
>  	if (rc) {
> @@ -1257,10 +1223,7 @@ static int dp_display_probe(struct 
> platform_device *pdev)
> 
>  static int dp_display_remove(struct platform_device *pdev)
>  {
> -	struct dp_display_private *dp;
> -
> -	dp = container_of(g_dp_display,
> -			struct dp_display_private, dp_display);
> +	struct dp_display_private *dp = 
> dev_get_dp_display_private(&pdev->dev);
> 
>  	dp_display_deinit_sub_modules(dp);
> 
> @@ -1315,8 +1278,7 @@ static int dp_pm_resume(struct device *dev)
>  	else
>  		dp->dp_display.is_connected = false;
> 
> -	dp_display_handle_plugged_change(g_dp_display,
> -				dp->dp_display.is_connected);
> +	dp_display_handle_plugged_change(dp_display, 
> dp->dp_display.is_connected);
> 
>  	DRM_DEBUG_DP("After, sink_count=%d is_connected=%d core_inited=%d
> power_on=%d\n",
>  			dp->link->sink_count, dp->dp_display.is_connected,
