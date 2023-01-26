Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5D6D467D99D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Jan 2023 00:33:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232339AbjAZXc7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 26 Jan 2023 18:32:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44646 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229502AbjAZXc7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 26 Jan 2023 18:32:59 -0500
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A1CCCFF3E
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Jan 2023 15:32:56 -0800 (PST)
Received: by mail-ej1-x631.google.com with SMTP id me3so9372856ejb.7
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Jan 2023 15:32:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OKgZ/poIpGJWM5cLb9CWvinBk87AHczhWKzm6hX+O4w=;
        b=dMVT3Kg5WjyArEpQyZrvnzWzkhYZ1aYLhuMyDlRgsKcQFpP/Hmqf9V7eL5/b5ZRihG
         xFttLd8LqSHZzVb/SbYUy891SlnB1s8C6Z6oH3FBWbc5vHzT2Tr3jDtWNywru16qf1OI
         YU2keEklZjd2ZuS96E4FVMQtGp6fthxunCpU3+kb1N7mZg6jE5czDLzMdVFPp7hI0eTs
         zdviiuS9o/SYdsyf8vFh/+KQsRrYWGjx/hkGSnkuwXv6Z26ccuTBI4ZaFRMq5h0A5czb
         hMuYEhh+mT9Z0T8Bv1W8EV5aH5LT1aZ4f0EpQx8zIbtlRCbdWMVlT2YhP0xI3uyiQT+N
         YXCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OKgZ/poIpGJWM5cLb9CWvinBk87AHczhWKzm6hX+O4w=;
        b=oIOqWFUYadVAzETUK6jSwal7bPDBtnQmWAKO4c10Vpp3k5jvt5GtN8xWHrRIxCxXaa
         5rO/nzD6yGc53T4ZCCCQED4V6MASzKZN8Gz+ZEaeiHnjSO6+DTDSnZnjBJp4wo1GS4rr
         LYNxn4PByDqxZnwNN84fwTJBnrMU0tA8x21qS7yGC1QNo3I1A91D7qyXbAz02YZhS5aN
         PI7He2JoxgDnRi4MlrGpRWSNlTW74VoWhLW92WfWjfpNuCYPlD+5hFjizvWOyuoo8233
         zE4+KxhSx2yrqfPo42GgLxvON2hsCQ1UXS/epc/s+vz5ARPbOmJ6c726v6hxyDpfWLNV
         ub0g==
X-Gm-Message-State: AFqh2koaK/+Kuyq63uAPPFtaHg93MDrgoVYCFexpoj9O2CgQA4PS5BDn
        bSFtQ+HBmcBq/TGUhYxx/S/qGA==
X-Google-Smtp-Source: AMrXdXtgqXraXM/O+xAGX7e9lH6r1vl84rwFRa03KZYcGerC4TryIqmA2oyYApcBe/Xt70ZG3nsPtg==
X-Received: by 2002:a17:906:150d:b0:7c1:458b:a947 with SMTP id b13-20020a170906150d00b007c1458ba947mr37761802ejd.26.1674775974968;
        Thu, 26 Jan 2023 15:32:54 -0800 (PST)
Received: from [192.168.1.101] (abyl20.neoplus.adsl.tpnet.pl. [83.9.31.20])
        by smtp.gmail.com with ESMTPSA id lf16-20020a170907175000b008787134a939sm1212371ejc.18.2023.01.26.15.32.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Jan 2023 15:32:54 -0800 (PST)
Message-ID: <96ab46f1-3733-e11c-ee4e-a70096fd400f@linaro.org>
Date:   Fri, 27 Jan 2023 00:32:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [PATCH v5 7/7] clk: qcom: add the driver for the MSM8996 APCS
 clocks
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>,
        Jassi Brar <jassisinghbrar@gmail.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230126230319.3977109-1-dmitry.baryshkov@linaro.org>
 <20230126230319.3977109-8-dmitry.baryshkov@linaro.org>
Content-Language: en-US
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230126230319.3977109-8-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 27.01.2023 00:03, Dmitry Baryshkov wrote:
> Add a simple driver handling the APCS clocks on MSM8996. For now it
> supports just a single aux clock, linking GPLL0 to CPU and CBF clocks.
> 
> Note, there is little sense in registering sys_apcs_aux as a child of
> gpll0. The PLL is always-on. And listing the gpll0 as a property of the
> apcs would delay its probing until the GCC has been probed (while we
> would like for the apcs to be probed as early as possible).
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  drivers/clk/qcom/Makefile       |  2 +-
>  drivers/clk/qcom/apcs-msm8996.c | 88 +++++++++++++++++++++++++++++++++
>  2 files changed, 89 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/clk/qcom/apcs-msm8996.c
> 
> diff --git a/drivers/clk/qcom/Makefile b/drivers/clk/qcom/Makefile
> index 3194465dd02c..a8ed1f38b2f7 100644
> --- a/drivers/clk/qcom/Makefile
> +++ b/drivers/clk/qcom/Makefile
> @@ -52,7 +52,7 @@ obj-$(CONFIG_MSM_MMCC_8998) += mmcc-msm8998.o
>  obj-$(CONFIG_QCOM_A53PLL) += a53-pll.o
>  obj-$(CONFIG_QCOM_A7PLL) += a7-pll.o
>  obj-$(CONFIG_QCOM_CLK_APCS_MSM8916) += apcs-msm8916.o
> -obj-$(CONFIG_QCOM_CLK_APCC_MSM8996) += clk-cpu-8996.o
> +obj-$(CONFIG_QCOM_CLK_APCC_MSM8996) += apcs-msm8996.o clk-cpu-8996.o
>  obj-$(CONFIG_QCOM_CLK_APCS_SDX55) += apcs-sdx55.o
>  obj-$(CONFIG_QCOM_CLK_RPM) += clk-rpm.o
>  obj-$(CONFIG_QCOM_CLK_RPMH) += clk-rpmh.o
> diff --git a/drivers/clk/qcom/apcs-msm8996.c b/drivers/clk/qcom/apcs-msm8996.c
> new file mode 100644
> index 000000000000..48d22572b6ae
> --- /dev/null
> +++ b/drivers/clk/qcom/apcs-msm8996.c
> @@ -0,0 +1,88 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Qualcomm APCS clock controller driver
> + *
> + * Copyright (c) 2022, Linaro Limited
> + * Author: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> + */
> +
> +#include <linux/bits.h>
> +#include <linux/clk-provider.h>
> +#include <linux/delay.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <linux/regmap.h>
> +
> +#define APCS_AUX_OFFSET	0x50
> +
> +#define APCS_AUX_DIV_MASK GENMASK(17, 16)
> +#define APCS_AUX_DIV_2 0x1
> +
> +static int qcom_apcs_msm8996_clk_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct device *parent = dev->parent;
> +	struct regmap *regmap;
> +	struct clk_hw *hw;
> +	unsigned int val;
> +	int ret = -ENODEV;
> +
> +	regmap = dev_get_regmap(parent, NULL);
> +	if (!regmap) {
> +		dev_err(dev, "failed to get regmap: %d\n", ret);
> +		return ret;
> +	}
> +
> +	regmap_read(regmap, APCS_AUX_OFFSET, &val);
> +	regmap_update_bits(regmap, APCS_AUX_OFFSET, APCS_AUX_DIV_MASK,
> +			   FIELD_PREP(APCS_AUX_DIV_MASK, APCS_AUX_DIV_2));
> +
> +	/*
> +	 * This clock is used during CPU cluster setup while setting up CPU PLLs.
> +	 * Add hardware mandated delay to make sure that the sys_apcs_aux clock
> +	 * is stable (after setting the divider) before continuing
> +	 * bootstrapping to keep CPUs from ending up in a weird state.
> +	 */
> +	udelay(5);
> +
> +	/*
> +	 * As this clocks is a parent of the CPU cluster clocks and is actually
> +	 * used as a parent during CPU clocks setup, we want for it to gegister
> +	 * as early as possible, without letting fw_devlink to delay probing of
> +	 * either of the drivers.
> +	 *
> +	 * The sys_apcs_aux is a child (divider) of gpll0, but we register it
> +	 * as a fixed rate clock instead to ease bootstrapping procedure. By
> +	 * doing this we make sure that CPU cluster clocks are able to be setup
> +	 * early during the boot process (as it is recommended by Qualcomm).
> +	 */
> +	hw = devm_clk_hw_register_fixed_rate(dev, "sys_apcs_aux", NULL, 0, 300000000);
> +	if (IS_ERR(hw))
> +		return PTR_ERR(hw);
> +
> +	return devm_of_clk_add_hw_provider(dev, of_clk_hw_simple_get, hw);
> +}
> +
> +static struct platform_driver qcom_apcs_msm8996_clk_driver = {
> +	.probe = qcom_apcs_msm8996_clk_probe,
> +	.driver = {
> +		.name = "qcom-apcs-msm8996-clk",
> +	},
> +};
> +
> +/* Register early enough to fix the clock to be used for other cores */
> +static int __init qcom_apcs_msm8996_clk_init(void)
> +{
> +	return platform_driver_register(&qcom_apcs_msm8996_clk_driver);
> +}
> +postcore_initcall(qcom_apcs_msm8996_clk_init);
> +
> +static void __exit qcom_apcs_msm8996_clk_exit(void)
> +{
> +	platform_driver_unregister(&qcom_apcs_msm8996_clk_driver);
> +}
> +module_exit(qcom_apcs_msm8996_clk_exit);
> +
> +MODULE_AUTHOR("Dmitry Baryshkov <dmitry.baryshkov@linaro.org>");
> +MODULE_LICENSE("GPL");
> +MODULE_DESCRIPTION("Qualcomm MSM8996 APCS clock driver");
