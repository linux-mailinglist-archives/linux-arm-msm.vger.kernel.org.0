Return-Path: <linux-arm-msm+bounces-4086-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0369280B354
	for <lists+linux-arm-msm@lfdr.de>; Sat,  9 Dec 2023 09:50:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5DFBDB209E5
	for <lists+linux-arm-msm@lfdr.de>; Sat,  9 Dec 2023 08:50:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16CDBC8C1;
	Sat,  9 Dec 2023 08:50:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="f36WZ639"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.smtpout.orange.fr (smtp-22.smtpout.orange.fr [80.12.242.22])
	by lindbergh.monkeyblade.net (Postfix) with ESMTP id 774EC10DF
	for <linux-arm-msm@vger.kernel.org>; Sat,  9 Dec 2023 00:50:24 -0800 (PST)
Received: from [192.168.1.18] ([92.140.202.140])
	by smtp.orange.fr with ESMTPA
	id BsvCrcsGt8sqPBsvCrXaRV; Sat, 09 Dec 2023 09:42:52 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1702111372;
	bh=OL7jJBAHp3+DKzbCvIViVa6sqM1F9KNTat4GEYWo3l4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=f36WZ639mb34IksRNaZ5zgh56e30qvgeiG2HRFdG0qifwbk17zBUE5ybPQoK4APa/
	 xbOQXM3oS8EEZG3+9TrPSXWbDFOYAUR5Ujf51ci7KTOcppfu5PD05hjq1c+qKtK7Tb
	 k7G/NoiUyKnWc7qJBprEVoQLjAwaftR///q5FLcljBNG1UdCPBGYsfkABYnL96sAHx
	 HEUGdL8lF5Zk7GorqLnf2l5dDaMnXSh8iSmxChgR9cf7H+FYQ1lIJtWHlJpXKJh2yT
	 0HXQqCJjL0cRNQmksacxES8XH3nBxSYeN1RnzG3fpcQDbz7LaMV0Ka6rsnAqOM0Z+u
	 1owR75wXIe9Xw==
X-ME-Helo: [192.168.1.18]
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sat, 09 Dec 2023 09:42:52 +0100
X-ME-IP: 92.140.202.140
Message-ID: <02a2787a-1fb9-4238-820b-c3b1e8460e5a@wanadoo.fr>
Date: Sat, 9 Dec 2023 09:42:49 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] usb: typec: mux: add Qualcomm WCD939X USB SubSystem
 Altmode Mux driver
Content-Language: fr
To: Neil Armstrong <neil.armstrong@linaro.org>, Andy Gross
 <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20231208-topic-sm8650-upstream-wcd939x-usbss-v1-0-91d1ba680fe0@linaro.org>
 <20231208-topic-sm8650-upstream-wcd939x-usbss-v1-2-91d1ba680fe0@linaro.org>
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <20231208-topic-sm8650-upstream-wcd939x-usbss-v1-2-91d1ba680fe0@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Le 08/12/2023 à 16:27, Neil Armstrong a écrit :
> Qualcomm WCD9390/WCD9395 is a standalone Hi-Fi audio codec IC with a
> functionally separate USB SubSystem for Altmode/Analog Audio Switch
> accessible over an I2C interface.
> 
> It provides switching USB-C USB2.0 lines between USB and Audio Headphones
> speaker lines, and the USB-C SBU lines between DisplayPort AUX and Audio
> Headphones Microphone/Ground.
> 
> The Audio Headphone and Microphone data path between the Codec and the
> USB-C Mux subsystems are external to the IC, thus requiring DT
> port-endpoint graph description to handle USB-C altmode & orientation
> switching for Audio Accessory Mode.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---

...

> +	usbss->sw = typec_switch_register(dev, &sw_desc);
> +	if (IS_ERR(usbss->sw)) {
> +		ret = dev_err_probe(dev, PTR_ERR(usbss->sw), "failed to register typec switch\n");
> +		goto err_regulator_disable;
> +	}
> +
> +	mux_desc.drvdata = usbss;
> +	mux_desc.fwnode = dev_fwnode(dev);
> +	mux_desc.set = wcd939x_usbss_mux_set;
> +
> +	usbss->mux = typec_mux_register(dev, &mux_desc);
> +	if (IS_ERR(usbss->mux)) {
> +		typec_switch_unregister(usbss->sw);

Already called at the 'err_switch_unregister' label below.

> +		ret = dev_err_probe(dev, PTR_ERR(usbss->mux), "failed to register typec mux\n");
> +		goto err_switch_unregister;
> +	}
> +
> +	i2c_set_clientdata(client, usbss);
> +
> +	return 0;
> +
> +err_switch_unregister:
> +	typec_switch_unregister(usbss->sw);
> +
> +err_regulator_disable:
> +	regulator_disable(usbss->vdd_supply);
> +
> +err_mux_switch:
> +	typec_switch_put(usbss->codec_switch);
> +
> +err_mux_put:
> +	typec_mux_put(usbss->codec);
> +
> +	return ret;
> +}
> +
> +static void wcd939x_usbss_remove(struct i2c_client *client)
> +{
> +	struct wcd939x_usbss *usbss = i2c_get_clientdata(client);
> +
> +	typec_mux_unregister(usbss->mux);
> +	typec_switch_unregister(usbss->sw);
> +
> +	regulator_disable(usbss->vdd_supply);

Based on error hadling of the probe: typec_switch_put() missing?

> +
> +	typec_mux_put(usbss->codec);
> +}

CJ


