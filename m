Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BEA9C53FE5C
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jun 2022 14:09:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243557AbiFGMIu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 7 Jun 2022 08:08:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55616 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243551AbiFGMIs (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 7 Jun 2022 08:08:48 -0400
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A49718BD3E
        for <linux-arm-msm@vger.kernel.org>; Tue,  7 Jun 2022 05:08:47 -0700 (PDT)
Received: by mail-ej1-x62e.google.com with SMTP id u12so34776372eja.8
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jun 2022 05:08:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:in-reply-to:content-transfer-encoding;
        bh=xV+JNWROXIXNNl72An2tMAra5xOJapsLU/5a6Polwlg=;
        b=p8WSw2UMIhQNr2Fwr8cpY5cZqsab+1E35dtmXpB41xaHUUoak4LJRLYksNib4yNTik
         t0+d1YA7pOXHFbyDI5/w/PSMRJn2b1otbPqCKptEO6LjOiQYGxLvxohrBSkzvKqKZjzv
         eXpzqayAHIETEYiDAZVNbAE+SUc8MNrVk6jm5JzjS6ygFRirmZueNBO167lnAvlYQtj1
         mcU3zA6ggk0c2VHVTjAy15pCP91j2Shz/q1lvUWmaKKMAwssV8CWTjktGezp/honngST
         Qj3vhh8HEDRk1Y1SzxPh5IGFbC38EyNYCgnKjMEZW6ycmUN17A0DIAJ+ANpqxUHx4IOk
         UbEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=xV+JNWROXIXNNl72An2tMAra5xOJapsLU/5a6Polwlg=;
        b=gM0c7o0lBEzeGzxHoK68vX+2boDGUd4kSUpiZCT5vUT5LJo5dZjahwj84UERHy8y6p
         CdzI9Mq97QsJXDAUXgD3jGLCD1AZnzbr7Q3a6l2iHcO0MKEnN9HLol7Kwv98clEV20WW
         /j3poIeGDF0DO9WE40ZgQilUVuPK1zb8OwCGpht7hC4FkQCafJyxKfTApAHH502NHPzv
         sJpRDCzmXyUnl21rMt7W8RszwiZxUS+dMa3VFQB51dRZImJH8R197XpEtgqofhnBlPXK
         dfMvLDbOsBDkowt07oa/Cz6AV3feXj9un6RkoA4yXkN5iFo/C5AyKW8VjzwOTqQzVNWL
         m1Ew==
X-Gm-Message-State: AOAM531+6rKjZKMZc9yOgmQV/gUI80s3cJ8YL/oc7uCneef6LamVxXqC
        XZ3fy7MB8/Oa4A7f+S2KZJLHVA==
X-Google-Smtp-Source: ABdhPJyczAHK7KPQ/MU9ZVoX5hsVjj1U5sR9a+dXDnJEexExXSxpVn7QuiQ2RX1o5bvhSIAmm4Grwg==
X-Received: by 2002:a17:907:d29:b0:711:d215:5a5e with SMTP id gn41-20020a1709070d2900b00711d2155a5emr8283950ejc.697.1654603726171;
        Tue, 07 Jun 2022 05:08:46 -0700 (PDT)
Received: from [192.168.0.183] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id v4-20020a170906488400b006fea2035036sm7546255ejq.86.2022.06.07.05.08.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jun 2022 05:08:45 -0700 (PDT)
Message-ID: <c2da559b-1d87-be64-5531-aef0e9c62aa7@linaro.org>
Date:   Tue, 7 Jun 2022 14:08:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 1/7] dt-bindings: display: panel: Add Innolux TD4328 panel
 bindings
Content-Language: en-US
To:     Teguh Sobirin <teguh@sobir.in>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        phone-devel@vger.kernel.org
References: <SEZPR03MB6666F4081BF29953A0DC379BDDA29@SEZPR03MB6666.apcprd03.prod.outlook.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <SEZPR03MB6666F4081BF29953A0DC379BDDA29@SEZPR03MB6666.apcprd03.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 07/06/2022 01:05, Teguh Sobirin wrote:
> Add documentation for "innolux,td4328" panel.
> 
> Signed-off-by: Teguh Sobirin <teguh@sobir.in>
> ---
>  .../display/panel/innolux,td4328.yaml         | 83 +++++++++++++++++++
>  1 file changed, 83 insertions(+)
>  create mode 100755 Documentation/devicetree/bindings/display/panel/innolux,td4328.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/panel/innolux,td4328.yaml b/Documentation/devicetree/bindings/display/panel/innolux,td4328.yaml
> new file mode 100755
> index 000000000000..d4773ade0f13
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/panel/innolux,td4328.yaml
> @@ -0,0 +1,83 @@
> +# SPDX-License-Identifier: GPL-2.0

Dual License please (like checkpatch asks).

> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/panel/innolux,td4328.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Synaptics TD4328 based DSI display Panels
> +
> +maintainers:
> +  - Teguh Sobirin <teguh@sobir.in>
> +
> +description: |
> +  The TD4328 IC from Synaptics is a DSI Panel IC used to drive DSI panels.
> +
> +allOf:
> +  - $ref: panel-common.yaml#
> +
> +properties:
> +  compatible:
> +    const: innolux,td4328

Innolux or Synaptics?

> +    description: This indicates the panel manufacturer of the panel that is
> +      in turn using the TD4328 panel driver.

What does the "panel driver" mean here?

> +
> +  reset-gpios:
> +    maxItems: 1
> +    description: phandle of gpio for reset line - This should be 8mA, gpio
> +      can be configured using mux, pinctrl, pinctrl-names (active high)

s/phandle of gpio//
Everywhere.

> +
> +  vddio-supply:
> +    description: phandle of the regulator that provides the supply voltage
> +      Power IC supply

s/phandle of the regulator//
Everywhere. This should be simply:
"Power IC supply"

> +
> +  vddpos-supply:
> +    description: phandle of the positive boost supply regulator

"Positive boost supply"

> +
> +  vddneg-supply:
> +    description: phandle of the negative boost supply regulator

"Negative boost supply"

> +
> +  rotation:
> +    description: Display rotation in degrees counter clockwise (0,90,180,270)

No need for description, just true

> +
> +  reg: true

maxItems

> +  port: true
> +
> +required:
> +  - compatible
> +  - reg
> +  - vddio-supply
> +  - vddpos-supply
> +  - vddneg-supply
> +  - reset-gpios
> +  - rotation
> +  - port
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |+

Just "  - |"

> +    #include <dt-bindings/gpio/gpio.h>
> +
> +    dsi0 {

dsi

> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        panel@0 {
> +            compatible = "innolux,td4328";
> +            reg = <0>;
> +            vddio-supply = <&vreg_l14a_1p88>;
> +            vddpos-supply = <&lab>;
> +            vddneg-supply = <&ibb>;
> +
> +            reset-gpios = <&tlmm 6 GPIO_ACTIVE_HIGH>;
> +            rotation = <90>;
> +
> +            port {
> +                panel0_in: endpoint {
> +                    remote-endpoint = <&dsi0_out>;
> +                };
> +            };
> +        };
> +    };
> +
> +...


Best regards,
Krzysztof
