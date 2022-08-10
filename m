Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 596FB58ED6C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Aug 2022 15:35:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232276AbiHJNft (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 10 Aug 2022 09:35:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46140 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232868AbiHJNfo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 10 Aug 2022 09:35:44 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E9D1149B75
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Aug 2022 06:35:42 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id c17so21282743lfb.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Aug 2022 06:35:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=Z4Hyw0PpOR6PyJk1gjcDRkxS9uvIdkaJI9TxqqUTdNM=;
        b=EmHL0gXeZg/tY6cp1ad7Qz+P8jaNZEWRdP5kE08nJz1GpMYMky8aEjpvMR2NOA6TV+
         tAJrgmqDIh9mJkW4ydro1SX9eou5VZ0vfiDDk+5XAkItgg1s1uKFyDYC5v8wvV+FQhD7
         vzCUY/Yp1exv0xf0lqZ27CH2tq2U0L8csiDixD0Y/EeyxwPvtamzX0RgW5n0ymDHfAvf
         eeeraHS+3Z0Ze60G0chUDGXCkDzMiqgE5GFn/yCZuzjMC0603pDPchDW8RPMZTxy9l0e
         7zo3OCIzFsX0ScKhl7AsOAjRz9P0Yuouw0UeWrLOFH8wT7KlqmnXe+96q6d7Ci8YOH7w
         83Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=Z4Hyw0PpOR6PyJk1gjcDRkxS9uvIdkaJI9TxqqUTdNM=;
        b=5g1FhV/ZP70IlddMNSHc7OCuOGUdVoingPoW3V5PTotPI2Rttn3qKTd0j8sC86O8UY
         W5Q/lz4j2Fv+RZw0n+dofQ6h6b6h9RleHmUZL63GobRATiou4nT7K92xEN8cTszvBW0L
         iQ28UAXXRQR/hS1Bm6fbFCSd5+4X41z1dftC954+3A4+8WxWsvNEHrv9Qgi++1IAbLIR
         dIj7rI3YF83KUjRy2Z8BuokLhc6Zx+IIbiHK6PZ2KB26C9nYk3X8Bpe5pPQhzn0VU/5Y
         eLV2fcuLsxIlL/oCYOzhqHzeUWSeGqrYqMAMnXiFJOb2uUi16NEziKgGS3/knKL1Mh1G
         /Hjw==
X-Gm-Message-State: ACgBeo0UE0dihmk2y6Etlfm3EVa+EMa8NwtoAqDQU2K8sGK7hsIPnYgh
        iZoHNsybSIJRSN5sNmlYoTQ+Jw==
X-Google-Smtp-Source: AA6agR7Xb+gSzY7JGPzXu79FTugxe0V6vHQvgxEbfahRo/DjkhgUTsq3isQGyHRtuh9QfpWxIdkYig==
X-Received: by 2002:a05:6512:31c5:b0:48b:38cf:51f8 with SMTP id j5-20020a05651231c500b0048b38cf51f8mr9876793lfe.315.1660138541295;
        Wed, 10 Aug 2022 06:35:41 -0700 (PDT)
Received: from [192.168.1.39] ([83.146.140.105])
        by smtp.gmail.com with ESMTPSA id a4-20020a056512390400b0048a9356cd63sm353115lfu.11.2022.08.10.06.35.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Aug 2022 06:35:40 -0700 (PDT)
Message-ID: <ceb74aee-6436-f1f6-2408-fd01475cb234@linaro.org>
Date:   Wed, 10 Aug 2022 16:35:39 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 1/2] dt-bindings: power: supply: Add Lenovo Yoga C630 EC
Content-Language: en-US
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Sebastian Reichel <sre@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20220810030500.2793882-1-bjorn.andersson@linaro.org>
 <20220810030500.2793882-2-bjorn.andersson@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220810030500.2793882-2-bjorn.andersson@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 10/08/2022 06:04, Bjorn Andersson wrote:
> Add binding for the Embedded Controller found in the Qualcomm
> Snapdragon-based Lenovo Yoga C630.

Thank you for your patch. There is something to discuss/improve.

> +
> +description:
> +  The Qualcomm Snapdragon-based Lenovo Yoga C630 has an Embedded Controller
> +  (EC) which handles things such as battery and USB Type-C. This binding
> +  describes the interface, on an I2C bus, to this EC.
> +
> +properties:
> +  compatible:
> +    const: lenovo,yoga-c630-ec
> +
> +  reg:
> +    const: 0x70
> +
> +  '#address-cells':
> +    const: 1

Just to clarify: the EC have physically two USB connectors?

> +
> +  '#size-cells':
> +    const: 0
> +
> +  interrupts:
> +    maxItems: 1
> +
> +patternProperties:
> +  '^connector@\d$':
> +    $ref: /schemas/connector/usb-connector.yaml#

unevaluatedProperties:false inside connector (on its level)

> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +
> +additionalProperties: false
> +
> +examples:
> +  - |+
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    i2c1 {
> +      clock-frequency = <400000>;
> +
> +      #address-cells = <1>;
> +      #size-cells = <0>;
> +
> +      embedded-controller@70 {
> +        compatible = "lenovo,yoga-c630-ec";
> +        reg = <0x70>;
> +
> +        interrupts-extended = <&tlmm 20 IRQ_TYPE_LEVEL_HIGH>;
> +
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        connector@0 {
> +          compatible = "usb-c-connector";
> +          reg = <0>;
> +          power-role = "source";
> +          data-role = "host";
> +        };
> +
> +        connector@1 {
> +          compatible = "usb-c-connector";
> +          reg = <1>;
> +          power-role = "source";
> +          data-role = "host";
> +
> +          ports {
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +            port@1 {
> +              reg = <1>;
> +              lenovo_ec_dp_in: endpoint {
> +                   remote-endpoint = <&mdss_dp_out>;

You have inconsistent indentation. Use 4-spaces for entire DTS example.

Best regards,
Krzysztof
