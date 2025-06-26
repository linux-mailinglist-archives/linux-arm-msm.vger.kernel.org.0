Return-Path: <linux-arm-msm+bounces-62638-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 20E4DAE9CFD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Jun 2025 13:58:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 454F916A03C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Jun 2025 11:58:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF0B8277C98;
	Thu, 26 Jun 2025 11:56:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gwtb8FUF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9F55277C87;
	Thu, 26 Jun 2025 11:56:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750939013; cv=none; b=eTSOm7vREmlBqJd+8FQFnAg4YTtkB0Ets8CA04Skai4ENGTXDlVDFj8UZmrl/eF2WNcWtaT1vGaa4X7ZguwFRGQf52Lrif0NTn+SXOZnR8Q5MTx8jMzcYoGs8AyHKl7fSq0ptxMUIZGpMr+ZKGom0/UyE769P5/geD5bIIn1aZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750939013; c=relaxed/simple;
	bh=2cRA5Ews7AECae0hutCZ8TsFpfNmeytIVE/Jq/tTjEU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b1k/JCCwZqHrhZBmPTBHlrl4A5vY/aaZmG3BUweShvcTd2ox+lEFnKJaN18xMBpgdcRZrw5M/7NvwOMdnU+HanGC/nSq4MWrmlBNcmmiNGMCeDSdE4dazIEIrf9XCPaVIgrh11LvVyZ3xA6J0K/uCPQuBI4HLh39Kqk0LCWWeB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gwtb8FUF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 704BAC4CEEE;
	Thu, 26 Jun 2025 11:56:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750939013;
	bh=2cRA5Ews7AECae0hutCZ8TsFpfNmeytIVE/Jq/tTjEU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gwtb8FUFoGPOS2KoSj1v0brWpY9gOEDgifWy77vb6DGnhGdT0RdZThLNFWgQpywGw
	 s2BCgbOoub8Bb22XvWQ9nXm2V79SQSPdyAO6aHyXEzgGTBQ/zH5fS01unA71RAiBYL
	 ZjWGjCXPO7x1B4HpMP53MrGR7L47w/XbrFqxF7kw4qE9+VQO74fvo2gmaCLfxMPBYp
	 8CPs3tIxe7esgQrjF2y2Kj4FM303Cs3Jv7wcn4WwhmXp5AxrVdnUeaacBf5ghDSQ8J
	 eae4EzMOFE4wOQ85lrP1ZnqHKeThCHDeuA7ixrIR6Drf2aNX4CdD7oJEjnn2eR1imZ
	 6W+5G/uy8HaOg==
Date: Thu, 26 Jun 2025 12:56:49 +0100
From: Mark Brown <broonie@kernel.org>
To: Alexey Klimov <alexey.klimov@linaro.org>
Cc: Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
	Lee Jones <lee@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, linux-arm-msm@vger.kernel.org,
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: Re: [PATCH 3/3] ASoC: codecs: add new pm4125 audio codec driver
Message-ID: <aF01gRFjsKgy6j4V@finisterre.sirena.org.uk>
References: <20250626-pm4125_audio_codec_v1-v1-0-e52933c429a0@linaro.org>
 <20250626-pm4125_audio_codec_v1-v1-3-e52933c429a0@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="PuAiEYJCFXajbSr9"
Content-Disposition: inline
In-Reply-To: <20250626-pm4125_audio_codec_v1-v1-3-e52933c429a0@linaro.org>
X-Cookie: Do not cut switchbacks.


--PuAiEYJCFXajbSr9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jun 26, 2025 at 12:50:31AM +0100, Alexey Klimov wrote:

> --- a/sound/soc/codecs/Kconfig
> +++ b/sound/soc/codecs/Kconfig
> @@ -297,6 +297,7 @@ config SND_SOC_ALL_CODECS
>  	imply SND_SOC_WCD937X_SDW
>  	imply SND_SOC_WCD938X_SDW
>  	imply SND_SOC_WCD939X_SDW
> +	imply SND_SOC_PM4125_SDW
>  	imply SND_SOC_LPASS_MACRO_COMMON
>  	imply SND_SOC_LPASS_RX_MACRO
>  	imply SND_SOC_LPASS_TX_MACRO

Please keep this file sorted, there's obviously been some things missed
but please don't make it worse.

> +obj-$(CONFIG_SND_SOC_PM4125_SDW) += snd-soc-pm4125-sdw.o
> +obj-$(CONFIG_SND_SOC_PM4125)   += snd-soc-pm4125.o
> +ifdef CONFIG_SND_SOC_PM4125_SDW
> +# avoid link failure by forcing sdw code built-in when needed
> +obj-$(CONFIG_SND_SOC_PM4125) += snd-soc-pm4125-sdw.o
> +endif

Other drivers sort this out in Kconfig, do as they do.

> +static int pm4125_micbias_control(struct snd_soc_component *component,
> +				  int micb_num, int req, bool is_dapm)
> +{
> +	return 0;
> +}

Why have this empty function which is only called from within the
driver?  At best it's making the callers look like they do something.

> +static irqreturn_t pm4125_wd_handle_irq(int irq, void *data)
> +{
> +	return IRQ_HANDLED;
> +}

Why bother regisering for the interrupt at all if you're just going to
ignore it?

> +#if defined(CONFIG_OF)
> +static const struct of_device_id pm4125_of_match[] = {
> +	{ .compatible = "qcom,pm4125-codec" },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(of, pm4125_of_match);
> +#endif

Why does this compatible exist?  If the driver is instantiated from a
as a Linux software contruct it shouldn't appear in the DT.

> +const u8 pm4125_reg_access_digital[
> +	PM4125_REG(PM4125_DIGITAL_REGISTERS_MAX_SIZE)] = {
> +		[PM4125_REG(PM4125_DIG_SWR_CHIP_ID0)] = RD_REG,
> +		[PM4125_REG(PM4125_DIG_SWR_CHIP_ID1)] = RD_REG,
> +		[PM4125_REG(PM4125_DIG_SWR_CHIP_ID2)] = RD_REG,

Data tables like this shouldn't be in headers, they should be in C
files.  At worst you might end up with duplicate copies in the object
code.

--PuAiEYJCFXajbSr9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmhdNVcACgkQJNaLcl1U
h9D5CAf/RRC2a5uS/BLF6xNL01DzPx9aCXjnyAgTQG80np8rHi7O6vg7gMm/lmI7
jTORay2DZAyHk1HJeu0CV/i871LFG7SStgwmuV2oXLvyrp5Xiix6vfi8f/WzTOaW
pGBaicThLjbIIeGw3Tj0G04GbwapGWrH4MgPkZ3fnahQ2SfLxrc9p57DBHGqjVRE
unTE0dXexH4anhDgcUZ+UAjdcYeKY18v1q425oezGKSQfGYuV8x9QRxfdshHlSPk
/uyEQw/Z1ZXh1Cal9nac1aOPUdiU9RpdHemAolIFOXXM33Jxpizk6s2H97fkHfdn
MjML1c79uWqgSL/QutPiQ3wYRW9FwA==
=Hwsm
-----END PGP SIGNATURE-----

--PuAiEYJCFXajbSr9--

