Return-Path: <linux-arm-msm+bounces-113024-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Ei0rK3TtLWqamwQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113024-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 14 Jun 2026 01:53:24 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A3E44680107
	for <lists+linux-arm-msm@lfdr.de>; Sun, 14 Jun 2026 01:53:23 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=hWQlSYii;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113024-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113024-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id D1A623002514
	for <lists+linux-arm-msm@lfdr.de>; Sat, 13 Jun 2026 23:53:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB476384CDC;
	Sat, 13 Jun 2026 23:53:17 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6776375AD0;
	Sat, 13 Jun 2026 23:53:16 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781394797; cv=none; b=FG4EHH1vfm+uSKRgm9C6eE/ROwwhtRrSfVgk+HHvrRF8X8NwA+2EFLRMifQzBCOCoCS8JVoWI1ScWIZHkYA9SuyTczor1HJKiHyi2FuhDSyhnrCLggmBlcXMKNM5aHCYmuMus8sBqH8wGyBS4nQInpugclSdC2x38c/H/lHBbpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781394797; c=relaxed/simple;
	bh=koV2TAYBF5WHJNhfJ/J3NYj8was8bgtOC2ZkqxLqxdo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Oxq/1kU+yWeMjH41fv2f86D60F5tiDo9vS3MB/bWRUIOIZPk///63Vqny6OEe0iAhQI0+ZfgSJxczNtNxoXSK8IYI7U100vdTvAkgg3Gjk11Qsnq029rQ0dkCGSldsuaW0r0O9jFYgq64KdMfzuCuAwAPaJ35NMtHdWmNup3sy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hWQlSYii; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62CBD1F000E9;
	Sat, 13 Jun 2026 23:53:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781394796;
	bh=O4la2TojX64zx12v0Wqx9SZlzrIofaTN8KcPfsKVwFQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=hWQlSYiian3BYBRE2teh2zuRwMwJ3AdT5RWsXjIlAh1wp6mQQNQyfRvNcrhgYt/om
	 ozb+LlY0gVpslubhsSHyZVEP+qVCMZJ/N6W5wX1vhxXZg8P7ZhkyGR5g+1Xx2E5nAc
	 HaqN6Sci7ARYzsUCypiL3OvvVkNCyb3POoWSH0+b1OcYALFC7llzlZv+DT2gfYfJN+
	 6Co01TtAIwHTKI3AIZteOIV4RxUxrOPm9ebV7rHSrY1pc9jVJDGlo6PWUmXhgjlvF4
	 5q4alacbREfeJuSaxBTONDQlTGivaPCcpKxcNU5FaFLdv/ln7QCCLXNa4adwEdbeyo
	 Dh8/MzmoTVX4g==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id E32751AC5AC5; Sun, 14 Jun 2026 00:53:13 +0100 (BST)
Date: Sun, 14 Jun 2026 00:53:13 +0100
From: Mark Brown <broonie@kernel.org>
To: david@ixit.cz
Cc: Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org
Subject: Re: [PATCH QUESTION] ASoC: qcom: sdm845: use DSP_A format for TDM
 codec DAIs
Message-ID: <ai3tafRfEgN938cu@sirena.co.uk>
References: <20260613-rfc-dsp-b-to-a-v1-1-7d095fe90a05@ixit.cz>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="qWbkYjLMmfIIcVL7"
Content-Disposition: inline
In-Reply-To: <20260613-rfc-dsp-b-to-a-v1-1-7d095fe90a05@ixit.cz>
X-Cookie: Price does not include taxes.
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-7.26 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,perex.cz,suse.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-113024-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[broonie@kernel.org,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_RECIPIENTS(0.00)[m:david@ixit.cz,m:srini@kernel.org,m:lgirdwood@gmail.com,m:perex@perex.cz,m:tiwai@suse.com,m:linux-sound@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:phone-devel@vger.kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[broonie@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A3E44680107


--qWbkYjLMmfIIcVL7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Jun 13, 2026 at 09:55:59PM +0200, David Heidelberg via B4 Relay wrote:

> Currently this worked only because the cs35l36
> codec mapped both DSP_A and DSP_B to the same hardware register value
> (asp_fmt = 0), which is inherently DSP_A timing.

> The CPU-side AFE is configured with qcom,tdm-data-delay = <1> which
> produces DSP_A framing.
> The codec format should match what is actually on the wire.

> So I'm pretty lost if I should go fixing cs35l36 or sdm845.c.

That sounds like both.  The Cirrus driver is definitely buggy if it's
mapping DSP A and B to the same register value, at least one of those is
wrong.

--qWbkYjLMmfIIcVL7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmot7WYACgkQJNaLcl1U
h9AUkAf/ZFJUJ799o4iveN67FSg87nTg6lBOaKtzqMrm4WL5V4qm9ZoTzmtA/3Mw
XYBDOokv+YWQVayhnNNkdjMtTIgtEGU6C2DFVMsPT+vvts+GXwsLhCOpudliQY78
OP8CuJ9/4P4kJslM9ER+g0e3eowpzchXXGBOByzWZ3mgy8mCHPZ6tJsRPYOsZjbp
F7+Bz/XMsDKiju6hnmOKndL8COq849QWC3wmuiT5Eh5h9+U6BzvWa0OM1tmzbION
yQw5CnUGF6IzooHUgdclhFuyMtQaMXby6/vm0f7bIg9VPDNlXFrj3o7moHrNIGux
p6li8hv1jkAojmOHdpzI0t3RiLQxfQ==
=CcoX
-----END PGP SIGNATURE-----

--qWbkYjLMmfIIcVL7--

