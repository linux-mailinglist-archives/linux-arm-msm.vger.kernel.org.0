Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 73CEC5B3B60
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Sep 2022 17:03:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229631AbiIIPDT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 9 Sep 2022 11:03:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60352 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229480AbiIIPDS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 9 Sep 2022 11:03:18 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ECE1413A079
        for <linux-arm-msm@vger.kernel.org>; Fri,  9 Sep 2022 08:03:16 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id f9so2435094lfr.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 Sep 2022 08:03:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=Vmqll87fgXtVSsw5dDmsHLc4RXFQEKzpyOW1jQCzE+c=;
        b=iY411gwIt+9peHpUPGegqHIUg+1PiWLZb0HyXiE3QEUMW9/803x2Mbhk9yy8ZFhu10
         mKjIUfR+HlAozp5T5YDJiYOLP6sQJR+ttRnyMfnkDZ1vTKicPpvn8mUWEGlOGwel1GmR
         tl6fVjCrieqdr+ZkbBD42sS/QfU8xY5eZr5IuS7AAJa5mQ+h832L3bOMnKp0Asoz8NI7
         AFVQObumPfNuTOm8IygKx+w+v/9rCOQEqTnEY0HJaipW28ByI82IlHa8K+IY0ck8ezqS
         YqMHGuIJ4loLZpji7Oz2mj9+V/c1ypk+CxEojY3HTAhiJLDGgweOpqwq76YcmLXyHlKO
         IMvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=Vmqll87fgXtVSsw5dDmsHLc4RXFQEKzpyOW1jQCzE+c=;
        b=hkjOguwwxq5/IQ5O47Sxty4r2efwyLoN5+cArCkapGWwwY5mg8bdXf8EZTeg+sIAGD
         GDyaABE7y2IO1yIs+owW2EKeteX7YwbUXe8Q9CcYkQNzLpTtEAmAKkqlHMO0/thl+fVb
         +aQtUlzT0cMxSszjfVqZ9pAPzVEpY+RySv87hj2tcOXVMVhBLwl/mX6bgTfBNlElJqHo
         vdLvEEMeW4+oVaOsJnLGpg7IP10Q3YXwIQc+HAlNSpw9mc2pb5so29ZaglXboPmyUdQj
         0RqZMGg3MHnaLGdGFHb4KPBxpEQrLTcRPteEIgzxMOhcOWfCQT4H5e7RV840XYcE2Lty
         Sx6w==
X-Gm-Message-State: ACgBeo2jSMqd9IuwJc8xH5a0mKqDQTYD2LvnF8nQe/lO/FgNcjWH2pyU
        fZm2jR0vHdHuCnA8mrsreGIM6g==
X-Google-Smtp-Source: AA6agR4bGw6VYraARGB5bgxJrO2WZfHyY5MJ9ZBdMbJR+yrevj/QUf63tb6GKqtB1BYu2TF2jkgEPw==
X-Received: by 2002:a05:6512:1686:b0:491:3199:d407 with SMTP id bu6-20020a056512168600b004913199d407mr4648076lfb.476.1662735795141;
        Fri, 09 Sep 2022 08:03:15 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id 22-20020ac25f56000000b0048a891e4d88sm109926lfz.193.2022.09.09.08.03.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Sep 2022 08:03:14 -0700 (PDT)
Message-ID: <59242592-4e3d-b7c2-e0bb-b39df780c26b@linaro.org>
Date:   Fri, 9 Sep 2022 18:03:14 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.1.2
Subject: Re: [PATCH 1/6] dt-bindings: phy: qcom,hdmi-phy-other: use pxo clock
Content-Language: en-GB
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Vinod Koul <vkoul@kernel.org>, linux-phy@lists.infradead.org,
        Kishon Vijay Abraham I <kishon@ti.com>
References: <20220909132010.3814817-1-dmitry.baryshkov@linaro.org>
 <20220909132010.3814817-2-dmitry.baryshkov@linaro.org>
 <d72fc00c-85ba-8b48-1fcf-42fe9e8daeee@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <d72fc00c-85ba-8b48-1fcf-42fe9e8daeee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 09/09/2022 16:30, Krzysztof Kozlowski wrote:
> On 09/09/2022 15:20, Dmitry Baryshkov wrote:
>> Add pxo clock to the 8960 bindings (used by the HDMI PLL)
>>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
>>   .../bindings/phy/qcom,hdmi-phy-other.yaml     | 23 ++++++++++++++++---
>>   1 file changed, 20 insertions(+), 3 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/phy/qcom,hdmi-phy-other.yaml b/Documentation/devicetree/bindings/phy/qcom,hdmi-phy-other.yaml
>> index fdb277edebeb..2c21e120ff8d 100644
>> --- a/Documentation/devicetree/bindings/phy/qcom,hdmi-phy-other.yaml
>> +++ b/Documentation/devicetree/bindings/phy/qcom,hdmi-phy-other.yaml
>> @@ -53,7 +53,6 @@ allOf:
>>             contains:
>>               enum:
>>                 - qcom,hdmi-phy-8660
>> -              - qcom,hdmi-phy-8960
>>       then:
>>         properties:
>>           clocks:
>> @@ -63,6 +62,24 @@ allOf:
>>               - const: slave_iface
>>           vddio-supply: false
>>   
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            enum:
>> +              - qcom,hdmi-phy-8960
>> +    then:
>> +      properties:
>> +        clocks:
>> +          minItems: 1
>> +          maxItems: 2
>> +        clock-names:
>> +          minItems: 1
>> +          items:
>> +            - const: slave_iface
>> +            - const: pxo
> 
> Why pxo is optional? Commit msg does not say much here.

It's optional as it is not present in current DT files. The driver will 
fallback to 'pxo_board' if the clock is not present.

> It seems you also miss the DTS change adding the clock.

Oh, I'll add it to v2.

-- 
With best wishes
Dmitry

