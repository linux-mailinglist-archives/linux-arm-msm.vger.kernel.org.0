Return-Path: <linux-arm-msm+bounces-43912-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 67377A00DA8
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jan 2025 19:34:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7E910188484B
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jan 2025 18:34:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E9511FC105;
	Fri,  3 Jan 2025 18:34:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="hNmlvHzs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47DC81FA84F;
	Fri,  3 Jan 2025 18:34:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735929256; cv=none; b=k/RUMaguOFhj9VlHJLQgFPkZGTdwIXOTwDOYzfCWS/Gh6RpLKaWjgemGgSO+inGschZUxiYzEwnXptzn4sOCLxuhaWvspB5XKepsK+B1z5sYLFypXYxNSow0HDcxS0rfdy+PEZK4WvQY7tt48j6oDUDhfQxN1xiCAYewOt86pRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735929256; c=relaxed/simple;
	bh=8ws6DcQWYD2jBTRUCJkacEkqED20Ym3+ZTc+iZb0QG0=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=QVLbE0FWbx8i1SE6amTHhpeMlCrkiivjTbg/SRF7dolYx0de4EvDCqtUTL8WycXuupsn6peW5AaBAiRhjPGLAHqkLFICqfAzFU6g26N4/9QQOuhiOoY/R55WFDUM+1RL2lAs6umOnASpDcz8D80HXUZGiFZpnjCIcS5OCpesDtw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=hNmlvHzs; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 503BIhCN007384;
	Fri, 3 Jan 2025 18:34:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9Jn6/uMwkRLHpbXKlMxXOW7CoRMPOMbrSlF+Vqz/5aU=; b=hNmlvHzsQzNj/Jyw
	mFgDelwsZ3/dtSZVfjFNlP//qrPnQ5ToxaRFDB8EihYGBJSHN9XW7qjeV7g2JrIx
	QtkgwuoVc8IYBvujCrHqzIa+0QAOjWPRWLQhCY91LM5IsRLeKjS4k5Llh5j2fNJ0
	XstB+jEVqqy6wxjZ9DSnNxTZrh0LxB7aZm1sLi1c2b0c3ukBO6H2g1BlQHM6Ph0Y
	pCKe5LyUV+d3y4nhVEumLy3gTrOnrEWkEd+MYQTmukqqSZrdqyHxTYgoh2tGwtEf
	nmLPLBCLXYK3DzI1QBu5uzZ9jFP2/JTvVNP+JBbszCL7TXwB8WnSSyUbouLWP3Rr
	T5O/Cw==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43xewfgt75-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 03 Jan 2025 18:34:09 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 503IY8NC027294
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 3 Jan 2025 18:34:08 GMT
Received: from [10.50.14.170] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 3 Jan 2025
 10:34:04 -0800
Message-ID: <ac15561f-b9e7-4434-af1a-04408172d46c@quicinc.com>
Date: Sat, 4 Jan 2025 00:04:01 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 1/2] dt-bindings: mailbox: Document qcom,tmel-qmp
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: <jassisinghbrar@gmail.com>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <andersson@kernel.org>, <konradybcio@kernel.org>,
        <manivannan.sadhasivam@linaro.org>, <dmitry.baryshkov@linaro.org>
References: <20241231054900.2144961-1-quic_srichara@quicinc.com>
 <20241231054900.2144961-2-quic_srichara@quicinc.com>
 <kwtzvcoyayml3tgicnp5a75r65hqpicm7hivtk25ohp6rt34qf@sgunxjxfe33r>
Content-Language: en-US
From: Sricharan Ramabadhran <quic_srichara@quicinc.com>
In-Reply-To: <kwtzvcoyayml3tgicnp5a75r65hqpicm7hivtk25ohp6rt34qf@sgunxjxfe33r>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: H9l5LPR1rgLC4uLFcjUx-l9Yvru7-HsD
X-Proofpoint-ORIG-GUID: H9l5LPR1rgLC4uLFcjUx-l9Yvru7-HsD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 malwarescore=0
 spamscore=0 mlxlogscore=999 clxscore=1015 suspectscore=0 bulkscore=0
 mlxscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501030163



On 12/31/2024 2:02 PM, Krzysztof Kozlowski wrote:
> On Tue, Dec 31, 2024 at 11:18:59AM +0530, Sricharan R wrote:
>> From: Sricharan Ramabadhran <quic_srichara@quicinc.com>
>>
>> TMEL SS provides different kinds of services like secureboot, remote image
>> authentication, key management, crypto, OEM provisioning etc. This patch adds
>> support for remote image authentication. Support for rest of the services can
>> be added.
>>
>> The QMP mailbox is the primary means of communication between TMEL SS and other
>> subsystem on the SoC. A dedicated pair of inbound and outbound mailboxes is
>> implemented for each subsystem/external execution environment which needs to
>> communicate with TMEL for security services. The inbound mailboxes are used to
>> send IPC requests to TMEL, which are then processed by TMEL firmware and
>> accordingly the responses are sent to the requestor via outbound mailboxes.
>>
>> It is an IPC transport protocol which is light weight and supports a subset of
>> API's. It handles link initialization, negotiation, establishment and
>> communication across client(APPSS/BTSS/AUDIOSS) and server(TMEL SS).
> 
> 
> You already got comment about wrapping, so implement it.
> 
ok.

> ...
> 
> 
>> This binding describes the component responsible for communication between the
>> TMEL server based subsystems (Q6) and the TMEL client (APPSS/BTSS/AUDIOSS),
> 
> APPSS? Applications Safe Software? Avoid using qcom terminology. Common
> name is "CPU" for example. Or explain qcom terminology...
> 
>
Ho, wanted to mention APSS (Application processor sub system). will fix.

>> used for security services like secure image authentication, enable/disable
>> efuses, crypto services. Each client in the   SoC has its own block of message
> 
> No need for double space "  ".
> 
ok.

>> RAM and IRQ for communication with the TMEL SS.
>>
>> Signed-off-by: Sricharan Ramabadhran <quic_srichara@quicinc.com>
>> ---
>>    [V2]  Added HW description as per comments.
>>          Removed the fallback compatible.
>>          Fixed naming convention to TME-L in all places.
>>          Fixed indendation for example.
>>          Removed the 'description' for some items.
>>
>>   .../bindings/mailbox/qcom,tmel-qmp.yaml       | 65 +++++++++++++++++++
>>   1 file changed, 65 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/mailbox/qcom,tmel-qmp.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/mailbox/qcom,tmel-qmp.yaml b/Documentation/devicetree/bindings/mailbox/qcom,tmel-qmp.yaml
>> new file mode 100644
>> index 000000000000..a434359e0a2c
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/mailbox/qcom,tmel-qmp.yaml
> 
> No, use compatible as filename.
>
ok.


>> @@ -0,0 +1,65 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/mailbox/qcom,tmel-qmp.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Qualcomm TMEL IPCC channel
>> +
>> +maintainers:
>> +  - Sricharan Ramabadhran <quic_srichara@quicinc.com>
>> +
>> +description:
>> +  TMEL SS provides different kinds of services like secureboot, remote image
>> +  authentication, key management, crypto, OEM provisioning etc. This patch adds
>> +  support for remote image authentication. Support for rest of the services can
>> +  be added.
>> +
>> +  The QMP mailbox is the primary means of communication between TMEL SS and
>> +  other subsystem on the SoC. A dedicated pair of inbound and outbound mailboxes
>> +  is implemented for each subsystem/external execution environment which needs to
>> +  communicate with TMEL for security services. The inbound mailboxes are used to
>> +  send IPC requests to TMEL, which are then processed by TMEL firmware and
>> +  accordingly the responses are sent to the requestor via outbound mailboxes.
>> +
>> +properties:
>> +  compatible:
>> +    items:
>> +      - enum:
>> +          - qcom,ipq5424-tmel-qmp
> 
> 
> Why qmp? Can TMEL on IPQ5424 be anything else? Can TMEL be SMEM or using
> any other remoteproc?
>
TMEL on IPQ5424 uses only QMP protocol for communication.

>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  interrupts:
>> +    maxItems: 1
>> +
>> +  mboxes:
>> +    maxItems: 1
>> +
>> +  "#mbox-cells":
>> +    const: 2
>> +    description:
>> +      The first cell is the client-id, and the second cell is the signal-id.
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
>> +    tmel_qmp: mailbox@32090000 {
> 
> Drop unused label.
ok.

Regards,
  Sricharan

