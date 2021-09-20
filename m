Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9FBB5412A70
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Sep 2021 03:39:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232747AbhIUBlJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 20 Sep 2021 21:41:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58824 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232463AbhIUBjh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 20 Sep 2021 21:39:37 -0400
Received: from mail-oi1-x236.google.com (mail-oi1-x236.google.com [IPv6:2607:f8b0:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 24A4AC0430F7
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Sep 2021 12:58:41 -0700 (PDT)
Received: by mail-oi1-x236.google.com with SMTP id r26so26405799oij.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Sep 2021 12:58:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=toGGPc78rjvLB9UI1WfrXwBK5AN2C5VCMliWiU+RcDU=;
        b=Qrit0zvV//nZf3NId7JHAJ38BlR9DjmdaYNdXPT/bJMvdcOctWii0xp8LME3mQCxCN
         KmSnJpHBhY9CSq/OeKBFRlLf9w4/lBu379XNuPtg7XZXEo8ZtH+eSy2OlSp+Wa1U0veV
         xtnMgFjwF9RByxBLN9CLAtPLda/MDhxV2Zf90=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=toGGPc78rjvLB9UI1WfrXwBK5AN2C5VCMliWiU+RcDU=;
        b=aHpJoAVUodo2NnjtSOOfYAutpN73AgoIeV2bYUJHhwfJiSotiJHZn0YJqA3Pyru3sl
         cL2/teg976yQwT7c1TLWOjRWXUsqzymmsqeFjJfJvDh3lCGyS3hirl+D1rz+jhvlWfLi
         sU4Iy/6wqwmvZAD2rcF0n43XVR8j7keSQO88bu8jo53jaCwrK/6AjyX2lbwaB7ndAiM6
         ZarrHmlsR7ur+WDcJrc0n3qIoKDYFpyukvLl8/am9o2B/hsz3M2WsOFitW4tltJAby4m
         0CB4BLtswoNSs031rECZ7FuRwXd+zBYAIzu5v7vwnv0iYHHL9wHONYFW5n+cZddXEE8F
         yRdw==
X-Gm-Message-State: AOAM530NKBPdYeNIZJuBt9gFtiU+EFZpAsBsOh98BE/rB89eGh0LZudZ
        lTDxRYv6iwQrZm+tU0Ji5VykJ5Gq0smSuTfPvSmtbw==
X-Google-Smtp-Source: ABdhPJx1OgbmfBeMiFF1dVRkp9K5nbg4M6BdwdruNCWQzhpDTE/2jmVAR3WHqBCJNuGIb2Q1FvltK6jwh0u7TWrg/YA=
X-Received: by 2002:aca:3110:: with SMTP id x16mr670143oix.64.1632167920537;
 Mon, 20 Sep 2021 12:58:40 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 20 Sep 2021 12:58:40 -0700
MIME-Version: 1.0
In-Reply-To: <1631874941-5262-2-git-send-email-pillair@codeaurora.org>
References: <1631874941-5262-1-git-send-email-pillair@codeaurora.org> <1631874941-5262-2-git-send-email-pillair@codeaurora.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Mon, 20 Sep 2021 12:58:40 -0700
Message-ID: <CAE-0n51QYB+Y7f5Xx7efU76n=4SXdNC689FeAbtKe-UrBtXU7g@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] dt-bindings: remoteproc: qcom: Add SC7280 WPSS support
To:     Rakesh Pillai <pillair@codeaurora.org>, agross@kernel.org,
        bjorn.andersson@linaro.org, mathieu.poirier@linaro.org,
        ohad@wizery.com, p.zabel@pengutronix.de, robh+dt@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, sibis@codeaurora.org,
        mpubbise@codeaurora.org, kuabhs@chromium.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Rakesh Pillai (2021-09-17 03:35:40)
> Add WPSS PIL loading support for SC7280 SoCs.
>
> Signed-off-by: Rakesh Pillai <pillair@codeaurora.org>
> ---
>  .../bindings/remoteproc/qcom,sc7280-wpss-pil.yaml  | 198 +++++++++++++++++++++
>  1 file changed, 198 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/remoteproc/qcom,sc7280-wpss-pil.yaml
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

Maybe spell out WPSS so we know what the acronym means?

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
> +    minItems: 6
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
> +    description: The names of the state bits used for SMP2P output
> +    items:
> +      - const: stop
> +
> +  glink-edge:
> +    type: object
> +    description:
> +      Qualcomm G-Link subnode which represents communication edge, channels
> +      and devices related to the ADSP.

Are there any required properties of glink-edge? Or an empty node is all
that's required? Maybe there's a binding that can be referenced here
that describes the required properties?

> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts-extended
> +  - interrupt-names

Why is interrupt-names required?

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

Can we remove status = "disabled" from the example? It provides no
value.

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
