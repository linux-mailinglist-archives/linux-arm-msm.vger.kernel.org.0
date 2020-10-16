Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 19BE8290B73
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Oct 2020 20:39:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392388AbgJPSjH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 16 Oct 2020 14:39:07 -0400
Received: from m42-4.mailgun.net ([69.72.42.4]:36218 "EHLO m42-4.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2392385AbgJPSjH (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 16 Oct 2020 14:39:07 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1602873546; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=tghyBVUWLI7t5xbuuIwx+4+eBlmCinuuCN57kJKXtLE=; b=lDczr6lj/Jc5ev7JUOPnTZ95WzOVKs2/38d+S6a0YdufM+9k6cHVw5QDCFdl9/KKhFgNFgrA
 UK0LRlhB52oSl5DJ7H21VU2CjNdZdkAO49MUe7X+4pPDYG+OU3AkgvmkSJ33E7cVNjLKHtoI
 USJkxRmXOUZnX4VuRBR6nPJMvrc=
X-Mailgun-Sending-Ip: 69.72.42.4
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-east-1.postgun.com with SMTP id
 5f89e8c94f8cc67c319bc9f6 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 16 Oct 2020 18:39:05
 GMT
Sender: tdas=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id EA502C433F1; Fri, 16 Oct 2020 18:39:04 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.2 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,SPF_FAIL autolearn=no autolearn_force=no version=3.4.0
Received: from [192.168.0.105] (unknown [49.204.183.234])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: tdas)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 34E4FC433CB;
        Fri, 16 Oct 2020 18:39:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 34E4FC433CB
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=tdas@codeaurora.org
Subject: Re: [PATCH v2 1/3] clk: qcom: clk-alpha-pll: Add support for
 controlling Agera PLLs
To:     Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     David Brown <david.brown@linaro.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Andy Gross <agross@kernel.org>, devicetree@vger.kernel.org,
        robh@kernel.org, robh+dt@kernel.org
References: <1602609110-11504-1-git-send-email-tdas@codeaurora.org>
 <1602609110-11504-2-git-send-email-tdas@codeaurora.org>
 <160264125446.310579.18150875025884105137@swboyd.mtv.corp.google.com>
From:   Taniya Das <tdas@codeaurora.org>
Message-ID: <1d969460-92c7-ce9a-d727-2c0a31c5d3c5@codeaurora.org>
Date:   Sat, 17 Oct 2020 00:08:58 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.2
MIME-Version: 1.0
In-Reply-To: <160264125446.310579.18150875025884105137@swboyd.mtv.corp.google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Thanks Stephen for the review comments.

On 10/14/2020 7:37 AM, Stephen Boyd wrote:
> Quoting Taniya Das (2020-10-13 10:11:48)
>> diff --git a/drivers/clk/qcom/clk-alpha-pll.c b/drivers/clk/qcom/clk-alpha-pll.c
>> index 26139ef..17e1fc0 100644
>> --- a/drivers/clk/qcom/clk-alpha-pll.c
>> +++ b/drivers/clk/qcom/clk-alpha-pll.c
>> @@ -1561,3 +1571,73 @@ const struct clk_ops clk_alpha_pll_postdiv_lucid_ops = {
>>          .set_rate = clk_alpha_pll_postdiv_fabia_set_rate,
>>   };
>>   EXPORT_SYMBOL_GPL(clk_alpha_pll_postdiv_lucid_ops);
>> +
>> +void clk_agera_pll_configure(struct clk_alpha_pll *pll, struct regmap *regmap,
>> +                       const struct alpha_pll_config *config)
>> +{
>> +       if (config->l)
>> +               regmap_write(regmap, PLL_L_VAL(pll), config->l);
> 
> Maybe make a helper function for this too. That way we can't mix up the
> if condition with the value in the write.
> 

Sure, I will add a helper function.

> 	clk_alpha_pll_write_config(regmap, PLL_L_VAL(pll), config->l);
> 
> static void clk_alpha_pll_write_config(struct regmap *regmap,
> 				       unsigned int reg,
> 				       unsigned int val) {
> 	if (val)
> 		regmap_write(regmap, reg, val);
> }
> 
> and how are we so lucky that zero isn't a value that we may need to
> write?
> 
>> +
>> +       if (config->alpha)
>> +               regmap_write(regmap, PLL_ALPHA_VAL(pll), config->alpha);
>> +
>> +       if (config->user_ctl_val)
>> +               regmap_write(regmap, PLL_USER_CTL(pll), config->user_ctl_val);
>> +
>> +       if (config->config_ctl_val)
>> +               regmap_write(regmap, PLL_CONFIG_CTL(pll),
>> +                                               config->config_ctl_val);
>> +
>> +       if (config->config_ctl_hi_val)
>> +               regmap_write(regmap, PLL_CONFIG_CTL_U(pll),
>> +                                               config->config_ctl_hi_val);
>> +
>> +       if (config->test_ctl_val)
>> +               regmap_write(regmap, PLL_TEST_CTL(pll),
>> +                                               config->test_ctl_val);
>> +
>> +       if (config->test_ctl_hi_val)
>> +               regmap_write(regmap,  PLL_TEST_CTL_U(pll),
>> +                                               config->test_ctl_hi_val);
>> +}
>> +EXPORT_SYMBOL_GPL(clk_agera_pll_configure);
>> +
>> +static int clk_alpha_pll_agera_set_rate(struct clk_hw *hw, unsigned long rate,
>> +                                                       unsigned long prate)
>> +{
>> +       struct clk_alpha_pll *pll = to_clk_alpha_pll(hw);
>> +       u32 l, alpha_width = pll_alpha_width(pll);
>> +       unsigned long rrate, max = rate + PLL_RATE_MARGIN;
>> +       u64 a;
>> +
>> +       rrate = alpha_pll_round_rate(rate, prate, &l, &a, alpha_width);
>> +
>> +       /*
>> +        * Due to limited number of bits for fractional rate programming, the
>> +        * rounded up rate could be marginally higher than the requested rate.
>> +        */
>> +       if (rrate > (rate + PLL_RATE_MARGIN) || rrate < rate) {
>> +               pr_err("%s: Rounded rate %lu not within range [%lu, %lu)\n",
>> +                      clk_hw_get_name(hw), rrate, rate, max);
>> +               return -EINVAL;
>> +       }
> 
> Can this be extracted into a helper function?
> 

Yes, I will add this too.

>> +
>> +       /* change L_VAL without having to go through the power on sequence */
>> +       regmap_write(pll->clkr.regmap, PLL_L_VAL(pll), l);
>> +       regmap_write(pll->clkr.regmap, PLL_ALPHA_VAL(pll), a);
>> +
>> +       if (clk_hw_is_enabled(hw))
>> +               return wait_for_pll_enable_lock(pll);
>> +
>> +       return 0;
>> +}
>> +

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation.

--
