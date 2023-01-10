Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5BF38664395
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Jan 2023 15:48:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238651AbjAJOsH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 10 Jan 2023 09:48:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57898 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238654AbjAJOro (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 10 Jan 2023 09:47:44 -0500
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6752250170
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Jan 2023 06:47:42 -0800 (PST)
Received: by mail-lf1-x12b.google.com with SMTP id m6so18779094lfj.11
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Jan 2023 06:47:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oC6Slw+iKJOpkqUIFmGD5udzCvyiuBOqJH++fmsGseM=;
        b=TDXSVSlGYEu9wx86DSCFMRENfgxdhYqL6Q00fIBGgwLukHTFJ/vBpzYK4dYfJoNOG1
         BNVNqc6N12XZGIgMe6UOUFzyYG4DbvUzFxGtoFRRpERfU/ByIrJlunqtxsNRHWkvzeQq
         2MG6RzdObxrfRTYX878my/nttqLdp7k39GfJRow7KX9nmMptHOjIvpwHkbWgGNr6CnoJ
         ELQCyxcFsgtLKAa3ZiTRkJSb+sxOCNapemzYW+j6jV92fCHiZZQkjChuWm0oHPIYyx7l
         VVBCE977YwZkM0CMWZOV15e3MniOPGAzx+ofWuAuUoYuiTdrFBSpNyhOjlMVYb6qX6mx
         bSzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oC6Slw+iKJOpkqUIFmGD5udzCvyiuBOqJH++fmsGseM=;
        b=UfZqmaK5Af61BhmzEDkIu0oMtuyllTmCTO6ftNx+Q67ngM7NUQ7mCVtAKGg4s6ognj
         GBd1rNPhPy3FX59yG8nsVXOcceVWX0haL3mW9ZqewrzBKwTiLr47wxrwwZDaHjfH3BE9
         MS6x5iItHZxOrbEToPYWvmC7d1qdbUjJnAjSoDMgocjSRwaLgcPc8jl0zgUxhNrSSMwb
         IJimFkJ/jWelXFh78DzCK1Miaw7E/2PTVs4D41pc+GGhliUo1XZatjkwh/otUGtsLINd
         hR8xXpRZ+llR39SPUB3iSTMGNudRJ196JnIHxJalhRAfMgntdYS/xrEi7qITDZtbnsBV
         xLhw==
X-Gm-Message-State: AFqh2kp8eyrlQh8CKu8mBxDWKVelAEvtgwr7v8Wu1FKe8GlTtYIB5Qx+
        fH3+/LDYheiTlabZhgWrxgxE0A==
X-Google-Smtp-Source: AMrXdXuCUR9iaAID5nIgInaSTTilyC8KWakB4zt3ieCjtcqZn7uaPk4S7saQ2QwKzkZpUY0h+6qxtg==
X-Received: by 2002:a05:6512:2828:b0:4b5:98ca:548 with SMTP id cf40-20020a056512282800b004b598ca0548mr23451134lfb.39.1673362060699;
        Tue, 10 Jan 2023 06:47:40 -0800 (PST)
Received: from [192.168.1.101] (abxi45.neoplus.adsl.tpnet.pl. [83.9.2.45])
        by smtp.gmail.com with ESMTPSA id p7-20020ac24ec7000000b004b587e37265sm2206967lfr.58.2023.01.10.06.47.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Jan 2023 06:47:40 -0800 (PST)
Message-ID: <5eabb9a1-d748-a9ef-e966-80eee55a74a2@linaro.org>
Date:   Tue, 10 Jan 2023 15:47:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v2 4/7] arm64: dts: qcom: Add msm8939 SoC
Content-Language: en-US
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        agross@kernel.org, andersson@kernel.org, djakov@kernel.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        benl@squareup.com, shawn.guo@linaro.org, fabien.parent@linaro.org,
        leo.yan@linaro.org, dmitry.baryshkov@linaro.org,
        Jun Nie <jun.nie@linaro.org>,
        James Willcox <jwillcox@squareup.com>,
        Joseph Gates <jgates@squareup.com>,
        Max Chen <mchen@squareup.com>, Zac Crosby <zac@squareup.com>,
        Vincent Knecht <vincent.knecht@mailoo.org>,
        Stephan Gerhold <stephan@gerhold.net>
References: <20230103010904.3201835-1-bryan.odonoghue@linaro.org>
 <20230103010904.3201835-5-bryan.odonoghue@linaro.org>
 <6e594438-843a-d03e-5276-d6316a9dc2c0@linaro.org>
 <88d66834-ca80-888b-e56e-7694e84b6eae@linaro.org>
 <411a1a02-568e-3695-0a24-0681fbe9f265@linaro.org>
 <bde66389-619b-771d-1956-43059f8e4d5a@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <bde66389-619b-771d-1956-43059f8e4d5a@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 10.01.2023 14:42, Bryan O'Donoghue wrote:
> On 10/01/2023 13:24, Krzysztof Kozlowski wrote:
>> On 10/01/2023 14:14, Bryan O'Donoghue wrote:
>>> On 03/01/2023 09:14, Krzysztof Kozlowski wrote:
>>>> ../arch/arm64/boot/dts/qcom/msm8939.dtsi:1825.23-1842.5: Warning
>>>> (simple_bus_reg): /soc@0/mmc@7824000: simple-bus unit address format
>>>> error, expected "7824900
>>>
>>> For the record the driver consuming this dt entry requires the host regs
>>> to come first followed by the core
>>>
>>> sdhc_1: mmc@7824000 {
>>>           compatible = "qcom,msm8916-sdhci", "qcom,sdhci-msm-v4";
>>>           reg = <0x07824900 0x11c>, <0x07824000 0x800>;
>>>           reg-names = "hc", "core";
>>> }
>>>
>>> If I change this and the msm8916 to
>>
>> That's not the solution. The warning is saying that unit address does
>> not match your reg. You need to correct unit address.
>>
>> Best regards,
>> Krzysztof
>>
> 
> Is it not the case that the unit-address should match the first reg
Yes

 and that the first reg should also be the lowest address ?
Depends on what the first reg is, bindings usually dictate the order.

Konrad
> 
> ---
> bod
