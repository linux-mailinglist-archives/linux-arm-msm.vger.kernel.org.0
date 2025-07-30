Return-Path: <linux-arm-msm+bounces-67080-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 02C6FB15B5D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Jul 2025 11:21:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6961F18A3A81
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Jul 2025 09:21:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 190FF26CE08;
	Wed, 30 Jul 2025 09:21:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ucw.cz header.i=@ucw.cz header.b="QPc2ry4N"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from jabberwock.ucw.cz (jabberwock.ucw.cz [46.255.230.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6CBF26D4D9;
	Wed, 30 Jul 2025 09:21:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.255.230.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753867268; cv=none; b=FE+XQbib8Oi5W6DLQ6bywCYZSaB89K0ADivsWx2jOVPTeFtcWt/eoYpzpn3PcbwSotefl2Lc9BIAMEBr3e9yM07nseVHit+NBBD3YZzyigf3hahmCiVh+P9yUNgRgzAQWNuzmV4IN5A7npYQi7N3Q+7t9qRqn7EcgqmM2tcTwXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753867268; c=relaxed/simple;
	bh=Dl3HFCx+MjlzJUvW+ztSdy5yUg6PhS3StyOa8D0AVgk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rZa8Y8UaIw69jzrBBIwlZDvTJu6yJx4mDwCBkO5b+53zT+D86jgmLkiU7u9wnLmW7KVxQoBP9Bqv5Y7qXF4AfaU8CZ7+JJozuKxfgI3h2CEGgfwAHzA09t7xq31AfmGGebb9hBcIS3hIBURTidz/7/b3g5GaiLpORC+/Cw7DOKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ucw.cz; spf=pass smtp.mailfrom=ucw.cz; dkim=pass (1024-bit key) header.d=ucw.cz header.i=@ucw.cz header.b=QPc2ry4N; arc=none smtp.client-ip=46.255.230.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ucw.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ucw.cz
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
	id 438811C008E; Wed, 30 Jul 2025 11:21:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ucw.cz; s=gen1;
	t=1753867261;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=DEtwO4IttlvipDORVZWV0BMjD9UCvVfImJIb85N5oPk=;
	b=QPc2ry4N0u+L5eJxRfOaE6AUuA1LZ2iOomS6+FuSFKfKbNCkrPP2TxviKUyXj+pvGy56XE
	jfGYTOa3RFDsmFIMOpGcF/KhcT1Mi8tYdl04faQGsyo48DXz6FlqMt4NtjWb11MGkiI2tj
	K357/a0HdGrxmBvDDvW39Rju2eTnqT0=
Date: Wed, 30 Jul 2025 11:21:00 +0200
From: Pavel Machek <pavel@ucw.cz>
To: Violet <violet@atl.tools>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 0/2] arm64: dts: qcom: add initial support for Samsung
 Galaxy S22
Message-ID: <aInj/G5O4605AuNg@duo.ucw.cz>
References: <20250716231710.99983-1-violet@atl.tools>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="iPMP6GnbWrzjWSL6"
Content-Disposition: inline
In-Reply-To: <20250716231710.99983-1-violet@atl.tools>


--iPMP6GnbWrzjWSL6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed 2025-07-16 23:17:08, Violet wrote:
> Changes in v6:
> - Remove debug features (bootargs, etc) that slipped in the v5 DTS
> - Format and organize nodes correctly based on existing DTS,=20
>  move "status =3D "okay";" to the bottom always
> - Solve "ddr_device_type" and "qcom,rmtfs-mem" warnings, the rest are
>  from existing SoC .dtsi
> - Disable buttons, ufs and other features for later revision
>=20
> Signed-off-by: Violet <violet@atl.tools>

Is that a real name? Could we use real names in signoffs?

Thanks,
								Pavel

> Violet (2):
>   dt-bindings: arm: qcom: document r0q board binding
>   arm64: dts: qcom: add initial support for Samsung Galaxy S22
>=20
>  .../devicetree/bindings/arm/qcom.yaml         |   1 +
>  arch/arm64/boot/dts/qcom/Makefile             |   1 +
>  .../boot/dts/qcom/sm8450-samsung-r0q.dts      | 145 ++++++++++++++++++
>  3 files changed, 147 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/qcom/sm8450-samsung-r0q.dts

--=20
I don't work for Nazis and criminals, and neither should you.
Boycott Putin, Trump, and Musk!

--iPMP6GnbWrzjWSL6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCaInj/AAKCRAw5/Bqldv6
8oRnAKCosQeJY05UzmXuZmYoEXT7oNt3rQCgrbL4W/e9+BfJ1Biwzw59HrP2bJY=
=c/nD
-----END PGP SIGNATURE-----

--iPMP6GnbWrzjWSL6--

