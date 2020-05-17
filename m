Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6D1DA1D66BA
	for <lists+linux-arm-msm@lfdr.de>; Sun, 17 May 2020 11:18:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727031AbgEQJSH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 17 May 2020 05:18:07 -0400
Received: from mail27.static.mailgun.info ([104.130.122.27]:44345 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727010AbgEQJSH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 17 May 2020 05:18:07 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1589707086; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=/0wRHOShBqaKov4Xp9D3AVXxXU23fv2pLHePIcLM4/Q=; b=N9vCmdv9Tciw4ETIdan9LkCZE8gOICC9ZOmEJ4twhVgxIJVlY9Bv8uAOdXqddsD1dAoRZVYx
 jaQ4tb707YblaPSyiioJRPy2uEK9TAnkRaCfRXk2VoBE3BMVLE4lYYrk/HlRBjqcJkmUKxEI
 CC0jQSbnpPYyNhXDNf9YNtmMSg0=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5ec10144.7fa2390228f0-smtp-out-n03;
 Sun, 17 May 2020 09:17:56 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 052A6C433F2; Sun, 17 May 2020 09:17:56 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [192.168.0.102] (unknown [183.82.140.80])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: tdas)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 00AC4C433D2;
        Sun, 17 May 2020 09:17:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 00AC4C433D2
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=tdas@codeaurora.org
Subject: Re: [PATCH v1 1/4] clk: qcom: gdsc: Add support to enable retention
 of GSDCR
To:     Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     David Brown <david.brown@linaro.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Andy Gross <agross@kernel.org>, devicetree@vger.kernel.org,
        robh@kernel.org, robh+dt@kernel.org
References: <1585338485-31820-1-git-send-email-tdas@codeaurora.org>
 <1585338485-31820-2-git-send-email-tdas@codeaurora.org>
 <158646281555.77611.13094729241703720869@swboyd.mtv.corp.google.com>
From:   Taniya Das <tdas@codeaurora.org>
Message-ID: <4d5bf27a-f2dd-104a-094f-dab1c159d666@codeaurora.org>
Date:   Sun, 17 May 2020 14:47:49 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <158646281555.77611.13094729241703720869@swboyd.mtv.corp.google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello Stephen,

Thanks for the review.

On 4/10/2020 1:36 AM, Stephen Boyd wrote:
> Quoting Taniya Das (2020-03-27 12:48:02)
>> diff --git a/drivers/clk/qcom/gdsc.c b/drivers/clk/qcom/gdsc.c
>> index a250f59..cfe908f 100644
>> --- a/drivers/clk/qcom/gdsc.c
>> +++ b/drivers/clk/qcom/gdsc.c
>> @@ -28,6 +28,7 @@
>>   /* CFG_GDSCR */
>>   #define GDSC_POWER_UP_COMPLETE         BIT(16)
>>   #define GDSC_POWER_DOWN_COMPLETE       BIT(15)
>> +#define GDSC_RETAIN_FF_ENABLE          BIT(11)
>>   #define CFG_GDSCR_OFFSET               0x4
>>
>>   /* Wait 2^n CXO cycles between all states. Here, n=2 (4 cycles). */
>> @@ -202,6 +203,14 @@ static inline void gdsc_assert_reset_aon(struct gdsc *sc)
>>          regmap_update_bits(sc->regmap, sc->clamp_io_ctrl,
>>                             GMEM_RESET_MASK, 0);
>>   }
>> +
>> +static inline void gdsc_retain_ff_on(struct gdsc *sc)
> 
> Drop inline please.
> 

Will drop in the next patch.

>> +{
>> +       u32 mask = RETAIN_FF_ENABLE;
> 
> Is this supposed to be GDSC_RETAIN_FF_ENABLE?
> 

Will update in next patch.

>> +
>> +       regmap_update_bits(sc->regmap, sc->gdscr, mask, mask);
>> +}
>> +
>>   static int gdsc_enable(struct generic_pm_domain *domain)
>>   {
>>          struct gdsc *sc = domain_to_gdsc(domain);
>> @@ -254,6 +263,9 @@ static int gdsc_enable(struct generic_pm_domain *domain)
>>                  udelay(1);
>>          }
>>
>> +       if (sc->flags & RETAIN_FF_ENABLE)
>> +               gdsc_retain_ff_on(sc);
>> +
>>          return 0;
>>   }
>>
>> diff --git a/drivers/clk/qcom/gdsc.h b/drivers/clk/qcom/gdsc.h
>> index 64cdc8c..8604d44 100644
>> --- a/drivers/clk/qcom/gdsc.h
>> +++ b/drivers/clk/qcom/gdsc.h
>> @@ -49,6 +49,7 @@ struct gdsc {
>>   #define AON_RESET      BIT(4)
>>   #define POLL_CFG_GDSCR BIT(5)
>>   #define ALWAYS_ON      BIT(6)
>> +#define RETAIN_FF_ENABLE       BIT(7)
> 
> This is a flag, not a register bit presumably.

Yes, it is a flag.

> 
>>          struct reset_controller_dev     *rcdev;
>>          unsigned int                    *resets;
>>          unsigned int                    reset_count;

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation.

--
