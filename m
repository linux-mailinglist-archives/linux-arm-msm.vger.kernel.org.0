Return-Path: <linux-arm-msm+bounces-46225-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A8FFA1D46A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Jan 2025 11:28:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 32E0118853C5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Jan 2025 10:28:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A98611FDA6F;
	Mon, 27 Jan 2025 10:28:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="GoWWALOi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07469179BF;
	Mon, 27 Jan 2025 10:28:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737973701; cv=none; b=Gp84ZmE+ImP7uQ3umB1iM+6nVsCfQC1OTvLBUytxz0iuBfsw7KvpHs0WhTE6cHGSOBHw37P+TB/htJ03dsjZjdMuKXgf1nEk1UaOnw+dGKvnkhsoOvkQrACftjftFh5/TVJUcclFScZRu2j1dLIXYbdumuyx+h+aFQdcLRV/TCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737973701; c=relaxed/simple;
	bh=anbZvoycItxzL/ax5dnITiTK6ouc+y/780hWodztk8U=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=gouEQ+L43CdmNYrMsEFuOTsOJhDJfDGc1XbD3s9QtbUb0gqlxkiVJdoqC6XS961JjJEN9br5WbK7MMfjJZVW3P7MWgsjGD5NfCC/YxmVpI84KRPmbp6qSKIyTOiwvcZvJQJILz49WpjUxnSFt0kV/D4SkjitOjiTOjO2eojzwS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=GoWWALOi; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50R4rdcm022755;
	Mon, 27 Jan 2025 10:28:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	k3c3dhh0fSQ4PciaJSHFWGlDEsyIJ8YOrVapKIKGIdQ=; b=GoWWALOiXKOjCtzV
	7LON8rS0dPgAB4OmJLi0wCUzCJQWhXq1LXSlIl2ydXhsKIfEbrq09AO6GG37zD7e
	7G+IT0zdR5UNvotswlRHGFEjg73al2qa7n488StPxoO8VJ0pHYZBEwEWGOiMZlVR
	NdwACd28LRszHTKm4qXiqqJW7RavUOlWlc00m6Dc9W4P0lmI+PKoyACqdg81iiDV
	irgIP6wi97EVa+6BQGBFXkA1skch0a/LfSIWARN4xqdl/buuZSWDk3V8Aj41klmI
	PuVcx55ajY8Xe99Pi3BhcsRw3vLG0e73CNTO3U5MXF7yZYlK0mtK+fJaPoUzcGNW
	RPTl9A==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44e3h2rm8s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 27 Jan 2025 10:28:14 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50RASDs0018691
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 27 Jan 2025 10:28:13 GMT
Received: from [10.152.203.17] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 27 Jan
 2025 02:28:08 -0800
Message-ID: <833c9114-cc9e-4ea3-a0f5-c56d61e95462@quicinc.com>
Date: Mon, 27 Jan 2025 15:57:56 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 0/2] mailbox: tmel-qmp: Introduce QCOM TMEL QMP mailbox
 driver
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>, <jassisinghbrar@gmail.com>,
        <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <andersson@kernel.org>,
        <konradybcio@kernel.org>, <manivannan.sadhasivam@linaro.org>,
        <dmitry.baryshkov@linaro.org>
CC: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
References: <20241231054900.2144961-1-quic_srichara@quicinc.com>
 <02396f29-5d1c-4595-8c31-c67cf70fdffe@oss.qualcomm.com>
Content-Language: en-US
From: Sricharan Ramabadhran <quic_srichara@quicinc.com>
In-Reply-To: <02396f29-5d1c-4595-8c31-c67cf70fdffe@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: AT_j7slwmjLX0rdqXUA_93fP_yNZiMU5
X-Proofpoint-ORIG-GUID: AT_j7slwmjLX0rdqXUA_93fP_yNZiMU5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-27_04,2025-01-27_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 clxscore=1015
 phishscore=0 lowpriorityscore=0 adultscore=0 spamscore=0 mlxscore=0
 bulkscore=0 priorityscore=1501 mlxlogscore=999 suspectscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501270084

Hi Jeff,

On 1/24/2025 11:23 AM, Jeff Johnson wrote:
> On 12/30/24 21:48, Sricharan R wrote:
>> From: Sricharan Ramabadhran <quic_srichara@quicinc.com>
>>
>> The QMP mailbox is the primary means of communication between TME-L SS
>> and other subsystem on the SoC. A dedicated pair of inbound and outbound
>> mailboxes is implemented for each subsystem/external execution environment
>> which needs to communicate with TME-L for security services. The inbound
>> mailboxes are used to send IPC requests to TME-L, which are then processed
>> by TME-L firmware and accordingly the responses are sent to the requestor
>> via outbound mailboxes.
>>
>> It is an IPC transport protocol which is light weight and supports
>> a subset of API's. It handles link initialization, negotiation,
>> establishment and communication across client(APPSS/BTSS/AUDIOSS)
>> and server(TME-L SS).
>>
>>     -----------------------------------------------       ---------------------------------------------------
>>    |                                              |       |                                                 |
>>    |                 SOC  CLIENT                  | SOC   |                TME-L  SS                        |
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
>> TME-L SS provides different kinds of services like secureboot, remote image authentication,
>> key management, crypto, OEM provisioning etc. This patch adds support for remote image
>> authentication. Support for rest of the services can be added.
>>
>> Remote proc driver subscribes to this mailbox and uses the mbox_send_message to use
>> TME-L to securely authenticate/teardown the images.
>>
>> Since clients like same rproc driver use SCM/TMEL across socs, the goal here was to abstract the
>> TMEL-QMP SS functionality, so that clients should be able to connect and send messages with
>> a common API.
>>
>> [v1] RFC Post
>>
>> [v2]
>>       Added HW description in the bindings patch.
>>       Fixed review comments for bindings from Krzysztof and Dmitry
>>       Changed patch#2 driver to add work for mailbox tx processing
>>       Cleaned up patch#2 for some checkpatch warnings.
>>       There are some checkpatch [CHECK] like below, which looks like false positive.
>>
>> 	CHECK: Macro argument 'm' may be better as '(m)' to avoid precedence issues
>> 	#1072: FILE: include/linux/mailbox/tmelcom-qmp.h:40:
>> 	+#define TMEL_MSG_UID_CREATE(m, a)      ((u32)(((m & 0xff) << 8) | (a & 0xff)))
>>
>>
>> Sricharan Ramabadhran (2):
>>    dt-bindings: mailbox: Document qcom,tmel-qmp
>>    mailbox: tmelite-qmp: Introduce TMEL QMP mailbox driver
>>
>>   .../bindings/mailbox/qcom,tmelite-qmp.yaml    |  65 ++
>>   drivers/mailbox/Kconfig                       |   7 +
>>   drivers/mailbox/Makefile                      |   2 +
>>   drivers/mailbox/qcom-tmel-qmp.c               | 969 ++++++++++++++++++
>>   include/linux/mailbox/tmelcom-qmp.h           | 157 +++
>>   5 files changed, 1200 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/mailbox/qcom,tmelite-qmp.yaml
>>   create mode 100644 drivers/mailbox/qcom-tmel-qmp.c
>>   create mode 100644 include/linux/mailbox/tmelcom-qmp.h
>>
> 
> This series was listed as a prerequisite for a WLAN patch I'm
> reviewing, and when I used my WLAN automation to pull into my
> workspace the following issues were flagged.
> 
>  From kernel-doc:
> drivers/mailbox/qcom-tmel-qmp.c:153: warning: Function parameter or struct member 'qwork' not described in 'qmp_device'
> drivers/mailbox/qcom-tmel-qmp.c:153: warning: Function parameter or struct member 'data' not described in 'qmp_device'
> drivers/mailbox/qcom-tmel-qmp.c:153: warning: Function parameter or struct member 'ch_in_use' not described in 'qmp_device'
> drivers/mailbox/qcom-tmel-qmp.c:304: warning: Function parameter or struct member 'mdev' not described in 'qmp_send_data'
> drivers/mailbox/qcom-tmel-qmp.c:304: warning: Excess function parameter 'chan' description in 'qmp_send_data'
> drivers/mailbox/qcom-tmel-qmp.c:394: warning: Function parameter or struct member 'mdev' not described in 'qmp_recv_data'
> drivers/mailbox/qcom-tmel-qmp.c:394: warning: Excess function parameter 'mbox' description in 'qmp_recv_data'
> drivers/mailbox/qcom-tmel-qmp.c:438: warning: Function parameter or struct member 'mdev' not described in 'qmp_rx'
> drivers/mailbox/qcom-tmel-qmp.c:438: warning: Excess function parameter 'mbox' description in 'qmp_rx'
> drivers/mailbox/qcom-tmel-qmp.c:859: warning: No description found for return value of 'tmel_qmp_mbox_of_xlate'
> 10 warnings as Errors
>
  ok, will fix in V3.

>  From checkpatch --codespell:
> 1d333d61d25de60704447c9b2dbee165927696d3:16: WARNING:TYPO_SPELLING: 'requestor' may be misspelled - perhaps 'requester'?
> 1d333d61d25de60704447c9b2dbee165927696d3:76: WARNING:TYPO_SPELLING: 'requestor' may be misspelled - perhaps 'requester'?
> total: 0 errors, 2 warnings, 65 lines checked
> cb1085a6ed62b0d1c7400ff9257490e431afe7b0:313: WARNING:TYPO_SPELLING: 'initated' may be misspelled - perhaps 'initiated'?
> cb1085a6ed62b0d1c7400ff9257490e431afe7b0:316: WARNING:TYPO_SPELLING: 'succes' may be misspelled - perhaps 'success'?
> cb1085a6ed62b0d1c7400ff9257490e431afe7b0:357: WARNING:TYPO_SPELLING: 'succes' may be misspelled - perhaps 'success'?
> cb1085a6ed62b0d1c7400ff9257490e431afe7b0:910: WARNING:TYPO_SPELLING: 'controlls' may be misspelled - perhaps 'controls'?
> total: 0 errors, 4 warnings, 1144 lines checked
> 
  ok, i did run checkpatch --strict, but not --codespell.
  Will fix in V3.

Regards,
  Sricharan

