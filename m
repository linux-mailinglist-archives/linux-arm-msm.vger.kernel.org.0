Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9A968353A6D
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Apr 2021 02:51:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231750AbhDEAvj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 4 Apr 2021 20:51:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33534 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231726AbhDEAvd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 4 Apr 2021 20:51:33 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD127C061756;
        Sun,  4 Apr 2021 17:51:26 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3C631D40;
        Mon,  5 Apr 2021 02:51:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1617583885;
        bh=IR5QuCE16OnKgCno85EZqwUpJO280F01ynF352kgnfE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=YtyUxr6juP+LNikWRhPkJwkhvCA0U20HpeduOMx2Up0DgxtXjZZWEwxNx6X8xLz+2
         nDhSaTpi99wCz6SX1/L11JdVDM+0HzfjhXsJN3hQZnt2tcMXOWqGf4JovGSD/TiEh+
         vouDRr1GRDWKP0Bykw1eiWI7+MWMOXbX4fHO4D+I=
Date:   Mon, 5 Apr 2021 03:50:39 +0300
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
Subject: Re: [PATCH v3 03/12] drm/bridge: ti-sn65dsi86: Remove incorrectly
 tagged kerneldoc comment
Message-ID: <YGpe3xThcRcmIFc3@pendragon.ideasonboard.com>
References: <20210402222846.2461042-1-dianders@chromium.org>
 <20210402152701.v3.3.I167766eeaf4c4646a3934c4dd5332decbab6bd68@changeid>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210402152701.v3.3.I167766eeaf4c4646a3934c4dd5332decbab6bd68@changeid>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Doug,

Thank you for the patch.

On Fri, Apr 02, 2021 at 03:28:37PM -0700, Douglas Anderson wrote:
> A random comment inside a function had "/**" in front of it. That
> doesn't make sense. Remove.
> 
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> Reviewed-by: Andrzej Hajda <a.hajda@samsung.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
> 
> (no changes since v1)
> 
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> index 96fe8f2c0ea9..76f43af6735d 100644
> --- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> +++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> @@ -788,7 +788,7 @@ static void ti_sn_bridge_enable(struct drm_bridge *bridge)
>  	/* set dsi clk frequency value */
>  	ti_sn_bridge_set_dsi_rate(pdata);
>  
> -	/**
> +	/*
>  	 * The SN65DSI86 only supports ASSR Display Authentication method and
>  	 * this method is enabled by default. An eDP panel must support this
>  	 * authentication method. We need to enable this method in the eDP panel

-- 
Regards,

Laurent Pinchart
