Return-Path: <linux-arm-msm+bounces-53305-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B6749A7CF86
	for <lists+linux-arm-msm@lfdr.de>; Sun,  6 Apr 2025 20:28:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8396B16E6CA
	for <lists+linux-arm-msm@lfdr.de>; Sun,  6 Apr 2025 18:28:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A702E1A08B1;
	Sun,  6 Apr 2025 18:28:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="d5js8ceX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E6F119F11E;
	Sun,  6 Apr 2025 18:28:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743964100; cv=none; b=V4KfyMFX9fSSwGdg9s7D4u4AzlT+fynAHwE4UMcGg58BmHFr9CdLJTtNRm3mnfY5e7h+3gplpYIkDQz7w9HdEYNHdLxww5Hz+OaTORIkEJjfo9LZUHVVnpdoNumQRsYfCihknq0x3fA9gu+yuiQbZw8PmOSR8qDqQ+GruNRlH4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743964100; c=relaxed/simple;
	bh=6O+OtUY8I4gIiPTqNSHbMX3HSUJdq2fniANGw6IDTag=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=feIiXAmizE/3Tl0Bn/8fL3mrFglhy+LHFCYZNVCo6xlLvMI/JsY8D/rq9lrP/UMsu5+H7N3TELKktnxZ9ObGMGL6M3RwgxwK/gVvizBKVcf754ywm1aStNCTFLRZGY6g8pJN7ii4kwqsgPfEPoWnmCgTtJ+vlFO6IlhRbfsTSf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=d5js8ceX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A9AFC4CEE7;
	Sun,  6 Apr 2025 18:28:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743964098;
	bh=6O+OtUY8I4gIiPTqNSHbMX3HSUJdq2fniANGw6IDTag=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=d5js8ceX+DABBohgMHLKQYssyUgg19/uFwKP+oKYuo9iHVYTKMsm/EvpPCOoWkSJK
	 fs1SSMaXf4XEKq9AvSM94CybVLtgQB+jbmdy+BT5nsoNOqozO1vOJfqgqA94RvvJjm
	 wmMgQCpfpjGBHDMiyhEb4/GVtKNSoBo0+xHLjaBLgSWP5KXo5pbJjICUiW0q8qTHYG
	 vVKEWC0pCK+bSolLKsklx275qVQgfyvJKfKf5v8mytoc52miwiH6QZmZWodCszHYJg
	 ML2pcjgZLZQFfoUUf8nC+v1sF0oKep8TZ79hbnGgsDWoHmD0K8W3UZuWel3BBsxs6w
	 X1TY6UCZmApcg==
Date: Sun, 6 Apr 2025 19:28:15 +0100
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
Subject: Re: [PATCH 2/3] ASoC: codecs: Add aw8898 amplifier driver
Message-ID: <Z_LHv4S-FcgvGldA@finisterre.sirena.org.uk>
References: <20250406-aw8898-v1-0-58a2d554693f@lucaweiss.eu>
 <20250406-aw8898-v1-2-58a2d554693f@lucaweiss.eu>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="2La7XcN7yH/by3lQ"
Content-Disposition: inline
In-Reply-To: <20250406-aw8898-v1-2-58a2d554693f@lucaweiss.eu>
X-Cookie: Well begun is half done.


--2La7XcN7yH/by3lQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Apr 06, 2025 at 03:03:16PM +0200, Luca Weiss wrote:

Overall this driver feels like it's not terribly well integrated into
the subsystem - it's not using the standard framework features for
things.  The code itself looks broadly fine but things need moving about
a bit to feel more like a standard driver.

> @@ -0,0 +1,583 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Copyright (c) 2018 AWINIC Technology CO., LTD
> + * Author: Nick Li <liweilei@awinic.com.cn>
> + *
> + * Copyright (c) 2025 Luca Weiss <luca@lucaweiss.eu>
> + */

Please make the entire comment a C++ one so things look more
intentional.

> +static void aw8898_set_mute(struct aw8898 *aw8898, bool mute)
> +{
> +	unsigned int val =3D AW8898_PWMCTRL_HMUTE_DISABLE;
> +
> +	if (mute)
> +		val =3D AW8898_PWMCTRL_HMUTE_ENABLE;
> +
> +	regmap_update_bits(aw8898->regmap, AW8898_PWMCTRL,
> +			   AW8898_PWMCTRL_HMUTE_MASK,
> +			   FIELD_PREP(AW8898_PWMCTRL_HMUTE_MASK, val));
> +}

This should either be the standard DAI mute operation, user controlled
or there should be a clear explanation of what's going on.  Or just
inlined into callers given how trivial it is.

> +static void aw8898_set_power(struct aw8898 *aw8898, bool on)
> +{
> +	unsigned int val =3D AW8898_SYSCTRL_PW_PDN;
> +
> +	if (on)
> +		val =3D AW8898_SYSCTRL_PW_ACTIVE;
> +
> +	regmap_update_bits(aw8898->regmap, AW8898_SYSCTRL,
> +			   AW8898_SYSCTRL_PW_MASK,
> +			   FIELD_PREP(AW8898_SYSCTRL_PW_MASK, val));
> +}

This should be in the standard framework power management flows
(probably either a DAPM widget or set_bias_level(), it looks closer to
the latter).

> +static int aw8898_dev_mode_put(struct snd_kcontrol *kcontrol,
> +			       struct snd_ctl_elem_value *ucontrol)
> +{
> +	struct snd_soc_component *component =3D snd_soc_kcontrol_component(kcon=
trol);
> +	struct aw8898 *aw8898 =3D snd_soc_component_get_drvdata(component);
> +
> +	if (aw8898->dev_mode =3D=3D ucontrol->value.enumerated.item[0])
> +		return 0;
> +
> +	aw8898->dev_mode =3D ucontrol->value.enumerated.item[0];
> +
> +	aw8898_update_dev_mode(aw8898);
> +
> +	return 1;
> +}

There is no validation of the written value here.  Please use the
mixer-test selftest to vaidate things.

> +/*
> + * -127.5 dB min, 0.5 dB steps, no mute
> + * Note: The official datasheet claims to be able to attenuate between 0=
 dB and
> + * -96 dB with 0.5 dB/step, but the register values are 0-255 so this do=
esn't
> + * really line up. It's a best guess.
> + */

It is common for registers to have out of spec values which should never
be written, they might behave in undesirable ways.  The controls should
only expose whatever the documented values are.

> +static int aw8898_startup(struct snd_pcm_substream *substream,
> +			  struct snd_soc_dai *dai)
> +{
> +	struct aw8898 *aw8898 =3D snd_soc_component_get_drvdata(dai->component);
> +
> +	aw8898_set_power(aw8898, true);
> +
> +	return 0;
> +}

As noted above the power should be managed from power management
operations, either set_bias_level() or DAPM.

> +static int aw8898_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
> +{
> +	struct snd_soc_component *component =3D dai->component;
> +
> +	switch (fmt & SND_SOC_DAIFMT_FORMAT_MASK) {
> +	case SND_SOC_DAIFMT_I2S:
> +		if ((fmt & SND_SOC_DAIFMT_MASTER_MASK)

_CLOCK_PROVIDER_MASK.

> +static int aw8898_mute(struct snd_soc_dai *dai, int mute, int stream)
> +{
> +	struct aw8898 *aw8898 =3D snd_soc_component_get_drvdata(dai->component);
> +
> +	mutex_lock(&aw8898->cfg_lock);
> +
> +	if (mute) {
> +		aw8898_stop(aw8898);
> +	} else {
> +		if (!aw8898->cfg_loaded) {
> +			aw8898_cold_start(aw8898);
> +		} else {
> +			aw8898_update_dev_mode(aw8898);
> +			aw8898_start(aw8898);
> +		}
> +	}
> +
> +	mutex_unlock(&aw8898->cfg_lock);

A mute operation should not be doing anything as expensive as this, it
should just be something more like a single register write (eg, just the
mute).  This looks more like power management operations. =20

> +static int aw8898_component_probe(struct snd_soc_component *component)
> +{
> +	struct aw8898 *aw8898 =3D snd_soc_component_get_drvdata(component);
> +	int ret;
> +
> +	aw8898->component =3D component;
> +
> +	ret =3D regulator_bulk_enable(ARRAY_SIZE(aw8898->supplies),
> +				    aw8898->supplies);
> +	if (ret) {
> +		dev_err(component->dev, "Failed to enable supplies: %d\n",
> +			ret);
> +		return ret;
> +	}

It seems random to do this separately to the rest of the power
management for the device?

> +	snd_soc_add_component_controls(component, aw8898_controls,
> +				       ARRAY_SIZE(aw8898_controls));

Just specify the controls in the driver struct when registering.

> +static const struct regmap_config aw8898_regmap =3D {
> +	.reg_bits =3D 8,
> +	.val_bits =3D 16,
> +
> +	.max_register =3D AW8898_MAX_REGISTER,
> +	.cache_type =3D REGCACHE_RBTREE,
> +};

Use _MAPLE unless you have a particular reason not to, it's a more
modern data structure.

> +static int aw8898_probe(struct i2c_client *client)
> +{
> +	struct aw8898 *aw8898;
> +	int ret;

> +	aw8898->reset =3D devm_gpiod_get(&client->dev, "reset", GPIOD_OUT_HIGH);
> +	if (IS_ERR(aw8898->reset))
> +		return dev_err_probe(&client->dev, PTR_ERR(aw8898->reset),
> +				     "Failed to get reset GPIO\n");
> +
> +	aw8898_reset(aw8898);
> +
> +	ret =3D aw8898_check_chipid(aw8898);
> +	if (ret)
> +		return dev_err_probe(&client->dev, ret, "Chip ID check failed\n");

We didn't power on the regulators before trying to validate the chip ID
which probably isn't going to go terribly well if the regulators are
controllable...

--2La7XcN7yH/by3lQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmfyx74ACgkQJNaLcl1U
h9BbOwgAht5c+dFrCWIsoSgKWjmZtr17i6+lOi1GHTsCotsaVhEaYhUq3p1Vb6iW
7/LLKNMi9BwIHNeYAqYK/tKrj8DDagb2nkYFqqiE4M5TZ/8RTLj9ZoFz1S8ZK2TJ
7hAtF/jE5R6W9O614MRkleHf88JgyYdyBdJAmmq9YaoZh6byB6RQgtgbtiOVX0+z
yrs+pPkkp+jeZaLsBbHkDhP2uUJuOX+ogg1ICcE8nN0WZiMWiWH0mq9w4Qfy73+7
vCmJi7FDOIFrZScB/C+iiywpSikpi0/ohvDX0p0D79Rr7JrFVgdT5ijqfwGvyzkj
431b2bAvGcBBN6Xod+yKWquOBiKOgA==
=fuBE
-----END PGP SIGNATURE-----

--2La7XcN7yH/by3lQ--

