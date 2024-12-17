Return-Path: <linux-arm-msm+bounces-42525-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 564BB9F4A36
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Dec 2024 12:46:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F0D70188D0BC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Dec 2024 11:46:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 004F31EC014;
	Tue, 17 Dec 2024 11:46:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="dKRV42C+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FCED1DA309;
	Tue, 17 Dec 2024 11:46:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734435963; cv=none; b=uF46+yt6kkkphHhIIril7vb5YWjCOFtYjPavGg2vEGI8cmnXycYTjy2UuMR2OTbNi0Zc77tuQlh1OGndtmHaINpsttF7Vcu+nsegVw971bl9oDrhkrDf8uUPfOZ8DO4W41xoRoCibcJFHHxdCIoglabRF014EbrD5HPAP2Jgrx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734435963; c=relaxed/simple;
	bh=COFCXH2KK4Ktwv1Vx85qgbKkoPJWqNa3c+oYUPg4W4s=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=H5Q1kl4nbQgBGI7JjVgnqKkOxvLE885ZBjWYkV+OQRGjtTz1T0+c5wDriQUCA1GkrmXADbA8K1V61GppPTJr9tEDgE13D5+g8bKtpCiy4XIlv5uNGdUkbUZGos1bcgUPXxh6tl/j3iAgvoAIUd/8/B+Ew/G9mZT1Av4eYI2F5E4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=dKRV42C+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BH6RlwC003621;
	Tue, 17 Dec 2024 11:45:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Poy8u1ERUTetn7gECjlsVW4OLmGxnHVpVe/HJdcMtgo=; b=dKRV42C+j64MEhKp
	Fnx43sgB9uOV8u7vGg6qq/US9uoYmP8hZbNqslciWthudHgz4R2qvuzlzFh4fTOX
	HAsgYVZZEjFQ2KxRyWGYsi6v+Yl2tjZDK/TlY7bRBGGZh88Dg1AZbybVYhGtS4Xs
	vQ4XzeijrAUiYccaDm9ZvtAVjkZMy79tqNoAgo+E12Qbw9/bBhyW0ATvZbr++vEe
	UOjAS8s7AEOL3md2pw9pv8fS6kE416gBEP1cNvsWbJKgzECGLnm+MiVtDns1rxEZ
	rf2aT07R9Fb2r0LPXMzpsi37TOs4AOCrhAiYZyzF1R1ArpZOt7fNn46pYI32RK27
	ACCVng==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43k424gvx2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Dec 2024 11:45:52 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BHBjpSk030176
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Dec 2024 11:45:51 GMT
Received: from [10.190.163.187] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 17 Dec
 2024 03:45:47 -0800
Message-ID: <b31d2e68-e4e0-97e6-158c-1b9ab8308551@quicinc.com>
Date: Tue, 17 Dec 2024 17:15:39 +0530
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
To: Sudeep Holla <sudeep.holla@arm.com>
CC: <cristian.marussi@arm.com>, <andersson@kernel.org>,
        <konrad.dybcio@linaro.org>, <robh+dt@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <quic_rgottimu@quicinc.com>,
        <quic_kshivnan@quicinc.com>, <conor+dt@kernel.org>,
        <arm-scmi@vger.kernel.org>
References: <20241007061023.1978380-1-quic_sibis@quicinc.com>
 <20241007061023.1978380-2-quic_sibis@quicinc.com> <Z1HGVhi5xebqc4d4@bogus>
From: Sibi Sankar <quic_sibis@quicinc.com>
In-Reply-To: <Z1HGVhi5xebqc4d4@bogus>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: zQ7Xp9YpOoJYodr4bEeXFjMVpfgIg2x3
X-Proofpoint-ORIG-GUID: zQ7Xp9YpOoJYodr4bEeXFjMVpfgIg2x3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 mlxlogscore=999 spamscore=0 bulkscore=0 clxscore=1015 adultscore=0
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 suspectscore=0
 mlxscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412170097



On 12/5/24 20:57, Sudeep Holla wrote:
> On Mon, Oct 07, 2024 at 11:40:19AM +0530, Sibi Sankar wrote:
>> Document the various memory buses that can be monitored and scaled by
>> the memory latency governor hosted by the QCOM SCMI Generic Extension
>> Protocol v1.0.
>>
>> Signed-off-by: Sibi Sankar <quic_sibis@quicinc.com>
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
>> +
>> +          freq-table-hz:
>> +            items:
>> +              items:
>> +                - description: Minimum frequency of the memory bus in Hz
>> +                - description: Maximum frequency of the memory bus in Hz
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
> And what exactly this list of cpu phandles represent here ?
> 
>> +
>> +              operating-points-v2: true
> 
> Can you elaborate why the protocol can't add a command to fetch this from
> the firmware to avoid any possible mismatch between the DT and firmware.
> 
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


Hey Sudeep,

Thanks for taking time to review the series :)

> 
> I am not sure if it is just me, but I find this binding hard to understand.
> Hence I thought I will look and the example and get better understanding
> instead.
> 
> So these monitors are numbered ? If there were any meaningful name it would

A memory type can have a variable number of monitors. The
monitors take in a table and memory type. They track the freq
of a group of cpus and put in requests to scale the memory
according to the table. The naming is just arbitrary here
and we can choose whatever that makes the most sense.


> have been slightly better but irrespective of that I find it hard as why
> the communication with firmware is not based on index and why they are not
> part of the bindings though I see indices used in the driver.
> 
>> +                    qcom,memory-type = <QCOM_MEM_TYPE_DDR>;
> 
> Also I see that the type can be easily derived from the index, care to
> elaborate why the firmware expects it to be sent, if not why is that
> information needed here in the DT ?

The firmware doesn't have any information on the memory available
for it to scale and relies of the linux telling it everything in
order to function.


-Sibi


> 

