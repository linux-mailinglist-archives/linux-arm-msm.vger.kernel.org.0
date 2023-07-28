Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B8EA7767637
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Jul 2023 21:20:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233262AbjG1TUy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 28 Jul 2023 15:20:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43856 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229622AbjG1TUt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 28 Jul 2023 15:20:49 -0400
X-Greylist: delayed 1500 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Fri, 28 Jul 2023 12:20:48 PDT
Received: from soltyk.jannau.net (soltyk.jannau.net [144.76.91.90])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E74901FFA;
        Fri, 28 Jul 2023 12:20:47 -0700 (PDT)
Received: by soltyk.jannau.net (Postfix, from userid 1000)
        id EBA2B2701FE; Fri, 28 Jul 2023 20:31:35 +0200 (CEST)
Date:   Fri, 28 Jul 2023 20:31:35 +0200
From:   Janne Grunau <j@jannau.net>
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
Subject: Re: [PATCH v6 2/3] drm/bridge_connector: stop filtering events in
 drm_bridge_connector_hpd_cb()
Message-ID: <ZMQJh6BIM2mQ9fCo@jannau.net>
References: <20230709202511.287794-1-dmitry.baryshkov@linaro.org>
 <20230709202511.287794-3-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230709202511.287794-3-dmitry.baryshkov@linaro.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2023-07-09 23:25:10 +0300, Dmitry Baryshkov wrote:
> In some cases the bridge drivers would like to receive hotplug events
> even in the case new status is equal to the old status. In the DP case
> this is used to deliver "attention" messages to the DP host. Stop
> filtering the events in the drm_bridge_connector_hpd_cb() and let
> drivers decide whether they would like to receive the event or not.

Worth mentioning in the commit message that all current bridges which 
set .hpd_notify appear to be safe w.r.t multiple calls with the same 
status. meson_encoder_hdmi.c will do unnecessary work when called 
repeatedly with status connected. Not sure if it is worth adressing 
since I don't expect multiple calls with connector_status_connected to 
occur for this particular bridge.

Reviewed-By: Janne Grunau <j@jannau.net>

> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/gpu/drm/drm_bridge_connector.c | 5 -----
>  1 file changed, 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_bridge_connector.c b/drivers/gpu/drm/drm_bridge_connector.c
> index 19ae4a177ac3..84d8d310ef04 100644
> --- a/drivers/gpu/drm/drm_bridge_connector.c
> +++ b/drivers/gpu/drm/drm_bridge_connector.c
> @@ -113,16 +113,11 @@ static void drm_bridge_connector_hpd_cb(void *cb_data,
>  	struct drm_bridge_connector *drm_bridge_connector = cb_data;
>  	struct drm_connector *connector = &drm_bridge_connector->base;
>  	struct drm_device *dev = connector->dev;
> -	enum drm_connector_status old_status;
>  
>  	mutex_lock(&dev->mode_config.mutex);
> -	old_status = connector->status;
>  	connector->status = status;
>  	mutex_unlock(&dev->mode_config.mutex);
>  
> -	if (old_status == status)
> -		return;
> -
>  	drm_bridge_connector_hpd_notify(connector, status);
>  
>  	drm_kms_helper_hotplug_event(dev);
> -- 
> 2.39.2
> 
