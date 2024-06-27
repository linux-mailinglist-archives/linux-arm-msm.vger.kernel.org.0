Return-Path: <linux-arm-msm+bounces-24511-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 70BE291AC21
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Jun 2024 18:01:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2F26C1F22FAF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Jun 2024 16:01:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE5F019923D;
	Thu, 27 Jun 2024 16:00:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Kf8/d11m"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1EB1198841;
	Thu, 27 Jun 2024 16:00:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719504053; cv=none; b=kH40c7ksz5PSFhxTzTufWqyF7wBP8wyhCjPvdFq3k+pWnLYBwUEHhgeUectuZtyHgxqG10Zio1nfOCFtKwYr2jFL5Tjge+u79rkYpdG/b1NL27rIqtcDdHhqtseY7VfpcbhTzz/BaMoWClbGjqu3Qr7QgWsfN4spRBFw9/SCGQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719504053; c=relaxed/simple;
	bh=Irj6F3lt/s1vut1bLWbjR1ksXGXlZEgpu38CWFEBbgg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KNHr6BqWSN8y9XP0SkmUCvwD2A21zeuCcco4iuwn40pxISJj7vy/s4fsnU4JTRzbdCsmWJq+S1IKvuA6sSrtlMf+ttGgttQfLQaXPFxrxeUTO+g9HJ+6JXaJc2dVjWq7+YYdciaLDsrZ2LP94Jq8XswT5vl9Dds4ZOuXR8wMnXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Kf8/d11m; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B8E8C2BBFC;
	Thu, 27 Jun 2024 16:00:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719504053;
	bh=Irj6F3lt/s1vut1bLWbjR1ksXGXlZEgpu38CWFEBbgg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Kf8/d11mM17XwDXDPGsItEKlSPzWzaRyNyCqzYnsMHJvXvKxzzAX00LA85S4TrWZB
	 ZpWuY7I5Cpr7W0yvS3sIpf2bEnQKJwOfzvMw66OfmtO4UE6mfEwdunGPT6zGyrPNpd
	 nYU8pswhZ8mGS+jy7eXdU8+bb6w8mkMfDmcq6xidHueD4ksB501wuTydNRCoJcjRgt
	 z+AuKN/HdHYkwoKMteBUelhg2QvyE3OlbBYjXrKk5Y0ezKuk54nrfrS9aYr7QiwfAJ
	 RZzUuX+m7kdA98Vv06GPZGeMdN+h6KYJLbRl0at4xBqpVB2FsQVQjreQd4jwXvAozV
	 vUB5dtejzx2Dg==
Date: Thu, 27 Jun 2024 17:00:49 +0100
From: Conor Dooley <conor@kernel.org>
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Raymond Hackley <raymondhackley@protonmail.com>,
	linux-kernel@vger.kernel.org,
	Bjorn Andersson <andersson@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH 2/2] ARM: dts: qcom-msm8226-samsung-ms013g: Add initial
 device tree
Message-ID: <20240627-camera-appeasing-9ec979f1bc7e@spud>
References: <20240626191829.280611-1-raymondhackley@protonmail.com>
 <20240626191829.280611-3-raymondhackley@protonmail.com>
 <5021ca42-f8d8-4dff-b0e2-21c7f9d680fa@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="7RPZU7Zawm7OiEi/"
Content-Disposition: inline
In-Reply-To: <5021ca42-f8d8-4dff-b0e2-21c7f9d680fa@linaro.org>


--7RPZU7Zawm7OiEi/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 26, 2024 at 11:52:04PM +0200, Konrad Dybcio wrote:
> On 26.06.2024 9:18 PM, Raymond Hackley wrote:
> > Samsung Galaxy Grand 2 is a phone based on MSM8226. It's similar to the
> > other Samsung devices based on MSM8226 with only a few minor difference=
s.
> >=20
> > The device trees contain initial support with:
> >  - GPIO keys
> >  - Regulator haptic
> >  - SDHCI (internal and external storage)
> >  - UART (on USB connector via the TI TSU6721 MUIC)
> >  - Regulators
> >  - Touchscreen
> >  - Accelerometer
> >=20
> > Signed-off-by: Raymond Hackley <raymondhackley@protonmail.com>
> > ---
>=20
> [...]
>=20
> > +	reserved-memory {
>=20
> 'r' > 'g'

I assume by this you mean "please the reserved memory node after the
gpio one, in alphanumerical order?

>=20
> > +		smem_region: smem@fa00000 {
> > +			reg =3D <0x0fa00000 0x100000>;
> > +			no-map;
> > +		};
> > +	};
> > +
> > +	gpio-hall-sensor {

--7RPZU7Zawm7OiEi/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZn2MsQAKCRB4tDGHoIJi
0vfsAQDngxyZBhF+AJoEY8F/Nrs3lJzVvDlKyd2lem4ooIrRGgEAmbJ/j/Ra+UkH
ULinDOTPN8uPXTvabJEoDyAT7Dzlzwc=
=SVgT
-----END PGP SIGNATURE-----

--7RPZU7Zawm7OiEi/--

