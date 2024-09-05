Return-Path: <linux-arm-msm+bounces-30946-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 66D2E96DB8E
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Sep 2024 16:18:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C8550B2345B
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Sep 2024 14:18:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D58D919EEB0;
	Thu,  5 Sep 2024 14:17:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="andDZzaP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6AB419E98F;
	Thu,  5 Sep 2024 14:17:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725545857; cv=none; b=V9GQ4Qi1GPVBbM5jFwSJHI/feKUheUNNpx9zbtaQu+P2AL6BpUSYtBiY2XEbyEQCLnC9dNnqvPTpu89JBpH7uD+IDbgroHtVFd78tInAIe9jXvX3vsIRaBcNlEAEtkM7ckFGSHjMFr/poXvfWUwm+kxATJ0lH347aOuzA3kC2QQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725545857; c=relaxed/simple;
	bh=VqQy8KfKmVgPTGbG8DNpb8zbYk8Nc0D2lgFnKi69kn8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s9+h0aCzrdHtgEpaScJecTir0DD5nHNqsjrljUyuplw5YC8ovpOpoPn/6xj9WrZZcb4vTnc8e4Sa3C9D25qaQ4VUAqXQ/NwRg/7p3fjTsT+llvRPk84vArTu6RaXuQBP3hekP0n7/dgm7Yq/j3dAZYy70Nq7Z1DlXfXSfeyMk8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=andDZzaP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A541AC4CEC3;
	Thu,  5 Sep 2024 14:17:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725545857;
	bh=VqQy8KfKmVgPTGbG8DNpb8zbYk8Nc0D2lgFnKi69kn8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=andDZzaPhYZMZgV6Ut5i5Ns/LKGNLi/g7c0Ojq5UbJczxdxaq9euO+qT/qKkPg9PI
	 5Q7JN9ERfhEAwiEnTLxOYYdapOFegv4+6hOlgMYYNE03nYfIWP4zyvVB/SsygAwgoh
	 OyhO7Tp72ejapkrrhVTspxSs4mjaIqVlNxgNWE6FNvOPCq7L1bQlyQiqzTLBXURZia
	 5tgem0TV6DR1XucnCmJK4KEptn+HnrM21FHLVbxpdRSKvpnUZ6IfnMB/d+1H7NBhGF
	 KXxEwPniE54XJKJcpbjR3RUCe+xQQ0zp2uoWz8gLmR5ToYn3C+ORfLnAnh3xak1pU5
	 /uJJyQFjNk67Q==
Date: Thu, 5 Sep 2024 15:17:29 +0100
From: Mark Brown <broonie@kernel.org>
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	David Rhodes <david.rhodes@cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Liam Girdwood <liam.r.girdwood@linux.intel.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org, patches@opensource.cirrus.com,
	alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH 00/13] ALSA: update sample rate definitions
Message-ID: <81e3d628-cfca-43b0-9af6-de2a3c606a39@sirena.org.uk>
References: <20240905-alsa-12-24-128-v1-0-8371948d3921@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="uuNJXLNXUva0AK+X"
Content-Disposition: inline
In-Reply-To: <20240905-alsa-12-24-128-v1-0-8371948d3921@baylibre.com>
X-Cookie: The horror... the horror!


--uuNJXLNXUva0AK+X
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 05, 2024 at 04:12:51PM +0200, Jerome Brunet wrote:
> This patchset adds rate definitions for 12kHz, 24kHz and 128kHz.
>=20
> It is follow-up on the series/discussion [0] about adding 128kHz for
> spdif/eARC support. The outcome was to add 12kHz and 24kHz as well and
> clean up the drivers that no longer require custom rules to allow these
> rates.

Acked-by: Mark Brown <broonie@kernel.org>

--uuNJXLNXUva0AK+X
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmbZvXkACgkQJNaLcl1U
h9Dcdgf/ZQoGyidIWQUnoePm2VX00vw06P9W9aOo2sqjGlu4flrG6fH5N+tv92vc
hX0ctx0G6C1f4iafWkIPCjHVecaWETi2yb/hpKpSPTy0nFrEBN06Zl02mDSa3jfs
ngxTVhHYUMoS2ZMRR9dAy3XgnVgZS9Lccvvq52mEYaxh1G+hzi3HEDgM5oWZPEaI
CcqzVwxRaRokIAZO3prOKdX4rMXG+Nz7kSFb/Hx9/K9H4jYwgwFyKJ2TV3H7fVYM
767vMvyA1T3nKRZ1yiZfYWYYIf2rs0h7iQxgjH4Gzb9575MFPOiqAk4/pIYcvVKj
hf1swcI9kcYqQrgoLzqE82HPkErNaQ==
=WnP9
-----END PGP SIGNATURE-----

--uuNJXLNXUva0AK+X--

