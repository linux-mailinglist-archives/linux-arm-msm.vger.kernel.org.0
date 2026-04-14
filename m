Return-Path: <linux-arm-msm+bounces-103130-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WCfwKyoo3mmSoQkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103130-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 13:42:34 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D0CC3F9805
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 13:42:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4F7EE3022915
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 11:38:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09DDD3DD53B;
	Tue, 14 Apr 2026 11:38:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jL5EzOyt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 485CE3DDDC6;
	Tue, 14 Apr 2026 11:38:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776166720; cv=none; b=hLMxKHRpSyLmu0dr4H8psKl6mjtNa1LrUJmfjxpDxw2EcJZGnz0Xt057a7WyGvYU8qswAoTcmgYFkpTQ3evhijz4zkPAXMoi9z4AlWZRQl7QoQA3UOgPv+iwR0k93a1kxxtUJHN7IWsWy1RXATHFFuvA7t+UD4fjjP0u/9F1U5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776166720; c=relaxed/simple;
	bh=QuNeAlHoUV9bllkpSUEWkOqI87EtJHK99kcU4tVgO20=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sFYLj1gEAg9U6MEecDkJl5Lo6Fm3zNUqVCWo0ZG/SQqxl0YiEI7LnZ7zTw+qo30a7pZz4m2AjvoiKheaonSU6l+fbw6zPCs582SsizxNT15tC/eO4SUHX3zHqDrpnVL2eOvc4XO3itM5xgTRUQr61zS/kW1eb35vDnC98e7gu9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jL5EzOyt; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C15F1C19425;
	Tue, 14 Apr 2026 11:38:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776166719;
	bh=QuNeAlHoUV9bllkpSUEWkOqI87EtJHK99kcU4tVgO20=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jL5EzOytfjvDAKrvemKGErhG6lZtZ7jmWusxtZqoLB2lez36kcjnOc8jSOflOkiII
	 /8zWDr9V+pGfZtfRBQdCKmXvaDyVenN2mJ4arlzR4kvuxpDBOJVUzgJR8DLIcnHEKg
	 X1Ww1lYkgMuq1fb87TOQod4Gzett+n82nBbEatN0tT9YdkA+6vth+/GZJL5IQj7Wnh
	 8Bkw9gUqhxv6kgcpQjYZtMMrHjpkyzRNJzAcHSkVKiAg53B8jHpuVvWgRgLSY5cgHG
	 UF7fsDPwbu1IU7Wnbo/EKDCn0iXe1qaZybRMiva5MZ5k8Dmepq4B+kuyER/bXCMDib
	 avql+7LZNCbkA==
Date: Tue, 14 Apr 2026 12:38:33 +0100
From: Mark Brown <broonie@kernel.org>
To: Kumar Anurag <kumar.singh@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org
Subject: Re: [PATCH v1 3/4] ASoC: qcom: q6dsp: Update bit format support for
 secondary i2s
Message-ID: <652a9af6-4d02-4979-9770-1ac4c13ad417@sirena.org.uk>
References: <20260413091937.134469-1-kumar.singh@oss.qualcomm.com>
 <20260413091937.134469-4-kumar.singh@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="DFprLiTa6flKHV9g"
Content-Disposition: inline
In-Reply-To: <20260413091937.134469-4-kumar.singh@oss.qualcomm.com>
X-Cookie: Academicians care, that's who.
X-Spamd-Result: default: False [-2.76 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-103130-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,perex.cz,suse.com,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[broonie@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,sirena.org.uk:mid]
X-Rspamd-Queue-Id: 2D0CC3F9805
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--DFprLiTa6flKHV9g
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Apr 13, 2026 at 02:19:36AM -0700, Kumar Anurag wrote:

> Add 32bit for playback and capture over secondary mi2s.

> -			.formats = SNDRV_PCM_FMTBIT_S16_LE,
> +			.formats = SNDRV_PCM_FMTBIT_S16_LE |
> +				   SNDRV_PCM_FMTBIT_S24_LE |
> +				   SNDRV_PCM_FMTBIT_S32_LE,

The commit message said 32 bit but this is both 24 and 32 bit.

--DFprLiTa6flKHV9g
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmneJzkACgkQJNaLcl1U
h9BfLQgAgNtJaTScr9lG4q4GmNkzI0d2iK7uUBtul/oP5Ncc1Sbv5GPQ4MFVOAwB
tWjKA9hMx5MdMg9XaHH+ywqEzZLHTMlmcLDNfIBaZdJrFTwlk+1GN875/p5TCu6T
HclQBNSJ8vNGTvjZ3XbK+t//dfvkWm9Vkl5uPauVVsOvPnS6dj4eNQIDQlioQ5YH
Vft9k8HTFEjoCuJ9vwYg18fOuY3fo8jLpeHpql++wS9xMbHwCAWS8674YsDCP0oj
hh1gTtTbmt9fO7aLZQaFzAnsWYITqojm8/YVLSX1bPX0mE0yoviLxoimtbh8sdXb
fJ9UA1RTxIKTa5dPce1b/R5r7RsUzA==
=ZxUf
-----END PGP SIGNATURE-----

--DFprLiTa6flKHV9g--

