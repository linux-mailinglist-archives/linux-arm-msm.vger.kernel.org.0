Return-Path: <linux-arm-msm+bounces-117648-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id wPYIBWVbTmrnLAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117648-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 16:15:01 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 7090672732C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 16:15:00 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=k4fR4+Dz;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117648-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117648-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 117FE3070848
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jul 2026 14:05:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EAEDC44103D;
	Wed,  8 Jul 2026 14:05:45 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DACF143784E;
	Wed,  8 Jul 2026 14:05:44 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783519545; cv=none; b=tZ34Xu9RYOqOVok/DLAkLJMdJQMQTbuZxxO/jwh7Uz3PiFxSY0mxMpGe12kQX/Kt38NYqKhgOUB4pNZyqm9CrPf8MaOFhjabPtArWIulK0YfHGGGCLHZy6gVMH87BO/Ay2b+FrKZ2uIwkZkCzqNW1ZWkOdw7jN9Rbj5wv9yE+gE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783519545; c=relaxed/simple;
	bh=48u4h7FIaopv895dgBAHr1mEDmzSKQkD4NnbFGaQzSo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bJckmx3Z0s3lbw31VDQ+GaxtVdub2cyhDN8eFo54MxAbwXViBOQIWbci5XMBVA5ew3tJ5Ly4uvmxQUrz1220IpgZ7RsgDmu8pPASqrYqJIbYEiLmxVtLj7YToFHN0qmO4cHH5UfkddgFfTfh5jvhVJskW7qDeIt3YaDmenYZK7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k4fR4+Dz; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75B5D1F000E9;
	Wed,  8 Jul 2026 14:05:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783519544;
	bh=dBuhwgVK+ho4/lqpaz1Mu/I9kuOshiZ2W+/ZmcbZptQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=k4fR4+Dz0+DYo84J2AKxrWPb20VYFKwMlx/JxZR7fQzzTePtrTT+1N8mHZerYm2hZ
	 1hovn7t61wyW5SsLvhyJubXynxNzVPFLCDzTq0XI92+X3Dml1hhHmIGEiuqOfRw0TZ
	 eRUPYyyjxG6Xq2pnMpZwjiVPxHlmxpPCdQcXMllv3A8D/o971FTLuK/WBopcYZuCLo
	 xz52g/lu4t0qBgGQscigcKbMdG//ZigWXP/nJIExiKD4sqAOFmxAB4wUkjvEuB5yak
	 pEMc7r4vF+1iyzwlq+9KT4Qzr7Edy+JSfnRWSL9SbglXRY/h9SKGAZnVgdTcNrdMQc
	 Si/5fcaKuSKMw==
Date: Wed, 8 Jul 2026 15:05:39 +0100
From: Mark Brown <broonie@kernel.org>
To: Jorijn van der Graaf <jorijnvdgraaf@catcrafts.net>
Cc: Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Val Packett <val@packett.cool>,
	Luca Weiss <luca.weiss@fairphone.com>, linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH] ASoC: qcom: q6apm-lpass-dais: start the graph at
 prepare
Message-ID: <dee62f9f-1df3-4f57-a072-12b0b4b8a1a3@sirena.org.uk>
References: <20260705033830.305907-1-jorijnvdgraaf@catcrafts.net>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="h7C4I2vkyY9VRqIX"
Content-Disposition: inline
In-Reply-To: <20260705033830.305907-1-jorijnvdgraaf@catcrafts.net>
X-Cookie: The other line moves faster.
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-7.26 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-117648-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,perex.cz,suse.com,packett.cool,fairphone.com,vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[broonie@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:jorijnvdgraaf@catcrafts.net,m:srini@kernel.org,m:lgirdwood@gmail.com,m:perex@perex.cz,m:tiwai@suse.com,m:val@packett.cool,m:luca.weiss@fairphone.com,m:linux-sound@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[broonie@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7090672732C


--h7C4I2vkyY9VRqIX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Jul 05, 2026 at 05:38:30AM +0200, Jorijn van der Graaf wrote:

> Sending as RFC because this changes when the port starts clocking for
> every AudioReach platform, and I may be missing the reason the start
> was placed in trigger rather than prepare in the first place:

> - Is there a downside to starting the graph at prepare on AudioReach
>   (power, pop/click, or DSP-side constraints)? The legacy q6afe stack
>   has started its ports at the end of prepare all along, and the FE
>   side of AudioReach already starts its graph in q6apm_dai_prepare().

There was previously a move in the opposite direction in b54a38af7138
(ASoC: qcom: q6apm-lpass-dai: move graph start to trigger) - the commit
there mentions some issues with PipeWire?

--h7C4I2vkyY9VRqIX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpOWTIACgkQJNaLcl1U
h9BJBQf+IzWQpknx3VYI/Cw/qwcreq2jMnweCkiJhloAecfFA5/DDjFB+NqJVjDs
iXMWzruTjutayNWE+4n3A4us50e+w4QJ97ivUqYwHr+bm1sZtuhz1OZNSLcyR5mo
Jmg+PQgIkTBUOhqiS1S/efhM/L66ZcZrRpQuwGJN9PP2k307PDKMkqL2Pp3nBWsp
RGjsE4bZPu85ArRuAZbnN0R0ux+7j7htLxXpDQUtPTWmh344cKnlabM9XSKm8xOU
KoT80o/Eo2zuErZkdemzwBQLWFDM9CVlH+WL4wPbbk2kdmrhbZcmzYLLH5P0rZZa
PL36kuykaPx0gm9ODtgYxtl9DPkILQ==
=5DN2
-----END PGP SIGNATURE-----

--h7C4I2vkyY9VRqIX--

