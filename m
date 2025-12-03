Return-Path: <linux-arm-msm+bounces-84259-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 06E15CA1278
	for <lists+linux-arm-msm@lfdr.de>; Wed, 03 Dec 2025 19:50:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7229530FF00B
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Dec 2025 18:10:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D94430B520;
	Wed,  3 Dec 2025 18:10:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ucw.cz header.i=@ucw.cz header.b="jEM+kmjZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from jabberwock.ucw.cz (jabberwock.ucw.cz [46.255.230.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34E0DEACD;
	Wed,  3 Dec 2025 18:10:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.255.230.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764785409; cv=none; b=hLewZRH79/u2Ca5lrAkgpOaVCyBY/pTKsDHVVqrh43iYkKNCdPA2Q+0/CvjH6AhlYtey8JuR2pCVoo3pS7Bg9EylC96gsdLiwdLQwjVQrjKds6zRJ5HJ+0uwsWlDv4gZaQGBbpxOIpGd2JZpD30E5RYFSAB7PfA9aBpG6piCjaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764785409; c=relaxed/simple;
	bh=vgv5xORL3p4GT1gXvTzzfTTjN2daLtNW/vnk70muwrs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LpfPGahlm85aKSY08GhsXR7I81bNoJL+GfHlL6+BqO/e0fyxPaFUZA9Q6DpNDkJOeCvMJclNTPT/NLXMKpYIJLrFdDZolGBmFaN1/41dC7PHME02pBG55i+6FvDCMa3WHBGesWBDzujg8quOJhvzkkDEbNhRnO/E8f+EhyJJzpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ucw.cz; spf=pass smtp.mailfrom=ucw.cz; dkim=pass (1024-bit key) header.d=ucw.cz header.i=@ucw.cz header.b=jEM+kmjZ; arc=none smtp.client-ip=46.255.230.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ucw.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ucw.cz
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
	id 0857C1C008F; Wed,  3 Dec 2025 19:10:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ucw.cz; s=gen1;
	t=1764785404;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=3sdTIGdSoayx9dZnp52z/h/u54VkPko1AY65aYWoYdk=;
	b=jEM+kmjZzT9PM5UqOPaz/v1ieK1zXtJ6orv797Vgrjso0attg8FzJtB1xi7FZgB2efwtCm
	3JojK0wfeFE/02I06FazoHc3Re7NjxATRjfaNaU/YkQz7Ns0UYo4V37rXG/JXdkHDCZlzP
	YMpVGFVWKMprwBq6LvnwpA0hMlbOwsM=
Date: Wed, 3 Dec 2025 19:10:03 +0100
From: Pavel Machek <pavel@ucw.cz>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
	Bjorn Andersson <andersson@kernel.org>,
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
Message-ID: <aTB8++UtSrhwtqdY@duo.ucw.cz>
References: <20250924-knp-dts-v1-0-3fdbc4b9e1b1@oss.qualcomm.com>
 <aS8uJCnb0xOd6uby@duo.ucw.cz>
 <081a2038-e798-4cc0-96ff-b7f11e346831@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Ic9XkOl4csXwnGrR"
Content-Disposition: inline
In-Reply-To: <081a2038-e798-4cc0-96ff-b7f11e346831@kernel.org>


--Ic9XkOl4csXwnGrR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed 2025-12-03 18:31:11, Krzysztof Kozlowski wrote:
> On 02/12/2025 19:21, Pavel Machek wrote:
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
> That's not even a phone, anyway contributors should not cc lists which
> are not relevant to the posting and not pointed out by maintainers. You

People should Cc relevant lists, and yes, if it is called "Mobile Test
Platform", it is relevant to phone development.

								Pavel
--=20
I don't work for Nazis and criminals, and neither should you.
Boycott Putin, Trump, Netanyahu and Musk!

--Ic9XkOl4csXwnGrR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCaTB8+wAKCRAw5/Bqldv6
8pGoAJ4vwaWKRFCUjrjQkeIc4JPjOPjcgQCfbix0XbejMS7k0FwcfOPuWnmy6NY=
=1WIj
-----END PGP SIGNATURE-----

--Ic9XkOl4csXwnGrR--

