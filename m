Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 320D03EAAE8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Aug 2021 21:26:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233289AbhHLT0l (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 12 Aug 2021 15:26:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60954 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229950AbhHLT0l (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 12 Aug 2021 15:26:41 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 71C88C061756;
        Thu, 12 Aug 2021 12:26:15 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id AD590EE;
        Thu, 12 Aug 2021 21:26:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1628796373;
        bh=HbBlo2yWHVQ3aoOqeeRbXctYweM1HQRkPbkGnoGkmAU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=TrLHsZ2sWHkahSyRLDuG7pk/hVeRGE3yFQwfYRlo18c9+koVOxl747/uxFdPfVFrp
         wkPcJgLLhzKwdUtC/iLt3hWQqZmY6m+knctxWOHMdanx3Epd59w3V7PEqegbi528Xb
         dZE0Zp2YbzLBm7VJUqt475GlADrVCLoojE6ZslIE=
Date:   Thu, 12 Aug 2021 22:26:09 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Rob Clark <robdclark@gmail.com>
Cc:     dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org,
        Stephen Boyd <swboyd@chromium.org>,
        Douglas Anderson <dianders@chromium.org>,
        Rob Clark <robdclark@chromium.org>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Robert Foss <robert.foss@linaro.org>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 4/4] drm/bridge: ti-sn65dsi86: Add NO_CONNECTOR support
Message-ID: <YRV10ew/Lr8GPzEv@pendragon.ideasonboard.com>
References: <20210811235253.924867-1-robdclark@gmail.com>
 <20210811235253.924867-5-robdclark@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210811235253.924867-5-robdclark@gmail.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Rob,

Thank you for the patch.

On Wed, Aug 11, 2021 at 04:52:50PM -0700, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> Slightly awkward to fish out the display_info when we aren't creating
> own connector.  But I don't see an obvious better way.

We need a bit more than this, to support the NO_CONNECTOR case, the
bridge has to implement a few extra operations, and set the bridge .ops
field. I've submitted two patches to do so a while ago:

- [RFC PATCH 08/11] drm/bridge: ti-sn65dsi86: Implement bridge connector operations ([1])
- [RFC PATCH 09/11] drm/bridge: ti-sn65dsi86: Make connector creation optional ([2])

The second patch is similar to the first half of this patch, but misses
the cleanup code. I'll try to rebase this and resubmit, but it may take
a bit of time.

[1] https://lore.kernel.org/dri-devel/20210322030128.2283-9-laurent.pinchart+renesas@ideasonboard.com/
[2] https://lore.kernel.org/dri-devel/20210322030128.2283-10-laurent.pinchart+renesas@ideasonboard.com/

> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 34 +++++++++++++++++++++++----
>  1 file changed, 29 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> index 38dcc49eccaf..dc8112bab3d3 100644
> --- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> +++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> @@ -693,9 +693,11 @@ static int ti_sn_bridge_attach(struct drm_bridge *bridge,
>  		return ret;
>  	}
>  
> -	ret = ti_sn_bridge_connector_init(pdata);
> -	if (ret < 0)
> -		goto err_conn_init;
> +	if (!(flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR)) {
> +		ret = ti_sn_bridge_connector_init(pdata);
> +		if (ret < 0)
> +			goto err_conn_init;
> +	}
>  
>  	/*
>  	 * TODO: ideally finding host resource and dsi dev registration needs
> @@ -757,7 +759,8 @@ static int ti_sn_bridge_attach(struct drm_bridge *bridge,
>  err_dsi_attach:
>  	mipi_dsi_device_unregister(dsi);
>  err_dsi_host:
> -	drm_connector_cleanup(&pdata->connector);
> +	if (!(flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR))
> +		drm_connector_cleanup(&pdata->connector);
>  err_conn_init:
>  	drm_dp_aux_unregister(&pdata->aux);
>  	return ret;
> @@ -806,9 +809,30 @@ static void ti_sn_bridge_set_dsi_rate(struct ti_sn65dsi86 *pdata)
>  	regmap_write(pdata->regmap, SN_DSIA_CLK_FREQ_REG, val);
>  }
>  
> +/*
> + * Find the connector and fish out the bpc from display_info.  It would
> + * be nice if we could get this instead from drm_bridge_state, but that
> + * doesn't yet appear to be the case.
> + */

This should be done with

	struct drm_atomic_state *state = old_bridge_state->base.state;
	struct drm_connector *connector;

	connector = drm_atomic_get_new_connector_for_encoder(state,
							     bridge->encoder);

>  static unsigned int ti_sn_bridge_get_bpp(struct ti_sn65dsi86 *pdata)
>  {
> -	if (pdata->connector.display_info.bpc <= 6)
> +	struct drm_bridge *bridge = &pdata->bridge;
> +	struct drm_connector_list_iter conn_iter;
> +	struct drm_connector *connector;
> +	unsigned bpc = 0;
> +
> +	drm_connector_list_iter_begin(bridge->dev, &conn_iter);
> +	drm_for_each_connector_iter(connector, &conn_iter) {
> +		if (drm_connector_has_possible_encoder(connector, bridge->encoder)) {
> +			bpc = connector->display_info.bpc;
> +			break;
> +		}
> +	}
> +	drm_connector_list_iter_end(&conn_iter);
> +
> +	WARN_ON(bpc == 0);
> +
> +	if (bpc <= 6)
>  		return 18;
>  	else
>  		return 24;

-- 
Regards,

Laurent Pinchart
