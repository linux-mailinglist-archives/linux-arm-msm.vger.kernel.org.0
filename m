Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D5B9F33A160
	for <lists+linux-arm-msm@lfdr.de>; Sat, 13 Mar 2021 22:18:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234331AbhCMVRy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 13 Mar 2021 16:17:54 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:43940 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234182AbhCMVRU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 13 Mar 2021 16:17:20 -0500
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 784EE3F0;
        Sat, 13 Mar 2021 22:17:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1615670238;
        bh=txq0PrnVLkf3oRFtfpvV1m1PHQCD5HFy5+0K2gwVS0w=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Zwe2g86q+hGtqUKO3vkz7lSmbWIaK/pdXTakImcPSDjkdEJ5gUKHdVkQejVId17A8
         xcNjzGF/FsY5t1gh/BFMeDmixcxc8PUQudRONlx+DObZIDA8autPjvPf+gsXHV6eF5
         /R0mUkEB3Bp3U+i0HzbPc0mNfTBz0iEFX+PugCJg=
Date:   Sat, 13 Mar 2021 23:16:43 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Douglas Anderson <dianders@chromium.org>
Cc:     Andrzej Hajda <a.hajda@samsung.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Sam Ravnborg <sam@ravnborg.org>,
        Stephen Boyd <swboyd@chromium.org>,
        linux-arm-msm@vger.kernel.org, robdclark@chromium.org,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] drm/bridge: ti-sn65dsi86: Properly get the EDID, but
 only if refclk
Message-ID: <YE0ru4JpXfX/4Awe@pendragon.ideasonboard.com>
References: <20210304155144.1.Ic9c04f960190faad5290738b2a35d73661862735@changeid>
 <20210304155144.3.I60a7fb23ce4589006bc95c64ab8d15c74b876e68@changeid>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210304155144.3.I60a7fb23ce4589006bc95c64ab8d15c74b876e68@changeid>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Doug,

Thank you for the patch.

On Thu, Mar 04, 2021 at 03:52:01PM -0800, Douglas Anderson wrote:
> In commit 58074b08c04a ("drm/bridge: ti-sn65dsi86: Read EDID blob over
> DDC") we attempted to make the ti-sn65dsi86 bridge properly read the
> EDID from the panel. That commit kinda worked but it had some serious
> problems.
> 
> The problems all stem from the fact that userspace wants to be able to
> read the EDID before it explicitly enables the panel. For eDP panels,
> though, we don't actually power the panel up until the pre-enable
> stage and the pre-enable call happens right before the enable call
> with no way to interject in-between. For eDP panels, you can't read
> the EDID until you power the panel. The result was that
> ti_sn_bridge_connector_get_modes() was always failing to read the EDID
> (falling back to what drm_panel_get_modes() returned) until _after_
> the EDID was needed.
> 
> To make it concrete, on my system I saw this happen:
> 1. We'd attach the bridge.
> 2. Userspace would ask for the EDID (several times). We'd try but fail
>    to read the EDID over and over again and fall back to the hardcoded
>    modes.
> 3. Userspace would decide on a mode based only on the hardcoded modes.
> 4. Userspace would ask to turn the panel on.
> 5. Userspace would (eventually) check the modes again (in Chrome OS
>    this happens on the handoff from the boot splash screen to the
>    browser). Now we'd read them properly and, if they were different,
>    userspace would request to change the mode.
> 
> The fact that userspace would always end up using the hardcoded modes
> at first significantly decreases the benefit of the EDID
> reading. Also: if the modes were even a tiny bit different we'd end up
> doing a wasteful modeset and at boot.

s/and at/at/ ?

> As a side note: at least early EDID read failures were relatively
> fast. Though the old ti_sn_bridge_connector_get_modes() did call
> pm_runtime_get_sync() it didn't program the important "HPD_DISABLE"
> bit. That meant that all the AUX transfers failed pretty quickly.
> 
> In any case, enough about the problem. How are we fixing it? Obviously
> we need to power the panel on _before_ reading the EDID, but how? It
> turns out that there's really no problem with just doing all the work
> of our pre_enable() function right at attach time and reading the EDID
> right away. We'll do that. It's not as easy as it sounds, though,
> because:
> 
> 1. Powering the panel up and down is a pretty expensive operation. Not
>    only do we need to wait for the HPD line which seems to take up to
>    200 ms on most panels, but also most panels say that once you power
>    them off you need to wait at least 500 ms before powering them on
>    again. We really don't want to incur 700 ms of time here.
> 
> 2. If we happen not to have a fixed "refclk" we've got a
>    chicken-and-egg problem. We seem to need the clock setup to read
>    the EDID. Without a fixed "refclk", though, the bridge runs with
>    the MIPI pixel clock which means you've got to use a hardcoded mode
>    for the MIPI pixel clock.
> 
> We'll solve problem #1 above by leaving the panel powered on for a
> little while after we read the EDID. If enough time passes and nobody
> turns the panel on then we'll undo our work. NOTE: there are no
> functional problems if someone turns the panel on after a long delay,
> it just might take a little longer to turn on.
> 
> We'll solve problem #2 by simply _always_ using a hardcoded mode (not
> reading the EDID) if a "refclk" wasn't provided. While it might be
> possible to fudge something together to support this, it's my belief
> that nobody is using this mode in real life since it's really
> inflexible. I saw it used for some really early prototype hardware
> that was thrown in the e-waste bin years ago when we realized how
> inflexible it was. In any case, if someone is using this they're in no
> worse shape than they were before the (fairly recent) commit
> 58074b08c04a ("drm/bridge: ti-sn65dsi86: Read EDID blob over DDC").
> 
> NOTE: while this patch feels a bit hackish, I'm not sure there's much
> we can do better without a more fundamental DRM API change. After
> looking at it a bunch, it also doesn't feel as hacky to me as I first
> thought. The things that pre-enable does are well defined and well
> understood and there should be no problems with doing them early nor
> with doing them before userspace requests anything.
> 
> Fixes: 58074b08c04a ("drm/bridge: ti-sn65dsi86: Read EDID blob over DDC")
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
> 
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 98 ++++++++++++++++++++++++---
>  1 file changed, 88 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> index 491c9c4f32d1..af3fb4657af6 100644
> --- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> +++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> @@ -16,6 +16,7 @@
>  #include <linux/pm_runtime.h>
>  #include <linux/regmap.h>
>  #include <linux/regulator/consumer.h>
> +#include <linux/workqueue.h>
>  
>  #include <asm/unaligned.h>
>  
> @@ -130,6 +131,12 @@
>   * @ln_assign:    Value to program to the LN_ASSIGN register.
>   * @ln_polrs:     Value for the 4-bit LN_POLRS field of SN_ENH_FRAME_REG.
>   *
> + * @pre_enabled_early: If true we did an early pre_enable at attach.
> + * @pre_enable_timeout_work: Delayed work to undo the pre_enable from attach
> + *                           if a normal pre_enable never came.

Could we simplify this by using the runtime PM autosuspend feature ? The
configuration of the bridge would be moved from pre_enable to the PM
runtime resume handler, the clk_disable_unprepare() call moved from
post_disable to the runtime suspend handler, and the work queue replaced
by usage of pm_runtime_put_autosuspend().

> + * @pre_enable_mutex: Lock to synchronize between the pre_enable_timeout_work
> + *                    and normal mechanisms.
> + *
>   * @gchip:        If we expose our GPIOs, this is used.
>   * @gchip_output: A cache of whether we've set GPIOs to output.  This
>   *                serves double-duty of keeping track of the direction and
> @@ -158,6 +165,10 @@ struct ti_sn_bridge {
>  	u8				ln_assign;
>  	u8				ln_polrs;
>  
> +	bool				pre_enabled_early;
> +	struct delayed_work		pre_enable_timeout_work;
> +	struct mutex			pre_enable_mutex;
> +
>  #if defined(CONFIG_OF_GPIO)
>  	struct gpio_chip		gchip;
>  	DECLARE_BITMAP(gchip_output, SN_NUM_GPIOS);
> @@ -272,12 +283,6 @@ static int ti_sn_bridge_connector_get_modes(struct drm_connector *connector)
>  	struct edid *edid = pdata->edid;
>  	int num, ret;
>  
> -	if (!edid) {
> -		pm_runtime_get_sync(pdata->dev);
> -		edid = pdata->edid = drm_get_edid(connector, &pdata->aux.ddc);
> -		pm_runtime_put(pdata->dev);
> -	}
> -
>  	if (edid && drm_edid_is_valid(edid)) {
>  		ret = drm_connector_update_edid_property(connector, edid);
>  		if (!ret) {
> @@ -412,10 +417,8 @@ static void ti_sn_bridge_post_disable(struct drm_bridge *bridge)
>  	pm_runtime_put_sync(pdata->dev);
>  }
>  
> -static void ti_sn_bridge_pre_enable(struct drm_bridge *bridge)
> +static void __ti_sn_bridge_pre_enable(struct ti_sn_bridge *pdata)
>  {
> -	struct ti_sn_bridge *pdata = bridge_to_ti_sn_bridge(bridge);
> -
>  	pm_runtime_get_sync(pdata->dev);
>  
>  	/* configure bridge ref_clk */
> @@ -443,6 +446,38 @@ static void ti_sn_bridge_pre_enable(struct drm_bridge *bridge)
>  	drm_panel_prepare(pdata->panel);
>  }
>  
> +static void ti_sn_bridge_pre_enable(struct drm_bridge *bridge)
> +{
> +	struct ti_sn_bridge *pdata = bridge_to_ti_sn_bridge(bridge);
> +
> +	mutex_lock(&pdata->pre_enable_mutex);
> +	if (pdata->pre_enabled_early)
> +		/* Already done! Just mark that normal pre_enable happened */
> +		pdata->pre_enabled_early = false;
> +	else
> +		__ti_sn_bridge_pre_enable(pdata);
> +	mutex_unlock(&pdata->pre_enable_mutex);
> +}
> +
> +static void ti_sn_bridge_cancel_early_pre_enable(struct ti_sn_bridge *pdata)
> +{
> +	mutex_lock(&pdata->pre_enable_mutex);
> +	if (pdata->pre_enabled_early) {
> +		pdata->pre_enabled_early = false;
> +		ti_sn_bridge_post_disable(&pdata->bridge);
> +	}
> +	mutex_unlock(&pdata->pre_enable_mutex);
> +}
> +
> +static void ti_sn_bridge_pre_enable_timeout(struct work_struct *work)
> +{
> +	struct delayed_work *dwork = to_delayed_work(work);
> +	struct ti_sn_bridge *pdata = container_of(dwork, struct ti_sn_bridge,
> +						  pre_enable_timeout_work);
> +
> +	ti_sn_bridge_cancel_early_pre_enable(pdata);
> +}
> +
>  static int ti_sn_bridge_attach(struct drm_bridge *bridge,
>  			       enum drm_bridge_attach_flags flags)
>  {
> @@ -516,6 +551,34 @@ static int ti_sn_bridge_attach(struct drm_bridge *bridge,
>  	}
>  	pdata->dsi = dsi;
>  
> +	/*
> +	 * If we have a refclk then we can support dynamic EDID.
> +	 *
> +	 * A few notes:
> +	 * - From trial and error it appears that we need our clock setup in
> +	 *   order to read the EDID. If we don't have refclk then we
> +	 *   (presumably) need the MIPI clock on, but turning that on implies
> +	 *   knowing the pixel clock / not needing the EDID. Maybe we could
> +	 *   futz this if necessary, but for now we won't.
> +	 * - In order to read the EDID we need power on to the bridge and
> +	 *   the panel (and it has to finish booting up / assert HPD). This
> +	 *   is slow so we leave the panel powered when we're done but setup a
> +	 *   timeout so we don't leave it on forever.
> +	 * - The rest of Linux assumes that it can read the EDID without
> +	 *   (explicitly) enabling the power which is why this somewhat awkward
> +	 *   step is needed.
> +	 */
> +	if (pdata->refclk) {
> +		mutex_lock(&pdata->pre_enable_mutex);
> +
> +		pdata->pre_enabled_early = true;
> +		__ti_sn_bridge_pre_enable(pdata);
> +		pdata->edid = drm_get_edid(&pdata->connector, &pdata->aux.ddc);
> +		schedule_delayed_work(&pdata->pre_enable_timeout_work, 30 * HZ);
> +
> +		mutex_unlock(&pdata->pre_enable_mutex);
> +	}
> +
>  	return 0;
>  
>  err_dsi_attach:
> @@ -525,6 +588,17 @@ static int ti_sn_bridge_attach(struct drm_bridge *bridge,
>  	return ret;
>  }
>  
> +static void ti_sn_bridge_detach(struct drm_bridge *bridge)
> +{
> +	struct ti_sn_bridge *pdata = bridge_to_ti_sn_bridge(bridge);
> +
> +	cancel_delayed_work_sync(&pdata->pre_enable_timeout_work);
> +	ti_sn_bridge_cancel_early_pre_enable(pdata);
> +
> +	kfree(pdata->edid);
> +	pdata->edid = NULL;
> +}
> +
>  static void ti_sn_bridge_disable(struct drm_bridge *bridge)
>  {
>  	struct ti_sn_bridge *pdata = bridge_to_ti_sn_bridge(bridge);
> @@ -863,6 +937,7 @@ static void ti_sn_bridge_enable(struct drm_bridge *bridge)
>  
>  static const struct drm_bridge_funcs ti_sn_bridge_funcs = {
>  	.attach = ti_sn_bridge_attach,
> +	.detach = ti_sn_bridge_detach,
>  	.pre_enable = ti_sn_bridge_pre_enable,
>  	.enable = ti_sn_bridge_enable,
>  	.disable = ti_sn_bridge_disable,
> @@ -1227,6 +1302,10 @@ static int ti_sn_bridge_probe(struct i2c_client *client,
>  	if (!pdata)
>  		return -ENOMEM;
>  
> +	mutex_init(&pdata->pre_enable_mutex);
> +	INIT_DELAYED_WORK(&pdata->pre_enable_timeout_work,
> +			  ti_sn_bridge_pre_enable_timeout);
> +
>  	pdata->regmap = devm_regmap_init_i2c(client,
>  					     &ti_sn_bridge_regmap_config);
>  	if (IS_ERR(pdata->regmap)) {
> @@ -1301,7 +1380,6 @@ static int ti_sn_bridge_remove(struct i2c_client *client)
>  	if (!pdata)
>  		return -EINVAL;
>  
> -	kfree(pdata->edid);
>  	ti_sn_debugfs_remove(pdata);
>  
>  	of_node_put(pdata->host_node);

-- 
Regards,

Laurent Pinchart
