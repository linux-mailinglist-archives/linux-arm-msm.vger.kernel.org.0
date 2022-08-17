Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2B56C596922
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Aug 2022 08:10:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231963AbiHQGIG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 17 Aug 2022 02:08:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43280 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232734AbiHQGH4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 17 Aug 2022 02:07:56 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C99E06E89F
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Aug 2022 23:07:54 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id u3so17738704lfk.8
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Aug 2022 23:07:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=cBckqSCONRsG6ojOSUFr8zh1HEe6YQ5Mt2337L9ypYY=;
        b=niucvZpmG791pqKhw1t/lZMm359acxXTXL2xzhSjjDTsyFZTmfV4+mZDzzpYFv8scS
         ixyTWK+k92J4D5j+YmpVCqDr+NY51VtP0v+LjR+Gm5T+JBba/8lOOuJ7EwM2cFJalk7x
         S+Fx3+t3dxsCFXTKa+f/g4FCK+LDSf7qxd+/dwGkhAO0zNfwr6mBarXc06P0HG7o7bRY
         N8jxJTD88WJHmMIkkfEMs/tbe3EQHMlFqW5nZQbwzqNoVke5GtHsi0e+zoDLG+vrhfxU
         w3cwCqJZ3mLw/5lVNpbSm/xBfPU5G/p8XuFDcEWHOI8GDYT2xoVFU5J8Tc1BzUE2zmrt
         DWsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=cBckqSCONRsG6ojOSUFr8zh1HEe6YQ5Mt2337L9ypYY=;
        b=2c2XdeucJVFUiwHyAHEyhTOeNReBCM7Y+XoWvq9WV47PkLFC7v0Y0mhHyBZgRSo17h
         Nq0kHgL13zoKgIp2m0y+zRGVYrVBVh1hJJO7iKglKosKGCYDCJC9O/4YAr2kfDofWSkE
         oyRAjxGN7ejfAwmwlWMO+wd7ttcr6enZywE/ctBsFvotmyimDog20X62pHHSHNgtLmfZ
         GBxzlgbRLb4YQHqVCg6gIo949axdVWeRwjjfvJHSEycZKCGfmHyJj0sMP2Ei1ixiR7zX
         ydj2Y9TrueHlhULfSpOIeUNcaonv8VpzhDHVRTljBDBIimoX/RFL8T5wAnKBQeesfWqI
         xQ3Q==
X-Gm-Message-State: ACgBeo111iSFyQjfsRcz+/gpN8Fya0sUv2CExDXK9UNt2Q6H/b2q7OdX
        6v46AdJ6htjwrycBPHyAJpAcaw==
X-Google-Smtp-Source: AA6agR6KESJcB9j8Xo5Pbdk+aTm+XSK5gYKzCnvIL0gJoidOpX5DfVH6s7KSGK89xAlnIh3JQ2d3+A==
X-Received: by 2002:a05:6512:3f29:b0:48a:5ede:9aef with SMTP id y41-20020a0565123f2900b0048a5ede9aefmr7766323lfa.688.1660716473201;
        Tue, 16 Aug 2022 23:07:53 -0700 (PDT)
Received: from ?IPV6:2001:14bb:ae:539c:1b1c:14b7:109b:ed76? (d15l54h48cw7vbh-qr4-4.rev.dnainternet.fi. [2001:14bb:ae:539c:1b1c:14b7:109b:ed76])
        by smtp.gmail.com with ESMTPSA id z12-20020a056512370c00b0048b08e25979sm1574664lfr.199.2022.08.16.23.07.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Aug 2022 23:07:52 -0700 (PDT)
Message-ID: <fd4c3b16-6794-47dc-87df-bce8682d076c@linaro.org>
Date:   Wed, 17 Aug 2022 09:07:51 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v2 1/2] dt-bindings: pinctrl: qcom: Add sm8450 lpass lpi
 pinctrl bindings
Content-Language: en-US
To:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        agross@kernel.org, bjorn.andersson@linaro.org,
        linus.walleij@linaro.org
Cc:     konrad.dybcio@somainline.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20220816180157.6711-1-srinivas.kandagatla@linaro.org>
 <20220816180157.6711-2-srinivas.kandagatla@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220816180157.6711-2-srinivas.kandagatla@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 16/08/2022 21:01, Srinivas Kandagatla wrote:
> Add device tree binding Documentation details for Qualcomm SM8450
> LPASS(Low Power Audio Sub System) LPI(Low Power Island) pinctrl driver.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> ---
>  .../qcom,sm8450-lpass-lpi-pinctrl.yaml        | 136 ++++++++++++++++++
>  1 file changed, 136 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,sm8450-lpass-lpi-pinctrl.yaml
> 

Thank you for your patch. There is something to discuss/improve.

> +  gpio-ranges:
> +    maxItems: 1
> +
> +#PIN CONFIGURATION NODES
> +patternProperties:
> +  '-pins$':
> +    type: object
> +    description:
> +      Pinctrl node's client devices use subnodes for desired pin configuration.
> +      Client device subnodes use below standard properties.
> +    $ref: "/schemas/pinctrl/pincfg-node.yaml"

Drop quotes.

> +
> +    properties:
> +      pins:
> +        description:
> +          List of gpio pins affected by the properties specified in this
> +          subnode.
> +        items:
> +          pattern: "^gpio([0-1]|[0-8]])$"

Similarly to your other patch SC8280XP - this looks not correct.
> +
> +      function:
> +        enum: [ swr_tx_clk, swr_tx_data, swr_rx_clk, swr_rx_data,
> +                dmic1_clk, dmic1_data, dmic2_clk, dmic2_data, dmic4_clk,
> +                dmic4_data, i2s2_clk, i2s2_ws, dmic3_clk, dmic3_data,
> +                qua_mi2s_sclk, qua_mi2s_ws, qua_mi2s_data, i2s1_clk, i2s1_ws,
> +                i2s1_data, wsa_swr_clk, wsa_swr_data, wsa2_swr_clk,
> +                wsa2_swr_data, i2s2_data, i2s4_ws, i2s4_clk, i2s4_data,
> +                slimbus_clk, i2s3_clk, i2s3_ws, i2s3_data, slimbus_data,
> +                ext_mclk1_c, ext_mclk1_b, ext_mclk1_a, ext_mclk1_d,
> +                ext_mclk1_e ]
> +
> +        description:
> +          Specify the alternative function to be configured for the specified
> +          pins.
> +
> +      drive-strength:
> +        enum: [2, 4, 6, 8, 10, 12, 14, 16]
> +        default: 2
> +        description:
> +          Selects the drive strength for the specified pins, in mA.
> +
> +      slew-rate:
> +        enum: [0, 1, 2, 3]
> +        default: 0
> +        description: |
> +          0: No adjustments
> +          1: Higher Slew rate (faster edges)
> +          2: Lower Slew rate (slower edges)
> +          3: Reserved (No adjustments)
> +
> +      bias-pull-down: true
> +
> +      bias-pull-up: true
> +
> +      bias-disable: true
> +
> +      output-high: true
> +
> +      output-low: true
> +
> +    required:
> +      - pins
> +      - function
> +
> +    additionalProperties: false
> +
> +allOf:
> +  - $ref: "pinctrl.yaml#"

Drop the quotes.

> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +  - gpio-controller
> +  - '#gpio-cells'
> +  - gpio-ranges
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/sound/qcom,q6afe.h>
> +    lpi_tlmm: pinctrl@33c0000 {

Drop label.


Best regards,
Krzysztof
