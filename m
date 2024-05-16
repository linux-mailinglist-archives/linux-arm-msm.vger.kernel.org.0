Return-Path: <linux-arm-msm+bounces-19930-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D1CE8C7584
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 May 2024 13:58:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C1EE91F229AA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 May 2024 11:58:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E58C145A14;
	Thu, 16 May 2024 11:58:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pvISL2g5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AF9926AD0;
	Thu, 16 May 2024 11:58:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715860727; cv=none; b=dsMjmsDeK8hIHVkHrucIy66EK1HAMZMpSO7F0WZ5FdAYEw6lG1IHgFViy2XWUm6O4imajL/d4o7baEFWumWbd+2ZVzWKBhnfwDHmbhtVM+KXjFXH3+YdLZF+/GcM7bzXyDj/bpA2L7ej6614tA1RYOinRe/Pu//GYtt8P2nrJug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715860727; c=relaxed/simple;
	bh=E7UsGb6Za+wHEcmHsLVrZiP4f3obI82j8AUAXJwI+Oc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qexafKz+5Kf6nlLs44I4OHBRYbp58TFKdkic74pQu9ZEzyIPbShr/CDDQCqLruimZ27aAP+gpVjg4qf0JkA5n4kU3NRaUXQd8JkX9lNWwzyLo2v7JenevQY7Ipf89m6vBetlXWvd6Nb6ePsAHCw7o7P2tJYnuCor3d5NQS/MsKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pvISL2g5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2F72C113CC;
	Thu, 16 May 2024 11:58:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715860726;
	bh=E7UsGb6Za+wHEcmHsLVrZiP4f3obI82j8AUAXJwI+Oc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pvISL2g5xA9A7ryhfZ4/mtSa5WAkWW7GkBPMWB7qu6TEZ90UmAWOOerEh3/Cl2Ph0
	 +TDkQY81351Z8KKw8h27YPRDj4Og2lsD9wH8zIVlH/tCkCfqVe6UN8XdUdx1XO5Gm/
	 YPEyc8Ijvy2zull41IQX+Sdfzo88p/rXYUNmzTm6718wMQeVdtUDuRt85tvlgcjaED
	 ueOH0onP7/5O8fFYXJ9/EFeE5Y2I8QTkT5XXwUd59T0H9JrvFb/zkFXpZWsauxOTwL
	 Sqy5Kfvp7ltuVMUDfp8e3KYMT7VyK6BoI50J912bQDEpY5p4XBvRGuRpB2u9S82VG+
	 wdR+ks55in61w==
Date: Thu, 16 May 2024 12:58:40 +0100
From: Mark Brown <broonie@kernel.org>
To: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Banajit Goswami <bgoswami@quicinc.com>,
	Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, quic_rohkumar@quicinc.com,
	quic_pkumpatl@quicinc.com
Subject: Re: [PATCH v4 4/7] ASoC: codecs: wcd937x: add basic controls
Message-ID: <f766e8fc-64e7-4579-ac5a-4afcdae067cc@sirena.org.uk>
References: <20240516044801.1061838-1-quic_mohs@quicinc.com>
 <20240516044801.1061838-5-quic_mohs@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="bEuBL+UqcAprloOC"
Content-Disposition: inline
In-Reply-To: <20240516044801.1061838-5-quic_mohs@quicinc.com>
X-Cookie: I'm having a MID-WEEK CRISIS!


--bEuBL+UqcAprloOC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, May 16, 2024 at 10:17:58AM +0530, Mohammad Rafi Shaik wrote:

> +static int wcd937x_rx_hph_mode_put(struct snd_kcontrol *kcontrol,
> +				   struct snd_ctl_elem_value *ucontrol)
> +{
> +	struct snd_soc_component *component =
> +				snd_soc_kcontrol_component(kcontrol);
> +	struct wcd937x_priv *wcd937x = snd_soc_component_get_drvdata(component);
> +	u32 mode_val;
> +
> +	mode_val = ucontrol->value.enumerated.item[0];
> +	if (!mode_val) {
> +		dev_warn(component->dev, "Invalid HPH Mode, default to class_AB\n");
> +		mode_val = CLS_AB;

This should be silent (or return an error) otherwise people can DoS the
logs by just spamming in invalid values.

> +	}
> +
> +	wcd937x->hph_mode = mode_val;

I would expect there's more validation needed here, this will blindly
assign any non-zero mode.  Please run the mixer-test selftests on a card
with this device in it and show the results on future submissions, this
will detect this and other issues for you.

Several of the other controls look like they're also missing validation.

> +static int wcd937x_set_swr_port(struct snd_kcontrol *kcontrol,
> +				struct snd_ctl_elem_value *ucontrol)
> +{
> +	struct soc_mixer_control *mixer = (struct soc_mixer_control *)kcontrol->private_value;
> +	struct snd_soc_component *comp = snd_soc_kcontrol_component(kcontrol);
> +	struct wcd937x_priv *wcd937x = snd_soc_component_get_drvdata(comp);
> +	struct wcd937x_sdw_priv *wcd;
> +	int dai_id = mixer->shift;
> +	int ch_idx = mixer->reg;
> +	int portidx;
> +	bool enable;
> +
> +	wcd = wcd937x->sdw_priv[dai_id];
> +
> +	portidx = wcd->ch_info[ch_idx].port_num;
> +
> +	enable = !!ucontrol->value.integer.value[0];
> +
> +	wcd->port_enable[portidx] = enable;
> +	wcd937x_connect_port(wcd, portidx, ch_idx, enable);
> +
> +	return 1;
> +}

This unconditionally reports that the value changed so will generate
spurious events.
> +
> +static const char * const rx_hph_mode_mux_text[] = {
> +	"CLS_H_INVALID", "CLS_H_HIFI", "CLS_H_LP", "CLS_AB", "CLS_H_LOHIFI",
> +	"CLS_H_ULP", "CLS_AB_HIFI",
> +};

It would be more idiomatic to write these in a more human readable form.

> +static const char * const wcd937x_ear_pa_gain_text[] = {
> +	"G_6_DB", "G_4P5_DB", "G_3_DB", "G_1P5_DB", "G_0_DB",
> +	"G_M1P5_DB", "G_M3_DB", "G_M4P5_DB",
> +	"G_M6_DB", "G_7P5_DB", "G_M9_DB",
> +	"G_M10P5_DB", "G_M12_DB", "G_M13P5_DB",
> +	"G_M15_DB", "G_M16P5_DB", "G_M18_DB",
> +};

Why is this an enum and not TLV information?

--bEuBL+UqcAprloOC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmZF9PAACgkQJNaLcl1U
h9BE5gf+MZfo6xckou+1xaQ1x8WUvInmUJO84njGHB6R6hSHjjnEG+XIuVw/g7EZ
yZ9OiZFuYfRQlTp2Gw/GYO+9DG/+gLGcBZQ7TGVFU8mP/i8hSVF0U7wNXRF1+uG1
qbpx4Qqh2Nl5Rr3SHsSaxscGjNKvOI27Vm9eb2Dq9uVuy/nfDymCUiFwrVUQGleE
2XUfQeW3IlyZI1INfjNcQ1e/I5a36bh1mFtD+GHk1jbGp/YLImU2sGbJPBmQwpzQ
F9eKub3szoFc2Xh9kMoc8Vlxi0mYOphxhK21yNk+aVaWTV74teJcBC66oumbC/nI
xpHyAPFWN0WtuFOXrz40J+//3ils/w==
=TStU
-----END PGP SIGNATURE-----

--bEuBL+UqcAprloOC--

