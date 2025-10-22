Return-Path: <linux-arm-msm+bounces-78360-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DCDFCBFCD85
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Oct 2025 17:23:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C30DA189C5D3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Oct 2025 15:24:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5FC122BE03C;
	Wed, 22 Oct 2025 15:23:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ucw.cz header.i=@ucw.cz header.b="Z6C7Wgut"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from jabberwock.ucw.cz (jabberwock.ucw.cz [46.255.230.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1BA3347FEC;
	Wed, 22 Oct 2025 15:23:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.255.230.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761146613; cv=none; b=djb9fQZ2sOLMdV6+njk92ojnQ/uEJNlzN+PUNVZds1ZuFds4xpv7mX86uB0bbcAX+YBf8ESD2i0e9zUxRCF01tRjRgQx3ZkumRp0geXH3/I1MsNHZ/MEWUqxmqrHvqPuI3/sn012XDs0qhtuHofeGFcpG9ys1XAS1eiUwIN6jhw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761146613; c=relaxed/simple;
	bh=ANQm8fWq/p+Z/WnKkV5WnEXtHhhWdDQapOL77j2cw5Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T9/foiJzxUgWUIDaRlBgHuNZkf8mNsV4jGQg3vVAlacbBwMTjQQR9ec+y75AYgk7WOxDP/mGUz9VdwVyvRbpeFNmd4eg6rg5pUN5rkUAICd+77rHHKtNcG7ipmzMbtAyeJc48Jv1SH9sT9M477mSmKH5t40cF+9eZ7FP/jl7a9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ucw.cz; spf=pass smtp.mailfrom=ucw.cz; dkim=pass (1024-bit key) header.d=ucw.cz header.i=@ucw.cz header.b=Z6C7Wgut; arc=none smtp.client-ip=46.255.230.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ucw.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ucw.cz
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
	id 14A4E1C007C; Wed, 22 Oct 2025 17:23:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ucw.cz; s=gen1;
	t=1761146605;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=sTPnzWhHyeueBFfOlDmvPtS5n8v0m//b2f9NJlRltOM=;
	b=Z6C7WgutqaVI5CazTrkU1H4soTywmUzKbH/1YU8Llowuof/Dy6EkNVUtJxUerpqseT0tBd
	To6E0zXObsGF5g2EH0uOcjVYBw2blp3K8t66SHco9Z7br1C1IogtRdiMZ3pc7n/OZM0fVd
	DNEIxyMC46Yav/rUXpc7vQNjUwLhGHk=
Date: Wed, 22 Oct 2025 17:23:24 +0200
From: Pavel Machek <pavel@ucw.cz>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Casey Connolly <casey.connolly@linaro.org>,
	Alexander Martinz <amartinz@shiftphones.com>,
	~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/6] arm64: dts: qcom: qcm6490-shift-otter: Enable flash
 LED
Message-ID: <aPj27KKCVN9Tn9qi@duo.ucw.cz>
References: <20250930-otter-further-bringup-v1-0-7fe66f653900@fairphone.com>
 <20250930-otter-further-bringup-v1-4-7fe66f653900@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Fhbu73dSOXUJXCHg"
Content-Disposition: inline
In-Reply-To: <20250930-otter-further-bringup-v1-4-7fe66f653900@fairphone.com>


--Fhbu73dSOXUJXCHg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue 2025-09-30 16:32:22, Luca Weiss wrote:
> From: Casey Connolly <casey.connolly@linaro.org>
>=20
> Describe the flash LED on this phone.
>=20
> Signed-off-by: Casey Connolly <casey.connolly@linaro.org>
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>

Reviewed-by: Pavel Machek <pavel@ucw.cz>

>  };
> =20
> +&pm8350c_flash {
> +	status =3D "okay";
> +
> +	led-0 {
> +		function =3D LED_FUNCTION_FLASH;
> +		color =3D <LED_COLOR_ID_WHITE>;
> +		led-sources =3D <1>, <2>;
> +		led-max-microamp =3D <500000>;
> +		flash-max-microamp =3D <1500000>;
> +		flash-max-timeout-us =3D <1280000>;
> +	};
> +};
> +
>  &pmk8350_adc_tm {
>  	status =3D "okay";
> =20
>=20

--=20
I don't work for Nazis and criminals, and neither should you.
Boycott Putin, Trump, Netanyahu and Musk!

--Fhbu73dSOXUJXCHg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCaPj27AAKCRAw5/Bqldv6
8kmFAJ4rJ8Tx4NMizkzVOiSWmcIENrA1CQCgsmG9w0ObK7yegGZ+HvSxbkhoevE=
=HJ8o
-----END PGP SIGNATURE-----

--Fhbu73dSOXUJXCHg--

