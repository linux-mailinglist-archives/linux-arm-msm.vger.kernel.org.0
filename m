Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E8BE7429AEB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Oct 2021 03:18:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235025AbhJLBUs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 11 Oct 2021 21:20:48 -0400
Received: from mail-ot1-f42.google.com ([209.85.210.42]:44727 "EHLO
        mail-ot1-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235011AbhJLBUs (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 11 Oct 2021 21:20:48 -0400
Received: by mail-ot1-f42.google.com with SMTP id d21-20020a9d4f15000000b0054e677e0ac5so9943411otl.11;
        Mon, 11 Oct 2021 18:18:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=y5lVz6G7ywMq5owup3fQKneywv76HVGnXLAhUCly0H4=;
        b=fWbzI17EkGMCjL/5iNdM5KE/GWT+qJtqAlSFe/QhgG8CXnYK01t3WK01rd2JzWTL2s
         2eq0Q8SN0svF6hjw+xM+4SoY4lTahFNsHrjfod2lO8HpnQj2KG45gXxwd+wAMbNFlt8D
         dSiwqn26DDl7xMZMxixnmWc4HyMP8HterAq+sxdD/eTdRYKgG08KtgKzqn0/Jh2E3/3U
         nfwlsklPl61Kgde0ugGd54DGkNik4GWRbvOySMwew37KeH4xlnbjpvuUe56vOrjfpeCt
         7LrNkG94IxVUNkjMa8b++l0jyg286TG59qD2JUOBKZ5K6jQD19VePpQD8vz5kkEiszUy
         cIug==
X-Gm-Message-State: AOAM531RghkJjLbuULyiPleTXuSRXx+Xw33976JHSt6X12NO4/2KFVzg
        b23dqMMz+hDD6QoWZBMQHA==
X-Google-Smtp-Source: ABdhPJxcEcZtjZ/BJb7e/a93I5UgASlt238jlfqaza3o57t0OdsSvOXgvXfOD+CL8LBQpFXOYocjJA==
X-Received: by 2002:a9d:12b2:: with SMTP id g47mr12458408otg.227.1634001526923;
        Mon, 11 Oct 2021 18:18:46 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id 16sm1180760oty.20.2021.10.11.18.18.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Oct 2021 18:18:46 -0700 (PDT)
Received: (nullmailer pid 1531760 invoked by uid 1000);
        Tue, 12 Oct 2021 01:18:45 -0000
Date:   Mon, 11 Oct 2021 20:18:45 -0500
From:   Rob Herring <robh@kernel.org>
To:     Rakesh Pillai <pillair@codeaurora.org>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org, ohad@wizery.com,
        mathieu.poirier@linaro.org, p.zabel@pengutronix.de,
        swboyd@chromium.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        sibis@codeaurora.org, mpubbise@codeaurora.org, kuabhs@chromium.org
Subject: Re: [PATCH v6 1/3] dt-bindings: remoteproc: qcom: adsp: Convert
 binding to YAML
Message-ID: <YWTiderPG2NadfNF@robh.at.kernel.org>
References: <1633330133-29617-1-git-send-email-pillair@codeaurora.org>
 <1633330133-29617-2-git-send-email-pillair@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1633330133-29617-2-git-send-email-pillair@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Oct 04, 2021 at 12:18:51PM +0530, Rakesh Pillai wrote:
> Convert Qualcomm ADSP/CDSP Remoteproc devicetree
> binding to YAML.
> 
> Signed-off-by: Rakesh Pillai <pillair@codeaurora.org>
> ---
>  .../bindings/remoteproc/qcom,hexagon-v56.txt       | 140 -----------------
>  .../bindings/remoteproc/qcom,qcs404-cdsp-pil.yaml  | 167 +++++++++++++++++++++
>  .../bindings/remoteproc/qcom,sdm845-adsp-pil.yaml  | 160 ++++++++++++++++++++
>  3 files changed, 327 insertions(+), 140 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/remoteproc/qcom,hexagon-v56.txt
>  create mode 100644 Documentation/devicetree/bindings/remoteproc/qcom,qcs404-cdsp-pil.yaml
>  create mode 100644 Documentation/devicetree/bindings/remoteproc/qcom,sdm845-adsp-pil.yaml
> 
> diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,hexagon-v56.txt b/Documentation/devicetree/bindings/remoteproc/qcom,hexagon-v56.txt
> deleted file mode 100644
> index 1337a3d..0000000
> --- a/Documentation/devicetree/bindings/remoteproc/qcom,hexagon-v56.txt
> +++ /dev/null
> @@ -1,140 +0,0 @@
> -Qualcomm Technology Inc. Hexagon v56 Peripheral Image Loader
> -
> -This document defines the binding for a component that loads and boots firmware
> -on the Qualcomm Technology Inc. Hexagon v56 core.
> -
> -- compatible:
> -	Usage: required
> -	Value type: <string>
> -	Definition: must be one of:
> -		    "qcom,qcs404-cdsp-pil",
> -		    "qcom,sdm845-adsp-pil"
> -
> -- reg:
> -	Usage: required
> -	Value type: <prop-encoded-array>
> -	Definition: must specify the base address and size of the qdsp6ss register
> -
> -- interrupts-extended:
> -	Usage: required
> -	Value type: <prop-encoded-array>
> -	Definition: must list the watchdog, fatal IRQs ready, handover and
> -		    stop-ack IRQs
> -
> -- interrupt-names:
> -	Usage: required
> -	Value type: <stringlist>
> -	Definition: must be "wdog", "fatal", "ready", "handover", "stop-ack"
> -
> -- clocks:
> -	Usage: required
> -	Value type: <prop-encoded-array>
> -	Definition:  List of phandles and clock specifier pairs for the Hexagon,
> -		     per clock-names below.
> -
> -- clock-names:
> -	Usage: required for SDM845 ADSP
> -	Value type: <stringlist>
> -	Definition: List of clock input name strings sorted in the same
> -		    order as the clocks property. Definition must have
> -		    "xo", "sway_cbcr", "lpass_ahbs_aon_cbcr",
> -		    "lpass_ahbm_aon_cbcr", "qdsp6ss_xo", "qdsp6ss_sleep"
> -		    and "qdsp6ss_core".
> -
> -- clock-names:
> -	Usage: required for QCS404 CDSP
> -	Value type: <stringlist>
> -	Definition: List of clock input name strings sorted in the same
> -		    order as the clocks property. Definition must have
> -		    "xo", "sway", "tbu", "bimc", "ahb_aon", "q6ss_slave",
> -		    "q6ss_master", "q6_axim".
> -
> -- power-domains:
> -	Usage: required
> -	Value type: <phandle>
> -	Definition: reference to cx power domain node.
> -
> -- resets:
> -	Usage: required
> -	Value type: <phandle>
> -	Definition: reference to the list of resets for the Hexagon.
> -
> -- reset-names:
> -        Usage: required for SDM845 ADSP
> -        Value type: <stringlist>
> -        Definition: must be "pdc_sync" and "cc_lpass"
> -
> -- reset-names:
> -        Usage: required for QCS404 CDSP
> -        Value type: <stringlist>
> -        Definition: must be "restart"
> -
> -- qcom,halt-regs:
> -	Usage: required
> -	Value type: <prop-encoded-array>
> -	Definition: a phandle reference to a syscon representing TCSR followed
> -		    by the offset within syscon for Hexagon halt register.
> -
> -- memory-region:
> -	Usage: required
> -	Value type: <phandle>
> -	Definition: reference to the reserved-memory for the firmware
> -
> -- qcom,smem-states:
> -	Usage: required
> -	Value type: <phandle>
> -	Definition: reference to the smem state for requesting the Hexagon to
> -		    shut down
> -
> -- qcom,smem-state-names:
> -	Usage: required
> -	Value type: <stringlist>
> -	Definition: must be "stop"
> -
> -
> -= SUBNODES
> -The adsp node may have an subnode named "glink-edge" that describes the
> -communication edge, channels and devices related to the Hexagon.
> -See ../soc/qcom/qcom,glink.txt for details on how to describe these.
> -
> -= EXAMPLE
> -The following example describes the resources needed to boot control the
> -ADSP, as it is found on SDM845 boards.
> -
> -	remoteproc@17300000 {
> -		compatible = "qcom,sdm845-adsp-pil";
> -		reg = <0x17300000 0x40c>;
> -
> -		interrupts-extended = <&intc GIC_SPI 162 IRQ_TYPE_EDGE_RISING>,
> -			<&adsp_smp2p_in 0 IRQ_TYPE_EDGE_RISING>,
> -			<&adsp_smp2p_in 1 IRQ_TYPE_EDGE_RISING>,
> -			<&adsp_smp2p_in 2 IRQ_TYPE_EDGE_RISING>,
> -			<&adsp_smp2p_in 3 IRQ_TYPE_EDGE_RISING>;
> -		interrupt-names = "wdog", "fatal", "ready",
> -			"handover", "stop-ack";
> -
> -		clocks = <&rpmhcc RPMH_CXO_CLK>,
> -			<&gcc GCC_LPASS_SWAY_CLK>,
> -			<&lpasscc LPASS_Q6SS_AHBS_AON_CLK>,
> -			<&lpasscc LPASS_Q6SS_AHBM_AON_CLK>,
> -			<&lpasscc LPASS_QDSP6SS_XO_CLK>,
> -			<&lpasscc LPASS_QDSP6SS_SLEEP_CLK>,
> -			<&lpasscc LPASS_QDSP6SS_CORE_CLK>;
> -		clock-names = "xo", "sway_cbcr",
> -			"lpass_ahbs_aon_cbcr",
> -			"lpass_ahbm_aon_cbcr", "qdsp6ss_xo",
> -			"qdsp6ss_sleep", "qdsp6ss_core";
> -
> -		power-domains = <&rpmhpd SDM845_CX>;
> -
> -		resets = <&pdc_reset PDC_AUDIO_SYNC_RESET>,
> -			 <&aoss_reset AOSS_CC_LPASS_RESTART>;
> -		reset-names = "pdc_sync", "cc_lpass";
> -
> -		qcom,halt-regs = <&tcsr_mutex_regs 0x22000>;
> -
> -		memory-region = <&pil_adsp_mem>;
> -
> -		qcom,smem-states = <&adsp_smp2p_out 0>;
> -		qcom,smem-state-names = "stop";
> -	};
> diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,qcs404-cdsp-pil.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,qcs404-cdsp-pil.yaml
> new file mode 100644
> index 0000000..b698bb7
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/remoteproc/qcom,qcs404-cdsp-pil.yaml
> @@ -0,0 +1,167 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/remoteproc/qcom,qcs404-cdsp-pil.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm QCS404 CDSP Peripheral Image Loader
> +
> +maintainers:
> +  - Bjorn Andersson <bjorn.andersson@linaro.org>
> +
> +description:
> +  This document defines the binding for a component that loads and boots firmware
> +  on the Qualcomm Technology Inc. CDSP.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - qcom,qcs404-cdsp-pil
> +
> +  reg:
> +    maxItems: 1
> +    description:
> +      The base address and size of the qdsp6ss register
> +
> +  interrupts-extended:
> +    items:
> +      - description: Watchdog interrupt
> +      - description: Fatal interrupt
> +      - description: Ready interrupt
> +      - description: Handover interrupt
> +      - description: Stop acknowledge interrupt
> +
> +  interrupt-names:
> +    items:
> +      - const: wdog
> +      - const: fatal
> +      - const: ready
> +      - const: handover
> +      - const: stop-ack
> +
> +  clocks:
> +    items:
> +      - description: XO clock
> +      - description: SWAY clock
> +      - description: TBU clock
> +      - description: BIMC clock
> +      - description: AHB AON clock
> +      - description: Q6SS SLAVE clock
> +      - description: Q6SS MASTER clock
> +      - description: Q6 AXIM clock
> +
> +  clock-names:
> +    items:
> +      - const: xo
> +      - const: sway
> +      - const: tbu
> +      - const: bimc
> +      - const: ahb_aon
> +      - const: q6ss_slave
> +      - const: q6ss_master
> +      - const: q6_axim
> +
> +  power-domains:
> +    items:
> +      - description: CX power domain
> +
> +  resets:
> +    items:
> +      - description: AOSS restart
> +
> +  reset-names:
> +    items:
> +      - const: restart
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
> +  qcom,smem-states:
> +    $ref: /schemas/types.yaml#/definitions/phandle-array
> +    description: States used by the AP to signal the Hexagon core
> +    items:
> +      - description: Stop the modem
> +
> +  qcom,smem-state-names:
> +    $ref: /schemas/types.yaml#/definitions/string
> +    description: The names of the state bits used for SMP2P output
> +    items:
> +      - const: stop
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts-extended
> +  - interrupt-names
> +  - clocks
> +  - clock-names
> +  - power-domains
> +  - reset
> +  - reset-names
> +  - qcom,halt-regs
> +  - memory-region
> +  - qcom,smem-states
> +  - qcom,smem-state-names
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/clock/qcom,gcc-qcs404.h>
> +    #include <dt-bindings/clock/qcom,turingcc-qcs404.h>
> +    remoteproc@b00000 {
> +        compatible = "qcom,qcs404-cdsp-pas";

Doesn't match the schema.

> +        reg = <0x00b00000 0x4040>;
> +
> +        interrupts-extended = <&intc GIC_SPI 229 IRQ_TYPE_EDGE_RISING>,
> +                              <&cdsp_smp2p_in 0 IRQ_TYPE_EDGE_RISING>,
> +                              <&cdsp_smp2p_in 1 IRQ_TYPE_EDGE_RISING>,
> +                              <&cdsp_smp2p_in 2 IRQ_TYPE_EDGE_RISING>,
> +                              <&cdsp_smp2p_in 3 IRQ_TYPE_EDGE_RISING>;
> +        interrupt-names = "wdog", "fatal", "ready",
> +                          "handover", "stop-ack";
> +
> +        clocks = <&xo_board>,
> +                 <&gcc GCC_CDSP_CFG_AHB_CLK>,
> +                 <&gcc GCC_CDSP_TBU_CLK>,
> +                 <&gcc GCC_BIMC_CDSP_CLK>,
> +                 <&turingcc TURING_WRAPPER_AON_CLK>,
> +                 <&turingcc TURING_Q6SS_AHBS_AON_CLK>,
> +                 <&turingcc TURING_Q6SS_AHBM_AON_CLK>,
> +                 <&turingcc TURING_Q6SS_Q6_AXIM_CLK>;
> +        clock-names = "xo",
> +                      "sway",
> +                      "tbu",
> +                      "bimc",
> +                      "ahb_aon",
> +                      "q6ss_slave",
> +                      "q6ss_master",
> +                      "q6_axim";
> +
> +        resets = <&gcc GCC_CDSP_RESTART>;
> +        reset-names = "restart";
> +
> +        qcom,halt-regs = <&tcsr 0x19004>;
> +
> +        memory-region = <&cdsp_fw_mem>;
> +
> +        qcom,smem-states = <&cdsp_smp2p_out 0>;
> +        qcom,smem-state-names = "stop";
> +
> +        glink-edge {
> +            interrupts = <GIC_SPI 141 IRQ_TYPE_EDGE_RISING>;
> +
> +            qcom,remote-pid = <5>;
> +            mboxes = <&apcs_glb 12>;
> +
> +            label = "cdsp";
> +        };
> +    };
> diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sdm845-adsp-pil.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sdm845-adsp-pil.yaml
> new file mode 100644
> index 0000000..972671b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/remoteproc/qcom,sdm845-adsp-pil.yaml
> @@ -0,0 +1,160 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/remoteproc/qcom,sdm845-adsp-pil.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm SDM845 ADSP Peripheral Image Loader
> +
> +maintainers:
> +  - Bjorn Andersson <bjorn.andersson@linaro.org>
> +
> +description:
> +  This document defines the binding for a component that loads and boots firmware
> +  on the Qualcomm Technology Inc. ADSP.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - qcom,sdm845-adsp-pil
> +
> +  reg:
> +    maxItems: 1
> +    description:
> +      The base address and size of the qdsp6ss register
> +
> +  interrupts-extended:
> +    items:
> +      - description: Watchdog interrupt
> +      - description: Fatal interrupt
> +      - description: Ready interrupt
> +      - description: Handover interrupt
> +      - description: Stop acknowledge interrupt
> +
> +  interrupt-names:
> +    items:
> +      - const: wdog
> +      - const: fatal
> +      - const: ready
> +      - const: handover
> +      - const: stop-ack
> +
> +  clocks:
> +    items:
> +      - description: XO clock
> +      - description: SWAY clock
> +      - description: LPASS AHBS AON clock
> +      - description: LPASS AHBM AON clock
> +      - description: QDSP XO clock
> +      - description: Q6SP6SS SLEEP clock
> +      - description: Q6SP6SS CORE clock
> +
> +  clock-names:
> +    items:
> +      - const: xo
> +      - const: sway_cbcr
> +      - const: lpass_ahbs_aon_cbcr
> +      - const: lpass_ahbm_aon_cbcr
> +      - const: qdsp6ss_xo
> +      - const: qdsp6ss_sleep
> +      - const: qdsp6ss_core
> +
> +  power-domains:
> +    items:
> +      - description: CX power domain
> +
> +  resets:
> +    items:
> +      - description: PDC AUDIO SYNC RESET
> +      - description: CC LPASS restart
> +
> +  reset-names:
> +    items:
> +      - const: pdc_sync
> +      - const: cc_lpass
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
> +  qcom,smem-states:
> +    $ref: /schemas/types.yaml#/definitions/phandle-array
> +    description: States used by the AP to signal the Hexagon core
> +    items:
> +      - description: Stop the modem
> +
> +  qcom,smem-state-names:
> +    $ref: /schemas/types.yaml#/definitions/string
> +    description: The names of the state bits used for SMP2P output
> +    items:
> +      - const: stop
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts-extended
> +  - interrupt-names
> +  - clocks
> +  - clock-names
> +  - power-domains
> +  - resets
> +  - reset-names
> +  - qcom,halt-regs
> +  - memory-region
> +  - qcom,smem-states
> +  - qcom,smem-state-names
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/clock/qcom,rpmh.h>
> +    #include <dt-bindings/clock/qcom,gcc-sdm845.h>
> +    #include <dt-bindings/clock/qcom,lpass-sdm845.h>
> +    #include <dt-bindings/power/qcom-rpmpd.h>
> +    #include <dt-bindings/reset/qcom,sdm845-pdc.h>
> +    #include <dt-bindings/reset/qcom,sdm845-aoss.h>
> +    remoteproc@17300000 {
> +        compatible = "qcom,sdm845-adsp-pil";
> +        reg = <0x17300000 0x40c>;
> +
> +        interrupts-extended = <&intc GIC_SPI 162 IRQ_TYPE_EDGE_RISING>,
> +                <&adsp_smp2p_in 0 IRQ_TYPE_EDGE_RISING>,
> +                <&adsp_smp2p_in 1 IRQ_TYPE_EDGE_RISING>,
> +                <&adsp_smp2p_in 2 IRQ_TYPE_EDGE_RISING>,
> +                <&adsp_smp2p_in 3 IRQ_TYPE_EDGE_RISING>;
> +        interrupt-names = "wdog", "fatal", "ready",
> +                "handover", "stop-ack";
> +
> +        clocks = <&rpmhcc RPMH_CXO_CLK>,
> +                 <&gcc GCC_LPASS_SWAY_CLK>,
> +                 <&lpasscc LPASS_Q6SS_AHBS_AON_CLK>,
> +                 <&lpasscc LPASS_Q6SS_AHBM_AON_CLK>,
> +                 <&lpasscc LPASS_QDSP6SS_XO_CLK>,
> +                 <&lpasscc LPASS_QDSP6SS_SLEEP_CLK>,
> +                 <&lpasscc LPASS_QDSP6SS_CORE_CLK>;
> +        clock-names = "xo", "sway_cbcr",
> +                "lpass_ahbs_aon_cbcr",
> +                "lpass_ahbm_aon_cbcr", "qdsp6ss_xo",
> +                "qdsp6ss_sleep", "qdsp6ss_core";
> +
> +        power-domains = <&rpmhpd SDM845_CX>;
> +
> +        resets = <&pdc_reset PDC_AUDIO_SYNC_RESET>,
> +                 <&aoss_reset AOSS_CC_LPASS_RESTART>;
> +        reset-names = "pdc_sync", "cc_lpass";
> +
> +        qcom,halt-regs = <&tcsr_mutex_regs 0x22000>;
> +
> +        memory-region = <&pil_adsp_mem>;
> +
> +        qcom,smem-states = <&adsp_smp2p_out 0>;
> +        qcom,smem-state-names = "stop";
> +    };
> -- 
> 2.7.4
> 
> 
