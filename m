Return-Path: <linux-arm-msm+bounces-63925-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B4949AFB2CF
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Jul 2025 14:02:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E45933B2E0D
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Jul 2025 12:02:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8CC44298CDA;
	Mon,  7 Jul 2025 12:02:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UeJKZrTL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58D2D1FFC48;
	Mon,  7 Jul 2025 12:02:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751889746; cv=none; b=cIJLTMkGhoq0mvi1lwhrQ0tX8alnLD0wMB20Ag5atkSGoVSMGpvUeubTsdx8RDkYMrS8/kG5IcrGc0+gIRrKAOZUItUq4Awnw8DUy1qR6SHAAYHDahlb0h/KWYUkpPfzQd8IX5IGj3Aja67vaxxZnbwtB+BsvOPDM5eyURrUSW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751889746; c=relaxed/simple;
	bh=VIqjqK+ketF5zBLE5EGm5mXuiGUfQu9PenuTdQQYfpE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uUyVPX6R7AXAO0clouspDe5Kl4iqLfmyD6IL1KhcW0HNFaA+XUNJf6+IDKOe3TCeP3nMinbLy/u3+PFszcQVEoW20MnaBgDRr0Wzyc34F2cwzVBpbfnNUuQzFVN7ru+V2BvZj1+9aqkrRLRgaiwdp1Y56GybrVTQxCVFFWlvbj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UeJKZrTL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6169C4CEE3;
	Mon,  7 Jul 2025 12:02:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751889745;
	bh=VIqjqK+ketF5zBLE5EGm5mXuiGUfQu9PenuTdQQYfpE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UeJKZrTLur64RLZYwjXyuTAHpBO/SvLlA+iTwBBpbfL1JJdS3Zg8SGBs9RvpyO1Ow
	 5/4HQUuK+fQNL06y+B6pFbc2BtHn0deA4U6335NwiTV0uu44578T5dUslBKCQocztt
	 VScD9mNHwCqyRXezy8Vi1SpwhDXoJEVWlpJfinScAlE/IC7YPbj+fYHSEIV5SGcnbY
	 Mo7O90tPWwgN+oUY17V06pDHDHamBl92ykP8UocnMPR4SFIQkVS0Zeh1a9YiAsosxz
	 NygEgv7oNvMCJby5umSijI/8ao68wh8jhhDIr+AlzxJCd/8h+I2GmILwVehTxTbATo
	 ivkWLjZpU2jyg==
Date: Mon, 7 Jul 2025 13:02:20 +0100
From: Mark Brown <broonie@kernel.org>
To: Luca Weiss <luca@lucaweiss.eu>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
	Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Weidong Wang <wangweidong.a@awinic.com>,
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2 2/3] ASoC: codecs: Add Awinic AW8898 amplifier driver
Message-ID: <57472ea1-a9c1-472b-a178-eae1cb207468@sirena.org.uk>
References: <20250705-aw8898-v2-0-9c3adb1fc1a2@lucaweiss.eu>
 <20250705-aw8898-v2-2-9c3adb1fc1a2@lucaweiss.eu>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="MlZQHhqJVJF+tiCZ"
Content-Disposition: inline
In-Reply-To: <20250705-aw8898-v2-2-9c3adb1fc1a2@lucaweiss.eu>
X-Cookie: We are what we are.


--MlZQHhqJVJF+tiCZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Jul 05, 2025 at 02:03:06PM +0200, Luca Weiss wrote:

> +static void aw8898_update_dev_mode(struct aw8898 *aw8898)
> +{
> +	unsigned int mode = AW8898_SYSCTRL_SPK_MODE;
> +
> +	if (aw8898->dev_mode == AW8898_RECEIVER)
> +		mode = AW8898_SYSCTRL_RCV_MODE;
> +
> +	regmap_update_bits(aw8898->regmap, AW8898_SYSCTRL,
> +			   AW8898_SYSCTRL_MODE_MASK,
> +			   FIELD_PREP(AW8898_SYSCTRL_MODE_MASK, mode));
> +}

Why is this open coded rather than just being a standard enum?  AFAICT
we never reference dev_mode outside of here or the _get() and put()
callbacks.  You might be looking for a _VALUE_ENUM?

> +	if (!fw) {
> +		dev_err(&aw8898->client->dev, "Failed to load firmware\n");
> +		return;
> +	}
> +
> +	dev_dbg(&aw8898->client->dev, "Loaded %s - size: %zu\n", AW8898_CFG_NAME, fw->size);

We print the firmware name we were looking for if we loaded it, but not
if we failed to load it when it's probably more useful.

> +	aw8898_cfg_write(aw8898, aw8898_cfg);

The "firmware" here is just a list of arbatrary register writes with no
validation of addresses or anything...

> +	switch (fmt & SND_SOC_DAIFMT_FORMAT_MASK) {
> +	case SND_SOC_DAIFMT_I2S:
> +		if ((fmt & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK)
> +				!= SND_SOC_DAIFMT_CBC_CFC) {
> +			dev_err(component->dev, "Invalid codec master mode: %d\n",

Clock provider mode.

> +static int aw8898_startup(struct snd_pcm_substream *substream,
> +               struct snd_soc_dai *dai)
> +{
> +	struct aw8898 *aw8898 = snd_soc_component_get_drvdata(dai->component);
> +	unsigned int val;
> +	int err;
> +
> +	err = regmap_read_poll_timeout(aw8898->regmap, AW8898_SYSST,
> +				       val, val & AW8898_SYSST_PLLS,
> +				       2000, 1 * USEC_PER_SEC);

What's this actually checking?  You shouldn't rely on I2S being clocked
prior to trigger...

--MlZQHhqJVJF+tiCZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmhrt0sACgkQJNaLcl1U
h9BPMQf/dmqzpSi55P7foF7RBlZpMSycih4Oi7PCjW3U957fX0OuP/4eq5U+gMl3
MBbPPPDqBzN4ljGvWGXuAsWxyjNt+U+LEyNa8YJRnz+ysQvPjwANW+SnRKj+WtcE
LJHf8JhuNzKaoMa4UQUNv9N2xFYbfZYCzkfmN1pGVrvxTJrKeeZSB8zAXfkdBM5s
T/7g8OM3OG+BZs2WGFGmYNfVNZ/UTtNgbKAigqGj4pVrSuh+ICi7BBkf34nVBHFE
/f6ywCEL/iKctaKft7NVU3E5y7mBtkQ8nCyZhGmcGvKoBlq3PBkUfZZz+PAab9P3
f4P1tsKTIlHQ+EHMNlV0jemhAKRBLA==
=Qb73
-----END PGP SIGNATURE-----

--MlZQHhqJVJF+tiCZ--

