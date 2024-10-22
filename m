Return-Path: <linux-arm-msm+bounces-35354-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id DC9CE9A9B55
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Oct 2024 09:42:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6C6A6B23C75
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Oct 2024 07:42:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B8C5153565;
	Tue, 22 Oct 2024 07:41:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="fvNqRkuh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from msa.smtpout.orange.fr (smtp-80.smtpout.orange.fr [80.12.242.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 987E313E8AE;
	Tue, 22 Oct 2024 07:41:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.80
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729582918; cv=none; b=qilwU/550nvrZ9I/7O83hfOECqwt5axmsGvbuAVpQH1Mhx2MZi1XMoVshrXJvbKYQC5+x2UlwxkF4ryfHntrDAfsGi18OMwLDcD40oU/CBr3qUHdSJMU5Z3fys+xBuaGwzwAzL9ioQpflff8uaGUsS7KLGpTDUCSiOS1RIwAo3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729582918; c=relaxed/simple;
	bh=EaSsoKUocSxFq6lo68r3lqqCKwaJ87/iRyAGTf8bEBQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jNALMlSDIMFA82R0ZZuI6bm5+Sj+QBu4netiARqACJ1pveAdL3QablZYyf7DEGcZqK8eCW/EuiDvOg7Wv6FXDnCx5m0n/Y5IraJ5YSAKKw0UZsk2r/eJIQ0eVy6JQPPlxLxzkbiQ4YBd6RxeHqE+Qh6IO9L485Ei15opY9yRdEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=fvNqRkuh; arc=none smtp.client-ip=80.12.242.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Received: from [192.168.1.37] ([90.11.132.44])
	by smtp.orange.fr with ESMTPA
	id 39WTtIkFV9xgS39WTtWlmo; Tue, 22 Oct 2024 09:41:47 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1729582907;
	bh=K7ZlxaUdRutoSIgtwC3NtQ+vu1e/YlbPMrH1huVE15U=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=fvNqRkuhXQzWZJ8zwt5oAgyTiL5mmtJbfHwqBXfRVlPDGGN7NG3Ys9EJdj6veV4I8
	 tGcF1OPDq5YHRojqacCqYhufVCHE+tV7blhvCv67Bdk7KeXkA4In97k1uFchfALqPp
	 odK9X9LH4FIC+eyGjc926ZoIXD2kdcfjKtlw5c9KzOpMWO5PNdsj+y4v1HOC7E6Ni8
	 ilWdFVEyq+cEgChqLno3SytpUnzomLY6md5ZsKIDBJkozffyrJId08/T4b+rNdTeq8
	 JlUb0fl/Wo8J2xyLqrsudcbRoGR/Eh3+37glBSwlLwtr9XN9MinFJeTR2Cc/OnSRLk
	 8C/xEHhsqcQcw==
X-ME-Helo: [192.168.1.37]
X-ME-Auth: bWFyaW9uLmphaWxsZXRAd2FuYWRvby5mcg==
X-ME-Date: Tue, 22 Oct 2024 09:41:47 +0200
X-ME-IP: 90.11.132.44
Message-ID: <133f0232-6e62-4532-bdeb-85b5927fddc8@wanadoo.fr>
Date: Tue, 22 Oct 2024 09:41:42 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] usb: typec: Add support for Parade PS8830 Type-C
 Retimer
To: Abel Vesa <abel.vesa@linaro.org>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Rajendra Nayak <quic_rjendra@quicinc.com>,
 Sibi Sankar <quic_sibis@quicinc.com>, Johan Hovold <johan@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Trilok Soni <quic_tsoni@quicinc.com>, linux-kernel@vger.kernel.org,
 linux-usb@vger.kernel.org, devicetree@vger.kernel.org
References: <20241004-x1e80100-ps8830-v2-0-5cd8008c8c40@linaro.org>
 <20241004-x1e80100-ps8830-v2-2-5cd8008c8c40@linaro.org>
Content-Language: en-US, fr-FR
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <20241004-x1e80100-ps8830-v2-2-5cd8008c8c40@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Le 04/10/2024 à 15:57, Abel Vesa a écrit :
> The Parade PS8830 is a Type-C muti-protocol retimer controlled over I2C.
> It provides both altmode and orientation handling.
> 
> Add a driver with support for the following modes:
>   - DP 4lanes
>   - DP 2lanes + USB3
>   - USB3
> 
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> ---

Hi,

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
> +	if (IS_ERR(retimer->reset_gpio))
> +		return dev_err_probe(dev, PTR_ERR(retimer->reset_gpio),
> +				     "failed to get reset gpio\n");
> +
> +	retimer->typec_switch = fwnode_typec_switch_get(dev->fwnode);
> +	if (IS_ERR(retimer->typec_switch)) {
> +		dev_err(dev, "failed to acquire orientation-switch\n");
> +		return PTR_ERR(retimer->typec_switch);
> +	}
> +
> +	retimer->typec_mux = fwnode_typec_mux_get(dev->fwnode);
> +	if (IS_ERR(retimer->typec_mux)) {
> +		dev_err(dev, "failed to acquire mode-mux\n");
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
> +
> +	ret = ps8830_enable_vregs(retimer);
> +	if (ret)
> +		goto err_clk_disable;
> +
> +	/* delay needed as per datasheet */
> +	usleep_range(4000, 14000);
> +
> +	gpiod_set_value(retimer->reset_gpio, 1);
> +
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

Is this called useful here?
gpiod_set_value(, 1) has not been called yet.

It made sense to have something like that in v1, but it looks strange in v2.

CJ

> +	clk_disable_unprepare(retimer->xo_clk);
> +
> +err_mux_put:
> +	typec_mux_put(retimer->typec_mux);
> +
> +err_switch_put:
> +	typec_switch_put(retimer->typec_switch);
> +
> +	return ret;
> +}

...

