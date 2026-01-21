Return-Path: <linux-arm-msm+bounces-89928-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iCC4HNwYcGkEVwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-89928-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 01:07:56 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 114BB4E4E3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 01:07:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id F051F38984B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 00:07:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C6CD14884C;
	Wed, 21 Jan 2026 00:07:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lzXjNhBM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D5FF1E2858;
	Wed, 21 Jan 2026 00:07:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768954059; cv=none; b=h9MeFb+7LrAx0DScUbnIp3X6bxxuJ77z2kNS1Hwp6G6yLgaAWWJ3yy7iylbKKpebFseUcK+UlhLM6TfA8pXLjNPCtJ6oVAxuZ/4KTj4K8okNi9PUPoWCKjcbY4NmygGXyayVZd4YybbQ2AQOLo1eqHbobEm2Q6oJ9cC2P00idhg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768954059; c=relaxed/simple;
	bh=Adto9cqyIUbuT91QVuAsWGY7ABXKqalyOtX89b9umNI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eO4UNz1EbJpCgQNqoY4RcBvDxO23n02FqpVGhhvca0/nU19wr+wzjOTBfCr/LamV7Rix6AixnhXPSeKEj3f03ZiG9Isr0ca65tKu1/soSi0p2ia9r20P4zinVZHEx5yiyw2YJwFFNzlcd3s0Nz220c7kgyMv9uD/R6aZ2B7b1CU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lzXjNhBM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3427C19424;
	Wed, 21 Jan 2026 00:07:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768954058;
	bh=Adto9cqyIUbuT91QVuAsWGY7ABXKqalyOtX89b9umNI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lzXjNhBMlG7RoCrd6alJaDICfuWiUE64kM+PjGmee04iaHiAx7PhrMvErPmeBxU5S
	 kdVUIJj1WLj0/yP7bdQVzsCtGRTRGne3ka1eV4LB/shuTsrpLJyicjFMPPnJXrb+sC
	 3cREvtVEW4o7DC5N+GMIYyrcQO178ZQCoASPU04N/c5z/BfqvrfI6jPzXpUiREitZY
	 zNRu+JPWFLyI5wTi20ClbtJXZRlfJJ8jMSLgsGxJursT+BzAsAk1OVvRYlxGC6CiaS
	 /beLxRrpUjKq5Mfme1oZX6QLns8pUQXG64Et4EwjpSTTi4yjhPV0N6SBpCH/iSfZXU
	 gfzhIrl1RjGkA==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id BA64B1AC56A2; Wed, 21 Jan 2026 09:07:34 +0900 (JST)
Date: Wed, 21 Jan 2026 00:07:34 +0000
From: Mark Brown <broonie@kernel.org>
To: David Heidelberg <david@ixit.cz>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>,
	phone-devel <phone-devel@vger.kernel.org>,
	linux-arm-msm@vger.kernel.org, Pavel Pisa <pisa@cmp.felk.cvut.cz>,
	Petr Hodina <petr.hodina@protonmail.com>
Subject: Re: sdm845 broken on next-20260119 & 20
Message-ID: <aXAYxjgZxHl49Cp2@sirena.co.uk>
References: <7b29f6a4-7ca3-41ef-a8ea-969c401a5c38@ixit.cz>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="f5XanGDfEE7krxOm"
Content-Disposition: inline
In-Reply-To: <7b29f6a4-7ca3-41ef-a8ea-969c401a5c38@ixit.cz>
X-Cookie: Think big.  Pollute the Mississippi.
X-Spamd-Result: default: False [-4.06 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_POLICY_ALLOW(0.00)[kernel.org,quarantine];
	FREEMAIL_CC(0.00)[vger.kernel.org,cmp.felk.cvut.cz,protonmail.com];
	TAGGED_FROM(0.00)[bounces-89928-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[broonie@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:7979, ipnet:2a01:60a::/32, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ams.mirrors.kernel.org:rdns,ams.mirrors.kernel.org:helo]
X-Rspamd-Queue-Id: 114BB4E4E3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--f5XanGDfEE7krxOm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 21, 2026 at 12:03:05AM +0100, David Heidelberg wrote:
> Heya,
>=20
> not bisected yet, but we having problems with 20260119 & 20.
>=20
> No usb initalization on any device.
>=20
> Pixel 3
>  - serial doesn't work
>  - framebuffer shows early fb init and logos, freeing initrd memory
>=20
> OnePlus 6T
>  - we get a penguins logos, but nothing else than blinking cursor
>=20
> For now, working version is based on next-20260109 (we have to test more
> recent tags). Version next-20260115 somehow (with some IRQ issues) worked
> too.
>=20
> If anyone has tips what to look for, we're grateful.

Is this possibly the issue reported in:

   https://lore.kernel.org/r/7ae38e31-ef31-43ad-9106-7c76ea0e8596@sirena.or=
g.uk

with boot hangs late in boot?  That was affecting a number of other
Qualcomm platforms.

--f5XanGDfEE7krxOm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmlwGMMACgkQJNaLcl1U
h9Ab+wf+MV0M6jRVMlFD154ZooR1Ng4UkgMEw1Ff/F5ZO1RQ6KdnHTuaxcFosX3v
xOp5Z7DJqtrAM+H1a8qDZ7X9W9SXd2YZ8VKzsYFnTxWB46yjbH2VvbU1tyttmVIX
nKf+IJWy/nhOb6q3ZvvOwXmkRSuy1U2VL+LlNEHSuKk/+IBPk8qQmh9wShXcN6Hp
7hGh3fFINp7aS2eZg03Mw70Eag2xAnAFHzN6Z09uQ3/zHK8+aUfvjSwrRx/DnvVP
EB1+sHkRlMLRFytTPzjEW2DHmmdjRblXCt0+ybrDvGRayTUBTP5TPvlgijyhMG+g
R+FonqEYbwLQQMo6PmS4GsdvDLuIQw==
=O/b0
-----END PGP SIGNATURE-----

--f5XanGDfEE7krxOm--

