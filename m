Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0F76F559F43
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Jun 2022 19:26:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232285AbiFXRVC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 24 Jun 2022 13:21:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40028 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232287AbiFXRUr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 24 Jun 2022 13:20:47 -0400
Received: from mail-oo1-xc31.google.com (mail-oo1-xc31.google.com [IPv6:2607:f8b0:4864:20::c31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BEC3347AFD
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jun 2022 10:20:33 -0700 (PDT)
Received: by mail-oo1-xc31.google.com with SMTP id f10-20020a4aa68a000000b0042579cb6238so594353oom.7
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jun 2022 10:20:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=DqHISH2vFNBZeTwwkM15NyX61DG2AnPuCHUHcBvWsb0=;
        b=RcrQzPEREsM/Qv1CABQEbaJ2bNzLJzf3bwVVXGg8LPVcyGoFZLVCqSP3Im7ihqtawO
         joKj7YenBndxd+e6BuT7FBdh15I8XXcVfwoM7X5OHdOyBBTmIGhrppjrLC6PSac1XyHl
         bWkYWzWkbtOmOcfTFqgSQ6JxfhRoeIL8WYYZ7nUaFwFNL0Lewy1bIlchXNCtp27hHxnX
         8mneFNqv94QOSbDzaBgW13OZdrjsxga9M3wl5e/Y8cWI7nxKtNxQPh+CYf6z8Vu113la
         4KRFM7tyvcJj5mfTZfukqA+s2cTgJKJqSI0lUEEZJLdcEI27vqm8KPKdwxi9XGfsKFHv
         nekQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=DqHISH2vFNBZeTwwkM15NyX61DG2AnPuCHUHcBvWsb0=;
        b=cxPVYMrkcWmlRoC6wq2CiVGcHNVAJ99fgpKIU4KlnPmShPECqtxxRhLYNO9tw8RNgY
         1THtUZilsKDEXzGv8nwYhfMUCyCS18uxD6izm3ffQGoBESAieM0qU+L2JtazJBM7rhey
         j9to5dt7j9xwwYsj759ltHxxLnDpmtX795i58mImMRK0HUTd9REK/SGwUdJDvx3q7lE0
         9bh4aMXNwy4A5nm8eZiOZXZOuoWUYEexP59UUEOnvoTG1ElA1zCjt1dM8oC7ux2CD4Nk
         xrZn62hJYzizLvB0y8Qu8OV6HFJIaNPTjJPQMzeW4qS4SAYrf9VJKE4YVxP1dv6S9mDi
         bTiQ==
X-Gm-Message-State: AJIora95vpAgWQcYzHXkXacdXzUZlHIVogcSJKHmR8lwg8n9pNVnq6j9
        VnWnsg99Kc14DKIAXi3ZReQcxA==
X-Google-Smtp-Source: AGRyM1u15um2JVxI2f2Fm8VmUHw+cPB1Tt1w7qJI87ULXayijK8h940nti+Ls/lra4W0ag2L/ugyjw==
X-Received: by 2002:a4a:96b3:0:b0:422:23d3:46de with SMTP id s48-20020a4a96b3000000b0042223d346demr57904ooi.70.1656091232992;
        Fri, 24 Jun 2022 10:20:32 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id l17-20020a05687014d100b000f349108868sm2175596oab.44.2022.06.24.10.20.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jun 2022 10:20:32 -0700 (PDT)
Date:   Fri, 24 Jun 2022 12:20:30 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH v8 7/7] clk: qcom: add camera clock controller driver for
 SM8450 SoC
Message-ID: <YrXyXrGkYyxugOR7@builder.lan>
References: <20220624115917.2524868-1-vladimir.zapolskiy@linaro.org>
 <20220624120006.2524968-1-vladimir.zapolskiy@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220624120006.2524968-1-vladimir.zapolskiy@linaro.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri 24 Jun 07:00 CDT 2022, Vladimir Zapolskiy wrote:

> Add  camera clock controller driver found on QCOM SM8450 SoC.
> 
> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> ---
> Changes from v7 to v8:
> * narrowed down the list of included header files,
> * constified .hw.init anonymous structs.
> 
> Changes from v6 to v7:
> * none.
> 
> Changes from v5 to v6:
> * fixed a topology of power domains aroung titan_top GDSC.
> 
> Changes from v3 to v5:
> * none.
> 
> Changes from v2 to v3:
> * took into account a renamed header file,
> * constified a couple of struct pll_vco objects,
> * deprioritized module init level.
> 
> Changes from v1 to v2:
> * none.
> 
>  drivers/clk/qcom/Kconfig        |    7 +
>  drivers/clk/qcom/Makefile       |    1 +
>  drivers/clk/qcom/camcc-sm8450.c | 2865 +++++++++++++++++++++++++++++++
>  3 files changed, 2873 insertions(+)
>  create mode 100644 drivers/clk/qcom/camcc-sm8450.c
> 
> diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
> index bc4dcf356d82..372633ab917f 100644
> --- a/drivers/clk/qcom/Kconfig
> +++ b/drivers/clk/qcom/Kconfig
> @@ -608,6 +608,13 @@ config SM_CAMCC_8250
>  	  Support for the camera clock controller on SM8250 devices.
>  	  Say Y if you want to support camera devices and camera functionality.
>  
> +config SM_CAMCC_8450
> +	tristate "SM8450 Camera Clock Controller"
> +	select SM_GCC_8450
> +	help
> +	  Support for the camera clock controller on SM8450 devices.
> +	  Say Y if you want to support camera devices and camera functionality.
> +
>  config SM_DISPCC_6125
>  	tristate "SM6125 Display Clock Controller"
>  	depends on SM_GCC_6125
> diff --git a/drivers/clk/qcom/Makefile b/drivers/clk/qcom/Makefile
> index 36789f5233ef..18dd1cc14e0f 100644
> --- a/drivers/clk/qcom/Makefile
> +++ b/drivers/clk/qcom/Makefile
> @@ -88,6 +88,7 @@ obj-$(CONFIG_SDM_VIDEOCC_845) += videocc-sdm845.o
>  obj-$(CONFIG_SDX_GCC_55) += gcc-sdx55.o
>  obj-$(CONFIG_SDX_GCC_65) += gcc-sdx65.o
>  obj-$(CONFIG_SM_CAMCC_8250) += camcc-sm8250.o
> +obj-$(CONFIG_SM_CAMCC_8450) += camcc-sm8450.o
>  obj-$(CONFIG_SM_DISPCC_6125) += dispcc-sm6125.o
>  obj-$(CONFIG_SM_DISPCC_6350) += dispcc-sm6350.o
>  obj-$(CONFIG_SM_DISPCC_8250) += dispcc-sm8250.o
> diff --git a/drivers/clk/qcom/camcc-sm8450.c b/drivers/clk/qcom/camcc-sm8450.c
> new file mode 100644
> index 000000000000..fa89ac86dd96
> --- /dev/null
> +++ b/drivers/clk/qcom/camcc-sm8450.c
> @@ -0,0 +1,2865 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2020-2021, The Linux Foundation. All rights reserved.
> + */
> +
> +#include <linux/clk-provider.h>
> +#include <linux/mod_devicetable.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <linux/regmap.h>
> +
> +#include <dt-bindings/clock/qcom,sm8450-camcc.h>
> +
> +#include "clk-alpha-pll.h"
> +#include "clk-branch.h"
> +#include "clk-pll.h"
> +#include "clk-rcg.h"
> +#include "clk-regmap-divider.h"
> +#include "clk-regmap-mux.h"
> +#include "clk-regmap.h"
> +#include "common.h"
> +#include "gdsc.h"
> +#include "reset.h"
> +

As this is a new driver & binding, please add:

enum {
	DT_IFACE,
	DT_BI_TCXO,
	DT_BI_TCXO_AO,
	DT_SLEEP_CLK
};

here and use these for .index instead of .fw_name through out the driver
to avoid the string compare based lookup.

To make it clear to the DTS author I would prefer that you drop
clock-names from the binding when doing this.

(The order of the enum needs to match the order of the clocks property
when this change is done)

> +enum {
> +	P_BI_TCXO,
> +	P_CAM_CC_PLL0_OUT_EVEN,
> +	P_CAM_CC_PLL0_OUT_MAIN,
> +	P_CAM_CC_PLL0_OUT_ODD,
> +	P_CAM_CC_PLL1_OUT_EVEN,
> +	P_CAM_CC_PLL2_OUT_EVEN,
> +	P_CAM_CC_PLL2_OUT_MAIN,
> +	P_CAM_CC_PLL3_OUT_EVEN,
> +	P_CAM_CC_PLL4_OUT_EVEN,
> +	P_CAM_CC_PLL5_OUT_EVEN,
> +	P_CAM_CC_PLL6_OUT_EVEN,
> +	P_CAM_CC_PLL7_OUT_EVEN,
> +	P_CAM_CC_PLL8_OUT_EVEN,
> +	P_SLEEP_CLK,
> +};
> +
> +static const struct pll_vco lucid_evo_vco[] = {
> +	{ 249600000, 2000000000, 0 },
> +};
> +
> +static const struct pll_vco rivian_evo_vco[] = {
> +	{ 864000000, 1056000000, 0 },
> +};
> +
> +static const struct alpha_pll_config cam_cc_pll0_config = {
> +	.l = 0x3e,
> +	.alpha = 0x8000,
> +	.config_ctl_val = 0x20485699,
> +	.config_ctl_hi_val = 0x00182261,
> +	.config_ctl_hi1_val = 0x32aa299c,
> +	.user_ctl_val = 0x00008400,
> +	.user_ctl_hi_val = 0x00000805,
> +};
> +
> +static struct clk_alpha_pll cam_cc_pll0 = {
> +	.offset = 0x0,
> +	.vco_table = lucid_evo_vco,
> +	.num_vco = ARRAY_SIZE(lucid_evo_vco),
> +	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_EVO],
> +	.clkr = {
> +		.hw.init = &(const struct clk_init_data){
> +			.name = "cam_cc_pll0",
> +			.parent_data = &(const struct clk_parent_data){
> +				.fw_name = "bi_tcxo",
> +			},

You have 9 instances of this, how about having creating an additional
constant for this?

static const struct clk_parent_data gcc_parent_data_tcxo = { .index = DT_BI_TCXO };

> +			.num_parents = 1,
> +			.ops = &clk_alpha_pll_lucid_evo_ops,
> +		},
> +	},
> +};
> +
> +static const struct clk_div_table post_div_table_cam_cc_pll0_out_even[] = {
> +	{ 0x1, 2 },
> +	{ }
> +};
> +
> +static struct clk_alpha_pll_postdiv cam_cc_pll0_out_even = {
> +	.offset = 0x0,
> +	.post_div_shift = 10,
> +	.post_div_table = post_div_table_cam_cc_pll0_out_even,
> +	.num_post_div = ARRAY_SIZE(post_div_table_cam_cc_pll0_out_even),
> +	.width = 4,
> +	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_EVO],
> +	.clkr.hw.init = &(const struct clk_init_data){
> +		.name = "cam_cc_pll0_out_even",
> +		.parent_data = &(const struct clk_parent_data){

Please include a space inbetween ) and { in all these.

> +			.hw = &cam_cc_pll0.clkr.hw,
> +		},
> +		.num_parents = 1,
> +		.flags = CLK_SET_RATE_PARENT,
> +		.ops = &clk_alpha_pll_postdiv_lucid_evo_ops,
> +	},
> +};

Regards,
Bjorn
