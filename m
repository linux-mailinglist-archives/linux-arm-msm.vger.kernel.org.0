Return-Path: <linux-arm-msm+bounces-40487-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 64F549E535C
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Dec 2024 12:08:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 600F6285E7F
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Dec 2024 11:07:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A2571DDA20;
	Thu,  5 Dec 2024 11:07:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="aSahnSHT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B6AF1DCB0E;
	Thu,  5 Dec 2024 11:07:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733396866; cv=none; b=BUOGdnOQKgFALL7663jsoq81kMyRrLTVIF5Uul5vPF5f2+H8gWYENLlM1mEHCyn3IsvjOxZJiEMqQESj2M3AlbJCLWeCZF8R+Vjg9P9Q/GcDB8kYq0bKu+7uj5UiKvwvUrWrMZz10RdeECmR2uIXLb2/kftVSWTGXaXG+TTdDl8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733396866; c=relaxed/simple;
	bh=w9KxLn4wVU/DO6qh/7wcMNojYZe8nV9WrS1IDIwmbTw=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Fo7xSk/nal1OFhGL7u3pfcvdHEcYOuEBKJ8duFbhvW98dm+/xHcum/cOhmD0vX8YYK7FuiclXXAKzBJWCyLWiNuzZh6kY0P1iwcT6fMCa0T27g59Mg/Y66EAaIdkBpwJTEvAo0s8iTakvKwZXkEUcsMSW9UmuYLucKPko3wKQvY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=aSahnSHT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B56H5FQ031191;
	Thu, 5 Dec 2024 11:07:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Pgi8rzaEWRtb1Qwm7WBfFssjc2xsjvAca14rl02ms/0=; b=aSahnSHT5GKGeuGU
	cg8Y+cqSsA1GKYCj7DzdWe8PIXQxW8u52bKWEivES/16SjsHd4F6gqPDijIpkxYq
	bHAUIr6qZtu6uK/WsOuPOAd31BGqbdSerxst/8fM1/oF8dbg4VKggGIyDLx6FLx2
	j9b03akkNSDIGdT2BVKc9K5vLM3D64TY1r13TwPSfVhKWbvBLkMA//LZEr0RvWuH
	IuuCovB4Ayjvf7Jxb2VfVHDiHGVfL4S8vZStqD8TIxj9k4CcwjtB9p5umk5IWFua
	GWdkZcq36BDhvG8iKO4HJ7dauqe36tnVLZefLuT7RUume5sr9z+QaIfaSmMPcz+v
	Qh9EeQ==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 439w90ybex-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 05 Dec 2024 11:07:35 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4B5B7YaC031800
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 5 Dec 2024 11:07:34 GMT
Received: from [10.190.163.187] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 5 Dec 2024
 03:07:31 -0800
Message-ID: <73a16eb4-e590-92db-ee24-cc4f42a9de01@quicinc.com>
Date: Thu, 5 Dec 2024 16:37:28 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH V5 1/2] firmware: arm_scmi: Add QCOM Generic Vendor
 Protocol documentation
Content-Language: en-US
To: Cristian Marussi <cristian.marussi@arm.com>
CC: <sudeep.holla@arm.com>, <andersson@kernel.org>, <konrad.dybcio@linaro.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <quic_rgottimu@quicinc.com>,
        <quic_kshivnan@quicinc.com>, <arm-scmi@vger.kernel.org>
References: <20241115011515.1313447-1-quic_sibis@quicinc.com>
 <20241115011515.1313447-2-quic_sibis@quicinc.com> <Z1BBirNWH1eaSKtr@pluto>
From: Sibi Sankar <quic_sibis@quicinc.com>
In-Reply-To: <Z1BBirNWH1eaSKtr@pluto>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: XrgWAK3E314MfAigyWSkXsqJzgzavaBT
X-Proofpoint-GUID: XrgWAK3E314MfAigyWSkXsqJzgzavaBT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 bulkscore=0
 impostorscore=0 phishscore=0 suspectscore=0 adultscore=0 mlxscore=0
 spamscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412050080



On 12/4/24 17:18, Cristian Marussi wrote:
> On Fri, Nov 15, 2024 at 06:45:14AM +0530, Sibi Sankar wrote:
>> Add QCOM System Control Management Interface (SCMI) Generic Vendor
>> Extensions Protocol documentation.
>>
>> Signed-off-by: Sibi Sankar <quic_sibis@quicinc.com>
>> ---
>>
>> v4:
>> * Update the protol attributes doc with more information. [Cristian]
>>
>>   .../arm_scmi/vendors/qcom/qcom_generic.rst    | 211 ++++++++++++++++++
>>   1 file changed, 211 insertions(+)
>>   create mode 100644 drivers/firmware/arm_scmi/vendors/qcom/qcom_generic.rst
>>
>> diff --git a/drivers/firmware/arm_scmi/vendors/qcom/qcom_generic.rst b/drivers/firmware/arm_scmi/vendors/qcom/qcom_generic.rst
>> new file mode 100644
>> index 000000000000..141bc932e30f
>> --- /dev/null
>> +++ b/drivers/firmware/arm_scmi/vendors/qcom/qcom_generic.rst
>> @@ -0,0 +1,211 @@
>> +.. SPDX-License-Identifier: GPL-2.0
>> +.. include:: <isonum.txt>
>> +
>> +===============================================================================
>> +QCOM System Control and Management Interface(SCMI) Vendor Protocols Extension
>> +===============================================================================
>> +
>> +:Copyright: |copy| 2024, Qualcomm Innovation Center, Inc. All rights reserved.
>> +
>> +:Author: Sibi Sankar <quic_sibis@quicinc.com>
>> +
>> +SCMI_GENERIC: System Control and Management Interface QCOM Generic Vendor Protocol
>> +==================================================================================
>> +
>> +This protocol is intended as a generic way of exposing a number of Qualcomm
>> +SoC specific features through a mixture of pre-determined algorithm string and
>> +param_id pairs hosted on the SCMI controller. It implements an interface compliant
>> +with the Arm SCMI Specification with additional vendor specific commands as
>> +detailed below.
>> +
>> +Commands:
>> +_________
>> +
>> +PROTOCOL_VERSION
>> +~~~~~~~~~~~~~~~~
>> +
>> +message_id: 0x0
>> +protocol_id: 0x80
>> +
>> ++---------------+--------------------------------------------------------------+
>> +|Return values                                                                 |
>> ++---------------+--------------------------------------------------------------+
>> +|Name           |Description                                                   |
>> ++---------------+--------------------------------------------------------------+
>> +|int32 status   |See ARM SCMI Specification for status code definitions.       |
>> ++---------------+--------------------------------------------------------------+
>> +|uint32 version |For this revision of the specification, this value must be    |
>> +|               |0x10000.                                                      |
>> ++---------------+--------------------------------------------------------------+
>> +
>> +PROTOCOL_ATTRIBUTES
>> +~~~~~~~~~~~~~~~~~~~
>> +
>> +message_id: 0x1
>> +protocol_id: 0x80
>> +
>> ++---------------+--------------------------------------------------------------+
>> +|Return values                                                                 |
>> ++------------------+-----------------------------------------------------------+
>> +|Name              |Description                                                |
>> ++------------------+-----------------------------------------------------------+
>> +|int32 status      |See ARM SCMI Specification for status code definitions.    |
>> ++------------------+-----------------------------------------------------------+
>> +|uint32 attributes |Bits[31:16] Reserved, must be to 0.                        |
>> +|                  |Bits[15:8] Number of agents in the system                  |
>> +|                  |Bits[7:0] Number of vendor protocols in the system         |
>> ++------------------+-----------------------------------------------------------+
> 
> Thanks of clarifing this....may I ask why number of agents is reported
> here too given that it is already exposed by Base protocol ?
> 
> Not really arguing about this so much, but you will end up having to maintain this
> on 2 different protocols fw side...or are they not 'agents' in the SCMI meaning ?
> 
> Anyway, I'm fine with it, even though you dont seem to use this
> anywhere.

We don't use it anywhere and it looks like it was just put together
so that this protocol is compliant to the spec :|

> 
>> +
>> +PROTOCOL_MESSAGE_ATTRIBUTES
>> +~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> +
>> +message_id: 0x2
>> +protocol_id: 0x80
>> +
>> ++---------------+--------------------------------------------------------------+
>> +|Return values                                                                 |
>> ++------------------+-----------------------------------------------------------+
>> +|Name              |Description                                                |
>> ++------------------+-----------------------------------------------------------+
>> +|int32 status      |See ARM SCMI Specification for status code definitions.    |
>> ++------------------+-----------------------------------------------------------+
>> +|uint32 attributes |For all message id's the parameter has a value of 0.       |
>> ++------------------+-----------------------------------------------------------+
>> +
>> +QCOM_SCMI_SET_PARAM
>> +~~~~~~~~~~~~~~~~~~~
>> +
>> +message_id: 0x10
>> +protocol_id: 0x80
>> +
>> ++------------------+-----------------------------------------------------------+
>> +|Parameters                                                                    |
>> ++------------------+-----------------------------------------------------------+
>> +|Name              |Description                                                |
>> ++------------------+-----------------------------------------------------------+
>> +|uint32 ext_id     |Reserved, must be zero.                                    |
>> ++------------------+-----------------------------------------------------------+
>> +|uint32 algo_low   |Lower 32-bit value of the algorithm string.                |
>> ++------------------+-----------------------------------------------------------+
>> +|uint32 algo_high  |Upper 32-bit value of the algorithm string.                |
>> ++------------------+-----------------------------------------------------------+
>> +|uint32 param_id   |Serves as the token message id for the algorithm string    |
>> +|                  |and is used to set various parameters supported by it.     |
>> ++------------------+-----------------------------------------------------------+
>> +|uint32 buf[]      |Serves as the payload for the specified param_id and       |
>> +|                  |algorithm string pair.                                     |
>> ++------------------+-----------------------------------------------------------+
>> +|Return values                                                                 |
>> ++------------------+-----------------------------------------------------------+
>> +|Name              |Description                                                |
>> ++------------------+-----------------------------------------------------------+
>> +|int32 status      |SUCCESS: if the param_id and buf[] is parsed successfully  |
>> +|                  |by the chosen algorithm string.                            |
>> +|                  |NOT_SUPPORTED: if the algorithm string does not have any   |
>> +|                  |matches.                                                   |
>> +|                  |INVALID_PARAMETERS: if the param_id and the buf[] passed   |
>> +|                  |is rejected by the algorithm string.                       |
>> ++------------------+-----------------------------------------------------------+
>> +
>> +QCOM_SCMI_GET_PARAM
>> +~~~~~~~~~~~~~~~~~~~
>> +
>> +message_id: 0x11
>> +protocol_id: 0x80
>> +
>> ++------------------+-----------------------------------------------------------+
>> +|Parameters                                                                    |
>> ++------------------+-----------------------------------------------------------+
>> +|Name              |Description                                                |
>> ++------------------+-----------------------------------------------------------+
>> +|uint32 ext_id     |Reserved, must be zero.                                    |
>> ++------------------+-----------------------------------------------------------+
>> +|uint32 algo_low   |Lower 32-bit value of the algorithm string.                |
>> ++------------------+-----------------------------------------------------------+
>> +|uint32 algo_high  |Upper 32-bit value of the algorithm string.                |
>> ++------------------+-----------------------------------------------------------+
>> +|uint32 param_id   |Serves as the token message id for the algorithm string.   |
>> ++------------------+-----------------------------------------------------------+
>> +|uint32 buf[]      |Serves as the payload and store of value for the specified |
>> +|                  |param_id and algorithm string pair.                        |
>> ++------------------+-----------------------------------------------------------+
>> +|Return values                                                                 |
>> ++------------------+-----------------------------------------------------------+
>> +|Name              |Description                                                |
>> ++------------------+-----------------------------------------------------------+
>> +|int32 status      |SUCCESS: if the param_id and buf[] is parsed successfully  |
>> +|                  |by the chosen algorithm string and the result is copied    |
>> +|                  |into buf[].                                                |
>> +|                  |NOT_SUPPORTED: if the algorithm string does not have any   |
>> +|                  |matches.                                                   |
>> +|                  |INVALID_PARAMETERS: if the param_id and the buf[] passed   |
>> +|                  |is rejected by the algorithm string.                       |
>> ++------------------+-----------------------------------------------------------+
> 
> ..missed this last time...so you should add here also a field describing
> the reply buf right ? (as it happenns really in your code) something
> like:
> 
>   ++------------------+-----------------------------------------------------------+
>   +|uint32 buf[]      |Holds the payload of the result of the query.	 	 |
>   +|                  |					                         |
>   ++------------------+-----------------------------------------------------------+

Thanks will get this added in the next re-spin.

-Sibi

> 
> Thanks,
> Cristian

