Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 229861F59C8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2020 19:12:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729374AbgFJRMK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 10 Jun 2020 13:12:10 -0400
Received: from mail27.static.mailgun.info ([104.130.122.27]:42067 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729426AbgFJRMF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 10 Jun 2020 13:12:05 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1591809124; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=Jt8mZoNNfftrfl4eTluurZCUY1cGFSIkcjywI15u/kI=; b=xhb9ODaD44Z+vyBmsN4dn7Oiu66djwc/QbwGuz+MM66cfSSdOmPv9KsyUQ5592g7F4TGy94J
 Cr9J8opiZU5rkxmfJ2mp5LIadJkKtdqsrpYzyGivMhljCedb51rzUOVJRqjQqcFP5qZHRpNd
 ZPV5Q5YOBynSpd/VRRC2wppfAUc=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n11.prod.us-east-1.postgun.com with SMTP id
 5ee1145c0206ad41d1e98cd0 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 10 Jun 2020 17:11:56
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id A1A94C43391; Wed, 10 Jun 2020 17:11:55 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [192.168.0.104] (unknown [183.82.139.165])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: tdas)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 9D298C433CA;
        Wed, 10 Jun 2020 17:11:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 9D298C433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=tdas@codeaurora.org
Subject: Re: [PATCH v2 4/4] clk: qcom: lpass: Add support for LPASS clock
 controller for SC7180
To:     Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     David Brown <david.brown@linaro.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Andy Gross <agross@kernel.org>, devicetree@vger.kernel.org,
        robh@kernel.org, robh+dt@kernel.org
References: <1589707344-8871-1-git-send-email-tdas@codeaurora.org>
 <1589707344-8871-5-git-send-email-tdas@codeaurora.org>
 <159054904061.88029.1394425232497625411@swboyd.mtv.corp.google.com>
From:   Taniya Das <tdas@codeaurora.org>
Message-ID: <3ac34bd7-bc5b-bc04-99ba-8ba3c5a9a691@codeaurora.org>
Date:   Wed, 10 Jun 2020 22:41:49 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.1
MIME-Version: 1.0
In-Reply-To: <159054904061.88029.1394425232497625411@swboyd.mtv.corp.google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Thanks for your review.

On 5/27/2020 8:40 AM, Stephen Boyd wrote:
> Quoting Taniya Das (2020-05-17 02:22:24)
>> diff --git a/drivers/clk/qcom/lpasscorecc-sc7180.c b/drivers/clk/qcom/lpasscorecc-sc7180.c
>> new file mode 100644
>> index 0000000..86e3599
>> --- /dev/null
>> +++ b/drivers/clk/qcom/lpasscorecc-sc7180.c
>> @@ -0,0 +1,479 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +/*
>> + * Copyright (c) 2020, The Linux Foundation. All rights reserved.
>> + */
>> +
>> +#include <linux/clk-provider.h>
>> +#include <linux/err.h>
>> +#include <linux/module.h>
>> +#include <linux/of_device.h>
>> +#include <linux/pm_clock.h>
>> +#include <linux/pm_runtime.h>
>> +#include <linux/of.h>
>> +#include <linux/regmap.h>
>> +
>> +#include <dt-bindings/clock/qcom,lpasscorecc-sc7180.h>
>> +
>> +#include "clk-alpha-pll.h"
>> +#include "clk-branch.h"
>> +#include "clk-rcg.h"
>> +#include "clk-regmap.h"
>> +#include "common.h"
>> +#include "gdsc.h"
>> +
>> +enum {
>> +       P_BI_TCXO,
>> +       P_LPASS_LPAAUDIO_DIG_PLL_OUT_ODD,
>> +       P_SLEEP_CLK,
>> +};
>> +
>> +static struct pll_vco fabia_vco[] = {
>> +       { 249600000, 2000000000, 0 },
>> +};
>> +
>> +static const struct alpha_pll_config lpass_lpaaudio_dig_pll_config = {
>> +       .l = 0x20,
> [...]
>> +
>> +static struct regmap_config lpass_core_cc_sc7180_regmap_config = {
>> +       .reg_bits = 32,
>> +       .reg_stride = 4,
>> +       .val_bits = 32,
>> +       .fast_io = true,
>> +};
>> +
>> +static const struct qcom_cc_desc lpass_core_hm_sc7180_desc = {
>> +       .config = &lpass_core_cc_sc7180_regmap_config,
>> +       .gdscs = lpass_core_hm_sc7180_gdscs,
>> +       .num_gdscs = ARRAY_SIZE(lpass_core_hm_sc7180_gdscs),
>> +};
>> +
>> +static const struct qcom_cc_desc lpass_core_cc_sc7180_desc = {
>> +       .config = &lpass_core_cc_sc7180_regmap_config,
>> +       .clks = lpass_core_cc_sc7180_clocks,
>> +       .num_clks = ARRAY_SIZE(lpass_core_cc_sc7180_clocks),
>> +};
>> +
>> +static const struct qcom_cc_desc lpass_audio_hm_sc7180_desc = {
>> +       .config = &lpass_core_cc_sc7180_regmap_config,
>> +       .gdscs = lpass_audio_hm_sc7180_gdscs,
>> +       .num_gdscs = ARRAY_SIZE(lpass_audio_hm_sc7180_gdscs),
>> +};
>> +
>> +
> 
> Drop double newline please.
> 

Done.

>> +static int lpass_core_cc_sc7180_probe(struct platform_device *pdev)
>> +{
>> +       const struct qcom_cc_desc *desc;
>> +       struct regmap *regmap;
>> +       int ret;
>> +
>> +       lpass_core_cc_sc7180_regmap_config.name = "lpass_audio_cc";
>> +       desc = &lpass_audio_hm_sc7180_desc;
>> +       ret = qcom_cc_probe_by_index(pdev, 1, desc);
>> +       if (ret)
>> +               return ret;
>> +
>> +       lpass_core_cc_sc7180_regmap_config.name = "lpass_core_cc";
>> +       regmap = qcom_cc_map(pdev, &lpass_core_cc_sc7180_desc);
>> +       if (IS_ERR(regmap))
>> +               return PTR_ERR(regmap);
>> +
>> +       /*
>> +        * Keep the CLK always-ON
> 
> Why? Presumably to make sure we can access the lpass sysnoc path all the
> time?
> 

This is an always ON clock from HW, just making sure to keep it enabled.

>> +        * LPASS_AUDIO_CORE_SYSNOC_SWAY_CORE_CLK
>> +        */
>> +       regmap_update_bits(regmap, 0x24000, BIT(0), BIT(0));
>> +
>> +       /* PLL settings */
>> +       regmap_write(regmap, 0x1008, 0x20);
>> +       regmap_update_bits(regmap, 0x1014, BIT(0), BIT(0));
>> +
>> +       clk_fabia_pll_configure(&lpass_lpaaudio_dig_pll, regmap,
>> +                               &lpass_lpaaudio_dig_pll_config);
>> +
>> +       return qcom_cc_really_probe(pdev, &lpass_core_cc_sc7180_desc, regmap);
>> +}
>> +
>> +static int lpass_hm_core_probe(struct platform_device *pdev)
>> +{
>> +       const struct qcom_cc_desc *desc;
>> +       int ret;
>> +
>> +       lpass_core_cc_sc7180_regmap_config.name = "lpass_hm_core";
>> +       desc = &lpass_core_hm_sc7180_desc;
>> +
>> +       return qcom_cc_probe_by_index(pdev, 0, desc);
>> +}
>> +
>> +static const struct of_device_id lpass_core_cc_sc7180_match_table[] = {
>> +       {
>> +               .compatible = "qcom,sc7180-lpasshm",
>> +               .data = lpass_hm_core_probe,
>> +       },
>> +       {
>> +               .compatible = "qcom,sc7180-lpasscorecc",
>> +               .data = lpass_core_cc_sc7180_probe,
>> +       },
>> +       { }
>> +};
>> +MODULE_DEVICE_TABLE(of, lpass_core_cc_sc7180_match_table);
>> +
>> +static int lpass_core_sc7180_probe(struct platform_device *pdev)
>> +{
>> +       int (*clk_probe)(struct platform_device *p);
>> +       int ret;
>> +
>> +       pm_runtime_enable(&pdev->dev);
>> +       ret = pm_clk_create(&pdev->dev);
>> +       if (ret)
>> +               return ret;
>> +
>> +       ret = pm_clk_add(&pdev->dev, "gcc_lpass_sway");
>> +       if (ret < 0) {
>> +               dev_err(&pdev->dev, "failed to acquire iface clock\n");
> 
> Can the clk name be 'iface' if it's actually the interface clk?
> "gcc_lpass_sway" looks to be the actual clk name which we shouldn't care
> about here. It should be whatever clk name we consider it to be, which
> would mean iface probably.
>

Yes would use "iface".

>> +               goto disable_pm_runtime;
>> +       }
>> +
>> +       clk_probe = of_device_get_match_data(&pdev->dev);
>> +       if (!clk_probe)
>> +               return -EINVAL;
>> +
>> +       ret = clk_probe(pdev);
>> +       if (ret)
>> +               goto destroy_pm_clk;
>> +
>> +       return 0;

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation.

--
