Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1949C3EA89E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Aug 2021 18:38:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232684AbhHLQis (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 12 Aug 2021 12:38:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50258 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232800AbhHLQip (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 12 Aug 2021 12:38:45 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 20426C0617AE;
        Thu, 12 Aug 2021 09:38:16 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7C3CDEE;
        Thu, 12 Aug 2021 18:38:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1628786293;
        bh=2HDiXmTVesTJn2obN8uBGSFdC4syfvKgLkKFdsDgOKo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=puV6Kf/6AJ2scLFu4qMQ2d+mfA204YlSDCbWAmn8poa09dEvnJ8lGnNY3+wYYmTq0
         mjdTK5E96KG1RMn5RB3E9vIBx1q8lMlNTcOccX94NU8gRIX9sxN/pF3OOolupR+TCq
         mguCI5QfF3sm2W1wfyBPZF7pAG3vr+Tbm4dQTT6Y=
Date:   Thu, 12 Aug 2021 19:38:09 +0300
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
        Jagan Teki <jagan@amarulasolutions.com>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/4] drm/bridge: ti-sn65dsi86: Avoid creating multiple
 connectors
Message-ID: <YRVOca+VBeejHCdZ@pendragon.ideasonboard.com>
References: <20210811235253.924867-1-robdclark@gmail.com>
 <20210811235253.924867-2-robdclark@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210811235253.924867-2-robdclark@gmail.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Rob,

Thank you for the patch.

On Wed, Aug 11, 2021 at 04:52:47PM -0700, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> If we created our own connector because the driver does not support the
> NO_CONNECTOR flag, we don't want the downstream bridge to *also* create
> a connector.  And if this driver did pass the NO_CONNECTOR flag (and we
> supported that mode) this would change nothing.
> 
> Fixes: 4e5763f03e10 ("drm/bridge: ti-sn65dsi86: Wrap panel with panel-bridge")
> Signed-off-by: Rob Clark <robdclark@chromium.org>

Makes complete sense.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> index 9bf889302bcc..5d3b30b2f547 100644
> --- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> +++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> @@ -736,6 +736,9 @@ static int ti_sn_bridge_attach(struct drm_bridge *bridge,
>  	}
>  	pdata->dsi = dsi;
>  
> +	/* We never want the next bridge to *also* create a connector: */
> +	flags |= DRM_BRIDGE_ATTACH_NO_CONNECTOR;
> +
>  	/* Attach the next bridge */
>  	ret = drm_bridge_attach(bridge->encoder, pdata->next_bridge,
>  				&pdata->bridge, flags);

-- 
Regards,

Laurent Pinchart
