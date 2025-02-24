Return-Path: <linux-arm-msm+bounces-49171-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9289EA41FFA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Feb 2025 14:10:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E0B153A25D5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Feb 2025 13:10:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 834B823BCEE;
	Mon, 24 Feb 2025 13:10:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NUti6LwS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E6B5802;
	Mon, 24 Feb 2025 13:10:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740402634; cv=none; b=VthaZbnQMzouKjhzhjmIPqe4aXIXej38gcdHfmlqtRyyfaTWaQ9I3ScVzryytb7xvPd0xfgwax13sbKTX/7pv07GlF9PkfnRT1ghC6n2WiM5MUg5h13jq7tjguFXtQQ8H+WuDKZQFy5Xeomcev0wtGg3T1wEj/ySt6TkYmfiPx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740402634; c=relaxed/simple;
	bh=jPf0vXxulqNG6ytq3OL5NdOLGT2lPoxZa/EG3YOU4aw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r6n6w1kgRzL0tH1TkbW5w7fJUUkaqVf/5WAtcZ5f9w1Tt9bs6DZk6GeQL2BU5yV+RaRXR8olbotBsUy2wNuCy5FihGz8/rYq7uY44og601xFXVyBy+x6Zh0VJSPCMrxYE8IPve6CSevOBCqO6YQqAAPNmhXcYXGC7PupeivwfmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NUti6LwS; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C739C4CED6;
	Mon, 24 Feb 2025 13:10:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740402633;
	bh=jPf0vXxulqNG6ytq3OL5NdOLGT2lPoxZa/EG3YOU4aw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NUti6LwS7LTYgKmWPyzFtgg6oVMjVZlV1jziVZ519FEEfn5qL9RHnGwPcNEkEjcdT
	 qENtuACV/K6DbOiyToZNyoHELTHvfQRYTAvt9jsDDphwjqRjkF4PRx7lFZpo2I3k/x
	 mITxUxntqJlp+eTbuJ8mSxztVdiAyt9TvzMsHh6y++LpiJI9UR8ye5axCMrrSlVLy5
	 xVQg/3+aKshduOpMz1EJGa/nYdN6huEAdrGP1OExCYqvSVZiKz5uvtJDlQJm183of6
	 wqDgUblpWNkm8tIOLZF51p3M6PMCP+9hZiMDhisNgP3NTksMeyUW33Po4kIk/G2O+j
	 AkSbPSf93laFA==
Date: Mon, 24 Feb 2025 13:10:28 +0000
From: Mark Brown <broonie@kernel.org>
To: Markus Elfring <Markus.Elfring@web.de>
Cc: Ethan Carter Edwards <ethan@ethancedwards.com>,
	linux-sound@vger.kernel.org, linux-hardening@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Takashi Iwai <tiwai@suse.com>
Subject: Re: [PATCH v2?] ASoC: q6dsp: q6apm: replace kzalloc() with kcalloc()
 in q6apm_map_memory_regions()
Message-ID: <e3cbcff7-e7a4-4e7a-9c16-2d0a3b48d588@sirena.org.uk>
References: <20250222-q6apm-kcalloc-v1-1-6f09dae6c31c@ethancedwards.com>
 <c8cb0a78-c547-41dc-ac35-d569c57ebe3c@web.de>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="+4ATTtF2MzkEeXSa"
Content-Disposition: inline
In-Reply-To: <c8cb0a78-c547-41dc-ac35-d569c57ebe3c@web.de>
X-Cookie: Phone call for chucky-pooh.


--+4ATTtF2MzkEeXSa
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Feb 23, 2025 at 10:50:08AM +0100, Markus Elfring wrote:
> =E2=80=A6
> > We are trying to get rid of all multiplications from allocation
> > functions to prevent integer overflows[1]. =E2=80=A6
>=20
> Is an imperative wording more desirable for such a change description?
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/D=
ocumentation/process/submitting-patches.rst?h=3Dv6.14-rc3#n94

Feel free to ignore Markus, he has a long history of sending
unhelpful review comments and continues to ignore repeated requests
to stop.

--+4ATTtF2MzkEeXSa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAme8b8MACgkQJNaLcl1U
h9CHSQf/ZsdmPgAZ5W32WEQhd7Fc7ycWjp7hI7rXc8Psb7PTKQm9C4pIgdJw++cV
pNGXEj7rhsFIkXSQddNs4iSMEmkK9oRMgJ/6ujF0SaZ8wUtTC5ezUGBfMaJjzJBX
VveDIyuietqG1W11N7p9nI5sWHe1jiKbITNQC8h1RKnCEQw26UejNfOezHZprUAH
/ID4JDzhrape7zrzmGaMgFchnaAa9x+wgfbBOM3lFthYh2h9mLM2SpC9J71yRWGP
giQmkQILv0Y0NO8vaf6y8GDR+ApQrqOVgR8HIMphTtUnkAp5ssnUYTzSltoonIKP
aXtd/Y/GZxshL0jqQ+op8x9SheWYkw==
=S3dc
-----END PGP SIGNATURE-----

--+4ATTtF2MzkEeXSa--

