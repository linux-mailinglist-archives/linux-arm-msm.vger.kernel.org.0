Return-Path: <linux-arm-msm+bounces-78509-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D502C00247
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Oct 2025 11:12:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B3D5D1A64DEA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Oct 2025 09:10:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5DAC72FB622;
	Thu, 23 Oct 2025 09:10:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ucw.cz header.i=@ucw.cz header.b="dZO5pAGf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from jabberwock.ucw.cz (jabberwock.ucw.cz [46.255.230.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE1342E973A;
	Thu, 23 Oct 2025 09:10:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.255.230.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761210612; cv=none; b=Sc10NpXg0TdurKXUXuArslWbffdWPmByBGW/hfne5FqutHgpF5XU/NS8kAJl2/G2BwpTVhm2qjcBRrjbzRdk22IfonbuHuNv6hN8btiSwGPmgwluFTZAV8UtvzNhD8Rz7L4s3E4YnSm57Y20eY/uUJbRPBavkP/NJwRRwFCwuqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761210612; c=relaxed/simple;
	bh=ABPCbXehAeujNeXXTYHO8vM2gn9xZNRhlxT8URfmhrQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ksGMIeyuuPfknSzpW3E9/vmxSDTPfIjIpvHK6noIXLUfY3zzR3ObuDUEp1EEMnTFqV5ND/KM4YbOvJVRrmnLv0VMic82ybM7FJUTylNblyU6OfGOwD/YepGUL4Pse5hQw2YKYBV3yXw/oDfcJLSvn3jjop4BplNrh586aWmr06s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ucw.cz; spf=pass smtp.mailfrom=ucw.cz; dkim=pass (1024-bit key) header.d=ucw.cz header.i=@ucw.cz header.b=dZO5pAGf; arc=none smtp.client-ip=46.255.230.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ucw.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ucw.cz
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
	id A85D01C00BE; Thu, 23 Oct 2025 11:10:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ucw.cz; s=gen1;
	t=1761210605;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=qfhj2kWljhn17y+hn3FmT0U8dmDAaVSptpO08pFygKg=;
	b=dZO5pAGfwh4jkjeXMNOsGYl1ef6zawHlVUAsBqdpASfS4kP3thofWQgk03XC3oH43a4trv
	ZCQkPykvlFKqNGCdQ5g59bFzqz+spljQ+6VKiw+tUjLo+0Y3tG10u2M0RBQb7M2URdGShl
	x9Z13Yp429RMoyHNLPIQ6Ml6w3ouHrA=
Date: Thu, 23 Oct 2025 11:10:05 +0200
From: Pavel Machek <pavel@ucw.cz>
To: Paul Sajna <sajattack@postmarketos.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	David Heidelberg <david@ixit.cz>, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	phone-devel@vger.kernel.org,
	Amir Dahan <system64fumo@protonmail.com>,
	Christopher Brown <crispybrown@gmail.com>
Subject: Re: [PATCH v2 04/13] arm64: dts: qcom: sdm845-lg-common: Add leds
Message-ID: <aPnw7WvSqFpMm4Mf@duo.ucw.cz>
References: <20250916-judyln-dts-v2-0-5e16e60263af@postmarketos.org>
 <20250916-judyln-dts-v2-4-5e16e60263af@postmarketos.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="tWaKq94wNt7nnE/w"
Content-Disposition: inline
In-Reply-To: <20250916-judyln-dts-v2-4-5e16e60263af@postmarketos.org>


--tWaKq94wNt7nnE/w
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> From: Amir Dahan <system64fumo@protonmail.com>
>=20
> Add the multicolor status led in the phone's notch

led->LED, "notch"->"notch."

> Signed-off-by: Amir Dahan <system64fumo@protonmail.com>

Reviewed-by: Pavel Machek <pavel@ucw.cz>

> @@ -504,6 +505,33 @@ &pm8998_resin {
>  	status =3D "okay";
>  };
> =20
> +&pmi8998_lpg {
> +	status =3D "okay";
> +
> +	multi-led {
> +		color =3D <LED_COLOR_ID_RGB>;
> +		function =3D LED_FUNCTION_STATUS;
> +
> +		#address-cells =3D <1>;
> +		#size-cells =3D <0>;
> +
> +		led@3 {
> +			reg =3D <3>;
> +			color =3D <LED_COLOR_ID_BLUE>;
> +		};
> +
> +		led@4 {
> +			reg =3D <4>;
> +			color =3D <LED_COLOR_ID_GREEN>;
> +		};
> +
> +		led@5 {
> +			reg =3D <5>;
> +			color =3D <LED_COLOR_ID_RED>;
> +		};
> +	};
> +};
> +
>  &sdhc_2 {
>  	cd-gpios =3D <&tlmm 126 GPIO_ACTIVE_LOW>;
> =20
>=20

--=20
I don't work for Nazis and criminals, and neither should you.
Boycott Putin, Trump, Netanyahu and Musk!

--tWaKq94wNt7nnE/w
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCaPnw7QAKCRAw5/Bqldv6
8rCVAJ9kEL9/YEcza4DB2cPMbdkQMwUdJgCgowwcztIDLCZnHyc9MEeZ60EatUk=
=5Jmm
-----END PGP SIGNATURE-----

--tWaKq94wNt7nnE/w--

