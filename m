Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 26C22353A6F
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Apr 2021 02:52:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231759AbhDEAwx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 4 Apr 2021 20:52:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33818 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231726AbhDEAwx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 4 Apr 2021 20:52:53 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 82A25C061756;
        Sun,  4 Apr 2021 17:52:47 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id DD8D6D40;
        Mon,  5 Apr 2021 02:52:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1617583966;
        bh=wbI2nBwmAeFOJY2HsKm+NsmwYZnvettHnz5e/Tm2TCI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=maWZ3fHqT/x7iF7+ZMY6EKMSwFmCRcS2oDiUwbLzirxKl3wc+MG8YcJVP5r9oR1bX
         rEB7iZi3OqwC9BRs24dg5bTGed8M2YHMtNqejKcgXWyYXHuZzHHDdMOvM4+yaoaqr8
         LNimm2tHRrsFbYwWtTbzBq8H/172O2KiHvUVdVWY=
Date:   Mon, 5 Apr 2021 03:52:01 +0300
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
Subject: Re: [PATCH v3 04/12] drm/bridge: ti-sn65dsi86: Reorder remove()
Message-ID: <YGpfMa2HW2vLDfh5@pendragon.ideasonboard.com>
References: <20210402222846.2461042-1-dianders@chromium.org>
 <20210402152701.v3.4.Ifcf1deaa372eba7eeb4f8eb516c5d15b77a657a9@changeid>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210402152701.v3.4.Ifcf1deaa372eba7eeb4f8eb516c5d15b77a657a9@changeid>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Doug,

Thank you for the patch.

On Fri, Apr 02, 2021 at 03:28:38PM -0700, Douglas Anderson wrote:
> Let's make the remove() function strictly the reverse of the probe()
> function so it's easier to reason about.
> 
> This patch was created by code inspection and should move us closer to
> a proper remove.
> 
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> Reviewed-by: Andrzej Hajda <a.hajda@samsung.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
> 
> Changes in v3:
> - Removed "NOTES" from commit message.
> 
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 15 ++++++++-------
>  1 file changed, 8 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> index 76f43af6735d..c006678c9921 100644
> --- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> +++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> @@ -1315,20 +1315,21 @@ static int ti_sn_bridge_remove(struct i2c_client *client)
>  	if (!pdata)
>  		return -EINVAL;
>  
> -	kfree(pdata->edid);
> -	ti_sn_debugfs_remove(pdata);
> -
> -	of_node_put(pdata->host_node);
> -
> -	pm_runtime_disable(pdata->dev);
> -
>  	if (pdata->dsi) {
>  		mipi_dsi_detach(pdata->dsi);
>  		mipi_dsi_device_unregister(pdata->dsi);
>  	}
>  
> +	kfree(pdata->edid);
> +
> +	ti_sn_debugfs_remove(pdata);
> +
>  	drm_bridge_remove(&pdata->bridge);
>  
> +	pm_runtime_disable(pdata->dev);
> +
> +	of_node_put(pdata->host_node);
> +
>  	return 0;
>  }
>  

-- 
Regards,

Laurent Pinchart
