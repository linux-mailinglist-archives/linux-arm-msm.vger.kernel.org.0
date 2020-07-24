Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 078B522BB8C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Jul 2020 03:30:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726717AbgGXBad (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 23 Jul 2020 21:30:33 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:35684 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726010AbgGXBad (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 23 Jul 2020 21:30:33 -0400
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 38AB8279;
        Fri, 24 Jul 2020 03:30:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1595554231;
        bh=akS/wzc0BWt9gQYq9HsNLG1pa4mQkWgmvntLaanjo4Y=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=qfND16UkHYN3vA2A7MdntXo1DC2Tc2f2Hjqzy89OEu8bAfIclINlSmp/x3oV/jtd0
         Y+LT+EHhMTiOYz4EfVmvOwTKxRvvj8QTkrg59LFwJ1OuKflWR43FwvCRHSFR3ltHAQ
         B5H6QOjrSa5SpYoUp6tezNBGa+0zHZN1Z2za++8s=
Date:   Fri, 24 Jul 2020 04:30:24 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Vinod Koul <vkoul@kernel.org>
Cc:     Sam Ravnborg <sam@ravnborg.org>, linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bogdan Togorean <bogdan.togorean@analog.com>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Rob Clark <robdclark@chromium.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm: bridge: adv7511: Add missing bridge type
Message-ID: <20200724013024.GL21353@pendragon.ideasonboard.com>
References: <20200723104523.1006706-1-vkoul@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200723104523.1006706-1-vkoul@kernel.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Vinod,

Thank you for the patch.

On Thu, Jul 23, 2020 at 04:15:23PM +0530, Vinod Koul wrote:
> Add bridge type as DRM_MODE_CONNECTOR_HDMIA
> 
> Signed-off-by: Vinod Koul <vkoul@kernel.org>

This has already been submitted: https://lore.kernel.org/dri-devel/20200720124228.12552-1-laurentiu.palcu@oss.nxp.com/

> ---
> 
> I found this when testing Dragon-board 410c which uses this bridge
> [    6.671913] msm 1a00000.mdss: [drm:msm_dsi_manager_ext_bridge_init [msm]] *ERROR* drm_bridge_connector_init failed: -22
> [    6.678879] msm 1a00000.mdss: [drm:msm_dsi_modeset_init [msm]] *ERROR* failed to create dsi connector: -19
> 
>  drivers/gpu/drm/bridge/adv7511/adv7511_drv.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> index f45cdca9cce5..a0d392c338da 100644
> --- a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> +++ b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> @@ -1283,6 +1283,7 @@ static int adv7511_probe(struct i2c_client *i2c, const struct i2c_device_id *id)
>  	adv7511->bridge.ops = DRM_BRIDGE_OP_DETECT | DRM_BRIDGE_OP_EDID
>  			    | DRM_BRIDGE_OP_HPD;
>  	adv7511->bridge.of_node = dev->of_node;
> +	adv7511->bridge.type = DRM_MODE_CONNECTOR_HDMIA;
>  
>  	drm_bridge_add(&adv7511->bridge);
>  

-- 
Regards,

Laurent Pinchart
