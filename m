Return-Path: <linux-arm-msm+bounces-22393-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 02683904ED9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Jun 2024 11:12:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6B44C289128
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Jun 2024 09:12:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0961D16D4F3;
	Wed, 12 Jun 2024 09:12:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="NsC1mlmn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 617BD16D4C3;
	Wed, 12 Jun 2024 09:12:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718183572; cv=none; b=FZK5qi3E6W+CxPBSOrwnqTzoXqNWH1uQBcwc7rJlX9a4/YOlk5C3OWd0ivA/d8Z4eB3eAphyt6O/Q+3/J/1GkK+HvrhIRa+rRd+rSquBSf6KqSE3+DXA/dX8bJhqReZFidFXy7AB5lC1EjnehTm0QdBuqFj/FeBMB0Qv8Jrk8d8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718183572; c=relaxed/simple;
	bh=NFBtV48SfrPQhbDWF/1tY/OqCfPwfot1KJ5FIvt3P64=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=enbySjN99PFzQgDMma1DJ5QxZX3Gs6sNfG0JvaFXkkQQxsi9gxr30fW3e1hngJrHaOIJr6TgDIw9OFDv4+yldVKRgemjFIBDXp25YAaL83Aks73985LMTZ/GFSdIZflSeJESKMRTaxB9VRR4qYqTzMVGD1hTIGjL4NfN7Le03/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=NsC1mlmn; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45C90BJL018562;
	Wed, 12 Jun 2024 09:12:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cZOle4UXTnTTQBBiRLs7xPOFMeK+UsdcqgpcChgZL2o=; b=NsC1mlmnAbGAUXUh
	zVigTFc6C3qu7aXtxbIZAwyogHoqmBB4giGzD5hqqCug1p2LnMTnvy4bho8K5C3e
	WXzmIk46/lxhBXl+IGNHwTdJTSC8hn+Pp/OWJDvQshcO76n2aZFuWN/Bg/WvgMzZ
	2q834VkG/fh8VjqaC81/VjyeC+fMRGCnqx3iGUO1WUtzhV2XSF72Im3N5PUvMkGB
	MY5T7R3FxBKvLl1/LNh6SLjU4rxTy4Te9bHCIAcx4n/qZTb8L9xoZM+6RCR9+NnM
	mgioBgN3vrLCjwtxw/8flIXLI92Dx515v30jxPBXl9C3ZNrll0Yb2nh7iE7WRbLu
	ldYFKg==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ypm6bb0bw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Jun 2024 09:12:46 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45C9Cjx9032369
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Jun 2024 09:12:45 GMT
Received: from [10.216.34.21] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 12 Jun
 2024 02:12:41 -0700
Message-ID: <5a2dbcf9-8201-4e94-94ba-e8377d5c9d98@quicinc.com>
Date: Wed, 12 Jun 2024 14:42:27 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 2/2] soc: qcom: smp2p: Introduce tracepoint support
To: Chris Lew <quic_clew@quicinc.com>,
        Sudeepgoud Patil
	<quic_sudeepgo@quicinc.com>,
        <quic_bjorande@quicinc.com>, <andersson@kernel.org>,
        <mathieu.poirier@linaro.org>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-remoteproc@vger.kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>
References: <20240611123351.3813190-1-quic_sudeepgo@quicinc.com>
 <20240611123351.3813190-3-quic_sudeepgo@quicinc.com>
 <0318b0c2-5686-4565-b75b-fa1ecfe61740@quicinc.com>
Content-Language: en-US
From: Deepak Kumar Singh <quic_deesin@quicinc.com>
In-Reply-To: <0318b0c2-5686-4565-b75b-fa1ecfe61740@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: U1UaqadhfX8Gdkm4rKiTmswjC-n0JIhu
X-Proofpoint-GUID: U1UaqadhfX8Gdkm4rKiTmswjC-n0JIhu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-12_05,2024-06-11_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 suspectscore=0
 mlxlogscore=938 impostorscore=0 spamscore=0 priorityscore=1501
 lowpriorityscore=0 adultscore=0 bulkscore=0 phishscore=0 mlxscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406120066



On 6/12/2024 4:35 AM, Chris Lew wrote:
> 
> 
> On 6/11/2024 5:33 AM, Sudeepgoud Patil wrote:
>> This commit introduces tracepoint support for smp2p,
>> enabling logging of communication between local and remote processors.
>> The tracepoints include information about the remote processor ID,
>> remote subsystem name, negotiation details, supported features,
>> bit change notifications, and ssr activity.
>> These tracepoints are valuable for debugging issues between subsystems.
>>
>> Signed-off-by: Sudeepgoud Patil <quic_sudeepgo@quicinc.com>
>> ---
> ...
>> diff --git a/drivers/soc/qcom/trace-smp2p.h 
>> b/drivers/soc/qcom/trace-smp2p.h
>> new file mode 100644
>> index 000000000000..833782460b57
>> --- /dev/null
>> +++ b/drivers/soc/qcom/trace-smp2p.h
>> @@ -0,0 +1,116 @@
>> +/* SPDX-License-Identifier: GPL-2.0 */
>> +/*
>> + * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights 
>> reserved.
>> + */
>> +
>> +#undef TRACE_SYSTEM
>> +#define TRACE_SYSTEM qcom_smp2p
>> +
>> +#if !defined(__QCOM_SMP2P_TRACE_H__) || defined(TRACE_HEADER_MULTI_READ)
>> +#define __QCOM_SMP2P_TRACE_H__
>> +
>> +#include <linux/tracepoint.h>
>> +
>> +#define SMP2P_FEATURE_SSR_ACK 0x1
> 
> Now that I see it, redefining the the feature flag here seems a bit out 
> of place. I'm not sure if it's worth kicking off a header file for this 
> single define though.
> 
I think it is ok to have this define in smp2p.c, as that is the only 
place where it is being used.
>> +
>> +TRACE_EVENT(smp2p_ssr_ack,
>> +    TP_PROTO(unsigned int remote_pid, char *irq_devname),
>> +    TP_ARGS(remote_pid, irq_devname),
>> +    TP_STRUCT__entry(
>> +        __field(u32, remote_pid)
>> +        __string(irq_devname, irq_devname)
>> +    ),
>> +    TP_fast_assign(
>> +        __entry->remote_pid = remote_pid;
>> +        __assign_str(irq_devname, irq_devname);
>> +    ),
>> +    TP_printk("%d: %s: SSR detected, doing SSR Handshake",
>> +        __entry->remote_pid,
>> +        __get_str(irq_devname)
>> +    )
>> +);
>> +
> 
> I don't think we need to pass remote_pid into all of the traces if we 
> have a unique name "irq_devname" to identify the remote now. We could 
> remove remote_pid from all the trace event arguments.
> 
> We can probably drop the "doing SSR Handshake" part of this print. I 
> think it can be assumed that we're doing the handshake once we've 
> detected SSR.

