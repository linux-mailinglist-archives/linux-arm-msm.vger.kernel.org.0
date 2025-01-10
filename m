Return-Path: <linux-arm-msm+bounces-44696-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CD850A084F1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jan 2025 02:40:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7C943188B486
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jan 2025 01:40:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4605D1EEE6;
	Fri, 10 Jan 2025 01:40:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="I/sfV7/S"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58C732C9D
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jan 2025 01:40:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736473236; cv=none; b=tmVXNp+rc1GwPkQYG22NMo2tqRkGVxxD7jR3Al22ZgWJwBnB0LY1JIT4AhgBrCQ4XJEeDAnl8/94gxyUUJtxIuHrRuxifL2MwhnsH+RzYqSxAFE+Ow21OW1P6BTKqUoVdOqe0MHJ6sB05rBeKXvOvoqrVVDAbqddwOiMA1OqmF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736473236; c=relaxed/simple;
	bh=CpfF8tUvD/D3Vurd9tn+1WeAKr3U8P5LxxqJrvHNr3E=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=fxLFsVJ00JJmY/pnU/S6zyZr/VAI/yh8UEC5dVI6qexQrmL8oWCT8rPZZmeeqg8X6+/+JVHkwFAC/fR1KABoEnoZOCmu1JOSLqGboqd2jl325rQUcbP+qXyS0KfKt98k12Rye/V7oQe5+MyxOWT4J2AJvojdUc2UEO7wpxU7Dws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=I/sfV7/S; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 509JqqiQ009907;
	Fri, 10 Jan 2025 01:40:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xplxo5xlmvVXhkNlJfoZUPLptjo9/kpn6N7QOoAbKWE=; b=I/sfV7/SMv2Lf8xS
	1jgvIDls+ON/WmrkF1rnOJdFFd9zDK7SLuthzmoTmGqF52tB/nqtoy4hFYN2UGz8
	Rnv+sXK/6LSjvQzzjOBLizJHW+XOPsPLHmqvz47LwzyqtuMFeDFIk4jzZSPSOp4r
	kRV0KWmHdbB0wtamDhhsiSOnDI/qbWH7nBMSOCY5I+Ik9gxbozktJFUTFOYsEyq9
	D4lzuZs093khfuD/hnPIOwjACl20BikLY1gfOQ5Fu0SfPqj2c5Y2AAlLafJrB1NQ
	7OvHyP6CHpHXK+Kxi/kMQqUuoSQF+Qz+PU0jjMsWi3243JbLZdSEd3qeUk0EUI7V
	LUhFGA==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 442n0ggks0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 10 Jan 2025 01:40:25 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50A1eOxY016272
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 10 Jan 2025 01:40:24 GMT
Received: from [10.110.60.159] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 9 Jan 2025
 17:40:24 -0800
Message-ID: <35a22251-c348-4bb7-905c-e24032100a00@quicinc.com>
Date: Thu, 9 Jan 2025 17:40:23 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/9] drm/msm/dpu: make fix_core_ab_vote consistent with
 fix_core_ib_vote
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark
	<robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten
	<marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Stephen
 Boyd <swboyd@chromium.org>,
        Simona Vetter <simona.vetter@ffwll.ch>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>
References: <20250106-dpu-perf-rework-v4-0-00b248349476@linaro.org>
 <20250106-dpu-perf-rework-v4-4-00b248349476@linaro.org>
Content-Language: en-US
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20250106-dpu-perf-rework-v4-4-00b248349476@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: AwI0UGvZuLkqtAjGt4paEcGH929l3v2R
X-Proofpoint-GUID: AwI0UGvZuLkqtAjGt4paEcGH929l3v2R
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 lowpriorityscore=0 mlxscore=0 suspectscore=0 impostorscore=0 bulkscore=0
 spamscore=0 malwarescore=0 adultscore=0 phishscore=0 clxscore=1015
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501100011



On 1/5/2025 7:07 PM, Dmitry Baryshkov wrote:
> The fix_core_ab_vote is an average bandwidth value, used for bandwidth
> overrides in several cases. However there is an internal inconsistency:
> fix_core_ib_vote is defined in KBps, while fix_core_ab_vote is defined
> in Bps.
> 
> Fix that by changing the type of the variable to u32 and using * 1000ULL
> multiplier when setting up the dpu_core_perf_params::bw_ctl value.
> 

Actually after looking at this, I have another question.

How did you conclude that fix_core_ib_vote is in KBps?

min_dram_ib is in KBps in the catalog but how is fix_core_ib_vote?

It depends on the interpretation perhaps. If the debugfs was supposed to 
operate under the expectation that the provided value will be 
pre-multiplied by 1000 and given then that explains why it was not 
multiplied again.

And I cross-checked some of the internal usages of the debugfs, the 
values provided to it were in Bps and not KBps.

> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c | 4 ++--
>   drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h | 2 +-
>   2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
> index 7263ab63a692554cd51a7fd91bd6250330179240..7cabc8f26908cfd2dbbffebd7c70fc37d9159733 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
> @@ -125,7 +125,7 @@ static void _dpu_core_perf_calc_crtc(const struct dpu_core_perf *core_perf,
>   		perf->max_per_pipe_ib = 0;
>   		perf->core_clk_rate = 0;
>   	} else if (core_perf->perf_tune.mode == DPU_PERF_MODE_FIXED) {
> -		perf->bw_ctl = core_perf->fix_core_ab_vote;
> +		perf->bw_ctl = core_perf->fix_core_ab_vote * 1000ULL;
>   		perf->max_per_pipe_ib = core_perf->fix_core_ib_vote;
>   		perf->core_clk_rate = core_perf->fix_core_clk_rate;
>   	} else {
> @@ -479,7 +479,7 @@ int dpu_core_perf_debugfs_init(struct dpu_kms *dpu_kms, struct dentry *parent)
>   			&perf->fix_core_clk_rate);
>   	debugfs_create_u32("fix_core_ib_vote", 0600, entry,
>   			&perf->fix_core_ib_vote);
> -	debugfs_create_u64("fix_core_ab_vote", 0600, entry,
> +	debugfs_create_u32("fix_core_ab_vote", 0600, entry,
>   			&perf->fix_core_ab_vote);
>   
>   	return 0;
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h
> index ca4595b4ec217697849af02446b23ed0857a0295..5e07119c14c6a9ed3413d0eaddbd93df5cc3f79d 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h
> @@ -51,7 +51,7 @@ struct dpu_core_perf {
>   	u32 enable_bw_release;
>   	u64 fix_core_clk_rate;
>   	u32 fix_core_ib_vote;
> -	u64 fix_core_ab_vote;
> +	u32 fix_core_ab_vote;
>   };
>   
>   int dpu_core_perf_crtc_check(struct drm_crtc *crtc,
> 

