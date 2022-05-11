Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DC9D2523B3E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 May 2022 19:16:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235302AbiEKRQB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 11 May 2022 13:16:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46136 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345342AbiEKRP5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 11 May 2022 13:15:57 -0400
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C9F68E63
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 May 2022 10:15:49 -0700 (PDT)
Received: by mail-ed1-x529.google.com with SMTP id t5so3302666edw.11
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 May 2022 10:15:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:from:subject:to:cc
         :references:content-language:in-reply-to:content-transfer-encoding;
        bh=2+4MntLHEZNAXBomauNodAZbp3YguNyy5lnTjqXp3Ic=;
        b=JcBroyxGn8h8fNlXpKBt42ipS1NOhTuZm1+WlKC1/4/wjOusrkG9fFG2b1NrKOGgjD
         3+c/A1g4tKA44nu30jSUdKPQWqMsaEUq0QT4KIsAATdlOeRXYObF5/D9VZLKYuwC/8Qf
         1G/sFBlZfzj5soGBelp8EO2Dc4RNtXrGpt4woU67C6HCbcHAhAkLFNrcMsUmx7rmlyGo
         3RGY+0gx1+GiEb/1QzlKbmTDGqIPnT+DT0r3cLZX49gomPOT7StVdPLDBrnnX2cm9NhH
         kLs5cBUY6LdZPsj79WXn4wQB4z8BXx+rS2MKNDBU5aRpKqzrgRy3qzoZHFnxlOGJv7KL
         OQbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:from
         :subject:to:cc:references:content-language:in-reply-to
         :content-transfer-encoding;
        bh=2+4MntLHEZNAXBomauNodAZbp3YguNyy5lnTjqXp3Ic=;
        b=GftCaVCjNLNxzGwCXou6s9A3z9SJI3I4IZwZCOd5deNBkdfhNq+OfX17t5b53Sr2Yg
         FdLAVpFwWNBnypjMQAeGZzzeorYlta1qflg4y6K5+vdob2BV7FKtKEheYn6GVyRBHYgr
         mRsicToQa285pDtuGZ+yyjuLYNHBReH7neRIre6KvpdMsc58oRfURr6YrqV/kuCH7OlS
         X7f9nUfC6aEvikC6/YDOVutTsAlEQRVu1ZDwnog9XV7AHPMgxynVZSCqd3THZvZIedDT
         4pzLU6hS0CqVhzjcrGO6b3x3h6ArYmfLpRmn58R3psqN3WfztG5452vxb0k7u2GNgX08
         elYA==
X-Gm-Message-State: AOAM5311lCYEPdTw9fb4tdzPD8hoA2tsI0yiPt9b/MZjAyU4Zl/MWvmS
        fapiJaT8fyHqMrr4owwHwlG4Dw==
X-Google-Smtp-Source: ABdhPJy+l6Pw2ksp3ZDG3sf8ODxLy1zEongSmEXpjKq9Ts2M24KN/KaNbBfI/Scm7nQ4bUDirR4TPQ==
X-Received: by 2002:a05:6402:190a:b0:427:efb7:bd81 with SMTP id e10-20020a056402190a00b00427efb7bd81mr30108532edz.63.1652289348324;
        Wed, 11 May 2022 10:15:48 -0700 (PDT)
Received: from [192.168.0.155] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id b5-20020a056402138500b0042a2d9af0f8sm311978edv.79.2022.05.11.10.15.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 May 2022 10:15:47 -0700 (PDT)
Message-ID: <00234f36-9bae-31d5-5b83-ea238e7e3c11@linaro.org>
Date:   Wed, 11 May 2022 19:15:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH 4/9] dt-bindings: remoteproc: qcom: wcnss: Convert to YAML
To:     Sireesh Kodali <sireeshkodali1@gmail.com>,
        linux-remoteproc@vger.kernel.org
Cc:     linux-arm-msm@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, bjorn.andersson@linaro.org,
        devicetree@vger.kernel.org, phone-devel@vger.kernel.org,
        linux-kernel@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20220511161602.117772-1-sireeshkodali1@gmail.com>
 <20220511161602.117772-5-sireeshkodali1@gmail.com>
Content-Language: en-US
In-Reply-To: <20220511161602.117772-5-sireeshkodali1@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 11/05/2022 18:15, Sireesh Kodali wrote:
> Convert the dt-bindings from txt to YAML. This is in preparation for
> including the relevant bindings for the MSM8953 platform's wcnss pil.
> 
> Signed-off-by: Sireesh Kodali <sireeshkodali1@gmail.com>

Thank you for your patch. There is something to discuss/improve.

Please use existing bindings or example-schema as a starting point. Half
of my review could be skipped if you just followed what we already have
in the tree.

Some of these qcom specific properties already exist but you decided to
write them differently... please don't, rather reuse the code.

(...)

> +
> +maintainers:
> +  - Bjorn Andersson <bjorn.andersson@linaro.org>
> +
> +description:
> +  This document defines the binding for a component that loads and boots
> +  firmware on the Qualcomm WCNSS core.
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - items:
> +          - enum:
> +              - qcom,pronto-v2-pil
> +          - enum:
> +              - qcom,pronto

This does not look correct. The fallback compatible should not change.
What is more, it was not documented in original binding, so this should
be done in separate patch.

> +      - items:

No need for items, it's just one item.

> +          - enum:
> +              - qcom,riva-pil
> +              - qcom,pronto-v1-pil
> +              - qcom,pronto-v2-pil
> +
> +  reg:
> +    description: must specify the base address and size of the CCU, DXE and PMU
> +      register blocks

New line after "decription:", drop "must specify" and start with capital
letter.

You need maxItems: 3


> +
> +  reg-names:
> +    items:
> +      - const: ccu
> +      - const: dxe
> +      - const: pmu
> +
> +  interrupts-extended:
> +    description:
> +      Interrupt lines

Skip description, it's obvious.

It should be only "interrupts", not extended.

> +    minItems: 2
> +    maxItems: 5
> +
> +  interrupt-names:
> +    minItems: 2
> +    maxItems: 5

Names should be clearly defined. They were BTW defined in original
bindings, so you should not remove them. This makes me wonder what else
did you remove from original bindings...

Please document all deviations from pure conversion in the commit msg.
It's a second "hidden" difference.

> +
> +  firmware-name:
> +    $ref: /schemas/types.yaml#/definitions/string
> +    description: Relative firmware image path for the WCNSS core. Defaults to
> +      "wcnss.mdt".


Blank line after "description:". This applies to other places as well.

Remove "Defailts to ..." and just add "default" schema.

> +
> +  vddpx-supply:
> +    description: Reference to the PX regulator to be held on behalf of the
> +      booting of the WCNSS core
> +
> +  vddmx-supply:
> +    description: Reference to the MX regulator to be held on behalf of the
> +      booting of the WCNSS core.
> +
> +  vddcx-supply:
> +    description: Reference to the CX regulator to be held on behalf of the
> +      booting of the WCNSS core.

s/Reference to the//

> +
> +  power-domains:
> +    $ref: /schemas/types.yaml#/definitions/phandle-array
> +    description: References to the power domains that need to be held on
> +      behalf of the booting WCNSS core

1. Ditto.
2. No need for ref
3. maxItems

> +
> +  power-domain-names:
> +    $ref: /schemas/types.yaml#/definitions/string-array

No need for ref, skip description.

> +    description: Names of the power domains
> +    items:
> +      - const: cx
> +      - const: mx
> +
> +  qcom,smem-states:
> +    $ref: /schemas/types.yaml#/definitions/phandle-array
> +    description: States used by the AP to signal the WCNSS core that it should
> +      shutdown
> +    items:
> +      - description: Stop the modem
> +
> +  qcom,smem-state-names:
> +    $ref: /schemas/types.yaml#/definitions/string-array

No need for ref. Really, it does not appear in any of existing bindings
for smem-state-names, so how did you get it?

> +    description: The names of the state bits used for SMP2P output
> +    items:
> +      - const: stop
> +
> +  memory-region:
> +    maxItems: 1
> +    description: Reference to the reserved-memory for the WCNSS core
> +
> +  smd-edge:
> +    type: object
> +    description:
> +      Qualcomm Shared Memory subnode which represents communication edge,
> +      channels and devices related to the ADSP.

You should reference /schemas/soc/qcom/qcom,smd.yaml

> +
> +  iris:

Generic node name... what is "iris"?

> +    type: object
> +    description:
> +      The iris subnode of the WCNSS PIL is used to describe the attached rf module

s/rf/RF/

> +      and its resource dependencies.
> +
> +    properties:
> +      compatible:
> +        enum:
> +          - qcom,wcn3620
> +          - qcom,wcn3660
> +          - qcom,wcn3660b
> +          - qcom,wcn3680
> +
> +      clocks:
> +        description: XO clock
> +
> +      clock-names:
> +        items:
> +          - const: xo
> +
> +    required:
> +      - compatible

clocks and clock-names were required.
Missing supplies, which were btw as well required.

> +
> +required:
> +  - compatible
> +  - reg
> +  - reg-names
> +  - interrupts-extended
> +  - interrupt-names
> +  - vddpx-supply
> +  - memory-region
> +  - smd-edge
> +  - iris
> +
> +additionalProperties: false
> +
> +if:

Within allOf, please.



Best regards,
Krzysztof
