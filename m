Return-Path: <linux-arm-msm+bounces-82400-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A90FC6BEF3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Nov 2025 00:04:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 47F713664FF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Nov 2025 23:03:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B41E309DDD;
	Tue, 18 Nov 2025 23:03:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aaApqOOB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 214F7370304;
	Tue, 18 Nov 2025 23:03:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763507007; cv=none; b=RZDDtxmljGBP/GXkLwBIaOjzcG+KKUS4OrC570aa4egZPTsq6Vrl9DgQuUzl9t6Zgi8RpecSvwDXTjUI+b77Dl8zt+I+NkhTwMw6v4LX/Qm7ZRFsgBXd1JHZPyYDStxj2qAWQxbefkeySDaV6JuWgVY122n2OuYGaJCEIre2o4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763507007; c=relaxed/simple;
	bh=XkywBLtoD0xk1hTLGDudaE3iAcoUDHUPzYNbUjT+qEc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dQOEfBiMp7AIfEVbSlcVgzl/Do6b0OxP3J96pBhDMJDThH71zB+XLz/+/4tcQHK39aJiTo/j3x0yuuaJw7iDsSPQWPJlR3uTu5LCk91sclM8Vb2NfohBzE6SuUlGIfMV6TDoyquoJDhXZfdGSvEH2Ci4NNoQa8G60dOlO+xDdec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aaApqOOB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3455C2BCB5;
	Tue, 18 Nov 2025 23:03:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763507006;
	bh=XkywBLtoD0xk1hTLGDudaE3iAcoUDHUPzYNbUjT+qEc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aaApqOOBMQW2bzy1Y9+TgRd9tE3BDsHhIsHGYpTpB1+KZzOXD8efxAVWOtQ6rXCyr
	 uFV9GyEDDL81XbKPK0tWsuwlVwUqKwGLsOYPvW5yO5FJyetE5VaACV1otwor//0Jxf
	 OEbTgCA3yidpO+sAa9J9LKPJLpOBLN+QTOjQmhe4czgyPqzWWKqQGLCxeynUrmV44S
	 1/1I+gGrcE4q8E64FbltzktAYF3/lKRRLb2TU37dsCUAUhyfrWyCRMIZsg8nEJuWZP
	 3lqs53bxBnC8cjiN9g3z0kxd89RmQmfLdDlArrzezQ5iiSvoOatzO8pcSyN6KarhEl
	 2EVqJbtn9dEkw==
Date: Tue, 18 Nov 2025 23:03:17 +0000
From: Mark Brown <broonie@kernel.org>
To: Ravi.Hothi.ravi.hothi@oss.qualcomm.com
Cc: Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel@oss.qualcomm.com,
	mohammad.rafi.shaik@oss.qualcomm.com, ajay.nandam@oss.qualcomm.com
Subject: Re: [PATCH v1 1/2] ASoC: qcom: q6dsp-lpass-ports: Add support for
 multiple sampling rates
Message-ID: <be7ade15-4c1e-4226-ae0a-cd58a2b9f07b@sirena.org.uk>
References: <20251118100203.2751955-1-ravi.hothi@oss.qualcomm.com>
 <20251118100203.2751955-2-ravi.hothi@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="098nAFd0sqxK9khv"
Content-Disposition: inline
In-Reply-To: <20251118100203.2751955-2-ravi.hothi@oss.qualcomm.com>
X-Cookie: Microbiology Lab:  Staph Only!


--098nAFd0sqxK9khv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 18, 2025 at 03:32:02PM +0530, Ravi.Hothi.ravi.hothi@oss.qualcom=
m.com wrote:
> From: Ravi Hothi <ravi.hothi@oss.qualcomm.com>
>=20
> Extend the q6dsp-lpass-ports driver to support a wider range of sampling
> rates, from 8000 Hz to 192000 Hz. This improves compatibility with
> diverse audio hardware and enables better flexibility for audio stream
> configurations.

This just updates the constraints, it doesn't change the actual code at
all...

--098nAFd0sqxK9khv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmkc+zQACgkQJNaLcl1U
h9C3pgf+JbocknCjLFJHyI7s/13fFiR3QXSwqATowoPFE9AV0dj4Wn9AD+yEENuv
RSXzyQ3TFtJMpcdRNLD5Tl0do3AwybzbuCZrLEZoGTaPDgOl+vcjvsgNNs+HX6/T
70xiTGsrT6P2xfZsIPbR487EB2/O11G0yYrkLRTzQuZ6Om99NIFo/xwYBT4E16Q2
bgbyEr/Pem3Slc/FjxDSV9aDZUs4+CBAwOT6+dz6N9gRbKK7IZ+4zwzP0NJgaZ/G
ynm1phmpcsSjwXvwE9kR36kYMo3zokknQq/ZROShyPLsL02k1DIDY1AHN17dKcxT
AaQwUaopwPZlJNpcvJUUfCGrtJguiA==
=gdu/
-----END PGP SIGNATURE-----

--098nAFd0sqxK9khv--

