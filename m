Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F0079414F13
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Sep 2021 19:29:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236865AbhIVRa1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 22 Sep 2021 13:30:27 -0400
Received: from mail.kernel.org ([198.145.29.99]:50640 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236781AbhIVRaZ (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 22 Sep 2021 13:30:25 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2074E611CA;
        Wed, 22 Sep 2021 17:28:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1632331735;
        bh=JdzZczz2PU9IvhV91njGN8OfWH5kf6JidNW6NSTd8DE=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=t4NP9fJUFdd1mpbq2c/FB57swqEkV8djdH/vm2y41D2aXhLJJV8m+bVPMRnQ7kWPZ
         gUQU7Vm5EZ+6xpg7wo1zG9CG97ZVTTVXjzAKF1+Hh0g7ERzqsF/8m3kSe+nbSnuHSD
         /A0DeMLiUiEwyZS24XkcoaQSjMCfZ/Yu7AC9KEupd/VcNHGc/3m4/32ILHlGAvh1mg
         sVhr9q0aO7WU5HLuMI5GoX/GVBLHv3chGBlqGRnk6TnWy8Mc3z94b7PXAkueRb9CXT
         Nv5kiyeoA0TOV422zfaZQPhlbNVCPOS01TfTH3N3gEzW+ODexowV3aoQBHdNkhxAhh
         Oro1pTl6SyUcw==
Received: by mail-ed1-f52.google.com with SMTP id v10so8108151edj.10;
        Wed, 22 Sep 2021 10:28:55 -0700 (PDT)
X-Gm-Message-State: AOAM531XMughGyUkCScJvckh1zw2r8caEZmbFFcgc2eQbkUvTjTuJkrV
        hB3L+2z+vTOyPNeNbIxiHjo1I9NqxzQtUfEaoA==
X-Google-Smtp-Source: ABdhPJx6zI3tzYPe4HGlu0zZgHNGUOTbgVjUD1EY4qw3tzP7wpVqzwX+U8i3dYpnQciPpYeDgWndORmcwRXOlRD6VEk=
X-Received: by 2002:a17:906:fa8a:: with SMTP id lt10mr368213ejb.320.1632331733632;
 Wed, 22 Sep 2021 10:28:53 -0700 (PDT)
MIME-Version: 1.0
References: <1631874941-5262-1-git-send-email-pillair@codeaurora.org> <1631874941-5262-2-git-send-email-pillair@codeaurora.org>
In-Reply-To: <1631874941-5262-2-git-send-email-pillair@codeaurora.org>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Wed, 22 Sep 2021 12:28:41 -0500
X-Gmail-Original-Message-ID: <CAL_Jsq+khyhbwJ5-GPZ5ZGkY4nX_obq4t92Z0V6sZH3Oyj4Fow@mail.gmail.com>
Message-ID: <CAL_Jsq+khyhbwJ5-GPZ5ZGkY4nX_obq4t92Z0V6sZH3Oyj4Fow@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] dt-bindings: remoteproc: qcom: Add SC7280 WPSS support
To:     Rakesh Pillai <pillair@codeaurora.org>
Cc:     "Gross, Andy" <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Stephen Boyd <swboyd@chromium.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        devicetree@vger.kernel.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        sibis <sibis@codeaurora.org>, mpubbise@codeaurora.org,
        kuabhs@chromium.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Sep 17, 2021 at 5:36 AM Rakesh Pillai <pillair@codeaurora.org> wrote:
>
> Add WPSS PIL loading support for SC7280 SoCs.
>
> Signed-off-by: Rakesh Pillai <pillair@codeaurora.org>
> ---
>  .../bindings/remoteproc/qcom,sc7280-wpss-pil.yaml  | 198 +++++++++++++++++++++
>  1 file changed, 198 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/remoteproc/qcom,sc7280-wpss-pil.yaml

What happened to converting the existing binding? Given you already
did that, please don't drop it.

>
> diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sc7280-wpss-pil.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sc7280-wpss-pil.yaml
> new file mode 100644
> index 0000000..896d5f47
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/remoteproc/qcom,sc7280-wpss-pil.yaml
> @@ -0,0 +1,198 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/remoteproc/qcom,sc7280-wpss-pil.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm SC7280 WPSS Peripheral Image Loader
> +
> +maintainers:
> +  - Bjorn Andersson <bjorn.andersson@linaro.org>
> +
> +description:
> +  This document defines the binding for a component that loads and boots firmware
> +  on the Qualcomm Technology Inc. WPSS.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - qcom,sc7280-wpss-pil
> +
> +  reg:
> +    maxItems: 1
> +    description:
> +      The base address and size of the qdsp6ss register
> +
> +  interrupts-extended:

Use 'interrupts'. The tooling supports either.

> +    minItems: 6

Don't need minItems unless it is less than 'items' length.

> +    items:
> +      - description: Watchdog interrupt
> +      - description: Fatal interrupt
> +      - description: Ready interrupt
> +      - description: Handover interrupt
> +      - description: Stop acknowledge interrupt
> +      - description: Shutdown acknowledge interrupt
> +
> +  interrupt-names:
> +    minItems: 6
> +    items:
> +      - const: wdog
> +      - const: fatal
> +      - const: ready
> +      - const: handover
> +      - const: stop-ack
> +      - const: shutdown-ack
> +
> +  clocks:
> +    minItems: 4
> +    items:
> +      - description: GCC WPSS AHB BDG Master clock
> +      - description: GCC WPSS AHB clock
> +      - description: GCC WPSS RSCP clock
> +      - description: XO clock
> +
> +  clock-names:
> +    minItems: 4
> +    items:
> +      - const: gcc_wpss_ahb_bdg_mst_clk
> +      - const: gcc_wpss_ahb_clk
> +      - const: gcc_wpss_rscp_clk

ahb_bdg, ahb, rscp is sufficient. Or use the same names as prior
versions (did the h/w clocks change?).

> +      - const: xo
> +
> +  power-domains:
> +    minItems: 2
> +    items:
> +      - description: CX power domain
> +      - description: MX power domain
> +
> +  power-domain-names:
> +    minItems: 2
> +    items:
> +      - const: cx
> +      - const: mx
> +
> +  resets:
> +    minItems: 2
> +    items:
> +      - description: AOSS restart
> +      - description: PDC SYNC
> +
> +  reset-names:
> +    minItems: 2
> +    items:
> +      - const: restart
> +      - const: pdc_sync
> +
> +  memory-region:
> +    maxItems: 1
> +    description: Reference to the reserved-memory for the Hexagon core
> +
> +  qcom,halt-regs:
> +    $ref: /schemas/types.yaml#/definitions/phandle-array
> +    description:
> +      Phandle reference to a syscon representing TCSR followed by the
> +      three offsets within syscon for q6, modem and nc halt registers.
> +
> +  qcom,qmp:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description: Reference to the AOSS side-channel message RAM.
> +
> +  qcom,smem-states:
> +    $ref: /schemas/types.yaml#/definitions/phandle-array
> +    description: States used by the AP to signal the Hexagon core
> +    items:
> +      - description: Stop the modem
> +
> +  qcom,smem-state-names:
> +    $ref: /schemas/types.yaml#/definitions/string-array

string or string-array?

> +    description: The names of the state bits used for SMP2P output
> +    items:
> +      - const: stop

This says only 1 entry, so 'string'.

> +
> +  glink-edge:
> +    type: object
> +    description:
> +      Qualcomm G-Link subnode which represents communication edge, channels
> +      and devices related to the ADSP.
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts-extended
> +  - interrupt-names
> +  - clocks
> +  - clock-names
> +  - power-domains
> +  - power-domain-names
> +  - reset
> +  - reset-names
> +  - qcom,halt-regs
> +  - memory-region
> +  - qcom,qmp
> +  - qcom,smem-states
> +  - qcom,smem-state-names
> +  - glink-edge
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/clock/qcom,gcc-sc7280.h>
> +    #include <dt-bindings/clock/qcom,rpmh.h>
> +    #include <dt-bindings/power/qcom-rpmpd.h>
> +    #include <dt-bindings/reset/qcom,sdm845-aoss.h>
> +    #include <dt-bindings/reset/qcom,sdm845-pdc.h>
> +    #include <dt-bindings/mailbox/qcom-ipcc.h>
> +    remoteproc@8a00000 {
> +        compatible = "qcom,sc7280-wpss-pil";
> +        reg = <0x08a00000 0x10000>;
> +
> +        interrupts-extended = <&intc GIC_SPI 587 IRQ_TYPE_EDGE_RISING>,
> +                              <&wpss_smp2p_in 0 IRQ_TYPE_EDGE_RISING>,
> +                              <&wpss_smp2p_in 1 IRQ_TYPE_EDGE_RISING>,
> +                              <&wpss_smp2p_in 2 IRQ_TYPE_EDGE_RISING>,
> +                              <&wpss_smp2p_in 3 IRQ_TYPE_EDGE_RISING>,
> +                              <&wpss_smp2p_in 7 IRQ_TYPE_EDGE_RISING>;
> +        interrupt-names = "wdog", "fatal", "ready", "handover",
> +                          "stop-ack", "shutdown-ack";
> +
> +        clocks = <&gcc GCC_WPSS_AHB_BDG_MST_CLK>,
> +                 <&gcc GCC_WPSS_AHB_CLK>,
> +                 <&gcc GCC_WPSS_RSCP_CLK>,
> +                 <&rpmhcc RPMH_CXO_CLK>;
> +        clock-names = "gcc_wpss_ahb_bdg_mst_clk",
> +                      "gcc_wpss_ahb_clk",
> +                      "gcc_wpss_rscp_clk",
> +                      "xo";
> +
> +        power-domains = <&rpmhpd SC7280_CX>,
> +                        <&rpmhpd SC7280_MX>;
> +        power-domain-names = "cx", "mx";
> +
> +        memory-region = <&wpss_mem>;
> +
> +        qcom,qmp = <&aoss_qmp>;
> +
> +        qcom,smem-states = <&wpss_smp2p_out 0>;
> +        qcom,smem-state-names = "stop";
> +
> +        resets = <&aoss_reset AOSS_CC_WCSS_RESTART>,
> +                 <&pdc_reset PDC_WPSS_SYNC_RESET>;
> +        reset-names = "restart", "pdc_sync";
> +
> +        qcom,halt-regs = <&tcsr_mutex 0x37000>;
> +
> +        status = "disabled";
> +
> +        glink-edge {
> +            interrupts-extended = <&ipcc IPCC_CLIENT_WPSS
> +                                         IPCC_MPROC_SIGNAL_GLINK_QMP
> +                                         IRQ_TYPE_EDGE_RISING>;
> +            mboxes = <&ipcc IPCC_CLIENT_WPSS
> +                            IPCC_MPROC_SIGNAL_GLINK_QMP>;
> +
> +            label = "wpss";
> +            qcom,remote-pid = <13>;
> +        };
> +    };
> --
> 2.7.4
>
