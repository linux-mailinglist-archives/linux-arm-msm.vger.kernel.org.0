Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C468635D12D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Apr 2021 21:37:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237711AbhDLTiK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 12 Apr 2021 15:38:10 -0400
Received: from mail-oi1-f182.google.com ([209.85.167.182]:46714 "EHLO
        mail-oi1-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237443AbhDLTiJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 12 Apr 2021 15:38:09 -0400
Received: by mail-oi1-f182.google.com with SMTP id m13so14562905oiw.13;
        Mon, 12 Apr 2021 12:37:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=4d8rEeg7H4Q753fT0EA7CbE9MzIZSVPsJLwZhB5trFA=;
        b=KH8HdJsxIzqADD2o1OijdhqxMc8q4v3g3RtZxF0ZuHqi6/XR0sFFab3EvHWlH3ghu6
         X5mK4qY+RwowGwVEiAc1oSKutithdZHeczJrZrYvP8tMkW5FrfLRXcCeNtQHL9ViZqu4
         yPPGkNdpZ47x5eDQAw7GOHGa0siW8rQKoiZpDWIXmGMVdBN6GFbRGImF65UizqjSyWfp
         yuSBgna8byc1/qy04eEALG5RllOfPDGg+zKfFuBnhVQwoTn4GBZmqM/v00jKtUpIl31/
         bY6IrDvOD80zsLFtD4Pmf5XB+kK3Hk6SGORf/yzgdspvENbj+RgYg/idnuGSfa7coEQH
         Xu2Q==
X-Gm-Message-State: AOAM5325HIiJiLYnkAcQ4+bpSYmBQ56RO9Ggf84aMExqcDTQx9vbtjBU
        iCRn6iofn6vUmnn6OsleEQ==
X-Google-Smtp-Source: ABdhPJz1rwbUEsMzVeQQJ/l6UJkSonhhML6y6RX7ez5UnzN8SKgSDATmcvuA5fRHESGtUXl+Bsg5hw==
X-Received: by 2002:aca:d653:: with SMTP id n80mr559133oig.21.1618256270905;
        Mon, 12 Apr 2021 12:37:50 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id f29sm2853869ots.22.2021.04.12.12.37.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Apr 2021 12:37:49 -0700 (PDT)
Received: (nullmailer pid 54976 invoked by uid 1000);
        Mon, 12 Apr 2021 19:37:48 -0000
Date:   Mon, 12 Apr 2021 14:37:48 -0500
From:   Rob Herring <robh@kernel.org>
To:     Guru Das Srinagesh <gurus@codeaurora.org>
Cc:     Lee Jones <lee.jones@linaro.org>, devicetree@vger.kernel.org,
        Mark Brown <broonie@kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] dt-bindings: mfd: pm8008: Add bindings
Message-ID: <20210412193748.GA53049@robh.at.kernel.org>
References: <cover.1618015804.git.gurus@codeaurora.org>
 <787cb004e6e7db766f68cb7ace9028c37085088a.1618015804.git.gurus@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <787cb004e6e7db766f68cb7ace9028c37085088a.1618015804.git.gurus@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Apr 09, 2021 at 05:55:01PM -0700, Guru Das Srinagesh wrote:
> Add bindings for the Qualcomm Technologies, Inc. PM8008 MFD driver.
> 
> Signed-off-by: Guru Das Srinagesh <gurus@codeaurora.org>
> ---
>  .../devicetree/bindings/mfd/qcom,pm8008.yaml       | 119 +++++++++++++++++++++
>  1 file changed, 119 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mfd/qcom,pm8008.yaml
> 
> diff --git a/Documentation/devicetree/bindings/mfd/qcom,pm8008.yaml b/Documentation/devicetree/bindings/mfd/qcom,pm8008.yaml
> new file mode 100644
> index 0000000..0cafa98
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mfd/qcom,pm8008.yaml
> @@ -0,0 +1,119 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mfd/qcom,pm8008.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm Technologies, Inc. PM8008 PMIC bindings
> +
> +maintainers:
> +  - Guru Das Srinagesh <gurus@codeaurora.org>
> +
> +description: |
> +  Qualcomm Technologies, Inc. PM8008 is a dedicated camera PMIC that integrates
> +  all the necessary power management, housekeeping, and interface support
> +  functions into a single IC.
> +
> +properties:
> +  compatible:
> +    const: qcom,pm8008
> +
> +  reg:
> +    description:
> +      I2C slave address.
> +
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +    description: Parent interrupt.
> +
> +  "#interrupt-cells":
> +    const: 2
> +
> +    description: |
> +      The first cell is the IRQ number, the second cell is the IRQ trigger
> +      flag. All interrupts are listed in include/dt-bindings/mfd/qcom-pm8008.h.
> +
> +  interrupt-controller: true
> +
> +  "#address-cells":
> +    const: 1
> +
> +  "#size-cells":
> +    const: 0
> +
> +patternProperties:
> +  "^pinctrl@[0-9a-f]+$":

Doesn't look like a pin controller. 'gpio@...' instead.

> +    type: object

       additionalProperties: false

> +
> +    description: |
> +      The GPIO peripheral. This node may be specified twice, one for each GPIO.
> +
> +    properties:
> +      compatible:
> +        const: qcom,pm8008-gpio
> +
> +      reg:
> +        description: Peripheral address of one of the two GPIO peripherals.
> +        maxItems: 1
> +
> +      gpio-controller: true
> +
> +      interrupt-controller: true
> +
> +      "#interrupt-cells":
> +        const: 2
> +
> +      "#gpio-cells":
> +        const: 2
> +
> +    required:
> +      - compatible
> +      - reg
> +      - gpio-controller
> +      - interrupt-controller
> +      - "#gpio-cells"
> +      - "#interrupt-cells"
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - "#address-cells"
> +  - "#size-cells"
> +  - "#interrupt-cells"
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/mfd/qcom-pm8008.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    qupv3_se13_i2c {
> +      #address-cells = <1>;
> +      #size-cells = <0>;
> +      pm8008i@8 {
> +        compatible = "qcom,pm8008";
> +        reg = <0x8>;
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +        interrupt-controller;
> +        #interrupt-cells = <2>;
> +
> +        interrupt-parent = <&tlmm>;
> +        interrupts = <32 IRQ_TYPE_EDGE_RISING>;
> +
> +        pinctrl@c000 {
> +          compatible = "qcom,pm8008-gpio";
> +          reg = <0xc000>;
> +          gpio-controller;
> +          #gpio-cells = <2>;
> +          interrupt-controller;
> +          #interrupt-cells = <2>;
> +        };
> +      };
> +    };
> +
> +...
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
> 
