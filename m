Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5BCCD341A84
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Mar 2021 11:56:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229796AbhCSK4D (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 19 Mar 2021 06:56:03 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:61904 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229524AbhCSKz4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 19 Mar 2021 06:55:56 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1616151356; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=SBgByFT5AWAa/eG+Y2xwUc15V/2QukdDwlTyjD8/Oc0=; b=ttwbQoI4hfzTR06Pse4mS9hFkrMf3sygG+oyTlSPBOO/E+kZ/rVYpWhQ1zhecDwc/4/ALfjA
 j/G07WO677+WV+KZlpYMaE5zzTZ8kTuFWegXeI3bIsxl58kAEJC5fvkO/h5JlZfo4mG/57k3
 mQWevb9dVIvZbNpNInXG9STHWRc=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-west-2.postgun.com with SMTP id
 60548337e2200c0a0d4fe913 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 19 Mar 2021 10:55:51
 GMT
Sender: tdas=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 241C4C43461; Fri, 19 Mar 2021 10:55:51 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,SPF_FAIL autolearn=no autolearn_force=no version=3.4.0
Received: from [192.168.0.100] (unknown [49.204.182.97])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: tdas)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 1F340C433C6;
        Fri, 19 Mar 2021 10:55:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 1F340C433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=tdas@codeaurora.org
Subject: Re: [PATCH v2] clk: qcom: clk-rcg2: Add support for duty-cycle for
 RCG
To:     Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
References: <1615467092-6982-1-git-send-email-tdas@codeaurora.org>
 <161567639878.1478170.18101287599042992816@swboyd.mtv.corp.google.com>
From:   Taniya Das <tdas@codeaurora.org>
Message-ID: <083432ba-0289-87c1-a8b0-d34cf231cbcb@codeaurora.org>
Date:   Fri, 19 Mar 2021 16:25:39 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <161567639878.1478170.18101287599042992816@swboyd.mtv.corp.google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello Stephen,

Thanks for your review.

On 3/14/2021 4:29 AM, Stephen Boyd wrote:
> Quoting Taniya Das (2021-03-11 04:51:32)
>> The root clock generators with MND divider has the capability to support
>> change in duty-cycle by updating the 'D'. Add the clock ops which would
>> check all the boundary conditions and enable setting the desired duty-cycle
>> as per the consumer.
>>
>> Signed-off-by: Taniya Das <tdas@codeaurora.org>
>> ---
>>   drivers/clk/qcom/clk-rcg2.c | 42 ++++++++++++++++++++++++++++++++++++++++++
>>   1 file changed, 42 insertions(+)
>>
>> diff --git a/drivers/clk/qcom/clk-rcg2.c b/drivers/clk/qcom/clk-rcg2.c
>> index 42f13a2..aac6893 100644
>> --- a/drivers/clk/qcom/clk-rcg2.c
>> +++ b/drivers/clk/qcom/clk-rcg2.c
>> @@ -357,6 +357,46 @@ static int clk_rcg2_set_floor_rate_and_parent(struct clk_hw *hw,
>>          return __clk_rcg2_set_rate(hw, rate, FLOOR);
>>   }
>>
>> +static int clk_rcg2_set_duty_cycle(struct clk_hw *hw, struct clk_duty *duty)
>> +{
>> +       struct clk_rcg2 *rcg = to_clk_rcg2(hw);
>> +       u32 notn_m_val, n_val, m_val, d_val, not2d_val, mask, duty_per;
>> +       int ret;
>> +
>> +       if (!rcg->mnd_width)
>> +               return 0;
> 
> Shouldn't we fail this call if the duty cycle can't be changed? Or have
> another set of clk ops that doesn't support this clk op if the mnd
> isn't present.
> 

Sure, will fail the call for non-MND(HID)RCGs, will be part of my next 
patch.

>> +
>> +       mask = BIT(rcg->mnd_width) - 1;
>> +
>> +       regmap_read(rcg->clkr.regmap, RCG_N_OFFSET(rcg), &notn_m_val);
>> +       regmap_read(rcg->clkr.regmap, RCG_M_OFFSET(rcg), &m_val);
>> +
>> +       n_val = (~(notn_m_val) + m_val) & mask;
>> +
>> +       duty_per = (duty->num * 100) / duty->den;
>> +
>> +       /* Calculate 2d value */
>> +       d_val = DIV_ROUND_CLOSEST(n_val * duty_per * 2, 100);
>> +
>> +        /* Check BIT WIDTHS OF 2d. If D is too big reduce Duty cycle. */
> 
> Why is BIT WIDTHS capitalized? And Duty?
> 

Will take care of it in the next patch.


>> +       if (d_val > mask)
>> +               d_val = mask;
>> +
>> +       if ((d_val / 2) > (n_val - m_val))
>> +               d_val = (n_val - m_val) * 2;
>> +       else if ((d_val / 2) < (m_val / 2))
>> +               d_val = m_val;
>> +
>> +       not2d_val = ~d_val & mask;
>> +
>> +       ret = regmap_update_bits(rcg->clkr.regmap, RCG_D_OFFSET(rcg), mask,
>> +                                not2d_val);
>> +       if (ret)
>> +               return ret;
>> +
>> +       return update_config(rcg);
>> +}
>> +
>>   const struct clk_ops clk_rcg2_ops = {
>>          .is_enabled = clk_rcg2_is_enabled,
>>          .get_parent = clk_rcg2_get_parent,
>> @@ -365,6 +405,7 @@ const struct clk_ops clk_rcg2_ops = {
>>          .determine_rate = clk_rcg2_determine_rate,
>>          .set_rate = clk_rcg2_set_rate,
>>          .set_rate_and_parent = clk_rcg2_set_rate_and_parent,
>> +       .set_duty_cycle = clk_rcg2_set_duty_cycle,
> 
> Can you also implement get_duty_cycle?
> 

Sure, will implement the same.

>>   };
>>   EXPORT_SYMBOL_GPL(clk_rcg2_ops);
>>

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation.

--
