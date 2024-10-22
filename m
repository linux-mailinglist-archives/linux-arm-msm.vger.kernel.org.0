Return-Path: <linux-arm-msm+bounces-35347-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 919659A9A9C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Oct 2024 09:13:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B2D441C21E8B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Oct 2024 07:13:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19F65148850;
	Tue, 22 Oct 2024 07:13:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="N1fuAUXi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21AE7811EB;
	Tue, 22 Oct 2024 07:13:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729581213; cv=none; b=ENKsGRUwDCBDO3JkIm2/KnzlHjX37tzfnea7Xt9ydDa4UyX5Y1Tmw4sT/UBpFqX/75k9xnGHDPKFUeX6yC72LwV/0yuDKd8juplnvjvyvCgJFU7gxnjWKgoCeEblrvk7dvGRFe/m984RnvF5U9O9lvCS3AW5UmW6EshVzQX1F0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729581213; c=relaxed/simple;
	bh=x9UEOJbY8anmU06+eUNLlNqup9v/gtXBWPZLQdGS/3o=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=pXmxhOTJna+vtw74ossiu4LpEOacwb3/97UBHU/R7SC6h3T0jQvS2ObbDNRXy9a5dUGSidWpx4MF6xkcutI39jeyN7PioK5N1oiicByAK8F1JBiqV1850CL8dLn/6SreXqAvpBWo6vmG24ohm/zAXMz0MHShNQg2/6Lh62gCTZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=N1fuAUXi; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49LJox9X029903;
	Tue, 22 Oct 2024 07:13:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5AYT/+UKWkNHSm09ApCttzO0jynCRMFzORWryZbysRU=; b=N1fuAUXi8SYRqpjD
	RTfCnievn3AozRC+JXkLSjnkikXUvr5yZN18MonenFhq7m2ZY0asFv/+ZN9Cxvii
	UADI9mCSwKRj//5zTzOL7je5b8+uJF4RJeE8VEb9cFoPxhlsfdOC41qV6EO4yerM
	yZHrSmUUMoVKiWYX/ySziu6mY7jEUsZyLKqhb2RqBi8c+XRGJ9jjRPMjE98z3AgH
	yJr9b/ZFVX7QbLR2UD0mB8YiwcWYXatq6+2QxYoITwLtR5sX1fzmtTlV1Q3wgK3q
	fxOTLVfKgM0uzW5Z4S043iDN1WjstZBd83rU5kmq2XVI+e6JwyVBkfXfXOjgIPyu
	dtNmIA==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42c6vxyam3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 22 Oct 2024 07:13:18 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49M7DIRx024759
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 22 Oct 2024 07:13:18 GMT
Received: from [10.131.33.37] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 22 Oct
 2024 00:13:13 -0700
Message-ID: <911483df-ee09-033d-7fae-4090bf8a3713@quicinc.com>
Date: Tue, 22 Oct 2024 12:43:09 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH V4 1/5] dt-bindings: firmware: Document bindings for QCOM
 SCMI Generic Extension
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: <sudeep.holla@arm.com>, <cristian.marussi@arm.com>, <andersson@kernel.org>,
        <konrad.dybcio@linaro.org>, <robh+dt@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <quic_rgottimu@quicinc.com>,
        <quic_kshivnan@quicinc.com>, <conor+dt@kernel.org>,
        <arm-scmi@vger.kernel.org>
References: <20241007061023.1978380-1-quic_sibis@quicinc.com>
 <20241007061023.1978380-2-quic_sibis@quicinc.com>
 <rqa7g5hfsxozw6m4ke3jygijz5rp3lwu2fmqsebrjq6hsgb7nm@mxaiaddvuijk>
From: Sibi Sankar <quic_sibis@quicinc.com>
In-Reply-To: <rqa7g5hfsxozw6m4ke3jygijz5rp3lwu2fmqsebrjq6hsgb7nm@mxaiaddvuijk>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: UN4zIplih_kDM1A6ooenxc5KSGQDZXX_
X-Proofpoint-GUID: UN4zIplih_kDM1A6ooenxc5KSGQDZXX_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 suspectscore=0
 clxscore=1011 malwarescore=0 mlxlogscore=999 bulkscore=0 impostorscore=0
 lowpriorityscore=0 adultscore=0 phishscore=0 priorityscore=1501
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410220045



On 10/7/24 23:36, Dmitry Baryshkov wrote:
> On Mon, Oct 07, 2024 at 11:40:19AM GMT, Sibi Sankar wrote:
>> Document the various memory buses that can be monitored and scaled by
>> the memory latency governor hosted by the QCOM SCMI Generic Extension
>> Protocol v1.0.
>>
>> Signed-off-by: Sibi Sankar <quic_sibis@quicinc.com>

Hey Dmitry,

Thanks for taking time to review the series!

>> ---
>>
>> v3:
>> * Restructure the bindings to mimic IMX [Christian]
>>
>>   .../bindings/firmware/arm,scmi.yaml           |   1 +
>>   .../bindings/firmware/qcom,scmi-memlat.yaml   | 246 ++++++++++++++++++
>>   .../dt-bindings/firmware/qcom,scmi-memlat.h   |  22 ++
>>   3 files changed, 269 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/firmware/qcom,scmi-memlat.yaml
>>   create mode 100644 include/dt-bindings/firmware/qcom,scmi-memlat.h
>>
>> diff --git a/Documentation/devicetree/bindings/firmware/arm,scmi.yaml b/Documentation/devicetree/bindings/firmware/arm,scmi.yaml
>> index 54d7d11bfed4..1d405f429168 100644
>> --- a/Documentation/devicetree/bindings/firmware/arm,scmi.yaml
>> +++ b/Documentation/devicetree/bindings/firmware/arm,scmi.yaml
>> @@ -24,6 +24,7 @@ description: |
>>   
>>   anyOf:
>>     - $ref: /schemas/firmware/nxp,imx95-scmi.yaml
>> +  - $ref: /schemas/firmware/qcom,scmi-memlat.yaml
>>   
>>   properties:
>>     $nodename:
>> diff --git a/Documentation/devicetree/bindings/firmware/qcom,scmi-memlat.yaml b/Documentation/devicetree/bindings/firmware/qcom,scmi-memlat.yaml
>> new file mode 100644
>> index 000000000000..0e8ea6dacd6a
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/firmware/qcom,scmi-memlat.yaml
>> @@ -0,0 +1,246 @@
>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/firmware/qcom,scmi-memlat.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Qualcomm SCMI Memory Bus nodes
>> +
>> +maintainers:
>> +  - Sibi Sankar <quic_sibis@quicinc.com>
>> +
>> +description:
>> +  This binding describes the various memory buses that can be monitored and scaled
>> +  by memory latency governor running on the CPU Control Processor (SCMI controller).
>> +
>> +properties:
>> +  protocol@80:
>> +    $ref: '/schemas/firmware/arm,scmi.yaml#/$defs/protocol-node'
>> +    unevaluatedProperties: false
>> +
>> +    properties:
>> +      reg:
>> +        const: 0x80
>> +
>> +    patternProperties:
>> +      '^memory-[0-9]$':
>> +        type: object
>> +        unevaluatedProperties: false
>> +        description:
>> +          The list of all memory buses that can be monitored and scaled by the
>> +          memory latency governor running on the SCMI controller.
>> +
>> +        properties:
>> +          qcom,memory-type:
>> +            $ref: /schemas/types.yaml#/definitions/uint32
>> +            enum: [0, 1, 2]
>> +            description: |
>> +              Memory Bus Identifier
>> +              0 = QCOM_MEM_TYPE_DDR
>> +              1 = QCOM_MEM_TYPE_LLCC
>> +              2 = QCOM_MEM_TYPE_DDR_QOS
> 
> I'm sorry if this has been discussed and frowned upon, but can you
> squash memory type into device node?

I don't think anyone had any strong opinions on how the
nodes is to be named. We went with a generic node name since
it could accomodate multiple instances of llcc or ddr in the
future. We didn't want it be named ddr-0/ddr-1 and so on. So
I'll continue to stick with the current naming unless you have
a strong reason other than readability.

> 
> protocol@80 {
> 	ddr {
> 	};
> 
> 	llcc {
> 	};
> 
> 	ddr-qos {
> 	};
> };
> 
>> +
>> +          freq-table-hz:
>> +            items:
>> +              items:
>> +                - description: Minimum frequency of the memory bus in Hz
>> +                - description: Maximum frequency of the memory bus in Hz
> 
> Does it make sense for the DDR-QOS type? Can we hardcode those values
> and drop freq-table-hz from the DDR-QOS node?
> 
> Also, can we drop this completely by adding one extra OPP entry with the
> minimum memory bus frequency?

the map table doesn't necessarily list all the supported
frequencies. It was made that way so that the table is flexible
enough that it doesn't have to be changed a lot across platforms.
Hence a need for a separate property to list min/max freq.

> 
>> +
>> +        patternProperties:
>> +          '^monitor-[0-9]$':
>> +            type: object
>> +            unevaluatedProperties: false
>> +            description:
>> +              The list of all monitors detecting the memory latency bound workloads using
>> +              various counters.
>> +
>> +            properties:
>> +              qcom,compute-type:
>> +                description:
>> +                  Monitors of type compute perform bus dvfs based on a rudimentary CPU
>> +                  frequency to memory frequency map.
>> +                type: boolean
> 
> This seems to be redundant. If there is no qcom,ipm-ceil property, then
> it's qcom,compute-type, isn't it?

ack

> 
>> +
>> +              qcom,ipm-ceil:
>> +                $ref: /schemas/types.yaml#/definitions/uint32
>> +                description:
>> +                  Monitors having this property perform bus dvfs based on the same
>> +                  rudimentary table but the scaling is performed only if the calculated
>> +                  IPM (Instruction Per Misses) exceeds the given ceiling.
>> +
>> +              cpus:
>> +                $ref: /schemas/types.yaml#/definitions/phandle-array
>> +                description:
>> +                  Should be a list of phandles to CPU nodes (as described in
>> +                  Documentation/devicetree/bindings/arm/cpus.yaml).
> 
> Which CPU nodes? I see that the examples list all CPUs here. Do we
> really need them?

This observation is only valid for X1E where all the cpus have
identical freq charecteristics. Even with this case we need to
list them to handle cases where cpus gets disabled by the bootloader
on lower cored X1E parts i.e. we use this to figure out the actual
physical mask.

> 
>> +
>> +              operating-points-v2: true
>> +              opp-table:
>> +                type: object
>> +
>> +            required:
>> +              - cpus
>> +              - operating-points-v2
>> +
>> +            oneOf:
>> +              - required: [ 'qcom,compute-type' ]
>> +              - required: [ 'qcom,ipm-ceil' ]
>> +
>> +        required:
>> +          - qcom,memory-type
>> +          - freq-table-hz
>> +
>> +additionalProperties: true
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/firmware/qcom,scmi-memlat.h>
>> +
>> +    firmware {
>> +        scmi {
>> +            compatible = "arm,scmi";
>> +            mboxes = <&cpucp_mbox 0>, <&cpucp_mbox 2>;
>> +            mbox-names = "tx", "rx";
>> +            shmem = <&cpu_scp_lpri0>, <&cpu_scp_lpri1>;
>> +
>> +            #address-cells = <1>;
>> +            #size-cells = <0>;
>> +
>> +            protocol@80 {
>> +                reg = <0x80>;
>> +
>> +                memory-0 {
>> +                    qcom,memory-type = <QCOM_MEM_TYPE_DDR>;
>> +                    freq-table-hz = /bits/ 64 <200000000 4224000000>;
>> +
>> +                    monitor-0 {
> 
> Hmm. Can we say that each memory type can have at most one IPM and one
> compute aka "passive" memlat monitor? Does it make sense to use them as
> node names and drop the extra monitor-M names?

Again this observation is valid only for X1E where the cpu freq
across cpu's are identical across clusters and is not true for
other mobile SoCs. So each memory can have more than 2 monitors
i.e. atleast one active/passibe monitor for each cluster.

> 
>> +                        qcom,ipm-ceil = <20000000>;
>> +                        cpus = <&CPU0 &CPU1 &CPU2 &CPU3 &CPU4 &CPU5 &CPU6 &CPU7
>> +                                &CPU8 &CPU9 &CPU10 &CPU11>;
> 
> Are CPU lists different between monitors? Can they be different? Can
> they be different between different memory types?

same explanation.

> 
>> +                        operating-points-v2 = <&memory0_monitor0_opp_table>;
>> +
>> +                        memory0_monitor0_opp_table: opp-table {
> 
> sensible names are better:

I think I just picked these names up from a cpufreq table upstream.

> 
> ddr_ipm_opp_table: opp-table {
> };
> 
>> +                            compatible = "operating-points-v2";
>> +
>> +                            opp-999000000 {
>> +                                opp-hz = /bits/ 64 <999000000 547000000>;
>> +                            };
>> +
>> +                            opp-1440000000 {
>> +                                opp-hz = /bits/ 64 <1440000000 768000000>;
>> +                            };
>> +
>> +                            opp-1671000000 {
>> +                                opp-hz = /bits/ 64 <1671000000 1555000000>;
>> +                            };
>> +
>> +                            opp-2189000000 {
>> +                                opp-hz = /bits/ 64 <2189000000 2092000000>;
>> +                            };
>> +
>> +                            opp-2516000000 {
>> +                                opp-hz = /bits/ 64 <2516000000 3187000000>;
>> +                            };
>> +
>> +                            opp-3860000000 {
>> +                                opp-hz = /bits/ 64 <3860000000 4224000000>;
>> +                            };
>> +                        };
>> +                    };
>> +
>> +                    monitor-1 {
>> +                        qcom,compute-type;
>> +                        cpus = <&CPU0 &CPU1 &CPU2 &CPU3 &CPU4 &CPU5 &CPU6 &CPU7
>> +                                &CPU8 &CPU9 &CPU10 &CPU11>;
>> +                        operating-points-v2 = <&memory0_monitor1_opp_table>;
>> +
>> +                        memory0_monitor1_opp_table: opp-table {
>> +                            compatible = "operating-points-v2";
>> +
>> +                            opp-1440000000 {
>> +                                    opp-hz = /bits/ 64 <1440000000 200000000>;
>> +                            };
>> +
>> +                            opp-2189000000 {
>> +                                    opp-hz = /bits/ 64 <2189000000 768000000>;
>> +                            };
>> +
>> +                            opp-2516000000 {
>> +                                    opp-hz = /bits/ 64 <2516000000 1555000000>;
>> +                            };
>> +
>> +                            opp-3860000000 {
>> +                                    opp-hz = /bits/ 64 <3860000000 4224000000>;
>> +                            };
>> +                        };
>> +                    };
>> +                };
>> +
>> +                memory-1 {
>> +                    qcom,memory-type = <QCOM_MEM_TYPE_LLCC>;
>> +                    freq-table-hz = /bits/ 64 <300000000 1067000000>;
>> +
>> +                    monitor-0 {
>> +                        qcom,ipm-ceil = <20000000>;
>> +                        cpus = <&CPU0 &CPU1 &CPU2 &CPU3 &CPU4 &CPU5 &CPU6 &CPU7
>> +                                &CPU8 &CPU9 &CPU10 &CPU11>;
>> +                        operating-points-v2 = <&memory1_monitor0_opp_table>;
>> +
>> +                        memory1_monitor0_opp_table: opp-table {
>> +                            compatible = "operating-points-v2";
>> +
>> +                            opp-999000000 {
>> +                                opp-hz = /bits/ 64 <999000000 300000000>;
>> +                            };
>> +
>> +                            opp-1440000000 {
>> +                                opp-hz = /bits/ 64 <1440000000 466000000>;
>> +                            };
>> +
>> +                            opp-1671000000 {
>> +                                opp-hz = /bits/ 64 <1671000000 600000000>;
>> +                            };
>> +
>> +                            opp-2189000000 {
>> +                                opp-hz = /bits/ 64 <2189000000 806000000>;
>> +                            };
>> +
>> +                            opp-2516000000 {
>> +                                opp-hz = /bits/ 64 <2516000000 933000000>;
>> +                            };
>> +
>> +                            opp-3860000000 {
>> +                                opp-hz = /bits/ 64 <3860000000 1066000000>;
>> +                            };
>> +                        };
>> +                    };
>> +                };
>> +
>> +                memory-2 {
>> +                    qcom,memory-type = <QCOM_MEM_TYPE_DDR_QOS>;
>> +                    freq-table-hz = /bits/ 64 <QCOM_DDR_LEVEL_AUTO QCOM_DDR_LEVEL_PERF>;
> 
> This is definitely not 'frequency of the memory bys in Hz'

ack, will change it.

-Sibi

> 
>> +
>> +                    monitor-0 {
>> +                        qcom,ipm-ceil = <20000000>;
>> +                        cpus = <&CPU0 &CPU1 &CPU2 &CPU3 &CPU4 &CPU5 &CPU6 &CPU7
>> +                                &CPU8 &CPU9 &CPU10 &CPU11>;
>> +                        operating-points-v2 = <&memory2_monitor0_opp_table>;
>> +
>> +                        memory2_monitor0_opp_table: opp-table {
>> +                            compatible = "operating-points-v2";
>> +
>> +                            opp-2189000000 {
>> +                                opp-hz = /bits/ 64 <2189000000>;
>> +                                opp-level = <QCOM_DDR_LEVEL_AUTO>;
>> +                            };
>> +
>> +                            opp-3860000000 {
>> +                                opp-hz = /bits/ 64 <3860000000>;
>> +                                opp-level = <QCOM_DDR_LEVEL_PERF>;
>> +                            };
>> +                        };
>> +                    };
>> +                };
>> +            };
>> +        };
>> +    };
>> diff --git a/include/dt-bindings/firmware/qcom,scmi-memlat.h b/include/dt-bindings/firmware/qcom,scmi-memlat.h
>> new file mode 100644
>> index 000000000000..7ae8d8d5623b
>> --- /dev/null
>> +++ b/include/dt-bindings/firmware/qcom,scmi-memlat.h
>> @@ -0,0 +1,22 @@
>> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
>> +/*
>> + * Copyright (c) 2024, Qualcomm Innovation Center, Inc. All rights reserved.
>> + */
>> +#ifndef __DT_BINDINGS_QCOM_SCMI_VENDOR_H
>> +#define __DT_BINDINGS_QCOM_SCMI_VENDOR
>> +
>> +/* Memory IDs */
>> +#define QCOM_MEM_TYPE_DDR	0x0
>> +#define QCOM_MEM_TYPE_LLCC	0x1
>> +#define QCOM_MEM_TYPE_DDR_QOS	0x2
>> +
>> +/*
>> + * QCOM_MEM_TYPE_DDR_QOS supports the following states.
>> + *
>> + * %QCOM_DDR_LEVEL_AUTO:	DDR operates with LPM enabled
>> + * %QCOM_DDR_LEVEL_PERF:	DDR operates with LPM disabled
>> + */
>> +#define QCOM_DDR_LEVEL_AUTO	0x0
>> +#define QCOM_DDR_LEVEL_PERF	0x1
>> +
>> +#endif /* __DT_BINDINGS_QCOM_SCMI_VENDOR_H */
>> -- 
>> 2.34.1
>>
> 

