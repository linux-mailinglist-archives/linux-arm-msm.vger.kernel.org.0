Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 96A1D50F424
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Apr 2022 10:32:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344830AbiDZIfN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 26 Apr 2022 04:35:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36234 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345091AbiDZIeE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 26 Apr 2022 04:34:04 -0400
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 67F796AA44
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 Apr 2022 01:25:59 -0700 (PDT)
Received: by mail-ej1-x629.google.com with SMTP id dk23so11178711ejb.8
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 Apr 2022 01:25:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=kVo+bOOc4liirVkqcBpptO7RyaT+yAq19oDpkuLKV4E=;
        b=eOmyd84XMli/pg4xVDLutFSYv003hteq9oM1eOGc5N2Dxcut0nBlgdvh5ObPu6/aoZ
         KgKzDTSKIn0uZ1W2iXQ3R2DjmyXt4pSzvdbYVM6KTQ7gabVUk20p10OwKea8O81ZQ7QO
         fe9c6BmnTA1TLqipnZOYXipFA7AbqL/3E0DNxL7oDw6tW2YwwqMkOBPrZ/X2HGaLNHjw
         qtZHDDZmqDP4+3io6a5pxKNsK5KDZpuUI9ApJLqJj5OIHmulMD28+8xaAc9QtTO+PRxj
         G7U0JkExj9cODdI5/zlS+7EVxfvym/Tfn8Gwq10l7M1M5xhn/jOP13AWTGhDjHWacAqj
         z5Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=kVo+bOOc4liirVkqcBpptO7RyaT+yAq19oDpkuLKV4E=;
        b=RjnYTUtKNnuwKqpw7GGLjs/4nlJa1Ax3XrfSbcIca6yDv6afox5ivRLryoJCVCVgqx
         XACCZXXEPUti7UHnlbf+fm3O4G1PYtWFJqp/0hc1trxqH95B2r3s8Xw11EgV78e6ZLLz
         C5J0ilGOL1sMgvv5mVowx3Qx0Z89ssM7iKsZnkD66r/OGn2v/J3RLUKEbDUZE7yAQuaO
         e8/3jFuZs2WnZRYv+I/pkFhcviiuGrqKwOe9tFubv9PfOKq2GMVTSGP7SoBG13WKN3/8
         ROu9M40TJPBkqduQIN4BjU3dK1nziBRq9WmKJRu8BcgKlYiPCrkMsFCPvBkDTUI2TkjS
         KeTQ==
X-Gm-Message-State: AOAM532s+6lLwfLAPkBIJTy7S/reWuQB2Oq0fApPBGwdgeOB5f/2Lz2E
        hJgrg6RXq2fR/JaciCCKFBm6HA==
X-Google-Smtp-Source: ABdhPJyWJN3OdTtdtqejs/Xoh52Bj3LRyCRNGd2/GmGEFwjXptF/32UbDQ7adCd/0m6cxLG81ACqCw==
X-Received: by 2002:a17:907:6d83:b0:6f3:adf4:9817 with SMTP id sb3-20020a1709076d8300b006f3adf49817mr2655975ejc.491.1650961557905;
        Tue, 26 Apr 2022 01:25:57 -0700 (PDT)
Received: from [192.168.0.245] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id i17-20020a1709064ed100b006f382c0b89dsm2915462ejv.56.2022.04.26.01.25.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Apr 2022 01:25:57 -0700 (PDT)
Message-ID: <8238f2e8-82cf-0bca-8a50-b1b6fc0ec665@linaro.org>
Date:   Tue, 26 Apr 2022 10:25:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] dt-bindings: clock: gcc-apq8064: move qcom,apq8084 back
 to gcc-other.yaml
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20220426072451.2905910-1-dmitry.baryshkov@linaro.org>
 <6b766f08-5cac-fbda-cdb5-364aabb54fb3@linaro.org>
 <CAA8EJppBAUbT58yFyQTYPou37BquHDjbvqw9ziL4XEz15M4S-g@mail.gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CAA8EJppBAUbT58yFyQTYPou37BquHDjbvqw9ziL4XEz15M4S-g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 26/04/2022 10:07, Dmitry Baryshkov wrote:
> On Tue, 26 Apr 2022 at 10:31, Krzysztof Kozlowski
> <krzysztof.kozlowski@linaro.org> wrote:
>>
>> On 26/04/2022 09:24, Dmitry Baryshkov wrote:
>>> The global clock controller on apq8084 has nothing to do with the schema
>>> for apq8064. It uses the schema defined in qcom,gcc-other.yaml. Move
>>> respective declarations back.
>>>
>>> Instead add what was really meant to be present in qcom,gcc-apq8064
>>> schema: the compatibility string for qcom,apq8064 device.
>>>
>>
>> Reported-by: Rob Herring <robh@kernel.org>
>>
>>
>>> Fixes: a469bf89a009 ("dt-bindings: clock: simplify qcom,gcc-apq8064 Documentation")
>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>> ---
>>>  .../devicetree/bindings/clock/qcom,gcc-apq8064.yaml         | 6 +++---
>>>  Documentation/devicetree/bindings/clock/qcom,gcc-other.yaml | 3 +++
>>>  2 files changed, 6 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-apq8064.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc-apq8064.yaml
>>> index 97936411b6b4..b867da12761e 100644
>>> --- a/Documentation/devicetree/bindings/clock/qcom,gcc-apq8064.yaml
>>> +++ b/Documentation/devicetree/bindings/clock/qcom,gcc-apq8064.yaml
>>> @@ -20,12 +20,12 @@ description: |
>>>    See also:
>>>    - dt-bindings/clock/qcom,gcc-msm8960.h
>>>    - dt-bindings/reset/qcom,gcc-msm8960.h
>>> -  - dt-bindings/clock/qcom,gcc-apq8084.h
>>> -  - dt-bindings/reset/qcom,gcc-apq8084.h
>>>
>>>  properties:
>>>    compatible:
>>> -    const: qcom,gcc-apq8084
>>> +    enum:
>>> +      - qcom,gcc-apq8064
>>> +      - qcom,gcc-msm8060
>>
>> This looks wrong. msm8060 was not broken by that commit and was never
>> here, was it?
> 
> I'm not sure that msm8060 even existed. This should be msm8960.
> 
> I can send v2 if you like this approach or I can rebase my tsens
> patches on top of your patch.

Your approach of moving the apq8064 here is correct, but addition of
msm8960 should be a separate patch because this compatible was not
broken by that commit. What is more, that compatible is in gcc-other.yaml.


Best regards,
Krzysztof
