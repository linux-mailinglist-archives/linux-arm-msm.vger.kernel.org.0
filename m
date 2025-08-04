Return-Path: <linux-arm-msm+bounces-67721-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D3542B1ABA2
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Aug 2025 01:58:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EB25A17FC21
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Aug 2025 23:58:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA8A023C50A;
	Mon,  4 Aug 2025 23:58:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="snvGIcIC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64B5E1D63F3;
	Mon,  4 Aug 2025 23:58:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754351926; cv=none; b=FnoLady9kuE7mFLYwyFQYTnc0wNDqp2Pj69iPys2jd2RnMCZSrBDdfLtyLpNa96aW2DG4rWU9kwPlrA5KxOr9pGTGYtqveD4IeBkCWNXu3FZE/7wHxNUaB1ODfOda1FA/01S9NckLDArIvfSGmNHL4hbnjz1dTuixMUS81T04Kc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754351926; c=relaxed/simple;
	bh=xvDuUlev+04p4U9jo1+uLE4n667zhbNiWstDokcyGiE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W8GvgK9M3ccdYsJ2BbB57WKlPfFWHld7NM7S0npmWEPgJ+y/7bGp/4fvDxuWVfEnfpvQCZVYYMelNwr1VOzjGK6y2wjqbYqhtkrMpZGqykiPxhw2vI4cEUMnWZPH7wlaqHeHhmRnEXuxm88Om7O3imvRaL9blVdxPqcm451tbDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=snvGIcIC; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id BACD032FD;
	Tue,  5 Aug 2025 01:57:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1754351876;
	bh=xvDuUlev+04p4U9jo1+uLE4n667zhbNiWstDokcyGiE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=snvGIcICncsh5uVCmCcjSddnV5EIW67EBCKx81tkWqcHzhQlKKaRnbe3iFUFYVrcV
	 GVaBDKrBLSi32U1/gki15Q7wxrRF4S1UDE5+2DhxYZ/W22lV9QuMNuh+5+djX5wm0i
	 IIBIbNfQL3mI8lExPh7nkQ/F5CaqVgNr2U/zvmmc=
Date: Tue, 5 Aug 2025 02:58:29 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] drm/bridge: display-connector: don't set OP_DETECT for
 DisplayPorts
Message-ID: <20250804235829.GC12087@pendragon.ideasonboard.com>
References: <20250802-dp-conn-no-detect-v1-1-2748c2b946da@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250802-dp-conn-no-detect-v1-1-2748c2b946da@oss.qualcomm.com>

Hi Dmitry,

Thank you for the patch.

On Sat, Aug 02, 2025 at 01:40:35PM +0300, Dmitry Baryshkov wrote:
> Detecting the monitor for DisplayPort targets is more complicated than
> just reading the HPD pin level: it requires reading the DPCD in order to
> check what kind of device is attached to the port and whether there is
> an actual display attached.
> 
> In order to let DRM framework handle such configurations, disable
> DRM_BRIDGE_OP_DETECT for dp-connector devices, letting the actual DP
> driver perform detection. This still keeps DRM_BRIDGE_OP_HPD enabled, so
> it is valid for the bridge to report HPD events.
> 
> Currently inside the kernel there are only two targets which list
> hpd-gpios for dp-connector devices: arm64/qcom/qcs6490-rb3gen2 and
> arm64/qcom/sa8295p-adp. Both should be fine with this change.
> 
> Cc: Bjorn Andersson <andersson@kernel.org>
> Cc: Konrad Dybcio <konradybcio@kernel.org>
> Cc: linux-arm-msm@vger.kernel.org
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Makes sense.

Acked-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
>  drivers/gpu/drm/bridge/display-connector.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/bridge/display-connector.c b/drivers/gpu/drm/bridge/display-connector.c
> index d7e1c2f8f53cad514ec502d58c1b94d348515b42..e9f16dbc953533c2a2d329ee8fd50c1923a78aac 100644
> --- a/drivers/gpu/drm/bridge/display-connector.c
> +++ b/drivers/gpu/drm/bridge/display-connector.c
> @@ -373,7 +373,8 @@ static int display_connector_probe(struct platform_device *pdev)
>  	if (conn->bridge.ddc)
>  		conn->bridge.ops |= DRM_BRIDGE_OP_EDID
>  				 |  DRM_BRIDGE_OP_DETECT;
> -	if (conn->hpd_gpio)
> +	/* Detecting the monitor requires reading DPCD */
> +	if (conn->hpd_gpio && type != DRM_MODE_CONNECTOR_DisplayPort)
>  		conn->bridge.ops |= DRM_BRIDGE_OP_DETECT;
>  	if (conn->hpd_irq >= 0)
>  		conn->bridge.ops |= DRM_BRIDGE_OP_HPD;
> 
> ---
> base-commit: 82928cc1c2b2be16ea6ee9e23799ca182e1cd37c
> change-id: 20250802-dp-conn-no-detect-b901893b5e3c

-- 
Regards,

Laurent Pinchart

