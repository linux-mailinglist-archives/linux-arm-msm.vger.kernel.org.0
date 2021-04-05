Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0C068353A73
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Apr 2021 02:59:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231783AbhDEA7P (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 4 Apr 2021 20:59:15 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:42414 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231759AbhDEA7L (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 4 Apr 2021 20:59:11 -0400
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 49108D40;
        Mon,  5 Apr 2021 02:59:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1617584341;
        bh=u+61VsZcxRPDE6sQcdGBDOSu14n8mjN6zWtsUqSPBEw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=vyvx79yqD5FnpLIxmHJcv6wFcsXugBtAUJmJAGcK5asmrWwk1D7BT6F782FQe9Dpi
         8VOUT2EbHTm/AETKfjaHkB3GBPPlSx7J+aO26pVJWMn/p55jE031Px4nMTCaApYcsN
         MNFgH5N1n2htYfHLjRW9bRG2zOdIgjXyQOdDwG04=
Date:   Mon, 5 Apr 2021 03:58:16 +0300
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
Subject: Re: [PATCH v3 05/12] drm/bridge: ti-sn65dsi86: Move
 drm_panel_unprepare() to post_disable()
Message-ID: <YGpgqJjpBPQ5//li@pendragon.ideasonboard.com>
References: <20210402222846.2461042-1-dianders@chromium.org>
 <20210402152701.v3.5.Ia75c9ffe2a2582393a8532d244da86f18b4c9b21@changeid>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210402152701.v3.5.Ia75c9ffe2a2582393a8532d244da86f18b4c9b21@changeid>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Doug,

Thank you for the patch.

On Fri, Apr 02, 2021 at 03:28:39PM -0700, Douglas Anderson wrote:
> We prepared the panel in pre_enable() so we should unprepare it in
> post_disable() to match.
> 
> This becomes important once we start using pre_enable() and
> post_disable() to make sure things are powered on (and then off again)
> when reading the EDID.
> 
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> Reviewed-by: Andrzej Hajda <a.hajda@samsung.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
> 
> (no changes since v1)
> 
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> index c006678c9921..e30460002c48 100644
> --- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> +++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> @@ -452,8 +452,6 @@ static void ti_sn_bridge_disable(struct drm_bridge *bridge)
>  	regmap_write(pdata->regmap, SN_ML_TX_MODE_REG, 0);
>  	/* disable DP PLL */
>  	regmap_write(pdata->regmap, SN_PLL_ENABLE_REG, 0);
> -
> -	drm_panel_unprepare(pdata->panel);
>  }
>  
>  static u32 ti_sn_bridge_get_dsi_freq(struct ti_sn_bridge *pdata)
> @@ -869,6 +867,8 @@ static void ti_sn_bridge_post_disable(struct drm_bridge *bridge)
>  {
>  	struct ti_sn_bridge *pdata = bridge_to_ti_sn_bridge(bridge);
>  
> +	drm_panel_unprepare(pdata->panel);
> +
>  	clk_disable_unprepare(pdata->refclk);
>  
>  	pm_runtime_put_sync(pdata->dev);

-- 
Regards,

Laurent Pinchart
