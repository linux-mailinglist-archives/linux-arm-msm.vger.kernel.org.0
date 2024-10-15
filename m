Return-Path: <linux-arm-msm+bounces-34439-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F4F899EB1C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Oct 2024 15:03:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 52DA21C22A6E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Oct 2024 13:03:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F23C1E32CF;
	Tue, 15 Oct 2024 13:03:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cxB3zVvi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA4971C07CC;
	Tue, 15 Oct 2024 13:03:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728997391; cv=none; b=i52kcpRMVZthrZZKkjve5hlMVxXFG7yF2eodOV30ezQzDUW/Oawzm7MkE/v3lL+PyjMrxUBU7e6+4u4B7HaTEdWvpaJmgh/03rJyApG8eoaf3XY+xCq3OfblKsqIWILQ+N0aTDdgUH4BMFtPdCnheVVP2LQViSNDDadK3oZRaL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728997391; c=relaxed/simple;
	bh=t0SVeMaFeLptyQZY6kf8K9Klv71EhjMArzwWv0typlk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WT8bxxUvclX8LDnro1HJSVQR/U8InGi9SOErZMu8riXHGDajVA7cO5P/bDZP0mnMKdUoHA9USNNlU85jdORr8PjAxYxdxDS4cxiJC51AudW8UcD/VLQrELJa+Q4zUMGv5rnmZkxVzBvsq507xNz9AXVtIhAXQsUojuMGdhW5KZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cxB3zVvi; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 957BDC4CECE;
	Tue, 15 Oct 2024 13:03:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728997390;
	bh=t0SVeMaFeLptyQZY6kf8K9Klv71EhjMArzwWv0typlk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cxB3zVvi8S3/qPg70+K8CuDh4ODOr4D3OZSHdhh0X7FQcnLCWEbT9DqqZRrxcrM+h
	 iMlIcqQ6SpSj/9ydKyWIO+J7UK2bBVnQe50XkwgPDhVNXPqlU85iPzwjvth4ZuVaAn
	 BnEu1LG2qSLuO9SJzRrOvvuRQJ6WtPIxv/ahMkY34sUMKXDVzhd0kJ41FJsLd1Ls93
	 Q1JMiAHw1Zk8ryYAVtwTCLjz2d5z8jPoNLX+iBjhxdhcYUDDryx15gldNlbwz5Mo0f
	 7F7yPTxNGJzhD542e3HHSrbKWAJ9thK32ji2REMSAL98Tw6A1LQblzRk7SxlAqJRtZ
	 u1H3ysmpTRHNw==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1t0hCl-000000004va-2l17;
	Tue, 15 Oct 2024 15:03:15 +0200
Date: Tue, 15 Oct 2024 15:03:15 +0200
From: Johan Hovold <johan@kernel.org>
To: Abel Vesa <abel.vesa@linaro.org>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rajendra Nayak <quic_rjendra@quicinc.com>,
	Sibi Sankar <quic_sibis@quicinc.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Trilok Soni <quic_tsoni@quicinc.com>, linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 2/2] usb: typec: Add support for Parade PS8830 Type-C
 Retimer
Message-ID: <Zw5oEyMj6cPGFDEI@hovoldconsulting.com>
References: <20241004-x1e80100-ps8830-v2-0-5cd8008c8c40@linaro.org>
 <20241004-x1e80100-ps8830-v2-2-5cd8008c8c40@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241004-x1e80100-ps8830-v2-2-5cd8008c8c40@linaro.org>

On Fri, Oct 04, 2024 at 04:57:38PM +0300, Abel Vesa wrote:

> +static int ps8830_enable_vregs(struct ps8830_retimer *retimer)
> +{

> +	return 0;
> +
> +err_vddat_disable:
> +	regulator_disable(retimer->vddat_supply);
> +

Nit: I'd drop the empty lines between the errors cases here.

> +err_vddar_disable:
> +	regulator_disable(retimer->vddar_supply);
> +
> +err_vdd_disable:
> +	regulator_disable(retimer->vdd_supply);
> +
> +err_vdd33_cap_disable:
> +	regulator_disable(retimer->vdd33_cap_supply);
> +
> +err_vdd33_disable:
> +	regulator_disable(retimer->vdd33_supply);
> +
> +	return ret;
> +}

> +static int ps8830_retimer_probe(struct i2c_client *client)
> +{
> +	struct device *dev = &client->dev;
> +	struct typec_switch_desc sw_desc = { };
> +	struct typec_retimer_desc rtmr_desc = { };
> +	struct ps8830_retimer *retimer;
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
> +	retimer->regmap = devm_regmap_init_i2c(client, &ps8830_retimer_regmap);
> +	if (IS_ERR(retimer->regmap)) {
> +		dev_err(dev, "failed to allocate register map\n");

Please make sure to log the errno as well here and below.

> +		return PTR_ERR(retimer->regmap);
> +	}
> +
> +	ret = ps8830_get_vregs(retimer);
> +	if (ret)
> +		return ret;
> +
> +	retimer->xo_clk = devm_clk_get(dev, "xo");
> +	if (IS_ERR(retimer->xo_clk))
> +		return dev_err_probe(dev, PTR_ERR(retimer->xo_clk),
> +				     "failed to get xo clock\n");
> +
> +	retimer->reset_gpio = devm_gpiod_get(dev, "reset", GPIOD_OUT_HIGH);

The reset line is active low and should be described as such in DT. So
here you want to request it as logically low if you want to deassert
reset.

Is there now timing requirements on when you deassert reset after
enabling the supplies?

> +	if (IS_ERR(retimer->reset_gpio))
> +		return dev_err_probe(dev, PTR_ERR(retimer->reset_gpio),
> +				     "failed to get reset gpio\n");
> +
> +	retimer->typec_switch = fwnode_typec_switch_get(dev->fwnode);
> +	if (IS_ERR(retimer->typec_switch)) {
> +		dev_err(dev, "failed to acquire orientation-switch\n");

I saw the driver fail here once, but not sure what the errno was since
it was not printed. Presumably it was a probe deferral and then this
should be a dev_err_probe() as well:

	ps8830_retimer 2-0008: failed to acquire orientation-switch

> +		return PTR_ERR(retimer->typec_switch);
> +	}
> +
> +	retimer->typec_mux = fwnode_typec_mux_get(dev->fwnode);
> +	if (IS_ERR(retimer->typec_mux)) {
> +		dev_err(dev, "failed to acquire mode-mux\n");

Similar here perhaps?

> +		goto err_switch_put;
> +	}
> +
> +	sw_desc.drvdata = retimer;
> +	sw_desc.fwnode = dev_fwnode(dev);
> +	sw_desc.set = ps8830_sw_set;
> +
> +	ret = drm_aux_bridge_register(dev);
> +	if (ret)
> +		goto err_mux_put;
> +
> +	retimer->sw = typec_switch_register(dev, &sw_desc);
> +	if (IS_ERR(retimer->sw)) {
> +		dev_err(dev, "failed to register typec switch\n");
> +		goto err_aux_bridge_unregister;
> +	}
> +
> +	rtmr_desc.drvdata = retimer;
> +	rtmr_desc.fwnode = dev_fwnode(dev);
> +	rtmr_desc.set = ps8830_retimer_set;
> +
> +	retimer->retimer = typec_retimer_register(dev, &rtmr_desc);
> +	if (IS_ERR(retimer->retimer)) {
> +		dev_err(dev, "failed to register typec retimer\n");
> +		goto err_switch_unregister;
> +	}
> +
> +	ret = clk_prepare_enable(retimer->xo_clk);
> +	if (ret) {
> +		dev_err(dev, "failed to enable XO: %d\n", ret);
> +		goto err_retimer_unregister;
> +	}

Should you really enable the clock before the regulators?

> +
> +	ret = ps8830_enable_vregs(retimer);
> +	if (ret)
> +		goto err_clk_disable;
> +
> +	/* delay needed as per datasheet */
> +	usleep_range(4000, 14000);
> +
> +	gpiod_set_value(retimer->reset_gpio, 1);

Here you only deassert reset in case the line is incorrectly described
as active high in DT.

> +	return 0;
> +
> +err_clk_disable:
> +	clk_disable_unprepare(retimer->xo_clk);
> +
> +err_retimer_unregister:
> +	typec_retimer_unregister(retimer->retimer);
> +
> +err_switch_unregister:
> +	typec_switch_unregister(retimer->sw);
> +
> +err_aux_bridge_unregister:
> +	gpiod_set_value(retimer->reset_gpio, 0);
> +	clk_disable_unprepare(retimer->xo_clk);
> +
> +err_mux_put:
> +	typec_mux_put(retimer->typec_mux);
> +
> +err_switch_put:
> +	typec_switch_put(retimer->typec_switch);

Drop newlines before labels?

> +
> +	return ret;
> +}

Johan

