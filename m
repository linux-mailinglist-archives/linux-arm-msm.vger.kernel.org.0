Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EF0DB6B91DD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Mar 2023 12:41:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231459AbjCNLlw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 14 Mar 2023 07:41:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46370 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230370AbjCNLlv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 14 Mar 2023 07:41:51 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B85349B9A0
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Mar 2023 04:41:49 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id r27so19580079lfe.10
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Mar 2023 04:41:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678794108;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8T4+PQuKeTNWP5ozq/P1qnlthI2AuahsAL97gBNb+fc=;
        b=Czu3gjPEiFWRaNy3nG+rZ64lOym/n3Zhaw3ETVxiW6wNHRu1RobNqcHc1XO63BmaiN
         XJYTEvC6ivjuBJTBUvVOk8UvHmQNSRbc9iWY8orN4aR+188w4BVphLwYmzNn+xG1POqv
         Y+6A3J8GmQB9FPqh0QREcWRm8ETYpxPUkdkIdElSodyBSSYHJNI0TeB6SjM7P+kXzjYj
         XoTho/4lgj2XlfrXPWfViTuE7rnVPhvKiVFDZJpJuTNi8kSyFkmuWMjak9zUtJtgdDtI
         9rzP25swx6+JjofAIZh9T3O+Li+4TGHVtwo8dsqOTpTD9vuyZa2KtiZ3/A6gGTLKVFKm
         SwwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678794108;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8T4+PQuKeTNWP5ozq/P1qnlthI2AuahsAL97gBNb+fc=;
        b=nG2WxgdM45BldZwKL/5QyXaxqBoEEjZubqn/SpVnxjmf3xupHVtLreTtzCnmdvqBTs
         /SIx1r+JCk7e02N9QcUzMzW2F1OrjoIhyzyL30Tj/8J8lFNZobbeEw7NWr9VFwE1wFuV
         zcpiTJ4584DJ4TtIGiKVgLuYIqyyL7O/Lk69ugNUQUv+gqYZUtAcvy8yv2E73aGGQBBd
         Pt5/B9ZYnGZLcpbb07/RypW7oNeiwViJRFhX2HGtFr/kIq3yEbnya/in4DpYWcGR6PEb
         fH3uInxU7ceWDPCASN2hCS5/wfOVdL4VIVJwnU57YYcguKJxiywkDr78Zqf+ppFQ7WjS
         AILQ==
X-Gm-Message-State: AO0yUKUvVM5KDdcaaUXbN8Zy06M0kwboqcQflscdt8VyeDl+Lt4jJDsL
        wyTFSgyB0FKp7MsRbAWMkpW0x/nNu14UJEuh05w=
X-Google-Smtp-Source: AK7set/HlcQydoPl8i6soRhIHSxWSRsADBDN9VwSqcEg0Ovnqs1BMQKEShDx5ZRn1Mjul3laXAds+Q==
X-Received: by 2002:ac2:59d9:0:b0:4d8:56e2:d0ac with SMTP id x25-20020ac259d9000000b004d856e2d0acmr724228lfn.44.1678794108008;
        Tue, 14 Mar 2023 04:41:48 -0700 (PDT)
Received: from [192.168.1.101] (abyj16.neoplus.adsl.tpnet.pl. [83.9.29.16])
        by smtp.gmail.com with ESMTPSA id w18-20020ac24432000000b004db3e330dcesm369822lfl.178.2023.03.14.04.41.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Mar 2023 04:41:47 -0700 (PDT)
Message-ID: <ee1ebac4-bf18-019a-f770-5cb88703d06b@linaro.org>
Date:   Tue, 14 Mar 2023 12:41:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 3/3] arm64: dts: qcom: Split out SA8155P and use correct
 RPMh power domains
Content-Language: en-US
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
To:     Bjorn Andersson <andersson@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, agross@kernel.org,
        krzysztof.kozlowski@linaro.org, marijn.suijten@somainline.org,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230214095435.2192153-1-konrad.dybcio@linaro.org>
 <20230214095435.2192153-3-konrad.dybcio@linaro.org>
 <20230314001052.7qvgbwkl73x22oll@ripper>
 <eaf2ca0d-4d90-b68b-3b36-8bb0148cfb95@linaro.org>
In-Reply-To: <eaf2ca0d-4d90-b68b-3b36-8bb0148cfb95@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_SORBS_HTTP,RCVD_IN_SORBS_SOCKS,SPF_HELO_NONE,SPF_PASS,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 14.03.2023 12:36, Konrad Dybcio wrote:
> 
> 
> On 14.03.2023 01:10, Bjorn Andersson wrote:
>> On Tue, Feb 14, 2023 at 10:54:35AM +0100, Konrad Dybcio wrote:
>>> The RPMhPD setup on SA8155P is different compared to SM8150. Correct
>>> it to ensure the platform will not try accessing forbidden/missing
>>> RPMh entries at boot, as a bad vote will hang the machine.
>>>
>>
>> I don't see that this will scale, as soon as someone adds a new device
>> in sm8150.dtsi that has the need to scale a power rail this will be
>> forgotten and we will have a mix of references to the SM8150 and SA8155P
>> value space.
>>
>> That said, I think it's reasonable to avoid duplicating the entire
>> sm8150.dtsi.
> Yeah, this problem has no obvious good solutions and even though it's
> not very elegant, this seems to be the less bad one..
> 
>>
>> How about making the SA8155P_* macros match the SM8150_* macros?
>> That way things will fail gracefully if a device node references a
>> resource not defined for either platform...
> Okay, let's do that
Re-thinking it, it's good that the indices don't match, as this way the
board will (should) refuse to function properly if there's an oversight,
which may have gone unnoticed if they were matching, so this only guards
us against programmer error which is not great :/

Konrad
> 
> Konrad
>>
>> Regards,
>> Bjorn
>>
>>> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
>>> ---
>>>  arch/arm64/boot/dts/qcom/sa8155p-adp.dts |  2 +-
>>>  arch/arm64/boot/dts/qcom/sa8155p.dtsi    | 51 ++++++++++++++++++++++++
>>>  2 files changed, 52 insertions(+), 1 deletion(-)
>>>  create mode 100644 arch/arm64/boot/dts/qcom/sa8155p.dtsi
>>>
>>> diff --git a/arch/arm64/boot/dts/qcom/sa8155p-adp.dts b/arch/arm64/boot/dts/qcom/sa8155p-adp.dts
>>> index 459384ec8f23..9454e8e4e517 100644
>>> --- a/arch/arm64/boot/dts/qcom/sa8155p-adp.dts
>>> +++ b/arch/arm64/boot/dts/qcom/sa8155p-adp.dts
>>> @@ -7,7 +7,7 @@
>>>  
>>>  #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
>>>  #include <dt-bindings/gpio/gpio.h>
>>> -#include "sm8150.dtsi"
>>> +#include "sa8155p.dtsi"
>>>  #include "pmm8155au_1.dtsi"
>>>  #include "pmm8155au_2.dtsi"
>>>  
>>> diff --git a/arch/arm64/boot/dts/qcom/sa8155p.dtsi b/arch/arm64/boot/dts/qcom/sa8155p.dtsi
>>> new file mode 100644
>>> index 000000000000..f2fd7c28764e
>>> --- /dev/null
>>> +++ b/arch/arm64/boot/dts/qcom/sa8155p.dtsi
>>> @@ -0,0 +1,51 @@
>>> +// SPDX-License-Identifier: BSD-3-Clause
>>> +/*
>>> + * Copyright (c) 2023, Linaro Limited
>>> + *
>>> + * SA8155P is an automotive variant of SM8150, with some minor changes.
>>> + * Most notably, the RPMhPD setup differs: MMCX and LCX/LMX rails are gone.
>>> + */
>>> +
>>> +#include "sm8150.dtsi"
>>> +
>>> +&dispcc {
>>> +	power-domains = <&rpmhpd SA8155P_CX>;
>>> +};
>>> +
>>> +&mdss_mdp {
>>> +	power-domains = <&rpmhpd SA8155P_CX>;
>>> +};
>>> +
>>> +&mdss_dsi0 {
>>> +	power-domains = <&rpmhpd SA8155P_CX>;
>>> +};
>>> +
>>> +&mdss_dsi1 {
>>> +	power-domains = <&rpmhpd SA8155P_CX>;
>>> +};
>>> +
>>> +&remoteproc_adsp {
>>> +	power-domains = <&rpmhpd SA8155P_CX>;
>>> +};
>>> +
>>> +&remoteproc_cdsp {
>>> +	power-domains = <&rpmhpd SA8155P_CX>;
>>> +};
>>> +
>>> +&remoteproc_mpss {
>>> +	power-domains = <&rpmhpd SA8155P_CX>,
>>> +			<&rpmhpd SA8155P_MSS>;
>>> +};
>>> +
>>> +&remoteproc_slpi {
>>> +	power-domains = <&rpmhpd SA8155P_CX>,
>>> +			<&rpmhpd SA8155P_MX>;
>>> +};
>>> +
>>> +&rpmhpd {
>>> +	compatible = "qcom,sa8155p-rpmhpd";
>>> +};
>>> +
>>> +&sdhc_2 {
>>> +	power-domains = <&rpmhpd SA8155P_CX>;
>>> +};
>>> -- 
>>> 2.39.1
>>>
