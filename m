Return-Path: <linux-arm-msm+bounces-72946-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B181B514BC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Sep 2025 13:04:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 451AF1C23F99
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Sep 2025 11:04:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19DF43168E6;
	Wed, 10 Sep 2025 11:03:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="m63mlDWZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1AAF3164C6;
	Wed, 10 Sep 2025 11:03:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757502231; cv=none; b=VffWDfrPF+9iB8aFx4DQe4ulowEXzzbmA19q1QwiuMwLGbFQBi827Um/PdoLyr4NE3lEbLzJwGfcMwfTKByrhSWWkS2KG7+B/J1ZuiCKhI4hrVZRAKdtGEXqViJOwPOlqchHnGqidOmq9j0tykGPXjjKDoOLxxtQLoIv5S+pXbA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757502231; c=relaxed/simple;
	bh=UYWjKMF523Ekw7Bw98UkIXft7Kwx3TmgLpB7L6tfh5o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RXRtjypIrUdxf0cxOW0cACoBTqPhhSNYbCiuxEMRgmC7Jib8Zb0Q/mjYdHoP1w0iTGfn0ftN4YmZtPDQy/dRYsbN9PsTcrd49y00VFwaOWNQiOVOS2eBbYCHDsgFExIxc/Wz0G57oTIcBXWwXiSKO/yY8BUkKCTIwny+Hj/cCa4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=m63mlDWZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0E7DC4CEF0;
	Wed, 10 Sep 2025 11:03:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757502230;
	bh=UYWjKMF523Ekw7Bw98UkIXft7Kwx3TmgLpB7L6tfh5o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=m63mlDWZ7UyN+YkBriu39v3Ml8OZYHJ3sS5ToGI1uYGEV0tY8Mw311B0m7uz4rSAz
	 Mutosf2rsQjrnV5ZDOBgQIUu+tfNhSiBPAB+Q7vvxX4ETm3mdqOoQHSepfpTgIN2h8
	 zt+OLeR1dqvb/3HJUVjycOW1w3CtW88+vYJxpqvqlFhtr5LO08O71IdfjaF7lylFyb
	 BQsEeUwWcx11sL74qqXz85TbRe/47Qz2+SFz+UVY7RZ9fO2+vjbFXaGP44XfJVZM1n
	 EXkppE0EdiRuuC7kXQv6rxvJVAh2sd31GMdGiMm2lPL3Ee1+B1IH44xysygemd65Rr
	 eyHLSSxTHEr7Q==
Date: Wed, 10 Sep 2025 13:03:47 +0200
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
Subject: Re: [PATCH v4 01/10] drm/connector: let drivers declare infoframes
 as unsupported
Message-ID: <20250910-furry-singing-axolotl-9aceac@houat>
References: <20250909-drm-limit-infoframes-v4-0-53fd0a65a4a2@oss.qualcomm.com>
 <20250909-drm-limit-infoframes-v4-1-53fd0a65a4a2@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="3kg3zivfcuv2t4hc"
Content-Disposition: inline
In-Reply-To: <20250909-drm-limit-infoframes-v4-1-53fd0a65a4a2@oss.qualcomm.com>


--3kg3zivfcuv2t4hc
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v4 01/10] drm/connector: let drivers declare infoframes
 as unsupported
MIME-Version: 1.0

On Tue, Sep 09, 2025 at 05:51:59PM +0300, Dmitry Baryshkov wrote:
> Currently DRM framework expects that the HDMI connector driver supports
> all infoframe types: it generates the data as required and calls into
> the driver to program all of them, letting the driver to soft-fail if
> the infoframe is unsupported. This has a major drawback on userspace
> API: the framework also registers debugfs files for all Infoframe types,
> possibly surprising the users when infoframe is visible in the debugfs
> file, but it is not visible on the wire. Drivers are also expected to
> return success even for unsuppoted InfoFrame types.
>=20
> Let drivers declare that they support only a subset of infoframes,
> creating a more consistent interface. Make the affected drivers return
> -EOPNOTSUPP if they are asked to program (or clear) InfoFrames which are
> not supported.
>=20
> Acked-by: Liu Ying <victor.liu@nxp.com>
> Acked-by: Daniel Stone <daniels@collabora.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Again, I still believe that it's a bad idea, goes against what the spec
states, and the framework was meant to be.

So, no, sorry. That's still a no for me. Please stop sending that patch
unless we have a discussion about it and you convince me that it's
actually something that we'd need.

Maxime

--3kg3zivfcuv2t4hc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaMFbEwAKCRAnX84Zoj2+
dkRzAYCzQpQA/Ir3LWPQqxuIKthe+HVoEPQaMUjRgX+Ula46AjgZs5sQpXIzARWP
HvEZaiABfRY0fHLOQ/3ITnlioCgiECUTHWtXvwzwkeZPy/td6Zv8anX5A/E13TVJ
iH3N5Vfh4A==
=wXjx
-----END PGP SIGNATURE-----

--3kg3zivfcuv2t4hc--

