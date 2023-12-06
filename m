Return-Path: <linux-arm-msm+bounces-3579-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D6CE8073FC
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Dec 2023 16:53:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9543DB20D5C
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Dec 2023 15:53:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21E6E3DB87;
	Wed,  6 Dec 2023 15:53:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dG5FbRPS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01EF2182C3
	for <linux-arm-msm@vger.kernel.org>; Wed,  6 Dec 2023 15:52:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB05EC433C7;
	Wed,  6 Dec 2023 15:52:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701877979;
	bh=LdilzxE/iMOghbtMhroel8TLLoUeNyWvQxNjGLcFQxg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dG5FbRPSZTX+0u3Y6Tl4ST0ST4XjGLuLGnV8NDPUGcjjdXR1vB7ltYsTv6+JTFnjb
	 2rv7QSw7YD256UtGdWjFPApgCXAb/JL5wE6iI6jqR2uCOctjhoGm+8oZCLsfdDyCFN
	 LuEJVRwETo05SyZIO2mhrQ8HypUU/fJk767jVPoAMFfcqMpSOMeSL42PQ7HpaRwDHA
	 HNkQUllBDW34XJRWu5OeNsu5XTo+qH4Xg6MDYfVaa/j5Zw2COXLt921pggFUHRnQRv
	 dLgtwHe/tpQJaxCtyvmXnmoj1mGb/7OgtgaMiqJaCTjbVAwLUOSSf0HkEIjqRenDe6
	 aObhphsc5zi0Q==
Date: Wed, 6 Dec 2023 16:52:56 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-arm-msm@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH RESEND v2 1/3] drm/encoder: register per-encoder debugfs
 dir
Message-ID: <mibvyyc7kbzoorax4a2bycwhtqu2nzdjtdvzmhj6znbg5kpsxu@jayfluamjtmy>
References: <20231203115315.1306124-1-dmitry.baryshkov@linaro.org>
 <20231203115315.1306124-2-dmitry.baryshkov@linaro.org>
 <9ecab61b-1e79-464b-b3e2-ff3af8aee537@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ydee35nk74wgmf4h"
Content-Disposition: inline
In-Reply-To: <9ecab61b-1e79-464b-b3e2-ff3af8aee537@sirena.org.uk>


--ydee35nk74wgmf4h
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Mark,

On Tue, Dec 05, 2023 at 04:13:41PM +0000, Mark Brown wrote:
> On Sun, Dec 03, 2023 at 02:53:13PM +0300, Dmitry Baryshkov wrote:
>=20
> > Each of connectors and CRTCs used by the DRM device provides debugfs
> > directory, which is used by several standard debugfs files and can
> > further be extended by the driver. Add such generic debugfs directories
> > for encoder.
>=20
> Today's -next fails to boot an imx_v6_v7_defconfig on at least the UDOO
> dual and quad platforms, based on i.MX6DL and i.MX6Q respectively.
> multi_v7_defconfig looks fine on the same boards, it's just the i.MX
> specific config that's failing.  Nothing else in my CI appears impacted.
> We get a NULL pointer defererence while bringing up the display
> subsystem:
>=20
> [    1.392715] imx-drm display-subsystem: bound imx-ipuv3-crtc.7 (ops 0xc=
0f9a490)
> [    1.400013] imx-drm display-subsystem: bound 120000.hdmi (ops 0xc0f9af=
80)
> [    1.407193] 8<--- cut here ---
> [    1.410256] Unable to handle kernel NULL pointer dereference at virtua=
l address 00000010 when read
>=20
> ...
>=20
> [    1.891882]  drm_debugfs_encoder_add from drm_encoder_register_all+0x2=
0/0x60
> [    1.898954]  drm_encoder_register_all from drm_modeset_register_all+0x=
34/0x70
> [    1.906116]  drm_modeset_register_all from drm_dev_register+0x140/0x288
> [    1.912765]  drm_dev_register from imx_drm_bind+0xd0/0x128
> [    1.918284]  imx_drm_bind from try_to_bring_up_aggregate_device+0x164/=
0x1c4
> [    1.925275]  try_to_bring_up_aggregate_device from __component_add+0x9=
0/0x13c
>=20
> Full log at:
>=20
>    https://lava.sirena.org.uk/scheduler/job/308781
>=20
> A bisect identfied this patch (in -next as caf525ed45b4960b4) as being
> the commit that introduced the issue, bisect log below.  I've not done
> any other investigation but the commit does seem plausibly related to
> the backtrace in the oops.

I think it's the same issue than the one fixed by:
https://lore.kernel.org/all/20231205130631.3456986-1-m.szyprowski@samsung.c=
om/

Maxime

--ydee35nk74wgmf4h
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZXCY2AAKCRDj7w1vZxhR
xXkhAQDYVsqvq/B7gQ5Gfle74Y/omCL44y/CEojB/xSWNBy8eAD/UL8LRTRWsR8d
vDESXJ/WbtFvOf5mQYeJ9MmC1GARHgg=
=LSR5
-----END PGP SIGNATURE-----

--ydee35nk74wgmf4h--

