Return-Path: <linux-arm-msm+bounces-40462-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 13B719E5109
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Dec 2024 10:17:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BE7C92820F8
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Dec 2024 09:17:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5355E1D5149;
	Thu,  5 Dec 2024 09:17:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="KRPiweYx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7354D1B4F3E;
	Thu,  5 Dec 2024 09:17:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733390269; cv=none; b=fd2A3K7SDvClWBpR9/pDdgDRg+WsKT+Pijgv+CzbkVhhaJ1oOIuT/1wDnyKJ/36aZp3v5sqBN5GPLjwD9Aq9tXhdsvHgtyQcIzkFiYYOK0LzBrVmEY8hr34+9K7HStPZW3uZVU+030oeKaYn9uaeNXcsmIwKnyiKRzX85f15mMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733390269; c=relaxed/simple;
	bh=vQmzFLaJSx6SjteTFCux3R+887jT41Wfnd8OGrMhxw4=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=JWiCKmefxPUjCtfuu8jWcowsq4r1JwrkRfpX6e9Ey5B6u5CePDt99wFiiw3Gyh3Lme6mGuANofYbu4RMqEueNZtKD7fRIrlVKo5ZvM95a/A+qTrOh694E1oaW1DKKb70SzAP3y9q4ZHc3EUpLhi0uuJoaOB2+lWOWo2rVuyBOfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=KRPiweYx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B57PDoj027833;
	Thu, 5 Dec 2024 09:17:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hehGs3DSedkJlfVRQiwWzeOctobZ+tIhhAtZy780hbM=; b=KRPiweYxDuGsVtXx
	ya5tnrXyywY+km0fJ3IKV7X64fP0Ymn99J1kKkFa6dj2NTlLKXADvBLiGVy4Zlut
	9SHpLxD3CtvUVOOcqDvC0KHOGr+8uibhwo0eZRvIvCML+0gLa/nNqDSRsp2mqqYA
	9BtKuk1gtfcahTbCDSu8gKRbJtGmXo+a36XZyZcXKaLaEQfdHQkJ9ZRszn9Mm1g8
	D74Suhkzmr73ylCwhuMf/iDWB67L5MnYQbp4w+z07wFYFcZ01wkXxbjvRibigsA6
	lEqj6MwvktnmQPpQwDSE8rGRDd6/sua5+PJqECGROF5ywTdnIOoiNKav6vviOyJs
	EiVW/g==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 439vceq4d1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 05 Dec 2024 09:17:41 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4B59Hfsn012499
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 5 Dec 2024 09:17:41 GMT
Received: from [10.50.18.22] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 5 Dec 2024
 01:17:38 -0800
Message-ID: <360dda0a-35e0-4fcb-a2bf-77d400d71623@quicinc.com>
Date: Thu, 5 Dec 2024 14:47:30 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 1/2] dt-bindings: mailbox: qcom: Document
 qcom,tmelite-qmp
To: Krzysztof Kozlowski <krzk@kernel.org>, <jassisinghbrar@gmail.com>,
        <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>
References: <20241205080633.2623142-1-quic_srichara@quicinc.com>
 <20241205080633.2623142-2-quic_srichara@quicinc.com>
 <e6759ca4-bcfb-4817-8a72-d1e9eb5d3d02@kernel.org>
Content-Language: en-US
From: Sricharan Ramabadhran <quic_srichara@quicinc.com>
In-Reply-To: <e6759ca4-bcfb-4817-8a72-d1e9eb5d3d02@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: GfoCj5VsCi31arbRmx0wMleQk88v9vo7
X-Proofpoint-ORIG-GUID: GfoCj5VsCi31arbRmx0wMleQk88v9vo7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 bulkscore=0 mlxlogscore=999 adultscore=0 suspectscore=0 spamscore=0
 impostorscore=0 phishscore=0 mlxscore=0 malwarescore=0 clxscore=1015
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412050064



On 12/5/2024 1:42 PM, Krzysztof Kozlowski wrote:
> On 05/12/2024 09:06, Sricharan R wrote:
>> From: Sricharan Ramabadhran <quic_srichara@quicinc.com>
>>
>> This binding describes the component responsible for communication
>> between the TME-L server based subsystems (Q6) and the TME-L client
>> (APPSS/BTSS/AUDIOSS), used for security services like secure image
>> authentication, enable/disable efuses, crypto services. Each client
>> in the   SoC has its own block of message RAM and IRQ for communication
>> with the TME-L SS. The protocol used to communicate in the message RAM
>> is known as Qualcomm Messaging Protocol (QMP).
> 
> This is RFC, so only limited review follows. I will review more once
> this is ready for review.
> 
Thanks. Once i get the design/approach confirmed, will post the V1.

>>
>> Signed-off-by: Sricharan Ramabadhran <quic_srichara@quicinc.com>
>> ---
>>   .../bindings/mailbox/qcom,tmelite-qmp.yaml    | 70 +++++++++++++++++++
>>   1 file changed, 70 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/mailbox/qcom,tmelite-qmp.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/mailbox/qcom,tmelite-qmp.yaml b/Documentation/devicetree/bindings/mailbox/qcom,tmelite-qmp.yaml
>> new file mode 100644
>> index 000000000000..1f2b3e02b894
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/mailbox/qcom,tmelite-qmp.yaml
>> @@ -0,0 +1,70 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/mailbox/qcom,tmelite-qmp.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Qualcomm TMELITE IPCC channel
>> +
>> +maintainers:
>> +  - Sricharan Ramabadhran <quic_srichara@quicinc.com>
>> +
>> +description:
>> +  This binding describes the component responsible for communication
> 
> 
> Describe the hardware, not the binding.
ho ok, will fix and move the hardware description here.

> 
>> +  between the TME-L server based subsystems (Q6) and the TME-L client
>> +  (APPSS/BTSS/AUDIOSS), used for security services like secure image
>> +  authentication, enable/disable efuses, crypto services. Each client
>> +  in the   SoC has its own block of message RAM and IRQ for communication
>> +  with the TME-L SS. The protocol used to communicate in the message RAM
>> +  is known as Qualcomm Messaging Protocol (QMP).
>> +
>> +properties:
>> +  compatible:
>> +    items:
>> +      - enum:
>> +          - qcom,ipq5424-tmelite-qmp
>> +      - const: qcom,tmelite-qmp
> 
> Drop generic compatible.
ok

> 
> 
>> +
>> +  reg:
>> +    maxItems: 1
>> +    description:
>> +      The base address and size of the message RAM for this client's
>> +      communication with the TMELITE core
> 
> Drop obvious description. Same everywhere else.
ok

> 
>> +
>> +  interrupts:
>> +    maxItems: 1
>> +    description:
>> +      Should specify the TMELITE message IRQ for this client
>> +
>> +  mboxes:
>> +    maxItems: 1
>> +    description:
>> +      Reference to the mailbox representing the outgoing doorbell in APCS for
>> +      this client, as described in mailbox/mailbox.txt
>> +
>> +  "#mbox-cells":
>> +    const: 2
>> +    description:
>> +      The first cell is the client-id, and the second cell is the signal-id.
> 
> I guess that's the only description not stating obvious.
> 
ok

>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - interrupts
>> +  - mboxes
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
>> +
>> +    tmel_qmp: qmp@32090000 {
> 
> Node names should be generic. See also an explanation and list of
> examples (not exhaustive) in DT specification:
> https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation
>
ho ok, will fix

> 
>> +           compatible = "qcom,ipq5424-tmelite-qmp", "qcom,tmelite-qmp";
> 
> Use 4 spaces for example indentation.
>
ok

Regards,
  Sricharan

