Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B1EDF449A90
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Nov 2021 18:13:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240546AbhKHRQA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 8 Nov 2021 12:16:00 -0500
Received: from mail-ot1-f50.google.com ([209.85.210.50]:40885 "EHLO
        mail-ot1-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233057AbhKHRP7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 8 Nov 2021 12:15:59 -0500
Received: by mail-ot1-f50.google.com with SMTP id q33-20020a056830442100b0055abeab1e9aso26604106otv.7;
        Mon, 08 Nov 2021 09:13:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Xxr8McGAyynQSWh0P1igKRzffu9RL4rBpIWrj/ipjgw=;
        b=dQAXoNh8pVCuRGGYHBcZiZ76gfwUANimo2bDQLrH4UozRDEezNUEUIhOCV5+vhLT74
         FR7b1hXEU1n6E0coLdNovnaUKg+uUfNveyJ+KoOly2AahiRh7Uq0wJGcBXBCC9Sn7Z3g
         0GUB0QriYy9FDp5OYmDGYSgHRw0bb9atbQNluja3yZHuMIZWjYdVECgMVPZX21kYticA
         4A4JB20KNhOCAxGWlIJWbzFwoXWgulBBhi1WYQZBYVLEibQNqk8n++os3ZeHTZoiXgyN
         O/w7e60TjT3eESbbhJi/WL07iECEyCk9CZESrnw0K6+xQfKSyGhlaFfTv35QCx93Clq2
         mTxA==
X-Gm-Message-State: AOAM531vxCNvHUOmp3+yh1PodHA8x9e1aVg5zwMfLzsBDY8Wu/S8/oey
        9e93xNQi0nppzTXiAMY3Mw==
X-Google-Smtp-Source: ABdhPJwlWPM6xxIfag6CfK9K9abVFhl4cDR2cZ1GtROrTBJY40bGos6Qiaie0z6xY0CMohGpLhHhgg==
X-Received: by 2002:a9d:5cc4:: with SMTP id r4mr451383oti.19.1636391594707;
        Mon, 08 Nov 2021 09:13:14 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id o26sm1266165otj.14.2021.11.08.09.13.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Nov 2021 09:13:14 -0800 (PST)
Received: (nullmailer pid 3568383 invoked by uid 1000);
        Mon, 08 Nov 2021 17:13:13 -0000
Date:   Mon, 8 Nov 2021 11:13:13 -0600
From:   Rob Herring <robh@kernel.org>
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc:     linux@roeck-us.net, heikki.krogerus@linux.intel.com,
        gregkh@linuxfoundation.org, bjorn.andersson@linaro.org,
        linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, wcheng@codeaurora.org
Subject: Re: [PATCH v3 5/7] dt-bindings: usb: Add Qualcomm PMIC TCPM YAML
 schema
Message-ID: <YYlaqTYhe4hbXhFf@robh.at.kernel.org>
References: <20211105033558.1573552-1-bryan.odonoghue@linaro.org>
 <20211105033558.1573552-6-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211105033558.1573552-6-bryan.odonoghue@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Nov 05, 2021 at 03:35:56AM +0000, Bryan O'Donoghue wrote:
> Add a YAML description for the pm8150b-tcpm driver. The pm8150b-tcpm
> encapsulates a type-c block and a pdphy block into one block presented to
> the tcpm Linux API.

All Linux details that don't belong in binding description and design.

> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>  .../bindings/usb/qcom,pmic-tcpm.yaml          | 68 +++++++++++++++++++
>  1 file changed, 68 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/usb/qcom,pmic-tcpm.yaml
> 
> diff --git a/Documentation/devicetree/bindings/usb/qcom,pmic-tcpm.yaml b/Documentation/devicetree/bindings/usb/qcom,pmic-tcpm.yaml
> new file mode 100644
> index 0000000000000..29ab7e2d678e1
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/usb/qcom,pmic-tcpm.yaml
> @@ -0,0 +1,68 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: "http://devicetree.org/schemas/usb/qcom,pmic-tcpm.yaml#"
> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +
> +title: Qualcomm PMIC TCPM Driver
> +
> +maintainers:
> +  - Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> +
> +description: |
> +  Qualcomm PMIC Type-C Port Manager Driver
> +
> +properties:
> +  compatible:
> +    enum:
> +      - qcom,pm8150b-tcpm
> +
> +  pmic_tcpm_typec:

Don't use '_' in property names and custom properties need a vendor 
prefix.

> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description:
> +      A phandle to the typec port hardware driver.
> +
> +  pmic_tcpm_pdphy:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description:
> +      A phandle to the type-c pdphy hardware driver.

What is this binding a child of? Looks like the h/w is all part of a 
PMIC, so it should be part of the PMIC binding and probably merged with 
one of the nodes these phandles point to.

> +
> +required:
> +  - compatible
> +  - pmic_tcpm_typec
> +  - pmic_tcpm_pdphy
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    #include <dt-bindings/usb/pd.h>
> +    #include <dt-bindings/usb/typec/tcpm/qcom,pmic-usb-typec.h>
> +    #include <dt-bindings/usb/typec/tcpm/qcom,pmic-usb-pdphy.h>
> +
> +    pm8150b_tcpm: pmic-tcpm {
> +        compatible = "qcom,pm8150b-tcpm";
> +
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        pmic_tcpm_typec = <&pm8150b_typec>;
> +        pmic_tcpm_pdphy = <&pm8150b_pdphy>;
> +
> +        connector {
> +            compatible = "usb-c-connector";
> +
> +            power-role = "source";
> +            data-role = "dual";
> +            self-powered;
> +
> +            source-pdos = <PDO_FIXED(5000, 3000,
> +                           PDO_FIXED_DUAL_ROLE |
> +                           PDO_FIXED_USB_COMM |
> +                           PDO_FIXED_DATA_SWAP)>;
> +
> +        };
> +    };
> +
> +...
> -- 
> 2.33.0
> 
> 
