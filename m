Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 262651B4049
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2020 12:45:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730237AbgDVKo4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 22 Apr 2020 06:44:56 -0400
Received: from mail26.static.mailgun.info ([104.130.122.26]:31200 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1731658AbgDVKoz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 22 Apr 2020 06:44:55 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1587552294; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: To:
 Subject: Sender; bh=X9RGF6DVDVLfxnPxoe5Yh8TPlAiL8319mi3nRhdPovs=; b=OQActlqC+V8qqn9g1ygbzCvwF41w17OcMbU24Zw54Xy0mo9mJgE1d5ZGnttamOQg4zZGaJo4
 pHiqDgm0tWRUc7lxYvzg+8RLBXIgQLqkLgYZAdeB8CzDSaWOM/IqJrDl82nQXuZo+x9nwr+F
 CDv/+NGQr/bMiBvv7NAbHkAIHiA=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5ea02019.7ff1f3af2500-smtp-out-n05;
 Wed, 22 Apr 2020 10:44:41 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 05D28C433F2; Wed, 22 Apr 2020 10:44:40 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [192.168.0.105] (unknown [49.207.137.37])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: sivaprak)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 2CC38C433D2;
        Wed, 22 Apr 2020 10:44:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 2CC38C433D2
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=sivaprak@codeaurora.org
Subject: Re: [PATCH V3 3/8] clk: qcom: Add A53 PLL support for ipq6018 devices
To:     Stephen Boyd <sboyd@kernel.org>, agross@kernel.org,
        bjorn.andersson@linaro.org, devicetree@vger.kernel.org,
        jassisinghbrar@gmail.com, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        mturquette@baylibre.com, robh+dt@kernel.org
References: <1586832922-29191-1-git-send-email-sivaprak@codeaurora.org>
 <1586832922-29191-4-git-send-email-sivaprak@codeaurora.org>
 <158754602745.132238.14379194464345140559@swboyd.mtv.corp.google.com>
From:   Sivaprakash Murugesan <sivaprak@codeaurora.org>
Message-ID: <4025e5c3-b532-d235-f73b-2b86055bdde2@codeaurora.org>
Date:   Wed, 22 Apr 2020 16:14:33 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <158754602745.132238.14379194464345140559@swboyd.mtv.corp.google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Stephen,

On 4/22/2020 2:30 PM, Stephen Boyd wrote:
> Quoting Sivaprakash Murugesan (2020-04-13 19:55:17)
>> The CPUs on Qualcomm IPQ6018 platform is primarily clocked by A53 PLL.
>> This patch adds support for the A53 PLL on IPQ6018 devices which can
>> support CPU frequencies above 1Ghz.
>>
>> Signed-off-by: Sivaprakash Murugesan <sivaprak@codeaurora.org>
>> ---
>>   drivers/clk/qcom/a53-pll.c | 136 ++++++++++++++++++++++++++++++++++++---------
>>   1 file changed, 111 insertions(+), 25 deletions(-)
>>
>> diff --git a/drivers/clk/qcom/a53-pll.c b/drivers/clk/qcom/a53-pll.c
>> index 45cfc57..a95351c 100644
>> --- a/drivers/clk/qcom/a53-pll.c
>> +++ b/drivers/clk/qcom/a53-pll.c
>> @@ -11,11 +11,40 @@
>>   #include <linux/platform_device.h>
>>   #include <linux/regmap.h>
>>   #include <linux/module.h>
>> +#include <linux/of_device.h>
> Why does this driver need to change to use of_device APIs?
we can use devm APIs and avoid this in next patch.
>
>>   
>>   #include "clk-pll.h"
>>   #include "clk-regmap.h"
>> +#include "clk-alpha-pll.h"
>>   
>> -static const struct pll_freq_tbl a53pll_freq[] = {
>> +struct a53_alpha_pll {
>> +       struct alpha_pll_config *pll_config;
>> +       struct clk_alpha_pll *pll;
>> +};
>> +
>> +union a53pll {
>> +       struct clk_pll *pll;
>> +       struct a53_alpha_pll alpha_pll;
>> +};
>> +
>> +struct a53pll_data {
>> +#define PLL_IS_ALPHA BIT(0)
>> +       u8 flags;
>> +       union a53pll a53pll;
> Why is there a union? Can't we have different clk ops for the two types
> of PLLs and then use container_of to get it from the clk ops?
ok.
>
>> +};
>> +
>> +static const u8 ipq_pll_offsets[] = {
>> +       [PLL_OFF_L_VAL] = 0x08,
>> +       [PLL_OFF_ALPHA_VAL] = 0x10,
>> +       [PLL_OFF_USER_CTL] = 0x18,
>> +       [PLL_OFF_CONFIG_CTL] = 0x20,
>> +       [PLL_OFF_CONFIG_CTL_U] = 0x24,
>> +       [PLL_OFF_STATUS] = 0x28,
>> +       [PLL_OFF_TEST_CTL] = 0x30,
>> +       [PLL_OFF_TEST_CTL_U] = 0x34,
>> +};
>> +
>> +static const struct pll_freq_tbl msm8996_a53pll_freq[] = {
>>          {  998400000, 52, 0x0, 0x1, 0 },
>>          { 1094400000, 57, 0x0, 0x1, 0 },
>>          { 1152000000, 62, 0x0, 0x1, 0 },
>> @@ -26,6 +55,64 @@ static const struct pll_freq_tbl a53pll_freq[] = {
>>          { }
>>   };
>>   
>> +static struct clk_pll msm8996_pll = {
>> +       .mode_reg = 0x0,
>> +       .l_reg = 0x04,
>> +       .m_reg = 0x08,
>> +       .n_reg = 0x0c,
>> +       .config_reg = 0x14,
>> +       .status_reg = 0x1c,
>> +       .status_bit = 16,
>> +       .freq_tbl = msm8996_a53pll_freq,
>> +       .clkr.hw.init = &(struct clk_init_data){
>> +               .name = "a53pll",
>> +               .flags = CLK_IS_CRITICAL,
>> +               .parent_data = &(const struct clk_parent_data){
>> +                       .fw_name = "xo",
>> +                       .name = "xo",
>> +               },
>> +               .num_parents = 1,
>> +               .ops = &clk_pll_sr2_ops,
>> +       },
>> +};
>> +
>> +static struct clk_alpha_pll ipq6018_pll = {
>> +       .offset = 0x0,
>> +       .regs = ipq_pll_offsets,
>> +       .flags = SUPPORTS_DYNAMIC_UPDATE,
>> +       .clkr = {
>> +               .enable_reg = 0x0,
>> +               .enable_mask = BIT(0),
>> +               .hw.init = &(struct clk_init_data){
>> +                       .name = "a53pll",
>> +                       .flags = CLK_IS_CRITICAL,
>> +                       .parent_data = &(const struct clk_parent_data){
>> +                               .fw_name = "xo",
>> +                       },
>> +                       .num_parents = 1,
>> +                       .ops = &clk_alpha_pll_huayra_ops,
>> +               },
>> +       },
>> +};
>> +
>> +static struct alpha_pll_config ipq6018_pll_config = {
> Can this be const?
yeah it can be. will fix up in next patch.
>
>> +       .l = 0x37,
>> +       .config_ctl_val = 0x04141200,
>> +       .config_ctl_hi_val = 0x0,
>> +       .early_output_mask = BIT(3),
>> +       .main_output_mask = BIT(0),
>> +};
>> +
>> +static struct a53pll_data msm8996pll_data = {
>> +       .a53pll.pll = &msm8996_pll,
>> +};
>> +
>> +static struct a53pll_data ipq6018pll_data = {
>> +       .flags = PLL_IS_ALPHA,
>> +       .a53pll.alpha_pll.pll = &ipq6018_pll,
>> +       .a53pll.alpha_pll.pll_config = &ipq6018_pll_config,
>> +};
>> +
>>   static const struct regmap_config a53pll_regmap_config = {
>>          .reg_bits               = 32,
>>          .reg_stride             = 4,
>> @@ -39,14 +126,16 @@ static int qcom_a53pll_probe(struct platform_device *pdev)
>>          struct device *dev = &pdev->dev;
>>          struct regmap *regmap;
>>          struct resource *res;
>> -       struct clk_pll *pll;
>> +       const struct a53pll_data *pll_data;
>> +       struct clk_regmap *clkr;
>>          void __iomem *base;
>> -       struct clk_init_data init = { };
>>          int ret;
>>   
>> -       pll = devm_kzalloc(dev, sizeof(*pll), GFP_KERNEL);
>> -       if (!pll)
>> -               return -ENOMEM;
>> +       pll_data = of_device_get_match_data(dev);
> Use device_get_match_data() please.
ok.
>
>> +       if (!pll_data) {
>> +               dev_err(dev, "failed to get platform data\n");
> No error message please.
ok.
>
>> +               return -ENODEV;
>> +       }
>>   
>>          res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>>          base = devm_ioremap_resource(dev, res);
>> @@ -57,30 +146,26 @@ static int qcom_a53pll_probe(struct platform_device *pdev)
>>          if (IS_ERR(regmap))
>>                  return PTR_ERR(regmap);
>>   
>> -       pll->l_reg = 0x04;
>> -       pll->m_reg = 0x08;
>> -       pll->n_reg = 0x0c;
>> -       pll->config_reg = 0x14;
>> -       pll->mode_reg = 0x00;
>> -       pll->status_reg = 0x1c;
>> -       pll->status_bit = 16;
>> -       pll->freq_tbl = a53pll_freq;
>> -
>> -       init.name = "a53pll";
>> -       init.parent_names = (const char *[]){ "xo" };
>> -       init.num_parents = 1;
>> -       init.ops = &clk_pll_sr2_ops;
>> -       init.flags = CLK_IS_CRITICAL;
> Please document why a clk is critical.
ok
>
>> -       pll->clkr.hw.init = &init;
>> -
>> -       ret = devm_clk_register_regmap(dev, &pll->clkr);
>> +       if (pll_data->flags & PLL_IS_ALPHA) {
>> +               struct clk_alpha_pll *alpha_pll =
>> +                       pll_data->a53pll.alpha_pll.pll;
>> +               struct alpha_pll_config *alpha_pll_config =
>> +                       pll_data->a53pll.alpha_pll.pll_config;
>> +
>> +               clk_alpha_pll_configure(alpha_pll, regmap, alpha_pll_config);
>> +               clkr = &pll_data->a53pll.alpha_pll.pll->clkr;
>> +       } else {
>> +               clkr = &pll_data->a53pll.pll->clkr;
>> +       }
> Sorry, the design is confusing.

The basic idea is to add support for various PLLs available to clock the 
A53 core.

if this messing up the code, can the alpha pll support be moved to a 
separate file?

It would be very helpful if you provide your input on this.
