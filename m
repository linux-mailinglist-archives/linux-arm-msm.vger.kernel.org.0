Return-Path: <linux-arm-msm+bounces-105763-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mGhvCDG7+Gnh0AIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105763-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 04 May 2026 17:28:49 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7335B4C0ADF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 04 May 2026 17:28:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A769B3010D8B
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 May 2026 15:27:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3848E3DBD7C;
	Mon,  4 May 2026 15:27:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="m1jZ0a3C"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C48153E0240;
	Mon,  4 May 2026 15:27:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777908462; cv=none; b=LcXqz/7mqfIjmRVUcefF/6+YZjt0e9g9DNYoSodDsYS3XBQMmEsKnhuRiIfvWhGpDoPCtvLCBBfyR9qPdTRIsfhQthZlbpCSaGqpK+kWHqZh+kBzQ3JCHUkYsBczxX5kgTx0WRNhRsrdEj6R6yz5zSet4xp6w9kUsiDacDOP3uE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777908462; c=relaxed/simple;
	bh=FTSgfFPCnzQLTG4eJxZAem+3dcr6wPJ3+G1sIL7RpM0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FW1Yvsm8AQ7p7Iu8NbmpQBGF+3udXSpQujFviT3u/g0PfVMxgLDRZNK5jydab7BW1KgNu4PeyACyn4bBJOfqBYf3pGwMo50ETndtGbKEAqlVsN85kCwMSMYnlfoRqyi4+KYD8IYgWHCaTlu5sqScVDa46LSg9z5YodULL2GjhFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=m1jZ0a3C; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from killaraus.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6426C175;
	Mon,  4 May 2026 17:27:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1777908456;
	bh=FTSgfFPCnzQLTG4eJxZAem+3dcr6wPJ3+G1sIL7RpM0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=m1jZ0a3C6WrgBNNrmOhhF+xER7PP8ksCg7WfK+EHHpWugmOHtchtHIxqSgVOeFwh+
	 sl/1vOAKOQevSZvLEr3Q3UzV8EjOpdDxhKMrBJnYB/M5ORdHZOb1fyoZTCnOhfAHiC
	 JhgXEXNRhvND9Klnic6IkEjVExvb7u8s7nVGBVRk=
Date: Mon, 4 May 2026 18:27:37 +0300
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
Subject: Re: [PATCH v4 11/11] drm: of: forbid bridge-only calls to
 drm_of_find_panel_or_bridge()
Message-ID: <20260504152737.GD1455860@killaraus.ideasonboard.com>
References: <20260504-drm-bridge-alloc-getput-panel_or_bridge-v4-0-b578c3daaf10@bootlin.com>
 <20260504-drm-bridge-alloc-getput-panel_or_bridge-v4-11-b578c3daaf10@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260504-drm-bridge-alloc-getput-panel_or_bridge-v4-11-b578c3daaf10@bootlin.com>
X-Rspamd-Queue-Id: 7335B4C0ADF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-105763-lists,linux-arm-msm=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,ideasonboard.com:dkim,ideasonboard.com:email,bootlin.com:email,killaraus.ideasonboard.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

On Mon, May 04, 2026 at 12:45:14PM +0200, Luca Ceresoli wrote:
> Up to now drm_of_find_panel_or_bridge() can be called with a bridge pointer
> only, a panel pointer only, or both a bridge and a panel pointers. The
> logic to handle all the three cases is somewhat complex to read however.
> 
> Now all bridge-only callers have been converted to
> of_drm_get_bridge_by_endpoint(), which is simpler and handles bridge
> refcounting. So forbid new bridge-only users by mandating a non-NULL panel
> pointer in the docs and in the sanity checks along with a warning.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
>  drivers/gpu/drm/drm_of.c | 26 ++++++++++++--------------
>  1 file changed, 12 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_of.c b/drivers/gpu/drm/drm_of.c
> index ef6b09316963..d03ada82eac9 100644
> --- a/drivers/gpu/drm/drm_of.c
> +++ b/drivers/gpu/drm/drm_of.c
> @@ -225,15 +225,15 @@ EXPORT_SYMBOL_GPL(drm_of_encoder_active_endpoint);
>   * @np: device tree node containing encoder output ports
>   * @port: port in the device tree node
>   * @endpoint: endpoint in the device tree node
> - * @panel: pointer to hold returned drm_panel
> + * @panel: pointer to hold returned drm_panel, must not be NULL
>   * @bridge: pointer to hold returned drm_bridge
>   *
>   * Given a DT node's port and endpoint number, find the connected node and
> - * return either the associated struct drm_panel or drm_bridge device. Either
> - * @panel or @bridge must not be NULL.
> + * return either the associated struct drm_panel or drm_bridge device.
>   *
>   * This function is deprecated and should not be used in new drivers. Use
> - * devm_drm_of_get_bridge() instead.
> + * of_drm_get_bridge_by_endpoint() instead when not looking for a panel, or
> + * devm_drm_of_get_bridge() otherwise.
>   *
>   * Returns zero if successful, or one of the standard error codes if it fails.
>   */
> @@ -245,10 +245,10 @@ int drm_of_find_panel_or_bridge(const struct device_node *np,
>  	int ret = -EPROBE_DEFER;
>  	struct device_node *remote;
>  
> -	if (!panel && !bridge)
> +	if (WARN_ON(!panel))
>  		return -EINVAL;
> -	if (panel)
> -		*panel = NULL;
> +
> +	*panel = NULL;
>  
>  	/*
>  	 * of_graph_get_remote_node() produces a noisy error message if port
> @@ -263,13 +263,11 @@ int drm_of_find_panel_or_bridge(const struct device_node *np,
>  	if (!remote)
>  		return -ENODEV;
>  
> -	if (panel) {
> -		*panel = of_drm_find_panel(remote);
> -		if (!IS_ERR(*panel))
> -			ret = 0;
> -		else
> -			*panel = NULL;
> -	}
> +	*panel = of_drm_find_panel(remote);
> +	if (!IS_ERR(*panel))
> +		ret = 0;
> +	else
> +		*panel = NULL;
>  
>  	if (bridge) {
>  		if (ret) {
> 

-- 
Regards,

Laurent Pinchart

