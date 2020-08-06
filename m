Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 480A823DEB4
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Aug 2020 19:29:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728677AbgHFR3B (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 6 Aug 2020 13:29:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44964 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729341AbgHFRA4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 6 Aug 2020 13:00:56 -0400
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E1B7C0F26C3;
        Thu,  6 Aug 2020 08:46:19 -0700 (PDT)
Received: by mail-pg1-x542.google.com with SMTP id g33so9550396pgb.4;
        Thu, 06 Aug 2020 08:46:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=xkd1MgDmKSnQMagegnqbBq4Ybb77vBr+wvZf4lFVvT8=;
        b=GFUhZAal0eiMEDTGGlyqGHbjbyOBsk79KdmmuW6NuFP+pe69wZTcP+I1DnjXluHB2i
         n+GGXX62gU2A59XB1CmLZ4sUOY44lwqEc/xXD/8qFPENoTVa1PEtWiNIQjd+g8UJ7X6x
         /TXpBguELwja3XCz4oPoLpqHXpG2lQV6I8tF0cP8KqQ+Ap7i9YgboA6uyByGxXh6uX+k
         qcwr12KRKZdva0jI3PDmJ/YU/UgEVEwUW2/FPfvOPhyLVSl1q3xb1NS2CvDgwy8ZwbV9
         IJWPwYag9/bMI9B2bGRSat0RwRx29KmTGgzZ7LtC0u86udnMaqJzUt+47q5GoJr4dUyM
         Dewg==
X-Gm-Message-State: AOAM5306LI74mjVJrMRaUa0n+P36xADkFz9nbN+I+sCMiQu9J21G7i9x
        5SZ2l62WKTgTPO2nzMBSk2hpw0k=
X-Google-Smtp-Source: ABdhPJzo9OMzbx/duXxuwBxnWu2UK7KN01S4fbrj4N+yyrFXn8/CfTlaq0Z2ZwMY4KynL3zTy6rE9A==
X-Received: by 2002:a92:9e48:: with SMTP id q69mr3142136ili.170.1596724149920;
        Thu, 06 Aug 2020 07:29:09 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
        by smtp.gmail.com with ESMTPSA id q16sm4050392ile.22.2020.08.06.07.29.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2020 07:29:09 -0700 (PDT)
Received: (nullmailer pid 805944 invoked by uid 1000);
        Thu, 06 Aug 2020 14:29:06 -0000
Date:   Thu, 6 Aug 2020 08:29:06 -0600
From:   Rob Herring <robh@kernel.org>
To:     Wesley Cheng <wcheng@codeaurora.org>
Cc:     heikki.krogerus@linux.intel.com, gregkh@linuxfoundation.org,
        agross@kernel.org, bjorn.andersson@linaro.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        jackp@codeaurora.org, sboyd@kernel.org
Subject: Re: [PATCH v7 2/4] dt-bindings: usb: Add Qualcomm PMIC type C
 controller dt-binding
Message-ID: <20200806142906.GA796067@bogus>
References: <20200804004523.7964-1-wcheng@codeaurora.org>
 <20200804004523.7964-3-wcheng@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200804004523.7964-3-wcheng@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Aug 03, 2020 at 05:45:21PM -0700, Wesley Cheng wrote:
> Introduce the dt-binding for enabling USB type C orientation and role
> detection using the PM8150B.  The driver will be responsible for receiving
> the interrupt at a state change on the CC lines, reading the
> orientation/role, and communicating this information to the remote
> clients, which can include a role switch node and a type C switch.
> 
> Signed-off-by: Wesley Cheng <wcheng@codeaurora.org>
> ---
>  .../bindings/usb/qcom,pmic-typec.yaml         | 131 ++++++++++++++++++
>  1 file changed, 131 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/usb/qcom,pmic-typec.yaml
> 
> diff --git a/Documentation/devicetree/bindings/usb/qcom,pmic-typec.yaml b/Documentation/devicetree/bindings/usb/qcom,pmic-typec.yaml
> new file mode 100644
> index 000000000000..877e979f413f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/usb/qcom,pmic-typec.yaml
> @@ -0,0 +1,131 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: "http://devicetree.org/schemas/usb/qcom,pmic-typec.yaml#"
> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +
> +title: Qualcomm PMIC based USB type C Detection Driver
> +
> +maintainers:
> +  - Wesley Cheng <wcheng@codeaurora.org>
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
> +    maxItems: 1
> +    description: CC change interrupt from PMIC
> +
> +  connector:
> +    description: Connector type for remote endpoints
> +    type: object
> +
> +    properties:
> +      compatible:
> +        $ref: /schemas/connector/usb-connector.yaml#/properties/compatible

usb-connector.yaml should be referenced from 'connector'.

> +        enum:
> +          - usb-c-connector
> +
> +      power-role:
> +        $ref: /schemas/connector/usb-connector.yaml#/properties/power-role
> +        enum:
> +         - dual
> +         - source
> +         - sink

Just 'power-role: true' is enough as this is the same set of possible 
values.

> +
> +      data-role:
> +        $ref: /schemas/connector/usb-connector.yaml#/properties/data-role
> +        enum:
> +          - dual
> +          - host
> +          - device

Same here

> +
> +      ports:
> +        description: Remote endpoint connections
> +        type: object
> +        $ref: /schemas/connector/usb-connector.yaml#/properties/ports
> +
> +        properties:
> +          port@0:
> +            description: Remote endpoints for the High Speed path
> +            type: object
> +
> +          port@1:
> +            description: Remote endpoints for the Super Speed path
> +            type: object
> +
> +            properties:
> +              endpoint@0:
> +                description: Connection to USB type C mux node
> +                type: object
> +
> +                properties:
> +                  remote-endpoint:
> +                    description: Node reference to the type C mux

You don't need to describe 'remote-endpoint'. You can assume that is 
defined in a common graph schema (to be written).

> +
> +              endpoint@1:
> +                description: Connection to role switch node
> +                type: object
> +
> +                properties:
> +                  remote-endpoint:
> +                    description: Node reference to the role switch node
> +
> +    required:
> +      - compatible
> +
> +required:
> +  - compatible
> +  - interrupts
> +  - connector
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    pm8150b {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +        pm8150b_typec: typec@1500 {
> +            compatible = "qcom,pm8150b-usb-typec";
> +            reg = <0x1500>;
> +            interrupts = <0x2 0x15 0x5 IRQ_TYPE_EDGE_RISING>;
> +
> +            connector {
> +                compatible = "usb-c-connector";
> +                power-role = "dual";
> +                data-role = "dual";
> +                ports {
> +                    #address-cells = <1>;
> +                    #size-cells = <0>;
> +                    port@0 {
> +                        reg = <0>;
> +                    };
> +                    port@1 {
> +                        reg = <1>;
> +                        #address-cells = <1>;
> +                        #size-cells = <0>;
> +                        usb3_data_ss: endpoint@0 {
> +                            reg = <0>;
> +                            remote-endpoint = <&qmp_ss_mux>;
> +                        };
> +                        usb3_role: endpoint@1 {
> +                            reg = <1>;
> +                            remote-endpoint = <&dwc3_drd_switch>;
> +                        };
> +                    };
> +                };
> +            };
> +        };
> +    };
> +...
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
> 
