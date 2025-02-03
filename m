Return-Path: <linux-arm-msm+bounces-46804-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 65497A2615D
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Feb 2025 18:28:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EAC4C161F21
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Feb 2025 17:28:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C925920B806;
	Mon,  3 Feb 2025 17:28:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q/jny+d8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B827204C04;
	Mon,  3 Feb 2025 17:28:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738603682; cv=none; b=fr/L4K1tT+3CpB0Y65YHBFXxkMlWfYPZXvrmuWpqHofCgxSOLyYtztbarRQwHEFg9k736BsS43/qkOxyK9CWeh5RhKVpIk1b6YQRNyPaHhSX2S4C8IOWBVLT1RNyBTbWVjsV5CPWhgDfafhqw/dpS9e+9Oq07JzwZYbNgbSkn1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738603682; c=relaxed/simple;
	bh=wrS1Hp5q/BM4Xaq9gOcjCEOK2Cc2LefB5imi4hffaiA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LBCTEWJQS3D1dUPYa5A/C+gm32Uwomp6LUMcHAoFxfJ51PEeR8z8ARqg2dYcKBy+II8q34bZSrITpDk1D8EYNVVUhWvN+R3T1CXXbguYNcHswll4MKLBhqTBTXN5JrQfNQBo8RhE/3LFXfUuSP16bnrhMVK30X4a0SmvSBrprXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q/jny+d8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4B40C4CED2;
	Mon,  3 Feb 2025 17:27:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738603682;
	bh=wrS1Hp5q/BM4Xaq9gOcjCEOK2Cc2LefB5imi4hffaiA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Q/jny+d8CEXHTVNfcrRXnsplR6PFwCZD9hR0pmnEVtwPO2UNfA6rVK9cFlzyP8udb
	 rLbsxnFiIq/sPBbWK7gQXw7kjfFZGgprYLQRr/hvSSSgIf2m+ThPZXFAikvrbukHxg
	 YLlbIgx7c508SaTGf/xR3EpyAl9Rmb6lL+jg5wregpuogbfoLXhS1/8uhMUrEHE7ev
	 39s8PJY30frnQrMwKzXsBgN2VtTLTaUB/MGcMfa2rZ1mlmJx04XFROBGlxnPszrOvU
	 cXe95flpsgysufnXJnxuLk8w89LkQ96/C1FHwwc/CeK2aa+rZ7Kx6I67SpbO4vzxeR
	 Y7+yFsNUqNmiA==
Date: Mon, 3 Feb 2025 17:27:57 +0000
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
	krzysztof.kozlowski@linaro.org, pierre-louis.bossart@linux.dev,
	linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org, dmitry.baryshkov@linaro.org
Subject: Re: [PATCH] ASoC: q6apm-dai: schedule all the periods before we
 start streaming
Message-ID: <a792d3d6-d510-45e5-8464-b33a1bbe9a79@sirena.org.uk>
References: <20250203124945.11406-1-srinivas.kandagatla@linaro.org>
 <357e28eb-f245-4647-8e10-79805b53731e@sirena.org.uk>
 <35cf66a2-05ef-4e49-a146-ca96ab19fcf8@linaro.org>
 <4678ae0d-434e-4e04-bd77-abae1969ff6c@sirena.org.uk>
 <05263a45-5faf-47c7-9a32-eb8e5114e286@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="K8bmqEs9lYWYuukR"
Content-Disposition: inline
In-Reply-To: <05263a45-5faf-47c7-9a32-eb8e5114e286@linaro.org>
X-Cookie: May your camel be as swift as the wind.


--K8bmqEs9lYWYuukR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Feb 03, 2025 at 05:04:54PM +0000, Srinivas Kandagatla wrote:
> On 03/02/2025 15:07, Mark Brown wrote:

> > What guarantee do you have that the data isn't garbage?

> Yes, its possible that some of the last periods might be not be written yet
> by userspace.

> We can always add some checks on the available periods to queue to dsp
> something like:

Yes, you need something like that.

--K8bmqEs9lYWYuukR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmeg/JwACgkQJNaLcl1U
h9BU4wf/VPyBpmOIQTFdeE1OeA2hpTMAAOEKCNo9nSR1dUDIw34JtaUaFUTHhZLB
WNYq3nZ3BzXwI6M0aPxljRE8hTpNLpjZAiOggjMz59cIOym9QELulSEMUFqMAZ8o
C3jypJ+V4Aay3BPyc4lSWZX//YCbvFbiMtC5D0BCQUDNzBMRRYq2AYjg1J4pVXlX
aevmZxgHNRlG3ahO3AXZNRraewFAtCYEgFjTkMGkjWMUoqUwQPkqNTiJqj4u8vtO
xi3HXAsKwrVvE4h13WfoWigehjw+nRyLZ6KI31LbSVwvP7NqYj4nEkx/KmRH5jqi
39odOGVtF8sKRlQJJtRjsBLDtH50nw==
=MDEQ
-----END PGP SIGNATURE-----

--K8bmqEs9lYWYuukR--

