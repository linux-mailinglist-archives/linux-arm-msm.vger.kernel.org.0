Return-Path: <linux-arm-msm+bounces-105761-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6H8CGCq6+Gnh0AIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105761-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 04 May 2026 17:24:26 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id F357C4C0A18
	for <lists+linux-arm-msm@lfdr.de>; Mon, 04 May 2026 17:24:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 583FE30071EE
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 May 2026 15:24:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 578E13DFC94;
	Mon,  4 May 2026 15:24:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="B61SUdKb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF5FC39524B;
	Mon,  4 May 2026 15:24:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777908263; cv=none; b=IxzYWSyEWc7Pj2a1qd36Qdr5AxvvvDiC7PWI7MpBQrjQlxDWB69KTzn47B0T5mLyI9ieKN2CwIAd/npCDp45GulB5hGNGjvWO7h2UXvg5G/Hsj3PRwndZIJwp4cjzDIIKjmT2b/o9cHJK7KdkpPhXPUCRs90UT9XzPxQ3H3H0k4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777908263; c=relaxed/simple;
	bh=yz5CJzoCekoxmuhkSUxICdRVDMPN012+4TnwLeJXyT0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RtlKyTbjTTIHEafpKVIhkbSzhcZ1q0VFtZe6NIDGYyt4VGGJN2U7ZD3KiQicvcBS50iqEaTKsZSpbtVpvxwjSCd7fEMFiBhYwwkRM97uANL4c/2+0vkKVN1vIYq8D7Ihp4ILM4t0krEyMNj4LX/o4hpnMebkQZHtTbC8JxSf3tg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=B61SUdKb; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from killaraus.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7D9E7175;
	Mon,  4 May 2026 17:24:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1777908257;
	bh=yz5CJzoCekoxmuhkSUxICdRVDMPN012+4TnwLeJXyT0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=B61SUdKbg+TBoeJcmGjMgIBh7kyNGLwCDoIVmQHw6UmyS2Z3VRmOTu/32ZobUYVGW
	 dbG6Benp8XPSbsjfBi1yDix1qMnHaedC+BVRBFN+KPYfu6fGF3RspbWz7B7ImZAjVX
	 NZ+NnuYkhZh2W4rpi11v3DQfaPbKXmN+hkOONYx8=
Date: Mon, 4 May 2026 18:24:18 +0300
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
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v4 10/11] drm: zynqmp_dp: switch to
 of_drm_get_bridge_by_endpoint()
Message-ID: <20260504152418.GC1455860@killaraus.ideasonboard.com>
References: <20260504-drm-bridge-alloc-getput-panel_or_bridge-v4-0-b578c3daaf10@bootlin.com>
 <20260504-drm-bridge-alloc-getput-panel_or_bridge-v4-10-b578c3daaf10@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260504-drm-bridge-alloc-getput-panel_or_bridge-v4-10-b578c3daaf10@bootlin.com>
X-Rspamd-Queue-Id: F357C4C0A18
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-105761-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[intel.com,linaro.org,kernel.org,kwiboo.se,gmail.com,linux.intel.com,suse.de,ffwll.ch,oss.qualcomm.com,linux.dev,poorly.run,somainline.org,google.com,ideasonboard.com,amd.com,gehealthcare.com,bootlin.com,lists.freedesktop.org,vger.kernel.org,lists.infradead.org];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[29];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_PROHIBIT(0.00)[0.0.0.5:email];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[laurent.pinchart@ideasonboard.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bootlin.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,ideasonboard.com:dkim,ideasonboard.com:email,killaraus.ideasonboard.com:mid]

Hi Luca,

Thank you for the patch.

On Mon, May 04, 2026 at 12:45:13PM +0200, Luca Ceresoli wrote:
> This driver calls drm_of_find_panel_or_bridge() with a NULL pointer in the
> @panel parameter, thus using a reduced feature set of that function.
> Replace this call with the simpler of_drm_get_bridge_by_endpoint().
> 
> Since of_drm_get_bridge_by_endpoint() increases the refcount of the
> returned bridge, ensure it is put on removal. To achieve this, instead of
> adding an explicit drm_bridge_put(), migrate to the bridge::next_bridge
> pointer which is automatically put when the bridge is eventually freed.
> 
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> ---
> 
> Changes in v4:
> - fix missing assignment
> 
> Changes in v3:
> - fix ERR_PTR deref when -ENODEV is returned
> ---
>  drivers/gpu/drm/xlnx/zynqmp_dp.c | 19 +++++++++++--------
>  1 file changed, 11 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xlnx/zynqmp_dp.c b/drivers/gpu/drm/xlnx/zynqmp_dp.c
> index 379180fb3004..fd30491a6697 100644
> --- a/drivers/gpu/drm/xlnx/zynqmp_dp.c
> +++ b/drivers/gpu/drm/xlnx/zynqmp_dp.c
> @@ -353,7 +353,6 @@ struct zynqmp_dp_train_set_priv {
>   * @lock: Mutex protecting this struct and register access (but not AUX)
>   * @irq: irq
>   * @bridge: DRM bridge for the DP encoder
> - * @next_bridge: The downstream bridge
>   * @test: Configuration for test mode
>   * @config: IP core configuration from DTS
>   * @aux: aux channel
> @@ -385,7 +384,6 @@ struct zynqmp_dp {
>  	struct completion aux_done;
>  	struct mutex lock;
>  
> -	struct drm_bridge *next_bridge;
>  	struct device *dev;
>  	struct zynqmp_dpsub *dpsub;
>  	void __iomem *iomem;
> @@ -1494,8 +1492,8 @@ static int zynqmp_dp_bridge_attach(struct drm_bridge *bridge,
>  		return ret;
>  	}
>  
> -	if (dp->next_bridge) {
> -		ret = drm_bridge_attach(encoder, dp->next_bridge,
> +	if (dp->bridge.next_bridge) {
> +		ret = drm_bridge_attach(encoder, dp->bridge.next_bridge,
>  					bridge, flags);
>  		if (ret < 0)
>  			goto error;
> @@ -2461,10 +2459,15 @@ int zynqmp_dp_probe(struct zynqmp_dpsub *dpsub)
>  	 * Acquire the next bridge in the chain. Ignore errors caused by port@5
>  	 * not being connected for backward-compatibility with older DTs.
>  	 */
> -	ret = drm_of_find_panel_or_bridge(dp->dev->of_node, 5, 0, NULL,
> -					  &dp->next_bridge);
> -	if (ret < 0 && ret != -ENODEV)
> -		goto err_reset;
> +	dp->bridge.next_bridge = of_drm_get_bridge_by_endpoint(dp->dev->of_node, 5, 0);
> +	if (IS_ERR(dp->bridge.next_bridge)) {
> +		if (PTR_ERR(dp->bridge.next_bridge) == -ENODEV) {
> +			dp->bridge.next_bridge = NULL;
> +		} else {
> +			ret = PTR_ERR(dp->bridge.next_bridge);
> +			goto err_reset;
> +		}

I would find

		if (PTR_ERR(dp->bridge.next_bridge) != -ENODEV) {
			ret = PTR_ERR(dp->bridge.next_bridge);
			goto err_reset;
		}

		dp->bridge.next_bridge = NULL;

easier to read. Up to you.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> +	}
>  
>  	/* Initialize the hardware. */
>  	dp->config.misc0 &= ~ZYNQMP_DP_MAIN_STREAM_MISC0_SYNC_LOCK;

-- 
Regards,

Laurent Pinchart

