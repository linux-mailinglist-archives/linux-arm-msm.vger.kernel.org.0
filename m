Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 37D8F73DBAE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Jun 2023 11:46:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229599AbjFZJq1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 26 Jun 2023 05:46:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45728 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229578AbjFZJqX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 26 Jun 2023 05:46:23 -0400
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 32521AC
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jun 2023 02:46:21 -0700 (PDT)
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-9875c2d949eso470587366b.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jun 2023 02:46:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687772779; x=1690364779;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SMnLmOpmrSE5F08UJ/SfvrDV4QtqST5F7dDlxqw9wv4=;
        b=sJACjTqG7lutGMp1004sWrKu1268gr46IVocwXn13ue5x+zdoM9Y1cTgkifY3qNcM3
         rivbDtSWbrHyZ+4Eg5qTb813q61Tn3cC0wpH5hXHZ5B1HKCOMo4+mySnNaVIF+Iqnhub
         pZvdTot0iFbu04cGi92j38T2hCcGbWDz42wTIhTQirmf6pmC4ezcD2/ABKitlcBeBr4U
         OMfig29lcU1Z5SaiaHXwjPja+oRS5H6nqBAeHGQPBchU+TZr19ZRt0sVwuXC6MWap+KL
         kIpSobFEI4qkqqm9ZMENSoU/VewZxWxwl4MEdQ4/cuneRLBXxZ+lliWaRtTx2siGKA+a
         iBmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687772779; x=1690364779;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SMnLmOpmrSE5F08UJ/SfvrDV4QtqST5F7dDlxqw9wv4=;
        b=Yc+sXf7ZSJ2scznnkmQ1LvlgJ0KGNBNVThxo8ApNAWZn/oiZP0Pf7B1hTR+BorsGpt
         pptD0OECgq4ZLUvpFfoW0NLzAbjeUcFdjIlCy2afItrw9azkBNaVgwOhtGP1HvQlJpMv
         o/hHt9KOfHQ3wyrq8whQRhHhk7Sn/TOqSpabJV6xbmwcu6SmDFFC2s71GXMhbplJmjg2
         B3kciL+qm381LNC5hMT2n8KuHlXUXWiWldBKlOaF1v4clUaM5KzFG9aRK7CiyuBScMQm
         BJnMzPkSFXy8KyPM8WWaAQKFysTqHKpZVmtXfNk83PDGFeZ2EInFDxJ/bYYtO4V/f/5R
         jz6A==
X-Gm-Message-State: AC+VfDz45kneO0C37LLdxQ5sG9toJme8GK1KlkyVG+3zoay7gmimNvUj
        6EBrIIP3jaJ/DpVe6VWU3V0Vdw==
X-Google-Smtp-Source: ACHHUZ5HPbJS7X/OhQOXkAV3fGbDCEFLFypvMnEC8A56a8+EnI9NaaQW0DQH4X7qGVygcHI9ikC4yw==
X-Received: by 2002:a17:907:1c8b:b0:988:a876:53ca with SMTP id nb11-20020a1709071c8b00b00988a87653camr23447006ejc.65.1687772779660;
        Mon, 26 Jun 2023 02:46:19 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id lr9-20020a170906fb8900b00969f44bbef3sm3122536ejb.11.2023.06.26.02.46.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Jun 2023 02:46:19 -0700 (PDT)
Message-ID: <9f9afa24-ecfc-2fb2-3d47-80c250fcb8fe@linaro.org>
Date:   Mon, 26 Jun 2023 11:46:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v4 1/6] dt-bindings: nvmem: sec-qfprom: Add bindings for
 secure qfprom
Content-Language: en-US
To:     Komal Bajaj <quic_kbajaj@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20230623141806.13388-1-quic_kbajaj@quicinc.com>
 <20230623141806.13388-2-quic_kbajaj@quicinc.com>
 <cea67754-6bc0-f8ee-3cba-8713b10b0c69@linaro.org>
 <d9cde55b-fc96-b024-8048-1de1fa1bd89e@quicinc.com>
 <d0b6f2c9-8e85-a38b-e2b1-14f197ca1ea0@linaro.org>
 <c8909dcb-143c-c2d7-513d-625e9ce00c0c@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <c8909dcb-143c-c2d7-513d-625e9ce00c0c@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 26/06/2023 11:02, Komal Bajaj wrote:
> 
> 
> On 6/26/2023 2:00 PM, Krzysztof Kozlowski wrote:
>> On 26/06/2023 10:22, Komal Bajaj wrote:
>>>>> +
>>>>> +allOf:
>>>>> +  - $ref: nvmem.yaml#
>>>>> +
>>>>> +properties:
>>>>> +  compatible:
>>>>> +    items:
>>>>> +      - enum:
>>>>> +          - qcom,qdu1000-sec-qfprom
>>>>> +      - const: qcom,sec-qfprom
>>>>> +
>>>>> +  reg:
>>>>> +    items:
>>>>> +      - description: The secure qfprom corrected region.
>>>>> +
>>>>> +  # Needed if any child nodes are present.
>>>>> +  "#address-cells":
>>>>> +    const: 1
>>>>> +  "#size-cells":
>>>>> +    const: 1
>>>> Drop both, they are not needed.
>>> I didn't get it. Can you please explain why these are not needed as this
>>> node will have child nodes which will use single value for address and size.
>> I suspect they are already defined. Do other bindings (for cases with
>> children) have them? If not, why here it would be different?
> 
> Yes, I see there are bindings that has these properties, listed a few of 
> them below -
> 
> [1] 
> https://github.com/torvalds/linux/blob/master/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml

Please work on current development. It's a bit of waste of time to
review old code...

https://lore.kernel.org/all/20230611140330.154222-16-srinivas.kandagatla@linaro.org/

> [2] 
> https://github.com/torvalds/linux/blob/master/Documentation/devicetree/bindings/firmware/arm,scmi.yaml

That's not a nvmem provider.

> [3] 
> https://github.com/torvalds/linux/blob/master/Documentation/devicetree/bindings/timer/arm,arch_timer_mmio.yaml

That's not a nvmem provider.


Best regards,
Krzysztof

