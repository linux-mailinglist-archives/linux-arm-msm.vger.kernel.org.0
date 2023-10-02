Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7DC767B4ED6
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Oct 2023 11:17:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235974AbjJBJRp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 2 Oct 2023 05:17:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54976 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236028AbjJBJRo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 2 Oct 2023 05:17:44 -0400
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A28D93
        for <linux-arm-msm@vger.kernel.org>; Mon,  2 Oct 2023 02:17:39 -0700 (PDT)
Received: by mail-lj1-x229.google.com with SMTP id 38308e7fff4ca-2c16bc71e4cso152159891fa.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Oct 2023 02:17:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696238257; x=1696843057; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=I22ZLDTwt1a3CMGPKW9Vs2iggXkEI+mYq1W9AQhp2yk=;
        b=p+yPpsRec6dTSrHy1x8sStsVHP3w0K0Ifm/SgWzMrzttCtSvylAou8fnywhWfxLomA
         UvPCSsvDsz7+uS4Xd1nfncKRSHeQGzJAKGAT0IIWIhMPNRlY7Y0JdS1dIW7vUR4hqXM7
         dvsz5Gqz4LaOI8gFX9bDYVXfHKglm4z9GhvWMBcZ6JSMjuXE2tXz75u/ZXo9sIXfxrUb
         D6qXu22fcfOOuKkf3CuNdGkkLxxsdwJLdBDp1aikjXOrpbMMv0YR5WfRHKgcN+QZKR+d
         INTiVNICpth6Zhu6EUBg9mNzGjtkUnpDt0kArg8kwMJdZyrFs5WzlJ6r0wWA3gwpwV/7
         CHBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696238257; x=1696843057;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=I22ZLDTwt1a3CMGPKW9Vs2iggXkEI+mYq1W9AQhp2yk=;
        b=t4rr/dcnqh4LqUxy7xDS9XOxYY9jOsciTWdjuv9WGnRIrFf+qprTUObPhJoPUqrqmN
         e+hgt4AIp3at/OoKAueJuVm8NC7hAB+BChpBufxpC6mUF4Osjdij4P4Aq8zaUqQjwGDf
         84qKDOlzbvQi3XYhMYkz6QZOfReMh/9QaN3RKS09IBqUrBZPIWiscnqrQsg98kwU2gyd
         Sa+qjHERh1zRWJD3GIICzXXyushl9ah1blnoHicfIe5GQ+UJGpJjxck3r3UuBcZ77dr7
         8RyH8i+5D6BH0vhzVGJKLD01xlEzwqPuYNCAkNhTUvOOqGezjvRkMZE5MXqrrHuFwrOU
         KRxg==
X-Gm-Message-State: AOJu0YyA3Iv3eXDnTcDRy6SlNki++lY9VbwdaDQ5EQQWNmtLASzJfT6Q
        4lLzEZ9KKQwAcfrPfykwYZLd+g==
X-Google-Smtp-Source: AGHT+IED43N8wMsSahvTAyFScOfTAxyoQ6SKq6oMWQygKZHQxUQEU3eWK7Pc1WKu3IbEpvwxP5FnrA==
X-Received: by 2002:ac2:4d99:0:b0:500:94aa:739c with SMTP id g25-20020ac24d99000000b0050094aa739cmr8259221lfe.61.1696238257252;
        Mon, 02 Oct 2023 02:17:37 -0700 (PDT)
Received: from [172.30.204.164] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id j16-20020ac24550000000b0050300e013f3sm4661437lfm.254.2023.10.02.02.17.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Oct 2023 02:17:36 -0700 (PDT)
Message-ID: <76a5b753-5d65-071f-d43c-512f30a69fa1@linaro.org>
Date:   Mon, 2 Oct 2023 11:17:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v2 4/5] clk: qcom: camcc-sc8280xp: Add sc8280xp CAMCC
Content-Language: en-US
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        andersson@kernel.org, agross@kernel.org, mturquette@baylibre.com,
        sboyd@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        jonathan@marek.ca, quic_tdas@quicinc.com,
        vladimir.zapolskiy@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230930134114.1816590-1-bryan.odonoghue@linaro.org>
 <20230930134114.1816590-5-bryan.odonoghue@linaro.org>
 <ba0399d3-c3a5-0458-3668-e734fafe2f1a@linaro.org>
 <ec8a0350-aac8-443e-854a-652179a5d6bb@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <ec8a0350-aac8-443e-854a-652179a5d6bb@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_SBL_CSS,SPF_HELO_NONE,SPF_PASS
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 10/1/23 00:53, Bryan O'Donoghue wrote:
> On 30/09/2023 17:39, Konrad Dybcio wrote:
>>
>>> +static struct clk_branch camcc_gdsc_clk = {
>>> +    .halt_reg = 0xc1e4,
>>> +    .halt_check = BRANCH_HALT,
>>> +    .clkr = {
>>> +        .enable_reg = 0xc1e4,
>>> +        .enable_mask = BIT(0),
>>> +        .hw.init = &(struct clk_init_data){
>>> +            .name = "camcc_gdsc_clk",
>>> +            .parent_hws = (const struct clk_hw*[]){
>>> +                &camcc_xo_clk_src.clkr.hw,
>>> +            },
>>> +            .num_parents = 1,
>>> +            .flags = CLK_IS_CRITICAL | CLK_SET_RATE_PARENT,
>> "meh"
>>
>> Is this clock only necessary for the GDSC to turn on?
> 
> Most of this code is autogenerated in downstream as I understand it a 
> script is run against some definition the RTL one would hope.
> 
> I think that is probably how the gdsc clocks for the camcc are marked 
> like this upstream already too.
> 
> grep CRITICAL drivers/clk/qcom/*camcc*
> drivers/clk/qcom/camcc-sc7280.c:            .flags = CLK_IS_CRITICAL | 
> CLK_SET_RATE_PARENT,
> drivers/clk/qcom/camcc-sm8250.c:            .flags = CLK_IS_CRITICAL | 
> CLK_SET_RATE_PARENT,
> drivers/clk/qcom/camcc-sm8450.c:            .flags = CLK_IS_CRITICAL | 
> CLK_SET_RATE_PARENT,
> 
> I can tell you what clocks this clock but I can't tell you where that 
> clock routes too, so the best/only source of information I have is the 
> flag that comes from the autogenerated downstream code.
> 
> I think the safe thing to do is to leave the flag as is TBH.
Safe yes, good no.

Clocks with this flag prevent the clock controller device from
entering runtime suspend, which causes a dangling vote on RPMh
and prevents system power collapse.

Konrad
