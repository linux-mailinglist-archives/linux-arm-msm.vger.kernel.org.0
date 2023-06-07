Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6D0417268C0
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Jun 2023 20:32:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229659AbjFGScB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 7 Jun 2023 14:32:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47196 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229977AbjFGScA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 7 Jun 2023 14:32:00 -0400
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 665971725
        for <linux-arm-msm@vger.kernel.org>; Wed,  7 Jun 2023 11:31:56 -0700 (PDT)
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-5149e65c244so1805133a12.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 Jun 2023 11:31:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686162715; x=1688754715;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6Z+U5ETKwaoIHltE2aiAd209awkqtpo2q3BiVL0nXYU=;
        b=iUiL+koEOtPAccW4DAkC8uKKkLCRaCKzOoFR2FJlbkVPhX0BJH52rbIBFel/wEJi5n
         OGSI2zocWFqKumJ7ZxFDcQwZbEvb1SZ5g5z7rej5gEpRa1zdfFnUHeUJyNJgrOjFuEYb
         dY4HK37AOWyeJe1foqFmjD3e7nVJDONBSqPSAa4DGTL4aMjptAT5H7lhpZRmqiFyS6hL
         PO5d1SbABORUMCK91wD4kEhJM6TDXlRJzE2w6M1mLl0l1tn9eySxCH9ao+/XJOdtIXNh
         wZJSJaIIUPnfz2l4VXkPlJcaLHQhUAtiYPYvxNcpV5DhaMklDUUV015kRbZ7AeKnJoj1
         gokw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686162715; x=1688754715;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6Z+U5ETKwaoIHltE2aiAd209awkqtpo2q3BiVL0nXYU=;
        b=apjNvOs2sChTh/hwFOVLqBAErnRbc1haEaS7Id5W9muJh5eh8ynBML2di4F+m3yWYg
         gtqienY0Mr0HCtOIqMK6hAPyxDNzByeav+EDP7Lm/376ZjZAuwXBUjzp7q1x6KeGJrwh
         0yYQ5hte6evI4FrG6RGcP2lT4RWTrsTuVrg0LpZ4/ZZRHUvmN3ZTMx+xrisVp0IEeoGd
         XMcSOBkAHIaO78Du0mHBqMe7CrNdXspqMhLftuSB+zaL1NLl6v+iemMyvcDB/IR2tjId
         PimKH4QaoCcY0XKm4Ar46BCOo496oPJ8sJa+t5HiOWYh80r5wJ4d3PwpNOzyh0vEdTsO
         cuuQ==
X-Gm-Message-State: AC+VfDwyB7DIfxS1ea82m7W8o6xh0pBkTemkMyG8vpKycKJhR8dKbLMt
        lKO2VAVv6Kx+2ROLQfdTvgkKMw==
X-Google-Smtp-Source: ACHHUZ4zm6GVGkQczlCX9ubgue5IBbrzh8OwnXMHvbBaxgCxK5FXWNJMU50WbLRcua8aEYAUxOJlKQ==
X-Received: by 2002:aa7:c7d5:0:b0:514:9df0:e3ec with SMTP id o21-20020aa7c7d5000000b005149df0e3ecmr5148935eds.0.1686162714757;
        Wed, 07 Jun 2023 11:31:54 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id h26-20020aa7de1a000000b005148f0e8568sm6450019edv.39.2023.06.07.11.31.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Jun 2023 11:31:54 -0700 (PDT)
Message-ID: <98960024-7dbc-91a3-75de-90b529637916@linaro.org>
Date:   Wed, 7 Jun 2023 20:31:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH 2/9] dt-bindings: phy: qcom,m31: Document qcom,m31 USB phy
Content-Language: en-US
To:     Varadarajan Narayanan <quic_varada@quicinc.com>, agross@kernel.org,
        andersson@kernel.org, konrad.dybcio@linaro.org, vkoul@kernel.org,
        kishon@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        gregkh@linuxfoundation.org, catalin.marinas@arm.com,
        will@kernel.org, mturquette@baylibre.com, sboyd@kernel.org,
        p.zabel@pengutronix.de, arnd@arndb.de, geert+renesas@glider.be,
        neil.armstrong@linaro.org, nfraprado@collabora.com,
        broonie@kernel.org, rafal@milecki.pl, quic_srichara@quicinc.com,
        quic_varada@quicinc.org, quic_wcheng@quicinc.com,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-clk@vger.kernel.org
References: <cover.1686126439.git.quic_varada@quicinc.com>
 <14f60578e2935c0844537eab162af3afa52ffe39.1686126439.git.quic_varada@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <14f60578e2935c0844537eab162af3afa52ffe39.1686126439.git.quic_varada@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 07/06/2023 12:56, Varadarajan Narayanan wrote:
> Document the M31 USB2 phy present in IPQ5332

Full stop.

> 
> Signed-off-by: Sricharan Ramabadhran <quic_srichara@quicinc.com>
> Signed-off-by: Varadarajan Narayanan <quic_varada@quicinc.com>
> ---
>  .../devicetree/bindings/phy/qcom,m31.yaml          | 69 ++++++++++++++++++++++
>  1 file changed, 69 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/phy/qcom,m31.yaml
> 
> diff --git a/Documentation/devicetree/bindings/phy/qcom,m31.yaml b/Documentation/devicetree/bindings/phy/qcom,m31.yaml
> new file mode 100644
> index 0000000..8ad4ba4
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/phy/qcom,m31.yaml
> @@ -0,0 +1,69 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +

Drop stray blank lines.

> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/phy/qcom,m31.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm M31 USB PHY

What is M31?

> +
> +maintainers:
> +  - Sricharan Ramabadhran <quic_srichara@quicinc.com>
> +  - Varadarajan Narayanan <quic_varada@quicinc.org>
> +
> +description:
> +  This file contains documentation for the USB M31 PHY found in Qualcomm

Drop redundant parts ("This file contains documentation for the").

> +  IPQ5018, IPQ5332 SoCs.
> +
> +properties:
> +  compatible:
> +    oneOf:

That's not oneOf.

> +      - items:

No items.

> +          - enum:
> +              - qcom,m31-usb-hsphy

I am confused what's this. If m31 is coming from some IP block provider,
then you are using wrong vendor prefix.
https://www.m31tech.com/download_file/M31_USB.pdf


> +              - qcom,ipq5332-m31-usb-hsphy

This confuses me even more. IPQ m31?

> +
> +  reg:
> +    description:
> +      Offset and length of the M31 PHY register set

Drop description, obvious.

> +    maxItems: 2
> +
> +  reg-names:
> +    items:
> +      - const: m31usb_phy_base
> +      - const: qscratch_base

Drop "_base" from both.

> +
> +  phy_type:
> +    oneOf:
> +      - items:
> +          - enum:
> +              - utmi
> +              - ulpi

This does not belong to phy, but to USB node.

> +
> +  resets:
> +    maxItems: 1
> +    description:
> +      List of phandles and reset pairs, one for each entry in reset-names.

Drop useless description.

> +
> +  reset-names:
> +    items:
> +      - const:
> +          usb2_phy_reset

Drop entire reset-names.

> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/qcom,ipq5332-gcc.h>
> +    hs_m31phy_0: hs_m31phy@5b00 {

Node names should be generic. See also explanation and list of examples
in DT specification:
https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation

Also, no underscores in node names.

> +        compatible = "qcom,m31-usb-hsphy";
> +        reg = <0x5b000 0x3000>,

This is not what your unit address is saying.

> +            <0x08af8800 0x400>;

Align it.

> +        reg-names = "m31usb_phy_base",
> +                "qscratch_base";

Align it.

> +        phy_type = "utmi";
> +        resets = <&gcc GCC_QUSB2_0_PHY_BCR>;
> +        reset-names = "usb2_phy_reset";
> +
> +        status = "ok";

Drop.

> +    };

Best regards,
Krzysztof

