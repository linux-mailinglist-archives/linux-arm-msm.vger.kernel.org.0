Return-Path: <linux-arm-msm+bounces-52877-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F24EA76604
	for <lists+linux-arm-msm@lfdr.de>; Mon, 31 Mar 2025 14:32:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 119B716B22F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 31 Mar 2025 12:32:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 312FD1D7E52;
	Mon, 31 Mar 2025 12:32:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MoiHZIVB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 023328BEA;
	Mon, 31 Mar 2025 12:32:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743424362; cv=none; b=G7Yp2ug+A9bQt0C9pitP7gYd5RxSZ6jDWbn56Ay2gGrNRbtgSAohra3IEd09uZsutB2A+JoiNmU2lhXF39egvl9A/ltbL+BPodcY1e4LIKcwkxoV171vxUKEtQk+yHxRqp4zNhW7jARVWKdkSkqwCvCIU2P0gjDFbUiagONuUcA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743424362; c=relaxed/simple;
	bh=/9UMxV9C0ZFWNA4MVNHGM2B2ubXASCVpghnMfKCyzKM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kxKqAkiHHFRU7+626MYXi6L6gu1QGLtXXnsv9zkQ+H7yIwRnKf3mwd24HZWHWrfG8q+mwE3zesgjJkoUVVNoUUiW6uenk/OTuUBbTn6KwhUMfhX5eYQQyrhONfGEs4VbsPwt5XEQVN4D1y1Fq8uRIVtUBx0bwcfr/Xp8AyFfuuc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MoiHZIVB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C1BAC4CEE3;
	Mon, 31 Mar 2025 12:32:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743424361;
	bh=/9UMxV9C0ZFWNA4MVNHGM2B2ubXASCVpghnMfKCyzKM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MoiHZIVBQb/9TMsKfoHq+WnMNahoZTf3g7D7ioteQ8vjUhDp9YpQ9mR318QbHET8w
	 PShRG0Ly3siL7mauHHNJcyulEtBDXXDpsjzwal0bUueW5OvocvjX8ZH3f7bxiL4wO0
	 tVjiRSQ/6PmQ8iecFBRDZ/O2qm1WOfkBb5ZYh9z/RJYcvYp3HxsUTvqyWvh0mn+yS9
	 wGRSvYdj6RLqu1wQtexX1+HQ09+UDuMkuufrsEwfruI9ACPLMAZkDmNobROkCPyTv+
	 m9HahQlW8NyrcjnAEyNAJyny0OtqVDI1suLchwIJU/iNugq/ekws5+RZt2mypVRGkA
	 sFbTXJL65Ar/A==
Date: Mon, 31 Mar 2025 13:32:36 +0100
From: Mark Brown <broonie@kernel.org>
To: srinivas.kandagatla@linaro.org
Cc: perex@perex.cz, tiwai@suse.com, krzysztof.kozlowski@linaro.org,
	linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org, dmitry.baryshkov@linaro.org,
	johan+linaro@kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH v5 3/5] ASoC: q6apm-dai: make use of q6apm_get_hw_pointer
Message-ID: <74214537-ad4c-428f-8323-b79502788a66@sirena.org.uk>
References: <20250314174800.10142-1-srinivas.kandagatla@linaro.org>
 <20250314174800.10142-4-srinivas.kandagatla@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="NhPuFL6AeQDXhXJO"
Content-Disposition: inline
In-Reply-To: <20250314174800.10142-4-srinivas.kandagatla@linaro.org>
X-Cookie: The Ranger isn't gonna like it, Yogi.


--NhPuFL6AeQDXhXJO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Mar 14, 2025 at 05:47:58PM +0000, srinivas.kandagatla@linaro.org wrote:

> Fixes: 9b4fe0f1cd79 ("ASoC: qdsp6: audioreach: add q6apm-dai support")
> Cc: stable@vger.kernel.org

This commit doesn't appear to exist.

--NhPuFL6AeQDXhXJO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmfqi2MACgkQJNaLcl1U
h9B2hQf/aTPSvZufhdBJPko/DP5CQ2MYquv5UUlKDt22IED+7oDOBo+Juy31hak1
jajqojGdU8TgEDE4vc5/h5Lghxw290CVhBFqClvO3nqYT3p5d0xLX+6ZB0di9sKn
oHqg0nXNKZxyFVlDyOLnhVdGoTR6KWHflOkJTMfkzOdE85BiK/OZkCz4OAnPxXYM
pfbquVMOcAKIWt5RAU3oa8ooyPkpKf1Z+68deC09Fk6yCn05M/P6d2k6EbVX7cH7
DTRBVhPRM6Zn++MuHrZ1V88FdnNceqIS0HHvHFF5ZJ+c9V5cdwxbEX8TXIwsu6dE
fc+Pjtqloz2Q5/SydNopsRcqKlaDsA==
=gxJU
-----END PGP SIGNATURE-----

--NhPuFL6AeQDXhXJO--

