Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BF79F6DB443
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Apr 2023 21:33:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229459AbjDGTdq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 7 Apr 2023 15:33:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34034 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230029AbjDGTdm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 7 Apr 2023 15:33:42 -0400
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E0F559D5
        for <linux-arm-msm@vger.kernel.org>; Fri,  7 Apr 2023 12:33:37 -0700 (PDT)
Received: by mail-ej1-x631.google.com with SMTP id sg7so10456545ejc.9
        for <linux-arm-msm@vger.kernel.org>; Fri, 07 Apr 2023 12:33:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680896016;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CFcdt1ttR0JYr0me/5LJWwJyzWI4lE8LLRex0Ck54qI=;
        b=FfYMlF/JVt7WPbyOAw3CJ5nrX7HmzTF5uYdpNXnNgD56bmOtp8l+u07FQ/4OafANU7
         O/r0phQh0tTxwq0BUaTSFlMyG6O7I+Lxv0PAWFUI/3yk/IaEq9X6CoLVpu1khm5dh4CW
         HdxY9rWtBQi8EQsX1mYFnpyfVzOz3sMLM7jUcp2VstzEaZvMdpup12XQIF8TBTuzngZe
         GRaeGZcWaB748FYU01VN2XOkuyeRUkxo7JO8yXrA1UADpvBHoca7PxmN5Ow4eBpfwGK9
         PBmM/B5+Q7TvqohZoUVgpaeMYYYLkEW+2rWf+6fhXiZ8FvXUcvTbxX21J2HBo4kU3xjL
         3yrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680896016;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CFcdt1ttR0JYr0me/5LJWwJyzWI4lE8LLRex0Ck54qI=;
        b=dJiX+gJseInVAiBXGsjEB9AA7Qpqe9NAD/bcqnsGVdJiHZqxlGo3Vr3LnWcH6NVkws
         c5JYuDj3llleOsbCFsduf64dk6ZUqXWNQRkHW2kwoa+WWbx5fuahHgDNwaTCvfZnhdwM
         GAhbVxMqdSEiwPDKi0ztzQkyjZg7t7FWmto5yzkWOzlS+BnYhRUkrMTyHqJOeSno8Lej
         QtNtuxcDw9XRrTan8jiFLujlZu5A4UF6afaN5k578mRGwDAtZhFeRsnfjqwAtp3X6jgq
         UiDLht/TduGJMmawvBXcvE2gIP8F8Nc2KUpDRs7Ilb+jiD0vehuNSTqqJft88rPF6Xnq
         9jIQ==
X-Gm-Message-State: AAQBX9etrKNjt9x/QG8PWmno4zRKRHpGon6/ZzfhnOpyD5wOmoGcXWiG
        khE2feGg/dFnk7/p0CPXXmZu+A==
X-Google-Smtp-Source: AKy350ZaW3hCil6LKliWTuygUI+papi9EEN403UkJdh/kiNh2NqDn57PzsJDJBPuEJkj2sDdpl7LZQ==
X-Received: by 2002:a17:906:58f:b0:926:fce:c080 with SMTP id 15-20020a170906058f00b009260fcec080mr492038ejn.17.1680896016079;
        Fri, 07 Apr 2023 12:33:36 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:b20f:8824:c926:8299? ([2a02:810d:15c0:828:b20f:8824:c926:8299])
        by smtp.gmail.com with ESMTPSA id vo14-20020a170907a80e00b00947cac48916sm2339974ejc.8.2023.04.07.12.33.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Apr 2023 12:33:35 -0700 (PDT)
Message-ID: <d8de5632-09f9-565a-ec06-814cc23c12ea@linaro.org>
Date:   Fri, 7 Apr 2023 21:33:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v5 3/4] dt-bindings: arm: qcom: Add Acer Aspire 1
Content-Language: en-US
To:     Doug Anderson <dianders@chromium.org>,
        Nikita Travkin <nikita@trvn.ru>
Cc:     agross@kernel.org, andersson@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, konrad.dybcio@linaro.org,
        quic_srivasam@quicinc.com, judyhsiao@chromium.org,
        mka@chromium.org, cros-qcom-dts-watchers@chromium.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
References: <20230407151423.59993-1-nikita@trvn.ru>
 <20230407151423.59993-4-nikita@trvn.ru>
 <CAD=FV=VQKS1J42qx-Zk9JKwRUeX1evQjZzs_RMAMFby-gaNDXw@mail.gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CAD=FV=VQKS1J42qx-Zk9JKwRUeX1evQjZzs_RMAMFby-gaNDXw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 07/04/2023 18:23, Doug Anderson wrote:
> Hi,
> 
> On Fri, Apr 7, 2023 at 8:14 AM Nikita Travkin <nikita@trvn.ru> wrote:
>>
>> Acer Aspire 1 is a laptop based on sc7180. Document it's compatible.
>>
>> Signed-off-by: Nikita Travkin <nikita@trvn.ru>
>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> ---
>> Changes in v2:
>>  - Merge with IDP (Krzysztof)
>> ---
>>  Documentation/devicetree/bindings/arm/qcom.yaml | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
>> index f8d29b65f28b..db97a61e8ccb 100644
>> --- a/Documentation/devicetree/bindings/arm/qcom.yaml
>> +++ b/Documentation/devicetree/bindings/arm/qcom.yaml
>> @@ -367,9 +367,9 @@ properties:
>>                - qcom,qru1000-idp
>>            - const: qcom,qru1000
>>
>> -      - description: Qualcomm Technologies, Inc. SC7180 IDP
>> -        items:
>> +      - items:
>>            - enum:
>> +              - acer,aspire1
>>                - qcom,sc7180-idp
>>            - const: qcom,sc7180
> 
> If Krzysztof is happy then I have no real objections here. That being
> said, I personally would have updated the description to be more
> generic and not say "IDP" anymore. Something like "Non-Chromebook
> sc7180 boards".

I am fine with both - dropping the description or changing it to
something meaningful.

Best regards,
Krzysztof

