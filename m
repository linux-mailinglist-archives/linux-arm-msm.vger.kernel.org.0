Return-Path: <linux-arm-msm+bounces-35963-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BCB89B0DD2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Oct 2024 21:00:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9EDF21F24CEB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Oct 2024 19:00:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE1AF20D508;
	Fri, 25 Oct 2024 19:00:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="CAF5XElo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B5A21B07D4;
	Fri, 25 Oct 2024 19:00:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729882841; cv=none; b=imDLVHzApgGNyJXjT2HhJfxo/GByc5bMtus4JF+sIbAX0/YZiic1MAOLLVVdftwoEApFYt49ITdNgGP6Z5SHz03C++wvaJOwsB5xwG4rQSPUWdjBiqRD9iVjsVkt4Knd0HQOGiVQgP08lNIcpohmSGT3rI6C621vM+2yDtNuncA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729882841; c=relaxed/simple;
	bh=dOX6ODX9goy93nRBctzz/c0rm0U70NrmZOa8sHSdqek=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Nqliv/t9WCNu6KFGCXhQCzdJUaEk747KrwUXA4rBMlU8mYRIMP5JOH/0eGUV9m3bg0PaVA/D23kilN/NzzWCPLZnNtBA4CMNWNUYQIJuPH9b37wHP6PqRW7wVBSE+BWodxAt6ZnW0eLLcwlwordxa7QtcEuki4/MPBxt/GtTQ04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=CAF5XElo; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49PB1xkB000880;
	Fri, 25 Oct 2024 19:00:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4m4ynzInmCYuKFAigjMuDiiA5+f08cG6+h6uxFu2fDQ=; b=CAF5XEloBiGlCdWT
	43VVSPkg0AyqWJnQOh/vSJrU1RwrYawm339SwppcmAta4kUz0sdl7xwIuF+yjbyc
	ggqIqXstjim23jfOP/9qpuJ9sV0xQK4aPbRj/CVHjQwBInSrmz7SXhhkkFVz9q80
	DDavxgl4dE2+h6AE1Ku0smYiscSaO3VjZnEeieBvtVZjLLePGUDMFVGEw9w+fnrV
	NNeve5tK8J+PDuuUwR7MAgt23PFi0jm1I6CWKcCPJByFt8RJHLtT6T1ye4M753Wd
	czGNbPNAv9XbYodzF2PG20LSYGDORMMVm7HkhAGYzRtJfsfts2Kae5hrfdzqyAh7
	MSUJJw==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42ga3s1csn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 25 Oct 2024 19:00:23 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49PJ0MHu011047
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 25 Oct 2024 19:00:22 GMT
Received: from [10.110.83.151] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 25 Oct
 2024 12:00:21 -0700
Message-ID: <1dcf786e-463f-4e51-af71-66ee6077b5f1@quicinc.com>
Date: Fri, 25 Oct 2024 12:00:20 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/9] drm/msm/dpu: move pstate->pipe initialization to
 dpu_plane_atomic_check
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark
	<robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten
	<marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona
 Vetter <simona@ffwll.ch>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
References: <20241025-dpu-virtual-wide-v6-0-0310fd519765@linaro.org>
 <20241025-dpu-virtual-wide-v6-2-0310fd519765@linaro.org>
Content-Language: en-US
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20241025-dpu-virtual-wide-v6-2-0310fd519765@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: ZWHZaI5rykXHJ0Ju0Xn8bsZKdz1nYDdx
X-Proofpoint-GUID: ZWHZaI5rykXHJ0Ju0Xn8bsZKdz1nYDdx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 clxscore=1015
 impostorscore=0 bulkscore=0 mlxlogscore=999 malwarescore=0 suspectscore=0
 phishscore=0 lowpriorityscore=0 mlxscore=0 priorityscore=1501 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2409260000
 definitions=main-2410250145



On 10/24/2024 5:20 PM, Dmitry Baryshkov wrote:
> In preparation for virtualized planes support, move pstate->pipe
> initialization from dpu_plane_reset() to dpu_plane_atomic_check(). In
> case of virtual planes the plane's pipe will not be known up to the
> point of atomic_check() callback.
> 

I had R-bed this in v5. Did anything change in v6?

But one comment below.

> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 25 +++++++++++--------------
>   1 file changed, 11 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> index 37faf5b238b0..725c9a5826fd 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> @@ -797,13 +797,22 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
>   	uint32_t max_linewidth;
>   	unsigned int rotation;
>   	uint32_t supported_rotations;
> -	const struct dpu_sspp_cfg *pipe_hw_caps = pstate->pipe.sspp->cap;
> -	const struct dpu_sspp_sub_blks *sblk = pstate->pipe.sspp->cap->sblk;
> +	const struct dpu_sspp_cfg *pipe_hw_caps;
> +	const struct dpu_sspp_sub_blks *sblk;
>   
>   	if (new_plane_state->crtc)
>   		crtc_state = drm_atomic_get_new_crtc_state(state,
>   							   new_plane_state->crtc);
>   
> +	pipe->sspp = dpu_rm_get_sspp(&kms->rm, pdpu->pipe);
> +	r_pipe->sspp = NULL;
> +
> +	if (!pipe->sspp)
> +		return -EINVAL;
> +
> +	pipe_hw_caps = pipe->sspp->cap;
> +	sblk = pipe->sspp->cap->sblk;
> +
>   	min_scale = FRAC_16_16(1, sblk->maxupscale);
>   	ret = drm_atomic_helper_check_plane_state(new_plane_state, crtc_state,
>   						  min_scale,

Do you think it will be better to move the get_sspp() call after the 
drm_atomic_helper_check_plane_state()?

> @@ -820,7 +829,6 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
>   	pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
>   	r_pipe->multirect_index = DPU_SSPP_RECT_SOLO;
>   	r_pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
> -	r_pipe->sspp = NULL;
>   
>   	pstate->stage = DPU_STAGE_0 + pstate->base.normalized_zpos;
>   	if (pstate->stage >= pdpu->catalog->caps->max_mixer_blendstages) {
> @@ -1286,7 +1294,6 @@ static void dpu_plane_reset(struct drm_plane *plane)
>   {
>   	struct dpu_plane *pdpu;
>   	struct dpu_plane_state *pstate;
> -	struct dpu_kms *dpu_kms = _dpu_plane_get_kms(plane);
>   
>   	if (!plane) {
>   		DPU_ERROR("invalid plane\n");
> @@ -1308,16 +1315,6 @@ static void dpu_plane_reset(struct drm_plane *plane)
>   		return;
>   	}
>   
> -	/*
> -	 * Set the SSPP here until we have proper virtualized DPU planes.
> -	 * This is the place where the state is allocated, so fill it fully.
> -	 */
> -	pstate->pipe.sspp = dpu_rm_get_sspp(&dpu_kms->rm, pdpu->pipe);
> -	pstate->pipe.multirect_index = DPU_SSPP_RECT_SOLO;
> -	pstate->pipe.multirect_mode = DPU_SSPP_MULTIRECT_NONE;
> -
> -	pstate->r_pipe.sspp = NULL;
> -
>   	__drm_atomic_helper_plane_reset(plane, &pstate->base);
>   }
>   
> 

