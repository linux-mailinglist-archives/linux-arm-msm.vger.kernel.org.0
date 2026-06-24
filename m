Return-Path: <linux-arm-msm+bounces-114357-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id OTdMKNTlO2oTfAgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114357-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2026 16:12:36 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 077436BEFD7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2026 16:12:36 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=lG0OcRZz;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114357-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114357-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id AEF81301946A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2026 14:11:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 516CC3BCD32;
	Wed, 24 Jun 2026 14:11:27 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C7413BCD0E;
	Wed, 24 Jun 2026 14:11:26 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782310287; cv=none; b=TYjoZQrW8BRC7dhvqcU/kl3BlX5syQW+6BQQBKOWE50WMceawFW1MBwuvf1OSmpzDs4v3nZqzPg0kAqIgWqRVImdNA0Zq9mXDugAa1SaJOlg8BirprwUnbtLtnhQ2uBNCBW0yb848IAw314/HuFZZIGMotA2XiLfy2LpiWQkDcI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782310287; c=relaxed/simple;
	bh=jZ320krN8dHEgi/JkuyBVjgEoA4qaDJMCA68GPpEXhk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iOXhSVcxwmyg2FaKVxP0gbPcyuAZQAXIcwEGh0OCkjZlP+Ygmouo43jd6I/S2CNIMTNZOCn9yrKpr9R2917bS7Qh7wk++mB/s6M2JFvHpXk3ZO3vVPhY/41FGOiKnIEx6bzUBrI+RVOqviH6xEePjY6z9iswJzNXMQrl3o8Un/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lG0OcRZz; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F46B1F000E9;
	Wed, 24 Jun 2026 14:11:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782310286;
	bh=jZ320krN8dHEgi/JkuyBVjgEoA4qaDJMCA68GPpEXhk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=lG0OcRZzAfKyPKvDx29fy1fLPY7SfTC9mfoxBKaHDMkIRaFtWWqfANOBR8bl5Lhfl
	 ipafPkBsBKalWfVI3xmF1bS3c7TPc6X86KGiaK9Dv966+gOfEgTDIv7B6xi4pM8+t2
	 2uyucoR/ktjJxXBiWbxQrsusu2EE2h5z+X+aYQ5dsurxYGae0hRl7DnKAhOO/wt8A/
	 hyVa5Z1FbxSeYfQwOcd3bc0CeMwPYi3QklpE7pZCWEdf+4TeEat4gkqcfQcuOhnjKA
	 hQxJEZaCfU9prAsjpfamRFeAOTjLAAEESP2hKx4OBLajI7tClLLGq7o6adD0eiY2KP
	 mL2wQJ2eHQ/ew==
Date: Wed, 24 Jun 2026 15:11:21 +0100
From: Mark Brown <broonie@kernel.org>
To: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] ASoC: qcom: q6apm-dai: add carveout SCM assignment
 for mDSP buffers
Message-ID: <ffba81ea-4b47-4a1f-a4d6-82da4a646deb@sirena.org.uk>
References: <20260624123748.502781-1-ajay.nandam@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="MRpDYXR7NsSHY1xE"
Content-Disposition: inline
In-Reply-To: <20260624123748.502781-1-ajay.nandam@oss.qualcomm.com>
X-Cookie: Your password is pitifully obvious.
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-7.26 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	TAGGED_FROM(0.00)[bounces-114357-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:ajay.nandam@oss.qualcomm.com,m:srini@kernel.org,m:lgirdwood@gmail.com,m:perex@perex.cz,m:tiwai@suse.com,m:linux-sound@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,sirena.org.uk:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 077436BEFD7


--MRpDYXR7NsSHY1xE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jun 24, 2026 at 06:07:48PM +0530, Ajay Kumar Nandam wrote:
> On targets like Shikra where audio processing runs on the mDSP (modem
> DSP) instead of the ADSP, the DSP operates with stage-2 secured memory.

...

> Depends-on: https://lore.kernel.org/all/20260609064038.492641-1-ajay.nandam@oss.qualcomm.com/

There's already substantial feedback on that series...

--MRpDYXR7NsSHY1xE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmo75YgACgkQJNaLcl1U
h9BKcwf/VkTWXrhaQra31KbthXAWnvGUYGF93WxJpaaDdC10xXYSY4dasuStPW+0
WCGcDm0PjTNj8FhCwcRoaTwR49qnRdg8O3RzVM5T56v11OOXipPJQCl9AThpotpA
ecHYyLxtocjh3wrTRNJpiEnOOh1DR4d2khpEqIIcOVuCwN1jIP3nDogId/IJm7ul
OizYMwrDWnVWUS/je5RPsC0oZkq3IqcCtHCA5viiZJRNUTfWOS12g1CZdH/Luln2
rPziL5ClOmVqcIQ7e4hhwmON5LIHafbuFLLLQWb+sKi8Iak2prSO1T8QbQtTr4Ic
EAPVTTA1KhaBaDEjp2T3vpp6dXWAew==
=izBn
-----END PGP SIGNATURE-----

--MRpDYXR7NsSHY1xE--

