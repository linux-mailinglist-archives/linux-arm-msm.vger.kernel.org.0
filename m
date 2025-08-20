Return-Path: <linux-arm-msm+bounces-69876-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 4698EB2D4A6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Aug 2025 09:15:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id DE72E4E3CEF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Aug 2025 07:15:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 699E92D47E4;
	Wed, 20 Aug 2025 07:15:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sx8dB9Pe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39ADB2D375D;
	Wed, 20 Aug 2025 07:15:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755674140; cv=none; b=DXdjywLA2IH5aXcM+urHk0TjbQ8Q2ZJWk6EZVyKavY2XhFlwPAYrLHIq6MJAqINDdS4Q3WXozv3LFgdPsBgW2KOFwZ+z14hgwOBqFbUP4hc+Na5VvhcqWivgnxSOZbqPRInYzqYx/+KEoB82eGtKpavsz+32ZU5A1PtKbIcvApw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755674140; c=relaxed/simple;
	bh=VUZK2MpAHgOKjVJ19+Bw5dSQafJ8hDSl6PCW3an6dGA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q2HOQ8UsvLbAdmDTIxzlwwESoTeKgFmqqQUbwisr/JqC7Z6I0FzM6jmInZ1PnortTKylEWnVAYyykmMWLhf0WkD3vZrlwFCd/IxlSk/GkqQAmnHU4XCalywCjws3oSVQAcXCiWsUgNYh4zeQCtz2rU8PP1X0sTL1KcQ4XWooK1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sx8dB9Pe; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56AD9C4CEEB;
	Wed, 20 Aug 2025 07:15:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755674139;
	bh=VUZK2MpAHgOKjVJ19+Bw5dSQafJ8hDSl6PCW3an6dGA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sx8dB9PeWGSZSptzXrYkdKAPu+omWGi87iV7Xw1hJgw/Wq5qWmFmk8M0JSXuBU50P
	 J7gY9snTH8/n7QZTUoeJCD2SySao8w30ErNueMapvrxBXavnb6r9uTnFkTgk/fzGob
	 jzoq894mOGpg3VKGvLwR26HV4oxvOp9dm0FEr440za8iUcIS53GrDersOBPgHj9N3J
	 s7UEYqcVLvDf5bVAvj8oUq1Sww8fhN+Szx2SaC+TBdqXzCtu6sygVFdGsyoPhu3qVm
	 IhZB81QfYdtuNGdt+6l07jQBL0Pj3+BVEt7yhMmHrsf4e3cUirEcp/++PBl12RCSFc
	 YuBfy7Vnl2Rzg==
Date: Wed, 20 Aug 2025 09:15:36 +0200
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
Subject: Re: [PATCH v2 1/8] drm/connector: let drivers declare infoframes as
 unsupported
Message-ID: <20250820-artichoke-silkworm-of-election-521b5e@houat>
References: <20250819-drm-limit-infoframes-v2-0-7595dda24fbd@oss.qualcomm.com>
 <20250819-drm-limit-infoframes-v2-1-7595dda24fbd@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="ovoxo52sdrhbbtrx"
Content-Disposition: inline
In-Reply-To: <20250819-drm-limit-infoframes-v2-1-7595dda24fbd@oss.qualcomm.com>


--ovoxo52sdrhbbtrx
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 1/8] drm/connector: let drivers declare infoframes as
 unsupported
MIME-Version: 1.0

Hi,

On Tue, Aug 19, 2025 at 09:57:30PM +0300, Dmitry Baryshkov wrote:
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
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

I'm not really convinced. Infoframes aren't really something you should
ignore, AVI is effectively mandatory, HDMI kind of is too, AUDIO is if
audio support is enabled, DRM is mandatory if HDR is used.

SPD is indeed optional though.

So, it's really dynamic in essence, and not really something we should
expect drivers to ignore.

I do acknowledge that a lot of drivers just silently ignore the
infoframes they don't support at the moment, which isn't great either.

Maybe we should standardize and document what drivers should do when
they don't support a given infoframe type?

Something like return EOPNOTSUPP if you don't support it, and we warn in
the core if we get one for a mandatory infoframe?

Maxime

--ovoxo52sdrhbbtrx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaKV2FAAKCRAnX84Zoj2+
dqXvAX0bvYzEBhvkZZcbwX8EsIm26JAHz/mS0cz6qC9clfhYyvLbKY2RswgLRcH0
zdXoEXIBf1jm8cvKLzdlBWGxds9iQj9mYUOq/VxFsp7UhMYL7asc5mdt46fMCoym
hEIMma0gbA==
=7QRV
-----END PGP SIGNATURE-----

--ovoxo52sdrhbbtrx--

