Return-Path: <linux-arm-msm+bounces-84356-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 55EC5CA396D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Dec 2025 13:26:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F2C2E301AF47
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Dec 2025 12:26:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A05FD337103;
	Thu,  4 Dec 2025 12:26:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ucw.cz header.i=@ucw.cz header.b="QOnhxcyj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from jabberwock.ucw.cz (jabberwock.ucw.cz [46.255.230.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AFC2398FB6;
	Thu,  4 Dec 2025 12:26:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.255.230.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764851175; cv=none; b=UsyUf2LcX+09N76AKkzkWdUE/L0BredfMbFF99h8CYhjVLwESetXRzQNFIFnxktEnR58O4xYfU9PqlZBCVUcv1aUzBUymN0Mrfxu4/PQ59l9XV6biyllUxDERvuaOET7tmjrWNUmUuEWV74YXA9bpbxlilitE31BZkHnmAynqWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764851175; c=relaxed/simple;
	bh=I0obHLer8DGqhfP+Jz8M0rv2nrUWrNdeaQDFSV0i6Nk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D7uVd2rgS+0tMtBwTdKfdy+uJKiR8qj8JHT0AS+4FmjZ4dco1m/Ce7nWVQYuPCttdI90u6Sk7nnijRy2Ax+qd4eUf8azy8Y1YrR2f2q/Iop+YTbCyqz6ow6UVboerlRmSwbChkINEsHgspEjQY+60wsmhWGdwVb8GN5iXPb1d5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ucw.cz; spf=pass smtp.mailfrom=ucw.cz; dkim=pass (1024-bit key) header.d=ucw.cz header.i=@ucw.cz header.b=QOnhxcyj; arc=none smtp.client-ip=46.255.230.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ucw.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ucw.cz
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
	id 81FF51C008F; Thu,  4 Dec 2025 13:26:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ucw.cz; s=gen1;
	t=1764851170;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=C4gKYecV5j+q0y/UOby/NlMGGrlawumSOrnnyOto9GI=;
	b=QOnhxcyjbjuDJxGn9hNDbOS2xefZ33OgBtd2n45WbX5931LRwBnj2aKj/LDZ5QvRMwzUiO
	VtVbsUZulh0h7s0B5COMJCqZRLKIngc4lqagSd7+kd1vbXfpt98pw751A3qScUP26UdNv3
	HP4TCIG6yTQsipYZocwa130n2Wpwlvs=
Date: Thu, 4 Dec 2025 13:26:10 +0100
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
Message-ID: <aTF94rM3/7ChMs5L@duo.ucw.cz>
References: <20250924-knp-dts-v1-0-3fdbc4b9e1b1@oss.qualcomm.com>
 <aS8uJCnb0xOd6uby@duo.ucw.cz>
 <081a2038-e798-4cc0-96ff-b7f11e346831@kernel.org>
 <aTB8++UtSrhwtqdY@duo.ucw.cz>
 <c1b24759-762f-4b97-8d3f-8a44a66b646b@kernel.org>
 <db113021-f5be-4559-8ea5-719f8d7ec3ee@kernel.org>
 <aTFP1w48bWgto7wr@duo.ucw.cz>
 <2fa188c3-f5c3-4145-9cae-3587f3bb23cc@kernel.org>
 <aTFzmm3fyxC1MAzk@duo.ucw.cz>
 <d9220bda-6704-4e37-9243-d7a4529afdf8@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="mg2Znaa5HtGTKNpz"
Content-Disposition: inline
In-Reply-To: <d9220bda-6704-4e37-9243-d7a4529afdf8@kernel.org>


--mg2Znaa5HtGTKNpz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu 2025-12-04 13:10:12, Krzysztof Kozlowski wrote:
> On 04/12/2025 12:42, Pavel Machek wrote:
> >=20
> >>>>>>>>> Introduce the Device Tree for the recently announced Snapdragon=
 SoC from Qualcomm:
> >>>>>>>>> https://www.qualcomm.com/products/mobile/snapdragon/smartphones=
/snapdragon-8-series-mobile-platforms/snapdragon-8-elite-gen-5
> >=20
> >>>>>>>>> Bindings and base Device Tree for the Kaanapali SoC, MTP (Mobil=
e Test Platform)
> >>>>>>>>> and QRD (Qualcommm Reference Device) are splited in three:
> >=20
> >>>> ... and btw, I know what MTP and QRD is and MTP IS NOT A PHONE. I wo=
rk
> >>>> on this, I upstream this and it is not a phone, regardless how you c=
all
> >>>> it. Just because we call our evalkit like that, does not make it a
> >>> phone.
> >>>
> >>> So what is it?
> >>
> >> evalkit for SoC. Just like every other NXP evalkit board is.
> >=20
> > ...products/mobile/snapdragon/smartphones/snapdragon-8-series-mobile-pl=
atforms...
> > ...Mobile Test Platform...
> >=20
> > Clearly not phone related.
>=20
> so you never had it in your hands, never heard about it before, know
> nothing about it, but you correct people and you claim it is "phone
> related" thus some fake new rule should be followed on cc-ing
> non-documented address (just git grep for it...).

I have not heard of it, and that's why I want people to cc the list,
so I don't have to pick it up from lkml. There are other people on the
list, maybe not following lkml, and likely interested in chipset
OnePlus 15 is based on.=20

We do have guidance about cc-ing the lists, and somehow I don't see "git
grep" in those rules, nor it says "if get_maintainers does not know
about it, it does not exist". In fact, it says:

"Many kernel-related lists are hosted on vger.kernel.org; you can find a
list of them at http://vger.kernel.org/vger-lists.html.  There are
kernel-related lists hosted elsewhere as well, though."

Why don't you click on the link?
								Pavel
--=20
I don't work for Nazis and criminals, and neither should you.
Boycott Putin, Trump, Netanyahu and Musk!

--mg2Znaa5HtGTKNpz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCaTF94gAKCRAw5/Bqldv6
8r/IAJ0QQK/2Z0TjNu8K2b010IuW+1UUGwCdEgVCbpw8FGrvwR5Pe28lrsTLZ84=
=cGA2
-----END PGP SIGNATURE-----

--mg2Znaa5HtGTKNpz--

