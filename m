Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BED5278E13E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Aug 2023 23:13:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240889AbjH3VNK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 30 Aug 2023 17:13:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51630 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240900AbjH3VNJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 30 Aug 2023 17:13:09 -0400
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A382CDC
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Aug 2023 14:12:39 -0700 (PDT)
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-31dcd553fecso5974f8f.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Aug 2023 14:12:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693429883; x=1694034683; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sqhS2buf3q5lKZs0QgnHq/NuMUrTYmV//7wpqK/hL6c=;
        b=uvVMl9nl3aqUF/lAez5jWR0D5qw1sm0V/Ot+mfpcFwoiqmcV0raAiuf5KBAyXGXug2
         rzQU4cLis1U280ikChRsrg+yBxXbdC9++C59FnYnrmWJUbXBNea4RVPni0J2G2NtTUoS
         jykDdKk2wBZ9/5uqvqU7f/ka5xnYN9zbcRDok5bmiILO0C4W+cAKxoM+qW8Nwwort3KY
         iaWodtPz8QBFPcr+nDapXPMbP+eSdhWgznJFT1HWkhombFRddPzO7Vq6P76GEltGCAHR
         ugyxkH1GMvaT6NGAvUpaJ7RxkG48S+TGYKoB4+y2d7kzF4z8MPm/qsETWEon6eLjJsIS
         vDmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693429883; x=1694034683;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sqhS2buf3q5lKZs0QgnHq/NuMUrTYmV//7wpqK/hL6c=;
        b=DHfsVFpej1NIkPDpFCU7uG8i/m/gFOZKQAHqULdHIc2kF9hhGh9y0ZD6EIhjDejL4m
         WU3PjnF55XqRwWczcg8mwu5rLb/cMGHwP1qpFoZKQhwxhuvX1Wb5sLL18tnvGGFxX4/5
         CU0L9k+vGrlR2wQ9bRKRsEX9gIlEfBZQMucN4QZe31aqy9Oznq+EmrsN2o5kkGS5+dLQ
         e53JHbXLo8FDCZyPu8us/2zIzVTWXcZM7PIhM/0eHhbaq2IqGtjxQhnbTQnVgW7k/+N1
         Alt1n/fZC7caVzbkD4qnPrqQjIzPYOjcYvXSakgMY2YqrrdeYUJ1W/HNDywvGrLax25d
         mSzw==
X-Gm-Message-State: AOJu0YzrtvHhv6E0UZYwB0vAum7/fJonlqw6d5JSaQG7XafrOy/PgSED
        PCXKe/324V5aSd2EUxrfPcvA+3Ha38apwmpYIbDr7Q==
X-Google-Smtp-Source: AGHT+IFYtYpox7ihArAxMld7ZB3Yd1sKfUj50x1GV1gb0SRJFFM1XHVFrLZ2pomZaP6+3hhHlGaWiQ==
X-Received: by 2002:a2e:9990:0:b0:2bc:dab2:c7dc with SMTP id w16-20020a2e9990000000b002bcdab2c7dcmr2411638lji.47.1693427732218;
        Wed, 30 Aug 2023 13:35:32 -0700 (PDT)
Received: from [192.168.1.101] (abyl195.neoplus.adsl.tpnet.pl. [83.9.31.195])
        by smtp.gmail.com with ESMTPSA id w8-20020a2e9988000000b002b9f4841913sm2742873lji.1.2023.08.30.13.35.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Aug 2023 13:35:31 -0700 (PDT)
Message-ID: <6bcb460b-6deb-4918-9058-67536e0af0ad@linaro.org>
Date:   Wed, 30 Aug 2023 22:35:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/7] arm64: dts: qcom: sm8550: Fix up CPU idle states
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Abel Vesa <abel.vesa@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Sai Prakash Ranjan <quic_saipraka@quicinc.com>,
        Vinod Koul <vkoul@kernel.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, dmaengine@vger.kernel.org
References: <20230830-topic-8550_dmac2-v1-0-49bb25239fb1@linaro.org>
 <20230830-topic-8550_dmac2-v1-3-49bb25239fb1@linaro.org>
 <CAA8EJpp7bxq4=i1CMPYvz99ZuKLz+th6zSFhhRhFMjDwGB5Z8Q@mail.gmail.com>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <CAA8EJpp7bxq4=i1CMPYvz99ZuKLz+th6zSFhhRhFMjDwGB5Z8Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 30.08.2023 22:13, Dmitry Baryshkov wrote:
> On Wed, 30 Aug 2023 at 22:04, Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
>>
>> The idle residency times are largely too low according to the vendor
>> kernel (maybe they came from an earlier release or something), especially
>> for the prime X2 core. Fix them.
>>
>> Fixes: ffc50b2d3828 ("arm64: dts: qcom: Add base SM8550 dtsi")
>> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
>> ---
>>  arch/arm64/boot/dts/qcom/sm8550.dtsi | 32 +++++++++++++++++++++-----------
>>  1 file changed, 21 insertions(+), 11 deletions(-)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
>> index d115960bdeec..c21ba6afa752 100644
>> --- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
>> @@ -283,9 +283,9 @@ LITTLE_CPU_SLEEP_0: cpu-sleep-0-0 {
>>                                 compatible = "arm,idle-state";
>>                                 idle-state-name = "silver-rail-power-collapse";
>>                                 arm,psci-suspend-param = <0x40000004>;
>> -                               entry-latency-us = <800>;
>> +                               entry-latency-us = <550>;
>>                                 exit-latency-us = <750>;
>> -                               min-residency-us = <4090>;
>> +                               min-residency-us = <6700>;
>>                                 local-timer-stop;
>>                         };
>>
>> @@ -294,8 +294,18 @@ BIG_CPU_SLEEP_0: cpu-sleep-1-0 {
>>                                 idle-state-name = "gold-rail-power-collapse";
>>                                 arm,psci-suspend-param = <0x40000004>;
>>                                 entry-latency-us = <600>;
>> -                               exit-latency-us = <1550>;
>> -                               min-residency-us = <4791>;
>> +                               exit-latency-us = <1300>;
>> +                               min-residency-us = <8136>;
>> +                               local-timer-stop;
>> +                       };
>> +
>> +                       PRIME_CPU_SLEEP_0: cpu-sleep-2-0 {
>> +                               compatible = "arm,idle-state";
>> +                               idle-state-name = "gold-plus-rail-power-collapse";
>> +                               arm,psci-suspend-param = <0x40000004>;
>> +                               entry-latency-us = <500>;
>> +                               exit-latency-us = <1350>;
>> +                               min-residency-us = <7480>;
>>                                 local-timer-stop;
> 
> This isn't only fixing the time properties, but also adds the whole
> new sleep state!
It does add a "new" sleep state with the exact same parameters,
the only thing being that it's exclusive to the prime core and
the only thing that differs is the residencies.

Konrad
