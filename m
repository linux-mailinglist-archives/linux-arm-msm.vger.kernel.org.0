Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 526E777B37D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Aug 2023 10:10:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234071AbjHNIKX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 14 Aug 2023 04:10:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46114 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234611AbjHNIKF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 14 Aug 2023 04:10:05 -0400
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4DC90172D
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Aug 2023 01:09:44 -0700 (PDT)
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-3fe490c05c9so28609925e9.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Aug 2023 01:09:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692000583; x=1692605383;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=h96fvtK7Q6sYb+yjtmtmp5Cx7J/yaSonESREWSMDZaQ=;
        b=yiJ+a+9RMWJqN1w+rJDCBGGGGOATGap34HO6ZfAOGwJ2aU+b9EzjU8C7ICOj+Mx4he
         rMIXOfPKYID+UybVy/kZbB4jC2o4sZDEbN48qT4OPDL6hMqgyNtvNijNW4HYoh6q65bJ
         IIRb1G33nhyhrRS4IM+sqOvmoa2kcRrGujORzyMIBh0W7uggT+mfMsNeQMJmLEVWPFjN
         e6nPGUtmo6nXwK7LGfSccLn3gpPmh2ckmCTU6pUDA5snu9+Xd0htDfGq5p0KdOc3VcX1
         b/5Z11KFYBwBJj1TMvQICXaYv/duwweZfU9j29ZybSgfuN8AzjNppkAbmLOG+y+YBwn2
         Y+tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692000583; x=1692605383;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h96fvtK7Q6sYb+yjtmtmp5Cx7J/yaSonESREWSMDZaQ=;
        b=P+1V+4C0wZ8dTxeLaJr35v4zcfRP6IdB0bPeP7VHw92Lo+kE314KIxUvMzxvKVSacq
         T4F/vZflMUl4N/gE+Q9XIW/HJKbksAjDo+6jG5phT3CNLfJykq03blULdb+/QaQQfyst
         C/H/YqjdnwD7NCeXkqjfd8VftPNayK24d7GUiSPRGSuO856dzGRTqiV+S4UWEBvV6uX/
         2QZP+Un3bbM9h1hkMxbhqL/2mciEPNJjB8UOULAs90bPDrSmUItsgSsXtif9I1nBq6U3
         wUojKeKRzXqg8v/ChgiBWdSn1XyGuAjqC1tIQq9moCqnVPUu4IZAm9WRuqWpONkoD16d
         JuPQ==
X-Gm-Message-State: AOJu0YwxMwTJF43Dn1Ai4Onwkt/DN59Iu4SI76w7/tQxEWNlZWRDRwaA
        tGlqIMk/pduim9WpTRPK0bmTTg==
X-Google-Smtp-Source: AGHT+IG5QpfTnxygk3x8uHSWEhK6bF3gN3WPZBhQegGjbp6KlbwT+Ggb6vfwd9jhaBqOIDrqTRVOYg==
X-Received: by 2002:a05:6000:188:b0:315:a235:8aa8 with SMTP id p8-20020a056000018800b00315a2358aa8mr9337209wrx.2.1692000582779;
        Mon, 14 Aug 2023 01:09:42 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:a3d8:b217:d82c:9bc0? ([2a01:e0a:982:cbb0:a3d8:b217:d82c:9bc0])
        by smtp.gmail.com with ESMTPSA id y9-20020a1c4b09000000b003fe1cac37d8sm16209267wma.11.2023.08.14.01.09.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Aug 2023 01:09:42 -0700 (PDT)
Message-ID: <7fc7371a-1b2d-ccce-1e73-6bfe70ea2b20@linaro.org>
Date:   Mon, 14 Aug 2023 10:09:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
From:   Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH 1/4] dt-bindings: soc: qcom: qcom,pmic-glink: add a gpio
 used to determine the Type-C port plug orientation
Content-Language: en-US
To:     Bjorn Andersson <andersson@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
References: <20230804-topic-sm8550-upstream-type-c-orientation-v1-0-36dd3edec7bf@linaro.org>
 <20230804-topic-sm8550-upstream-type-c-orientation-v1-1-36dd3edec7bf@linaro.org>
 <zhm72wrjg7yazutkinv5lx55dgqtm4hmuexw2ht24fu6txxk3d@oum27inbk7si>
Organization: Linaro Developer Services
In-Reply-To: <zhm72wrjg7yazutkinv5lx55dgqtm4hmuexw2ht24fu6txxk3d@oum27inbk7si>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 04/08/2023 18:03, Bjorn Andersson wrote:
> On Fri, Aug 04, 2023 at 03:50:07PM +0200, Neil Armstrong wrote:
>> On SM8450 and SM8550 based platforms, the Type-C plug orientation is given on a
>> GPIO line set by the PMIC.
>>
>> Document this optional Type-C connector property, and take the
>> assumption an active level represents an inverted/flipped orientation.
>>
>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>> ---
>>   .../devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml  | 18 ++++++++++++++++++
>>   1 file changed, 18 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml
>> index bceb479f74c5..1b0a00b19a54 100644
>> --- a/Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml
>> +++ b/Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml
>> @@ -35,6 +35,11 @@ properties:
>>     '#size-cells':
>>       const: 0
>>   
>> +  orientation-gpios:
>> +    description: An input gpio for Type-C connector orientation, used to detect orientation
>> +      of the Type-C connector. GPIO active level means "CC2" or Reversed/Flipped orientation.
> 
> This is a per-connector/port property, as such be part of the connector
> sub nodes rather than as a property of the shared pmic_glink entity.

This has been rejected by Rob, Dmitry & Krzysztof in:
https://lore.kernel.org/all/0fbf55e7-2140-751d-5347-f907a46ef78c@linaro.org/
&
https://lore.kernel.org/all/20230608154751.GA2750742-robh@kernel.org/

Indeed the "GPIO" is not part of the physical USB-C connector, but a property,
and it's not part of the PMIC GLINK firmware either, so ?

The PMIC function which generates this signal is handled by the PMIC GLINK
firmware, so this representation is the most accurate.

Neil

> 
> Regards,
> Bjorn
> 
>> +    maxItems: 1
>> +
>>   patternProperties:
>>     '^connector@\d$':
>>       $ref: /schemas/connector/usb-connector.yaml#
>> @@ -44,6 +49,19 @@ patternProperties:
>>   required:
>>     - compatible
>>   
>> +allOf:
>> +  - if:
>> +      not:
>> +        properties:
>> +          compatible:
>> +            contains:
>> +              enum:
>> +                - qcom,sm8450-pmic-glink
>> +                - qcom,sm8550-pmic-glink
>> +    then:
>> +      properties:
>> +        orientation-gpios: false
>> +
>>   additionalProperties: false
>>   
>>   examples:
>>
>> -- 
>> 2.34.1
>>

