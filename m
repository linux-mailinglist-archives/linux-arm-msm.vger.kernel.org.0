Return-Path: <linux-arm-msm+bounces-11078-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E98B8552E6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Feb 2024 20:07:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AD3521F2B1EE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Feb 2024 19:07:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2F63127B43;
	Wed, 14 Feb 2024 19:07:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="LwNrfRgR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20BFB60DE5
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Feb 2024 19:07:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707937656; cv=none; b=ZqdyfnfsBQwoPc26IR4+2UHdN2XPE2B+hODp9EljDfhrR8O51GOChQP8U5K6Rp50KqimN+tN1JcBDOiy8a7dB65Mup+BW0kulwXpREPBs7FNyGtvEcWHg0m02q4L5j4P8JyWQSQ4Hr7cV6LyJyZ7lj4cW9u8pu/cPtkm9cwRJC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707937656; c=relaxed/simple;
	bh=7OIouJn8QkgAQPgaeaRAnspe4+vBzJNz+JxhE++tnyI=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=RPi4tW5wVX84TU+Hv+a6HhZ57OBF4fapKL6fQC/7wQYSDFA8zdvkF93Q180gh0vbRyBYpNRSDOMU0bTTApTn9AfkggC57STK0APGZ9WrUlW6/4aHOx3JW3S55r1F3FmQd3QJYFTN/syNcFYm1TmMO1LDHbIQevcVlav5quy3zmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=LwNrfRgR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 41EDJWwq032121;
	Wed, 14 Feb 2024 19:07:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=S0GpnYRvSVVFrmzzJ26wRTcnSobcuw4iJFNC0OyDquM=; b=Lw
	NrfRgRHy2JUgcGVTbH7GkqIPS5x7/RxmA6FEe79tHEsHZXIPgvMoOz3m9WjSCAma
	VGxq4mqUf4fPWx7lS2sPhaz3+qfBrJZ/5lbQghp5xFx1wsbs6fBbRekrApwr14aR
	HJi+oYb47/hgRKHyTXbRzUBf+s4VEA4g/EjQ91FFj4PxM1nMenHVQik08LTvqVw0
	cOXu+DgJk0OU5ZKBMYRYuUD3/7vJ2y3QPg1nVu/rezSMolZY2G7HJx5ekCmCtTUt
	T6ifR5q6xN2Vkx6/ll62QV/tSHXMfZh8OcpllyEBPxs4+O1f0HB7aky77y04JVGi
	W41QYjfzuhQirrX58QDA==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3w8kkrj1sm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 14 Feb 2024 19:07:21 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 41EJ7KEq020472
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 14 Feb 2024 19:07:20 GMT
Received: from [10.71.109.81] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Wed, 14 Feb
 2024 11:07:19 -0800
Message-ID: <377d79d6-1cd8-95c8-7aea-4b715f96fa0a@quicinc.com>
Date: Wed, 14 Feb 2024 11:07:18 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v3 03/12] drm/msm/dpu: take plane rotation into account
 for wide planes
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
References: <20230914050706.1058620-1-dmitry.baryshkov@linaro.org>
 <20230914050706.1058620-4-dmitry.baryshkov@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20230914050706.1058620-4-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: JCjtkxxo8RDpuqBbpprYOx2-PPnLYL2l
X-Proofpoint-ORIG-GUID: JCjtkxxo8RDpuqBbpprYOx2-PPnLYL2l
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-14_11,2024-02-14_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 mlxlogscore=999
 clxscore=1015 priorityscore=1501 adultscore=0 bulkscore=0
 lowpriorityscore=0 mlxscore=0 malwarescore=0 suspectscore=0 phishscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401310000 definitions=main-2402140148



On 9/13/2023 10:06 PM, Dmitry Baryshkov wrote:
> Take into account the plane rotation and flipping when calculating src
> positions for the wide plane parts.
> 
> This is not an issue yet, because rotation is only supported for the
> UBWC planes and wide UBWC planes are rejected anyway because in parallel
> multirect case only the half of the usual width is supported for tiled
> formats. However it's better to fix this now rather than stumbling upon
> it later.
> 
> Fixes: 80e8ae3b38ab ("drm/msm/dpu: add support for wide planes")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 27 ++++++++++++++---------
>   1 file changed, 17 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> index c2aaaded07ed..67f9c2a62a17 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> @@ -827,16 +827,6 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
>   		return -EINVAL;
>   	}
>   
> -	pipe_cfg->src_rect = new_plane_state->src;
> -
> -	/* state->src is 16.16, src_rect is not */
> -	pipe_cfg->src_rect.x1 >>= 16;
> -	pipe_cfg->src_rect.x2 >>= 16;
> -	pipe_cfg->src_rect.y1 >>= 16;
> -	pipe_cfg->src_rect.y2 >>= 16;
> -
> -	pipe_cfg->dst_rect = new_plane_state->dst;
> -

Why were these lines moved down?

So this change is doing two things:

1) Using drm_rect_fp_to_int() instead of the hand-rolled right shifting
2) Considering rotation for wide plane cases

Do we need to break this up into 2?

>   	fb_rect.x2 = new_plane_state->fb->width;
>   	fb_rect.y2 = new_plane_state->fb->height;
>   
> @@ -852,6 +842,15 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
>   
>   	max_linewidth = pdpu->catalog->caps->max_linewidth;
>   
> +	/* state->src is 16.16, src_rect is not */
> +	drm_rect_fp_to_int(&pipe_cfg->src_rect, &new_plane_state->src);
> +
> +	pipe_cfg->dst_rect = new_plane_state->dst;
> +
> +	drm_rect_rotate(&pipe_cfg->src_rect,
> +			new_plane_state->fb->width, new_plane_state->fb->height,
> +			new_plane_state->rotation);
> +
>   	if (drm_rect_width(&pipe_cfg->src_rect) > max_linewidth) {
>   		/*
>   		 * In parallel multirect case only the half of the usual width
> @@ -899,6 +898,14 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
>   		r_pipe_cfg->dst_rect.x1 = pipe_cfg->dst_rect.x2;
>   	}
>   
> +	drm_rect_rotate_inv(&pipe_cfg->src_rect,
> +			    new_plane_state->fb->width, new_plane_state->fb->height,
> +			    new_plane_state->rotation);
> +	if (r_pipe->sspp)
> +		drm_rect_rotate_inv(&r_pipe_cfg->src_rect,
> +				    new_plane_state->fb->width, new_plane_state->fb->height,
> +				    new_plane_state->rotation);
> +

iiuc, so we do

1) rotate() on full plane
2) rotate_inv() on left half-plane
3) rotate_inv() on right half-plane

If so, looks right to me.


>   	ret = dpu_plane_atomic_check_pipe(pdpu, pipe, pipe_cfg, fmt);
>   	if (ret)
>   		return ret;

