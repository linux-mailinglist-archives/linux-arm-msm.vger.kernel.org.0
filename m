Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 637207CBB0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Jul 2019 20:15:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729077AbfGaSPI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 31 Jul 2019 14:15:08 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:41864 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729056AbfGaSPH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 31 Jul 2019 14:15:07 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id E34DE6021C; Wed, 31 Jul 2019 18:15:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1564596905;
        bh=wPD8Jvb3E0+Q5f60Lu+t9iCbpuIdPyPu6BDAgfitmnE=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=iZN0sGcCib+Tib7h4Lv8pbN3m/8JYnsyl/SV1ggFmoKCYGNXZJdWfkF/xfWwAQou0
         eW99NM/oU1419H5jEfpWzN93LTNHJ0PROg/cGGgwcV0VCG9KUuJYyFaRU/2LEzHqEV
         U0vobtw0qo3ezO2uSrzxIHXu+scNSLYdvLToEEY8=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
        version=3.4.0
Received: from [10.79.162.111] (blr-bdr-fw-01_globalnat_allzones-outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: tdas@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id B0E8F6021C;
        Wed, 31 Jul 2019 18:15:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1564596905;
        bh=wPD8Jvb3E0+Q5f60Lu+t9iCbpuIdPyPu6BDAgfitmnE=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=iZN0sGcCib+Tib7h4Lv8pbN3m/8JYnsyl/SV1ggFmoKCYGNXZJdWfkF/xfWwAQou0
         eW99NM/oU1419H5jEfpWzN93LTNHJ0PROg/cGGgwcV0VCG9KUuJYyFaRU/2LEzHqEV
         U0vobtw0qo3ezO2uSrzxIHXu+scNSLYdvLToEEY8=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org B0E8F6021C
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=tdas@codeaurora.org
Subject: Re: [PATCH v2 1/2] clk: qcom: rcg2: Add support for display port
 clock ops
To:     Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     David Brown <david.brown@linaro.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
References: <1557894039-31835-1-git-send-email-tdas@codeaurora.org>
 <1557894039-31835-2-git-send-email-tdas@codeaurora.org>
 <20190715224345.938B02080A@mail.kernel.org>
From:   Taniya Das <tdas@codeaurora.org>
Message-ID: <57d35673-10cd-0bc2-1c65-c777de3a000a@codeaurora.org>
Date:   Wed, 31 Jul 2019 23:45:00 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190715224345.938B02080A@mail.kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello Stephen,

Thanks for your review.

On 7/16/2019 4:13 AM, Stephen Boyd wrote:
> Quoting Taniya Das (2019-05-14 21:20:38)
>> diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
>> index 18bdf34..0de080f 100644
>> --- a/drivers/clk/qcom/Kconfig
>> +++ b/drivers/clk/qcom/Kconfig
>> @@ -15,6 +15,7 @@ menuconfig COMMON_CLK_QCOM
>>          depends on ARCH_QCOM || COMPILE_TEST
>>          select REGMAP_MMIO
>>          select RESET_CONTROLLER
>> +       select RATIONAL
> 
> Make this an alphabetical list of selects please.
> 

Sure, would take care in the next patch.

>>
>>   if COMMON_CLK_QCOM
>>
>> diff --git a/drivers/clk/qcom/clk-rcg2.c b/drivers/clk/qcom/clk-rcg2.c
>> index 8c02bff..98071c0 100644
>> --- a/drivers/clk/qcom/clk-rcg2.c
>> +++ b/drivers/clk/qcom/clk-rcg2.c
>> @@ -1128,3 +1129,81 @@ int qcom_cc_register_rcg_dfs(struct regmap *regmap,
>>          return 0;
>>   }
>>   EXPORT_SYMBOL_GPL(qcom_cc_register_rcg_dfs);
>> +
>> +static int clk_rcg2_dp_set_rate(struct clk_hw *hw, unsigned long rate,
>> +                       unsigned long parent_rate)
>> +{
>> +       struct clk_rcg2 *rcg = to_clk_rcg2(hw);
>> +       struct freq_tbl f = { 0 };
>> +       u32 mask = BIT(rcg->hid_width) - 1;
>> +       u32 hid_div, cfg;
>> +       int i, num_parents = clk_hw_get_num_parents(hw);
>> +       unsigned long num, den;
>> +
>> +       rational_best_approximation(parent_rate, rate,
>> +                       GENMASK(rcg->mnd_width - 1, 0),
>> +                       GENMASK(rcg->mnd_width - 1, 0), &den, &num);
>> +
>> +       if (!num || !den) {
>> +               pr_err("Invalid MN values derived for requested rate %lu\n",
> 
> Does this ever happen? I worry that this printk could happen many times
> if a driver gets into a bad state and starts selecting invalid
> frequencies over and over again for each frame (every 16ms). Maybe just
> return -EINVAL instead of printing anything.
> 

Would remove the pr_err.

>> +                                                       rate);
>> +               return -EINVAL;
>> +       }
>> +
>> +       regmap_read(rcg->clkr.regmap, rcg->cmd_rcgr + CFG_REG, &cfg);
>> +       hid_div = cfg;
>> +       cfg &= CFG_SRC_SEL_MASK;
>> +       cfg >>= CFG_SRC_SEL_SHIFT;
>> +
>> +       for (i = 0; i < num_parents; i++)
>> +               if (cfg == rcg->parent_map[i].cfg) {
>> +                       f.src = rcg->parent_map[i].src;
>> +                       break;
>> +       }
> 
> Weird indent for this brace. Please fix and put a brace on the for
> statement too.
> 

My bad would fix in the next patch.

>> +
>> +       f.pre_div = hid_div;
>> +       f.pre_div >>= CFG_SRC_DIV_SHIFT;
>> +       f.pre_div &= mask;
>> +
>> +       if (num == den) {
>> +               f.m = 0;
>> +               f.n = 0;
> 
> Isn't this the default? So just have if (num != den) here.
> 

I would check for (num != den).

>> +       } else {
>> +               f.m = num;
>> +               f.n = den;
>> +       }
>> +
>> +       return clk_rcg2_configure(rcg, &f);
>> +}
>> +
>> +static int clk_rcg2_dp_set_rate_and_parent(struct clk_hw *hw,
>> +               unsigned long rate, unsigned long parent_rate, u8 index)
>> +{
>> +       return clk_rcg2_dp_set_rate(hw, rate, parent_rate);
>> +}
> 
> Does this need to be implemented? The parent index isn't passed to
> clk_rcg2_dp_set_rate() so I suspect the parent index doesn't matter?
> Does the parent change?
> 

I guess it is required as the RCG SRC would be 0x0 by default.

>> +
>> +static int clk_rcg2_dp_determine_rate(struct clk_hw *hw,
>> +                               struct clk_rate_request *req)
>> +{
>> +       struct clk_rate_request parent_req = *req;
>> +       int ret;
>> +
>> +       ret = __clk_determine_rate(clk_hw_get_parent(hw), &parent_req);
>> +       if (ret)
>> +               return ret;
>> +
>> +       req->best_parent_rate = parent_req.rate;
>> +
>> +       return 0;
>> +}
> 
> Do you need this op? It's just calling determine rate on the parent, so
> we already do that if the proper flag is set. I'm confused about this
> function.
> 
Would it be good to leave this function :).

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation.

--
