Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4AE9D6ABB6E
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Mar 2023 11:15:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230508AbjCFKPw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 6 Mar 2023 05:15:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39310 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231354AbjCFKPT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 6 Mar 2023 05:15:19 -0500
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE9BD83F6
        for <linux-arm-msm@vger.kernel.org>; Mon,  6 Mar 2023 02:14:47 -0800 (PST)
Received: by mail-lj1-x233.google.com with SMTP id by8so9024401ljb.7
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Mar 2023 02:14:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678097685;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JrRx1sQP+w0Wzx9jVsXvebGwwsVfi1BJFfOzeSnLMqk=;
        b=Gl3q2aizIhlVSs3xqqFzzX6KxWsAAVJnmW6t4d/962bFbMKp86fgAovj0rIozcf2Kt
         AbizXRC/UPIQwdG9kgaMJKq2WSlpwz3tDp5Qp+VyHMqEr131l9ZAtZZAhFPKnZIwY0Ds
         C9lU5kLF2OIh7b6P5luEXeaAEnph78aouRqsq9KlzPDw3SvDwAp+T51lQh/z8CSx4oX8
         3C+kIxdjC2RnbXEffOjPsyc7IZ0+XYhL+jXIW4/1TcUZOOda2Lda++8d8YSZiYOcZxNP
         G99rjy0dgKY5M6qRWzlI7Y4RknYVM2eerJiJWB4T+EjFSuYHh9ycxTQy1HW4cphMTVAi
         MrWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678097685;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JrRx1sQP+w0Wzx9jVsXvebGwwsVfi1BJFfOzeSnLMqk=;
        b=ZpVB8bZxhqlzhHtXlGIP87l7dcKdoZNz/hF3POffk81hvfcPtu9cONoyoG8YFO365k
         bVZ1qbdgtRBX6BB+opq4kryZOxvnrzhqSIrMe55hritpoAm34UMDqfBt5qjGlfQKgccJ
         psIPS8EghQ45GMSiXogFjfW02LY35ERhI8PwLQiKALvbYPeKOUye3XUUjIXnIeWF0uxZ
         rqGpXms0IvgE+PJcPwYbe17n8ByFSED9gdfNJtm6Jgy3cKFd4IA7Bi1LI7+2xJbX69BP
         BL+P4W1g3SLRyEIPXC9MJUcf2unR5R3NwglJDtZ7TkDJGBYxJ1HcsKRhgUnmfk9vyyIL
         SKnQ==
X-Gm-Message-State: AO0yUKVUfLzYn8q1ilk2/WXzCqBkNQJ+e3NJLkKw7vwvsfN/TgscX5n6
        KvxvNXUXmAVFn3G7qMEOjLRCog==
X-Google-Smtp-Source: AK7set/XqyJxSsGRdpyR3XOoBb5vbT24t+ttPDYPumeT0lesA6b7qXeCVGRw1scH3b2mVqRfJI/Lyw==
X-Received: by 2002:a05:651c:1725:b0:295:9798:be51 with SMTP id be37-20020a05651c172500b002959798be51mr2729426ljb.4.1678097685015;
        Mon, 06 Mar 2023 02:14:45 -0800 (PST)
Received: from [192.168.1.101] (abym99.neoplus.adsl.tpnet.pl. [83.9.32.99])
        by smtp.gmail.com with ESMTPSA id n20-20020a2e86d4000000b00295a35f30e1sm1626058ljj.115.2023.03.06.02.14.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Mar 2023 02:14:44 -0800 (PST)
Message-ID: <97676add-de6b-4057-a5ef-dab313cf7050@linaro.org>
Date:   Mon, 6 Mar 2023 11:14:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] arm64: dts: qcom: msm8996: Add missing property for
 OnePlus 3T
Content-Language: en-US
To:     "Guilherme G. Piccoli" <gpiccoli@igalia.com>,
        Harry Austen <hpausten@protonmail.com>
Cc:     devicetree@vger.kernel.org, agross@kernel.org,
        linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        konrad.dybcio@somainline.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, kernel-dev@igalia.com,
        kernel@gpiccoli.net, Yassine Oudjana <y.oudjana@protonmail.com>
References: <20230213201651.1902323-1-gpiccoli@igalia.com>
 <d34d8851-fd73-9b87-9340-df25b64e96bb@linaro.org>
 <09879b66-4f72-a205-3e2d-cd8d8113625c@igalia.com>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <09879b66-4f72-a205-3e2d-cd8d8113625c@igalia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 5.03.2023 16:36, Guilherme G. Piccoli wrote:
> On 13/02/2023 18:49, Konrad Dybcio wrote:
>> [...] 
>>> diff --git a/arch/arm64/boot/dts/qcom/msm8996-oneplus3t.dts b/arch/arm64/boot/dts/qcom/msm8996-oneplus3t.dts
>>> index 34f837dd0c12..5dc8f0adab30 100644
>>> --- a/arch/arm64/boot/dts/qcom/msm8996-oneplus3t.dts
>>> +++ b/arch/arm64/boot/dts/qcom/msm8996-oneplus3t.dts
>>> @@ -14,6 +14,7 @@ / {
>>>  	qcom,board-id = <8 0 15811 26>,
>>>  			<8 0 15811 27>,
>>>  			<8 0 15811 28>;
>>> +	qcom,msm-id = <246 0x30001>;
>> Hm, this doesn't sound right.. Internet says 3T has 8996Pro..
>> Could you check:
>>
>> /sys/bus/soc/devices/soc0/soc_id  # reg[0]
>> /sys/bus/soc/devices/soc0/revision # reg[1] after some shifting
>>
>> Also, please include include/dt-bindings/arm/qcom,ids.h and use
>> the preprocessor constant from there instead of a magic number in
>> the first part of the reg value.
>>
>> Konrad
> 
> Hi Konrad, thanks for your review!
> 
> Unfortunately I don't have this device, I based my patch in the other
> Oneplus 3. Maybe Harry Austen (CCed) or anybody in this thread or list
> have the device?
> 
> Curiosity questions, since I'm far from expert in the device-tree world:
> what happens in case the device-tree doesn't export/contain this
> property (exactly the case we have right now)? Does the device work
> fine? Also, having it "wrong" (based on the other OnePlus 3) is worse
> than not having it? In other words, what's the default value picked if
> none is provided in the DT?
Basically:

if (msm_id) {
    if is_close_enough(msm_id, internal_msm_id)
        boot()
    else
        die()
} else
    die()

Konrad
> 
> Cheers,
> 
> 
> Guilherme
