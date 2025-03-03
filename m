Return-Path: <linux-arm-msm+bounces-49968-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 57829A4B845
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Mar 2025 08:22:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CF4713AFAC5
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Mar 2025 07:21:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7FA4D1E9B16;
	Mon,  3 Mar 2025 07:22:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="RqadlKcd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97B971E5B76;
	Mon,  3 Mar 2025 07:22:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740986525; cv=none; b=rWoIGCZTj/S+bMEZRzhiFPDneUHs0u6ouJYwEzLcEGAWbCncCPou51Tlv0qtt0+I6OhZyPBtmiiRakydTV4znNldkf8zsVT9mkyh8aqj5rpPZMGv0qthdSfTFpaAwu17NntEQ7Zl2rlnduziUdO5TfLHL9RYpvNmFQj/lzoGRI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740986525; c=relaxed/simple;
	bh=GJqAxXSYWniWgFDuASRZCzcna6rw3abw6iW+pr2fSLs=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=XqgZjYXWoMAoOSYw0V/z7jEuhgPs30pVmauSzgmFX7BYWqZeQGvNAzQ7c21ViKCqwBqBAxhdPSwjQ8NhYh+KLBp5Qk5vUb7UUgObTH5AK7JV8IW6ocxFBSamm/oCDhnf+//7UZMsJFXKM3KPYg1pT9+wjLTOy/8Be51uckxIsE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=RqadlKcd; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 522LWrhq027034;
	Mon, 3 Mar 2025 07:21:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bqa5QdZw5rjeIAaBH02FxPX964Zdnmjap87BgQFF0JU=; b=RqadlKcdvWqF3ST2
	2zLcT30S+HEcq+ZvzW/ULmKlP6joBxWzsLb6KDL18LXopOKfESBNHJcrt7zPee5u
	lWponGcT1UQxiG/cD5yNNnh9g4mjMgD5YrLrEI7Mnh8Zi7sal0qL3qFceim2oqy6
	ETEizywESkizareELq64XkPBRTF/geg28473t38MYi0yinT/le3sjLb2/matp7Pz
	QbzU+QIOWM+xBogVZjoJaFmM7QNvpNemHrVAUNQWs1tl5fwTeXgcQvj788E5fkZI
	7mVqzIkkhiRtjSlBF5kJkwrIhrRmaY4gDuTG/kH6GsawB1aKL3DbKWhKTw0t/BQC
	uCn5cw==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 453u0d3ptu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 03 Mar 2025 07:21:57 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5237LvYn005792
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 3 Mar 2025 07:21:57 GMT
Received: from [10.151.37.100] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sun, 2 Mar 2025
 23:21:53 -0800
Message-ID: <1a22a637-c3f1-49b3-adf5-3e952c7d336a@quicinc.com>
Date: Mon, 3 Mar 2025 12:51:44 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3 1/2] dt-bindings: mailbox: Document qcom,tmel-qmp
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: <jassisinghbrar@gmail.com>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <andersson@kernel.org>, <konradybcio@kernel.org>,
        <manivannan.sadhasivam@linaro.org>
References: <20250228045356.3527662-1-quic_srichara@quicinc.com>
 <20250228045356.3527662-2-quic_srichara@quicinc.com>
 <velvqajyhrdaipmqmsduv3l3dsv56sy4rfukwm2hrdvh47hgqx@7sbnrgkzsn67>
Content-Language: en-US
From: Sricharan Ramabadhran <quic_srichara@quicinc.com>
In-Reply-To: <velvqajyhrdaipmqmsduv3l3dsv56sy4rfukwm2hrdvh47hgqx@7sbnrgkzsn67>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: WNki5m9_TFCeX6WGTAU8cpccCA7JIqxW
X-Proofpoint-GUID: WNki5m9_TFCeX6WGTAU8cpccCA7JIqxW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-03_02,2025-03-03_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 adultscore=0
 phishscore=0 malwarescore=0 spamscore=0 mlxscore=0 suspectscore=0
 clxscore=1015 bulkscore=0 priorityscore=1501 mlxlogscore=999
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2503030055



On 2/28/2025 11:36 AM, Dmitry Baryshkov wrote:
> On Fri, Feb 28, 2025 at 10:23:55AM +0530, Sricharan R wrote:
>> From: Sricharan Ramabadhran <quic_srichara@quicinc.com>
>>
>> TMEL SS provides different kinds of services like secureboot, remote image
> 
> What is TMEL SS? What is Q6, etc? Please provide a definition on the
> first usagem both in the commit message and in the bindings text. And in
> the cover letter. Also, in some places you use TME-L instead of TMEL.
> Please settle on one of those, unless there is a difference between
> them,
> 
ok, both are same, will expand and fix same in all places

>> authentication, key management, crypto, OEM provisioning etc. This patch
>> adds support for remote image authentication. Support for rest of the
>> services can be added.
>>
>> The QMP mailbox is the primary means of communication between TMEL SS and
>> other subsystem on the SoC. A dedicated pair of inbound and outbound
>> mailboxes is implemented for each subsystem/external execution environment
>> which needs to communicate with TMEL for security services. The inbound
>> mailboxes are used to send IPC requests to TMEL, which are then processed
>> by TMEL firmware and accordingly the responses are sent back via outbound
>> mailboxes.
>>
>> It is an IPC transport protocol which is light weight and supports a subset
>> of API's. It handles link initialization, negotiation, establishment and
>> communication across client(CPU/BTSS/AUDIOSS) and server(TMEL SS).
>>
>>     -----------------------------------------------       ---------------------------------------------------
>>    |                                              |       |                                                 |
>>    |                 SOC  CLIENT                  | SOC   |                TMEL  SS                         |
>>    |                                              | AHB   |                                                 |
>>    |     ----------    ---------   ---------      |       | ------    -------     --------    ------------  |
>>    |     |        |    |       |   |       |      | WO    | |     | R |     |     |      |    |SERVICES   | |
>>    |     | CPU    |<-->| TMEL  |<->|       |------------->| | IN  |-->|     |     | TMEL |    |--------   | |
>>    |     |        |    | COM   |   | QMP   |      | RO    | |     | W | QMP |<--->| COM  |<-->| a) ATTEST | |
>>    |     |        |    |       |   |       |<-------------| | OUT |<--|     |     |      |    | b) CRYPTO | |
>>    |     |        |    |       |   |       |      |       | |     |   |     |     |      |    | .. more   | |
>>    |     ---------     ---------   ---------      |       | ------    -------     -------     ------------  |
>>    |                                              |       |                                                 |
>>     -----------------------------------------------       --------------------------------------------------
>>
>> This binding describes the component responsible for communication between
>> the TMEL server based subsystems (Q6) and the TMEL client
>> (CPU/BTSS/AUDIOSS), used for security services like secure image
>> authentication, enable/disable efuses, crypto services. Each client in the
>> SoC has its own block of message RAM and IRQ for communication with the
>> TMEL SS.
>>
>> Signed-off-by: Sricharan Ramabadhran <quic_srichara@quicinc.com>
>> ---
>> #V3:
> 
> Creative. Where are the previous changelogs?
> 
ok, will add

>> ---
>>          Fixed wrappings.
>>          Made mailbox-cells as a required property and changed value to '1'.
>>          Fixed to use compatible as filename.
>>          Renamed compatible as per Krzystof's comments.
>>          Dropped unused label.
>>
>>      Following tests were done and no issues.
>>
>>         *)  Checkpatch
>>         *)  Codespell
>>         *)  Sparse
>>         *)  kerneldoc check
>>         *)  Kernel lock debugging
>>         *)  dt_binding_check and dtbs_check
>>
>>   .../bindings/mailbox/qcom,ipq5424-tmel.yaml   | 62 +++++++++++++++++++
>>   1 file changed, 62 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/mailbox/qcom,ipq5424-tmel.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/mailbox/qcom,ipq5424-tmel.yaml b/Documentation/devicetree/bindings/mailbox/qcom,ipq5424-tmel.yaml
>> new file mode 100644
>> index 000000000000..2e3c79add405
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/mailbox/qcom,ipq5424-tmel.yaml
>> @@ -0,0 +1,62 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/mailbox/qcom,ipq5424-tmel.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Qualcomm TMEL IPCC channel
>> +
>> +maintainers:
>> +  - Sricharan Ramabadhran <quic_srichara@quicinc.com>
>> +
>> +description:
>> +  TMEL SS provides different kinds of services like secureboot, remote image authentication,
>> +  key management, crypto, OEM provisioning etc. This patch adds support for remote image
>> +  authentication. Support for rest of the services can be added.
>> +
>> +  The QMP mailbox is the primary means of communication between TMEL SS and other subsystem on
>> +  the SoC. A dedicated pair of inbound and outbound mailboxes is implemented for each
>> +  subsystem/external execution environment which needs to communicate with TMEL for security
>> +  services. The inbound mailboxes are used to send IPC requests to TMEL, which are then processed
> 
> This string is 100 chars long. What is the recommended wrapping
> boundary?
> 
I kept it as 100 and checkpatch did not throw any warnings.

Regards,
  Sricharan


