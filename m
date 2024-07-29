Return-Path: <linux-arm-msm+bounces-27239-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CC5D193F368
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jul 2024 12:58:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EBF2D1F220F4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jul 2024 10:58:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8645E13EFEE;
	Mon, 29 Jul 2024 10:58:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="OAHR5mQZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94B36145A08
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jul 2024 10:58:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722250691; cv=none; b=L1hFeN+pAliotB+2afL5FqQu9c1iHHP39sA2SsU8GDdvOZFDef4zeaRM4ge+kKhGp7C/+ogVT0iyDKTL7hPkbPY/yqtBfqj388CvjX+DjpSnlmcXDyayzf4wWKevt5af5UZwNsu+yip9NUpgtcj88JQNGxkhbfLICKcqx7WZYGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722250691; c=relaxed/simple;
	bh=rsai1WDbNUNphHRoS7Z+hKpaBA4Iq2R/l/XTuQ/R0bE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=APAx1GH4MR3drrv2jvZmTU4P73XqWG69Ekrp0BHf1pXhDB4GXHHUdJhlStM8xA3JYjONjwV5F+o4IpxlbiuhjUHJkK1t1InaPEaxPkodzBXBG8Ol979o++ANvqL+V2uL1gT9jjLY8+LIw1ZOr+aNMTKOfv7r4+Dzn/omfdgw51I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=OAHR5mQZ; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=NlU1
	KeWDVQKzAh1jEb0mrC7e+c0mfZHxd5Tmaj7++js=; b=OAHR5mQZvS3aO0VDTwQn
	F3kbpavwrGnfdwaGPNUgSALJ5SPCQDN0MIMfHrlkibXWzReQhduf9mX3nKTQ0WLD
	Hy5lEeFQVL8pmkX7EsnVwAyJ0Yxa5jC7JPxkDVNGsZGpfqi5hoczOXlR1UyQzaCj
	N5oFilFDF/4ItOq/gL1e6yApU575L9al+q4ROC0/TE0RmZXxlxXuxPBUf9K8tHCX
	LmW/YjG5xmxFNduUhceUq3IoZrBxreJH9JrG+HDbx1NOzhG7Sx7vceb6HKcjbg8Z
	oHtdQEioHVklKdLPTYerBZeHFr8mCnFlwfF6D5dnsgoe99lO56JiT+U7q0JpkS3y
	5g==
Received: (qmail 4076308 invoked from network); 29 Jul 2024 12:58:05 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 29 Jul 2024 12:58:05 +0200
X-UD-Smtp-Session: l3s3148p1@NohHvGAesLogAwDPXxLGAIH3oZkcU6AS
Date: Mon, 29 Jul 2024 12:58:04 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Bjorn Andersson <quic_bjorande@quicinc.com>
Cc: alsa-devel@alsa-project.org, Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH 0/3] slimbus: use 'time_left' instead of 'timeout' with
 wait_for_*() functions
Message-ID: <Zqd1vHoEnxxolkn0@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Bjorn Andersson <quic_bjorande@quicinc.com>,
	alsa-devel@alsa-project.org, Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
References: <20240430120102.29459-1-wsa+renesas@sang-engineering.com>
 <ZjDyWFlx2cjfi1MJ@hu-bjorande-lv.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="+cknL3Al0OGm9pyy"
Content-Disposition: inline
In-Reply-To: <ZjDyWFlx2cjfi1MJ@hu-bjorande-lv.qualcomm.com>


--+cknL3Al0OGm9pyy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 30, 2024 at 06:30:00AM -0700, Bjorn Andersson wrote:
> On Tue, Apr 30, 2024 at 02:00:58PM +0200, Wolfram Sang wrote:
> > There is a confusing pattern in the kernel to use a variable named 'tim=
eout' to
> > store the result of wait_for_*() functions causing patterns like:
> >=20
> >         timeout =3D wait_for_completion_timeout(...)
> >         if (!timeout) return -ETIMEDOUT;
> >=20
> > with all kinds of permutations. Use 'time_left' as a variable to make t=
he code
> > obvious and self explaining.
> >=20
> > This is part of a tree-wide series. The rest of the patches can be foun=
d here
> > (some parts may still be WIP):
> >=20
> > git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git i2c/time_le=
ft
> >=20
> > Because these patches are generated, I audit them before sending. This =
is why I
> > will send series step by step. Build bot is happy with these patches, t=
hough.
> > No functional changes intended.
> >=20
>=20
> Reviewed-by: Bjorn Andersson <quic_bjorande@quicinc.com>

Thanks, Bjorn. Is Srinivas still pick slimbus patches?


--+cknL3Al0OGm9pyy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmandbgACgkQFA3kzBSg
KbaskRAAgHnV1i8eFtbuTKyO0gMzd1CCUEa3gnpaT196gJstpASz+YeK7r4j1o/j
HtEofmbsK8gF/4+hxEoZowAnM50t5vnjcQz5wAu7DyV2p6MLyvYV7iIU+Wai89k2
B9+Og/36PGDXvUWbrPJdX8GRBR92TZGlmalCi+wHc0rn8IPvuQ4a3ACuoQJ2G8K+
ryWxCq8NmzEsXPljzXnC/iz2whGlIY+ahNj5sgR74CZHH0xAGmGXcF/+Qs7Ha3bs
9Y00p7HpsSIvW8qoLfUug69pV6EeahETAsx5E+Ja1gXPZuJSedfyz4wieOKJOmk6
iZRrXIKmRuKAT9xfwWbrEuKGKaseRr6Y9+VFV879qejZi0rp+R2UE0g3tEco0IvO
KulP559zDKlmPzB7s7irX6I9o9gviqShjlue//QmOG6URUWTjV3zrx52RGmAEd45
L+CGQGClrEXgusOX6+fsUOnaUnomKLu9P53LsKT5ybNGht2YDJ4AhW0M0KgGr3j6
wLKZGckva40xuFDTHHZe6JfMzSq7zfJyJXZiDArx0Vo7Yc0mnSPcCODXFhT3zzJ1
HuziH0w+f2i/PD5wFU+Gulpm1rBz79lwJ83ovT+pxg3Kk4kiugb1O5rPTybfg6/g
EuBHOIl59f1J/B+OEWtfy/9qe8vfTQbPqfuzpYeV3ywpXRCSP7M=
=mgwZ
-----END PGP SIGNATURE-----

--+cknL3Al0OGm9pyy--

