Return-Path: <linux-arm-msm+bounces-7191-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 13C5A82CCD7
	for <lists+linux-arm-msm@lfdr.de>; Sat, 13 Jan 2024 14:40:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 713D6B22B86
	for <lists+linux-arm-msm@lfdr.de>; Sat, 13 Jan 2024 13:40:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 092E821113;
	Sat, 13 Jan 2024 13:40:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qQKwpzYZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37F9C21112
	for <linux-arm-msm@vger.kernel.org>; Sat, 13 Jan 2024 13:40:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-40e68ca8b45so13935235e9.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 13 Jan 2024 05:40:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705153215; x=1705758015; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=n6Fxgya1TVkm3TPxhwzKTyr286c02yPIKDB2qfXb84I=;
        b=qQKwpzYZS7j/8ImHR9yT8ot/Yo9GLXjVrQp7ygduZWZxo1q6abzoXxcWqv8lwgRu95
         P92TpBtMBp6DohK1Cyju8GUSJbYrFEEXhFA3TTddHwBBIQ15sYHFjEUtnii/xinnQ0nG
         gRlcGYSTV+mat5LExXyDTmfz/nd7FjxwcuSXFGnWY3npq9oMT6HjfbdJ/muIn053fQYT
         CUi8CyVjKfjCG083H5dgnaMp6vzVC7D+Of7P8qIYFx7BJ8vNAl3KAYep/4xF9It4SCKv
         gWPrjvEl+vbeztm3oIV/o1td49BFnzlo5Vv2pMKAFNldRzsURWkJdWF7eQVT/klBHkA8
         LRww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705153215; x=1705758015;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=n6Fxgya1TVkm3TPxhwzKTyr286c02yPIKDB2qfXb84I=;
        b=vzEwmkbHTavCeFx/q/MESBPGf+J8Lodu9bf1A8beEuuGB4EBiRZHv2sglLjCnQMtOA
         N5sg7D5TRGY0dKGI8v/ctWK+2ijBLw+3g9WfIcCImvbG+mNHyWWE9+5b0dtJO7bCLaf1
         rs57JtVtd/znx4B3BmyT7GZEgKAERfbIhU0Tl91iOsd7JXuzcoAJkJce5rRa4tM/Xi+A
         +9g0RLtynLVabZ321qnwqIOV40UlN5OU6nZwlHL04ww1vC6Db5HwCUM12ahr5JuzgWzT
         fyl2w3KM03CZe+vzjx+7cItoA7hi5n2d0mxllTbieEH48eCgzmqut8AgNtrYbRxZaoHh
         rf6A==
X-Gm-Message-State: AOJu0YyYrSUqpL5DNQBPdZ3KKPtrWxTTUVzUkFv7+mDNzNiq7sFzYlkq
	MMyGXW7+4aIxW5V3et6CU16Cz84Nbw1Z/A==
X-Google-Smtp-Source: AGHT+IEesURe4l4hBQdzTgbhi4W65rM3L5F8yms56jbFFVQugYXIThxWnItj+cXhWFX6RqpnO4BRrg==
X-Received: by 2002:a05:600c:4595:b0:40d:8f40:ba2b with SMTP id r21-20020a05600c459500b0040d8f40ba2bmr1809556wmo.167.1705153215294;
        Sat, 13 Jan 2024 05:40:15 -0800 (PST)
Received: from [192.168.100.86] ([37.228.218.3])
        by smtp.gmail.com with ESMTPSA id je6-20020a05600c1f8600b0040d8d11bf63sm9459531wmb.41.2024.01.13.05.40.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 13 Jan 2024 05:40:14 -0800 (PST)
Message-ID: <83fd1153-f79f-4d8b-8752-1daa0b9b17f2@linaro.org>
Date: Sat, 13 Jan 2024 13:40:13 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/13] usb: typec: qcom-pmic-typec: add support for PMI632
 PMIC
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Wesley Cheng <quic_wcheng@quicinc.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Guenter Roeck <linux@roeck-us.net>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Bhupesh Sharma <bhupesh.sharma@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-phy@lists.infradead.org
References: <20240113-pmi632-typec-v1-0-de7dfd459353@linaro.org>
 <20240113-pmi632-typec-v1-6-de7dfd459353@linaro.org>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20240113-pmi632-typec-v1-6-de7dfd459353@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 13/01/2024 05:42, Dmitry Baryshkov wrote:
> The PMI632 PMIC support Type-C port handling, but lacks USB
> PowerDelivery support. The TCPM requires all callbacks to be provided
> by the implementation. Implement a special, 'stub' Qcom PD PHY
> implementation to enable the PMI632 support.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/usb/typec/tcpm/qcom/Makefile               |  3 +-
>   drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c      | 30 +++++++---
>   .../usb/typec/tcpm/qcom/qcom_pmic_typec_pdphy.h    |  2 +
>   .../typec/tcpm/qcom/qcom_pmic_typec_pdphy_stub.c   | 67 ++++++++++++++++++++++
>   4 files changed, 94 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/usb/typec/tcpm/qcom/Makefile b/drivers/usb/typec/tcpm/qcom/Makefile
> index dc1e8832e197..cc23042b9487 100644
> --- a/drivers/usb/typec/tcpm/qcom/Makefile
> +++ b/drivers/usb/typec/tcpm/qcom/Makefile
> @@ -3,4 +3,5 @@
>   obj-$(CONFIG_TYPEC_QCOM_PMIC)		+= qcom_pmic_tcpm.o
>   qcom_pmic_tcpm-y			+= qcom_pmic_typec.o \
>   					   qcom_pmic_typec_port.o \
> -					   qcom_pmic_typec_pdphy.o
> +					   qcom_pmic_typec_pdphy.o \
> +					   qcom_pmic_typec_pdphy_stub.o \
> diff --git a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c
> index 4f2dbf20da12..e2513549c58a 100644
> --- a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c
> +++ b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c
> @@ -118,7 +118,7 @@ static int qcom_pmic_typec_probe(struct platform_device *pdev)
>   	const struct pmic_typec_resources *res;
>   	struct regmap *regmap;
>   	struct device *bridge_dev;
> -	u32 base[2];
> +	u32 base;
>   	int ret;
>   
>   	res = of_device_get_match_data(dev);
> @@ -145,7 +145,7 @@ static int qcom_pmic_typec_probe(struct platform_device *pdev)
>   		return -ENODEV;
>   	}
>   
> -	ret = of_property_read_u32_array(np, "reg", base, 2);
> +	ret = of_property_read_u32_index(np, "reg", 0, &base);

So I had to do a double-take here but, this seems fine to me.

>   	if (ret)
>   		return ret;
>   
> @@ -154,14 +154,24 @@ static int qcom_pmic_typec_probe(struct platform_device *pdev)
>   		return PTR_ERR(tcpm->pmic_typec_port);
>   
>   	ret = qcom_pmic_typec_port_probe(pdev, tcpm->pmic_typec_port,
> -					 res->port_res, regmap, base[0]);
> +					 res->port_res, regmap, base);
>   	if (ret)
>   		return ret;
>   
> -	ret = res->pdphy_probe(pdev, tcpm,
> -			       res->pdphy_res, regmap, base[1]);
> -	if (ret)
> -		return ret;
> +	if (res->pdphy_res) {
> +		ret = of_property_read_u32_index(np, "reg", 1, &base);
> +		if (ret)
> +			return ret;
> +
> +		ret = qcom_pmic_typec_pdphy_probe(pdev, tcpm,
> +						  res->pdphy_res, regmap, base);
> +		if (ret)
> +			return ret;
> +	} else {
> +		ret = qcom_pmic_typec_pdphy_stub_probe(pdev, tcpm);
> +		if (ret)
> +			return ret;
> +	}

Looks fine.

>   
>   	mutex_init(&tcpm->lock);
>   	platform_set_drvdata(pdev, tcpm);
> @@ -253,8 +263,14 @@ static struct pmic_typec_resources pm8150b_typec_res = {
>   	.port_res = &pm8150b_port_res,
>   };
>   
> +static struct pmic_typec_resources pmi632_typec_res = {
> +	/* PD PHY not present */
> +	.port_res = &pm8150b_port_res,
> +};
> +
>   static const struct of_device_id qcom_pmic_typec_table[] = {
>   	{ .compatible = "qcom,pm8150b-typec", .data = &pm8150b_typec_res },
> +	{ .compatible = "qcom,pmi632-typec", .data = &pmi632_typec_res },
>   	{ }
>   };
>   MODULE_DEVICE_TABLE(of, qcom_pmic_typec_table);
> diff --git a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_pdphy.h b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_pdphy.h
> index b94eccadb042..2a7dedeb3009 100644
> --- a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_pdphy.h
> +++ b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_pdphy.h
> @@ -31,5 +31,7 @@ int qcom_pmic_typec_pdphy_probe(struct platform_device *pdev,
>   				const struct pmic_typec_pdphy_resources *res,
>   				struct regmap *regmap,
>   				u32 base);
> +int qcom_pmic_typec_pdphy_stub_probe(struct platform_device *pdev,
> +				     struct pmic_typec *tcpm);
>   
>   #endif /* __QCOM_PMIC_TYPEC_PDPHY_H__ */
> diff --git a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_pdphy_stub.c b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_pdphy_stub.c
> new file mode 100644
> index 000000000000..5d3b0e78d4d8
> --- /dev/null
> +++ b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_pdphy_stub.c
> @@ -0,0 +1,67 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (c) 2024, Linaro Ltd. All rights reserved.
> + */
> +
> +#include <linux/err.h>
> +#include <linux/interrupt.h>
> +#include <linux/kernel.h>
> +#include <linux/mod_devicetable.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <linux/regmap.h>
> +#include <linux/regulator/consumer.h>
> +#include <linux/slab.h>
> +#include <linux/usb/pd.h>
> +#include <linux/usb/tcpm.h>
> +#include "qcom_pmic_typec.h"
> +#include "qcom_pmic_typec_pdphy.h"
> +
> +static int qcom_pmic_typec_pdphy_stub_pd_transmit(struct tcpc_dev *tcpc,
> +						  enum tcpm_transmit_type type,
> +						  const struct pd_message *msg,
> +						  unsigned int negotiated_rev)
> +{
> +	struct pmic_typec *tcpm = tcpc_to_tcpm(tcpc);
> +	struct device *dev = tcpm->dev;
> +
> +	dev_dbg(dev, "pdphy_transmit: type=%d\n", type);
> +
> +	tcpm_pd_transmit_complete(tcpm->tcpm_port,
> +				  TCPC_TX_SUCCESS);
> +
> +	return 0;
> +}
> +
> +static int qcom_pmic_typec_pdphy_stub_set_pd_rx(struct tcpc_dev *tcpc, bool on)
> +{
> +	struct pmic_typec *tcpm = tcpc_to_tcpm(tcpc);
> +	struct device *dev = tcpm->dev;
> +
> +	dev_dbg(dev, "set_pd_rx: %s\n", on ? "on" : "off");
> +
> +	return 0;
> +}
> +
> +static int qcom_pmic_typec_pdphy_stub_set_roles(struct tcpc_dev *tcpc, bool attached,
> +						enum typec_role power_role,
> +						enum typec_data_role data_role)
> +{
> +	struct pmic_typec *tcpm = tcpc_to_tcpm(tcpc);
> +	struct device *dev = tcpm->dev;
> +
> +	dev_dbg(dev, "pdphy_set_roles: data_role_host=%d power_role_src=%d\n",
> +		data_role, power_role);
> +
> +	return 0;
> +}
> +
> +int qcom_pmic_typec_pdphy_stub_probe(struct platform_device *pdev,
> +				     struct pmic_typec *tcpm)
> +{
> +	tcpm->tcpc.set_pd_rx = qcom_pmic_typec_pdphy_stub_set_pd_rx;
> +	tcpm->tcpc.set_roles = qcom_pmic_typec_pdphy_stub_set_roles;
> +	tcpm->tcpc.pd_transmit = qcom_pmic_typec_pdphy_stub_pd_transmit;
> +
> +	return 0;
> +}
> 

So this answers the question I had on IRC whether or not the Linux TCPM 
layer could tolerate a stubbed PD layers.

I think this _should_ be fine, I certainly have no problem with the 
approach overall and the intevention in the code seems small.

Good work.

Acked-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

