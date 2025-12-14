Return-Path: <linux-arm-msm+bounces-85167-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D7C31CBB983
	for <lists+linux-arm-msm@lfdr.de>; Sun, 14 Dec 2025 11:36:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 94F4D3003BF7
	for <lists+linux-arm-msm@lfdr.de>; Sun, 14 Dec 2025 10:36:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7413A25DAEA;
	Sun, 14 Dec 2025 10:36:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="J+BDsUow"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48620FBF6;
	Sun, 14 Dec 2025 10:36:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765708593; cv=none; b=Gffu8worauoYReYiQlfoWjt9MzborZQDEJD9QraWaycx49P4BnGPYSqgx2NwFbl9a7kc5cETCEJncizlJEFdjgTUQft8ed1M3Yt879eYPaXi7Y6Z5xLjFEy27AM5pVNCCzknzpVce3XUrkcLlN2JN8nWQmInQmMP2YwL5tztDg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765708593; c=relaxed/simple;
	bh=Bb3gaOEY5RHee7gQk1ex1YcCU+/dbzpvULfO5tzYYDQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mdzgplQ6VpZ5YgBTOb+jmlahJU3qYNJ3nGMYHUn/fXGFmuAi9o+eo7tM5I5PE4iG6bXTibvxUcjaPiQWTGv6nXXUltg6T3bJh5fwcUEgqeEk/3QvMGP7g0lxJkF45LvlqrMMHjPvVRnTQsvuSfP1IF6Oc28FvaF/UKOGKtlGT+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=J+BDsUow; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DD99C4CEF1;
	Sun, 14 Dec 2025 10:36:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765708592;
	bh=Bb3gaOEY5RHee7gQk1ex1YcCU+/dbzpvULfO5tzYYDQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=J+BDsUowotkCEH5trAml11w3cO5apChP51JVU32tn21Y3uncQj6yGLu4SKw2QyShQ
	 kMCiYFFafCJlLdXr6YKN3X9x2++OewbcWPJA5yy0/dvYV2Az6+BZC7oLUZEirLkEYQ
	 ECv1znP9t11MxGSLCAjjX77tQhMj7ehAYYsqWCVKU+wKb7Jwy8N322zwjp5rtO8Vk2
	 R8gjq+7MYyOUZwGILWv9MYOw9imZJinohJwlugVym74Tfatat5lMoyB0kK1SbPOfNq
	 brQDqeC4FjI1wGfUBnLl8rwZrqXJcvXvn5BNjJRu/dtdkoXrXYrQ/8HxB/Y1W6C4Fn
	 wZAD0uHXD1abQ==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 9C43D1AC5687; Sun, 14 Dec 2025 19:36:29 +0900 (JST)
Date: Sun, 14 Dec 2025 19:36:29 +0900
From: Mark Brown <broonie@kernel.org>
To: Jonathan Marek <jonathan@marek.ca>
Cc: linux-arm-msm@vger.kernel.org, Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	"open list:QCOM AUDIO (ASoC) DRIVERS" <linux-sound@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 1/2] ASoC: codecs: lpass-wsa-macro: add
 RX4/RX5/RX6/RX7/RX8
Message-ID: <aT6TLZRgWwGjrLPD@sirena.co.uk>
References: <20251125223848.1798-1-jonathan@marek.ca>
 <20251125223848.1798-2-jonathan@marek.ca>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="eT4X1ujPdsk8ugJq"
Content-Disposition: inline
In-Reply-To: <20251125223848.1798-2-jonathan@marek.ca>
X-Cookie: -- I have seen the FUN --


--eT4X1ujPdsk8ugJq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 25, 2025 at 05:35:32PM -0500, Jonathan Marek wrote:
> This allows playback using the WSA_2CH AIF, which feeds RX4 and RX5 on bo=
th
> WSA and WSA2.
>=20
> RX6/RX7/RX8 can be tested with the regular WSA AIF (the 3rd intf is RX8,
> the 5th intf is RX6/7).

This doesn't apply against current code, please check and resend.

--eT4X1ujPdsk8ugJq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmk+kywACgkQJNaLcl1U
h9AHCAf+J0hVdJmLHtreA3iP43lWhh1jQak9lrRRHJ8QYyPjNznB9n3lzUTrrs1z
EAy8CqQhqXEWnhcNnmEf37EiBEWu4fMCmW0T1KEb6tm3YRkia4DpFG8XPfumnXdE
+9Gsudx34Ykr/TFlaKNfHJpNvzV8jbpi8TEEdhpGjkHjLWqPF6RpD0Z2Y7/Ei491
tGX7M0AwvY4w2w1LnMqTnbodlvKSycOvn4yraNjX2H99LyUAC4qnpfg/FQVOBiBr
06VjNKKnFWJ5VauM+nZQKxMr/9kSB0+fvM8lmhgEKakOtvPmwxASDSfQnW4ptnXT
6l3Ixdt5OHCjRptRO6DC+iu9TZPPQA==
=JhlX
-----END PGP SIGNATURE-----

--eT4X1ujPdsk8ugJq--

