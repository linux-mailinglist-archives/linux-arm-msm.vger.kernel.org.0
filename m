Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 25E09242DA8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Aug 2020 18:50:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726632AbgHLQuT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 12 Aug 2020 12:50:19 -0400
Received: from mail-il1-f195.google.com ([209.85.166.195]:42670 "EHLO
        mail-il1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726477AbgHLQuQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 12 Aug 2020 12:50:16 -0400
Received: by mail-il1-f195.google.com with SMTP id t13so2413627ile.9;
        Wed, 12 Aug 2020 09:50:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=KmvUj2RP7x0iUw9ISiD5fI86GqOa49uHPsePtr35WU0=;
        b=AL69Mh3naWZPoTVoLPHFFynmuA8U9BGTDVLZwZJrLkmJOJ44XcWDqKOF02M+bemgdR
         8rKYwrjtpi4HapWU7hUY0Mmu5rCsiKMk6rUE8/RugUcNsOwxMtAINwkI5VIh7rtKVZX6
         ti1idxP9cpxWKMJc+9Z63GHKkFCfW/VISPEom0qopsQm5FeVnxOfFcl0lU3G0YRaIt1t
         TuwJ93fERmnDqh/2ZbL/HQhq2HoEYUjzuikrHAPLflj3Ib3lmUy6c+iDu5xvaF3G5Ej5
         Ex49WQbkl7GQiNyJxWUWGNWE8zCXsqC4VuGAuvbsE2RR9mcA/9IBLdI3+xpauT9gH2TU
         nmUw==
X-Gm-Message-State: AOAM530vP51McZKmbHiSRdnkusTFV9cJ7G7aB/AfhVQXnMsUEC2Ry4vc
        TSXZnIim4lWV1DuoZMz8fOMURzc=
X-Google-Smtp-Source: ABdhPJyI0fKv0GoWsmRN7cXoaELouq5hh1WCI3bN8WWY04GIyX6iIVnHbkDaStL9MkOkPBFTHevxyw==
X-Received: by 2002:a92:ad01:: with SMTP id w1mr542083ilh.301.1597251015120;
        Wed, 12 Aug 2020 09:50:15 -0700 (PDT)
Received: from xps15 ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id u62sm1345653ilc.87.2020.08.12.09.50.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2020 09:50:13 -0700 (PDT)
Received: (nullmailer pid 2356437 invoked by uid 1000);
        Wed, 12 Aug 2020 16:50:12 -0000
Date:   Wed, 12 Aug 2020 10:50:12 -0600
From:   Rob Herring <robh@kernel.org>
To:     Wesley Cheng <wcheng@codeaurora.org>
Cc:     sboyd@kernel.org, heikki.krogerus@linux.intel.com,
        agross@kernel.org, gregkh@linuxfoundation.org,
        bjorn.andersson@linaro.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH v8 2/4] dt-bindings: usb: Add Qualcomm PMIC type C
 controller dt-binding
Message-ID: <20200812165012.GA2350307@bogus>
References: <20200812071925.315-1-wcheng@codeaurora.org>
 <20200812071925.315-3-wcheng@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200812071925.315-3-wcheng@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Aug 12, 2020 at 12:19:23AM -0700, Wesley Cheng wrote:
> Introduce the dt-binding for enabling USB type C orientation and role
> detection using the PM8150B.  The driver will be responsible for receiving
> the interrupt at a state change on the CC lines, reading the
> orientation/role, and communicating this information to the remote
> clients, which can include a role switch node and a type C switch.
> 
> Signed-off-by: Wesley Cheng <wcheng@codeaurora.org>
> ---
>  .../bindings/usb/qcom,pmic-typec.yaml         | 112 ++++++++++++++++++
>  1 file changed, 112 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/usb/qcom,pmic-typec.yaml
> 
> diff --git a/Documentation/devicetree/bindings/usb/qcom,pmic-typec.yaml b/Documentation/devicetree/bindings/usb/qcom,pmic-typec.yaml
> new file mode 100644
> index 000000000000..d5173f88d429
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/usb/qcom,pmic-typec.yaml
> @@ -0,0 +1,112 @@
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
> +        $ref: /connector/usb-connector.yaml#/properties/compatible

Still wrong. As I said in v7, under 'connector':

       $ref:  /connector/usb-connector.yaml#

And drop all these references.

> +        enum:
> +          - usb-c-connector
> +
> +      power-role: true
> +      data-role: true
> +
> +      ports:
> +        description: Remote endpoint connections
> +        type: object
> +        $ref: /connector/usb-connector.yaml#/properties/ports
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
> +              endpoint@1:
> +                description: Connection to role switch node
> +                type: object
> +
> +    required:
> +      - compatible
> +
> +required:
> +  - compatible
> +  - interrupts
> +  - connector

'reg' not required?

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
