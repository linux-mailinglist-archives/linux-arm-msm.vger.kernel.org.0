Return-Path: <linux-arm-msm+bounces-105753-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ELjGFqOl+GnQxQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105753-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 04 May 2026 15:56:51 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 23BF94BE291
	for <lists+linux-arm-msm@lfdr.de>; Mon, 04 May 2026 15:56:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 974673013AA1
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 May 2026 13:53:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B2823D47D0;
	Mon,  4 May 2026 13:53:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="exN6jme3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FB0A3D6481;
	Mon,  4 May 2026 13:53:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777902787; cv=none; b=SupZDN3vpleM98MyVU/AX1XTmyTaOeXyNolZSH73r8JS6ErJWAJ0/FBtXe8MLYCSQHH3fcv9us0S+GYQJt58C162/wdPBqo50hHWF7VoX62gf48DILpf57guJfJOcfMe+K3RcO33fWhcSxfdojJFg5T1Ygkq0Z46ikQ2BiHrM5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777902787; c=relaxed/simple;
	bh=jAmwC7RoNIdGSDJJnfsMWk2C7VRG5k4+P0kWxDw9Xwc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CjjSiivgjRt7a4cMEv0RmVoKw9JEKpCzmYCVMhLs1KTNBd3em43Ar8G0DGpSqPodrM2UNp0UMBpvzmqEWEqi2Idv58S+Jdpded6prcxxNFN8Pz30yPvIcTmg9OJPFHMIIN60T5E6vJT+il+FLpcjGnHxrEo8cWjHpF8fMh8+8NM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=exN6jme3; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from killaraus.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id F04A69C;
	Mon,  4 May 2026 15:52:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1777902780;
	bh=jAmwC7RoNIdGSDJJnfsMWk2C7VRG5k4+P0kWxDw9Xwc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=exN6jme3FnN7ZdO5dMT/84j58aS3PmMfbugbcsP5HQfKmXzQeMcPeaceQi3LUlvYy
	 14u80HmmnjNDtQbvRSMWvGlbBMYR1/5ISJlmGaTbSIFKRBeISfpeJr4m04M6OyWwT9
	 tIcGO430tOAc9odmsPTKtdJsFUpSNNMGDC2X6S7Q=
Date: Mon, 4 May 2026 16:53:00 +0300
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
Subject: Re: [PATCH v4 01/11] drm/bridge: drm_bridge_get/put(): ignore ERR_PTR
Message-ID: <20260504135300.GE1344263@killaraus.ideasonboard.com>
References: <20260504-drm-bridge-alloc-getput-panel_or_bridge-v4-0-b578c3daaf10@bootlin.com>
 <20260504-drm-bridge-alloc-getput-panel_or_bridge-v4-1-b578c3daaf10@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260504-drm-bridge-alloc-getput-panel_or_bridge-v4-1-b578c3daaf10@bootlin.com>
X-Rspamd-Queue-Id: 23BF94BE291
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-105753-lists,linux-arm-msm=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,ideasonboard.com:dkim,ideasonboard.com:email,bootlin.com:email,killaraus.ideasonboard.com:mid,qualcomm.com:email]

On Mon, May 04, 2026 at 12:45:04PM +0200, Luca Ceresoli wrote:
> Most functions returning a struct drm_bridge pointer currently return a
> valid pointer or NULL, but this restricts their ability to return an error
> code describing the error kind.
> 
> In preparation to have new APIs that can return a struct drm_bridge pointer
> holding an ERR_PTR (and for those which already do) make drm_bridge_get()
> and drm_bridge_put() ignore ERR_PTR values, just like they ignore NULL
> pointers.

The change in drm_bridge_put() looks good to me. I'm less sure about
drm_bridge_get(), is there a valid use case to call get() on a bridge
that is not valid ? Doesn't it indicate a clear error in the caller ?

> This will avoid annoying error checking in many places and the risk of
> missing error checks.
> 
> Suggested-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Link: https://lore.kernel.org/all/20260318152533.GA633439@killaraus.ideasonboard.com/
> Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Link: https://lore.kernel.org/all/omlnswxukeqgnatzdvooaashgkfcacjevkvbkm6xt33itgua2k@jcmzll2w6kdq/
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> ---
> 
> Changes in v4:
> - removed incorrect change to drm_bridge_clear_and_put() kdoc
> 
> Patch added in v2
> ---
>  drivers/gpu/drm/drm_bridge.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
> index d4b3478258ec..6fb71de6d22a 100644
> --- a/drivers/gpu/drm/drm_bridge.c
> +++ b/drivers/gpu/drm/drm_bridge.c
> @@ -282,7 +282,7 @@ static void __drm_bridge_free(struct kref *kref)
>  
>  /**
>   * drm_bridge_get - Acquire a bridge reference
> - * @bridge: DRM bridge; if NULL this function does nothing
> + * @bridge: DRM bridge; if NULL or an ERR_PTR this function does nothing
>   *
>   * This function increments the bridge's refcount.
>   *
> @@ -291,7 +291,7 @@ static void __drm_bridge_free(struct kref *kref)
>   */
>  struct drm_bridge *drm_bridge_get(struct drm_bridge *bridge)
>  {
> -	if (bridge)
> +	if (!IS_ERR_OR_NULL(bridge))
>  		kref_get(&bridge->refcount);
>  
>  	return bridge;
> @@ -300,7 +300,7 @@ EXPORT_SYMBOL(drm_bridge_get);
>  
>  /**
>   * drm_bridge_put - Release a bridge reference
> - * @bridge: DRM bridge; if NULL this function does nothing
> + * @bridge: DRM bridge; if NULL or an ERR_PTR this function does nothing
>   *
>   * This function decrements the bridge's reference count and frees the
>   * object if the reference count drops to zero.
> @@ -310,7 +310,7 @@ EXPORT_SYMBOL(drm_bridge_get);
>   */
>  void drm_bridge_put(struct drm_bridge *bridge)
>  {
> -	if (bridge)
> +	if (!IS_ERR_OR_NULL(bridge))
>  		kref_put(&bridge->refcount, __drm_bridge_free);
>  }
>  EXPORT_SYMBOL(drm_bridge_put);

-- 
Regards,

Laurent Pinchart

