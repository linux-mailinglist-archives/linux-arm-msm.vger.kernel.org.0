Return-Path: <linux-arm-msm+bounces-119075-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 4Ek5I3BtVmpg5QAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-119075-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 19:10:08 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E0906757390
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 19:10:07 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b="br019/Gv";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-119075-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-119075-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id EAF3C3036CDD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 17:10:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F49039CCF9;
	Tue, 14 Jul 2026 17:10:05 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55F8339CCE0;
	Tue, 14 Jul 2026 17:10:04 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784049005; cv=none; b=p1JshQclDBeDG928eRii2qW9hzBDOfpDv7tqn+016cR9Mlu5DIYlCnzdGJNK3Py6TMZzglnhKD3Y4c7YbeDzcn//xQnKmiHK2U5+UcgplpHdMNJgB4YqVemiFNbpHaTNvCVT/yjZl7u2oq/PprKwioGbyYdu2nQpMabEmt6WZHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784049005; c=relaxed/simple;
	bh=iU5TgyyeLsPI9CTpyKnBbHSPRESCRRzYcTsPmKBCPzs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GYcqKpcl9tI8KVJ7AuH2qps6aijbTQRA//qgZh+HAKllOs5OKFm+Vfr3JQHKSwSuxD7a4Dh+4FUfLzhtnMzlRVawYAkcMb1phjTTzG/ifhreai16U1pS62O+YAg79gr61DriHIBeRdDXGlGlNh8XuAWHb6oOEyH+u7teqa4GYbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=br019/Gv; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D47821F000E9;
	Tue, 14 Jul 2026 17:10:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784049004;
	bh=p8krTh6h1D0xl3+E4ar9pBMXTTFfLOvTztKmJu8UNmY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=br019/Gv7LNagHxZ2TIUhQ4Ui5YbEMu3tScUpmLLNlYU1e5p2/qHGPryfUlTtHSMe
	 6NQfssgg/7VGDNRv5r/hiimT5P84JdzlKPvIcAXAiUuUReJNHIc0nFtDEd40VZ4tQ9
	 SoKpQpwlBYaIZ+eQpZ7PhBVrreY0e+JcPZd8QnM9mEBmr16OzwOuXKu+H83w12UZdR
	 l8zrwQmxbad2KQ01+juChQPg12QjQkz+kLL43RW1pP4++XSEWDLtU+BSoWw7M+ENGB
	 oDSTVowI27xZVOvFQLHKe3X1cNAUyFJLPpiXIySQG64YSI0YbANJgla7dj/Syw1B88
	 j1Z6y1GlVjZuA==
Date: Tue, 14 Jul 2026 18:09:58 +0100
From: Mark Brown <broonie@kernel.org>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: linux-sound@vger.kernel.org, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Shengjiu Wang <shengjiu.wang@gmail.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	linuxppc-dev@lists.ozlabs.org,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Maciej Strozek <mstrozek@opensource.cirrus.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	patches@opensource.cirrus.com,
	Srinivas Kandagatla <srini@kernel.org>,
	linux-arm-msm@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>
Subject: Re: [PATCH 01/14] ASoC: codecs: NeoFidelity: repair the kernel-doc
 format
Message-ID: <134b7d6e-979b-4b73-a99b-98e98a9696d6@sirena.org.uk>
References: <20260714014445.569992-1-rdunlap@infradead.org>
 <20260714014445.569992-2-rdunlap@infradead.org>
 <4eddcb03-3c2a-4ef4-8825-e750e8109476@sirena.org.uk>
 <1a885ccd-77bb-4537-89c9-6b031c2f3812@infradead.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ICQm/UaAuCcRnyGo"
Content-Disposition: inline
In-Reply-To: <1a885ccd-77bb-4537-89c9-6b031c2f3812@infradead.org>
X-Cookie: C for yourself.
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.76 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-119075-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[broonie@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_RECIPIENTS(0.00)[m:rdunlap@infradead.org,m:linux-sound@vger.kernel.org,m:perex@perex.cz,m:tiwai@suse.com,m:shengjiu.wang@gmail.com,m:Xiubo.Lee@gmail.com,m:festevam@gmail.com,m:nicoleotsuka@gmail.com,m:linuxppc-dev@lists.ozlabs.org,m:ckeepax@opensource.cirrus.com,m:mstrozek@opensource.cirrus.com,m:yung-chuan.liao@linux.intel.com,m:pierre-louis.bossart@linux.dev,m:patches@opensource.cirrus.com,m:srini@kernel.org,m:linux-arm-msm@vger.kernel.org,m:lgirdwood@gmail.com,m:shengjiuwang@gmail.com,m:XiuboLee@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[broonie@kernel.org,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,perex.cz,suse.com,gmail.com,lists.ozlabs.org,opensource.cirrus.com,linux.intel.com,linux.dev,kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp,sirena.org.uk:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E0906757390


--ICQm/UaAuCcRnyGo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jul 14, 2026 at 08:57:06AM -0700, Randy Dunlap wrote:
> On 7/14/26 3:20 AM, Mark Brown wrote:

> > As mentioned in submitting-patches.rst when submitting a patch series
> > you should supply a cover letter for that patch series which describes
> > the overall content of the series.  This helps people understand what
> > they are looking at and how things fit together.

> Are you saying that my cover letter was insufficient?

> https://lore.kernel.org/all/20260714014445.569992-1-rdunlap@infradead.org/

Well, quite apart from anything else you didn't send to to me so as far
as my inbox is concerned it doesn't exist.

--ICQm/UaAuCcRnyGo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpWbWUACgkQJNaLcl1U
h9ABwQf/eHvS+UV1AYoZe6DwnsnW8Tgd6rs2VG84fELITR7/eEy+Q5m43Tn8RKt4
xEDWcuDNbzcbk8Rv22XtI7SwSmWTstlpeYGlKRSDczjaKodKI4YL0IF1fpJ9gJ1E
sPowWRSaO/eE41MuhRUHhqbVNjmqbeSBfz44ZaB43wStzbR7ikUfWjFZRVqTukgZ
Rm85kdwy2rRRJBM6fNTINkBSeMbcH5lwr+nRgYOei6rQl+Qq599hzpptldSBFt8P
GzGnRYN+OAWaH1Wkcp6Ty6G3QZf61JeroYWXQh2SIvIZDqDCtA70kyw3fy+0qFc0
VqBIwc8XXtqwIoXBb9lv3C1qK5SnXA==
=4vX+
-----END PGP SIGNATURE-----

--ICQm/UaAuCcRnyGo--

