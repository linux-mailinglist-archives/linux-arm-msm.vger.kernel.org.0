Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 015E034EAD8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Mar 2021 16:47:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231782AbhC3Oqu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 30 Mar 2021 10:46:50 -0400
Received: from mail-ot1-f43.google.com ([209.85.210.43]:38618 "EHLO
        mail-ot1-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231622AbhC3OqX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 30 Mar 2021 10:46:23 -0400
Received: by mail-ot1-f43.google.com with SMTP id w21-20020a9d63950000b02901ce7b8c45b4so15804708otk.5;
        Tue, 30 Mar 2021 07:46:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Sg9Uo8Dj6J0wrm1juVMGsGttumh4/wrUwJD8p9oUR/4=;
        b=Ms0mQo9qmNmrLrfFS9HDxBRbsGyTSb00VoIg8sheG2gLhhDwkQSGMxfJEdddkdSYyD
         DHESsEkLbekieXLjsoobpAwO/EBFSzz35Cb42DZd+uUIGOPsH3HuFYHX2ZRjWVyqn/Jx
         hCnAbT0kAriRr6iebw8UNZsuk1ctJvR83bWi/66ENTN3vKzme61x37F+jFDjVWmgroNf
         7iMHnMNX0zSQrj/GhdeyUl/HW2buDfLY9ZWPDXpr5aofYx2wHGcZewJTNGBQ9NaTUiKq
         QPk6haqXkdvVbK5ru/1Lq3OIBfSolIEau5E7U7l+zdGtafMiQ0HSJWKpPmKbZ6xIRIU3
         zEUg==
X-Gm-Message-State: AOAM532Fy3PM3nsCn9b8EPNeSf39fRxGz5Nvdj2PDVMWynzrLZ8ptzGe
        jAl5O0ZxfHLTUvGi+oHgzA==
X-Google-Smtp-Source: ABdhPJxB44Z6oh5Jbs5p1+BJSgmnu0tAG14O6bolMpgOWIneHWzFAdhdfU0J4ijg1NIp5Zv3znjiIg==
X-Received: by 2002:a05:6830:1b7a:: with SMTP id d26mr20981263ote.324.1617115582373;
        Tue, 30 Mar 2021 07:46:22 -0700 (PDT)
Received: from robh.at.kernel.org ([172.58.99.136])
        by smtp.gmail.com with ESMTPSA id h24sm5157655otg.20.2021.03.30.07.46.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Mar 2021 07:46:21 -0700 (PDT)
Received: (nullmailer pid 284298 invoked by uid 1000);
        Tue, 30 Mar 2021 14:46:15 -0000
Date:   Tue, 30 Mar 2021 09:46:15 -0500
From:   Rob Herring <robh@kernel.org>
To:     Maulik Shah <mkshah@codeaurora.org>
Cc:     swboyd@chromium.org, bjorn.andersson@linaro.org, maz@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        dianders@chromium.org, rnayak@codeaurora.org, lsrao@codeaurora.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v2] dt-bindings: interrupt-controller: Convert bindings
 to yaml for qcom,pdc
Message-ID: <20210330144615.GA278613@robh.at.kernel.org>
References: <1616409015-27682-1-git-send-email-mkshah@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1616409015-27682-1-git-send-email-mkshah@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Mar 22, 2021 at 04:00:15PM +0530, Maulik Shah wrote:
> This change converts PDC interrupt controller bindings to yaml.
> 
> Cc: devicetree@vger.kernel.org
> Signed-off-by: Maulik Shah <mkshah@codeaurora.org>
> ---
> This change depends on [1] which adds sc7280 compatible for PDC
> 
> Changes in v2:
> - Document optional PDC's GIC interface reg
> - Update example to mention optional reg.
> 
> [1] https://patchwork.kernel.org/project/linux-arm-msm/list/?series=449725
> ---
>  .../bindings/interrupt-controller/qcom,pdc.txt     | 76 -----------------
>  .../bindings/interrupt-controller/qcom,pdc.yaml    | 96 ++++++++++++++++++++++
>  2 files changed, 96 insertions(+), 76 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.txt
>  create mode 100644 Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml

> index 0000000..8b4151c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml
> @@ -0,0 +1,96 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/interrupt-controller/qcom,pdc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm Technologies, Inc. PDC interrupt controller
> +
> +maintainers:
> +  - Maulik Shah <mkshah@codeaurora.org>
> +
> +description: |
> +  Qualcomm Technologies, Inc. SoCs based on the RPM Hardened architecture have a
> +  Power Domain Controller (PDC) that is on always-on domain. In addition to
> +  providing power control for the power domains, the hardware also has an
> +  interrupt controller that can be used to help detect edge low interrupts as
> +  well detect interrupts when the GIC is non-operational.
> +
> +  GIC is parent interrupt controller at the highest level. Platform interrupt
> +  controller PDC is next in hierarchy, followed by others. Drivers requiring
> +  wakeup capabilities of their device interrupts routed through the PDC, must
> +  specify PDC as their interrupt controller and request the PDC port associated
> +  with the GIC interrupt. See example below.
> +
> +properties:
> + compatible:
> +   items:
> +     - enum:
> +        # Should contain "qcom,<soc>-pdc" and "qcom,pdc"
> +         - qcom,sc7180-pdc #For SC7180
> +         - qcom,sc7280-pdc #For SC7280
> +         - qcom,sdm845-pdc #For SDM845
> +         - qcom,sm8250-pdc #For SM8250
> +         - qcom,sm8350-pdc #For SM8350
> +     - const: qcom,pdc
> +
> + reg:
> +    description: |
> +      Specifies the base physical address for PDC hardware followed by optional
> +      PDC's GIC interface registers that need to be configured for wakeup capable
> +      GPIOs routed to the PDC.
> +    minItems: 1
> +    maxItems: 2
> +
> + '#interrupt-cells':
> +    # Specifies the number of cells needed to encode an interrupt.

That's every #interrupt-cells. No need to redefine it here.

> +    # The first element of the tuple is the PDC pin for the interrupt.
> +    # The second element is the trigger type.

'description', not a comment.

> +    const: 2
> +
> + interrupt-controller: true
> +
> + qcom,pdc-ranges:
> +   description: |
> +      Specifies the PDC pin offset and the number of PDC ports.
> +      The tuples indicates the valid mapping of valid PDC ports
> +      and their hwirq mapping.
> +   $ref: /schemas/types.yaml#/definitions/uint32-matrix
> +   items:
> +      items:

Indentation is wrong.

Is there no maximum number of entries?

> +        - description: |
> +           "a" The first element of the tuple is the starting PDC port.
> +        - description: |
> +           "b" The second element is the GIC SPI number for the PDC port.
> +        - description: |
> +           "c" The third element is the number of interrupts in sequence.
> +
> +required:
> +    - compatible
> +    - reg
> +    - '#interrupt-cells'
> +    - interrupt-controller
> +    - qcom,pdc-ranges
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    pdc: interrupt-controller@b220000 {
> +            compatible = "qcom,sdm845-pdc", "qcom,pdc";
> +            reg = <0xb220000 0x30000>, <0x17c000f0 0x60>;
> +            qcom,pdc-ranges = <0 512 94>, <94 641 15>, <115 662 7>;
> +            #interrupt-cells = <2>;
> +            interrupt-parent = <&intc>;
> +            interrupt-controller;
> +    };
> +
> +   # DT binding of a device that wants to use the GIC SPI 514 as a wakeup
> +   # interrupt, must do -
> +   # wake-device {
> +   #     interrupts-extended = <&pdc 2 IRQ_TYPE_LEVEL_HIGH>;
> +   # };
> +
> +   # In this case interrupt 514 would be mapped to port 2 on the PDC as defined
> +   # by the qcom,pdc-ranges property.
> +...
> -- 
> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
> of Code Aurora Forum, hosted by The Linux Foundation
> 
