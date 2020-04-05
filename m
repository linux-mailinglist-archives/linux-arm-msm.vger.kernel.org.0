Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3838F19E9E4
	for <lists+linux-arm-msm@lfdr.de>; Sun,  5 Apr 2020 10:26:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726407AbgDEI0Z (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 5 Apr 2020 04:26:25 -0400
Received: from mail26.static.mailgun.info ([104.130.122.26]:42607 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726402AbgDEI0Z (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 5 Apr 2020 04:26:25 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1586075184; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: To:
 Subject: Sender; bh=T/ED/TDtyl8fWHEuJYiX0c9pYeMm05ZpKV8Aehutj0Y=; b=c8I0QxnqpsaOXBgld3XMuKUW6rZF99sBaXwdMrTEAM66r1YooN0c+mk6BP7WVhZ30fW31DSI
 NHfq0fCpaYGS34SyXDzCVuCe9zFaOZR0dvGZRPm/S5wduVCYCH76dklUwL08jxsAiL9lzAP5
 kCgYuG4QOPCfkTvf7Xyb/xVpD5A=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e89962f.7f7df31b8458-smtp-out-n02;
 Sun, 05 Apr 2020 08:26:23 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 92C9BC43636; Sun,  5 Apr 2020 08:26:22 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [192.168.0.100] (unknown [49.206.125.103])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: sivaprak)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 84039C433D2;
        Sun,  5 Apr 2020 08:26:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 84039C433D2
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=sivaprak@codeaurora.org
Subject: Re: [PATCH 2/2] clk: qcom: Add ipq6018 apss clock controller
To:     Stephen Boyd <sboyd@kernel.org>, agross@kernel.org,
        bjorn.andersson@linaro.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, mturquette@baylibre.com,
        robh+dt@kernel.org
References: <1582797318-26288-1-git-send-email-sivaprak@codeaurora.org>
 <1582797318-26288-3-git-send-email-sivaprak@codeaurora.org>
 <158378547505.66766.155212878365765346@swboyd.mtv.corp.google.com>
From:   Sivaprakash Murugesan <sivaprak@codeaurora.org>
Message-ID: <3131e896-8694-083e-7b0d-a72b4abe6bed@codeaurora.org>
Date:   Sun, 5 Apr 2020 13:56:16 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <158378547505.66766.155212878365765346@swboyd.mtv.corp.google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Stephen,

Thanks for the review.

On 3/10/2020 1:54 AM, Stephen Boyd wrote:
> Quoting Sivaprakash Murugesan (2020-02-27 01:55:18)
>> diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
>> index 15cdcdc..37e4ce2 100644
>> --- a/drivers/clk/qcom/Kconfig
>> +++ b/drivers/clk/qcom/Kconfig
>> @@ -89,6 +89,14 @@ config APQ_MMCC_8084
>>            Say Y if you want to support multimedia devices such as display,
>>            graphics, video encode/decode, camera, etc.
>>   
>> +config IPQ_APSS_6018
>> +       tristate "IPQ6018 APSS Clock Controller"
>> +       select IPQ_GCC_6018
>> +       help
>> +         Support for APSS clock controller on ipq6018 devices. The
>> +         APSS clock controller supports frequencies higher than 800Mhz.
> supports CPU frequencies? It's not clear what APSS is to a lot of people
> out there.
ok. Will try to elaborate.
>
>> +         Say Y if you want to support higher frequencies on ipq6018 devices.
> support CPU frequency scaling on ipq6018?
ok.
>
>> +
>>   config IPQ_GCC_4019
>>          tristate "IPQ4019 Global Clock Controller"
>>          help
>> diff --git a/drivers/clk/qcom/apss-ipq6018.c b/drivers/clk/qcom/apss-ipq6018.c
>> new file mode 100644
>> index 0000000..04b8962
>> --- /dev/null
>> +++ b/drivers/clk/qcom/apss-ipq6018.c
>> @@ -0,0 +1,210 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * Copyright (c) 2018, The Linux Foundation. All rights reserved.
>> + */
>> +
>> +#include <linux/kernel.h>
>> +#include <linux/err.h>
>> +#include <linux/platform_device.h>
>> +#include <linux/module.h>
>> +#include <linux/of.h>
>> +#include <linux/of_device.h>
> Are these two includes needed at all?
No they're not. will remove it.
>> +#include <linux/clk-provider.h>
>> +#include <linux/regmap.h>
>> +
>> +#include <linux/reset-controller.h>
>> +#include <dt-bindings/clock/qcom,apss-ipq6018.h>
>> +
>> +#include "common.h"
>> +#include "clk-regmap.h"
>> +#include "clk-pll.h"
>> +#include "clk-rcg.h"
>> +#include "clk-branch.h"
>> +#include "clk-alpha-pll.h"
>> +#include "clk-regmap-divider.h"
>> +#include "clk-regmap-mux.h"
>> +#include "reset.h"
>> +
>> +#define F(f, s, h, m, n) { (f), (s), (2 * (h) - 1), (m), (n) }
> This can be removed. It's common in clk-rcg.h now
ok.
>
>> +
>> +static struct clk_branch apcs_alias0_core_clk = {
>> +       .halt_reg = 0x004c,
>> +       .clkr = {
>> +               .enable_reg = 0x004c,
>> +               .enable_mask = BIT(0),
>> +               .hw.init = &(struct clk_init_data){
>> +                       .name = "apcs_alias0_core_clk",
>> +                       .parent_hws = (const struct clk_hw *[]){
>> +                               &apcs_alias0_clk_src.clkr.hw },
>> +                       .num_parents = 1,
>> +                       .flags = CLK_SET_RATE_PARENT | CLK_IS_CRITICAL,
> Please add a comment about why CLK_IS_CRITICAL is here. Presumably in
> the case that a cpufreq driver doesn't probe and claim this clk?
ok.
>> +                       .ops = &clk_branch2_ops,
>> +               },
>> +       },
>> +};
>> +
>> +
> [...]
>> +
>> +static int __init apss_ipq6018_init(void)
>> +{
>> +       return platform_driver_register(&apss_ipq6018_driver);
>> +}
>> +core_initcall(apss_ipq6018_init);
>> +
>> +static void __exit apss_ipq6018_exit(void)
>> +{
>> +       platform_driver_unregister(&apss_ipq6018_driver);
>> +}
>> +module_exit(apss_ipq6018_exit);
> Any reason this can't just be module_platform_driver()?
yeah it can be. will fix it.
