Return-Path: <linux-arm-msm+bounces-58681-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B387ABD38D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 May 2025 11:36:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2ABAA166AE4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 May 2025 09:36:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19DFA2676DA;
	Tue, 20 May 2025 09:36:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="TNLt+hGO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BD0C288AD;
	Tue, 20 May 2025 09:36:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747733785; cv=none; b=dtX2QBXI4LDOBuvkp42hdtuTHPxQv2x5kkmXq9Hvka7qWHCtypGUQfjwip9OLMeUws0Ktl3CaLJQBNG6rDGKvhvDxUhd/3Ik8r/UOiHSggNQkjHFOTUzvBVLbJ6B5IN/jr+rnhhA8bKNihS7mzuKo8Hy6SSXwf7eLNs66zCW69U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747733785; c=relaxed/simple;
	bh=clvMBw4eHiuKT/N9encK9pQ4gV+remcTGiirlD8rqvc=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=CpUf/MWbYjP1ofDRcRJxcoTNM+ZSKxzqmzB38ydSN5RL5i2ajb3cqNPvao//7Olrk8Gzub7r2c+/yl/jPM2cnrDmj5UvPZI9DXiRuwSw1oeGsopF3TrCPm+W5o/inUTR5N06Pd9yobNBYG79ARMCMv4J9O+H3XAZAYERHfIhRTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=TNLt+hGO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54K4Be7U023174;
	Tue, 20 May 2025 09:36:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mYrBksJ9wLlbK7ur0WpmLI4TeM0s2o+dXqEsVt6P0E0=; b=TNLt+hGOrSXkO3yz
	TCX/ks8ykWOgOOH/TQ5jscMr3sw6CHrWnvH9G6vxETL0eze8HuEHrUcTEgYi53Bt
	+RmvpAo+GvNqHANT5JX1+Vn51X9Hmlj1ZsZ+UnLAjbiwpR+TXefhSESSvphmWCGI
	M7Q+MMbrtrPZdXhCRtcrzqWWSuVzFEiy5LCLIAMQmuG4huhsLt8PWhVqaZDqeBBc
	qOEF5xIsYQe8qYY2+Gl+7/VJqxkaGZmkHKZMWm6bwazsuu6uIHFXD8cYn2QvI7B+
	wD3SsddcpNjzL0awKgF3fimX7SwsMpl4LrAbeE3qB5Lr8yLgitcF0rRRjd0ROZI8
	wmn14A==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46r041uv2m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 20 May 2025 09:36:17 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 54K9aH2N021409
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 20 May 2025 09:36:17 GMT
Received: from [10.152.203.17] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 20 May
 2025 02:36:13 -0700
Message-ID: <597fa937-56a3-4adf-90cc-8ac95dac5cb3@quicinc.com>
Date: Tue, 20 May 2025 15:06:07 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V4 2/2] mailbox: tmelite-qmp: Introduce TMEL QMP mailbox
 driver
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, <jassisinghbrar@gmail.com>,
        <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <andersson@kernel.org>,
        <konradybcio@kernel.org>, <manivannan.sadhasivam@linaro.org>,
        <dmitry.baryshkov@linaro.org>
References: <20250327181750.3733881-1-quic_srichara@quicinc.com>
 <20250327181750.3733881-3-quic_srichara@quicinc.com>
 <6b6a163b-be75-4003-a618-f0e928a6d114@oss.qualcomm.com>
Content-Language: en-US
From: Sricharan Ramabadhran <quic_srichara@quicinc.com>
In-Reply-To: <6b6a163b-be75-4003-a618-f0e928a6d114@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIwMDA3OCBTYWx0ZWRfXz9Ydkjf4IgqE
 2sCZF4wB2vM97sgdE39DOQfvWqnEnTwmpIZPigyPiJLjmU+iVH3vOdtA5wYZF1PlSCsTl/5REHJ
 f/v99wS5+VMOceLJAZralFMN5Jvbqc/aTXRYdFYK7xaXnd9iVbHc6un9YiXR4sWkp5i4HspANHO
 dIO6RE08ShkpbNoHvMKjoyCLxOPkEtTZS4pGWw2yYx6P+rr4Sh83gngIxFeCjGEt/nMLGwhpEvz
 ThL/ecbOeWZLMyz48bIBVCQEZme3OsSyLYxdZO/Bmlwp7S37OexbKydK3+Hz3xy/PbuoIpZF7sf
 wKtoFQFtIQ7X2I8gxCGlukwUXMqg4l4u1XgVghgPkKha4N5ms7AFrFAheNvlQMFfGEZFcLlq7aI
 5/5hW6EpDEaBf5XaOMx1Q7FJN6O2m629lO44nup9LCql6CtUj8Dvc6blhGxx9UV9BjTEgdGa
X-Proofpoint-ORIG-GUID: y_AFGqADgHjBCo7BggRP0K9-qiLnkt4E
X-Proofpoint-GUID: y_AFGqADgHjBCo7BggRP0K9-qiLnkt4E
X-Authority-Analysis: v=2.4 cv=HIjDFptv c=1 sm=1 tr=0 ts=682c4d11 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8
 a=uL57qzDeI7d6P-pwTO4A:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-20_04,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 adultscore=0 mlxscore=0 clxscore=1015
 bulkscore=0 suspectscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 impostorscore=0 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505200078



On 4/26/2025 3:19 PM, Konrad Dybcio wrote:
> On 3/27/25 7:17 PM, Sricharan R wrote:
>> From: Sricharan Ramabadhran <quic_srichara@quicinc.com>
>>
>> This mailbox facilitates the communication between the TMEL server
>> subsystem (Trust Management Engine Lite) and the TMEL client
>> (APPSS/BTSS/AUDIOSS), used for secure services like secure image
>> authentication, enable/disable efuses, crypto services etc. Each client in
>> the SoC has its own block of message RAM and IRQ for communication with the
>> TMEL SS. The protocol used to communicate in the message RAM is known as
>> Qualcomm Messaging Protocol (QMP).
>>
>> Remote proc driver subscribes to this mailbox and uses the
>> mbox_send_message to use TMEL to securely authenticate/teardown the images.
>>
>> Signed-off-by: Sricharan Ramabadhran <quic_srichara@quicinc.com>
>> ---
> 
> [...]
> 
>> +
>> +#define QMP_NUM_CHANS		0x1
> 
> Quantities make more sense in decimal, but since this is effectively
> a single-use value, you can put in the '1' literal in num_chans and use
> devm_kzalloc instead of devm_kcalloc in the other use
> 
ok

>> +#define QMP_TOUT_MS		1000
> 
> "TIMEOUT"
>
ok

>> +#define QMP_CTRL_DATA_SIZE	4
>> +#define QMP_MAX_PKT_SIZE	0x18
> 
> This is very handwavy, please structurize all data that comes in and
> out of the mailbox.
>
ok

>> +#define QMP_UCORE_DESC_OFFSET	0x1000
>> +#define QMP_SEND_TIMEOUT	30000
> 
> Please include the unit in the macro name - although 30s is quite a
> timeout for a couple bytes..
> 
ok, will reduce timeout as well

> [...]
> 
>> +#define QMP_HW_MBOX_SIZE		32
>> +#define QMP_MBOX_RSV_SIZE		4
>> +#define QMP_MBOX_IPC_PACKET_SIZE	(QMP_HW_MBOX_SIZE - QMP_CTRL_DATA_SIZE - QMP_MBOX_RSV_SIZE)
>> +#define QMP_MBOX_IPC_MAX_PARAMS		5
>> +
>> +#define QMP_MAX_PARAM_IN_PARAM_ID	14
>> +#define QMP_PARAM_CNT_FOR_OUTBUF	3
>> +#define QMP_SRAM_IPC_MAX_PARAMS		(QMP_MAX_PARAM_IN_PARAM_ID * QMP_PARAM_CNT_FOR_OUTBUF)
>> +#define QMP_SRAM_IPC_MAX_BUF_SIZE	(QMP_SRAM_IPC_MAX_PARAMS * sizeof(u32))
> 
> These should be expressed in terms of structures and sizeof() instead,
> as well
ok

> 
>> +
>> +#define TMEL_ERROR_GENERIC		(0x1u)
>> +#define TMEL_ERROR_NOT_SUPPORTED	(0x2u)
>> +#define TMEL_ERROR_BAD_PARAMETER	(0x3u)
>> +#define TMEL_ERROR_BAD_MESSAGE		(0x4u)
>> +#define TMEL_ERROR_BAD_ADDRESS		(0x5u)
>> +#define TMEL_ERROR_TMELCOM_FAILURE	(0x6u)
>> +#define TMEL_ERROR_TMEL_BUSY		(0x7u)
> 
> Oh I didn't notice this during the first review.. I assume these are
> returned by the mbox. Please create a dictionary such as:
> 
> u32 tmel_error_dict[] = {
> 	[TMEL_ERROR_GENERIC] = EINVAL,
> 	[TMEL_ERROR_NOT_SUPPORTED] = EOPNOTSUPP
> 	...
> };
> 
> that we can then plug into the function down below that currently does
> error ? -EINVAL : 0

ok, agree. will add.

Regards,
Sricharan

