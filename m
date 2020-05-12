Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CE1401CFF18
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2020 22:14:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731048AbgELUOI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 12 May 2020 16:14:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35336 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731019AbgELUOI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 12 May 2020 16:14:08 -0400
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D9EA3C05BD09
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2020 13:14:07 -0700 (PDT)
Received: by mail-pg1-x541.google.com with SMTP id j21so6683236pgb.7
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2020 13:14:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=yVbj2kYfNqCNXaolI+2XZgrd+V6K2rPAmk0JT9WEG78=;
        b=XGD5nBU6JrgC3849IVhQBhLqb1DDeB1ZmAVFp8cIEyJsRPDHURkLigCz3PiMl7Ibc0
         olFg2EW2Ea8pV2fcljIxY+SKxK842KxdaADXpXUSOUkRzWQSSCleFzHmUMyS0BngOzmd
         8awe6Jo+tpxpuQPUPPXTJCg8e1Q14JdyAH+akE2eqErRb7x5ZL1xEeVzHL7snHDl6g+o
         k+K9FDTPEIGp8hQ66LJEb/DvA4adP7J/6VfDCBij1qKrWNP9rRmZOiiUL78dAwu3VibT
         5eBp724V5jFFRw4tibJ3CJOKfgk0ySonTB8eWh7Y6sLU/+jVyQe/ghI2DfjvVhl+bj6R
         AVbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=yVbj2kYfNqCNXaolI+2XZgrd+V6K2rPAmk0JT9WEG78=;
        b=XTPQk9hq3j5PT5QxgWbz0RsI68d5s8eUPzshzEIdn8kMq7KUxCc7rpiR/9WvNtsb2c
         tgiMdPAZSlQE3XgG5dfBSf8joHtL1OQ9DKvoWfPV3IJg3Uvox4MH8S0o49IJxPrSw6tE
         F4FwhKK/i6EBu0a28D8efo2uN8YxhxK1RDOr2lykb190C5xIx0+oNdXSzAY9vBVgvShy
         XJjJFQKFAljnYvZaP8tC4T2xdr9M/184Ge66G51sXv4ChnKv8Um/+AFaqjo1SPM1XwWB
         WU9/t9tOXk5WbNbspY9Y3Nc/JPp/Ycwu5lVVJ2uQzv6Kls1r2FRMpBllE8mg0MhLfa7V
         zaOQ==
X-Gm-Message-State: AGi0PubmomFkTaQHaEj665k30CsNaiz1jqBygt/l/AoNBdg2+aCQEv7r
        5efQQL5YyRN2/DeiCFxUNDTdXA==
X-Google-Smtp-Source: APiQypK8S/5rcF+l1u/BQzeTY26XrRavipgCWhCkuOvvbFE6MVs3TXr//7a9kTCmKjx8LHEFh1l7FA==
X-Received: by 2002:a62:7b03:: with SMTP id w3mr22334202pfc.313.1589314447191;
        Tue, 12 May 2020 13:14:07 -0700 (PDT)
Received: from builder.lan (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id o11sm11110711pgp.62.2020.05.12.13.14.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2020 13:14:06 -0700 (PDT)
Date:   Tue, 12 May 2020 13:12:33 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Sivaprakash Murugesan <sivaprak@codeaurora.org>
Cc:     agross@kernel.org, mturquette@baylibre.com, sboyd@kernel.org,
        robh+dt@kernel.org, jassisinghbrar@gmail.com,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH V4 5/8] clk: qcom: Add ipq apss clock controller
Message-ID: <20200512201233.GI2165@builder.lan>
References: <1588573224-3038-1-git-send-email-sivaprak@codeaurora.org>
 <1588573224-3038-6-git-send-email-sivaprak@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1588573224-3038-6-git-send-email-sivaprak@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sun 03 May 23:20 PDT 2020, Sivaprakash Murugesan wrote:

> The CPU on Qualcomm ipq platform is clocked primarily by a aplha PLL
> and xo which are connected to a mux and enable block.
> 
> Add support for the mux and enable block which feeds the CPU on ipq
> based devices.
> 

As with the A53 binding, I don't believe that this driver will support
all past, present and future IPQ APSSs. Please make it more specific.

Regards,
Bjorn

> Signed-off-by: Sivaprakash Murugesan <sivaprak@codeaurora.org>
> ---
> [V4]
>  * Addressed review comments
>  drivers/clk/qcom/Kconfig    |  11 +++++
>  drivers/clk/qcom/Makefile   |   1 +
>  drivers/clk/qcom/apss-ipq.c | 106 ++++++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 118 insertions(+)
>  create mode 100644 drivers/clk/qcom/apss-ipq.c
> 
> diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
> index e70aa01..8d8465e 100644
> --- a/drivers/clk/qcom/Kconfig
> +++ b/drivers/clk/qcom/Kconfig
> @@ -97,6 +97,17 @@ config IPQ_APSS_PLL
>  	  Say Y if you want to support CPU frequency scaling on ipq based
>  	  devices.
>  
> +config IPQ_APSS
> +	tristate "IPQ APSS Clock Controller"
> +	select IPQ_APSS_PLL
> +	depends on QCOM_APCS_IPC || COMPILE_TEST
> +	help
> +	  Support for APSS clock controller on IPQ platforms. The
> +	  APSS clock controller manages the Mux and enable block that feeds the
> +	  CPUs.
> +	  Say Y if you want to support CPU frequency scaling on
> +	  ipq based devices.
> +
>  config IPQ_GCC_4019
>  	tristate "IPQ4019 Global Clock Controller"
>  	help
> diff --git a/drivers/clk/qcom/Makefile b/drivers/clk/qcom/Makefile
> index b4a6ba1..aab7a58 100644
> --- a/drivers/clk/qcom/Makefile
> +++ b/drivers/clk/qcom/Makefile
> @@ -20,6 +20,7 @@ clk-qcom-$(CONFIG_QCOM_GDSC) += gdsc.o
>  obj-$(CONFIG_APQ_GCC_8084) += gcc-apq8084.o
>  obj-$(CONFIG_APQ_MMCC_8084) += mmcc-apq8084.o
>  obj-$(CONFIG_IPQ_APSS_PLL) += apss-ipq-pll.o
> +obj-$(CONFIG_IPQ_APSS) += apss-ipq.o
>  obj-$(CONFIG_IPQ_GCC_4019) += gcc-ipq4019.o
>  obj-$(CONFIG_IPQ_GCC_6018) += gcc-ipq6018.o
>  obj-$(CONFIG_IPQ_GCC_806X) += gcc-ipq806x.o
> diff --git a/drivers/clk/qcom/apss-ipq.c b/drivers/clk/qcom/apss-ipq.c
> new file mode 100644
> index 0000000..59ed8e7
> --- /dev/null
> +++ b/drivers/clk/qcom/apss-ipq.c
> @@ -0,0 +1,106 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (c) 2018, The Linux Foundation. All rights reserved.
> + */
> +
> +#include <linux/kernel.h>
> +#include <linux/err.h>
> +#include <linux/platform_device.h>
> +#include <linux/clk-provider.h>
> +#include <linux/regmap.h>
> +#include <linux/module.h>
> +
> +#include <dt-bindings/clock/qcom,apss-ipq.h>
> +
> +#include "common.h"
> +#include "clk-regmap.h"
> +#include "clk-branch.h"
> +#include "clk-alpha-pll.h"
> +#include "clk-regmap-mux.h"
> +
> +enum {
> +	P_XO,
> +	P_APSS_PLL_EARLY,
> +};
> +
> +static const struct clk_parent_data parents_apcs_alias0_clk_src[] = {
> +	{ .fw_name = "xo" },
> +	{ .fw_name = "pll" },
> +};
> +
> +static const struct parent_map parents_apcs_alias0_clk_src_map[] = {
> +	{ P_XO, 0 },
> +	{ P_APSS_PLL_EARLY, 5 },
> +};
> +
> +static struct clk_regmap_mux apcs_alias0_clk_src = {
> +	.reg = 0x0050,
> +	.width = 3,
> +	.shift = 7,
> +	.parent_map = parents_apcs_alias0_clk_src_map,
> +	.clkr.hw.init = &(struct clk_init_data){
> +		.name = "apcs_alias0_clk_src",
> +		.parent_data = parents_apcs_alias0_clk_src,
> +		.num_parents = 2,
> +		.ops = &clk_regmap_mux_closest_ops,
> +		.flags = CLK_SET_RATE_PARENT,
> +	},
> +};
> +
> +static struct clk_branch apcs_alias0_core_clk = {
> +	.halt_reg = 0x0058,
> +	.clkr = {
> +		.enable_reg = 0x0058,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(struct clk_init_data){
> +			.name = "apcs_alias0_core_clk",
> +			.parent_hws = (const struct clk_hw *[]){
> +				&apcs_alias0_clk_src.clkr.hw },
> +			.num_parents = 1,
> +			.flags = CLK_SET_RATE_PARENT,
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
> +static const struct regmap_config apss_ipq_regmap_config = {
> +	.reg_bits       = 32,
> +	.reg_stride     = 4,
> +	.val_bits       = 32,
> +	.max_register   = 0x1000,
> +	.fast_io        = true,
> +};
> +
> +static struct clk_regmap *apss_ipq_clks[] = {
> +	[APCS_ALIAS0_CLK_SRC] = &apcs_alias0_clk_src.clkr,
> +	[APCS_ALIAS0_CORE_CLK] = &apcs_alias0_core_clk.clkr,
> +};
> +
> +static const struct qcom_cc_desc apss_ipq_desc = {
> +	.config = &apss_ipq_regmap_config,
> +	.clks = apss_ipq_clks,
> +	.num_clks = ARRAY_SIZE(apss_ipq_clks),
> +};
> +
> +static int apss_ipq_probe(struct platform_device *pdev)
> +{
> +	struct regmap *regmap;
> +
> +	regmap = dev_get_regmap(pdev->dev.parent, NULL);
> +	if (IS_ERR(regmap))
> +		return PTR_ERR(regmap);
> +
> +	return qcom_cc_really_probe(pdev, &apss_ipq_desc, regmap);
> +}
> +
> +static struct platform_driver apss_ipq_driver = {
> +	.probe = apss_ipq_probe,
> +	.driver = {
> +		.name   = "qcom,apss-ipq-clk",
> +	},
> +};
> +
> +module_platform_driver(apss_ipq_driver);
> +
> +MODULE_DESCRIPTION("QCOM APSS IPQ CLK Driver");
> +MODULE_LICENSE("GPL v2");
> -- 
> 2.7.4
> 
