Return-Path: <linux-arm-msm+bounces-84352-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D5137CA3798
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Dec 2025 12:44:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4E95A30361F5
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Dec 2025 11:44:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D7E930EF92;
	Thu,  4 Dec 2025 11:44:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ucw.cz header.i=@ucw.cz header.b="BKPFwAt7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from jabberwock.ucw.cz (jabberwock.ucw.cz [46.255.230.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1257230C373;
	Thu,  4 Dec 2025 11:44:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.255.230.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764848685; cv=none; b=W88B+OYTcfCeXXiDT5KSmLcGRD5wHT4bDbCH9IvAVrBHzcBtSKcZE5byJPjfI0FVHSYShxIXpe1uNFmX8rrugH+mDOMxQRYwYz5dIxabsgH1tGmIr01hdjdXjS1lkdaUzfI74TJGruoboOsxZK8SYDDBEZb4R6YHNQPYgudVP0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764848685; c=relaxed/simple;
	bh=AKNrgeyz7lkH48/mF9mD6fG/Zya2d+P0m44vebTvXMg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lJO5qICvSHAltvKxE3Obeo/K5e0XdD1sB59khYmH2BGRXirwPeJRloeHdD3AqntklfZxRZI07xMTJbroLoPgG/xmBO2tRknraXrXKnQRsBX4XMXCsEH4PDwxptPBucDrg3YjAgozQVS27Zhl4trF5b/U5EJwLOWo5Avyde9xb0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ucw.cz; spf=pass smtp.mailfrom=ucw.cz; dkim=pass (1024-bit key) header.d=ucw.cz header.i=@ucw.cz header.b=BKPFwAt7; arc=none smtp.client-ip=46.255.230.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ucw.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ucw.cz
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
	id 166DD1C008F; Thu,  4 Dec 2025 12:44:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ucw.cz; s=gen1;
	t=1764848681;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=xJwPdYFfQ2w3rk+RVooPvu0xkS7/tKbdb7MLyY81hJ0=;
	b=BKPFwAt7pzJ/JxEZtYVPJPP4pZZd+bKpnLuW4v8UQShep85g4Ulqg861xAqt6nuOQVCu6t
	6ToxiiMiibdBQnUWh2fCyNWer2WaPGTaT+cOqSTfKKkKMM7JDImpzgjvsFrT+b50nFBE86
	/xbK1sVyau4tV+cjs3gk7jETHp0UGk0=
Date: Thu, 4 Dec 2025 12:44:40 +0100
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
Message-ID: <aTF0KKFq0Ibyymz+@duo.ucw.cz>
References: <20250924-knp-dts-v1-0-3fdbc4b9e1b1@oss.qualcomm.com>
 <aS8uJCnb0xOd6uby@duo.ucw.cz>
 <081a2038-e798-4cc0-96ff-b7f11e346831@kernel.org>
 <aTB8++UtSrhwtqdY@duo.ucw.cz>
 <c1b24759-762f-4b97-8d3f-8a44a66b646b@kernel.org>
 <aTFRCzVQfXyJQt/Q@duo.ucw.cz>
 <785fb4be-22b2-4881-8900-e7001945f929@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ewQLv6W50r8/FWSH"
Content-Disposition: inline
In-Reply-To: <785fb4be-22b2-4881-8900-e7001945f929@kernel.org>


--ewQLv6W50r8/FWSH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> No, there is no rule of Cc-ing phone-devel. No one has to do it and you
> need to stop coming with the impression that it is sanctioned rule by
> any platform or architecture maintainer.

Yes, people need to cc relevant mailing lists, that's why we have the
lists, and that's how kernel development works. You want relevant
developers, well, to review the patch.

"You should also normally choose at least one mailing list to receive a copy
of your patch set.  linux-kernel@vger.kernel.org should be used by default
for all patches, but the volume on that list has caused a number of
developers to tune it out."
							Pavel
--=20
I don't work for Nazis and criminals, and neither should you.
Boycott Putin, Trump, Netanyahu and Musk!

--ewQLv6W50r8/FWSH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCaTF0KAAKCRAw5/Bqldv6
8nI7AJkBSEdBVV+OA8qne53JIeAnyYP9FQCgs3hVJhzM9pBhb01V9XqrfrkOiAU=
=oPkg
-----END PGP SIGNATURE-----

--ewQLv6W50r8/FWSH--

