Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 374EC743ACB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Jun 2023 13:26:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231743AbjF3L0p (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 30 Jun 2023 07:26:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36132 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231235AbjF3L0o (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 30 Jun 2023 07:26:44 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 346EE1FCB
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jun 2023 04:26:43 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-4f865f0e16cso2832634e87.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jun 2023 04:26:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688124401; x=1690716401;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1BS24JdK/jKuEyxqE6kH+nnxSMjU+G/ScPGcVdx0wtE=;
        b=ZR6MC2+YPnguYqP7v+kRMLHSTosOjqunW8Li4Qyb1+i396eRNYsAeCfe9NRkNaiJd9
         H37xocJkiCqvLYdoX5xnDnVedS6F7dYehNcMs7FLNz9AWm5stOpbbEinDVM/NuqjFNz2
         vL/mpK2OtuPEBo+ffyZgWboreodM/UrNyMAAxALWJ7U+WTmsP4XeZ4CUb3jQa9WfNKf7
         sqIhpDOG9TVQg+ZYAhukZDkryECfL8djqip3efpGoPIcNW3PTwDTCNp7Z8ec8+w4HsQH
         x9o53miVz4WnuqCsH+RgBKBFGJsi6Tmbp14BXNqw6MUB4JbijsN5ppiRO+TFtUVOJpx0
         88sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688124401; x=1690716401;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1BS24JdK/jKuEyxqE6kH+nnxSMjU+G/ScPGcVdx0wtE=;
        b=diMizJuMYtz++uzJ1irfYmfMspNap1/xoTYn47x4ONsxZLnqMS7VFS1LPXrJXRT1aU
         yr+uigir60JjCV64wrAF2Ps5jziqbRtszz5NwvJHhDmISbG0h0IQQ/yS0TRb7mmXmb81
         7Jt/Xh/UXqn8Aa8rfsgBjXpwKS0Bgrz0LrZmaIlfOLCSD7H2cdvMDbzRevSBPBqo6RDa
         Fx4Sru1iGhiuB7et0aX7jNlhivbpX0pRKri0kl17ws04Tae1qN/ew5vLovfRZM8WUwy3
         AYaxDT/BpRNrpHnB3QZER8T3FxX4hxhmnrH+6cNaakixM0m1yLt+dKfcZ1IoS0NGPa96
         6sVA==
X-Gm-Message-State: ABy/qLY2tg3KcF/YlZ0WeNiD21NpdIoE6DD8q08dVym6d3xHH6HFC5LT
        qxZXmD3NvgL8a3WiFCcxtHBN8w==
X-Google-Smtp-Source: APBJJlFs0zBMxolLomEEJrTyDpes82pYDL106VLkrv0WLsP9EI2tlzC5kqyMiOvXPsVxyhVjd/xawg==
X-Received: by 2002:a05:6512:3f8:b0:4f6:3677:54e with SMTP id n24-20020a05651203f800b004f63677054emr1745466lfq.36.1688124401241;
        Fri, 30 Jun 2023 04:26:41 -0700 (PDT)
Received: from [192.168.1.101] (abyj222.neoplus.adsl.tpnet.pl. [83.9.29.222])
        by smtp.gmail.com with ESMTPSA id n30-20020ac2491e000000b004fb82d7532dsm1476061lfi.177.2023.06.30.04.26.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Jun 2023 04:26:40 -0700 (PDT)
Message-ID: <078b2f4e-0474-6e40-f53b-d2238c703ca6@linaro.org>
Date:   Fri, 30 Jun 2023 13:26:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 4/7] arm64: dts: qcom: pmk8350: fix ADC-TM compatible
 string
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20230630061315.4027453-1-dmitry.baryshkov@linaro.org>
 <20230630061315.4027453-5-dmitry.baryshkov@linaro.org>
 <4c7377c8-eca9-5614-9c71-d90c091f134d@linaro.org>
 <CAA8EJpoeNawPtpnz+mC0W94bcfZPn87+saQ8wxNX+5Wxx+ZLTg@mail.gmail.com>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <CAA8EJpoeNawPtpnz+mC0W94bcfZPn87+saQ8wxNX+5Wxx+ZLTg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 30.06.2023 12:11, Dmitry Baryshkov wrote:
> On Fri, 30 Jun 2023 at 11:13, Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
>>
>> On 30.06.2023 08:13, Dmitry Baryshkov wrote:
>>> The commit b2de43136058 ("arm64: dts: qcom: pmk8350: Add peripherals for
>>> pmk8350") for the ADC TM (thermal monitoring device) have used the
>>> compatible string from the vendor kernel ("qcom,adc-tm7"). Use the
>>> proper compatible string that is defined in the upstream kernel
>>> ("qcom,spmi-adc-tm5-gen2").
>>>
>>> Fixes: b2de43136058 ("arm64: dts: qcom: pmk8350: Add peripherals for pmk8350")
>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>> ---
>> Well actually, adc-tm7 would be the correct compatible (PM8350X is PMIC7)
>> but it never landed on the driver side..
> 
> I also thought so (and started implementing adc-tm7), but then I
> stumbled upon the commit 96f6f333bcf0 ("thermal/drivers/qcom: Add
> support for PMIC5 Gen2 ADCTM"), which clearly tells:
> 
>     Add support for PMIC5 Gen2 ADC_TM, used on PMIC7 chips. It is a
>     close counterpart of PMIC7 ADC and has the same functionality as
>     PMIC5 ADC_TM, for threshold monitoring and interrupt generation.
>     It is present on PMK8350 alone, ....
> 
> So, this is the right compatible for PMK8350.
Oh, ok!

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
> 
>>
>> Konrad
>>>  arch/arm64/boot/dts/qcom/pmk8350.dtsi | 2 +-
>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/arch/arm64/boot/dts/qcom/pmk8350.dtsi b/arch/arm64/boot/dts/qcom/pmk8350.dtsi
>>> index bc6297e7253e..1eb74017062d 100644
>>> --- a/arch/arm64/boot/dts/qcom/pmk8350.dtsi
>>> +++ b/arch/arm64/boot/dts/qcom/pmk8350.dtsi
>>> @@ -59,7 +59,7 @@ pmk8350_vadc: adc@3100 {
>>>               };
>>>
>>>               pmk8350_adc_tm: adc-tm@3400 {
>>> -                     compatible = "qcom,adc-tm7";
>>> +                     compatible = "qcom,spmi-adc-tm5-gen2";
>>>                       reg = <0x3400>;
>>>                       interrupts = <PMK8350_SID 0x34 0x0 IRQ_TYPE_EDGE_RISING>;
>>>                       #address-cells = <1>;
> 
> 
> 
