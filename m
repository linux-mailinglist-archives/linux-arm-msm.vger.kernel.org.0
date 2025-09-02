Return-Path: <linux-arm-msm+bounces-71677-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B4FF6B40C3D
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Sep 2025 19:38:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7D5C156470A
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Sep 2025 17:38:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFBAD340DBD;
	Tue,  2 Sep 2025 17:38:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="galXQsTO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABB6D2F6586;
	Tue,  2 Sep 2025 17:38:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756834728; cv=none; b=Nv4oxJGl7cFi8Fa/XCikpu416pUf+7UZHYkm8ErWhMLewbbh0AmEGjtH0pl9PeaBbKTyHKiL8f3mW9ci+zHajjmjCVJgPdKmhi5czVSIE6OSzzBU/cTGfLEBIRYs0K0eHF4TK8x9dE15TcrUs5MNS2mnjwsF9V+Lvzz9ugJZzTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756834728; c=relaxed/simple;
	bh=J9yRl+1sYXysHV78nqhCneCzmXn+YCT41OoxWUn1W70=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qX+JdJ/KGj8yeD7yIi+VqpkQaCX6Y6Gry5SATiXBy2DaGHCtabjWsBH8eTpTQCp/vKpqSg1fl20XLAIBRzcf+Wn+p2I1ZunwETD83eomUgDiNyioCzdHCnZvXl5CYlL9eLP7/etItQPNNSLNLCWeKd8v5Y6M4yi1/hZbrivRx6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=galXQsTO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9AFE0C4CEED;
	Tue,  2 Sep 2025 17:38:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756834728;
	bh=J9yRl+1sYXysHV78nqhCneCzmXn+YCT41OoxWUn1W70=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=galXQsTOy6Nmhq4l/sFifocjOVmnYPMbu8QyED/3YdiDrrbJorHsB1SSIeS8E6VvP
	 Uz+fs/dvHmXrxaqQG5+c0G2fxRLr7YSOtoIOiGUpG69ni3FlIouslNveVnfbEij/cl
	 RzMet1lZ8FhUsFQhmrLd2DSXG8IQ9kYJbEAJ97asib0On812k+/z8CuGS4eXpWuY5j
	 qfs5vGdt4d25mKDA3GOIk7wddbRrKMIirbO4dwqdautQDKZEd+78TzNegkAhWlFgwD
	 psUHTpD9kaT87XUaarJ9TjeZFIomKjHheKcfAEvYqzPouSTvUzBJaSzPa7VNXCdFw+
	 RJfS5DqyBFvhw==
Date: Tue, 2 Sep 2025 19:38:44 +0200
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
Message-ID: <hyfwwfiazs4rspjre24zgf6n4uq3267qawnyxrksy7n4wfqiuq@46lcdlmdik3s>
References: <20250819-drm-limit-infoframes-v2-0-7595dda24fbd@oss.qualcomm.com>
 <20250819-drm-limit-infoframes-v2-1-7595dda24fbd@oss.qualcomm.com>
 <20250820-artichoke-silkworm-of-election-521b5e@houat>
 <v7w7xkefm6ap7delx7wsvxmc76fwptqhe4ehokzfh4baueb7hr@acrx36exv42v>
 <20250827-adorable-ocelot-of-adventure-ba88b7@houat>
 <jrvjvayhjczgb4yx3xshbv3e6ndzkmb7uu3ynoes2maniwjg37@hamxu5mzqmf7>
 <20250901-illustrious-dark-kagu-f4ef76@houat>
 <rkxdyzm4uwvq5nxw5q25qv2xqqqvirgn77u54jydebm6a2wrk3@m2y3y3zcjb4j>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="rcrjatrx3rsahkt5"
Content-Disposition: inline
In-Reply-To: <rkxdyzm4uwvq5nxw5q25qv2xqqqvirgn77u54jydebm6a2wrk3@m2y3y3zcjb4j>


--rcrjatrx3rsahkt5
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 1/8] drm/connector: let drivers declare infoframes as
 unsupported
MIME-Version: 1.0

On Tue, Sep 02, 2025 at 06:12:39AM +0300, Dmitry Baryshkov wrote:
> On Mon, Sep 01, 2025 at 08:54:18AM +0200, Maxime Ripard wrote:
> > On Wed, Aug 27, 2025 at 05:04:53PM +0300, Dmitry Baryshkov wrote:
> > > On Wed, Aug 27, 2025 at 09:30:20AM +0200, Maxime Ripard wrote:
> > > > On Wed, Aug 20, 2025 at 12:52:44PM +0300, Dmitry Baryshkov wrote:
> > > > > On Wed, Aug 20, 2025 at 09:15:36AM +0200, Maxime Ripard wrote:
> > > > > > Hi,
> > > > > >=20
> > > > > > On Tue, Aug 19, 2025 at 09:57:30PM +0300, Dmitry Baryshkov wrot=
e:
> > > > > > > Currently DRM framework expects that the HDMI connector drive=
r supports
> > > > > > > all infoframe types: it generates the data as required and ca=
lls into
> > > > > > > the driver to program all of them, letting the driver to soft=
-fail if
> > > > > > > the infoframe is unsupported. This has a major drawback on us=
erspace
> > > > > > > API: the framework also registers debugfs files for all Infof=
rame types,
> > > > > > > possibly surprising the users when infoframe is visible in th=
e debugfs
> > > > > > > file, but it is not visible on the wire.
> > > > > > >=20
> > > > > > > Let drivers declare that they support only a subset of infofr=
ames,
> > > > > > > creating a more consistent interface.
> > > > > > >=20
> > > > > > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcom=
m.com>
> > > > > >=20
> > > > > > I'm not really convinced. Infoframes aren't really something yo=
u should
> > > > > > ignore, AVI is effectively mandatory, HDMI kind of is too, AUDI=
O is if
> > > > > > audio support is enabled, DRM is mandatory if HDR is used.
> > > > >=20
> > > > > Nevertheless, sun4i, innohdmi, adv7511, it6263 and rk3066 drivers
> > > > > provide support only for the AVI infoframe.
> > > >=20
> > > > Yes, but it's still something we shouldn't paper over. The spec man=
dates
> > > > it, if drivers want to deviate from it it's something we should warn
> > > > about, not silence.
> > > >=20
> > > > sun4i is a good example, to me at least since I have the doc. The
> > > > hardware supports AVI, Audio, ACP, and SPD. HDR isn't supported, so=
 DRM
> > > > isn't either. The only missing one is HDMI, but the documentation i=
sn't
> > > > the best so it might still be supported. In short, it's a driver is=
sue.
> > > >=20
> > > > adv7511 supports AVI, Audio, ACP, SPD, ACP, and looks to have a
> > > > mechanism to send any infoframe as is. So, again, driver issue.
> > >=20
> > > I've send a patch, enabling SPD and VSI (HDMI) InfoFrames on ADV7511.
> > >=20
> > > >=20
> > > > I couldn't find the other datasheet, but I'd be very surprised if it
> > > > wasn't the case for these too.
> > > >=20
> > > > > Some of them can be extended to support other infoframe kinds (e.=
g.
> > > > > ADV7511 has two spare infoframes which can be used for HDMI and S=
PD).
> > > > >=20
> > > > > > SPD is indeed optional though.
> > > > > >=20
> > > > > > So, it's really dynamic in essence, and not really something we=
 should
> > > > > > expect drivers to ignore.
> > > > > >=20
> > > > > > I do acknowledge that a lot of drivers just silently ignore the
> > > > > > infoframes they don't support at the moment, which isn't great =
either.
> > > > > >=20
> > > > > > Maybe we should standardize and document what drivers should do=
 when
> > > > > > they don't support a given infoframe type?
> > > > >=20
> > > > > The chips might be generating infoframes internally. This series =
was
> > > > > triggered by LT9611UXC, which does all HDMI work under the hood i=
n the
> > > > > firmware. See [1]. The series I posted hooks HDMI audio directly =
into
> > > > > the bridge driver, but I'd really prefer to be able to use
> > > > > drm_atomic_helper_connector_hdmi_hotplug(), especially if I ever =
get to
> > > > > implementing CEC support for it.
> > > > >=20
> > > > > ADV7511 likewise generates audio infoframe without Linux
> > > > > help (audio-related fields are programmed, but it's not the
> > > > > infoframe itself).
> > > >=20
> > > > Implementing the write_infoframe hooks as a nop with a comment in t=
hose
> > > > case is totally reasonable to me.
> > > >=20
> > > > I'd still like to document that drivers should only return 0 if they
> > > > programmed the infoframe, and -ENOTSUPP (and the core logging a war=
ning)
> > > > otherwise.
> > > >=20
> > > > That way, we would be able to differentiate between the legimitate
> > > > LT9611UXC case, and the "driver is broken" sun4i (and others) case.
> > >=20
> > > I don't want to end up in a sitation where userspace has a different
> > > idea of the InfoFrame being sent than the actual one being present on
> > > the wire.
> >=20
> > It's not ideal, sure, but also, what's wrong with it? We're doing it
> > *all the time*. Modes programmed by userspace are adjusted for the
> > hardware, and thus the mode reported by the CRTC turns out different
> > than the one actually used in hardware. Audio sampling rates might not
> > match exactly what we're doing. The quirks infrastructure disables part
> > of the EDID the userspace has access to, etc.
> >=20
> > And all those are under the userspace control, which the infoframes
> > aren't.
>=20
> I think there is a differnece between 'change userspace input',
> 'knowingly mangle data' and 'lie to userspace because the driver doesn't
> care'. This is especially important e.g. if a user is trying to debug
> AV issues which can be caused by wrong information in the infoframe.

We can play semantics if you want, but the line is *very* fine between
"mangling data" and "lying".

If the mode has been mangled, and you don't report that it has been to
userspace, are you lying?

I guess you could argue both ways, but it's really the same than what
we're discussing here. Except for the fact that one is a central part of
the uapi, that the userspace depends on, and one is a debugfs file that
*isn't* a uAPI, and the userspace really shouldn't depend on.

> > > It seems, we need several states per the infoframe:
> > >=20
> > > - Not supported
> >=20
> > Honestly, I'm not sure we need a state for that one. If that infoframe
> > was set by the framework, then the driver must support it. And if it
> > wasn't, then there's nothing in debugfs.
>=20
> Yes, I ended up dropping this and having two separate flags.
>=20
> >=20
> > > - Autogenerated
> >=20
> > Do we have any way to read them back on those?
>=20
> Usually not. E.g. I don't think I can read back Audio InfoFrame on
> ADV7511. Nor can I read InfoFrames on LT9611UXC.

Then if you don't have access to it, we can just not register the
debugfs files.

Maxime

--rcrjatrx3rsahkt5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaLcrpAAKCRAnX84Zoj2+
dmn+AX9uKTQUrvsMDdQUvDxi/gST+e7W9A4EczjnFgGEq5QN5en8i+F/9RXq/HUg
FCAoXccBgLwnwYPqh00A635JjRQAGg5eljItdNuu9ZTITiOIath6Qz4WyYpmdyUF
HAFD2hq1nQ==
=L//j
-----END PGP SIGNATURE-----

--rcrjatrx3rsahkt5--

