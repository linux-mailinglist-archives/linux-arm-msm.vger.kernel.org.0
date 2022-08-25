Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 081F15A10C5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Aug 2022 14:41:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241939AbiHYMk5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 25 Aug 2022 08:40:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58196 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242014AbiHYMk4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 25 Aug 2022 08:40:56 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 004014A115
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Aug 2022 05:40:53 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id l8so10537110lfc.12
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Aug 2022 05:40:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=d/68CgZXpdibjx3VCkPqFVb7t4FrNdrli/rV5C+BiZY=;
        b=tgILCcxdGjfytzViND0aVwmMGnWbO9RkDo4NAdEOiLaQj+y4/BiibRPHIb9fEaKUzW
         Y2QVkTG0KHoM4F+OpBVSxeuxFAzKFGxOsvaQCuRcW2P+xyvx3+5t9VawlkJslnVuTEMC
         ZrOzo2Smtx29eyq+YRkPjma1483DAjf8cU21QsqnjC7PRq/+/QFpd2bNJWLQ82nLutGz
         sJq9o84nT+XGbfp2CwbVWtGbCsR3dRMwRTa0OASqgNfifLQykSBsJVBGDfsKeUyHpgHe
         tBEiApPUno55y3ueM47B6LWZDLJKOAqNOvvf5Ar8FN+ScZOr3adMniwGyheOgSng60WU
         0udg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=d/68CgZXpdibjx3VCkPqFVb7t4FrNdrli/rV5C+BiZY=;
        b=k4cwsfFu3p8jO5ztNmT16oj6zirRkFBwdF0b1XL2U39YFImaBkbNZrpNLTS8ujFBEL
         UA16VSalbbKNsGK6d8lgRKrQ07ovo9WMJpq9bC2Dr9HPs0Z2jwwEmxYo90aRqkD3otDe
         aypaMHuQ4gOp9fGtpGDDNJE+gjVFn5Zvs4WWoeuRz9kkxhgaKpCDKXIrlVKNmqYejDxo
         IurdMXus9Ahb0Y1vRAg+gqBOzOiuAlvjbH4CZ+jBPSN9kbsjaCTcUd9KeA5bM5UvJq83
         nLx5PzzJ70WRkH2JDwqCWrYUzvJ5hQ/iHIzWNn8w/qcUnCPSFHQ5eeTyIlz089Vnkb0P
         RUkw==
X-Gm-Message-State: ACgBeo0nhiDZsH+6sKfJnVg0jS/XSuhaIDliXu92d/RChic5YwZW+vEX
        VPZ8Ihg1ltLVEJyZblFzHN85ew==
X-Google-Smtp-Source: AA6agR6knAr76Sh3pws/tUUxlJuxgXi+jJ84QoZheAyP0f3pjbMXXgmbbgUww/Eu3pLjlGa471TJrg==
X-Received: by 2002:a19:5e19:0:b0:492:e529:61a7 with SMTP id s25-20020a195e19000000b00492e52961a7mr1129973lfb.635.1661431251764;
        Thu, 25 Aug 2022 05:40:51 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id u25-20020a199219000000b00492eeabd6f8sm487038lfd.52.2022.08.25.05.40.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Aug 2022 05:40:51 -0700 (PDT)
Message-ID: <b01585c9-1810-2f25-d4dd-bea31b685e79@linaro.org>
Date:   Thu, 25 Aug 2022 15:40:50 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.1.2
Subject: Re: [PATCH v4 03/10] dt-bindings: display/msm: move qcom,sc7180-mdss
 schema to mdss.yaml
Content-Language: en-GB
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
References: <20220825095103.624891-1-dmitry.baryshkov@linaro.org>
 <20220825095103.624891-4-dmitry.baryshkov@linaro.org>
 <8e0ab9f0-cc27-f472-ce5c-b9f4a9d94005@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <8e0ab9f0-cc27-f472-ce5c-b9f4a9d94005@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 25/08/2022 15:01, Krzysztof Kozlowski wrote:
> On 25/08/2022 12:50, Dmitry Baryshkov wrote:
>> Move schema for qcom,sc7180-mdss from dpu-sc7180.yaml to mdss.yaml so
>> that the dpu file describes only the DPU schema.
> 
> MDSS grows to unmanagable file. I don't think we will be able to keep it
> maintained. You will have many if-else defining subnodes and their
> characteristics. As I said before - this should be several separate
> schemas with common part.
> 
>>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
>>   .../bindings/display/msm/dpu-sc7180.yaml      | 149 +++++-------------
>>   .../devicetree/bindings/display/msm/mdss.yaml |  66 +++++++-
>>   2 files changed, 102 insertions(+), 113 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/display/msm/dpu-sc7180.yaml b/Documentation/devicetree/bindings/display/msm/dpu-sc7180.yaml
>> index d3c3e4b07897..9d4ec0b60c25 100644
>> --- a/Documentation/devicetree/bindings/display/msm/dpu-sc7180.yaml
>> +++ b/Documentation/devicetree/bindings/display/msm/dpu-sc7180.yaml
>> @@ -10,151 +10,78 @@ maintainers:
>>     - Krishna Manikandan <quic_mkrishn@quicinc.com>
>>   
>>   description: |
>> -  Device tree bindings for MSM Mobile Display Subsystem(MDSS) that encapsulates
>> -  sub-blocks like DPU display controller, DSI and DP interfaces etc. Device tree
>> -  bindings of MDSS and DPU are mentioned for SC7180 target.
>> +  Device tree bindings for the DPU display controller for SC7180 target.
>>   
>>   properties:
>>     compatible:
>>       items:
>> -      - const: qcom,sc7180-mdss
>> +      - const: qcom,sc7180-dpu
>>   
>>     reg:
>> -    maxItems: 1
>> +    items:
>> +      - description: Address offset and size for mdp register set
>> +      - description: Address offset and size for vbif register set
>>   
>>     reg-names:
>> -    const: mdss
>> -
>> -  power-domains:
>> -    maxItems: 1
>> +    items:
>> +      - const: mdp
>> +      - const: vbif
>>   
>>     clocks:
>>       items:
>> -      - description: Display AHB clock from gcc
>> -      - description: Display AHB clock from dispcc
>> +      - description: Display hf axi clock
>> +      - description: Display ahb clock
>> +      - description: Display rotator clock
>> +      - description: Display lut clock
>>         - description: Display core clock
>> +      - description: Display vsync clock
>>   
>>     clock-names:
>>       items:
>> +      - const: bus
>>         - const: iface
>> -      - const: ahb
>> +      - const: rot
>> +      - const: lut
>>         - const: core
>> +      - const: vsync
> 
> All these changes point that device schemas are simply different and
> trying to unify them is not correct approach.

I'm not going the argue the mdss-common + platform specifics, but please 
note that these changes are coming from me removing one extra level of 
depth in dpu-smth.yaml. Currently these files have both mdss and dpu 
devices, I'm stripping the mdss out of them.

> 
> Best regards,
> Krzysztof

-- 
With best wishes
Dmitry

