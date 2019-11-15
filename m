Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 327BEFD7BE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Nov 2019 09:11:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727434AbfKOILl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 15 Nov 2019 03:11:41 -0500
Received: from smtp.codeaurora.org ([198.145.29.96]:56674 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725829AbfKOILj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 15 Nov 2019 03:11:39 -0500
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 04B186119A; Fri, 15 Nov 2019 08:11:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1573805499;
        bh=VIDJtqVnj1N3O9u4S6EbSKIAqRAJrizRqy/9JUGFLRc=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=PzjnM9WDniLssIx6+2HtBqscuD+iCc/9RHdk7ThYjLmS9nFLyngm7pyvFIlK1nmui
         iBAMjqTsY6dlGh33V+x8ieCtaWJO1agGuvMPfes/BBbTcVoy6SL1Fugfeil6+lC9lz
         zdHA+LzVrrhmgZgAAybbqoAAqecc9GBfQBXOJUZs=
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
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 7064F61160;
        Fri, 15 Nov 2019 08:11:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1573805498;
        bh=VIDJtqVnj1N3O9u4S6EbSKIAqRAJrizRqy/9JUGFLRc=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=NDY2inAdO6NUPRxAH9y18ooAP1gU/sawfR3L+7ixSxBSL6llFfG5y/GLfkQs5vV4r
         I2HjbrkbsiFW/p5K62Dp5raymefeI4Ko9Fn41DwmeXCvC1ljyfTe/OQkKrGfx1C2Nk
         wPAZ/4Vl9l/FqddKpFF4bs5GU/SqfQ4IOqBSvLTo=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 7064F61160
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=tdas@codeaurora.org
Subject: Re: [PATCH v1 7/7] clk: qcom: Add video clock controller driver for
 SC7180
To:     Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     David Brown <david.brown@linaro.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Andy Gross <agross@kernel.org>, devicetree@vger.kernel.org,
        robh@kernel.org, robh+dt@kernel.org
References: <1572524473-19344-1-git-send-email-tdas@codeaurora.org>
 <1572524473-19344-8-git-send-email-tdas@codeaurora.org>
 <20191106003944.1BDAE2178F@mail.kernel.org>
From:   Taniya Das <tdas@codeaurora.org>
Message-ID: <80e79595-0672-1d16-f251-717dbe449c57@codeaurora.org>
Date:   Fri, 15 Nov 2019 13:41:31 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20191106003944.1BDAE2178F@mail.kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Stephen,

Thanks for the review.

On 11/6/2019 6:09 AM, Stephen Boyd wrote:
> Quoting Taniya Das (2019-10-31 05:21:13)
>> diff --git a/drivers/clk/qcom/videocc-sc7180.c b/drivers/clk/qcom/videocc-sc7180.c
>> new file mode 100644
>> index 0000000..bef034b
>> --- /dev/null
>> +++ b/drivers/clk/qcom/videocc-sc7180.c
>> @@ -0,0 +1,263 @@
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

I will clean them up.

>> +#include <linux/regmap.h>
>> +
>> +#include <dt-bindings/clock/qcom,videocc-sc7180.h>
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
>> +       P_CHIP_SLEEP_CLK,
>> +       P_CORE_BI_PLL_TEST_SE,
>> +       P_VIDEO_PLL0_OUT_EVEN,
>> +       P_VIDEO_PLL0_OUT_MAIN,
>> +       P_VIDEO_PLL0_OUT_ODD,
>> +};
>> +
>> +static struct pll_vco fabia_vco[] = {
> 
> const?
> 

yes, will add it.

>> +       { 249600000, 2000000000, 0 },
>> +};
>> +
> [...]
>> +
>> +static int video_cc_sc7180_probe(struct platform_device *pdev)
>> +{
>> +       struct regmap *regmap;
>> +       struct alpha_pll_config video_pll0_config = {};
>> +
>> +       regmap = qcom_cc_map(pdev, &video_cc_sc7180_desc);
>> +       if (IS_ERR(regmap))
>> +               return PTR_ERR(regmap);
>> +
>> +       video_pll0_config.l = 0x1F;
> 
> lowercase hex please.
> 
>> +       video_pll0_config.alpha = 0x4000;
>> +       video_pll0_config.user_ctl_val = 0x00000001;
>> +       video_pll0_config.user_ctl_hi_val = 0x00004805;
> 
> Same question, why on stack?
> 

Will update the same.

>> +
>> +       clk_fabia_pll_configure(&video_pll0, regmap, &video_pll0_config);
>> +
>> +       /* video_cc_xo_clk */
> 
> What are we doing? Enabling it?
> 

yes, enabling it. Did not model and mark it CRITICAL.

>> +       regmap_update_bits(regmap, 0x984, 0x1, 0x1);
>> +
>> +       return qcom_cc_really_probe(pdev, &video_cc_sc7180_desc, regmap);
>> +}
>> +
>> +static struct platform_driver video_cc_sc7180_driver = {
>> +       .probe = video_cc_sc7180_probe,
>> +       .driver = {
>> +               .name = "sc7180-videocc",
>> +               .of_match_table = video_cc_sc7180_match_table,
>> +       },
>> +};
>> +
>> +static int __init video_cc_sc7180_init(void)
>> +{
>> +       return platform_driver_register(&video_cc_sc7180_driver);
>> +}
>> +core_initcall(video_cc_sc7180_init);
>> +
>> +static void __exit video_cc_sc7180_exit(void)
>> +{
>> +       platform_driver_unregister(&video_cc_sc7180_driver);
>> +}
>> +module_exit(video_cc_sc7180_exit);
> 
> Same question, module platform driver perhaps?
> 

I will move it to subsys_initcall().

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation.

--
