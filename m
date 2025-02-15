Return-Path: <linux-arm-msm+bounces-48102-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id AB9AFA36A02
	for <lists+linux-arm-msm@lfdr.de>; Sat, 15 Feb 2025 01:33:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 38A317A4EE0
	for <lists+linux-arm-msm@lfdr.de>; Sat, 15 Feb 2025 00:32:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86A00F4ED;
	Sat, 15 Feb 2025 00:33:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="XGWf1gWj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED91FF4E2;
	Sat, 15 Feb 2025 00:33:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739579613; cv=none; b=UnHZVJMIDdEuJ/XcySfOS6ACVZRHqlcPpunHKrysBGxppv+yGcwOMIwftpeE92jhfltZY2w4jlMNajQStPDHeDFF/hdKKuIC6rIS9iY4nryPJAuP6a2ghxzXzirCKNLx+rNuegmdR00/WeWCNwy9KM6j4YFkYKl3YShEcCivhSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739579613; c=relaxed/simple;
	bh=kzgbVKWmmXhxroonqRLspYfZm4zpFoMPe3N7qJsgcHU=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=nMLFH+yzDwDfB6UqbsaGacVgHOonD7Tz/2Tpv+ZSZ6vZJv/1g9luVR15pgMYDjVZBAFqhXI8EaoSxrQF6oRSd1lokl4LqQg6xskSJkjnXHhU3u2G+/Bm/pTdMr49qKEYNzR+H191PFgxJrNv45cu/aDwX79dHkz2rgsJDUUU7kA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=XGWf1gWj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51EHJN5l007881;
	Sat, 15 Feb 2025 00:33:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kSId/V6V5kfZU795pOa2AZFqaFfa5x6lyzTZnZ1fs4g=; b=XGWf1gWjxtThkiPE
	01hX6Ifw52nE2QfFI8bGpB/iCGfPXNAMF2at2cBR2PnzP8pnr7Xo0Czw9ySzB5Yj
	qPbS3Htp8cDrcvzPrT8rdZ/ikT0Xsafhzo3wlfdAOibaMp2m0ussqc1FIXynDXpW
	ZnaHp3hEs67GwsVXkiToHvWcM+vbY2XDSKtjnxW8bftIz9vnC+Pg/3yxOgmTZnZG
	tWv3JQIybfuR11lQzu1OE4I6aXqToZcu05aNHtjgfz5KY4eQkmsMl4nwJfw9tXod
	N+aUmA7meerC94AHqciZMdK2tprYIqrDspWCRIMLQ2Do8zM92SEvw48niyN5CxTm
	OfkFeQ==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44rr1r0qtm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 15 Feb 2025 00:33:24 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51F0XNWO018836
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 15 Feb 2025 00:33:23 GMT
Received: from [10.134.70.212] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 14 Feb
 2025 16:33:22 -0800
Message-ID: <54ee5e52-f2b1-4a50-8d7e-962bc0a9a17a@quicinc.com>
Date: Fri, 14 Feb 2025 16:33:22 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 09/15] drm/msm/dpu: Add pipe as trace argument
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
 <20250118-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-33-v5-9-9701a16340da@linaro.org>
From: Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <20250118-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-33-v5-9-9701a16340da@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: cWKAaH6uG-IXq9-Db90aWjUsvv8meXJf
X-Proofpoint-ORIG-GUID: cWKAaH6uG-IXq9-Db90aWjUsvv8meXJf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-14_10,2025-02-13_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 adultscore=0
 mlxscore=0 impostorscore=0 spamscore=0 bulkscore=0 malwarescore=0
 lowpriorityscore=0 mlxlogscore=999 priorityscore=1501 suspectscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502150003



On 1/17/2025 8:00 AM, Jun Nie wrote:
> Add pipe as trace argument in trace_dpu_crtc_setup_mixer() to ease
> converting pipe into pipe array later.
> 
> Signed-off-by: Jun Nie <jun.nie@linaro.org>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>

> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c  |  2 +-
>   drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h | 10 +++++-----
>   2 files changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> index 41c9d3e3e3c7c..05abe2d05d8d8 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> @@ -411,7 +411,7 @@ static void _dpu_crtc_blend_setup_pipe(struct drm_crtc *crtc,
>   
>   	trace_dpu_crtc_setup_mixer(DRMID(crtc), DRMID(plane),
>   				   state, to_dpu_plane_state(state), stage_idx,
> -				   format->pixel_format,
> +				   format->pixel_format, pipe,
>   				   modifier);
>   
>   	DRM_DEBUG_ATOMIC("crtc %d stage:%d - plane %d sspp %d fb %d multirect_idx %d\n",
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h
> index 5307cbc2007c5..cb24ad2a6d8d3 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h
> @@ -651,9 +651,9 @@ TRACE_EVENT(dpu_crtc_setup_mixer,
>   	TP_PROTO(uint32_t crtc_id, uint32_t plane_id,
>   		 struct drm_plane_state *state, struct dpu_plane_state *pstate,
>   		 uint32_t stage_idx, uint32_t pixel_format,
> -		 uint64_t modifier),
> +		 struct dpu_sw_pipe *pipe, uint64_t modifier),
>   	TP_ARGS(crtc_id, plane_id, state, pstate, stage_idx,
> -		pixel_format, modifier),
> +		pixel_format, pipe, modifier),
>   	TP_STRUCT__entry(
>   		__field(	uint32_t,		crtc_id		)
>   		__field(	uint32_t,		plane_id	)
> @@ -676,9 +676,9 @@ TRACE_EVENT(dpu_crtc_setup_mixer,
>   		__entry->dst_rect = drm_plane_state_dest(state);
>   		__entry->stage_idx = stage_idx;
>   		__entry->stage = pstate->stage;
> -		__entry->sspp = pstate->pipe.sspp->idx;
> -		__entry->multirect_idx = pstate->pipe.multirect_index;
> -		__entry->multirect_mode = pstate->pipe.multirect_mode;
> +		__entry->sspp = pipe->sspp->idx;
> +		__entry->multirect_idx = pipe->multirect_index;
> +		__entry->multirect_mode = pipe->multirect_mode;
>   		__entry->pixel_format = pixel_format;
>   		__entry->modifier = modifier;
>   	),
> 
> -- 
> 2.34.1
> 


