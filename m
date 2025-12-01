Return-Path: <linux-arm-msm+bounces-84002-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5090DC98659
	for <lists+linux-arm-msm@lfdr.de>; Mon, 01 Dec 2025 18:02:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6B9E93A12DF
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Dec 2025 17:02:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7AEA334C0A;
	Mon,  1 Dec 2025 17:02:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jr7StedP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B12F633342A;
	Mon,  1 Dec 2025 17:01:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764608520; cv=none; b=jDnZJKSQ3E0JmBez+R79QHTJrVtOVEMcmwylaqFVwM2Pd5DR9eNrBKhgdQ03EkFpWMCEfKSkFv0Y6q0keFuQcaRq2QMTUjtySV+mFIFfvnSxp39kBcQ7GdPbt5RnaR0J1bJ7ow637ZVvhAE2fx9F4klLoufGodn2CGJqhuJrVB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764608520; c=relaxed/simple;
	bh=bmyTq2q+hM5yLfaOwvV4mt3DtxhrkyZjZ87SLQzIRvc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HhA0henr2rgwllVP4G161l08tKEmbwiQRe+vejf9xlAu58qleWUC98wcLgzaaCwq9zxGGCceIPRSbj4IbIDuMLWquYOj8b1iTsouDXlYlPqblLwko7nY9PgR0syQ6vFO4j7Zzl7CeiklpzO0r9Ahwjg28KHsvD+sT47lTmzOzew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jr7StedP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5905C116C6;
	Mon,  1 Dec 2025 17:01:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764608519;
	bh=bmyTq2q+hM5yLfaOwvV4mt3DtxhrkyZjZ87SLQzIRvc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jr7StedPEyC4/M1t7fb11w5L7eX7EwY91G07P7AMGijfckxto+L1WhwGZsjlsXYIY
	 oPOBlsHBliJM+a+Ck+s95tJX7dUkcTP5pveCNFp/krPg4vR0LXWKAYEHPMZFH7BnSa
	 w/jmhdgHtlBNuR767BlzygS7X3PXNC6OjSXYaqFQBISNpnI6dO3zRh4SkdSFewBq7X
	 zREFhG+p8OGRGjPPiSi80gwvkw0y85GNS/W5tNjwqV7H9L1DBf2eLGS8ArX4PFGdca
	 NRClciXygKLJ3Mf0U36BtEe3k+YhGpk6jI8Jy8BC6oYJJRGMbYG05OQchgkdz3i2TA
	 5RsxeDtcuuY4Q==
Date: Mon, 1 Dec 2025 18:01:56 +0100
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
Message-ID: <20251201-enlightened-zebu-from-asgard-5a20be@houat>
References: <20250925-fervent-merry-beagle-2baba3@penduick>
 <qx5ashx62pufott6hnsfna3qntnoyvxwxze4rihhuxcsdxi37s@bbdvc3sfsgne>
 <20250929-gregarious-worm-of-memory-c5354d@houat>
 <itgffxygopi7etkt7xhvmyuvyl5ad3k43nsxvjzw3ubtwiikn7@ocugfdaigtu7>
 <20251003-uptight-echidna-of-stamina-815305@houat>
 <zpygq4kapil3swsmhhqkdwny4ry2dznnzixsw5rkza5p2kqnvp@abvf2vxlbwif>
 <2a5fitdzr2bz235fj6rvqzxr6ckszkjbazjfszlvnizdh2cvbt@w3ypjo7vahhs>
 <pibxhl5hlcpuk3zsgyienfdlda5cwuxrnofwlw356scuzzplqy@zw3ofelgvwik>
 <bsoqyzxi45i67jpzhwr2d4illufa5ghqf25z6flbp67lsbvh22@rrlcihp2oxea>
 <cgzclxjubj5oca3rdnv44qwrkmpddxve4tlz76cc6p3b4hz3oc@3l7mt5ha7do6>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="nhtgib353qneclwb"
Content-Disposition: inline
In-Reply-To: <cgzclxjubj5oca3rdnv44qwrkmpddxve4tlz76cc6p3b4hz3oc@3l7mt5ha7do6>


--nhtgib353qneclwb
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v3 00/11] drm/connector: hdmi: limit infoframes per
 driver capabilities
MIME-Version: 1.0

On Fri, Nov 21, 2025 at 07:09:01PM +0200, Dmitry Baryshkov wrote:
> > So it's not really impossible, you just need some hardware and a day's
> > worth of work.
> >=20
> > There's no reason these should get a pass, it's breaking the spec for no
> > reason.
> >=20
> > > > For SPD, It's really not clear to me why atomic_check should do tha=
t in
> > > > the first place. Your initial concern was about exposing infoframes=
 in
> > > > debugfs that wouldn't be used by the driver.
> > > >=20
> > > > If the driver doesn't register a debugfs file for SPD, and ignores
> > > > whatever is in the atomic state, what's should we force drivers to =
do
> > > > that?
> > >=20
> > > I really don't think that drivers should mess up with debugfs on their
> > > own. Making atomic_check() disable the unsupported InfoFrames makes t=
he
> > > picture perfect: the DRM no longer tries to program them to the
> > > hardware, DebugFS files stay empty, so the whole state becomes
> > > consistent.
> >=20
> > In the "bridge has no access to infoframes" case, there's really no
> > infoframe. An empty file is "the infoframe can be there but isn't used",
> > not "we don't have access to it and can't report them". Only drivers
> > have those infos.
> >=20
> > If we do split up write_infoframe into multiple functions though, I
> > guess we could create the debugfs file only if the function pointer is
> > set, which removes drivers' involvement if you don't like that.
>=20
> I'm fine with not using HDMI connector framework for lt9611uxc.
> Likewise, I think, it's fine to have empty files for the infoframes
> which are not being sent over the wire for any reason (hw not supporting
> it is one of the reasons).

I can't think of any other example in the kernel where an empty file
means that the driver doesn't support something.

Maxime

--nhtgib353qneclwb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaS3KBAAKCRAnX84Zoj2+
dpehAX9df8UFvZVN58dQXWwnBnuke2vOU1UxT4zbhxIdR/6V/O2rER74TkmbviQv
h0HIhF0BgLOgEP5gmSlL9xZCFl5EWhJpy16T7ozKZGULaHEy/3NJR+/SzYOZmLZ5
yR5aU4SDRQ==
=m4w1
-----END PGP SIGNATURE-----

--nhtgib353qneclwb--

