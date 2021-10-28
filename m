Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CC1C643E9C7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Oct 2021 22:39:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231215AbhJ1Ulm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 28 Oct 2021 16:41:42 -0400
Received: from mail-ot1-f42.google.com ([209.85.210.42]:45619 "EHLO
        mail-ot1-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231201AbhJ1Ulm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 28 Oct 2021 16:41:42 -0400
Received: by mail-ot1-f42.google.com with SMTP id l16-20020a9d6a90000000b0054e7ab56f27so10332207otq.12;
        Thu, 28 Oct 2021 13:39:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=8hcSpbM818u3hZjpFxDehQhP0lWSRnytuCbA6xVhwYo=;
        b=t406xCTGz5nsfITgu6xgTxNeP5ZB8XBSNPmSrEL96sIEv3YZ/GTf7LrgHhUcRJL07d
         DA2Ytx1myqs7qrn1Q3FQqjUpKDj0GPOLANaVSxldSf/ZpqXbAijV4ro9q+SB+ZJ5g+f3
         E9fqy0e38RyIBI9MQj+xtTRocHG71XH/uRTPZsQQr3outNp6alS8SJwEAY6UseecSdoT
         7tSAN98DpYE+OHkKGrRc62O+4tErDnHFU52Kj0Dzk0w00HqpTmAiasgetsONaTu0qgKU
         7jqZTAtRlSPNDq7GWfOrLV4caTm6MH3SXNwMdfUJq5M9vXo8mWqekxl01pVUJHXDVLge
         A+Ow==
X-Gm-Message-State: AOAM530G6yVuyYToSrQI2F8zJSXBWGXlCH2hOQtCX2JDA82s6vndNmcB
        A7Xcgf8yyOrQMK5DNASS9FMrUAgnHQ==
X-Google-Smtp-Source: ABdhPJzh1TgqwVC88tzts1f0PIQgxeDbxM/iVMAgThmGHBwuUmrtTnQlbbRj/iXXsbuO6bkNPNOtvg==
X-Received: by 2002:a05:6830:2708:: with SMTP id j8mr5367128otu.240.1635453554508;
        Thu, 28 Oct 2021 13:39:14 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id b9sm1513184ots.77.2021.10.28.13.39.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Oct 2021 13:39:13 -0700 (PDT)
Received: (nullmailer pid 540440 invoked by uid 1000);
        Thu, 28 Oct 2021 20:39:13 -0000
Date:   Thu, 28 Oct 2021 15:39:13 -0500
From:   Rob Herring <robh@kernel.org>
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc:     linux@roeck-us.net, heikki.krogerus@linux.intel.com,
        rdunlap@infradead.org, gregkh@linuxfoundation.org,
        bjorn.andersson@linaro.org, linux-usb@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        wcheng@codeaurora.org
Subject: Re: [RESEND PATCH v2 4/7] dt-bindings: usb: Add Qualcomm PMIC PDPHY
 controller YAML schema
Message-ID: <YXsKcWB9ctkmawju@robh.at.kernel.org>
References: <20211028164941.831918-1-bryan.odonoghue@linaro.org>
 <20211028164941.831918-5-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211028164941.831918-5-bryan.odonoghue@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Oct 28, 2021 at 05:49:38PM +0100, Bryan O'Donoghue wrote:
> Add a YAML binding for the power-delivery PHY silicon interface inside
> Qualcomm's pm8150b hardware block.
> 
> The pdphy driver operates with a type-c driver inside of a high level
> single TCPM device to provide overall TCPM functionality.

Same comments for this one...

> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>  .../bindings/usb/qcom,pmic-pdphy.yaml         | 115 ++++++++++++++++++
>  1 file changed, 115 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/usb/qcom,pmic-pdphy.yaml
> 
> diff --git a/Documentation/devicetree/bindings/usb/qcom,pmic-pdphy.yaml b/Documentation/devicetree/bindings/usb/qcom,pmic-pdphy.yaml
> new file mode 100644
> index 0000000000000..9110f6203b87f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/usb/qcom,pmic-pdphy.yaml
> @@ -0,0 +1,115 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: "http://devicetree.org/schemas/usb/qcom,pmic-pdphy.yaml#"
> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +
> +title: Qualcomm PMIC based USB PDPHY driver
> +
> +maintainers:
> +  - Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> +
> +description: |
> +  Qualcomm PMIC Power Delivery PHY driver
> +
> +properties:
> +  compatible:
> +    enum:
> +      - qcom,pm8150b-pdphy
> +
> +  reg:
> +    maxItems: 1
> +    description: PDPHY base address
> +
> +  interrupts:
> +    items:
> +      - description: Sig TX - transmitted reset signal
> +      - description: Sig RX - received reset signal
> +      - description: TX completion
> +      - description: RX completion
> +      - description: TX fail
> +      - description: TX discgard
> +      - description: RX discgard
> +      - description: Fast Role Swap event
> +
> +  interrupt-names:
> +    items:
> +       - const: pmic-pdphy-sig-tx
> +       - const: pmic-pdphy-sig-rx
> +       - const: pmic-pdphy-msg-tx
> +       - const: pmic-pdphy-msg-rx
> +       - const: pmic-pdphy-msg-tx-failed
> +       - const: pmic-pdphy-msg-tx-discarded
> +       - const: pmic-pdphy-msg-rx-discarded
> +       - const: pmic-pdphy-fr-swap
> +
> +  ports:
> +    description: Remote endpoint connections
> +    $ref: /connector/usb-connector.yaml#/properties/ports
> +
> +    properties:
> +      port@0:
> +        description: Remote endpoints for the TCPM driver
> +
> +    required:
> +      - port@0
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - interrupt-names
> +  - ports
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    #include <dt-bindings/usb/typec/tcpm/qcom,pmic-usb-pdphy.h>
> +
> +    pm8150b {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        pm8150b_pdphy: pdphy@1700 {
> +            compatible = "qcom,pm8150b-pdphy";
> +            reg = <0x1700>;
> +            interrupts = <0x2 0x17 PMIC_PDPHY_SIG_TX_IRQ
> +                          IRQ_TYPE_EDGE_RISING>,
> +                         <0x2 0x17 PMIC_PDPHY_SIG_RX_IRQ
> +                          IRQ_TYPE_EDGE_RISING>,
> +                         <0x2 0x17 PMIC_PDPHY_MSG_TX_IRQ
> +                          IRQ_TYPE_EDGE_RISING>,
> +                         <0x2 0x17 PMIC_PDPHY_MSG_RX_IRQ
> +                          IRQ_TYPE_EDGE_RISING>,
> +                         <0x2 0x17 PMIC_PDPHY_MSG_TX_FAIL_IRQ
> +                          IRQ_TYPE_EDGE_RISING>,
> +                         <0x2 0x17 PMIC_PDPHY_MSG_TX_DISCARD_IRQ
> +                          IRQ_TYPE_EDGE_RISING>,
> +                         <0x2 0x17 PMIC_PDPHY_MSG_RX_DISCARD_IRQ
> +                          IRQ_TYPE_EDGE_RISING>,
> +                         <0x2 0x17 PMIC_PDPHY_FR_SWAP_IRQ
> +                          IRQ_TYPE_EDGE_RISING>;
> +            interrupt-names = "pmic-pdphy-sig-tx",
> +                              "pmic-pdphy-sig-rx",
> +                              "pmic-pdphy-msg-tx",
> +                              "pmic-pdphy-msg-rx",
> +                              "pmic-pdphy-msg-tx-failed",
> +                              "pmic-pdphy-msg-tx-discarded",
> +                              "pmic-pdphy-msg-rx-discarded",
> +                              "pmic-pdphy-fr-swap";
> +            ports {
> +                #address-cells = <1>;
> +                #size-cells = <0>;
> +
> +                port@0 {
> +                    reg = <0>;
> +                    pmic_pdphy: endpoint {
> +                        remote-endpoint = <&pmic_tcpm_pdphy>;
> +                    };
> +                };
> +            };
> +        };
> +    };
> +...
> -- 
> 2.33.0
> 
> 
