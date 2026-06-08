Return-Path: <linux-arm-msm+bounces-111864-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id fAjtE66xJmoZbQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111864-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 14:12:30 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F1E865600F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 14:12:29 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b="O/T8f9x8";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111864-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111864-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E6D58304698A
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jun 2026 12:09:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 784E4376BE2;
	Mon,  8 Jun 2026 12:09:01 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 732644071EC;
	Mon,  8 Jun 2026 12:09:00 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780920541; cv=none; b=knCdgfWSvmAk3cWwH8ulrpwhAtTBLF32/xxOZIo/MXQrB/4LPxToFjv9MOg9vzzSTou5pfq4Ep0bpsPoTVwiir0edgHu6OMBuBwefTxE0wY+fXtMqRoVbeD9FP31Hvx/AUlKZ/rdHeICHXkkS+xor0DQpZpgWJQYoKXAGLFtEWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780920541; c=relaxed/simple;
	bh=U6Va6A7yV2h/7MYZjDOKOdZ5mjQLKjPy6MtjSG6jY+U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X6zQa7umUmXUOTnDyF7dOe4S11NWN2jq+dxaIlLak/rDmJTBDBisAg7gyRMAsABiuRIuIyzHNc628nQa/utTY/vWWFgbwI29lgXokTWrjapxlkgUhiVwC/inxClCVMXMHmKFuRR737qDy6yhQEmqspPJ9AkhOYcO6VYoa4mvV5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O/T8f9x8; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8BBDF1F00893;
	Mon,  8 Jun 2026 12:08:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780920540;
	bh=YxYxM+EQAJviJu+eUvnr7ua5tymH8nx+ZxwtxUj8Qy8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=O/T8f9x8L7WOUnpNT+6S9/GuIQvsZO0hX4tFBjMPurbNX3J7fmu/vFGUWkAl1oolU
	 sQnLtVQKPScTCK0fetgd7lP3CgvQwUgmnDls0fzafwwUnouUzxD3uk0Dx3jBho/Bls
	 fSWBfCarHhxZvxrzf+uUFC2PP+WSlFMG1aXSRp6a/A48fvIvGqADDkFlO7bQ9mOfoZ
	 9QB4frZInLE4njTl68aLNbAP/qoWk9QTd27XAJxRUaFNF53prXxrJ5Klw3PPmbsw5N
	 7LaZrEtXuX1YUDCUYn9hTD0yLedIqbOKSQFZNxPap4RbDzOWi8ppYXWVlTUqvcZzL6
	 Dot+eriqm5gxQ==
Date: Mon, 8 Jun 2026 13:08:55 +0100
From: Mark Brown <broonie@kernel.org>
To: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/3] ASoC: qcom: sc8280xp: ASoC: qcom: sc8280xp:
 enhance machine driver for board-specific config
Message-ID: <b09da7e1-ddc1-452b-9380-964f9ed3b733@sirena.org.uk>
References: <20260608023011.942228-1-mohammad.rafi.shaik@oss.qualcomm.com>
 <20260608023011.942228-4-mohammad.rafi.shaik@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="eN/pICkJk3dwI3nl"
Content-Disposition: inline
In-Reply-To: <20260608023011.942228-4-mohammad.rafi.shaik@oss.qualcomm.com>
X-Cookie: We've upped our standards, so up yours!
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.76 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-111864-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[broonie@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_RECIPIENTS(0.00)[m:mohammad.rafi.shaik@oss.qualcomm.com,m:srini@kernel.org,m:lgirdwood@gmail.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:perex@perex.cz,m:tiwai@suse.com,m:krzk@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-sound@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,perex.cz,suse.com,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[broonie@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,sirena.org.uk:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9F1E865600F


--eN/pICkJk3dwI3nl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jun 08, 2026 at 08:00:11AM +0530, Mohammad Rafi Shaik wrote:
> The sc8280xp machine driver is currently written with a largely
> SoC-centric view and assumes a uniform audio topology across all boards.

> +static inline int sc8280xp_get_mclk_freq(struct snd_pcm_hw_params *params)
> +{
> +	int rate = params_rate(params);
> +
> +	switch (rate) {
> +	case SNDRV_PCM_RATE_11025:
> +	case SNDRV_PCM_RATE_44100:
> +	case SNDRV_PCM_RATE_88200:

rate is in Hz but these are bitmasks.

> +		return I2S_MCLK_RATE(44100);
> +	default:
> +		break;
> +	}

The function only works since it ignores invalid values.

> +static int sc8280xp_snd_hw_params(struct snd_pcm_substream *substream,
> +				  struct snd_pcm_hw_params *params)
> +{

> +
> +		if (data->snd_soc_common_priv->codec_dai_fmt)
> +			snd_soc_dai_set_fmt(codec_dai,
> +					    data->snd_soc_common_priv->codec_dai_fmt);

Should we error check the functions we call here?

> +		if (data->snd_soc_common_priv->mi2s_mclk_enable)
> +			snd_soc_dai_set_sysclk(cpu_dai,
> +					       LPAIF_MI2S_MCLK, mclk_freq,
> +					       SND_SOC_CLOCK_IN);
> +
> +		if (data->snd_soc_common_priv->mi2s_bclk_enable)
> +			snd_soc_dai_set_sysclk(cpu_dai,
> +					       LPAIF_MI2S_BCLK, bclk_freq,
> +					       SND_SOC_CLOCK_IN);

Is SND_SOC_CLK_IN right here?  The flag sounds like it's enabling the
clock on the DAI but this is configuring the DAI to consume a clock.

> +		if (data->snd_soc_common_priv->codec_sysclk_set)
> +			snd_soc_dai_set_sysclk(cpu_dai,
> +					       0, mclk_freq,
> +					       SND_SOC_CLOCK_IN);

This is configuring the CPU not CODEC.

--eN/pICkJk3dwI3nl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmomsNYACgkQJNaLcl1U
h9DZNQf/aNqyWtGZPLMioRfjby2cvex5oZnhS/gRqvU4XV0jDE4yNjhQtDEL3pZM
ExX51L5UKEz1Xa1G5NIrrGNj25DMS+8hky/A6eDyRdIiomaPbYA7xx41YuUDvMQs
akRkyl1etIay31Wi6x1aeKmSj5ONT000Bo9o+G5XPrzF5wi2Qhvml9kKNtMzPYup
PLpicmdt7jxMbhejjXY3YDylx9swflbJ+nMMs4Ug6f0PS8vHrL3DmLyaf/HKuzFw
rgR/bj2fhcrPDzjhnJ3epDeSUw+EFBRxSrN6+hjps6glbt6NPB5UZkCBFn8WhcEs
ZOR/OQLnOxREM99nm/5Dr0F4o72rxQ==
=3rUg
-----END PGP SIGNATURE-----

--eN/pICkJk3dwI3nl--

