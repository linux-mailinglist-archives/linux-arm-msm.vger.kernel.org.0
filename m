Return-Path: <linux-arm-msm+bounces-84325-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DDCDCA2EDD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Dec 2025 10:15:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0B54A3020689
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Dec 2025 09:14:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D0CE33D6CD;
	Thu,  4 Dec 2025 09:14:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ucw.cz header.i=@ucw.cz header.b="ZrWyqAnH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from jabberwock.ucw.cz (jabberwock.ucw.cz [46.255.230.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A11AF33D6CC;
	Thu,  4 Dec 2025 09:14:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.255.230.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764839696; cv=none; b=ttQUUS2gVNKeU4Eh9msC04wLiMnbZ8r5Yv8QLLBdgYcxr6WIAh833loeJC7gYu2pNOesI7Clc+65IL2DWN07ls88yhxQlhRuy++zndkgmNB0e6gZrt5ITDChSLxCkkZQ1JEfLO3FZtjfAyyus2/9/p5+FQvNkajOfruDMSDfizU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764839696; c=relaxed/simple;
	bh=cHS+xwnEwNQF6xxJTalbCiQIm0AADhG4+CAygeMKT7o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Cx0pIqY2UqGY6caiSQ/N8J6fLH2VmO4j3chZhropsm3sdgtcd8qfslVHxwQZcd1rOQQUY6/4TGYnazfJxJTe38xlmypLcH6ycb0MRFUVgMdAy1apdfFGpzs81sJG5e2xD9ifZALWI9RU5x+ym2BdAMsprzzkjbkGRCJcHLV4gu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ucw.cz; spf=pass smtp.mailfrom=ucw.cz; dkim=pass (1024-bit key) header.d=ucw.cz header.i=@ucw.cz header.b=ZrWyqAnH; arc=none smtp.client-ip=46.255.230.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ucw.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ucw.cz
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
	id C027F1C008F; Thu,  4 Dec 2025 10:14:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ucw.cz; s=gen1;
	t=1764839691;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hHJ07wy1/d9H3X6qyCLS2OrKsx9sh59Dr7/dAPdPY+o=;
	b=ZrWyqAnHahu7ViQIGEhZtHWWWmxlBBHj0wr+XmlM/V/+G48djj2EYBhvIVt35PM+X9aD3p
	saUggN2po2Esb2IGPiAUSduY2Jq6Ky182HiF+i1icK5EMzyjQXk+TcnqyVAxNryTBaYz1I
	A9gOSplAyr0S8jA5L8WOdhB+6ZZfL/g=
Date: Thu, 4 Dec 2025 10:14:51 +0100
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
Message-ID: <aTFRCzVQfXyJQt/Q@duo.ucw.cz>
References: <20250924-knp-dts-v1-0-3fdbc4b9e1b1@oss.qualcomm.com>
 <aS8uJCnb0xOd6uby@duo.ucw.cz>
 <081a2038-e798-4cc0-96ff-b7f11e346831@kernel.org>
 <aTB8++UtSrhwtqdY@duo.ucw.cz>
 <c1b24759-762f-4b97-8d3f-8a44a66b646b@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="T+njWJh6LDZDdGXE"
Content-Disposition: inline
In-Reply-To: <c1b24759-762f-4b97-8d3f-8a44a66b646b@kernel.org>


--T+njWJh6LDZDdGXE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed 2025-12-03 19:40:20, Krzysztof Kozlowski wrote:
> On 03/12/2025 19:10, Pavel Machek wrote:
> > On Wed 2025-12-03 18:31:11, Krzysztof Kozlowski wrote:
> >> On 02/12/2025 19:21, Pavel Machek wrote:
> >>> Hi!
> >>>
> >>>> Introduce the Device Tree for the recently announced Snapdragon SoC =
=66rom Qualcomm:
> >>>> https://www.qualcomm.com/products/mobile/snapdragon/smartphones/snap=
dragon-8-series-mobile-platforms/snapdragon-8-elite-gen-5
> >>>>
> >>>> Bindings and base Device Tree for the Kaanapali SoC, MTP (Mobile Tes=
t Platform)
> >>>> and QRD (Qualcommm Reference Device) are splited in three:
> >>>>
> >>>> - 1-3: MTP board boot-to-shell with basic function.
> >>>> - 4-16: More feature including PCIE, sdcard, usb, DSPs, PMIC related=
, tsense, bus, crypto etc. Add QRD board support.
> >>>> - 17-20: Multimedia features including audio, video and camss.
> >>>
> >>> Thanks for doing this. I assume there devices available with this are
> >>> quite expensive/hard to get at this point?
> >>>
> >>> Please cc phone-devel@vger.kernel.org with phone related patches.
> >>
> >> That's not even a phone, anyway contributors should not cc lists which
> >> are not relevant to the posting and not pointed out by maintainers. You
> >=20
> > People should Cc relevant lists, and yes, if it is called "Mobile Test
> > Platform", it is relevant to phone development.
>=20
>=20
> Almost everything in ARM64 is then relevant for "phone development".

No.

> People should use tools, not invent or try to guess whom to Cc. It's

No. People should cc relevant people / lists. Tools are tools,
submitter is responsible for getting the cc right. I believe you
should be capable of reading our patch submission guidelines yourself,
but I can find it for you if you are not.

> impossible to btw keep guessing them - you will request phone-devel,
> someone else will request desktop-devel, laptop-devel or

Desktop-devel is not kernel-related list. But yes, if
cat-picture-devel was somehow relevant because now interface to
cat-pictures changeed, it would be your responsibility to cc it.

    	   	     	      	       	      	    	       Pavel
--=20
I don't work for Nazis and criminals, and neither should you.
Boycott Putin, Trump, Netanyahu and Musk!

--T+njWJh6LDZDdGXE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCaTFRCwAKCRAw5/Bqldv6
8tdNAKDE7RrTGWmZi2D0jiGrAc2S94lXMgCfSgIKgyqIsZ/VqxHSTay/JOzrlwE=
=5gP+
-----END PGP SIGNATURE-----

--T+njWJh6LDZDdGXE--

