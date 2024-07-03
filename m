Return-Path: <linux-arm-msm+bounces-25209-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B551926A2B
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Jul 2024 23:23:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 16D9E284528
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Jul 2024 21:23:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01B8F19309C;
	Wed,  3 Jul 2024 21:23:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="nXfomUYn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89EEF2BB13
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Jul 2024 21:23:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720041809; cv=none; b=sotEXzayF9jYYXr3RzuxRX6vMMGTKPMkCjvlfT+CQ5MK73+wNHSj32upWAh92fr3miuFkfe/vZJ5LiAWI3ijO9SVYkokBaHAjRg5IvDpZTibfMK7unwBc5Jq1FHLgxiOMqRjwsoePbEY9JTVx8TLSYjz/E/MqZa06cUXC2rpDK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720041809; c=relaxed/simple;
	bh=1yCUJShNVEleKhhq5ttC7d+C2KlI7KvONMEvrwhI5X0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ocnN2ApkiVTKpgDQTxmQmyMt9TxqUb+YbcZOVenELhpZ+Ep1G0nVP7osHf3dIfPEnCMha+/f/NYwaF9ad1NhBMwHu6pMlkAOUZsikLGjOkd5Vyg9LaWCRaD14MeP60jAuo32rAwSGcacsOEpKE4Ny0fhzcreXh1uf1MB7Z9kNik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=nXfomUYn; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-a728f74c23dso668623066b.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Jul 2024 14:23:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1720041805; x=1720646605; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rmKjZalCS3qgqBNUJ2X1ny0z1S/+Ouz6++2zspqi0Zc=;
        b=nXfomUYnbzj9LIVMPNRYyGPrGSgzQo3TYNnoG9X6sbtMdvka2gkBTWeWFH82v3YY6y
         FpKutlnlUYALdpJAw5zXMSlyPvSu9EOBXKZO6nM48K2lmmuMVaihjB2V4N8NIAeLICoA
         8Uu26Fln/UY28RYLPeehl3Nqzi8hopZLB4IgW8EaEqF9COvqp8YTsl4SWDtCjS2PFUzL
         tygWBTwykzO88IpSKXeemkGeoic+DrezgiZcsHKtkACDRstfeu+ctDVlME2MjqdFZz+x
         j8jWMtVy55HHvUxAKVW7SN1SWTLn/M5rn5xatBJuTs1sdL2Mq/8rTtvNj3n3KPEq2RrC
         6LzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720041805; x=1720646605;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rmKjZalCS3qgqBNUJ2X1ny0z1S/+Ouz6++2zspqi0Zc=;
        b=MCQy/+GTePrjvJB3Dg4a13g6ZzvG25rVmfG+uBdHuIX0EJGhIdThbQf123UlC0yUPB
         MtHHdAsV/lessEMgnh1o2Vs/BdxnryBrhlGVRvu3/1v9VPW9C8Eqph7HpO2PzfOUHMzb
         kJjztoUhqV8WBSliEltDUFkIa2c//SBKYTbVqRYAJuXnFmpqgQKOz3yj2kR7rIPBJapq
         Ew0WuWHoewFmJGYp3Jozw/Gc+Id6KHiWiFodcsVuqLbnTut9cQFaVrmAhvYDB3qOSs7k
         qA8DLLUfjn9REWhFrNH1fzKhsdLU0YPBhv4po92om58lpxIFbTb38yvYuSDUUSPp4WTG
         mGvA==
X-Forwarded-Encrypted: i=1; AJvYcCWC0rEfsT4dVgYQ/YY99z8rPuUUxvO8pw4RrJv22mEaSUfDIPNSSXwZ4Nb2I50UKKGzQklR7Xqyt7WCH17fUeB+7K9HOtS4itoQnIrM9g==
X-Gm-Message-State: AOJu0YzXUYoEueWBTVWamat1LozDjpaw1QwyMnCuwsEJQsWhhNiHiYcI
	02KLMZRFNLTIOg+ebJJQwn9XMa00hxgWcHbBc4RS4phGRvgjLYKwmlC62D5oAhg=
X-Google-Smtp-Source: AGHT+IEiDeirJZbiRR9WOgvKVRp5lPoOHJBTmQD67pQvhrzI/8nB0fQNgTn38F10sD2qUfAawYddVg==
X-Received: by 2002:a17:907:1c15:b0:a72:883f:f3dd with SMTP id a640c23a62f3a-a75144a8a02mr1042146966b.56.1720041804879;
        Wed, 03 Jul 2024 14:23:24 -0700 (PDT)
Received: from localhost ([2a02:8071:b783:6940:5696:f293:6e5e:98bf])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a72ab0651c0sm541105666b.123.2024.07.03.14.23.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jul 2024 14:23:24 -0700 (PDT)
Date: Wed, 3 Jul 2024 23:23:22 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Rob Herring <robh@kernel.org>, 
	Saravana Kannan <saravanak@google.com>, Nathan Chancellor <nathan@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Tony Lindgren <tony@atomide.com>, Bjorn Andersson <andersson@kernel.org>, 
	Emilio =?utf-8?B?TMOzcGV6?= <emilio@elopez.com.ar>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Jonathan Cameron <jic23@kernel.org>, Lee Jones <lee@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Richard Leitner <richard.leitner@linux.dev>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, 
	Damien Le Moal <dlemoal@kernel.org>, "Peng Fan (OSS)" <peng.fan@oss.nxp.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	llvm@lists.linux.dev, linux-clk@vger.kernel.org, linux-omap@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-samsung-soc@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-iio@vger.kernel.org, linux-pwm@vger.kernel.org, linux-serial@vger.kernel.org, 
	linux-usb@vger.kernel.org, patches@opensource.cirrus.com, linux-sound@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH 13/20] pwm: samsung: convert to
 of_property_for_each_u32_new()
Message-ID: <l2xret6kx4qwee3c3abmmhz5uop7zuobxath2eou2utklztkgl@c7lskt3xk3wj>
References: <20240703-of_property_for_each_u32-v1-0-42c1fc0b82aa@bootlin.com>
 <20240703-of_property_for_each_u32-v1-13-42c1fc0b82aa@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="3uu6b6ybcnfri4lk"
Content-Disposition: inline
In-Reply-To: <20240703-of_property_for_each_u32-v1-13-42c1fc0b82aa@bootlin.com>


--3uu6b6ybcnfri4lk
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On Wed, Jul 03, 2024 at 12:36:57PM +0200, Luca Ceresoli wrote:
> Simplify code using of_property_for_each_u32_new() as the two additional
> parameters in of_property_for_each_u32() are not used here.
>=20
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> ---
>  drivers/pwm/pwm-samsung.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>=20
> diff --git a/drivers/pwm/pwm-samsung.c b/drivers/pwm/pwm-samsung.c
> index efb60c9f0cb3..fef02a0b023e 100644
> --- a/drivers/pwm/pwm-samsung.c
> +++ b/drivers/pwm/pwm-samsung.c
> @@ -510,8 +510,6 @@ static int pwm_samsung_parse_dt(struct pwm_chip *chip)
>  	struct samsung_pwm_chip *our_chip =3D to_samsung_pwm_chip(chip);
>  	struct device_node *np =3D pwmchip_parent(chip)->of_node;
>  	const struct of_device_id *match;
> -	struct property *prop;
> -	const __be32 *cur;
>  	u32 val;
> =20
>  	match =3D of_match_node(samsung_pwm_matches, np);
> @@ -520,7 +518,7 @@ static int pwm_samsung_parse_dt(struct pwm_chip *chip)
> =20
>  	memcpy(&our_chip->variant, match->data, sizeof(our_chip->variant));
> =20
> -	of_property_for_each_u32(np, "samsung,pwm-outputs", prop, cur, val) {
> +	of_property_for_each_u32_new(np, "samsung,pwm-outputs", val) {
>  		if (val >=3D SAMSUNG_PWM_NUM) {
>  			dev_err(pwmchip_parent(chip),
>  				"%s: invalid channel index in samsung,pwm-outputs property\n",
>=20

Acked-by: Uwe Kleine-K=F6nig <u.kleine-koenig@baylibre.com>

Feel free to merge this together with the change from the first patch.

Best regards
Uwe

--3uu6b6ybcnfri4lk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmaFwUcACgkQj4D7WH0S
/k6PuggAu8WCVFGH6QIMKU3X2rf+i2w61Hm9yGoz/E1JXjYYwhvN07D9QQrg3lFk
uuvOlwgkdfuIHAsZupm4B503z6Cr+9e1c0yd2UsXZkR+Y5e5uAcWpFrqQPpsUjg6
K4y5iO46KFiNdoyIw5vaEqa9r+2MGaV/6utEBzK71uNVzWWnYAxGJSrp9BXXUlRN
ZUz4u7b3Yp+kmsIoFWF2SYjPB08bXS+XlNegSLFuhFLAklD1WtMgdfiyFyqVm20f
wxAtUX4pOe9E7HV+9qcyWKkbxhOVOOD6iG1CnatgtZoAeRfvmcNx+o2M4x8H0qXK
hetCnR7IsLL80SX5lvKiYYw2At4OEA==
=UQNH
-----END PGP SIGNATURE-----

--3uu6b6ybcnfri4lk--

