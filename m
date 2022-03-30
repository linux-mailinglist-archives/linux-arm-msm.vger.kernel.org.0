Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7419E4ECFF5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 31 Mar 2022 01:19:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351795AbiC3XV1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 30 Mar 2022 19:21:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43030 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351785AbiC3XV0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 30 Mar 2022 19:21:26 -0400
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3295226CA
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Mar 2022 16:19:40 -0700 (PDT)
Received: by mail-lj1-x232.google.com with SMTP id 17so29744960ljw.8
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Mar 2022 16:19:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=82kg8GbNLPihbHIwxajwTG3ST8umrp72ZCIO25BlT5A=;
        b=Y+FQboVOiXmkTsvhvvYkuFC2krtAm17JNktS6LMvrbGFmIjnF9FhROgrNP4HT0Z6a7
         tDV3h6Thx7KxbnlA2Vf9PHnnwc6zXF5PMLRYkgvRvJY8PU9062n9Ad4kWGVfReX6PJ0I
         lid9AcH+zgVV7GzoWU5zj5wt2s6556Sl4PXii3YYu//72PUYDUiqtXVoBTaij2fHMhtD
         5hTonqmUT34YPxRMSUYZefHKdWM7HL7QrfcuRJzc3wAYVe2Lou/iFfx0Kw+amTGER4yu
         dnx/ogJxDGctU0oQ9b1JIYWfkZybLWEUeKmMHKyf0VGqbsBV5FkCVHaw5r8Bu+VzaUcn
         xpug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=82kg8GbNLPihbHIwxajwTG3ST8umrp72ZCIO25BlT5A=;
        b=5O8kE6pOX5chVtSapYabIHmImuo72FnTOqKXB0TeEqAEpbvKtssRc7ivFfu2i+n3jH
         Ws4EjT6R/ggT3K8jGWQlLb6J7xbYFOIUjrUXKL/cc2uo1zeDB5gREaPZHYg9ju4z/2ZO
         MQGW25OZnrlGx4naumniXdR/GD7hEN7eJ6LKAnm4PF5sqnulw2IUt4ckJmFzKlGJyC3n
         ljF6iYwlue2oD97zDUKTcG+ZFlPLZoDtWxSNzW7KltG6eB1LEC4fCvjV3jZdTQsgXYIo
         ampGtcjCZD7M/61nKqDGJ0YQjRKVwRTOtxAm/sMYaiHK42YvgPirfehGgvMRletwh+9x
         NNjw==
X-Gm-Message-State: AOAM530/Q3G4YWR/DKpjBsALXxWHiB4HzrEiYOWJ763jZ1g83Uqn2UlL
        lbgm5Vp6gwe6q1EvOVj6m7oO/Q==
X-Google-Smtp-Source: ABdhPJz9b1Ia01LKBTk0IwXpo0Sqca1x7f+N+dd6d7ZxvLVgu9JSBmfAQMV51DSaL8GjNTGi7kMobw==
X-Received: by 2002:a2e:a548:0:b0:249:917e:bcaf with SMTP id e8-20020a2ea548000000b00249917ebcafmr8554362ljn.237.1648682378428;
        Wed, 30 Mar 2022 16:19:38 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id p24-20020a2e9ad8000000b0024af9bfce6asm9042ljj.30.2022.03.30.16.19.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Mar 2022 16:19:38 -0700 (PDT)
Message-ID: <daec6ea4-abb1-05e6-ad49-b0a418a1f43e@linaro.org>
Date:   Thu, 31 Mar 2022 02:19:37 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v6 1/8] drm/msm/dp: Add eDP support via aux_bus
Content-Language: en-GB
To:     Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
        dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Cc:     robdclark@gmail.com, seanpaul@chromium.org, swboyd@chromium.org,
        quic_kalyant@quicinc.com, quic_abhinavk@quicinc.com,
        dianders@chromium.org, quic_khsieh@quicinc.com,
        bjorn.andersson@linaro.org, sean@poorly.run, airlied@linux.ie,
        daniel@ffwll.ch, quic_vproddut@quicinc.com,
        quic_aravindh@quicinc.com
References: <1648656179-10347-1-git-send-email-quic_sbillaka@quicinc.com>
 <1648656179-10347-2-git-send-email-quic_sbillaka@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <1648656179-10347-2-git-send-email-quic_sbillaka@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 30/03/2022 19:02, Sankeerth Billakanti wrote:
> This patch adds support for generic eDP sink through aux_bus. The eDP/DP
> controller driver should support aux transactions originating from the
> panel-edp driver and hence should be initialized and ready.
> 
> The panel bridge supporting the panel should be ready before the bridge
> connector is initialized. The generic panel probe needs the controller
> resources to be enabled to support the aux transactions originating from
> the panel probe.
> 
> Signed-off-by: Sankeerth Billakanti <quic_sbillaka@quicinc.com>
> ---
> 
> Changes in v6:
>    - Remove initialization
>    - Fix aux_bus node leak
>    - Split the patches
> 
>   drivers/gpu/drm/msm/dp/dp_display.c | 54 +++++++++++++++++++++++++++++++++++--
>   drivers/gpu/drm/msm/dp/dp_drm.c     | 10 ++++---
>   drivers/gpu/drm/msm/dp/dp_parser.c  | 21 +--------------
>   drivers/gpu/drm/msm/dp/dp_parser.h  |  1 +
>   4 files changed, 60 insertions(+), 26 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index 382b3aa..e082d02 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -10,6 +10,7 @@
>   #include <linux/component.h>
>   #include <linux/of_irq.h>
>   #include <linux/delay.h>
> +#include <drm/dp/drm_dp_aux_bus.h>
>   
>   #include "msm_drv.h"
>   #include "msm_kms.h"
> @@ -265,8 +266,6 @@ static int dp_display_bind(struct device *dev, struct device *master,
>   		goto end;
>   	}
>   
> -	dp->dp_display.next_bridge = dp->parser->next_bridge;
> -
>   	dp->aux->drm_dev = drm;
>   	rc = dp_aux_register(dp->aux);
>   	if (rc) {
> @@ -1524,6 +1523,53 @@ void msm_dp_debugfs_init(struct msm_dp *dp_display, struct drm_minor *minor)
>   	}
>   }
>   
> +static int dp_display_get_next_bridge(struct msm_dp *dp)
> +{
> +	int rc;
> +	struct dp_display_private *dp_priv;
> +	struct device_node *aux_bus;
> +	struct device *dev;
> +
> +	dp_priv = container_of(dp, struct dp_display_private, dp_display);
> +	dev = &dp_priv->pdev->dev;
> +	aux_bus = of_get_child_by_name(dev->of_node, "aux-bus");
> +
> +	if (aux_bus) {
> +		dp_display_host_init(dp_priv);
> +		dp_catalog_ctrl_hpd_config(dp_priv->catalog);
> +		enable_irq(dp_priv->irq);
> +		dp_display_host_phy_init(dp_priv);
> +
> +		devm_of_dp_aux_populate_ep_devices(dp_priv->aux);
> +
> +		disable_irq(dp_priv->irq);
> +		of_node_put(aux_bus);
> +	}
> +
> +	/*
> +	 * External bridges are mandatory for eDP interfaces: one has to
> +	 * provide at least an eDP panel (which gets wrapped into panel-bridge).
> +	 *
> +	 * For DisplayPort interfaces external bridges are optional, so
> +	 * silently ignore an error if one is not present (-ENODEV).
> +	 */
> +	rc = dp_parser_find_next_bridge(dp_priv->parser);
> +	if (rc == -ENODEV) {
> +		if (dp->connector_type == DRM_MODE_CONNECTOR_eDP) {

The more I think about these conditions, the closer I dislike them (yes, 
I added this one in one of the patches). I'd suggest to change 
dp->connector_type to boolean 'is_edp' field use it in all conditions 
instead.

> +			DRM_ERROR("eDP: next bridge is not present\n");
> +			return rc;
> +		}
> +	} else if (rc) {
> +		if (rc != -EPROBE_DEFER)
> +			DRM_ERROR("DP: error parsing next bridge: %d\n", rc);
> +		return rc;
> +	}
> +
> +	dp->next_bridge = dp_priv->parser->next_bridge;
> +
> +	return 0;
> +}
> +
>   int msm_dp_modeset_init(struct msm_dp *dp_display, struct drm_device *dev,
>   			struct drm_encoder *encoder)
>   {
> @@ -1547,6 +1593,10 @@ int msm_dp_modeset_init(struct msm_dp *dp_display, struct drm_device *dev,
>   
>   	dp_display->encoder = encoder;
>   
> +	ret = dp_display_get_next_bridge(dp_display);
> +	if (ret)
> +		return ret;
> +
>   	dp_display->bridge = dp_bridge_init(dp_display, dev, encoder);
>   	if (IS_ERR(dp_display->bridge)) {
>   		ret = PTR_ERR(dp_display->bridge);
> diff --git a/drivers/gpu/drm/msm/dp/dp_drm.c b/drivers/gpu/drm/msm/dp/dp_drm.c
> index 7ce1aca..5254bd6 100644
> --- a/drivers/gpu/drm/msm/dp/dp_drm.c
> +++ b/drivers/gpu/drm/msm/dp/dp_drm.c
> @@ -114,10 +114,12 @@ struct drm_bridge *dp_bridge_init(struct msm_dp *dp_display, struct drm_device *
>   	bridge->funcs = &dp_bridge_ops;
>   	bridge->type = dp_display->connector_type;
>   
> -	bridge->ops =
> -		DRM_BRIDGE_OP_DETECT |
> -		DRM_BRIDGE_OP_HPD |
> -		DRM_BRIDGE_OP_MODES;
> +	if (bridge->type == DRM_MODE_CONNECTOR_DisplayPort) {

And in this case we can also check dp_display->connector_type (or the 
suggested dp_display->is_edp) for the uniformity of the code.

> +		bridge->ops =
> +			DRM_BRIDGE_OP_DETECT |
> +			DRM_BRIDGE_OP_HPD |
> +			DRM_BRIDGE_OP_MODES;

I think OP_MODES should be used for eDP, shouldn't it?

> +	}
>   
>   	rc = drm_bridge_attach(encoder, bridge, NULL, DRM_BRIDGE_ATTACH_NO_CONNECTOR);
>   	if (rc) {
> diff --git a/drivers/gpu/drm/msm/dp/dp_parser.c b/drivers/gpu/drm/msm/dp/dp_parser.c
> index 1056b8d..6317dce 100644
> --- a/drivers/gpu/drm/msm/dp/dp_parser.c
> +++ b/drivers/gpu/drm/msm/dp/dp_parser.c
> @@ -265,7 +265,7 @@ static int dp_parser_clock(struct dp_parser *parser)
>   	return 0;
>   }
>   
> -static int dp_parser_find_next_bridge(struct dp_parser *parser)
> +int dp_parser_find_next_bridge(struct dp_parser *parser)
>   {
>   	struct device *dev = &parser->pdev->dev;
>   	struct drm_bridge *bridge;
> @@ -300,25 +300,6 @@ static int dp_parser_parse(struct dp_parser *parser, int connector_type)
>   	if (rc)
>   		return rc;
>   
> -	/*
> -	 * External bridges are mandatory for eDP interfaces: one has to
> -	 * provide at least an eDP panel (which gets wrapped into panel-bridge).
> -	 *
> -	 * For DisplayPort interfaces external bridges are optional, so
> -	 * silently ignore an error if one is not present (-ENODEV).
> -	 */
> -	rc = dp_parser_find_next_bridge(parser);
> -	if (rc == -ENODEV) {
> -		if (connector_type == DRM_MODE_CONNECTOR_eDP) {
> -			DRM_ERROR("eDP: next bridge is not present\n");
> -			return rc;
> -		}
> -	} else if (rc) {
> -		if (rc != -EPROBE_DEFER)
> -			DRM_ERROR("DP: error parsing next bridge: %d\n", rc);
> -		return rc;
> -	}
> -
>   	/* Map the corresponding regulator information according to
>   	 * version. Currently, since we only have one supported platform,
>   	 * mapping the regulator directly.
> diff --git a/drivers/gpu/drm/msm/dp/dp_parser.h b/drivers/gpu/drm/msm/dp/dp_parser.h
> index d371bae..091ff41 100644
> --- a/drivers/gpu/drm/msm/dp/dp_parser.h
> +++ b/drivers/gpu/drm/msm/dp/dp_parser.h
> @@ -140,5 +140,6 @@ struct dp_parser {
>    * can be parsed using this module.
>    */
>   struct dp_parser *dp_parser_get(struct platform_device *pdev);
> +int dp_parser_find_next_bridge(struct dp_parser *parser);
>   
>   #endif


-- 
With best wishes
Dmitry
