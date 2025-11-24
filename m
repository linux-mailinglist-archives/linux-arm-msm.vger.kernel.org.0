Return-Path: <linux-arm-msm+bounces-83113-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 853B8C81D75
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Nov 2025 18:14:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DF86D3A226B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Nov 2025 17:14:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D15F1314B60;
	Mon, 24 Nov 2025 17:14:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ucw.cz header.i=@ucw.cz header.b="QlDRCX7O"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from jabberwock.ucw.cz (jabberwock.ucw.cz [46.255.230.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BA302C11F6;
	Mon, 24 Nov 2025 17:13:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.255.230.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764004441; cv=none; b=rpzgtHpubwwkR3v4w6Pni3BshZ+ebU59nPrP2r27K7hROo8UMU2rw/C45x1BJirNzlqvISCEUKROpjpbb2TOQcoC+9VT+0B2+R66Ep+RPXd5Gx6lz7Lf8GR1MGGwPgbWr41MqhKhDdiDJzstIDFZ+TaU2BeGLVKHhyKwcsB6U0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764004441; c=relaxed/simple;
	bh=GC0l7TTs/UYHAXBhUCQ4Uc+Q9lq5Vk5HXRFcAAWkfPs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hwtZMPjJ83KU8fduRM0MGp+gQ4iASpiU616ddfH7GH5IL+KEZX6COuo+EDnbL7ks12pAbxoHsWmUdYd8DrcFoMwWxiFZVj8DMEXQUX3neNPjj5pSnnLHpoUZ07VUMakLDP8GbeTKuNU3kUHc1LeP190RQdDoAij+0eOykyyA4WQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ucw.cz; spf=pass smtp.mailfrom=ucw.cz; dkim=pass (1024-bit key) header.d=ucw.cz header.i=@ucw.cz header.b=QlDRCX7O; arc=none smtp.client-ip=46.255.230.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ucw.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ucw.cz
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
	id 06C0D1C00AB; Mon, 24 Nov 2025 18:13:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ucw.cz; s=gen1;
	t=1764004434;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=LdiTuAPMsdSklIdlRlLQFxKoYVhC4YIkUoorfpWkpSo=;
	b=QlDRCX7OPONlUDTkKv1GHVunDHwbB4oIxye2FqDf9keAfama0I9Rxo6S/fLMbmvmRcA+ih
	rzdQtu27R/MYcLvHla1y0G2l71UK/8N4sYMwRJjgODoBfeYxMJESlr8qJZsIBgbo6bRb/g
	rYG7zFWj44Y0OBaUyaqWmqDdQM+2K9g=
Date: Mon, 24 Nov 2025 18:13:53 +0100
From: Pavel Machek <pavel@ucw.cz>
To: Alexandre Messier <alex@me.ssier.org>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Luca Weiss <luca@lucaweiss.eu>,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] ARM: dts: qcom: msm8974pro-htc-m8: add status LEDs
Message-ID: <aSSSUahMBR8Wujni@duo.ucw.cz>
References: <20251007-m8-dts-additions-v1-0-53d7ab3594e7@me.ssier.org>
 <20251007-m8-dts-additions-v1-1-53d7ab3594e7@me.ssier.org>
 <6c791f05-70e7-49c9-a3ce-50fb82b0c894@oss.qualcomm.com>
 <fef52764-3092-4375-b9c7-793d85adc102@me.ssier.org>
 <41c63020-9226-45d9-979d-429b7299da41@oss.qualcomm.com>
 <77efe2a2-ee81-4096-9145-a76e35954e84@me.ssier.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="xMMfKyXYP5va5Mht"
Content-Disposition: inline
In-Reply-To: <77efe2a2-ee81-4096-9145-a76e35954e84@me.ssier.org>


--xMMfKyXYP5va5Mht
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> >>> Do they form a single notification led, or are they supposed
> >>> to act separately?
> >>
> >> Good point, I had to check the phone user manual to confirm. Indeed, i=
t is
> >> referred to as a one logical notification LED. It also mentions the co=
lor can
> >> be either green or orange, it does not mention using the combined colo=
r of
> >> the two LEDs.
> >>
> >> So I would say they are supposed to act separately.
> >>
> >> Hope this answers your question, and let me know if more details are n=
eeded.
> >>
> >> BTW: I will be sending a V2 to update the color name, since the user
> >> manual says the color is orange, not amber.
> >=20
> > Let's describe it as a single LED then:
> >=20
> > multi-led {
> >         color =3D <LED_COLOR_ID_MULTI>; // notice it's not RGB
> >         function =3D LED_FUNCTION_STATUS;
> >=20
> >         #address-cells =3D <1>;
> >         #size-cells =3D <0>;
> >=20
> >         led@6 {
> >                 reg =3D <6>;
> >                 color =3D <LED_COLOR_ID_GREEN>;
> >         };
> >=20
> >         led@7 {
> >                 reg =3D <7>;
> >                 color =3D <LED_COLOR_ID_ORANGE>;
> >         };
> > };
>=20
> Using multi-led is fine for me.
>=20
> But currently, the "qcom-lpg" driver doesn't support LED_COLOR_ID_MULTI, =
only
> LED_COLOR_ID_RGB. Adding support for LED_COLOR_ID_MULTI is trivial, I tes=
ted it
> and it works.
>=20
> Or I can also use the "leds-group-multicolor" driver, using the two indiv=
idual
> LEDs. I also tested this method and it works.
>=20
> >=20
> > + Pavel the LED maintainer, please take a look if you think it makes se=
nse
>=20
> If Pavel agrees using multi-led makes sense, I think the first option is =
the
> best. I will separate the LED patch into a new series, along with the cha=
nge to
> the qcom-lpg driver to support LED_COLOR_ID_MULTI.

I see nothing horribly wrong here (and am late to the party). ID_MULTI
leds are pretty uncommon for phones, but if that's what you have...

Anyway:

LED SUBSYSTEM
M:      Lee Jones <lee@kernel.org>
M:      Pavel Machek <pavel@kernel.org>
L:      linux-leds@vger.kernel.org

Best regards,
								Pavel
--=20
I don't work for Nazis and criminals, and neither should you.
Boycott Putin, Trump, Netanyahu and Musk!

--xMMfKyXYP5va5Mht
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCaSSSUQAKCRAw5/Bqldv6
8jXhAJ9zJDH/Tv6cujn6IBoZoYOIrHdbWgCgvp78nRFqKpGFXPhA0d+xLRexqqw=
=iMor
-----END PGP SIGNATURE-----

--xMMfKyXYP5va5Mht--

