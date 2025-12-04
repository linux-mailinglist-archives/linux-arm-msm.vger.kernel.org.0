Return-Path: <linux-arm-msm+bounces-84324-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B497DCA2F23
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Dec 2025 10:20:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6A1A730D3F89
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Dec 2025 09:16:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9D34334C33;
	Thu,  4 Dec 2025 09:09:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ucw.cz header.i=@ucw.cz header.b="npPhcb+a"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from jabberwock.ucw.cz (jabberwock.ucw.cz [46.255.230.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60D2D326D48;
	Thu,  4 Dec 2025 09:09:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.255.230.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764839388; cv=none; b=Acs0bE5nCdW/5aAsux3mi9AWx+s/o7UCMvrpTYDBBSa+wnJMo0GGYmvlteDJd21lAv6mqoql3muzHTqJ4J6bgBA0TTd7yMOS/AAX1V0tyK13RvFyUI9Zg9iGacQa3iX0wH4yauB4wYyyPx/PzaeGDbbpW8eZU86ylZaRgIVSOpQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764839388; c=relaxed/simple;
	bh=KvrjI1Gdfo3YODYxJNIJpZqLchqT2iZZFJnoWpx9sDA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ahY3RJpbkpbzixWj5MojBP0Iamk672drr76vRyG+SV1QrihniQzzUAsScuFLBhnH4sfJbPsPfc4TMBG3qUOjz+ez4bsiyjvDzRp/ONUmqVnIvDXgkz2jchQv04dpicZIij2Ogxzi0uXQ4KbBTzbscgzDMWWrzgXSA9VzbZgI6I4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ucw.cz; spf=pass smtp.mailfrom=ucw.cz; dkim=pass (1024-bit key) header.d=ucw.cz header.i=@ucw.cz header.b=npPhcb+a; arc=none smtp.client-ip=46.255.230.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ucw.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ucw.cz
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
	id 552DE1C008F; Thu,  4 Dec 2025 10:09:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ucw.cz; s=gen1;
	t=1764839384;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=WskgVGYt9c7Tl1nWoCo4XnhAFz4hEtBZCwJrVlrhyMI=;
	b=npPhcb+a8Kfz9e0IT8rjvdJnswt2Th3+kwrjEgBI+XfLNQbHP/SfKLcq/gBFYX9Zlb5pp9
	hewSXXrKspjaBV7IVuYoxwyrmHYDiqlJS7jJTeSLqPuK2JZrA2CQ6GUuzFDO5C601ZDJNA
	+rhGhpT6o81BCJIwHdAiW4BmOYNyYCg=
Date: Thu, 4 Dec 2025 10:09:43 +0100
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
Message-ID: <aTFP1w48bWgto7wr@duo.ucw.cz>
References: <20250924-knp-dts-v1-0-3fdbc4b9e1b1@oss.qualcomm.com>
 <aS8uJCnb0xOd6uby@duo.ucw.cz>
 <081a2038-e798-4cc0-96ff-b7f11e346831@kernel.org>
 <aTB8++UtSrhwtqdY@duo.ucw.cz>
 <c1b24759-762f-4b97-8d3f-8a44a66b646b@kernel.org>
 <db113021-f5be-4559-8ea5-719f8d7ec3ee@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="MP9cCdXPUQCFYAsS"
Content-Disposition: inline
In-Reply-To: <db113021-f5be-4559-8ea5-719f8d7ec3ee@kernel.org>


--MP9cCdXPUQCFYAsS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed 2025-12-03 19:41:59, Krzysztof Kozlowski wrote:
> On 03/12/2025 19:40, Krzysztof Kozlowski wrote:
> > On 03/12/2025 19:10, Pavel Machek wrote:
> >> On Wed 2025-12-03 18:31:11, Krzysztof Kozlowski wrote:
> >>> On 02/12/2025 19:21, Pavel Machek wrote:
> >>>> Hi!
> >>>>
> >>>>> Introduce the Device Tree for the recently announced Snapdragon SoC=
 from Qualcomm:
> >>>>> https://www.qualcomm.com/products/mobile/snapdragon/smartphones/sna=
pdragon-8-series-mobile-platforms/snapdragon-8-elite-gen-5
> >>>>>
> >>>>> Bindings and base Device Tree for the Kaanapali SoC, MTP (Mobile Te=
st Platform)
> >>>>> and QRD (Qualcommm Reference Device) are splited in three:
> >>>>>
> >>>>> - 1-3: MTP board boot-to-shell with basic function.
> >>>>> - 4-16: More feature including PCIE, sdcard, usb, DSPs, PMIC relate=
d, tsense, bus, crypto etc. Add QRD board support.
> >>>>> - 17-20: Multimedia features including audio, video and camss.
> >>>>
> >>>> Thanks for doing this. I assume there devices available with this are
> >>>> quite expensive/hard to get at this point?
> >>>>
> >>>> Please cc phone-devel@vger.kernel.org with phone related patches.
> >>>
> >>> That's not even a phone, anyway contributors should not cc lists which
> >>> are not relevant to the posting and not pointed out by maintainers. Y=
ou
> >>
> >> People should Cc relevant lists, and yes, if it is called "Mobile Test
> >> Platform", it is relevant to phone development.
>=20
> ... and btw, I know what MTP and QRD is and MTP IS NOT A PHONE. I work
> on this, I upstream this and it is not a phone, regardless how you call
> it. Just because we call our evalkit like that, does not make it a
phone.

So what is it?

> > new-hardware-devel or whatever. No. People should use tools, not guess
> > the cc lists. Fix the tools if you miss any Cc.

No.
									Pavel

--=20
I don't work for Nazis and criminals, and neither should you.
Boycott Putin, Trump, Netanyahu and Musk!

--MP9cCdXPUQCFYAsS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCaTFP1wAKCRAw5/Bqldv6
8s00AJ9WAjNW9NAZgyFttJrn0pWaVSlSrwCeL5t/91zEdmCh7YVvH02CjkILQbk=
=2IGL
-----END PGP SIGNATURE-----

--MP9cCdXPUQCFYAsS--

