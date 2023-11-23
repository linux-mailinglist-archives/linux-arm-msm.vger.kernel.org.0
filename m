Return-Path: <linux-arm-msm+bounces-1745-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 29B767F65AC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Nov 2023 18:43:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B2833B20CF2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Nov 2023 17:43:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65CB83FE37;
	Thu, 23 Nov 2023 17:43:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EUK/QVte"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F3F4405FB;
	Thu, 23 Nov 2023 17:43:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8729C433C8;
	Thu, 23 Nov 2023 17:43:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700761427;
	bh=1GRk6pF6ONArbuEDYzf53o3CAsRNhMgYXX01fUitKEQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EUK/QVte4vbuMVsB7J0ZDQXQPfx5ZzqhBZOhhYXYl+f0qLTL1oOdCbPQ8soI+D9Ee
	 lLr90oOKzn2mI92pdKjbW39eFkQ0GSOJjcyT6adnMdiDnhRB3xMjBD5TgAH4bV6NWh
	 zUYM5BmACPrvUX0Thlj/wUOp31f3cOuJrbJejyUoKR2etkkH1ile+WN036EMVW2DqT
	 u6oOAbS5e4UkOdxtE5rqKgQ0AqfTWN7qYbgnZsGCaXYUVB0crrskCXVWkx/q9UsmMf
	 cZPM91apJKntl3C6x/aRusganoJT+ab/o4O+hbp3yxgKP8ous4VJPWd+HHW8z9aZlX
	 c6tMeQ7jEcPyQ==
Date: Thu, 23 Nov 2023 17:43:43 +0000
From: Mark Brown <broonie@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Banajit Goswami <bgoswami@quicinc.com>,
	Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/5] ASoC: codecs: Add WCD939x Soundwire slave driver
Message-ID: <ZV+PTynfbRmF0trU@finisterre.sirena.org.uk>
References: <20231123-topic-sm8650-upstream-wcd939x-codec-v1-0-21d4ad9276de@linaro.org>
 <20231123-topic-sm8650-upstream-wcd939x-codec-v1-4-21d4ad9276de@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="42Lt/E9P87lWIhco"
Content-Disposition: inline
In-Reply-To: <20231123-topic-sm8650-upstream-wcd939x-codec-v1-4-21d4ad9276de@linaro.org>
X-Cookie: Slow day.  Practice crawling.


--42Lt/E9P87lWIhco
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Nov 23, 2023 at 03:49:14PM +0100, Neil Armstrong wrote:
> Add Soundwire Slave driver for the WCD9390/WCD9395 Audio Codec.

> The WCD9390/WCD9395 Soundwire Slaves will be used by the

Please avoid using outdated terminology, "device" is probably a good
alternative here.  There are some usages in APIs that need to be updated
but still, good to avoid where possible.

> +static struct wcd939x_sdw_ch_info wcd939x_sdw_tx_ch_info[] = {
> +	WCD_SDW_CH(WCD939X_ADC1, WCD939X_ADC_1_4_PORT, BIT(0)),
> +	WCD_SDW_CH(WCD939X_ADC2, WCD939X_ADC_1_4_PORT, BIT(1)),
> +	WCD_SDW_CH(WCD939X_ADC3, WCD939X_ADC_1_4_PORT, BIT(2)),
> +	WCD_SDW_CH(WCD939X_ADC4, WCD939X_ADC_1_4_PORT, BIT(3)),
> +	// TOFIX support ADC3/4 & DMIC0/1 on port 2
> +	//WCD_SDW_CH(WCD939X_ADC3, WCD939X_ADC_DMIC_1_2_PORT, BIT(0)),
> +	//WCD_SDW_CH(WCD939X_ADC4, WCD939X_ADC_DMIC_1_2_PORT, BIT(1)),
> +	//WCD_SDW_CH(WCD939X_DMIC0, WCD939X_ADC_DMIC_1_2_PORT, BIT(2)),
> +	//WCD_SDW_CH(WCD939X_DMIC1, WCD939X_ADC_DMIC_1_2_PORT, BIT(3)),

Why are these commented out?

> +static int wcd9390_interrupt_callback(struct sdw_slave *slave,
> +				      struct sdw_slave_intr_status *status)
> +{
> +	struct wcd939x_sdw_priv *wcd = dev_get_drvdata(&slave->dev);
> +	struct irq_domain *slave_irq = wcd->slave_irq;
> +	u32 sts1, sts2, sts3;
> +
> +	do {
> +		handle_nested_irq(irq_find_mapping(slave_irq, 0));
> +		regmap_read(wcd->regmap, WCD939X_DIGITAL_INTR_STATUS_0, &sts1);
> +		regmap_read(wcd->regmap, WCD939X_DIGITAL_INTR_STATUS_1, &sts2);
> +		regmap_read(wcd->regmap, WCD939X_DIGITAL_INTR_STATUS_2, &sts3);
> +
> +	} while (sts1 || sts2 || sts3);
> +
> +	return IRQ_HANDLED;
> +}

We do this in the other Qualcomm drivers but it doesn't seem ideal to
just ignore the interrupts.

> +static int wcd939x_sdw_component_bind(struct device *dev, struct device *master,
> +				      void *data)
> +{
> +	return 0;
> +}
> +
> +static void wcd939x_sdw_component_unbind(struct device *dev,
> +					 struct device *master, void *data)
> +{
> +}
> +
> +static const struct component_ops wcd939x_sdw_component_ops = {
> +	.bind = wcd939x_sdw_component_bind,
> +	.unbind = wcd939x_sdw_component_unbind,
> +};

Do these need to be provided if they can legitimately be empty?

--42Lt/E9P87lWIhco
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmVfj08ACgkQJNaLcl1U
h9AbPQf9HwduNNNq58Fi9Zk4pDIkhiO6nVd+QB5hkOPoAqoUexbSojnNREgdQUy/
S5Ek1XNG04jXfE7MYvLpIEO6bhwa6uv/Zn7UM3i0EDIzd2qXT4vH6Ce4/pl2+IsK
3bcbiKFHCpSQRCbzay9Fm4DUdMXbEIpBeZmMznljBtZmF7UIj1xVLJQEsEiwWJ7G
8NTb1aJ9QauPhZgkcuizCmNrZkQseSioyDmFZPZlD6TmofHqz2A8MiI5oLQVQr7s
zvFENMqhOHPxwb9b/orlGQqf0tKdoZZDO66P0b3g242Z2KItP/Aasq4FiQTJ24LP
/69tGglcrDDBrHEBUmmx6ULgLVUoCw==
=YBBq
-----END PGP SIGNATURE-----

--42Lt/E9P87lWIhco--

