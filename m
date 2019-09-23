Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D01BDBAED3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Sep 2019 10:01:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2436692AbfIWIBc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 23 Sep 2019 04:01:32 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:37294 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2405289AbfIWIBc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 23 Sep 2019 04:01:32 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 6493F6076C; Mon, 23 Sep 2019 08:01:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1569225683;
        bh=P7fJDvceie+RFI6glkKtuaxMiXXj+YJo8DySA6+a2IE=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=ONwvaqUJiDXV9icvYgWUlIql4fVjZwTB/iIyf5Bv+LrvTdKffqiZymFAMVs3jO4BT
         hpmttXnzNJ6/7RptnQolZOupNTABSAzfiObNLoR9kSidIpig2197aPt1omLhZ0ON3w
         vn9JGG3JKjXHzZ2tgH52dBuOxx/Is1EILFppJCEs=
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
        by smtp.codeaurora.org (Postfix) with ESMTPSA id B29A66047C;
        Mon, 23 Sep 2019 08:01:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1569225677;
        bh=P7fJDvceie+RFI6glkKtuaxMiXXj+YJo8DySA6+a2IE=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=CjRE16yB/6yo17UGgUyfmkekVf+vvUMBFG9i3WaDTA1BrbXmqbvvUr+3ZnvKhA+wC
         qe68uhy5681fKntGPJZkDrtpJQ1FdXXXOwR36WwTakewwLl7S6bWAJ//k2j8lYELHZ
         yQOB6Qrxvs3/vAKXVJeh06Qz/XDHs14+3mfKbkdA=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org B29A66047C
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=tdas@codeaurora.org
Subject: Re: [PATCH v3 3/3] clk: qcom: Add Global Clock controller (GCC)
 driver for SC7180
To:     Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>, robh+dt@kernel.org
Cc:     David Brown <david.brown@linaro.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20190918095018.17979-1-tdas@codeaurora.org>
 <20190918095018.17979-4-tdas@codeaurora.org>
 <20190918213946.DC03521924@mail.kernel.org>
From:   Taniya Das <tdas@codeaurora.org>
Message-ID: <a3cd82c9-8bfa-f4a3-ab1f-2e397fbd9d16@codeaurora.org>
Date:   Mon, 23 Sep 2019 13:31:11 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20190918213946.DC03521924@mail.kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Stephen,

Thanks for your comments.

On 9/19/2019 3:09 AM, Stephen Boyd wrote:
> Quoting Taniya Das (2019-09-18 02:50:18)
>> diff --git a/drivers/clk/qcom/gcc-sc7180.c b/drivers/clk/qcom/gcc-sc7180.c
>> new file mode 100644
>> index 000000000000..d47865d5408f
>> --- /dev/null
>> +++ b/drivers/clk/qcom/gcc-sc7180.c
>> @@ -0,0 +1,2515 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * Copyright (c) 2019, The Linux Foundation. All rights reserved.
>> + */
>> +
>> +#include <linux/err.h>
>> +#include <linux/kernel.h>
>> +#include <linux/module.h>
>> +#include <linux/of.h>
>> +#include <linux/of_device.h>
>> +#include <linux/regmap.h>
> 
> include clk-provider.h
> 

will add this header.
Currently the <drivers/clk/qcom/clk-regmap.h> already includes it.

>> +
>> +#include <dt-bindings/clock/qcom,gcc-sc7180.h>
>> +
>> +#include "clk-alpha-pll.h"
>> +#include "clk-branch.h"
>> +#include "clk-rcg.h"
>> +#include "clk-regmap.h"
>> +#include "common.h"
>> +#include "gdsc.h"
>> +#include "reset.h"
>> +
>> +#define GCC_MMSS_MISC          0x09ffc
>> +#define GCC_NPU_MISC           0x4d110
>> +#define GCC_GPU_MISC           0x71028
>> +
>> +enum {
>> +       P_BI_TCXO,
>> +       P_CORE_BI_PLL_TEST_SE,
>> +       P_GPLL0_OUT_EVEN,
>> +       P_GPLL0_OUT_MAIN,
>> +       P_GPLL1_OUT_MAIN,
>> +       P_GPLL4_OUT_MAIN,
>> +       P_GPLL6_OUT_MAIN,
>> +       P_GPLL7_OUT_MAIN,
>> +       P_SLEEP_CLK,
>> +};
>> +
>> +static struct clk_alpha_pll gpll0 = {
>> +       .offset = 0x0,
>> +       .regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_FABIA],
>> +       .clkr = {
>> +               .enable_reg = 0x52010,
>> +               .enable_mask = BIT(0),
>> +               .hw.init = &(struct clk_init_data){
>> +                       .name = "gpll0",
>> +                       .parent_data = &(const struct clk_parent_data){
>> +                               .fw_name = "bi_tcxo",
>> +                               .name = "bi_tcxo",
>> +                       },
>> +                       .num_parents = 1,
>> +                       .ops = &clk_alpha_pll_fixed_fabia_ops,
>> +               },
>> +       },
>> +};
>> +
>> +static const struct clk_div_table post_div_table_gpll0_out_even[] = {
>> +       { 0x1, 2 },
>> +       { }
>> +};
>> +
>> +static struct clk_alpha_pll_postdiv gpll0_out_even = {
>> +       .offset = 0x0,
>> +       .post_div_shift = 8,
>> +       .post_div_table = post_div_table_gpll0_out_even,
>> +       .num_post_div = ARRAY_SIZE(post_div_table_gpll0_out_even),
>> +       .width = 4,
>> +       .regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_FABIA],
>> +       .clkr.hw.init = &(struct clk_init_data){
>> +               .name = "gpll0_out_even",
>> +               .parent_data = &(const struct clk_parent_data){
>> +                       .hw = &gpll0.clkr.hw,
>> +               },
>> +               .num_parents = 1,
>> +               .ops = &clk_alpha_pll_postdiv_fabia_ops,
>> +       },
>> +};
>> +
>> +static struct clk_fixed_factor gcc_pll0_main_div_cdiv = {
>> +       .mult = 1,
>> +       .div = 2,
>> +       .hw.init = &(struct clk_init_data){
>> +               .name = "gcc_pll0_main_div_cdiv",
>> +               .parent_data = &(const struct clk_parent_data){
>> +                       .hw = &gpll0.clkr.hw,
>> +               },
>> +               .num_parents = 1,
>> +               .ops = &clk_fixed_factor_ops,
>> +       },
>> +};
>> +
>> +static struct clk_alpha_pll gpll1 = {
>> +       .offset = 0x01000,
>> +       .regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_FABIA],
>> +       .clkr = {
>> +               .enable_reg = 0x52010,
>> +               .enable_mask = BIT(1),
>> +               .hw.init = &(struct clk_init_data){
>> +                       .name = "gpll1",
>> +                       .parent_data = &(const struct clk_parent_data){
>> +                               .fw_name = "bi_tcxo",
>> +                               .name = "bi_tcxo",
>> +                       },
>> +                       .num_parents = 1,
>> +                       .ops = &clk_alpha_pll_fixed_fabia_ops,
>> +               },
>> +       },
>> +};
>> +
>> +static struct clk_alpha_pll gpll4 = {
>> +       .offset = 0x76000,
>> +       .regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_FABIA],
>> +       .clkr = {
>> +               .enable_reg = 0x52010,
>> +               .enable_mask = BIT(4),
>> +               .hw.init = &(struct clk_init_data){
>> +                       .name = "gpll4",
>> +                       .parent_data = &(const struct clk_parent_data){
>> +                               .fw_name = "bi_tcxo",
>> +                               .name = "bi_tcxo",
>> +                       },
>> +                       .num_parents = 1,
>> +                       .ops = &clk_alpha_pll_fixed_fabia_ops,
>> +               },
>> +       },
>> +};
>> +
>> +static struct clk_alpha_pll gpll6 = {
>> +       .offset = 0x13000,
>> +       .regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_FABIA],
>> +       .clkr = {
>> +               .enable_reg = 0x52010,
>> +               .enable_mask = BIT(6),
>> +               .hw.init = &(struct clk_init_data){
>> +                       .name = "gpll6",
>> +                       .parent_data = &(const struct clk_parent_data){
>> +                               .fw_name = "bi_tcxo",
>> +                               .name = "bi_tcxo",
>> +                       },
>> +                       .num_parents = 1,
>> +                       .ops = &clk_alpha_pll_fixed_fabia_ops,
>> +               },
>> +       },
>> +};
>> +
>> +static struct clk_alpha_pll gpll7 = {
>> +       .offset = 0x27000,
>> +       .regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_FABIA],
>> +       .clkr = {
>> +               .enable_reg = 0x52010,
>> +               .enable_mask = BIT(7),
>> +               .hw.init = &(struct clk_init_data){
>> +                       .name = "gpll7",
>> +                       .parent_data = &(const struct clk_parent_data){
>> +                               .fw_name = "bi_tcxo",
>> +                               .name = "bi_tcxo",
>> +                       },
>> +                       .num_parents = 1,
>> +                       .ops = &clk_alpha_pll_fixed_fabia_ops,
>> +               },
>> +       },
>> +};
>> +
>> +static const struct parent_map gcc_parent_map_0[] = {
>> +       { P_BI_TCXO, 0 },
>> +       { P_GPLL0_OUT_MAIN, 1 },
>> +       { P_GPLL0_OUT_EVEN, 6 },
>> +       { P_CORE_BI_PLL_TEST_SE, 7 },
>> +};
>> +
>> +static const struct clk_parent_data gcc_parent_data_0[] = {
>> +       { .fw_name = "bi_tcxo", .name = "bi_tcxo" },
>> +       { .hw = &gpll0.clkr.hw },
>> +       { .hw = &gpll0_out_even.clkr.hw },
>> +       { .fw_name = "core_bi_pll_test_se", .name = "core_bi_pll_test_se" },
>> +};
>> +
>> +static const struct clk_parent_data gcc_parent_data_0_ao[] = {
>> +       { .fw_name = "bi_tcxo_ao", .name = "bi_tcxo_ao" },
>> +       { .hw = &gpll0.clkr.hw },
>> +       { .hw = &gpll0_out_even.clkr.hw },
>> +       { .fw_name = "core_bi_pll_test_se", .name = "core_bi_pll_test_se" },
>> +};
>> +
>> +static const struct parent_map gcc_parent_map_1[] = {
>> +       { P_BI_TCXO, 0 },
>> +       { P_GPLL0_OUT_MAIN, 1 },
>> +       { P_GPLL6_OUT_MAIN, 2 },
>> +       { P_GPLL0_OUT_EVEN, 6 },
>> +       { P_CORE_BI_PLL_TEST_SE, 7 },
>> +};
>> +
>> +static const struct clk_parent_data gcc_parent_data_1[] = {
>> +       { .fw_name = "bi_tcxo", .name = "bi_tcxo" },
>> +       { .hw = &gpll0.clkr.hw },
>> +       { .hw = &gpll6.clkr.hw },
>> +       { .hw = &gpll0_out_even.clkr.hw },
>> +       { .fw_name = "core_bi_pll_test_se", .name = "core_bi_pll_test_se" },
>> +};
>> +
>> +static const struct parent_map gcc_parent_map_2[] = {
>> +       { P_BI_TCXO, 0 },
>> +       { P_GPLL0_OUT_MAIN, 1 },
>> +       { P_GPLL1_OUT_MAIN, 4 },
>> +       { P_GPLL4_OUT_MAIN, 5 },
>> +       { P_GPLL0_OUT_EVEN, 6 },
>> +       { P_CORE_BI_PLL_TEST_SE, 7 },
>> +};
>> +
>> +static const struct clk_parent_data gcc_parent_data_2[] = {
>> +       { .fw_name = "bi_tcxo", .name = "bi_tcxo" },
>> +       { .hw = &gpll0.clkr.hw },
>> +       { .hw = &gpll1.clkr.hw },
>> +       { .hw = &gpll4.clkr.hw },
>> +       { .hw = &gpll0_out_even.clkr.hw },
>> +       { .fw_name = "core_bi_pll_test_se", .name = "core_bi_pll_test_se" },
>> +};
>> +
>> +static const struct parent_map gcc_parent_map_3[] = {
>> +       { P_BI_TCXO, 0 },
>> +       { P_GPLL0_OUT_MAIN, 1 },
>> +       { P_CORE_BI_PLL_TEST_SE, 7 },
>> +};
>> +
>> +static const struct clk_parent_data gcc_parent_data_3[] = {
>> +       { .fw_name = "bi_tcxo", .name = "bi_tcxo" },
>> +       { .hw = &gpll0.clkr.hw },
>> +       { .fw_name = "core_bi_pll_test_se", .name = "core_bi_pll_test_se" },
>> +};
>> +
>> +static const struct parent_map gcc_parent_map_4[] = {
>> +       { P_BI_TCXO, 0 },
>> +       { P_GPLL0_OUT_MAIN, 1 },
>> +       { P_SLEEP_CLK, 5 },
>> +       { P_GPLL0_OUT_EVEN, 6 },
>> +       { P_CORE_BI_PLL_TEST_SE, 7 },
>> +};
>> +
>> +static const struct clk_parent_data gcc_parent_data_4[] = {
>> +       { .fw_name = "bi_tcxo", .name = "bi_tcxo" },
>> +       { .hw = &gpll0.clkr.hw },
>> +       { .fw_name = "sleep_clk", .name = "sleep_clk" },
>> +       { .hw = &gpll0_out_even.clkr.hw },
>> +       { .fw_name = "core_bi_pll_test_se", .name = "core_bi_pll_test_se" },
>> +};
>> +
>> +static const struct parent_map gcc_parent_map_5[] = {
>> +       { P_BI_TCXO, 0 },
>> +       { P_GPLL0_OUT_MAIN, 1 },
>> +       { P_GPLL7_OUT_MAIN, 3 },
>> +       { P_GPLL0_OUT_EVEN, 6 },
>> +       { P_CORE_BI_PLL_TEST_SE, 7 },
>> +};
>> +
>> +static const struct clk_parent_data gcc_parent_data_5[] = {
>> +       { .fw_name = "bi_tcxo", .name = "bi_tcxo" },
>> +       { .hw = &gpll0.clkr.hw },
>> +       { .hw = &gpll7.clkr.hw },
>> +       { .hw = &gpll0_out_even.clkr.hw },
>> +       { .fw_name = "core_bi_pll_test_se", .name = "core_bi_pll_test_se" },
>> +};
>> +
>> +static const struct parent_map gcc_parent_map_6[] = {
>> +       { P_BI_TCXO, 0 },
>> +       { P_GPLL0_OUT_MAIN, 1 },
>> +       { P_SLEEP_CLK, 5 },
>> +       { P_CORE_BI_PLL_TEST_SE, 7 },
>> +};
>> +
>> +static const struct clk_parent_data gcc_parent_data_6[] = {
>> +       { .fw_name = "bi_tcxo", .name = "bi_tcxo" },
>> +       { .hw = &gpll0.clkr.hw },
>> +       { .fw_name = "sleep_clk", .name = "sleep_clk" },
>> +       { .fw_name = "core_bi_pll_test_se", .name = "core_bi_pll_test_se" },
>> +};
>> +
>> +static const struct freq_tbl ftbl_gcc_cpuss_ahb_clk_src[] = {
>> +       F(19200000, P_BI_TCXO, 1, 0, 0),
>> +       { }
>> +};
>> +
>> +static struct clk_rcg2 gcc_cpuss_ahb_clk_src = {
>> +       .cmd_rcgr = 0x48014,
>> +       .mnd_width = 0,
>> +       .hid_width = 5,
>> +       .parent_map = gcc_parent_map_0,
>> +       .freq_tbl = ftbl_gcc_cpuss_ahb_clk_src,
>> +       .clkr.hw.init = &(struct clk_init_data){
>> +               .name = "gcc_cpuss_ahb_clk_src",
>> +               .parent_data = gcc_parent_data_0_ao,
>> +               .num_parents = 4,
>> +               .flags = CLK_SET_RATE_PARENT,
> 
> Is this supposed to have CLK_SET_RATE_PARENT set? The only parent is XO
> that's fixed rate.
> 

This will be removed.

>> +               .ops = &clk_rcg2_ops,
>> +               },
> 
> Weird tab here.
> 
>> +};
>> +
>> +static const struct freq_tbl ftbl_gcc_gp1_clk_src[] = {
>> +       F(19200000, P_BI_TCXO, 1, 0, 0),
>> +       F(25000000, P_GPLL0_OUT_EVEN, 12, 0, 0),
>> +       F(50000000, P_GPLL0_OUT_EVEN, 6, 0, 0),
>> +       F(100000000, P_GPLL0_OUT_EVEN, 3, 0, 0),
>> +       F(200000000, P_GPLL0_OUT_EVEN, 1.5, 0, 0),
>> +       { }
>> +};
>> +
>> +static struct clk_rcg2 gcc_gp1_clk_src = {
>> +       .cmd_rcgr = 0x64004,
>> +       .mnd_width = 8,
>> +       .hid_width = 5,
>> +       .parent_map = gcc_parent_map_4,
>> +       .freq_tbl = ftbl_gcc_gp1_clk_src,
>> +       .clkr.hw.init = &(struct clk_init_data){
>> +               .name = "gcc_gp1_clk_src",
>> +               .parent_data = gcc_parent_data_4,
>> +               .num_parents = 5,
>> +               .ops = &clk_rcg2_ops,
>> +       },
>> +};
>> +
>> +static struct clk_rcg2 gcc_gp2_clk_src = {
>> +       .cmd_rcgr = 0x65004,
>> +       .mnd_width = 8,
>> +       .hid_width = 5,
>> +       .parent_map = gcc_parent_map_4,
>> +       .freq_tbl = ftbl_gcc_gp1_clk_src,
>> +       .clkr.hw.init = &(struct clk_init_data){
>> +               .name = "gcc_gp2_clk_src",
>> +               .parent_data = gcc_parent_data_4,
>> +               .num_parents = 5,
>> +               .ops = &clk_rcg2_ops,
>> +       },
>> +};
>> +
>> +static struct clk_rcg2 gcc_gp3_clk_src = {
>> +       .cmd_rcgr = 0x66004,
>> +       .mnd_width = 8,
>> +       .hid_width = 5,
>> +       .parent_map = gcc_parent_map_4,
>> +       .freq_tbl = ftbl_gcc_gp1_clk_src,
>> +       .clkr.hw.init = &(struct clk_init_data){
>> +               .name = "gcc_gp3_clk_src",
>> +               .parent_data = gcc_parent_data_4,
>> +               .num_parents = 5,
>> +               .ops = &clk_rcg2_ops,
>> +       },
>> +};
>> +
>> +static const struct freq_tbl ftbl_gcc_pdm2_clk_src[] = {
>> +       F(19200000, P_BI_TCXO, 1, 0, 0),
>> +       F(60000000, P_GPLL0_OUT_EVEN, 5, 0, 0),
>> +       { }
>> +};
>> +
>> +static struct clk_rcg2 gcc_pdm2_clk_src = {
>> +       .cmd_rcgr = 0x33010,
>> +       .mnd_width = 0,
>> +       .hid_width = 5,
>> +       .parent_map = gcc_parent_map_0,
>> +       .freq_tbl = ftbl_gcc_pdm2_clk_src,
>> +       .clkr.hw.init = &(struct clk_init_data){
>> +               .name = "gcc_pdm2_clk_src",
>> +               .parent_data = gcc_parent_data_0,
>> +               .num_parents = 4,
>> +               .ops = &clk_rcg2_ops,
>> +       },
>> +};
>> +
>> +static const struct freq_tbl ftbl_gcc_qspi_core_clk_src[] = {
>> +       F(75000000, P_GPLL0_OUT_EVEN, 4, 0, 0),
>> +       F(150000000, P_GPLL0_OUT_EVEN, 2, 0, 0),
>> +       F(300000000, P_GPLL0_OUT_EVEN, 1, 0, 0),
>> +       { }
>> +};
>> +
>> +static struct clk_rcg2 gcc_qspi_core_clk_src = {
>> +       .cmd_rcgr = 0x4b00c,
>> +       .mnd_width = 0,
>> +       .hid_width = 5,
>> +       .parent_map = gcc_parent_map_2,
>> +       .freq_tbl = ftbl_gcc_qspi_core_clk_src,
>> +       .clkr.hw.init = &(struct clk_init_data){
>> +               .name = "gcc_qspi_core_clk_src",
>> +               .parent_data = gcc_parent_data_2,
>> +               .num_parents = 6,
>> +               .ops = &clk_rcg2_ops,
>> +       },
>> +};
>> +
>> +static const struct freq_tbl ftbl_gcc_qupv3_wrap0_s0_clk_src[] = {
>> +       F(7372800, P_GPLL0_OUT_EVEN, 1, 384, 15625),
>> +       F(14745600, P_GPLL0_OUT_EVEN, 1, 768, 15625),
>> +       F(19200000, P_BI_TCXO, 1, 0, 0),
>> +       F(29491200, P_GPLL0_OUT_EVEN, 1, 1536, 15625),
>> +       F(32000000, P_GPLL0_OUT_EVEN, 1, 8, 75),
>> +       F(48000000, P_GPLL0_OUT_EVEN, 1, 4, 25),
>> +       F(64000000, P_GPLL0_OUT_EVEN, 1, 16, 75),
>> +       F(75000000, P_GPLL0_OUT_EVEN, 4, 0, 0),
>> +       F(80000000, P_GPLL0_OUT_EVEN, 1, 4, 15),
>> +       F(96000000, P_GPLL0_OUT_EVEN, 1, 8, 25),
>> +       F(100000000, P_GPLL0_OUT_EVEN, 3, 0, 0),
>> +       F(102400000, P_GPLL0_OUT_EVEN, 1, 128, 375),
>> +       F(112000000, P_GPLL0_OUT_EVEN, 1, 28, 75),
>> +       F(117964800, P_GPLL0_OUT_EVEN, 1, 6144, 15625),
>> +       F(120000000, P_GPLL0_OUT_EVEN, 2.5, 0, 0),
>> +       F(128000000, P_GPLL6_OUT_MAIN, 3, 0, 0),
>> +       { }
>> +};
>> +
>> +static struct clk_init_data gcc_qupv3_wrap0_s0_clk_src_init = {
>> +       .name = "gcc_qupv3_wrap0_s0_clk_src",
>> +       .parent_data = gcc_parent_data_0,
>> +       .num_parents = 4,
>> +       .ops = &clk_rcg2_ops,
>> +};
>> +
>> +static struct clk_rcg2 gcc_qupv3_wrap0_s0_clk_src = {
>> +       .cmd_rcgr = 0x17034,
>> +       .mnd_width = 16,
>> +       .hid_width = 5,
>> +       .parent_map = gcc_parent_map_0,
>> +       .freq_tbl = ftbl_gcc_qupv3_wrap0_s0_clk_src,
>> +       .clkr.hw.init = &gcc_qupv3_wrap0_s0_clk_src_init,
>> +};
>> +
>> +static struct clk_init_data gcc_qupv3_wrap0_s1_clk_src_init = {
>> +       .name = "gcc_qupv3_wrap0_s1_clk_src",
>> +       .parent_data = gcc_parent_data_0,
>> +       .num_parents = 4,
>> +       .ops = &clk_rcg2_ops,
>> +};
>> +
>> +static struct clk_rcg2 gcc_qupv3_wrap0_s1_clk_src = {
>> +       .cmd_rcgr = 0x17164,
>> +       .mnd_width = 16,
>> +       .hid_width = 5,
>> +       .parent_map = gcc_parent_map_0,
>> +       .freq_tbl = ftbl_gcc_qupv3_wrap0_s0_clk_src,
>> +       .clkr.hw.init = &gcc_qupv3_wrap0_s1_clk_src_init,
>> +};
>> +
>> +static struct clk_init_data gcc_qupv3_wrap0_s2_clk_src_init = {
>> +       .name = "gcc_qupv3_wrap0_s2_clk_src",
>> +       .parent_data = gcc_parent_data_0,
>> +       .num_parents = 4,
>> +       .ops = &clk_rcg2_ops,
>> +};
>> +
>> +static struct clk_rcg2 gcc_qupv3_wrap0_s2_clk_src = {
>> +       .cmd_rcgr = 0x17294,
>> +       .mnd_width = 16,
>> +       .hid_width = 5,
>> +       .parent_map = gcc_parent_map_0,
>> +       .freq_tbl = ftbl_gcc_qupv3_wrap0_s0_clk_src,
>> +       .clkr.hw.init = &gcc_qupv3_wrap0_s2_clk_src_init,
>> +};
>> +
>> +static struct clk_init_data gcc_qupv3_wrap0_s3_clk_src_init = {
>> +       .name = "gcc_qupv3_wrap0_s3_clk_src",
>> +       .parent_data = gcc_parent_data_0,
>> +       .num_parents = 4,
>> +       .ops = &clk_rcg2_ops,
>> +};
>> +
>> +static struct clk_rcg2 gcc_qupv3_wrap0_s3_clk_src = {
>> +       .cmd_rcgr = 0x173c4,
>> +       .mnd_width = 16,
>> +       .hid_width = 5,
>> +       .parent_map = gcc_parent_map_0,
>> +       .freq_tbl = ftbl_gcc_qupv3_wrap0_s0_clk_src,
>> +       .clkr.hw.init = &gcc_qupv3_wrap0_s3_clk_src_init,
>> +};
>> +
>> +static struct clk_init_data gcc_qupv3_wrap0_s4_clk_src_init = {
>> +       .name = "gcc_qupv3_wrap0_s4_clk_src",
>> +       .parent_data = gcc_parent_data_0,
>> +       .num_parents = 4,
>> +       .ops = &clk_rcg2_ops,
>> +};
>> +
>> +static struct clk_rcg2 gcc_qupv3_wrap0_s4_clk_src = {
>> +       .cmd_rcgr = 0x174f4,
>> +       .mnd_width = 16,
>> +       .hid_width = 5,
>> +       .parent_map = gcc_parent_map_0,
>> +       .freq_tbl = ftbl_gcc_qupv3_wrap0_s0_clk_src,
>> +       .clkr.hw.init = &gcc_qupv3_wrap0_s4_clk_src_init,
>> +};
>> +
>> +static struct clk_init_data gcc_qupv3_wrap0_s5_clk_src_init = {
>> +       .name = "gcc_qupv3_wrap0_s5_clk_src",
>> +       .parent_data = gcc_parent_data_0,
>> +       .num_parents = 4,
>> +       .ops = &clk_rcg2_ops,
>> +};
>> +
>> +static struct clk_rcg2 gcc_qupv3_wrap0_s5_clk_src = {
>> +       .cmd_rcgr = 0x17624,
>> +       .mnd_width = 16,
>> +       .hid_width = 5,
>> +       .parent_map = gcc_parent_map_0,
>> +       .freq_tbl = ftbl_gcc_qupv3_wrap0_s0_clk_src,
>> +       .clkr.hw.init = &gcc_qupv3_wrap0_s5_clk_src_init,
>> +};
>> +
>> +static struct clk_init_data gcc_qupv3_wrap1_s0_clk_src_init = {
>> +       .name = "gcc_qupv3_wrap1_s0_clk_src",
>> +       .parent_data = gcc_parent_data_0,
>> +       .num_parents = 4,
>> +       .ops = &clk_rcg2_ops,
>> +};
>> +
>> +static struct clk_rcg2 gcc_qupv3_wrap1_s0_clk_src = {
>> +       .cmd_rcgr = 0x18018,
>> +       .mnd_width = 16,
>> +       .hid_width = 5,
>> +       .parent_map = gcc_parent_map_0,
>> +       .freq_tbl = ftbl_gcc_qupv3_wrap0_s0_clk_src,
>> +       .clkr.hw.init = &gcc_qupv3_wrap1_s0_clk_src_init,
>> +};
>> +
>> +static struct clk_init_data gcc_qupv3_wrap1_s1_clk_src_init = {
>> +       .name = "gcc_qupv3_wrap1_s1_clk_src",
>> +       .parent_data = gcc_parent_data_0,
>> +       .num_parents = 4,
>> +       .ops = &clk_rcg2_ops,
>> +};
>> +
>> +static struct clk_rcg2 gcc_qupv3_wrap1_s1_clk_src = {
>> +       .cmd_rcgr = 0x18148,
>> +       .mnd_width = 16,
>> +       .hid_width = 5,
>> +       .parent_map = gcc_parent_map_0,
>> +       .freq_tbl = ftbl_gcc_qupv3_wrap0_s0_clk_src,
>> +       .clkr.hw.init = &gcc_qupv3_wrap1_s1_clk_src_init,
>> +};
>> +
>> +static struct clk_init_data gcc_qupv3_wrap1_s2_clk_src_init = {
>> +       .name = "gcc_qupv3_wrap1_s2_clk_src",
>> +       .parent_data = gcc_parent_data_0,
>> +       .num_parents = 4,
>> +       .ops = &clk_rcg2_ops,
>> +};
>> +
>> +static struct clk_rcg2 gcc_qupv3_wrap1_s2_clk_src = {
>> +       .cmd_rcgr = 0x18278,
>> +       .mnd_width = 16,
>> +       .hid_width = 5,
>> +       .parent_map = gcc_parent_map_0,
>> +       .freq_tbl = ftbl_gcc_qupv3_wrap0_s0_clk_src,
>> +       .clkr.hw.init = &gcc_qupv3_wrap1_s2_clk_src_init,
>> +};
>> +
>> +static struct clk_init_data gcc_qupv3_wrap1_s3_clk_src_init = {
>> +       .name = "gcc_qupv3_wrap1_s3_clk_src",
>> +       .parent_data = gcc_parent_data_0,
>> +       .num_parents = 4,
>> +       .ops = &clk_rcg2_ops,
>> +};
>> +
>> +static struct clk_rcg2 gcc_qupv3_wrap1_s3_clk_src = {
>> +       .cmd_rcgr = 0x183a8,
>> +       .mnd_width = 16,
>> +       .hid_width = 5,
>> +       .parent_map = gcc_parent_map_0,
>> +       .freq_tbl = ftbl_gcc_qupv3_wrap0_s0_clk_src,
>> +       .clkr.hw.init = &gcc_qupv3_wrap1_s3_clk_src_init,
>> +};
>> +
>> +static struct clk_init_data gcc_qupv3_wrap1_s4_clk_src_init = {
>> +       .name = "gcc_qupv3_wrap1_s4_clk_src",
>> +       .parent_data = gcc_parent_data_0,
>> +       .num_parents = 4,
>> +       .ops = &clk_rcg2_ops,
>> +};
>> +
>> +static struct clk_rcg2 gcc_qupv3_wrap1_s4_clk_src = {
>> +       .cmd_rcgr = 0x184d8,
>> +       .mnd_width = 16,
>> +       .hid_width = 5,
>> +       .parent_map = gcc_parent_map_0,
>> +       .freq_tbl = ftbl_gcc_qupv3_wrap0_s0_clk_src,
>> +       .clkr.hw.init = &gcc_qupv3_wrap1_s4_clk_src_init,
>> +};
>> +
>> +static struct clk_init_data gcc_qupv3_wrap1_s5_clk_src_init = {
>> +       .name = "gcc_qupv3_wrap1_s5_clk_src",
>> +       .parent_data = gcc_parent_data_0,
>> +       .num_parents = 4,
>> +       .ops = &clk_rcg2_ops,
>> +};
>> +
>> +static struct clk_rcg2 gcc_qupv3_wrap1_s5_clk_src = {
>> +       .cmd_rcgr = 0x18608,
>> +       .mnd_width = 16,
>> +       .hid_width = 5,
>> +       .parent_map = gcc_parent_map_0,
>> +       .freq_tbl = ftbl_gcc_qupv3_wrap0_s0_clk_src,
>> +       .clkr.hw.init = &gcc_qupv3_wrap1_s5_clk_src_init,
>> +};
>> +
>> +
>> +static const struct freq_tbl ftbl_gcc_sdcc1_apps_clk_src[] = {
>> +       F(144000, P_BI_TCXO, 16, 3, 25),
>> +       F(400000, P_BI_TCXO, 12, 1, 4),
>> +       F(19200000, P_BI_TCXO, 1, 0, 0),
>> +       F(20000000, P_GPLL0_OUT_EVEN, 5, 1, 3),
>> +       F(25000000, P_GPLL0_OUT_EVEN, 6, 1, 2),
>> +       F(50000000, P_GPLL0_OUT_EVEN, 6, 0, 0),
>> +       F(100000000, P_GPLL0_OUT_EVEN, 3, 0, 0),
>> +       F(192000000, P_GPLL6_OUT_MAIN, 2, 0, 0),
>> +       F(384000000, P_GPLL6_OUT_MAIN, 1, 0, 0),
>> +       { }
>> +};
>> +
>> +static struct clk_rcg2 gcc_sdcc1_apps_clk_src = {
>> +       .cmd_rcgr = 0x12028,
>> +       .mnd_width = 8,
>> +       .hid_width = 5,
>> +       .parent_map = gcc_parent_map_1,
>> +       .freq_tbl = ftbl_gcc_sdcc1_apps_clk_src,
>> +       .clkr.hw.init = &(struct clk_init_data){
>> +               .name = "gcc_sdcc1_apps_clk_src",
>> +               .parent_data = gcc_parent_data_1,
>> +               .num_parents = 5,
>> +               .ops = &clk_rcg2_ops,
>> +       },
>> +};
>> +
>> +static const struct freq_tbl ftbl_gcc_sdcc1_ice_core_clk_src[] = {
>> +       F(100000000, P_GPLL0_OUT_EVEN, 3, 0, 0),
>> +       F(150000000, P_GPLL0_OUT_EVEN, 2, 0, 0),
>> +       F(200000000, P_GPLL0_OUT_MAIN, 3, 0, 0),
>> +       F(300000000, P_GPLL0_OUT_EVEN, 1, 0, 0),
>> +       { }
>> +};
>> +
>> +static struct clk_rcg2 gcc_sdcc1_ice_core_clk_src = {
>> +       .cmd_rcgr = 0x12010,
>> +       .mnd_width = 0,
>> +       .hid_width = 5,
>> +       .parent_map = gcc_parent_map_0,
>> +       .freq_tbl = ftbl_gcc_sdcc1_ice_core_clk_src,
>> +       .clkr.hw.init = &(struct clk_init_data){
>> +               .name = "gcc_sdcc1_ice_core_clk_src",
>> +               .parent_data = gcc_parent_data_0,
>> +               .num_parents = 4,
>> +               .ops = &clk_rcg2_ops,
>> +       },
>> +};
>> +
>> +static const struct freq_tbl ftbl_gcc_sdcc2_apps_clk_src[] = {
>> +       F(400000, P_BI_TCXO, 12, 1, 4),
>> +       F(9600000, P_BI_TCXO, 2, 0, 0),
>> +       F(19200000, P_BI_TCXO, 1, 0, 0),
>> +       F(25000000, P_GPLL0_OUT_EVEN, 12, 0, 0),
>> +       F(100000000, P_GPLL0_OUT_EVEN, 3, 0, 0),
>> +       F(202000000, P_GPLL7_OUT_MAIN, 4, 0, 0),
>> +       { }
>> +};
>> +
>> +static struct clk_rcg2 gcc_sdcc2_apps_clk_src = {
>> +       .cmd_rcgr = 0x1400c,
>> +       .mnd_width = 8,
>> +       .hid_width = 5,
>> +       .parent_map = gcc_parent_map_5,
>> +       .freq_tbl = ftbl_gcc_sdcc2_apps_clk_src,
>> +       .clkr.hw.init = &(struct clk_init_data){
>> +               .name = "gcc_sdcc2_apps_clk_src",
>> +               .parent_data = gcc_parent_data_5,
>> +               .num_parents = 5,
>> +               .ops = &clk_rcg2_ops,
>> +       },
>> +};
>> +
>> +static const struct freq_tbl ftbl_gcc_ufs_phy_axi_clk_src[] = {
>> +       F(25000000, P_GPLL0_OUT_EVEN, 12, 0, 0),
>> +       F(50000000, P_GPLL0_OUT_EVEN, 6, 0, 0),
>> +       F(100000000, P_GPLL0_OUT_EVEN, 3, 0, 0),
>> +       F(200000000, P_GPLL0_OUT_MAIN, 3, 0, 0),
>> +       F(240000000, P_GPLL0_OUT_MAIN, 2.5, 0, 0),
>> +       { }
>> +};
>> +
>> +static struct clk_rcg2 gcc_ufs_phy_axi_clk_src = {
>> +       .cmd_rcgr = 0x77020,
>> +       .mnd_width = 8,
>> +       .hid_width = 5,
>> +       .parent_map = gcc_parent_map_0,
>> +       .freq_tbl = ftbl_gcc_ufs_phy_axi_clk_src,
>> +       .clkr.hw.init = &(struct clk_init_data){
>> +               .name = "gcc_ufs_phy_axi_clk_src",
>> +               .parent_data = gcc_parent_data_0,
>> +               .num_parents = 4,
>> +               .ops = &clk_rcg2_ops,
>> +       },
>> +};
>> +
>> +static const struct freq_tbl ftbl_gcc_ufs_phy_ice_core_clk_src[] = {
>> +       F(37500000, P_GPLL0_OUT_EVEN, 8, 0, 0),
>> +       F(75000000, P_GPLL0_OUT_EVEN, 4, 0, 0),
>> +       F(150000000, P_GPLL0_OUT_EVEN, 2, 0, 0),
>> +       F(300000000, P_GPLL0_OUT_EVEN, 1, 0, 0),
>> +       { }
>> +};
>> +
>> +static struct clk_rcg2 gcc_ufs_phy_ice_core_clk_src = {
>> +       .cmd_rcgr = 0x77048,
>> +       .mnd_width = 0,
>> +       .hid_width = 5,
>> +       .parent_map = gcc_parent_map_0,
>> +       .freq_tbl = ftbl_gcc_ufs_phy_ice_core_clk_src,
>> +       .clkr.hw.init = &(struct clk_init_data){
>> +               .name = "gcc_ufs_phy_ice_core_clk_src",
>> +               .parent_data = gcc_parent_data_0,
>> +               .num_parents = 4,
>> +               .ops = &clk_rcg2_ops,
>> +       },
>> +};
>> +
>> +static const struct freq_tbl ftbl_gcc_ufs_phy_phy_aux_clk_src[] = {
>> +       F(9600000, P_BI_TCXO, 2, 0, 0),
>> +       F(19200000, P_BI_TCXO, 1, 0, 0),
>> +       { }
>> +};
>> +
>> +static struct clk_rcg2 gcc_ufs_phy_phy_aux_clk_src = {
>> +       .cmd_rcgr = 0x77098,
>> +       .mnd_width = 0,
>> +       .hid_width = 5,
>> +       .parent_map = gcc_parent_map_3,
>> +       .freq_tbl = ftbl_gcc_ufs_phy_phy_aux_clk_src,
>> +       .clkr.hw.init = &(struct clk_init_data){
>> +               .name = "gcc_ufs_phy_phy_aux_clk_src",
>> +               .parent_data = gcc_parent_data_3,
>> +               .num_parents = 3,
>> +               .ops = &clk_rcg2_ops,
>> +       },
>> +};
>> +
>> +static const struct freq_tbl ftbl_gcc_ufs_phy_unipro_core_clk_src[] = {
>> +       F(37500000, P_GPLL0_OUT_EVEN, 8, 0, 0),
>> +       F(75000000, P_GPLL0_OUT_EVEN, 4, 0, 0),
>> +       F(150000000, P_GPLL0_OUT_EVEN, 2, 0, 0),
>> +       { }
>> +};
>> +
>> +static struct clk_rcg2 gcc_ufs_phy_unipro_core_clk_src = {
>> +       .cmd_rcgr = 0x77060,
>> +       .mnd_width = 0,
>> +       .hid_width = 5,
>> +       .parent_map = gcc_parent_map_0,
>> +       .freq_tbl = ftbl_gcc_ufs_phy_unipro_core_clk_src,
>> +       .clkr.hw.init = &(struct clk_init_data){
>> +               .name = "gcc_ufs_phy_unipro_core_clk_src",
>> +               .parent_data = gcc_parent_data_0,
>> +               .num_parents = 4,
>> +               .ops = &clk_rcg2_ops,
>> +       },
>> +};
>> +
>> +static const struct freq_tbl ftbl_gcc_usb30_prim_master_clk_src[] = {
>> +       F(66666667, P_GPLL0_OUT_EVEN, 4.5, 0, 0),
>> +       F(133333333, P_GPLL0_OUT_MAIN, 4.5, 0, 0),
>> +       F(200000000, P_GPLL0_OUT_MAIN, 3, 0, 0),
>> +       F(240000000, P_GPLL0_OUT_MAIN, 2.5, 0, 0),
>> +       { }
>> +};
>> +
>> +static struct clk_rcg2 gcc_usb30_prim_master_clk_src = {
>> +       .cmd_rcgr = 0xf01c,
>> +       .mnd_width = 8,
>> +       .hid_width = 5,
>> +       .parent_map = gcc_parent_map_0,
>> +       .freq_tbl = ftbl_gcc_usb30_prim_master_clk_src,
>> +       .clkr.hw.init = &(struct clk_init_data){
>> +               .name = "gcc_usb30_prim_master_clk_src",
>> +               .parent_data = gcc_parent_data_0,
>> +               .num_parents = 4,
>> +               .ops = &clk_rcg2_ops,
>> +       },
>> +};
>> +
>> +static const struct freq_tbl ftbl_gcc_usb30_prim_mock_utmi_clk_src[] = {
>> +       F(19200000, P_BI_TCXO, 1, 0, 0),
>> +       F(20000000, P_GPLL0_OUT_EVEN, 15, 0, 0),
>> +       { }
>> +};
>> +
>> +static struct clk_rcg2 gcc_usb30_prim_mock_utmi_clk_src = {
>> +       .cmd_rcgr = 0xf034,
>> +       .mnd_width = 0,
>> +       .hid_width = 5,
>> +       .parent_map = gcc_parent_map_0,
>> +       .freq_tbl = ftbl_gcc_usb30_prim_mock_utmi_clk_src,
>> +       .clkr.hw.init = &(struct clk_init_data){
>> +               .name = "gcc_usb30_prim_mock_utmi_clk_src",
>> +               .parent_data = gcc_parent_data_0,
>> +               .num_parents = 4,
>> +               .ops = &clk_rcg2_ops,
>> +       },
>> +};
>> +
>> +static const struct freq_tbl ftbl_gcc_usb3_prim_phy_aux_clk_src[] = {
>> +       F(19200000, P_BI_TCXO, 1, 0, 0),
>> +       { }
>> +};
>> +
>> +static struct clk_rcg2 gcc_usb3_prim_phy_aux_clk_src = {
>> +       .cmd_rcgr = 0xf060,
>> +       .mnd_width = 0,
>> +       .hid_width = 5,
>> +       .parent_map = gcc_parent_map_6,
>> +       .freq_tbl = ftbl_gcc_usb3_prim_phy_aux_clk_src,
>> +       .clkr.hw.init = &(struct clk_init_data){
>> +               .name = "gcc_usb3_prim_phy_aux_clk_src",
>> +               .parent_data = gcc_parent_data_6,
>> +               .num_parents = 4,
>> +               .ops = &clk_rcg2_ops,
>> +       },
>> +};
>> +
>> +static struct clk_branch gcc_aggre_ufs_phy_axi_clk = {
>> +       .halt_reg = 0x82024,
>> +       .halt_check = BRANCH_HALT_DELAY,
>> +       .hwcg_reg = 0x82024,
>> +       .hwcg_bit = 1,
>> +       .clkr = {
>> +               .enable_reg = 0x82024,
>> +               .enable_mask = BIT(0),
>> +               .hw.init = &(struct clk_init_data){
>> +                       .name = "gcc_aggre_ufs_phy_axi_clk",
>> +                       .parent_data = &(const struct clk_parent_data){
>> +                               .hw = &gcc_ufs_phy_axi_clk_src.clkr.hw,
>> +                       },
>> +                       .num_parents = 1,
>> +                       .flags = CLK_SET_RATE_PARENT,
>> +                       .ops = &clk_branch2_ops,
>> +               },
>> +       },
>> +};
>> +
>> +static struct clk_branch gcc_aggre_usb3_prim_axi_clk = {
>> +       .halt_reg = 0x8201c,
>> +       .halt_check = BRANCH_HALT,
>> +       .clkr = {
>> +               .enable_reg = 0x8201c,
>> +               .enable_mask = BIT(0),
>> +               .hw.init = &(struct clk_init_data){
>> +                       .name = "gcc_aggre_usb3_prim_axi_clk",
>> +                       .parent_data = &(const struct clk_parent_data){
>> +                               .hw = &gcc_usb30_prim_master_clk_src.clkr.hw,
>> +                       },
>> +                       .num_parents = 1,
>> +                       .flags = CLK_SET_RATE_PARENT,
>> +                       .ops = &clk_branch2_ops,
>> +               },
>> +       },
>> +};
>> +
>> +static struct clk_branch gcc_boot_rom_ahb_clk = {
>> +       .halt_reg = 0x38004,
>> +       .halt_check = BRANCH_HALT_VOTED,
>> +       .hwcg_reg = 0x38004,
>> +       .hwcg_bit = 1,
>> +       .clkr = {
>> +               .enable_reg = 0x52000,
>> +               .enable_mask = BIT(10),
>> +               .hw.init = &(struct clk_init_data){
>> +                       .name = "gcc_boot_rom_ahb_clk",
>> +                       .ops = &clk_branch2_ops,
>> +               },
>> +       },
>> +};
>> +
>> +static struct clk_branch gcc_camera_ahb_clk = {
>> +       .halt_reg = 0xb008,
>> +       .halt_check = BRANCH_HALT,
>> +       .hwcg_reg = 0xb008,
>> +       .hwcg_bit = 1,
>> +       .clkr = {
>> +               .enable_reg = 0xb008,
>> +               .enable_mask = BIT(0),
>> +               .hw.init = &(struct clk_init_data){
>> +                       .name = "gcc_camera_ahb_clk",
>> +                       .ops = &clk_branch2_ops,
>> +               },
>> +       },
>> +};
>> +
>> +static struct clk_branch gcc_camera_hf_axi_clk = {
>> +       .halt_reg = 0xb020,
>> +       .halt_check = BRANCH_HALT,
>> +       .clkr = {
>> +               .enable_reg = 0xb020,
>> +               .enable_mask = BIT(0),
>> +               .hw.init = &(struct clk_init_data){
>> +                       .name = "gcc_camera_hf_axi_clk",
>> +                       .ops = &clk_branch2_ops,
>> +               },
>> +       },
>> +};
>> +
>> +static struct clk_branch gcc_camera_throttle_hf_axi_clk = {
>> +       .halt_reg = 0xb080,
>> +       .halt_check = BRANCH_HALT,
>> +       .hwcg_reg = 0xb080,
>> +       .hwcg_bit = 1,
>> +       .clkr = {
>> +               .enable_reg = 0xb080,
>> +               .enable_mask = BIT(0),
>> +               .hw.init = &(struct clk_init_data){
>> +                       .name = "gcc_camera_throttle_hf_axi_clk",
>> +                       .ops = &clk_branch2_ops,
>> +               },
>> +       },
>> +};
>> +
>> +static struct clk_branch gcc_camera_xo_clk = {
>> +       .halt_reg = 0xb02c,
>> +       .halt_check = BRANCH_HALT,
>> +       .clkr = {
>> +               .enable_reg = 0xb02c,
>> +               .enable_mask = BIT(0),
>> +               .hw.init = &(struct clk_init_data){
>> +                       .name = "gcc_camera_xo_clk",
>> +                       .ops = &clk_branch2_ops,
>> +               },
>> +       },
>> +};
>> +
>> +static struct clk_branch gcc_ce1_ahb_clk = {
>> +       .halt_reg = 0x4100c,
>> +       .halt_check = BRANCH_HALT_VOTED,
>> +       .hwcg_reg = 0x4100c,
>> +       .hwcg_bit = 1,
>> +       .clkr = {
>> +               .enable_reg = 0x52000,
>> +               .enable_mask = BIT(3),
>> +               .hw.init = &(struct clk_init_data){
>> +                       .name = "gcc_ce1_ahb_clk",
>> +                       .ops = &clk_branch2_ops,
>> +               },
>> +       },
>> +};
>> +
>> +static struct clk_branch gcc_ce1_axi_clk = {
>> +       .halt_reg = 0x41008,
>> +       .halt_check = BRANCH_HALT_VOTED,
>> +       .clkr = {
>> +               .enable_reg = 0x52000,
>> +               .enable_mask = BIT(4),
>> +               .hw.init = &(struct clk_init_data){
>> +                       .name = "gcc_ce1_axi_clk",
>> +                       .ops = &clk_branch2_ops,
>> +               },
>> +       },
>> +};
>> +
>> +static struct clk_branch gcc_ce1_clk = {
>> +       .halt_reg = 0x41004,
>> +       .halt_check = BRANCH_HALT_VOTED,
>> +       .clkr = {
>> +               .enable_reg = 0x52000,
>> +               .enable_mask = BIT(5),
>> +               .hw.init = &(struct clk_init_data){
>> +                       .name = "gcc_ce1_clk",
>> +                       .ops = &clk_branch2_ops,
>> +               },
>> +       },
>> +};
>> +
>> +static struct clk_branch gcc_cfg_noc_usb3_prim_axi_clk = {
>> +       .halt_reg = 0x502c,
>> +       .halt_check = BRANCH_HALT,
>> +       .clkr = {
>> +               .enable_reg = 0x502c,
>> +               .enable_mask = BIT(0),
>> +               .hw.init = &(struct clk_init_data){
>> +                       .name = "gcc_cfg_noc_usb3_prim_axi_clk",
>> +                       .parent_data = &(const struct clk_parent_data){
>> +                               .hw = &gcc_usb30_prim_master_clk_src.clkr.hw,
>> +                       },
>> +                       .num_parents = 1,
>> +                       .flags = CLK_SET_RATE_PARENT,
>> +                       .ops = &clk_branch2_ops,
>> +               },
>> +       },
>> +};
>> +
>> +/* For CPUSS functionality the AHB clock needs to be left enabled */
>> +static struct clk_branch gcc_cpuss_ahb_clk = {
>> +       .halt_reg = 0x48000,
>> +       .halt_check = BRANCH_HALT_VOTED,
>> +       .clkr = {
>> +               .enable_reg = 0x52000,
>> +               .enable_mask = BIT(21),
>> +               .hw.init = &(struct clk_init_data){
>> +                       .name = "gcc_cpuss_ahb_clk",
>> +                       .parent_data = &(const struct clk_parent_data){
>> +                               .hw = &gcc_cpuss_ahb_clk_src.clkr.hw,
>> +                       },
>> +                       .num_parents = 1,
>> +                       .flags = CLK_IS_CRITICAL | CLK_SET_RATE_PARENT,
>> +                       .ops = &clk_branch2_ops,
>> +               },
>> +       },
>> +};
>> +
>> +/* For CPUSS functionality the GNOC clock needs to be left enabled */
>> +static struct clk_branch gcc_cpuss_gnoc_clk = {
>> +       .halt_reg = 0x48004,
>> +       .halt_check = BRANCH_HALT_VOTED,
>> +       .hwcg_reg = 0x48004,
>> +       .hwcg_bit = 1,
>> +       .clkr = {
>> +               .enable_reg = 0x52000,
>> +               .enable_mask = BIT(22),
>> +               .hw.init = &(struct clk_init_data){
>> +                       .name = "gcc_cpuss_gnoc_clk",
>> +                       .flags = CLK_IS_CRITICAL,
>> +                       .ops = &clk_branch2_ops,
>> +               },
>> +       },
>> +};
>> +
>> +static struct clk_branch gcc_cpuss_rbcpr_clk = {
>> +       .halt_reg = 0x48008,
>> +       .halt_check = BRANCH_HALT,
>> +       .clkr = {
>> +               .enable_reg = 0x48008,
>> +               .enable_mask = BIT(0),
>> +               .hw.init = &(struct clk_init_data){
>> +                       .name = "gcc_cpuss_rbcpr_clk",
>> +                       .ops = &clk_branch2_ops,
>> +               },
>> +       },
>> +};
>> +
>> +static struct clk_branch gcc_ddrss_gpu_axi_clk = {
>> +       .halt_reg = 0x4452c,
>> +       .halt_check = BRANCH_VOTED,
>> +       .clkr = {
>> +               .enable_reg = 0x4452c,
>> +               .enable_mask = BIT(0),
>> +               .hw.init = &(struct clk_init_data){
>> +                       .name = "gcc_ddrss_gpu_axi_clk",
>> +                       .ops = &clk_branch2_ops,
>> +               },
>> +       },
>> +};
>> +
>> +/* Leave the clock ON for parent config_noc_clk to be kept enabled */
>> +static struct clk_branch gcc_disp_ahb_clk = {
>> +       .halt_reg = 0xb00c,
>> +       .halt_check = BRANCH_HALT,
>> +       .hwcg_reg = 0xb00c,
>> +       .hwcg_bit = 1,
>> +       .clkr = {
>> +               .enable_reg = 0xb00c,
>> +               .enable_mask = BIT(0),
>> +               .hw.init = &(struct clk_init_data){
>> +                       .name = "gcc_disp_ahb_clk",
>> +                       .flags = CLK_IS_CRITICAL,
> 
> Does this assume the display is left enabled out of the bootloader? Why
> is this critical to system operation? Maybe it is really
> CLK_IGNORE_UNUSED?
> 

This clock is not kept enabled by bootloader. But leaving this ON for 
clients on config noc.

>> +                       .ops = &clk_branch2_ops,
>> +               },
>> +       },
>> +};
>> +
>> +static struct clk_branch gcc_disp_gpll0_clk_src = {
>> +       .halt_check = BRANCH_HALT_DELAY,
>> +       .clkr = {
>> +               .enable_reg = 0x52000,
>> +               .enable_mask = BIT(18),
>> +               .hw.init = &(struct clk_init_data){
>> +                       .name = "gcc_disp_gpll0_clk_src",
>> +                       .parent_data = &(const struct clk_parent_data){
>> +                               .hw = &gpll0.clkr.hw,
>> +                       },
>> +                       .num_parents = 1,
>> +                       .ops = &clk_branch2_ops,
>> +               },
>> +       },
>> +};
>> +
>> +static struct clk_branch gcc_disp_gpll0_div_clk_src = {
>> +       .halt_check = BRANCH_HALT_DELAY,
>> +       .clkr = {
>> +               .enable_reg = 0x52000,
>> +               .enable_mask = BIT(19),
>> +               .hw.init = &(struct clk_init_data){
>> +                       .name = "gcc_disp_gpll0_div_clk_src",
>> +                       .parent_data = &(const struct clk_parent_data){
>> +                               .hw = &gcc_pll0_main_div_cdiv.hw,
>> +                       },
>> +                       .num_parents = 1,
>> +                       .ops = &clk_branch2_ops,
>> +               },
>> +       },
>> +};
>> +
>> +static struct clk_branch gcc_disp_hf_axi_clk = {
>> +       .halt_reg = 0xb024,
>> +       .halt_check = BRANCH_HALT,
>> +       .clkr = {
>> +               .enable_reg = 0xb024,
>> +               .enable_mask = BIT(0),
>> +               .hw.init = &(struct clk_init_data){
>> +                       .name = "gcc_disp_hf_axi_clk",
>> +                       .ops = &clk_branch2_ops,
>> +               },
>> +       },
>> +};
>> +
>> +static struct clk_branch gcc_disp_throttle_hf_axi_clk = {
>> +       .halt_reg = 0xb084,
>> +       .halt_check = BRANCH_HALT,
>> +       .hwcg_reg = 0xb084,
>> +       .hwcg_bit = 1,
>> +       .clkr = {
>> +               .enable_reg = 0xb084,
>> +               .enable_mask = BIT(0),
>> +               .hw.init = &(struct clk_init_data){
>> +                       .name = "gcc_disp_throttle_hf_axi_clk",
>> +                       .ops = &clk_branch2_ops,
>> +               },
>> +       },
>> +};
>> +
>> +static struct clk_branch gcc_disp_xo_clk = {
>> +       .halt_reg = 0xb030,
>> +       .halt_check = BRANCH_HALT,
>> +       .clkr = {
>> +               .enable_reg = 0xb030,
>> +               .enable_mask = BIT(0),
>> +               .hw.init = &(struct clk_init_data){
>> +                       .name = "gcc_disp_xo_clk",
>> +                       .ops = &clk_branch2_ops,
>> +               },
>> +       },
>> +};
>> +
>> +static struct clk_branch gcc_gp1_clk = {
>> +       .halt_reg = 0x64000,
>> +       .halt_check = BRANCH_HALT,
>> +       .clkr = {
>> +               .enable_reg = 0x64000,
>> +               .enable_mask = BIT(0),
>> +               .hw.init = &(struct clk_init_data){
>> +                       .name = "gcc_gp1_clk",
>> +                       .parent_data = &(const struct clk_parent_data){
>> +                               .hw = &gcc_gp1_clk_src.clkr.hw,
>> +                       },
>> +                       .num_parents = 1,
>> +                       .flags = CLK_SET_RATE_PARENT,
>> +                       .ops = &clk_branch2_ops,
>> +               },
>> +       },
>> +};
>> +
>> +static struct clk_branch gcc_gp2_clk = {
>> +       .halt_reg = 0x65000,
>> +       .halt_check = BRANCH_HALT,
>> +       .clkr = {
>> +               .enable_reg = 0x65000,
>> +               .enable_mask = BIT(0),
>> +               .hw.init = &(struct clk_init_data){
>> +                       .name = "gcc_gp2_clk",
>> +                       .parent_data = &(const struct clk_parent_data){
>> +                               .hw = &gcc_gp2_clk_src.clkr.hw,
>> +                       },
>> +                       .num_parents = 1,
>> +                       .flags = CLK_SET_RATE_PARENT,
>> +                       .ops = &clk_branch2_ops,
>> +               },
>> +       },
>> +};
>> +
>> +static struct clk_branch gcc_gp3_clk = {
>> +       .halt_reg = 0x66000,
>> +       .halt_check = BRANCH_HALT,
>> +       .clkr = {
>> +               .enable_reg = 0x66000,
>> +               .enable_mask = BIT(0),
>> +               .hw.init = &(struct clk_init_data){
>> +                       .name = "gcc_gp3_clk",
>> +                       .parent_data = &(const struct clk_parent_data){
>> +                               .hw = &gcc_gp3_clk_src.clkr.hw,
>> +                       },
>> +                       .num_parents = 1,
>> +                       .flags = CLK_SET_RATE_PARENT,
>> +                       .ops = &clk_branch2_ops,
>> +               },
>> +       },
>> +};
>> +
>> +/* Leave the clock ON for parent config_noc_clk to be kept enabled */
>> +static struct clk_branch gcc_gpu_cfg_ahb_clk = {
>> +       .halt_reg = 0x71004,
>> +       .halt_check = BRANCH_HALT,
>> +       .hwcg_reg = 0x71004,
>> +       .hwcg_bit = 1,
>> +       .clkr = {
>> +               .enable_reg = 0x71004,
>> +               .enable_mask = BIT(0),
>> +               .hw.init = &(struct clk_init_data){
>> +                       .name = "gcc_gpu_cfg_ahb_clk",
>> +                       .flags = CLK_IS_CRITICAL,
>> +                       .ops = &clk_branch2_ops,
>> +               },
>> +       },
>> +};
>> +
>> +static struct clk_branch gcc_gpu_gpll0_clk_src = {
>> +       .halt_check = BRANCH_HALT_DELAY,
>> +       .clkr = {
>> +               .enable_reg = 0x52000,
>> +               .enable_mask = BIT(15),
>> +               .hw.init = &(struct clk_init_data){
>> +                       .name = "gcc_gpu_gpll0_clk_src",
>> +                       .parent_data = &(const struct clk_parent_data){
>> +                               .hw = &gpll0.clkr.hw,
>> +                       },
>> +                       .num_parents = 1,
>> +                       .ops = &clk_branch2_ops,
>> +               },
>> +       },
>> +};
>> +
>> +static struct clk_branch gcc_gpu_gpll0_div_clk_src = {
>> +       .halt_check = BRANCH_HALT_DELAY,
>> +       .clkr = {
>> +               .enable_reg = 0x52000,
>> +               .enable_mask = BIT(16),
>> +               .hw.init = &(struct clk_init_data){
>> +                       .name = "gcc_gpu_gpll0_div_clk_src",
>> +                       .parent_data = &(const struct clk_parent_data){
>> +                               .hw = &gcc_pll0_main_div_cdiv.hw,
>> +                       },
>> +                       .num_parents = 1,
>> +                       .ops = &clk_branch2_ops,
>> +               },
>> +       },
>> +};
>> +
>> +static struct clk_branch gcc_gpu_memnoc_gfx_clk = {
>> +       .halt_reg = 0x7100c,
>> +       .halt_check = BRANCH_VOTED,
>> +       .clkr = {
>> +               .enable_reg = 0x7100c,
>> +               .enable_mask = BIT(0),
>> +               .hw.init = &(struct clk_init_data){
>> +                       .name = "gcc_gpu_memnoc_gfx_clk",
>> +                       .ops = &clk_branch2_ops,
>> +               },
>> +       },
>> +};
>> +
>> +static struct clk_branch gcc_gpu_snoc_dvm_gfx_clk = {
>> +       .halt_reg = 0x71018,
>> +       .halt_check = BRANCH_HALT,
>> +       .clkr = {
>> +               .enable_reg = 0x71018,
>> +               .enable_mask = BIT(0),
>> +               .hw.init = &(struct clk_init_data){
>> +                       .name = "gcc_gpu_snoc_dvm_gfx_clk",
>> +                       .ops = &clk_branch2_ops,
>> +               },
>> +       },
>> +};
>> +
>> +static struct clk_branch gcc_npu_axi_clk = {
>> +       .halt_reg = 0x4d008,
>> +       .halt_check = BRANCH_HALT,
>> +       .clkr = {
>> +               .enable_reg = 0x4d008,
>> +               .enable_mask = BIT(0),
>> +               .hw.init = &(struct clk_init_data){
>> +                       .name = "gcc_npu_axi_clk",
>> +                       .ops = &clk_branch2_ops,
>> +               },
>> +       },
>> +};
>> +
>> +static struct clk_branch gcc_npu_bwmon_axi_clk = {
>> +       .halt_reg = 0x73008,
>> +       .halt_check = BRANCH_HALT,
>> +       .clkr = {
>> +               .enable_reg = 0x73008,
>> +               .enable_mask = BIT(0),
>> +               .hw.init = &(struct clk_init_data){
>> +                       .name = "gcc_npu_bwmon_axi_clk",
>> +                       .ops = &clk_branch2_ops,
>> +               },
>> +       },
>> +};
>> +
>> +static struct clk_branch gcc_npu_bwmon_dma_cfg_ahb_clk = {
>> +       .halt_reg = 0x73018,
>> +       .halt_check = BRANCH_HALT,
>> +       .clkr = {
>> +               .enable_reg = 0x73018,
>> +               .enable_mask = BIT(0),
>> +               .hw.init = &(struct clk_init_data){
>> +                       .name = "gcc_npu_bwmon_dma_cfg_ahb_clk",
>> +                       .ops = &clk_branch2_ops,
>> +               },
>> +       },
>> +};
>> +
>> +static struct clk_branch gcc_npu_bwmon_dsp_cfg_ahb_clk = {
>> +       .halt_reg = 0x7301c,
>> +       .halt_check = BRANCH_HALT,
>> +       .clkr = {
>> +               .enable_reg = 0x7301c,
>> +               .enable_mask = BIT(0),
>> +               .hw.init = &(struct clk_init_data){
>> +                       .name = "gcc_npu_bwmon_dsp_cfg_ahb_clk",
>> +                       .ops = &clk_branch2_ops,
>> +               },
>> +       },
>> +};
>> +
>> +static struct clk_branch gcc_npu_cfg_ahb_clk = {
>> +       .halt_reg = 0x4d004,
>> +       .halt_check = BRANCH_HALT,
>> +       .hwcg_reg = 0x4d004,
>> +       .hwcg_bit = 1,
>> +       .clkr = {
>> +               .enable_reg = 0x4d004,
>> +               .enable_mask = BIT(0),
>> +               .hw.init = &(struct clk_init_data){
>> +                       .name = "gcc_npu_cfg_ahb_clk",
>> +                       .ops = &clk_branch2_ops,
>> +               },
>> +       },
>> +};
>> +
>> +static struct clk_branch gcc_npu_dma_clk = {
>> +       .halt_reg = 0x4d1a0,
>> +       .halt_check = BRANCH_HALT,
>> +       .hwcg_reg = 0x4d1a0,
>> +       .hwcg_bit = 1,
>> +       .clkr = {
>> +               .enable_reg = 0x4d1a0,
>> +               .enable_mask = BIT(0),
>> +               .hw.init = &(struct clk_init_data){
>> +                       .name = "gcc_npu_dma_clk",
>> +                       .ops = &clk_branch2_ops,
>> +               },
>> +       },
>> +};
>> +
>> +static struct clk_branch gcc_npu_gpll0_clk_src = {
>> +       .halt_check = BRANCH_HALT_DELAY,
>> +       .clkr = {
>> +               .enable_reg = 0x52000,
>> +               .enable_mask = BIT(25),
>> +               .hw.init = &(struct clk_init_data){
>> +                       .name = "gcc_npu_gpll0_clk_src",
>> +                       .parent_data = &(const struct clk_parent_data){
>> +                               .hw = &gpll0.clkr.hw,
>> +                       },
>> +                       .num_parents = 1,
>> +                       .ops = &clk_branch2_ops,
>> +               },
>> +       },
>> +};
>> +
>> +static struct clk_branch gcc_npu_gpll0_div_clk_src = {
>> +       .halt_check = BRANCH_HALT_DELAY,
>> +       .clkr = {
>> +               .enable_reg = 0x52000,
>> +               .enable_mask = BIT(26),
>> +               .hw.init = &(struct clk_init_data){
>> +                       .name = "gcc_npu_gpll0_div_clk_src",
>> +                       .parent_data = &(const struct clk_parent_data){
>> +                               .hw = &gcc_pll0_main_div_cdiv.hw,
>> +                       },
>> +                       .num_parents = 1,
>> +                       .flags = CLK_SET_RATE_PARENT,
>> +                       .ops = &clk_branch2_ops,
>> +               },
>> +       },
>> +};
>> +
>> +static struct clk_branch gcc_pdm2_clk = {
>> +       .halt_reg = 0x3300c,
>> +       .halt_check = BRANCH_HALT,
>> +       .clkr = {
>> +               .enable_reg = 0x3300c,
>> +               .enable_mask = BIT(0),
>> +               .hw.init = &(struct clk_init_data){
>> +                       .name = "gcc_pdm2_clk",
>> +                       .parent_data = &(const struct clk_parent_data){
>> +                               .hw = &gcc_pdm2_clk_src.clkr.hw,
>> +                       },
>> +                       .num_parents = 1,
>> +                       .flags = CLK_SET_RATE_PARENT,
>> +                       .ops = &clk_branch2_ops,
>> +               },
>> +       },
>> +};
>> +
>> +static struct clk_branch gcc_pdm_ahb_clk = {
>> +       .halt_reg = 0x33004,
>> +       .halt_check = BRANCH_HALT,
>> +       .hwcg_reg = 0x33004,
>> +       .hwcg_bit = 1,
>> +       .clkr = {
>> +               .enable_reg = 0x33004,
>> +               .enable_mask = BIT(0),
>> +               .hw.init = &(struct clk_init_data){
>> +                       .name = "gcc_pdm_ahb_clk",
>> +                       .ops = &clk_branch2_ops,
>> +               },
>> +       },
>> +};
>> +
>> +static struct clk_branch gcc_pdm_xo4_clk = {
>> +       .halt_reg = 0x33008,
>> +       .halt_check = BRANCH_HALT,
>> +       .clkr = {
>> +               .enable_reg = 0x33008,
>> +               .enable_mask = BIT(0),
>> +               .hw.init = &(struct clk_init_data){
>> +                       .name = "gcc_pdm_xo4_clk",
>> +                       .ops = &clk_branch2_ops,
>> +               },
>> +       },
>> +};
>> +
>> +static struct clk_branch gcc_prng_ahb_clk = {
>> +       .halt_reg = 0x34004,
>> +       .halt_check = BRANCH_HALT_VOTED,
>> +       .hwcg_reg = 0x34004,
>> +       .hwcg_bit = 1,
>> +       .clkr = {
>> +               .enable_reg = 0x52000,
>> +               .enable_mask = BIT(13),
>> +               .hw.init = &(struct clk_init_data){
>> +                       .name = "gcc_prng_ahb_clk",
>> +                       .ops = &clk_branch2_ops,
>> +               },
>> +       },
>> +};
>> +
>> +static struct clk_branch gcc_qspi_cnoc_periph_ahb_clk = {
>> +       .halt_reg = 0x4b004,
>> +       .halt_check = BRANCH_HALT,
>> +       .hwcg_reg = 0x4b004,
>> +       .hwcg_bit = 1,
>> +       .clkr = {
>> +               .enable_reg = 0x4b004,
>> +               .enable_mask = BIT(0),
>> +               .hw.init = &(struct clk_init_data){
>> +                       .name = "gcc_qspi_cnoc_periph_ahb_clk",
>> +                       .ops = &clk_branch2_ops,
>> +               },
>> +       },
>> +};
>> +
>> +static struct clk_branch gcc_qspi_core_clk = {
>> +       .halt_reg = 0x4b008,
>> +       .halt_check = BRANCH_HALT,
>> +       .clkr = {
>> +               .enable_reg = 0x4b008,
>> +               .enable_mask = BIT(0),
>> +               .hw.init = &(struct clk_init_data){
>> +                       .name = "gcc_qspi_core_clk",
>> +                       .parent_data = &(const struct clk_parent_data){
>> +                               .hw = &gcc_qspi_core_clk_src.clkr.hw,
>> +                       },
>> +                       .num_parents = 1,
>> +                       .flags = CLK_SET_RATE_PARENT,
>> +                       .ops = &clk_branch2_ops,
>> +               },
>> +       },
>> +};
>> +
>> +static struct clk_branch gcc_qupv3_wrap0_core_2x_clk = {
>> +       .halt_reg = 0x17014,
>> +       .halt_check = BRANCH_HALT_VOTED,
>> +       .clkr = {
>> +               .enable_reg = 0x52008,
>> +               .enable_mask = BIT(9),
>> +               .hw.init = &(struct clk_init_data){
>> +                       .name = "gcc_qupv3_wrap0_core_2x_clk",
>> +                       .ops = &clk_branch2_ops,
>> +               },
>> +       },
>> +};
>> +
>> +static struct clk_branch gcc_qupv3_wrap0_core_clk = {
>> +       .halt_reg = 0x1700c,
>> +       .halt_check = BRANCH_HALT_VOTED,
>> +       .clkr = {
>> +               .enable_reg = 0x52008,
>> +               .enable_mask = BIT(8),
>> +               .hw.init = &(struct clk_init_data){
>> +                       .name = "gcc_qupv3_wrap0_core_clk",
>> +                       .ops = &clk_branch2_ops,
>> +               },
>> +       },
>> +};
>> +
>> +static struct clk_branch gcc_qupv3_wrap0_s0_clk = {
>> +       .halt_reg = 0x17030,
>> +       .halt_check = BRANCH_HALT_VOTED,
>> +       .clkr = {
>> +               .enable_reg = 0x52008,
>> +               .enable_mask = BIT(10),
>> +               .hw.init = &(struct clk_init_data){
>> +                       .name = "gcc_qupv3_wrap0_s0_clk",
>> +                       .parent_data = &(const struct clk_parent_data){
>> +                               .hw = &gcc_qupv3_wrap0_s0_clk_src.clkr.hw,
>> +                       },
>> +                       .num_parents = 1,
>> +                       .flags = CLK_SET_RATE_PARENT,
>> +                       .ops = &clk_branch2_ops,
>> +               },
>> +       },
>> +};
>> +
>> +static struct clk_branch gcc_qupv3_wrap0_s1_clk = {
>> +       .halt_reg = 0x17160,
>> +       .halt_check = BRANCH_HALT_VOTED,
>> +       .clkr = {
>> +               .enable_reg = 0x52008,
>> +               .enable_mask = BIT(11),
>> +               .hw.init = &(struct clk_init_data){
>> +                       .name = "gcc_qupv3_wrap0_s1_clk",
>> +                       .parent_data = &(const struct clk_parent_data){
>> +                               .hw = &gcc_qupv3_wrap0_s1_clk_src.clkr.hw,
>> +                       },
>> +                       .num_parents = 1,
>> +                       .flags = CLK_SET_RATE_PARENT,
>> +                       .ops = &clk_branch2_ops,
>> +               },
>> +       },
>> +};
>> +
>> +static struct clk_branch gcc_qupv3_wrap0_s2_clk = {
>> +       .halt_reg = 0x17290,
>> +       .halt_check = BRANCH_HALT_VOTED,
>> +       .clkr = {
>> +               .enable_reg = 0x52008,
>> +               .enable_mask = BIT(12),
>> +               .hw.init = &(struct clk_init_data){
>> +                       .name = "gcc_qupv3_wrap0_s2_clk",
>> +                       .parent_data = &(const struct clk_parent_data){
>> +                               .hw = &gcc_qupv3_wrap0_s2_clk_src.clkr.hw,
>> +                       },
>> +                       .num_parents = 1,
>> +                       .flags = CLK_SET_RATE_PARENT,
>> +                       .ops = &clk_branch2_ops,
>> +               },
>> +       },
>> +};
>> +
>> +static struct clk_branch gcc_qupv3_wrap0_s3_clk = {
>> +       .halt_reg = 0x173c0,
>> +       .halt_check = BRANCH_HALT_VOTED,
>> +       .clkr = {
>> +               .enable_reg = 0x52008,
>> +               .enable_mask = BIT(13),
>> +               .hw.init = &(struct clk_init_data){
>> +                       .name = "gcc_qupv3_wrap0_s3_clk",
>> +                       .parent_data = &(const struct clk_parent_data){
>> +                               .hw = &gcc_qupv3_wrap0_s3_clk_src.clkr.hw,
>> +                       },
>> +                       .num_parents = 1,
>> +                       .flags = CLK_SET_RATE_PARENT,
>> +                       .ops = &clk_branch2_ops,
>> +               },
>> +       },
>> +};
>> +
>> +static struct clk_branch gcc_qupv3_wrap0_s4_clk = {
>> +       .halt_reg = 0x174f0,
>> +       .halt_check = BRANCH_HALT_VOTED,
>> +       .clkr = {
>> +               .enable_reg = 0x52008,
>> +               .enable_mask = BIT(14),
>> +               .hw.init = &(struct clk_init_data){
>> +                       .name = "gcc_qupv3_wrap0_s4_clk",
>> +                       .parent_data = &(const struct clk_parent_data){
>> +                               .hw = &gcc_qupv3_wrap0_s4_clk_src.clkr.hw,
>> +                       },
>> +                       .num_parents = 1,
>> +                       .flags = CLK_SET_RATE_PARENT,
>> +                       .ops = &clk_branch2_ops,
>> +               },
>> +       },
>> +};
>> +
>> +static struct clk_branch gcc_qupv3_wrap0_s5_clk = {
>> +       .halt_reg = 0x17620,
>> +       .halt_check = BRANCH_HALT_VOTED,
>> +       .clkr = {
>> +               .enable_reg = 0x52008,
>> +               .enable_mask = BIT(15),
>> +               .hw.init = &(struct clk_init_data){
>> +                       .name = "gcc_qupv3_wrap0_s5_clk",
>> +                       .parent_data = &(const struct clk_parent_data){
>> +                               .hw = &gcc_qupv3_wrap0_s5_clk_src.clkr.hw,
>> +                       },
>> +                       .num_parents = 1,
>> +                       .flags = CLK_SET_RATE_PARENT,
>> +                       .ops = &clk_branch2_ops,
>> +               },
>> +       },
>> +};
>> +
>> +static struct clk_branch gcc_qupv3_wrap1_core_2x_clk = {
>> +       .halt_reg = 0x18004,
>> +       .halt_check = BRANCH_HALT_VOTED,
>> +       .clkr = {
>> +               .enable_reg = 0x52008,
>> +               .enable_mask = BIT(18),
>> +               .hw.init = &(struct clk_init_data){
>> +                       .name = "gcc_qupv3_wrap1_core_2x_clk",
>> +                       .ops = &clk_branch2_ops,
>> +               },
>> +       },
>> +};
>> +
>> +static struct clk_branch gcc_qupv3_wrap1_core_clk = {
>> +       .halt_reg = 0x18008,
>> +       .halt_check = BRANCH_HALT_VOTED,
>> +       .clkr = {
>> +               .enable_reg = 0x52008,
>> +               .enable_mask = BIT(19),
>> +               .hw.init = &(struct clk_init_data){
>> +                       .name = "gcc_qupv3_wrap1_core_clk",
>> +                       .ops = &clk_branch2_ops,
>> +               },
>> +       },
>> +};
>> +
>> +static struct clk_branch gcc_qupv3_wrap1_s0_clk = {
>> +       .halt_reg = 0x18014,
>> +       .halt_check = BRANCH_HALT_VOTED,
>> +       .clkr = {
>> +               .enable_reg = 0x52008,
>> +               .enable_mask = BIT(22),
>> +               .hw.init = &(struct clk_init_data){
>> +                       .name = "gcc_qupv3_wrap1_s0_clk",
>> +                       .parent_data = &(const struct clk_parent_data){
>> +                               .hw = &gcc_qupv3_wrap1_s0_clk_src.clkr.hw,
>> +                       },
>> +                       .num_parents = 1,
>> +                       .flags = CLK_SET_RATE_PARENT,
>> +                       .ops = &clk_branch2_ops,
>> +               },
>> +       },
>> +};
>> +
>> +static struct clk_branch gcc_qupv3_wrap1_s1_clk = {
>> +       .halt_reg = 0x18144,
>> +       .halt_check = BRANCH_HALT_VOTED,
>> +       .clkr = {
>> +               .enable_reg = 0x52008,
>> +               .enable_mask = BIT(23),
>> +               .hw.init = &(struct clk_init_data){
>> +                       .name = "gcc_qupv3_wrap1_s1_clk",
>> +                       .parent_data = &(const struct clk_parent_data){
>> +                               .hw = &gcc_qupv3_wrap1_s1_clk_src.clkr.hw,
>> +                       },
>> +                       .num_parents = 1,
>> +                       .flags = CLK_SET_RATE_PARENT,
>> +                       .ops = &clk_branch2_ops,
>> +               },
>> +       },
>> +};
>> +
>> +static struct clk_branch gcc_qupv3_wrap1_s2_clk = {
>> +       .halt_reg = 0x18274,
>> +       .halt_check = BRANCH_HALT_VOTED,
>> +       .clkr = {
>> +               .enable_reg = 0x52008,
>> +               .enable_mask = BIT(24),
>> +               .hw.init = &(struct clk_init_data){
>> +                       .name = "gcc_qupv3_wrap1_s2_clk",
>> +                       .parent_data = &(const struct clk_parent_data){
>> +                               .hw = &gcc_qupv3_wrap1_s2_clk_src.clkr.hw,
>> +                       },
>> +                       .num_parents = 1,
>> +                       .flags = CLK_SET_RATE_PARENT,
>> +                       .ops = &clk_branch2_ops,
>> +               },
>> +       },
>> +};
>> +
>> +static struct clk_branch gcc_qupv3_wrap1_s3_clk = {
>> +       .halt_reg = 0x183a4,
>> +       .halt_check = BRANCH_HALT_VOTED,
>> +       .clkr = {
>> +               .enable_reg = 0x52008,
>> +               .enable_mask = BIT(25),
>> +               .hw.init = &(struct clk_init_data){
>> +                       .name = "gcc_qupv3_wrap1_s3_clk",
>> +                       .parent_data = &(const struct clk_parent_data){
>> +                               .hw = &gcc_qupv3_wrap1_s3_clk_src.clkr.hw,
>> +                       },
>> +                       .num_parents = 1,
>> +                       .flags = CLK_SET_RATE_PARENT,
>> +                       .ops = &clk_branch2_ops,
>> +               },
>> +       },
>> +};
>> +
>> +static struct clk_branch gcc_qupv3_wrap1_s4_clk = {
>> +       .halt_reg = 0x184d4,
>> +       .halt_check = BRANCH_HALT_VOTED,
>> +       .clkr = {
>> +               .enable_reg = 0x52008,
>> +               .enable_mask = BIT(26),
>> +               .hw.init = &(struct clk_init_data){
>> +                       .name = "gcc_qupv3_wrap1_s4_clk",
>> +                       .parent_data = &(const struct clk_parent_data){
>> +                               .hw = &gcc_qupv3_wrap1_s4_clk_src.clkr.hw,
>> +                       },
>> +                       .num_parents = 1,
>> +                       .flags = CLK_SET_RATE_PARENT,
>> +                       .ops = &clk_branch2_ops,
>> +               },
>> +       },
>> +};
>> +
>> +static struct clk_branch gcc_qupv3_wrap1_s5_clk = {
>> +       .halt_reg = 0x18604,
>> +       .halt_check = BRANCH_HALT_VOTED,
>> +       .clkr = {
>> +               .enable_reg = 0x52008,
>> +               .enable_mask = BIT(27),
>> +               .hw.init = &(struct clk_init_data){
>> +                       .name = "gcc_qupv3_wrap1_s5_clk",
>> +                       .parent_data = &(const struct clk_parent_data){
>> +                               .hw = &gcc_qupv3_wrap1_s5_clk_src.clkr.hw,
>> +                       },
>> +                       .num_parents = 1,
>> +                       .flags = CLK_SET_RATE_PARENT,
>> +                       .ops = &clk_branch2_ops,
>> +               },
>> +       },
>> +};
>> +
>> +static struct clk_branch gcc_qupv3_wrap_0_m_ahb_clk = {
>> +       .halt_reg = 0x17004,
>> +       .halt_check = BRANCH_HALT_VOTED,
>> +       .clkr = {
>> +               .enable_reg = 0x52008,
>> +               .enable_mask = BIT(6),
>> +               .hw.init = &(struct clk_init_data){
>> +                       .name = "gcc_qupv3_wrap_0_m_ahb_clk",
>> +                       .ops = &clk_branch2_ops,
>> +               },
>> +       },
>> +};
>> +
>> +static struct clk_branch gcc_qupv3_wrap_0_s_ahb_clk = {
>> +       .halt_reg = 0x17008,
>> +       .halt_check = BRANCH_HALT_VOTED,
>> +       .hwcg_reg = 0x17008,
>> +       .hwcg_bit = 1,
>> +       .clkr = {
>> +               .enable_reg = 0x52008,
>> +               .enable_mask = BIT(7),
>> +               .hw.init = &(struct clk_init_data){
>> +                       .name = "gcc_qupv3_wrap_0_s_ahb_clk",
>> +                       .ops = &clk_branch2_ops,
>> +               },
>> +       },
>> +};
>> +
>> +static struct clk_branch gcc_qupv3_wrap_1_m_ahb_clk = {
>> +       .halt_reg = 0x1800c,
>> +       .halt_check = BRANCH_HALT_VOTED,
>> +       .clkr = {
>> +               .enable_reg = 0x52008,
>> +               .enable_mask = BIT(20),
>> +               .hw.init = &(struct clk_init_data){
>> +                       .name = "gcc_qupv3_wrap_1_m_ahb_clk",
>> +                       .ops = &clk_branch2_ops,
>> +               },
>> +       },
>> +};
>> +
>> +static struct clk_branch gcc_qupv3_wrap_1_s_ahb_clk = {
>> +       .halt_reg = 0x18010,
>> +       .halt_check = BRANCH_HALT_VOTED,
>> +       .hwcg_reg = 0x18010,
>> +       .hwcg_bit = 1,
>> +       .clkr = {
>> +               .enable_reg = 0x52008,
>> +               .enable_mask = BIT(21),
>> +               .hw.init = &(struct clk_init_data){
>> +                       .name = "gcc_qupv3_wrap_1_s_ahb_clk",
>> +                       .ops = &clk_branch2_ops,
>> +               },
>> +       },
>> +};
>> +
>> +static struct clk_branch gcc_sdcc1_ahb_clk = {
>> +       .halt_reg = 0x12008,
>> +       .halt_check = BRANCH_HALT,
>> +       .clkr = {
>> +               .enable_reg = 0x12008,
>> +               .enable_mask = BIT(0),
>> +               .hw.init = &(struct clk_init_data){
>> +                       .name = "gcc_sdcc1_ahb_clk",
>> +                       .ops = &clk_branch2_ops,
>> +               },
>> +       },
>> +};
>> +
>> +static struct clk_branch gcc_sdcc1_apps_clk = {
>> +       .halt_reg = 0x1200c,
>> +       .halt_check = BRANCH_HALT,
>> +       .clkr = {
>> +               .enable_reg = 0x1200c,
>> +               .enable_mask = BIT(0),
>> +               .hw.init = &(struct clk_init_data){
>> +                       .name = "gcc_sdcc1_apps_clk",
>> +                       .parent_data = &(const struct clk_parent_data){
>> +                               .hw = &gcc_sdcc1_apps_clk_src.clkr.hw,
>> +                       },
>> +                       .num_parents = 1,
>> +                       .flags = CLK_SET_RATE_PARENT,
>> +                       .ops = &clk_branch2_ops,
>> +               },
>> +       },
>> +};
>> +
>> +static struct clk_branch gcc_sdcc1_ice_core_clk = {
>> +       .halt_reg = 0x12040,
>> +       .halt_check = BRANCH_HALT,
>> +       .clkr = {
>> +               .enable_reg = 0x12040,
>> +               .enable_mask = BIT(0),
>> +               .hw.init = &(struct clk_init_data){
>> +                       .name = "gcc_sdcc1_ice_core_clk",
>> +                       .parent_data = &(const struct clk_parent_data){
>> +                               .hw = &gcc_sdcc1_ice_core_clk_src.clkr.hw,
>> +                       },
>> +                       .num_parents = 1,
>> +                       .flags = CLK_SET_RATE_PARENT,
>> +                       .ops = &clk_branch2_ops,
>> +               },
>> +       },
>> +};
>> +
>> +static struct clk_branch gcc_sdcc2_ahb_clk = {
>> +       .halt_reg = 0x14008,
>> +       .halt_check = BRANCH_HALT,
>> +       .clkr = {
>> +               .enable_reg = 0x14008,
>> +               .enable_mask = BIT(0),
>> +               .hw.init = &(struct clk_init_data){
>> +                       .name = "gcc_sdcc2_ahb_clk",
>> +                       .ops = &clk_branch2_ops,
>> +               },
>> +       },
>> +};
>> +
>> +static struct clk_branch gcc_sdcc2_apps_clk = {
>> +       .halt_reg = 0x14004,
>> +       .halt_check = BRANCH_HALT,
>> +       .clkr = {
>> +               .enable_reg = 0x14004,
>> +               .enable_mask = BIT(0),
>> +               .hw.init = &(struct clk_init_data){
>> +                       .name = "gcc_sdcc2_apps_clk",
>> +                       .parent_data = &(const struct clk_parent_data){
>> +                               .hw = &gcc_sdcc2_apps_clk_src.clkr.hw,
>> +                       },
>> +                       .num_parents = 1,
>> +                       .flags = CLK_SET_RATE_PARENT,
>> +                       .ops = &clk_branch2_ops,
>> +               },
>> +       },
>> +};
>> +
>> +/* For CPUSS functionality the SYS NOC clock needs to be left enabled */
>> +static struct clk_branch gcc_sys_noc_cpuss_ahb_clk = {
>> +       .halt_reg = 0x4144,
>> +       .halt_check = BRANCH_HALT_VOTED,
>> +       .clkr = {
>> +               .enable_reg = 0x52000,
>> +               .enable_mask = BIT(0),
>> +               .hw.init = &(struct clk_init_data){
>> +                       .name = "gcc_sys_noc_cpuss_ahb_clk",
>> +                       .parent_data = &(const struct clk_parent_data){
>> +                               .hw = &gcc_cpuss_ahb_clk_src.clkr.hw,
>> +                       },
>> +                       .num_parents = 1,
>> +                       .flags = CLK_IS_CRITICAL | CLK_SET_RATE_PARENT,
>> +                       .ops = &clk_branch2_ops,
>> +               },
>> +       },
>> +};
>> +
>> +static struct clk_branch gcc_ufs_mem_clkref_clk = {
>> +       .halt_reg = 0x8c000,
>> +       .halt_check = BRANCH_HALT,
>> +       .clkr = {
>> +               .enable_reg = 0x8c000,
>> +               .enable_mask = BIT(0),
>> +               .hw.init = &(struct clk_init_data){
>> +                       .name = "gcc_ufs_mem_clkref_clk",
>> +                       .ops = &clk_branch2_ops,
>> +               },
>> +       },
>> +};
>> +
>> +static struct clk_branch gcc_ufs_phy_ahb_clk = {
>> +       .halt_reg = 0x77014,
>> +       .halt_check = BRANCH_HALT,
>> +       .hwcg_reg = 0x77014,
>> +       .hwcg_bit = 1,
>> +       .clkr = {
>> +               .enable_reg = 0x77014,
>> +               .enable_mask = BIT(0),
>> +               .hw.init = &(struct clk_init_data){
>> +                       .name = "gcc_ufs_phy_ahb_clk",
>> +                       .ops = &clk_branch2_ops,
>> +               },
>> +       },
>> +};
>> +
>> +static struct clk_branch gcc_ufs_phy_axi_clk = {
>> +       .halt_reg = 0x77038,
>> +       .halt_check = BRANCH_HALT,
>> +       .hwcg_reg = 0x77038,
>> +       .hwcg_bit = 1,
>> +       .clkr = {
>> +               .enable_reg = 0x77038,
>> +               .enable_mask = BIT(0),
>> +               .hw.init = &(struct clk_init_data){
>> +                       .name = "gcc_ufs_phy_axi_clk",
>> +                       .parent_data = &(const struct clk_parent_data){
>> +                               .hw = &gcc_ufs_phy_axi_clk_src.clkr.hw,
>> +                       },
>> +                       .num_parents = 1,
>> +                       .flags = CLK_SET_RATE_PARENT,
>> +                       .ops = &clk_branch2_ops,
>> +               },
>> +       },
>> +};
>> +
>> +static struct clk_branch gcc_ufs_phy_ice_core_clk = {
>> +       .halt_reg = 0x77090,
>> +       .halt_check = BRANCH_HALT,
>> +       .hwcg_reg = 0x77090,
>> +       .hwcg_bit = 1,
>> +       .clkr = {
>> +               .enable_reg = 0x77090,
>> +               .enable_mask = BIT(0),
>> +               .hw.init = &(struct clk_init_data){
>> +                       .name = "gcc_ufs_phy_ice_core_clk",
>> +                       .parent_data = &(const struct clk_parent_data){
>> +                               .hw = &gcc_ufs_phy_ice_core_clk_src.clkr.hw,
>> +                       },
>> +                       .num_parents = 1,
>> +                       .flags = CLK_SET_RATE_PARENT,
>> +                       .ops = &clk_branch2_ops,
>> +               },
>> +       },
>> +};
>> +
>> +static struct clk_branch gcc_ufs_phy_phy_aux_clk = {
>> +       .halt_reg = 0x77094,
>> +       .halt_check = BRANCH_HALT,
>> +       .hwcg_reg = 0x77094,
>> +       .hwcg_bit = 1,
>> +       .clkr = {
>> +               .enable_reg = 0x77094,
>> +               .enable_mask = BIT(0),
>> +               .hw.init = &(struct clk_init_data){
>> +                       .name = "gcc_ufs_phy_phy_aux_clk",
>> +                       .parent_data = &(const struct clk_parent_data){
>> +                               .hw = &gcc_ufs_phy_phy_aux_clk_src.clkr.hw,
>> +                       },
>> +                       .num_parents = 1,
>> +                       .flags = CLK_SET_RATE_PARENT,
>> +                       .ops = &clk_branch2_ops,
>> +               },
>> +       },
>> +};
>> +
>> +static struct clk_branch gcc_ufs_phy_rx_symbol_0_clk = {
>> +       .halt_reg = 0x7701c,
>> +       .halt_check = BRANCH_HALT_SKIP,
> 
> Again, nobody has fixed the UFS driver to not need to do this halt skip
> check for these clks? It's been over a year.
> 

The UFS_PHY_RX/TX clocks could be left enabled due to certain HW boot 
configuration and thus during the late initcall of clk_disable there 
could be warnings of "clock stuck ON" in the dmesg. That is the reason 
also to use the BRANCH_HALT_SKIP flag.

I would also check internally for the UFS driver fix you are referring here.

>> +       .clkr = {
>> +               .enable_reg = 0x7701c,
>> +               .enable_mask = BIT(0),
>> +               .hw.init = &(struct clk_init_data){
>> +                       .name = "gcc_ufs_phy_rx_symbol_0_clk",
>> +                       .ops = &clk_branch2_ops,
>> +               },
>> +       },
>> +};
>> +
>> +static struct clk_branch gcc_ufs_phy_tx_symbol_0_clk = {
>> +       .halt_reg = 0x77018,
>> +       .halt_check = BRANCH_HALT_SKIP,
>> +       .clkr = {
>> +               .enable_reg = 0x77018,
>> +               .enable_mask = BIT(0),
>> +               .hw.init = &(struct clk_init_data){
>> +                       .name = "gcc_ufs_phy_tx_symbol_0_clk",
>> +                       .ops = &clk_branch2_ops,
>> +               },
>> +       },
>> +};
>> +
>> +static struct clk_branch gcc_ufs_phy_unipro_core_clk = {
>> +       .halt_reg = 0x7708c,
>> +       .halt_check = BRANCH_HALT,
>> +       .hwcg_reg = 0x7708c,
>> +       .hwcg_bit = 1,
>> +       .clkr = {
>> +               .enable_reg = 0x7708c,
>> +               .enable_mask = BIT(0),
>> +               .hw.init = &(struct clk_init_data){
>> +                       .name = "gcc_ufs_phy_unipro_core_clk",
>> +                       .parent_data = &(const struct clk_parent_data){
>> +                               .hw = &gcc_ufs_phy_unipro_core_clk_src.clkr.hw,
>> +                       },
>> +                       .num_parents = 1,
>> +                       .flags = CLK_SET_RATE_PARENT,
>> +                       .ops = &clk_branch2_ops,
>> +               },
>> +       },
>> +};
>> +
>> +static struct clk_branch gcc_usb30_prim_master_clk = {
>> +       .halt_reg = 0xf010,
>> +       .halt_check = BRANCH_HALT,
>> +       .clkr = {
>> +               .enable_reg = 0xf010,
>> +               .enable_mask = BIT(0),
>> +               .hw.init = &(struct clk_init_data){
>> +                       .name = "gcc_usb30_prim_master_clk",
>> +                       .parent_data = &(const struct clk_parent_data){
>> +                               .hw = &gcc_usb30_prim_master_clk_src.clkr.hw,
>> +                       },
>> +                       .num_parents = 1,
>> +                       .flags = CLK_SET_RATE_PARENT,
>> +                       .ops = &clk_branch2_ops,
>> +               },
>> +       },
>> +};
>> +
>> +static struct clk_branch gcc_usb30_prim_mock_utmi_clk = {
>> +       .halt_reg = 0xf018,
>> +       .halt_check = BRANCH_HALT,
>> +       .clkr = {
>> +               .enable_reg = 0xf018,
>> +               .enable_mask = BIT(0),
>> +               .hw.init = &(struct clk_init_data){
>> +                       .name = "gcc_usb30_prim_mock_utmi_clk",
>> +                       .parent_data = &(const struct clk_parent_data){
>> +                               .hw =
>> +                               &gcc_usb30_prim_mock_utmi_clk_src.clkr.hw,
>> +                       },
>> +                       .num_parents = 1,
>> +                       .flags = CLK_SET_RATE_PARENT,
>> +                       .ops = &clk_branch2_ops,
>> +               },
>> +       },
>> +};
>> +
>> +static struct clk_branch gcc_usb30_prim_sleep_clk = {
>> +       .halt_reg = 0xf014,
>> +       .halt_check = BRANCH_HALT,
>> +       .clkr = {
>> +               .enable_reg = 0xf014,
>> +               .enable_mask = BIT(0),
>> +               .hw.init = &(struct clk_init_data){
>> +                       .name = "gcc_usb30_prim_sleep_clk",
>> +                       .ops = &clk_branch2_ops,
>> +               },
>> +       },
>> +};
>> +
>> +static struct clk_branch gcc_usb3_prim_clkref_clk = {
>> +       .halt_reg = 0x8c010,
>> +       .halt_check = BRANCH_HALT,
>> +       .clkr = {
>> +               .enable_reg = 0x8c010,
>> +               .enable_mask = BIT(0),
>> +               .hw.init = &(struct clk_init_data){
>> +                       .name = "gcc_usb3_prim_clkref_clk",
>> +                       .ops = &clk_branch2_ops,
>> +               },
>> +       },
>> +};
>> +
>> +static struct clk_branch gcc_usb3_prim_phy_aux_clk = {
>> +       .halt_reg = 0xf050,
>> +       .halt_check = BRANCH_HALT,
>> +       .clkr = {
>> +               .enable_reg = 0xf050,
>> +               .enable_mask = BIT(0),
>> +               .hw.init = &(struct clk_init_data){
>> +                       .name = "gcc_usb3_prim_phy_aux_clk",
>> +                       .parent_data = &(const struct clk_parent_data){
>> +                               .hw = &gcc_usb3_prim_phy_aux_clk_src.clkr.hw,
>> +                       },
>> +                       .num_parents = 1,
>> +                       .flags = CLK_SET_RATE_PARENT,
>> +                       .ops = &clk_branch2_ops,
>> +               },
>> +       },
>> +};
>> +
>> +static struct clk_branch gcc_usb3_prim_phy_com_aux_clk = {
>> +       .halt_reg = 0xf054,
>> +       .halt_check = BRANCH_HALT,
>> +       .clkr = {
>> +               .enable_reg = 0xf054,
>> +               .enable_mask = BIT(0),
>> +               .hw.init = &(struct clk_init_data){
>> +                       .name = "gcc_usb3_prim_phy_com_aux_clk",
>> +                       .parent_data = &(const struct clk_parent_data){
>> +                               .hw = &gcc_usb3_prim_phy_aux_clk_src.clkr.hw,
>> +                       },
>> +                       .num_parents = 1,
>> +                       .flags = CLK_SET_RATE_PARENT,
>> +                       .ops = &clk_branch2_ops,
>> +               },
>> +       },
>> +};
>> +
>> +static struct clk_branch gcc_usb3_prim_phy_pipe_clk = {
>> +       .halt_reg = 0xf058,
>> +       .halt_check = BRANCH_HALT_SKIP,
> 
> Why does this need halt_skip?

This is required as the source is external PHY, so we want to not check 
for HALT.

> 
>> +       .clkr = {
>> +               .enable_reg = 0xf058,
>> +               .enable_mask = BIT(0),
>> +               .hw.init = &(struct clk_init_data){
>> +                       .name = "gcc_usb3_prim_phy_pipe_clk",
>> +                       .ops = &clk_branch2_ops,
>> +               },
>> +       },
>> +};
>> +
>> +static struct clk_branch gcc_usb_phy_cfg_ahb2phy_clk = {
>> +       .halt_reg = 0x6a004,
>> +       .halt_check = BRANCH_HALT,
>> +       .hwcg_reg = 0x6a004,
>> +       .hwcg_bit = 1,
>> +       .clkr = {
>> +               .enable_reg = 0x6a004,
>> +               .enable_mask = BIT(0),
>> +               .hw.init = &(struct clk_init_data){
>> +                       .name = "gcc_usb_phy_cfg_ahb2phy_clk",
>> +                       .ops = &clk_branch2_ops,
>> +               },
>> +       },
>> +};
>> +
>> +/* Leave the clock ON for parent config_noc_clk to be kept enabled */
> 
> There's no parent though... So I guess this means it keeps it enabled
> implicitly in hardware?
> 

These are not left enabled, but want to leave them enabled for clients 
on config NOC.

>> +static struct clk_branch gcc_video_ahb_clk = {
>> +       .halt_reg = 0xb004,
>> +       .halt_check = BRANCH_HALT,
>> +       .hwcg_reg = 0xb004,
>> +       .hwcg_bit = 1,
>> +       .clkr = {
>> +               .enable_reg = 0xb004,
>> +               .enable_mask = BIT(0),
>> +               .hw.init = &(struct clk_init_data){
>> +                       .name = "gcc_video_ahb_clk",
>> +                       .flags = CLK_IS_CRITICAL,
>> +                       .ops = &clk_branch2_ops,
>> +               },
>> +       },
>> +};
>> +
> [..]
>> +
>> +static const struct qcom_reset_map gcc_sc7180_resets[] = {
>> +       [GCC_QUSB2PHY_PRIM_BCR] = { 0x26000 },
>> +       [GCC_QUSB2PHY_SEC_BCR] = { 0x26004 },
>> +       [GCC_UFS_PHY_BCR] = { 0x77000 },
>> +       [GCC_USB30_PRIM_BCR] = { 0xf000 },
>> +       [GCC_USB3_PHY_PRIM_BCR] = { 0x50000 },
>> +       [GCC_USB3PHY_PHY_PRIM_BCR] = { 0x50004 },
>> +       [GCC_USB3_PHY_SEC_BCR] = { 0x5000c },
>> +       [GCC_USB3_DP_PHY_PRIM_BCR] = { 0x50008 },
>> +       [GCC_USB3PHY_PHY_SEC_BCR] = { 0x50010 },
>> +       [GCC_USB3_DP_PHY_SEC_BCR] = { 0x50014 },
>> +       [GCC_USB_PHY_CFG_AHB2PHY_BCR] = { 0x6a000 },
>> +};
>> +
>> +static struct clk_rcg_dfs_data gcc_dfs_clocks[] = {
> 
> const?
> 

Will take care of this too.

>> +       DEFINE_RCG_DFS(gcc_qupv3_wrap0_s0_clk_src),
>> +       DEFINE_RCG_DFS(gcc_qupv3_wrap0_s1_clk_src),
>> +       DEFINE_RCG_DFS(gcc_qupv3_wrap0_s2_clk_src),
>> +       DEFINE_RCG_DFS(gcc_qupv3_wrap0_s3_clk_src),
>> +       DEFINE_RCG_DFS(gcc_qupv3_wrap0_s4_clk_src),
>> +       DEFINE_RCG_DFS(gcc_qupv3_wrap0_s5_clk_src),
>> +       DEFINE_RCG_DFS(gcc_qupv3_wrap1_s0_clk_src),
>> +       DEFINE_RCG_DFS(gcc_qupv3_wrap1_s1_clk_src),
>> +       DEFINE_RCG_DFS(gcc_qupv3_wrap1_s2_clk_src),
>> +       DEFINE_RCG_DFS(gcc_qupv3_wrap1_s3_clk_src),
>> +       DEFINE_RCG_DFS(gcc_qupv3_wrap1_s4_clk_src),
>> +       DEFINE_RCG_DFS(gcc_qupv3_wrap1_s5_clk_src),
>> +};
>> +
>> +static const struct regmap_config gcc_sc7180_regmap_config = {
>> +       .reg_bits = 32,
>> +       .reg_stride = 4,
>> +       .val_bits = 32,
>> +       .max_register = 0x18208c,
>> +       .fast_io = true,
>> +};
>> +
>> +static const struct qcom_cc_desc gcc_sc7180_desc = {
>> +       .config = &gcc_sc7180_regmap_config,
>> +       .clk_hws = gcc_sc7180_hws,
>> +       .num_clk_hws = ARRAY_SIZE(gcc_sc7180_hws),
>> +       .clks = gcc_sc7180_clocks,
>> +       .num_clks = ARRAY_SIZE(gcc_sc7180_clocks),
>> +       .resets = gcc_sc7180_resets,
>> +       .num_resets = ARRAY_SIZE(gcc_sc7180_resets),
>> +       .gdscs = gcc_sc7180_gdscs,
>> +       .num_gdscs = ARRAY_SIZE(gcc_sc7180_gdscs),
>> +};
>> +
>> +static const struct of_device_id gcc_sc7180_match_table[] = {
>> +       { .compatible = "qcom,gcc-sc7180" },
>> +       { }
>> +};
>> +MODULE_DEVICE_TABLE(of, gcc_sc7180_match_table);
>> +
>> +static int gcc_sc7180_probe(struct platform_device *pdev)
>> +{
>> +       struct regmap *regmap;
>> +       int ret;
>> +
>> +       regmap = qcom_cc_map(pdev, &gcc_sc7180_desc);
>> +       if (IS_ERR(regmap))
>> +               return PTR_ERR(regmap);
>> +
>> +       /*
>> +        * Disable the GPLL0 active input to MM blocks, NPU
>> +        * and GPU via MISC registers.
>> +        */
>> +       regmap_update_bits(regmap, GCC_MMSS_MISC, 0x3, 0x3);
>> +       regmap_update_bits(regmap, GCC_NPU_MISC, 0x3, 0x3);
>> +       regmap_update_bits(regmap, GCC_GPU_MISC, 0x3, 0x3);
>> +
>> +       ret = qcom_cc_register_rcg_dfs(regmap, gcc_dfs_clocks,
>> +                                       ARRAY_SIZE(gcc_dfs_clocks));
>> +       if (ret)
>> +               return ret;
>> +
>> +       return qcom_cc_really_probe(pdev, &gcc_sc7180_desc, regmap);
>> +}
>> +
>> +static struct platform_driver gcc_sc7180_driver = {
>> +       .probe = gcc_sc7180_probe,
>> +       .driver = {
>> +               .name = "gcc-sc7180",
>> +               .of_match_table = gcc_sc7180_match_table,
>> +       },
>> +};
>> +
>> +static int __init gcc_sc7180_init(void)
>> +{
>> +       return platform_driver_register(&gcc_sc7180_driver);
>> +}
>> +subsys_initcall(gcc_sc7180_init);
> 
> Make this core_initcall because Amit has done that for other drivers.
> 

Will move it to core_initcall().

>> +
>> +static void __exit gcc_sc7180_exit(void)
>> +{
>> +       platform_driver_unregister(&gcc_sc7180_driver);
>> +}
>> +module_exit(gcc_sc7180_exit);
>> +
>> +MODULE_DESCRIPTION("QTI GCC SC7180 Driver");
>> +MODULE_LICENSE("GPL v2");

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation.

--
