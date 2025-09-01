Return-Path: <linux-arm-msm+bounces-71356-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 84952B3DAAB
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Sep 2025 09:03:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3F6153AD4A3
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Sep 2025 07:03:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E22E20FAAB;
	Mon,  1 Sep 2025 07:03:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rP/Q0WPi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01384D531;
	Mon,  1 Sep 2025 07:03:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756710213; cv=none; b=ShmO7U/bz2bpFBZqCEw2mWzNe5Ze22svtB4SslzNFLHPcygRWIM93H3bsWBrU5vwB+qNNWTFQ5K2XyPNrD8MXw6g5BxhXuicGYD3hq291SQO3dgJb7yr1Y29yWl5h9O9baRD62WodWrLGqZrlkv/x30sAhIQGMqZUJkD3kGgwNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756710213; c=relaxed/simple;
	bh=0sWYT/ZaAhbNgFwFtfXmdwfjqQLZ2xdw0LRrPXgMr24=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=McExSvxUkBV/MTqJ5M6TUN8XPJMWfYCUlHurln3Ych7894lL5QIy1jF884gQ9SMYQEDPpLahPdZsKm9kwvG9qWOOBcpSSnFwExVqs0kubae/1DdIRBL5osSVjlanh8oXgln5XlYdn43pzjSgDJOcGwZwCk8v7htTUO8Oc90woEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rP/Q0WPi; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F408EC4CEF0;
	Mon,  1 Sep 2025 07:03:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756710212;
	bh=0sWYT/ZaAhbNgFwFtfXmdwfjqQLZ2xdw0LRrPXgMr24=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rP/Q0WPi2UZ19fxbGP6Sge18m+HOXvCRKlJC5/jutB0TV8oWdx8o/teLpYtmawJ/H
	 1fuOzy0RG8cFHr9OVhlcz58RDr9fkYh86fScJj3jIGZ4rQWCW47N1JI4GQrrDPRRxR
	 9oJtgtXNyNSfMd7ldwhWmhg6YlVwbB2opwCmoxilOW0D9/T8z6fA91caao6eCCYrGe
	 98rWo+iCqKaIIEIk86c6awjMAjDQaeLd4idRzKqsiBNXPRcO9ElA+fFslpuIRxaWyu
	 n0MBUgUhjUqalKWxsbYswBMLi+UnTzICE8SgGuP96DTGVMGYlQ2kd3Zm4FKvIP0yVB
	 pLGw9PNX3n+xQ==
Date: Mon, 1 Sep 2025 09:03:30 +0200
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
	linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Subject: Re: [PATCH v3 01/11] drm/connector: let drivers declare infoframes
 as unsupported
Message-ID: <20250901-precious-observant-kiwi-cc5283@houat>
References: <20250830-drm-limit-infoframes-v3-0-32fcbec4634e@oss.qualcomm.com>
 <20250830-drm-limit-infoframes-v3-1-32fcbec4634e@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="d2n7j42lzxyhexut"
Content-Disposition: inline
In-Reply-To: <20250830-drm-limit-infoframes-v3-1-32fcbec4634e@oss.qualcomm.com>


--d2n7j42lzxyhexut
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v3 01/11] drm/connector: let drivers declare infoframes
 as unsupported
MIME-Version: 1.0

On Sat, Aug 30, 2025 at 03:22:57AM +0300, Dmitry Baryshkov wrote:
> Currently DRM framework expects that the HDMI connector driver supports
> all infoframe types: it generates the data as required and calls into
> the driver to program all of them, letting the driver to soft-fail if
> the infoframe is unsupported. This has a major drawback on userspace
> API: the framework also registers debugfs files for all Infoframe types,
> possibly surprising the users when infoframe is visible in the debugfs
> file, but it is not visible on the wire.
>=20
> Let drivers declare that they support only a subset of infoframes,
> creating a more consistent interface.
>=20
> Acked-by: Liu Ying <victor.liu@nxp.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

I still don't think it's a good idea on principle, see my answer to your v2.

Maxime

--d2n7j42lzxyhexut
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaLVFQQAKCRAnX84Zoj2+
dqWLAX4+87bZ7fsBevn2MdqNcQfYWCtBzCpIt7Ur2RMiKoK90YPBq18Wjbz7XTPj
6eoW9gUBf1/qZoIAUuLYXaWhDcYy/kgyI7+UbRWoALTKdYd+i3+BpclRaOQ4KZuy
jWcl9fVvJQ==
=xP3w
-----END PGP SIGNATURE-----

--d2n7j42lzxyhexut--

