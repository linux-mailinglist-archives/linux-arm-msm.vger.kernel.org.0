Return-Path: <linux-arm-msm+bounces-36984-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 312649BBEFF
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Nov 2024 21:48:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 62E6E1C21DCA
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Nov 2024 20:48:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27F261F7087;
	Mon,  4 Nov 2024 20:48:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="qRa8bjlJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C36C19F42F;
	Mon,  4 Nov 2024 20:48:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730753305; cv=none; b=R3/+o6PIXaFxnghmgqfDmOr8fKJsmbJSbuVrFR203sXEVI+6ZcXUzghGcQWAQqDs8Xv6O32cPJkPDCDsJnLR2HrEgSZUYLycDdUQSbhFEfbtonC3vvvJO6LIFOgC3Fy7SvJN/r5U/neWGeAZJFpC1/ilUplGWmpWEWGOctE5E7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730753305; c=relaxed/simple;
	bh=Z8UDWsXrUthXbSmeoHROE3eOTBPFWR2aQNgiSEx7+/c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jab18Bco6gYLTgOKHKwhaT/lVbY/5n3A2lwjdwcwPwDNst7xZNjrwC1bjoTSVHpidejwoN2AR/hhFSYLMFP4Qhhc1pdhgSutUzANa/rhIZKrrr8FH7k19ZKyvnmP45sWliSlKvsAzZUP8czjOeNa0RGeL5cl8U1gcdfqDEJ8Hko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=qRa8bjlJ; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 94634526;
	Mon,  4 Nov 2024 21:48:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1730753292;
	bh=Z8UDWsXrUthXbSmeoHROE3eOTBPFWR2aQNgiSEx7+/c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qRa8bjlJHdsP4URju4XjamGR0cDwZ/9WMzT8jEelFrDm9iZpi4jSd77MULcNMOshM
	 XvAvmNfy2uIGTWhDgBpFnntaekTXQT0zoToLaqMUVabgjysmMdBGv/tLosSIqq0qhP
	 hp3zyDEN+kILVwxwmfHEXveT4u7wp0Swhgnv511c=
Date: Mon, 4 Nov 2024 22:48:14 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Phong LE <ple@baylibre.com>, Neil Armstrong <neil.armstrong@linaro.org>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Robert Foss <rfoss@kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Jessica Zhang <quic_jesszhan@quicinc.com>,
	Rob Clark <robdclark@gmail.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Subject: Re: [PATCH] drm: Use of_property_present() for non-boolean properties
Message-ID: <20241104204814.GC27775@pendragon.ideasonboard.com>
References: <20241104190636.274926-1-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241104190636.274926-1-robh@kernel.org>

Hi Rob,

Thank you for the patch.

On Mon, Nov 04, 2024 at 01:06:35PM -0600, Rob Herring (Arm) wrote:
> The use of of_property_read_bool() for non-boolean properties is
> deprecated in favor of of_property_present() when testing for property
> presence.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/gpu/drm/bridge/ite-it66121.c | 2 +-
>  drivers/gpu/drm/bridge/sii902x.c     | 2 +-
>  drivers/gpu/drm/drm_panel.c          | 2 +-
>  drivers/gpu/drm/msm/dsi/dsi_host.c   | 2 +-
>  4 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/ite-it66121.c b/drivers/gpu/drm/bridge/ite-it66121.c
> index 925e42f46cd8..0eae7c01b975 100644
> --- a/drivers/gpu/drm/bridge/ite-it66121.c
> +++ b/drivers/gpu/drm/bridge/ite-it66121.c
> @@ -1480,7 +1480,7 @@ static int it66121_audio_codec_init(struct it66121_ctx *ctx, struct device *dev)
>  
>  	dev_dbg(dev, "%s\n", __func__);
>  
> -	if (!of_property_read_bool(dev->of_node, "#sound-dai-cells")) {
> +	if (!of_property_present(dev->of_node, "#sound-dai-cells")) {
>  		dev_info(dev, "No \"#sound-dai-cells\", no audio\n");
>  		return 0;
>  	}
> diff --git a/drivers/gpu/drm/bridge/sii902x.c b/drivers/gpu/drm/bridge/sii902x.c
> index 7f91b0db161e..f73e1174a5ad 100644
> --- a/drivers/gpu/drm/bridge/sii902x.c
> +++ b/drivers/gpu/drm/bridge/sii902x.c
> @@ -850,7 +850,7 @@ static int sii902x_audio_codec_init(struct sii902x *sii902x,
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
> diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
> index 185d7de0bf37..78cac4ecc58f 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
> @@ -1831,7 +1831,7 @@ static int dsi_host_parse_dt(struct msm_dsi_host *msm_host)
>  		msm_dsi->te_source = devm_kstrdup(dev, te_source, GFP_KERNEL);
>  	ret = 0;
>  
> -	if (of_property_read_bool(np, "syscon-sfpb")) {
> +	if (of_property_present(np, "syscon-sfpb")) {
>  		msm_host->sfpb = syscon_regmap_lookup_by_phandle(np,
>  					"syscon-sfpb");
>  		if (IS_ERR(msm_host->sfpb)) {

-- 
Regards,

Laurent Pinchart

