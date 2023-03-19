Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CBBD46C0281
	for <lists+linux-arm-msm@lfdr.de>; Sun, 19 Mar 2023 15:59:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230336AbjCSO72 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 19 Mar 2023 10:59:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33080 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230167AbjCSO7Y (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 19 Mar 2023 10:59:24 -0400
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 13D6B16AF0
        for <linux-arm-msm@vger.kernel.org>; Sun, 19 Mar 2023 07:59:23 -0700 (PDT)
Received: by mail-wm1-x331.google.com with SMTP id iw17so645856wmb.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 19 Mar 2023 07:59:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679237961;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=txKMA2B9faUmSK0OeYaOqkIHc0GN3u/TzFEcc8ekuOU=;
        b=cV2MNlyS/VbkJB8L9TzU1eCp7V5hyLDPrL9lC2Yp/Gllec1dXlFLiM4wIWTJLo3yAC
         y27qzwl39byVdyJq364kYH7TbujAuGjipGiVhk8Quw6ipD31dtDSYCQGhvo7mW/SlWJh
         CqZzsY+GFbZag7qBE4uSVuWupi1s45VOqAenA7BF66wK4AQZbGxfqltypB01CqrkWPRv
         3cQ+itK+1/ndXhRIfgvK9AMr5rCC0gCjo1DyBXBnKF4n+M8rJq/yMwSCMPu6yupF3Dcd
         g7VmbkkUUddTjokJAzrFWzHpQITzv2AEgh/Ovy+TYJWlPUPDt6bLVKGXsKf3+DiaD15j
         tcVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679237961;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=txKMA2B9faUmSK0OeYaOqkIHc0GN3u/TzFEcc8ekuOU=;
        b=a/69z2esn/xydy1ktgT+5fvKWf0l+kNzJiYp9GLbNhLvHkGQQKq0b1Mi2P/w4ETqgw
         TazoDMERBmiqkkY314Ua6OsIplYZT5Krm5hHAQYtnI47djqG3DoCV3QohqmIYC3Afwg/
         yJspL0xNERU//H/j3BACB3DQXswjDBJj0yYjoi2OgfKm1g4KEU+ogDCiOqjBv7xbQKgx
         AiNEg7d0uWBvY7/6/F9q5L8wWR7uRw29bQ/tDmDnZTEBzf1EPe0vw9g7iPu5JRkWI3uy
         0JY0+ZFVTzGx5sOGyuA9Gt9fS7NRUSq2xptQ9kDochq9fRkjMHQV1g7jDVns5Fa1hKYI
         Jp7w==
X-Gm-Message-State: AO0yUKXf8vv1dlzbp/U3QXHyqZerO4tB/PqRcIGVy1DcQywf+NkuMt77
        Msan40VzolHzhm3V3RtX2a2iuw==
X-Google-Smtp-Source: AK7set8IwQaqSOMAnfPPg/WABivBCEWVer8FhbqpRWm7nk/Zb13qM6ky2MnuxhQ4VgConYAGQ9Q5UA==
X-Received: by 2002:a05:600c:2110:b0:3ed:f3e4:ac86 with SMTP id u16-20020a05600c211000b003edf3e4ac86mr270756wml.26.1679237961437;
        Sun, 19 Mar 2023 07:59:21 -0700 (PDT)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id f9-20020a05600c154900b003ede03e4369sm1654663wmg.33.2023.03.19.07.59.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 19 Mar 2023 07:59:20 -0700 (PDT)
Message-ID: <a4da1f8f-333e-9ded-d784-7f86c45c7156@linaro.org>
Date:   Sun, 19 Mar 2023 14:59:19 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v4 09/18] dt-bindings: usb: Add Qualcomm PMIC TCPM YAML
 schema
Content-Language: en-US
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux@roeck-us.net, heikki.krogerus@linux.intel.com,
        gregkh@linuxfoundation.org, andersson@kernel.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
Cc:     wcheng@codeaurora.org, caleb.connolly@linaro.org,
        konrad.dybcio@linaro.org, subbaram@quicinc.com, jackp@quicinc.com,
        robertom@qti.qualcomm.com
References: <20230318121828.739424-1-bryan.odonoghue@linaro.org>
 <20230318121828.739424-10-bryan.odonoghue@linaro.org>
 <7cd51a8d-7b23-7895-7c06-07dc98924931@linaro.org>
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <7cd51a8d-7b23-7895-7c06-07dc98924931@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 19/03/2023 11:58, Krzysztof Kozlowski wrote:
>> +
>> +maintainers:
>> +  - Bryan O'Donoghue<bryan.odonoghue@linaro.org>
>> +
>> +description: |
>> +  Qualcomm PMIC Virtual Type-C Port Manager Driver
>> +  A virtual device which manages Qualcomm PMIC provided Type-C port and
>> +  Power Delivery in one place.
> OK, so it looks like bindings for driver, so a no-go. Unless there is
> such device as "manager", this does not look like hardware description.
> 
>> +
>> +properties:
>> +  compatible:
>> +    const: qcom,pmic-virt-tcpm
>> +
>> +  connector:
>> +    type: object
>> +    $ref: /schemas/connector/usb-connector.yaml#
>> +    unevaluatedProperties: false
>> +
>> +  port:
>> +    $ref: /schemas/graph.yaml#/properties/port
>> +    description:
>> +      Contains a port which consumes data-role switching messages.
>> +
>> +  qcom,pmic-typec:
>> +    $ref: /schemas/types.yaml#/definitions/phandle
>> +    description:
>> +      A phandle to the typec port hardware driver.
>> +
>> +  qcom,pmic-pdphy:
>> +    $ref: /schemas/types.yaml#/definitions/phandle
> Having typec and phy as phandles - not children - also suggests this is
> some software construct, not hardware description.

So probably I didn't interpret Rob's comment correctly here.

For a pure software device - a virtual device - there should be no dts 
representation at all - not even at the firmware{}, chosen{}, rpm{} 
level, it wouldn't be possible/acceptable to have a tcpm {} with a 
compat pointing to the two phandles I have here ?

---
bod


