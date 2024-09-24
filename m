Return-Path: <linux-arm-msm+bounces-32327-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 485EF9849E6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Sep 2024 18:43:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0AD06282387
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Sep 2024 16:43:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A86F1ABEA9;
	Tue, 24 Sep 2024 16:43:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qW09/JmN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D0F7154BEA
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Sep 2024 16:43:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727196203; cv=none; b=LOtHGIuUO/4dJy4F5okwd9e36cvfGebh7YXrny28Wc8niwG/SdX8Ca7k0TMPlTmi/9JZShrMDliaCpjUDUhd/u83TwBr/0/0nxK+U30ga5pd6GhB15M6RN1IKFNBKFuoGmL4qiP1wUYCWycbPpLnojXYJMdjFIV5d86RJK9Knic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727196203; c=relaxed/simple;
	bh=zT4k+0TxX97y+c3I5eO7EHj/LUItIHnBYBJW7QZhE+A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=golh8l/i1lhoR/sFgNhv3u/tCtPH909cPkEg2NHhlEU8iAKsFVfLuX251c8JWM+fpPyuvzOjemDvjjU/2Fe5czU7qha3V4ZXalCmWksPo8CcZ5ilO8ZAKvNRY6WevzpJQjHDM8RY5/0NPHugj6wJvBiA5KJPF00Q3i1tNnJ+V/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qW09/JmN; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2f754d4a6e4so57556771fa.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Sep 2024 09:43:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727196199; x=1727800999; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=iLmWupQuIxURteGxaOu17nS4Aw/Rss6V3alddoHTmYQ=;
        b=qW09/JmNyEhkxklbk2TP1irQN9eB3yDkfm5eX8sjC9QoY5vq1Lf9VBv6wOON8RZZOj
         5wCCrikwehefEIu4AMd2hiD6L8jFWNVjIbs47/XAqOdv074lE/bRd/GhQaL6EJRNcsZq
         JYHOPvi1SI5gjSXnC3KxQoKsFoR4Y7k1t5l5t3QYLQyPEfBPeb4SloBfI8oTGzq+loWB
         z4W2a5gfEjJE+ga9Hbnm7Ztns2FwgRWsNanjZDaHV6N4brEkE0PoK0M1CICdUq8Mp4N2
         KV5Lx++qtJXhUWW547p9dydrLNSKdoBA7PfZosvvKDSzXcFF2VlLDF2Qv9gg4Ds/cojo
         63Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727196199; x=1727800999;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iLmWupQuIxURteGxaOu17nS4Aw/Rss6V3alddoHTmYQ=;
        b=m5JBkYrFmWdfu/TxF07Ghm7MVvcLzv+fBWXEGRYAMONqROlwvcvHwVylvcm+10vq0r
         oRXEsYkFgKLu9xNJTEBUiLnUdgnXRKJvAiRnLWbNZJ7EciKvgxTAa4tD1xYc9kJmTAKz
         EDNoEEeOEg6ytqJiRbEtA8/r4dkePuG9iUA4cd5RWhiHhWeA1OdRlB3UdhNqYsjeXBL5
         9j1c3fq2Bdg2Hez+gcEFZr9l29AdR2yelbGOOqxDBlya5/M8YX7TUlHZ1aFt0LUEiiaq
         1COYCyP56BDBzJiS0grV5gs3HZoFGJvKNG1DlrfAfhVe6lHiEzWVlx2JKTFaM+Jgmw7Z
         dhjA==
X-Forwarded-Encrypted: i=1; AJvYcCUVdwVZQhYT1ZZmJzJ3+LZPdw6Ya/0b7IjR6afQrgR2HsCMfDSvLB5DLLEi6syUZKUxLNjCxNhjXkPT0fi3@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1iiTQN8IojbuYehO0h27HG1z20DffDfWU832NbeOQd/Ki22Vg
	cBLtn3t//oQsAD5R33YVlI94DeGLt0wOmnIxgAnBa78Vysff+y9XIwfWwuvfx8A=
X-Google-Smtp-Source: AGHT+IEezobaIL04e3lPxMDU2Y+PPIoCnCTJI3N3CWxUIHXwcFH+J92I5mDokhkQOYy3JFhcIgkX5A==
X-Received: by 2002:a2e:bc26:0:b0:2f5:2e2:eafb with SMTP id 38308e7fff4ca-2f915fc1487mr256741fa.7.1727196199064;
        Tue, 24 Sep 2024 09:43:19 -0700 (PDT)
Received: from linaro.org ([2a02:2454:ff21:ef80:4518:32:3b61:babd])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c5cf4d7461sm916227a12.79.2024.09.24.09.43.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Sep 2024 09:43:18 -0700 (PDT)
Date: Tue, 24 Sep 2024 18:43:16 +0200
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 2/2] phy: add NXP PTN3222 eUSB2 to USB2 redriver
Message-ID: <ZvLsJEa2PhIxFRDC@linaro.org>
References: <20240830-nxp-ptn3222-v2-0-4c6d8535cf6c@linaro.org>
 <20240830-nxp-ptn3222-v2-2-4c6d8535cf6c@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240830-nxp-ptn3222-v2-2-4c6d8535cf6c@linaro.org>

On Fri, Aug 30, 2024 at 11:20:46AM +0300, Dmitry Baryshkov wrote:
> The NXP PTN3222 is the single-port eUSB2 to USB2 redriver that performs
> translation between eUSB2 and USB2 signalling schemes. It supports all
> three data rates: Low Speed, Full Speed and High Speed.
> 
> The reset state enables autonegotiation of the PHY role and of the data
> rate, so no additional programming is required.
> 
> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
> Tested-by: Konrad Dybcio <konradybcio@kernel.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

This works well for the USB fingerprint reader on the Qualcomm X1E80100
CRD. Thanks a lot for the clean driver :-)

Reviewed-by: Stephan Gerhold <stephan.gerhold@linaro.org>
Tested-by: Stephan Gerhold <stephan.gerhold@linaro.org>

> ---
>  drivers/phy/Kconfig           |  11 ++++
>  drivers/phy/Makefile          |   1 +
>  drivers/phy/phy-nxp-ptn3222.c | 123 ++++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 135 insertions(+)
> 
> diff --git a/drivers/phy/Kconfig b/drivers/phy/Kconfig
> index dfab1c66b3e5..cb06a7f79740 100644
> --- a/drivers/phy/Kconfig
> +++ b/drivers/phy/Kconfig
> @@ -82,6 +82,17 @@ config PHY_AIROHA_PCIE
>  	  This driver create the basic PHY instance and provides initialize
>  	  callback for PCIe GEN3 port.
>  
> +config PHY_NXP_PTN3222
> +	tristate "NXP PTN3222 1-port eUSB2 to USB2 redriver"
> +	depends on I2C
> +	depends on OF
> +	select GENERIC_PHY
> +	help
> +	  Enable this to support NXP PTN3222 1-port eUSB2 to USB2 Redriver.
> +	  This redriver performs translation between eUSB2 and USB2 signalling
> +	  schemes. It supports all three USB 2.0 data rates: Low Speed, Full
> +	  Speed and High Speed.
> +
>  source "drivers/phy/allwinner/Kconfig"
>  source "drivers/phy/amlogic/Kconfig"
>  source "drivers/phy/broadcom/Kconfig"
> diff --git a/drivers/phy/Makefile b/drivers/phy/Makefile
> index 5fcbce5f9ab1..b64247046575 100644
> --- a/drivers/phy/Makefile
> +++ b/drivers/phy/Makefile
> @@ -11,6 +11,7 @@ obj-$(CONFIG_PHY_XGENE)			+= phy-xgene.o
>  obj-$(CONFIG_PHY_PISTACHIO_USB)		+= phy-pistachio-usb.o
>  obj-$(CONFIG_USB_LGM_PHY)		+= phy-lgm-usb.o
>  obj-$(CONFIG_PHY_AIROHA_PCIE)		+= phy-airoha-pcie.o
> +obj-$(CONFIG_PHY_NXP_PTN3222)		+= phy-nxp-ptn3222.o
>  obj-y					+= allwinner/	\
>  					   amlogic/	\
>  					   broadcom/	\
> diff --git a/drivers/phy/phy-nxp-ptn3222.c b/drivers/phy/phy-nxp-ptn3222.c
> new file mode 100644
> index 000000000000..c6179d8701e6
> --- /dev/null
> +++ b/drivers/phy/phy-nxp-ptn3222.c
> @@ -0,0 +1,123 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (c) 2024, Linaro Limited
> + */
> +
> +#include <linux/gpio/consumer.h>
> +#include <linux/i2c.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/phy/phy.h>
> +#include <linux/regmap.h>
> +#include <linux/regulator/consumer.h>
> +
> +#define NUM_SUPPLIES 2
> +
> +struct ptn3222 {
> +	struct i2c_client *client;
> +	struct phy *phy;
> +	struct gpio_desc *reset_gpio;
> +	struct regulator_bulk_data *supplies;
> +};
> +
> +static int ptn3222_init(struct phy *phy)
> +{
> +	struct ptn3222 *ptn3222 = phy_get_drvdata(phy);
> +	int ret;
> +
> +	ret = regulator_bulk_enable(NUM_SUPPLIES, ptn3222->supplies);
> +	if (ret)
> +		return ret;
> +
> +	gpiod_set_value_cansleep(ptn3222->reset_gpio, 0);
> +
> +	return 0;
> +}
> +
> +static int ptn3222_exit(struct phy *phy)
> +{
> +	struct ptn3222 *ptn3222 = phy_get_drvdata(phy);
> +
> +	gpiod_set_value_cansleep(ptn3222->reset_gpio, 1);
> +
> +	return regulator_bulk_disable(NUM_SUPPLIES, ptn3222->supplies);
> +}
> +
> +static const struct phy_ops ptn3222_ops = {
> +	.init		= ptn3222_init,
> +	.exit		= ptn3222_exit,
> +	.owner		= THIS_MODULE,
> +};
> +
> +static const struct regulator_bulk_data ptn3222_supplies[NUM_SUPPLIES] = {
> +	{
> +		.supply = "vdd3v3",
> +		.init_load_uA = 11000,
> +	}, {
> +		.supply = "vdd1v8",
> +		.init_load_uA = 55000,
> +	}
> +};
> +
> +static int ptn3222_probe(struct i2c_client *client)
> +{
> +	struct device *dev = &client->dev;
> +	struct phy_provider *phy_provider;
> +	struct ptn3222 *ptn3222;
> +	int ret;
> +
> +	ptn3222 = devm_kzalloc(dev, sizeof(*ptn3222), GFP_KERNEL);
> +	if (!ptn3222)
> +		return -ENOMEM;
> +
> +	ptn3222->client = client;
> +
> +	ptn3222->reset_gpio = devm_gpiod_get_optional(dev, "reset",
> +						      GPIOD_OUT_HIGH);
> +	if (IS_ERR(ptn3222->reset_gpio))
> +		return dev_err_probe(dev, PTR_ERR(ptn3222->reset_gpio),
> +				     "unable to acquire reset gpio\n");
> +
> +	ret = devm_regulator_bulk_get_const(dev, NUM_SUPPLIES, ptn3222_supplies,
> +					    &ptn3222->supplies);
> +	if (ret)
> +		return ret;
> +
> +	ptn3222->phy = devm_phy_create(dev, dev->of_node, &ptn3222_ops);
> +	if (IS_ERR(ptn3222->phy)) {
> +		dev_err(dev, "failed to create PHY: %d\n", ret);
> +		return PTR_ERR(ptn3222->phy);
> +	}
> +
> +	phy_set_drvdata(ptn3222->phy, ptn3222);
> +
> +	phy_provider = devm_of_phy_provider_register(dev, of_phy_simple_xlate);
> +
> +	return PTR_ERR_OR_ZERO(phy_provider);
> +}
> +
> +static const struct i2c_device_id ptn3222_table[] = {
> +	{ "ptn3222" },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(i2c, ptn3222_table);
> +
> +static const struct of_device_id ptn3222_of_table[] = {
> +	{ .compatible = "nxp,ptn3222" },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(of, ptn3222_of_table);
> +
> +static struct i2c_driver ptn3222_driver = {
> +	.driver = {
> +		.name = "ptn3222",
> +		.of_match_table = ptn3222_of_table,
> +	},
> +	.probe = ptn3222_probe,
> +	.id_table = ptn3222_table,
> +};
> +
> +module_i2c_driver(ptn3222_driver);
> +
> +MODULE_DESCRIPTION("NXP PTN3222 eUSB2 Redriver driver");
> +MODULE_LICENSE("GPL");
> 
> -- 
> 2.39.2
> 

