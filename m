Return-Path: <linux-arm-msm+bounces-79466-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E9AAC1AD49
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Oct 2025 14:41:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 816325A38CD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Oct 2025 13:25:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0B922D8DA6;
	Wed, 29 Oct 2025 13:22:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Pb0Fggjm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F5D32D63FC;
	Wed, 29 Oct 2025 13:22:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761744134; cv=none; b=JL8ZWXyJtEr8n2VcmY94URVu36INP6oCyx5npXpissfqjrJEoK9Bxsf/itYbhyHhZYx9cWJfyZFfLJj4y/VeYHuzKn4F5i4MwNcbBdsiCA7GBlKXOnRFVcwaylQphREdnMS1Vbe0AA/KF3/EZLQvg09ojQaO/wB9o/vSvG23cHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761744134; c=relaxed/simple;
	bh=dksurn2Zyj1v1QRVjbcMWup8hwJVLLosZUHH7lCpAAw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qhTBQSU9cfdyvExtyaq/XgJnKAHLd7P1AfuNcoB9TB1ibzFdFlPgFvwngBFEH1a66uwDZH3sr9S0thH2eW1tzchVc8LrUbmth2bCrX2jjIfq1fpp5bui5+YAHXDWl5agLM6zb5uuAZhzHIo9NxLZzJkdeVFqm0+z2/ebWHaK8pw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Pb0Fggjm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB954C4CEF7;
	Wed, 29 Oct 2025 13:22:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761744134;
	bh=dksurn2Zyj1v1QRVjbcMWup8hwJVLLosZUHH7lCpAAw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Pb0FggjmE6SQJcgQbdY4cGWQg+JdplqPCOhJBVsAZqREpW6i+dQZmraxw16JEtqEr
	 RystfgNR5IjDlnnTDD9TT9xVMuK3bIaRq2d+vB7A1Aa/PYdHRrw3ASNXCQ8F6Jte0s
	 2s8ah4p8n7UWckh1ohibTDG4JJwBHkHtmrhG0mcKto052wKJu3Vw4jqLqFLbvEVEoi
	 F3nJFTQH6Uvk5qt8rKNDSnvtV8M4UDQ36B7WrE2/JtS+BgkeEtpfxnFaEsy7PZrol7
	 Ofyj5IwCeiZrOEnsXwSRd792bkKuZPP8eV72N45iW4fDPTga0h7dRNz6xuSSm4o3PY
	 15dJX+HCd+Tyg==
Date: Wed, 29 Oct 2025 08:22:12 -0500
From: Rob Herring <robh@kernel.org>
To: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>, aiqun.yu@oss.qualcomm.com,
	tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
	yijie.yang@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Subject: Re: [PATCH v2 3/7] dt-bindings: remoteproc: qcom,pas: Document pas
 for SoCCP on Kaanapali and Glymur platforms
Message-ID: <20251029132212.GA662078-robh@kernel.org>
References: <20251029-knp-remoteproc-v2-0-6c81993b52ea@oss.qualcomm.com>
 <20251029-knp-remoteproc-v2-3-6c81993b52ea@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251029-knp-remoteproc-v2-3-6c81993b52ea@oss.qualcomm.com>

On Wed, Oct 29, 2025 at 01:05:41AM -0700, Jingyi Wang wrote:
> Document the component used to boot SoCCP on Kaanapali SoC and add
> compatible for Glymur SoCCP which could fallback to Kaanapali. Extend
> the "qcom,smem-states" and "qcom,smem-state-names" properties and
> add conditions for the "interrupts" and "interrupt-names" properties
> in the pas-common.
> 
> Co-developed-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
> Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> ---
>  .../remoteproc/qcom,kaanapali-soccp-pas.yaml       | 134 +++++++++++++++++++++
>  .../bindings/remoteproc/qcom,pas-common.yaml       |  83 +++++++++----
>  2 files changed, 194 insertions(+), 23 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,kaanapali-soccp-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,kaanapali-soccp-pas.yaml
> new file mode 100644
> index 000000000000..6b53121eede1
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/remoteproc/qcom,kaanapali-soccp-pas.yaml
> @@ -0,0 +1,134 @@
> +# SPDX-License-Identifier: GPL-2.0 OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/remoteproc/qcom,kaanapali-soccp-pas.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm Kaanapali SoCCP Peripheral Authentication Service
> +
> +maintainers:
> +  - Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> +
> +description:
> +  The SoC Control Processor (SoCCP) is small RISC-V MCU that controls USB
> +  Type-C, battery charging and various other functions on Qualcomm SoCs, somewhat
> +  analogous to traditional PC Embedded Controllers. This document describes
> +  the Peripheral Authentication Service loads and boots firmware for SoCCP.
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - items:
> +          - enum:
> +              - qcom,glymur-soccp-pas
> +          - const: qcom,kaanapali-soccp-pas
> +      - enum:
> +          - qcom,kaanapali-soccp-pas
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: XO clock
> +
> +  clock-names:
> +    items:
> +      - const: xo
> +
> +  power-domains:
> +    items:
> +      - description: CX power domain
> +      - description: MX power domain
> +
> +  power-domain-names:
> +    items:
> +      - const: cx
> +      - const: mx
> +
> +  firmware-name:
> +    $ref: /schemas/types.yaml#/definitions/string-array

Already has a type. Drop.

> +    items:
> +      - description: Firmware name of the Hexagon core
> +      - description: Firmware name of the Hexagon Devicetree
> +
> +  memory-region:
> +    items:
> +      - description: Memory region for main Firmware authentication
> +      - description: Memory region for Devicetree Firmware authentication
> +
> +required:
> +  - compatible
> +  - reg
> +  - memory-region
> +  - power-domains
> +  - power-domain-names
> +
> +allOf:
> +  - $ref: /schemas/remoteproc/qcom,pas-common.yaml#
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/qcom,rpmh.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    #include <dt-bindings/mailbox/qcom-ipcc.h>
> +    #include <dt-bindings/power/qcom-rpmpd.h>
> +
> +    remoteproc@d00000 {
> +        compatible = "qcom,kaanapali-soccp-pas";
> +        reg = <0x00d00000 0x200000>;
> +
> +        clocks = <&rpmhcc RPMH_CXO_CLK>;
> +        clock-names = "xo";
> +
> +        interrupts-extended = <&intc GIC_SPI 167 IRQ_TYPE_EDGE_RISING>,
> +                              <&soccp_smp2p_in 0 IRQ_TYPE_EDGE_RISING>,
> +                              <&soccp_smp2p_in 1 IRQ_TYPE_EDGE_RISING>,
> +                              <&soccp_smp2p_in 2 IRQ_TYPE_EDGE_RISING>,
> +                              <&soccp_smp2p_in 3 IRQ_TYPE_EDGE_RISING>,
> +                              <&soccp_smp2p_in 9 IRQ_TYPE_EDGE_RISING>,
> +                              <&soccp_smp2p_in 10 IRQ_TYPE_EDGE_RISING>;
> +        interrupt-names = "wdog",
> +                          "fatal",
> +                          "ready",
> +                          "handover",
> +                          "stop-ack",
> +                          "pong",
> +                          "wake-ack";
> +
> +        memory-region = <&soccp_mem>,
> +                        <&soccp_dtb_mem_mem>;
> +
> +        firmware-name = "qcom/kaanapali/soccp.mbn",
> +                        "qcom/kaanapali/soccp_dtb.mbn";
> +
> +        power-domains = <&rpmhpd RPMHPD_CX>,
> +                        <&rpmhpd RPMHPD_MX>;
> +        power-domain-names = "cx",
> +                             "mx";
> +
> +        qcom,smem-states = <&soccp_smp2p_out 0>,
> +                           <&soccp_smp2p_out 10>,
> +                           <&soccp_smp2p_out 9>,
> +                           <&soccp_smp2p_out 8>;
> +        qcom,smem-state-names = "stop",
> +                                "wakeup",
> +                                "sleep",
> +                                "ping";
> +
> +        glink-edge {
> +            interrupts-extended = <&ipcc IPCC_MPROC_SOCCP
> +                                         IPCC_MPROC_SIGNAL_GLINK_QMP
> +                                         IRQ_TYPE_EDGE_RISING>;
> +            mboxes = <&ipcc IPCC_MPROC_SOCCP
> +                            IPCC_MPROC_SIGNAL_GLINK_QMP>;
> +
> +            label = "soccp";
> +            qcom,remote-pid = <19>;
> +
> +            /* ... */
> +        };
> +    };
> diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml
> index 63a82e7a8bf8..f81d088c2bad 100644
> --- a/Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml
> +++ b/Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml
> @@ -24,26 +24,6 @@ properties:
>    interconnects:
>      maxItems: 1
>  
> -  interrupts:
> -    minItems: 5
> -    items:
> -      - description: Watchdog interrupt
> -      - description: Fatal interrupt
> -      - description: Ready interrupt
> -      - description: Handover interrupt
> -      - description: Stop acknowledge interrupt
> -      - description: Shutdown acknowledge interrupt
> -
> -  interrupt-names:
> -    minItems: 5
> -    items:
> -      - const: wdog
> -      - const: fatal
> -      - const: ready
> -      - const: handover
> -      - const: stop-ack
> -      - const: shutdown-ack
> -
>    power-domains:
>      minItems: 1
>      maxItems: 3
> @@ -55,13 +35,21 @@ properties:
>    qcom,smem-states:
>      $ref: /schemas/types.yaml#/definitions/phandle-array
>      description: States used by the AP to signal the Hexagon core
> +    minItems: 1
>      items:
> -      - description: Stop the modem
> +      - description: Stop the remoteproc
> +      - description: Wake up the remoteproc
> +      - description: Make the remoteproc sleep
> +      - description: Ping the remoteproc
>  
>    qcom,smem-state-names:
>      description: The names of the state bits used for SMP2P output
> +    minItems: 1
>      items:
>        - const: stop
> +      - const: wakeup
> +      - const: sleep
> +      - const: ping
>  
>    smd-edge:
>      $ref: /schemas/remoteproc/qcom,smd-edge.yaml#
> @@ -80,9 +68,58 @@ properties:
>  required:
>    - clocks
>    - clock-names
> -  - interrupts
> -  - interrupt-names
>    - qcom,smem-states
>    - qcom,smem-state-names
>  
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - qcom,kaanapali-soccp-pas

The point of common schemas is to not have if/then/else schemas. If 
interrupts is now variable, then it is no longer common and should be 
moved out of the common schema. Or just have the widest constraints that 
covers all cases ({minItems: 5, maxItems: 7}).


> +    then:
> +      properties:
> +        interrupts:
> +          items:
> +            - description: Watchdog interrupt
> +            - description: Fatal interrupt
> +            - description: Ready interrupt
> +            - description: Handover interrupt
> +            - description: Stop acknowledge interrupt
> +            - description: Pong interrupt
> +            - description: Wake acknowledge interrupt
> +
> +        interrupt-names:
> +          items:
> +            - const: wdog
> +            - const: fatal
> +            - const: ready
> +            - const: handover
> +            - const: stop-ack
> +            - const: pong
> +            - const: wake-ack
> +
> +    else:
> +      properties:
> +        interrupts:
> +          minItems: 5
> +          items:
> +            - description: Watchdog interrupt
> +            - description: Fatal interrupt
> +            - description: Ready interrupt
> +            - description: Handover interrupt
> +            - description: Stop acknowledge interrupt
> +            - description: Shutdown acknowledge interrupt
> +
> +        interrupt-names:
> +          minItems: 5
> +          items:
> +            - const: wdog
> +            - const: fatal
> +            - const: ready
> +            - const: handover
> +            - const: stop-ack
> +            - const: shutdown-ack
> +
>  additionalProperties: true
> 
> -- 
> 2.25.1
> 

