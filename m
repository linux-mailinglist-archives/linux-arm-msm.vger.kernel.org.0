Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9B3216C029A
	for <lists+linux-arm-msm@lfdr.de>; Sun, 19 Mar 2023 16:10:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230329AbjCSPKP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 19 Mar 2023 11:10:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45400 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230123AbjCSPKN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 19 Mar 2023 11:10:13 -0400
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6678A1CAFF
        for <linux-arm-msm@vger.kernel.org>; Sun, 19 Mar 2023 08:10:12 -0700 (PDT)
Received: by mail-ed1-x52f.google.com with SMTP id cy23so37656532edb.12
        for <linux-arm-msm@vger.kernel.org>; Sun, 19 Mar 2023 08:10:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679238611;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3ZI8mVM/FkOy3dP9E6gVdHN8NK1dgUVp75Y1XHclun0=;
        b=a+5qnvrRAF++ofJgOjqiazCAc2Aphl4pWP29eztVnElmenfUXxCvyCnvx3xbPpYOz1
         wHn7YFh4UxeFkt3ntNfiQTD5uzQC2OKQ+aWVwGPUyCgD1dpY2U+M8ijr/CmZ/qwwEUS1
         1D68pi8t9IIPIdM9I9zpKdm2gDoku1fsyXJQZ15Io/aaiqNPzQgyYD75gaRq32hugfWx
         COaFAbKHEXsVQwXPZgYLCfoGt39aN+ccmzE0V8YfXs+4iGg99tuqFdfWqgjffybNLsfA
         DbSfHiQRQ15UyXvPk+ACOWjvofm6RLm4a+cLgmdUJmAwJzqeS6km0SBHgdj9VIRgG/DD
         JfWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679238611;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3ZI8mVM/FkOy3dP9E6gVdHN8NK1dgUVp75Y1XHclun0=;
        b=QPcdflrvmdx+Q94OGlaCSgk73Anip6zfrV2VjiagpHfBqxDpyVkAU66kSwY7XF5/u6
         554Cxbg7VdJaUl5d2zHYq1oOSLDR2lAikkfekvc1M+HHljxXAAoYTg4udA+gC5ATBZ6M
         xggSmNSjaqfQOUjd42uaKBIerZ4BBsUVoTJY/kGftiLffM2/UmeBBCDOtnjbrWdf3EC5
         KGYliS1OiJwFG7CnWti8TFOlWMXPNk1+BBpVcmwzZRjpmO4eWEgufw7qU8Mtsgs0aDOe
         l0XVgTqqMDYv6olSc0/aco2eGEh/fd3WNxIhjNrkGhldsSMhFwV4Upx32i9hhLdyxDjv
         J8ig==
X-Gm-Message-State: AO0yUKU+iEe/Qquz1TXwi1pUn9Bq+fwYgIfz/ZBRMMoeQ27RfK9kDV6B
        fEk6nJnpOERbrqhkG3akQNDGBw==
X-Google-Smtp-Source: AK7set/iFJN/sd+wLxxg91YOKrDm9aeHyWuj5wHArbE5ZuWMQvm1f5sK26iU7VJUzI6JAck3oC714g==
X-Received: by 2002:a05:6402:12c3:b0:4fd:2346:7225 with SMTP id k3-20020a05640212c300b004fd23467225mr10565715edx.34.1679238610881;
        Sun, 19 Mar 2023 08:10:10 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:5b5f:f22b:a0b:559d? ([2a02:810d:15c0:828:5b5f:f22b:a0b:559d])
        by smtp.gmail.com with ESMTPSA id r29-20020a50d69d000000b004c2158e87e6sm3575849edi.97.2023.03.19.08.10.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 19 Mar 2023 08:10:10 -0700 (PDT)
Message-ID: <346ecd20-d64f-1d47-4860-861e142f9700@linaro.org>
Date:   Sun, 19 Mar 2023 16:10:09 +0100
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
Content-Language: en-US
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <a4da1f8f-333e-9ded-d784-7f86c45c7156@linaro.org>
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

On 19/03/2023 15:59, Bryan O'Donoghue wrote:
> On 19/03/2023 11:58, Krzysztof Kozlowski wrote:
>>> +
>>> +maintainers:
>>> +  - Bryan O'Donoghue<bryan.odonoghue@linaro.org>
>>> +
>>> +description: |
>>> +  Qualcomm PMIC Virtual Type-C Port Manager Driver
>>> +  A virtual device which manages Qualcomm PMIC provided Type-C port and
>>> +  Power Delivery in one place.
>> OK, so it looks like bindings for driver, so a no-go. Unless there is
>> such device as "manager", this does not look like hardware description.
>>
>>> +
>>> +properties:
>>> +  compatible:
>>> +    const: qcom,pmic-virt-tcpm
>>> +
>>> +  connector:
>>> +    type: object
>>> +    $ref: /schemas/connector/usb-connector.yaml#
>>> +    unevaluatedProperties: false
>>> +
>>> +  port:
>>> +    $ref: /schemas/graph.yaml#/properties/port
>>> +    description:
>>> +      Contains a port which consumes data-role switching messages.
>>> +
>>> +  qcom,pmic-typec:
>>> +    $ref: /schemas/types.yaml#/definitions/phandle
>>> +    description:
>>> +      A phandle to the typec port hardware driver.
>>> +
>>> +  qcom,pmic-pdphy:
>>> +    $ref: /schemas/types.yaml#/definitions/phandle
>> Having typec and phy as phandles - not children - also suggests this is
>> some software construct, not hardware description.
> 
> So probably I didn't interpret Rob's comment correctly here.

He proposed to merge it with other node:
"probably merged with
one of the nodes these phandles point to."

"Why can't most of this binding be part of"

I don't see how you implemented his comments. Actually, nothing improved
here in this regard - you still have these phandles.

> 
> For a pure software device - a virtual device - there should be no dts 
> representation at all - not even at the firmware{}, chosen{}, rpm{} 

By software we interpret here HLOS, so Linux. Firmware is FW, thus not
software in that context. rpm{} is some firmware on some processor.

You wrote here bindings/nodes for a Linux driver.

> level, it wouldn't be possible/acceptable to have a tcpm {} with a 
> compat pointing to the two phandles I have here ?

What is tcpm? Linux driver? Then not. You cannot have device nodes for a
Linux driver.

Best regards,
Krzysztof

