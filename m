Return-Path: <linux-arm-msm+bounces-46773-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C9555A25C1B
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Feb 2025 15:19:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A17777A1095
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Feb 2025 14:18:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1AE9206F31;
	Mon,  3 Feb 2025 14:17:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hsbLVYdg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 952EA206F2E;
	Mon,  3 Feb 2025 14:17:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738592276; cv=none; b=OhK1W9yA3ZNmm/atPKVgmAswfH4qaLUizSoKnVhK6AjWk0o8hDaO/MkC0Pj9dfgQ0P77BeVPRX9q7VM53gdo2KYPicTVNxm+xYmTytJAdRRJz1lZjOyj3W53R63WyFlAQV5ijnoiVQzRNOoJtnoHowmtfYwycsRvXxgu6ViItEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738592276; c=relaxed/simple;
	bh=KfS/JD9C4A/6ZT6Qa6x6CyN3TMhf1bolIfmaTKBMMEM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=au5EA7c84e4GIGb6MvhSaaOQPiIxQlxwUrSZiKVYcJpbG/mblsUO4QplnOOYwPMc94WreMvxcsIvtZ6i98Jxv3hLfW/AAJANp/RmuNW02fexF0amzxYGQ+WgUVVsHrk9c94FG+LJAbOXZKLIS/vdQI4AHeb08QYvUc1bTp5KhpQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hsbLVYdg; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0683BC4CED2;
	Mon,  3 Feb 2025 14:17:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738592276;
	bh=KfS/JD9C4A/6ZT6Qa6x6CyN3TMhf1bolIfmaTKBMMEM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hsbLVYdgKEYFVjnBlhKWtcrGJDEwjmxvvxLe9tmIeWt8uZPlSl4fKGNGsZvIXbtr3
	 kA216WMura6/5t7SRjR9cxgdA6vLA2IR84B8kRaSvPaAPxbb94NH0O8Rd7xvO7+iSD
	 RE+gSyIopu8jg0wdDoXhUdPob5/RK0sX5hJKw6NNmUtuxodKnew9qrMZlPFN9sd0jr
	 /13APIu9TV6fDLacbfbBKq3UONAqJ2i7yhahokrk45OQ5Xe841n+Rh+lnnf4ZCinRB
	 YpqRPTfGBKOWONRXE6Yz6Egdoza+pu2JcXevh1xmuD/m5bkVVFnxdJYZ1+l4Xw9IgC
	 iArdBTVtCyW8g==
Date: Mon, 3 Feb 2025 14:17:51 +0000
From: Mark Brown <broonie@kernel.org>
To: srinivas.kandagatla@linaro.org
Cc: lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
	krzysztof.kozlowski@linaro.org, pierre-louis.bossart@linux.dev,
	linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org, dmitry.baryshkov@linaro.org
Subject: Re: [PATCH] ASoC: q6apm-dai: schedule all the periods before we
 start streaming
Message-ID: <357e28eb-f245-4647-8e10-79805b53731e@sirena.org.uk>
References: <20250203124945.11406-1-srinivas.kandagatla@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="crr5sNuMC/Xk+up4"
Content-Disposition: inline
In-Reply-To: <20250203124945.11406-1-srinivas.kandagatla@linaro.org>
X-Cookie: May your camel be as swift as the wind.


--crr5sNuMC/Xk+up4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 03, 2025 at 12:49:45PM +0000, srinivas.kandagatla@linaro.org wr=
ote:
> From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
>=20
> With the existing code, we are only setting up one period at a time, in a
> ping-pong buffer style. This tiggers lot of underruns in the dsp
> leading to jitter noise during audio playback.
>=20
> Fix this by scheduling all the periods, this will ensure that the dsp
> has enough buffer feed and ultimatley fixing the underruns and audio
> distortion.

Should we be writing all periods or just the minimum number of periods
that's configured?  Userspace might not have filled the whole buffer
yet.

--crr5sNuMC/Xk+up4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmeg0A4ACgkQJNaLcl1U
h9BN8wf+PjEJmM0/8pYEunQoONvWTrndgx6AwjbcB7F+vMTH6tWijCwbsL3wbneB
hudvdqHgxTFRAssblwKo7hMptN1qtwDAwDyeQWpaBmwCbrr9bsV+mkp+T/p0Tt28
tbdU4rjH+27PdQWuuiqzidFFbqnSSJpjixFmIgC+YdHFUhaPWXgXpRwemnboYimG
0d1pk7kQXQZTVLHKuje+uycw4lK7Aghhx+txanq3sGjOBioFdgMTEOgDf9ZztK06
s6EDrgBZc1i2a+xemBz+rubBljk17n1luLwFOqaQU1D7NzmF4nmcyJPfGwCAr0J+
DBcM3ORl/2Mqf1eeh/U4zMz1OKQvcQ==
=lNzu
-----END PGP SIGNATURE-----

--crr5sNuMC/Xk+up4--

