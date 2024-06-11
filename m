Return-Path: <linux-arm-msm+bounces-22356-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 173C890477D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Jun 2024 01:06:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 253F11C2289A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Jun 2024 23:06:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1ACD05BAF0;
	Tue, 11 Jun 2024 23:06:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="nI7ie6oS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6C92152DF1;
	Tue, 11 Jun 2024 23:06:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718147168; cv=none; b=BlOpfOzElLQvAgXjo470w1uzNdFpTTkC89C3M/fNeItl1Djh4cr77im2TkqGV9P+7mGMLZeEtFekL7EbAS5njwiz7HWl3ybaI6XPRCJyv/89q8uBY5889pDG7yTMGqVX38vPmEW7b8N4627BhQNHhqOoN1N0yjTBxkJhLIvdo8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718147168; c=relaxed/simple;
	bh=0sJE9lCi9yl51IYl52WCu2bf9BONc1ovIPmUL9NAx5M=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=hfDWpEMbwc0qTzY5PH+BQe4GMApG4ILjcqrlL6aKayyeX7iq8V40voM1ZvxjgkXG/EGVlcg1hw40WytpTMv8sbQuhnrLTaG5nIDpfxU2d8F2iMxI8tCH3KTWhP+pwfLUGJyUMsohGswMbV4pnBcn1gwdtAzX0I5ZYJdlkvqn0E8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=nI7ie6oS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45BL0gmb013157;
	Tue, 11 Jun 2024 23:05:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sag2Db5U+ssq0Mfo5pmsGP9cW/zUXlRRoUs7slLtsIo=; b=nI7ie6oSlbdTO2FQ
	SwGpAdyBoyd+O2Ts3UFownm6NeY2x6dc8txG4FfjsXSGoE4bIu5g7GH9xDMaSUEi
	hpO1l3cImHIJswQBnGReLO1G8w4Kn3U3rNlrc3PZbF8y1RBYC821pOZtW1iKsxiF
	Dl1PjeQ4VVC8Zv6bCqSK/sSoLqCOhDRoDFdNBns0g9mCR/FoqCHTbxypC3//GKMi
	B06kBt1EphSqfx94xPtPTpU4Z3BbS3QnEUAA5gS7YgXjVRfkR/bVXKfe5XVXlDXt
	Bx4UGhU/A3deqJOBSNvdK5wW1n1CHgF+CcHDjmRfCgFDXktWrWzUlsVWR2hBWRod
	eJlTCQ==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ypm459urd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Jun 2024 23:05:54 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45BN5pvN024820
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Jun 2024 23:05:51 GMT
Received: from [10.71.115.211] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 11 Jun
 2024 16:05:51 -0700
Message-ID: <0318b0c2-5686-4565-b75b-fa1ecfe61740@quicinc.com>
Date: Tue, 11 Jun 2024 16:05:50 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 2/2] soc: qcom: smp2p: Introduce tracepoint support
To: Sudeepgoud Patil <quic_sudeepgo@quicinc.com>, <quic_bjorande@quicinc.com>,
        <andersson@kernel.org>, <mathieu.poirier@linaro.org>
CC: <linux-kernel@vger.kernel.org>, <quic_deesin@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-remoteproc@vger.kernel.org>,
        "Konrad
 Dybcio" <konrad.dybcio@linaro.org>
References: <20240611123351.3813190-1-quic_sudeepgo@quicinc.com>
 <20240611123351.3813190-3-quic_sudeepgo@quicinc.com>
Content-Language: en-US
From: Chris Lew <quic_clew@quicinc.com>
In-Reply-To: <20240611123351.3813190-3-quic_sudeepgo@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: x3EwQRm8v1oJDPQnkUiTux5N50AmAKth
X-Proofpoint-ORIG-GUID: x3EwQRm8v1oJDPQnkUiTux5N50AmAKth
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-11_11,2024-06-11_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 impostorscore=0 mlxlogscore=784 phishscore=0 malwarescore=0 suspectscore=0
 bulkscore=0 spamscore=0 clxscore=1015 priorityscore=1501 adultscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406110156



On 6/11/2024 5:33 AM, Sudeepgoud Patil wrote:
> This commit introduces tracepoint support for smp2p,
> enabling logging of communication between local and remote processors.
> The tracepoints include information about the remote processor ID,
> remote subsystem name, negotiation details, supported features,
> bit change notifications, and ssr activity.
> These tracepoints are valuable for debugging issues between subsystems.
> 
> Signed-off-by: Sudeepgoud Patil <quic_sudeepgo@quicinc.com>
> ---
...
> diff --git a/drivers/soc/qcom/trace-smp2p.h b/drivers/soc/qcom/trace-smp2p.h
> new file mode 100644
> index 000000000000..833782460b57
> --- /dev/null
> +++ b/drivers/soc/qcom/trace-smp2p.h
> @@ -0,0 +1,116 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved.
> + */
> +
> +#undef TRACE_SYSTEM
> +#define TRACE_SYSTEM qcom_smp2p
> +
> +#if !defined(__QCOM_SMP2P_TRACE_H__) || defined(TRACE_HEADER_MULTI_READ)
> +#define __QCOM_SMP2P_TRACE_H__
> +
> +#include <linux/tracepoint.h>
> +
> +#define SMP2P_FEATURE_SSR_ACK 0x1

Now that I see it, redefining the the feature flag here seems a bit out 
of place. I'm not sure if it's worth kicking off a header file for this 
single define though.

> +
> +TRACE_EVENT(smp2p_ssr_ack,
> +	TP_PROTO(unsigned int remote_pid, char *irq_devname),
> +	TP_ARGS(remote_pid, irq_devname),
> +	TP_STRUCT__entry(
> +		__field(u32, remote_pid)
> +		__string(irq_devname, irq_devname)
> +	),
> +	TP_fast_assign(
> +		__entry->remote_pid = remote_pid;
> +		__assign_str(irq_devname, irq_devname);
> +	),
> +	TP_printk("%d: %s: SSR detected, doing SSR Handshake",
> +		__entry->remote_pid,
> +		__get_str(irq_devname)
> +	)
> +);
> +

I don't think we need to pass remote_pid into all of the traces if we 
have a unique name "irq_devname" to identify the remote now. We could 
remove remote_pid from all the trace event arguments.

We can probably drop the "doing SSR Handshake" part of this print. I 
think it can be assumed that we're doing the handshake once we've 
detected SSR.

