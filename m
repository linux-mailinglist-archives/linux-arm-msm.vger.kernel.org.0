Return-Path: <linux-arm-msm+bounces-58037-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3391FAB7F28
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 May 2025 09:48:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F099F188EC99
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 May 2025 07:48:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2DE301A275;
	Thu, 15 May 2025 07:48:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="up+clasl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05D2117BD9;
	Thu, 15 May 2025 07:48:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747295283; cv=none; b=Dfpyl+HPjMS0LonGJOOxVKkEiMY6oe3I3NV31nZOTMH/aDetRe0j3VVwhKZQBqe8e2TYrLpwMt/1PURjBHiSF9wPWVCuVCEal8bs4GnzCmVovEiZTBVt4P9tNXyn/ryavk6U86NiYy4Y3sRQRWKrbdhQi106j3xx1TwaVhqNft4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747295283; c=relaxed/simple;
	bh=RIyFKZitPBiaTtc2Ta76rUlcsq1g6DCvhNZ6Ru10e60=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KJi5QLAhchzUOMqU0JLvJM0hdyJ4DdLFEOop+bmUIlZn/4gQ8jXf86Yy3OfeZvWvVv2bwkXrSiVs1HZjw5YusPTUlsI7S+NirT2wMvbdYCaxfulBds6rXtlktva2i/JqmJZmmxLbNPZ5/ddOyrB56eqRSngmBpxt2lSIo4Hjkh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=up+clasl; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 680DDC4CEED;
	Thu, 15 May 2025 07:48:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747295282;
	bh=RIyFKZitPBiaTtc2Ta76rUlcsq1g6DCvhNZ6Ru10e60=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=up+claslMD+1OCnKlIZ+cQL6YETz//MX/Gse0PU7dHW9RCVqQQKGdU25bdY97eLe/
	 DMNQVlHWmXb94wSbC90agfpN51Mgik+iDp4+dNJ7t67nok0s19zBLqH7iW8ZXHnIDD
	 OM2vPiLAPhxK1G8GCeJfp8R6cYBiyGXKSTYbk4InOryKhLXB+fEZ+fkKNTUdhbDilZ
	 E+p5wgBFKhWrvUyyUc0sbhVNh8MxjLvmOUTNH4t0IaME9+nQW/zZxfJ/AfcidvaTuU
	 IiEK6BB07jfSJrbsRD/74JiCa6D5rB+q5QQtvL3C8RiWLo90Dd8ZSileF12vF0JXXP
	 aj6H5QZ1FWxpA==
Date: Thu, 15 May 2025 09:47:57 +0200
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
	Srinivas Kandagatla <srini@kernel.org>,
	Takashi Iwai <tiwai@suse.com>, linux-arm-msm@vger.kernel.org,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH v2 1/3] ASoC: qcom: use drvdata instead of component to
 keep id
Message-ID: <aCWcLfJTkggghagV@finisterre.sirena.org.uk>
References: <87r00uy57x.wl-kuninori.morimoto.gx@renesas.com>
 <87plgey56v.wl-kuninori.morimoto.gx@renesas.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Q3p27e90Cur6KQRd"
Content-Disposition: inline
In-Reply-To: <87plgey56v.wl-kuninori.morimoto.gx@renesas.com>
X-Cookie: Well begun is half done.


--Q3p27e90Cur6KQRd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 12, 2025 at 01:43:21AM +0000, Kuninori Morimoto wrote:
> From: Srinivas Kandagatla <srini@kernel.org>

> Correct thing for suspend/resume path to handle is by checking these
> flags, instead of using component->id.
>=20
> Signed-off-by: Srinivas Kandagatla <srini@kernel.org>
> Suggested-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---

You've not provided a Signed-off-by for this so I can't do anything with
it, please see Documentation/process/submitting-patches.rst for details
on what this is and why it's important.

--Q3p27e90Cur6KQRd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmglnC0ACgkQJNaLcl1U
h9CgLwf/bP5BremJsij0rtZucmYccRk6btUkWj8IusEgMtT+tY0+jA+KhH73XsrV
QqSzX1eZX536ndzEpZ84J/WNrzl3JE5xtoZmSHut4ZHYId2eUxF/W+ivjTnOvyd9
8IFfCPIy9ts61UBK4XXPbFM6P8qdtMjSn2DApWDtkGWRFeDXa/zVsFkwmwudoCw+
WhoOvzFqzygyfsA/YY4HyFpSdB9k6h0mYl63D1N2kIChegcFfGvXkJT7+W03PTHL
KwzhF2zdNcTqp9wp3dpDM9gzaL1oQKE1lc9USH5TNL68L0dTHsJR/IiUFkwUoFQL
kk8crzqG5mKODnUxFz4HWc7Wu2VoYw==
=rJyQ
-----END PGP SIGNATURE-----

--Q3p27e90Cur6KQRd--

