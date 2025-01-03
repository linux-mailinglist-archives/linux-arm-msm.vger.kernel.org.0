Return-Path: <linux-arm-msm+bounces-43871-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 007F7A008F4
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jan 2025 12:56:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7B56C7A1F6D
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jan 2025 11:56:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2CEF1FA14B;
	Fri,  3 Jan 2025 11:56:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="FDjO494k"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12AE21F9F6F;
	Fri,  3 Jan 2025 11:56:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735905374; cv=none; b=oDNZPi3nPmoMfsfEUHGT3P0BChof+4tkG2vVA9ykItpZ+zYISpCOLKm5RkcL8MUneqBCLbwVRVdOuqetC9zR7c2DBS+rn+OvFCZkB9GJcAJ6LD/AuXITByFsXiyI1UdzYv0V/Y43u9P9y4psdhuKcuIb37R58d9hqbHUH6KymKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735905374; c=relaxed/simple;
	bh=5SzYZ4XqLsOtnHhcDu73UasszojhncWbtZzhU6bHNbA=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=nW3MmoP4fUlo2O3dU0fG5NGyaWAPCnb+y5UPKmdKkLQykD/pCuHS4eGlktfHblzmtclLih5Fij6AuYBCHdREPEkEw2GCkeKbe0X0d/9USE0RX6Uvc322xtEdpbo0GDKSndMlRpCz8hrJ5Ge21cgwTtA5mOrEjC/VwnrvwIOdIRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=FDjO494k; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5037FjBO010763;
	Fri, 3 Jan 2025 11:56:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/ZNw5e7vmEa0ftTRcBNKDPoOgdenR4E1LPnoOcQd9Aw=; b=FDjO494kW/zpyvuf
	DAwj6dgLmac/tJU4YqWEFFVhqAw3Lf14wwpw3vg6hEtXOXcqE8ip+5RJ+S6EkN/4
	D8Ddwl0djgRoNR9z8Iqd3Z18Al4oCCon9d5F3kRtKfAFKZivx/nNIhLoB2cpl17q
	wqH6CI1nTLuQ+RzqtYZQfnpvuoqYybuHFx4n70exj6cY9dDMjz3R0DYA56Xn4PMt
	npi1unnatR1XDqfyEGVcHJqr9dMREfvc++4xBy9P53xzGLCC9FyGJwZL9ViF3N5E
	l8wKKnntsFVxmZkBsjETtagegexi2UgzjgEZJF4O6E2Ji+FqJLoVyNitRffLW5Hn
	xTTe0A==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43xbbp0k28-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 03 Jan 2025 11:56:08 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 503Bu7j5013483
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 3 Jan 2025 11:56:07 GMT
Received: from [10.50.14.170] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 3 Jan 2025
 03:56:03 -0800
Message-ID: <01e4fdcb-cbc2-4e55-b00b-ea3cb987d026@quicinc.com>
Date: Fri, 3 Jan 2025 17:26:00 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 1/2] dt-bindings: mailbox: Document qcom,tmel-qmp
To: Varadarajan Narayanan <quic_varada@quicinc.com>
CC: <jassisinghbrar@gmail.com>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <andersson@kernel.org>, <konradybcio@kernel.org>,
        <manivannan.sadhasivam@linaro.org>, <dmitry.baryshkov@linaro.org>
References: <20241231054900.2144961-1-quic_srichara@quicinc.com>
 <20241231054900.2144961-2-quic_srichara@quicinc.com>
 <Z3OH4E6YIAJ2varv@hu-varada-blr.qualcomm.com>
Content-Language: en-US
From: Sricharan Ramabadhran <quic_srichara@quicinc.com>
In-Reply-To: <Z3OH4E6YIAJ2varv@hu-varada-blr.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: PPfol8tvtVWggVVw7MqkkGeN1SVtHwmr
X-Proofpoint-GUID: PPfol8tvtVWggVVw7MqkkGeN1SVtHwmr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 bulkscore=0
 phishscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501
 mlxscore=0 suspectscore=0 impostorscore=0 adultscore=0 mlxlogscore=999
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501030105



On 12/31/2024 11:27 AM, Varadarajan Narayanan wrote:
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
>>
>>     -----------------------------------------------       ---------------------------------------------------
>>    |                                              |       |                                                 |
>>    |                 SOC  CLIENT                  | SOC   |                TMEL  SS                        |
> 
> Fix alignment for last character in above line.
> 
ok.

>>    |                                              | AHB   |                                                 |
>>    |     ----------    ---------   ---------      |       | ------    -------     --------    ------------  |
>>    |     |        |    |       |   |       |      | WO    | |     | R |     |     |      |    |SERVICES   | |
>>    |     | APPS   |<-->| TMEL  |<->|       |------------->| | IN  |-->|     |     | TMEL |    |--------   | |
>>    |     |        |    | COM   |   | QMP   |      | RO    | |     | W | QMP |<--->| COM  |<-->| a) ATTEST | |
>>    |     |        |    |       |   |       |<-------------| | OUT |<--|     |     |      |    | b) CRYPTO | |
>>    |     |        |    |       |   |       |      |       | |     |   |     |     |      |    | .. more   | |
>>    |     ---------     ---------   ---------      |       | ------    -------     -------     ------------  |
>>    |                                              |       |                                                 |
>>     -----------------------------------------------       --------------------------------------------------
>>
>> This binding describes the component responsible for communication between the
>> TMEL server based subsystems (Q6) and the TMEL client (APPSS/BTSS/AUDIOSS),
>> used for security services like secure image authentication, enable/disable
>> efuses, crypto services. Each client in the   SoC has its own block of message
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
> 
> Should 'mbox-cells' also be a required property? Since tmel_qmp_parse_devicetree -> mbox_request_channel seems to expect it.
ok, will add.

Regards,
  Sricharan


