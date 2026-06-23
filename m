Return-Path: <linux-arm-msm+bounces-114183-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id C6vLG0ttOmo48wcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114183-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 13:26:03 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 577316B6B2A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 13:26:02 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=XqOcM6GX;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114183-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114183-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 73A603004612
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 11:25:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 254203D4107;
	Tue, 23 Jun 2026 11:25:29 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AEEE3D3D00;
	Tue, 23 Jun 2026 11:25:27 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782213929; cv=none; b=OUEpmtMc16GeYDDD8x0VU0THwg4ipdRFV0MQFGv/6QfeMEw4qG8lXDMeEgzl9oyqchFmRu2/5lHQIZJqNbIGh4DUyIRDH4Ieyop2p9kM52PO4tAd3jQVOaQ4ukEfsWxRlvOpNNT0FDqHz4cHcXwXiJGPiFkr4I7JKBq6pl84V0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782213929; c=relaxed/simple;
	bh=KhpuS1Q6fB6W4ZxKETyOLuqGUh0JsynaUi5WgezeGbw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mnIK8gaCklboPZCliI8fH/V9G+djuh2+NHc6tTb4ZiWgbeu+tro9IlHX/5bz7DAn+uRsJJu9+7PHvfwErnmZpCNoYcYcAgXu79FIdf2T3mTzaMWJbKJSdm9yRzUXQexE/BmTWnIsGweIbq7+naiiglN6YPPyDnZDG2Wo3g7bkqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XqOcM6GX; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0996D1F000E9;
	Tue, 23 Jun 2026 11:25:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782213927;
	bh=12EhCq8M5WCtaZTI8h4ig8n1YoAmuZmzJEkP+eZtNoo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=XqOcM6GXRBq/qeFDB+QBJz4Zh3sdh7atM/NOFeV2HhEZDGifMl3qz4IHNQ34KQl3g
	 dOUY3ikYvd3J93dw3EkK2SKnh2hlhXbgDwTRpBeTYc8NSABItkIp3Y7U88pYkxYaxS
	 s3BW8p8LuRYYuIHPW6xELiIHZao5MiugR/asfjH4u50dtQWKjASYVAbrigLuN1Txxh
	 MirX/W6kiUTG1R4DAavBu6F1MzMtju+2dNAJxugyptpailps8eC6xlz1dVst4P6LWU
	 C3lXx2g14LB3uZR0IjZFNGdUNJisDAEofjpiDcxGVQqVCsf0oYPX41gkk019yuh1jB
	 Ll6nBe5zctOkg==
Date: Tue, 23 Jun 2026 12:25:21 +0100
From: Mark Brown <broonie@kernel.org>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>, lgirdwood@gmail.com,
	perex@perex.cz, tiwai@suse.com, srini@kernel.org,
	linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 0/3] ASoC: qcom: lpass: Switch VA/WSA macros to PM
 clock framework
Message-ID: <7c4c3a7a-ad8f-4603-a0ec-2332f296234b@sirena.org.uk>
References: <20260623071708.2822269-1-ajay.nandam@oss.qualcomm.com>
 <7dccd968-6a58-4dd4-8ef8-5aa3f8591bf3@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="M69pUZkggAH7yLKq"
Content-Disposition: inline
In-Reply-To: <7dccd968-6a58-4dd4-8ef8-5aa3f8591bf3@oss.qualcomm.com>
X-Cookie: To love is good, love being difficult.
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-7.26 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	TAGGED_FROM(0.00)[bounces-114183-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:ajay.nandam@oss.qualcomm.com,m:lgirdwood@gmail.com,m:perex@perex.cz,m:tiwai@suse.com,m:srini@kernel.org,m:linux-sound@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[broonie@kernel.org,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,gmail.com,perex.cz,suse.com,kernel.org,vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[broonie@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[9];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sirena.org.uk:mid,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 577316B6B2A


--M69pUZkggAH7yLKq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 23, 2026 at 12:29:01PM +0200, Konrad Dybcio wrote:
> On 6/23/26 9:17 AM, Ajay Kumar Nandam wrote:
> > Hi,
> >=20
> > This series converts LPASS WSA and VA macro codec drivers to the PM clo=
ck
> > framework for runtime PM clock handling, and keeps WSA MCLK-output clock
> > registration resource-managed.
> >=20
> > Changes since v5:
> > - Rebased to current linux-next/master and regenerated as a standalone
> >   series that applies cleanly.

> Switch to using the b4 tool (https://b4.docs.kernel.org/). You sent
> all messages as a separate thread.

Also you already appear to have sent a v6 of this:

   https://lore.kernel.org/all/20260604124823.3467457-1-ajay.nandam@oss.qua=
lcomm.com/

--M69pUZkggAH7yLKq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmo6bSAACgkQJNaLcl1U
h9CPYQf/VOdVgF8XEnzrMPNfGJtm2fGJc97d5Ka4qAhroJL6Xrl66+PNwU3nM0Ma
Gabu+vzxuGe0SD6Vlj3hPCkpVh7z0JmZvIuKEqOYTvhqQQn48amnQRaQQmoIk29l
4RvAR6DQ6i3DKTieMAX2FleHcS/OQ6YQ1IMUWGxrx7WDzhEcUxPFWMPKuSsH3+fo
IVnPYh5+OyiBQryg604TY1oa+XlkvCuchVxqOu5v1gi0/OMsSoSq1SxBv+1vy8n1
1Yf57krFc215AfN7AkPuxv0FJ3yxP3OLidqaHNcTu8HDayHzmfXFA9VpUJv88ysy
gkC00ivz1UNbruHCWpnWMc9GCy+Nyw==
=ayPQ
-----END PGP SIGNATURE-----

--M69pUZkggAH7yLKq--

