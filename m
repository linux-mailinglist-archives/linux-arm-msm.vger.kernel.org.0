Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DB171767685
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Jul 2023 21:44:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229511AbjG1ToF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 28 Jul 2023 15:44:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55020 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234612AbjG1ToF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 28 Jul 2023 15:44:05 -0400
Received: from soltyk.jannau.net (soltyk.jannau.net [144.76.91.90])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DFCA53AB1;
        Fri, 28 Jul 2023 12:44:03 -0700 (PDT)
Received: by soltyk.jannau.net (Postfix, from userid 1000)
        id 539692701FE; Fri, 28 Jul 2023 21:44:02 +0200 (CEST)
Date:   Fri, 28 Jul 2023 21:44:02 +0200
From:   Janne Grunau <janne@jannau.net>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Ville =?iso-8859-1?Q?Syrj=E4l=E4?= 
        <ville.syrjala@linux.intel.com>, freedreno@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <andersson@kernel.org>,
        linux-usb@vger.kernel.org,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        dri-devel@lists.freedesktop.org, Sean Paul <sean@poorly.run>,
        intel-gfx@lists.freedesktop.org
Subject: Re: [PATCH v6 3/3] drm/bridge_connector: implement oob_hotplug_event
Message-ID: <ZMQaguWtUjYMxw7l@jannau.net>
References: <20230709202511.287794-1-dmitry.baryshkov@linaro.org>
 <20230709202511.287794-4-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230709202511.287794-4-dmitry.baryshkov@linaro.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2023-07-09 23:25:11 +0300, Dmitry Baryshkov wrote:
> Implement the oob_hotplug_event() callback. Translate it to the HPD
> notification sent to the HPD bridge in the chain.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Reviewed-by: Janne Grunau <j@jannau.net>
> ---
>  drivers/gpu/drm/drm_bridge_connector.c | 29 +++++++++++++++++++++++---
>  1 file changed, 26 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_bridge_connector.c b/drivers/gpu/drm/drm_bridge_connector.c
> index 84d8d310ef04..364f6e37fbdc 100644
> --- a/drivers/gpu/drm/drm_bridge_connector.c
> +++ b/drivers/gpu/drm/drm_bridge_connector.c
> @@ -5,6 +5,8 @@
>  
>  #include <linux/kernel.h>
>  #include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/property.h>
>  #include <linux/slab.h>
>  
>  #include <drm/drm_atomic_state_helper.h>
> @@ -107,10 +109,9 @@ static void drm_bridge_connector_hpd_notify(struct drm_connector *connector,
>  	}
>  }
>  
> -static void drm_bridge_connector_hpd_cb(void *cb_data,
> -					enum drm_connector_status status)
> +static void drm_bridge_connector_handle_hpd(struct drm_bridge_connector *drm_bridge_connector,
> +					    enum drm_connector_status status)
>  {
> -	struct drm_bridge_connector *drm_bridge_connector = cb_data;
>  	struct drm_connector *connector = &drm_bridge_connector->base;
>  	struct drm_device *dev = connector->dev;
>  
> @@ -123,6 +124,21 @@ static void drm_bridge_connector_hpd_cb(void *cb_data,
>  	drm_kms_helper_hotplug_event(dev);
>  }
>  
> +static void drm_bridge_connector_hpd_cb(void *cb_data,
> +					enum drm_connector_status status)
> +{
> +	drm_bridge_connector_handle_hpd(cb_data, status);
> +}
> +
> +static void drm_bridge_connector_oob_hotplug_event(struct drm_connector *connector,
> +						   enum drm_connector_status status)
> +{
> +	struct drm_bridge_connector *bridge_connector =
> +		to_drm_bridge_connector(connector);
> +
> +	drm_bridge_connector_handle_hpd(bridge_connector, status);
> +}
> +
>  static void drm_bridge_connector_enable_hpd(struct drm_connector *connector)
>  {
>  	struct drm_bridge_connector *bridge_connector =
> @@ -216,6 +232,7 @@ static const struct drm_connector_funcs drm_bridge_connector_funcs = {
>  	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
>  	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
>  	.debugfs_init = drm_bridge_connector_debugfs_init,
> +	.oob_hotplug_event = drm_bridge_connector_oob_hotplug_event,
>  };
>  
>  /* -----------------------------------------------------------------------------
> @@ -351,6 +368,12 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
>  		if (!drm_bridge_get_next_bridge(bridge))
>  			connector_type = bridge->type;
>  
> +#ifdef CONFIG_OF
> +		if (!drm_bridge_get_next_bridge(bridge) &&
> +		    bridge->of_node)
> +			connector->fwnode = fwnode_handle_get(of_fwnode_handle(bridge->of_node));
> +#endif
> +
>  		if (bridge->ddc)
>  			ddc = bridge->ddc;
>  
> -- 
> 2.39.2
> 
