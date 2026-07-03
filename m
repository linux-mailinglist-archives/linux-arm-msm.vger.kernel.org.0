Return-Path: <linux-arm-msm+bounces-116347-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id tJi4C0XQR2qvfgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116347-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 17:07:49 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B6852703B76
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 17:07:48 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=kAMhTHq8;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116347-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116347-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B14103015C2C
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jul 2026 15:07:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F740414DDA;
	Fri,  3 Jul 2026 15:07:43 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C59840B372;
	Fri,  3 Jul 2026 15:07:40 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783091262; cv=none; b=ennyULXa2SaUZMrjZdcaNsP3pMcoe1E2Uw+O7nxYB6Qtv7WbKf8Li5aNdurVGH0usgPpGA8lkgmCJCLmIq4MFCKWTNxMyNHlpWZorK7ne9mkUbNb1JxyXf+DMeWEQT+iJ44NPsmTHTo13OXviYIvULRshVXTSFrovDrL1j9wBtE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783091262; c=relaxed/simple;
	bh=cMByBA8cjG7Uj/5KbWtpsfK+CdbivuNr6hrI+A89nn4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pZj6m5pyKY2uaOYi/a0ArHdkAfKtkcTX3rZke4J3b4pYUXuV7uWd4rwxcU7Muhf0RCENb1SuSzbIUlH0ekj6578nqsUBV+O9F0UCuZaVLHPceN1cPR/vaQ9fer9w9dLBtzo/8q6LmnLUgQIoz75WLJnUBjKMtbaAF8Rn+xoY/zU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kAMhTHq8; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68D291F000E9;
	Fri,  3 Jul 2026 15:07:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783091259;
	bh=SMi+VG5DArUOAeld0i6wUf7PJTcgFdKNi9iXcWAA9Go=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=kAMhTHq87AReQzzfTgya2raan5MctWKZpi30pumI5NveDfqwZM+GIhnozVNTdH9Tb
	 Irhoo6m7dwQEyXHbUWOZfuuLz9rcfrRgGYO0XplCyXj08C8cL0RR5Eh2+qUi3HYaa5
	 AQV/rmh5qavXQCUC8Au5QFJTVjMRQIOdy9pf/PthRrdzeWOVVzC3zrPPEOD6bfYeLO
	 Upq1cVV6GKX344rPz3gJffvZ7muyWwdUUNa8aZ3JvYRI7oIKG/oUbhh0LBnflTY7tX
	 KY4/NRfLts6otiYAwLUpnEH75C/qeFneScaiMs9GUGTP4SF3tV5QwrWUyZlOjtoEhW
	 bVUoqMucLK67A==
Date: Fri, 3 Jul 2026 16:07:34 +0100
From: Mark Brown <broonie@kernel.org>
To: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] ASoC: codecs: add Qualcomm WSA885X codec driver
Message-ID: <317be447-316f-4120-9008-2a1593328c68@sirena.org.uk>
References: <20260701135913.1641328-1-prasad.kumpatla@oss.qualcomm.com>
 <20260701135913.1641328-3-prasad.kumpatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="HVmAzgWLjUCzpIAC"
Content-Disposition: inline
In-Reply-To: <20260701135913.1641328-3-prasad.kumpatla@oss.qualcomm.com>
X-Cookie: Another megabytes the dust.
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.76 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-116347-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[broonie@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_RECIPIENTS(0.00)[m:prasad.kumpatla@oss.qualcomm.com,m:srini@kernel.org,m:lgirdwood@gmail.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:perex@perex.cz,m:tiwai@suse.com,m:srinivas.kandagatla@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-sound@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[broonie@kernel.org,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,perex.cz,suse.com,oss.qualcomm.com,vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,sirena.org.uk:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B6852703B76


--HVmAzgWLjUCzpIAC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jul 01, 2026 at 07:29:13PM +0530, Prasad Kumpatla wrote:
> Add an ASoC codec driver for the Qualcomm WSA885X stereo smart speaker
> amplifier controlled over I2C.

> +static struct snd_soc_dai_driver wsa885x_dai[] = {
> +	{
> +		.name = "wsa885x_dai_drv",
> +		.playback = {
> +			.stream_name = "WSA885X TDM Playback",
> +			.channels_min = 1,
> +			.channels_max = 2,
> +				.rates = SNDRV_PCM_RATE_8000_192000 |
> +					 SNDRV_PCM_RATE_352800 |
> +					 SNDRV_PCM_RATE_384000,
> +			.formats = SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S24_LE |
> +					   SNDRV_PCM_FMTBIT_S32_LE,
> +		},
> +		.ops = &wsa885x_dai_ops,
> +	},
> +};

Does the device actually support all the rates advertised, 11.025kHz for
example?

> +static int wsa885x_rx_slot_mask_put(struct snd_kcontrol *kcontrol,
> +				    struct snd_ctl_elem_value *ucontrol)
> +{
> +	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
> +	struct wsa885x_priv *wsa885x = snd_soc_component_get_drvdata(component);
> +	u32 mask = ucontrol->value.integer.value[0];
> +
> +	if (!wsa885x_is_valid_rx_slot_mask(mask))
> +		return -EINVAL;
> +
> +	if (wsa885x->rx_slot_mask == mask)
> +		return 0;
> +
> +	wsa885x->rx_slot_mask = mask;
> +
> +	return 1;
> +}

This looks like you're trying to put TDM configuration in the control
API, it should be done via set_tdm_slot() - the driver does have one,
but it only configures mono vs stereo with no control over slot
placement.

--HVmAzgWLjUCzpIAC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpH0DYACgkQJNaLcl1U
h9BALwf/XrfgYwEy2vrw/jGbEpcuEIZVAeVKRRyPW7oyKOCTse7Ml9OaNw07rSic
N7ez8JChLdTMa8K2nn/nAQOy7r/6XdblwXjnt0ZW0nn1DdZQ0wyeyg3/Np/lm5/+
hWmo9WvpiTIlBfXWopn2pet6bvInFmFffOTcKF1z/l0kXToPBSPxPFAglE6Pcel7
Vl+P44dFIMMHtyooNE1j/QJziqQcnUrnJ7EQzJnSj+PS0/P88VPuHKn0hy8vyfrY
v94dEGwkz/ogqAts0qzwOymtztdxgSvuOUfZQn6txTCWYnSGos2NcYteeiYE9U0E
+h+JS0YTpl4T8HmC8epc5lpaXgOSmg==
=cgsG
-----END PGP SIGNATURE-----

--HVmAzgWLjUCzpIAC--

