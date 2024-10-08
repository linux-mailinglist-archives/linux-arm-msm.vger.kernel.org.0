Return-Path: <linux-arm-msm+bounces-33477-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2807C993FD2
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Oct 2024 09:41:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 78028B217B1
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Oct 2024 07:41:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 700261E1048;
	Tue,  8 Oct 2024 06:48:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="m8EnWQ2A"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B9091E1043;
	Tue,  8 Oct 2024 06:48:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728370082; cv=none; b=FQw1d2+mp9UMq0rlvu94U6GmmesBa5SBeiwzeuy+Y4cKQHnU2hKI9C35hpxQHS8IICJYTwbCKdD/4CtkOgPpkp9nKenUAP65Dnu2j9a0iDKnoIpOuhDMwUJx7wl+i6KJheZ9QdYnEymfav8BRFCWHkH5a2k6KnEWCu81u2amXRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728370082; c=relaxed/simple;
	bh=Mbgwhoc9G0FhvtIAp4sG22Waln7fe2R1Jvj7pLDy4Y8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AcvomPEKsIt95tTN6h8cZt1qhasX9evrn3MXGF9v8JDePJQzxOFJ5T02fPuNTK5/YLNKfMi09H9hm8Yl1dGGdecTyZnq5h6vo0XxNr1SPoDG9uVLyWcqKMI0AZE03D4hZr8/uC+oYbl+j1HhBoVaj4nfbdcCN84awlpNzESesvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=m8EnWQ2A; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1866C4CEC7;
	Tue,  8 Oct 2024 06:48:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728370081;
	bh=Mbgwhoc9G0FhvtIAp4sG22Waln7fe2R1Jvj7pLDy4Y8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=m8EnWQ2AeXnGL39qcc6FjGTfN4vo5BIvvMoQSPv027tsf3sREIGrR2rjXS07lNPCA
	 dOyNtTs+BTUwQyhmn7OqbEKvw4u/ANd6+37JSHts+mkwgIKES2rP5A0JJGo1dNUA1I
	 MLyXefms2c/g37MdACC/5Rzqp+W9bFITQcmwTblajvAylppT/dgh99STcOXRMvweCD
	 Ck0qJ2c8jv02W/XMXDrXJ5Xq6uu30sDMjEUR9kg8PNiW+09yQwB7ulRFVvP/4VtY7R
	 tItkUJ6xvygfVM430M+yuWe46qWpmY47lkBw29fta0ck6eiQz8WYS+sYeGCU2nH3zw
	 WNtT+d5dwyn7A==
Date: Tue, 8 Oct 2024 08:47:57 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Sibi Sankar <quic_sibis@quicinc.com>
Cc: sudeep.holla@arm.com, cristian.marussi@arm.com, andersson@kernel.org, 
	konrad.dybcio@linaro.org, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, quic_rgottimu@quicinc.com, quic_kshivnan@quicinc.com, 
	conor+dt@kernel.org, arm-scmi@vger.kernel.org
Subject: Re: [PATCH V4 1/5] dt-bindings: firmware: Document bindings for QCOM
 SCMI Generic Extension
Message-ID: <ct35b7sagblf4zl2k2jqjqis4z4yc5ct2japdeaytk4yfhmypn@2sgmhpe5v35z>
References: <20241007061023.1978380-1-quic_sibis@quicinc.com>
 <20241007061023.1978380-2-quic_sibis@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241007061023.1978380-2-quic_sibis@quicinc.com>

On Mon, Oct 07, 2024 at 11:40:19AM +0530, Sibi Sankar wrote:
> Document the various memory buses that can be monitored and scaled by
> the memory latency governor hosted by the QCOM SCMI Generic Extension
> Protocol v1.0.
> 
> Signed-off-by: Sibi Sankar <quic_sibis@quicinc.com>
> ---
> 
> v3:
> * Restructure the bindings to mimic IMX [Christian]
> 
>  .../bindings/firmware/arm,scmi.yaml           |   1 +
>  .../bindings/firmware/qcom,scmi-memlat.yaml   | 246 ++++++++++++++++++
>  .../dt-bindings/firmware/qcom,scmi-memlat.h   |  22 ++
>  3 files changed, 269 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/firmware/qcom,scmi-memlat.yaml
>  create mode 100644 include/dt-bindings/firmware/qcom,scmi-memlat.h
> 
> diff --git a/Documentation/devicetree/bindings/firmware/arm,scmi.yaml b/Documentation/devicetree/bindings/firmware/arm,scmi.yaml
> index 54d7d11bfed4..1d405f429168 100644
> --- a/Documentation/devicetree/bindings/firmware/arm,scmi.yaml
> +++ b/Documentation/devicetree/bindings/firmware/arm,scmi.yaml
> @@ -24,6 +24,7 @@ description: |
>  
>  anyOf:
>    - $ref: /schemas/firmware/nxp,imx95-scmi.yaml
> +  - $ref: /schemas/firmware/qcom,scmi-memlat.yaml
>  
>  properties:
>    $nodename:
> diff --git a/Documentation/devicetree/bindings/firmware/qcom,scmi-memlat.yaml b/Documentation/devicetree/bindings/firmware/qcom,scmi-memlat.yaml
> new file mode 100644
> index 000000000000..0e8ea6dacd6a
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/firmware/qcom,scmi-memlat.yaml
> @@ -0,0 +1,246 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/firmware/qcom,scmi-memlat.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm SCMI Memory Bus nodes
> +
> +maintainers:
> +  - Sibi Sankar <quic_sibis@quicinc.com>
> +
> +description:
> +  This binding describes the various memory buses that can be monitored and scaled

Drop "This binding" and describe the hardware/firmware, not binding.

Also, not wrapped according to Linux coding style.


> +  by memory latency governor running on the CPU Control Processor (SCMI controller).
> +
> +properties:
> +  protocol@80:
> +    $ref: '/schemas/firmware/arm,scmi.yaml#/$defs/protocol-node'
> +    unevaluatedProperties: false
> +
> +    properties:
> +      reg:
> +        const: 0x80
> +
> +    patternProperties:
> +      '^memory-[0-9]$':
> +        type: object
> +        unevaluatedProperties: false
> +        description:
> +          The list of all memory buses that can be monitored and scaled by the
> +          memory latency governor running on the SCMI controller.
> +
> +        properties:
> +          qcom,memory-type:
> +            $ref: /schemas/types.yaml#/definitions/uint32
> +            enum: [0, 1, 2]
> +            description: |
> +              Memory Bus Identifier
> +              0 = QCOM_MEM_TYPE_DDR
> +              1 = QCOM_MEM_TYPE_LLCC
> +              2 = QCOM_MEM_TYPE_DDR_QOS

You need to describe these. Why "Quality of service" should be a separate
bus?

To me it looks like you are re-defining interconnects.

> +
> +          freq-table-hz:
> +            items:
> +              items:

" - items:"
no?

> +                - description: Minimum frequency of the memory bus in Hz
> +                - description: Maximum frequency of the memory bus in Hz
> +
> +        patternProperties:
> +          '^monitor-[0-9]$':
> +            type: object
> +            unevaluatedProperties: false
> +            description:
> +              The list of all monitors detecting the memory latency bound workloads using
> +              various counters.
> +
> +            properties:
> +              qcom,compute-type:
> +                description:
> +                  Monitors of type compute perform bus dvfs based on a rudimentary CPU
> +                  frequency to memory frequency map.

I don't understand why you need to describe what type of monitor the
SCMI has. Commit msg is pretty vague, so does not help me, either.

> +                type: boolean
> +
> +              qcom,ipm-ceil:
> +                $ref: /schemas/types.yaml#/definitions/uint32
> +                description:
> +                  Monitors having this property perform bus dvfs based on the same
> +                  rudimentary table but the scaling is performed only if the calculated
> +                  IPM (Instruction Per Misses) exceeds the given ceiling.
> +
> +              cpus:
> +                $ref: /schemas/types.yaml#/definitions/phandle-array
> +                description:
> +                  Should be a list of phandles to CPU nodes (as described in
> +                  Documentation/devicetree/bindings/arm/cpus.yaml).
> +
> +              operating-points-v2: true
> +              opp-table:
> +                type: object
> +
> +            required:
> +              - cpus
> +              - operating-points-v2
> +
> +            oneOf:
> +              - required: [ 'qcom,compute-type' ]
> +              - required: [ 'qcom,ipm-ceil' ]
> +
> +        required:
> +          - qcom,memory-type
> +          - freq-table-hz
> +
> +additionalProperties: true
> +
> +examples:
> +  - |
> +    #include <dt-bindings/firmware/qcom,scmi-memlat.h>
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
> +                memory-0 {
> +                    qcom,memory-type = <QCOM_MEM_TYPE_DDR>;
> +                    freq-table-hz = /bits/ 64 <200000000 4224000000>;
> +
> +                    monitor-0 {
> +                        qcom,ipm-ceil = <20000000>;
> +                        cpus = <&CPU0 &CPU1 &CPU2 &CPU3 &CPU4 &CPU5 &CPU6 &CPU7
> +                                &CPU8 &CPU9 &CPU10 &CPU11>;

Labels are lowercase.

> +                        operating-points-v2 = <&memory0_monitor0_opp_table>;
> +
> +                        memory0_monitor0_opp_table: opp-table {
> +                            compatible = "operating-points-v2";
> +
> +                            opp-999000000 {
> +                                opp-hz = /bits/ 64 <999000000 547000000>;
> +                            };
> +
> +                            opp-1440000000 {
> +                                opp-hz = /bits/ 64 <1440000000 768000000>;
> +                            };
> +
> +                            opp-1671000000 {
> +                                opp-hz = /bits/ 64 <1671000000 1555000000>;
> +                            };
> +
> +                            opp-2189000000 {
> +                                opp-hz = /bits/ 64 <2189000000 2092000000>;
> +                            };
> +
> +                            opp-2516000000 {
> +                                opp-hz = /bits/ 64 <2516000000 3187000000>;
> +                            };
> +
> +                            opp-3860000000 {
> +                                opp-hz = /bits/ 64 <3860000000 4224000000>;
> +                            };
> +                        };
> +                    };
> +
> +                    monitor-1 {
> +                        qcom,compute-type;
> +                        cpus = <&CPU0 &CPU1 &CPU2 &CPU3 &CPU4 &CPU5 &CPU6 &CPU7
> +                                &CPU8 &CPU9 &CPU10 &CPU11>;
> +                        operating-points-v2 = <&memory0_monitor1_opp_table>;
> +
> +                        memory0_monitor1_opp_table: opp-table {
> +                            compatible = "operating-points-v2";
> +
> +                            opp-1440000000 {
> +                                    opp-hz = /bits/ 64 <1440000000 200000000>;
> +                            };
> +
> +                            opp-2189000000 {
> +                                    opp-hz = /bits/ 64 <2189000000 768000000>;
> +                            };
> +
> +                            opp-2516000000 {
> +                                    opp-hz = /bits/ 64 <2516000000 1555000000>;
> +                            };
> +
> +                            opp-3860000000 {
> +                                    opp-hz = /bits/ 64 <3860000000 4224000000>;
> +                            };
> +                        };
> +                    };
> +                };
> +
> +                memory-1 {
> +                    qcom,memory-type = <QCOM_MEM_TYPE_LLCC>;
> +                    freq-table-hz = /bits/ 64 <300000000 1067000000>;
> +
> +                    monitor-0 {
> +                        qcom,ipm-ceil = <20000000>;
> +                        cpus = <&CPU0 &CPU1 &CPU2 &CPU3 &CPU4 &CPU5 &CPU6 &CPU7
> +                                &CPU8 &CPU9 &CPU10 &CPU11>;
> +                        operating-points-v2 = <&memory1_monitor0_opp_table>;
> +
> +                        memory1_monitor0_opp_table: opp-table {
> +                            compatible = "operating-points-v2";
> +
> +                            opp-999000000 {
> +                                opp-hz = /bits/ 64 <999000000 300000000>;
> +                            };
> +
> +                            opp-1440000000 {
> +                                opp-hz = /bits/ 64 <1440000000 466000000>;
> +                            };
> +
> +                            opp-1671000000 {
> +                                opp-hz = /bits/ 64 <1671000000 600000000>;
> +                            };
> +
> +                            opp-2189000000 {
> +                                opp-hz = /bits/ 64 <2189000000 806000000>;
> +                            };
> +
> +                            opp-2516000000 {
> +                                opp-hz = /bits/ 64 <2516000000 933000000>;
> +                            };
> +
> +                            opp-3860000000 {
> +                                opp-hz = /bits/ 64 <3860000000 1066000000>;
> +                            };
> +                        };
> +                    };
> +                };
> +
> +                memory-2 {
> +                    qcom,memory-type = <QCOM_MEM_TYPE_DDR_QOS>;
> +                    freq-table-hz = /bits/ 64 <QCOM_DDR_LEVEL_AUTO QCOM_DDR_LEVEL_PERF>;
> +
> +                    monitor-0 {
> +                        qcom,ipm-ceil = <20000000>;
> +                        cpus = <&CPU0 &CPU1 &CPU2 &CPU3 &CPU4 &CPU5 &CPU6 &CPU7
> +                                &CPU8 &CPU9 &CPU10 &CPU11>;
> +                        operating-points-v2 = <&memory2_monitor0_opp_table>;
> +
> +                        memory2_monitor0_opp_table: opp-table {
> +                            compatible = "operating-points-v2";
> +
> +                            opp-2189000000 {
> +                                opp-hz = /bits/ 64 <2189000000>;
> +                                opp-level = <QCOM_DDR_LEVEL_AUTO>;
> +                            };
> +
> +                            opp-3860000000 {
> +                                opp-hz = /bits/ 64 <3860000000>;
> +                                opp-level = <QCOM_DDR_LEVEL_PERF>;
> +                            };
> +                        };
> +                    };
> +                };
> +            };
> +        };
> +    };
> diff --git a/include/dt-bindings/firmware/qcom,scmi-memlat.h b/include/dt-bindings/firmware/qcom,scmi-memlat.h
> new file mode 100644
> index 000000000000..7ae8d8d5623b
> --- /dev/null
> +++ b/include/dt-bindings/firmware/qcom,scmi-memlat.h
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

Use decimal.

> +
> +/*
> + * QCOM_MEM_TYPE_DDR_QOS supports the following states.
> + *
> + * %QCOM_DDR_LEVEL_AUTO:	DDR operates with LPM enabled
> + * %QCOM_DDR_LEVEL_PERF:	DDR operates with LPM disabled

What is "%"?

> + */
> +#define QCOM_DDR_LEVEL_AUTO	0x0
> +#define QCOM_DDR_LEVEL_PERF	0x1

Decimal.

> +
> +#endif /* __DT_BINDINGS_QCOM_SCMI_VENDOR_H */
> -- 
> 2.34.1
> 

