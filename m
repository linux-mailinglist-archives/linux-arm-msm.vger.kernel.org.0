Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 348D8667591
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Jan 2023 15:23:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236751AbjALOXW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 12 Jan 2023 09:23:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45318 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236749AbjALOWW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 12 Jan 2023 09:22:22 -0500
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C38EB52C54
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Jan 2023 06:13:52 -0800 (PST)
Received: by mail-lf1-x136.google.com with SMTP id f34so28575022lfv.10
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Jan 2023 06:13:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mUZYof/oPESYTLfj3BC8tUb1F+1CIVHRnIelDFoTXRI=;
        b=xdc/NMOODVOxlfSiX7Hlu19ON4XQa4S8ROfC+P0O3kNVoei4nhWZmWrgvx0s/di6ob
         Q/DL1HbpFHzjVs+NVNlrlMOl7gQ+A96v5QJIUNu6PQnTVDlG8D7kFCsF3twJlLEshBWd
         qgVZXVVQY8Y8YZOyIorBq8AO6rof/xFJqyvdz7prJEj+ZsEpnSUv4pT6RSAvIK1W4pI8
         g2K3P7YbqW5/f+ZeHNMSKGB4w4yjt+kZNfydyGEkeKzJFkDZf1nzJMSdgTPqKaGAgWDz
         V5nF4eOmiEOH2A3fda79iJhTZu9q+kl/5s7BWiA9VenbtB6EaeJvZSLshHBBMfKPa4LT
         fVWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mUZYof/oPESYTLfj3BC8tUb1F+1CIVHRnIelDFoTXRI=;
        b=SpxCPjoMvCJqL9Kd/XaD/35UvQauJ9oXBbtYpEw48AxUKdeUhWisT66qJCQ0U84OoD
         WPp6WwdUCnYr+3YE59qdlC9ctb3XZ+9Mq4nR32PqkHTqCkKR0M/qcqBMNgrZFZx82kNM
         guAHSMks4s6rCI8RNV5W52OE4ug9QeE6Xqjp+wSaR3lDVmH7G9ON2wts3y5nBJ035/Ua
         KWAXRdDudA6WAhqFnEG1O+mHERvlnLZiOZIfJLZ52zBwcc5RQ4tFF7aRPqtuv6qHCgrM
         ZhFXuLmweDQ5s3dH7B++ynQ6SwJ2EAajRPSjKIhiKJ4GTid4jJUox6SM9aw1mdNlOtVs
         rIyQ==
X-Gm-Message-State: AFqh2krFGPqjZwAmTl3o5voPjO6Ij/G9fsKjqSHquh/m5YKAJq3RZ611
        KlUsgkj3R+rsGHoGtsASnORAUQ==
X-Google-Smtp-Source: AMrXdXvTry+9nZA2tce7XqpaDlMl46nu0M11hZQuZjTrEexju1s3szDkkyFNYio6wPlSWiLNNl1RBA==
X-Received: by 2002:ac2:532e:0:b0:4b5:5ddc:da32 with SMTP id f14-20020ac2532e000000b004b55ddcda32mr17947618lfh.56.1673532831075;
        Thu, 12 Jan 2023 06:13:51 -0800 (PST)
Received: from [192.168.1.101] (abym53.neoplus.adsl.tpnet.pl. [83.9.32.53])
        by smtp.gmail.com with ESMTPSA id w34-20020a0565120b2200b004b5ab5e904esm3269768lfu.306.2023.01.12.06.13.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Jan 2023 06:13:50 -0800 (PST)
Message-ID: <2fa25d72-5c40-1e1d-bebb-8b00706b3b5c@linaro.org>
Date:   Thu, 12 Jan 2023 15:13:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 06/13] clk: qcom: cpu-8996: simplify the
 cpu_clk_notifier_cb
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20230111192004.2509750-1-dmitry.baryshkov@linaro.org>
 <20230111192004.2509750-7-dmitry.baryshkov@linaro.org>
 <b4721d61-799e-2677-4273-0c92cb555cae@linaro.org>
 <bbaea2e2-cea4-3528-4e9b-b003d53d0af7@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <bbaea2e2-cea4-3528-4e9b-b003d53d0af7@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_SORBS_HTTP,RCVD_IN_SORBS_SOCKS,SPF_HELO_NONE,SPF_PASS
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 11.01.2023 23:01, Dmitry Baryshkov wrote:
> On 11/01/2023 23:03, Konrad Dybcio wrote:
>>
>>
>> On 11.01.2023 20:19, Dmitry Baryshkov wrote:
>>> - Do not use the Alt PLL completely. Switch to smux when necessary to
>>>    prevent overvolting
>> Is this empirical evidence, or did Qualcomm recommendations change since
>> msm-3.18 was released?
> 
> I think this is what they are doing, see https://git.codelinaro.org/clo/la/kernel/msm-3.18/-/blob/LA.UM.7.5.r1-05300-8x96.0/drivers/clk/msm/clock-cpu-8996.c#L675
> 
> They switch altpll frequency for whatever reasons, then they do the dance of switching the parent rate to half rate if necessary and then they finally switch the parent's rate to the target rate. That's the only way I can interpret the cpu_clk_8996_set_rate().
> 
> https://git.codelinaro.org/clo/la/kernel/msm-3.18/-/blob/LA.UM.7.5.r1-05300-8x96.0/drivers/clk/msm/clock-cpu-8996.c#L675

Okay, so on rate switch they:

PWR:
  - set (rate > 1190400 kHz ? 556800000 : 307200000) on ALT_PLL
  - use_alt_pll is 0 because it's an uninitialized global var
    - do_half_rate is TRUE on PWRCL_CLK
    - " /* Special handling needed " path is entered if the frequency
      is being requested to go from above 600 MHz to below 600 MHz
    - clk_set_rate sets OLD_RATE/2 on pwrcl_hf_mux which
      has 2 parents:
        * pwrcl_pll for 600 MHz - 3000 MHz
        * pwrcl_lf_mux for anything else fed by:
           * pwrcl_pll_main = pwrcl_pll/2 (300 MHz - 600 MHz???)
           * sys_apcsaux_clk (SMUX) (<300 MHz??)

PERF:
  - use_alt_pll is 0 because it's an uninitialized global var
    - do_half_rate is TRUE on PERFCL_CLK
    - " /* Special handling needed " path is entered if the frequency
      is being requested to go from above 600 MHz to below 600 MHz
    - clk_set_rate sets OLD_RATE/2 (/4 on Pro) on perfcl_hf_mux which
      has 2 parents:
        * perfcl_pll for 600 MHz - 3000 MHz
        * perfcl_lf_mux for anything else fed by:
           * perfcl_pll_main = perfcl_pll/2 (300 MHz - 600 MHz???)
           * sys_apcsaux_clk (SMUX) (<300 MHz??)

So I think the alt_plls are NOT used and this is correct..

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad

> 
>>
>>
>>> - Restore the parent in case the rate change aborts for some reason
>>> - Do not duplicate resetting the parent in set_parent operation.
>> These sound good.
>>
>> Konrad
>>>
>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>> ---
>>>   drivers/clk/qcom/clk-cpu-8996.c | 31 +++++++++++++++++++------------
>>>   1 file changed, 19 insertions(+), 12 deletions(-)
>>>
>>> diff --git a/drivers/clk/qcom/clk-cpu-8996.c b/drivers/clk/qcom/clk-cpu-8996.c
>>> index 7e5246ca7e7f..ee7e18b37832 100644
>>> --- a/drivers/clk/qcom/clk-cpu-8996.c
>>> +++ b/drivers/clk/qcom/clk-cpu-8996.c
>>> @@ -506,27 +506,34 @@ static int cpu_clk_notifier_cb(struct notifier_block *nb, unsigned long event,
>>>   {
>>>       struct clk_cpu_8996_pmux *cpuclk = to_clk_cpu_8996_pmux_nb(nb);
>>>       struct clk_notifier_data *cnd = data;
>>> -    int ret;
>>>         switch (event) {
>>>       case PRE_RATE_CHANGE:
>>> -        ret = clk_cpu_8996_pmux_set_parent(&cpuclk->clkr.hw, ALT_INDEX);
>>>           qcom_cpu_clk_msm8996_acd_init(base);
>>> +
>>> +        /*
>>> +         * Avoid overvolting. clk_core_set_rate_nolock() walks from top
>>> +         * to bottom, so it will change the rate of the PLL before
>>> +         * chaging the parent of PMUX. This can result in pmux getting
>>> +         * clocked twice the expected rate.
>>> +         *
>>> +         * Manually switch to PLL/2 here.
>>> +         */
>>> +        if (cnd->new_rate < DIV_2_THRESHOLD &&
>>> +            cnd->old_rate > DIV_2_THRESHOLD)
>>> +            clk_cpu_8996_pmux_set_parent(&cpuclk->clkr.hw, SMUX_INDEX);
>>> +
>>>           break;
>>> -    case POST_RATE_CHANGE:
>>> -        if (cnd->new_rate < DIV_2_THRESHOLD)
>>> -            ret = clk_cpu_8996_pmux_set_parent(&cpuclk->clkr.hw,
>>> -                               SMUX_INDEX);
>>> -        else
>>> -            ret = clk_cpu_8996_pmux_set_parent(&cpuclk->clkr.hw,
>>> -                               ACD_INDEX);
>>> -        break;
>>> +    case ABORT_RATE_CHANGE:
>>> +        /* Revert manual change */
>>> +        if (cnd->new_rate < DIV_2_THRESHOLD &&
>>> +            cnd->old_rate > DIV_2_THRESHOLD)
>>> +            clk_cpu_8996_pmux_set_parent(&cpuclk->clkr.hw, ACD_INDEX);
>>>       default:
>>> -        ret = 0;
>>>           break;
>>>       }
>>>   -    return notifier_from_errno(ret);
>>> +    return NOTIFY_OK;
>>>   };
>>>     static int qcom_cpu_clk_msm8996_driver_probe(struct platform_device *pdev)
> 
