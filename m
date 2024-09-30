Return-Path: <linux-arm-msm+bounces-32798-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EE88498ABD0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Sep 2024 20:17:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A06C6283684
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Sep 2024 18:17:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3888219AA6B;
	Mon, 30 Sep 2024 18:16:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FbXBYXkY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00BA419AA4E;
	Mon, 30 Sep 2024 18:16:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727720203; cv=none; b=HYc0v2ICUZ+oz+KQl3IJz44uFWFeqFgd5rdkE797pQb21tmrJXbwIgbQLpMaCx+FBdnsuUJnSS81KaPWCiCuNKCaN/B3XQeSHqVjIReOD4ZtKwhyj5e/BAvra+rxiXrYr2y6+hoJ/TTawPXJtfw+c8ADgSiPQzyzmYkGkgYISYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727720203; c=relaxed/simple;
	bh=VCrdlTntQ95qWL4t3QB3ipBkFH7QItj4R8rGZcyzAFg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F0aro8sfyU9CVhMr7zqTDgbNPpSGupvVAWdza/zl53URsAH7HAJQ0fzXFb6As2sRSO5FmxWjqLnTHAEZz3d+H17/MYPLtx31VeO2YO9u4GVxgHIElu6ZougiEYsx8xhYCk3LyKes8IRA/7N1eeCwfZmxO4w+mc5vPyd29RhLDwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FbXBYXkY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20242C4CED2;
	Mon, 30 Sep 2024 18:16:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727720202;
	bh=VCrdlTntQ95qWL4t3QB3ipBkFH7QItj4R8rGZcyzAFg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FbXBYXkYLYvrh5wG2uXVkbjroBgW6xudVIdZKZK/qMgkhcvz4jJHNn2FSegxq7z/f
	 EqWLXm/fSNOkfer8ouNRxcy89yBB/FdN8rAjCBT9i53OmEGeZN5seCoN1iLjxhnAZ1
	 xNfCk0eQhs1WLspsws4mb1X7z9vQyAHOBh1eDULa3GeRA46pQuphSzPk4GP0gdN5vh
	 Y/EF3uh43sa97IO28DAnhm2/V3ulcPLk6qrmy8JIHGOM/5KVV5E4htlSmMlJEfniJm
	 ozhMU9XTNyZfrfPWMSClNkrfqwwC/rlkPS2FgTOVi1SqG3pOMtw4WLoMFyyKr9DHaE
	 rWugP43xSudvQ==
Date: Mon, 30 Sep 2024 19:16:37 +0100
From: Mark Brown <broonie@kernel.org>
To: Markus Elfring <Markus.Elfring@web.de>
Cc: Zichen Xie <zichenxie0106@gmail.com>, alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	Jaroslav Kysela <perex@perex.cz>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Rohit kumar <quic_rohkumar@quicinc.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Takashi Iwai <tiwai@suse.com>, LKML <linux-kernel@vger.kernel.org>,
	Zijie Zhao <zzjas98@gmail.com>,
	Chenyuan Yang <chenyuan0y@gmail.com>
Subject: Re: [PATCH] Fix possible NULL Pointer Dereference in
 'asoc_qcom_lpass_cpu_platform_probe'
Message-ID: <75ec53cc-ffd7-484a-8c98-d02fdc6aa847@sirena.org.uk>
References: <20240930011521.26283-1-zichenxie0106@gmail.com>
 <30cfc980-3b38-4e98-a753-b149746cf93c@web.de>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="6M3j18/8xJpvc7f0"
Content-Disposition: inline
In-Reply-To: <30cfc980-3b38-4e98-a753-b149746cf93c@web.de>
X-Cookie: My EARS are GONE!!


--6M3j18/8xJpvc7f0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 30, 2024 at 06:33:49PM +0200, Markus Elfring wrote:

> How do you think about a wording variant like the following?

>   The result from a call of the function =E2=80=9Cdevm_kzalloc=E2=80=9D w=
as passed to
>   a subsequent function call without checking for a null pointer before
>   (according to a memory allocation failure).
>   Thus return directly after a failed devm_kzalloc() call.

Feel free to ignore Markus, he has a long history of sending
unhelpful review comments and continues to ignore repeated requests
to stop.

--6M3j18/8xJpvc7f0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmb66wQACgkQJNaLcl1U
h9DDGwf+NnAvu+yXZ+1Avz8syo7V5EvlIz6QlMOuUMIW5mOBY1wpiVTxRqJinUHv
MlwzXH4ja6NFSOI5xUJrrAMzIV5M37iY9gxaY0t4Ru9XVjzdDOT2pzL3ZiZp0j7O
xOg3+xKjw6sHxppNuRhji9T29qDn+qgERfqdyA4BxRDLmoMd2QODPVG8DuYBOdXu
XDKLYRLvMl4A6dhfVHyg2cegHSFf5TRe9/SwkTM1D53Ir4AI1DYALag5FZmZVXJD
3v7akWseVADudrgmGLgj7g837Bvcut6qLDNMI4IcPKSoT3OlqF0BCSKsZfjDh2A8
F66LwOaBNHCrbOgm3KaFRt0n6ldyBQ==
=r1s9
-----END PGP SIGNATURE-----

--6M3j18/8xJpvc7f0--

