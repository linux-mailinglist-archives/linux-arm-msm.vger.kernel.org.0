Return-Path: <linux-arm-msm+bounces-78510-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 938F4C00261
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Oct 2025 11:12:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 45AA84E2164
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Oct 2025 09:12:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E74B2FABFA;
	Thu, 23 Oct 2025 09:12:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ucw.cz header.i=@ucw.cz header.b="Ng68Cg/S"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from jabberwock.ucw.cz (jabberwock.ucw.cz [46.255.230.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8AAF2F9C37;
	Thu, 23 Oct 2025 09:12:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.255.230.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761210758; cv=none; b=Ct9hRsv4olyEhz0lBOyKVoF60CFj9NiWadRPOYBuxK8SQ2VKRKkpaMX+7OkaHVA31LWgKl+GfPBXmV8X/jMbKkJnRIuW8qLdMjlI8FPZ5zAy2j0g292Gsrk23ZKYO93kMILKJ+rYp5HuTpjD7B5bET3N3EI75qlyJqV/QRJraaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761210758; c=relaxed/simple;
	bh=Au4M4ajM2Qer0brKpjP6qDjkprWx/qHTP/pDYkB9CKk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cOkEbaXFttDodpr+DLbgegiqZ0N/+vTH2FljFyYRKakdtajCFMMX4XmHju5z7fhdzNrcJ4Fkz+cTYyFxWRzDVbRxUPKF+UUdwAb8OseXe0Sw5iCp2j/NebM4Go/tIS1B9EX+ZrEW5cuVnMbch5aOTgruvCVnIJevjTfyM4N9tEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ucw.cz; spf=pass smtp.mailfrom=ucw.cz; dkim=pass (1024-bit key) header.d=ucw.cz header.i=@ucw.cz header.b=Ng68Cg/S; arc=none smtp.client-ip=46.255.230.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ucw.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ucw.cz
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
	id DD70F1C008F; Thu, 23 Oct 2025 11:12:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ucw.cz; s=gen1;
	t=1761210753;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=aktiGT3qaNGuhoLaDOBQgVEKItTjB5lAUMaRWvoHUBk=;
	b=Ng68Cg/S/+IO3SnbpS6Lloeb7Nb4lJrr9pBcDuxcvJf8xpNTTqCDjxrzJn9hPf9DKSB774
	U0FBoJnD85//ksL7pJY5sukB82RZgROrfmfaZtBMy2QHTRzZyl7XRTEPkdYkbJmHo4xdeq
	v5SvvxWkPGdY2JL0ldlYfoJ3XritslQ=
Date: Thu, 23 Oct 2025 11:12:33 +0200
From: Pavel Machek <pavel@ucw.cz>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Paul Sajna <sajattack@postmarketos.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	David Heidelberg <david@ixit.cz>, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	phone-devel@vger.kernel.org,
	Amir Dahan <system64fumo@protonmail.com>,
	Christopher Brown <crispybrown@gmail.com>
Subject: Re: [PATCH v2 03/13] arm64: dts: qcom: sdm845-lg-judyln: Add battery
 and charger
Message-ID: <aPnxgXU7VFCpvk2w@duo.ucw.cz>
References: <20250916-judyln-dts-v2-0-5e16e60263af@postmarketos.org>
 <20250916-judyln-dts-v2-3-5e16e60263af@postmarketos.org>
 <772be3c8-751b-4f96-8ed1-fc8033babe74@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Dp7LmNbBIZtGMwtq"
Content-Disposition: inline
In-Reply-To: <772be3c8-751b-4f96-8ed1-fc8033babe74@oss.qualcomm.com>


--Dp7LmNbBIZtGMwtq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed 2025-09-17 15:47:47, Konrad Dybcio wrote:
> On 9/17/25 3:09 AM, Paul Sajna wrote:
> > From: Christopher Brown <crispybrown@gmail.com>
> >=20
> > Values based on lineageos kernel
>=20
> A link for reference would be nice to see
>=20
> >=20
> > Signed-off-by: Christopher Brown <crispybrown@gmail.com>
> > ---
> >  arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts | 13 +++++++++++++
> >  1 file changed, 13 insertions(+)
> >=20
> > diff --git a/arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts b/arch/arm64=
/boot/dts/qcom/sdm845-lg-judyln.dts
> > index 49225e4fa80e5f45a36964d5d733dc238e4413f8..be488891d0ab01c5bfd3762=
514fbf1c3bbf6845a 100644
> > --- a/arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts
> > +++ b/arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts
> > @@ -37,6 +37,14 @@ key-thinq {
> >  			interrupts =3D <89 IRQ_TYPE_LEVEL_LOW>;
> >  		};
> >  	};
> > +
> > +	battery: battery {
> > +		compatible =3D "simple-battery";
> > +
> > +		charge-full-design-microamp-hours =3D <3000000>;
> > +		voltage-min-design-microvolt =3D <3200000>;
>=20
> 3.2 is rather low.. are you sure?

In flashlights (etc), Li-IONs are often pulled down to 3.00V. It does
not have any great advantage because it goes down from 3.3 to 3.0V
pretty quickly, but it is not completely insane.

Actually, under load, it may make sense: internal voltage will be
higher at that point.

Best regards,
								Pavel

--=20
I don't work for Nazis and criminals, and neither should you.
Boycott Putin, Trump, Netanyahu and Musk!

--Dp7LmNbBIZtGMwtq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCaPnxgQAKCRAw5/Bqldv6
8mmYAJ4sxugGVJtZwmgCyFuQAGHI1EPpJQCgmz10yfgAa5WOAb8dM3gnTw5pEc0=
=RY6z
-----END PGP SIGNATURE-----

--Dp7LmNbBIZtGMwtq--

