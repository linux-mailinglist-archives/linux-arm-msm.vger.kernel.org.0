Return-Path: <linux-arm-msm+bounces-70-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id DD0D97E3C9C
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Nov 2023 13:18:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7EECDB20BB7
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Nov 2023 12:18:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC6572FE00;
	Tue,  7 Nov 2023 12:18:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ErkAgx2R"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C02E92E65B
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Nov 2023 12:18:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16449C433C8;
	Tue,  7 Nov 2023 12:18:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699359497;
	bh=OTPITfqoNgf8Jzf8gCNGibipMX2tb1QEAd6RqdUSFCI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ErkAgx2RlSbgqNuK93lfa05dXA86rnpmhfM3cU4WQFYbRPcBcW/JoBe8xE0Q60nJB
	 QnzybSObkncybEV90rL/vgxrw9inzONRa/W/F3hc/1UxVTiACMJ4CIgSglV7dcX8bv
	 oYI7H07T1jEXslAmOQaCIkxHiSWDRcHPXAgEMvLdUQrmq6q9yB8DAcoDF19aabn9ZJ
	 jRu+KQwBOpyupjliuRv7NQ6POOca6d2zc7uZQ3n/Opqu1Ku3VQ0Or95OU/jmvykL/w
	 4kUtQEyDWZOqT+yb6i9jXYa18Nkd36THaI1EzzcWDb3mdD/p8UGchClV+oYjaJEIVD
	 wt9/alUabVVDQ==
Date: Tue, 7 Nov 2023 13:18:14 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, Douglas Anderson <dianders@chromium.org>, 
	Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Jessica Zhang <quic_jesszhan@quicinc.com>, 
	Marek Vasut <marex@denx.de>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Subject: Re: [RFC PATCH 03/10] drm/mipi-dsi: add API for manual control over
 the DSI link power state
Message-ID: <hkzoi4sazufi5xdgr6hacuzk72cnbtmm6dwm2bzfgwh5yij6wj@2g4eb6ea4dgd>
References: <20231016165355.1327217-1-dmitry.baryshkov@linaro.org>
 <20231016165355.1327217-4-dmitry.baryshkov@linaro.org>
 <7e4ak4e77fp5dat2aopyq3g4wnqu3tt7di7ytdr3dvgjviyhrd@vqiqx6iso6vg>
 <CAA8EJpp48AdJmx_U=bEJZUWZgOiT1Ctz6Lpe9QwjLXkMQvsw5w@mail.gmail.com>
 <uj6rtlionmacnwlqxy6ejt5iaczgbbe5z54ipte5ffbixcx3p4@pps7fcr3uqhf>
 <1696f131-83fb-4d0c-b4d7-0bdb61e4ae65@linaro.org>
 <mxtb6vymowutj7whbrygwlcupbdnfqxjralc3nwwapsbvrcmbm@sewxtdslfoen>
 <CAA8EJpozZkEswnioKjRCqBg4fcjVHFwGivoFNTNHVwyocKprQw@mail.gmail.com>
 <2z3yvvtd6ttsd7qw43sl5svtfijxevdr6omxxmws64k6l5qv55@5nnh2b32h2ep>
 <2023110704-playback-grit-7a27@gregkh>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="dlcuzb3mgsgh2p4c"
Content-Disposition: inline
In-Reply-To: <2023110704-playback-grit-7a27@gregkh>


--dlcuzb3mgsgh2p4c
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 07, 2023 at 12:22:21PM +0100, Greg Kroah-Hartman wrote:
> On Tue, Nov 07, 2023 at 11:57:49AM +0100, Maxime Ripard wrote:
> > +GKH
>=20
> Why?  I don't see a question for me here, sorry.

I guess the question is: we have a bus with various power states
(powered off, low power, high speed)

low power is typically used to send commands to a device, high speed to
transmit pixels, but still allows to send commands.

Depending on the devices, there's different requirements about the state
devices expect the bus to be in to send commands. Some will need to send
all the commands in the low power state, some don't care, etc. See
the mail I was replying too for more details.

We've tried so far to model that in KMS itself, so the framework the
drivers would register too, but we're kind of reaching the limits of
what we can do there. It also feels to me that "the driver can't access
its device" is more of a problem for the bus to solve rather than the
framework.

Do you agree? Are you aware of any other bus in Linux with similar
requirements we could look at? Or any suggestion on how to solve it?

Thanks
Maxime

--dlcuzb3mgsgh2p4c
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZUorBgAKCRDj7w1vZxhR
xX4iAPwJyqaJwy9edtHIOgX1Ky1Mp1GAxI1ipJP7MO22Wy9lAAD/V/u6QTmSypUr
ObUiBBEweBdU/Zz6s4t5E56TaLF4PQI=
=W84/
-----END PGP SIGNATURE-----

--dlcuzb3mgsgh2p4c--

