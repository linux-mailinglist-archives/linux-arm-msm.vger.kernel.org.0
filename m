Return-Path: <linux-arm-msm+bounces-115736-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 4+X6C+gxRWoB8goAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115736-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Jul 2026 17:27:36 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C6D736EF3C0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Jul 2026 17:27:35 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=baylibre.com header.s=google header.b=L2PZnNjg;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115736-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115736-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A6887303DAF9
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Jul 2026 15:20:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E049192D8A;
	Wed,  1 Jul 2026 15:20:16 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51DD8342514
	for <linux-arm-msm@vger.kernel.org>; Wed,  1 Jul 2026 15:20:14 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782919216; cv=none; b=NU6bDEwBy0+0WQi3pAIvS0Izgy6cfSBw8X1RIlSRaAqQn7K6C61pDpmUnVjsiXTGAFDLXOHezq0r3PuItTJ+TuAA3Atskd/GHSgL9/aTOnbJku6v/baqeQ12s7riL3AcvZ47sRkQw+2+Y67URH02d9UbfGduBuVJRkS96EPhexM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782919216; c=relaxed/simple;
	bh=WoEMouwpJ9MP0SByDC6EGgovMZINBtXRAayeX43OEAE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PQBaDkYynm9IDDEVo39x1BdmmGnqnAff1k5A1jmzZV4Ce/9slPtwhuBmRpLtsEJG6eV0W6aeDepYJjRJYUtVauZquAhxCqECMIQcc+gvWUr0uLpHz0pxr+K02WC1dwc9F2C7GvgCR0tw55KOCXj6JaZahSy94EbSZnveFe/e5pg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=L2PZnNjg; arc=none smtp.client-ip=209.85.128.45
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-493bb510ce4so5941005e9.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Jul 2026 08:20:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1782919213; x=1783524013; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Y56nzJkD/cZOP4zMLr6iT6rkAPVerpYOSX82UBBme6Q=;
        b=L2PZnNjgnSmwX05U/U1hWAW4KOGWpRfM9J+eNFPoGSZQTl2yePwd2ZOdFgECFbmc6c
         iI0osFhRYkWVTbq3LLrgzkaw+Fz//jlNf6zFUkqPMKH34ZELAXBt5kDgIhTVmdxbUeaF
         E1P4wDJ/bcjAX3H8VWS5+NPIXi3gv1zGjoYF+9/AC7/VMnSWILIWucI6Ju2TRmsHIKGo
         c9EE7fmJTiPTTCUxkvJebtrovAb/5rMxtPWVbgq8ZflVBHI6rWREWVlrurIsff5u8sew
         1FVjLYTksQPhZvg5/GKWWnI3QHxSIEo4aq1ux+O6IrLGqk1nDPfO9znHsy3Ps93woX17
         VmjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782919213; x=1783524013;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y56nzJkD/cZOP4zMLr6iT6rkAPVerpYOSX82UBBme6Q=;
        b=arQMXydX1IvKBJJ5KWVycKnGRcWBC/kJ+NYzFigPfK3BfmWKemx46HspEWxl8Fvhad
         OS3VUw2Z5F3q4zXhdK2OHEzef/fqnre3u3JmGT6zyFMbovrtH5R0dr+hHEnMrb7UA5CP
         6mX8bHrDM/Y0QdLhGnykn+yZqNHtRM89UQ4y0d4ccbaPKFXSoSXZF0m5nuieJTYqCvde
         MxkRLSfPltJZfQMrQ+QO6Gs/pYc09AUycIeWFmwO/vP08ji1Voinsdul3Mo+3M2EP3C7
         I/nlR7d0+yTbGAXltPM/EblcNxUwQilJHlcwVf5apd5df5PvQY0SkZc64hTDzh23LI+H
         x0vw==
X-Forwarded-Encrypted: i=1; AFNElJ+vXEDKB72dwEDUROWilmP+z2B09UY9PrsDtfbAz14kJgtOoudh3aEsQAHgv5aQ8POPTfDS+oYJ2kprgU/a@vger.kernel.org
X-Gm-Message-State: AOJu0YwDm10NOp8ou8iwFRNxacELv30tteZPfnRVta94VHTsTaT16JE8
	yAjCF+swIfDc7yBajkqN32a2JdVAqbiQvCe91R1O8KUAt9pPErExu2vGrZv7Z1z/GU0=
X-Gm-Gg: AfdE7cn76Vm8FoKFJAN+mFWkrOqO+2mFGgrEqc2jtTuNM1eTM90xRKN6b5alFmwKh2Z
	araIjco41A5aTCS8Mmek5A3nQ4fRiYOLqhfTawvwsmdE6vLxPukEEJNhXIiw22f+W9JqEJsy66/
	+4e/y+qDhFSznTaYOWnBLUtVbC1hBbLvQu472DGL9M8AMAuSUqoSid8DxfCVDiu2Y3Mmc3Xpjko
	hiEKGwDoHB5zznQBMst8FXyfZgfYPq9O2BfM6sfW0ny/R5Yv+0eXebHXddd4cBuRTx4IejqeVZa
	rf+vuZ5sYfxiV3IdRdEF7T2IT8rezH6WDks9rtT15GuQC/wMvtZGdaLBVo4hFIz8iUmeircAIWs
	iVvumnf06wObPe7eJkn55PZq8FEqM8N14tyOfRMi4qz/9Cnxu7EMi0ZDu8bx2gyoDVm5JZj/pEm
	5zQYZdE83bu4MgO/uH7VndU7RNQPZSbcz4vcZM+IfYUj3XlkgNWmWQyEmX9jRa6FOcytf8GFWBp
	k3Z
X-Received: by 2002:a05:600c:8b2a:b0:492:6113:d4fc with SMTP id 5b1f17b1804b1-493c2b56fccmr33875115e9.17.1782919212545;
        Wed, 01 Jul 2026 08:20:12 -0700 (PDT)
Received: from localhost (p200300f65f47db04f795131629de758f.dip0.t-ipconnect.de. [2003:f6:5f47:db04:f795:1316:29de:758f])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-493bef17c82sm43085345e9.1.2026.07.01.08.20.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 08:20:11 -0700 (PDT)
Date: Wed, 1 Jul 2026 17:20:09 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
To: Srinivas Kandagatla <srini@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: Takashi Sakamoto <o-takashi@sakamocchi.jp>, 
	Dave Hansen <dave.hansen@linux.intel.com>, Sohil Mehta <sohil.mehta@intel.com>, 
	Raag Jadav <raag.jadav@intel.com>, Heiner Kallweit <hkallweit1@gmail.com>, 
	linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] soc: qcom: apr: Drop unused apr_device_id
Message-ID: <akUvg-U8WnrwyA7f@monoceros>
References: <dee008af1510ee2a71087f3798814dd516730413.1781517268.git.ukleinek@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="clqrflh2ukfelm5m"
Content-Disposition: inline
In-Reply-To: <dee008af1510ee2a71087f3798814dd516730413.1781517268.git.ukleinek@kernel.org>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[baylibre.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:srini@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:o-takashi@sakamocchi.jp,m:dave.hansen@linux.intel.com,m:sohil.mehta@intel.com,m:raag.jadav@intel.com,m:hkallweit1@gmail.com,m:linux-sound@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	DMARC_NA(0.00)[baylibre.com];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	TAGGED_FROM(0.00)[bounces-115736-lists,linux-arm-msm=lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[u.kleine-koenig@baylibre.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[sakamocchi.jp,linux.intel.com,intel.com,gmail.com,vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[u.kleine-koenig@baylibre.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[baylibre.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[monoceros:mid,baylibre.com:dkim,baylibre.com:email,baylibre.com:from_mime,vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C6D736EF3C0


--clqrflh2ukfelm5m
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v1] soc: qcom: apr: Drop unused apr_device_id
MIME-Version: 1.0

Hello,

On Mon, Jun 15, 2026 at 12:04:28PM +0200, Uwe Kleine-K=F6nig (The Capable H=
ub) wrote:
> apr_device_id was introduced in commit 6adba21eb434 ("soc: qcom: Add APR
> bus driver") in 2018, and since then not a single driver made use of it.
>=20
> So drop the unused id_table pointer from struct apr_driver and move
> APR_NAME_SIZE to the apr header which still has a usage of it.
>=20
> Note that with the id_table being NULL apr_device_match() degrades to just
> of_driver_match_device(), so replace this callback accordingly.
>=20
> Signed-off-by: Uwe Kleine-K=F6nig (The Capable Hub) <u.kleine-koenig@bayl=
ibre.com>
> ---
>  drivers/soc/qcom/apr.c          | 25 +------------------------
>  include/linux/mod_devicetable.h | 11 -----------
>  include/linux/soc/qcom/apr.h    |  4 ++--
>  3 files changed, 3 insertions(+), 37 deletions(-)

Just a heads-up: If you apply this patch now, it will conflict with
https://lore.kernel.org/all/cover.1782808460.git.u.kleine-koenig@baylibre.c=
om/
that I expect to go into 7.2-rc2.

I intend to send a v2 of this patch once -rc2 is out (and if my
expectation turns out to be true).

Best regards
Uwe

--clqrflh2ukfelm5m
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmpFMCYACgkQj4D7WH0S
/k7GlQf/exJd7rEL7b7hgfotikQMGakIuf8l3GZVzu9tUv9xP3Z/eaqb7EpuGQBW
b4ugFTFXxqGkmtd7Om1J90fTGaub4EsuVyvEHC49ZNFO5d7qmBF13b3WtiKXWENh
nlRX2id17Zrbh/JVA7Hbt7cFm3PvRV046Mm5VT3OIu1o4+q3b6BoEaJR+wdWS+O8
huX6p6QyBCLsyz1Ii7psCNGeDa9tnSuEHS1v1BromDePGzOQ2jfAqjuk5Z06n1vc
wh8JNgOkIkCE2f1yHRNRDZoz480V9XAeFi1w4MJNRe3yZIvNM6wePkCwdhhhwzly
GUqiX2FfdNJGp4T708tzIO2gAUSA1w==
=76mf
-----END PGP SIGNATURE-----

--clqrflh2ukfelm5m--

