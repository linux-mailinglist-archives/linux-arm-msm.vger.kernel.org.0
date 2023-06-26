Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B879573D9C2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Jun 2023 10:31:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230026AbjFZIbE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 26 Jun 2023 04:31:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34578 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230113AbjFZIbB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 26 Jun 2023 04:31:01 -0400
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 86F71E7C
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jun 2023 01:30:56 -0700 (PDT)
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-9891c73e0fbso553305266b.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jun 2023 01:30:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687768255; x=1690360255;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Z6Q9XtGAe9pmT920uAOyU/UADbYVSu2ITB2+DxW4Lk8=;
        b=SWpuU3MrBWg1VaE3Fr8Z0YRmYMhGlk9J9qdttbWilg6IB5RjkTOJY2u06kCQ+bfGe8
         DJSrlakWQeo/fHUSy9zX1JzfROWovG39LUHZiipNakCc6n5StFwZ89CVCy7dco4J0A8h
         3k3XoTfj1+97Mo9fZIufMJ7RUsLcT6SfWWGZVPNT6SuyAKuA2jZjScOcmZ6cXlJnguW3
         oa7RFipoKK5qHVyYnpSgYjJe6wVuNVwHvDkBK3oGvlrH5462wxf9FDmphYzZhKTcSRvk
         f7PoQpx3vPxp0DyWOVRaMGtM7SLmVuYOv7lDa7Ceb7/gkoXGCgxc97Q1/HoZMUztv9dI
         mZhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687768255; x=1690360255;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Z6Q9XtGAe9pmT920uAOyU/UADbYVSu2ITB2+DxW4Lk8=;
        b=Y7Wr3X6CPXA0eVVryvIDJEf2A9NvhLQAOcnsgvWTXzN9YFCgTymN9v3XZlWp7fTT8D
         7DB0nqU1niwEOM5x9fCLMzA0nWbVPvp7DNjXNaQqMhnvXWTRmmQ5zwTDmwV8kjobzUuA
         l+rZNbuKpML8D//8uCCC/P1VRRNH3ijJizrWFHKh1dY6Dmndzt/KMxvQW3Ob8aIeQHVN
         rbd/p3HIZIn3QjfoH7HdDoLXrRr9V2COCROoBvOXuIw8inwt9CI6eD4x1J/UJC2IjWcu
         pbrdb4jUN25KKDMV2kQTy0qctNPs+JfgYNtc8i9MRT33NJTdXxrbsDLHjBwD+60WYV+J
         d/jA==
X-Gm-Message-State: AC+VfDxDvkTwxMsuFyB1OT+3f/iKhOKshWVn8hOVhoXrTK2rM3PXXZbd
        xGDP2gvk1KCHv7Dog1C/RaeKIQ==
X-Google-Smtp-Source: ACHHUZ7nn/1Fi/+3MWyVpG6zaAZrJEd0canSK2GOthmprJI4z4sBP6lCZi7wDvbASjZjDl/i30AO9Q==
X-Received: by 2002:a17:907:7ba5:b0:982:4b35:c0b6 with SMTP id ne37-20020a1709077ba500b009824b35c0b6mr27532143ejc.1.1687768254853;
        Mon, 26 Jun 2023 01:30:54 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id r1-20020a1709064d0100b0098e0d1c1096sm2397810eju.136.2023.06.26.01.30.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Jun 2023 01:30:54 -0700 (PDT)
Message-ID: <d0b6f2c9-8e85-a38b-e2b1-14f197ca1ea0@linaro.org>
Date:   Mon, 26 Jun 2023 10:30:52 +0200
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
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <d9cde55b-fc96-b024-8048-1de1fa1bd89e@quicinc.com>
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

On 26/06/2023 10:22, Komal Bajaj wrote:
>>
>>> +
>>> +allOf:
>>> +  - $ref: nvmem.yaml#
>>> +
>>> +properties:
>>> +  compatible:
>>> +    items:
>>> +      - enum:
>>> +          - qcom,qdu1000-sec-qfprom
>>> +      - const: qcom,sec-qfprom
>>> +
>>> +  reg:
>>> +    items:
>>> +      - description: The secure qfprom corrected region.
>>> +
>>> +  # Needed if any child nodes are present.
>>> +  "#address-cells":
>>> +    const: 1
>>> +  "#size-cells":
>>> +    const: 1
>> Drop both, they are not needed.
> 
> I didn't get it. Can you please explain why these are not needed as this
> node will have child nodes which will use single value for address and size.

I suspect they are already defined. Do other bindings (for cases with
children) have them? If not, why here it would be different?


Best regards,
Krzysztof

