Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 960E140F241
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Sep 2021 08:24:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229474AbhIQGZd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 17 Sep 2021 02:25:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37978 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232827AbhIQGZc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 17 Sep 2021 02:25:32 -0400
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com [IPv6:2607:f8b0:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5BA73C061764
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Sep 2021 23:24:11 -0700 (PDT)
Received: by mail-oi1-x230.google.com with SMTP id u22so4370064oie.5
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Sep 2021 23:24:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=uvedJzBN/73IuBDGdWhBl3aDTDET6lrA/D9kWiWxZqk=;
        b=WdEgGhg8h9k7yZRIZzKv9DC1NPduWAMEmRoYdtJpF+0st/v1okda/Jh4LupEZMWouV
         fKRHg9NUOaWFcpno+jzFAEDA6vzPXewvHSYq943p7I+YcrL27AJLCpmkxUpS2pMhg6eU
         /VdsdZ+XoDrJ4+GqMvyqWCYHthb4dFyN5Wt5A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=uvedJzBN/73IuBDGdWhBl3aDTDET6lrA/D9kWiWxZqk=;
        b=56xqhIO8MBX9twwFFai9i/rgllZ7R8VDH5WsWDnBoSG4XQw9CiAcQOUTIxsuzKWmKV
         TAvmfZrxOmeUYCX5c3KG5Ci6kSF5lMWcPdPdAmHLWtS68ugMgV2cegwiqZd1XLpPbu1L
         HWWxWlIYZwPCxu4HotvQD49bDmLUIevyhF8ZYQ7vByLf5f1FgAFUJxZ7i7PsNr0pTLQr
         evkKnkRlkM1QIc85UKpEZN6UdjblHwZhgD2MQ4P8BP+StoqwoGCYNFUWny6zOiyZMdUm
         NHygq4uymVfVnpK9NRHQFEF6eNdTp8t6W/XN3ZjkwWNioolPH2ZY2sfZdUGTdpqzZzhT
         Xi1Q==
X-Gm-Message-State: AOAM533PGkQhuSWDjzsm6VnIuFN0K3VGBMtFqpXJPT4U67BguEk5eHZr
        rRVZj5pYAlNL6xzrTI3nrF9yBwfiab2ZFuHbxsoGCw==
X-Google-Smtp-Source: ABdhPJxZ4Ic1TvCnSL3eLZ/vOckRMNFuHjhmq9VtOO0Bo6eNg6wu0pRIWhZM/fEglRmANAvXztt7Ab5n6x3aKknQSvA=
X-Received: by 2002:aca:2310:: with SMTP id e16mr2817754oie.64.1631859850582;
 Thu, 16 Sep 2021 23:24:10 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 16 Sep 2021 23:24:10 -0700
MIME-Version: 1.0
In-Reply-To: <1631811353-503-2-git-send-email-pillair@codeaurora.org>
References: <1631811353-503-1-git-send-email-pillair@codeaurora.org> <1631811353-503-2-git-send-email-pillair@codeaurora.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Thu, 16 Sep 2021 23:24:10 -0700
Message-ID: <CAE-0n52t_1GGsFfDnrnwTx7j8RFdFLqZ2EGQY84D3UMbTeG69g@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] dt-bindings: remoteproc: qcom: adsp: Convert
 binding to YAML
To:     Rakesh Pillai <pillair@codeaurora.org>, agross@kernel.org,
        bjorn.andersson@linaro.org, mathieu.poirier@linaro.org,
        ohad@wizery.com, p.zabel@pengutronix.de, robh+dt@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, sibis@codeaurora.org,
        mpubbise@codeaurora.org, kuabhs@chromium.org,
        Rakesh Pillai <pillair@qti.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Rakesh Pillai (2021-09-16 09:55:51)
> diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,hexagon-v56.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,hexagon-v56.yaml
> new file mode 100644
> index 0000000..051da43
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/remoteproc/qcom,hexagon-v56.yaml
> @@ -0,0 +1,267 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/remoteproc/qcom,hexagon-v56.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm Hexagon v56 Peripheral Image Loader
> +
> +maintainers:
> +  - Bjorn Andersson <bjorn.andersson@linaro.org>
> +
> +description:
> +  This document defines the binding for a component that loads and boots firmware
> +  on the Qualcomm Technology Inc. Hexagon v56 core.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - qcom,qcs404-cdsp-pil
> +      - qcom,sdm845-adsp-pil
> +
> +  reg:
> +    maxItems: 1
> +    description:
> +      The base address and size of the qdsp6ss register
> +
> +  interrupts-extended:
> +    minItems: 5
> +    items:
> +      - description: Watchdog interrupt
> +      - description: Fatal interrupt
> +      - description: Ready interrupt
> +      - description: Handover interrupt
> +      - description: Stop acknowledge interrupt
> +
> +  interrupt-names:
> +    minItems: 5
> +    items:
> +      - const: wdog
> +      - const: fatal
> +      - const: ready
> +      - const: handover
> +      - const: stop-ack
> +
> +  clocks:
> +    minItems: 7
> +    maxItems: 8
> +    description:
> +      List of phandles and clock specifier pairs for the Hexagon,
> +      per clock-names below.
> +
> +  clock-names:
> +    minItems: 7
> +    maxItems: 8
> +
> +  power-domains:
> +    minItems: 1
> +    items:
> +      - description: CX power domain
> +
> +  resets:
> +    minItems: 1
> +    maxItems: 2
> +    description:
> +      reference to the list of resets for the Hexagon.
> +
> +  reset-names:
> +    minItems: 1
> +    maxItems: 2
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
> +    $ref: /schemas/types.yaml#/definitions/string-array
> +    description: The names of the state bits used for SMP2P output
> +    items:
> +      - const: stop
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
> +  - qcom,halt-regs
> +  - memory-region
> +  - qcom,smem-states
> +  - qcom,smem-state-names

Is there some way to make sure that 'resets' and 'reset-names' is
present when the compatible that defines them is used and not required
otherwise?

> +
> +additionalProperties: false
> +
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - qcom,sdm845-adsp-pil
> +    then:
> +      properties:
> +        clocks:
> +          items:
> +            - description: XO clock
> +            - description: SWAY clock
> +            - description: LPASS AHBS AON clock
> +            - description: LPASS AHBM AON clock
> +            - description: QDSP6SS XO clock
> +            - description: QDSP6SS SLEEP clock
> +            - description: QDSP6SS CORE clock
> +        clock-names:
> +          items:
> +            - const: xo
> +            - const: sway_cbcr
> +            - const: lpass_ahbs_aon_cbcr
> +            - const: lpass_ahbm_aon_cbcr
> +            - const: qdsp6ss_xo
> +            - const: qdsp6ss_sleep
> +            - const: qdsp6ss_core
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - qcom,qcs404-cdsp-pil
> +    then:
> +      properties:
> +        clocks:
> +          items:
> +            - description: XO clock
> +            - description: SWAY clock
> +            - description: TBU clock
> +            - description: BIMC clock
> +            - description: AHB AON clock
> +            - description: Q6SS SLAVE clock
> +            - description: Q6SS MASTER clock
> +            - description: Q6 AXIM clock
> +        clock-names:
> +          items:
> +            - const: xo
> +            - const: sway
> +            - const: tbu
> +            - const: bimc
> +            - const: ahb_aon
> +            - const: q6ss_slave
> +            - const: q6ss_master
> +            - const: q6_axim
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - qcom,sc7280-wpss-pil

This should be documented above in the compatible list?

> +    then:
> +      properties:
> +        clocks:
> +          items:
> +            - description: GCC WPSS AHB BDG Master clock
> +            - description: GCC WPSS AHB clock
> +            - description: GCC WPSS RSCP clock
> +        clock-names:
> +          items:
> +            - const: gcc_wpss_ahb_bdg_mst_clk
> +            - const: gcc_wpss_ahb_clk
> +            - const: gcc_wpss_rscp_clk

Is the 'gcc_wpss' prefix important? It would be shorter if it wasn't
there.

> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - qcom,sdm845-adsp-pil
> +    then:
> +      properties:
> +        resets:
> +          items:
> +            - description: PDC SYNC
> +            - description: CC LPASS
> +        reset-names:
> +          items:
> +            - const: pdc_sync
> +            - const: cc_lpass
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - qcom,qcs404-cdsp-pil
> +    then:
> +      properties:
> +        resets:
> +          items:
> +            - description: CDSP restart
> +        reset-names:
> +          items:
> +            - const: restart
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

Should there be two more examples for the other compatible strings here?
