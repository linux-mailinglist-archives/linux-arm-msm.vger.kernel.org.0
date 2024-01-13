Return-Path: <linux-arm-msm+bounces-7192-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D11D982CCDA
	for <lists+linux-arm-msm@lfdr.de>; Sat, 13 Jan 2024 14:44:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4111A1F2263D
	for <lists+linux-arm-msm@lfdr.de>; Sat, 13 Jan 2024 13:44:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 370D521342;
	Sat, 13 Jan 2024 13:44:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dYnrTvpN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37350210FF
	for <linux-arm-msm@vger.kernel.org>; Sat, 13 Jan 2024 13:44:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3374c693f92so5393791f8f.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 13 Jan 2024 05:43:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705153438; x=1705758238; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tiAoFr7XlWce2PQkYmDT0pgr7l4RfrQosorG+gviNb4=;
        b=dYnrTvpN0gK48LSWECzWJE6uh/EWvSasHdSat6q2u20p16eNnpgotXK3te6Edse2XP
         IaHZKTCta8keOmkhnAQWl6JPtVd6CHtVcbzYOefajoklajywzoKmpBuWoeJwFW2mnCf9
         Jk1C4EYcyXeZ5J5eFcrVoGsxnq9GzIgvt3M1FnnLbNiGbi4oPLPsfgY5UtxHZGvh5KRA
         hp6HD1g1GBWe1g+l7DJzFU05Wm0dMmos9MkbAMoeYz32YEQIv5X0/u6hWOK4VEXsjbPo
         vho6uexudE3bCyxKw/YTq/KXPjketagoAqhr3B+C3urqOkyz9uQoQoasVNI2DQzrx+P4
         iWKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705153438; x=1705758238;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tiAoFr7XlWce2PQkYmDT0pgr7l4RfrQosorG+gviNb4=;
        b=MbxNSoOHYDSifbspUj8vIVLtmjafjeNkXQiEudVd/s2om+to8LTerTRTaQELkaUEpB
         X4rMMMB3h/zbip55IEhH1RayZz8VEKqxvFnGpOksvuDBsjbxJ3o59aQ0KzC8/xAvvjxs
         qNbfUUc36t6uFZ8+xp2BR+i1yWJczp5fmm5y4Djujjyz0HYTfEbBLpj4dNorBE+2yITi
         E6ep19ovNSkXdWx5vjA9CobbYTxx8pYT8Zq6eKN/WdLYHCIK5zpqMf4PYX8SqMk1sBta
         nQav+K+lhMenIFaYTnYE6YmEceb9zVdVERzeLXOamDGqM8L2yVQYiEwGYywaKTCSfpHD
         2UKg==
X-Gm-Message-State: AOJu0YxrVH7M9t+2VizhfPprunskF4mnNGQ8tOPkfSmIrUc5Q3iUNRXN
	rj9Q97jdFJ4FhRrXQtDYcI8AFYHrygKDjA==
X-Google-Smtp-Source: AGHT+IFEDm3X8KqNSLARm1A6IwNz4oKPts7IOZVOrYNJu70Kon5GLAjeVPfKBSDALLms6ax5ZsWo4Q==
X-Received: by 2002:a05:600c:138a:b0:40e:5b48:eee7 with SMTP id u10-20020a05600c138a00b0040e5b48eee7mr1820157wmf.89.1705153438245;
        Sat, 13 Jan 2024 05:43:58 -0800 (PST)
Received: from [192.168.100.86] ([37.228.218.3])
        by smtp.gmail.com with ESMTPSA id t21-20020a05600c451500b0040e3ac9f4c8sm13156049wmo.28.2024.01.13.05.43.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 13 Jan 2024 05:43:57 -0800 (PST)
Message-ID: <2594d4cd-706e-4f01-abde-edba9d5fb8ad@linaro.org>
Date: Sat, 13 Jan 2024 13:43:56 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/13] usb: typec: qcom-pmic-typec: allow different
 implementations for the PD PHY
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
 <20240113-pmi632-typec-v1-5-de7dfd459353@linaro.org>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20240113-pmi632-typec-v1-5-de7dfd459353@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 13/01/2024 05:42, Dmitry Baryshkov wrote:
> Rework Qualcomm PMIC TCPM driver to allow different platform-specific
> implementations of the PD PHY interface. While majority of platforms
> has the same of register for the PD PHY, some obscure ones (PMI632) do
> not have real PD PHY support. Add proper interface between the main
> module and the PD PHY backend to allow switching the PD PHY
> implementation.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c      | 100 ++-----------
>   drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.h      |  25 ++++
>   .../usb/typec/tcpm/qcom/qcom_pmic_typec_pdphy.c    | 155 ++++++++++++++++++---
>   .../usb/typec/tcpm/qcom/qcom_pmic_typec_pdphy.h    |  90 +-----------
>   drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.h |   4 +-
>   5 files changed, 178 insertions(+), 196 deletions(-)
> 
> diff --git a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c
> index 1a2b4bddaa97..4f2dbf20da12 100644
> --- a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c
> +++ b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c
> @@ -20,26 +20,15 @@
>   
>   #include <drm/bridge/aux-bridge.h>
>   
> +#include "qcom_pmic_typec.h"
>   #include "qcom_pmic_typec_pdphy.h"
>   #include "qcom_pmic_typec_port.h"
>   
>   struct pmic_typec_resources {
> -	struct pmic_typec_pdphy_resources	*pdphy_res;
> +	const struct pmic_typec_pdphy_resources	*pdphy_res;

If you are making one resource struct const then make both const.

>   	struct pmic_typec_port_resources	*port_res;
>   };
>   
> -struct pmic_typec {
> -	struct device		*dev;
> -	struct tcpm_port	*tcpm_port;
> -	struct tcpc_dev		tcpc;
> -	struct pmic_typec_pdphy	*pmic_typec_pdphy;
> -	struct pmic_typec_port	*pmic_typec_port;
> -	bool			vbus_enabled;
> -	struct mutex		lock;		/* VBUS state serialization */
> -};
> -
> -#define tcpc_to_tcpm(_tcpc_) container_of(_tcpc_, struct pmic_typec, tcpc)
> -
>   static int qcom_pmic_typec_get_vbus(struct tcpc_dev *tcpc)
>   {
>   	struct pmic_typec *tcpm = tcpc_to_tcpm(tcpc);
> @@ -116,34 +105,6 @@ static int qcom_pmic_typec_start_toggling(struct tcpc_dev *tcpc,
>   						   port_type, cc);
>   }
>   
> -static int qcom_pmic_typec_set_roles(struct tcpc_dev *tcpc, bool attached,
> -				     enum typec_role power_role,
> -				     enum typec_data_role data_role)
> -{
> -	struct pmic_typec *tcpm = tcpc_to_tcpm(tcpc);
> -
> -	return qcom_pmic_typec_pdphy_set_roles(tcpm->pmic_typec_pdphy,
> -					       data_role, power_role);
> -}
> -
> -static int qcom_pmic_typec_set_pd_rx(struct tcpc_dev *tcpc, bool on)
> -{
> -	struct pmic_typec *tcpm = tcpc_to_tcpm(tcpc);
> -
> -	return qcom_pmic_typec_pdphy_set_pd_rx(tcpm->pmic_typec_pdphy, on);
> -}
> -
> -static int qcom_pmic_typec_pd_transmit(struct tcpc_dev *tcpc,
> -				       enum tcpm_transmit_type type,
> -				       const struct pd_message *msg,
> -				       unsigned int negotiated_rev)
> -{
> -	struct pmic_typec *tcpm = tcpc_to_tcpm(tcpc);
> -
> -	return qcom_pmic_typec_pdphy_pd_transmit(tcpm->pmic_typec_pdphy, type,
> -						 msg, negotiated_rev);
> -}
> -
>   static int qcom_pmic_typec_init(struct tcpc_dev *tcpc)
>   {
>   	return 0;
> @@ -177,9 +138,6 @@ static int qcom_pmic_typec_probe(struct platform_device *pdev)
>   	tcpm->tcpc.set_polarity = qcom_pmic_typec_set_polarity;
>   	tcpm->tcpc.set_vconn = qcom_pmic_typec_set_vconn;
>   	tcpm->tcpc.start_toggling = qcom_pmic_typec_start_toggling;
> -	tcpm->tcpc.set_pd_rx = qcom_pmic_typec_set_pd_rx;
> -	tcpm->tcpc.set_roles = qcom_pmic_typec_set_roles;
> -	tcpm->tcpc.pd_transmit = qcom_pmic_typec_pd_transmit;
>   
>   	regmap = dev_get_regmap(dev->parent, NULL);
>   	if (!regmap) {
> @@ -195,17 +153,13 @@ static int qcom_pmic_typec_probe(struct platform_device *pdev)
>   	if (IS_ERR(tcpm->pmic_typec_port))
>   		return PTR_ERR(tcpm->pmic_typec_port);
>   
> -	tcpm->pmic_typec_pdphy = qcom_pmic_typec_pdphy_alloc(dev);
> -	if (IS_ERR(tcpm->pmic_typec_pdphy))
> -		return PTR_ERR(tcpm->pmic_typec_pdphy);
> -
>   	ret = qcom_pmic_typec_port_probe(pdev, tcpm->pmic_typec_port,
>   					 res->port_res, regmap, base[0]);
>   	if (ret)
>   		return ret;
>   
> -	ret = qcom_pmic_typec_pdphy_probe(pdev, tcpm->pmic_typec_pdphy,
> -					  res->pdphy_res, regmap, base[1]);
> +	ret = res->pdphy_probe(pdev, tcpm,
> +			       res->pdphy_res, regmap, base[1]);
>   	if (ret)
>   		return ret;
>   
> @@ -231,10 +185,11 @@ static int qcom_pmic_typec_probe(struct platform_device *pdev)
>   	if (ret)
>   		goto fwnode_remove;
>   
> -	ret = qcom_pmic_typec_pdphy_start(tcpm->pmic_typec_pdphy,
> -					  tcpm->tcpm_port);
> -	if (ret)
> -		goto fwnode_remove;
> +	if (tcpm->pdphy_start) {
> +		ret = tcpm->pdphy_start(tcpm, tcpm->tcpm_port);
> +		if (ret)
> +			goto fwnode_remove;
> +	}

Its a bit of a minor nit but, instead of checking for tcpm->pdphy_start 
and tcpm->ppdphy_stop you could also populate the callbacks to return 
zero from stubs you add and make this code look just a bit neater.

I'd say that optional though but, for preference unless there's a good 
technical argument against it.

>   
>   	return 0;
>   
> @@ -248,46 +203,13 @@ static void qcom_pmic_typec_remove(struct platform_device *pdev)
>   {
>   	struct pmic_typec *tcpm = platform_get_drvdata(pdev);
>   
> -	qcom_pmic_typec_pdphy_stop(tcpm->pmic_typec_pdphy);
> +	if (tcpm->pdphy_stop)
> +		tcpm->pdphy_stop(tcpm);
>   	qcom_pmic_typec_port_stop(tcpm->pmic_typec_port);
>   	tcpm_unregister_port(tcpm->tcpm_port);
>   	fwnode_remove_software_node(tcpm->tcpc.fwnode);
>   }
>   
> -static struct pmic_typec_pdphy_resources pm8150b_pdphy_res = {
> -	.irq_params = {
> -		{
> -			.virq = PMIC_PDPHY_SIG_TX_IRQ,
> -			.irq_name = "sig-tx",
> -		},
> -		{
> -			.virq = PMIC_PDPHY_SIG_RX_IRQ,
> -			.irq_name = "sig-rx",
> -		},
> -		{
> -			.virq = PMIC_PDPHY_MSG_TX_IRQ,
> -			.irq_name = "msg-tx",
> -		},
> -		{
> -			.virq = PMIC_PDPHY_MSG_RX_IRQ,
> -			.irq_name = "msg-rx",
> -		},
> -		{
> -			.virq = PMIC_PDPHY_MSG_TX_FAIL_IRQ,
> -			.irq_name = "msg-tx-failed",
> -		},
> -		{
> -			.virq = PMIC_PDPHY_MSG_TX_DISCARD_IRQ,
> -			.irq_name = "msg-tx-discarded",
> -		},
> -		{
> -			.virq = PMIC_PDPHY_MSG_RX_DISCARD_IRQ,
> -			.irq_name = "msg-rx-discarded",
> -		},
> -	},
> -	.nr_irqs = 7,
> -};
> -
>   static struct pmic_typec_port_resources pm8150b_port_res = {
>   	.irq_params = {
>   		{
> diff --git a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.h b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.h
> new file mode 100644
> index 000000000000..da035916c12a
> --- /dev/null
> +++ b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.h
> @@ -0,0 +1,25 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (c) 2023, Linaro Ltd. All rights reserved.
> + */
> +
> +#ifndef __QCOM_PMIC_TYPEC_H__
> +#define __QCOM_PMIC_TYPEC_H__
> +
> +struct pmic_typec {
> +	struct device		*dev;
> +	struct tcpm_port	*tcpm_port;
> +	struct tcpc_dev		tcpc;
> +	struct pmic_typec_pdphy	*pmic_typec_pdphy;
> +	struct pmic_typec_port	*pmic_typec_port;
> +	bool			vbus_enabled;
> +	struct mutex		lock;		/* VBUS state serialization */
> +
> +	int (*pdphy_start)(struct pmic_typec *tcpm,
> +			   struct tcpm_port *tcpm_port);
> +	void (*pdphy_stop)(struct pmic_typec *tcpm);
> +};
> +
> +#define tcpc_to_tcpm(_tcpc_) container_of(_tcpc_, struct pmic_typec, tcpc)
> +
> +#endif
> diff --git a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_pdphy.c b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_pdphy.c
> index 52c81378e36e..40511ce86a34 100644
> --- a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_pdphy.c
> +++ b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_pdphy.c
> @@ -14,8 +14,74 @@
>   #include <linux/slab.h>
>   #include <linux/usb/pd.h>
>   #include <linux/usb/tcpm.h>
> +#include "qcom_pmic_typec.h"
>   #include "qcom_pmic_typec_pdphy.h"
>   
> +/* PD PHY register offsets and bit fields */
> +#define USB_PDPHY_MSG_CONFIG_REG	0x40
> +#define MSG_CONFIG_PORT_DATA_ROLE	BIT(3)
> +#define MSG_CONFIG_PORT_POWER_ROLE	BIT(2)
> +#define MSG_CONFIG_SPEC_REV_MASK	(BIT(1) | BIT(0))
> +
> +#define USB_PDPHY_EN_CONTROL_REG	0x46
> +#define CONTROL_ENABLE			BIT(0)
> +
> +#define USB_PDPHY_RX_STATUS_REG		0x4A
> +#define RX_FRAME_TYPE			(BIT(0) | BIT(1) | BIT(2))
> +
> +#define USB_PDPHY_FRAME_FILTER_REG	0x4C
> +#define FRAME_FILTER_EN_HARD_RESET	BIT(5)
> +#define FRAME_FILTER_EN_SOP		BIT(0)
> +
> +#define USB_PDPHY_TX_SIZE_REG		0x42
> +#define TX_SIZE_MASK			0xF
> +
> +#define USB_PDPHY_TX_CONTROL_REG	0x44
> +#define TX_CONTROL_RETRY_COUNT(n)	(((n) & 0x3) << 5)
> +#define TX_CONTROL_FRAME_TYPE(n)        (((n) & 0x7) << 2)
> +#define TX_CONTROL_FRAME_TYPE_CABLE_RESET	(0x1 << 2)
> +#define TX_CONTROL_SEND_SIGNAL		BIT(1)
> +#define TX_CONTROL_SEND_MSG		BIT(0)
> +
> +#define USB_PDPHY_RX_SIZE_REG		0x48
> +
> +#define USB_PDPHY_RX_ACKNOWLEDGE_REG	0x4B
> +#define RX_BUFFER_TOKEN			BIT(0)
> +
> +#define USB_PDPHY_BIST_MODE_REG		0x4E
> +#define BIST_MODE_MASK			0xF
> +#define BIST_ENABLE			BIT(7)
> +#define PD_MSG_BIST			0x3
> +#define PD_BIST_TEST_DATA_MODE		0x8
> +
> +#define USB_PDPHY_TX_BUFFER_HDR_REG	0x60
> +#define USB_PDPHY_TX_BUFFER_DATA_REG	0x62
> +
> +#define USB_PDPHY_RX_BUFFER_REG		0x80
> +
> +/* VDD regulator */
> +#define VDD_PDPHY_VOL_MIN		2800000	/* uV */
> +#define VDD_PDPHY_VOL_MAX		3300000	/* uV */
> +#define VDD_PDPHY_HPM_LOAD		3000	/* uA */
> +
> +/* Message Spec Rev field */
> +#define PD_MSG_HDR_REV(hdr)		(((hdr) >> 6) & 3)
> +
> +/* timers */
> +#define RECEIVER_RESPONSE_TIME		15	/* tReceiverResponse */
> +#define HARD_RESET_COMPLETE_TIME	5	/* tHardResetComplete */
> +
> +/* Interrupt numbers */
> +#define PMIC_PDPHY_SIG_TX_IRQ		0x0
> +#define PMIC_PDPHY_SIG_RX_IRQ		0x1
> +#define PMIC_PDPHY_MSG_TX_IRQ		0x2
> +#define PMIC_PDPHY_MSG_RX_IRQ		0x3
> +#define PMIC_PDPHY_MSG_TX_FAIL_IRQ	0x4
> +#define PMIC_PDPHY_MSG_TX_DISCARD_IRQ	0x5
> +#define PMIC_PDPHY_MSG_RX_DISCARD_IRQ	0x6
> +#define PMIC_PDPHY_FR_SWAP_IRQ		0x7
> +
> +
>   struct pmic_typec_pdphy_irq_data {
>   	int				virq;
>   	int				irq;
> @@ -231,11 +297,13 @@ qcom_pmic_typec_pdphy_pd_transmit_payload(struct pmic_typec_pdphy *pmic_typec_pd
>   	return ret;
>   }
>   
> -int qcom_pmic_typec_pdphy_pd_transmit(struct pmic_typec_pdphy *pmic_typec_pdphy,
> -				      enum tcpm_transmit_type type,
> -				      const struct pd_message *msg,
> -				      unsigned int negotiated_rev)
> +static int qcom_pmic_typec_pdphy_pd_transmit(struct tcpc_dev *tcpc,
> +					     enum tcpm_transmit_type type,
> +					     const struct pd_message *msg,
> +					     unsigned int negotiated_rev)
>   {
> +	struct pmic_typec *tcpm = tcpc_to_tcpm(tcpc);
> +	struct pmic_typec_pdphy *pmic_typec_pdphy = tcpm->pmic_typec_pdphy;
>   	struct device *dev = pmic_typec_pdphy->dev;
>   	int ret;
>   
> @@ -336,8 +404,10 @@ static irqreturn_t qcom_pmic_typec_pdphy_isr(int irq, void *dev_id)
>   	return IRQ_HANDLED;
>   }
>   
> -int qcom_pmic_typec_pdphy_set_pd_rx(struct pmic_typec_pdphy *pmic_typec_pdphy, bool on)
> +static int qcom_pmic_typec_pdphy_set_pd_rx(struct tcpc_dev *tcpc, bool on)
>   {
> +	struct pmic_typec *tcpm = tcpc_to_tcpm(tcpc);
> +	struct pmic_typec_pdphy *pmic_typec_pdphy = tcpm->pmic_typec_pdphy;
>   	unsigned long flags;
>   	int ret;
>   
> @@ -353,9 +423,12 @@ int qcom_pmic_typec_pdphy_set_pd_rx(struct pmic_typec_pdphy *pmic_typec_pdphy, b
>   	return ret;
>   }
>   
> -int qcom_pmic_typec_pdphy_set_roles(struct pmic_typec_pdphy *pmic_typec_pdphy,
> -				    bool data_role_host, bool power_role_src)
> +static int qcom_pmic_typec_pdphy_set_roles(struct tcpc_dev *tcpc, bool attached,
> +					   enum typec_role power_role,
> +					   enum typec_data_role data_role)
>   {
> +	struct pmic_typec *tcpm = tcpc_to_tcpm(tcpc);
> +	struct pmic_typec_pdphy *pmic_typec_pdphy = tcpm->pmic_typec_pdphy;
>   	struct device *dev = pmic_typec_pdphy->dev;
>   	unsigned long flags;
>   	int ret;
> @@ -366,12 +439,13 @@ int qcom_pmic_typec_pdphy_set_roles(struct pmic_typec_pdphy *pmic_typec_pdphy,
>   				 pmic_typec_pdphy->base + USB_PDPHY_MSG_CONFIG_REG,
>   				 MSG_CONFIG_PORT_DATA_ROLE |
>   				 MSG_CONFIG_PORT_POWER_ROLE,
> -				 data_role_host << 3 | power_role_src << 2);
> +				 (data_role == TYPEC_HOST ? MSG_CONFIG_PORT_DATA_ROLE : 0) |
> +				 (power_role == TYPEC_SOURCE ? MSG_CONFIG_PORT_POWER_ROLE : 0));
>   
>   	spin_unlock_irqrestore(&pmic_typec_pdphy->lock, flags);
>   
>   	dev_dbg(dev, "pdphy_set_roles: data_role_host=%d power_role_src=%d\n",
> -		data_role_host, power_role_src);
> +		data_role, power_role);
>   
>   	return ret;
>   }
> @@ -435,9 +509,10 @@ static int pmic_typec_pdphy_reset(struct pmic_typec_pdphy *pmic_typec_pdphy)
>   	return ret;
>   }
>   
> -int qcom_pmic_typec_pdphy_start(struct pmic_typec_pdphy *pmic_typec_pdphy,
> -				struct tcpm_port *tcpm_port)
> +static int qcom_pmic_typec_pdphy_start(struct pmic_typec *tcpm,
> +				       struct tcpm_port *tcpm_port)
>   {
> +	struct pmic_typec_pdphy *pmic_typec_pdphy = tcpm->pmic_typec_pdphy;
>   	int i;
>   	int ret;
>   
> @@ -457,8 +532,9 @@ int qcom_pmic_typec_pdphy_start(struct pmic_typec_pdphy *pmic_typec_pdphy,
>   	return 0;
>   }
>   
> -void qcom_pmic_typec_pdphy_stop(struct pmic_typec_pdphy *pmic_typec_pdphy)
> +static void qcom_pmic_typec_pdphy_stop(struct pmic_typec *tcpm)
>   {
> +	struct pmic_typec_pdphy *pmic_typec_pdphy = tcpm->pmic_typec_pdphy;
>   	int i;
>   
>   	for (i = 0; i < pmic_typec_pdphy->nr_irqs; i++)
> @@ -469,21 +545,55 @@ void qcom_pmic_typec_pdphy_stop(struct pmic_typec_pdphy *pmic_typec_pdphy)
>   	regulator_disable(pmic_typec_pdphy->vdd_pdphy);
>   }
>   
> -struct pmic_typec_pdphy *qcom_pmic_typec_pdphy_alloc(struct device *dev)
> -{
> -	return devm_kzalloc(dev, sizeof(struct pmic_typec_pdphy), GFP_KERNEL);
> -}
> +const struct pmic_typec_pdphy_resources pm8150b_pdphy_res = {
> +	.irq_params = {
> +		{
> +			.virq = PMIC_PDPHY_SIG_TX_IRQ,
> +			.irq_name = "sig-tx",
> +		},
> +		{
> +			.virq = PMIC_PDPHY_SIG_RX_IRQ,
> +			.irq_name = "sig-rx",
> +		},
> +		{
> +			.virq = PMIC_PDPHY_MSG_TX_IRQ,
> +			.irq_name = "msg-tx",
> +		},
> +		{
> +			.virq = PMIC_PDPHY_MSG_RX_IRQ,
> +			.irq_name = "msg-rx",
> +		},
> +		{
> +			.virq = PMIC_PDPHY_MSG_TX_FAIL_IRQ,
> +			.irq_name = "msg-tx-failed",
> +		},
> +		{
> +			.virq = PMIC_PDPHY_MSG_TX_DISCARD_IRQ,
> +			.irq_name = "msg-tx-discarded",
> +		},
> +		{
> +			.virq = PMIC_PDPHY_MSG_RX_DISCARD_IRQ,
> +			.irq_name = "msg-rx-discarded",
> +		},
> +	},
> +	.nr_irqs = 7,
> +};
>   
>   int qcom_pmic_typec_pdphy_probe(struct platform_device *pdev,
> -				struct pmic_typec_pdphy *pmic_typec_pdphy,
> -				struct pmic_typec_pdphy_resources *res,
> +				struct pmic_typec *tcpm,
> +				const struct pmic_typec_pdphy_resources *res,
>   				struct regmap *regmap,
>   				u32 base)
>   {
> +	struct pmic_typec_pdphy *pmic_typec_pdphy;
>   	struct device *dev = &pdev->dev;
>   	struct pmic_typec_pdphy_irq_data *irq_data;
>   	int i, ret, irq;
>   
> +	pmic_typec_pdphy = devm_kzalloc(dev, sizeof(struct pmic_typec_pdphy), GFP_KERNEL);
> +	if (!pmic_typec_pdphy)
> +		return -ENOMEM;
> +
>   	if (!res->nr_irqs || res->nr_irqs > PMIC_PDPHY_MAX_IRQS)
>   		return -EINVAL;
>   
> @@ -522,5 +632,14 @@ int qcom_pmic_typec_pdphy_probe(struct platform_device *pdev,
>   			return ret;
>   	}
>   
> +	tcpm->pmic_typec_pdphy = pmic_typec_pdphy;
> +
> +	tcpm->tcpc.set_pd_rx = qcom_pmic_typec_pdphy_set_pd_rx;
> +	tcpm->tcpc.set_roles = qcom_pmic_typec_pdphy_set_roles;
> +	tcpm->tcpc.pd_transmit = qcom_pmic_typec_pdphy_pd_transmit;
> +
> +	tcpm->pdphy_start = qcom_pmic_typec_pdphy_start;
> +	tcpm->pdphy_stop = qcom_pmic_typec_pdphy_stop;
> +
>   	return 0;
>   }
> diff --git a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_pdphy.h b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_pdphy.h
> index e67954e31b14..b94eccadb042 100644
> --- a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_pdphy.h
> +++ b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_pdphy.h
> @@ -8,74 +8,6 @@
>   
>   #include <linux/platform_device.h>
>   #include <linux/regmap.h>
> -#include <linux/usb/tcpm.h>
> -
> -#define USB_PDPHY_MAX_DATA_OBJ_LEN	28
> -#define USB_PDPHY_MSG_HDR_LEN		2
> -
> -/* PD PHY register offsets and bit fields */
> -#define USB_PDPHY_MSG_CONFIG_REG	0x40
> -#define MSG_CONFIG_PORT_DATA_ROLE	BIT(3)
> -#define MSG_CONFIG_PORT_POWER_ROLE	BIT(2)
> -#define MSG_CONFIG_SPEC_REV_MASK	(BIT(1) | BIT(0))
> -
> -#define USB_PDPHY_EN_CONTROL_REG	0x46
> -#define CONTROL_ENABLE			BIT(0)
> -
> -#define USB_PDPHY_RX_STATUS_REG		0x4A
> -#define RX_FRAME_TYPE			(BIT(0) | BIT(1) | BIT(2))
> -
> -#define USB_PDPHY_FRAME_FILTER_REG	0x4C
> -#define FRAME_FILTER_EN_HARD_RESET	BIT(5)
> -#define FRAME_FILTER_EN_SOP		BIT(0)
> -
> -#define USB_PDPHY_TX_SIZE_REG		0x42
> -#define TX_SIZE_MASK			0xF
> -
> -#define USB_PDPHY_TX_CONTROL_REG	0x44
> -#define TX_CONTROL_RETRY_COUNT(n)	(((n) & 0x3) << 5)
> -#define TX_CONTROL_FRAME_TYPE(n)        (((n) & 0x7) << 2)
> -#define TX_CONTROL_FRAME_TYPE_CABLE_RESET	(0x1 << 2)
> -#define TX_CONTROL_SEND_SIGNAL		BIT(1)
> -#define TX_CONTROL_SEND_MSG		BIT(0)
> -
> -#define USB_PDPHY_RX_SIZE_REG		0x48
> -
> -#define USB_PDPHY_RX_ACKNOWLEDGE_REG	0x4B
> -#define RX_BUFFER_TOKEN			BIT(0)
> -
> -#define USB_PDPHY_BIST_MODE_REG		0x4E
> -#define BIST_MODE_MASK			0xF
> -#define BIST_ENABLE			BIT(7)
> -#define PD_MSG_BIST			0x3
> -#define PD_BIST_TEST_DATA_MODE		0x8
> -
> -#define USB_PDPHY_TX_BUFFER_HDR_REG	0x60
> -#define USB_PDPHY_TX_BUFFER_DATA_REG	0x62
> -
> -#define USB_PDPHY_RX_BUFFER_REG		0x80
> -
> -/* VDD regulator */
> -#define VDD_PDPHY_VOL_MIN		2800000	/* uV */
> -#define VDD_PDPHY_VOL_MAX		3300000	/* uV */
> -#define VDD_PDPHY_HPM_LOAD		3000	/* uA */
> -
> -/* Message Spec Rev field */
> -#define PD_MSG_HDR_REV(hdr)		(((hdr) >> 6) & 3)
> -
> -/* timers */
> -#define RECEIVER_RESPONSE_TIME		15	/* tReceiverResponse */
> -#define HARD_RESET_COMPLETE_TIME	5	/* tHardResetComplete */
> -
> -/* Interrupt numbers */
> -#define PMIC_PDPHY_SIG_TX_IRQ		0x0
> -#define PMIC_PDPHY_SIG_RX_IRQ		0x1
> -#define PMIC_PDPHY_MSG_TX_IRQ		0x2
> -#define PMIC_PDPHY_MSG_RX_IRQ		0x3
> -#define PMIC_PDPHY_MSG_TX_FAIL_IRQ	0x4
> -#define PMIC_PDPHY_MSG_TX_DISCARD_IRQ	0x5
> -#define PMIC_PDPHY_MSG_RX_DISCARD_IRQ	0x6
> -#define PMIC_PDPHY_FR_SWAP_IRQ		0x7
>   
>   /* Resources */
>   #define PMIC_PDPHY_MAX_IRQS		0x08
> @@ -93,27 +25,11 @@ struct pmic_typec_pdphy_resources {
>   /* API */
>   struct pmic_typec_pdphy;
>   
> -struct pmic_typec_pdphy *qcom_pmic_typec_pdphy_alloc(struct device *dev);
> -
> +extern const struct pmic_typec_pdphy_resources pm8150b_pdphy_res;
>   int qcom_pmic_typec_pdphy_probe(struct platform_device *pdev,
> -				struct pmic_typec_pdphy *pmic_typec_pdphy,
> -				struct pmic_typec_pdphy_resources *res,
> +				struct pmic_typec *tcpm,
> +				const struct pmic_typec_pdphy_resources *res,
>   				struct regmap *regmap,
>   				u32 base);
>   
> -int qcom_pmic_typec_pdphy_start(struct pmic_typec_pdphy *pmic_typec_pdphy,
> -				struct tcpm_port *tcpm_port);
> -
> -void qcom_pmic_typec_pdphy_stop(struct pmic_typec_pdphy *pmic_typec_pdphy);
> -
> -int qcom_pmic_typec_pdphy_set_roles(struct pmic_typec_pdphy *pmic_typec_pdphy,
> -				    bool power_role_src, bool data_role_host);
> -
> -int qcom_pmic_typec_pdphy_set_pd_rx(struct pmic_typec_pdphy *pmic_typec_pdphy, bool on);
> -
> -int qcom_pmic_typec_pdphy_pd_transmit(struct pmic_typec_pdphy *pmic_typec_pdphy,
> -				      enum tcpm_transmit_type type,
> -				      const struct pd_message *msg,
> -				      unsigned int negotiated_rev);
> -
>   #endif /* __QCOM_PMIC_TYPEC_PDPHY_H__ */
> diff --git a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.h b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.h
> index d4d358c680b6..4a892048908e 100644
> --- a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.h
> +++ b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.h
> @@ -3,8 +3,8 @@
>    * Copyright (c) 2018-2019 The Linux Foundation. All rights reserved.
>    * Copyright (c) 2023, Linaro Ltd. All rights reserved.
>    */
> -#ifndef __QCOM_PMIC_TYPEC_H__
> -#define __QCOM_PMIC_TYPEC_H__
> +#ifndef __QCOM_PMIC_TYPEC_PORT_H__
> +#define __QCOM_PMIC_TYPEC_PORT_H__
>   
>   #include <linux/platform_device.h>
>   #include <linux/usb/tcpm.h>
> 

Other than my nit above looks good.

Tested-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Acked-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>


