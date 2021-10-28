Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 907A043E9C4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Oct 2021 22:38:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231221AbhJ1UlW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 28 Oct 2021 16:41:22 -0400
Received: from mail-oo1-f46.google.com ([209.85.161.46]:34488 "EHLO
        mail-oo1-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231329AbhJ1UlK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 28 Oct 2021 16:41:10 -0400
Received: by mail-oo1-f46.google.com with SMTP id e200-20020a4a55d1000000b002b8bedf08cdso2587376oob.1;
        Thu, 28 Oct 2021 13:38:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=xyZom8E2709Qdvhi6/U7ZSf0Ll9lIWac2Momm8miW1o=;
        b=511XTJZyj5SVPoN+emKyxOSJHOvD1HgJSlRchV/ByWDmxv9M41Cv1SBpfww8W3qETx
         ceDFy336ZrxrBdWu5F2HxxzFBsn2TZJrPjxJR8HP6gme4YC6TgOefitd3lT0rVN6yb2U
         J4s408Yik+C8sW+HXc+ymRINFAK8oPsG+CP58xrHDEZiNpcr5nUAjylS7wusvW1GV1U8
         lc9QR3ifXpWxs07HdraRkgjbbLgAiTDWPZVjZJmPIAkyiQIh8GqYA7flExjeed7P1d9v
         xohXcxu2DquodG+Pp0JMs7xOW0PiY2oROurjzyH+TJfs2w/FTYLZK6TC042Kvmll/UqZ
         sKKQ==
X-Gm-Message-State: AOAM530V2zV9FrA01hXOFyNMMgMEY5nr/la1U4aCFAZQI6oTam56H3Lr
        8FOC69iuwn4IDoXXOWliBw==
X-Google-Smtp-Source: ABdhPJzT9VMELeskPlI0qSpKNlPkAWGrWTqbGWOH7VjnZBkkpD96R4CgtJCTXJVAL4kstz1VJ7KiQQ==
X-Received: by 2002:a4a:51c1:: with SMTP id s184mr4730217ooa.69.1635453522390;
        Thu, 28 Oct 2021 13:38:42 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id ay42sm1442424oib.22.2021.10.28.13.38.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Oct 2021 13:38:41 -0700 (PDT)
Received: (nullmailer pid 539542 invoked by uid 1000);
        Thu, 28 Oct 2021 20:38:40 -0000
Date:   Thu, 28 Oct 2021 15:38:40 -0500
From:   Rob Herring <robh@kernel.org>
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc:     linux@roeck-us.net, heikki.krogerus@linux.intel.com,
        rdunlap@infradead.org, gregkh@linuxfoundation.org,
        bjorn.andersson@linaro.org, linux-usb@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        wcheng@codeaurora.org
Subject: Re: [RESEND PATCH v2 2/7] dt-bindings: usb: Add Qualcomm PMIC type C
 controller YAML schema
Message-ID: <YXsKUAoKQuGFya7X@robh.at.kernel.org>
References: <20211028164941.831918-1-bryan.odonoghue@linaro.org>
 <20211028164941.831918-3-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211028164941.831918-3-bryan.odonoghue@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Oct 28, 2021 at 05:49:36PM +0100, Bryan O'Donoghue wrote:
> Add a YAML binding for the type-c silicon interface inside Qualcomm's
> pm8150b hardware block.
> 
> The type-c driver operates with a pdphy driver inside of a high level
> single TCPM device.
> 
> Based on original work by Wesley.
> 
> Signed-off-by: Wesley Cheng <wcheng@codeaurora.org>
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>  .../bindings/usb/qcom,pmic-typec.yaml         | 116 ++++++++++++++++++
>  1 file changed, 116 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/usb/qcom,pmic-typec.yaml
> 
> diff --git a/Documentation/devicetree/bindings/usb/qcom,pmic-typec.yaml b/Documentation/devicetree/bindings/usb/qcom,pmic-typec.yaml
> new file mode 100644
> index 0000000000000..72602daf910bb
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/usb/qcom,pmic-typec.yaml
> @@ -0,0 +1,116 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: "http://devicetree.org/schemas/usb/qcom,pmic-typec.yaml#"
> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +
> +title: Qualcomm PMIC based USB type C Detection Driver
> +
> +maintainers:
> +  - Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> +
> +description: |
> +  Qualcomm PMIC Type C Detect
> +
> +properties:
> +  compatible:
> +    enum:
> +      - qcom,pm8150b-usb-typec
> +
> +  reg:
> +    maxItems: 1
> +    description: Type C base address
> +
> +  interrupts:
> +    items:
> +      - description: Bitmask of CC attach, VBUS error, tCCDebounce done and more
> +      - description: VCONN Powered Detection
> +      - description: CC state change
> +      - description: VCONN over-current condition
> +      - description: VBUS state change
> +      - description: Attach Deteach notification
> +      - description: Legacy cable detect
> +      - description: Try.Src Try.Snk state change
> +
> +  interrupt-names:
> +    items:
> +      - const: pmic-typec-or-rid-detect-change
> +      - const: pmic-typec-vpd-detect
> +      - const: pmic-typec-cc-state-change
> +      - const: pmic-typec-vconn-oc
> +      - const: pmic-typec-vbus-change
> +      - const: pmic-typec-attach-detach
> +      - const: pmic-typec-legacy-cable-detect
> +      - const: pmic-typec-try-snk-src-detect

'pmic-typec-' is redundant, drop.

> +
> +  ports:
> +    description: Remote endpoint connections
> +    $ref: /connector/usb-connector.yaml#/properties/ports

No. Why don't you have a connector node that uses all of 
usb-connector.yaml? The schemas aren't designed to pick and chose 
properties out of them (usually).

> +
> +    properties:
> +      port@0:
> +        description: Remote endpoints for the TCPM driver

What kind of h/w is a 'TCPM driver'? port 0 already has a defined 
connection in usb-connector.yaml.

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
> +    #include <dt-bindings/usb/typec/tcpm/qcom,pmic-usb-typec.h>
> +    pm8150b {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        pm8150b_typec: typec@1500 {
> +            compatible = "qcom,pm8150b-typec";
> +            reg = <0x1500>;
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +            interrupts = <0x2 0x15 PMIC_TYPEC_OR_RID_IRQ
> +                          IRQ_TYPE_EDGE_RISING>,
> +                         <0x2 0x15 PMIC_TYPEC_VPD_IRQ
> +                          IRQ_TYPE_EDGE_BOTH>,
> +                         <0x2 0x15 PMIC_TYPEC_CC_STATE_IRQ
> +                          IRQ_TYPE_EDGE_RISING>,
> +                         <0x2 0x15 PMIC_TYPEC_VCONN_OC_IRQ
> +                          IRQ_TYPE_EDGE_BOTH>,
> +                         <0x2 0x15 PMIC_TYPEC_VBUS_IRQ
> +                          IRQ_TYPE_EDGE_RISING>,
> +                         <0x2 0x15 PMIC_TYPEC_ATTACH_DETACH_IRQ
> +                          IRQ_TYPE_EDGE_RISING>,
> +                         <0x2 0x15 PMIC_TYPEC_LEGACY_CABLE_IRQ
> +                          IRQ_TYPE_EDGE_BOTH>,
> +                         <0x2 0x15 PMIC_TYPEC_TRY_SNK_SRC_IRQ
> +                          IRQ_TYPE_EDGE_RISING>;
> +            interrupt-names = "pmic-typec-or-rid-detect-change",
> +                              "pmic-typec-vpd-detect",
> +                              "pmic-typec-cc-state-change",
> +                              "pmic-typec-vconn-oc",
> +                              "pmic-typec-vbus-change",
> +                              "pmic-typec-attach-detach",
> +                              "pmic-typec-legacy-cable-detect",
> +                              "pmic-typec-try-snk-src-detect";
> +            ports {
> +                #address-cells = <1>;
> +                #size-cells = <0>;
> +
> +                port@0 {
> +                    reg = <0>;
> +                    pmic_typec: endpoint {
> +                        remote-endpoint = <&pmic_tcpm_typec>;
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
