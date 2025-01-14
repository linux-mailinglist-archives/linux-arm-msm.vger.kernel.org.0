Return-Path: <linux-arm-msm+bounces-44951-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B50FA0FF9C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jan 2025 04:38:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 72F2D1882B89
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jan 2025 03:38:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDB5D524B4;
	Tue, 14 Jan 2025 03:38:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="eAoUFmfB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2299624024E
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jan 2025 03:38:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736825910; cv=none; b=N3HA80N3y/03X5H/qRGfPxftCuD8AwHaq6ky6BU33pfI/i2kPmCBG1W2Mc2IKG6CqQkLFI5tQWa1VBRNq5USTCxl+30HdVpg4cbKXUdmwxbkOd9RNkIfEytI+4tpKffaqK8onCXgmFjQsrFGovcGyTXoW3oAcqVBzjEWUVsTyhE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736825910; c=relaxed/simple;
	bh=9CfOGnZXAA5Z0oT3BJBTuJrql5aki4KihVUNNC5uZjs=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=qpWTh752D3DPCKtr9/AwghxL0dYv8YUOeG0Pq1TjCnWq/CpzFT0AKfapaQ+VnwHzSKNpqzHKsVncNl85JijDywbQ63l1IlOWqow/DCCO1eXiMOFFDHkuWdJ0DeDBLpw9eD4or0f+G4r/GHn0kV/qQV6vKmcHKyGh3hmoNWQVOlk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=eAoUFmfB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50E2fuXX019249;
	Tue, 14 Jan 2025 03:38:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NFrqODLoADTCRBIFXR4Q38/MF+Ie/NkqBwmn1OkkLsA=; b=eAoUFmfBlyoWd50A
	9pFut/fmjsdocsmIs6t6ikWSwv7U956PnTZzLel/fqaUyw35GRrzQcudHVXKYoSd
	YaUyU4pl24NUw0hjamNOsM2GwQSqjY2RroUPjWvSwlfXgy6QzbHzaFoKaSGYm1gO
	IJXKhk7QCXSOYgVHx2TeFNb6EzlYTStQJxwHlx7BPhBqPvypVfuqdHJQ8hps/Sbb
	IkIHQfk9Oc/eyveXEC2QqAQMIr5w4hYzmLYgkxRb8/ZYgkK07CTAxZYjKGAlfTfB
	03CHAbb19p7c3LSVEaV+YpPH0+eCrKGYIiNhwMIHwdl5j4W8C8BP1NIvRSAxxaaZ
	ybT/8A==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 445fc683wa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 14 Jan 2025 03:38:19 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50E3cIi8007942
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 14 Jan 2025 03:38:18 GMT
Received: from [10.71.108.79] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 13 Jan
 2025 19:38:17 -0800
Message-ID: <459422c9-c272-4389-9b05-487a0148a082@quicinc.com>
Date: Mon, 13 Jan 2025 19:38:16 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 7/9] drm/msm/dpu: handle perf mode in
 _dpu_core_perf_crtc_update_bus()
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
 <20250106-dpu-perf-rework-v4-7-00b248349476@linaro.org>
Content-Language: en-US
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20250106-dpu-perf-rework-v4-7-00b248349476@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: XyB1WqGYcsqzG9mpACoALcf08dQ0PVPD
X-Proofpoint-GUID: XyB1WqGYcsqzG9mpACoALcf08dQ0PVPD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 lowpriorityscore=0
 bulkscore=0 mlxlogscore=999 adultscore=0 suspectscore=0 malwarescore=0
 phishscore=0 clxscore=1015 impostorscore=0 priorityscore=1501 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2501140028



On 1/5/2025 7:07 PM, Dmitry Baryshkov wrote:
> Move perf mode handling for the bandwidth to
> _dpu_core_perf_crtc_update_bus() rather than overriding per-CRTC data
> and then aggregating known values.
> 
> Note, this changes the fix_core_ab_vote. Previously it would be
> multiplied per the CRTC number, now it will be used directly for
> interconnect voting. This better reflects user requirements in the case
> of different resolutions being set on different CRTCs: instead of using
> the same bandwidth for each CRTC (which is incorrect) user can now
> calculate overall bandwidth required by all outputs and use that value.
> 

There are two things this change is doing:

1) Dropping the core_clk_rate setting because its already handled inside 
_dpu_core_perf_get_core_clk_rate() and hence dpu_core_perf_crtc_update() 
will still work.

and

2) Then this part of moving the ab/ib setting to 
_dpu_core_perf_crtc_update_bus().

Can we split this into two changes so that its clear that dropping 
core_clk_rate setting in this change will not cause an issue.


> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c | 40 +++++++++++++--------------
>   1 file changed, 19 insertions(+), 21 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
> index 70f43e8359caee2082f2ca9944a17a6a20aa3d49..7ff3405c6867556a8dc776783b91f1da6c86ef3f 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
> @@ -118,22 +118,9 @@ static void _dpu_core_perf_calc_crtc(const struct dpu_core_perf *core_perf,
>   		return;
>   	}
>   
> -	memset(perf, 0, sizeof(struct dpu_core_perf_params));
> -
> -	if (core_perf->perf_tune.mode == DPU_PERF_MODE_MINIMUM) {
> -		perf->bw_ctl = 0;
> -		perf->max_per_pipe_ib = 0;
> -		perf->core_clk_rate = 0;
> -	} else if (core_perf->perf_tune.mode == DPU_PERF_MODE_FIXED) {
> -		perf->bw_ctl = core_perf->fix_core_ab_vote * 1000ULL;
> -		perf->max_per_pipe_ib = core_perf->fix_core_ib_vote;
> -		perf->core_clk_rate = core_perf->fix_core_clk_rate;
> -	} else {
> -		perf->bw_ctl = _dpu_core_perf_calc_bw(perf_cfg, crtc);
> -		perf->max_per_pipe_ib = perf_cfg->min_dram_ib;
> -		perf->core_clk_rate = _dpu_core_perf_calc_clk(perf_cfg, crtc, state);
> -	}
> -
> +	perf->bw_ctl = _dpu_core_perf_calc_bw(perf_cfg, crtc);
> +	perf->max_per_pipe_ib = perf_cfg->min_dram_ib;
> +	perf->core_clk_rate = _dpu_core_perf_calc_clk(perf_cfg, crtc, state);
>   	DRM_DEBUG_ATOMIC(
>   		"crtc=%d clk_rate=%llu core_ib=%u core_ab=%u\n",
>   			crtc->base.id, perf->core_clk_rate,
> @@ -222,18 +209,29 @@ static int _dpu_core_perf_crtc_update_bus(struct dpu_kms *kms,
>   {
>   	struct dpu_core_perf_params perf = { 0 };
>   	int i, ret = 0;
> -	u64 avg_bw;
> +	u32 avg_bw;
> +	u32 peak_bw;
>   
>   	if (!kms->num_paths)
>   		return 0;
>   
> -	dpu_core_perf_aggregate(crtc->dev, dpu_crtc_get_client_type(crtc), &perf);
> +	if (kms->perf.perf_tune.mode == DPU_PERF_MODE_MINIMUM) {
> +		avg_bw = 0;
> +		peak_bw = 0;
> +	} else if (kms->perf.perf_tune.mode == DPU_PERF_MODE_FIXED) {
> +		avg_bw = kms->perf.fix_core_ab_vote;
> +		peak_bw = kms->perf.fix_core_ib_vote;
> +	} else {
> +		dpu_core_perf_aggregate(crtc->dev, dpu_crtc_get_client_type(crtc), &perf);
> +
> +		avg_bw = div_u64(perf.bw_ctl, 1000); /*Bps_to_icc*/
> +		peak_bw = perf.max_per_pipe_ib;
> +	}
>   
> -	avg_bw = perf.bw_ctl;
> -	do_div(avg_bw, (kms->num_paths * 1000)); /*Bps_to_icc*/
> +	avg_bw /= kms->num_paths;
>   
>   	for (i = 0; i < kms->num_paths; i++)
> -		icc_set_bw(kms->path[i], avg_bw, perf.max_per_pipe_ib);
> +		icc_set_bw(kms->path[i], avg_bw, peak_bw);
>   
>   	return ret;
>   }
> 

