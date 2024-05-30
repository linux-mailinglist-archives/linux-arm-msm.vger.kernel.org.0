Return-Path: <linux-arm-msm+bounces-21095-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E16E58D4AE7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 May 2024 13:29:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3500BB21DAD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 May 2024 11:29:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4AFB174EC3;
	Thu, 30 May 2024 11:29:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Jf0z67+c"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE96A74076
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 May 2024 11:29:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717068559; cv=none; b=oHwy21XcAu70x62Mn+yOLmJhGp3ybGOaTdasQEyj+yEfVWXeoLZSFcIIqj5qrjsMFkSivOLxwxm97oQYfBIsW+RLnvYJSamYnZujeKu9CF2soN9z2GF8S8E8rnPVT0r/4BQIcTGiGCj40pN+hUzBqqu+O89TXUkGMarTGr7zPW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717068559; c=relaxed/simple;
	bh=LlA3gQklSKopQuXb4kMwWTLB4FAytE1XCHmCuvgBvAs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EdZXQpB1IJkD7z/VNE8jjfv0JPDma3rvoUaGfThQa4hw32ZIJryO6Tfepowduwc3hFdocBWoNoAnOwFZqRqEkID74h0NVgzncpCUmnSL0H9x/nu/uOolC98v9PazNlfevUCUAYBc/h9KccBsH8H39EJJdOS+Z36MDzjLjcxq36c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Jf0z67+c; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2e72b8931caso7711931fa.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 May 2024 04:29:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717068556; x=1717673356; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qN1kSAKijhJryv5o0bZrLiqQW+jscfFr6ArfO4ajojU=;
        b=Jf0z67+cSjRHYjaYqBNuCfGUa1n0s5NsYPaKCW8Qav8HZQ/XBPiTkqq627Ew52/3m2
         1FGVeiksZ7Qhw7HCNtQ0BFgwjtEyo50wddJZ+jL/MFPiwXWAW9ZcP/WkvvJ724Q5h7Hy
         weFVFYTHVSRoK+zvcWPnQSeTBtJV98KzO04H74Ysrv1NEA0Cd+zyfz20pJrw/15akaXd
         s+qiGAUMmUqjVbgPlskQJSix2d6e8lkuwgZK9g7e2Q2yGSG8l5PNAL2Ue41CXLs0w1jH
         uu+56kW5xdVV3Je8SMsuntmthrFWX3rzWF+zBB65n3Iqk8WDMUzgFd7yqaEwBEdJsVRp
         gKHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717068556; x=1717673356;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qN1kSAKijhJryv5o0bZrLiqQW+jscfFr6ArfO4ajojU=;
        b=bU8tKZnVYkzbZNBJi/8BtSExwePGSbXgFwHQMFXCbY00Bx2YkbsMuDn9SjCYmWU7Xy
         AnzvZXBVLOccyjz5Nx54mXHJGYlbU96QqdnPyJIBlsyQz3eotNLYdoe0Bwnl7j4kXPjk
         DvbHRZzB/wR2Rfq0nV1T/dR12FA7cD0GVqDoZl+oIrNOHVbACPdkdZu3fq8mApjrBsjZ
         ANxICLNGogaik4iedSD0koK/zbpsyZ3FkXGenCGg+uQDtL3vwmHZKbcs5uogwLYlxWPC
         BjHjTab8ZOMvGN9UoZ36vd2JLefr1edg8G5QFXhgrzz3hAWzAzFlOaZxbMndDxadgj8Z
         DIug==
X-Forwarded-Encrypted: i=1; AJvYcCWY6RwI1e7MkaEX30LDdrweqR8TpWJBH6hW7xWvvA03v5b3shceTCmveyyRRIcBXJjhaYsEN9luHG6usCy0AfP1uVngMq7eOHkl08DT6w==
X-Gm-Message-State: AOJu0YwOCdoNQb/Stxu2MH2jUDKpBwO8IJMfrSLHkT6oNiwWgFej6/o4
	Xe4+wQWAe3Me18CrVXHAoXJA7Jy1DyzDJ6dn7Ig5ZzbJyg0gC+CPnh3R6Vwi/CU=
X-Google-Smtp-Source: AGHT+IHFZmhPWrpfDIs6tGUrKgrR5i4gagZPkWkLjzo7d/knqnug/6VHpXY/uSn6poWwwRGWUJA/Wg==
X-Received: by 2002:a2e:9e48:0:b0:2e0:14bd:18f2 with SMTP id 38308e7fff4ca-2ea84839455mr9405011fa.47.1717068555836;
        Thu, 30 May 2024 04:29:15 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2e95bcf4c32sm27457671fa.66.2024.05.30.04.29.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 May 2024 04:29:15 -0700 (PDT)
Date: Thu, 30 May 2024 14:29:13 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Maxime Ripard <mripard@kernel.org>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/7] drm/bridge-connector: implement glue code for
 HDMI connector
Message-ID: <cvorofjtjmkzm2s6dzxkhzamz2j7plo7ft3httaglgishnsdl4@gs2r6g6kiptq>
References: <20240530-bridge-hdmi-connector-v3-0-a1d184d68fe3@linaro.org>
 <20240530-bridge-hdmi-connector-v3-3-a1d184d68fe3@linaro.org>
 <20240530-urban-friendly-kittiwake-ff663b@houat>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240530-urban-friendly-kittiwake-ff663b@houat>

On Thu, May 30, 2024 at 11:01:26AM +0200, Maxime Ripard wrote:
> Hi,
> 
> On Thu, May 30, 2024 at 02:12:26AM GMT, Dmitry Baryshkov wrote:
> > In order to let bridge chains implement HDMI connector infrastructure,
> > add necessary glue code to the drm_bridge_connector. In case there is a
> > bridge that sets DRM_BRIDGE_OP_HDMI, drm_bridge_connector will register
> > itself as a HDMI connector and provide proxy drm_connector_hdmi_funcs
> > implementation.
> > 
> > Note, to simplify implementation, there can be only one bridge in a
> > chain that sets DRM_BRIDGE_OP_HDMI. Setting more than one is considered
> > an error. This limitation can be lifted later, if the need arises.
> > 
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >  drivers/gpu/drm/drm_bridge_connector.c | 101 ++++++++++++++++++++++++++++++++-
> >  drivers/gpu/drm/drm_debugfs.c          |   2 +
> >  include/drm/drm_bridge.h               |  82 ++++++++++++++++++++++++++
> >  3 files changed, 182 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/drm_bridge_connector.c b/drivers/gpu/drm/drm_bridge_connector.c
> > index e093fc8928dc..8dca3eda5381 100644
> > --- a/drivers/gpu/drm/drm_bridge_connector.c
> > +++ b/drivers/gpu/drm/drm_bridge_connector.c
> > @@ -18,6 +18,7 @@
> >  #include <drm/drm_managed.h>
> >  #include <drm/drm_modeset_helper_vtables.h>
> >  #include <drm/drm_probe_helper.h>
> > +#include <drm/display/drm_hdmi_state_helper.h>
> >  
> >  /**
> >   * DOC: overview
> > @@ -87,6 +88,13 @@ struct drm_bridge_connector {
> >  	 * connector modes detection, if any (see &DRM_BRIDGE_OP_MODES).
> >  	 */
> >  	struct drm_bridge *bridge_modes;
> > +	/**
> > +	 * @bridge_hdmi:
> > +	 *
> > +	 * The bridge in the chain that implements necessary support for the
> > +	 * HDMI connector infrastructure, if any (see &DRM_BRIDGE_OP_HDMI).
> > +	 */
> > +	struct drm_bridge *bridge_hdmi;
> >  };
> >  
> >  #define to_drm_bridge_connector(x) \
> > @@ -287,6 +295,61 @@ static const struct drm_connector_helper_funcs drm_bridge_connector_helper_funcs
> >  	.disable_hpd = drm_bridge_connector_disable_hpd,
> >  };
> >  
> > +static enum drm_mode_status
> > +drm_bridge_connector_tmds_char_rate_valid(const struct drm_connector *connector,
> > +					  const struct drm_display_mode *mode,
> > +					  unsigned long long tmds_rate)
> > +{
> > +	struct drm_bridge_connector *bridge_connector =
> > +		to_drm_bridge_connector(connector);
> > +	struct drm_bridge *bridge;
> > +
> > +	bridge = bridge_connector->bridge_hdmi;
> > +	if (bridge)
> > +		return bridge->funcs->tmds_char_rate_valid ?
> > +			bridge->funcs->tmds_char_rate_valid(bridge, mode, tmds_rate) :
> > +			MODE_OK;
> > +
> > +	return MODE_ERROR;
> > +}
> 
> It's kind of a nitpick, but I think the following syntax is clearer:
> 
> if (bridge)
> 	if (bridge->funcs->tmds_char_rate_valid)
> 		return bridge->funcs->tmds_char_rate_valid(bridge, mode, tmds_rate);
> 	else
> 		return MODE_OK;
> 
> return MODE_ERROR;

Ack

> 
> > +static int drm_bridge_connector_clear_infoframe(struct drm_connector *connector,
> > +						enum hdmi_infoframe_type type)
> > +{
> > +	struct drm_bridge_connector *bridge_connector =
> > +		to_drm_bridge_connector(connector);
> > +	struct drm_bridge *bridge;
> > +
> > +	bridge = bridge_connector->bridge_hdmi;
> > +	if (bridge)
> > +		return bridge->funcs->clear_infoframe ?
> > +			bridge->funcs->clear_infoframe(bridge, type) :
> > +			0;
> > +
> > +	return -EINVAL;
> > +}
> > +
> > +static int drm_bridge_connector_write_infoframe(struct drm_connector *connector,
> > +						enum hdmi_infoframe_type type,
> > +						const u8 *buffer, size_t len)
> > +{
> > +	struct drm_bridge_connector *bridge_connector =
> > +		to_drm_bridge_connector(connector);
> > +	struct drm_bridge *bridge;
> > +
> > +	bridge = bridge_connector->bridge_hdmi;
> > +	if (bridge)
> > +		return bridge->funcs->write_infoframe(bridge, type, buffer, len);
> > +
> > +	return -EINVAL;
> > +}
> > +
> > +static const struct drm_connector_hdmi_funcs drm_bridge_connector_hdmi_funcs = {
> > +	.tmds_char_rate_valid = drm_bridge_connector_tmds_char_rate_valid,
> > +	.clear_infoframe = drm_bridge_connector_clear_infoframe,
> > +	.write_infoframe = drm_bridge_connector_write_infoframe,
> > +};
> > +
> >  /* -----------------------------------------------------------------------------
> >   * Bridge Connector Initialisation
> >   */
> > @@ -312,6 +375,10 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
> >  	struct drm_connector *connector;
> >  	struct i2c_adapter *ddc = NULL;
> >  	struct drm_bridge *bridge, *panel_bridge = NULL;
> > +	const char *vendor = "Unknown";
> > +	const char *product = "Unknown";
> > +	unsigned int supported_formats = BIT(HDMI_COLORSPACE_RGB);
> > +	unsigned int max_bpc = 8;
> >  	int connector_type;
> >  	int ret;
> >  
> > @@ -348,6 +415,25 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
> >  			bridge_connector->bridge_detect = bridge;
> >  		if (bridge->ops & DRM_BRIDGE_OP_MODES)
> >  			bridge_connector->bridge_modes = bridge;
> > +		if (bridge->ops & DRM_BRIDGE_OP_HDMI) {
> > +			if (bridge_connector->bridge_hdmi)
> > +				return ERR_PTR(-EBUSY);
> > +			if (!bridge->funcs->write_infoframe)
> > +				return ERR_PTR(-EINVAL);
> > +
> > +			bridge_connector->bridge_hdmi = bridge;
> > +
> > +			if (bridge->supported_formats)
> > +				supported_formats = bridge->supported_formats;
> > +			if (bridge->max_bpc)
> > +				max_bpc = bridge->max_bpc;
> > +		}
> > +
> > +		if (bridge->vendor)
> > +			vendor = bridge->vendor;
> > +
> > +		if (bridge->product)
> > +			product = bridge->product;
> 
> I don't think we should allow HDMI bridges without a product or vendor.
> We should at the very least warn or return an error there, preferably
> the latter to start with. We can always relax the rule if it turns out
> to be too strict later on.

My goal was to be able to override the vendor/product after the HDMI
bridge. Something like setting 'Qualcomm / Snapdragon' in HDMI driver,
but then e.g. display-connector overriding it to e.g. '96board /
DB820c'. Maybe it's an overkill and we should just set vendor / product
from the HDMI bridge.

> 
> >  		if (!drm_bridge_get_next_bridge(bridge))
> >  			connector_type = bridge->type;
> > @@ -370,9 +456,18 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
> >  		return ERR_PTR(-EINVAL);
> >  	}
> >  
> > -	ret = drmm_connector_init(drm, connector,
> > -				  &drm_bridge_connector_funcs,
> > -				  connector_type, ddc);
> > +	if (bridge_connector->bridge_hdmi)
> > +		ret = drmm_connector_hdmi_init(drm, connector,
> > +					       vendor, product,
> > +					       &drm_bridge_connector_funcs,
> > +					       &drm_bridge_connector_hdmi_funcs,
> > +					       connector_type, ddc,
> > +					       supported_formats,
> > +					       max_bpc);
> > +	else
> > +		ret = drmm_connector_init(drm, connector,
> > +					  &drm_bridge_connector_funcs,
> > +					  connector_type, ddc);
> >  	if (ret) {
> >  		kfree(bridge_connector);
> >  		return ERR_PTR(ret);
> > diff --git a/drivers/gpu/drm/drm_debugfs.c b/drivers/gpu/drm/drm_debugfs.c
> > index dd39a5b7a711..e385d90ef893 100644
> > --- a/drivers/gpu/drm/drm_debugfs.c
> > +++ b/drivers/gpu/drm/drm_debugfs.c
> > @@ -762,6 +762,8 @@ static int bridges_show(struct seq_file *m, void *data)
> >  			drm_puts(&p, " hpd");
> >  		if (bridge->ops & DRM_BRIDGE_OP_MODES)
> >  			drm_puts(&p, " modes");
> > +		if (bridge->ops & DRM_BRIDGE_OP_HDMI)
> > +			drm_puts(&p, " hdmi");
> >  		drm_puts(&p, "\n");
> >  	}
> >  
> > diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
> > index 4baca0d9107b..c45e539fe276 100644
> > --- a/include/drm/drm_bridge.h
> > +++ b/include/drm/drm_bridge.h
> > @@ -630,6 +630,54 @@ struct drm_bridge_funcs {
> >  	 */
> >  	void (*hpd_disable)(struct drm_bridge *bridge);
> >  
> > +	/**
> > +	 * @tmds_char_rate_valid:
> > +	 *
> > +	 * Check whether a particular TMDS character rate is supported by the
> > +	 * driver.
> > +	 *
> > +	 * This callback is optional and should only be implemented by the
> > +	 * bridges that take part in the HDMI connector implementation. Bridges
> > +	 * that implement it shall set set the DRM_BRIDGE_OP_HDMI flag in their
> > +	 * &drm_bridge->ops.
> > +	 *
> > +	 * Returns:
> > +	 *
> > +	 * Either &drm_mode_status.MODE_OK or one of the failure reasons
> > +	 * in &enum drm_mode_status.
> > +	 */
> > +	enum drm_mode_status
> > +	(*tmds_char_rate_valid)(const struct drm_bridge *bridge,
> > +				const struct drm_display_mode *mode,
> > +				unsigned long long tmds_rate);
> 
> Would an HDMI prefix make sense here?

Yes, and in other callbacks too.

> 
> > +	/**
> > +	 * @clear_infoframe:
> > +	 *
> > +	 * This callback clears the infoframes in the hardware during commit.
> > +	 * It will be called multiple times, once for every disabled infoframe
> > +	 * type.
> > +	 *
> > +	 * This callback is optional and should only be implemented by the
> > +	 * bridges that take part in the HDMI connector implementation. Bridges
> > +	 * that implement it shall set set the DRM_BRIDGE_OP_HDMI flag in their
> > +	 * &drm_bridge->ops.
> > +	 */
> > +	int (*clear_infoframe)(struct drm_bridge *bridge,
> > +			       enum hdmi_infoframe_type type);
> 
> Missing newline there.
> 
> > +	/**
> > +	 * @write_infoframe:
> > +	 *
> > +	 * Program the infoframe into the hardware. It will be called multiple
> > +	 * times, once for every updated infoframe type.
> > +	 *
> > +	 * This callback is optional but it must be implemented by bridges that
> > +	 * set the DRM_BRIDGE_OP_HDMI flag in their &drm_bridge->ops.
> > +	 */
> > +	int (*write_infoframe)(struct drm_bridge *bridge,
> > +			       enum hdmi_infoframe_type type,
> > +			       const u8 *buffer, size_t len);
> > +
> >  	/**
> >  	 * @debugfs_init:
> >  	 *
> > @@ -705,6 +753,16 @@ enum drm_bridge_ops {
> >  	 * this flag shall implement the &drm_bridge_funcs->get_modes callback.
> >  	 */
> >  	DRM_BRIDGE_OP_MODES = BIT(3),
> > +	/**
> > +	 * @DRM_BRIDGE_OP_HDMI: The bridge provides HDMI connector operations,
> > +	 * including infoframes support. Bridges that set this flag must
> > +	 * implement the &drm_bridge_funcs->write_infoframe callback.
> > +	 *
> > +	 * Note: currently there can be at most one bridge in a chain that sets
> > +	 * this bit. This is to simplify corresponding glue code in connector
> > +	 * drivers.
> > +	 */
> > +	DRM_BRIDGE_OP_HDMI = BIT(4),
> >  };
> >  
> >  /**
> > @@ -773,6 +831,30 @@ struct drm_bridge {
> >  	 * @hpd_cb.
> >  	 */
> >  	void *hpd_data;
> > +
> > +	/**
> > +	 * @vendor: Vendor of the product to be used for the SPD InfoFrame
> > +	 * generation.
> > +	 */
> > +	const char *vendor;
> > +
> > +	/**
> > +	 * @product: Name of the product to be used for the SPD InfoFrame
> > +	 * generation.
> > +	 */
> > +	const char *product;
> > +
> > +	/**
> > +	 * @supported_formats: Bitmask of @hdmi_colorspace listing supported
> > +	 * output formats. This is only relevant if @DRM_BRIDGE_OP_HDMI is set.
> > +	 */
> > +	unsigned int supported_formats;
> > +
> > +	/**
> > +	 * @max_bpc: Maximum bits per char the HDMI bridge supports. This is
> > +	 * only relevant if @DRM_BRIDGE_OP_HDMI is set.
> > +	 */
> 
> We could probably document that the only allowed values are 8, 10 or 12.
> 
> Thanks!
> Maxime



-- 
With best wishes
Dmitry

