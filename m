Return-Path: <linux-arm-msm+bounces-40309-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D06CE9E3F88
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Dec 2024 17:25:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 966BE1638FF
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Dec 2024 16:24:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E984020C473;
	Wed,  4 Dec 2024 16:24:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PSqVLw+n"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B974E19993D;
	Wed,  4 Dec 2024 16:24:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733329497; cv=none; b=eJoCaBIvjFQHgLfN6cFwJF/9vhdrF2kATlrkuvKaDMa/2+SkfTyRTaSC28Z1hxJzy9lnpwd+Z6mk1DYm/t2j5vu33jfvWMgUw2zlRV2S9+48EEIjnczAw0/DsFM+MPMNc9qEHwfhb2A+BRkqDcTQerI5yN42O4WqncbxtMBWPJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733329497; c=relaxed/simple;
	bh=uB7DsP1F0FDOCbpTD/scevBqJRno5Bgra1OjBEcv41A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h1P5YCDfSmSAp7Su897QhFH7q1LXyeKRq5rowScSRFXdI0yhGNCiyzWqo7p67bT+rBjHcqw/PQhHLY3hhDpS9roFBYEmsstSRsnhxXVvISQU50PZGarcEUpK/cjDviR4X+MsNauqN31bL6g8DFQKleKySKgy4y481orViYEhV/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PSqVLw+n; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09824C4CECD;
	Wed,  4 Dec 2024 16:24:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733329497;
	bh=uB7DsP1F0FDOCbpTD/scevBqJRno5Bgra1OjBEcv41A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PSqVLw+nBR1NMFIgbfB6/zuFxO9GaTDvlgXutNOD+ud7zC6pHYP8v0KXpaO5/fV4G
	 ytHbMLE1f7czCdrXQTvz03oNktG3i8+bea1NEJyb+yb2S9IYtzdtoqxcJxfrbD1hhc
	 cUxhuVr5r1RR2MXT5/eJtqq8SbA7Mv/JpGITHDe/2sN9POxuDlxjMyTpqbFKdbgic7
	 q63+HpFVuqJIWcfnaQLiQnX+Q3KNraCdajCnJ+IEHsjvTwQn5qLYQMOA9iY5+LSm92
	 k6IGSL3vNYv+pWbC5VILpdiSQRrkz+A06PUe5/dxadyqbRi9jA9zWNmEkAPO8CagQz
	 VMFKCqdUcwUKQ==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1tIsBK-000000000uP-15N5;
	Wed, 04 Dec 2024 17:24:55 +0100
Date: Wed, 4 Dec 2024 17:24:54 +0100
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
Subject: Re: [PATCH v5 2/6] usb: typec: Add support for Parade PS8830 Type-C
 Retimer
Message-ID: <Z1CCVjEZMQ6hJ-wK@hovoldconsulting.com>
References: <20241112-x1e80100-ps8830-v5-0-4ad83af4d162@linaro.org>
 <20241112-x1e80100-ps8830-v5-2-4ad83af4d162@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241112-x1e80100-ps8830-v5-2-4ad83af4d162@linaro.org>

On Tue, Nov 12, 2024 at 07:01:11PM +0200, Abel Vesa wrote:
> The Parade PS8830 is a USB4, DisplayPort and Thunderbolt 4 retimer,
> controlled over I2C. It usually sits between a USB/DisplayPort PHY
> and the Type-C connector, and provides orientation and altmode handling.
> 
> The boards that use this retimer are the ones featuring the Qualcomm
> Snapdragon X Elite SoCs.

> +static int ps883x_sw_set(struct typec_switch_dev *sw,
> +			 enum typec_orientation orientation)
> +{
> +	struct ps883x_retimer *retimer = typec_switch_get_drvdata(sw);
> +	int ret = 0;
> +
> +	ret = typec_switch_set(retimer->typec_switch, orientation);
> +	if (ret)
> +		return ret;
> +
> +	mutex_lock(&retimer->lock);
> +
> +	if (retimer->orientation != orientation) {
> +		retimer->orientation = orientation;
> +
> +		ret = ps883x_set(retimer);
> +	}
> +
> +	mutex_unlock(&retimer->lock);
> +
> +	return ret;
> +}

This seems to indicate a bigger problem, but I see this function called
during early resume while the i2c controller is suspended:

[   54.213900] ------------[ cut here ]------------
[   54.213942] i2c i2c-2: Transfer while suspended
[   54.214125] WARNING: CPU: 0 PID: 126 at drivers/i2c/i2c-core.h:56 __i2c_transfer+0x874/0x968 [i2c_core]
...
[   54.214833] CPU: 0 UID: 0 PID: 126 Comm: kworker/0:2 Not tainted 6.13.0-rc1 #11
[   54.214844] Hardware name: Qualcomm CRD, BIOS 6.0.231221.BOOT.MXF.2.4-00348.1-HAMOA-1 12/21/2023
[   54.214852] Workqueue: events pmic_glink_altmode_worker [pmic_glink_altmode]
...
[   54.215090] Call trace:
[   54.215097]  __i2c_transfer+0x874/0x968 [i2c_core] (P)
[   54.215112]  __i2c_transfer+0x874/0x968 [i2c_core] (L)
[   54.215126]  i2c_transfer+0x94/0xf0 [i2c_core]
[   54.215140]  i2c_transfer_buffer_flags+0x5c/0x90 [i2c_core]
[   54.215153]  regmap_i2c_write+0x20/0x58 [regmap_i2c]
[   54.215166]  _regmap_raw_write_impl+0x740/0x894
[   54.215184]  _regmap_bus_raw_write+0x60/0x7c
[   54.215192]  _regmap_write+0x60/0x1b4
[   54.215200]  regmap_write+0x4c/0x78
[   54.215207]  ps883x_set+0xb0/0x10c [ps883x]
[   54.215219]  ps883x_sw_set+0x74/0x98 [ps883x]
[   54.215227]  typec_switch_set+0x58/0x90 [typec]
[   54.215248]  pmic_glink_altmode_worker+0x3c/0x23c [pmic_glink_altmode]
[   54.215257]  process_one_work+0x20c/0x610
[   54.215274]  worker_thread+0x23c/0x378
[   54.215283]  kthread+0x124/0x128
[   54.215291]  ret_from_fork+0x10/0x20
[   54.215303] irq event stamp: 28140
[   54.215309] hardirqs last  enabled at (28139): [<ffffd15e3bc2a434>] __up_console_sem+0x6c/0x80
[   54.215325] hardirqs last disabled at (28140): [<ffffd15e3c596aa4>] el1_dbg+0x24/0x8c
[   54.215341] softirqs last  enabled at (28120): [<ffffd15e3bb9b82c>] handle_softirqs+0x4c4/0x4dc
[   54.215355] softirqs last disabled at (27961): [<ffffd15e3bb501ec>] __do_softirq+0x14/0x20
[   54.215363] ---[ end trace 0000000000000000 ]---
[   54.216889] Enabling non-boot CPUs ...

This can be reproduced on the CRD (or T14s) by disconnecting, for
example, a mass storage device while the laptop is suspended.

> +static int ps883x_retimer_set(struct typec_retimer *rtmr,
> +			      struct typec_retimer_state *state)
> +{
> +	struct ps883x_retimer *retimer = typec_retimer_get_drvdata(rtmr);
> +	struct typec_mux_state mux_state;
> +	int ret = 0;
> +
> +	mutex_lock(&retimer->lock);
> +
> +	if (state->mode != retimer->mode) {
> +		retimer->mode = state->mode;
> +
> +		if (state->alt)
> +			retimer->svid = state->alt->svid;
> +		else
> +			retimer->svid = 0; // No SVID

Nit: I'd prefer if you avoid c99 comments for consistency.

> +		ret = ps883x_set(retimer);
> +	}
> +
> +	mutex_unlock(&retimer->lock);
> +
> +	if (ret)
> +		return ret;
> +
> +	mux_state.alt = state->alt;
> +	mux_state.data = state->data;
> +	mux_state.mode = state->mode;
> +
> +	return typec_mux_set(retimer->typec_mux, &mux_state);
> +}

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

GPIOD_ASIS is documented as requiring you to later set the direction,
but this does not happen unconditionally below.

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
> +		ret = dev_err_probe(dev, PTR_ERR(retimer->sw),
> +				    "failed to register typec switch\n");
> +		goto err_clk_disable;
> +	}
> +
> +	rtmr_desc.drvdata = retimer;
> +	rtmr_desc.fwnode = dev_fwnode(dev);
> +	rtmr_desc.set = ps883x_retimer_set;
> +
> +	retimer->retimer = typec_retimer_register(dev, &rtmr_desc);
> +	if (IS_ERR(retimer->retimer)) {
> +		ret = dev_err_probe(dev, PTR_ERR(retimer->sw),
> +				    "failed to register typec retimer\n");
> +		goto err_switch_unregister;
> +	}

The registration functions do not return -EPROBE_DEFER so I'd prefer if
you switch back to dev_err() here as we already discussed. A driver must
not probe defer after having registered child devices so it's important
to document which functions can actually trigger a probe deferral. 

I know there's been a recent change to the dev_err_probe() suggesting
that it could be used anyway, but I think that's a really bad idea and
I'm considering sending a revert for that.

> +
> +	/* skip resetting if already configured */
> +	if (regmap_test_bits(retimer->regmap, REG_USB_PORT_CONN_STATUS_0,
> +			     CONN_STATUS_0_CONNECTION_PRESENT))
> +		return 0;

What if the device is held in reset? This looks like it only works if
the boot firmware has already enabled the retimer. Otherwise you may
return success from probe here with the retimer still in reset.

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
> +	clk_disable_unprepare(retimer->xo_clk);
> +
> +	ps883x_disable_vregs(retimer);
> +
> +	typec_mux_put(retimer->typec_mux);
> +	typec_switch_put(retimer->typec_switch);
> +}

Johan

