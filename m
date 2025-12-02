Return-Path: <linux-arm-msm+bounces-84120-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 23417C9C9BC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 02 Dec 2025 19:21:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 3267A34869A
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Dec 2025 18:21:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E4DE2C0F7E;
	Tue,  2 Dec 2025 18:21:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ucw.cz header.i=@ucw.cz header.b="S5T5zF2h"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from jabberwock.ucw.cz (jabberwock.ucw.cz [46.255.230.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FC2F2BDC27;
	Tue,  2 Dec 2025 18:21:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.255.230.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764699697; cv=none; b=G2iJU8G3JGXSVclCoLCM0MPo9+Nv8Fqj9QDPxTIdl0havrn+YW1ceG3vtzcuwbqQ2JGq0HrGMK9otAmZfgJPkQbuZ/ZSrQvZug/7Rzjh5TsAI13+6a3q43+THUSTBbiqOTMpyGRLELxR6f810JJgKKi8Icc5gz3mrF3gOanO15U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764699697; c=relaxed/simple;
	bh=2eDSm0Qw8bf96YIiPD7vkQQjIuCqlZYZPZxfB7GZZCo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GbvQURltnIHnZ4hBmcI965aOwakyzT34rLZ9SQxD8GcomDIMAufcYeyeyzrnIRGxSVqV8lBhtdBiZr9AZciBgZvuVOG6sSD1VXZQ1urX8VOHW+XK38Bb4gb2RIJJeW2aHmHhu1nBs+eXGgLx/ZaWJZvnShSE5BZyC7Y3ENXWIWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ucw.cz; spf=pass smtp.mailfrom=ucw.cz; dkim=pass (1024-bit key) header.d=ucw.cz header.i=@ucw.cz header.b=S5T5zF2h; arc=none smtp.client-ip=46.255.230.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ucw.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ucw.cz
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
	id CFD321C00AB; Tue,  2 Dec 2025 19:21:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ucw.cz; s=gen1;
	t=1764699684;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=gGih/VOUJc9Am/6n+DHxiT7o43n8OgP3GSLGonGm+7g=;
	b=S5T5zF2hPCvky8TQw1kwoE7khpUmsvB7z1+6hVfZJLHyVurn9tbNVUQnM3hiWjw9g2NE7t
	uqYSvd5KsfN/m1eGep8nFT6BMkx/UQS7CYgfmoBCLehsUbEM2clzfbI9K7Y1p74WWkkG6j
	BqPkq8105Nlp4HDnsIyixmuo1fVrJ9s=
Date: Tue, 2 Dec 2025 19:21:24 +0100
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
Message-ID: <aS8uJCnb0xOd6uby@duo.ucw.cz>
References: <20250924-knp-dts-v1-0-3fdbc4b9e1b1@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="PNeephin7LD2VIJk"
Content-Disposition: inline
In-Reply-To: <20250924-knp-dts-v1-0-3fdbc4b9e1b1@oss.qualcomm.com>


--PNeephin7LD2VIJk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> Introduce the Device Tree for the recently announced Snapdragon SoC from =
Qualcomm:
> https://www.qualcomm.com/products/mobile/snapdragon/smartphones/snapdrago=
n-8-series-mobile-platforms/snapdragon-8-elite-gen-5
>=20
> Bindings and base Device Tree for the Kaanapali SoC, MTP (Mobile Test Pla=
tform)
> and QRD (Qualcommm Reference Device) are splited in three:
>=20
> - 1-3: MTP board boot-to-shell with basic function.
> - 4-16: More feature including PCIE, sdcard, usb, DSPs, PMIC related, tse=
nse, bus, crypto etc. Add QRD board support.
> - 17-20: Multimedia features including audio, video and camss.

Thanks for doing this. I assume there devices available with this are
quite expensive/hard to get at this point?

Please cc phone-devel@vger.kernel.org with phone related patches.

Best regards,
								Pavel
--=20
I don't work for Nazis and criminals, and neither should you.
Boycott Putin, Trump, Netanyahu and Musk!

--PNeephin7LD2VIJk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCaS8uJAAKCRAw5/Bqldv6
8nbTAJ4onO77ZAisVrnNQtsHSL0osqnikwCfWw+T/nFoAEa5YJx0N4+EZdZ/rvQ=
=bSF+
-----END PGP SIGNATURE-----

--PNeephin7LD2VIJk--

