Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 590845EE349
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Sep 2022 19:38:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234635AbiI1Rig (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 28 Sep 2022 13:38:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39450 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234624AbiI1Rif (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 28 Sep 2022 13:38:35 -0400
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DB32DF3909
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Sep 2022 10:38:33 -0700 (PDT)
Received: by mail-lj1-x22a.google.com with SMTP id p5so15117041ljc.13
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Sep 2022 10:38:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=WJrEm7Gj+RhCZrHxWWorpZ5+layPSsIO3kU2CBr8RUk=;
        b=kRrYubDuvhSHWTCTehEWYzr77FQ7wdJ7osLeHoj+8yRP5S8AtQgL9fXNusXJuLcBVx
         3wi7k1LomwlCl4Xo9UMqDEY23MH8rUzwewo/t6rAV+V+T5JIhNDwXGj/hY7xzWOPzSx1
         +juhKcmddu2oEngNSUlYkAIlBQ32DrPabMnqnbEx+2LnKLiJ8YZ/L8FAIugigEHRVGGF
         gAX7AU0ohWUK02FzN2bXkwqrQNmYREvhlBG461Tal2E798fAjbE0iPdkocyljZKcrrJg
         cNys14SXZVlpRDlfLgkjsp1U0QhwsQsEX+m3qDEFxsq7BR/8ZI9sbmdf/GMtTir39dYA
         d8aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=WJrEm7Gj+RhCZrHxWWorpZ5+layPSsIO3kU2CBr8RUk=;
        b=JEbpFAcFxJ+B0fk6emKHt+ESiUSCbmTOvdpYrnQYLX/P4h+7scy8YZZ4a1sCJ1YIGt
         ff4qojVNrseNoiX0iUi2J0dnwJHsbq5FOIh0nD2FZhXdfXG4HioMV+efPh0o1S1ZW4nY
         Hx1Onh8h+le/kd+HwpaB7pG4SW4WlZf6kiJU1KmGbJo/RleOq5KhQwkXIFkbFEhW+o/D
         AOKSESp2vSGx+D5o0Bo516b7P1pyZvkrJWo6Qi2w4u16LrsI+Rv48kv5vgv6E0Sxf+ri
         szT/6n9pjWNvuzoqPU1kGG+j8HleRyP01G0Tk5Z8y+mr9cyWOgQC25dS3DZG9LBmTrgp
         +JIA==
X-Gm-Message-State: ACrzQf3p93CJXkZ9c9VEkqsOFkt9+G572ZjNxNgvg3usvP9UL3hVinxd
        2pXHFNz3WgBnp3kEVHaT0+Xv3A==
X-Google-Smtp-Source: AMsMyM6B8xC1DZl6OlVbrJI9+S2jVaPRXzvyUtj6TyE2ZIHu8rbXrB11fu2rr8BEymohlF0MeAXLrg==
X-Received: by 2002:a2e:9c2:0:b0:26a:cbe5:21ae with SMTP id 185-20020a2e09c2000000b0026acbe521aemr12589964ljj.354.1664386712146;
        Wed, 28 Sep 2022 10:38:32 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id 16-20020ac24d50000000b0049908e21e26sm527051lfp.253.2022.09.28.10.38.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Sep 2022 10:38:30 -0700 (PDT)
Message-ID: <7c65e6f6-54f8-3582-0409-c800e16b8fcb@linaro.org>
Date:   Wed, 28 Sep 2022 19:38:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH] dt-bindings: clock: split qcom,gcc-sdm660 to the separate
 file
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20220928145818.376250-1-dmitry.baryshkov@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220928145818.376250-1-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 28/09/2022 16:58, Dmitry Baryshkov wrote:
> Move schema for the GCC on SDM630/SDM636/SDM660 to a separate file to be
> able to define device-specific clock properties.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  .../bindings/clock/qcom,gcc-other.yaml        |  3 -
>  .../bindings/clock/qcom,gcc-sdm660.yaml       | 61 +++++++++++++++++++
>  2 files changed, 61 insertions(+), 3 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/clock/qcom,gcc-sdm660.yaml
> 
> diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-other.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc-other.yaml
> index 76988e04c7db..35fc22a19000 100644
> --- a/Documentation/devicetree/bindings/clock/qcom,gcc-other.yaml
> +++ b/Documentation/devicetree/bindings/clock/qcom,gcc-other.yaml
> @@ -24,7 +24,6 @@ description: |
>    - dt-bindings/clock/qcom,gcc-mdm9607.h
>    - dt-bindings/clock/qcom,gcc-mdm9615.h
>    - dt-bindings/reset/qcom,gcc-mdm9615.h
> -  - dt-bindings/clock/qcom,gcc-sdm660.h  (qcom,gcc-sdm630 and qcom,gcc-sdm660)
>  
>  allOf:
>    - $ref: "qcom,gcc.yaml#"
> @@ -41,8 +40,6 @@ properties:
>        - qcom,gcc-msm8974pro
>        - qcom,gcc-msm8974pro-ac
>        - qcom,gcc-mdm9615
> -      - qcom,gcc-sdm630
> -      - qcom,gcc-sdm660
>  
>  required:
>    - compatible
> diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-sdm660.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc-sdm660.yaml
> new file mode 100644
> index 000000000000..a39f28d37387
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/qcom,gcc-sdm660.yaml
> @@ -0,0 +1,61 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/qcom,gcc-sdm660.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm Global Clock & Reset Controller Binding for SDM660/SDM630/SDM636
> +
> +maintainers:
> +  - Stephen Boyd <sboyd@kernel.org>
> +  - Taniya Das <tdas@codeaurora.org>

I guess email is not valid anymore.

> +
> +description: |
> +  Qualcomm global clock control module which supports the clocks, resets and
> +  power domains on SDM630, SDM636 and SDM660
> +
> +  See also:
> +  - dt-bindings/clock/qcom,gcc-sdm660.h  (qcom,gcc-sdm630 and qcom,gcc-sdm660)
> +
> +$ref: qcom,gcc.yaml#
> +
> +properties:
> +  compatible:
> +    enum:
> +      - qcom,gcc-sdm630
> +      - qcom,gcc-sdm660
> +
> +  clocks:
> +    items:
> +      - description: XO source
> +      - description: Sleep clock source
> +
> +  clock-names:
> +    items:
> +      - const: xo
> +      - const: sleep_clk
> +
> +  power-domains:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  # Example for GCC for SDM660:
> +  - |
> +    #include <dt-bindings/clock/qcom,rpmh.h>
> +    clock-controller@100000 {
> +        compatible = "qcom,gcc-sdm660";
> +        #clock-cells = <1>;
> +        #reset-cells = <1>;
> +        #power-domain-cells = <1>;
> +        reg = <0x00100000 0x94000>;

reg after compatible?

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof

