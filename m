Return-Path: <linux-arm-msm+bounces-84250-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 29B5DC9FEC1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 03 Dec 2025 17:24:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7012D3004F1B
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Dec 2025 16:23:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD914352F8B;
	Wed,  3 Dec 2025 16:17:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ucw.cz header.i=@ucw.cz header.b="TZZVTNhV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from jabberwock.ucw.cz (jabberwock.ucw.cz [46.255.230.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CEA2313E34;
	Wed,  3 Dec 2025 16:17:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.255.230.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764778630; cv=none; b=j+OinzUOpNVD+Q14TriSDGn0cXqazySsuo5Vr1aXPRZUzCewTTx0P/U/UaNE/fDbzuyrVl29yjK4m3oBe92CJ/Hl3Z3NpodpmKAm1x7ZAq/ZInyd0mzQC9N+hShB/0nqkcK+KHsH2o5W4ibRQGDPDuIcW4W8o23lCPe8dZma2yE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764778630; c=relaxed/simple;
	bh=25wSepoDf31yX7L+FZ/KeaHyjeYbFBtuOeGCyc7GHSQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CjScn5P876e80sruq/kTtSwyFzI9Rz0FFYn3Vjfk6FgZL6u5G4RyWxDE7DfrqFv0cIIeF9IxE9bnrBp+4kKyGa5IVQ0E1eXkvpdwTmvQJQRvaZYtjXwoOI7reRnSJf0YGIZbfax2Y5GUL1exzZZrUE5mKBvB+szu2iKttj4xTAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ucw.cz; spf=pass smtp.mailfrom=ucw.cz; dkim=pass (1024-bit key) header.d=ucw.cz header.i=@ucw.cz header.b=TZZVTNhV; arc=none smtp.client-ip=46.255.230.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ucw.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ucw.cz
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
	id A721C1C008F; Wed,  3 Dec 2025 17:17:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ucw.cz; s=gen1;
	t=1764778623;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=mYekgmW6EvaOduD8ykRrI4akeD8eq3oO1j9jAlFrYko=;
	b=TZZVTNhVD9mw5S+OSgUJl81AsFEq6Sh82iBE+PwyxDqPvaKxLe5mGY4n1gZp8ATAiIyJLo
	QG3yR5xJseutvinx9kXWcnxmvQuCkAThO4+InT2bMEnQKbHdBh01LuatwF8ZxZ1ArglhVP
	gsKFSJljZcyJfoUN7oOWpQ4HSaMPxVI=
Date: Wed, 3 Dec 2025 17:17:03 +0100
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
Message-ID: <aTBifwvFiZd/aAHB@duo.ucw.cz>
References: <20250924-knp-dts-v1-0-3fdbc4b9e1b1@oss.qualcomm.com>
 <aS8uJCnb0xOd6uby@duo.ucw.cz>
 <9dabc745-1464-48f2-8687-2b849a7fca95@oss.qualcomm.com>
 <aS9SeXazCemfDQP+@duo.ucw.cz>
 <5e0e1cfd-e4bc-46c6-9367-ea628e6db794@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="RI896vrXPKLcgf3e"
Content-Disposition: inline
In-Reply-To: <5e0e1cfd-e4bc-46c6-9367-ea628e6db794@oss.qualcomm.com>


--RI896vrXPKLcgf3e
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

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
> >>
> >> A number of them seem available at most shops now, but they just came =
out
> >> recently and they're all flagship phones so understandably it'll proba=
bly
> >> take some time before enthusiasts poke at them
> >=20
> > Aha, that's actually good news, I was assuming only dev boards are
> > available (MTP, QRD). So OnePlus 15, for example, would be suitable?
> > (But I'd assume OnePlus 15 would still need separate dts, perhaps
> > similar to MTP?).
>=20
> There are always *some* bits that are common with the dev boards,
> but it really varies. Depends on a specific device and how it was
> designed.
>=20
> Each device needs its own DTS, particularly since it encodes things
> like voltage regulator settings, so the consequences may be dire if
> there's a mismatch.

So if I would like to directly use this patches, I'd need either MTP
or QRD device, and those are not available in shops. Something close
to this should work on hardware such as OnePlus 15, but DTS will need
to be different (and perhaps drivers for hardware that differs) and it
is not clear if OnePlus will not sabotage custom kernels somehow.=20

Best regards,
								Pavel
--=20
I don't work for Nazis and criminals, and neither should you.
Boycott Putin, Trump, Netanyahu and Musk!

--RI896vrXPKLcgf3e
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCaTBifwAKCRAw5/Bqldv6
8jadAJ43j8h3k7r7Y/xzN+lekhj0VJY+hwCgm+GSCXXcAu/zGUtCZpxt5mXMs2E=
=Eb4b
-----END PGP SIGNATURE-----

--RI896vrXPKLcgf3e--

