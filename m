Return-Path: <linux-arm-msm+bounces-47959-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C810A35264
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Feb 2025 00:58:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 92B3D3ABC32
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Feb 2025 23:58:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E78E61C861A;
	Thu, 13 Feb 2025 23:58:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="CJTsgqEA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB3791C84A4;
	Thu, 13 Feb 2025 23:57:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739491081; cv=none; b=kWZsZwj6DFowcxrvr4qQYkL7get7JfyQUqA9Swq3i3dUW4ZYr/nLZT5E3hY9r87M56ZabQ2cmuM0Go8N3zggS6QCYWTrE0OtkEKgq95Ttan9yWHvXbeAFFnmlpzeK+Yra2RkXMSGnvmLZbgNfFJ5DzjNSgMw2SdJiEh6P/tP+C8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739491081; c=relaxed/simple;
	bh=wnNf1nxymJb4gKNJpnoj6akFj49zAksSq0Yg6Yso8no=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=avNZRrrUlzBTCcMep0QnY/dWi7V4lsOYyHiUAXuooUgwvx3d9OJ4LCbPwZ/mW3QbNvS7+aAVrRK/rg7ZPmX3REFhAbMRbix9GkD4FBYITDD4rHvdQIbJxPwbJ86qy96LE91ULJT8rwK95DTQoQSe9wM+DN4vRJHne0KXIaAg29c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=CJTsgqEA; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8AE48581;
	Fri, 14 Feb 2025 00:56:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1739490998;
	bh=wnNf1nxymJb4gKNJpnoj6akFj49zAksSq0Yg6Yso8no=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CJTsgqEAEKovD6aim4UcDNseqIB8fBYRUII0rsoP0LGNW3OhtIqxnqMxklaFvktmV
	 +T621TIJ49ANTCxryvAqDiPj0uu5U61uHpYAANcyC9W78RvPgAv8HqjouZYLDlL8Cf
	 w9Gk612QkXT39HO0CW5hOQEzARXEcDOnsOoTvzrs=
Date: Fri, 14 Feb 2025 01:57:45 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Rob Clark <robdclark@gmail.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Hermes Wu <Hermes.wu@ite.com.tw>, dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	freedreno@lists.freedesktop.org
Subject: Re: [PATCH v2 1/3] drm/display: bridge-connector: add DisplayPort
 bridges
Message-ID: <20250213235745.GA7688@pendragon.ideasonboard.com>
References: <20250209-dp-hdmi-audio-v2-0-16db6ebf22ff@linaro.org>
 <20250209-dp-hdmi-audio-v2-1-16db6ebf22ff@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250209-dp-hdmi-audio-v2-1-16db6ebf22ff@linaro.org>

Hi Dmitry,

Thank you for the patch.

On Sun, Feb 09, 2025 at 03:41:18PM +0200, Dmitry Baryshkov wrote:
> DRM HDMI Codec framework is useful not only for the HDMI bridges, but
> also for the DisplayPort bridges. Add new DRM_BRIDGE_OP_DisplayPort
> define in order to distinguish DP bridges. Create HDMI codec device
> automatically for DP bridges which have declared audio support.
> 
> Note, unlike HDMI devices, which already have a framework to handle HPD
> notifications in a standard way, DP drivers don't (yet?) have such a
> framework. As such it is necessary to manually call
> drm_connector_hdmi_audio_plugged_notify(). This requirement hopefully
> can be lifted later on, if/when DRM framework gets better DisplayPort
> ports support in the core layer.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/gpu/drm/display/drm_bridge_connector.c | 66 ++++++++++++++++++++------
>  include/drm/drm_bridge.h                       | 14 +++++-
>  2 files changed, 65 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/gpu/drm/display/drm_bridge_connector.c b/drivers/gpu/drm/display/drm_bridge_connector.c
> index 30c736fc0067e31a97db242e5b16ea8a5b4cf359..5e031395b801f9a1371dcb4ac09f3da23e4615dd 100644
> --- a/drivers/gpu/drm/display/drm_bridge_connector.c
> +++ b/drivers/gpu/drm/display/drm_bridge_connector.c
> @@ -98,6 +98,13 @@ struct drm_bridge_connector {
>  	 * HDMI connector infrastructure, if any (see &DRM_BRIDGE_OP_HDMI).
>  	 */
>  	struct drm_bridge *bridge_hdmi;
> +	/**
> +	 * @bridge_dp:
> +	 *
> +	 * The bridge in the chain that implements necessary support for the
> +	 * DisplayPort connector infrastructure, if any (see &DRM_BRIDGE_OP_DisplayPort).
> +	 */
> +	struct drm_bridge *bridge_dp;
>  };
>  
>  #define to_drm_bridge_connector(x) \
> @@ -496,6 +503,25 @@ static const struct drm_connector_hdmi_audio_funcs drm_bridge_connector_hdmi_aud
>  	.mute_stream = drm_bridge_connector_audio_mute_stream,
>  };
>  
> +static int drm_bridge_connector_hdmi_audio_init(struct drm_connector *connector,
> +						struct drm_bridge *bridge)
> +{
> +	if (!bridge->hdmi_audio_max_i2s_playback_channels &&
> +	    !bridge->hdmi_audio_spdif_playback)
> +		return 0;
> +
> +	if (!bridge->funcs->hdmi_audio_prepare ||
> +	    !bridge->funcs->hdmi_audio_shutdown)
> +		return -EINVAL;
> +
> +	return drm_connector_hdmi_audio_init(connector,
> +					     bridge->hdmi_audio_dev,
> +					     &drm_bridge_connector_hdmi_audio_funcs,
> +					     bridge->hdmi_audio_max_i2s_playback_channels,
> +					     bridge->hdmi_audio_spdif_playback,
> +					     bridge->hdmi_audio_dai_port);
> +}
> +
>  /* -----------------------------------------------------------------------------
>   * Bridge Connector Initialisation
>   */
> @@ -564,6 +590,8 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
>  		if (bridge->ops & DRM_BRIDGE_OP_HDMI) {
>  			if (bridge_connector->bridge_hdmi)
>  				return ERR_PTR(-EBUSY);
> +			if (bridge_connector->bridge_dp)
> +				return ERR_PTR(-EINVAL);
>  			if (!bridge->funcs->hdmi_write_infoframe ||
>  			    !bridge->funcs->hdmi_clear_infoframe)
>  				return ERR_PTR(-EINVAL);
> @@ -576,6 +604,16 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
>  				max_bpc = bridge->max_bpc;
>  		}
>  
> +		if (bridge->ops & DRM_BRIDGE_OP_DisplayPort) {
> +			if (bridge_connector->bridge_dp)
> +				return ERR_PTR(-EBUSY);
> +			if (bridge_connector->bridge_hdmi)
> +				return ERR_PTR(-EINVAL);
> +
> +			bridge_connector->bridge_dp = bridge;
> +
> +		}
> +
>  		if (!drm_bridge_get_next_bridge(bridge))
>  			connector_type = bridge->type;
>  
> @@ -612,21 +650,21 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
>  		if (ret)
>  			return ERR_PTR(ret);
>  
> -		if (bridge->hdmi_audio_max_i2s_playback_channels ||
> -		    bridge->hdmi_audio_spdif_playback) {
> -			if (!bridge->funcs->hdmi_audio_prepare ||
> -			    !bridge->funcs->hdmi_audio_shutdown)
> -				return ERR_PTR(-EINVAL);
> +		ret = drm_bridge_connector_hdmi_audio_init(connector, bridge);
> +		if (ret)
> +			return ERR_PTR(ret);
> +	} else if (bridge_connector->bridge_dp) {
> +		bridge = bridge_connector->bridge_dp;
>  
> -			ret = drm_connector_hdmi_audio_init(connector,
> -							    bridge->hdmi_audio_dev,
> -							    &drm_bridge_connector_hdmi_audio_funcs,
> -							    bridge->hdmi_audio_max_i2s_playback_channels,
> -							    bridge->hdmi_audio_spdif_playback,
> -							    bridge->hdmi_audio_dai_port);
> -			if (ret)
> -				return ERR_PTR(ret);
> -		}
> +		ret = drmm_connector_init(drm, connector,
> +					  &drm_bridge_connector_funcs,
> +					  connector_type, ddc);
> +		if (ret)
> +			return ERR_PTR(ret);
> +
> +		ret = drm_bridge_connector_hdmi_audio_init(connector, bridge);
> +		if (ret)
> +			return ERR_PTR(ret);
>  	} else {
>  		ret = drmm_connector_init(drm, connector,
>  					  &drm_bridge_connector_funcs,
> diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
> index 496dbbd2ad7edff7f091adfbe62de1e33ef0cf07..40f37444426b1b8ded25da9ba9e2963f18ad6267 100644
> --- a/include/drm/drm_bridge.h
> +++ b/include/drm/drm_bridge.h
> @@ -811,9 +811,21 @@ enum drm_bridge_ops {
>  	 *
>  	 * Note: currently there can be at most one bridge in a chain that sets
>  	 * this bit. This is to simplify corresponding glue code in connector
> -	 * drivers.
> +	 * drivers. Having both HDMI and DisplayPort bridges in the same bridge
> +	 * chain is also not allowed.
>  	 */
>  	DRM_BRIDGE_OP_HDMI = BIT(4),
> +	/**
> +	 * @DRM_BRIDGE_OP_DisplayPort: The bridge provides DisplayPort connector
> +	 * operations. Currently this is limited to the optional HDMI codec
> +	 * support.
> +	 *
> +	 * Note: currently there can be at most one bridge in a chain that sets
> +	 * this bit. This is to simplify corresponding glue code in connector
> +	 * drivers. Having both HDMI and DisplayPort bridges in the same bridge
> +	 * chain is also not allowed.
> +	 */
> +	DRM_BRIDGE_OP_DisplayPort = BIT(5),

The OP bits are not supposed to describe tbe type of bridge, but the
operations it implements. I see quite a bit of duplication between HDMI
and DisplayPort in this patch. Can we have a single bit named after the
feature that you want to support ? The bridge_hdmi and bridge_dp fields
should also be merged into a single one.

>  };
>  
>  /**
> 

-- 
Regards,

Laurent Pinchart

