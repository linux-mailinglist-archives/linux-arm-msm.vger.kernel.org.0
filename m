Return-Path: <linux-arm-msm+bounces-46789-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DA9AA25E27
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Feb 2025 16:14:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E14873A9384
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Feb 2025 15:07:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B69722080EC;
	Mon,  3 Feb 2025 15:07:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="J8biLreJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88F1C1E493;
	Mon,  3 Feb 2025 15:07:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738595247; cv=none; b=dW05tAx19a5tpcSPBjJ3z9PjR6MXEA3bZo+9TxNNJ2Tf4wCjGWPjPQMqOecITNFi9baS2Ef/SSyNdHQ1NGF4hbN+1qaeBExBLzBBBAMsbzCnEDiKiWKRXt+AgzFXasa1dTMgeitOZPtkQCNtQVu2JZUTICh1BguuZXlXKUAtaVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738595247; c=relaxed/simple;
	bh=QribRiGaUqW5JW0Nku/kRgIHHe/W76K2SrolOsyJDv0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OL2fUQwwLdCkJwkcH7xamCQMT7cVFYPkLEKjcCj3ZipiYPFXnoSplVDCjrVy5SzfkiEK1b7Ll9jsJe0NsG27oBP7jpPF4GBz/UUxv+NkP6lm5qaKj/5AandkhvqRZ3HR5m9dpCiBz9rPm49C75U16UU4/N+zpy2L03Y7GjvniKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=J8biLreJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42F7AC4CED2;
	Mon,  3 Feb 2025 15:07:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738595247;
	bh=QribRiGaUqW5JW0Nku/kRgIHHe/W76K2SrolOsyJDv0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=J8biLreJ+zl4vnwurVvuiJjqwCTVPQW+g2Qb6U+uxPq9AN6fWn3S6rIIKluqhm8BD
	 /xSVlRdmC0S5//OmogjBnaGhYxWYl0WHOl0o1j49CdSK5/BTd1s8C96owOnOhq+DxD
	 0zG42ix9UNeYrfU1+kiGHiSKq20wOdPEnzwyO19dl9tYNCj6g1HNTZdEZDH9hzIBUP
	 75qpyraCR++PoVSUCVGGTNpY+lGzT3TmeTCdATOOwMiEPqUa6dFDLfM7TmFp+hX9r0
	 3eOrEFN46AnQOYmMJcitFmGY0eTKfGpZ9eBhYpsCNreOAKP8VDc5OdyRA0Mo5WWIQk
	 YyPmQEgrUZYww==
Date: Mon, 3 Feb 2025 15:07:22 +0000
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
	krzysztof.kozlowski@linaro.org, pierre-louis.bossart@linux.dev,
	linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org, dmitry.baryshkov@linaro.org
Subject: Re: [PATCH] ASoC: q6apm-dai: schedule all the periods before we
 start streaming
Message-ID: <4678ae0d-434e-4e04-bd77-abae1969ff6c@sirena.org.uk>
References: <20250203124945.11406-1-srinivas.kandagatla@linaro.org>
 <357e28eb-f245-4647-8e10-79805b53731e@sirena.org.uk>
 <35cf66a2-05ef-4e49-a146-ca96ab19fcf8@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="mzMOcDtz8JcxuGvr"
Content-Disposition: inline
In-Reply-To: <35cf66a2-05ef-4e49-a146-ca96ab19fcf8@linaro.org>
X-Cookie: May your camel be as swift as the wind.


--mzMOcDtz8JcxuGvr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Feb 03, 2025 at 02:30:26PM +0000, Srinivas Kandagatla wrote:
> On 03/02/2025 14:17, Mark Brown wrote:
> > On Mon, Feb 03, 2025 at 12:49:45PM +0000, srinivas.kandagatla@linaro.org wrote:

> > > Fix this by scheduling all the periods, this will ensure that the dsp
> > > has enough buffer feed and ultimatley fixing the underruns and audio
> > > distortion.

> > Should we be writing all periods or just the minimum number of periods
> > that's configured?  Userspace might not have filled the whole buffer
> > yet.

> Just minimum number of periods or 1 period. We are queuing up all the
> periods to the DSP, so that we do not have to wait for period interrupt to
> queue the next one. This significantly reduces the latency in queuing the
> periods to dsp.

What guarantee do you have that the data isn't garbage?

--mzMOcDtz8JcxuGvr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmeg26kACgkQJNaLcl1U
h9DitAf/bYF2gjujw9lNOQppAbEPmN5RCHZN3eAqU0X6CNt4iSyf3L6zU9D4UUpQ
Xdrh3jo5U/bJ935lFESzN4824ajFOv8hglYDsKMaV5TfdgZw+aAtB3ZqU/iQ1kjS
pINp1pWfS2zJnqAPPW4ch87eG3fPZbIRcYpgDxOyFSAsU2ibUpiTqiPuHOAEdSEh
s/lo48W7ylskoINKHXRaCy07FCVjcl25YV40cl6ZhlBo3s7YBBoZ05vjjdy9Qi2Q
AYDc/j7XndzwyNNLQ6QjaFWF401g88jl89ztr+SLS5dATHaB5DLAaJq404LmR6Jk
qoHCkK1VzEMBru/QWmycgQUZG8eiVQ==
=DGlw
-----END PGP SIGNATURE-----

--mzMOcDtz8JcxuGvr--

