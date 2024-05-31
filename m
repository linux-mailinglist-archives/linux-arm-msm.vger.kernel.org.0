Return-Path: <linux-arm-msm+bounces-21189-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AF1E78D5777
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 May 2024 03:03:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 258031F222FF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 May 2024 01:03:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 578E0211C;
	Fri, 31 May 2024 01:02:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="f9h1QTPB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF24963C7
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 May 2024 01:02:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717117375; cv=none; b=dV9iF0d1VX54Of7VA/IDrYAoqm2kzJbt6Xp0sKjhODjKK5zFy0N9PmKIdtWw5biIboX3jvkAkReOcs0i+cL6ZWzcvYWikVtWuIfBEYVsdyanoxcfEXUqHaPy/okfzFGYfr43n16a0AgIEMh+IzJLcD8SQhKJxQuAvv9O/SWFJXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717117375; c=relaxed/simple;
	bh=7Mt2A154fHrbdyHK2g8RJhK4gMDge7So5tSVydQbnlE=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=osI3TOMazmWQPl6apaRGbouDDj6YgD1E3ODZBxdO1uRnW7M6Ts0eFaKzBN0mC4CCrMuUJP2kCSrGJAe1GJRGgBH6vy65uIIFBUHZ1dkLADWnkuTeh2di8sF41bfar9DBa5sVAuH/UaZXeJEgTNwTtVC705gotrtd9FTp+/2fgEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=f9h1QTPB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44UHDn25024256;
	Fri, 31 May 2024 01:02:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BPPcczdJf/UcAPn07oic5fGsvewdXZJnmPMWlsGhOlU=; b=f9h1QTPBKU3D5JQy
	InbK+9m3ORbXRVBDhs1qVNWjGKTdgrwoxs5CKuXraJ9oCqpWDH5oLa67CwSCoSfk
	KUnigxlrZDHSEKFgvHGG8YxCwv5r8wTwB929qiugvnpPLClMBs4iN7Dvd3wVe7Oc
	zBZuIOGnKGOL19eN8YVWQS+sczbPPjV5aniPXBsMt8B/DiWNk+bYofThlh1nsFux
	WOOfZrBZL8lR/TaAfGRfxS3bvMPRFWvcEpR5EwGyODQR2do3vtAGWYjHFiXKqcC1
	qZaDeaRRqBrW7JEpWc8JhHuHLLkGMskHn93kkcyP42Yw5ewcoWvIWVS0WshFsstn
	wSkcSw==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ybadxdjnm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 31 May 2024 01:02:41 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44V12ew4027294
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 31 May 2024 01:02:40 GMT
Received: from [10.71.110.249] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 30 May
 2024 18:02:36 -0700
Message-ID: <6a335026-77c1-a112-69af-a8d9d86d5528@quicinc.com>
Date: Thu, 30 May 2024 18:02:34 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v4 05/13] drm/msm/dpu: move scaling limitations out of the
 hw_catalog
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark
	<robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten
	<marijn.suijten@somainline.org>
CC: Stephen Boyd <swboyd@chromium.org>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>
References: <20240314000216.392549-1-dmitry.baryshkov@linaro.org>
 <20240314000216.392549-6-dmitry.baryshkov@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20240314000216.392549-6-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: QNXNN7eTdiT5GMQmuvh7p6VYdKB_UxZ2
X-Proofpoint-GUID: QNXNN7eTdiT5GMQmuvh7p6VYdKB_UxZ2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-30_21,2024-05-30_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 phishscore=0
 impostorscore=0 bulkscore=0 mlxlogscore=999 malwarescore=0
 priorityscore=1501 mlxscore=0 suspectscore=0 spamscore=0
 lowpriorityscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2405170001 definitions=main-2405310006



On 3/13/2024 5:02 PM, Dmitry Baryshkov wrote:
> Max upscale / downscale factors are constant between platforms. In
> preparation to adding support for virtual planes and allocating SSPP
> blocks on demand move max scaling factors out of the HW catalog and
> handle them in the dpu_plane directly. If any of the scaling blocks gets
> different limitations, this will have to be handled separately, after
> the plane refactoring.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 12 ------------
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h |  4 ----
>   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c      | 16 +++++++++++++---
>   3 files changed, 13 insertions(+), 19 deletions(-)
> 

<Snip>

> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> index 70d6a8989e1a..6360052523b5 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> @@ -785,12 +785,15 @@ static int dpu_plane_atomic_check_pipe(struct dpu_plane *pdpu,
>   	return 0;
>   }
>   
> +#define MAX_UPSCALE_RATIO	20
> +#define MAX_DOWNSCALE_RATIO	4
> +
>   static int dpu_plane_atomic_check(struct drm_plane *plane,
>   				  struct drm_atomic_state *state)
>   {
>   	struct drm_plane_state *new_plane_state = drm_atomic_get_new_plane_state(state,
>   										 plane);
> -	int ret = 0, min_scale;
> +	int ret = 0, min_scale, max_scale;
>   	struct dpu_plane *pdpu = to_dpu_plane(plane);
>   	struct dpu_kms *kms = _dpu_plane_get_kms(&pdpu->base);
>   	u64 max_mdp_clk_rate = kms->perf.max_core_clk_rate;
> @@ -822,10 +825,17 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
>   	pipe_hw_caps = pipe->sspp->cap;
>   	sblk = pipe->sspp->cap->sblk;
>   
> -	min_scale = FRAC_16_16(1, sblk->maxupscale);
> +	if (sblk->scaler_blk.len) {
> +		min_scale = FRAC_16_16(1, MAX_UPSCALE_RATIO);
> +		max_scale = MAX_DOWNSCALE_RATIO << 16;
> +	} else {
> +		min_scale = 1 << 16;
> +		max_scale = 1 << 16;

You can use DRM_PLANE_NO_SCALING instead.

> +	}
> +
>   	ret = drm_atomic_helper_check_plane_state(new_plane_state, crtc_state,
>   						  min_scale,
> -						  sblk->maxdwnscale << 16,
> +						  max_scale,
>   						  true, true);

I am missing something here.

As per the documentation of this API, min and max are the scaling limits 
of both directions and not max_upscale and max_downscale.

**
837  * drm_atomic_helper_check_plane_state() - Check plane state for 
validity
838  * @plane_state: plane state to check
839  * @crtc_state: CRTC state to check
840  * @min_scale: minimum @src:@dest scaling factor in 16.16 fixed point
841  * @max_scale: maximum @src:@dest scaling factor in 16.16 fixed point
842  * @can_position: is it legal to position the plane such that it


But this change is passing max_upscale and max_downscale as the min and 
max resp. Isnt that wrong?


>   	if (ret) {
>   		DPU_DEBUG_PLANE(pdpu, "Check plane state failed (%d)\n", ret);

