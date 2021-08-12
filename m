Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 99E523EA8AC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Aug 2021 18:44:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232932AbhHLQoe (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 12 Aug 2021 12:44:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51568 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232850AbhHLQoe (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 12 Aug 2021 12:44:34 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 02453C061756;
        Thu, 12 Aug 2021 09:44:09 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3CDF1EE;
        Thu, 12 Aug 2021 18:44:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1628786647;
        bh=XvCA6j4gXwjOSrFn4suElfXNhS4BUoOrMljmbi7myyc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Dp4fRkknCQ4WYwcSq3/VqbpKx5+SoPru+dhfbnJeOOE6BJ9Qnvm3Ey+Is072Zdjh2
         40nkhiCYH8HBj6+aEAe5ueRb/ejLIMzL36Wji61yL8fSkelW+hBn1w6reMpWsyVRtL
         CVc+XWtz0PXe4/6Pkwp/FjTF3rNlzoBS8GA+Hj/s=
Date:   Thu, 12 Aug 2021 19:44:03 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Rob Clark <robdclark@gmail.com>
Cc:     dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org,
        Stephen Boyd <swboyd@chromium.org>,
        Douglas Anderson <dianders@chromium.org>,
        Rob Clark <robdclark@chromium.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/4] drm/msm/dsi: Support NO_CONNECTOR bridges
Message-ID: <YRVP0yEydFKufw5Q@pendragon.ideasonboard.com>
References: <20210811235253.924867-1-robdclark@gmail.com>
 <20210811235253.924867-3-robdclark@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210811235253.924867-3-robdclark@gmail.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Rob

Thank you for the patch.

On Wed, Aug 11, 2021 at 04:52:48PM -0700, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> For now, since we have a mix of bridges which support this flag, which
> which do *not* support this flag, or work both ways, try it once with
> NO_CONNECTOR and then fall back to the old way if that doesn't work.
> Eventually we can drop the fallback path.
> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>  drivers/gpu/drm/msm/Kconfig           |  2 ++
>  drivers/gpu/drm/msm/dsi/dsi_manager.c | 41 ++++++++++++++++++---------
>  2 files changed, 30 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/Kconfig b/drivers/gpu/drm/msm/Kconfig
> index e9c6af78b1d7..36e5ba3ccc28 100644
> --- a/drivers/gpu/drm/msm/Kconfig
> +++ b/drivers/gpu/drm/msm/Kconfig
> @@ -14,6 +14,8 @@ config DRM_MSM
>  	select REGULATOR
>  	select DRM_KMS_HELPER
>  	select DRM_PANEL
> +	select DRM_BRIDGE
> +	select DRM_PANEL_BRIDGE
>  	select DRM_SCHED
>  	select SHMEM
>  	select TMPFS
> diff --git a/drivers/gpu/drm/msm/dsi/dsi_manager.c b/drivers/gpu/drm/msm/dsi/dsi_manager.c
> index c41d39f5b7cf..1fd1cf93abbf 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi_manager.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi_manager.c
> @@ -3,6 +3,8 @@
>   * Copyright (c) 2015, The Linux Foundation. All rights reserved.
>   */
>  
> +#include "drm/drm_bridge_connector.h"
> +
>  #include "msm_kms.h"
>  #include "dsi.h"
>  
> @@ -690,8 +692,7 @@ struct drm_connector *msm_dsi_manager_ext_bridge_init(u8 id)
>  	struct drm_device *dev = msm_dsi->dev;
>  	struct drm_encoder *encoder;
>  	struct drm_bridge *int_bridge, *ext_bridge;
> -	struct drm_connector *connector;
> -	struct list_head *connector_list;
> +	int ret;
>  
>  	int_bridge = msm_dsi->bridge;
>  	ext_bridge = msm_dsi->external_bridge =
> @@ -699,22 +700,36 @@ struct drm_connector *msm_dsi_manager_ext_bridge_init(u8 id)
>  
>  	encoder = msm_dsi->encoder;
>  
> -	/* link the internal dsi bridge to the external bridge */
> -	drm_bridge_attach(encoder, ext_bridge, int_bridge, 0);
> -
>  	/*
> -	 * we need the drm_connector created by the external bridge
> -	 * driver (or someone else) to feed it to our driver's
> -	 * priv->connector[] list, mainly for msm_fbdev_init()
> +	 * Try first to create the bridge without it creating it's own

s/it's/its/

> +	 * connector.. currently some bridges support this, and others
> +	 * do not (and some support both modes)
>  	 */
> -	connector_list = &dev->mode_config.connector_list;
> +	ret = drm_bridge_attach(encoder, ext_bridge, int_bridge,
> +			DRM_BRIDGE_ATTACH_NO_CONNECTOR);

Should all this be moved one layer up, to the code that attaches to the
mem_dsi->bridge ? I suppose we can start here, but as part of a global
move to bridges and DRM_BRIDGE_ATTACH_NO_CONNECTOR, I think the
top-level would make more sense in the long term.

If you want to start here,

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> +	if (ret == -EINVAL) {
> +		struct drm_connector *connector;
> +		struct list_head *connector_list;
> +
> +		/* link the internal dsi bridge to the external bridge */
> +		drm_bridge_attach(encoder, ext_bridge, int_bridge, 0);
> +
> +		/*
> +		 * we need the drm_connector created by the external bridge
> +		 * driver (or someone else) to feed it to our driver's
> +		 * priv->connector[] list, mainly for msm_fbdev_init()
> +		 */
> +		connector_list = &dev->mode_config.connector_list;
> +
> +		list_for_each_entry(connector, connector_list, head) {
> +			if (drm_connector_has_possible_encoder(connector, encoder))
> +				return connector;
> +		}
>  
> -	list_for_each_entry(connector, connector_list, head) {
> -		if (drm_connector_has_possible_encoder(connector, encoder))
> -			return connector;
> +		return ERR_PTR(-ENODEV);
>  	}
>  
> -	return ERR_PTR(-ENODEV);
> +	return drm_bridge_connector_init(dev, encoder);
>  }
>  
>  void msm_dsi_manager_bridge_destroy(struct drm_bridge *bridge)

-- 
Regards,

Laurent Pinchart
