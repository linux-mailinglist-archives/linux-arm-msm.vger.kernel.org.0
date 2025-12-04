Return-Path: <linux-arm-msm+bounces-84351-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CD13CA377D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Dec 2025 12:42:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2C61A3017EEE
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Dec 2025 11:42:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CEC530276C;
	Thu,  4 Dec 2025 11:42:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ucw.cz header.i=@ucw.cz header.b="X/0viqQr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from jabberwock.ucw.cz (jabberwock.ucw.cz [46.255.230.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 114772FFF91;
	Thu,  4 Dec 2025 11:42:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.255.230.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764848543; cv=none; b=dZK636jqoYH7nHT3EdU8+rzYPPLvrvAreHyBG/AxQTPPEZbTszFUh83GWNugJQGwmH5OkNRo6/8YRh1RXZWjYls1xg/Dwqn2QfQ+u3Z1Bpcarp3SoLpj/hY+6BNSqgOX+cEno619ICnXIdEgNUMlvgSfdA6tTL+Tf/XLJhOcKIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764848543; c=relaxed/simple;
	bh=YLxhq3Ornz4GPRV1efCSo8oA3DVzUecy6VRXmQInR0g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OYgRHDml5imy6Q5dR6JYvvDsV2rGKhXjD21fuq/DJRFj/CPmMf78vQ5GFh1jE9N1f3jIdmaEnVRu9a1VnY0w7+doqXJ/jzUKb5eJ7/scVlj5v/AlX5T7SSrLDjycvIuGjIQv1SCIlw1pmrMNgFA9TfTXV1f8QQx7rnpQmErSSYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ucw.cz; spf=pass smtp.mailfrom=ucw.cz; dkim=pass (1024-bit key) header.d=ucw.cz header.i=@ucw.cz header.b=X/0viqQr; arc=none smtp.client-ip=46.255.230.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ucw.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ucw.cz
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
	id 42BCD1C008F; Thu,  4 Dec 2025 12:42:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ucw.cz; s=gen1;
	t=1764848539;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=WFl0aq1Ntcninkh8xMTxPOuQ73BjkRoI6fDAEmiulYs=;
	b=X/0viqQrQUpdTm8KWhwyJZ2SekAbVqOPR+ZAA/a3zccKd2+8kiCAg+Do9d++tgG2WCd0Er
	ywqItCyVI5nq52f+yJGIiOuJRv6igdUECKd0rS5zCAvVISQsbGAVdOVJsyah4XYVoAqpEy
	Yi90W7OhgSAcU7GSclf/otPF1s8vkmg=
Date: Thu, 4 Dec 2025 12:42:18 +0100
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
Message-ID: <aTFzmm3fyxC1MAzk@duo.ucw.cz>
References: <20250924-knp-dts-v1-0-3fdbc4b9e1b1@oss.qualcomm.com>
 <aS8uJCnb0xOd6uby@duo.ucw.cz>
 <081a2038-e798-4cc0-96ff-b7f11e346831@kernel.org>
 <aTB8++UtSrhwtqdY@duo.ucw.cz>
 <c1b24759-762f-4b97-8d3f-8a44a66b646b@kernel.org>
 <db113021-f5be-4559-8ea5-719f8d7ec3ee@kernel.org>
 <aTFP1w48bWgto7wr@duo.ucw.cz>
 <2fa188c3-f5c3-4145-9cae-3587f3bb23cc@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="AXmxnhmcNPqNcysL"
Content-Disposition: inline
In-Reply-To: <2fa188c3-f5c3-4145-9cae-3587f3bb23cc@kernel.org>


--AXmxnhmcNPqNcysL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> >>>>>>> Introduce the Device Tree for the recently announced Snapdragon S=
oC from Qualcomm:
> >>>>>>> https://www.qualcomm.com/products/mobile/snapdragon/smartphones/s=
napdragon-8-series-mobile-platforms/snapdragon-8-elite-gen-5

> >>>>>>> Bindings and base Device Tree for the Kaanapali SoC, MTP (Mobile =
Test Platform)
> >>>>>>> and QRD (Qualcommm Reference Device) are splited in three:

> >> ... and btw, I know what MTP and QRD is and MTP IS NOT A PHONE. I work
> >> on this, I upstream this and it is not a phone, regardless how you call
> >> it. Just because we call our evalkit like that, does not make it a
> > phone.
> >=20
> > So what is it?
>=20
> evalkit for SoC. Just like every other NXP evalkit board is.

=2E..products/mobile/snapdragon/smartphones/snapdragon-8-series-mobile-plat=
forms...
=2E..Mobile Test Platform...

Clearly not phone related.

> >>> new-hardware-devel or whatever. No. People should use tools, not guess
> >>> the cc lists. Fix the tools if you miss any Cc.

Where did you get that "people should completely rely on tools" thing from?

"You should always copy the appropriate subsystem maintainer(s) on any patch
to code that they maintain; look through the MAINTAINERS file and the
source code revision history to see who those maintainers are.  The
script scripts/get_maintainer.pl can be very useful at this step (pass path=
s to
your patches as arguments to scripts/get_maintainer.pl).  If you cannot fin=
d a
maintainer for the subsystem you are working on, Andrew Morton
(akpm@linux-foundation.org) serves as a maintainer of last resort.

You should also normally choose at least one mailing list to receive a copy
of your patch set.  linux-kernel@vger.kernel.org should be used by default
for all patches, but the volume on that list has caused a number of
developers to tune it out.  Look in the MAINTAINERS file for a
subsystem-specific list; your patch will probably get more attention there.
Please do not spam unrelated lists, though.

Many kernel-related lists are hosted on vger.kernel.org; you can find a
list of them at http://vger.kernel.org/vger-lists.html.  There are
kernel-related lists hosted elsewhere as well, though."

									Pavel
--=20
I don't work for Nazis and criminals, and neither should you.
Boycott Putin, Trump, Netanyahu and Musk!

--AXmxnhmcNPqNcysL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCaTFzmgAKCRAw5/Bqldv6
8tGUAJwM6TDiei3TC8+zA906L2Hd9UrgygCfS0cO21SYCI2gbKI3a/S9RpkK8Ks=
=9ssq
-----END PGP SIGNATURE-----

--AXmxnhmcNPqNcysL--

