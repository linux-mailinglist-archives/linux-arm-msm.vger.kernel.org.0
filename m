Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0CC523EAA67
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Aug 2021 20:44:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233890AbhHLSow (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 12 Aug 2021 14:44:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51364 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229905AbhHLSor (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 12 Aug 2021 14:44:47 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE888C061756;
        Thu, 12 Aug 2021 11:44:21 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1140DEE;
        Thu, 12 Aug 2021 20:44:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1628793859;
        bh=Ed3wGFYO6GTjtqD2dz9YfHM2bxCN0L4uoCU/YcNjenQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ksruoEC9BqBvmNLY+0Ryy+GIXKBk2CrPv+buQWTftL69Kk4UijTI/tiVsNc+6k8+A
         kExIvHP2nYxoIvUvD1zo9nUGeJKnplJilzeACZmNZixgYVieArY2L5sTgzgeJ8ZemZ
         SZ3jfcY7IbUOfRRlmIoLFMvk33y34hdaPiIGsd48=
Date:   Thu, 12 Aug 2021 21:44:15 +0300
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
Subject: Re: [PATCH 3/4] drm/bridge: ti-sn65dsi86: Implement
 bridge->mode_valid()
Message-ID: <YRVr/3A6UJIFiVWj@pendragon.ideasonboard.com>
References: <20210811235253.924867-1-robdclark@gmail.com>
 <20210811235253.924867-4-robdclark@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210811235253.924867-4-robdclark@gmail.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Rob,

Thank you for the patch.

On Wed, Aug 11, 2021 at 04:52:49PM -0700, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> For the brave new world of bridges not creating their own connectors, we
> need to implement the max clock limitation via bridge->mode_valid()
> instead of connector->mode_valid().
> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 24 +++++++++++++++++++-----
>  1 file changed, 19 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> index 5d3b30b2f547..38dcc49eccaf 100644
> --- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> +++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> @@ -595,6 +595,15 @@ static struct auxiliary_driver ti_sn_aux_driver = {
>  	.id_table = ti_sn_aux_id_table,
>  };
>  
> +static enum drm_mode_status check_mode(const struct drm_display_mode *mode)
> +{
> +	/* maximum supported resolution is 4K at 60 fps */
> +	if (mode->clock > 594000)
> +		return MODE_CLOCK_HIGH;
> +
> +	return MODE_OK;
> +}
> +
>  /* -----------------------------------------------------------------------------
>   * DRM Connector Operations
>   */
> @@ -616,11 +625,7 @@ static enum drm_mode_status
>  ti_sn_bridge_connector_mode_valid(struct drm_connector *connector,
>  				  struct drm_display_mode *mode)
>  {
> -	/* maximum supported resolution is 4K at 60 fps */
> -	if (mode->clock > 594000)
> -		return MODE_CLOCK_HIGH;
> -
> -	return MODE_OK;
> +	return check_mode(mode);

Do we need to implement the connector .mode_valid() operation, given
that the bridge is linked in the chain ?

>  }
>  
>  static struct drm_connector_helper_funcs ti_sn_bridge_connector_helper_funcs = {
> @@ -763,6 +768,14 @@ static void ti_sn_bridge_detach(struct drm_bridge *bridge)
>  	drm_dp_aux_unregister(&bridge_to_ti_sn65dsi86(bridge)->aux);
>  }
>  
> +static enum drm_mode_status
> +ti_sn_bridge_mode_valid(struct drm_bridge *bridge,
> +			const struct drm_display_info *info,
> +			const struct drm_display_mode *mode)
> +{
> +	return check_mode(mode);
> +}
> +
>  static void ti_sn_bridge_disable(struct drm_bridge *bridge)
>  {
>  	struct ti_sn65dsi86 *pdata = bridge_to_ti_sn65dsi86(bridge);
> @@ -1118,6 +1131,7 @@ static void ti_sn_bridge_post_disable(struct drm_bridge *bridge)
>  static const struct drm_bridge_funcs ti_sn_bridge_funcs = {
>  	.attach = ti_sn_bridge_attach,
>  	.detach = ti_sn_bridge_detach,
> +	.mode_valid = ti_sn_bridge_mode_valid,
>  	.pre_enable = ti_sn_bridge_pre_enable,
>  	.enable = ti_sn_bridge_enable,
>  	.disable = ti_sn_bridge_disable,

-- 
Regards,

Laurent Pinchart
