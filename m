Return-Path: <linux-arm-msm+bounces-67411-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 51C80B18689
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Aug 2025 19:22:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B963D1C254E8
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Aug 2025 17:22:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C267C26C39B;
	Fri,  1 Aug 2025 17:22:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EH0WzgTq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 067D2239E88
	for <linux-arm-msm@vger.kernel.org>; Fri,  1 Aug 2025 17:22:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754068924; cv=none; b=FhLmDiUxh58HOLjHub+J7aclP5NCrwBPSK5W3KjhKilY+EVHg0TBvkL/nPe0qrNEgZnFTOqp7PDwEz54UgnpXyCVZx34eo5sBJ2Z6lQd48lpqBF7BFEK6QG6oQjFp7ERaYkuhSvlDKuaPTSW7lfdrHgOl3qhXLd86QkptOebP4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754068924; c=relaxed/simple;
	bh=1cLP4hWWkVfPpezBxRo0nehh8Zgm3W66/KMj3sUheuA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G4C29AJ5VlFRwaZDmbjRzQIKmB9eQuw5KvaD8+nYdUuCqI//WrAaYx/T8b929bokb15ZIQsPMbA0AcevuVksAdf4uplFHheouQ+n8I0KLGl8kLX2UTOUHbHa8AgRTFfu4HeRqDttknVtvZPerViCrbmjai5kH2sbBXFf+m/SXp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EH0WzgTq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 571HCeFY018851
	for <linux-arm-msm@vger.kernel.org>; Fri, 1 Aug 2025 17:22:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=gVujaY6/x/L4s5cDOOuzu7pk
	1QgefFC/FdQhq6ZCumE=; b=EH0WzgTqH8adQCpn8D9/pCivknuR9xUTGlveeQ+7
	CuAPGc1dH0C9TCe6DXcAdDMsDhWfGY9i2brehHzsOjZ/NTd8qOTvmvBghLS23+Wd
	Vtaayt4Lnt4HlxpMEVGk+PssYQ+MtH3hMDA9yamsc9RrcUyWe8ME0Jyxrhw3jrro
	wR9h0+ZfVvdDPrNPtInrnHgLBqkbB9SB0nK2kuUsm51frVg5EMdb9JAfNBvn952m
	LL42r5y50q0mhIB2/sqgWJSZWxcLB+lF7n0zHztuJePQ8qCqwF/r26mwsgzmxbJ4
	dTmDJW2/L2WsqE2jh4ZnMHfOW+aFLzP8r5Xgt6obEVaohw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 487jwgh98a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 01 Aug 2025 17:22:00 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4af0100c03fso22069241cf.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 01 Aug 2025 10:22:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754068919; x=1754673719;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gVujaY6/x/L4s5cDOOuzu7pk1QgefFC/FdQhq6ZCumE=;
        b=m0d+OXZ2dAoqW9rlWfFPIr3ak5anlkMDRLudSGGuFq8+keluVx5oaET9ZjlznBkeCr
         SKctPQqWul0xMQ+ANpZjTdmoptQfJndcJETW1T/dSJQjF5VvrUo5Cpbterwv9hPOo4Wo
         g6oyWJrFZdSUmn4dn/n4V8b7pJ7JR5IqF3oeAnAmNYz6O9dP0KEezdOuOhRVZPb2d6r7
         FXjQzbR+qo9F7JDcmQ9XQYYoNbmpCksdbe3CPjoQ1iWSfF0HESr4s/PQAxe/798ksaJw
         acx0wChv76BOEITzRwgtqB5dctM5i2Ju/w863RWOyeZViTLcQXbpjoWZvVdptBHHCiiB
         m97Q==
X-Forwarded-Encrypted: i=1; AJvYcCWvvI+q1mq6gkAS4oRdu/sspBCkh/g5ICpuCAa5PAadTsendeaOwV+1iR9Z+IGcXi0obaP60zpMx99LB3j2@vger.kernel.org
X-Gm-Message-State: AOJu0YyU17N0YZYDUhzrZme1l/OngxvabRPTQ9LKXwqkDYTaUwPSVwZV
	4PV9a9gWTRjtNOzF35DU8HEx81IyvRCP0kofKcGzU+pc59Z/kLM0YeP7WQ9civfw6MhNKhvVuyO
	1angwySf3vklcFBdGbi/z1w94Yy2X9swdoXqUymKA92CGNoaVtdQD+MdAm1mti6hYDduC
X-Gm-Gg: ASbGncssOD/cCz/AIQS+VkzoKu0FRPmlT7UeG63n2LPB4w287coFA2wzUsEd80m0+HT
	aB716W7qvzWYX3FQM9b6CiRyZEqt1+2APj5R8y449MHpiWl42P6kxBozxWo1qZUZ6gJHFcLIzUG
	Pq+us6K0TYAXzpJOHJ5kOG8roAqV1AqG9xXGJ8ptTNxbgbYNomTDOmpla+5bkrhoYoZLB93562y
	IStzzusksicY/h1zf82wdEICAmjIgI3kMHJmP9JTug8wm2BoIkFUf4R0Y6YWLUNzWhuRZTZws7D
	k9ypXZqlPLP06tWqwWwkCq7prcY/MGWSY5/ZWVGOpsyHyOoemcrLvyVJdcDbYw6OFrP5Ymmfd+0
	I+ngz9hvZC2UBWHei53GqG43yxRIsFvcwP7KEpDmDlHhQ+fQRkvw4
X-Received: by 2002:ac8:5dcc:0:b0:4ae:cc2c:f64c with SMTP id d75a77b69052e-4af10d0c1e9mr9604171cf.57.1754068918844;
        Fri, 01 Aug 2025 10:21:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGFJgTEd1XHMjlmQRgzIn1yhI24eARMfKyPdkQqxXBn3aWOqCn9wqpJQtQgjYFcYTx3vdkE8Q==
X-Received: by 2002:ac8:5dcc:0:b0:4ae:cc2c:f64c with SMTP id d75a77b69052e-4af10d0c1e9mr9603441cf.57.1754068918206;
        Fri, 01 Aug 2025 10:21:58 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55b88c990dbsm656324e87.104.2025.08.01.10.21.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Aug 2025 10:21:56 -0700 (PDT)
Date: Fri, 1 Aug 2025 20:21:54 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jun Nie <jun.nie@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jessica Zhang <quic_jesszhan@quicinc.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v14 11/13] drm/msm/dpu: support SSPP assignment for
 quad-pipe case
Message-ID: <xw5rc2psnjjrgtvfvb4tfxyw2wl2ja4w4kfrpkpxm4g4p65tn5@nviedtdnp64a>
References: <20250801-v6-16-rc2-quad-pipe-upstream-v14-0-b626236f4c31@linaro.org>
 <20250801-v6-16-rc2-quad-pipe-upstream-v14-11-b626236f4c31@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250801-v6-16-rc2-quad-pipe-upstream-v14-11-b626236f4c31@linaro.org>
X-Authority-Analysis: v=2.4 cv=WvgrMcfv c=1 sm=1 tr=0 ts=688cf7b8 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=sWKEhP36mHoA:10 a=KKAkSRfTAAAA:8 a=ihEB1K_o8bJSkcOQTnsA:9
 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: -8VfyJvdhuYfRF_G86HdINlFHXFdgsgm
X-Proofpoint-GUID: -8VfyJvdhuYfRF_G86HdINlFHXFdgsgm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODAxMDEzNSBTYWx0ZWRfX77kRko+QN6Cl
 9DfesV4CTrpkDDY+r6tbRBhL6cc2EzO2M7GzHPJ6B2TpLuSnwwpFDQabC7dOcWFQI8QINX6aPUl
 WG67v/9d101VSdHoOy55ufxSB7K08o18tf4GazM2NyBL5CKLk+NCcl1iK6LDCyh0PAEIwOcYiib
 aJeBakVmwCfu9XdfRrzBlNjyiYVYWgxh33JWC3cmWCnsAhsgfh0CEoXnoRWzY1q7pE8+pZj6zP9
 0e5dRUAHvROXWLhAgC9nhR4Mdq3saTlQaZ+mdxXBZF+XQv73tCdDjBhS87lk51q5qXafKKfbkaI
 ovjWpsDDf4Exx4GZen5zWKTTgjVu6gooS0UK4CWZQbM6M3XYJJ762pR3eXK24nzAWWkq+N7YibV
 wVXymRwHwaTdQ28XL/vNvYvcpnPmBlkIIjdvLMDKxP13jrNVUcA1+wqov7TyxIFymQMudnE3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-01_05,2025-08-01_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0
 spamscore=0 mlxscore=0 impostorscore=0 adultscore=0 malwarescore=0
 priorityscore=1501 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2508010135

On Fri, Aug 01, 2025 at 11:07:35PM +0800, Jun Nie wrote:
> Currently, SSPPs are assigned to a maximum of two pipes. However,
> quad-pipe usage scenarios require four pipes and involve configuring
> two stages. In quad-pipe case, the first two pipes share a set of
> mixer configurations and enable multi-rect mode when certain
> conditions are met. The same applies to the subsequent two pipes.
> 
> Assign SSPPs to the pipes in each stage using a unified method and
> to loop the stages accordingly.
> 
> Signed-off-by: Jun Nie <jun.nie@linaro.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 150 ++++++++++++++++++------------
>  1 file changed, 89 insertions(+), 61 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> index 55429f29a4b95594771d930efe42aaa4126f6f07..9671af9620037b5c341e404bb3b2fc21696ce79e 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> @@ -958,6 +958,23 @@ static int dpu_plane_is_multirect_parallel_capable(struct dpu_hw_sspp *sspp,
>  		dpu_plane_is_parallel_capable(pipe_cfg, fmt, max_linewidth);
>  }
>  
> +static bool dpu_plane_get_single_pipe_in_stage(struct dpu_plane_state *pstate,
> +					       struct dpu_sw_pipe **single_pipe,
> +					       struct dpu_sw_pipe_cfg **single_pipe_cfg,
> +					       int stage_index)
> +{
> +	int pipe_idx;
> +
> +	pipe_idx = stage_index * PIPES_PER_STAGE;
> +	if (drm_rect_width(&pstate->pipe_cfg[pipe_idx].src_rect) != 0 &&
> +	    drm_rect_width(&pstate->pipe_cfg[pipe_idx + 1].src_rect) == 0) {
> +		*single_pipe = &pstate->pipe[pipe_idx];
> +		*single_pipe_cfg = &pstate->pipe_cfg[pipe_idx];
> +		return true;
> +	}
> +
> +	return false;
> +}
>  
>  static int dpu_plane_atomic_check_sspp(struct drm_plane *plane,
>  				       struct drm_atomic_state *state,
> @@ -1023,17 +1040,20 @@ static bool dpu_plane_try_multirect_parallel(struct dpu_sw_pipe *pipe, struct dp
>  static int dpu_plane_try_multirect_shared(struct dpu_plane_state *pstate,
>  					  struct dpu_plane_state *prev_adjacent_pstate,
>  					  const struct msm_format *fmt,
> -					  uint32_t max_linewidth)
> +					  uint32_t max_linewidth, int stage_index)
>  {
> -	struct dpu_sw_pipe *pipe = &pstate->pipe[0];
> -	struct dpu_sw_pipe *r_pipe = &pstate->pipe[1];
> -	struct dpu_sw_pipe_cfg *pipe_cfg = &pstate->pipe_cfg[0];
> -	struct dpu_sw_pipe *prev_pipe = &prev_adjacent_pstate->pipe[0];
> -	struct dpu_sw_pipe_cfg *prev_pipe_cfg = &prev_adjacent_pstate->pipe_cfg[0];
> +	struct dpu_sw_pipe *pipe, *prev_pipe;
> +	struct dpu_sw_pipe_cfg *pipe_cfg, *prev_pipe_cfg;
>  	const struct msm_format *prev_fmt = msm_framebuffer_format(prev_adjacent_pstate->base.fb);
>  	u16 max_tile_height = 1;
>  
> -	if (prev_adjacent_pstate->pipe[1].sspp != NULL ||
> +	if (!dpu_plane_get_single_pipe_in_stage(pstate, &pipe,
> +						&pipe_cfg, stage_index))
> +		return false;
> +
> +	if (!dpu_plane_get_single_pipe_in_stage(prev_adjacent_pstate,
> +						&prev_pipe, &prev_pipe_cfg,
> +						stage_index) ||
>  	    prev_pipe->multirect_mode != DPU_SSPP_MULTIRECT_NONE)
>  		return false;
>  
> @@ -1048,11 +1068,6 @@ static int dpu_plane_try_multirect_shared(struct dpu_plane_state *pstate,
>  	if (MSM_FORMAT_IS_UBWC(prev_fmt))
>  		max_tile_height = max(max_tile_height, prev_fmt->tile_height);
>  
> -	r_pipe->multirect_index = DPU_SSPP_RECT_SOLO;
> -	r_pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
> -
> -	r_pipe->sspp = NULL;
> -
>  	if (dpu_plane_is_parallel_capable(pipe_cfg, fmt, max_linewidth) &&
>  	    dpu_plane_is_parallel_capable(prev_pipe_cfg, prev_fmt, max_linewidth) &&
>  	    (pipe_cfg->dst_rect.x1 >= prev_pipe_cfg->dst_rect.x2 ||
> @@ -1181,36 +1196,69 @@ static int dpu_plane_virtual_atomic_check(struct drm_plane *plane,
>  	return 0;
>  }
>  
> +static int dpu_plane_assign_resource_in_stage(struct dpu_sw_pipe *pipe,
> +					      struct dpu_sw_pipe_cfg *pipe_cfg,
> +					      struct drm_plane_state *plane_state,
> +					      struct dpu_global_state *global_state,
> +					      struct drm_crtc *crtc,
> +					      struct dpu_rm_sspp_requirements *reqs)
> +{
> +	struct drm_plane *plane = plane_state->plane;
> +	struct dpu_kms *dpu_kms = _dpu_plane_get_kms(plane);
> +	struct dpu_sw_pipe *r_pipe = pipe + 1;
> +	struct dpu_sw_pipe_cfg *r_pipe_cfg = pipe_cfg + 1;
> +
> +	if (drm_rect_width(&pipe_cfg->src_rect) != 0) {

If it's 0, you can return immediately, there is nothing to assign.

> +		pipe->sspp = dpu_rm_reserve_sspp(&dpu_kms->rm, global_state, crtc, reqs);
> +		if (!pipe->sspp)
> +			return -ENODEV;
> +		pipe->multirect_index = DPU_SSPP_RECT_SOLO;
> +		pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
> +	}
> +
> +	if (drm_rect_width(&r_pipe_cfg->src_rect) != 0 &&
> +	    dpu_plane_try_multirect_parallel(pipe, pipe_cfg, r_pipe, r_pipe_cfg,
> +					      pipe->sspp,
> +					      msm_framebuffer_format(plane_state->fb),
> +					      dpu_kms->catalog->caps->max_linewidth))
> +		goto stage_assinged;
> +
> +	if (drm_rect_width(&r_pipe_cfg->src_rect) != 0) {
> +		r_pipe->sspp = dpu_rm_reserve_sspp(&dpu_kms->rm, global_state, crtc, reqs);
> +		if (!r_pipe->sspp)
> +			return -ENODEV;
> +		r_pipe->multirect_index = DPU_SSPP_RECT_SOLO;
> +		r_pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
> +	}


if (drm_rect_width(&r_pipe_cfg->src_rect) == 0)
	return 0;


if (dpu_plane_try_multirect_parallel(pipe, pipe_cfg, r_pipe, r_pipe_cfg,
				     pipe->sspp,
				     msm_framebuffer_format(plane_state->fb),
				     dpu_kms->catalog->caps->max_linewidth));
	return 0;

r_pipe->sspp = dpu_rm_reserve_sspp(&dpu_kms->rm, global_state, crtc, reqs);

etc.

> +
> +stage_assinged:
> +	return 0;
> +}
> +
>  static int dpu_plane_virtual_assign_resources(struct drm_crtc *crtc,
>  					      struct dpu_global_state *global_state,
>  					      struct drm_atomic_state *state,
>  					      struct drm_plane_state *plane_state,
> -					      struct drm_plane_state *prev_adjacent_plane_state)
> +					      struct drm_plane_state **prev_adjacent_plane_state)
>  {
>  	const struct drm_crtc_state *crtc_state = NULL;
>  	struct drm_plane *plane = plane_state->plane;
>  	struct dpu_kms *dpu_kms = _dpu_plane_get_kms(plane);
>  	struct dpu_rm_sspp_requirements reqs;
> -	struct dpu_plane_state *pstate, *prev_adjacent_pstate;
> +	struct dpu_plane_state *pstate, *prev_adjacent_pstate[STAGES_PER_PLANE];
>  	struct dpu_sw_pipe *pipe;
> -	struct dpu_sw_pipe *r_pipe;
>  	struct dpu_sw_pipe_cfg *pipe_cfg;
> -	struct dpu_sw_pipe_cfg *r_pipe_cfg;
>  	const struct msm_format *fmt;
> -	int i;
> +	int i, ret;
>  
>  	if (plane_state->crtc)
>  		crtc_state = drm_atomic_get_new_crtc_state(state,
>  							   plane_state->crtc);
>  
>  	pstate = to_dpu_plane_state(plane_state);
> -	prev_adjacent_pstate = prev_adjacent_plane_state ?
> -		to_dpu_plane_state(prev_adjacent_plane_state) : NULL;
> -
> -	pipe = &pstate->pipe[0];
> -	r_pipe = &pstate->pipe[1];
> -	pipe_cfg = &pstate->pipe_cfg[0];
> -	r_pipe_cfg = &pstate->pipe_cfg[1];
> +	for (i = 0; i < STAGES_PER_PLANE; i++)
> +		prev_adjacent_pstate[i] = prev_adjacent_plane_state[i] ?
> +			to_dpu_plane_state(prev_adjacent_plane_state[i]) : NULL;
>  
>  	for (i = 0; i < PIPES_PER_PLANE; i++)
>  		pstate->pipe[i].sspp = NULL;
> @@ -1225,42 +1273,24 @@ static int dpu_plane_virtual_assign_resources(struct drm_crtc *crtc,
>  
>  	reqs.rot90 = drm_rotation_90_or_270(plane_state->rotation);
>  
> -	if (drm_rect_width(&r_pipe_cfg->src_rect) == 0) {
> -		if (!prev_adjacent_pstate ||
> -		    !dpu_plane_try_multirect_shared(pstate, prev_adjacent_pstate, fmt,
> -						    dpu_kms->catalog->caps->max_linewidth)) {
> -			pipe->sspp = dpu_rm_reserve_sspp(&dpu_kms->rm, global_state, crtc, &reqs);
> -			if (!pipe->sspp)
> -				return -ENODEV;
> -
> -			r_pipe->sspp = NULL;
> -
> -			pipe->multirect_index = DPU_SSPP_RECT_SOLO;
> -			pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
> -
> -			r_pipe->multirect_index = DPU_SSPP_RECT_SOLO;
> -			r_pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
> -		}
> -	} else {
> -		pipe->sspp = dpu_rm_reserve_sspp(&dpu_kms->rm, global_state, crtc, &reqs);
> -		if (!pipe->sspp)
> -			return -ENODEV;
> -
> -		if (!dpu_plane_try_multirect_parallel(pipe, pipe_cfg, r_pipe, r_pipe_cfg,
> -						      pipe->sspp,
> -						      msm_framebuffer_format(plane_state->fb),
> -						      dpu_kms->catalog->caps->max_linewidth)) {
> -			/* multirect is not possible, use two SSPP blocks */
> -			r_pipe->sspp = dpu_rm_reserve_sspp(&dpu_kms->rm, global_state, crtc, &reqs);
> -			if (!r_pipe->sspp)
> -				return -ENODEV;
> +	for (i = 0; i < STAGES_PER_PLANE; i++) {
> +		if (prev_adjacent_pstate[i] &&
> +		    dpu_plane_try_multirect_shared(pstate, prev_adjacent_pstate[i], fmt,
> +						   dpu_kms->catalog->caps->max_linewidth,
> +						   i))
> +			continue;
>  
> -			pipe->multirect_index = DPU_SSPP_RECT_SOLO;
> -			pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
> +		if (dpu_plane_get_single_pipe_in_stage(pstate, &pipe, &pipe_cfg, i))
> +			prev_adjacent_plane_state[i] = plane_state;
>  
> -			r_pipe->multirect_index = DPU_SSPP_RECT_SOLO;
> -			r_pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
> -		}
> +		pipe = &pstate->pipe[i * PIPES_PER_STAGE];
> +		pipe_cfg = &pstate->pipe_cfg[i * PIPES_PER_STAGE];
> +		ret = dpu_plane_assign_resource_in_stage(pipe, pipe_cfg,
> +							 plane_state,
> +							 global_state,
> +							 crtc, &reqs);
> +		if (ret)
> +			return ret;
>  	}
>  
>  	return dpu_plane_atomic_check_sspp(plane, state, crtc_state);
> @@ -1273,7 +1303,7 @@ int dpu_assign_plane_resources(struct dpu_global_state *global_state,
>  			       unsigned int num_planes)
>  {
>  	unsigned int i;
> -	struct drm_plane_state *prev_adjacent_plane_state = NULL;
> +	struct drm_plane_state *prev_adjacent_plane_state[STAGES_PER_PLANE] = { NULL };
>  
>  	for (i = 0; i < num_planes; i++) {
>  		struct drm_plane_state *plane_state = states[i];
> @@ -1287,8 +1317,6 @@ int dpu_assign_plane_resources(struct dpu_global_state *global_state,
>  							     prev_adjacent_plane_state);
>  		if (ret)
>  			break;
> -
> -		prev_adjacent_plane_state = plane_state;
>  	}
>  
>  	return 0;
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

