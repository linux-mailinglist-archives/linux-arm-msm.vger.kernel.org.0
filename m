Return-Path: <linux-arm-msm+bounces-48325-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 94B19A39431
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Feb 2025 08:54:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9D56A1888F86
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Feb 2025 07:54:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2CB621FF7A0;
	Tue, 18 Feb 2025 07:54:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LToRPUYw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EECC71FF60C;
	Tue, 18 Feb 2025 07:54:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739865283; cv=none; b=kU51zFg8mbd5rd0DVQqpAJoKUubISGQ4HBQCVIbAZp8RhulMYnA14DEjGeMKdYqGc0wtUMoR5EXu9KkiVhbz4KZNtR+CAFn1x3b92JB1uVlblQ/WcobzjtjMTCY2T2jciDv/qFui9EH8Q4DVHB306+67xT54hdRdZ0SQoKcYwRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739865283; c=relaxed/simple;
	bh=v6rks38UjHbSedKTqBUrl+hkA672IhEJ7GpUXquArPA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=STVCcmVxwx535hyinrk2FR7/wehjD9vBlSu7VnHT8vHcFNJe3cIS0lKQ75A82B2sK+AWcxB3WdQL60bII89gwhF3n8Pjzjh5/SuUisa3i7XMswxTpkKizA+xVVAIH0S6Umur+bqV5po8bPqCho14jxzxLqsrPyaU5GfIYxsq37o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LToRPUYw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5DB2BC4CEE2;
	Tue, 18 Feb 2025 07:54:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739865281;
	bh=v6rks38UjHbSedKTqBUrl+hkA672IhEJ7GpUXquArPA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LToRPUYwFDatGYuVMfS6Qzc6jsJu1/cSBZ7FSMONQ53i2pQPdbiDKih0rw5E4zUSs
	 sSF3gc6UqJrgZ+STAZyVezsYZOboCIbB73cLQJuM3/ckaXE5ht3BPqSMX/GvKmJ8dQ
	 NGd2d7bNhUpHwq9tY6nwWZ2KyIHHD+a6bWWuckGxwFh+J0c/iKIDhE2sUHDj3tTUqa
	 F2vXRdWDyfV8PldwsIf6oVMefRyoLfd8ZfdiVNCclJxYKp+4vQJWforvhGlQtpRGOW
	 YEieCXceTZ1uUNqCPiwM2Gro9JSfiRwF59m45R4vSJgmIphJlq6vI1rB/BkDojZhjt
	 H08LdkorabBJQ==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1tkIRL-000000000R5-3DtY;
	Tue, 18 Feb 2025 08:54:48 +0100
Date: Tue, 18 Feb 2025 08:54:47 +0100
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
Message-ID: <Z7Q8xwcfeE3tcBLL@hovoldconsulting.com>
References: <20250206-x1e80100-ps8830-v6-0-60b1e49cfa8d@linaro.org>
 <20250206-x1e80100-ps8830-v6-2-60b1e49cfa8d@linaro.org>
 <Z68EUTlHcm6TxjlY@hovoldconsulting.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z68EUTlHcm6TxjlY@hovoldconsulting.com>

On Fri, Feb 14, 2025 at 09:52:33AM +0100, Johan Hovold wrote:
> On Thu, Feb 06, 2025 at 11:28:28AM +0200, Abel Vesa wrote:
> > The Parade PS8830 is a USB4, DisplayPort and Thunderbolt 4 retimer,
> > controlled over I2C. It usually sits between a USB/DisplayPort PHY
> > and the Type-C connector, and provides orientation and altmode handling.

Turns out Greg had picked this one up 20 minutes before I sent my
comments. I did see Heikki's ack the day before and realised time was
short but was not able to drop everything and review the last revision
due to meetings that afternoon.

Well, well, I guess you can say I only have myself to blame for not
reviewing within a week of the last revision being posted.

> > +static int ps883x_retimer_probe(struct i2c_client *client)
> > +{
> > +	struct device *dev = &client->dev;
> > +	struct typec_switch_desc sw_desc = { };
> > +	struct typec_retimer_desc rtmr_desc = { };
> > +	struct ps883x_retimer *retimer;
> > +	int ret;
> > +
> > +	retimer = devm_kzalloc(dev, sizeof(*retimer), GFP_KERNEL);
> > +	if (!retimer)
> > +		return -ENOMEM;
> > +
> > +	retimer->client = client;
> > +
> > +	mutex_init(&retimer->lock);
> > +
> > +	retimer->regmap = devm_regmap_init_i2c(client, &ps883x_retimer_regmap);
> > +	if (IS_ERR(retimer->regmap))
> > +		return dev_err_probe(dev, PTR_ERR(retimer->regmap),
> > +				     "failed to allocate register map\n");
> > +
> > +	ret = ps883x_get_vregs(retimer);
> > +	if (ret)
> > +		return ret;
> > +
> > +	retimer->xo_clk = devm_clk_get(dev, NULL);
> > +	if (IS_ERR(retimer->xo_clk))
> > +		return dev_err_probe(dev, PTR_ERR(retimer->xo_clk),
> > +				     "failed to get xo clock\n");
> > +
> > +	retimer->reset_gpio = devm_gpiod_get(dev, "reset", GPIOD_ASIS);
> 
> What if the reset pin has not been configured by the boot firmware? Then
> this input the to device will be floating when you power it on,
> something which you'd typically try to avoid by asserting reset before
> enabling power.
> 
> > +	if (IS_ERR(retimer->reset_gpio))
> > +		return dev_err_probe(dev, PTR_ERR(retimer->reset_gpio),
> > +				     "failed to get reset gpio\n");
> > +
> > +	retimer->typec_switch = typec_switch_get(dev);
> > +	if (IS_ERR(retimer->typec_switch))
> > +		return dev_err_probe(dev, PTR_ERR(retimer->typec_switch),
> > +				     "failed to acquire orientation-switch\n");
> > +
> > +	retimer->typec_mux = typec_mux_get(dev);
> > +	if (IS_ERR(retimer->typec_mux)) {
> > +		ret = dev_err_probe(dev, PTR_ERR(retimer->typec_mux),
> > +				    "failed to acquire mode-mux\n");
> > +		goto err_switch_put;
> > +	}
> > +
> > +	ret = drm_aux_bridge_register(dev);
> > +	if (ret)
> > +		goto err_mux_put;
> > +
> > +	ret = ps883x_enable_vregs(retimer);
> > +	if (ret)
> > +		goto err_mux_put;
> > +
> > +	ret = clk_prepare_enable(retimer->xo_clk);
> > +	if (ret) {
> > +		dev_err(dev, "failed to enable XO: %d\n", ret);
> > +		goto err_vregs_disable;
> > +	}
> > +
> > +	sw_desc.drvdata = retimer;
> > +	sw_desc.fwnode = dev_fwnode(dev);
> > +	sw_desc.set = ps883x_sw_set;
> > +
> > +	retimer->sw = typec_switch_register(dev, &sw_desc);
> > +	if (IS_ERR(retimer->sw)) {
> > +		ret = PTR_ERR(retimer->sw);
> > +		dev_err(dev, "failed to register typec switch: %d\n", ret);
> > +		goto err_clk_disable;
> > +	}
> > +
> > +	rtmr_desc.drvdata = retimer;
> > +	rtmr_desc.fwnode = dev_fwnode(dev);
> > +	rtmr_desc.set = ps883x_retimer_set;
> > +
> > +	retimer->retimer = typec_retimer_register(dev, &rtmr_desc);
> > +	if (IS_ERR(retimer->retimer)) {
> > +		ret = PTR_ERR(retimer->retimer);
> > +		dev_err(dev, "failed to register typec retimer: %d\n", ret);
> > +		goto err_switch_unregister;
> > +	}
> > +
> > +	/* skip resetting if already configured */
> > +	if (regmap_test_bits(retimer->regmap, REG_USB_PORT_CONN_STATUS_0,
> > +			     CONN_STATUS_0_CONNECTION_PRESENT) == 1)
> > +		return gpiod_direction_output(retimer->reset_gpio, 0);
> 
> I'm still a little concerned about this. Won't you end up with i2c
> timeout errors in the logs if the device is held in reset before probe?

You should be able to use i2c_smbus_read_byte() to avoid logging errors
when the boot firmware has *not* enabled the device.

My worry is that this perfectly valid case has not even been tested,
and worst case you may need a device-tree property to fully determine
whether the device has been initialised by the boot firmware or not (cf.
'regulator-boot-on').

And if we need binding changes those need to be there from the start.

I guess we have a few weeks to work this out, and if needed we can
always disable the driver temporarily.

> Have you tried unbinding the device and rebinding to test this?
> 
> And what about the CONN_STATUS_0_CONNECTION_PRESENT bit; it sounds like
> it just reflects the connected status. Are you sure it will not be set
> for a device that has not yet been configured?

> > +err_switch_unregister:
> > +	typec_switch_unregister(retimer->sw);
> > +err_vregs_disable:
> > +	ps883x_disable_vregs(retimer);
> > +err_clk_disable:
> > +	clk_disable_unprepare(retimer->xo_clk);
> 
> This one should go above err_vregs_disable or can end up with an
> unbalanced clock disable or regulators left on after probe failure.
> 
> And you should assert reset before disabling clocks as well to avoid
> driving the pin after disabling power.

I'll send an incremental fix for this.

Johan

