Return-Path: <linux-arm-msm+bounces-108392-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SEt9CDIYDGrrVwUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108392-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 09:58:42 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 921AF5798B9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 09:58:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3ED26302ACC7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 07:54:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4738F3DD537;
	Tue, 19 May 2026 07:54:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="DTGxDZan"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D588A3DDDD2;
	Tue, 19 May 2026 07:54:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779177268; cv=none; b=G1+SF/v84arxIPduDSUgL/KSpi9nhlYCMOPivTkvVCME4JdgBiXzvW5UZL1mLvmKAgesWaJkKrc4Zl5lh0RUtQVbcUZt1evX+ILntZ/V1uaKuZTaoIJqbqRWPy2n3Z0HUi61IVh5a+wnGhQqdAuS1zPQQxheONmsDBEoQnMO91s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779177268; c=relaxed/simple;
	bh=p9Kn+nq0Rw66XCZUPNN5DwxwPOWf/mOpjM0cIIg/0cA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pl1FNk6X7FaOMMuLNA4RnLuyPbvCN2a8EtybrG6qYvw0uzUw6pMwoQwu3stJIUf6SLLZAftsZTdejh/FPN3zCJPj1n/1ubxB3hA3XovLLxc4Wdyy5e3lk3KfdZUHWTGGpBeDtwn5BdLuw/HOPNyrmI/SgX1wZfvkqtkTOrT5/Ec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=DTGxDZan; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 4DA08C2B9E9;
	Tue, 19 May 2026 07:55:13 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 22CBE606E9;
	Tue, 19 May 2026 07:54:20 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E4A1711AF8B49;
	Tue, 19 May 2026 09:54:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1779177258; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=Z4KnRYZbP+JppkyB6UHdCEixFKEe8lfBspS/MMvjMwc=;
	b=DTGxDZanSusl2R3sUqE3bN+Ehf8q0haUVgOYOc4Gk1igIrFedIqbwNaCBSCQEhBOnD9Moz
	lt1L717qNYWu/BANBxN6i3b+/HdJlRHHvO9/zCE77Tl1W0vxOlf6Dt00bbku9mewWw+EmT
	Z66UPE4QUFyBVeBnfklE+Oa+zTGJZwjfF4hMAlu+UgNievdl5lMgncjj0tZdTdCr8cIYZ/
	FOi9GSIO0j/8nS1rjU4zeRZUud7Gm+s737qGJ9zxda4GQcc/TnM1FKD8ISVMK9BWxmiASE
	GFnNEnGfgSeb7LUV5YAtKvDtkqzlgSrbvvswG8aKFJsyVCqXXfrg4YYS3fAamQ==
Message-ID: <1b19a798-bc7d-4f51-9e32-ac4b05b30648@bootlin.com>
Date: Mon, 18 May 2026 10:52:01 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 04/11] drm/hisilicon/kirin: switch to
 of_drm_get_bridge_by_endpoint()
To: Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov
 <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Sumit Semwal <sumit.semwal@linaro.org>, John Stultz <jstultz@google.com>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Michal Simek <michal.simek@amd.com>
Cc: Hui Pu <Hui.Pu@gehealthcare.com>, Ian Ray <ian.ray@gehealthcare.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org
References: <20260511-drm-bridge-alloc-getput-panel_or_bridge-v6-0-f61c9e498b3f@bootlin.com>
 <20260511-drm-bridge-alloc-getput-panel_or_bridge-v6-4-f61c9e498b3f@bootlin.com>
From: Louis Chauvet <louis.chauvet@bootlin.com>
Content-Language: en-US
In-Reply-To: <20260511-drm-bridge-alloc-getput-panel_or_bridge-v6-4-f61c9e498b3f@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-108392-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_TO(0.00)[bootlin.com,intel.com,linaro.org,kernel.org,ideasonboard.com,kwiboo.se,gmail.com,linux.intel.com,suse.de,ffwll.ch,oss.qualcomm.com,linux.dev,poorly.run,somainline.org,google.com,amd.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[30];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[louis.chauvet@bootlin.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[bootlin.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bootlin.com:email,bootlin.com:mid,bootlin.com:dkim,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 921AF5798B9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 5/11/26 18:40, Luca Ceresoli wrote:
> This driver calls drm_of_find_panel_or_bridge() with a NULL pointer in the
> @panel parameter, thus using a reduced feature set of that function.
> Replace this call with the simpler of_drm_get_bridge_by_endpoint().
> 
> Since of_drm_get_bridge_by_endpoint() increases the refcount of the
> returned bridge, ensure it is put on removal. Here the bridge pointer is
> only stored in a temporary variable, so a cleanup action is enough.
> 
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>

> ---
>   drivers/gpu/drm/hisilicon/kirin/dw_drm_dsi.c | 9 ++++-----
>   1 file changed, 4 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/hisilicon/kirin/dw_drm_dsi.c b/drivers/gpu/drm/hisilicon/kirin/dw_drm_dsi.c
> index e80debdc4176..ab3cd309505a 100644
> --- a/drivers/gpu/drm/hisilicon/kirin/dw_drm_dsi.c
> +++ b/drivers/gpu/drm/hisilicon/kirin/dw_drm_dsi.c
> @@ -778,17 +778,16 @@ static int dsi_host_init(struct device *dev, struct dw_dsi *dsi)
>   static int dsi_bridge_init(struct drm_device *dev, struct dw_dsi *dsi)
>   {
>   	struct drm_encoder *encoder = &dsi->encoder;
> -	struct drm_bridge *bridge;
> +	struct drm_bridge *bridge __free(drm_bridge_put) = NULL;
>   	struct device_node *np = dsi->dev->of_node;
> -	int ret;
>   
>   	/*
>   	 * Get the endpoint node. In our case, dsi has one output port1
>   	 * to which the external HDMI bridge is connected.
>   	 */
> -	ret = drm_of_find_panel_or_bridge(np, 1, 0, NULL, &bridge);
> -	if (ret)
> -		return ret;
> +	bridge = of_drm_get_bridge_by_endpoint(np, 1, 0);
> +	if (IS_ERR(bridge))
> +		return PTR_ERR(bridge);
>   
>   	/* associate the bridge to dsi encoder */
>   	return drm_bridge_attach(encoder, bridge, NULL, 0);
> 


