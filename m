Return-Path: <linux-arm-msm+bounces-105757-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wH3EFtq4+Gn1zAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105757-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 04 May 2026 17:18:50 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4213B4C08EF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 04 May 2026 17:18:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id D378D3001388
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 May 2026 14:55:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA43C3DE42C;
	Mon,  4 May 2026 14:55:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="TQCzqL3+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB94B3D6CA4;
	Mon,  4 May 2026 14:55:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777906542; cv=none; b=ZI7fow4PrX1goi6C/VF1vIdF5x3Krn36/t2F+JgGPVf5wVE/OA3RQNDJ8IevkriGL/GgQFI3bI5WSa5F6VIBCGWc0ftic5rmh7faWA/1EqcjO+qnfEIpiPF0UhXza2O3/c0bg2DNzh+WTGMRqlgE70VbCp0sKEYUeSss7qST+lA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777906542; c=relaxed/simple;
	bh=kQP0669SSkV4Pbo9r7KVWJedLhb9QWsm5WD+7wHDNU0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tPXbbtPeAAgxYH++vTy5aHxXf2MUkyd/LJxitWdR+BnXjm1fHIhIaE+s8HeInfdxRGdE/QpEIdYyghW2EArhhem9DfWSmpvWf0Y7PddrCriuqQA6D23e++pvMVFaTzjw1xo6GbcR99KiM0nICNP4Z4H3TFoeH814J/3la7A9V2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=TQCzqL3+; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from killaraus.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id AAE259C;
	Mon,  4 May 2026 16:55:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1777906535;
	bh=kQP0669SSkV4Pbo9r7KVWJedLhb9QWsm5WD+7wHDNU0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TQCzqL3+kCjx4SA5fD1konBZlj2IajoWgIOf6zPBg8IO7fhPhIvu/SYYYr7cVKDI7
	 3/dW/L/TO8mlgbRq2ax0skkFC1DQNkqdEXZbPLae94bHTmcvKdPyEYSDilbBbBmJhz
	 MCp/TuRjYZcIuWlrg+MoM6CpGRfi/fc2y7C5XNGs=
Date: Mon, 4 May 2026 17:55:36 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Rob Clark <robin.clark@oss.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	John Stultz <jstultz@google.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Michal Simek <michal.simek@amd.com>,
	Hui Pu <Hui.Pu@gehealthcare.com>,
	Ian Ray <ian.ray@gehealthcare.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH v4 02/11] drm/bridge: add of_drm_get_bridge_by_endpoint()
Message-ID: <20260504145536.GA1455860@killaraus.ideasonboard.com>
References: <20260504-drm-bridge-alloc-getput-panel_or_bridge-v4-0-b578c3daaf10@bootlin.com>
 <20260504-drm-bridge-alloc-getput-panel_or_bridge-v4-2-b578c3daaf10@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260504-drm-bridge-alloc-getput-panel_or_bridge-v4-2-b578c3daaf10@bootlin.com>
X-Rspamd-Queue-Id: 4213B4C08EF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-105757-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[intel.com,linaro.org,kernel.org,kwiboo.se,gmail.com,linux.intel.com,suse.de,ffwll.ch,oss.qualcomm.com,linux.dev,poorly.run,somainline.org,google.com,ideasonboard.com,amd.com,gehealthcare.com,bootlin.com,lists.freedesktop.org,vger.kernel.org,lists.infradead.org];
	RCPT_COUNT_TWELVE(0.00)[30];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[laurent.pinchart@ideasonboard.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ideasonboard.com:dkim,ideasonboard.com:email,qualcomm.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,bootlin.com:email]

On Mon, May 04, 2026 at 12:45:05PM +0200, Luca Ceresoli wrote:
> drm_of_find_panel_or_bridge() is widely used, but many callers pass NULL
> into the @panel or the @bridge arguments, thus making a very partial usage
> of this rather complex function.
> 
> Besides, the bridge returned in @bridge is not refcounted, thus making this
> API unsafe when DRM bridge hotplug will be introduced.
> 
> Solve both issues for the cases of calls to drm_of_find_panel_or_bridge()
> with a NULL @panel pointer by adding a new function that only looks for
> bridges (and is thus much simpler) and increments the refcount of the
> returned bridge.
> 
> The new function is identical to drm_of_find_panel_or_bridge() except it:
> 
>  - handles bridge refcounting: uses of_drm_find_and_get_bridge() instead of
>    of_drm_find_bridge() internally to return a refcounted bridge
>  - is simpler to use: just takes no @panel parameter, returns the pointer
>    in the return value instead of a double pointer argument
>  - has a simpler implementation: it is equal to
>    drm_of_find_panel_or_bridge() after removing the code that becomes dead
>    when @panel == NULL
> 
> Also add this function to drm_bridge.c and not drm_of.c because it returns
> bridges only.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> ---
> Changes in v4:
> - update function declaration in non-OF case
> 
> Changes in v2:
> - return the bridge in the return value, not a double pointer
> ---
>  drivers/gpu/drm/drm_bridge.c | 41 +++++++++++++++++++++++++++++++++++++++++
>  include/drm/drm_bridge.h     |  7 +++++++
>  2 files changed, 48 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
> index 6fb71de6d22a..01f9e0426648 100644
> --- a/drivers/gpu/drm/drm_bridge.c
> +++ b/drivers/gpu/drm/drm_bridge.c
> @@ -1582,6 +1582,47 @@ struct drm_bridge *of_drm_find_bridge(struct device_node *np)
>  	return bridge;
>  }
>  EXPORT_SYMBOL(of_drm_find_bridge);
> +
> +/**
> + * of_drm_get_bridge_by_endpoint - return DRM bridge connected to a port/endpoint
> + * @np: device tree node containing output ports
> + * @port: port in the device tree node, or -1 for the first port found
> + * @endpoint: endpoint in the device tree node, or -1 for the first endpoint found
> + *
> + * Given a DT node's port and endpoint number, find the connected node and
> + * return the associated drm_bridge device.
> + *
> + * The refcount of the returned bridge is incremented. Use drm_bridge_put()
> + * when done with it.
> + *
> + * Returns a pointer to the connected drm_bridge, or a negative error on failure
> + */
> +struct drm_bridge *of_drm_get_bridge_by_endpoint(const struct device_node *np,
> +						 int port, int endpoint)
> +{
> +	struct drm_bridge *bridge;
> +
> +	/*
> +	 * of_graph_get_remote_node() produces a noisy error message if port
> +	 * node isn't found and the absence of the port is a legit case here,
> +	 * so at first we silently check whether graph presents in the

s/graph presents/graph is present/

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> +	 * device-tree node.
> +	 */
> +	if (!of_graph_is_present(np))
> +		return ERR_PTR(-ENODEV);
> +
> +	struct device_node *remote __free(device_node) =
> +		of_graph_get_remote_node(np, port, endpoint);
> +	if (!remote)
> +		return ERR_PTR(-ENODEV);
> +
> +	bridge = of_drm_find_and_get_bridge(remote);
> +	if (!bridge)
> +		return ERR_PTR(-EPROBE_DEFER);
> +
> +	return bridge;
> +}
> +EXPORT_SYMBOL_GPL(of_drm_get_bridge_by_endpoint);
>  #endif
>  
>  /**
> diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
> index d6cd0f5af045..31e11a360c42 100644
> --- a/include/drm/drm_bridge.h
> +++ b/include/drm/drm_bridge.h
> @@ -1327,6 +1327,8 @@ int drm_bridge_attach(struct drm_encoder *encoder, struct drm_bridge *bridge,
>  #ifdef CONFIG_OF
>  struct drm_bridge *of_drm_find_and_get_bridge(struct device_node *np);
>  struct drm_bridge *of_drm_find_bridge(struct device_node *np);
> +struct drm_bridge *of_drm_get_bridge_by_endpoint(const struct device_node *np,
> +						 int port, int endpoint);
>  #else
>  static inline struct drm_bridge *of_drm_find_and_get_bridge(struct device_node *np)
>  {
> @@ -1336,6 +1338,11 @@ static inline struct drm_bridge *of_drm_find_bridge(struct device_node *np)
>  {
>  	return NULL;
>  }
> +static inline struct drm_bridge *of_drm_get_bridge_by_endpoint(const struct device_node *np,
> +							       int port, int endpoint)
> +{
> +	return -ENODEV;
> +}
>  #endif
>  
>  static inline bool drm_bridge_is_last(struct drm_bridge *bridge)

-- 
Regards,

Laurent Pinchart

