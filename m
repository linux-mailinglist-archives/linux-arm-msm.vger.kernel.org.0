Return-Path: <linux-arm-msm+bounces-2775-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C31D7FFF6B
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Dec 2023 00:25:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D7F6BB20E53
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Nov 2023 23:25:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5384959534;
	Thu, 30 Nov 2023 23:25:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="JUlpujqb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D63891710;
	Thu, 30 Nov 2023 15:25:12 -0800 (PST)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3AUMv1ds007817;
	Thu, 30 Nov 2023 23:24:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=dzdwa52RQD+dDIN5fCjoN/RBg7vTB76JT4geO1rWUWs=;
 b=JUlpujqbfV3FJWXKWzbm+qCutDkbwjRAVycUZZ4U6h0HDb9nxyj7Md3e139Io7p/T0G2
 KNTh4CPupPHbDPAWM5cKxMgi72BYb0aV+Iw+2aRYA6feshcd/EuWcZfOI4F1PT7t3I/f
 H0NXVn1BVkVPJCOx6W7N/325jS73Ado/ASQ/NM8tdAr4iPHE96aVAzifePuVHZN+3rJ1
 2G/HG6PkhIR57BywSnIpUQgs2KZ3T03neyZaowpY88nG8aRgYXnDKybCxOriA+6lzO1p
 0Cu4Gb9lU7p3BQJv1j7UcWejJqeYxVd/O7/O6r++iqo0R5e6+KGYFCL2Nf9ZmXsaq/DK 8w== 
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3upv481b03-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 30 Nov 2023 23:24:56 +0000
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3AUNOtCO030237
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 30 Nov 2023 23:24:55 GMT
Received: from [10.251.45.12] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Thu, 30 Nov
 2023 15:24:51 -0800
Message-ID: <cc2eb772-ae0f-4861-a36e-304a5f45b1bf@quicinc.com>
Date: Fri, 1 Dec 2023 01:24:48 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/6] dt-bindings: iommu: Add Translation Buffer Unit
 bindings
Content-Language: en-US
To: Rob Herring <robh@kernel.org>
CC: <krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>,
        <will@kernel.org>, <robin.murphy@arm.com>, <joro@8bytes.org>,
        <devicetree@vger.kernel.org>, <andersson@kernel.org>,
        <konrad.dybcio@linaro.org>, <linux-arm-kernel@lists.infradead.org>,
        <iommu@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <quic_cgoldswo@quicinc.com>,
        <quic_sukadev@quicinc.com>, <quic_pdaly@quicinc.com>,
        <quic_sudaraja@quicinc.com>, <djakov@kernel.org>
References: <20231118042730.2799-1-quic_c_gdjako@quicinc.com>
 <20231118042730.2799-2-quic_c_gdjako@quicinc.com>
 <20231127181347.GA1953740-robh@kernel.org>
From: Georgi Djakov <quic_c_gdjako@quicinc.com>
In-Reply-To: <20231127181347.GA1953740-robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: r9Ny_bSdGNAkhGlvkpVOItl5sxEyNfkt
X-Proofpoint-ORIG-GUID: r9Ny_bSdGNAkhGlvkpVOItl5sxEyNfkt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-30_23,2023-11-30_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 malwarescore=0
 spamscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0 mlxscore=0
 phishscore=0 suspectscore=0 bulkscore=0 priorityscore=1501 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2311060000
 definitions=main-2311300173

Hi Rob,

Thanks for the feedback!

On 11/27/2023 8:13 PM, Rob Herring wrote:
> On Fri, Nov 17, 2023 at 08:27:25PM -0800, Georgi Djakov wrote:
>> The "apps_smmu" on the Qualcomm sdm845 platform is an implementation
>> of the SMMU-500, that consists of a single TCU (Translation Control
>> Unit) and multiple TBUs (Translation Buffer Units). The TCU is already
>> being described in the generic SMMU DT schema. Add also bindings for
>> the TBUs to describe their properties and resources that needs to be
>> managed in order to operate them.
>>
>> In this DT schema, the TBUs are modelled as child devices of the TCU
>> and each of them is described with it's register space, clocks, power
>> domains, interconnects etc.
>>
>> Signed-off-by: Georgi Djakov <quic_c_gdjako@quicinc.com>
>> ---
>>  .../devicetree/bindings/iommu/arm,smmu.yaml   | 25 ++++++
>>  .../bindings/iommu/qcom,qsmmuv500-tbu.yaml    | 89 +++++++++++++++++++
>>  2 files changed, 114 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/iommu/qcom,qsmmuv500-tbu.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
>> index aa9e1c0895a5..f7f89be5f7a3 100644
>> --- a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
>> +++ b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
>> @@ -231,6 +231,18 @@ properties:
>>        enabled for any given device.
>>      $ref: /schemas/types.yaml#/definitions/phandle
>>  
>> +  '#address-cells':
>> +    enum: [ 1, 2 ]
>> +
>> +  '#size-cells':
>> +    enum: [ 1, 2 ]
>> +
>> +  ranges: true
>> +
>> +patternProperties:
>> +  "^tbu@[0-9a-f]*":
>> +    type: object
>> +
>>  required:
>>    - compatible
>>    - reg
>> @@ -453,6 +465,19 @@ allOf:
>>              - description: Voter clock required for HLOS SMMU access
>>              - description: Interface clock required for register access
>>  
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            const: qcom,smmu-500
> 
> Doesn't match your example. No failure either, so there's some problem 
> with your schema. The issue is the tbu@ entry above has no constraint on 
> child properties. Dropping it would solve the issue. However, having a 
> TBU is not QCom specific, so that doesn't feel right.

Having a TBU is not Qcom specific. The ARM MMU-500 implementation for example has TBUs, but the registers are within the SMMU address space, there are no clocks, no power-domains or other resources. Not sure about other implementations. So should we just allow empty tbu child nodes with no properties?

>> +    then:
>> +      patternProperties:
>> +        "^tbu@[0-9a-f]*":
> 
> '+' rather than '*' as 1 is the minimum, not 0.

Ok.

>> +          $ref: qcom,qsmmuv500-tbu.yaml
>> +          unevaluatedProperties: false
>> +      properties:
>> +        ranges: true
>> +
>>    # Disallow clocks for all other platforms with specific compatibles
>>    - if:
>>        properties:
>> diff --git a/Documentation/devicetree/bindings/iommu/qcom,qsmmuv500-tbu.yaml b/Documentation/devicetree/bindings/iommu/qcom,qsmmuv500-tbu.yaml
>> new file mode 100644
>> index 000000000000..4dc9d0ca33c9
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/iommu/qcom,qsmmuv500-tbu.yaml
>> @@ -0,0 +1,89 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/iommu/qcom,qsmmuv500-tbu.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Qualcomm TBU (Translation Buffer Unit)
>> +
>> +maintainers:
>> +  - Georgi Djakov <quic_c_gdjako@quicinc.com>
>> +
>> +description:
>> +  The Qualcomm SMMU500 implementation consists of TCU and TBU. The TBU contains
>> +  a Translation Lookaside Buffer (TLB) that caches page tables. TBUs provides
>> +  debug features to trace and trigger debug transactions. There are multiple TBU
>> +  instances distributes with each client core.
>> +
>> +properties:
>> +  $nodename:
>> +    pattern: "^tbu@[0-9a-f]+$"
> 
> Drop. You defined this in the parent already.

Ok.

>> +
>> +  compatible:
>> +    const: qcom,qsmmuv500-tbu
>> +
>> +  reg:
>> +    items:
>> +      - description: Address and size of the TBU's register space.
>> +
>> +  reg-names:
>> +    items:
>> +      - const: base
> 
> Not a useful name. Drop.

Agree.

>> +
>> +  clocks:
>> +    maxItems: 1
>> +
>> +  interconnects:
>> +    maxItems: 1
>> +
>> +  power-domains:
>> +    maxItems: 1
>> +
>> +  qcom,stream-id-range:
>> +    $ref: /schemas/types.yaml#/definitions/uint32-array
>> +    description: Stream ID range (address and size) that is assigned by the TBU
>> +    items:
>> +      minItems: 2
>> +      maxItems: 2
> 
> Perhaps implementations other than QCom's needs this?

Yes, maybe. A TBU can service a fixed amount of stream IDs and this looks like something common for all TBUs. I'll drop the vendor prefix.

Thanks,
Georgi

