Return-Path: <linux-arm-msm+bounces-118065-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 8eKtBTnQT2rOogIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118065-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 18:45:45 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 59982733942
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 18:45:44 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=S75DKAHt;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118065-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118065-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B263C3034A9A
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jul 2026 16:39:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0761B396D19;
	Thu,  9 Jul 2026 16:39:46 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFF45385D61;
	Thu,  9 Jul 2026 16:39:44 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783615185; cv=none; b=Naxxpe5CfUAG/ylzJxU6mgkxj65nulOZdnJ33/EX739h3OPzMgE6zQoO8powHQLgXYGZF8eejbFfRhyDmiEnw5et9cfSIfEbCkBceq/seNAcEDvbIkXMtsFCwXGucNsp0yM4JPuhdDlfuMJQra5+rzG6Ff91hsb7eOYltKcy5+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783615185; c=relaxed/simple;
	bh=cN4mAc9z75mmQzOhQSoZcg3HiQXJpOrK0QrG+yKamCQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PVMr9fmpWoO0Q47JIEmRrQiss1yhkzFzZh9h8Hi1zZ5daLd6Czd/tH7tnXfWp6yVYwzwboEYDAYCF9LZyOodUAtZMgXodxIVTWEVzjE1V7L2YOXzg5Re0H0Hiz6/v9OcGFEohKjrYDQpccmQGlMguowNrSvN5D5PZE4VOdUu9Ik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S75DKAHt; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DDBFC1F000E9;
	Thu,  9 Jul 2026 16:39:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783615184;
	bh=cN4mAc9z75mmQzOhQSoZcg3HiQXJpOrK0QrG+yKamCQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=S75DKAHtAg/H8zOcwSiu4GEtr2FTwxiN+/TVZ9iMDoXieKh14DhETirrI4aikQTAd
	 JeeoxWkCWriPQkXSemLZiXyUFZ1WXp7mql1hD8NJQGQp3ge0wmA9qDJBrFZoJc4gbz
	 RMwdtPs4ktSQOyOSzmq0ffT8dk+3p8mS7N8LYToWYYz1pIX5gIS0rwl8Uu1EQEKwWS
	 NHgrDarSs5a4ozjtO5lXAwrTxaMG3VaP7deKFcgDIPxCWm4mVbrH4luyTJIm83upbG
	 JL+03ijU/0F8aCP1cIMEvoAnNac8C6659Z4n6FhHI6oFQxEmSSrg2jygm7Is9Y+FPe
	 nw2RyqY2Xocag==
Date: Thu, 9 Jul 2026 17:39:40 +0100
From: Mark Brown <broonie@kernel.org>
To: Pengpeng Hou <pengpeng@iscas.ac.cn>
Cc: Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ASoC: codecs: lpass-va-macro: Propagate regcache_sync()
 errors
Message-ID: <17bcb9be-b1c5-4dbe-9fb7-85745098d35c@sirena.org.uk>
References: <20260704073901.40058-1-pengpeng@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="MPCwEfIhfkAc11ZY"
Content-Disposition: inline
In-Reply-To: <20260704073901.40058-1-pengpeng@iscas.ac.cn>
X-Cookie: MS-DOS must die!
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
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	TAGGED_FROM(0.00)[bounces-118065-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:pengpeng@iscas.ac.cn,m:srini@kernel.org,m:lgirdwood@gmail.com,m:perex@perex.cz,m:tiwai@suse.com,m:linux-sound@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[broonie@kernel.org,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,perex.cz,suse.com,vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[broonie@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[8];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sirena.org.uk:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 59982733942


--MPCwEfIhfkAc11ZY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Jul 04, 2026 at 03:39:01PM +0800, Pengpeng Hou wrote:
> va_macro_runtime_resume() enables clocks, leaves cache-only mode, and
> replays cached register state. It currently ignores regcache_sync()
> failures and can report success.

This doesn't apply against current code, please check and resend.

--MPCwEfIhfkAc11ZY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpPzssACgkQJNaLcl1U
h9BDXgf/fqQ8ff39nByYNzQcet0ce5ztrpZ9I/g4s6Rx+ilub1KA35kx3vpLk+6/
wflzxXhP8VC4t2WUZCsWI9Cw9taxUpk/cJzlR6W9Xe4T1aJbwULeEW30bpkz9s2C
3ZWZYfnjpy766BKfLTmhRcpmFGKjg2Ilpn9k4FpFN5/Y6TyYAUbvvCK1gJq7mFDv
XkUmKJ+TbDiNmfhLfqcbJEG1n01KpRknLraqKAbpFCL8GXgz0gqSqQJJe4FIehwJ
I5/FXHqo5UQTyhsg8QmRm9YRXtaML0F/kobcuqCUEI7hmHYFw5fiM7WmFBBO0Nkd
/hcJzoruB7mn2VNVtRlBdWjLYrboFA==
=WHVt
-----END PGP SIGNATURE-----

--MPCwEfIhfkAc11ZY--

