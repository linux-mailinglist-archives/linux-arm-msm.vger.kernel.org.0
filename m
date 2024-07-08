Return-Path: <linux-arm-msm+bounces-25472-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AA9E929F77
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jul 2024 11:46:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4812828865B
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jul 2024 09:46:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A8B875808;
	Mon,  8 Jul 2024 09:46:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="GnAcNpGW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 697CC3C08A;
	Mon,  8 Jul 2024 09:46:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720431988; cv=none; b=IoSTi3IG0gaOg8nHAIGzZow6voclsAqQ7L6tF26F2PDk/A/MQjZo9iPyELyVvK8aSPiEiCEXK9xdn5AMx060/jkmWh2zhr3EE0Ei8LC3aU6kfLWq/Xn7VplUloYrjX4dO2Ioh3nan06u/xsiNZnaNjnNZey3EtiXOacgV7fDDRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720431988; c=relaxed/simple;
	bh=W2RFUdPcLsAwWyNftN8UrI7mtg9U+0+cL7YmjGhErfY=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=lnqKVSXwe3nNb0d7R0nOABrjb5nmUB4P5uAQ1XXqk0c7AK/ErQXn/PqELToS7DekVILmmpWZF8AsUoP43HoBxAMqsvkwOyDXYsV+G9/hb5TXxWoY4p5L1wteOdOaaw9eoq0ENKjTDGElqdCCFGnzcXRMcjvvRz5uGVXzxEZKh2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=GnAcNpGW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 467NQgWr005107;
	Mon, 8 Jul 2024 09:46:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VooEroP/kbsdiQI+qsI5MGttmZcrIEctQJhJfXss1YE=; b=GnAcNpGWtcUTEjjg
	WwBpuq+y8KbdyjX9gvGOKlK/7Ss6eZf5HoFxFAA9/DFzw//YDVMElsPALWvQn56X
	C/725/C2iI4lkA8POwpmg/2umwwCrZDVvjCUXHBqu4SSEdCMbxFzpNBEEAra5592
	9wbqGzNJ6XFwrot1Lysht4lEDoHV7W9rakmAJtIdoHjpBN3LBAWX1kGCsm6mlnh8
	gAssUzZ19iH3vSOqxYVJvLTgaJorIV+FslwW540dVyFzWFBbIbFApt8YHotKaTBP
	2n8BMBimNpLtovx/hge+vBUhlck/Wbj7ju9F/Hcn5n/jAK0+koIYFmxqyjAIfVPY
	mHY+Rg==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 406y77k4q0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 08 Jul 2024 09:46:23 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 4689kNsi030016
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 8 Jul 2024 09:46:23 GMT
Received: from [10.131.33.37] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 8 Jul 2024
 02:46:20 -0700
Message-ID: <85dca40d-7c90-8a5f-50ae-996f7903082a@quicinc.com>
Date: Mon, 8 Jul 2024 15:16:17 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2] soc: qcom: icc-bwmon: Add tracepoints in
 bwmon_intr_thread
Content-Language: en-US
To: Shivnandan Kumar <quic_kshivnan@quicinc.com>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <quic_rgottimu@quicinc.com>
References: <20240625055611.1375273-1-quic_kshivnan@quicinc.com>
From: Sibi Sankar <quic_sibis@quicinc.com>
In-Reply-To: <20240625055611.1375273-1-quic_kshivnan@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: cVpiohXdFRaffGKHo-RS4wvgRjKyABD7
X-Proofpoint-ORIG-GUID: cVpiohXdFRaffGKHo-RS4wvgRjKyABD7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-08_05,2024-07-05_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 suspectscore=0
 mlxscore=0 clxscore=1015 priorityscore=1501 spamscore=0 lowpriorityscore=0
 malwarescore=0 bulkscore=0 adultscore=0 mlxlogscore=999 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2406140001
 definitions=main-2407080076



On 6/25/24 11:26, Shivnandan Kumar wrote:
> Add tracepoint for tracing the measured traffic in kbps,
> up_kbps and down_kbps in bwmon. This information is valuable
> for understanding what bwmon hw measures at the system cache
> level and at the DDR level which is helpful in debugging
> bwmon behavior.
> 
> Signed-off-by: Shivnandan Kumar <quic_kshivnan@quicinc.com>
> ---
> 
> v2:
> * Fix multiple assignments [Dmitry]
> * Fix alignment [Dmitry]
> 
>   MAINTAINERS                        |  1 +
>   drivers/soc/qcom/icc-bwmon.c       |  6 +++-
>   drivers/soc/qcom/trace_icc-bwmon.h | 48 ++++++++++++++++++++++++++++++
>   3 files changed, 54 insertions(+), 1 deletion(-)
>   create mode 100644 drivers/soc/qcom/trace_icc-bwmon.h
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 242fc612fbc5..1b410c0183bb 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -18573,6 +18573,7 @@ M:	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>   L:	linux-arm-msm@vger.kernel.org
>   S:	Maintained
>   F:	Documentation/devicetree/bindings/interconnect/qcom,msm8998-bwmon.yaml
> +F:	drivers/soc/qcom/trace_icc-bwmon.h

[nit] The file addition is not in sorted order.

Reviewed-by: Sibi Sankar <quic_sibis@quicinc.com>


>   F:	drivers/soc/qcom/icc-bwmon.c
> 
>   QUALCOMM IOMMU
> diff --git a/drivers/soc/qcom/icc-bwmon.c b/drivers/soc/qcom/icc-bwmon.c
> index fb323b3364db..fc391d077d93 100644
> --- a/drivers/soc/qcom/icc-bwmon.c
> +++ b/drivers/soc/qcom/icc-bwmon.c
> @@ -17,6 +17,8 @@
>   #include <linux/pm_opp.h>
>   #include <linux/regmap.h>
>   #include <linux/sizes.h>
> +#define CREATE_TRACE_POINTS
> +#include "trace_icc-bwmon.h"
> 
>   /*
>    * The BWMON samples data throughput within 'sample_ms' time. With three
> @@ -645,9 +647,10 @@ static irqreturn_t bwmon_intr_thread(int irq, void *dev_id)
>   	struct icc_bwmon *bwmon = dev_id;
>   	unsigned int irq_enable = 0;
>   	struct dev_pm_opp *opp, *target_opp;
> -	unsigned int bw_kbps, up_kbps, down_kbps;
> +	unsigned int bw_kbps, up_kbps, down_kbps, meas_kbps;
> 
>   	bw_kbps = bwmon->target_kbps;
> +	meas_kbps = bwmon->target_kbps;
> 
>   	target_opp = dev_pm_opp_find_bw_ceil(bwmon->dev, &bw_kbps, 0);
>   	if (IS_ERR(target_opp) && PTR_ERR(target_opp) == -ERANGE)
> @@ -679,6 +682,7 @@ static irqreturn_t bwmon_intr_thread(int irq, void *dev_id)
>   	bwmon_clear_irq(bwmon);
>   	bwmon_enable(bwmon, irq_enable);
> 
> +	trace_qcom_bwmon_update(dev_name(bwmon->dev), meas_kbps, up_kbps, down_kbps);
>   	if (bwmon->target_kbps == bwmon->current_kbps)
>   		goto out;
> 
> diff --git a/drivers/soc/qcom/trace_icc-bwmon.h b/drivers/soc/qcom/trace_icc-bwmon.h
> new file mode 100644
> index 000000000000..beb8e6b485a9
> --- /dev/null
> +++ b/drivers/soc/qcom/trace_icc-bwmon.h
> @@ -0,0 +1,48 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved.
> + */
> +
> +#undef TRACE_SYSTEM
> +#define TRACE_SYSTEM icc_bwmon
> +
> +#if !defined(_TRACE_ICC_BWMON_H) || defined(TRACE_HEADER_MULTI_READ)
> +#define _TRACE_ICC_BWMON_H
> +#include <linux/tracepoint.h>
> +
> +TRACE_EVENT(qcom_bwmon_update,
> +	    TP_PROTO(const char *name,
> +		     unsigned int meas_kbps, unsigned int up_kbps, unsigned int down_kbps),
> +
> +	    TP_ARGS(name, meas_kbps, up_kbps, down_kbps),
> +
> +	    TP_STRUCT__entry(
> +			     __string(name, name)
> +			     __field(unsigned int, meas_kbps)
> +			     __field(unsigned int, up_kbps)
> +			     __field(unsigned int, down_kbps)
> +	    ),
> +
> +	    TP_fast_assign(
> +			   __assign_str(name);
> +			   __entry->meas_kbps = meas_kbps;
> +			   __entry->up_kbps = up_kbps;
> +			   __entry->down_kbps = down_kbps;
> +	    ),
> +
> +	    TP_printk("name=%s meas_kbps=%u up_kbps=%u down_kbps=%u",
> +		      __get_str(name),
> +		      __entry->meas_kbps,
> +		      __entry->up_kbps,
> +		      __entry->down_kbps)
> +);
> +
> +#endif /* _TRACE_ICC_BWMON_H */
> +
> +#undef TRACE_INCLUDE_PATH
> +#define TRACE_INCLUDE_PATH ../../drivers/soc/qcom/
> +
> +#undef TRACE_INCLUDE_FILE
> +#define TRACE_INCLUDE_FILE trace_icc-bwmon
> +
> +#include <trace/define_trace.h>
> --
> 2.25.1
> 
> 

