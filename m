Return-Path: <linux-arm-msm+bounces-103137-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qD1vLUYv3mnxogkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103137-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 14:12:54 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D2AE3F9DF6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 14:12:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1CF5430512B5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 12:04:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AFB1E3E6397;
	Tue, 14 Apr 2026 12:04:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OFZdirK/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0154D3E6392;
	Tue, 14 Apr 2026 12:04:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776168256; cv=none; b=N5082Qkf82TU2QyN04FRF4sXdk2d/xr+fmzBJuqBU0oQO1M3DzAokxqNjlzFOl3pv4LLCtX5iCWADn6A0N8oisKujsTk9FhA/ylVcozMuam7sqn53QrZ3u1+SVPaWwfndrx0f4dk3s+5UAMoeTjshbzPSXX3Q+PqvpwJ7hvAFZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776168256; c=relaxed/simple;
	bh=BX5YCq2Mgkwa0kNijt5koTAwGRG9IGV0JcuH6CeTfcI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OO2EEWeHZb0DT/PfuAfCKHi9JC21EnuCpFk58NgXcGz+nKedAyBbflcTOXENlJ8BqfaXGh5hmc6fq+QtNy3cZn1ZBGfWS7hQOei9Iq+2amxkNtP2hn35KZuujb7GaWTgiFfPSlGlYYVo8bF+Q1SXKJTMCc9LfOSg43uVtbEOa/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OFZdirK/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7EEBAC19425;
	Tue, 14 Apr 2026 12:04:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776168255;
	bh=BX5YCq2Mgkwa0kNijt5koTAwGRG9IGV0JcuH6CeTfcI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OFZdirK/4vxULfIPqZLH7vo6QriaMTaRqHmcatLqDVoGWNPjDYmSfbWluZ9Mlg6gB
	 YyqDA98hSjFgDWe51n3DzI1/aOenQGlDqRTwKUWejAYkTzbUN5mpOZpoWsEQhSMfzt
	 hX9fghxugxkgW167Ab7naef9zmPW0Ntw+p2IIgb/Jt2zxZgrn6eCyzBuNk5rQ4Rv+G
	 t0GQs7lRqWVPCVYlSOYxMFgJT8d9A6yTbN7ufsRjLyUOuTPUYP6kOa4depKZSdx91P
	 YAza3DxC0k7/yDunvw1fBS2/EThTu2YqZ/aVWLUs87vKfOCvizgAsHFayr9cjDJohb
	 VsKW2Lo7HfCpg==
Date: Tue, 14 Apr 2026 13:04:10 +0100
From: Mark Brown <broonie@kernel.org>
To: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org, srinivas.kandagatla@oss.qualcomm.com
Subject: Re: [PATCH v1 2/3] ASoC: codecs: lpass-va-macro: Switch to PM clock
 framework for runtime PM
Message-ID: <c71d2ce2-e6e7-43a7-bfdd-e1cc1008b3b2@sirena.org.uk>
References: <20260413121824.375473-1-ajay.nandam@oss.qualcomm.com>
 <20260413121824.375473-3-ajay.nandam@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="eT95a1e8Q9Y9rll6"
Content-Disposition: inline
In-Reply-To: <20260413121824.375473-3-ajay.nandam@oss.qualcomm.com>
X-Cookie: Academicians care, that's who.
X-Spamd-Result: default: False [-4.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-103137-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,perex.cz,suse.com,vger.kernel.org,oss.qualcomm.com];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[broonie@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,sirena.org.uk:mid]
X-Rspamd-Queue-Id: 1D2AE3F9DF6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--eT95a1e8Q9Y9rll6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 13, 2026 at 05:48:23PM +0530, Ajay Kumar Nandam wrote:

>  	struct va_macro *va =3D dev_get_drvdata(dev);
>  	int ret;
> =20
> -	ret =3D clk_prepare_enable(va->mclk);
> -	if (ret) {
> -		dev_err(va->dev, "unable to prepare mclk\n");
> +	ret =3D pm_clk_resume(dev);
> +	if (ret)
>  		return ret;
> -	}
> -
> =20
>  	regcache_cache_only(va->regmap, false);
> -	regcache_sync(va->regmap);
> =20
> -	return 0;
> +	return regcache_sync(va->regmap);

Same issue here (and the cache only mode needs to be reenabled), and
likely also in the third patch thouh I didn't check that yet.

--eT95a1e8Q9Y9rll6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmneLTkACgkQJNaLcl1U
h9CJawf8CUJh//tehQGfI0PIkFRtlLDm8Yarj99M/FLmttpoa9LVHmeMo505YgNt
ehNcVR0ytl3OOK+nHuVyIkfmiSZdB0nm0GH6mrT01xZa0qDoCUn5TrvmL/8dI5Qw
5nWmKuokkkzl7d4QI003YT9lOlZVzh9elp1GqC/WPgK3MnOSj5t4HKCOyDJcXPuY
hcjd8FtDOTesXKQ3Ki2V3CIwJpdQCysN9XMOuHNCzhO+1kBd6ez8unTcb0J8ehl2
KSj/lK7D3H9Anh077ZPXS0fhM3pLq1oC/0yPa2e8lQIHGor0p/NPxoxjPfgiLJ2n
lNYY1cAwO0+b4bZNxnsGuOJHUuRAhQ==
=3pKa
-----END PGP SIGNATURE-----

--eT95a1e8Q9Y9rll6--

