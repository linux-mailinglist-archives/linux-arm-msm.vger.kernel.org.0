Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 00AA66F353A
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 May 2023 19:53:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232625AbjEARur (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 1 May 2023 13:50:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40592 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232536AbjEARun (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 1 May 2023 13:50:43 -0400
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 024BE1701
        for <linux-arm-msm@vger.kernel.org>; Mon,  1 May 2023 10:50:41 -0700 (PDT)
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-2fa47de5b04so2624261f8f.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 01 May 2023 10:50:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1682963439; x=1685555439;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=u9JlJK0r/+f8gRPVK2JU+mV/Ix9Hk17cHst6salneY4=;
        b=Kh5vzq3KlZYsu9dtVtAYUE2JtdkfoP0xD77U51TuT9L7Uhe3nkGXOuedPPuF8+3D4q
         u3D8qmpN2MVR0vZ0eKPa0YIgVMuveAPJJyL15Z7/og8gstE9J0FgG1o5Sf5AwTilqpP/
         A7hPhl8V2Q1XUQGKU/ZFx3iO3Y9J3nfMb51tTbder/hw6YDM7/8dgRfRtTpnpQBuA82Z
         FbN0rCkvy+V18r0Ql5DJCSHSO36VlXJSmY8ryAhJERZrvhPVhxwXj2/GaO23IxZjw0UA
         bJLrghbv/OkiUFUyca6ML3CqzSf0BgWova+eaVCk/1EPbyWG1ZWfP6DFKoS5n0HhaoIr
         Dcxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682963439; x=1685555439;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=u9JlJK0r/+f8gRPVK2JU+mV/Ix9Hk17cHst6salneY4=;
        b=KmQPGtGaIKVRAR2YQM+z+rJFzzqjHnGJIaoJV6eWFe6EcFOJQl3Pn63ymZJ9d3NPoB
         7x/88TiuTr0KtyoFQs/AsAOpn4E76P5/OZWyjxQw2wvihrbY+QTrOdcJAWsRBn9PNcrC
         IR20hACaO98gNkRhvM0PhSXtY9/q+v0P8Upu/Wp7zc8Vi/0oVx0nu0W2XWpsRv3cSiLW
         utg995JhjFuIJZUtBDzf1qlfpKGNBHzR7yJhQVmoeKqXNAZxH9AlufeC25xEWoBjF9l4
         +riimttdCsm8mhxaLTVI1kiQxsTzH4yCJpdRD5v+EtG1arQ0kN4jXPxAjAGRwYm9a0TD
         k3LA==
X-Gm-Message-State: AC+VfDxoo4YjBdPgUCJjAeektJll1uEe5Lpf4gRbIFVKzdosbW1Rh7tB
        isBe/tHhZyNIC678qaRNTGHjpBYeY2cn+i81WbFs2w==
X-Google-Smtp-Source: ACHHUZ67QOd9rL96ZK0NWi6yHoPnZs+y1EkybRmrXk0AIBrp8dbc7YsmeFiJQshtOl+5PKzoLXS+Zg==
X-Received: by 2002:adf:f2cf:0:b0:2f2:e638:1767 with SMTP id d15-20020adff2cf000000b002f2e6381767mr11366972wrp.39.1682963439396;
        Mon, 01 May 2023 10:50:39 -0700 (PDT)
Received: from [192.168.0.15] (cpc76484-cwma10-2-0-cust274.7-3.cable.virginm.net. [82.31.201.19])
        by smtp.gmail.com with ESMTPSA id k6-20020a5d5186000000b003062b57ffd1sm4239398wrv.50.2023.05.01.10.50.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 May 2023 10:50:38 -0700 (PDT)
Message-ID: <91cf184b-2466-183d-5800-da0a12a0701c@linaro.org>
Date:   Mon, 1 May 2023 18:50:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH v6 07/13] usb: typec: qcom: Add Qualcomm PMIC Type-C
 driver
Content-Language: en-US
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>, linux@roeck-us.net,
        heikki.krogerus@linux.intel.com, gregkh@linuxfoundation.org,
        andersson@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, luca.weiss@fairphone.com,
        linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
Cc:     konrad.dybcio@linaro.org, subbaram@quicinc.com, jackp@quicinc.com,
        robertom@qti.qualcomm.com
References: <20230501121111.1058190-1-bryan.odonoghue@linaro.org>
 <20230501121111.1058190-8-bryan.odonoghue@linaro.org>
From:   Caleb Connolly <caleb.connolly@linaro.org>
In-Reply-To: <20230501121111.1058190-8-bryan.odonoghue@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 01/05/2023 13:11, Bryan O'Donoghue wrote:
> This commit adds a QCOM PMIC TCPM driver with an initial pm8150b
> block.
> 
> The driver is layered as follows:
> 
> qcom_pmic_typec.c : Responsible for registering with TCPM and arbitrates
>                     access to the Type-C and PDPHY hardware blocks in one
>                     place.  This presents a single TCPM device to device to
>                     the Linux TCPM layer.
> 
> qcom_pmic_typec_pdphy.c: Responsible for interfacing with the PDPHY hardware and
>                          processing power-delivery related calls from TCPM.
>                          This hardware binding can be extended to
>                          facilitate similar hardware in different PMICs.
> 
> qcom_pmic_typec_port.c: Responsible for notifying and processing Type-C
>                         related calls from TCPM. Similar to the pdphy this
>                         layer can be extended to handle the specifics of
>                         different Qualcomm PMIC Type-C port managers.
> 
> This code provides all of the same functionality as the existing
> qcom typec driver plus power-delivery as well.
> 
> As a result commit 6c8cf3695176 ("usb: typec: Add QCOM PMIC typec detection
> driver") can be deleted entirely.
> 
> References code from Jonathan Marek, Jack Pham, Wesley Cheng, Hemant Kumar,
> Guru Das Srinagesh and Ashay Jaiswal.
> 
> Acked-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

Reviewed-by: Caleb Connolly <caleb.connolly@linaro.org>

Just a few additional nits:

[...]

> +
> +static struct platform_driver qcom_pmic_typec_platform_driver = {

This could be renamed to qcom_pmic_typec_driver, following the trend of
the other tcpm drivers.
> +	.driver = {
> +		.name = "qcom,pmic-typec",
> +		.of_match_table = qcom_pmic_typec_table,
> +	},
> +	.probe = qcom_pmic_typec_probe,
> +	.remove = qcom_pmic_typec_remove,
> +};
> +
> +static int __init qcom_pmic_typec_module_init(void)
> +{
> +	int ret;
> +
> +	ret = platform_driver_register(&qcom_pmic_typec_platform_driver);
> +	if (ret)
> +		return ret;
> +
> +	return 0;
> +}
> +module_init(qcom_pmic_typec_module_init);
> +
> +static void __exit qcom_pmic_typec_module_exit(void)
> +{
> +	platform_driver_unregister(&qcom_pmic_typec_platform_driver);
> +}
> +module_exit(qcom_pmic_typec_module_exit);

Can't this be simplified to just:

module_platform_driver(qcom_pmic_typec_platform_driver);

[...]
> diff --git a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_pdphy.h b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_pdphy.h
> new file mode 100644
> index 0000000000000..ebd33c9ae0606
> --- /dev/null
> +++ b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_pdphy.h
> @@ -0,0 +1,115 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright (c) 2018-2019 The Linux Foundation. All rights reserved.
> + * Copyright (c) 2023, Linaro Ltd. All rights reserved.
> + */
> +#ifndef __QCOM_PMIC_PDPHY_H__
> +#define __QCOM_PMIC_PDPHY_H__

Missing a few headers:

#include <linux/platform_device.h>
#include <linux/regmap.h>
#include <linux/usb/tcpm.h>

[...]

> +static irqreturn_t pmic_typec_port_isr(int irq, void *dev_id)
> +{
> +	struct pmic_typec_port_irq_data *irq_data = dev_id;
> +	struct pmic_typec_port *pmic_typec_port = irq_data->pmic_typec_port;
> +	u32 misc_stat;
> +	bool vbus_change = false;
> +	bool cc_change = false;
> +	unsigned long flags;
> +	int ret;
> +
> +	spin_lock_irqsave(&pmic_typec_port->lock, flags);
> +
> +	ret = regmap_read(pmic_typec_port->regmap,
> +			  pmic_typec_port->base + TYPEC_MISC_STATUS_REG,
> +			  &misc_stat);
> +	if (ret)
> +		goto done;
> +
> +	switch (irq_data->virq) {
> +	case PMIC_TYPEC_VBUS_IRQ:
> +		/* Incoming vbus assert/de-assert detect */

This comment can probably be dropped
> +		vbus_change = true;
> +		break;
> +	case PMIC_TYPEC_CC_STATE_IRQ:
> +		if (!pmic_typec_port->debouncing_cc)
> +			cc_change = true;
> +		break;
> +	case PMIC_TYPEC_ATTACH_DETACH_IRQ:
> +		if (!pmic_typec_port->debouncing_cc)
> +			cc_change = true;
> +		break;
> +	}

The middle case can just fall through:

	case PMIC_TYPEC_CC_STATE_IRQ:
	case PMIC_TYPEC_ATTACH_DETACH_IRQ:
		if (!pmic_typec_port->debouncing_cc)
			cc_change = true;
		break;
	}

[...]

> diff --git a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.h b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.h
> new file mode 100644
> index 0000000000000..5a9c47373c614
> --- /dev/null
> +++ b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.h
> @@ -0,0 +1,194 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright (c) 2018-2019 The Linux Foundation. All rights reserved.
> + * Copyright (c) 2023, Linaro Ltd. All rights reserved.
> + */
> +#ifndef __QCOM_PMIC_TYPEC_H__
> +#define __QCOM_PMIC_TYPEC_H__
> +

Also missing some headers:

#include <linux/platform_device.h>
#include <linux/regmap.h>
> +#include <linux/usb/tcpm.h>
> +

-- 
Kind Regards,
Caleb (they/them)
