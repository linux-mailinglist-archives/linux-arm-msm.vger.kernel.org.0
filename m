Return-Path: <linux-arm-msm+bounces-48463-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EA749A3AE59
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Feb 2025 02:03:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 88F67165FEA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Feb 2025 01:02:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B17814A639;
	Wed, 19 Feb 2025 00:59:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="dcUnoPar"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3EF91E4AB;
	Wed, 19 Feb 2025 00:59:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739926796; cv=none; b=LP4FvOFN/6f+DHJkBT4xP4rbjMe9ABKA46rTy4L0NwI2Urprmp0EwvFz/MEXqkriOVsRJSArHrQwTfEYsT/A/gcgJ/V+aQ8eZkRuStd7BXMKhvX+vrvf+W+IaCF15a11Othg0906V9qYfrDCsFf4kDTNYsjOGrhWaTXwB1yboHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739926796; c=relaxed/simple;
	bh=tBmUTtiWOzZ4KRtKIHAIVuWvqpiyeVpQ8RcUDeezVPc=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=BkyB0h4+NDMEsSBrcGcZa3gvPVnyKcYT4+8XKtN1J4P9zfDKr3qnDezdJ/YoSNyEbk2e45tRlnQVleS5yTLX+xtbXUgnZIJCF0Pkwh8OSqm+ivYNlMcmU/xf88pKshLv06Wvg5vZ6QpneXkeK8qNxcMqzpCnghYsGl4NLos6VTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=dcUnoPar; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51IIwUcD015154;
	Wed, 19 Feb 2025 00:59:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xKoQ4N3icAjL6uyR4WjIfq+9vwxL6ATc8yoGXz9I+cs=; b=dcUnoPartB5KrVk6
	hjKzOHxLlsHqI5w3MwACCr42zgVmLPkBsaqWBo/ZsS2UyI20mykwynmh+M6tlhXe
	Ku8gbZFzXGO2WNNYAqca7XnPGFXctVxRJ1/KbI1t0LceQH0u5uRenitS7Uiw5I4r
	wfgKks0twgQ3GycH+a1npjxs3BAkn1kOzRunvRpbtDo/PKQQ9fuvXI28ph06WK+d
	I9NXk0YvuR5QQrS8fxKpY7qx2vjFoatn5u+HxxGCqJCmfqhfma/CnGN1tBV4pvab
	TXGjdu40WBDoht2hU2SmxDOD1etHmBTsyxq9QOdqnf4+1vbfha6tonoY7jA6N7XR
	J2V0Vg==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44vyy48rae-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Feb 2025 00:59:38 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51J0xa9p011640
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Feb 2025 00:59:36 GMT
Received: from [10.133.33.23] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 18 Feb
 2025 16:59:32 -0800
Message-ID: <d7680489-db7c-49d5-88ff-29e99a49f624@quicinc.com>
Date: Wed, 19 Feb 2025 08:59:29 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 0/7] Coresight: Add Coresight TMC Control Unit driver
To: James Clark <james.clark@linaro.org>,
        Suzuki K Poulose
	<suzuki.poulose@arm.com>
CC: Tingwei Zhang <quic_tingweiz@quicinc.com>,
        Jinlong Mao
	<quic_jinlmao@quicinc.com>, <coresight@lists.linaro.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        Mike Leach
	<mike.leach@linaro.org>,
        Alexander Shishkin
	<alexander.shishkin@linux.intel.com>,
        Maxime Coquelin
	<mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
References: <20250217093024.1133096-1-quic_jiegan@quicinc.com>
 <0f6369fd-3236-40eb-bf8f-3c3d675137c9@linaro.org>
Content-Language: en-US
From: Jie Gan <quic_jiegan@quicinc.com>
In-Reply-To: <0f6369fd-3236-40eb-bf8f-3c3d675137c9@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 8DUg291zjXHPjDjqUv3-rA86fz8rv0r6
X-Proofpoint-ORIG-GUID: 8DUg291zjXHPjDjqUv3-rA86fz8rv0r6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-18_11,2025-02-18_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 priorityscore=1501 malwarescore=0 bulkscore=0 suspectscore=0 clxscore=1015
 lowpriorityscore=0 mlxlogscore=999 spamscore=0 adultscore=0 phishscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2502190004



On 2/18/2025 6:05 PM, James Clark wrote:
> 
> 
> On 17/02/2025 9:30 am, Jie Gan wrote:
>> From: Jie Gan <jie.gan@oss.qualcomm.com>
>>
>> The Coresight TMC Control Unit(CTCU) device hosts miscellaneous 
>> configuration
>> registers to control various features related to TMC ETR device.
>>
>> The CTCU device works as a helper device physically connected to the 
>> TMC ETR device.
>> ---------------------------------------------------------
>>               |ETR0|             |ETR1|
>>                . \                 / .
>>                .  \               /  .
>>                .   \             /   .
>>                .    \           /    .
>> ---------------------------------------------------
>> ETR0ATID0-ETR0ATID3     CTCU    ETR1ATID0-ETR1ATID3
>> ---------------------------------------------------
>> Each ETR has four ATID registers with 128 bits long in total.
>> e.g. ETR0ATID0-ETR0ATID3 registers are used by ETR0 device.
>>
>> Based on the trace id which is programed in CTCU ATID register of
>> specific ETR, trace data with that trace id can get into ETR's buffer
>> while other trace data gets ignored. The number of CTCU ATID registers
>> depends on the number of defined TMC ETR devices. For example, two TMC
>> ETR devices need eight ATID registers. ETR0 with ETR0ATID0-ETR0ATID3
>> and ETR1 with ETR1ATID0-ETRATID3.
>>
>> The significant challenge in enabling the data filter function is how
>> to collect the trace ID of the source device. The introduction of
>> trace_id callback function addresses this challenge. The callback 
>> function
>> collects trace ID of the device and return it back. The trace ID will be
>> stored in the structure called coresight_path and transmitted to helper
>> and sink devices.
>>
>> The coresight_path structure is created to address how to transmit
>> parameters needs by coresight_enable_path/coresight_disbale_path
>> functions.
>>
>> Here is the definition of the struct coresight_path:
>> /**
>>   * struct coresight_path - data needed by enable/disable path
>>   * @path:               path from source to sink.
>>   * @trace_id:           trace_id of the whole path.
>>   */
>> struct coresight_path {
>>          struct list_head                *path;
>>          u8                              trace_id;
>> };
>>
>> The atid_offset mentioned before is the offset to ATID register in CTCU
>> device.
>>
>> Enabling the source device will configure one bit in the ATID register 
>> based
>> on its trace ID.
>> Disabling the source devices will reset the bit in the AITD register
>> based on its trace ID.
>>
>> Useage:
>> Enable:
>> STM device with trace ID 5 and ETR0 is activated.
>> Bitmap before the enablement:
>> ETR0ATID0:
>> 31..................543210
>> ==========================
>> 0000000000000000000000...0
>> ==========================
>>
>> Bitmap after the enablement:
>> 31..................543210
>> ==========================
>> 0000000000000...0000100000
>> ==========================
>>
>> The bit 5 of the ETR0ATID0 register is configured to 1 when enabling the
>> STM device.
>>
>> Disable:
>> STM device with trace ID 5 and ETR0 is activated.
>> Bitmap before the disablement:
>> ETR0ATID0:
>> 31................6543210
>> =========================
>> 000000000010111...0100000
>> =========================
>>
>> Bitmap after the disablement
>> ETR0ATID0:
>> 31................6543210
>> =========================
>> 000000000010111...0000000
>> =========================
>>
>> The bit 5 of the ETR0ATID0 register is reset to 0 when disabling the STM
>> device.
>>
>> Sincere thanks to James Clark for providing an excellent idea to handle
>> the trace_id of the path.
>>
>> Changes in V12:
>> 1. Update the method for allocating trace_id for perf mode.
>> Link to V11 - https://lore.kernel.org/linux-arm- 
>> msm/20250214024021.249655-1-quic_jiegan@quicinc.com/
>>
> 
> I tested the latest change, looks good to me.
> 
Hi James,

Thanks for testing.

Jie



