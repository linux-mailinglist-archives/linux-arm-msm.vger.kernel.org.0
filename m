Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ABF28FD7BA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Nov 2019 09:11:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727380AbfKOILh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 15 Nov 2019 03:11:37 -0500
Received: from smtp.codeaurora.org ([198.145.29.96]:56544 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725829AbfKOILh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 15 Nov 2019 03:11:37 -0500
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id F37FC61178; Fri, 15 Nov 2019 08:11:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1573805496;
        bh=U+NWRV9U8zb1UtpPRM1pp655B1A2eZ/u4HXC3gMQDew=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=HTBf6HM1jGeLBKG1AwJCArPryYLlmU06FmXEb9CByjvXMvCynlOZXrPZAxbE/VkfT
         vJQmwqPoLYPjLVO5TEtSi7E5MmjRsS2JxuHBmjYEKu3s2bYESOov8N2OUbBQzU/sKJ
         1O7pdrSdFQqR8TGWXTUJcYf+kyr1QzwgN1zJ8o70=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
        version=3.4.0
Received: from [10.206.28.9] (blr-c-bdr-fw-01_globalnat_allzones-outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: tdas@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 34B6D60EE9;
        Fri, 15 Nov 2019 08:11:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1573805494;
        bh=U+NWRV9U8zb1UtpPRM1pp655B1A2eZ/u4HXC3gMQDew=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=mG0mg0oC4ra3I7fn13UsdOi0eXb5jPYZU1JOl27ExW5+qgf7n22/rKQIeJCUCgg3r
         7Gw9I4xG6KToFjySmH/K5fTP3/j+clmMPROCmywwHCYsgqNPPLXfW1k1oS3HXtpUp/
         /tkwDv0hW8I2UzLSHurVVVAWjGuwwX5RUiiXdIZU=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 34B6D60EE9
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=tdas@codeaurora.org
Subject: Re: [PATCH v1 4/7] clk: qcom: Add graphics clock controller driver
 for SC7180
To:     Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     David Brown <david.brown@linaro.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Andy Gross <agross@kernel.org>, devicetree@vger.kernel.org,
        robh@kernel.org, robh+dt@kernel.org
References: <1572524473-19344-1-git-send-email-tdas@codeaurora.org>
 <1572524473-19344-5-git-send-email-tdas@codeaurora.org>
 <20191106003053.DA8462178F@mail.kernel.org>
From:   Taniya Das <tdas@codeaurora.org>
Message-ID: <307ce88d-ab1b-ce2b-0e25-79b7fde637e5@codeaurora.org>
Date:   Fri, 15 Nov 2019 13:41:28 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20191106003053.DA8462178F@mail.kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Stephen,

Thanks for the review.

On 11/6/2019 6:00 AM, Stephen Boyd wrote:
> Quoting Taniya Das (2019-10-31 05:21:10)
>> diff --git a/drivers/clk/qcom/gpucc-sc7180.c b/drivers/clk/qcom/gpucc-sc7180.c
>> new file mode 100644
>> index 0000000..0d893e6
>> --- /dev/null
>> +++ b/drivers/clk/qcom/gpucc-sc7180.c
>> @@ -0,0 +1,274 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +/*
>> + * Copyright (c) 2019, The Linux Foundation. All rights reserved.
>> + */
>> +
>> +#include <linux/clk-provider.h>
>> +#include <linux/err.h>
>> +#include <linux/kernel.h>
>> +#include <linux/module.h>
>> +#include <linux/of.h>
>> +#include <linux/of_device.h>
> 
> Are these of includes used?
>

yes, would clean up these headers.


>> +#include <linux/regmap.h>
>> +
>> +#include <dt-bindings/clock/qcom,gpucc-sc7180.h>
>> +
>> +#include "clk-alpha-pll.h"
>> +#include "clk-branch.h"
>> +#include "clk-rcg.h"
>> +#include "clk-regmap.h"
>> +#include "common.h"
>> +#include "gdsc.h"
>> +
>> +#define CX_GMU_CBCR_SLEEP_MASK         0xF
>> +#define CX_GMU_CBCR_SLEEP_SHIFT                4
>> +#define CX_GMU_CBCR_WAKE_MASK          0xF
>> +#define CX_GMU_CBCR_WAKE_SHIFT         8
>> +#define CLK_DIS_WAIT_SHIFT             12
>> +#define CLK_DIS_WAIT_MASK              (0xf << CLK_DIS_WAIT_SHIFT)
>> +
>> +enum {
>> +       P_BI_TCXO,
>> +       P_CORE_BI_PLL_TEST_SE,
>> +       P_GPLL0_OUT_MAIN,
>> +       P_GPLL0_OUT_MAIN_DIV,
>> +       P_GPU_CC_PLL1_OUT_EVEN,
>> +       P_GPU_CC_PLL1_OUT_MAIN,
>> +       P_GPU_CC_PLL1_OUT_ODD,
>> +};
>> +
>> +static struct pll_vco fabia_vco[] = {
> 
> const?
> 

Will take care.

>> +       { 249600000, 2000000000, 0 },
>> +};
>> +
>> +static struct clk_alpha_pll gpu_cc_pll1 = {
>> +       .offset = 0x100,
>> +       .vco_table = fabia_vco,
>> +       .num_vco = ARRAY_SIZE(fabia_vco),
>> +       .regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_FABIA],
>> +       .clkr = {
>> +               .hw.init = &(struct clk_init_data){
>> +                       .name = "gpu_cc_pll1",
>> +                       .parent_data =  &(const struct clk_parent_data){
>> +                               .fw_name = "bi_tcxo",
>> +                               .name = "bi_tcxo",
> 
> Do we need both? This is new so it should just work with .fw_name right?
> 

yes, will clean this up.

>> +                       },
>> +                       .num_parents = 1,
>> +                       .ops = &clk_alpha_pll_fabia_ops,
>> +               },
>> +       },
>> +};
>> +
>> +static const struct parent_map gpu_cc_parent_map_0[] = {
>> +       { P_BI_TCXO, 0 },
>> +       { P_GPU_CC_PLL1_OUT_MAIN, 3 },
>> +       { P_GPLL0_OUT_MAIN, 5 },
>> +       { P_GPLL0_OUT_MAIN_DIV, 6 },
>> +       { P_CORE_BI_PLL_TEST_SE, 7 },
>> +};
>> +
>> +static const struct clk_parent_data gpu_cc_parent_data_0[] = {
>> +       { .fw_name = "bi_tcxo", .name = "bi_tcxo" },
>> +       { .hw = &gpu_cc_pll1.clkr.hw },
>> +       { .fw_name = "gcc_gpu_gpll0_clk_src", .name = "gcc_gpu_gpll0_clk_src" },
>> +       { .fw_name = "gcc_gpu_gpll0_div_clk_src",
>> +                                       .name = "gcc_gpu_gpll0_div_clk_src" },
>> +       { .fw_name = "core_bi_pll_test_se", .name = "core_bi_pll_test_se" },
>> +};
> 
> Same for these.
> 
>> +
>> +static const struct freq_tbl ftbl_gpu_cc_gmu_clk_src[] = {
>> +       F(19200000, P_BI_TCXO, 1, 0, 0),
>> +       F(200000000, P_GPLL0_OUT_MAIN_DIV, 1.5, 0, 0),
>> +       { }
>> +};
> [..]
>> +
>> +
>> +static int gpu_cc_sc7180_probe(struct platform_device *pdev)
>> +{
>> +       struct regmap *regmap;
>> +       struct alpha_pll_config gpu_cc_pll_config = {};
>> +       unsigned int value, mask;
>> +
>> +       regmap = qcom_cc_map(pdev, &gpu_cc_sc7180_desc);
>> +       if (IS_ERR(regmap))
>> +               return PTR_ERR(regmap);
>> +
>> +       /* 360MHz Configuration */
>> +       gpu_cc_pll_config.l = 0x12;
>> +       gpu_cc_pll_config.alpha = 0xC000;
>> +       gpu_cc_pll_config.config_ctl_val = 0x20485699;
>> +       gpu_cc_pll_config.config_ctl_hi_val = 0x00002067;
>> +       gpu_cc_pll_config.user_ctl_val = 0x00000001;
>> +       gpu_cc_pll_config.user_ctl_hi_val = 0x00004805;
>> +       gpu_cc_pll_config.test_ctl_hi_val = 0x40000000;
> 
> Is there a reason this is built on the stack? Save space or something?
> 

I have done as we had discussed during the dispcc review for SDM845
https://patchwork.kernel.org/patch/10446073/
 >>>
 >> +static const struct alpha_pll_config disp_cc_pll0_config = {
 >> +       .l = 0x2c,
 >> +       .alpha = 0xcaaa,
 >> +};
 >
 > Any reason this can't be put on the stack in the probe function?
 >
I would move it.
 >>>

In case you think I should move it outside I can do that too.

>> +
>> +       clk_fabia_pll_configure(&gpu_cc_pll1, regmap, &gpu_cc_pll_config);
>> +
>> +       /* Recommended WAKEUP/SLEEP settings for the gpu_cc_cx_gmu_clk */
>> +       mask = CX_GMU_CBCR_WAKE_MASK << CX_GMU_CBCR_WAKE_SHIFT;
>> +       mask |= CX_GMU_CBCR_SLEEP_MASK << CX_GMU_CBCR_SLEEP_SHIFT;
>> +       value = 0xF << CX_GMU_CBCR_WAKE_SHIFT | 0xF << CX_GMU_CBCR_SLEEP_SHIFT;
> 
> mask and value can just be big constants? I'm not sure anyone cares to
> tweak this later, but I guess it's fine this way too.
> 
>> +       regmap_update_bits(regmap, 0x1098, mask, value);
>> +
>> +       /* gpu_cc_ahb_clk */
> 
> What are we doing to gpu_cc_ahb_clk??
> 

I was marking this CRITICAL clock, but I checked the HW specs and it is 
always left ON from HW, so will remove it.

>> +       regmap_update_bits(regmap, 0x1078, 0x1, 0x1);
>> +
>> +       /* Configure clk_dis_wait for gpu_cx_gdsc */
>> +       regmap_update_bits(regmap, 0x106c, CLK_DIS_WAIT_MASK,
>> +                                               8 << CLK_DIS_WAIT_SHIFT);
>> +
>> +       return qcom_cc_really_probe(pdev, &gpu_cc_sc7180_desc, regmap);
>> +}
>> +
>> +static struct platform_driver gpu_cc_sc7180_driver = {
>> +       .probe = gpu_cc_sc7180_probe,
>> +       .driver = {
>> +               .name = "sc7180-gpucc",
>> +               .of_match_table = gpu_cc_sc7180_match_table,
>> +       },
>> +};
>> +
>> +static int __init gpu_cc_sc7180_init(void)
>> +{
>> +       return platform_driver_register(&gpu_cc_sc7180_driver);
>> +}
>> +core_initcall(gpu_cc_sc7180_init);
> 
> Does it need to be core initcal? Maybe module_platform_driver() works
> just as well?
> 

I will leave it to subsys_initcall.

>> +
>> +static void __exit gpu_cc_sc7180_exit(void)
>> +{
>> +       platform_driver_unregister(&gpu_cc_sc7180_driver);
>> +}
>> +module_exit(gpu_cc_sc7180_exit);
>> +
>> +MODULE_DESCRIPTION("QTI GPU_CC SC7180 Driver");
>> +MODULE_LICENSE("GPL v2");

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation.

--
