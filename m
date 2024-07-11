Return-Path: <linux-arm-msm+bounces-25983-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 385DD92E991
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jul 2024 15:32:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 89C00B25B36
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jul 2024 13:32:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B40515F402;
	Thu, 11 Jul 2024 13:32:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ItlswVci"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CC0215F3E2;
	Thu, 11 Jul 2024 13:32:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720704736; cv=none; b=LXlaJxE5X5XT4Lf8eJx2ymb88sbfzVMvDbgMO4yCZXIR++aStph0xg9GPizsAsdV90Xc+CeLOPt+jYVvcOOCg5pow8jqt0bupzZg8vYYmzm/nqMet9J31TIT6B2rc/bATkxQ8Wv4k4tPHyaI2IMrrJYvXJH4FaTNTWugAgHgWCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720704736; c=relaxed/simple;
	bh=eFuzLac7foMPW6I4Tocmb609CXQJgKqcokCHcsV6CnE=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=krx7r6Hkd9vJ2hu6g8GvQrKaYBulb6/fDGFnNKymnImXxgqsg/uvDpdHXPhFolalrtoTtWHdQCBbUoZXzRfYuaQkd6coIqCKH2Hclq3NTc9vzysdNu8xMLX9rso+zAb7UW6vCo20JcCMLh7ybnH+GI+ovZtz6aFC7bOVlCbdJuI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ItlswVci; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46BDND3e008799;
	Thu, 11 Jul 2024 13:32:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WBFA3sbkNAkvOjNHMVUjSv4RnDdP0v5mOQAFzD+Ajc0=; b=ItlswVci58rXIRZl
	JxqJhWZSPxvyOAhn/rt9Gha2O212qrB5HHy1wz+cBHTkY0HTdncjAhLXWCsgwqRg
	Otn9m1bovBSPGAHe/wPkMjl+gnQDqbmiLi8yuoOX4QKmRmGy3jpUXuzkecfoJw8n
	SK5SFulfuAoEze8S13dnzXDcQKaNPowQ+BYxGQcbq035jBTnUAeRMM0N21CP+p7E
	0qDVU2jAgdbXYdWKK7g8uVgJACo4Q4R6RFZEs19OIaz73phnwj6Xb+UtvdjO93PV
	ykMNBl4PkmjjyLtqWrU5zYoY4xcoZRVVHxnPZ9PVVqfhwxvHhJatTJPX5PCyzSNu
	XZ+nww==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 406x51cqgt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 11 Jul 2024 13:32:04 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 46BDW2i4028575
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 11 Jul 2024 13:32:02 GMT
Received: from [10.131.33.37] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 11 Jul
 2024 06:31:57 -0700
Message-ID: <19a22562-28e2-0f8e-a77a-bf7ed0b577e0@quicinc.com>
Date: Thu, 11 Jul 2024 19:01:49 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [RFC V3 1/4] dt-bindings: firmware: Document bindings for ARM
 SCMI QCOM Vendor Protocol
Content-Language: en-US
To: Cristian Marussi <cristian.marussi@arm.com>
CC: <sudeep.holla@arm.com>, <andersson@kernel.org>, <konrad.dybcio@linaro.org>,
        <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <quic_rgottimu@quicinc.com>, <quic_kshivnan@quicinc.com>,
        <conor+dt@kernel.org>
References: <20240702191440.2161623-1-quic_sibis@quicinc.com>
 <20240702191440.2161623-2-quic_sibis@quicinc.com> <Zo1lqcjPEDRMXDJm@pluto>
From: Sibi Sankar <quic_sibis@quicinc.com>
In-Reply-To: <Zo1lqcjPEDRMXDJm@pluto>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: BLR_8oEzMYoycK06S0Xq7JZjYwxZn8cs
X-Proofpoint-ORIG-GUID: BLR_8oEzMYoycK06S0Xq7JZjYwxZn8cs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-11_09,2024-07-11_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 adultscore=0
 suspectscore=0 impostorscore=0 mlxlogscore=999 mlxscore=0 bulkscore=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 phishscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2407110097



On 7/9/24 22:02, Cristian Marussi wrote:
> On Wed, Jul 03, 2024 at 12:44:37AM +0530, Sibi Sankar wrote:
>> Document the various memory buses that can be monitored and scaled by the
>> memory latency governor hosted by the ARM SCMI QCOM Vendor protocol v1.0.
>>
>> Signed-off-by: Sibi Sankar <quic_sibis@quicinc.com>

Hey Christian,

Thanks for taking time to review the series :)

>> ---
> 
> Hi Sibi,
> 
> this series got a bit neglected...my bad...a few comments down below.
> 
>>
>> Adding a reg property in scmi-memlat.yaml seems incorrect/superfluous
>> but without it I see the following errors:
>>
>> Err Logs:
>> protocol@80: 'reg' does not match any of the regexes: '^memory-[0-9]$', 'pinctrl-[0-9]+'
>> protocol@80: Unevaluated properties are not allowed ('memory-0', 'memory-1', 'memory-2' were unexpected)
>>
>> v2:
>> * Drop container dvfs memlat container node. [Rob]
>> * Move scmi-memlat.yaml to protocol level given that a lot of vendors might end up
>>    using the same protocol number. [Rob]
>> * Replace qcom,cpulist with the standard "cpus" property. [Rob]
>> * Fix up compute-type/ipm-ceil required. [Rob]
>>
> 
> ...so there has been a lot of work around Vendor protos recently (as you
> have seen) and especially around the way we define the DT bindings to have
> multiple vendor protocols coexist with the same overlapping numbers.
> (the code-level coexistence is already in place as you've seen...)
> 
> I think some sort of agreement on HOW to render this in the bindings
> side was reached around a series from NXP...not sure if I am missing something
> here but this commit from Peng/NXP (if you have not seen it already):
> https://lore.kernel.org/linux-arm-kernel/20240621-imx95-bbm-misc-v2-v5-2-b85a6bf778cb@nxp.com/
> 
> ...it is a good example of how you can define your vendor specific part in
> a vendor specific binding files and then just add a single $ref line in
> the core binding Documentation/devicetree/bindings/firmware/arm,scmi.yaml
> (and that has been successfully reviewd...)
> 
> Moreover, in that same series from Peng/NXP you could have a look at
> https://lore.kernel.org/linux-arm-kernel/20240621-imx95-bbm-misc-v2-v5-1-b85a6bf778cb@nxp.com/
> 
> that adds the Documentation for their Vendor protocols.
> Beside the final location in the tree for such docs, which is a detail
> we can settle later on our side too, I think that patch is a good example
> of the kind of vendor-protos Documentation Sudeep is expecting.
> 
> 
>>   .../bindings/firmware/arm,scmi.yaml           |  15 ++
>>   .../bindings/soc/qcom/qcom,scmi-memlat.yaml   | 242 ++++++++++++++++++
>>   include/dt-bindings/soc/qcom,scmi-vendor.h    |  22 ++
>>   3 files changed, 279 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/soc/qcom/qcom,scmi-memlat.yaml
>>   create mode 100644 include/dt-bindings/soc/qcom,scmi-vendor.h
>>
>> diff --git a/Documentation/devicetree/bindings/firmware/arm,scmi.yaml b/Documentation/devicetree/bindings/firmware/arm,scmi.yaml
>> index 4d823f3b1f0e..a4022682e5ca 100644
>> --- a/Documentation/devicetree/bindings/firmware/arm,scmi.yaml
>> +++ b/Documentation/devicetree/bindings/firmware/arm,scmi.yaml
>> @@ -284,6 +284,21 @@ properties:
>>       required:
>>         - reg
>>   
>> +  protocol@80:
>> +    type: object
>> +    allOf:
>> +      - $ref: '#/$defs/protocol-node'
>> +      - $ref: /schemas/soc/qcom/qcom,scmi-memlat.yaml#
>> +
>> +    unevaluatedProperties: false
>> +
>> +    properties:
>> +      reg:
>> +        const: 0x80
>> +
>> +    required:
>> +      - reg
>> +
> 
> ..here you should be able to just plant your $ref without redefining the
> protocol@80
> 
>>   additionalProperties: false
>>   
>>   $defs:
>> diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,scmi-memlat.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,scmi-memlat.yaml
>> new file mode 100644
>> index 000000000000..915a6bf5697f
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/soc/qcom/qcom,scmi-memlat.yaml
>> @@ -0,0 +1,242 @@
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
>> +description:
>> +  This binding describes the various memory buses that can be monitored and scaled
>> +  by memory latency governor running on the CPU Control Processor (SCMI controller).
>> +
> 
> ...and instead here you will define your protocols, compliant with the
> main protocol-node def and any specific vendor sub-properties that you
> should need....
> 
> ...the above example from NXP is probably more clear than any attempt of mine
> to explain this :P

ack, will adhere to the same in the next re-spin.

> 
> Thanks,
> Cristian
> 

