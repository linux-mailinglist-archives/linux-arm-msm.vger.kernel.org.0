Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5F56766958A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Jan 2023 12:30:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237550AbjAMLaY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 13 Jan 2023 06:30:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51234 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240845AbjAML3z (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 13 Jan 2023 06:29:55 -0500
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AED007F441
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Jan 2023 03:19:48 -0800 (PST)
Received: by mail-lj1-x233.google.com with SMTP id g14so22113464ljh.10
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Jan 2023 03:19:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tcbhud+BTQvGqbycS44PAcBjfV10i0xhamz4QQC0ejM=;
        b=ft86/eamMUDyP6HK+DrYsmXkOqf2V7mD9nYgm0BtJdNBDrDrrdWyDRSS8oC0h0I8zB
         /SQddepJXIuyw8KuMWCN3Rbcc3PAABoRA+HWtMISo2TgbXj0RhAbtB00cr/2HrmOfOh6
         KRBHePwl45JR8da/byKjLNmS45I6IHqUSmuKN+3rFSdMkPB7yZkMC29mIFlyA5lYvrCZ
         RT8gkeDJilfBo7aKLnaZXE51zoiadEQGlNPZ4RDSEHyVqxT+7kMkr5cnSWw3K2JmnsKB
         nvHHD6NMQMUPH4vIForUpOZLK27A2B3WxpY06wkgU83E/Z0AEWfggvDLpZVdktJFufdr
         ZK1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tcbhud+BTQvGqbycS44PAcBjfV10i0xhamz4QQC0ejM=;
        b=wabongiJlWzrxZekJ9PrQS3TvVaewbxyBTT5g7EvpEqXk2n8vmEc83vzfpDNSW23fk
         DUKxxj5NP+VvZ7ZCaf/fCbKnkDQwX0v1oMUjedvsliX8khilJTgq8ruMakakwIywEZ1S
         jSlEoYBeLLiJYXLlYeSznk0JcNdzRjd2ddv1ZybG90O49r6iWRuTqOq1TosLfcN/i+z1
         xRTqeAAdETQk0lwSka41zvow1wQMo7FuxD6tLOYIWpC3Rz/g1/hYeZdNECkWqBQK6ZK6
         qUsrpakkQ8QmAO0MWwvk/cUyMqcbNdyIogAxFsklX79zDriQPe/btr8PL+VBTMpi1ohB
         gvqg==
X-Gm-Message-State: AFqh2krXuZdSAEAWBhT5G27zNVaJpZgtpWcEYDM7vWoeV3w5gyvAHBe3
        Ksl7wGaZl9NilI6z20bonORI3g==
X-Google-Smtp-Source: AMrXdXsiEgxKFBlR2hLBjvmb7rYo1b40QSH5rLDjWI6e85wWXkd5xBONKxPsH4TZAbOCRZhOVfJv6w==
X-Received: by 2002:a2e:998e:0:b0:278:e50e:9b38 with SMTP id w14-20020a2e998e000000b00278e50e9b38mr20067612lji.5.1673608787040;
        Fri, 13 Jan 2023 03:19:47 -0800 (PST)
Received: from [192.168.2.31] ([188.170.82.205])
        by smtp.gmail.com with ESMTPSA id u17-20020a2eb811000000b0027fc3980e48sm2491331ljo.118.2023.01.13.03.19.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Jan 2023 03:19:46 -0800 (PST)
Message-ID: <ee457852-adb7-3ecf-e02b-264e804a280c@linaro.org>
Date:   Fri, 13 Jan 2023 13:19:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 09/13] clk: qcom: cpu-8996: fix PLL configuration sequence
Content-Language: en-GB
To:     Konrad Dybcio <konrad.dybcio@linaro.org>,
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
 <20230111192004.2509750-10-dmitry.baryshkov@linaro.org>
 <e556e250-7ae4-a5a7-7d0f-eb80a0231e8b@linaro.org>
 <449be451-f12c-ee14-a5f8-7a1e0d417597@linaro.org>
 <942a6282-5519-8871-5043-229bead87bd8@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <942a6282-5519-8871-5043-229bead87bd8@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 12/01/2023 16:32, Konrad Dybcio wrote:
> 
> 
> On 11.01.2023 23:05, Dmitry Baryshkov wrote:
>> On 11/01/2023 23:08, Konrad Dybcio wrote:
>>>
>>>
>>> On 11.01.2023 20:20, Dmitry Baryshkov wrote:
>>>> Switch both power and performance clocks to the GPLL0/2 (sys_apcs_aux)
>>>> before PLL configuration. Switch them to the ACD afterwards.
>>>>
>>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>>> ---
>>>>    drivers/clk/qcom/clk-cpu-8996.c | 14 ++++++++++++++
>>>>    1 file changed, 14 insertions(+)
>>>>
>>>> diff --git a/drivers/clk/qcom/clk-cpu-8996.c b/drivers/clk/qcom/clk-cpu-8996.c
>>>> index 571ed52b3026..47c58bb5f21a 100644
>>>> --- a/drivers/clk/qcom/clk-cpu-8996.c
>>>> +++ b/drivers/clk/qcom/clk-cpu-8996.c
>>>> @@ -432,13 +432,27 @@ static int qcom_cpu_clk_msm8996_register_clks(struct device *dev,
>>>>    {
>>>>        int i, ret;
>>>>    +    /* Select GPLL0 for 300MHz for the both clusters */
>>> superfluous 'the'
>>>
>>>> +    regmap_write(regmap, PERFCL_REG_OFFSET + MUX_OFFSET, 0xc);
>>>> +    regmap_write(regmap, PWRCL_REG_OFFSET + MUX_OFFSET, 0xc);
>>>> +
>>>> +    /* Ensure write goes through before PLLs are reconfigured */
>>>> +    udelay(5);
>>> Is this value based on n clock cycles, or 'good enough'?
>>
>> Don't know, this is based on downstream direclty.
> Right, I see it now.
> 
>>
>>>
>>>> +
>>>>        clk_alpha_pll_configure(&pwrcl_pll, regmap, &hfpll_config);
>>>>        clk_alpha_pll_configure(&perfcl_pll, regmap, &hfpll_config);
>>>>        clk_alpha_pll_configure(&pwrcl_alt_pll, regmap, &altpll_config);
>>>>        clk_alpha_pll_configure(&perfcl_alt_pll, regmap, &altpll_config);
>>>>    +    /* Wait for PLL(s) to lock */
>>>> +        udelay(50);
>>> Weird indentation

Fixing for v2.

>>>
>>> Maybe wait_for_pll_enable_lock() to be super sure?
>>
>> Does it work for HWFSM PLLs?
> Not sure, but wait_for_pll_update_ack_clear() should, since it's
> called by

I'd prefer to keep it as is. First, this seems to be the difference 
between normal and hwfsm PLLs, see clk_alpha_pll_is_enabled() vs 
clk_alpha_pll_hwfsm_is_enabled(). And second, the wait_for_pll() 
function is not exported from the clk-alpha-pll.c. Note, that downstream 
also does sleep instead of waiting.

> 
> clk_alpha_pll_hwfsm_set_rate() ->
>    __clk_alpha_pll_set_rate() ->
>      clk_alpha_pll_update_latch() ->
>        __clk_alpha_pll_update_latch()
> 
> Konrad
>>
>>>
>>>> +
>>>>        qcom_cpu_clk_msm8996_acd_init(regmap);
>>>>    +    /* Switch clusters to use the ACD leg */
>>>> +    regmap_write(regmap, PWRCL_REG_OFFSET + MUX_OFFSET, 0x2);
>>>> +    regmap_write(regmap, PERFCL_REG_OFFSET + MUX_OFFSET, 0x2);
>>>> +
>>> No delays here?
>>
>> No. Probably it isn't required since there is no additional PLL locking, etc.
>>
>>>
>>> Konrad
>>>>        for (i = 0; i < ARRAY_SIZE(cpu_msm8996_hw_clks); i++) {
>>>>            ret = devm_clk_hw_register(dev, cpu_msm8996_hw_clks[i]);
>>>>            if (ret)
>>

-- 
With best wishes
Dmitry

