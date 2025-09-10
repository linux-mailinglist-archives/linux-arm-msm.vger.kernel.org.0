Return-Path: <linux-arm-msm+bounces-72957-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D34AB51503
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Sep 2025 13:10:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C3732463968
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Sep 2025 11:10:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BCAE531AF23;
	Wed, 10 Sep 2025 11:08:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GZg4a9Pz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9069B31690C;
	Wed, 10 Sep 2025 11:08:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757502513; cv=none; b=b7javr6P1pol3gm1pgZ9/LmEcpSUjMwedHGcIqawsLtQ28hns0dC9D/LCXPL+RiCWarbHa0BrWvBQlNDNMLHONHYXVkwLzjvCpRUKTz71v0T6QMjwZSLk9An57VxLPj7Ya/8GvcCS/yhR0ZRqxi6xRYsQ81iWQfXukpd9VhM+9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757502513; c=relaxed/simple;
	bh=eT+fM0/l96U9E80CByHY3UpL1VMyoPh2jRe5J041drA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VdYeI9I81ny6eawsHXL4gHusrdFcfqWdahyddvQuidDG4SYN5qzD7lIJwoi1qmxVI/bPq9M4tNVOTaYIhpjruubHtxaGlXkGF/IliGTVLb8e7lF26cjTF0fBUqFKn+kPPnG+/zfoKDwUhYDSBwOtgOibfeAl/7NO9OOeswO/YGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GZg4a9Pz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D442C4CEF8;
	Wed, 10 Sep 2025 11:08:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757502513;
	bh=eT+fM0/l96U9E80CByHY3UpL1VMyoPh2jRe5J041drA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GZg4a9PzOThwfZJWjmmg1do+BJcK6fKqRVNE1sq+YdWBDlnHaURSjrRlxZ7+9DH4N
	 Db+CuYerpenQhklpoGj+sHRilAxDRpInKvZJFpf3X1NCOLLQCBlcF189fa3pyP4fw4
	 ufx5Lufwft1vqYQ0u4pu16D0r5dE6FepR8/Y2m7Bl1iWB50ud8cl9nr4fE/W1LSLys
	 FYy4EKSZ0zBJNrEh6t7tmcyrIUrM+yDEihmZQ6+XVKFqbhMuCNH5+DEntCodxdQULf
	 ZowH6/I7RWxU+6aGkzICbmkk9ffdQk6E6ckIxF6EdRydu3MVPbheSr9BgPt07IhG8H
	 9PwdxdvRijCMA==
Date: Wed, 10 Sep 2025 13:08:30 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Sandy Huang <hjc@rock-chips.com>, 
	Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>, Andy Yan <andy.yan@rock-chips.com>, Chen-Yu Tsai <wens@csie.org>, 
	Samuel Holland <samuel@sholland.org>, Dave Stevenson <dave.stevenson@raspberrypi.com>, 
	=?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>, Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
	Liu Ying <victor.liu@nxp.com>, Rob Clark <robin.clark@oss.qualcomm.com>, 
	Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>, 
	Jessica Zhang <jessica.zhang@oss.qualcomm.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, 
	Daniel Stone <daniels@collabora.com>
Subject: Re: [PATCH v4 09/10] drm/connector: verify that HDMI connectors
 support necessary InfoFrames
Message-ID: <20250910-courageous-warthog-of-refinement-aced6f@houat>
References: <20250909-drm-limit-infoframes-v4-0-53fd0a65a4a2@oss.qualcomm.com>
 <20250909-drm-limit-infoframes-v4-9-53fd0a65a4a2@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="xkhodzl7phtwfggk"
Content-Disposition: inline
In-Reply-To: <20250909-drm-limit-infoframes-v4-9-53fd0a65a4a2@oss.qualcomm.com>


--xkhodzl7phtwfggk
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v4 09/10] drm/connector: verify that HDMI connectors
 support necessary InfoFrames
MIME-Version: 1.0

On Tue, Sep 09, 2025 at 05:52:07PM +0300, Dmitry Baryshkov wrote:
> Check that connector initialized by drmm_connector_hdmi_init() supports
> AVI InfoFrames and warn if it doesn't support Vendor-Specific
> InfofRames (HDMI InfoFrames are more or less required).
>=20
> Suggested-by: Maxime Ripard <mripard@kernel.org>
> Acked-by: Daniel Stone <daniels@collabora.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/drm_connector.c | 7 +++++++
>  1 file changed, 7 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connec=
tor.c
> index 92a75684a0f7375d3a94e8c666cb71064ecc8035..222a0ef66d9fdbdb56108ceeb=
40e7f369d810350 100644
> --- a/drivers/gpu/drm/drm_connector.c
> +++ b/drivers/gpu/drm/drm_connector.c
> @@ -602,6 +602,13 @@ int drmm_connector_hdmi_init(struct drm_device *dev,
>  	if (!(max_bpc =3D=3D 8 || max_bpc =3D=3D 10 || max_bpc =3D=3D 12))
>  		return -EINVAL;
> =20
> +	/* AVI is required */
> +	if (!(supported_infoframes & DRM_CONNECTOR_INFOFRAME_AVI))
> +		return -EINVAL;
> +
> +	if (!(supported_infoframes & DRM_CONNECTOR_INFOFRAME_VENDOR))
> +		drm_info(dev, "HDMI connector with no support for Vendor-Specific Info=
Frame\n");
> +

Same remark than on patch 10. It's not something we can check at init
time, and we should check (and document!) that if we expect an infoframe
to be written but the write_infoframe hook doesn't support it, it's an
error.

Maxime

--xkhodzl7phtwfggk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaMFcLgAKCRAnX84Zoj2+
do1pAXoDY9Dzn6G/ClMn6Qt9h6baw0nSCc1SPEDOnOlKYoD9BSE05V70x5Sqi0rR
wJwIv2ABgME+k6f+wI13qd1Ah1huLB0li8xpIpRZTte9l8GEmuSdXIv2pGQJKmjF
/tLAINKY3g==
=JQzw
-----END PGP SIGNATURE-----

--xkhodzl7phtwfggk--

