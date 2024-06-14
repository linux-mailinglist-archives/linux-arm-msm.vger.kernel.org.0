Return-Path: <linux-arm-msm+bounces-22745-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D77A1909369
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Jun 2024 22:30:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CF47A1C226DB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Jun 2024 20:30:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3B781836F9;
	Fri, 14 Jun 2024 20:30:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Y+Qd+1M+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4ABF14A4CF;
	Fri, 14 Jun 2024 20:30:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718397037; cv=none; b=ZjzJfYB9xzBlsEceHm7X2ryVqn5pqNbOXHnmz4leY1VLFOuVQYuHrVQZAxR2n4WdUre8aWqUc0fLlDsEtkDdtxZCxI2YEpjWfziYILHGhaMAWpBpTEg/g81hUY6b7zwA1a0GfYyJJdJ2hoULbLG0uTvNdV11qrapdo6VSDnbn7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718397037; c=relaxed/simple;
	bh=i+GYuBH4deuAMzLbZbJp8k3J9WIWhyDPoULBKiveZIw=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=k1VlmIqfWHahtkPIdiH9UkSXXex43+VDJ0vE2pzLg8moHIRNR7YSy0JxJvcKpjuC8Cuo5n5xifPUqHos8oXLD+rHm/nhx9u9ZC0lESqrT2clCjF6LO6O7mvqKGDes9tuTQzDrucmC292274wxXcDf/6+oKcXv6yCOuH2+aa51lo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Y+Qd+1M+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45E9uBuW001898;
	Fri, 14 Jun 2024 20:30:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SKZzSnNmBGLvVrFRCMOk90SXf4pI2wqapfbLj3tx9So=; b=Y+Qd+1M+KDsYVK+O
	h6NxVry6OopR+3aXoyjjqsPjdIjdXwlDi7eChFhbPfA3REeHSbU3AKJCAB2X7XUr
	ABFc6epVfcakE2KvYriqPmXG53kTGHEdHoHyOcXsES1wke86EFWEOsKgMJGLVsMg
	N3WkCWFXgFoleDOlcBxEunHiWVZNc4C14ARDYAs9DBcqRDq8ledZFWvKF3n+bBdZ
	7zGNwrXxuqybaz4le0mx4AJtLZOAXgGvOQLglwrqSjfZcfZNsNTSrM5BuQa+KfB8
	LThUm3jjznPGozGmFfinM5EsAopvXDCMNTO9WSz37S+KBD4LIq7jZJGbbUlmaYeK
	NVIkwQ==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yr6q4jm1d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 14 Jun 2024 20:30:22 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45EKUK5u013412
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 14 Jun 2024 20:30:20 GMT
Received: from [10.131.33.37] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 14 Jun
 2024 13:30:16 -0700
Message-ID: <4d21f140-351e-da3f-57b4-3041fb8684e9@quicinc.com>
Date: Sat, 15 Jun 2024 02:00:12 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [RFC V2 1/4] dt-bindings: firmware: Add support for QCOM Vendor
 Protocol
Content-Language: en-US
To: Rob Herring <robh@kernel.org>
CC: <sudeep.holla@arm.com>, <cristian.marussi@arm.com>, <andersson@kernel.org>,
        <konrad.dybcio@linaro.org>, <krzysztof.kozlowski+dt@linaro.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <quic_rgottimu@quicinc.com>, <quic_kshivnan@quicinc.com>,
        <conor+dt@kernel.org>
References: <20240612183031.219906-1-quic_sibis@quicinc.com>
 <20240612183031.219906-2-quic_sibis@quicinc.com>
 <20240613193625.GA2338851-robh@kernel.org>
From: Sibi Sankar <quic_sibis@quicinc.com>
In-Reply-To: <20240613193625.GA2338851-robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: PdPRlAZsWAUlcNRDk2u0id2oyrGaoedN
X-Proofpoint-GUID: PdPRlAZsWAUlcNRDk2u0id2oyrGaoedN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-14_17,2024-06-14_03,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 suspectscore=0 spamscore=0 impostorscore=0 lowpriorityscore=0 mlxscore=0
 bulkscore=0 adultscore=0 clxscore=1015 malwarescore=0 phishscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406140142



On 6/14/24 01:06, Rob Herring wrote:
> On Thu, Jun 13, 2024 at 12:00:28AM +0530, Sibi Sankar wrote:
>> Document the SCMI QCOM Vendor protocol v1.0 bindings and the various memory
>> buses that can be monitored and scaled by memory latency governor hosted
>> on it.
>>

Hey Rob,

Thanks for taking time to review the series :)

>> Signed-off-by: Sibi Sankar <quic_sibis@quicinc.com>
>> ---
>>
>> v1:
>> * Add missing bindings for the protocol. [Konrad/Dmitry]
>> * Use alternate bindings. [Dmitry/Konrad]
>>
>>   .../bindings/firmware/arm,scmi.yaml           |  21 ++
>>   .../bindings/soc/qcom/qcom,scmi-memlat.yaml   | 243 ++++++++++++++++++
>>   include/dt-bindings/soc/qcom,scmi-vendor.h    |  22 ++
>>   3 files changed, 286 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/soc/qcom/qcom,scmi-memlat.yaml
>>   create mode 100644 include/dt-bindings/soc/qcom,scmi-vendor.h
>>
>> diff --git a/Documentation/devicetree/bindings/firmware/arm,scmi.yaml b/Documentation/devicetree/bindings/firmware/arm,scmi.yaml
>> index 7de2c29606e5..21e4da53d02c 100644
>> --- a/Documentation/devicetree/bindings/firmware/arm,scmi.yaml
>> +++ b/Documentation/devicetree/bindings/firmware/arm,scmi.yaml
>> @@ -278,6 +278,27 @@ properties:
>>       required:
>>         - reg
>>   
>> +  protocol@80:
>> +    $ref: '#/$defs/protocol-node'
>> +    unevaluatedProperties: false
>> +
>> +    properties:
>> +      reg:
>> +        const: 0x80
>> +
>> +      memlat-dvfs:
> 
> I don't see the purpose of this container node.

Thanks, looks like I took a shortcut to show that the memory nodes
are logically placed with this abstraction. I'll should be able to
get it removed and achieve the same functionality.

> 
>> +        type: object
>> +        additionalProperties: false
>> +        description:
>> +          The list of all memory buses that can be monitored and scaled by the
>> +          memory latency governor running on the SCMI controller.
>> +
>> +        patternProperties:
>> +          '^memory-[0-9]$':
>> +            type: object
>> +            $ref: /schemas/soc/qcom/qcom,scmi-memlat.yaml#
> 
> This schema needs to be at the level of the protocol node. See the i.MX
> SCMI pinctrl patches for more details on what it should look like.

Thanks will take a look at that.

> 
>> +            unevaluatedProperties: false
>> +
>>   additionalProperties: false
>>   
>>   $defs:
>> diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,scmi-memlat.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,scmi-memlat.yaml
>> new file mode 100644
>> index 000000000000..c6e3d163c4a3
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/soc/qcom/qcom,scmi-memlat.yaml
>> @@ -0,0 +1,243 @@
>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/soc/qcom/qcom,scmi-memlat.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Qualcomm SCMI Memory Bus nodes
>> +
>> +maintainers:
>> +  - Sibi Sankar <quic_sibis@quicinc.com>
>> +
>> +description: |
> 
> Doesn't need '|' if no formatting.

ack

> 
>> +  This binding describes the various memory buses that can be monitored and scaled
>> +  by memory latency governor running on the CPU Control Processor (SCMI controller).
>> +
>> +properties:
>> +  qcom,memory-type:
>> +    $ref: /schemas/types.yaml#/definitions/uint32
>> +    enum: [0, 1, 2]
>> +    description:
> 
> Needs a '|' if you want your formatting preserved.

ack

> 
>> +      Memory Bus Identifier
>> +        0 = QCOM_MEM_TYPE_DDR
>> +        1 = QCOM_MEM_TYPE_LLCC
>> +        2 = QCOM_MEM_TYPE_DDR_QOS
>> +
>> +  freq-table-hz:
>> +    items:
>> +      items:
>> +        - description: Minimum frequency of the memory bus in Hz
>> +        - description: Maximum frequency of the memory bus in Hz
>> +
>> +patternProperties:
>> +  '^monitor-[0-9]$':
>> +    type: object
>> +    unevaluatedProperties: false
>> +    description:
>> +      The list of all monitors detecting the memory latency bound workloads using
>> +      various counters.
>> +
>> +    properties:
>> +      qcom,compute-type:
>> +        description:
>> +          Monitors of type compute perform bus dvfs based on a rudimentary CPU
>> +          frequency to memory frequency map.
>> +        type: boolean
>> +
>> +      qcom,ipm-ceil:
>> +        $ref: /schemas/types.yaml#/definitions/uint32
>> +        description:
>> +          Monitors having this property perform bus dvfs based on the same
>> +          rudimentary table but the scaling is performed only if the calculated
>> +          IPM (Instruction Per Misses) exceeds the given ceiling.
>> +
>> +      qcom,cpulist:
>> +        $ref: /schemas/types.yaml#/definitions/phandle-array
>> +        description:
>> +          List of phandles to the CPUs nodes whose frequency and IPM are to be
>> +          monitored.
> 
> We have a standard property for this: cpus

will use ^^ in the next re-spin

> 
>> +
>> +      operating-points-v2: true
>> +      opp-table:
>> +        type: object
>> +
>> +    required:
>> +      - qcom,cpulist
>> +      - operating-points-v2
>> +      - opp-table
>> +
> 
>> +    allOf:
>> +      - if:
>> +          properties:
>> +            qcom,compute-type: false
>> +        then:
>> +          required:
>> +            - qcom,ipm-ceil
>> +
>> +      - if:
>> +          properties:
>> +            qcom,ipm-ceil: false
>> +        then:
>> +          required:
>> +            - qcom,compute-type
> 
> Isn't all this just:
> 
> oneOf:
>    - required: [ qcom,compute-type ]
>    - required: [ qcom,ipm-ceil ]

ack, will use ^^ in the next re-spin.

-Sibi

> 
> 
>> +
>> +required:
>> +  - qcom,memory-type
>> +  - freq-table-hz
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/soc/qcom,scmi-vendor.h>
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
>> +                memlat-dvfs {
>> +                    memory-0 {
>> +                        qcom,memory-type = <QCOM_MEM_TYPE_DDR>;
>> +                        freq-table-hz = /bits/ 64 <200000000 4224000000>;
>> +
>> +                        monitor-0 {
>> +                            qcom,ipm-ceil = <20000000>;
>> +                            qcom,cpulist = <&CPU0 &CPU1 &CPU2 &CPU3 &CPU4 &CPU5 &CPU6 &CPU7
>> +                                            &CPU8 &CPU9 &CPU10 &CPU11>;
>> +                            operating-points-v2 = <&memory0_monitor0_opp_table>;
>> +
>> +                            memory0_monitor0_opp_table: opp-table {
>> +                                compatible = "operating-points-v2";
>> +
>> +                                opp-999000000 {
>> +                                    opp-hz = /bits/ 64 <999000000 547000000>;
>> +                                };
>> +
>> +                                opp-1440000000 {
>> +                                    opp-hz = /bits/ 64 <1440000000 768000000>;
>> +                                };
>> +
>> +                                opp-1671000000 {
>> +                                    opp-hz = /bits/ 64 <1671000000 1555000000>;
>> +                                };
>> +
>> +                                opp-2189000000 {
>> +                                    opp-hz = /bits/ 64 <2189000000 2092000000>;
>> +                                };
>> +
>> +                                opp-2516000000 {
>> +                                    opp-hz = /bits/ 64 <2516000000 3187000000>;
>> +                                };
>> +
>> +                                opp-3860000000 {
>> +                                    opp-hz = /bits/ 64 <3860000000 4224000000>;
>> +                                };
>> +                            };
>> +                        };
>> +
>> +                        monitor-1 {
>> +                            qcom,compute-type;
>> +                            qcom,cpulist = <&CPU0 &CPU1 &CPU2 &CPU3 &CPU4 &CPU5 &CPU6 &CPU7
>> +                                            &CPU8 &CPU9 &CPU10 &CPU11>;
>> +                            operating-points-v2 = <&memory0_monitor1_opp_table>;
>> +
>> +                            memory0_monitor1_opp_table: opp-table {
>> +                                compatible = "operating-points-v2";
>> +
>> +                                opp-1440000000 {
>> +                                        opp-hz = /bits/ 64 <1440000000 200000000>;
>> +                                };
>> +
>> +                                opp-2189000000 {
>> +                                        opp-hz = /bits/ 64 <2189000000 768000000>;
>> +                                };
>> +
>> +                                opp-2516000000 {
>> +                                        opp-hz = /bits/ 64 <2516000000 1555000000>;
>> +                                };
>> +
>> +                                opp-3860000000 {
>> +                                        opp-hz = /bits/ 64 <3860000000 4224000000>;
>> +                                };
>> +                            };
>> +                        };
>> +                    };
>> +
>> +                    memory-1 {
>> +                        qcom,memory-type = <QCOM_MEM_TYPE_LLCC>;
>> +                        freq-table-hz = /bits/ 64 <300000000 1067000000>;
>> +
>> +                        monitor-0 {
>> +                            qcom,ipm-ceil = <20000000>;
>> +                            qcom,cpulist = <&CPU0 &CPU1 &CPU2 &CPU3 &CPU4 &CPU5 &CPU6 &CPU7
>> +                                            &CPU8 &CPU9 &CPU10 &CPU11>;
>> +                            operating-points-v2 = <&memory1_monitor0_opp_table>;
>> +
>> +                            memory1_monitor0_opp_table: opp-table {
>> +                                compatible = "operating-points-v2";
>> +
>> +                                opp-999000000 {
>> +                                    opp-hz = /bits/ 64 <999000000 300000000>;
>> +                                };
>> +
>> +                                opp-1440000000 {
>> +                                    opp-hz = /bits/ 64 <1440000000 466000000>;
>> +                                };
>> +
>> +                                opp-1671000000 {
>> +                                    opp-hz = /bits/ 64 <1671000000 600000000>;
>> +                                };
>> +
>> +                                opp-2189000000 {
>> +                                    opp-hz = /bits/ 64 <2189000000 806000000>;
>> +                                };
>> +
>> +                                opp-2516000000 {
>> +                                    opp-hz = /bits/ 64 <2516000000 933000000>;
>> +                                };
>> +
>> +                                opp-3860000000 {
>> +                                    opp-hz = /bits/ 64 <3860000000 1066000000>;
>> +                                };
>> +                            };
>> +                        };
>> +                    };
>> +
>> +                    memory-2 {
>> +                        qcom,memory-type = <QCOM_MEM_TYPE_DDR_QOS>;
>> +                        freq-table-hz = /bits/ 64 <QCOM_DDR_LEVEL_AUTO QCOM_DDR_LEVEL_PERF>;
>> +
>> +                        monitor-0 {
>> +                            qcom,ipm-ceil = <20000000>;
>> +                            qcom,cpulist = <&CPU0 &CPU1 &CPU2 &CPU3 &CPU4 &CPU5 &CPU6 &CPU7
>> +                                            &CPU8 &CPU9 &CPU10 &CPU11>;
>> +                            operating-points-v2 = <&memory2_monitor0_opp_table>;
>> +
>> +                            memory2_monitor0_opp_table: opp-table {
>> +                                compatible = "operating-points-v2";
>> +
>> +                                opp-2189000000 {
>> +                                    opp-hz = /bits/ 64 <2189000000>;
>> +                                    opp-level = <QCOM_DDR_LEVEL_AUTO>;
>> +                                };
>> +
>> +                                opp-3860000000 {
>> +                                    opp-hz = /bits/ 64 <3860000000>;
>> +                                    opp-level = <QCOM_DDR_LEVEL_PERF>;
>> +                                };
>> +                            };
>> +                        };
>> +                    };
>> +                };
>> +            };
>> +        };
>> +    };
>> diff --git a/include/dt-bindings/soc/qcom,scmi-vendor.h b/include/dt-bindings/soc/qcom,scmi-vendor.h
>> new file mode 100644
>> index 000000000000..7ae8d8d5623b
>> --- /dev/null
>> +++ b/include/dt-bindings/soc/qcom,scmi-vendor.h
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

