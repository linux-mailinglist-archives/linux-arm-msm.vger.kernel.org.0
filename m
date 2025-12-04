Return-Path: <linux-arm-msm+bounces-84322-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D9107CA2E98
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Dec 2025 10:08:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 83DFF306436E
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Dec 2025 09:06:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2CB4533290D;
	Thu,  4 Dec 2025 09:06:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ucw.cz header.i=@ucw.cz header.b="AaxY2cnG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from jabberwock.ucw.cz (jabberwock.ucw.cz [46.255.230.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EF9632BF32;
	Thu,  4 Dec 2025 09:06:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.255.230.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764839213; cv=none; b=pxOnLK3lEvjUOkU59jawIwGml18b+lkecx/w0S/HhG3yWFOPIpmm1xwZgITir/7JacLSYVB4VqSfO1n4uFY/4I9Lb+diKCA9pjsLNnqapEWHJKThXIjFM1tOdenujigpEZ+DWjSFRkI91IMPd3bcP0g4ifDf5iLkuJbUZ4mEmeM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764839213; c=relaxed/simple;
	bh=S3+q/tBEe8Ll2UfBBB3HhhMBP9uTsaAqYwLyXsHlw5I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qsOw5Yn2dT4gtsy6GHzWVf50qK2U7UJFgDuZ9pVJdEJVLGZRGN3rDHW7PWzDGqQi2p2ESQ41nMwDhoNBrKJIstq7e8m7clFQlbo9aJ0wS8ayvamwxlX+JBXYM33Q2aELXoYvtZC5ZZLebX6xlNNTOEfkuBRMou+pQ3Q2GqfaXek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ucw.cz; spf=pass smtp.mailfrom=ucw.cz; dkim=pass (1024-bit key) header.d=ucw.cz header.i=@ucw.cz header.b=AaxY2cnG; arc=none smtp.client-ip=46.255.230.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ucw.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ucw.cz
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
	id 4BF471C008F; Thu,  4 Dec 2025 10:06:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ucw.cz; s=gen1;
	t=1764839208;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=w8qDafzfVudJKLIeCoHIajl5T7DcrBMZzoSgIWOc/HY=;
	b=AaxY2cnGfASD/4UNB9XNWNwRQt2kfy6QR1g/4XvJnipUqDpLBR0rCvu344Z01c0z/yDp6r
	GnlgsaKXGcOrXk4JAeZxuJgOMrUqFr0WckX4EbWhrkbE2RR5f9Vx/npMFl8eja/FIQsmCV
	4IcJqCJUW9dRRhzEyphMGh+D1odmTW8=
Date: Thu, 4 Dec 2025 10:06:47 +0100
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
Message-ID: <aTFPJwBq91r7o9Y2@duo.ucw.cz>
References: <20250924-knp-dts-v1-0-3fdbc4b9e1b1@oss.qualcomm.com>
 <aS8uJCnb0xOd6uby@duo.ucw.cz>
 <3a6fc312-ceb0-4258-981e-e6017c1c9b20@oss.qualcomm.com>
 <aTFMu1BZCPkXMGQe@duo.ucw.cz>
 <c07215b9-0953-48bb-8fb2-d158a9a5dac4@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="oGw0Yrf8r8IQxC7s"
Content-Disposition: inline
In-Reply-To: <c07215b9-0953-48bb-8fb2-d158a9a5dac4@kernel.org>


--oGw0Yrf8r8IQxC7s
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> >>> Please cc phone-devel@vger.kernel.org with phone related patches.
> >>
> >> The cc list is generated by tools following the list in MAINTAINERS, y=
ou can get
> >> this series from devicetree@vger.kernel.org or linux-arm-msm@vger.kern=
el.org
> >=20
> > Well, tools are not smart enough to generate good Cc list in this
> > case, so please do the cc manually. (I don't think they can be
> > improved easily, as it is not clear when code is phone-related from
> > the filename).
>=20
> You cannot impose additional manual rules, just because you want

"You have to cc relevant list" is the rule that predates
automation. Just because automation does not work well in this case
does not mean you are exempt.

> Contributors for every standard patchset (there are only known 2
> exceptions for arm soc development and foo-devel is not one of them)
> must only use the tools and not cc phone-devel manually.

Untrue.
								Pavel

--=20
I don't work for Nazis and criminals, and neither should you.
Boycott Putin, Trump, Netanyahu and Musk!

--oGw0Yrf8r8IQxC7s
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCaTFPJwAKCRAw5/Bqldv6
8vRYAJ9/U5rIuOIGberVjgwLCbtJzRdrkgCgrfoVkbChO95ctknBXWye96CcUbc=
=OdDu
-----END PGP SIGNATURE-----

--oGw0Yrf8r8IQxC7s--

