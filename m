Return-Path: <linux-arm-msm+bounces-56789-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C6DD8AA93D9
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 May 2025 15:00:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E1544189AAF0
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 May 2025 13:01:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5664F2AEF1;
	Mon,  5 May 2025 13:00:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="j/xzmTv/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D69681724;
	Mon,  5 May 2025 13:00:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746450045; cv=none; b=Thb8mT4KjHcj7omtfZOtuBpbz5E8Rt5T7L0F9cEJlN2iZMb3fXiQZHn15/oBqPr7E14ZuCQGiiD0+MxsTI1Ghg7FQTzmwl59KYuRlkCZY9V/Etck343OGKw4wSryP9Ke/Wh6+ilZdV9M787HiZj/A+qO1PyrIFZBzATrCkWzeiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746450045; c=relaxed/simple;
	bh=3EHiqhycvBax/tqC3yJfvS39+SNdoGy1LgMMMybSTsk=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=eDNgs5oOkeEm/oICbGuAbVAFZJP1WlYT3SeRldSWBL6I18PWWfTWDgtAGi4XJ3agYOQshBFhrEzgIfc387upjL9Osucqa2i0166qFwibuyaPh54wNcFsGsHcA0po4d6dxDoXWz+GcA4EJWv83q/yhiwXJoxEyw5bB7Z5HRhXWI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=j/xzmTv/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 545BG8OC002489;
	Mon, 5 May 2025 13:00:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Wl4lIRVgeB3HpFIbRw6yRJPD1yim/TzEJ99/qDoZ6vE=; b=j/xzmTv/MPLJSNnx
	nFhYetUWy/Sy1p3WB2Qi4BmR9Lx105C0iZLu9z3O9ECseAvdlitRd0csxumprNhd
	5jWjhHVYi3ndUrhxFCid+sNrzEj+IPPjgwoun4eIfKa4LqYWYhB4E4bFBgccahRd
	wapupcX8k56M2vjMgLCrCM/fp6uFPmDkZ44l6dmW8odMX6Qmxp6uJlSc+ysSY6iv
	u9a5Mh47c+tD3Rk7+EMJ+DDSPM3Mxog/4uWyAcE9ae0AvmfRgmCwtfViW0H+Dsmz
	KF/ngWvHNV/vm4s+8FjZByW6oOF0Lh74NSZOJANJU/H4+8H0SEcdTH2vwvGCnyzS
	ogVy1w==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46d9ep48hw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 05 May 2025 13:00:36 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 545D0Z2W030171
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 5 May 2025 13:00:35 GMT
Received: from [10.151.37.100] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 5 May 2025
 06:00:32 -0700
Message-ID: <043da348-e120-4fac-b051-a7c196d5c685@quicinc.com>
Date: Mon, 5 May 2025 18:30:29 +0530
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
X-Authority-Analysis: v=2.4 cv=EOUG00ZC c=1 sm=1 tr=0 ts=6818b674 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8
 a=uL57qzDeI7d6P-pwTO4A:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: tZ_9FFrs0GhbsUxHIFZ3LnmyLU20MYYb
X-Proofpoint-GUID: tZ_9FFrs0GhbsUxHIFZ3LnmyLU20MYYb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA1MDEyNCBTYWx0ZWRfX3qE7vRKX/la1
 t+GpbLifv22TL+SxPF7vHjLkM3YdpcwIyUpUUp1WOtx7J5PtO1isGDzu2p5ww5xTE4AasgBqo4E
 cd5pxwMz8vXsQ5fBil1/B7WGPQ7v3k2JgSgTUdB0BBGx7Nf16XRO4EXJLRcvF4CIXjOnC0pe2wL
 S1ivCfaNhL4xFmbTlbUOxwCwPAVc6B/lY10wDk0VpyY78e1XklGpvGHQGWPObkzU3arLR4iNLnm
 M/R/8F2c0nlpshqA35xvroXwbCy8zBfRPnmHzoQwG6fFTgclAwujg+byjQDqKIotUWgk05tghYI
 sbFLjghjeAPeXA8GSBVmpLhGIQWSmhlqTWPZFiWjzNzSoxqP1i1QlYYtBXZq6ocPhy+PJvrxaQ7
 INWsp8mQvzTw285RJAEkITVNb10/9UzTdOumVUaHp5OslA2XWDVxvTGCRa0jDQZuTG1ichdm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-05_05,2025-05-05_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 impostorscore=0 spamscore=0 lowpriorityscore=0
 bulkscore=0 phishscore=0 suspectscore=0 mlxlogscore=999 mlxscore=0
 priorityscore=1501 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505050124



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
ok

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
> 
ok

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
> 

Hmm ok, will try this mapping.

Regards,
  Sricharan


