Return-Path: <linux-arm-msm+bounces-36778-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F26519B95FE
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Nov 2024 17:57:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 761FF1F21CB7
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Nov 2024 16:57:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3AFAE1CBE84;
	Fri,  1 Nov 2024 16:57:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="PLBnomvS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.smtpout.orange.fr (smtp-13.smtpout.orange.fr [80.12.242.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B93291CACC8;
	Fri,  1 Nov 2024 16:57:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730480245; cv=none; b=eQeXRpy9hlsR0mKzXhIGJUc6vuF4xYvJYziAUQK6H2S37jZAySzoJCcFBXYegdVxdzUHW9nwi63+xUja7T0XHp47Egwc7k+t/ijbn5qRXT/mlFVBip0z8A1WUJKFbGLNSB892NJW+Spdh6r250Fb+5BN7OG5f/ny2FXEa3xxnK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730480245; c=relaxed/simple;
	bh=k47s0P2wz9OqG4UpxM357DUA+y89omV5a3jUPb/uFgk=;
	h=Message-ID:Date:MIME-Version:Subject:References:From:Cc:To:
	 In-Reply-To:Content-Type; b=Ieamy5S6S8InbtMABtQ2SEmJ7wMxD3PZ+EYaYBjcgpQK0dzoqDLG3G2peiq/0v+YYY8xyzPGY1HqyeyaAuoZ4usk2AXdec486b14PRt31Kbl2w9k8/BN5fao+mKCiue0PT4vbhEP0MDwhFtWXyKuexLYuQhyo8dOdt15ecAf5JY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=PLBnomvS; arc=none smtp.client-ip=80.12.242.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Received: from [192.168.1.37] ([90.11.132.44])
	by smtp.orange.fr with ESMTPA
	id 6uwOtzLoVNFce6uwPthwSZ; Fri, 01 Nov 2024 17:56:07 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1730480167;
	bh=MLkITH4B9BxZcDOsi8Bl2aCO3pgd38XzocbFtMgv/Vc=;
	h=Message-ID:Date:MIME-Version:Subject:From:To;
	b=PLBnomvSOtJH/II639x9Ir+kK3CEymccyvAFh6HuCTE+tz/Jug0OjtW7RcPl6Chuc
	 fUhCol+KyceKYbRniyMEiOSUG1wpUM8kPMhp4i41wdnuDsWBvT7Vzaoxi8+oKzWS+W
	 fuAsv3T4EZDwdKDSxjKMjO3TIS0g8D6zvTxkIkUphVJcGk0YFoWNI/0GpKN6cjdl6q
	 MfzhqBjo5Hs+7l++B7cOJ7/CDVgVWoEUfBFb2WxL659zOsVnc3swElv4qymeM9pON1
	 kPk6Cj2r01rRskuS7nDuDBfefNURvAuaBe9ZYrlRM0sT8kMRd+IN61VT4lYbeFsOA1
	 70dWnkTnhquSg==
X-ME-Helo: [192.168.1.37]
X-ME-Auth: bWFyaW9uLmphaWxsZXRAd2FuYWRvby5mcg==
X-ME-Date: Fri, 01 Nov 2024 17:56:07 +0100
X-ME-IP: 90.11.132.44
Message-ID: <90ff31e5-3bed-40d2-8476-1ebb772c03f3@wanadoo.fr>
Date: Fri, 1 Nov 2024 17:56:04 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/4] usb: typec: Add support for Parade PS8830 Type-C
 Retimer
References: <20241101-x1e80100-ps8830-v4-0-f0f7518b263e@linaro.org>
 <20241101-x1e80100-ps8830-v4-2-f0f7518b263e@linaro.org>
Content-Language: en-US, fr-FR
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Rajendra Nayak <quic_rjendra@quicinc.com>,
 Sibi Sankar <quic_sibis@quicinc.com>, Johan Hovold <johan@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Trilok Soni <quic_tsoni@quicinc.com>, linux-kernel@vger.kernel.org,
 linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
 Abel Vesa <abel.vesa@linaro.org>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
To: Abel Vesa <abel.vesa@linaro.org>
In-Reply-To: <20241101-x1e80100-ps8830-v4-2-f0f7518b263e@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Le 01/11/2024 à 17:29, Abel Vesa a écrit :
> The Parade PS8830 is a USB4, DisplayPort and Thunderbolt 4 retimer,
> controlled over I2C. It usually sits between a USB/DisplayPort PHY
> and the Type-C connector, and provides orientation and altmode handling.
> 
> The boards that use this retimer are the ones featuring the Qualcomm
> Snapdragon X Elite SoCs.
> 
> Add a driver with support for the following modes:
>   - DisplayPort 4-lanes
>   - DisplayPort 2-lanes + USB3
>   - USB3
> 
> There is another variant of this retimer which is called PS8833. It seems
> to be really similar to the PS8830, so future-proof this driver by
> naming it ps883x.
> 
> Signed-off-by: Abel Vesa <abel.vesa-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> ---

Hi,

...

> +static void ps883x_disable_vregs(struct ps883x_retimer *retimer)
> +{
> +	regulator_disable(retimer->vddio_supply);
> +	regulator_disable(retimer->vddat_supply);
> +	regulator_disable(retimer->vddar_supply);
> +	regulator_disable(retimer->vdd_supply);
> +	regulator_disable(retimer->vdd33_cap_supply);
> +	regulator_disable(retimer->vdd33_supply);
> +}
> +
> +static int ps883x_get_vregs(struct ps883x_retimer *retimer)

This could maybe be replaced by a
devm_regulator_bulk_get() call?
(and use the bulk API in other places)

> +{
> +	struct device *dev = &retimer->client->dev;
> +
> +	retimer->vdd_supply = devm_regulator_get(dev, "vdd");
> +	if (IS_ERR(retimer->vdd_supply))
> +		return dev_err_probe(dev, PTR_ERR(retimer->vdd_supply),
> +				     "failed to get VDD\n");
> +
> +	retimer->vdd33_supply = devm_regulator_get(dev, "vdd33");
> +	if (IS_ERR(retimer->vdd33_supply))
> +		return dev_err_probe(dev, PTR_ERR(retimer->vdd33_supply),
> +				     "failed to get VDD 3.3V\n");
> +
> +	retimer->vdd33_cap_supply = devm_regulator_get(dev, "vdd33-cap");
> +	if (IS_ERR(retimer->vdd33_cap_supply))
> +		return dev_err_probe(dev, PTR_ERR(retimer->vdd33_cap_supply),
> +				     "failed to get VDD CAP 3.3V\n");
> +
> +	retimer->vddat_supply = devm_regulator_get(dev, "vddat");
> +	if (IS_ERR(retimer->vddat_supply))
> +		return dev_err_probe(dev, PTR_ERR(retimer->vddat_supply),
> +				     "failed to get VDD AT\n");
> +
> +	retimer->vddar_supply = devm_regulator_get(dev, "vddar");
> +	if (IS_ERR(retimer->vddar_supply))
> +		return dev_err_probe(dev, PTR_ERR(retimer->vddar_supply),
> +				     "failed to get VDD AR\n");
> +
> +	retimer->vddio_supply = devm_regulator_get(dev, "vddio");
> +	if (IS_ERR(retimer->vddio_supply))
> +		return dev_err_probe(dev, PTR_ERR(retimer->vddio_supply),
> +				     "failed to get VDD IO\n");
> +
> +	return 0;
> +}

...

> +static int ps883x_retimer_probe(struct i2c_client *client)
> +{
> +	struct device *dev = &client->dev;
> +	struct typec_switch_desc sw_desc = { };
> +	struct typec_retimer_desc rtmr_desc = { };
> +	struct ps883x_retimer *retimer;
> +	int ret;
> +
> +	retimer = devm_kzalloc(dev, sizeof(*retimer), GFP_KERNEL);
> +	if (!retimer)
> +		return -ENOMEM;
> +
> +	retimer->client = client;
> +
> +	mutex_init(&retimer->lock);
> +
> +	retimer->regmap = devm_regmap_init_i2c(client, &ps883x_retimer_regmap);
> +	if (IS_ERR(retimer->regmap)) {
> +		ret = PTR_ERR(retimer->regmap);
> +		dev_err(dev, "failed to allocate register map: %d\n", ret);

Maybe dev_err_probe() as below?

> +		return ret;
> +	}
> +
> +	ret = ps883x_get_vregs(retimer);
> +	if (ret)
> +		return ret;
> +
> +	retimer->xo_clk = devm_clk_get(dev, NULL);
> +	if (IS_ERR(retimer->xo_clk))
> +		return dev_err_probe(dev, PTR_ERR(retimer->xo_clk),
> +				     "failed to get xo clock\n");
> +
> +	retimer->reset_gpio = devm_gpiod_get(dev, "reset", GPIOD_ASIS);
> +	if (IS_ERR(retimer->reset_gpio))
> +		return dev_err_probe(dev, PTR_ERR(retimer->reset_gpio),
> +				     "failed to get reset gpio\n");
> +
> +	retimer->typec_switch = typec_switch_get(dev);
> +	if (IS_ERR(retimer->typec_switch))
> +		return dev_err_probe(dev, PTR_ERR(retimer->typec_switch),
> +				     "failed to acquire orientation-switch\n");
> +
> +	retimer->typec_mux = typec_mux_get(dev);
> +	if (IS_ERR(retimer->typec_mux)) {
> +		ret = dev_err_probe(dev, PTR_ERR(retimer->typec_mux),
> +				    "failed to acquire mode-mux\n");
> +		goto err_switch_put;
> +	}
> +
> +	ret = drm_aux_bridge_register(dev);
> +	if (ret)
> +		goto err_mux_put;
> +
> +	ret = clk_prepare_enable(retimer->xo_clk);
> +	if (ret) {
> +		dev_err(dev, "failed to enable XO: %d\n", ret);
> +		goto err_mux_put;
> +	}
> +
> +	ret = ps883x_enable_vregs(retimer);
> +	if (ret)
> +		goto err_clk_disable;
> +
> +	sw_desc.drvdata = retimer;
> +	sw_desc.fwnode = dev_fwnode(dev);
> +	sw_desc.set = ps883x_sw_set;
> +
> +	retimer->sw = typec_switch_register(dev, &sw_desc);
> +	if (IS_ERR(retimer->sw)) {
> +		ret = PTR_ERR(retimer->sw);
> +		dev_err(dev, "failed to register typec switch: %d\n", ret);

Maybe dev_err_probe() as above?

> +		goto err_vregs_disable;
> +	}
> +
> +	rtmr_desc.drvdata = retimer;
> +	rtmr_desc.fwnode = dev_fwnode(dev);
> +	rtmr_desc.set = ps883x_retimer_set;
> +
> +	retimer->retimer = typec_retimer_register(dev, &rtmr_desc);
> +	if (IS_ERR(retimer->retimer)) {
> +		ret = PTR_ERR(retimer->retimer);
> +		dev_err(dev, "failed to register typec retimer: %d\n", ret);

Maybe dev_err_probe() as above?

> +		goto err_switch_unregister;
> +	}
> +
> +	/* skip resetting if already configured */
> +	if (regmap_test_bits(retimer->regmap, 0x00, BIT(0)))
> +		return 0;
> +
> +	gpiod_direction_output(retimer->reset_gpio, 1);
> +
> +	/* VDD IO supply enable to reset release delay */
> +	usleep_range(4000, 14000);
> +
> +	gpiod_set_value(retimer->reset_gpio, 0);
> +
> +	/* firmware initialization delay */
> +	msleep(60);
> +
> +	return 0;
> +
> +err_switch_unregister:
> +	typec_switch_unregister(retimer->sw);
> +err_vregs_disable:
> +	ps883x_disable_vregs(retimer);
> +err_clk_disable:
> +	clk_disable_unprepare(retimer->xo_clk);
> +err_mux_put:
> +	typec_mux_put(retimer->typec_mux);
> +err_switch_put:
> +	typec_switch_put(retimer->typec_switch);
> +
> +	return ret;
> +}
> +
> +static void ps883x_retimer_remove(struct i2c_client *client)
> +{
> +	struct ps883x_retimer *retimer = i2c_get_clientdata(client);
> +
> +	typec_retimer_unregister(retimer->retimer);
> +	typec_switch_unregister(retimer->sw);
> +
> +	gpiod_set_value(retimer->reset_gpio, 1);
> +
> +	regulator_disable(retimer->vddio_supply);
> +	regulator_disable(retimer->vddat_supply);
> +	regulator_disable(retimer->vddar_supply);
> +	regulator_disable(retimer->vdd_supply);
> +	regulator_disable(retimer->vdd33_cap_supply);
> +	regulator_disable(retimer->vdd33_supply);

ps883x_disable_vregs()?

> +
> +	clk_disable_unprepare(retimer->xo_clk);
> +
> +	typec_mux_put(retimer->typec_mux);
> +	typec_switch_put(retimer->typec_switch);
> +}

...

CJ

