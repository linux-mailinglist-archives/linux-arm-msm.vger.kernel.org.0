Return-Path: <linux-arm-msm+bounces-92728-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aaT1HyQUjmms/AAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92728-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Feb 2026 18:55:48 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0472E130180
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Feb 2026 18:55:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B51B5308A9E7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Feb 2026 17:55:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C41A9224AF7;
	Thu, 12 Feb 2026 17:55:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PVsJewGH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DEA421C16E;
	Thu, 12 Feb 2026 17:55:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770918945; cv=none; b=k7yQ22Z9oot7tmATE8vImCv56jqG1t11/XllEOn2omtGFV4vi+KRAiXB46ExeXI1ybKvK13sPT2WrDf23TNT+vKsrOF5LjBP7vnjvr9LQBI99CZqzwZZGAulVk/s5NAbWYZZgoI29TmkJib/GHXUJ8hIHkgv3kSfPCj6jxFjX0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770918945; c=relaxed/simple;
	bh=tmiUxdjaAj9JS3g6BpUFQUWj1Ue0lOWa//lkSxTwLHw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dZBIIQUiABIV1GgeebwPVLR+1Xjsg2z9A24d091GP1e1CE3nuhv+ESZnt/IqfybfWqUkC5YNkWXZeC1u8pnmQneO0V3peXSWL7dpevgNJATn3l4XdMT6T6fNeMAfNRcdF2qMsRoM3C+ZTP5AitG+MwVagQAv5afoXDIu2urJTzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PVsJewGH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E5E2C4CEF7;
	Thu, 12 Feb 2026 17:55:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770918945;
	bh=tmiUxdjaAj9JS3g6BpUFQUWj1Ue0lOWa//lkSxTwLHw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PVsJewGH9iF7XUHoRikHfCDRKjUd/VZtZ2sZXGNwoeelcB5s9V4zFpcgTrtVTwFjA
	 Uk0/aPQiFiyVxZhSiwABEzd5v95UWllJQewiMfk6hiogqX16lFayPhWbAqpNEa+qfI
	 KMkxSN3yVpZai6sst04BaqNRSoVSOa6cQAYLWuk7jeGOEhk+8UknTyptwDNAGvS6wI
	 2/hSsSGeLHiEIy4fB5PFItbPFas/BIzJDjU8zvwzFhBPEYIliTt057Gb4iBu+27+1O
	 ClfeydGKA8q5iOnXFfDpA+CZMsB4EK3ub63lPAEknWqiwdDwBsuozYMnfgreL2xSfe
	 25xTNUvAsLMrg==
Date: Thu, 12 Feb 2026 17:55:39 +0000
From: Conor Dooley <conor@kernel.org>
To: Riccardo Mereu <r.mereu.kernel@arduino.cc>
Cc: lee@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
	sboyd@kernel.org, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	alexey.klimov@linaro.org, srinivas.kandagatla@oss.qualcomm.com,
	m.facchin@arduino.cc, akucheri@qti.qualcomm.com,
	ndechesn@quicinc.com, Riccardo Mereu <r.mereu@arduino.cc>
Subject: Re: [PATCH V2] arm64: dts: qcom: arduino-imola: fix faulty spidev
 node
Message-ID: <20260212-retired-eldercare-14f91dfaf995@spud>
References: <20260212152329.134065-1-r.mereu.kernel@arduino.cc>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="OMcjiy6yAWK0hAqa"
Content-Disposition: inline
In-Reply-To: <20260212152329.134065-1-r.mereu.kernel@arduino.cc>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-92728-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[17];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[conor@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,arduino.cc:email,0.0.0.0:email]
X-Rspamd-Queue-Id: 0472E130180
X-Rspamd-Action: no action


--OMcjiy6yAWK0hAqa
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 12, 2026 at 04:23:29PM +0100, Riccardo Mereu wrote:
> From: Riccardo Mereu <r.mereu@arduino.cc>
>=20
> CS pin added on pinctrl0 property is causing spidev to return -ENODEV
> since that GPIO is already part of spi5 pinmuxing.
>=20
> Fixes: 3f745bc0f11f ("arm64: dts: qcom: qrb2210: add dts for Arduino unoq=
")
> Signed-off-by: Riccardo Mereu <r.mereu@arduino.cc>
> ---
>  arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts | 8 --------
>  1 file changed, 8 deletions(-)
>=20
> diff --git a/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts b/arch/ar=
m64/boot/dts/qcom/qrb2210-arduino-imola.dts
> index 197ab6eb1666..796c1f7ff17c 100644
> --- a/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts
> +++ b/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts
> @@ -328,18 +328,10 @@ &spi5 {
>  	spidev@0 {

Of you're modifying this node, you should fix the nodename too. "spidev"
isn't a type of device. It should probably either be "mcu@" or whatever
the mcu is used for.

>  		reg =3D <0>;
>  		compatible =3D "arduino,unoq-mcu";
> -		pinctrl-0 =3D <&spidev_cs>;
> -		pinctrl-names =3D "default";
>  	};
>  };
> =20
>  &tlmm {
> -	spidev_cs: spidev-cs-state {
> -		pins =3D "gpio17";
> -		function =3D "gpio";
> -		drive-strength =3D <16>;
> -	};
> -
>  	jmisc_gpio18: jmisc-gpio18-state {
>  		pins =3D "gpio18";
>  		function =3D "gpio";
> --=20
> 2.53.0
>=20

--OMcjiy6yAWK0hAqa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaY4UGwAKCRB4tDGHoIJi
0ut1AQC6hbCoOcl6oNOgXLXPG4oh0gSJ3cT0xrHoUtAkw6ZjyQD+O2DCXW+CZEmU
Np7sskf0EyivJdZT41nb/E7HIhxvXA0=
=uSw8
-----END PGP SIGNATURE-----

--OMcjiy6yAWK0hAqa--

