Return-Path: <linux-arm-msm+bounces-36998-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CA7E89BC574
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Nov 2024 07:34:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 07E461C20F90
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Nov 2024 06:34:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FFB219047D;
	Tue,  5 Nov 2024 06:33:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=manjaro.org header.i=@manjaro.org header.b="DS1U727c"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.manjaro.org (mail.manjaro.org [116.203.91.91])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 593352A1A4;
	Tue,  5 Nov 2024 06:33:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=116.203.91.91
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730788438; cv=none; b=FeWAqpd87D5EtPIgjsCEfvcJJSbb6HfZmPbSV1VBUnTAYdirK1Kf8czhhKtGs+12MO/zR1KkFBf7AWuIYkRP4GEldyfMOqe6F1yD1zLDy+fz/mwuSwMehXF6E5vfPTbNHwiQpg3smC0ZJcPdzCS5r/Ep5ixO3s1qr7eAYCR8bCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730788438; c=relaxed/simple;
	bh=R1utXRDZTq1k1v/1QRoa/HB0u8Grz0KqdusrKSnhVaI=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=R6pfZ27rz0yqVw1Wzn3jzOHZh8o5JWyBXrJssawx4JzJn9c5meYAp81Mms1fOQrJvYcIm1sMh+0CNg04oryJztlGm32STsKo/UX2UggBhrAf8s7AGBX32HYVBfes8WPjYiYdimAs3eRUo0vd96BQ152wCRH6QRBhw3lfYmc+Tgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=manjaro.org; spf=pass smtp.mailfrom=manjaro.org; dkim=pass (2048-bit key) header.d=manjaro.org header.i=@manjaro.org header.b=DS1U727c; arc=none smtp.client-ip=116.203.91.91
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=manjaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=manjaro.org
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=manjaro.org; s=2021;
	t=1730788434;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aTAKhxSFE8FvW11nxBit6CA7OkWpY8iwgm9r8H8Xrpg=;
	b=DS1U727cQQMKiGKjgi2ySybSh4sSk1DLW74/mB4SFQndpIqZSVN9n2j3+nXkmTPOuBRegb
	aA5s0UDKAOW3aMIUF2+0upqJriMxm2OMYgf4bfFIIe/IPGnUJlG7nJlsJHkzxI/rWNpVDU
	EfN5SJha5Nr6CjWfQIjbQYpVToL8XtrOAT6bIrMeKjRy4wBXxi8+uETESOSHISskujzuLC
	f1NWpEGJe3wnaTf6M9QZ9ZIurGL82YDS9nEj25ywbtKmQWwvVg91CtFjgtZ/lWovt0YqKM
	Heqy5jDSjKvF/hrql62SqOniX0/mTOU4GuHVWnlSxmMkVd1w9CGi6HClfE2OAQ==
Date: Tue, 05 Nov 2024 07:33:53 +0100
From: Dragan Simic <dsimic@manjaro.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Phong LE <ple@baylibre.com>, Neil Armstrong <neil.armstrong@linaro.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman
 <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Jessica Zhang
 <quic_jesszhan@quicinc.com>, Rob Clark <robdclark@gmail.com>, Abhinav Kumar
 <quic_abhinavk@quicinc.com>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Subject: Re: [PATCH] drm: Use of_property_present() for non-boolean properties
In-Reply-To: <20241104190636.274926-1-robh@kernel.org>
References: <20241104190636.274926-1-robh@kernel.org>
Message-ID: <16acf71de2a7d23f979ce286b2d8f606@manjaro.org>
X-Sender: dsimic@manjaro.org
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Authentication-Results: ORIGINATING;
	auth=pass smtp.auth=dsimic@manjaro.org smtp.mailfrom=dsimic@manjaro.org

Hello Rob,

On 2024-11-04 20:06, Rob Herring (Arm) wrote:
> The use of of_property_read_bool() for non-boolean properties is
> deprecated in favor of of_property_present() when testing for property
> presence.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

Looking good to me, thanks for the patch!

Reviewed-by: Dragan Simic <dsimic@manjaro.org>

> ---
>  drivers/gpu/drm/bridge/ite-it66121.c | 2 +-
>  drivers/gpu/drm/bridge/sii902x.c     | 2 +-
>  drivers/gpu/drm/drm_panel.c          | 2 +-
>  drivers/gpu/drm/msm/dsi/dsi_host.c   | 2 +-
>  4 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/ite-it66121.c
> b/drivers/gpu/drm/bridge/ite-it66121.c
> index 925e42f46cd8..0eae7c01b975 100644
> --- a/drivers/gpu/drm/bridge/ite-it66121.c
> +++ b/drivers/gpu/drm/bridge/ite-it66121.c
> @@ -1480,7 +1480,7 @@ static int it66121_audio_codec_init(struct
> it66121_ctx *ctx, struct device *dev)
> 
>  	dev_dbg(dev, "%s\n", __func__);
> 
> -	if (!of_property_read_bool(dev->of_node, "#sound-dai-cells")) {
> +	if (!of_property_present(dev->of_node, "#sound-dai-cells")) {
>  		dev_info(dev, "No \"#sound-dai-cells\", no audio\n");
>  		return 0;
>  	}
> diff --git a/drivers/gpu/drm/bridge/sii902x.c 
> b/drivers/gpu/drm/bridge/sii902x.c
> index 7f91b0db161e..f73e1174a5ad 100644
> --- a/drivers/gpu/drm/bridge/sii902x.c
> +++ b/drivers/gpu/drm/bridge/sii902x.c
> @@ -850,7 +850,7 @@ static int sii902x_audio_codec_init(struct sii902x 
> *sii902x,
>  	u8 lanes[4];
>  	int num_lanes, i;
> 
> -	if (!of_property_read_bool(dev->of_node, "#sound-dai-cells")) {
> +	if (!of_property_present(dev->of_node, "#sound-dai-cells")) {
>  		dev_dbg(dev, "%s: No \"#sound-dai-cells\", no audio\n",
>  			__func__);
>  		return 0;
> diff --git a/drivers/gpu/drm/drm_panel.c b/drivers/gpu/drm/drm_panel.c
> index 19ab0a794add..46d61cc871ca 100644
> --- a/drivers/gpu/drm/drm_panel.c
> +++ b/drivers/gpu/drm/drm_panel.c
> @@ -413,7 +413,7 @@ bool drm_is_panel_follower(struct device *dev)
>  	 * don't bother trying to parse it here. We just need to know if the
>  	 * property is there.
>  	 */
> -	return of_property_read_bool(dev->of_node, "panel");
> +	return of_property_present(dev->of_node, "panel");
>  }
>  EXPORT_SYMBOL(drm_is_panel_follower);
> 
> diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c
> b/drivers/gpu/drm/msm/dsi/dsi_host.c
> index 185d7de0bf37..78cac4ecc58f 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
> @@ -1831,7 +1831,7 @@ static int dsi_host_parse_dt(struct msm_dsi_host
> *msm_host)
>  		msm_dsi->te_source = devm_kstrdup(dev, te_source, GFP_KERNEL);
>  	ret = 0;
> 
> -	if (of_property_read_bool(np, "syscon-sfpb")) {
> +	if (of_property_present(np, "syscon-sfpb")) {
>  		msm_host->sfpb = syscon_regmap_lookup_by_phandle(np,
>  					"syscon-sfpb");
>  		if (IS_ERR(msm_host->sfpb)) {

