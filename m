Return-Path: <linux-arm-msm+bounces-111409-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id fg1oLxPCImoydQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111409-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 05 Jun 2026 14:33:23 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1210164830C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 05 Jun 2026 14:33:23 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b="e+JE/AwO";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111409-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111409-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 37676312501D
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Jun 2026 12:25:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8594F383310;
	Fri,  5 Jun 2026 12:23:49 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9116A3803F3;
	Fri,  5 Jun 2026 12:23:48 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780662229; cv=none; b=Z7xDKIqEPFh+hqf/H0mBvG83Xa5k/yrNfTS03Itf2x1rwUsoR4C0J4OnoMvL6vIsrh+8iJniEMZQFQsL/w0XhKs+YuFfd8KGdYUFSxfllKAYdt3QmbJTTMAls+lT0sPKpElM13RmxJ7kCoTc8psj/goA2/xW/Ft9F6E9pIfsLZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780662229; c=relaxed/simple;
	bh=7KcW7rTKtkv/R93y+gx34OUeYV+MreUUGrgD+Qg3Ptk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dtY1WnaPVPr17dGkY8sUjgsAnttG/u8Qs3XsM8KVD+mMPD+/3I+X8n3+uLAZdOpCyM7/vnLn//QGYw1LMF+BrtHM+htNYMpuQyK1OFeKrH5HzrPMpmETZIX3Dcd6/x5RTrO12Fd8uyF15zt7/eyhjW8Nsv2uWCO6zvBA3sW20ls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e+JE/AwO; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2AF4F1F00893;
	Fri,  5 Jun 2026 12:23:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780662228;
	bh=DpnWcYxCEeDWlw2uqHVEYAIRFGh9BMJQb8HIB2SYwkQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=e+JE/AwO7RGezZ8ewY9jIZGg8SssaCRIQG2EHWVHRjcdtIWH2MPJwdlAxqm7AycPb
	 ZDrbSp2Wrly2duNcIWvHaLZV85E+eY4MXym28qFcfTq2QxKLh+QYg2WH0Eo0Ir8r3T
	 OF5nsCU8by1L/CDkbZmPpmTEyUeRiVhFBd5wZfjmk8EF17lyvAakMuJe6MmB/TvSnl
	 hfvZUVYBczKYce8tfrw3TWMQ2/1w9dahvk5AkV/fA6kWsuCA7YhEOMD0zlIxoNgvsV
	 1W9wprymu2rPJ90/B95wUdP18u/5Z4XffsIGJdtbRaTdYSOZi8E/NaWapU7BBbEpkD
	 oW1CviHxDJ1CA==
Date: Fri, 5 Jun 2026 13:23:44 +0100
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srini@kernel.org>
Cc: Harendra Gautam <harendra.gautam@oss.qualcomm.com>,
	Liam Girdwood <lgirdwood@gmail.com>, linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] ASoC: qcom: Refactor of_xlate_dai_name into common
 helper
Message-ID: <353be3c7-effd-4559-9455-9d4c6248f8f3@sirena.org.uk>
References: <20260605092812.3495852-1-harendra.gautam@oss.qualcomm.com>
 <e256edef-fc24-4ccc-b031-4387a127fc83@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="oTm0qgAVOaU/GbfX"
Content-Disposition: inline
In-Reply-To: <e256edef-fc24-4ccc-b031-4387a127fc83@kernel.org>
X-Cookie: Error in operator: add beer
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-111409-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:srini@kernel.org,m:harendra.gautam@oss.qualcomm.com,m:lgirdwood@gmail.com,m:linux-sound@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[broonie@kernel.org,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,gmail.com,vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[broonie@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_FIVE(0.00)[6];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,sirena.org.uk:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1210164830C


--oTm0qgAVOaU/GbfX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jun 05, 2026 at 10:41:33AM +0100, Srinivas Kandagatla wrote:

> Please consider making it part of the series that actually has more than
> one user for this.

Or at least identify additional users that will be added soon, it might
make sense to cut down the size of a larger series by splitting out the
API addition.  That's especially true if there's multiple new users that
each need their own series.

--oTm0qgAVOaU/GbfX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmoiv88ACgkQJNaLcl1U
h9AjqAf/UOiHFGkeZ2b74nKm2DOvK41vAoSqNqlw1khQRVUfoOnHN8VUY9jPdVGK
RLEg5vTQ2QC93aZeA50VIfNhUDW9/uuHLG6M4bbdXlMYxEEzLc/bohtt9LuQ4uH5
FuXx2BgAJgWaen/CEclpKeRGiNlcIdVb/psbc2tktuSq6hBX8Q1lZhKQya7hz5up
X32HT8eocrp30C7OeoAxR9JCf89VeO43MbcjUgh1sFLh7eIvhj3COh/sJQzwDDhC
i2DVyWvyMWpAk4X305CmahGBJ0uCSgRWornKhzPH0gvDoPsJwx/ZbyeffWkcHy4S
oHs+lyHQUXy8NKV0/q6OVJMrWEh0mw==
=Yq5L
-----END PGP SIGNATURE-----

--oTm0qgAVOaU/GbfX--

