Return-Path: <linux-arm-msm+bounces-111858-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id YH8eF2SwJmrdbAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111858-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 14:07:00 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C12B655F6B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 14:07:00 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=Pn7yfErO;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111858-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111858-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id EEF6C302864A
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jun 2026 12:02:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD8AA372ED2;
	Mon,  8 Jun 2026 12:02:02 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFB6E348866;
	Mon,  8 Jun 2026 12:02:01 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780920122; cv=none; b=rxZOEivm4smmzJte8gXpeyWUM7ju4Ijj2EUuMnthijsKazAKIDFPC1az4OrEYFESPOSpft5cOVJbdJ3uOSsiUw5yM8SG7Nh2zEiQDuI45Uo5x16Q5pW4Y5179MX9GZRihmLIsBYJzMJM1kMDi6Iy9VkpB2BaSqDamV4wmxxjE8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780920122; c=relaxed/simple;
	bh=jNt2FX7Uh7Zxmcau41tMiH3pglesGCrWudhzVbCsnco=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=euqS1kQ/oF0C7JwL2omsy2EjtMU3Dxg8dZ8szXPiNt9ZS3OlA0dJBtHH/Z98qJ9zcXpcGNlxou5nNy9teiR7eQAaOIvk5/UrZ4nBFCIreynIlfuJ61mSWDlaeKyo2svtD0Urj8u6VvsmSVhySS/DZcvVwJe395YTRwimN1xs2c0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Pn7yfErO; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9D791F00893;
	Mon,  8 Jun 2026 12:01:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780920121;
	bh=A+y+vRJyoOlaB751MA+9AXvBoLKprOzhfwW0uwy6fzs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Pn7yfErOI4mLQT3KPtv3iRIVHfkSpdsloWDPrxGCSIhUaliRTvzZmnR9v7JbXnh2/
	 2MpkrPBa7bj2DoUCBBEIghs+eZ+Lb9yXf06OOF835XTw5bNk5ty+awOMS5I5CNMgpE
	 JZaO7lFD79gNpoQ7AdTBVPGuRkDOwxYFJaF/SDVVj9q+2CuD1Cb04DScJRT/yAYOXf
	 eTqx47miNx10mmdWnt+GuhR2bYd9gCEnnwTvhPAsDZGWTp8rR6mQ6oDxQFFW1GBdUz
	 yWgskBHBvbmGrubTZyscpxNRTL0aWiXdWVg/B6fGfSKZPWMDN1mFepHxYUMAweBDYy
	 hbrsYpJzoQwZA==
Date: Mon, 8 Jun 2026 13:01:56 +0100
From: Mark Brown <broonie@kernel.org>
To: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: Re: [PATCH v2 2/3] ASoC: qcom: q6apm-lpass-dais: Add MI2S clock
 control
Message-ID: <e6567656-8745-4f07-9636-7779d32ccbcf@sirena.org.uk>
References: <20260608023011.942228-1-mohammad.rafi.shaik@oss.qualcomm.com>
 <20260608023011.942228-3-mohammad.rafi.shaik@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="RGMv96CRn1GDbQG5"
Content-Disposition: inline
In-Reply-To: <20260608023011.942228-3-mohammad.rafi.shaik@oss.qualcomm.com>
X-Cookie: We've upped our standards, so up yours!
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.76 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-111858-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:mohammad.rafi.shaik@oss.qualcomm.com,m:srini@kernel.org,m:lgirdwood@gmail.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:perex@perex.cz,m:tiwai@suse.com,m:krzk@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-sound@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:srinivas.kandagatla@oss.qualcomm.com,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[broonie@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,perex.cz,suse.com,vger.kernel.org,oss.qualcomm.com];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,sirena.org.uk:mid,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0C12B655F6B


--RGMv96CRn1GDbQG5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jun 08, 2026 at 08:00:10AM +0530, Mohammad Rafi Shaik wrote:
> Add support for MI2S clock control within q6apm-lpass DAIs, including
> handling of MCLK, BCLK, and ECLK via the DAI .set_sysclk callback.

> +static int q6i2s_set_sysclk(struct snd_soc_dai *dai, int clk_id, unsigned int freq, int dir)
> +{
> +	struct q6apm_lpass_dai_data *dai_data = dev_get_drvdata(dai->dev);
> +	struct clk *sysclk;
> +	bool *enabled;

Neither sysclk nor enabled are initialised by default...

> +	switch (clk_id) {

> +	case LPAIF_MI2S_ECLK:
> +		sysclk = dai_data->priv[dai->id].eclk;
> +		enabled = &dai_data->priv[dai->id].eclk_enabled;
> +		break;
> +	default:
> +		break;
> +	}
> +
> +	if (sysclk) {

...but we just fall through the switch statement if the clock ID is
invalid and use the values.

> +	for_each_child_of_node(dev->of_node, node) {

> +			if (IS_ERR(priv->mclk)) {
> +				if (PTR_ERR(priv->mclk) == -EPROBE_DEFER)
> +					return dev_err_probe(dev, PTR_ERR(priv->mclk),
> +							     "unable to get mi2s mclk\n");
> +				priv->mclk = NULL;
> +			}

Do we need to drop any OF references on early return?

--RGMv96CRn1GDbQG5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmomrzMACgkQJNaLcl1U
h9B9JAf/WD4fg8jkd9mkfIQZJXqF5NmA+0g3Pdv7I83ChxGuAqtbgPirRB7MVuo7
RPfEdJM//8O/VwKIMInOoQnwli9dTlOqO2xLgZ6v2BiJN3OmuS8b0itC8rgiIgmW
L4aDaAHdRWjGhG2nTts+MLLoo70UVQFiBEIR0Faj0SL0llONCANfU9u1Dl4sQlcQ
KzhlYv4jrURu/uZbIj6oSmaWbW2+YD7tqC/vrOTUd2kKk+IbmquHCx8o1Cpi1HJc
yphCr4GjwOr+dBJ9eVGIt9po8X2A3HK//lKjK8ikzaaYjWn4/6wuesB+nbMHDCaV
z3vX9BX25mewM0kuSzu8r21XwnvdNQ==
=qd/q
-----END PGP SIGNATURE-----

--RGMv96CRn1GDbQG5--

