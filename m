Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 12E47481166
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Dec 2021 10:48:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239587AbhL2JsW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 29 Dec 2021 04:48:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57088 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235249AbhL2JsV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 29 Dec 2021 04:48:21 -0500
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 27250C06173E
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Dec 2021 01:48:21 -0800 (PST)
Received: by mail-wr1-x42b.google.com with SMTP id v7so43257835wrv.12
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Dec 2021 01:48:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=qDjeeN3tJDfEtNHA+qox/w/ruHonloY7pzva49iuuV8=;
        b=zfN/b52ioOu7Frnptm6a5ZNVSxOmqgvktKzC416jd1tSZyiJJWUi/HQyso2Ve09x/Z
         hP9K0rDFh+nrQ864maLONXTMklb2VvWmK5Qi3jUOTHVmW+Achdn15c29ej5Yxb6cmQ7X
         xA1UGAoVd0wlMUp7JyAJY/YX6uUMG04odilT08pwzQCAqHAvVEzh1MBViNtt3VSqbvaz
         EKDWKzPe5cJ6IyKNcU1oJ95NUlBVmfJ50CIkw7+4JWIgsTSiYmJzF/4syYPR89iEgsBU
         Zx4FS9Tk+x/Ast2z/KiG5jknk7ObPLBByGBSmUKMKDmLmVfN8CUn1SosCxw9DU4eYN7O
         Lr1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=qDjeeN3tJDfEtNHA+qox/w/ruHonloY7pzva49iuuV8=;
        b=NIiz27ow3ydp2mSUw6ltbrCanRGKFoGdkAfJnbFYWLvZW2fA1UXsCsWiVyEAn2Y2P1
         /F0OjVy4KTtxdvYW9fKxV1pp75oBqv8lXHmIj4MEQnTQ/uvFN3GvSSuWyQnGKq1+XQvn
         AsYfm20c1Eh+10PyWXh15bA24ewsRnGvOBMJdMSP9GvhKSle6NeSKD+bKMMfXfNiAyMX
         B99JDAO+OtrOk+PBS0weJOPyv9OqhGxkQiMzlbt9V1GBO+CzhOedGI/S7x+q6WWBNmSW
         NotgC7JKlGZeiMYAk21mAOMtblO2ww4D52L6PKvO9q1f1yExyxIQrFKwO+C8hOzCmPhD
         i20g==
X-Gm-Message-State: AOAM533MXj45bXmnDH1zOde+l6XpRIwxWlNwQV/4N+UNwOFprVZBqb0i
        o8L5IZr3CasKJrMoZjVNHg6gsg==
X-Google-Smtp-Source: ABdhPJyZ2LPZGESrGM/hMEjjdXwayJMclO1dHfAudAX6sp6XX6ZnA4E+IdOUkZNCkNoK5I5P44o4Kg==
X-Received: by 2002:a05:6000:1861:: with SMTP id d1mr20103423wri.338.1640771299663;
        Wed, 29 Dec 2021 01:48:19 -0800 (PST)
Received: from google.com ([2.31.167.18])
        by smtp.gmail.com with ESMTPSA id m17sm25076495wms.25.2021.12.29.01.48.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Dec 2021 01:48:19 -0800 (PST)
Date:   Wed, 29 Dec 2021 09:48:17 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     David Heidelberg <david@ixit.cz>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, ~okias/devicetree@lists.sr.ht,
        Caleb Connolly <caleb.connolly@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: mfd: convert to yaml Qualcomm SPMI PMIC
Message-ID: <Ycwu4fMfE2LmnyOv@google.com>
References: <20211227215433.114426-1-david@ixit.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211227215433.114426-1-david@ixit.cz>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, 27 Dec 2021, David Heidelberg wrote:

> From: Caleb Connolly <caleb.connolly@linaro.org>
> 
> Convert Qualcomm SPMI PMIC binding to yaml format.
> 
> Additional changes:
>  - filled many missing compatibles
> 
> Co-developed-by: David Heidelberg <david@ixit.cz>
> Signed-off-by: David Heidelberg <david@ixit.cz>

I must admit, I'm a bit hazy on the details, but this looks odd to
me.  Shouldn't this have Caleb's SoB too?  Also, if you apply your
SoB, I'm not sure you also need to apply a CDB as well?

> ---
> depends on patch "arm64: dts: qcom: pms405: assign device specific compatible"
> ---
>  .../bindings/mfd/qcom,spmi-pmic.txt           |  93 -----------
>  .../bindings/mfd/qcom,spmi-pmic.yaml          | 152 ++++++++++++++++++
>  2 files changed, 152 insertions(+), 93 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.txt
>  create mode 100644 Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
> 
> diff --git a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.txt b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.txt
> deleted file mode 100644
> index 3810a80536f7..000000000000
> --- a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.txt
> +++ /dev/null
> @@ -1,93 +0,0 @@
> -          Qualcomm SPMI PMICs multi-function device bindings
> -
> -The Qualcomm SPMI series presently includes PM8941, PM8841 and PMA8084
> -PMICs.  These PMICs use a QPNP scheme through SPMI interface.
> -QPNP is effectively a partitioning scheme for dividing the SPMI extended
> -register space up into logical pieces, and set of fixed register
> -locations/definitions within these regions, with some of these regions
> -specifically used for interrupt handling.
> -
> -The QPNP PMICs are used with the Qualcomm Snapdragon series SoCs, and are
> -interfaced to the chip via the SPMI (System Power Management Interface) bus.
> -Support for multiple independent functions are implemented by splitting the
> -16-bit SPMI slave address space into 256 smaller fixed-size regions, 256 bytes
> -each. A function can consume one or more of these fixed-size register regions.
> -
> -Required properties:
> -- compatible:      Should contain one of:
> -                   "qcom,pm660",
> -                   "qcom,pm660l",
> -                   "qcom,pm7325",
> -                   "qcom,pm8004",
> -                   "qcom,pm8005",
> -                   "qcom,pm8019",
> -                   "qcom,pm8028",
> -                   "qcom,pm8110",
> -                   "qcom,pm8150",
> -                   "qcom,pm8150b",
> -                   "qcom,pm8150c",
> -                   "qcom,pm8150l",
> -                   "qcom,pm8226",
> -                   "qcom,pm8350c",
> -                   "qcom,pm8841",
> -                   "qcom,pm8901",
> -                   "qcom,pm8909",
> -                   "qcom,pm8916",
> -                   "qcom,pm8941",
> -                   "qcom,pm8950",
> -                   "qcom,pm8994",
> -                   "qcom,pm8998",
> -                   "qcom,pma8084",
> -                   "qcom,pmd9635",
> -                   "qcom,pmi8950",
> -                   "qcom,pmi8962",
> -                   "qcom,pmi8994",
> -                   "qcom,pmi8998",
> -                   "qcom,pmk8002",
> -                   "qcom,pmk8350",
> -                   "qcom,pmr735a",
> -                   "qcom,smb2351",
> -                   or generalized "qcom,spmi-pmic".
> -- reg:             Specifies the SPMI USID slave address for this device.
> -                   For more information see:
> -                   Documentation/devicetree/bindings/spmi/spmi.yaml
> -
> -Required properties for peripheral child nodes:
> -- compatible:      Should contain "qcom,xxx", where "xxx" is a peripheral name.
> -
> -Optional properties for peripheral child nodes:
> -- interrupts:      Interrupts are specified as a 4-tuple. For more information
> -                   see:
> -                   Documentation/devicetree/bindings/spmi/qcom,spmi-pmic-arb.yaml
> -- interrupt-names: Corresponding interrupt name to the interrupts property
> -
> -Each child node of SPMI slave id represents a function of the PMIC. In the
> -example below the rtc device node represents a peripheral of pm8941
> -SID = 0. The regulator device node represents a peripheral of pm8941 SID = 1.
> -
> -Example:
> -
> -	spmi {
> -		compatible = "qcom,spmi-pmic-arb";
> -
> -		pm8941@0 {
> -			compatible = "qcom,pm8941", "qcom,spmi-pmic";
> -			reg = <0x0 SPMI_USID>;
> -
> -			rtc {
> -				compatible = "qcom,rtc";
> -				interrupts = <0x0 0x61 0x1 IRQ_TYPE_EDGE_RISING>;
> -				interrupt-names = "alarm";
> -			};
> -		};
> -
> -		pm8941@1 {
> -			compatible = "qcom,pm8941", "qcom,spmi-pmic";
> -			reg = <0x1 SPMI_USID>;
> -
> -			regulator {
> -				compatible = "qcom,regulator";
> -				regulator-name = "8941_boost";
> -			};
> -		};
> -	};
> diff --git a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
> new file mode 100644
> index 000000000000..11aa2c61eded
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
> @@ -0,0 +1,152 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm SPMI PMICs multi-function device
> +
> +description: |
> +  Some Qualcomm PMICs used with the Snapdragon series SoCs are interfaced
> +  to the chip via the SPMI (System Power Management Interface) bus.
> +  Support for multiple independent functions are implemented by splitting the
> +  16-bit SPMI peripheral address space into 256 smaller fixed-size regions, 256 bytes
> +  each. A function can consume one or more of these fixed-size register regions.
> +
> +  The Qualcomm SPMI series includes the PM8941, PM8841, PMA8084, PM8998 and other
> +  PMICs.  These PMICs use a "QPNP" scheme through SPMI interface.
> +  QPNP is effectively a partitioning scheme for dividing the SPMI extended
> +  register space up into logical pieces, and set of fixed register
> +  locations/definitions within these regions, with some of these regions
> +  specifically used for interrupt handling.
> +
> +maintainers:
> +  - Stephen Boyd <sboyd@kernel.org>
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - qcom,pm660
> +          - qcom,pm660l
> +          - qcom,pm6150
> +          - qcom,pm6150l
> +          - qcom,pm6350
> +          - qcom,pm7325
> +          - qcom,pm8004
> +          - qcom,pm8005
> +          - qcom,pm8009
> +          - qcom,pm8019
> +          - qcom,pm8110
> +          - qcom,pm8150
> +          - qcom,pm8150b
> +          - qcom,pm8150l
> +          - qcom,pm8226
> +          - qcom,pm8350
> +          - qcom,pm8350b
> +          - qcom,pm8350c
> +          - qcom,pm8841
> +          - qcom,pm8909
> +          - qcom,pm8916
> +          - qcom,pm8941
> +          - qcom,pm8950
> +          - qcom,pm8994
> +          - qcom,pm8998
> +          - qcom,pma8084
> +          - qcom,pmd9635
> +          - qcom,pmi8950
> +          - qcom,pmi8962
> +          - qcom,pmi8994
> +          - qcom,pmi8998
> +          - qcom,pmk8350
> +          - qcom,pmm8155au
> +          - qcom,pmr735a
> +          - qcom,pmr735b
> +          - qcom,pms405
> +          - qcom,smb2351
> +      - const: qcom,spmi-pmic
> +
> +  reg: true
> +
> +  "#address-cells":
> +    const: 1
> +
> +  "#size-cells":
> +    const: 0
> +
> +
> +patternProperties:
> +  $nodename:
> +    pattern: '^pmic@.*$'
> +
> +  '(labibb|([a-z][a-z0-9]+-)?regulators)':
> +    type: object
> +
> +    required:
> +      - compatible
> +
> +  '@[0-9a-f]+$':
> +    type: object
> +    description: >
> +      Each child node of the PMIC represents a function of it.
> +
> +    properties:
> +      interrupts:
> +        description: >
> +          Interrupts are specified as a 4-tuple. For more information see
> +          Documentation/devicetree/bindings/spmi/qcom,spmi-pmic-arb.yaml
> +
> +      interrupt-names: true
> +
> +    required:
> +      - compatible
> +
> +    additionalProperties: true
> +
> +required:
> +  - compatible
> +  - reg
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/spmi/spmi.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +    spmi@c440000 {
> +        compatible = "qcom,spmi-pmic-arb";
> +        reg = <0x0c440000 0x1100>,
> +              <0x0c600000 0x2000000>,
> +              <0x0e600000 0x100000>,
> +              <0x0e700000 0xa0000>,
> +              <0x0c40a000 0x26000>;
> +        reg-names = "core", "chnls", "obsrvr", "intr", "cnfg";
> +        interrupt-names = "periph_irq";
> +        interrupts = <GIC_SPI 481 IRQ_TYPE_LEVEL_HIGH>;
> +        qcom,ee = <0>;
> +        qcom,channel = <0>;
> +        #address-cells = <2>;
> +        #size-cells = <0>;
> +        interrupt-controller;
> +        #interrupt-cells = <4>;
> +        cell-index = <0>;
> +
> +        pmi8998_lsid0: pmic@2 {
> +            compatible = "qcom,pmi8998", "qcom,spmi-pmic";
> +            reg = <0x2 SPMI_USID>;
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +
> +            pmi8998_gpio: gpios@c000 {
> +                compatible = "qcom,pmi8998-gpio", "qcom,spmi-gpio";
> +                reg = <0xc000>;
> +                gpio-controller;
> +                gpio-ranges = <&pmi8998_gpio 0 0 14>;
> +                #gpio-cells = <2>;
> +                interrupt-controller;
> +                #interrupt-cells = <2>;
> +            };
> +        };
> +    };

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
