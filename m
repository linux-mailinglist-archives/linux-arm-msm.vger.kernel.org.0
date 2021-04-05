Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D5739353A76
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Apr 2021 02:59:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231775AbhDEA7l (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 4 Apr 2021 20:59:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35264 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231759AbhDEA7j (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 4 Apr 2021 20:59:39 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2BCD4C061756;
        Sun,  4 Apr 2021 17:59:32 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id B06C1D40;
        Mon,  5 Apr 2021 02:59:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1617584370;
        bh=vfFmpNJF/fiC2qTs4S5P4oYV9/Rjj51A1zCLqAj61Ag=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=c/cYoodP20+9+bb1rkYiNbOu6k4O/M5qnuNWvP5kmaoV0Qlw0rnIk7Cok/O/4KeQy
         KmkFAXeegKyc61qJNvIxWff6v2sPnFezEVIO+2JsReAcatNQoRt1H224cBjGwhM0tx
         HKe+SQDQW2SAo3aQOlV7SwL2UljxxB7t1fNHwr1k=
Date:   Mon, 5 Apr 2021 03:58:46 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Douglas Anderson <dianders@chromium.org>
Cc:     Andrzej Hajda <a.hajda@samsung.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Sam Ravnborg <sam@ravnborg.org>,
        Linus W <linus.walleij@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        robdclark@chromium.org, Stephen Boyd <swboyd@chromium.org>,
        Steev Klimaszewski <steev@kali.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        linux-arm-msm@vger.kernel.org,
        Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Robert Foss <robert.foss@linaro.org>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 06/12] drm/bridge: ti-sn65dsi86: Get rid of the
 useless detect() function
Message-ID: <YGpgxss706zm/+By@pendragon.ideasonboard.com>
References: <20210402222846.2461042-1-dianders@chromium.org>
 <20210402152701.v3.6.I826adf4faeb7f39f560b387f6b380e639c6986c8@changeid>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210402152701.v3.6.I826adf4faeb7f39f560b387f6b380e639c6986c8@changeid>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Doug,

Thank you for the patch.

On Fri, Apr 02, 2021 at 03:28:40PM -0700, Douglas Anderson wrote:
> If we just leave the detect() function as NULL then the upper layers
> assume we're always connected. There's no reason for a stub.
> 
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> Reviewed-by: Andrzej Hajda <a.hajda@samsung.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
> 
> (no changes since v1)
> 
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 12 ------------
>  1 file changed, 12 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> index e30460002c48..51db30d573c1 100644
> --- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> +++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> @@ -306,20 +306,8 @@ static struct drm_connector_helper_funcs ti_sn_bridge_connector_helper_funcs = {
>  	.mode_valid = ti_sn_bridge_connector_mode_valid,
>  };
>  
> -static enum drm_connector_status
> -ti_sn_bridge_connector_detect(struct drm_connector *connector, bool force)
> -{
> -	/**
> -	 * TODO: Currently if drm_panel is present, then always
> -	 * return the status as connected. Need to add support to detect
> -	 * device state for hot pluggable scenarios.
> -	 */
> -	return connector_status_connected;
> -}
> -
>  static const struct drm_connector_funcs ti_sn_bridge_connector_funcs = {
>  	.fill_modes = drm_helper_probe_single_connector_modes,
> -	.detect = ti_sn_bridge_connector_detect,
>  	.destroy = drm_connector_cleanup,
>  	.reset = drm_atomic_helper_connector_reset,
>  	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,

-- 
Regards,

Laurent Pinchart
