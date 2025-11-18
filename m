Return-Path: <linux-arm-msm+bounces-82392-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id C9052C6B8AB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Nov 2025 21:14:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 1B66A4EADF8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Nov 2025 20:13:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C3692F690F;
	Tue, 18 Nov 2025 20:13:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ucw.cz header.i=@ucw.cz header.b="F2J0iD0T"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from jabberwock.ucw.cz (jabberwock.ucw.cz [46.255.230.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D8642F690A;
	Tue, 18 Nov 2025 20:13:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.255.230.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763496814; cv=none; b=sMunSMoa2p1pHY8rVnLJZJXMZv+v9UDFmeLQu2JxUnqaCBNpsDBpNon33NRShbh5ZtH7GvtAFI9Omz2rRTFgGKubxv8UcSaSgrCAx/0K4b6786nVCUbRI4ywp2GNJa8QNoo1eRoHg0L2bfk4n1R1mlFXmNv+N9nuUvjqkUQjBfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763496814; c=relaxed/simple;
	bh=+DRrJupd2QGlz9UJ4T4XLGbowpbC2VpGmhuPvdiuD74=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iU1Dv2DNezHw1MC/79YunU/oZ0S7nrG3VqeUP3xBoE2Zwzh2x0muewqGPBJsFzLe4utj8v8FIZMFqYiP1n4eMyFyrRKHhKhrWjpdLLWaOSCRrLsDrnlmd/I37hSyVS2hp1cgaiarL44ITAhR3Whly3HqoPdopd0fxNEJcdFxoAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ucw.cz; spf=pass smtp.mailfrom=ucw.cz; dkim=pass (1024-bit key) header.d=ucw.cz header.i=@ucw.cz header.b=F2J0iD0T; arc=none smtp.client-ip=46.255.230.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ucw.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ucw.cz
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
	id 87BF61C008F; Tue, 18 Nov 2025 21:13:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ucw.cz; s=gen1;
	t=1763496807;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=dpdEB/KVKu4UwuutBdMBjD8Ok309M7zB1wuXhvHs3hw=;
	b=F2J0iD0TQ0nGBK3bmq4MOmIGxn6EKrJQ3gu5nNi3L6LzC4JM1yLzJVXqrH1iOEcCq5+fgc
	hmTE0PRR/Iul1ZJwrTZ0BQeWakEOdyoSrhLUeGaJNPI9CFchewKNqVGUqyEYuJtGBgFipg
	01/zdPE0ihlEKMSUwma6fhs63TaUHRA=
Date: Tue, 18 Nov 2025 21:13:26 +0100
From: Pavel Machek <pavel@ucw.cz>
To: Paul Sajna <sajattack@postmarketos.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	David Heidelberg <david@ixit.cz>, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Amir Dahan <system64fumo@protonmail.com>,
	Christopher Brown <crispybrown@gmail.com>
Subject: Re: [PATCH 00/11] arm64: dts: qcom: sdm845-lg-{common, judyln}:
 Improve HW support in dts
Message-ID: <aRzTZros3lPhjcjG@duo.ucw.cz>
References: <20250913-judyln-dts-v1-0-23b4b7790dce@postmarketos.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="6E4GkWjnJ3cpk/uO"
Content-Disposition: inline
In-Reply-To: <20250913-judyln-dts-v1-0-23b4b7790dce@postmarketos.org>


--6E4GkWjnJ3cpk/uO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> Rollup of improved hardware support via devicetree for LG G7 ThinQ=20
> (judyln) from sdm845-mainline kernel fork
>=20
> Notably, this patch-series enables full DRM acceleration and wifi,
> among other small improvements in individual commits
>=20
> after this patch-series the main things that remain to be worked
> on include touchscreen, audio, and modem.

Thanks for doing this... and please cc phone-devel@vger.kernel.org
with phone patches :-).

(And I see this is another device similar to OnePlus 6. Good. It
should be possible to get cameras there working, too).

Best regards,
								Pavel

> ---
> Paul Sajna (11):
>       arm64: dts: qcom: sdm845-lg-common: Add uarts and Bluetooth
>       arm64: dts: qcom sdm845-lg-judyln: Add battery and charger
>       arm64: dts: qcom: sdm845-lg-common: Add leds
>       arm64: dts: qcom: sdm845-lg-common: Add camera flash
>       arm64: dts: qcom: sdm845-lg-judyln: Add display panel
>       arm64: dts: qcom: sdm845-lg-common: Add wifi node
>       arm64: dts: qcom: sdm845-lg-judyln: Add firmware nodes
>       arm64: dts: qcom: sdm845-lg-common: Add qcom id
>       arm64: dts: qcom: sdm845-lg-common: Add chassis-type
>       arm64: dts: qcom: sdm845-lg-judyln: Sort and cleanup nodes
>       arm64: dts: qcom: sdm845-lg-common: Sort and cleanup nodes
>=20
>  arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi | 238 ++++++++++++++++++-=
------
>  arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts  | 134 ++++++++++++++
>  2 files changed, 310 insertions(+), 62 deletions(-)
> ---
> base-commit: 590b221ed4256fd6c34d3dea77aa5bd6e741bbc1
> change-id: 20250911-judyln-dts-17c41e59dc0f
> prerequisite-message-id: <20250910-judyln-panel-v1-1-825c74403bbb@postmar=
ketos.org>
> prerequisite-patch-id: e51151ea7f8fdad6ad7d90713febc5c6b6fc4f9c
> prerequisite-patch-id: b3dd44250da9cd12bc5b2d0d7e865dbe19ceed92
> prerequisite-patch-id: fd6c8077806cb03fcf37d0e0d730314c2760e334
>=20
> Best regards,

--=20
I don't work for Nazis and criminals, and neither should you.
Boycott Putin, Trump, Netanyahu and Musk!

--6E4GkWjnJ3cpk/uO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCaRzTZgAKCRAw5/Bqldv6
8t7PAJ9flfpkhRADitpVF5pgoZsiu5FMvACfaPVBCRUAKcF/LOP+34BMUoEmnBk=
=0ifS
-----END PGP SIGNATURE-----

--6E4GkWjnJ3cpk/uO--

