Return-Path: <linux-arm-msm+bounces-71358-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 065E6B3DAC5
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Sep 2025 09:07:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D5B77164E8A
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Sep 2025 07:07:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4153247291;
	Mon,  1 Sep 2025 07:07:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="W5XeNc7C"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A66631804A;
	Mon,  1 Sep 2025 07:07:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756710425; cv=none; b=rOB89z5l6jpw+ptXuJL6gQQgcxr7U4kML5iJOe3/do5SAE+ohXXVmscRYn92EQVaiFVAxzG6nWok8BwrE3coY2Mew5ia8M1jUKXGNiLKY913xqv5Sbzx6FNha0/Q08wDoE29BSHxgrX9CcpW8JBl2pSInH/llNbJ6+2qCqKc3Zo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756710425; c=relaxed/simple;
	bh=t+EbY02dYwHMIRuwPA5LMX8oq95JwdclceCsg6WGxsc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UGMa/aOl5mzVxux6gSLaWsFA69CMkG57n7Y5mxqM/qP1Eh9RBdBTzjdjSqrmcT8BU5IEcISA8TWZztBoQK+24TEROCjpb43PjvkZ/NIjPszBFg5W8pAm8eY+8EBheOHJtRgnNc3KwSEJifYOR5Srd46Ib2MPGnhSexSOyrz9w1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=W5XeNc7C; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C36AAC4CEF0;
	Mon,  1 Sep 2025 07:07:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756710425;
	bh=t+EbY02dYwHMIRuwPA5LMX8oq95JwdclceCsg6WGxsc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=W5XeNc7Cv8GxToCWwX2Wxf/Wd6+4Qx6COMqHte76KADDpb+1z8AKRSxY6/EQkZsgR
	 XU68REjcq5ar0q/5UboMi/cxrMF+TtEIR/lmNmC2jKNclSCAOkiIkggT37yW0Nz5l4
	 rm1oNIGdwRJ83ZPkjV3V4smIHmG0XyUrsKjkTXLMSfSd9rhIsqNJ25AYmZf0bLVLqC
	 /BJm/0E2s+8zmuE4ar/44x3lc4owarPZsOPbPGXuGOIeiatzWgOPmRLL6mVuSF53eN
	 ta3VK1kmgw6yrtxVWfdHJUMBg3Cc7UrhUCP6ozK/Xl59CGRh5NZpeSd6GC8KBBz9lR
	 rJmN+CkJNRR6A==
Date: Mon, 1 Sep 2025 09:07:02 +0200
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
Message-ID: <20250901-voracious-classy-hedgehog-ee28ef@houat>
References: <20250830-drm-limit-infoframes-v3-0-32fcbec4634e@oss.qualcomm.com>
 <CAPj87rNDtfEYV88Ue0bFXJwQop-zy++Ty7uQ9XfrQ2TbAijeRg@mail.gmail.com>
 <57ekub6uba7iee34sviadareqxv234zbmkr7avqofxes4mqnru@vgkppexnj6cb>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="ma3smgpulpnwz33z"
Content-Disposition: inline
In-Reply-To: <57ekub6uba7iee34sviadareqxv234zbmkr7avqofxes4mqnru@vgkppexnj6cb>


--ma3smgpulpnwz33z
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v3 00/11] drm/connector: hdmi: limit infoframes per
 driver capabilities
MIME-Version: 1.0

On Sun, Aug 31, 2025 at 01:29:13AM +0300, Dmitry Baryshkov wrote:
> On Sat, Aug 30, 2025 at 09:30:01AM +0200, Daniel Stone wrote:
> > Hi Dmitry,
> >=20
> > On Sat, 30 Aug 2025 at 02:23, Dmitry Baryshkov
> > <dmitry.baryshkov@oss.qualcomm.com> wrote:
> > > It's not uncommon for the particular device to support only a subset =
of
> > > HDMI InfoFrames. It's not a big problem for the kernel, since we adop=
ted
> > > a model of ignoring the unsupported Infoframes, but it's a bigger
> > > problem for the userspace: we end up having files in debugfs which do
> > > mot match what is being sent on the wire.
> > >
> > > Sort that out, making sure that all interfaces are consistent.
> >=20
> > Thanks for the series, it's a really good cleanup.
> >=20
> > I know that dw-hdmi-qp can support _any_ infoframe, by manually
> > packing it into the two GHDMI banks. So the supported set there is
> > 'all of the currently well-known ones, plus any two others, but only
> > two and not more'. I wonder if that has any effect on the interface
> > you were thinking about for userspace?
>=20
> I was mostly concerned with the existing debugfs interface (as it is
> also used e.g. for edid-decode, etc).
>=20
> It seems "everything + 2 spare" is more or less common (ADV7511, MSM
> HDMI also have those. I don't have at hand the proper datasheet for
> LT9611 (non-UXC one), but I think its InfoFrames are also more or less
> generic).  Maybe we should change debugfs integration to register the
> file when the frame is being enabled and removing it when it gets unset.

But, like, for what benefit?

It's a debugfs interface for userspace to consume. The current setup
works fine with edid-decode already. Why should we complicate the design
that much and create fun races like "I'm running edid-decode in parallel
to a modeset that would remove the file I just opened, what is the file
now?".

> Then in the long run we can add 'slots' and allocate some of the frames
> to the slots. E.g. ADV7511 would get 'software AVI', 'software SPD',
> 'auto AUDIO' + 2 generic slots (and MPEG InfoFrame which can probably be
> salvaged as another generic one)). MSM HDMI would get 'software AVI',
> 'software AUDIO' + 2 generic slots (+MPEG + obsucre HDMI which I don't
> want to use). Then the framework might be able to prioritize whether to
> use generic slots for important data (as DRM HDR, HDMI) or less important
> (SPD).

Why is it something for the framework to deal with? If you want to have
extra infoframes in there, just go ahead and create additional debugfs
files in your driver.

If you want to have the slot mechanism, check in your atomic_check that
only $NUM_SLOT at most infoframes are set.

Maxime

--ma3smgpulpnwz33z
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaLVGFgAKCRAnX84Zoj2+
dllrAX94GZ81N40ectCnxYcKj+nZpN6UcMWR8EYDih6ILK4w0J49eNzGARVXu+eF
lwB1CJoBfjdbnsga9yVjeXCFRH47XfORMMFpd6RIh/AoUJ7fu6AYlLvYNrTwxgRE
sw4U5RZ1qg==
=g974
-----END PGP SIGNATURE-----

--ma3smgpulpnwz33z--

