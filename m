Return-Path: <linux-arm-msm+bounces-77984-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A8EEBF0C5F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Oct 2025 13:15:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 17C2E18A030D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Oct 2025 11:15:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75CDE2FC029;
	Mon, 20 Oct 2025 11:13:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PG6dHB+G"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45D162F83AF;
	Mon, 20 Oct 2025 11:13:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760958785; cv=none; b=kS/w0iDCh+pLoJlx4Ter1tyhEbB5xq5KILRFtR2qVo0fOFYEJ+YiYRxnoHG/TYLxODh/30mfa1R18PZ2SEi1UefZYA+GMboH4QKwp/FCpLXK4C0gbqe7qKJ21m4McdWkUk7uDAmuj68TIa7BD5fA0USfM6BbkyXxUheV1FK9Dq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760958785; c=relaxed/simple;
	bh=LqlyFtZvoGXVVbtwTwF4PwGRsiCdkS8m3NwNvyq+HSY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JD33tw4XAJ0600r27kxXS5poPp7A0112j/F8pKIl7D5kAMFDgDP4ZsGx8OYc8/ADeDKuiJLzYB6KGy1OMavJcQXomXlHAEnZRGpoY++cI9t9wa1wF6/LRFcZHXRK1eGFmnPcqVbIGZxbTL3IuZp3Iu9kgt9V0/E+SAMLsm76pwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PG6dHB+G; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E6A4C4CEF9;
	Mon, 20 Oct 2025 11:12:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760958784;
	bh=LqlyFtZvoGXVVbtwTwF4PwGRsiCdkS8m3NwNvyq+HSY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PG6dHB+GBfjJLCoGNkWF1q+xVBfBm0JKSZs7LFXlyjUm33SzwqhgoyiKFl7qL6iDq
	 VezOw+VfWyGUu5VYbNso+2U4obG+3+ygSO3nFYOdAfApHTU5r6X29EdIj5V9MTBbLm
	 OtCqu1X3reCaiQ4kHg/rBadRSTRod7oHyWvkPxBT+rVZY+0RUYUxlx625JYVSj+cKE
	 3Anbya4zhGGsnEJ367Ye9cxbCNNeYtgDJ6rJ1AWiG3FaxsTwVEMt3o9LZ/UYwX/now
	 ZNMcr2xTJM0LlTMXvypLYMmyjQrHx6gWhClb6EOmifcMfXVKPf4ybSpwgFRiGdwWwC
	 EC0SI8gvnvE1Q==
Date: Mon, 20 Oct 2025 12:12:55 +0100
From: Mark Brown <broonie@kernel.org>
To: Alexey Klimov <alexey.klimov@linaro.org>
Cc: gregkh@linuxfoundation.org, srini@kernel.org, rafael@kernel.org,
	dakr@kernel.org, make24@iscas.ac.cn, steev@kali.org,
	dmitry.baryshkov@oss.qualcomm.com, linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] regmap: slimbus: fix bus_context pointer in
 __devm_regmap_init_slimbus
Message-ID: <da94225b-f4c5-4cdd-8ddb-937f69a7c8b2@sirena.org.uk>
References: <20251020015557.1127542-1-alexey.klimov@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ssxoyRsbtT0nsvLE"
Content-Disposition: inline
In-Reply-To: <20251020015557.1127542-1-alexey.klimov@linaro.org>
X-Cookie: I doubt, therefore I might be.


--ssxoyRsbtT0nsvLE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 20, 2025 at 02:55:57AM +0100, Alexey Klimov wrote:
> Commit 4e65bda8273c ("ASoC: wcd934x: fix error handling in
> wcd934x_codec_parse_data()") revealed the problem in slimbus regmap.
> That commit breaks audio playback, for instance, on sdm845 Thundercomm
> Dragonboard 845c board:
>=20
>  Unable to handle kernel paging request at virtual address ffff8000847cba=
d4
>  Mem abort info:
>    ESR =3D 0x0000000096000007
>    EC =3D 0x25: DABT (current EL), IL =3D 32 bits
>    SET =3D 0, FnV =3D 0
>    EA =3D 0, S1PTW =3D 0
>    FSC =3D 0x07: level 3 translation fault

Please think hard before including complete backtraces in upstream
reports, they are very large and contain almost no useful information
relative to their size so often obscure the relevant content in your
message. If part of the backtrace is usefully illustrative (it often is
for search engines if nothing else) then it's usually better to pull out
the relevant sections.

--ssxoyRsbtT0nsvLE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmj2GTYACgkQJNaLcl1U
h9Cmvwf9GK8Dvln3p66O91K0PL96/37zqN/fTH3rc55VrHmVMqSnIXkf3rLH55QT
5m9vExSwbC5NuBKXwUmHfr8ecE/eTu4hdF0cvo32z51Kz9cELYkSm8XPlprOZyiU
MnyCHQfiE6adxRyFpUBicsHTOt+NvwjJRT/sxAzzu+XPQKc+i9Pr6lAs3h1DMGIi
5jQWVrlIGNjA7STQhn+tbGKZPsAWrgfY0HgFoKPC3yd4zwenv29j3eRj/ca3+MGG
LwoVAJ+OxaBT6Ie+VUsTWfSbmAAGsSYVAdhoqfXt04cFvOE0Ltm+pK/HN9qXp0MQ
+3DJf1TZRVy7zj6/ekEgt6ovrS37ug==
=VLJv
-----END PGP SIGNATURE-----

--ssxoyRsbtT0nsvLE--

