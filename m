Return-Path: <linux-arm-msm+bounces-43978-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2290EA02133
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jan 2025 09:55:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6F95A188470A
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jan 2025 08:55:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1E101C4A1C;
	Mon,  6 Jan 2025 08:55:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AqJv2SZ9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 620C71BF58;
	Mon,  6 Jan 2025 08:55:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736153752; cv=none; b=HH/RPz/bKdjvKE/nakBzLpnraMDvvuGzjvOn9Rb24OOd89lzoYJnrAMNotxTpFBnBnHKre3NZGtm0AEeuG4hzSbrX8WD3YmroSqqy4JsVGYttqrdlAQh8sDpxgD/0yRydpjN1cr70ZxRDdyGN0EbGeW9eauw7rxbpnziCVHumfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736153752; c=relaxed/simple;
	bh=gG4SiTyR1rjNKpTSl7F5DKYKTnsEbd9XXx+wOP8RmzQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uJq7Epev3Rf6ltVR8zvqogpY628K4oG+XJY/yMKaRevwL4sudud7CXlfmvnp58CSD0FEDkKZABduqU9w/g5U9R++26MwY38Ki/IwWCvpvww6TRdpeq7kGRXdjoCuqZMoopBz5BlOME5a1XbBVOpK1M8+dmF3RteI71WSaDAUcHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AqJv2SZ9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D5F5C4CED2;
	Mon,  6 Jan 2025 08:55:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736153751;
	bh=gG4SiTyR1rjNKpTSl7F5DKYKTnsEbd9XXx+wOP8RmzQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AqJv2SZ9q16OyArWqElTwLOPNwqTm/ShNQQWffb96q1lj4AqFBu2S8K57PHmnRH7/
	 xzupTm63UbfD3+7hQmj/mjtk7Ni2a3mv4rg5ZyC7gx0mF08AN7kqGfWIqKC458mCKN
	 gwQp1eC6iRJnKLYxcKdFS5a/G+MvmBRmjaM6UcbaHc3qmp9xl3044q8FgfIkpESvIn
	 ifJDNyYD52oEbg9I7c1Dg0+YMil4dxoxeB9GxG9BEJ3g21c7PaizTkseSF5f+HfCFD
	 c/9goNwKH4U8aSo3khRGr2Y22RbMLY00xLu/mzuLGW5AwAZLSwqWV1X5wYZD2lVzu1
	 C6+ttlxaCH/rg==
Date: Mon, 6 Jan 2025 09:55:49 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Jani Nikula <jani.nikula@linux.intel.com>, 
	Rodrigo Vivi <rodrigo.vivi@intel.com>, Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
	Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>, 
	Danilo Krummrich <dakr@redhat.com>, Harry Wentland <harry.wentland@amd.com>, 
	Leo Li <sunpeng.li@amd.com>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, 
	Alex Deucher <alexander.deucher@amd.com>, Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>, 
	Xinhui Pan <Xinhui.Pan@amd.com>, Alain Volmat <alain.volmat@foss.st.com>, 
	Raphael Gallais-Pou <rgallaispou@gmail.com>, Liviu Dudau <liviu.dudau@arm.com>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Peter Senna Tschudin <peter.senna@gmail.com>, Ian Ray <ian.ray@ge.com>, 
	Martyn Welch <martyn.welch@collabora.co.uk>, Inki Dae <inki.dae@samsung.com>, 
	Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Stefan Agner <stefan@agner.ch>, Alison Wang <alison.wang@nxp.com>, 
	Patrik Jakobsson <patrik.r.jakobsson@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	Dave Airlie <airlied@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>, 
	Sandy Huang <hjc@rock-chips.com>, Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>, 
	Andy Yan <andy.yan@rock-chips.com>, Chen-Yu Tsai <wens@csie.org>, 
	Samuel Holland <samuel@sholland.org>, Thierry Reding <thierry.reding@gmail.com>, 
	Mikko Perttunen <mperttunen@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>, =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>, 
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, Gurchetan Singh <gurchetansingh@chromium.org>, 
	Chia-I Wu <olvaffe@gmail.com>, Zack Rusin <zack.rusin@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, nouveau@lists.freedesktop.org, 
	amd-gfx@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, imx@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
	freedreno@lists.freedesktop.org, virtualization@lists.linux.dev, 
	spice-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-tegra@vger.kernel.org, Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
	Jani Nikula <jani.nikula@intel.com>
Subject: Re: [PATCH v2 0/5] drm/connector: make mode_valid() callback accept
 const mode pointer
Message-ID: <20250106-passionate-lorikeet-of-apotheosis-c62ff1@houat>
References: <20241214-drm-connector-mode-valid-const-v2-0-4f9498a4c822@linaro.org>
 <76ho36jqcraehnsgpjralpye52w7ryshhgizekn4qqfsikiojd@3yyorbvjkc7b>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="7fhp4op5b7mhfhd4"
Content-Disposition: inline
In-Reply-To: <76ho36jqcraehnsgpjralpye52w7ryshhgizekn4qqfsikiojd@3yyorbvjkc7b>


--7fhp4op5b7mhfhd4
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 0/5] drm/connector: make mode_valid() callback accept
 const mode pointer
MIME-Version: 1.0

On Mon, Jan 06, 2025 at 12:47:07AM +0200, Dmitry Baryshkov wrote:
> On Sat, Dec 14, 2024 at 03:37:04PM +0200, Dmitry Baryshkov wrote:
> > While working on the generic mode_valid() implementation for the HDMI
> > Connector framework I noticed that unlike other DRM objects
> > drm_connector accepts non-const pointer to struct drm_display_mode,
> > while obviously mode_valid() isn't expected to modify the argument.
> >=20
> > Mass-change the DRM framework code to pass const argument to that
> > callback.
> >=20
> > The series has been compile-tested with defconfig for x86-64, arm and
> > arm64.
> >=20
> > Note: yes, I understand that this change might be hard to review and
> > merge. The only viable option that I foresee is to add new callback,
> > having the const argument and migrate drivers into using it one by one.
>=20
> Colleagues, I'd like to graciously ping regarding this series. Should it
> be merged as is (possibly requiring more R-B's)? Or should I rework it
> adding something like .mode_valid_new() callback which takes const
> argument?

I think your patch is fine, and you can add my

Reviewed-by: Maxime Ripard <mripard@kernel.org>

We seem to lack an Acked-by for amdgpu though?

Maxime

--7fhp4op5b7mhfhd4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZ3ualAAKCRAnX84Zoj2+
ds65AYCm0HY0VDiw9/7lDbcyH0YuzRQu/+7FuV8GS6p+ubfGmvGVGOS+07oCUheK
PN/gOxwBgOc9gl1vmxFUVrfM3LjcOixdshbfH49V0dlOMzIZO3m/L5caQ4O6jchE
p0sk4xSGUQ==
=4eTB
-----END PGP SIGNATURE-----

--7fhp4op5b7mhfhd4--

