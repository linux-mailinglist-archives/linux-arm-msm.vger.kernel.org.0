Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D39CB353A79
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Apr 2021 03:02:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231539AbhDEBCr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 4 Apr 2021 21:02:47 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:42508 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230052AbhDEBCp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 4 Apr 2021 21:02:45 -0400
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5C176D40;
        Mon,  5 Apr 2021 03:02:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1617584558;
        bh=AsoTXFXT2zaL9LAuSDVassxui4zcCoDxrBQBdABNuM8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=gr3iAtXMHz2GgqWqgLbtWhVNA3vV3gS19AZS2Hcr4VcCdVp8EleOKr2Dr3p6tc/Bs
         EkQ67pH/UgMj/2JNUBJuGtucpiLPRZ6sXuWOLxmUkbyfYQTP4kyKwOKW1loOPSFRZi
         yL9mhjRFHNrRV8GAcI3P4QSLu8gzPf02cA0S1XZQ=
Date:   Mon, 5 Apr 2021 04:01:53 +0300
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
Subject: Re: [PATCH v3 07/12] drm/bridge: ti-sn65dsi86: Remove extra call:
 drm_connector_update_edid_property()
Message-ID: <YGphgcESWsozCi1y@pendragon.ideasonboard.com>
References: <20210402222846.2461042-1-dianders@chromium.org>
 <20210402152701.v3.7.Ic14a7ab8035df89e19a25ad4fbf2004f9673f167@changeid>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210402152701.v3.7.Ic14a7ab8035df89e19a25ad4fbf2004f9673f167@changeid>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Doug,

Thank you for the patch.

On Fri, Apr 02, 2021 at 03:28:41PM -0700, Douglas Anderson wrote:
> As of commit 5186421cbfe2 ("drm: Introduce epoch counter to
> drm_connector") the drm_get_edid() function calls
> drm_connector_update_edid_property() for us. There's no reason for us
> to call it again.
> 
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> Reviewed-by: Andrzej Hajda <a.hajda@samsung.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

This looks like a widespread issue, would you be able to send a patch to
address all the other drivers ?

> ---
> 
> (no changes since v1)
> 
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 11 ++++-------
>  1 file changed, 4 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> index 51db30d573c1..6390bc58f29a 100644
> --- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> +++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> @@ -270,7 +270,7 @@ static int ti_sn_bridge_connector_get_modes(struct drm_connector *connector)
>  {
>  	struct ti_sn_bridge *pdata = connector_to_ti_sn_bridge(connector);
>  	struct edid *edid = pdata->edid;
> -	int num, ret;
> +	int num;
>  
>  	if (!edid) {
>  		pm_runtime_get_sync(pdata->dev);
> @@ -279,12 +279,9 @@ static int ti_sn_bridge_connector_get_modes(struct drm_connector *connector)
>  	}
>  
>  	if (edid && drm_edid_is_valid(edid)) {
> -		ret = drm_connector_update_edid_property(connector, edid);
> -		if (!ret) {
> -			num = drm_add_edid_modes(connector, edid);
> -			if (num)
> -				return num;
> -		}
> +		num = drm_add_edid_modes(connector, edid);
> +		if (num)
> +			return num;
>  	}
>  
>  	return drm_panel_get_modes(pdata->panel, connector);

-- 
Regards,

Laurent Pinchart
