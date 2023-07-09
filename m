Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5AD6D74C072
	for <lists+linux-arm-msm@lfdr.de>; Sun,  9 Jul 2023 04:49:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229620AbjGICtU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 8 Jul 2023 22:49:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32862 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229437AbjGICtT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 8 Jul 2023 22:49:19 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 93AA7DD;
        Sat,  8 Jul 2023 19:49:18 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 25C2960010;
        Sun,  9 Jul 2023 02:49:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D4FDC433C8;
        Sun,  9 Jul 2023 02:49:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1688870957;
        bh=XXxhPYApISgT00+twhv22Pg27b5Mq7iSOdnj8JNFPEg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=jLv4AGeA9guJGZ/5+upi4cHlRtj1Ps2oOPFT1e2Y48jplzxDCEPEgxea9NdRJz+pY
         SdvFaD0HIGRu2Y1/eBh01GB6RI+cQv5BazuCHpCMNGozyGxjfsHYljfyeFxpNooCUP
         MNUIVYsLVbJeEcbSghat/ex5mUYcE7v7l4H9Vgn5NeAK4oSZCGH2O5RZhThmW2SWw8
         5SgKY9bCt4nBK5Uw/c+VlS+PwInlLTmNV+zkFRu5nDy/X+mXkq8GPc13jT4DgYtiIt
         jT9m+5+/hVivc6zWump7vcO33tsuEvMvFu3NalCecgBZSWOGmict+o/+0QkrmAYqxM
         0N3K0xkU3DBvA==
Date:   Sat, 8 Jul 2023 19:52:54 -0700
From:   Bjorn Andersson <andersson@kernel.org>
To:     Kuogee Hsieh <quic_khsieh@quicinc.com>
Cc:     dri-devel@lists.freedesktop.org, robdclark@gmail.com,
        sean@poorly.run, swboyd@chromium.org, dianders@chromium.org,
        vkoul@kernel.org, daniel@ffwll.ch, airlied@gmail.com,
        agross@kernel.org, dmitry.baryshkov@linaro.org,
        quic_abhinavk@quicinc.com, quic_jesszhan@quicinc.com,
        quic_sbillaka@quicinc.com, marijn.suijten@somainline.org,
        freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 2/5] drm/msm/dp: incorporate pm_runtime framework into
 DP driver
Message-ID: <oc6cohs6pbiuyirdxgepoharuzdra2hzy3kwfqjmdfcq36y367@ah3bal2jqncb>
References: <1688773943-3887-1-git-send-email-quic_khsieh@quicinc.com>
 <1688773943-3887-3-git-send-email-quic_khsieh@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1688773943-3887-3-git-send-email-quic_khsieh@quicinc.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Jul 07, 2023 at 04:52:20PM -0700, Kuogee Hsieh wrote:
> Incorporating pm runtime framework into DP driver so that power
> and clock resource handling can be centralized allowing easier
> control of these resources in preparation of registering aux bus
> uring probe.
> 
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_aux.c     |  3 ++
>  drivers/gpu/drm/msm/dp/dp_display.c | 75 +++++++++++++++++++++++++++++--------
>  2 files changed, 63 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_aux.c b/drivers/gpu/drm/msm/dp/dp_aux.c
> index 8e3b677..c592064 100644
> --- a/drivers/gpu/drm/msm/dp/dp_aux.c
> +++ b/drivers/gpu/drm/msm/dp/dp_aux.c
> @@ -291,6 +291,7 @@ static ssize_t dp_aux_transfer(struct drm_dp_aux *dp_aux,
>  		return -EINVAL;
>  	}
>  
> +	pm_runtime_get_sync(dp_aux->dev);
>  	mutex_lock(&aux->mutex);
>  	if (!aux->initted) {
>  		ret = -EIO;
> @@ -364,6 +365,8 @@ static ssize_t dp_aux_transfer(struct drm_dp_aux *dp_aux,
>  
>  exit:
>  	mutex_unlock(&aux->mutex);
> +	pm_runtime_mark_last_busy(dp_aux->dev);
> +	pm_runtime_put_autosuspend(dp_aux->dev);
>  
>  	return ret;
>  }
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index 76f1395..2c5706a 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -309,6 +309,10 @@ static int dp_display_bind(struct device *dev, struct device *master,
>  		goto end;
>  	}
>  
> +	pm_runtime_enable(dev);
> +	pm_runtime_set_autosuspend_delay(dev, 1000);
> +	pm_runtime_use_autosuspend(dev);
> +
>  	return 0;
>  end:
>  	return rc;
> @@ -320,9 +324,8 @@ static void dp_display_unbind(struct device *dev, struct device *master,
>  	struct dp_display_private *dp = dev_get_dp_display_private(dev);
>  	struct msm_drm_private *priv = dev_get_drvdata(master);
>  
> -	/* disable all HPD interrupts */
> -	if (dp->core_initialized)
> -		dp_catalog_hpd_config_intr(dp->catalog, DP_DP_HPD_INT_MASK, false);
> +	pm_runtime_dont_use_autosuspend(dev);
> +	pm_runtime_disable(dev);
>  
>  	kthread_stop(dp->ev_tsk);
>  
> @@ -466,10 +469,12 @@ static void dp_display_host_init(struct dp_display_private *dp)
>  		dp->dp_display.connector_type, dp->core_initialized,
>  		dp->phy_initialized);
>  
> -	dp_power_init(dp->power);
> -	dp_ctrl_reset_irq_ctrl(dp->ctrl, true);
> -	dp_aux_init(dp->aux);
> -	dp->core_initialized = true;
> +	if (!dp->core_initialized) {
> +		dp_power_init(dp->power);
> +		dp_ctrl_reset_irq_ctrl(dp->ctrl, true);
> +		dp_aux_init(dp->aux);
> +		dp->core_initialized = true;

There are two cases that queries core_initialized, both of those are
done to avoid accessing the DP block without it first being powered up.
With the introduction of runtime PM, it seems reasonable to just power
up the block in those two code paths (and remove the variable).

> +	}
>  }
>  
>  static void dp_display_host_deinit(struct dp_display_private *dp)
> @@ -478,10 +483,12 @@ static void dp_display_host_deinit(struct dp_display_private *dp)
>  		dp->dp_display.connector_type, dp->core_initialized,
>  		dp->phy_initialized);
>  
> -	dp_ctrl_reset_irq_ctrl(dp->ctrl, false);
> -	dp_aux_deinit(dp->aux);
> -	dp_power_deinit(dp->power);
> -	dp->core_initialized = false;
> +	if (dp->core_initialized) {
> +		dp_ctrl_reset_irq_ctrl(dp->ctrl, false);
> +		dp_aux_deinit(dp->aux);
> +		dp_power_deinit(dp->power);
> +		dp->core_initialized = false;
> +	}
>  }
>  
>  static int dp_display_usbpd_configure_cb(struct device *dev)
> @@ -1304,6 +1311,39 @@ static int dp_display_remove(struct platform_device *pdev)
>  	dp_display_deinit_sub_modules(dp);
>  
>  	platform_set_drvdata(pdev, NULL);
> +	pm_runtime_put_sync_suspend(&pdev->dev);
> +
> +	return 0;
> +}
> +
> +static int dp_pm_runtime_suspend(struct device *dev)
> +{
> +	struct platform_device *pdev = to_platform_device(dev);
> +	struct msm_dp *dp_display = platform_get_drvdata(pdev);

platform_get_drvdata() is a wrapper for dev_get_drvdata(&pdev->dev), so
there's no need to resolve the platform_device first...

> +	struct dp_display_private *dp;
> +
> +	dp = container_of(dp_display, struct dp_display_private, dp_display);
> +
> +	dp_display_host_phy_exit(dp);
> +	dp_catalog_ctrl_hpd_enable(dp->catalog);
> +	dp_display_host_deinit(dp);
> +
> +	return 0;
> +}
> +
> +static int dp_pm_runtime_resume(struct device *dev)
> +{
> +	struct platform_device *pdev = to_platform_device(dev);
> +	struct msm_dp *dp_display = platform_get_drvdata(pdev);
> +	struct dp_display_private *dp;
> +
> +	dp = container_of(dp_display, struct dp_display_private, dp_display);
> +
> +	dp_display_host_init(dp);
> +	if (dp_display->is_edp) {
> +		dp_catalog_ctrl_hpd_enable(dp->catalog);
> +		dp_display_host_phy_init(dp);
> +	}
>  
>  	return 0;
>  }
> @@ -1409,6 +1449,7 @@ static int dp_pm_suspend(struct device *dev)
>  }
>  
>  static const struct dev_pm_ops dp_pm_ops = {
> +	SET_RUNTIME_PM_OPS(dp_pm_runtime_suspend, dp_pm_runtime_resume, NULL)
>  	.suspend = dp_pm_suspend,
>  	.resume =  dp_pm_resume,
>  };
> @@ -1493,10 +1534,6 @@ static int dp_display_get_next_bridge(struct msm_dp *dp)
>  	aux_bus = of_get_child_by_name(dev->of_node, "aux-bus");
>  
>  	if (aux_bus && dp->is_edp) {
> -		dp_display_host_init(dp_priv);
> -		dp_catalog_ctrl_hpd_enable(dp_priv->catalog);
> -		dp_display_host_phy_init(dp_priv);

I'm probably just missing it, but how do we get here with the host
powered up and the phy initialized?

> -
>  		/*
>  		 * The code below assumes that the panel will finish probing
>  		 * by the time devm_of_dp_aux_populate_ep_devices() returns.
> @@ -1604,6 +1641,7 @@ void dp_bridge_atomic_enable(struct drm_bridge *drm_bridge,
>  		dp_hpd_plug_handle(dp_display, 0);
>  
>  	mutex_lock(&dp_display->event_mutex);
> +	pm_runtime_get_sync(&dp_display->pdev->dev);
>  
>  	state = dp_display->hpd_state;
>  	if (state != ST_DISPLAY_OFF && state != ST_MAINLINK_READY) {
> @@ -1684,6 +1722,8 @@ void dp_bridge_atomic_post_disable(struct drm_bridge *drm_bridge,
>  	}
>  
>  	drm_dbg_dp(dp->drm_dev, "type=%d Done\n", dp->connector_type);
> +
> +	pm_runtime_put_sync(&dp_display->pdev->dev);
>  	mutex_unlock(&dp_display->event_mutex);
>  }
>  
> @@ -1723,6 +1763,8 @@ void dp_bridge_hpd_enable(struct drm_bridge *bridge)
>  	struct dp_display_private *dp = container_of(dp_display, struct dp_display_private, dp_display);
>  
>  	mutex_lock(&dp->event_mutex);
> +	pm_runtime_get_sync(&dp->pdev->dev);
> +
>  	dp_catalog_ctrl_hpd_enable(dp->catalog);
>  
>  	/* enable HDP interrupts */
> @@ -1744,6 +1786,9 @@ void dp_bridge_hpd_disable(struct drm_bridge *bridge)
>  	dp_catalog_ctrl_hpd_disable(dp->catalog);
>  
>  	dp_display->internal_hpd = false;
> +
> +	pm_runtime_mark_last_busy(&dp->pdev->dev);
> +	pm_runtime_put_autosuspend(&dp->pdev->dev);
>  	mutex_unlock(&dp->event_mutex);
>  }

The runtime_get/put in dp_bridge_hpd_enable() and disable matches my
expectations. But in the case that we have an external HPD source, where
will the power be turned on?

Note that you can test this on your device by routing the HPD GPIO to a
display-connector instance and wiring this to the DP node. In the same
way it's done here:

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/arm64/boot/dts/qcom/sa8295p-adp.dts#n28

Regards,
Bjorn

>  
> -- 
> 2.7.4
> 
