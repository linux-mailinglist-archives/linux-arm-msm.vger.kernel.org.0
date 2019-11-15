Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DB50AFD7B4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Nov 2019 09:11:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726444AbfKOIL3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 15 Nov 2019 03:11:29 -0500
Received: from smtp.codeaurora.org ([198.145.29.96]:56260 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725829AbfKOIL3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 15 Nov 2019 03:11:29 -0500
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 6EF6B602DD; Fri, 15 Nov 2019 08:11:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1573805487;
        bh=MsQ3g6YACKWy0VoucyyMjZwsnX2w548mSWYhWxZGYOY=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=dBDipUXFSZ0loFQaYDrPgqYJwPP1llMsKdMQM0ipiq/7nSvElfQqhz132g5YvDMA8
         xKxG4J2sTYVdZpaKIIlqUoGsg5T2ht/Tb6ixRz8Zv8hxvetRFSaIgONDwoQbNAh90B
         TGmENXzbzE2RkAA3FvgNxfu885h6dUzRZ4mkPW4w=
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
        by smtp.codeaurora.org (Postfix) with ESMTPSA id B272060F93;
        Fri, 15 Nov 2019 08:11:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1573805486;
        bh=MsQ3g6YACKWy0VoucyyMjZwsnX2w548mSWYhWxZGYOY=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=F5Bctf+x4zQ7RRvly/eEmhLcPNRxKlgSOTH/R2lyLGNfJ4eWpTTd0ZK6mgWI7JbsK
         qDfvtni1635Ryb9UaxyXzRhoUNPorpZjki8XoPIIJYvoWxMZmH3gzsQjmE0MFJjjSr
         L5YW8BDkZA5U78T7iA19e3A7++/7AimEsWrHDTjY=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org B272060F93
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=tdas@codeaurora.org
Subject: Re: [PATCH v1 1/7] clk: qcom: clk-alpha-pll: Add support for Fabia
 PLL calibration
To:     Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     David Brown <david.brown@linaro.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Andy Gross <agross@kernel.org>, devicetree@vger.kernel.org,
        robh@kernel.org, robh+dt@kernel.org
References: <1572524473-19344-1-git-send-email-tdas@codeaurora.org>
 <1572524473-19344-2-git-send-email-tdas@codeaurora.org>
 <20191106003654.BCB312178F@mail.kernel.org>
From:   Taniya Das <tdas@codeaurora.org>
Message-ID: <5a3f5d31-f4c2-f7c1-ba10-0c566bcbaa32@codeaurora.org>
Date:   Fri, 15 Nov 2019 13:41:20 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20191106003654.BCB312178F@mail.kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Stephen,

Thanks for your review.

On 11/6/2019 6:06 AM, Stephen Boyd wrote:
> Quoting Taniya Das (2019-10-31 05:21:07)
>> diff --git a/drivers/clk/qcom/clk-alpha-pll.c b/drivers/clk/qcom/clk-alpha-pll.c
>> index 055318f..8cb77ca 100644
>> --- a/drivers/clk/qcom/clk-alpha-pll.c
>> +++ b/drivers/clk/qcom/clk-alpha-pll.c
>> @@ -1141,15 +1160,11 @@ static int alpha_pll_fabia_set_rate(struct clk_hw *hw, unsigned long rate,
>>                                                  unsigned long prate)
>>   {
>>          struct clk_alpha_pll *pll = to_clk_alpha_pll(hw);
>> -       u32 val, l, alpha_width = pll_alpha_width(pll);
>> +       u32 l, alpha_width = pll_alpha_width(pll);
>>          u64 a;
>>          unsigned long rrate;
>>          int ret = 0;
>>
>> -       ret = regmap_read(pll->clkr.regmap, PLL_MODE(pll), &val);
>> -       if (ret)
>> -               return ret;
>> -
>>          rrate = alpha_pll_round_rate(rate, prate, &l, &a, alpha_width);
>>
>>          /*
> 
> How is this diff related? Looks like it should be split off into another
> patch to remove a useless register read.
> 

I will split this in different patch.

>> @@ -1167,7 +1182,66 @@ static int alpha_pll_fabia_set_rate(struct clk_hw *hw, unsigned long rate,
>>          return __clk_alpha_pll_update_latch(pll);
>>   }
>>
>> +static int alpha_pll_fabia_prepare(struct clk_hw *hw)
>> +{
> 
> Why are we doing this in prepare vs. doing it at PLL configuration time?
> Does it need to be recalibrated each time the PLL is enabled?
> 

In the case if PLL looses the configuration then we would encounter PLL 
locking issues. Thus want to go ahead with prepare. In the case it is 
calibrated it would return.

>> +       struct clk_alpha_pll *pll = to_clk_alpha_pll(hw);
>> +       const struct pll_vco *vco;
>> +       struct clk_hw *parent_hw;
>> +       unsigned long cal_freq, rrate;
>> +       u32 cal_l, regval, alpha_width = pll_alpha_width(pll);
>> +       u64 a;
>> +       int ret;
>> +
>> +       /* Check if calibration needs to be done i.e. PLL is in reset */
>> +       ret = regmap_read(pll->clkr.regmap, PLL_MODE(pll), &regval);
> 
> Please use 'val' instead of 'regval' as regval almost never appears in
> this file already.
> 

Sure, will use 'val'.

>> +       if (ret)
>> +               return ret;
>> +
>> +       /* Return early if calibration is not needed. */
>> +       if (regval & PLL_RESET_N)
>> +               return 0;
>> +
>> +       vco = alpha_pll_find_vco(pll, clk_hw_get_rate(hw));
>> +       if (!vco) {
>> +               pr_err("alpha pll: not in a valid vco range\n");
>> +               return -EINVAL;
>> +       }
>> +
>> +       cal_freq = DIV_ROUND_CLOSEST((pll->vco_table[0].min_freq +
>> +                               pll->vco_table[0].max_freq) * 54, 100);
> 
> Do we need to cast the first argument to a u64 to avoid overflow?
> 

No we do not need.

>> +
>> +       parent_hw = clk_hw_get_parent(hw);
>> +       if (!parent_hw)
>> +               return -EINVAL;
>> +
>> +       rrate = alpha_pll_round_rate(cal_freq, clk_hw_get_rate(parent_hw),
>> +                                       &cal_l, &a, alpha_width);
>> +       /*
>> +        * Due to a limited number of bits for fractional rate programming, the
>> +        * rounded up rate could be marginally higher than the requested rate.
>> +        */
>> +       if (rrate > (cal_freq + FABIA_PLL_RATE_MARGIN) || rrate < cal_freq) {
>> +               pr_err("Call set rate on the PLL with rounded rates!\n");
> 
> This message is weird. Drivers shouldn't need to call set rate with
> rounded rates. What is going on?
> 

:), my bad, copy paste from another function. I will remove this print.

>> +               return -EINVAL;
>> +       }
>> +
>> +       /* Setup PLL for calibration frequency */
>> +       regmap_write(pll->clkr.regmap, PLL_ALPHA_VAL(pll), cal_l);
>> +
>> +       /* Bringup the pll at calibration frequency */
> 
> capitalize PLL.
> 

Will take care of it.

>> +       ret = clk_alpha_pll_enable(hw);
>> +       if (ret) {
>> +               pr_err("alpha pll calibration failed\n");
>> +               return ret;
>> +       }
>> +
>> +       clk_alpha_pll_disable(hw);
>> +
>> +       return 0;
>> +}
>> +

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation.

--
