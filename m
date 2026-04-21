Return-Path: <linux-arm-msm+bounces-103986-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wGsJDErk52lXCQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103986-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Apr 2026 22:55:38 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 279D843F943
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Apr 2026 22:55:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id EBFEB3003BF1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Apr 2026 20:55:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0BF53DD50D;
	Tue, 21 Apr 2026 20:55:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dLa2acP/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC6682DC76A;
	Tue, 21 Apr 2026 20:55:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776804929; cv=none; b=c3qp1lrV4o+l3cuMc4RJemedUnPM3AC/EGdC5Id7IRdUebYdQm7YYa9Z8EQXrf9Cb/3J8Ei/iTdSqjfcFyY4qW7HubmXaHWnBHnmrpMhwn9ZkPiFB/9vN6oKG/yGopzHFeM11c38799J3YMzacMDo2g7bz+ocvgP5mJ6vX6b1bQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776804929; c=relaxed/simple;
	bh=QxjyjeDJRvaYiQA74/+8JJBfWyd2JW28z2a086l0PDA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jo1n2IV4jydn1xvjdUtfDr2TYSCE8r98FI9yrVPAfTpTY/EDefAnzDZImuD6U0AATAZ0xzGh1tmjYbT/O/LqlflJChH/MUqxYlsX1sOq0HqCV/MmMWGuD7l0K/XOz+oMRiKD2drcZM3o1WxH6jP0/Xqtlf/7WxofRDIVyeQTh8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dLa2acP/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A004BC2BCB0;
	Tue, 21 Apr 2026 20:55:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776804929;
	bh=QxjyjeDJRvaYiQA74/+8JJBfWyd2JW28z2a086l0PDA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dLa2acP/Hw3u/TWVuY9qX2wQclEJsDArR85hh/1hm+MAO4d6ywp1mKb8NidBn+MRo
	 yuy1D1pC3EDUfZ3Q1HjHVx0Wq0nDIa+fV+A5tQmPw+AQwLs6xnUYhqfRJkkfuSwdeJ
	 z9S282Na1k51GQ7Cdz9I6FKiBW6I9BH9XOxsipEly/CtmzAT3aXhSdeGrqfBQUKLH4
	 Pg5LDG9Ea0zEwByD0h69q1HXgUJDw+Jut4mYpdl+awm9pUhMiiPkpi6IvbTbU8uMQi
	 LT8EfcPqprjI0y/YxSCqXhTwQ9VClBMT53oIC37G3pfEe1IfABBgCQjmuwH2OlL6S1
	 Ay2nOFiiJuY0A==
Date: Tue, 21 Apr 2026 21:55:24 +0100
From: Mark Brown <broonie@kernel.org>
To: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org, mohammad.rafi.shaik@oss.qualcomm.com
Subject: Re: [PATCH v2 2/3] ASoC: codecs: lpass-va-macro: Switch to PM clock
 framework for runtime PM
Message-ID: <11f2596c-c9e5-46d3-af6b-1f6b09c2db78@sirena.org.uk>
References: <20260420122843.327171-1-ajay.nandam@oss.qualcomm.com>
 <20260420122843.327171-3-ajay.nandam@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="hwlh+GjjAmlfHjKJ"
Content-Disposition: inline
In-Reply-To: <20260420122843.327171-3-ajay.nandam@oss.qualcomm.com>
X-Cookie: Jenkinson's Law:
X-Spamd-Result: default: False [-4.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-103986-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,perex.cz,suse.com,vger.kernel.org,oss.qualcomm.com];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[broonie@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sirena.org.uk:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 279D843F943
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--hwlh+GjjAmlfHjKJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 20, 2026 at 05:58:42PM +0530, Ajay Kumar Nandam wrote:
> Convert the LPASS VA macro codec driver to use the PM clock framework
> for runtime power management.

> +	ret =3D pm_runtime_resume_and_get(va->dev);
> +	if (ret < 0) {
> +		pm_runtime_put_noidle(va->dev);
> +		return ret;
>  	}

Are you sure we need a put in the error path here?  The refcounting with
runtime PM can be very confusing :(

>  	ret =3D va_macro_mclk_enable(va, true);
> +	if (ret) {
> +		pm_runtime_put_noidle(va->dev);
> +		return ret;
> +	}

Why _noidle?  We did actually resume above.

>  	va_macro_mclk_enable(va, false);
> -	if (va->has_swr_master)
> -		clk_disable_unprepare(va->mclk);
> +
> +	pm_runtime_put_autosuspend(va->dev);
> +}

Don't we need a _mark_last_busy() here?

> @@ -1601,22 +1622,18 @@ static int va_macro_probe(struct platform_device =
*pdev)

> +	ret =3D va_macro_setup_pm_clocks(dev, va);
>  	if (ret)
> -		goto err_dcodec;
> +		goto err_rpm_disable;

Here we jump to disable...

> =20
> -	ret =3D clk_prepare_enable(va->mclk);
> -	if (ret)
> -		goto err_mclk;
> +	pm_runtime_set_autosuspend_delay(dev, 100);
> +	pm_runtime_use_autosuspend(dev);
> +	pm_runtime_enable(dev);

=2E..but the enable didn't happen yet...

> +err_rpm_put:
> +	pm_runtime_put_noidle(dev);
> +err_rpm_disable:
> +	 pm_runtime_disable(dev);

=2E..so this isn't yet needed.

--hwlh+GjjAmlfHjKJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnn5DsACgkQJNaLcl1U
h9Cvmwf/cVny7B519TYubQxqmfApcTfdgQQfC98MV9MlLOUXF19QU8F+/0g8rY8S
kdAHWz9S+MVAChfeZWrXWWiAwCqlBzftJO3N0k6s/VkUs93kZd+PkanqE27AixtP
jP4QNlLNMVE+Tuk14h7M+mfOp3QatH5s9zR5f5AzkPLZW4Fcla0YDAKktJ50383l
MDVmYYSZyfPQSU2pVuwVIfh/ze7FSXKEMffyBh3vlTjQMsLTMy50Q3bozUuvn0bg
nnYAFMo2dEZoUB3/VFMcKuzybUSW62NTci/2++ETxnqaYH+Vdzp/W50hOTyo54eG
jSowBjpd6i46Pyh885MuGrih2ePyUQ==
=3zLP
-----END PGP SIGNATURE-----

--hwlh+GjjAmlfHjKJ--

