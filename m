Return-Path: <linux-arm-msm+bounces-33432-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CCA839935A9
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Oct 2024 20:06:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E81441C23340
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Oct 2024 18:06:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8291A1DD534;
	Mon,  7 Oct 2024 18:06:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gkknRJDK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C1861DDA3A
	for <linux-arm-msm@vger.kernel.org>; Mon,  7 Oct 2024 18:06:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728324397; cv=none; b=T8D7HLyMNYwoVm6H2Fs7Eie9WE0NujcLZ6AmZY10JOqAYnQRUMnyIwgIVT2G+oaz8OrPKLwUJAq3fTsMBq0w+6wCabFiqAX5aGajTjUhB9HkWzzlf1MKXtPuCnnzdG0buetrcb3N5LjhOZ9QIvOLBAIvPUZKmwGWhnX7eCvqMBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728324397; c=relaxed/simple;
	bh=l1N0B5TIw9N5GUQcWxZ9Vu8gzwIQEamFikyqhdqsl+c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O80XMLXFP/W/MpfVPumFZ8vk/m0BWlz70NRduAAcbiA/fZEenyjxchhDDp7diPAx1Q7JZeHU0wLIqWDng0LAEKyogvaNFeJ2Z7/IU/U3kQPSmXOl8Cz6/c9H0AkeCvrz8Dx0ZIBq8rYsqSw6Dm0po8tu/AY1yd6c/RxTZDl92iY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gkknRJDK; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5389e24a4d1so5759465e87.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 07 Oct 2024 11:06:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728324393; x=1728929193; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dnAYwb+RJz5oWXIKbqMyr/0chlQtBJ7KHdObg5wk7os=;
        b=gkknRJDK4roGYAwC5MIntinp4TrVaod4SGQ5agwpbtLb+AcExDgR3jHX67vZod2V1/
         4Q6BtWSGtNAg/mbDrj5aAt+9JVpBC/aKBp4jY3cV1J3piSPPqK1sq2KGRbILH61+tMeS
         K6Wz0EXzXb2V+jiHx9F8oY+lVKtvE9hzcqxMtWJDOaRJhwr15CurIY9aMxF6qNzE3XzQ
         eLbVfIphMgEEiJzeCXIX5dlbQVsVfzog8z1zIo5UYnuctwUB/dob+5H33K9ybsodNGxC
         GXZTV7pd7S4Gm+a19Ne8ipQEYchc2tYDULWwclzVIFtNuNfJmwhkMnEl2/NVIdfLyvJq
         upeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728324393; x=1728929193;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dnAYwb+RJz5oWXIKbqMyr/0chlQtBJ7KHdObg5wk7os=;
        b=YUo2jUDMnu3mdzWbCwrUrKGZQfbUiHC27UwyCTZVXw9l7lSBAb0/pj+P0cRzM6oSXV
         gybNsa2Cp9XhT1oYGszrc5mOc4EHNCvaH6Yvzh7LavC5zPZx/9gSK9VzBR5dkhFBti7o
         zEbMKhcZ/1HaRodkizZhbi3BYTYe8R5iw1PJLvg9qLzUFhU3TahgDE969N42XPFXbG5B
         AT38pLGGgLqfJ23FZ0yXsBlM9kkyd3/+49abmhbTnDXD1KhNsLKIEGmid3/iNVejTvOp
         r7vB6b2sPpiSSsv4CmajQUKYsGVtdqsyj7DHSM7UvVOZSdSgDD/DGRmVZOjqrF/qi1mW
         7sbA==
X-Forwarded-Encrypted: i=1; AJvYcCUsINj5FVes3EMWNjv77hcXfkNbmOng4eGJVbE3/NQ4+fiYr2cKe5kzYjM1sDQBzi+0FvzBVVmwyEn0wgI7@vger.kernel.org
X-Gm-Message-State: AOJu0YxJPJ47H56BzzJKS9wU9e1Rl9890dfHkRdslx1szT2xE515l/zL
	GgNOs0vWOJ2a0e5l0qp30eDypAdeYTV2etPiin0AzYDSgPyQdkADEJigaISu1CQ=
X-Google-Smtp-Source: AGHT+IHHgJECRMFkEx284erMG6NzE0mdBji4FPBi9O4FJJAVL8nW6I99jneYqCTPOc37EvqBeDNtkw==
X-Received: by 2002:a05:6512:1192:b0:539:a3eb:cfff with SMTP id 2adb3069b0e04-539ab8c1acfmr5091601e87.49.1728324393239;
        Mon, 07 Oct 2024 11:06:33 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00-89ea-67f6-92cd-b49.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:89ea:67f6:92cd:b49])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-539aff1d0c8sm897824e87.130.2024.10.07.11.06.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Oct 2024 11:06:32 -0700 (PDT)
Date: Mon, 7 Oct 2024 21:06:31 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Sibi Sankar <quic_sibis@quicinc.com>
Cc: sudeep.holla@arm.com, cristian.marussi@arm.com, andersson@kernel.org, 
	konrad.dybcio@linaro.org, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, quic_rgottimu@quicinc.com, quic_kshivnan@quicinc.com, 
	conor+dt@kernel.org, arm-scmi@vger.kernel.org
Subject: Re: [PATCH V4 1/5] dt-bindings: firmware: Document bindings for QCOM
 SCMI Generic Extension
Message-ID: <rqa7g5hfsxozw6m4ke3jygijz5rp3lwu2fmqsebrjq6hsgb7nm@mxaiaddvuijk>
References: <20241007061023.1978380-1-quic_sibis@quicinc.com>
 <20241007061023.1978380-2-quic_sibis@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241007061023.1978380-2-quic_sibis@quicinc.com>

On Mon, Oct 07, 2024 at 11:40:19AM GMT, Sibi Sankar wrote:
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

I'm sorry if this has been discussed and frowned upon, but can you
squash memory type into device node?

protocol@80 {
	ddr {
	};

	llcc {
	};

	ddr-qos {
	};
};

> +
> +          freq-table-hz:
> +            items:
> +              items:
> +                - description: Minimum frequency of the memory bus in Hz
> +                - description: Maximum frequency of the memory bus in Hz

Does it make sense for the DDR-QOS type? Can we hardcode those values
and drop freq-table-hz from the DDR-QOS node?

Also, can we drop this completely by adding one extra OPP entry with the
minimum memory bus frequency?

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
> +                type: boolean

This seems to be redundant. If there is no qcom,ipm-ceil property, then
it's qcom,compute-type, isn't it?

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

Which CPU nodes? I see that the examples list all CPUs here. Do we
really need them?

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

Hmm. Can we say that each memory type can have at most one IPM and one
compute aka "passive" memlat monitor? Does it make sense to use them as
node names and drop the extra monitor-M names?

> +                        qcom,ipm-ceil = <20000000>;
> +                        cpus = <&CPU0 &CPU1 &CPU2 &CPU3 &CPU4 &CPU5 &CPU6 &CPU7
> +                                &CPU8 &CPU9 &CPU10 &CPU11>;

Are CPU lists different between monitors? Can they be different? Can
they be different between different memory types?

> +                        operating-points-v2 = <&memory0_monitor0_opp_table>;
> +
> +                        memory0_monitor0_opp_table: opp-table {

sensible names are better:

ddr_ipm_opp_table: opp-table {
};

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

This is definitely not 'frequency of the memory bys in Hz'

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

-- 
With best wishes
Dmitry

