Return-Path: <linux-arm-msm+bounces-47997-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2270FA35960
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Feb 2025 09:52:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7B9BC3ABE7A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Feb 2025 08:52:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5848C227BA4;
	Fri, 14 Feb 2025 08:52:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nULD+FBX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23989275401;
	Fri, 14 Feb 2025 08:52:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739523145; cv=none; b=pT/q7nQ3PhyBAsULDdIY5C2+eFE6bQp2avzmofQnLYCErQcb8jrfjwWRMpPl96Q7wBHBlBmpgfnZ5T5yWAY0OCkn8cPYMXSMKjzKyVDyt022TAebb2nCvPrz8okB/6Zb0pzS1j2mvYXGpAZmq/E3RR10KqcFirI2IlOUUFmd8lU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739523145; c=relaxed/simple;
	bh=GZu6aMzoNVpjWfc+Cmd+0SQtCa8Q39Ci/9y7ROkb0/U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KjiONtl22A8SfJVUUWQlxotGs9R598+5CVBQJc+Iu68N7CQWM7QsMdKVzo9px4NfbGREIBSOt+uUpNRjoq47OwysCdvk1BusC0eAUzn38GEY7Lyr+VrINusFRx3hWbP+HIWBUCc/l3upW0eT3rQCZBu5uksHOgvwagUAFgAGat4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nULD+FBX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91D51C4CED1;
	Fri, 14 Feb 2025 08:52:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739523144;
	bh=GZu6aMzoNVpjWfc+Cmd+0SQtCa8Q39Ci/9y7ROkb0/U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nULD+FBXO7Nyg0V+vAR3lGslXs5hgaONCMXA0GAfGIiJqpoFF3lcdZPJElyxQ5Ser
	 IVvEOGnmBdednlfW/hsWWreHo4TRvyrvqd84L1b6c4EcKBdwM3JkUpjpm4VO78Ihjz
	 uSESuyvuIDJaHG/b+DHfCEk0jm8V1Jr0yS2QAVa3JZ1rLBxk4g4CS1vpH1yRBTgz+w
	 azyiKEiI8bjJrezXMu9+cMe69AbdJZr3BTYlKsDK6RxzHCK/eO9qoQ1rFEnmADI6En
	 7fNGyXh/0moF5egq7bQfYdb28If5NmQV18E25+HMsA7IXzwh5uEePn9Fp/Xv7QpuQs
	 9oYSyePi1CirA==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1tirR3-00000000658-2iw9;
	Fri, 14 Feb 2025 09:52:33 +0100
Date: Fri, 14 Feb 2025 09:52:33 +0100
From: Johan Hovold <johan@kernel.org>
To: Abel Vesa <abel.vesa@linaro.org>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rajendra Nayak <quic_rjendra@quicinc.com>,
	Sibi Sankar <quic_sibis@quicinc.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Trilok Soni <quic_tsoni@quicinc.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v6 2/2] usb: typec: Add support for Parade PS8830 Type-C
 Retimer
Message-ID: <Z68EUTlHcm6TxjlY@hovoldconsulting.com>
References: <20250206-x1e80100-ps8830-v6-0-60b1e49cfa8d@linaro.org>
 <20250206-x1e80100-ps8830-v6-2-60b1e49cfa8d@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250206-x1e80100-ps8830-v6-2-60b1e49cfa8d@linaro.org>

On Thu, Feb 06, 2025 at 11:28:28AM +0200, Abel Vesa wrote:
> The Parade PS8830 is a USB4, DisplayPort and Thunderbolt 4 retimer,
> controlled over I2C. It usually sits between a USB/DisplayPort PHY
> and the Type-C connector, and provides orientation and altmode handling.

> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * Parade ps883x usb retimer driver

Nit: USB

> + *
> + * Copyright (C) 2024 Linaro Ltd.
> + */

> +static int ps883x_set(struct ps883x_retimer *retimer)
> +{
> +	int cfg0 = CONN_STATUS_0_CONNECTION_PRESENT;
> +	int cfg1 = 0x00;
> +	int cfg2 = 0x00;
> +
> +	if (retimer->orientation == TYPEC_ORIENTATION_NONE ||
> +	    retimer->mode == TYPEC_STATE_SAFE) {
> +		ps883x_configure(retimer, cfg0, cfg1, cfg2);
> +		return 0;
> +	}
> +
> +	if (retimer->mode != TYPEC_STATE_USB && retimer->svid != USB_TYPEC_DP_SID)
> +		return -EINVAL;
> +
> +	if (retimer->orientation == TYPEC_ORIENTATION_REVERSE)
> +		cfg0 |= CONN_STATUS_0_ORIENTATION_REVERSED;
> +
> +	switch (retimer->mode) {
> +	case TYPEC_STATE_USB:
> +		cfg0 |= CONN_STATUS_0_USB_3_1_CONNECTED;
> +		break;
> +

I'd drop these newlines before case statements, but your choice.

> +	case TYPEC_DP_STATE_C:
> +		cfg1 = CONN_STATUS_1_DP_CONNECTED |
> +		       CONN_STATUS_1_DP_SINK_REQUESTED |
> +		       CONN_STATUS_1_DP_PIN_ASSIGNMENT_C_D |
> +		       CONN_STATUS_1_DP_HPD_LEVEL;
> +		break;
> +
> +	case TYPEC_DP_STATE_D:
> +		cfg0 |= CONN_STATUS_0_USB_3_1_CONNECTED;
> +		cfg1 = CONN_STATUS_1_DP_CONNECTED |
> +		       CONN_STATUS_1_DP_SINK_REQUESTED |
> +		       CONN_STATUS_1_DP_PIN_ASSIGNMENT_C_D |
> +		       CONN_STATUS_1_DP_HPD_LEVEL;
> +		break;
> +
> +	case TYPEC_DP_STATE_E:
> +		cfg1 = CONN_STATUS_1_DP_CONNECTED |
> +		       CONN_STATUS_1_DP_HPD_LEVEL;
> +		break;
> +
> +	default:
> +		return -EOPNOTSUPP;
> +	}

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
> +	if (IS_ERR(retimer->regmap))
> +		return dev_err_probe(dev, PTR_ERR(retimer->regmap),
> +				     "failed to allocate register map\n");
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

What if the reset pin has not been configured by the boot firmware? Then
this input the to device will be floating when you power it on,
something which you'd typically try to avoid by asserting reset before
enabling power.

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
> +	ret = ps883x_enable_vregs(retimer);
> +	if (ret)
> +		goto err_mux_put;
> +
> +	ret = clk_prepare_enable(retimer->xo_clk);
> +	if (ret) {
> +		dev_err(dev, "failed to enable XO: %d\n", ret);
> +		goto err_vregs_disable;
> +	}
> +
> +	sw_desc.drvdata = retimer;
> +	sw_desc.fwnode = dev_fwnode(dev);
> +	sw_desc.set = ps883x_sw_set;
> +
> +	retimer->sw = typec_switch_register(dev, &sw_desc);
> +	if (IS_ERR(retimer->sw)) {
> +		ret = PTR_ERR(retimer->sw);
> +		dev_err(dev, "failed to register typec switch: %d\n", ret);
> +		goto err_clk_disable;
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
> +		goto err_switch_unregister;
> +	}
> +
> +	/* skip resetting if already configured */
> +	if (regmap_test_bits(retimer->regmap, REG_USB_PORT_CONN_STATUS_0,
> +			     CONN_STATUS_0_CONNECTION_PRESENT) == 1)
> +		return gpiod_direction_output(retimer->reset_gpio, 0);

I'm still a little concerned about this. Won't you end up with i2c
timeout errors in the logs if the device is held in reset before probe?

Have you tried unbinding the device and rebinding to test this?

And what about the CONN_STATUS_0_CONNECTION_PRESENT bit; it sounds like
it just reflects the connected status. Are you sure it will not be set
for a device that has not yet been configured?

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

This one should go above err_vregs_disable or can end up with an
unbalanced clock disable or regulators left on after probe failure.

And you should assert reset before disabling clocks as well to avoid
driving the pin after disabling power.

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
> +	clk_disable_unprepare(retimer->xo_clk);
> +
> +	ps883x_disable_vregs(retimer);
> +
> +	typec_mux_put(retimer->typec_mux);
> +	typec_switch_put(retimer->typec_switch);
> +}

Johan

