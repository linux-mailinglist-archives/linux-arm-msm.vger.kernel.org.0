Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 365954AD6EF
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Feb 2022 12:31:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1356672AbiBHLal (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 8 Feb 2022 06:30:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58176 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244947AbiBHKjK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 8 Feb 2022 05:39:10 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 63875C03FEC0;
        Tue,  8 Feb 2022 02:39:09 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 2F96FB81990;
        Tue,  8 Feb 2022 10:39:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F3ADC340ED;
        Tue,  8 Feb 2022 10:39:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1644316746;
        bh=DhYrhVV0rhkeYgs8i86fDL5i6IUbr00I2qxJJPVyviw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=hDHEA2k1rtgqThwWijxMFT+gR1N3I11PmBaK4CzVCM9QgSAyBycnB/xSLTnvwxRM7
         +PH+wQH8aI66O9q+KH+0GTVOao9THoISx2Q3lU8MlugrCLK5lQBkE+j52HuGsdxSSy
         5+Plqq3c09303KWWgOzFm6kX77XadIqVnsiKIh20=
Date:   Tue, 8 Feb 2022 11:39:04 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Jani Nikula <jani.nikula@linux.intel.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
        Rob Clark <robdclark@gmail.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Stephen Boyd <swboyd@chromium.org>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        intel-gfx@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH 1/2] drm: Add HPD state to
 drm_connector_oob_hotplug_event()
Message-ID: <YgJISIIacBnFyTLq@kroah.com>
References: <20220208044328.588860-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220208044328.588860-1-bjorn.andersson@linaro.org>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Feb 07, 2022 at 08:43:27PM -0800, Bjorn Andersson wrote:
> In some implementations, such as the Qualcomm platforms, the display
> driver has no way to query the current HPD state and as such it's
> impossible to distinguish between disconnect and attention events.
> 
> Add a parameter to drm_connector_oob_hotplug_event() to pass the HPD
> state.
> 
> Also push the test for unchanged state in the displayport altmode driver
> into the i915 driver, to allow other drivers to act upon each update.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
> 
> Note that the Intel driver has only been compile tested with this patch.
> 
>  drivers/gpu/drm/drm_connector.c          |  6 ++++--
>  drivers/gpu/drm/i915/display/intel_dp.c  | 14 +++++++++++---
>  drivers/gpu/drm/i915/i915_drv.h          |  3 +++
>  drivers/usb/typec/altmodes/displayport.c |  9 ++-------
>  include/drm/drm_connector.h              |  5 +++--
>  5 files changed, 23 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
> index a50c82bc2b2f..ad7295597c0f 100644
> --- a/drivers/gpu/drm/drm_connector.c
> +++ b/drivers/gpu/drm/drm_connector.c
> @@ -2825,6 +2825,7 @@ struct drm_connector *drm_connector_find_by_fwnode(struct fwnode_handle *fwnode)
>  /**
>   * drm_connector_oob_hotplug_event - Report out-of-band hotplug event to connector
>   * @connector_fwnode: fwnode_handle to report the event on
> + * @hpd_state: number of data lanes available

"number"?

>   *
>   * On some hardware a hotplug event notification may come from outside the display
>   * driver / device. An example of this is some USB Type-C setups where the hardware
> @@ -2834,7 +2835,8 @@ struct drm_connector *drm_connector_find_by_fwnode(struct fwnode_handle *fwnode)
>   * This function can be used to report these out-of-band events after obtaining
>   * a drm_connector reference through calling drm_connector_find_by_fwnode().
>   */
> -void drm_connector_oob_hotplug_event(struct fwnode_handle *connector_fwnode)
> +void drm_connector_oob_hotplug_event(struct fwnode_handle *connector_fwnode,
> +				     bool hpd_state)

This is a boolean, how can it be a number?

And having a "flag" like this is a pain, how do you know what the
parameter really means?

>  {
>  	struct drm_connector *connector;
>  
> @@ -2843,7 +2845,7 @@ void drm_connector_oob_hotplug_event(struct fwnode_handle *connector_fwnode)
>  		return;
>  
>  	if (connector->funcs->oob_hotplug_event)
> -		connector->funcs->oob_hotplug_event(connector);
> +		connector->funcs->oob_hotplug_event(connector, hpd_state);
>  
>  	drm_connector_put(connector);
>  }
> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
> index 146b83916005..00520867d37b 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> @@ -4816,15 +4816,23 @@ static int intel_dp_connector_atomic_check(struct drm_connector *conn,
>  	return intel_modeset_synced_crtcs(state, conn);
>  }
>  
> -static void intel_dp_oob_hotplug_event(struct drm_connector *connector)
> +static void intel_dp_oob_hotplug_event(struct drm_connector *connector, bool hpd_state)
>  {
>  	struct intel_encoder *encoder = intel_attached_encoder(to_intel_connector(connector));
>  	struct drm_i915_private *i915 = to_i915(connector->dev);
> +	bool need_work = false;
>  
>  	spin_lock_irq(&i915->irq_lock);
> -	i915->hotplug.event_bits |= BIT(encoder->hpd_pin);
> +	if (hpd_state != i915->hotplug.oob_hotplug_state) {
> +		i915->hotplug.event_bits |= BIT(encoder->hpd_pin);
> +
> +		i915->hotplug.oob_hotplug_state = hpd_state;
> +		need_work = true;
> +	}
>  	spin_unlock_irq(&i915->irq_lock);
> -	queue_delayed_work(system_wq, &i915->hotplug.hotplug_work, 0);
> +
> +	if (need_work)
> +		queue_delayed_work(system_wq, &i915->hotplug.hotplug_work, 0);
>  }
>  
>  static const struct drm_connector_funcs intel_dp_connector_funcs = {
> diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
> index 8c1706fd81f9..543ebf1cfcf4 100644
> --- a/drivers/gpu/drm/i915/i915_drv.h
> +++ b/drivers/gpu/drm/i915/i915_drv.h
> @@ -149,6 +149,9 @@ struct i915_hotplug {
>  	/* Whether or not to count short HPD IRQs in HPD storms */
>  	u8 hpd_short_storm_enabled;
>  
> +	/* Last state reported by oob_hotplug_event */
> +	bool oob_hotplug_state;
> +
>  	/*
>  	 * if we get a HPD irq from DP and a HPD irq from non-DP
>  	 * the non-DP HPD could block the workqueue on a mode config
> diff --git a/drivers/usb/typec/altmodes/displayport.c b/drivers/usb/typec/altmodes/displayport.c
> index c1d8c23baa39..a4596be4d34a 100644
> --- a/drivers/usb/typec/altmodes/displayport.c
> +++ b/drivers/usb/typec/altmodes/displayport.c
> @@ -59,7 +59,6 @@ struct dp_altmode {
>  	struct typec_displayport_data data;
>  
>  	enum dp_state state;
> -	bool hpd;
>  
>  	struct mutex lock; /* device lock */
>  	struct work_struct work;
> @@ -143,10 +142,7 @@ static int dp_altmode_status_update(struct dp_altmode *dp)
>  		if (!ret)
>  			dp->state = DP_STATE_CONFIGURE;
>  	} else {
> -		if (dp->hpd != hpd) {
> -			drm_connector_oob_hotplug_event(dp->connector_fwnode);
> -			dp->hpd = hpd;
> -		}
> +		drm_connector_oob_hotplug_event(dp->connector_fwnode, hpd);
>  	}
>  
>  	return ret;
> @@ -573,8 +569,7 @@ void dp_altmode_remove(struct typec_altmode *alt)
>  	cancel_work_sync(&dp->work);
>  
>  	if (dp->connector_fwnode) {
> -		if (dp->hpd)
> -			drm_connector_oob_hotplug_event(dp->connector_fwnode);
> +		drm_connector_oob_hotplug_event(dp->connector_fwnode, false);

See, what does "false" here mean?

Name the function for what it does, do not have random flags as
parameters, that makes it impossible to understand what the code is
doing when you are reading it, without having to jump around and figure
out what the flags are saying.

And here they just don't even seem to be right :(

thanks,

greg k-h
