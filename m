Return-Path: <linux-arm-msm+bounces-50755-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C7426A58980
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Mar 2025 01:09:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0F233169675
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Mar 2025 00:09:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 889E123A0;
	Mon, 10 Mar 2025 00:09:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="owXf03Nz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DF0481E;
	Mon, 10 Mar 2025 00:09:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741565361; cv=none; b=JK0YzriVkFvddyfMG3zzceZxQ0kFnOgMOCiJfMuW4tjbFwF1YD7bN8dEdmxGlq61yamqZ/PuBOS0LEbTON5lOeaA4nAfrAITAje3XUN53Le5USSTrSkwbx0WgTRZ6AxSiUUA4vYLhlfwZZAgJkCj0lx6hs3TKMeKGlNpUyE2P0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741565361; c=relaxed/simple;
	bh=xhdh8DfzjzkkyMzCsHq/3sp7L1dCisrxi/w6JvA65VM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nsw7jewiZxo5GiV7s8yiB5xKov6eOPElUtArAqttniZ1A8aoile2/5H8KNnoy4TBtB+svyoao0Mg55srFTHVJPluM2qKJfZgcTS1S9V1ins0MYpJ8q8HQtH/oqmV3IQwl0ZJ07yc2BeK8mFoij4PXLb0pfsvKM05cw7Ng8OYa84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=owXf03Nz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D6BDC4CEED;
	Mon, 10 Mar 2025 00:09:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741565360;
	bh=xhdh8DfzjzkkyMzCsHq/3sp7L1dCisrxi/w6JvA65VM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=owXf03NzPRZYWvMX/ceVRzsVgnyp8t/wzqg4ZFNlPLtcyuhdBRRUcF7PBKAnp0RbF
	 9U/xNMsyOgVBQ4YAks0VasLcRdX0kB94ZqbQTQyw+wNQbYgUxbizDnSQ54SxNGpYp8
	 jixZe/4tBIyomISBimbNNVTz3nyOHY9fDpgLYvEz+g3Fl6lnR/lqFj8ifKnFDdUqNT
	 MoYTXdX6/QPdO4F9ryrKGdl+EDNiNPobAvOQkw8cBt3AX7ClOCDiHHs/W5fEzoHAhH
	 Z1UjD3/WetPQhAU8ZgQOSqk61+c0mUQM2wMhd3SF6hA0TREBSvkBU96PZm8Jv08aTf
	 NpEe1/E4XOngQ==
Received: by venus (Postfix, from userid 1000)
	id 55276180B94; Mon, 10 Mar 2025 01:09:17 +0100 (CET)
Date: Mon, 10 Mar 2025 01:09:17 +0100
From: Sebastian Reichel <sre@kernel.org>
To: Abel Vesa <abel.vesa@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Johan Hovold <johan@kernel.org>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC 1/2] arm64: dts: qcom: x1e78100-t14s: Add LCD variant with
 backlight support
Message-ID: <qh6bb2h6ntyy6cvcigvnfp6gurxcvryg44ybd3kf3y73wxl5ua@hk4wydp4tn45>
References: <20250306090503.724390-1-abel.vesa@linaro.org>
 <20250306090503.724390-2-abel.vesa@linaro.org>
 <lolqokpczxdscvgj6xdfyxblmle3csgzje3fgo4itzspgmeriy@7zzx7hg2zfks>
 <Z81dODU91zDPo/H5@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="j6wfhyh62rj4x5ws"
Content-Disposition: inline
In-Reply-To: <Z81dODU91zDPo/H5@linaro.org>


--j6wfhyh62rj4x5ws
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [RFC 1/2] arm64: dts: qcom: x1e78100-t14s: Add LCD variant with
 backlight support
MIME-Version: 1.0

Hi,

On Sun, Mar 09, 2025 at 11:19:52AM +0200, Abel Vesa wrote:
> On 25-03-08 01:01:31, Sebastian Reichel wrote:
> > Hi,
> >=20
> > On Thu, Mar 06, 2025 at 11:05:02AM +0200, Abel Vesa wrote:
> > > Due to the fact that Lenovo Thinkpad T14s Gen6 is available with both
> > > OLED and LCD, the backlight control differs HW-wise. For the LCD vari=
ant,
> > > the panel's backlight is controlled via one of the PWMs provided by t=
he
> > > PMK8550 PMIC. For the OLED variant, the backlight is internal to the
> > > panel and therefore it is not described in devicetree.
> > >=20
> > > For this reason, create a generic dtsi for the T14s by renaming the
> > > existing dts. While at it, add a node name to panel and drop the enab=
le
> > > gpio and pinctrl properties from the panel node. Then add the LCD var=
iant
> > > dts file with the old name and describe all backlight related nodes.
> > >=20
> > > So the existing dts will now be used for LCD variant while for OLED n=
ew
> > > dts will be added.
> > >=20
> > > Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> > > ---
> > > [...]
> > > +	backlight: backlight {
> > > +		compatible =3D "pwm-backlight";
> > > +		pwms =3D <&pmk8550_pwm 0 5000000>;
> >=20
> > I've tried this patch series together with the fix series [0], but
> > without the duty cycle calculation change [1]. Instead I changed the
> > period from 5000000 to 4266667. With that everything works as
> > expected for me.
> >=20
> > [0] https://lore.kernel.org/all/20250305-leds-qcom-lpg-fix-max-pwm-on-h=
i-res-v4-0-bfe124a53a9f@linaro.org/
> > [1] https://lore.kernel.org/all/20250303-leds-qcom-lpg-compute-pwm-valu=
e-using-period-v1-1-833e729e3da2@linaro.org/
>=20
> Yes, I forgot to squash in the correct period.
>=20
> The period should actually be 4266537. This is because the max PWM value
> is actually BIT(resolution) - 1.

For the version with 4266537:

Tested-by: Sebastian Reichel <sre@kernel.org>

-- Sebastian

>=20
> Will update in next version.
>=20
> The [1] patch was basically NACKed by Uwe. It is not needed if we set
> the period to 4266537 in DT.
>=20
> >=20
> > Greetings,
> >=20
> > -- Sebastian
>=20
>=20

--j6wfhyh62rj4x5ws
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmfOLakACgkQ2O7X88g7
+pomfA//c6tWamks7e9QRfaDSQenMPScMxhqbQZjY+ppsNnrMMNNHx/CITtewZEW
2eg5Ne6KXOTGxBUT64GA/aOQwRZztfaxwpjZ0g14SWB3Ev1WMrEFHthmpXXm15/j
37pN7HZ0aD9fDHj1SDQziW4I1MyA3dIKWRVvJLd2gRybo2zcjW3HGkHYoVIoxJ3l
IA+cyLgPdG5tPS2tlQQ/lIkyPtU2YIaLFqsCMtecm3BBDMHJVoV6oBhsilR+sNRu
98XbyPRuEQ+Bt5/migLolPY8DyxMNHJalgKdYeba1LaY95GV77KebfqzuZx0bWPR
eh15BKn9OdVjMoIAG7rCVTx0J9ZEeVCbMwaPYjEsrmZozx1p5SlrLQ8uHaoo8Opm
wSu4eh2FlYx2i2mHynTS1PPH/x+K4u/tl59BVUTcFpGqjt9F7EvEJ0qbayYh1kWO
u2BgY/BNVaXAbmxOapEfhPwYaOkOtO98WQImN2EkAbMEzZxQrJCcWyGIDPQWTXdq
EzfT4yxM5usnFX35NBOabFsmWBcTu3htk4JPaql4ixJNjkpU2/nJomuZj7tIWnaD
IznIjXdJPFNLMJ2w1aXCLj1ONXnBdq3pGfR8rYw1d4FxUDOnMTMEpSHNZfbIAMHd
sp7m8ewzuPKd3+ClJADvhiKRA8vd8H4hT0UP8vEFGpnzApvKp8E=
=L13G
-----END PGP SIGNATURE-----

--j6wfhyh62rj4x5ws--

