Return-Path: <linux-arm-msm+bounces-114563-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id aX5NGOBEPWpC0ggAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114563-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2026 17:10:24 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E5F36C6F3E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2026 17:10:23 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=aZmF5pj9;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114563-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114563-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C036E30892CE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2026 15:09:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 142533E7BB9;
	Thu, 25 Jun 2026 15:09:02 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FE783E5A0B;
	Thu, 25 Jun 2026 15:09:00 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782400142; cv=none; b=jIk12LfPZMtDkIcpMqvfjAnAHz8/XghVoKvifuy3oVnk3lpXE/KOUMTOqnCTGfhKNLwktxkzadskvXLLH98kf+nRRpRCObt0X5thJ15xxjiiZSF5ETCId5v4LaFEntHNcWisiH+GTeWQO4TqUGA5NKdA2UyoXEbG0/YQRWhBXaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782400142; c=relaxed/simple;
	bh=wb3YymQHTTqDd/1+3iz20LPAouCVq5tEF0n0NyEW7Ps=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qSzq9dGt8kwngnkONrmXteRpaE4uCiTe72Grvik9O74tEbzumj6eG7Wvl9O0E2fQyt24It0cl6YufEz+KhB1M4b/j4f2T7RepNirV2Bx7YQP9CVQR42Ax/kFB7aOKUaeid5zhz2zG1llUiQfprLDlTb5XIyq8OF8GvNRFMNt8wA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aZmF5pj9; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE6D11F000E9;
	Thu, 25 Jun 2026 15:08:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782400140;
	bh=wb3YymQHTTqDd/1+3iz20LPAouCVq5tEF0n0NyEW7Ps=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=aZmF5pj9JqgGoG3goPhL7wN9EgGirf1OC3bYS1AX3N9TiQLU9n692/sZu66Ku3jrw
	 qyxppIMe2CugHklsWBHbyDAoQ19UWdObB/Wabkfpe73aQ6R9RqR8bpVCZwgKlxcSkj
	 fvWra+TX7L597drAjuEDsojctchhj8KOyejTrjkl/OkmIZUq9t8NzU8rt5MTXLIxm8
	 XMpRhV7Y3RBu9/dkbplSwQ8tRFdvN9vgEjFrjjs6gPdQwLF691RVF15OlEtQJRjPKy
	 nsA/WH0w6EWAqEdF6noaEzDBds9UVek4ADSvwnCXfldzjrEkqXIMVahFDPMMjQk/MQ
	 1m39BkFUWhcbw==
Date: Thu, 25 Jun 2026 16:08:56 +0100
From: Mark Brown <broonie@kernel.org>
To: Praveen Talari <praveen.talari@oss.qualcomm.com>
Cc: bjorn.andersson@oss.qualcomm.com,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org, linux-spi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
	aniket.randive@oss.qualcomm.com,
	chandana.chiluveru@oss.qualcomm.com
Subject: Re: [PATCH] spi: core: Abort active target transfer on controller
 suspend
Message-ID: <011f20d7-a7ef-46c9-b68e-4638f34d6937@sirena.org.uk>
References: <20260625-abort_active_transfer_duirng_s2r-v1-1-7439e3585ad7@oss.qualcomm.com>
 <730c2055-b29f-419d-99f2-bc4df3b6a2f7@sirena.org.uk>
 <4ceb69dd-4c4f-46b4-93d2-4e4c7bf0146b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="PUDGEEEyaabuSaGP"
Content-Disposition: inline
In-Reply-To: <4ceb69dd-4c4f-46b4-93d2-4e4c7bf0146b@oss.qualcomm.com>
X-Cookie: If in doubt, mumble.
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-7.26 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-114563-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:praveen.talari@oss.qualcomm.com,m:bjorn.andersson@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-spi@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:mukesh.savaliya@oss.qualcomm.com,m:aniket.randive@oss.qualcomm.com,m:chandana.chiluveru@oss.qualcomm.com,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[broonie@kernel.org,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[broonie@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,sirena.org.uk:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8E5F36C6F3E


--PUDGEEEyaabuSaGP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jun 25, 2026 at 08:29:05PM +0530, Praveen Talari wrote:
> On 25-06-2026 18:57, Mark Brown wrote:

> > We need to check for an active message here, drivers are going to
> > assume there's an in progress operation to cancel - for example the
> > pxa2xx driver unconditionally sets cur_msg->status during abort which is
> > going to go badly without a cur_msg.

> Yes, i got it. Our spi driver had that check in target_abort.

> is it fine?

> if (ctrl->cur_msg && spi_controller_is_target(ctlr) && ctlr->target_abort)

I think so.

--PUDGEEEyaabuSaGP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmo9RIcACgkQJNaLcl1U
h9BJ5Af/fJGkt0fPGKlGtPSegCkjfBk32Ag3FO8IEztIJ3ShGyTdrcuYM6sfpF5w
K0H3m/KaViSQuPXDfoYo6mFHV0H8NuoW0QYYlKBRL76iPI9wvN0Rce+8L481t/MG
X9BQU7ED+4GtM0RWsOTJmeYOjiZfxRBk0DDWyi2ZulE89J9YUWEu4U8hxyiphSPi
rpKQ0UK8rHCwEkQ6lwkVV474diScaZKC2nZBQ3t93C7k5B4NsCbcDvHmgIo+rOMY
Mz90aArtgM2C13995VU+iyeDe9RKJogINTgPaSy+J2ZDyiL3yco61/8lhEaf3LjW
sQrvbIO9Pa06lG+PFkLjTgvm9ZVB8A==
=etqW
-----END PGP SIGNATURE-----

--PUDGEEEyaabuSaGP--

