Return-Path: <linux-arm-msm+bounces-22643-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A6D6907CB7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Jun 2024 21:36:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C95F51F23648
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Jun 2024 19:36:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 426FA14A4EA;
	Thu, 13 Jun 2024 19:36:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k1jORBDr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 150E112C7E3;
	Thu, 13 Jun 2024 19:36:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718307387; cv=none; b=oQZURZ7qC3xYo5Ii6LS/+rICfMGJBQsy5FOlOFOetDzI8YibW8AhgEcAGIasRU91xR9P6VZoUmFGUqjDpZPpXneMn+RUCbpWxlm2bFy3QfzrntyN9Zh+7KBYhPPNI4t6CYAh0N3C+usXS1m8D9fL/Vx92fd1S6z0WXwc2fhTBM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718307387; c=relaxed/simple;
	bh=hoj7+mJl2v8L0w+cxKSigp1VZHa6dw8bBqGYa12pXUw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=slsP/NREEDPvF+yx6b+VIgEKJvuXzA4HXWjk+7IBGOAFw4MCbeQ2uygnk9fA3uNBDwqK7cTfzJpYU2YigO0wYn7qWJ63ZVnsdzGRiG24Y+hGneXkx9z2IqKSm8Ofn/2Pvsh9YX6OQdK+YTd7zcvAeORxLd2BmVI1bVcOExebuWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k1jORBDr; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51D19C2BBFC;
	Thu, 13 Jun 2024 19:36:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718307386;
	bh=hoj7+mJl2v8L0w+cxKSigp1VZHa6dw8bBqGYa12pXUw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=k1jORBDrBIqdH7GVXqzbhn0HdZtnUoYs2B6pDvKF5dvUURSItSBpKNureIbhv+/LP
	 oxXstJpNUtCSu2izRXfM2kpKMG1zvsVDX0ZM531F/8hJWNztYYkOnNc8yx5qR4nj6O
	 Eh6SsQxsLaZ90x0hSywMHSDBAaBINLzgpQrNADmrw8Li/6jTxojibxTnKmsJS9Tn3K
	 110x+acMk972B5piy5krf4CFA3joDEaqHBYEbdzLsDDPDkRZtAuN13TviQhMMbz/MQ
	 v9CW3x+p6e0Y+wNRJnE9qhzuIYbUKmze09/QX71dKU8MBPfrEMD71TmtEsXJiNajVE
	 vqi5FCivOMIpg==
Date: Thu, 13 Jun 2024 13:36:25 -0600
From: Rob Herring <robh@kernel.org>
To: Sibi Sankar <quic_sibis@quicinc.com>
Cc: sudeep.holla@arm.com, cristian.marussi@arm.com, andersson@kernel.org,
	konrad.dybcio@linaro.org, krzysztof.kozlowski+dt@linaro.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	quic_rgottimu@quicinc.com, quic_kshivnan@quicinc.com,
	conor+dt@kernel.org
Subject: Re: [RFC V2 1/4] dt-bindings: firmware: Add support for QCOM Vendor
 Protocol
Message-ID: <20240613193625.GA2338851-robh@kernel.org>
References: <20240612183031.219906-1-quic_sibis@quicinc.com>
 <20240612183031.219906-2-quic_sibis@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240612183031.219906-2-quic_sibis@quicinc.com>

On Thu, Jun 13, 2024 at 12:00:28AM +0530, Sibi Sankar wrote:
> Document the SCMI QCOM Vendor protocol v1.0 bindings and the various memory
> buses that can be monitored and scaled by memory latency governor hosted
> on it.
> 
> Signed-off-by: Sibi Sankar <quic_sibis@quicinc.com>
> ---
> 
> v1:
> * Add missing bindings for the protocol. [Konrad/Dmitry]
> * Use alternate bindings. [Dmitry/Konrad]
> 
>  .../bindings/firmware/arm,scmi.yaml           |  21 ++
>  .../bindings/soc/qcom/qcom,scmi-memlat.yaml   | 243 ++++++++++++++++++
>  include/dt-bindings/soc/qcom,scmi-vendor.h    |  22 ++
>  3 files changed, 286 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/soc/qcom/qcom,scmi-memlat.yaml
>  create mode 100644 include/dt-bindings/soc/qcom,scmi-vendor.h
> 
> diff --git a/Documentation/devicetree/bindings/firmware/arm,scmi.yaml b/Documentation/devicetree/bindings/firmware/arm,scmi.yaml
> index 7de2c29606e5..21e4da53d02c 100644
> --- a/Documentation/devicetree/bindings/firmware/arm,scmi.yaml
> +++ b/Documentation/devicetree/bindings/firmware/arm,scmi.yaml
> @@ -278,6 +278,27 @@ properties:
>      required:
>        - reg
>  
> +  protocol@80:
> +    $ref: '#/$defs/protocol-node'
> +    unevaluatedProperties: false
> +
> +    properties:
> +      reg:
> +        const: 0x80
> +
> +      memlat-dvfs:

I don't see the purpose of this container node.

> +        type: object
> +        additionalProperties: false
> +        description:
> +          The list of all memory buses that can be monitored and scaled by the
> +          memory latency governor running on the SCMI controller.
> +
> +        patternProperties:
> +          '^memory-[0-9]$':
> +            type: object
> +            $ref: /schemas/soc/qcom/qcom,scmi-memlat.yaml#

This schema needs to be at the level of the protocol node. See the i.MX 
SCMI pinctrl patches for more details on what it should look like.

> +            unevaluatedProperties: false
> +
>  additionalProperties: false
>  
>  $defs:
> diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,scmi-memlat.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,scmi-memlat.yaml
> new file mode 100644
> index 000000000000..c6e3d163c4a3
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/soc/qcom/qcom,scmi-memlat.yaml
> @@ -0,0 +1,243 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/soc/qcom/qcom,scmi-memlat.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm SCMI Memory Bus nodes
> +
> +maintainers:
> +  - Sibi Sankar <quic_sibis@quicinc.com>
> +
> +description: |

Doesn't need '|' if no formatting.

> +  This binding describes the various memory buses that can be monitored and scaled
> +  by memory latency governor running on the CPU Control Processor (SCMI controller).
> +
> +properties:
> +  qcom,memory-type:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    enum: [0, 1, 2]
> +    description:

Needs a '|' if you want your formatting preserved.

> +      Memory Bus Identifier
> +        0 = QCOM_MEM_TYPE_DDR
> +        1 = QCOM_MEM_TYPE_LLCC
> +        2 = QCOM_MEM_TYPE_DDR_QOS
> +
> +  freq-table-hz:
> +    items:
> +      items:
> +        - description: Minimum frequency of the memory bus in Hz
> +        - description: Maximum frequency of the memory bus in Hz
> +
> +patternProperties:
> +  '^monitor-[0-9]$':
> +    type: object
> +    unevaluatedProperties: false
> +    description:
> +      The list of all monitors detecting the memory latency bound workloads using
> +      various counters.
> +
> +    properties:
> +      qcom,compute-type:
> +        description:
> +          Monitors of type compute perform bus dvfs based on a rudimentary CPU
> +          frequency to memory frequency map.
> +        type: boolean
> +
> +      qcom,ipm-ceil:
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        description:
> +          Monitors having this property perform bus dvfs based on the same
> +          rudimentary table but the scaling is performed only if the calculated
> +          IPM (Instruction Per Misses) exceeds the given ceiling.
> +
> +      qcom,cpulist:
> +        $ref: /schemas/types.yaml#/definitions/phandle-array
> +        description:
> +          List of phandles to the CPUs nodes whose frequency and IPM are to be
> +          monitored.

We have a standard property for this: cpus

> +
> +      operating-points-v2: true
> +      opp-table:
> +        type: object
> +
> +    required:
> +      - qcom,cpulist
> +      - operating-points-v2
> +      - opp-table
> +

> +    allOf:
> +      - if:
> +          properties:
> +            qcom,compute-type: false
> +        then:
> +          required:
> +            - qcom,ipm-ceil
> +
> +      - if:
> +          properties:
> +            qcom,ipm-ceil: false
> +        then:
> +          required:
> +            - qcom,compute-type

Isn't all this just:

oneOf:
  - required: [ qcom,compute-type ]
  - required: [ qcom,ipm-ceil ]


> +
> +required:
> +  - qcom,memory-type
> +  - freq-table-hz
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/soc/qcom,scmi-vendor.h>
> +
> +    firmware {
> +        scmi {
> +            compatible = "arm,scmi";
> +            mboxes = <&cpucp_mbox 0>, <&cpucp_mbox 2>;
> +            mbox-names = "tx", "rx";
> +            shmem = <&cpu_scp_lpri0>, <&cpu_scp_lpri1>;
> +
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +
> +            protocol@80 {
> +                reg = <0x80>;
> +
> +                memlat-dvfs {
> +                    memory-0 {
> +                        qcom,memory-type = <QCOM_MEM_TYPE_DDR>;
> +                        freq-table-hz = /bits/ 64 <200000000 4224000000>;
> +
> +                        monitor-0 {
> +                            qcom,ipm-ceil = <20000000>;
> +                            qcom,cpulist = <&CPU0 &CPU1 &CPU2 &CPU3 &CPU4 &CPU5 &CPU6 &CPU7
> +                                            &CPU8 &CPU9 &CPU10 &CPU11>;
> +                            operating-points-v2 = <&memory0_monitor0_opp_table>;
> +
> +                            memory0_monitor0_opp_table: opp-table {
> +                                compatible = "operating-points-v2";
> +
> +                                opp-999000000 {
> +                                    opp-hz = /bits/ 64 <999000000 547000000>;
> +                                };
> +
> +                                opp-1440000000 {
> +                                    opp-hz = /bits/ 64 <1440000000 768000000>;
> +                                };
> +
> +                                opp-1671000000 {
> +                                    opp-hz = /bits/ 64 <1671000000 1555000000>;
> +                                };
> +
> +                                opp-2189000000 {
> +                                    opp-hz = /bits/ 64 <2189000000 2092000000>;
> +                                };
> +
> +                                opp-2516000000 {
> +                                    opp-hz = /bits/ 64 <2516000000 3187000000>;
> +                                };
> +
> +                                opp-3860000000 {
> +                                    opp-hz = /bits/ 64 <3860000000 4224000000>;
> +                                };
> +                            };
> +                        };
> +
> +                        monitor-1 {
> +                            qcom,compute-type;
> +                            qcom,cpulist = <&CPU0 &CPU1 &CPU2 &CPU3 &CPU4 &CPU5 &CPU6 &CPU7
> +                                            &CPU8 &CPU9 &CPU10 &CPU11>;
> +                            operating-points-v2 = <&memory0_monitor1_opp_table>;
> +
> +                            memory0_monitor1_opp_table: opp-table {
> +                                compatible = "operating-points-v2";
> +
> +                                opp-1440000000 {
> +                                        opp-hz = /bits/ 64 <1440000000 200000000>;
> +                                };
> +
> +                                opp-2189000000 {
> +                                        opp-hz = /bits/ 64 <2189000000 768000000>;
> +                                };
> +
> +                                opp-2516000000 {
> +                                        opp-hz = /bits/ 64 <2516000000 1555000000>;
> +                                };
> +
> +                                opp-3860000000 {
> +                                        opp-hz = /bits/ 64 <3860000000 4224000000>;
> +                                };
> +                            };
> +                        };
> +                    };
> +
> +                    memory-1 {
> +                        qcom,memory-type = <QCOM_MEM_TYPE_LLCC>;
> +                        freq-table-hz = /bits/ 64 <300000000 1067000000>;
> +
> +                        monitor-0 {
> +                            qcom,ipm-ceil = <20000000>;
> +                            qcom,cpulist = <&CPU0 &CPU1 &CPU2 &CPU3 &CPU4 &CPU5 &CPU6 &CPU7
> +                                            &CPU8 &CPU9 &CPU10 &CPU11>;
> +                            operating-points-v2 = <&memory1_monitor0_opp_table>;
> +
> +                            memory1_monitor0_opp_table: opp-table {
> +                                compatible = "operating-points-v2";
> +
> +                                opp-999000000 {
> +                                    opp-hz = /bits/ 64 <999000000 300000000>;
> +                                };
> +
> +                                opp-1440000000 {
> +                                    opp-hz = /bits/ 64 <1440000000 466000000>;
> +                                };
> +
> +                                opp-1671000000 {
> +                                    opp-hz = /bits/ 64 <1671000000 600000000>;
> +                                };
> +
> +                                opp-2189000000 {
> +                                    opp-hz = /bits/ 64 <2189000000 806000000>;
> +                                };
> +
> +                                opp-2516000000 {
> +                                    opp-hz = /bits/ 64 <2516000000 933000000>;
> +                                };
> +
> +                                opp-3860000000 {
> +                                    opp-hz = /bits/ 64 <3860000000 1066000000>;
> +                                };
> +                            };
> +                        };
> +                    };
> +
> +                    memory-2 {
> +                        qcom,memory-type = <QCOM_MEM_TYPE_DDR_QOS>;
> +                        freq-table-hz = /bits/ 64 <QCOM_DDR_LEVEL_AUTO QCOM_DDR_LEVEL_PERF>;
> +
> +                        monitor-0 {
> +                            qcom,ipm-ceil = <20000000>;
> +                            qcom,cpulist = <&CPU0 &CPU1 &CPU2 &CPU3 &CPU4 &CPU5 &CPU6 &CPU7
> +                                            &CPU8 &CPU9 &CPU10 &CPU11>;
> +                            operating-points-v2 = <&memory2_monitor0_opp_table>;
> +
> +                            memory2_monitor0_opp_table: opp-table {
> +                                compatible = "operating-points-v2";
> +
> +                                opp-2189000000 {
> +                                    opp-hz = /bits/ 64 <2189000000>;
> +                                    opp-level = <QCOM_DDR_LEVEL_AUTO>;
> +                                };
> +
> +                                opp-3860000000 {
> +                                    opp-hz = /bits/ 64 <3860000000>;
> +                                    opp-level = <QCOM_DDR_LEVEL_PERF>;
> +                                };
> +                            };
> +                        };
> +                    };
> +                };
> +            };
> +        };
> +    };
> diff --git a/include/dt-bindings/soc/qcom,scmi-vendor.h b/include/dt-bindings/soc/qcom,scmi-vendor.h
> new file mode 100644
> index 000000000000..7ae8d8d5623b
> --- /dev/null
> +++ b/include/dt-bindings/soc/qcom,scmi-vendor.h
> @@ -0,0 +1,22 @@
> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
> +/*
> + * Copyright (c) 2024, Qualcomm Innovation Center, Inc. All rights reserved.
> + */
> +#ifndef __DT_BINDINGS_QCOM_SCMI_VENDOR_H
> +#define __DT_BINDINGS_QCOM_SCMI_VENDOR
> +
> +/* Memory IDs */
> +#define QCOM_MEM_TYPE_DDR	0x0
> +#define QCOM_MEM_TYPE_LLCC	0x1
> +#define QCOM_MEM_TYPE_DDR_QOS	0x2
> +
> +/*
> + * QCOM_MEM_TYPE_DDR_QOS supports the following states.
> + *
> + * %QCOM_DDR_LEVEL_AUTO:	DDR operates with LPM enabled
> + * %QCOM_DDR_LEVEL_PERF:	DDR operates with LPM disabled
> + */
> +#define QCOM_DDR_LEVEL_AUTO	0x0
> +#define QCOM_DDR_LEVEL_PERF	0x1
> +
> +#endif /* __DT_BINDINGS_QCOM_SCMI_VENDOR_H */
> -- 
> 2.34.1
> 

