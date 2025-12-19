Return-Path: <linux-arm-msm+bounces-85805-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EB30CCF3B6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Dec 2025 10:56:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D879A3009436
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Dec 2025 09:54:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E75D2E6CAB;
	Fri, 19 Dec 2025 09:54:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="teXlBuee"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F1E622FAFD;
	Fri, 19 Dec 2025 09:54:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766138096; cv=none; b=CZL0mDjTmb1O2xDt8l0qMloFnls69rPOVg6lF7bhqtUw6Wyzi8a7t4QBgosriY3uJv29UJ6tyePDvb3cEWbwOHRjECrdaZoBbcprcnTgcyP9mtnepYSHN8RQqZKDN36hdtwadmZEKusazDOsod7rovMNzGnH6puTRyoWThj4sGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766138096; c=relaxed/simple;
	bh=lLAToM4vXYl2Fk0i65uKXkKio3mzy30inkIA9FUKzC8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fboDK2GEbuPlrwA7KoPU6yN7GwYlFFbUjN8fuV5rIb5Sp8bVvLwZ+AQtncGmOfNVS6l8XETP2YKB/uDqL33SfGoC2MD/Qpt/Ft/IQ06vPAWsEDZT8lMBWfFEBRtTjNLxGafAB6txUTziBLKuXOTrQpGrNvqYK5SAt68yYlb341I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=teXlBuee; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D23DC4CEF1;
	Fri, 19 Dec 2025 09:54:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766138095;
	bh=lLAToM4vXYl2Fk0i65uKXkKio3mzy30inkIA9FUKzC8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=teXlBuee2SGaO5gKVF903njhhJJyujvg1pKd00OAnL4abuUsJGZgjZ/0ok7vhvth2
	 bcU+XqvTdsUyWpkZpecWy100vQ079+cxQeWRi+28eSuxcQrmBsLYtlz8WUeWJfVcUq
	 +RSFqfo+R8zPY9wxRSVJOku2ErSx+BR2ZCiVm+A8ItqaKkKKlUy9gBMgtux8Nv7KL2
	 36u+gOWyi0sgXtCiS2eR5uhq+yjpSWREwBllUfGexMuL23TknUzZrPf8XTKmynGAA8
	 1YQnPj5YlHg8F3o877ew2QqD0hGZ++OqK+GF6FOX8VBhoy97Wb2Ohwj90JxEb6WA+M
	 rkKF3JhaRlT8A==
Date: Fri, 19 Dec 2025 10:54:53 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Daniel Stone <daniel@fooishbar.org>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Sandy Huang <hjc@rock-chips.com>, Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>, 
	Andy Yan <andy.yan@rock-chips.com>, Chen-Yu Tsai <wens@csie.org>, 
	Samuel Holland <samuel@sholland.org>, Dave Stevenson <dave.stevenson@raspberrypi.com>, 
	=?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>, Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
	Liu Ying <victor.liu@nxp.com>, Rob Clark <robin.clark@oss.qualcomm.com>, 
	Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>, 
	Jessica Zhang <jessica.zhang@oss.qualcomm.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Subject: Re: [PATCH v3 00/11] drm/connector: hdmi: limit infoframes per
 driver capabilities
Message-ID: <20251219-honest-slim-crab-02e932@houat>
References: <20250929-gregarious-worm-of-memory-c5354d@houat>
 <itgffxygopi7etkt7xhvmyuvyl5ad3k43nsxvjzw3ubtwiikn7@ocugfdaigtu7>
 <20251003-uptight-echidna-of-stamina-815305@houat>
 <zpygq4kapil3swsmhhqkdwny4ry2dznnzixsw5rkza5p2kqnvp@abvf2vxlbwif>
 <2a5fitdzr2bz235fj6rvqzxr6ckszkjbazjfszlvnizdh2cvbt@w3ypjo7vahhs>
 <pibxhl5hlcpuk3zsgyienfdlda5cwuxrnofwlw356scuzzplqy@zw3ofelgvwik>
 <bsoqyzxi45i67jpzhwr2d4illufa5ghqf25z6flbp67lsbvh22@rrlcihp2oxea>
 <cgzclxjubj5oca3rdnv44qwrkmpddxve4tlz76cc6p3b4hz3oc@3l7mt5ha7do6>
 <20251201-enlightened-zebu-from-asgard-5a20be@houat>
 <5dyhjur3hkhvtlwrl4h2m342byor7f3ssvkunj4cggnhbhlmnb@l2mfz7ypjj37>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="pxgyrzpu3xrfoz5s"
Content-Disposition: inline
In-Reply-To: <5dyhjur3hkhvtlwrl4h2m342byor7f3ssvkunj4cggnhbhlmnb@l2mfz7ypjj37>


--pxgyrzpu3xrfoz5s
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v3 00/11] drm/connector: hdmi: limit infoframes per
 driver capabilities
MIME-Version: 1.0

On Sat, Dec 06, 2025 at 01:28:14PM +0200, Dmitry Baryshkov wrote:
> On Mon, Dec 01, 2025 at 06:01:56PM +0100, Maxime Ripard wrote:
> > On Fri, Nov 21, 2025 at 07:09:01PM +0200, Dmitry Baryshkov wrote:
> > > > So it's not really impossible, you just need some hardware and a da=
y's
> > > > worth of work.
> > > >=20
> > > > There's no reason these should get a pass, it's breaking the spec f=
or no
> > > > reason.
> > > >=20
> > > > > > For SPD, It's really not clear to me why atomic_check should do=
 that in
> > > > > > the first place. Your initial concern was about exposing infofr=
ames in
> > > > > > debugfs that wouldn't be used by the driver.
> > > > > >=20
> > > > > > If the driver doesn't register a debugfs file for SPD, and igno=
res
> > > > > > whatever is in the atomic state, what's should we force drivers=
 to do
> > > > > > that?
> > > > >=20
> > > > > I really don't think that drivers should mess up with debugfs on =
their
> > > > > own. Making atomic_check() disable the unsupported InfoFrames mak=
es the
> > > > > picture perfect: the DRM no longer tries to program them to the
> > > > > hardware, DebugFS files stay empty, so the whole state becomes
> > > > > consistent.
> > > >=20
> > > > In the "bridge has no access to infoframes" case, there's really no
> > > > infoframe. An empty file is "the infoframe can be there but isn't u=
sed",
> > > > not "we don't have access to it and can't report them". Only drivers
> > > > have those infos.
> > > >=20
> > > > If we do split up write_infoframe into multiple functions though, I
> > > > guess we could create the debugfs file only if the function pointer=
 is
> > > > set, which removes drivers' involvement if you don't like that.
> > >=20
> > > I'm fine with not using HDMI connector framework for lt9611uxc.
> > > Likewise, I think, it's fine to have empty files for the infoframes
> > > which are not being sent over the wire for any reason (hw not support=
ing
> > > it is one of the reasons).
> >=20
> > I can't think of any other example in the kernel where an empty file
> > means that the driver doesn't support something.
>=20
> Okay. So we need to sort out implementing the split write_infoframes in
> drm_bridge_connector. Any suggestions there? I'm asking, because I don't
> want to end up exploding it.

I guess it's only really a problem if we want to make it const, but we
don't have to? We could just as well allocate the structure directly at
probe with a drmm helper and fill it as we need to.

Maxime

--pxgyrzpu3xrfoz5s
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaUUg7AAKCRAnX84Zoj2+
dvkCAYDaU48ga79KBvkIgWW7cnrj0Ae2GfJE5Y2GVVoq0UjRWC1zmLdmNFkjoQil
PD3wip4BgKf036443KTFOFktbqXWVW+vD37BVUvEwYqWrRwP+AK/8QBWIjjg9BKx
PWhjchksXg==
=penr
-----END PGP SIGNATURE-----

--pxgyrzpu3xrfoz5s--

