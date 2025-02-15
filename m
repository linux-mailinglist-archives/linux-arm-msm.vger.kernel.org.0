Return-Path: <linux-arm-msm+bounces-48100-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2811CA369F5
	for <lists+linux-arm-msm@lfdr.de>; Sat, 15 Feb 2025 01:25:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E22B1169599
	for <lists+linux-arm-msm@lfdr.de>; Sat, 15 Feb 2025 00:25:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67E6A8F5E;
	Sat, 15 Feb 2025 00:25:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="f6+La4pM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D465570838;
	Sat, 15 Feb 2025 00:25:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739579130; cv=none; b=tCQG8IohTRgFjJwJcFP49aa2O8lLaJtPBGOv30i5FlPaV0+Ylns+VX6n79+zHuwwCw4S9cIQeEpjkbdLFj0JNXx5m10yz/JajNTNM0gRSTOVD8Y0mkDCmg7v/HbW6rEqseBRHrSXHaSFZDyirshXJH4MvWu5e2CrbF5LOtQZdlk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739579130; c=relaxed/simple;
	bh=IW/SqQfxeQmQgIMqD034z8MULl63SVEGpFiSlN9F+NA=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=AHeUhup7iy3/buDkL4LvLWHOj9oxZg/BheWtAiDFrm6YF19Oy5gWZvNs4Nc0ZFKqO0Mk8aCZprZOQxHtuyh7Xf+XvLFzt/uTDZQsddQgeEg9MaW89Mn3v6PyahUQbq8bEgKVxsiZt+UX7DyNUlWg52TfTwcvSaYtChUUMF0bm4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=f6+La4pM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51EJPaRQ016993;
	Sat, 15 Feb 2025 00:25:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	u+hSOnIMMeVvS2QYh/UjPRnQTvRZ8sgfZthDEyGmQvI=; b=f6+La4pMNvwWyJlj
	m1J4rtzKYNf54sGtsLMaewNgRXqyCVMGcvF0JGO1b+kAMyGYVYoPzMPZBvBMh/A+
	q4kVje+9aaHHIBEGoyhHDV1On9SOJD5xXxTJZA32f1gWeF9XJuGYLsHOC+6Sv1qk
	KHAtInore69NAXXoZ21w0e0EduiYMsOvTTl/oIIBtpvX0ZjKmj4h3xC6u4lO2/Eb
	GM5fw3gOzE0DY7aLSpVKR0UOzxOJqjallw63Ohs2V0fl7w+ZLGRTl+twfIVQmdYq
	Sm07o4k/vYL1O2Jof2/KWHF7YyylcPUBTq16/TeyfCY6/PmI71jyEg9JGn03P2Qd
	+LeMBw==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44sde8d8s9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 15 Feb 2025 00:25:22 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51F0P9jZ026595
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 15 Feb 2025 00:25:09 GMT
Received: from [10.134.70.212] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 14 Feb
 2025 16:25:08 -0800
Message-ID: <ebea664b-6f53-440a-aa2f-4d4991fb5e1f@quicinc.com>
Date: Fri, 14 Feb 2025 16:25:08 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 04/15] drm/msm/dpu: polish log for resource allocation
Content-Language: en-US
To: Jun Nie <jun.nie@linaro.org>, Rob Clark <robdclark@gmail.com>,
        "Abhinav
 Kumar" <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov
	<dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten
	<marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, "Simona
 Vetter" <simona@ffwll.ch>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
References: <20250118-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-33-v5-0-9701a16340da@linaro.org>
 <20250118-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-33-v5-4-9701a16340da@linaro.org>
From: Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <20250118-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-33-v5-4-9701a16340da@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: DQwPNJp53HyA9lhgnHy5aU4wIlgncz6v
X-Proofpoint-ORIG-GUID: DQwPNJp53HyA9lhgnHy5aU4wIlgncz6v
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-14_10,2025-02-13_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 suspectscore=0
 adultscore=0 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 clxscore=1015 mlxscore=0 mlxlogscore=999 spamscore=0 impostorscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502150002



On 1/17/2025 8:00 AM, Jun Nie wrote:
> It is more likely that resource allocation may fail in complex usage
> case, such as quad-pipe case, than existing usage cases.
> A resource type ID is printed on failure in the current implementation,
> but the raw ID number is not explicit enough to help easily understand
> which resource caused the failure, so add a table to match the type ID
> to an human readable resource name and use it in the error print.
> 
> Signed-off-by: Jun Nie <jun.nie@linaro.org>

Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>

> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c | 23 +++++++++++++++++++----
>   1 file changed, 19 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> index a67ad58acd99f..24e085437039e 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> @@ -802,6 +802,21 @@ void dpu_rm_release_all_sspp(struct dpu_global_state *global_state,
>   		ARRAY_SIZE(global_state->sspp_to_crtc_id), crtc_id);
>   }
>   
> +static char *dpu_hw_blk_type_name[] = {
> +	[DPU_HW_BLK_TOP] = "TOP",
> +	[DPU_HW_BLK_SSPP] = "SSPP",
> +	[DPU_HW_BLK_LM] = "LM",
> +	[DPU_HW_BLK_CTL] = "CTL",
> +	[DPU_HW_BLK_PINGPONG] = "pingpong",
> +	[DPU_HW_BLK_INTF] = "INTF",
> +	[DPU_HW_BLK_WB] = "WB",
> +	[DPU_HW_BLK_DSPP] = "DSPP",
> +	[DPU_HW_BLK_MERGE_3D] = "merge_3d",
> +	[DPU_HW_BLK_DSC] = "DSC",
> +	[DPU_HW_BLK_CDM] = "CDM",
> +	[DPU_HW_BLK_MAX] = "unknown",
> +};
> +
>   /**
>    * dpu_rm_get_assigned_resources - Get hw resources of the given type that are
>    *     assigned to this encoder
> @@ -862,13 +877,13 @@ int dpu_rm_get_assigned_resources(struct dpu_rm *rm,
>   			continue;
>   
>   		if (num_blks == blks_size) {
> -			DPU_ERROR("More than %d resources assigned to enc %d\n",
> -				  blks_size, enc_id);
> +			DPU_ERROR("More than %d %s assigned to enc %d\n",
> +				  blks_size, dpu_hw_blk_type_name[type], enc_id);
>   			break;
>   		}
>   		if (!hw_blks[i]) {
> -			DPU_ERROR("Allocated resource %d unavailable to assign to enc %d\n",
> -				  type, enc_id);
> +			DPU_ERROR("%s unavailable to assign to enc %d\n",
> +				  dpu_hw_blk_type_name[type], enc_id);
>   			break;
>   		}
>   		blks[num_blks++] = hw_blks[i];
> 
> -- 
> 2.34.1
> 


