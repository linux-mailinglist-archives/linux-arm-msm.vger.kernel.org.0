Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EB9D96C0393
	for <lists+linux-arm-msm@lfdr.de>; Sun, 19 Mar 2023 18:51:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229735AbjCSRvC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 19 Mar 2023 13:51:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33826 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229596AbjCSRvB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 19 Mar 2023 13:51:01 -0400
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A35F012CFF
        for <linux-arm-msm@vger.kernel.org>; Sun, 19 Mar 2023 10:50:58 -0700 (PDT)
Received: by mail-ed1-x52f.google.com with SMTP id w9so38645240edc.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 19 Mar 2023 10:50:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679248257;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=00maLYThbB2ZrBGgsPig398VSjnMsDm6aNo0Lct8eGo=;
        b=lJkZ6gmXxRW0A/ZcnO2EucL6IJohFtVAWD2S8QqfMumXHV2q/Ir5daDPjDnpsdcc7z
         ZXP4RO+UErYLSm6yE4V6f+F7DwhA7uUAeu7VWZpYJdPXbE4YGTrBynTJPOGPGTzp07Uz
         sicAaC4Qmh8m+dOzQUI9VrEjOiQhSVcKXg8MMZ/ttAFM45/praCmEtyJZ5pyicxfDfvp
         /YnXAL20qVoLYiJ7uUI8ew8rebTpyLciTDQssGo79Wwl7+QJFZ9Oi7qfy39sWXI6y8jC
         kn+8aSfhXOWPbamDVD1oXKe0GV8cNNuKuc1kiP4ZeJp2b1XnjfFlYbG8PHWLRP+Npb0f
         G6VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679248257;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=00maLYThbB2ZrBGgsPig398VSjnMsDm6aNo0Lct8eGo=;
        b=4NWVwSslEUi3MZ34hZwawUZVsJdUsd03cOM7lVMQx0E4rOgvJHBAfrodMIjyMHO3xR
         7eqJXpfL8XWwdrON9B02kHCYILQhMyEXuM9AFtwJVNn8nO7PSPEh6pWYSB/6OsGaaEo9
         HW6cE4+siiPg0AwhIkwtjjYB/XOPq12cexPzJDmOCWMTdHeEAsZCQ1dw8pYbb/QzHOCN
         WoujljTJT7/cATtaOEeyOHjd3OqhOV1McpwF9gmk9yO4ZBT3biwlZZy4svwgV7Vxh4ZG
         xyOBJlgXRZ7a9WHB0l/DRmiUoS8PdhEdLt0Z6PU4rTgydqTvBnXFXAFWgFrN9LZaa36b
         WMBw==
X-Gm-Message-State: AO0yUKUqdQLjTU6hXXgMxz4NUcOdkV6JK89ThlkbV/8cpD0wULD5TXRD
        0CovQ+lQsNWhvNMThHgmqgCNC16jFtVoV96mTw8=
X-Google-Smtp-Source: AK7set95aPTJOHeKu+bHDcG+A9CTzrJ759cvWgUDbIS/MNtnexz5zTiCWWPjRGB4nZF5d7WJrTSc7w==
X-Received: by 2002:a17:906:c284:b0:926:7d96:9434 with SMTP id r4-20020a170906c28400b009267d969434mr6244371ejz.51.1679248257162;
        Sun, 19 Mar 2023 10:50:57 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:5b5f:f22b:a0b:559d? ([2a02:810d:15c0:828:5b5f:f22b:a0b:559d])
        by smtp.gmail.com with ESMTPSA id v2-20020a17090651c200b008d57e796dcbsm3474576ejk.25.2023.03.19.10.50.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 19 Mar 2023 10:50:56 -0700 (PDT)
Message-ID: <c5ac0d15-4651-318e-4dd2-37b2f90b2ba0@linaro.org>
Date:   Sun, 19 Mar 2023 18:50:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v4 09/18] dt-bindings: usb: Add Qualcomm PMIC TCPM YAML
 schema
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>, linux@roeck-us.net,
        heikki.krogerus@linux.intel.com, gregkh@linuxfoundation.org,
        andersson@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, linux-usb@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Cc:     wcheng@codeaurora.org, caleb.connolly@linaro.org,
        konrad.dybcio@linaro.org, subbaram@quicinc.com, jackp@quicinc.com,
        robertom@qti.qualcomm.com
References: <20230318121828.739424-1-bryan.odonoghue@linaro.org>
 <20230318121828.739424-10-bryan.odonoghue@linaro.org>
 <7cd51a8d-7b23-7895-7c06-07dc98924931@linaro.org>
 <a4da1f8f-333e-9ded-d784-7f86c45c7156@linaro.org>
 <346ecd20-d64f-1d47-4860-861e142f9700@linaro.org>
 <aa5d1492-906f-9e30-8f97-6321db692c73@linaro.org>
Content-Language: en-US
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <aa5d1492-906f-9e30-8f97-6321db692c73@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 19/03/2023 16:44, Bryan O'Donoghue wrote:
> On 19/03/2023 15:10, Krzysztof Kozlowski wrote:
>> On 19/03/2023 15:59, Bryan O'Donoghue wrote:
>>> On 19/03/2023 11:58, Krzysztof Kozlowski wrote:
>>>>> +
>>>>> +maintainers:
>>>>> +  - Bryan O'Donoghue<bryan.odonoghue@linaro.org>
>>>>> +
>>>>> +description: |
>>>>> +  Qualcomm PMIC Virtual Type-C Port Manager Driver
>>>>> +  A virtual device which manages Qualcomm PMIC provided Type-C port and
>>>>> +  Power Delivery in one place.
>>>> OK, so it looks like bindings for driver, so a no-go. Unless there is
>>>> such device as "manager", this does not look like hardware description.
>>>>
>>>>> +
>>>>> +properties:
>>>>> +  compatible:
>>>>> +    const: qcom,pmic-virt-tcpm
>>>>> +
>>>>> +  connector:
>>>>> +    type: object
>>>>> +    $ref: /schemas/connector/usb-connector.yaml#
>>>>> +    unevaluatedProperties: false
>>>>> +
>>>>> +  port:
>>>>> +    $ref: /schemas/graph.yaml#/properties/port
>>>>> +    description:
>>>>> +      Contains a port which consumes data-role switching messages.
>>>>> +
>>>>> +  qcom,pmic-typec:
>>>>> +    $ref: /schemas/types.yaml#/definitions/phandle
>>>>> +    description:
>>>>> +      A phandle to the typec port hardware driver.
>>>>> +
>>>>> +  qcom,pmic-pdphy:
>>>>> +    $ref: /schemas/types.yaml#/definitions/phandle
>>>> Having typec and phy as phandles - not children - also suggests this is
>>>> some software construct, not hardware description.
>>>
>>> So probably I didn't interpret Rob's comment correctly here.
>>
>> He proposed to merge it with other node:
>> "probably merged with
>> one of the nodes these phandles point to."
>>
>> "Why can't most of this binding be part of"
>>
>> I don't see how you implemented his comments. Actually, nothing improved
>> here in this regard - you still have these phandles.
> 
> So this comment from Rob is what I was aiming for
> 
> "Your other option is instantiate your own device from the virtual
> driver's initcall based on presence of the 2 nodes above. "
> 
> rather than two mush the pdphy and typec into one device, which they are 
> not.

Sure, but you did not instantiate anything based on these two or one
nodes. You added virtual device node.


> I guess what I'm trying to understand is how you guys would suggest that 
> is actually done.

You have there already node for the PMIC USB Type-C, so this should be
part of it. I really do not understand why this is separate device lying
around in parallel like:

pmic {
	usb {
	};
};

virtual- pmic-tcpm {
};

What hardware piece does such description represent?

> 
> Could I trouble you for an example ?
> 
> ---
> bod

Best regards,
Krzysztof

