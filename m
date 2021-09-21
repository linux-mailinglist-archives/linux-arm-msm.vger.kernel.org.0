Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 54E58413E02
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Sep 2021 01:28:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230155AbhIUXaM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 21 Sep 2021 19:30:12 -0400
Received: from mail-oi1-f170.google.com ([209.85.167.170]:37434 "EHLO
        mail-oi1-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230075AbhIUXaM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 21 Sep 2021 19:30:12 -0400
Received: by mail-oi1-f170.google.com with SMTP id w206so1664585oiw.4;
        Tue, 21 Sep 2021 16:28:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=mX4MyVarQHbsDS0fNboD+/UTeSysNDkSYI8gpVmRhho=;
        b=UjNc0TZruiP1OlH5S7MYt5aTAn455/zeF9Lo9R0tx/nd9T9bXaD2HEYNIpJzPgoqWO
         uqWCa7TjO9lU4d8VIai0A6fMVAFqzDneINMEJbUlj5QisLflUscw48noCuhWqLzncRHM
         priPc5aY10dYwkLM+Y9XAAqovJQWOddN4MrsShBdlQ4wPV4YGCkSJdVPUBCrvKvFG+vN
         KkvJLOM7xN79hlLL02nXh8nijhXg1sgji/UatoDSVnUNr4u19690qE0jBge5CCUVTxNG
         BafmmbhpVFvkI5kAVpwIthnAhS6uEyhhcRlu3EKErjskZTlyEdQJCbepUHvPzhJuVJnO
         XotA==
X-Gm-Message-State: AOAM532/Upper8bHeD+1zNqu5c48C6EC8g07zyEBrUdUZGhgcmVBCb3Y
        X2dxbSPYmUVUQD5HZbWs7w==
X-Google-Smtp-Source: ABdhPJzm9I2oIccwmAK23kHxFcQ3g5TOILqQ06YApuPouuQc3JzPm7k0LC5fRK5xJ+R+Bcem6eUglA==
X-Received: by 2002:a05:6808:690:: with SMTP id k16mr5826558oig.43.1632266923035;
        Tue, 21 Sep 2021 16:28:43 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id v14sm125678ook.2.2021.09.21.16.28.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Sep 2021 16:28:42 -0700 (PDT)
Received: (nullmailer pid 3490436 invoked by uid 1000);
        Tue, 21 Sep 2021 23:28:41 -0000
Date:   Tue, 21 Sep 2021 18:28:41 -0500
From:   Rob Herring <robh@kernel.org>
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Rakesh Pillai <pillair@codeaurora.org>, agross@kernel.org,
        bjorn.andersson@linaro.org, mathieu.poirier@linaro.org,
        ohad@wizery.com, p.zabel@pengutronix.de,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, sibis@codeaurora.org,
        mpubbise@codeaurora.org, kuabhs@chromium.org,
        Rakesh Pillai <pillair@qti.qualcomm.com>
Subject: Re: [PATCH v3 1/3] dt-bindings: remoteproc: qcom: adsp: Convert
 binding to YAML
Message-ID: <YUpqqezV3NYCihdE@robh.at.kernel.org>
References: <1631811353-503-1-git-send-email-pillair@codeaurora.org>
 <1631811353-503-2-git-send-email-pillair@codeaurora.org>
 <CAE-0n52t_1GGsFfDnrnwTx7j8RFdFLqZ2EGQY84D3UMbTeG69g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAE-0n52t_1GGsFfDnrnwTx7j8RFdFLqZ2EGQY84D3UMbTeG69g@mail.gmail.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Sep 16, 2021 at 11:24:10PM -0700, Stephen Boyd wrote:
> Quoting Rakesh Pillai (2021-09-16 09:55:51)
> > diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,hexagon-v56.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,hexagon-v56.yaml
> > new file mode 100644
> > index 0000000..051da43
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/remoteproc/qcom,hexagon-v56.yaml
> > @@ -0,0 +1,267 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/remoteproc/qcom,hexagon-v56.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Qualcomm Hexagon v56 Peripheral Image Loader
> > +
> > +maintainers:
> > +  - Bjorn Andersson <bjorn.andersson@linaro.org>
> > +
> > +description:
> > +  This document defines the binding for a component that loads and boots firmware
> > +  on the Qualcomm Technology Inc. Hexagon v56 core.
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - qcom,qcs404-cdsp-pil
> > +      - qcom,sdm845-adsp-pil
> > +
> > +  reg:
> > +    maxItems: 1
> > +    description:
> > +      The base address and size of the qdsp6ss register
> > +
> > +  interrupts-extended:
> > +    minItems: 5
> > +    items:
> > +      - description: Watchdog interrupt
> > +      - description: Fatal interrupt
> > +      - description: Ready interrupt
> > +      - description: Handover interrupt
> > +      - description: Stop acknowledge interrupt
> > +
> > +  interrupt-names:
> > +    minItems: 5
> > +    items:
> > +      - const: wdog
> > +      - const: fatal
> > +      - const: ready
> > +      - const: handover
> > +      - const: stop-ack
> > +
> > +  clocks:
> > +    minItems: 7
> > +    maxItems: 8
> > +    description:
> > +      List of phandles and clock specifier pairs for the Hexagon,
> > +      per clock-names below.
> > +
> > +  clock-names:
> > +    minItems: 7
> > +    maxItems: 8
> > +
> > +  power-domains:
> > +    minItems: 1
> > +    items:
> > +      - description: CX power domain
> > +
> > +  resets:
> > +    minItems: 1
> > +    maxItems: 2
> > +    description:
> > +      reference to the list of resets for the Hexagon.
> > +
> > +  reset-names:
> > +    minItems: 1
> > +    maxItems: 2
> > +
> > +  memory-region:
> > +    maxItems: 1
> > +    description: Reference to the reserved-memory for the Hexagon core
> > +
> > +  qcom,halt-regs:
> > +    $ref: /schemas/types.yaml#/definitions/phandle-array
> > +    description:
> > +      Phandle reference to a syscon representing TCSR followed by the
> > +      three offsets within syscon for q6, modem and nc halt registers.
> > +
> > +  qcom,smem-states:
> > +    $ref: /schemas/types.yaml#/definitions/phandle-array
> > +    description: States used by the AP to signal the Hexagon core
> > +    items:
> > +      - description: Stop the modem
> > +
> > +  qcom,smem-state-names:
> > +    $ref: /schemas/types.yaml#/definitions/string-array
> > +    description: The names of the state bits used for SMP2P output
> > +    items:
> > +      - const: stop
> > +
> > +  glink-edge:
> > +    type: object
> > +    description:
> > +      Qualcomm G-Link subnode which represents communication edge, channels
> > +      and devices related to the ADSP.
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - interrupts-extended
> > +  - interrupt-names
> > +  - clocks
> > +  - clock-names
> > +  - power-domains
> > +  - qcom,halt-regs
> > +  - memory-region
> > +  - qcom,smem-states
> > +  - qcom,smem-state-names
> 
> Is there some way to make sure that 'resets' and 'reset-names' is
> present when the compatible that defines them is used and not required
> otherwise?

Yes, plenty of examples of that.

> 
> > +
> > +additionalProperties: false
> > +
> > +allOf:
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            enum:
> > +              - qcom,sdm845-adsp-pil
> > +    then:
> > +      properties:
> > +        clocks:
> > +          items:
> > +            - description: XO clock
> > +            - description: SWAY clock
> > +            - description: LPASS AHBS AON clock
> > +            - description: LPASS AHBM AON clock
> > +            - description: QDSP6SS XO clock
> > +            - description: QDSP6SS SLEEP clock
> > +            - description: QDSP6SS CORE clock
> > +        clock-names:
> > +          items:
> > +            - const: xo
> > +            - const: sway_cbcr
> > +            - const: lpass_ahbs_aon_cbcr
> > +            - const: lpass_ahbm_aon_cbcr
> > +            - const: qdsp6ss_xo
> > +            - const: qdsp6ss_sleep
> > +            - const: qdsp6ss_core
> > +
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            enum:
> > +              - qcom,qcs404-cdsp-pil
> > +    then:
> > +      properties:
> > +        clocks:
> > +          items:
> > +            - description: XO clock
> > +            - description: SWAY clock
> > +            - description: TBU clock
> > +            - description: BIMC clock
> > +            - description: AHB AON clock
> > +            - description: Q6SS SLAVE clock
> > +            - description: Q6SS MASTER clock
> > +            - description: Q6 AXIM clock
> > +        clock-names:
> > +          items:
> > +            - const: xo
> > +            - const: sway
> > +            - const: tbu
> > +            - const: bimc
> > +            - const: ahb_aon
> > +            - const: q6ss_slave
> > +            - const: q6ss_master
> > +            - const: q6_axim
> > +
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            enum:
> > +              - qcom,sc7280-wpss-pil
> 
> This should be documented above in the compatible list?
> 
> > +    then:
> > +      properties:
> > +        clocks:
> > +          items:
> > +            - description: GCC WPSS AHB BDG Master clock
> > +            - description: GCC WPSS AHB clock
> > +            - description: GCC WPSS RSCP clock
> > +        clock-names:
> > +          items:
> > +            - const: gcc_wpss_ahb_bdg_mst_clk
> > +            - const: gcc_wpss_ahb_clk
> > +            - const: gcc_wpss_rscp_clk
> 
> Is the 'gcc_wpss' prefix important? It would be shorter if it wasn't
> there.

Yes, and adding this new platform should be a separate patch.

Rob
