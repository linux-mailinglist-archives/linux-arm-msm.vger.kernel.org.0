Return-Path: <linux-arm-msm+bounces-113040-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ivtDJg+ELmr4xwQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113040-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 14 Jun 2026 12:35:59 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DBD15680DE3
	for <lists+linux-arm-msm@lfdr.de>; Sun, 14 Jun 2026 12:35:58 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=V6t0XovL;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113040-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113040-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9FA363010388
	for <lists+linux-arm-msm@lfdr.de>; Sun, 14 Jun 2026 10:35:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 077D9285C8B;
	Sun, 14 Jun 2026 10:35:57 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1103519D074;
	Sun, 14 Jun 2026 10:35:55 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781433356; cv=none; b=RSifJ6ibR1hcuYoKM2cGQx+4ER0YbzgGOUjc4IeShGLgeM7nvq9ipKNKs9IHANcqv2F5aCB7WxvI+b2zKTpI14E4K/s4IOy3qEeXOJ5HlAy53boKAq9uQ4Ifzbsg3xix6rlNQP/4YgblcdRWmN6XOPz+BQPD0prADJJ5EfQsY2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781433356; c=relaxed/simple;
	bh=1QF+N2X8XnhDlVoAMtIFBKDi5geAr1OcSkaPvDmkDXk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e6MuMHlcXYq/iK6sFteDYu5Sz9LbZk/kUOAwe7byQzatUxstmgkXhIgZWTGczABiE5fRJeeUfboh90Iv+1fOrWx3KMovLC4nLi0d36azRWsf7Bv2R1kZE4ElUHqLXVJc9CFyI2RBRCHIH/6XTN5EqKcROEqLBy2FY4lekn/h/d8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V6t0XovL; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7AAE31F000E9;
	Sun, 14 Jun 2026 10:35:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781433355;
	bh=VAEADmbcc/MqYQEuunt2++DWQsDZgWfCQK6e2A75YCo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=V6t0XovLp8S9/5f3Wmq1flzwwuqCVk0EhR7r7B5P6P7n+JNLI0RBsl4C/OjPWZbxc
	 icWCTSvYir3LVwVO/GSW6wft6r800V3wSTR3fB8NSdPduMxWhDsHBXIPdCc1xjx9Kz
	 gGsmv4BmTwcKETJ0W1E+rAMiXfBO32Gdul/TO/5ZWLAvFBi0aPCcNDM1kqWxcs+EbV
	 tuiBoyZMYd25yEL/jV5x+10L4KVqnM4B0LzlMFhGq/HKuuoFpZ+dFE7knIXjCK0nQQ
	 XkW2vcFRyR2ED62nSMDhhL4qmtrBc5CsK9sIpSsaZIOAa2LuA8WqTItYXsQ/Tp82ry
	 1RU+xZTJOmxyQ==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 678041AC5AC6; Sun, 14 Jun 2026 11:35:52 +0100 (BST)
Date: Sun, 14 Jun 2026 11:35:52 +0100
From: Mark Brown <broonie@kernel.org>
To: David Heidelberg <david@ixit.cz>
Cc: Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
	Konrad Dybcio <konradybcio@kernel.org>
Subject: Re: [PATCH QUESTION] ASoC: qcom: sdm845: use DSP_A format for TDM
 codec DAIs
Message-ID: <ai6ECJgLG_GGx3tM@sirena.co.uk>
References: <20260613-rfc-dsp-b-to-a-v1-1-7d095fe90a05@ixit.cz>
 <ai3tafRfEgN938cu@sirena.co.uk>
 <5f262a04-8e92-4ac1-bd7c-1246231d3de2@ixit.cz>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="V4sUG4M8NCPEnOOs"
Content-Disposition: inline
In-Reply-To: <5f262a04-8e92-4ac1-bd7c-1246231d3de2@ixit.cz>
X-Cookie: Price does not include taxes.
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-7.26 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,perex.cz,suse.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-113040-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[broonie@kernel.org,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_RECIPIENTS(0.00)[m:david@ixit.cz,m:srini@kernel.org,m:lgirdwood@gmail.com,m:perex@perex.cz,m:tiwai@suse.com,m:linux-sound@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:phone-devel@vger.kernel.org,m:konradybcio@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[broonie@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,sirena.co.uk:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DBD15680DE3


--V4sUG4M8NCPEnOOs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Jun 14, 2026 at 09:26:42AM +0200, David Heidelberg wrote:
> On 14/06/2026 01:53, Mark Brown wrote:

> > That sounds like both.  The Cirrus driver is definitely buggy if it's
> > mapping DSP A and B to the same register value, at least one of those is
> > wrong.

> I need to clarify. The CS35L36 supports by default only DSP_A, but when
> extended to "take DSP_B", speaker just works.

> This was done previously.

No, that's buggy.  If the device only supports DSP A then the device
only support DSP A and the driver should express that.  Any hacks that
can be done to make it interoperate with something else should be done
in the framework.

--V4sUG4M8NCPEnOOs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmouhAcACgkQJNaLcl1U
h9Bnngf/WupwiWbL0WB9ym1D3QF3qbHDSXJQKSOo1Vtwcxx/lGFNckmPUKycd3J9
PBI5zJ2wZ2q2onMZmpv27eAj9i0waVhvNdcFDqZnfPNqQimg/c/lewv9zjmVuBcJ
+oCiSrGHfZfs6znEt+IMntQSre4gljue2Pj4H7yxvFg0UWzNyPJXxRwfwSLELDmA
cligdZJ3hYWLuxpxc3txpaI49oPpoaU385y2Sgc8peNMgOh3FkxDXzPT+d1CwWoA
zDeAHr1OlUykRAzOUxg3uODD2zx05XGmWfE/tMAqvOZg2vMsF1gK5vgM2++2WpJ7
dgE2fOiOOQEEXYuNfYOGMuQFg4vbyA==
=+odq
-----END PGP SIGNATURE-----

--V4sUG4M8NCPEnOOs--

