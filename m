Return-Path: <linux-arm-msm+bounces-84124-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 61429C9CFB1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 02 Dec 2025 21:56:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 07B07348DBC
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Dec 2025 20:56:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE40D2F7467;
	Tue,  2 Dec 2025 20:56:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ucw.cz header.i=@ucw.cz header.b="cQrNnTZJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from jabberwock.ucw.cz (jabberwock.ucw.cz [46.255.230.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13AC82D595A;
	Tue,  2 Dec 2025 20:56:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.255.230.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764708991; cv=none; b=QMHdEOPOMUkTmTQt4NIqcEb9Cj9KS5fpFg4lHDJzNIKPAvCC2Uo27iF7CSHjxcDzRmj+xZeUnLGrhaQ36LSkUQ7K76Cqj4POHQwuaTcrT9ZyQLp84ZcBUio74lZjVI8mVHyFUmR4Qt7QAoAGutrjYPEtbwN8LZG+Uvc3qyJTuVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764708991; c=relaxed/simple;
	bh=jVBh3iFdS+OEAniEfB80fGWvYAlSlH3SkbmCFSCHIPU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CCewVVz1kHB8QbuPJt7jsF8UqbZPU6mS57cediewpJZbH6+hydb8bZQzctv11NIJdhC0X/ymLTSODrtuwNED8YkCbpn9aLErF2Gj4csO5uTGAAbMmydjrtvoyBRuTVuWbK4o8E3RvG+1FHgQ4RATdQE4RvfPjF001adR1a+6O2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ucw.cz; spf=pass smtp.mailfrom=ucw.cz; dkim=pass (1024-bit key) header.d=ucw.cz header.i=@ucw.cz header.b=cQrNnTZJ; arc=none smtp.client-ip=46.255.230.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ucw.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ucw.cz
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
	id A468B1C00AB; Tue,  2 Dec 2025 21:56:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ucw.cz; s=gen1;
	t=1764708985;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=08kL+JLm3v9VCRz/hSAZLiHIm/OlsbpTV8czMvuunoY=;
	b=cQrNnTZJRWVkkp102LmdT2ToY3X95F+eG4iI278WK5yQTvmVIfoMS7un056vhi6w3HpW1+
	cCKSD1Oa/SBQ4zuK4cIspOEyAcsWVyxxJP3t9pZ+WvxzR8NK1ZLSvtpjdGtQWcqqgpjPwN
	lx7XHx63HA/9FADKY3S531H+m7NSuhw=
Date: Tue, 2 Dec 2025 21:56:25 +0100
From: Pavel Machek <pavel@ucw.cz>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
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
Message-ID: <aS9SeXazCemfDQP+@duo.ucw.cz>
References: <20250924-knp-dts-v1-0-3fdbc4b9e1b1@oss.qualcomm.com>
 <aS8uJCnb0xOd6uby@duo.ucw.cz>
 <9dabc745-1464-48f2-8687-2b849a7fca95@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="lhFs4tQMj293JqyH"
Content-Disposition: inline
In-Reply-To: <9dabc745-1464-48f2-8687-2b849a7fca95@oss.qualcomm.com>


--lhFs4tQMj293JqyH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue 2025-12-02 19:33:03, Konrad Dybcio wrote:
> On 12/2/25 7:21 PM, Pavel Machek wrote:
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
>=20
> A number of them seem available at most shops now, but they just came out
> recently and they're all flagship phones so understandably it'll probably
> take some time before enthusiasts poke at them

Aha, that's actually good news, I was assuming only dev boards are
available (MTP, QRD). So OnePlus 15, for example, would be suitable?
(But I'd assume OnePlus 15 would still need separate dts, perhaps
similar to MTP?).

https://www.kimovil.com/en/list-smartphones-by-processor-group/snapd-8-elit=
e-g5

Its still more than EUR1000, but better than I expected :-).

Thanks and best regards,
							Pavel
--=20
I don't work for Nazis and criminals, and neither should you.
Boycott Putin, Trump, Netanyahu and Musk!

--lhFs4tQMj293JqyH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCaS9SeQAKCRAw5/Bqldv6
8k99AJ9vedFiXsSmHT0ZGHeFE8Gasd0UywCdGFOwYm83+BfqsJumAD16svjPNUk=
=8Sh6
-----END PGP SIGNATURE-----

--lhFs4tQMj293JqyH--

