Return-Path: <linux-arm-msm+bounces-84315-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B596CA2DE7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Dec 2025 09:56:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4F415301F5D7
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Dec 2025 08:56:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 178C932D0FA;
	Thu,  4 Dec 2025 08:56:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ucw.cz header.i=@ucw.cz header.b="l4dJLGqe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from jabberwock.ucw.cz (jabberwock.ucw.cz [46.255.230.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05BA724E016;
	Thu,  4 Dec 2025 08:56:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.255.230.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764838599; cv=none; b=RVY4dhooNwCaCdvgVkbYLebltn9AXHwSNITkE81bDYWV0LJyQaBsIHT9eiX3CQ76v53F07wu7xKOQcqfeS536U5mGoS64iTrx6cCL3Xf0K6ArcowA6Eof89N/dbuph1JcrJwsWTHf3AA/MHl27OXFJrensNwiIGFdqdF3Gk4IGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764838599; c=relaxed/simple;
	bh=DgZWwxAUCiBmOVHeu0gq3ZhNgl4qcyzL6O73ZXRzgp0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I9rw9KEHfRlFw2LzO1so12rKtnE2J792NPE/9Dhs8OGAa2BYmkqSAWC3yKrtUkaGoihzNfHgylFB4mRK45FtELyWAXBht+NUL8kdP/t+LgoVQBinIwlm9qlcSAvvXnh8ndRIaE597SJXPFoxT0uX42LqhfXejSbm2jdjjmd9lS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ucw.cz; spf=pass smtp.mailfrom=ucw.cz; dkim=pass (1024-bit key) header.d=ucw.cz header.i=@ucw.cz header.b=l4dJLGqe; arc=none smtp.client-ip=46.255.230.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ucw.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ucw.cz
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
	id 7D9951C008F; Thu,  4 Dec 2025 09:56:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ucw.cz; s=gen1;
	t=1764838587;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=26bk+ycplVp5LUSnVG48+oY8VZXtWCqKTWBmWw/vb+8=;
	b=l4dJLGqeL/yZw3f/Oqph8UsOFGNumvKsCKSsfBvYtbjcDjLXo9otMNmiN6mrzIOFHZgmpN
	zfK6dMmAyzu/5WjI1lsYuGM8mOlmUUq4sUIau4OfDzaT259/y5lTz5ILu/wfZZ2569IKxU
	WCPkhnttIMLph3OglT2glLO8PVF+bDQ=
Date: Thu, 4 Dec 2025 09:56:27 +0100
From: Pavel Machek <pavel@ucw.cz>
To: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
	trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
	Tengfei Fan <tengfei.fan@oss.qualcomm.com>,
	Qiang Yu <qiang.yu@oss.qualcomm.com>,
	Manish Pandey <manish.pandey@oss.qualcomm.com>,
	Ronak Raheja <ronak.raheja@oss.qualcomm.com>,
	Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
	Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
	Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>,
	Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>,
	Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
	Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Subject: Re: [PATCH 00/20] arm64: dts: qcom: Introduce Kaanapali platform
 device tree
Message-ID: <aTFMu1BZCPkXMGQe@duo.ucw.cz>
References: <20250924-knp-dts-v1-0-3fdbc4b9e1b1@oss.qualcomm.com>
 <aS8uJCnb0xOd6uby@duo.ucw.cz>
 <3a6fc312-ceb0-4258-981e-e6017c1c9b20@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="NX1KGVtPINGNUrtw"
Content-Disposition: inline
In-Reply-To: <3a6fc312-ceb0-4258-981e-e6017c1c9b20@oss.qualcomm.com>


--NX1KGVtPINGNUrtw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu 2025-12-04 10:41:53, Jingyi Wang wrote:
>=20
>=20
> On 12/3/2025 2:21 AM, Pavel Machek wrote:
> > Hi!
> >=20
> >> Introduce the Device Tree for the recently announced Snapdragon SoC fr=
om Qualcomm:
> >> https://www.qualcomm.com/products/mobile/snapdragon/smartphones/snapdr=
agon-8-series-mobile-platforms/snapdragon-8-elite-gen-5
> >>
> >> Bindings and base Device Tree for the Kaanapali SoC, MTP (Mobile Test =
Platform)
> >> and QRD (Qualcommm Reference Device) are splited in three:
> >>
> >> - 1-3: MTP board boot-to-shell with basic function.
> >> - 4-16: More feature including PCIE, sdcard, usb, DSPs, PMIC related, =
tsense, bus, crypto etc. Add QRD board support.
> >> - 17-20: Multimedia features including audio, video and camss.
> >=20
> > Thanks for doing this. I assume there devices available with this are
> > quite expensive/hard to get at this point?
> >=20
> > Please cc phone-devel@vger.kernel.org with phone related patches.
>=20
> The cc list is generated by tools following the list in MAINTAINERS, you =
can get
> this series from devicetree@vger.kernel.org or linux-arm-msm@vger.kernel.=
org

Well, tools are not smart enough to generate good Cc list in this
case, so please do the cc manually. (I don't think they can be
improved easily, as it is not clear when code is phone-related from
the filename).

Best regards,
								Pavel
--=20
I don't work for Nazis and criminals, and neither should you.
Boycott Putin, Trump, Netanyahu and Musk!

--NX1KGVtPINGNUrtw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCaTFMuwAKCRAw5/Bqldv6
8vycAKCCFPB3LSElKbcwgDq7zWBwZYE8hgCgq9OD8uVX9su5xhe+xfd6NiwcVRk=
=J2Mx
-----END PGP SIGNATURE-----

--NX1KGVtPINGNUrtw--

