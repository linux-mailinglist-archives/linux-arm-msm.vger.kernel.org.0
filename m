Return-Path: <linux-arm-msm+bounces-50439-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DDF3DA541DF
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Mar 2025 06:03:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1A2033AF3A8
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Mar 2025 05:03:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2F7712DD8A;
	Thu,  6 Mar 2025 05:03:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="LoFmNQRE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 134677E9;
	Thu,  6 Mar 2025 05:03:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741237421; cv=none; b=N7/PWonI5v7HPxN+0uS/zjMDChrfWHygupV25YeR9MGFgWCXbHyc6Hn/6hy34drX0sDMS2+tgjLkjI1EfLizXpvQXTw93aMO+yVth7eFWkBLxtHZbXQC4rrMCx4mTwVvWxrh8EDN/rIey8iEoJoNjVO87OTlno07MRsO/91t/e4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741237421; c=relaxed/simple;
	bh=oJM+QeLa0lqE8brvA1StHD/WrvbL4pKgWIg8bjYcWAE=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=NCOz0DLtn17pAXBDrPm3JiR60BPRxeqoHzcl+mhmjFgaMAG4MftF+sg/WSh++ruN1F2l3eAgcqDMbGjmEors2+kieVcsMZrOjBSOkqNfddFiUMaFKgr7/h4lUDkJbPIT16zRWkWQFL3fAJdJMSQ/rtACBsh62X5KFvVPmKGuIak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=LoFmNQRE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 525JjmCC012866;
	Thu, 6 Mar 2025 05:03:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jopZ2iz6yqeVAbFpJFMCVbzfFhjOlxL0UCHAvTNkzNU=; b=LoFmNQREQNUwA6cA
	nc/bP5W4yjCoRmvBrLHNkIHJzpbd9wwXG7dg4kOUVemT06MhvNBGJnNZJ/80e1sk
	a54edbio+OLAlpXoUevEzuJw98NKOg8jm4JTW7w/BI5rM873DoE2THvhgZGD2enB
	fmiaCV+iwI1puOAyLmb6zczRkqRb0/9sNYu3+Q5UlxUvo6JXR+NCgj60b6249vFs
	FNXKs8U6wVmPHnNNV4kHFk/rGCaBopPvOJlRUAXdALSHL4sC8zvoa/1Zo2mfDcmJ
	wGdBrvB5Hm+DAiyh7G4RwMVvJIQ4t7gdK4nTuwg9F4kf5ardy14vjgR+cEeiEDii
	AdchxA==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 455p6vqsj0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 06 Mar 2025 05:03:28 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 52653S2j023652
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 6 Mar 2025 05:03:28 GMT
Received: from [10.134.71.247] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 5 Mar 2025
 21:03:27 -0800
Message-ID: <1e2f9fab-bb22-4347-98b8-763b721f7b9a@quicinc.com>
Date: Wed, 5 Mar 2025 21:03:27 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm/dpu: Clear perf params before calculating bw
To: Jessica Zhang <quic_jesszhan@quicinc.com>,
        Rob Clark
	<robdclark@gmail.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        "Sean
 Paul" <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        "David Airlie" <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
References: <20250305-perf-calc-fix-v1-1-d57f356caf59@quicinc.com>
Content-Language: en-US
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20250305-perf-calc-fix-v1-1-d57f356caf59@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 0VSvXHK2btYl20UBdIX1eUM5A9TuQayu
X-Authority-Analysis: v=2.4 cv=LYfG6ifi c=1 sm=1 tr=0 ts=67c92ca1 cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=COk6AnOGAAAA:8 a=w9ZohHdHzkDmToTSZWsA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: 0VSvXHK2btYl20UBdIX1eUM5A9TuQayu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-06_02,2025-03-05_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 spamscore=0 clxscore=1015 phishscore=0 adultscore=0 lowpriorityscore=0
 impostorscore=0 bulkscore=0 mlxscore=0 suspectscore=0 malwarescore=0
 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502100000
 definitions=main-2503060034



On 3/5/2025 7:46 PM, Jessica Zhang wrote:
> To prevent incorrect BW calculation, zero out dpu_core_perf_params
> before it is passed into dpu_core_perf_aggregate().
> 
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 


Fixes: 795aef6f3653 ("drm/msm/dpu: remove duplicate code calculating sum 
of bandwidths")


Good catch!

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
> index 7ff3405c68675..0fb5789c60d0d 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
> @@ -164,7 +164,7 @@ int dpu_core_perf_crtc_check(struct drm_crtc *crtc,
>   	u32 bw, threshold;
>   	struct dpu_crtc_state *dpu_cstate;
>   	struct dpu_kms *kms;
> -	struct dpu_core_perf_params perf;
> +	struct dpu_core_perf_params perf = { 0 };
>   
>   	if (!crtc || !state) {
>   		DPU_ERROR("invalid crtc\n");
> 
> ---
> base-commit: 6d3175a72cc07e90f81fb35841048a8a9b5134cb
> change-id: 20250305-perf-calc-fix-07147a3ff410
> 
> Best regards,


