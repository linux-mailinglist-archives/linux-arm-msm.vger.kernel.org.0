Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D83EB1DFDFA
	for <lists+linux-arm-msm@lfdr.de>; Sun, 24 May 2020 11:36:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728766AbgEXJg0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 24 May 2020 05:36:26 -0400
Received: from mail27.static.mailgun.info ([104.130.122.27]:45661 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728597AbgEXJg0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 24 May 2020 05:36:26 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1590312986; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: To:
 Subject: Sender; bh=+d2IffuX0fcJRBhd+RuZep3EB0a9GMnYHUOyGNlqGoE=; b=h2rJMs5UhyF+j7umj0Ph2RD/t+jWotSExhJkStyqcDD0oXQ26HvDnCwyRxOSTwlA58cqfIqA
 Ac7S8Yhfd7Fdul4/1PW6Kd86OLIusG96DsCAOnP76JxbEW4k4z5QGGlIuhBsjYYZYoQB0MDq
 kIh8og3cj2MVoxm1mcLeGHMYhL0=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-west-2.postgun.com with SMTP id
 5eca40189d4cf4d3efd0b7a7 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Sun, 24 May 2020 09:36:24
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 90C21C43391; Sun, 24 May 2020 09:36:24 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [192.168.0.104] (unknown [49.207.133.24])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: sivaprak)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 2CEBFC433C6;
        Sun, 24 May 2020 09:36:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 2CEBFC433C6
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
 <4025e5c3-b532-d235-f73b-2b86055bdde2@codeaurora.org>
 <158948883904.215346.15910533287389644445@swboyd.mtv.corp.google.com>
From:   Sivaprakash Murugesan <sivaprak@codeaurora.org>
Message-ID: <cd562d7c-2ea6-9481-c723-858dad799b06@codeaurora.org>
Date:   Sun, 24 May 2020 15:06:18 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <158948883904.215346.15910533287389644445@swboyd.mtv.corp.google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 5/15/2020 2:10 AM, Stephen Boyd wrote:
> Quoting Sivaprakash Murugesan (2020-04-22 03:44:33)
>> On 4/22/2020 2:30 PM, Stephen Boyd wrote:
>>> Quoting Sivaprakash Murugesan (2020-04-13 19:55:17)
>>>> diff --git a/drivers/clk/qcom/a53-pll.c b/drivers/clk/qcom/a53-pll.c
>>>> index 45cfc57..a95351c 100644
>>>> --- a/drivers/clk/qcom/a53-pll.c
>>>> +++ b/drivers/clk/qcom/a53-pll.c
>>>> @@ -57,30 +146,26 @@ static int qcom_a53pll_probe(struct platform_device *pdev)
>>>>           if (IS_ERR(regmap))
>>>>                   return PTR_ERR(regmap);
>>>>    
>>>> -       pll->l_reg = 0x04;
>>>> -       pll->m_reg = 0x08;
>>>> -       pll->n_reg = 0x0c;
>>>> -       pll->config_reg = 0x14;
>>>> -       pll->mode_reg = 0x00;
>>>> -       pll->status_reg = 0x1c;
>>>> -       pll->status_bit = 16;
>>>> -       pll->freq_tbl = a53pll_freq;
>>>> -
>>>> -       init.name = "a53pll";
>>>> -       init.parent_names = (const char *[]){ "xo" };
>>>> -       init.num_parents = 1;
>>>> -       init.ops = &clk_pll_sr2_ops;
>>>> -       init.flags = CLK_IS_CRITICAL;
>>> Please document why a clk is critical.
>> ok
>>>> -       pll->clkr.hw.init = &init;
>>>> -
>>>> -       ret = devm_clk_register_regmap(dev, &pll->clkr);
>>>> +       if (pll_data->flags & PLL_IS_ALPHA) {
>>>> +               struct clk_alpha_pll *alpha_pll =
>>>> +                       pll_data->a53pll.alpha_pll.pll;
>>>> +               struct alpha_pll_config *alpha_pll_config =
>>>> +                       pll_data->a53pll.alpha_pll.pll_config;
>>>> +
>>>> +               clk_alpha_pll_configure(alpha_pll, regmap, alpha_pll_config);
>>>> +               clkr = &pll_data->a53pll.alpha_pll.pll->clkr;
>>>> +       } else {
>>>> +               clkr = &pll_data->a53pll.pll->clkr;
>>>> +       }
>>> Sorry, the design is confusing.
>> The basic idea is to add support for various PLLs available to clock the
>> A53 core.
>>
>> if this messing up the code, can the alpha pll support be moved to a
>> separate file?
>>
>> It would be very helpful if you provide your input on this.
> Isn't the alpha PLL support already in a different file? Is it sometimes
> an alpha pll and other times it is something else?

alpha pll for cpufreq is not yet available, and for ipq based devices it 
is alpha pll, and I guess

for other mobile based devices it is something else.

I have raised a patch set keeping the alpha pll as a separate file, 
could you please take a

look into it?

