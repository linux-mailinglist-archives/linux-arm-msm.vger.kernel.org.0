Return-Path: <linux-arm-msm+bounces-37868-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 24DB69C81FA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Nov 2024 05:33:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A0F131F224A5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Nov 2024 04:33:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4727941C92;
	Thu, 14 Nov 2024 04:33:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="YXnBkCn7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54B053214;
	Thu, 14 Nov 2024 04:32:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731558780; cv=none; b=PDOqPXyvFEUe4x32DzhzOCRmkibPeRmGMKMO0sxd8CttttcAE52F0lnhCcVNaRV95f9ABsUTbdYBpCBmnIDbQJ+GOpAeiOq40QHke9z+7T7jwQRkLDq9Ys6aJUKYRwspnLdTZwodvkexf+lhK8cAwXw3182nvmDW3BD7PZzyRHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731558780; c=relaxed/simple;
	bh=Q+WsITuDK1wPyUGh+qmK4hpxteOMSfbldv0ftRDiwuc=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=MIFwy+4pJQi8irp9fJ3vX9YaYJslRRVjGFR4UTvLcpGfIs9kf7b3iMlywAS5xsA+ZC4zhuUtklt2CPTQYKVsfGkPobhIwb08YilTKh6jY+hZCdz9A+NRwe1TnGgGnctfm/5bfjx+PnJVT0AKFCM2av60u4q1/JeQ4DZqBlOWI7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=YXnBkCn7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4ADH1QFH015416;
	Thu, 14 Nov 2024 04:32:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yBayVBUAkz7cKc986pdQx+FDAwFxvHZ/cWI5fMaVMIo=; b=YXnBkCn7pdsCyxsJ
	xUv6F2tG6vmTQcAWhCHBq4QcQUARbIDFc+dztKSoPfw7eM+5XXuKl7EWYasxSzuO
	FG5SRJTELpv0N6mZbRfyNGSQLFP0GSEo/B4/VTGqX66P/bu2VjLVsnA9pw9/fJZk
	WVpIGyYXhLgz1nyjM4xMTTw9K/uncNV69lCY6AdS6y/MFI7dYbHFW2Nqoil2ZyOe
	rc45S34xy6MEvBZU2PjOTub+t/2XHZFRTOhX+uAGEepeUEUJuKz/CX8gEBdmKVw1
	0uC1XqCwCiUe1/BlvYNaf69+1PPkLw54qtYDR7X2oRsUJHw0rSyDra/vHW8lhdtj
	4J3srQ==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42vsf32q3n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 14 Nov 2024 04:32:48 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AE4WlWl012211
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 14 Nov 2024 04:32:47 GMT
Received: from [10.131.33.37] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 13 Nov
 2024 20:32:42 -0800
Message-ID: <55fd0c34-c52c-95c5-5cd0-16fd66a4baa2@quicinc.com>
Date: Thu, 14 Nov 2024 10:02:40 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH V4 2/5] firmware: arm_scmi: Add QCOM Generic Vendor
 Protocol documentation
Content-Language: en-US
To: Cristian Marussi <cristian.marussi@arm.com>
CC: <sudeep.holla@arm.com>, <andersson@kernel.org>, <konrad.dybcio@linaro.org>,
        <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <quic_rgottimu@quicinc.com>, <quic_kshivnan@quicinc.com>,
        <conor+dt@kernel.org>, <arm-scmi@vger.kernel.org>
References: <20241007061023.1978380-1-quic_sibis@quicinc.com>
 <20241007061023.1978380-3-quic_sibis@quicinc.com> <Zxd89zenQAzafGpS@pluto>
From: Sibi Sankar <quic_sibis@quicinc.com>
In-Reply-To: <Zxd89zenQAzafGpS@pluto>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: Ko2b0q_qKKiVCz_zzQc9CXrY443DBOOD
X-Proofpoint-GUID: Ko2b0q_qKKiVCz_zzQc9CXrY443DBOOD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 adultscore=0
 bulkscore=0 phishscore=0 malwarescore=0 suspectscore=0 priorityscore=1501
 clxscore=1015 mlxscore=0 spamscore=0 lowpriorityscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2409260000
 definitions=main-2411140033



On 10/22/24 15:52, Cristian Marussi wrote:
> On Mon, Oct 07, 2024 at 11:40:20AM +0530, Sibi Sankar wrote:
>> Add QCOM System Control Management Interface (SCMI) Generic Vendor
>> Extensions Protocol documentation.
>>
> 
> Hi Sibi,
> 
> a few remarks down below.
> 
>> Signed-off-by: Sibi Sankar <quic_sibis@quicinc.com>
>> ---
>>   .../arm_scmi/vendors/qcom/qcom_generic.rst    | 210 ++++++++++++++++++
>>   1 file changed, 210 insertions(+)
>>   create mode 100644 drivers/firmware/arm_scmi/vendors/qcom/qcom_generic.rst
>>
>> diff --git a/drivers/firmware/arm_scmi/vendors/qcom/qcom_generic.rst b/drivers/firmware/arm_scmi/vendors/qcom/qcom_generic.rst
>> new file mode 100644
>> index 000000000000..1ee6dabaac23
>> --- /dev/null
>> +++ b/drivers/firmware/arm_scmi/vendors/qcom/qcom_generic.rst
>> @@ -0,0 +1,210 @@
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
>> +|uint32 attributes |Bits[8] Set to 1.                                          |
>> +|                  |Bits[0] Set to 1.                                          |
>> ++------------------+-----------------------------------------------------------+
> 
> Mmmm, this does not explain so much what are those bits and what values
> they can indeed assume :P ...

lol, after a lot of rooting around figured out they
return the number of vendor protocols available in
the system :/

Not really sure if it's adding any useful info.

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
> 
> And what abot the size of this payload ? .. so you are relying on the
> fact that the transport will add the total message length at that layer
> and so the server can determine where the valid payload ends...
> 
> ...it means the server will have some expectations about the payload length
> based on the param_id and will check against the received transport-advertised
> message-length, am I right ?
> 
> ...BUT what if you end up with multiple versions of this protocol in the future,
> with varying payload lengths for the same param_id...REMEMEBER that the server
> cannot know which version of a protocol the client is running (while the client
> can see what the server runs) UNLESS you implement also NEGOTIATE_PROTOCOL_VERSION
> for this protocol...
> 
> ...so without an explicit length nor the NEGOTIATE_PROTOCOL_VERSION you wont be
> able in the future, server-side, to be sure if you are assumnig the right payload
> length for the right version that the client is speaking...so at the end you
> wont be able to support multiple versions of the protocol even if the Kernel
> can support all of those versions...do you see what I mean ?
> 
> I think that would be advisable to implement NEGOTIATE_PROTOCOL_VERSION
> if you dont want to carry an explicit size in the message for this payload...
> 
> ...or am I missing something ?

ack makes sense but we planned to make sure that the sub-strings
used maintain abi for all their messages but like you said having
way to negotiate protocol version will be nice to have. Will make
sure something along the lines get implemented with the next major
version upgrade.

-Sibi

> 
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
> Similarly, no payload length means you will have to code some builtin
> check to verify the length of the message that you have received against
> the specific version that the server is running...this is NOT so
> problematic here as in the _SET above since the client/agent DOES know which
> protocol version the server is running...
> 
> ...it is a bit odd, but indeed similar to other variable sized SCMI messages in
> standard protocols that sports optional fields in the reply, for which, similarly
> you have to check the version of the protocol to desume the size of the message
> based on the presence or not of some fields...
> 
>> +
>> +QCOM_SCMI_START_ACTIVITY
>> +~~~~~~~~~~~~~~~~~~~~~~~~
>> +
>> +message_id: 0x12
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
>> +|                  |and is generally used to start the activity performed by   |
>> +|                  |the algorithm string.                                      |
>> ++------------------+-----------------------------------------------------------+
>> +|uint32 buf[]      |Serves as the payload for the specified param_id and       |
>> +|                  |algorithm string pair.                                     |
>> ++------------------+-----------------------------------------------------------+
>> +|Return values                                                                 |
>> ++------------------+-----------------------------------------------------------+
>> +|Name              |Description                                                |
>> ++------------------+-----------------------------------------------------------+
>> +|int32 status      |SUCCESS: if the activity performed by the algorithm string |
>> +|                  |starts successfully.                                       |
>> +|                  |NOT_SUPPORTED: if the algorithm string does not have any.  |
>> +|                  |matches or if the activity is already running.             |
>> ++------------------+-----------------------------------------------------------+
>> +
> 
> Same consideration as above...being a SET-like operation with a variable
> sized field in the request AND no explicit payload length, you will have
> to derive the size from the message length BUT since you doint even have
> implemented NEGOTIATE_PROTOCOL_VERSION in the future any kind of check
> will become impossibe server side if you will have multiple protocols
> with varying sizes for buf depending on the protocol version
> 
>> +QCOM_SCMI_STOP_ACTIVITY
>> +~~~~~~~~~~~~~~~~~~~~~~~
>> +
>> +message_id: 0x13
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
>> +|                  |and is generally used to stop the activity performed by    |
>> +|                  |the algorithm string.                                      |
>> ++------------------+-----------------------------------------------------------+
>> +|uint32 buf[]      |Serves as the payload for the specified param_id and       |
>> +|                  |algorithm string pair.                                     |
>> ++------------------+-----------------------------------------------------------+
> 
> Same.
> 
>> +|Return values                                                                 |
>> ++------------------+-----------------------------------------------------------+
>> +|Name              |Description                                                |
>> ++------------------+-----------------------------------------------------------+
>> +|int32 status      |SUCCESS: if the activity performed by the algorithm string |
>> +|                  |stops successfully.                                        |
>> +|                  |NOT_SUPPORTED: if the algorithm string does not have any   |
>> +|                  |matches or if the activity isn't running.                  |
>> ++------------------+-----------------------------------------------------------+
> 
> Thanks,
> Cristian

