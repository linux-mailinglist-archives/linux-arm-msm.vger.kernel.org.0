Return-Path: <linux-arm-msm+bounces-22907-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EBD990B543
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Jun 2024 17:52:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B55C3B421C3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Jun 2024 15:42:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E37415532F;
	Mon, 17 Jun 2024 15:11:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ApXnwqAB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50A9C153582;
	Mon, 17 Jun 2024 15:11:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718637109; cv=none; b=jQ1ZLVZbFohvRkgp0K1BfBgPbeuVX5Ftc5lSkF5Uah3qSaCo43+cSYerkncSzfUSYqgBavvM9nc3VikcsT+yk0C7xp95qaegAsocnqA4IdNvGtBpDqIJy1x1T8LCkfSjvSIKsV5xS/7ThlyHp7Q5cY9VOvUS03t7C9TrOgcIxOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718637109; c=relaxed/simple;
	bh=c2l65HkG5wWoE4gvFa3Xd9MQQwsOzngmzKfqDFLx+BU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QmM8o/5GPZHBUa3Z/T05GPkH2XWF40uBP/ws7yxjv8gZT4wSmXkLXD8Uz5qJJJHwOYvBr9K1XwiEUCDjsPnkIyKM42Hkp99EU1Vgfcb4PTOjsHJs/mgrlVszjhGv9CZqA//bB3KSeCwUHS4ZZ1u245K7vMPTszzcrq7HkNZzuS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ApXnwqAB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82B13C2BD10;
	Mon, 17 Jun 2024 15:11:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718637109;
	bh=c2l65HkG5wWoE4gvFa3Xd9MQQwsOzngmzKfqDFLx+BU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ApXnwqABH87245LT9xnbQPQulb1S2YrlrNw7q/uLmCi2Dzp7mAGeCUmerFoG3pEGB
	 3foWtSFA1S1QOLSndaMhXqEgiKtxK1q5cCa9xuurOvQ5pzvA2TAv4YU2bBECg182Zm
	 gr9pP7KEe5LKKE8QUboNs0oI94DDUuDt0FSBYiqVHw6N6zWw4FKvANg6pKTxtCmzwS
	 Ths7xKFjeSv6ZK8zUBs/Lz1bRfLad9yM+OXtjDsDDe2+sksYfImWbHjBxXFkO2Nj61
	 6zF/7j/XYkPAxnoDOU/10YoSqEEbDG3VriZq6hM30T9tdTaBhQrNuYq+gZv8y/oVSk
	 XkCohegN1aLww==
Date: Mon, 17 Jun 2024 16:11:42 +0100
From: Mark Brown <broonie@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Banajit Goswami <bgoswami@quicinc.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 0/6] ASoC: Few constifications (mostly arguments)
Message-ID: <c170d555-068a-4927-b997-df74cc88386f@sirena.org.uk>
References: <20240617-n-asoc-const-auto-selectable-formats-v1-0-8004f346ee38@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="1J3/j5gC6/pQaKDG"
Content-Disposition: inline
In-Reply-To: <20240617-n-asoc-const-auto-selectable-formats-v1-0-8004f346ee38@linaro.org>
X-Cookie: Life is the urge to ecstasy.


--1J3/j5gC6/pQaKDG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 17, 2024 at 03:03:18PM +0200, Krzysztof Kozlowski wrote:
> Make few pointers in ASoC functions as pointers to const, so the code is
> clearer to read, a bit safer and allows further constifications (e.g.
> placing some data as rodata).
>=20
> Best regards,
> Krzysztof
>=20
> ---
> Krzysztof Kozlowski (6):
>       ASoC: Constify of_phandle_args in snd_soc_dai_driver
>       ASoC: Constify of_phandle_args in snd_soc_dai_link_component
>       ASoC: Constify passed data to core function
>       ASoC: Constify DAI passed to get_channel_map
>       ASoC: Constify return of snd_soc_dai_get_pcm_stream()
>       ALSA: Cleanup trailing white-spaces

Why is this random ALSA patch which seems off topic for the rest of the
series mixed in here?

--1J3/j5gC6/pQaKDG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmZwUi0ACgkQJNaLcl1U
h9BMQAf/bJSvIQSVTUNlyDYtm4cJXPIGSd0VJpZ6L3QlT+3fER4Uvg30WJxer5l4
ezqeVpZ1pszgFgRbXW2fnP3gZTj1rHGdJNn4A7A8fPZQ6wSmpIwmXA3I+Bq1SNha
00ei+bcuvA22oRcvewGoITM9Z3fKQj84xGuyD5yTW0xQM6T06b/d+C+HuRMwxBNI
Vg5TL6LTAW+Xr4mQOQYAzWXVwrZ9sDL/4P4M+BVUJZp3N8SjMclxtF9uL5NZaaKp
LoViWMYrRW6WV13dnalrsdHNZ7dcH39OG0wITHq/Ci3vJgHXtskc+xHYexXecqPW
XKWaaMZjFh5IPXIZWLkmGN7UY75I9Q==
=NmAB
-----END PGP SIGNATURE-----

--1J3/j5gC6/pQaKDG--

