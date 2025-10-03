Return-Path: <linux-arm-msm+bounces-75917-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 65B5CBB72B7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Oct 2025 16:23:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 3BFE14E38DE
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Oct 2025 14:23:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B48C23185E;
	Fri,  3 Oct 2025 14:23:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lotxKWgY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C17C230BFD;
	Fri,  3 Oct 2025 14:23:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759501397; cv=none; b=C/YmJvx+Jg+92OY5deGpB9bynymX1j/bsgSO41/E3nEm6V4aJURw5WcLkYEKlQ3m7uqwAe4KeR0kC3S1aVFv8mQ8LA0Rwgq+f0P8FpFqQMW2AoW1UYUOTj3Ne3Ddgkyc/W0V3z2DNnM9ZZdWrHf5/9alStspL+/X2xbqu6IcBvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759501397; c=relaxed/simple;
	bh=NTBZAxjqSpzLuG1zGiZTH3WkfjeQ/nsmqUdkHlpqyFA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ey2q1E1z998EqWMvMtJj/gbLTXvq00L5qLWqGVaqX4F13W3n1rGCLUMQQhOfXDGxP8b37y+ONe+Hq+hPdyYfDLmmvqU2thfXamxdJky2WZ3jN6McVty5ZqUuJMuc+APgF5YhNT8oi4AsBAG0uAvZ4Ng/PSQXP86uIt8zBHVLrGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lotxKWgY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56D16C4CEF5;
	Fri,  3 Oct 2025 14:23:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759501396;
	bh=NTBZAxjqSpzLuG1zGiZTH3WkfjeQ/nsmqUdkHlpqyFA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lotxKWgY+nAfg0Bz/Vct5iFAdwEuXX/DFjaJOBqc9lv3nSDTg8zneCk9H0vxJGrbW
	 E52huxGlaW/CCY8YVgKZLz0wtmM6C75fwjspxr7EoP9Z80p9ndf+UhnoygFBVkccey
	 22o8GW5ooXjZHLEuJXTJ4qy8YlVK1iG8UdNcXJJzQWrRFlCNBAhUXezahWZ/FA1uXh
	 gRw4gC4VHeSEuHL9wHJwMJ49BBMDtPI38LWs3l+Gy+LG7D2tq8pmkSmU6DE3mWIN8R
	 Q62B4V0mj9VexBWWRMAnnPYQFBEMOgNnRbN5nQYHPg1+kAHsuyfwisrdIrxPwkFanQ
	 vsLJda5lDMRJw==
Date: Fri, 3 Oct 2025 16:23:14 +0200
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
Message-ID: <20251003-primitive-sepia-griffin-cfca55@houat>
References: <20250909-drm-limit-infoframes-v4-0-53fd0a65a4a2@oss.qualcomm.com>
 <20250909-drm-limit-infoframes-v4-1-53fd0a65a4a2@oss.qualcomm.com>
 <20250910-furry-singing-axolotl-9aceac@houat>
 <z333ysst5ifakomo35jtbpydj44epqwwn4da76rcnsq4are62m@32gsmgx2pcdi>
 <20250925-didactic-spiked-lobster-fefabe@penduick>
 <jfxtcvh4l5kzyv74llmzz3bbt6m4mhzhhwl6lh5kfeqgqhkrhi@jzfvtxpedmyf>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="52tkbt2twc25uy2v"
Content-Disposition: inline
In-Reply-To: <jfxtcvh4l5kzyv74llmzz3bbt6m4mhzhhwl6lh5kfeqgqhkrhi@jzfvtxpedmyf>


--52tkbt2twc25uy2v
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v4 01/10] drm/connector: let drivers declare infoframes
 as unsupported
MIME-Version: 1.0

On Thu, Sep 25, 2025 at 05:55:06PM +0300, Dmitry Baryshkov wrote:
> > > As we will be getting more and more features, some of the InfoFrames
> > > or data packets will be 'good to have, but not required'.
> >=20
> > And drivers would be free to ignore those.
> >=20
> > > > So, no, sorry. That's still a no for me. Please stop sending that p=
atch
> > >=20
> > > Oops :-)
> > >=20
> > > > unless we have a discussion about it and you convince me that it's
> > > > actually something that we'd need.
> > >=20
> > > My main concern is that the drivers should not opt-out of the feature=
s.
> > > E.g. if we start supporting ISRC packets or MPEG or NTSC VBI InfoFram=
es
> > > (yes, stupid examples), it should not be required to go through all t=
he
> > > drivers, making sure that they disable those. Instead the DRM framewo=
rk
> > > should be able to make decisions like:
> > >=20
> > > - The driver supports SPD and the VSDB defines SPD, enable this
> > >   InfoFrame (BTW, this needs to be done anyway, we should not be send=
ing
> > >   SPD if it's not defined in VSDB, if I read it correctly).
> > >=20
> > > - The driver hints that the pixel data has only 10 meaninful bits of
> > >   data per component (e.g. out of 12 for DeepColor 36), the Sink has
> > >   HF-VSDB, send HF-VSIF.
> > >=20
> > > - The driver has enabled 3D stereo mode, but it doesn't declare suppo=
rt
> > >   for HF-VSIF. Send only H14b-VSIF.
> > >=20
> > > Similarly (no, I don't have these on my TODO list, these are just
> > > examples):
> > > - The driver defines support for NTSC VBI, register a VBI device.
> > >=20
> > > - The driver defines support for ISRC packets, register ISRC-related
> > >   properties.
> > >=20
> > > - The driver defines support for MPEG Source InfoFrame, provide a way
> > >   for media players to report frame type and bit rate.
> > >=20
> > > - The driver provides limited support for Extended HDR DM InfoFrames,
> > >   select the correct frame type according to driver capabilities.
> > >=20
> > > Without the 'supported' information we should change atomic_check()
> > > functions to set infoframe->set to false for all unsupported InfoFram=
es
> > > _and_ go through all the drivers again each time we add support for a
> > > feature (e.g. after adding HF-VSIF support).
> >=20
> > From what you described here, I think we share a similar goal and have
> > somewhat similar concerns (thanks, btw, it wasn't obvious to me before),
> > we just disagree on the trade-offs and ideal solution :)
> >=20
> > I agree that we need to sanity check the drivers, and I don't want to go
> > back to the situation we had before where drivers could just ignore
> > infoframes and take the easy way out.
> >=20
> > It should be hard, and easy to catch during review.
> >=20
> > I don't think bitflag are a solution because, to me, it kind of fails
> > both.
> >=20
> > What if, just like the debugfs discussion, we split write_infoframe into
> > write_avi_infoframe (mandatory), write_spd_infoframe (optional),
> > write_audio_infoframe (checked by drm_connector_hdmi_audio_init?) and
> > write_hdr_infoframe (checked in drmm_connector_hdmi_init if max_bpc > 8)
> >=20
> > How does that sound?
>=20
> I'd say, I really like the single function to be called for writing the
> infoframes. It makes it much harder for drivers to misbehave or to skip
> something.

=46rom a driver PoV, I believe we should still have that single function
indeed. It would be drm_atomic_helper_connector_hdmi_update_infoframes's
job to fan out and call the multiple callbacks, not the drivers.

Maxime

--52tkbt2twc25uy2v
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaN/cUQAKCRAnX84Zoj2+
doqJAX90zNyWmsUip91wTNJtbf8t9T8oHpuaxLd97OtefR1KrjHS2zNm3j3QKJO2
DILT8+EBfi951vLWkKKYswrmqe4tCE/x2PvHNyVn0RvWHOXmTytjmwkrcFHfX9Z+
tXdDckATGw==
=lhWy
-----END PGP SIGNATURE-----

--52tkbt2twc25uy2v--

