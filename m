Return-Path: <linux-arm-msm+bounces-109153-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id /+bUD4CRD2roNQYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109153-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 01:13:04 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 80C6F5AC85F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 01:13:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7FBC83019F20
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 23:13:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7707357CED;
	Thu, 21 May 2026 23:13:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VU+2Ql1i"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2992C22A817;
	Thu, 21 May 2026 23:12:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779405180; cv=none; b=tOaO6OVFccb4fFwxk/MmI888lxV8ipTU40DNFknVhz8Yxr/wS5EfhTYkzZIsrFGuo0d0rZfSHA6/WVieVV6fNPBo7IXtE48NaKHllw/D8SiI9W+4lEMI6q/q/OH+vrF5YrA8pQLE8qArpGKZ1F6nGODmyjF0rfZCKO2xnxa7xNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779405180; c=relaxed/simple;
	bh=sQmfpnHb0+CeegrXlYV172j9ZeizWVictHrK+qW7NvY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jrG2FiX9RCDM1n2BbbUeeNDp9acJBSs/FsQSxbmLihUxQf9SKNUe3PVDRD2xT2qPY5o6BUSO51v/JPKU9ICowCso9b+dr1078eRygQi9zdEkKtferEwkXlrdQdzKjpJaqRvBu+4TUV339BCISvRxNFYaHY/X/UgyouY/HLAhfyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VU+2Ql1i; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 139381F000E9;
	Thu, 21 May 2026 23:12:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779405178;
	bh=6u2hntw1Lr69V2xQYJN7KxqGRupMkIinljKiZkdvoc8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=VU+2Ql1ionlWfy/YF5AyB6k17GCNQuyheld0wx6rPU1iNnBjSzMz7R78rVq7m9mrs
	 g3qHaCDq3F6r6m694PUTTpQU61ei9jQTXdQW6rmJEoFzqR4V+He6Irpvq/UWvX2Ah9
	 3Aq2/HQzg2EH5Uibbn3KhedjtxYB43CUMTHS9BsXia1ciGg2KJWhvky49u9YherY9C
	 NflksuPQCr6niHXH0nBdZM802PhWNh6ij1s7p0Jlc8xfB1yEwrZ9MMlZ3MJcRXTvmZ
	 aLs0eigqY/dDX4UfnEBfbqBTuuCOpyiWxxQZN+DR10FNfOnrAA1wnUQx9jVw3NUxf7
	 2ztCjpYDRACVg==
Date: Thu, 21 May 2026 18:12:52 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Adrien Grassein <adrien.grassein@gmail.com>, Jani Nikula <jani.nikula@linux.intel.com>, 
	Rodrigo Vivi <rodrigo.vivi@intel.com>, Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
	Tvrtko Ursulin <tursulin@ursulin.net>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>, 
	Abhinav Kumar <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Konrad Dybcio <konradybcio@kernel.org>, 
	Pengyu Luo <mitltlatltl@gmail.com>, Nikita Travkin <nikita@trvn.ru>, 
	Yongxing Mou <yongxing.mou@oss.qualcomm.com>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
	linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Subject: Re: [PATCH RESEND v3 2/6] drm/bridge: pass down IRQ_HPD to the
 drivers
Message-ID: <ag-QgNs4fC56GgUx@baldur>
References: <20260513-hpd-irq-events-v3-0-086857017f16@oss.qualcomm.com>
 <20260513-hpd-irq-events-v3-2-086857017f16@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260513-hpd-irq-events-v3-2-086857017f16@oss.qualcomm.com>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-109153-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[42];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,linuxfoundation.org,intel.com,linaro.org,ideasonboard.com,kwiboo.se,ursulin.net,baylibre.com,googlemail.com,oss.qualcomm.com,linux.dev,poorly.run,somainline.org,trvn.ru,lists.freedesktop.org,vger.kernel.org,lists.infradead.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:email]
X-Rspamd-Queue-Id: 80C6F5AC85F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, May 13, 2026 at 09:23:22PM +0300, Dmitry Baryshkov wrote:
> Pass down the notifications about the IRQ_HPD events down to the
> individual drivers, letting them handle those as required.
> 

I think patch 2 through 6 relies on patch 1's commit message to
establish the motivation for each change, but they are scattered across
a variety of drivers/files.

It would be preferable to have the commit message of each patch stand on
its own.

Regards,
Bjorn

> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/bridge/chrontel-ch7033.c       |  3 ++-
>  drivers/gpu/drm/bridge/lontium-lt8912b.c       |  3 ++-
>  drivers/gpu/drm/bridge/lontium-lt9611uxc.c     |  3 ++-
>  drivers/gpu/drm/bridge/ti-tfp410.c             |  4 ++--
>  drivers/gpu/drm/display/drm_bridge_connector.c | 22 +++++++++++++---------
>  drivers/gpu/drm/drm_bridge.c                   |  5 +++--
>  drivers/gpu/drm/drm_connector.c                |  2 +-
>  drivers/gpu/drm/i915/display/intel_dp.c        |  3 ++-
>  drivers/gpu/drm/meson/meson_encoder_hdmi.c     |  3 ++-
>  drivers/gpu/drm/msm/dp/dp_display.c            |  3 ++-
>  drivers/gpu/drm/msm/dp/dp_drm.h                |  3 ++-
>  drivers/gpu/drm/omapdrm/dss/hdmi4.c            |  3 ++-
>  include/drm/drm_bridge.h                       |  9 ++++++---
>  include/drm/drm_connector.h                    |  3 ++-
>  14 files changed, 43 insertions(+), 26 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/chrontel-ch7033.c b/drivers/gpu/drm/bridge/chrontel-ch7033.c
> index 54d49d4882c8..04e6b4c00a28 100644
> --- a/drivers/gpu/drm/bridge/chrontel-ch7033.c
> +++ b/drivers/gpu/drm/bridge/chrontel-ch7033.c
> @@ -259,7 +259,8 @@ static const struct drm_connector_helper_funcs ch7033_connector_helper_funcs = {
>  	.best_encoder = ch7033_connector_best_encoder,
>  };
>  
> -static void ch7033_hpd_event(void *arg, enum drm_connector_status status)
> +static void ch7033_hpd_event(void *arg, enum drm_connector_status status,
> +			     enum drm_connector_status_extra extra_status)
>  {
>  	struct ch7033_priv *priv = arg;
>  
> diff --git a/drivers/gpu/drm/bridge/lontium-lt8912b.c b/drivers/gpu/drm/bridge/lontium-lt8912b.c
> index 8a0b48efca58..b404f0cbf60d 100644
> --- a/drivers/gpu/drm/bridge/lontium-lt8912b.c
> +++ b/drivers/gpu/drm/bridge/lontium-lt8912b.c
> @@ -504,7 +504,8 @@ static int lt8912_attach_dsi(struct lt8912 *lt)
>  	return 0;
>  }
>  
> -static void lt8912_bridge_hpd_cb(void *data, enum drm_connector_status status)
> +static void lt8912_bridge_hpd_cb(void *data, enum drm_connector_status status,
> +				 enum drm_connector_status_extra extra_status)
>  {
>  	struct lt8912 *lt = data;
>  
> diff --git a/drivers/gpu/drm/bridge/lontium-lt9611uxc.c b/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
> index 11aab07d88df..ca41ebe9f26f 100644
> --- a/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
> +++ b/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
> @@ -430,7 +430,8 @@ static const struct drm_edid *lt9611uxc_bridge_edid_read(struct drm_bridge *brid
>  
>  static void lt9611uxc_bridge_hpd_notify(struct drm_bridge *bridge,
>  					struct drm_connector *connector,
> -					enum drm_connector_status status)
> +					enum drm_connector_status status,
> +					enum drm_connector_status_extra extra_status)
>  {
>  	const struct drm_edid *drm_edid;
>  
> diff --git a/drivers/gpu/drm/bridge/ti-tfp410.c b/drivers/gpu/drm/bridge/ti-tfp410.c
> index 3b6b0e92cf89..199916662895 100644
> --- a/drivers/gpu/drm/bridge/ti-tfp410.c
> +++ b/drivers/gpu/drm/bridge/ti-tfp410.c
> @@ -39,7 +39,6 @@ drm_bridge_to_tfp410(struct drm_bridge *bridge)
>  {
>  	return container_of(bridge, struct tfp410, bridge);
>  }
> -
>  static inline struct tfp410 *
>  drm_connector_to_tfp410(struct drm_connector *connector)
>  {
> @@ -110,7 +109,8 @@ static void tfp410_hpd_work_func(struct work_struct *work)
>  		drm_helper_hpd_irq_event(dvi->bridge.dev);
>  }
>  
> -static void tfp410_hpd_callback(void *arg, enum drm_connector_status status)
> +static void tfp410_hpd_callback(void *arg, enum drm_connector_status status,
> +				enum drm_connector_status_extra extra_status)
>  {
>  	struct tfp410 *dvi = arg;
>  
> diff --git a/drivers/gpu/drm/display/drm_bridge_connector.c b/drivers/gpu/drm/display/drm_bridge_connector.c
> index 39cc18f78eda..5fdb1a231cec 100644
> --- a/drivers/gpu/drm/display/drm_bridge_connector.c
> +++ b/drivers/gpu/drm/display/drm_bridge_connector.c
> @@ -141,7 +141,8 @@ struct drm_bridge_connector {
>   */
>  
>  static void drm_bridge_connector_hpd_notify(struct drm_connector *connector,
> -					    enum drm_connector_status status)
> +					    enum drm_connector_status status,
> +					    enum drm_connector_status_extra extra_status)
>  {
>  	struct drm_bridge_connector *bridge_connector =
>  		to_drm_bridge_connector(connector);
> @@ -149,12 +150,13 @@ static void drm_bridge_connector_hpd_notify(struct drm_connector *connector,
>  	/* Notify all bridges in the pipeline of hotplug events. */
>  	drm_for_each_bridge_in_chain_scoped(bridge_connector->encoder, bridge) {
>  		if (bridge->funcs->hpd_notify)
> -			bridge->funcs->hpd_notify(bridge, connector, status);
> +			bridge->funcs->hpd_notify(bridge, connector, status, extra_status);
>  	}
>  }
>  
>  static void drm_bridge_connector_handle_hpd(struct drm_bridge_connector *drm_bridge_connector,
> -					    enum drm_connector_status status)
> +					    enum drm_connector_status status,
> +					    enum drm_connector_status_extra extra_status)
>  {
>  	struct drm_connector *connector = &drm_bridge_connector->base;
>  	struct drm_device *dev = connector->dev;
> @@ -163,24 +165,26 @@ static void drm_bridge_connector_handle_hpd(struct drm_bridge_connector *drm_bri
>  	connector->status = status;
>  	mutex_unlock(&dev->mode_config.mutex);
>  
> -	drm_bridge_connector_hpd_notify(connector, status);
> +	drm_bridge_connector_hpd_notify(connector, status, extra_status);
>  
>  	drm_kms_helper_connector_hotplug_event(connector);
>  }
>  
>  static void drm_bridge_connector_hpd_cb(void *cb_data,
> -					enum drm_connector_status status)
> +					enum drm_connector_status status,
> +					enum drm_connector_status_extra extra_status)
>  {
> -	drm_bridge_connector_handle_hpd(cb_data, status);
> +	drm_bridge_connector_handle_hpd(cb_data, status, extra_status);
>  }
>  
>  static void drm_bridge_connector_oob_hotplug_event(struct drm_connector *connector,
> -						   enum drm_connector_status status)
> +						   enum drm_connector_status status,
> +						   enum drm_connector_status_extra extra_status)
>  {
>  	struct drm_bridge_connector *bridge_connector =
>  		to_drm_bridge_connector(connector);
>  
> -	drm_bridge_connector_handle_hpd(bridge_connector, status);
> +	drm_bridge_connector_handle_hpd(bridge_connector, status, extra_status);
>  }
>  
>  static void drm_bridge_connector_enable_hpd(struct drm_connector *connector)
> @@ -223,7 +227,7 @@ drm_bridge_connector_detect(struct drm_connector *connector, bool force)
>  		if (hdmi)
>  			drm_atomic_helper_connector_hdmi_hotplug(connector, status);
>  
> -		drm_bridge_connector_hpd_notify(connector, status);
> +		drm_bridge_connector_hpd_notify(connector, status, DRM_CONNECTOR_NO_EXTRA_STATUS);
>  	} else {
>  		switch (connector->connector_type) {
>  		case DRM_MODE_CONNECTOR_DPI:
> diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
> index d6f512b73389..c8c3301cd936 100644
> --- a/drivers/gpu/drm/drm_bridge.c
> +++ b/drivers/gpu/drm/drm_bridge.c
> @@ -1444,7 +1444,8 @@ EXPORT_SYMBOL_GPL(drm_bridge_edid_read);
>   */
>  void drm_bridge_hpd_enable(struct drm_bridge *bridge,
>  			   void (*cb)(void *data,
> -				      enum drm_connector_status status),
> +				      enum drm_connector_status status,
> +				      enum drm_connector_status_extra extra_status),
>  			   void *data)
>  {
>  	if (!(bridge->ops & DRM_BRIDGE_OP_HPD))
> @@ -1509,7 +1510,7 @@ void drm_bridge_hpd_notify(struct drm_bridge *bridge,
>  {
>  	mutex_lock(&bridge->hpd_mutex);
>  	if (bridge->hpd_cb)
> -		bridge->hpd_cb(bridge->hpd_data, status);
> +		bridge->hpd_cb(bridge->hpd_data, status, DRM_CONNECTOR_NO_EXTRA_STATUS);
>  	mutex_unlock(&bridge->hpd_mutex);
>  }
>  EXPORT_SYMBOL_GPL(drm_bridge_hpd_notify);
> diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
> index edee9daccd51..415eb834808c 100644
> --- a/drivers/gpu/drm/drm_connector.c
> +++ b/drivers/gpu/drm/drm_connector.c
> @@ -3532,7 +3532,7 @@ void drm_connector_oob_hotplug_event(struct fwnode_handle *connector_fwnode,
>  		return;
>  
>  	if (connector->funcs->oob_hotplug_event)
> -		connector->funcs->oob_hotplug_event(connector, status);
> +		connector->funcs->oob_hotplug_event(connector, status, extra_status);
>  
>  	drm_connector_put(connector);
>  }
> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
> index 4955bd8b11d7..98bbcab2067b 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> @@ -6779,7 +6779,8 @@ static int intel_dp_connector_atomic_check(struct drm_connector *_connector,
>  }
>  
>  static void intel_dp_oob_hotplug_event(struct drm_connector *_connector,
> -				       enum drm_connector_status hpd_state)
> +				       enum drm_connector_status hpd_state,
> +				       enum drm_connector_status_extra extra_status)
>  {
>  	struct intel_connector *connector = to_intel_connector(_connector);
>  	struct intel_display *display = to_intel_display(connector);
> diff --git a/drivers/gpu/drm/meson/meson_encoder_hdmi.c b/drivers/gpu/drm/meson/meson_encoder_hdmi.c
> index 1abb0572bb5f..691b9996c8a4 100644
> --- a/drivers/gpu/drm/meson/meson_encoder_hdmi.c
> +++ b/drivers/gpu/drm/meson/meson_encoder_hdmi.c
> @@ -323,7 +323,8 @@ static int meson_encoder_hdmi_atomic_check(struct drm_bridge *bridge,
>  
>  static void meson_encoder_hdmi_hpd_notify(struct drm_bridge *bridge,
>  					  struct drm_connector *connector,
> -					  enum drm_connector_status status)
> +					  enum drm_connector_status status,
> +					  enum drm_connector_status_extra extra_status)
>  {
>  	struct meson_encoder_hdmi *encoder_hdmi = bridge_to_meson_encoder_hdmi(bridge);
>  
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index d2124d625485..7a0623fdbd8e 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -1785,7 +1785,8 @@ void msm_dp_bridge_hpd_disable(struct drm_bridge *bridge)
>  
>  void msm_dp_bridge_hpd_notify(struct drm_bridge *bridge,
>  			      struct drm_connector *connector,
> -			      enum drm_connector_status status)
> +			      enum drm_connector_status status,
> +			      enum drm_connector_status_extra extra_status)
>  {
>  	struct msm_dp_bridge *msm_dp_bridge = to_dp_bridge(bridge);
>  	struct msm_dp *msm_dp_display = msm_dp_bridge->msm_dp_display;
> diff --git a/drivers/gpu/drm/msm/dp/dp_drm.h b/drivers/gpu/drm/msm/dp/dp_drm.h
> index 9eb3431dd93a..74da3ef6b625 100644
> --- a/drivers/gpu/drm/msm/dp/dp_drm.h
> +++ b/drivers/gpu/drm/msm/dp/dp_drm.h
> @@ -41,6 +41,7 @@ void msm_dp_bridge_hpd_enable(struct drm_bridge *bridge);
>  void msm_dp_bridge_hpd_disable(struct drm_bridge *bridge);
>  void msm_dp_bridge_hpd_notify(struct drm_bridge *bridge,
>  			      struct drm_connector *connector,
> -			      enum drm_connector_status status);
> +			      enum drm_connector_status status,
> +			      enum drm_connector_status_extra extra_status);
>  
>  #endif /* _DP_DRM_H_ */
> diff --git a/drivers/gpu/drm/omapdrm/dss/hdmi4.c b/drivers/gpu/drm/omapdrm/dss/hdmi4.c
> index 29b2dfb90b5f..a7288791b2a5 100644
> --- a/drivers/gpu/drm/omapdrm/dss/hdmi4.c
> +++ b/drivers/gpu/drm/omapdrm/dss/hdmi4.c
> @@ -429,7 +429,8 @@ static void hdmi4_bridge_disable(struct drm_bridge *bridge,
>  
>  static void hdmi4_bridge_hpd_notify(struct drm_bridge *bridge,
>  				    struct drm_connector *connector,
> -				    enum drm_connector_status status)
> +				    enum drm_connector_status status,
> +				    enum drm_connector_status_extra extra_status)
>  {
>  	struct omap_hdmi *hdmi = drm_bridge_to_hdmi(bridge);
>  
> diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
> index a8d67bd9ee50..3e4672fbd7a8 100644
> --- a/include/drm/drm_bridge.h
> +++ b/include/drm/drm_bridge.h
> @@ -615,7 +615,8 @@ struct drm_bridge_funcs {
>  	 */
>  	void (*hpd_notify)(struct drm_bridge *bridge,
>  			   struct drm_connector *connector,
> -			   enum drm_connector_status status);
> +			   enum drm_connector_status status,
> +			   enum drm_connector_status_extra extra_status);
>  
>  	/**
>  	 * @hpd_enable:
> @@ -1260,7 +1261,8 @@ struct drm_bridge {
>  	 * @hpd_cb: Hot plug detection callback, registered with
>  	 * drm_bridge_hpd_enable().
>  	 */
> -	void (*hpd_cb)(void *data, enum drm_connector_status status);
> +	void (*hpd_cb)(void *data, enum drm_connector_status status,
> +		       enum drm_connector_status_extra extra_status);
>  	/**
>  	 * @hpd_data: Private data passed to the Hot plug detection callback
>  	 * @hpd_cb.
> @@ -1550,7 +1552,8 @@ const struct drm_edid *drm_bridge_edid_read(struct drm_bridge *bridge,
>  					    struct drm_connector *connector);
>  void drm_bridge_hpd_enable(struct drm_bridge *bridge,
>  			   void (*cb)(void *data,
> -				      enum drm_connector_status status),
> +				      enum drm_connector_status status,
> +				      enum drm_connector_status_extra extra_status),
>  			   void *data);
>  void drm_bridge_hpd_disable(struct drm_bridge *bridge);
>  void drm_bridge_hpd_notify(struct drm_bridge *bridge,
> diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
> index e05197e970d3..5ac5a64f83d9 100644
> --- a/include/drm/drm_connector.h
> +++ b/include/drm/drm_connector.h
> @@ -1720,7 +1720,8 @@ struct drm_connector_funcs {
>  	 * has been received from a source outside the display driver / device.
>  	 */
>  	void (*oob_hotplug_event)(struct drm_connector *connector,
> -				  enum drm_connector_status status);
> +				  enum drm_connector_status status,
> +				  enum drm_connector_status_extra extra_status);
>  
>  	/**
>  	 * @debugfs_init:
> 
> -- 
> 2.47.3
> 

