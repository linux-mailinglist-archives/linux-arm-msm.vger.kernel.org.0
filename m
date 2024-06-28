Return-Path: <linux-arm-msm+bounces-24602-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D93E591BB5B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Jun 2024 11:22:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 077E71C22490
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Jun 2024 09:22:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FE4814F114;
	Fri, 28 Jun 2024 09:22:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="I8fGdIb8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D20214F9FF;
	Fri, 28 Jun 2024 09:22:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719566573; cv=none; b=UXowbGbhKbkB23Q3g7iVvsd2ocsvng7ingj+QJQDbZ3HvMUW5JwLJsHdVNniVE+np0q5VobsOzX3pOTH0SxsGalER3VB5EMFjaCNFw9eB9ItBpbshEd0CCCJM8QUfLfMgKB2Rp6qaVkyKcfNsrQhUv9xdEfwGtIoKNCkU9z4OgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719566573; c=relaxed/simple;
	bh=ji3kYAAiZDeNMyOTvUchwFM6v2WJ4stp4je4nHMyTuc=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=p90lINS8PhTvc0Dkng9UcepzlEAk/CU7WzlT4fwR0vAdQnBCYXSKgeUSoiqIEiBlHRVG1PKmX6Lc4khYwMEgJ2xl0XLIVkF0uhlQM14qIcmw7fk6gGEFln+FnFxgg8AtZGqV5F0DmO5Btt4lhbYpWFy4Wd5HGg+59MWD8vtVS24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=I8fGdIb8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45S7x9BC029750;
	Fri, 28 Jun 2024 09:22:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0w1okXQKkQ+Gyg0vlX2pD+pzMSgGZ5fM5jZ85tnSM2M=; b=I8fGdIb8gWvI/L3u
	BGtP/5bK3tYQwIPQnv47/xNyAZz5tprBARD5CX1iwx44LZ717xNmB5qvUfmFpt3J
	TRzKcpz4M09H1oUsjE8UQFhSyIkA3UFqwJe2ITFyh+CeK0+npOeQe3U1a2BWkvaw
	wHBcDMozhKXqItk7pYXttHsSK81E6oVPEwDX2R71IwCRTC8TBrwWHegoi7vUM9bf
	3WXD+TF5n9h52sD4nHihALytel2D33e381+8OF/tXQmQaDNIun5b7E98wEqY+CUA
	ito/N3Q/FSXN+MsiYRpFuFsRI1w6aUI+WDsyC884kG+BNUtJ2dW6b2mij/qqfMCv
	O0zqJg==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 400c46f0t0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 28 Jun 2024 09:22:47 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45S9Mj5Y019309
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 28 Jun 2024 09:22:45 GMT
Received: from [10.217.239.82] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 28 Jun
 2024 02:22:42 -0700
Message-ID: <ef5d4b87-76c7-4ff3-84ed-7f4743ec052c@quicinc.com>
Date: Fri, 28 Jun 2024 14:52:39 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3 2/2] soc: qcom: smp2p: Introduce tracepoint support
To: Sudeepgoud Patil <quic_sudeepgo@quicinc.com>, <quic_bjorande@quicinc.com>,
        <andersson@kernel.org>, <quic_clew@quicinc.com>,
        <mathieu.poirier@linaro.org>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-remoteproc@vger.kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>
References: <20240627104831.4176799-1-quic_sudeepgo@quicinc.com>
 <20240627104831.4176799-3-quic_sudeepgo@quicinc.com>
Content-Language: en-US
From: Deepak Kumar Singh <quic_deesin@quicinc.com>
In-Reply-To: <20240627104831.4176799-3-quic_sudeepgo@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: XbCY66zaB6fOR7SKbK055UrE5LPEag8o
X-Proofpoint-GUID: XbCY66zaB6fOR7SKbK055UrE5LPEag8o
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-28_05,2024-06-28_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 spamscore=0
 mlxscore=0 lowpriorityscore=0 phishscore=0 mlxlogscore=999 adultscore=0
 priorityscore=1501 malwarescore=0 clxscore=1011 suspectscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2406140001
 definitions=main-2406280068



On 6/27/2024 4:18 PM, Sudeepgoud Patil wrote:
> This commit introduces tracepoint support for smp2p, enabling
> logging of communication between local and remote processors.
> These tracepoints include information about the remote subsystem
> name, negotiation details, supported features, bit change
> notifications, and ssr activity. These logs are useful for
> debugging issues between subsystems.
> 
> Signed-off-by: Sudeepgoud Patil <quic_sudeepgo@quicinc.com>
Reviewed-by: Deepak Kumar Singh <quic_deesin@quicinc.com>
> ---
>   drivers/soc/qcom/Makefile      |  1 +
>   drivers/soc/qcom/smp2p.c       |  9 ++++
>   drivers/soc/qcom/trace-smp2p.h | 98 ++++++++++++++++++++++++++++++++++
>   3 files changed, 108 insertions(+)
>   create mode 100644 drivers/soc/qcom/trace-smp2p.h
> 
> diff --git a/drivers/soc/qcom/Makefile b/drivers/soc/qcom/Makefile
> index ca0bece0dfff..30c1bf645501 100644
> --- a/drivers/soc/qcom/Makefile
> +++ b/drivers/soc/qcom/Makefile
> @@ -23,6 +23,7 @@ qcom_rpmh-y			+= rpmh.o
>   obj-$(CONFIG_QCOM_SMD_RPM)	+= rpm-proc.o smd-rpm.o
>   obj-$(CONFIG_QCOM_SMEM) +=	smem.o
>   obj-$(CONFIG_QCOM_SMEM_STATE) += smem_state.o
> +CFLAGS_smp2p.o := -I$(src)
>   obj-$(CONFIG_QCOM_SMP2P)	+= smp2p.o
>   obj-$(CONFIG_QCOM_SMSM)	+= smsm.o
>   obj-$(CONFIG_QCOM_SOCINFO)	+= socinfo.o
> diff --git a/drivers/soc/qcom/smp2p.c b/drivers/soc/qcom/smp2p.c
> index 696c2a8387d0..4aa61b0f11ad 100644
> --- a/drivers/soc/qcom/smp2p.c
> +++ b/drivers/soc/qcom/smp2p.c
> @@ -161,6 +161,9 @@ struct qcom_smp2p {
>   	struct list_head outbound;
>   };
>   
> +#define CREATE_TRACE_POINTS
> +#include "trace-smp2p.h"
> +
>   static void qcom_smp2p_kick(struct qcom_smp2p *smp2p)
>   {
>   	/* Make sure any updated data is written before the kick */
> @@ -192,6 +195,7 @@ static void qcom_smp2p_do_ssr_ack(struct qcom_smp2p *smp2p)
>   	struct smp2p_smem_item *out = smp2p->out;
>   	u32 val;
>   
> +	trace_smp2p_ssr_ack(smp2p->dev);
>   	smp2p->ssr_ack = !smp2p->ssr_ack;
>   
>   	val = out->flags & ~BIT(SMP2P_FLAGS_RESTART_ACK_BIT);
> @@ -214,6 +218,7 @@ static void qcom_smp2p_negotiate(struct qcom_smp2p *smp2p)
>   			smp2p->ssr_ack_enabled = true;
>   
>   		smp2p->negotiation_done = true;
> +		trace_smp2p_negotiate(smp2p->dev, out->features);
>   	}
>   }
>   
> @@ -252,6 +257,8 @@ static void qcom_smp2p_notify_in(struct qcom_smp2p *smp2p)
>   		status = val ^ entry->last_value;
>   		entry->last_value = val;
>   
> +		trace_smp2p_notify_in(entry, status, val);
> +
>   		/* No changes of this entry? */
>   		if (!status)
>   			continue;
> @@ -415,6 +422,8 @@ static int smp2p_update_bits(void *data, u32 mask, u32 value)
>   	writel(val, entry->value);
>   	spin_unlock_irqrestore(&entry->lock, flags);
>   
> +	trace_smp2p_update_bits(entry, orig, val);
> +
>   	if (val != orig)
>   		qcom_smp2p_kick(entry->smp2p);
>   
> diff --git a/drivers/soc/qcom/trace-smp2p.h b/drivers/soc/qcom/trace-smp2p.h
> new file mode 100644
> index 000000000000..fa985a0d7615
> --- /dev/null
> +++ b/drivers/soc/qcom/trace-smp2p.h
> @@ -0,0 +1,98 @@
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
> +#include <linux/device.h>
> +#include <linux/tracepoint.h>
> +
> +TRACE_EVENT(smp2p_ssr_ack,
> +	TP_PROTO(const struct device *dev),
> +	TP_ARGS(dev),
> +	TP_STRUCT__entry(
> +		__string(dev_name, dev_name(dev))
> +	),
> +	TP_fast_assign(
> +		__assign_str(dev_name, dev_name(dev));
> +	),
> +	TP_printk("%s: SSR detected", __get_str(dev_name))
> +);
> +
> +TRACE_EVENT(smp2p_negotiate,
> +	TP_PROTO(const struct device *dev, unsigned int features),
> +	TP_ARGS(dev, features),
> +	TP_STRUCT__entry(
> +		__string(dev_name, dev_name(dev))
> +		__field(u32, out_features)
> +	),
> +	TP_fast_assign(
> +		__assign_str(dev_name, dev_name(dev));
> +		__entry->out_features = features;
> +	),
> +	TP_printk("%s: state=open out_features=%s", __get_str(dev_name),
> +		__print_flags(__entry->out_features, "|",
> +			{SMP2P_FEATURE_SSR_ACK, "SMP2P_FEATURE_SSR_ACK"})
> +	)
> +);
> +
> +TRACE_EVENT(smp2p_notify_in,
> +	TP_PROTO(struct smp2p_entry *smp2p_entry, unsigned long status, u32 val),
> +	TP_ARGS(smp2p_entry, status, val),
> +	TP_STRUCT__entry(
> +		__string(dev_name, dev_name(smp2p_entry->smp2p->dev))
> +		__string(client_name, smp2p_entry->name)
> +		__field(unsigned long, status)
> +		__field(u32, val)
> +	),
> +	TP_fast_assign(
> +		__assign_str(dev_name, dev_name(smp2p_entry->smp2p->dev));
> +		__assign_str(client_name, smp2p_entry->name);
> +		__entry->status = status;
> +		__entry->val = val;
> +	),
> +	TP_printk("%s: %s: status:0x%0lx val:0x%0x",
> +		__get_str(dev_name),
> +		__get_str(client_name),
> +		__entry->status,
> +		__entry->val
> +	)
> +);
> +
> +TRACE_EVENT(smp2p_update_bits,
> +	TP_PROTO(struct smp2p_entry *smp2p_entry, u32 orig, u32 val),
> +	TP_ARGS(smp2p_entry, orig, val),
> +	TP_STRUCT__entry(
> +		__string(dev_name, dev_name(smp2p_entry->smp2p->dev))
> +		__string(client_name, smp2p_entry->name)
> +		__field(u32, orig)
> +		__field(u32, val)
> +	),
> +	TP_fast_assign(
> +		__assign_str(dev_name, dev_name(smp2p_entry->smp2p->dev));
> +		__assign_str(client_name, smp2p_entry->name);
> +		__entry->orig = orig;
> +		__entry->val = val;
> +	),
> +	TP_printk("%s: %s: orig:0x%0x new:0x%0x",
> +		__get_str(dev_name),
> +		__get_str(client_name),
> +		__entry->orig,
> +		__entry->val
> +	)
> +);
> +
> +#endif /* __QCOM_SMP2P_TRACE_H__ */
> +
> +#undef TRACE_INCLUDE_PATH
> +#define TRACE_INCLUDE_PATH .
> +
> +#undef TRACE_INCLUDE_FILE
> +#define TRACE_INCLUDE_FILE trace-smp2p
> +
> +#include <trace/define_trace.h>

