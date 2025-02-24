Return-Path: <linux-arm-msm+bounces-49175-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 308E0A420CD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Feb 2025 14:37:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 817C37ABFD7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Feb 2025 13:35:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6AF7524BC14;
	Mon, 24 Feb 2025 13:36:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="G1qIi2DA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39C5E24BBF3;
	Mon, 24 Feb 2025 13:36:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740404194; cv=none; b=O8eVEhAlhYfVaHsyWL/w5x1Xdhdwtn9a1V/co+dj6c4YcZUUrp9SgO7GGDzrdHQ5XS8CSsCWkU/8E2O5wkgJNqTW5JIOIVtax5/dwnzGrG7XDxNg2eVaORgf3GjPb3imtSjSIBKoWrSe2pazI2yckWwc+dhFbH5W/s6QWKdfmKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740404194; c=relaxed/simple;
	bh=VhFuW1YX+WDguNbx1Pqhdgwyq1wth1UVzs2bcOFTY6s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Gs8X8VW//irdQ4FqWcmlvjSqmbIxPQX4i2vbp3PumsdBPCQC/OMIBLTiNoTy88iLP4XA4fydK8FDDJD6Pa59gICoPINvAbeNQ7SvTDf88+fdHm7LX5U49416rSJXNgx46uvCOraOb2+daIM3ppojJQVbBFgAR7tmQ3DpnJwBeXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=G1qIi2DA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03DC5C4CED6;
	Mon, 24 Feb 2025 13:36:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740404193;
	bh=VhFuW1YX+WDguNbx1Pqhdgwyq1wth1UVzs2bcOFTY6s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=G1qIi2DAwoQ/P1Re3G3WBaoT1KaYq+h3Yy0OxGNJWSsO8k5Nle1HFV3fXkLVu/7ol
	 bRA4ewU6jH6usaAvxmTaUuBSmVSNpymyu4x1NqhaaYH1buNB9MpXaSFUfjdCZkESxW
	 50IkRrzj1TRwCFjbO8EJUiNbwIcB0qNs3m9/uaTSJa8Ef09V2g3Vvp0cz9cCNmKd/g
	 OfS0xiMSu4egIuoxXWwz9QziulS0mWQ5FVPvuq9qw2yQucnPyey5OaOlgRl9c/PL+f
	 Em5/L/SKjsRvBpAMG7u68U98/CwIzi7gciO4gyYX9C+NsYuwpfEtBfdUHtvnb//cUB
	 d7S9jQngIHsIw==
Date: Mon, 24 Feb 2025 13:36:27 +0000
From: Mark Brown <broonie@kernel.org>
To: Steev Klimaszewski <steev@kali.org>
Cc: Alexey Klimov <alexey.klimov@linaro.org>,
	srinivas.kandagatla@linaro.org, lgirdwood@gmail.com,
	krzysztof.kozlowski@linaro.org, perex@perex.cz, tiwai@suse.com,
	jdelvare@suse.com, linux@roeck-us.net, linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org
Subject: Re: [PATCH v2] ASoC: codecs: wsa883x: Implement temperature reading
 and hwmon
Message-ID: <1a667486-590d-47c9-b23a-069e3d51cb54@sirena.org.uk>
References: <20250221032141.1206902-1-alexey.klimov@linaro.org>
 <CAKXuJqj4zKfA4HNNcooG5Ffqi+EKQ1RvuzWndZd=htoatwszOw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="9sSdn6rh6EA/NDBo"
Content-Disposition: inline
In-Reply-To: <CAKXuJqj4zKfA4HNNcooG5Ffqi+EKQ1RvuzWndZd=htoatwszOw@mail.gmail.com>
X-Cookie: Phone call for chucky-pooh.


--9sSdn6rh6EA/NDBo
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 21, 2025 at 02:10:44PM -0600, Steev Klimaszewski wrote:
> Hi Alexey,
>=20
> On Thu, Feb 20, 2025 at 9:21=E2=80=AFPM Alexey Klimov <alexey.klimov@lina=
ro.org> wrote:
> >
> > Read temperature of the amplifier and expose it via hwmon interface, wh=
ich
> > will be later used during calibration of speaker protection algorithms.
> > The method is the same as for wsa884x and therefore this is based on
> > Krzysztof Kozlowski's approach implemented in commit 6b99dc62d940 ("ASo=
C:
> > codecs: wsa884x: Implement temperature reading and hwmon").

Please delete unneeded context from mails when replying.  Doing this
makes it much easier to find your reply in the message, helping ensure
it won't be missed by people scrolling through the irrelevant quoted
material.

--9sSdn6rh6EA/NDBo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAme8ddsACgkQJNaLcl1U
h9B8igf8DvVM3ehtTA/kt8PFdlYgC7fDa+W9NdQiGnL5dBWxZHkjW/K/+0BdZcLZ
oUYwbPazrLOk/UNutZEPtmTeA/tsDICgJkRqo4JNr+ieJCYi5cx4ndnC41p9NaN+
fBJmvIwp5fR3Xf7xqcNUYODzUV4up5UNcSrZ6XLbe7Gu9ARUDnbysW6xiDPrwT5f
Vs4Dxbebd3DAc6AYaUY/238U7UMIs1grbd3n31BEDpHqARVEacRfrDs3T6HfJMcG
QYifRzsro6uoZYLyqEQDQ8Arxz5mEXpJBMK1xUdtNPH3qElOLdhR0ilIJlGRmKIH
fATfb92v3UosKMkBU1NWq2aU3ph4Gg==
=v9FJ
-----END PGP SIGNATURE-----

--9sSdn6rh6EA/NDBo--

