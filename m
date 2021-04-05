Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1C426353A81
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Apr 2021 03:05:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230052AbhDEBFr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 4 Apr 2021 21:05:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36564 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231799AbhDEBFk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 4 Apr 2021 21:05:40 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08936C061756;
        Sun,  4 Apr 2021 18:05:35 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8F2F31025;
        Mon,  5 Apr 2021 03:05:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1617584733;
        bh=/avT1ZR+k+cQhp3irhkZYkN6nvF673BT55y0EGhKqio=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=q4hYKGz/uGBo4zCtaSacADKX5dfEc36dAIYshoiq9ZrwAEp7DitHgmg7qaAjhInd0
         BI/XIgw0AknUSLKThkZNDIN+3qeCaMgEIlM5BOK++9paCfUg+WomtzGW/TY295LF6E
         54WRVKPdHnshf4+94myrmVHpwayF7Y5rcnvn6UAI=
Date:   Mon, 5 Apr 2021 04:04:49 +0300
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
Subject: Re: [PATCH v3 11/12] drm/bridge: ti-sn65dsi86: Print an error if we
 fallback to panel modes
Message-ID: <YGpiMQkJbvdO6obJ@pendragon.ideasonboard.com>
References: <20210402222846.2461042-1-dianders@chromium.org>
 <20210402152701.v3.11.Ib4183a04e8698f60b67558f363fddbbaf33dd445@changeid>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210402152701.v3.11.Ib4183a04e8698f60b67558f363fddbbaf33dd445@changeid>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Doug,

Thank you for the patch.

On Fri, Apr 02, 2021 at 03:28:45PM -0700, Douglas Anderson wrote:
> Now that we can properly read the EDID for modes there should be no
> reason to fallback to the fixed modes that our downstream panel driver
> provides us. Let's make that clear by:
> - Putting an error message in the logs if we fall back.
> - Putting a comment in saying what's going on.
> 
> Signed-off-by: Douglas Anderson <dianders@chromium.org>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
> 
> (no changes since v1)
> 
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> index fb50f9f95b0f..3b61898cf9cb 100644
> --- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> +++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> @@ -303,6 +303,13 @@ static int ti_sn_bridge_connector_get_modes(struct drm_connector *connector)
>  			return num;
>  	}
>  
> +	/*
> +	 * Ideally this should never happen and we could remove the fallback
> +	 * but let's preserve old behavior.
> +	 */
> +	DRM_DEV_ERROR(pdata->dev,
> +		      "Failed to read EDID; falling back to panel modes");
> +
>  exit:
>  	return drm_panel_get_modes(pdata->panel, connector);
>  }

-- 
Regards,

Laurent Pinchart
