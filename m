Return-Path: <linux-arm-msm+bounces-65732-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C8F45B0AF40
	for <lists+linux-arm-msm@lfdr.de>; Sat, 19 Jul 2025 12:10:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B34E5582D88
	for <lists+linux-arm-msm@lfdr.de>; Sat, 19 Jul 2025 10:10:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04081225415;
	Sat, 19 Jul 2025 10:10:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="l+cVNGda"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3BF1219E93
	for <linux-arm-msm@vger.kernel.org>; Sat, 19 Jul 2025 10:09:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752919799; cv=none; b=d8jJ6N0GztdNIEJL6tOW34KpyP9Hb7kwVQWVsu5p2xZMSM2TYAG1oHO0jqw3/yjeFopFSeEr1pVI7Zfg2MwBYu4q96wJeUl2tsvbzoO0cUtUKgTxImRCccQEXFHituT4eR/bsz6riAM1pTpqDlvBJ4q7FBfW+BBaPRi03XI9dyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752919799; c=relaxed/simple;
	bh=r4cfund08Mr8MVXm7i/QnMA6hO7ortU4fQImLDT1znI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RvWSrwipX7Nd3ia3RsaW7r+VZTc9HT+rOm2QThAJCUhFk03YTiQbuD/PQfIySWkEF07irTon89zXUSPnzn9hOVVpF6aFgXHiVR9Ygs3gb8hS4bxnubImr6R/RtgqIGaUJHfRn8MTcFzCc51TrulS3oYwuXi7gKu0du/c0dlj8rA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=l+cVNGda; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56J4M2Wi028069
	for <linux-arm-msm@vger.kernel.org>; Sat, 19 Jul 2025 10:09:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=RE1pFV3S18CkB3zRzoB2uTfO
	/SX7VdjQHJe24Ou3Foc=; b=l+cVNGdakJcecBefkvUSegIxlcXElvvMqp/MsTT8
	4H3ve5RHgdJt6/VIbmHWVa8AxxidKvl0neLm4AAyxvJOctdZMRSFuBkQleplbg7u
	K8BY7aeqXLM7hHQHvbhLdNVOMDJBgSS1IOovw2lQVgfQg64+LxwuVuo5+beWLuaT
	47gzC1zkbxt01mdWRchWKUYkfMZQg4BA0xv3OAdXwhWwItn91ea93QGx25zZiUSf
	bRMnTyR5k6REkPLAePBGyvfensF5RXNhRJQF0f91RyKLWjtHONIbjAU1VU0EUhmx
	uyb7GXTLiQ8YfE28SVuEso1Se4ntnlCRirHG8dtkHxXkDQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48048rrfg8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 19 Jul 2025 10:09:56 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6fb1f84a448so27949416d6.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 19 Jul 2025 03:09:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752919796; x=1753524596;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RE1pFV3S18CkB3zRzoB2uTfO/SX7VdjQHJe24Ou3Foc=;
        b=PLCGZs4viFcPjKBCWle/byX79hG+ZXlTpV8dOycHcbv/ZuZTG2DW4IklRheFTXpxfb
         mu+/rp1zUxBq9nMAT6K78Na77ZQSeAA3STkWgnt5FU17hrbwyXc1DiSAa6gHVGwNt5om
         6Bm+BT1KiDrBisZRobSYkefp1aqz5/u3DWQhjO2qK7QANPowhELuD1A+lvoMjOBdUrhw
         2/NErYkwGtL5TwutcTHoRRUPfk2ilZ4rfCuxfXK8gH3ot+/yDn4TodvbZPPetqR+s87q
         RLi27fnh956hWuNNIxOupqxBxIk25iEY9gE7s37p+VO1hUo7MJ+/g98jdziwkN1hREAV
         Sf/A==
X-Forwarded-Encrypted: i=1; AJvYcCWFu99sMZETVDyVlnRSjhrnvwrxIr0qzN1wDDvICa6J+TR5UWEjXCbSSdZV+tvSMHZ8JzAK7IgQoFQM31Mg@vger.kernel.org
X-Gm-Message-State: AOJu0YwjVzt7pa1BSNzUqqysmNtxcXXKhQB8PW9dqHGUHZ4vkfUykovs
	oCKo9WoEI79LTRMZ+b1viyNL2o4oeGabivupEPcsdjxpfSRa1Gh2mhYH5uTP2LgLV5tOQUrOQMT
	ppEHr3rTwaPGOvQ936ocl4et81yqg2wOHuf0HTV50zxLgQOeuSYEhAH5ALwDCagU7SGOp
X-Gm-Gg: ASbGncvgN565EGZFSpX3cYFIy4Zx6Nwmz+YWZGIHFDEyNBS6Q548t3LeC2AeDN26Fg8
	apLRTJZJAu1MeXxcUPlF2biLv5DPQ7ZepNlc8CW9A0Vy8XosU+Hag250XACS2lw2/r/e/VVjm5a
	8M8dNfclt7U0ZqW1eGG+8jdDQMbMLtNf0RzQxrQz+26GPBtt5rVeRXsbJW58EEAYNeWoBQ5v2G2
	Dy4JS+Ok+HFssCQNg6jxi61MJuNNeTHb1wyS39Ep+++Y8dQyYZIunREow+tvsnmprdCUbQGY704
	jmxwL5vEEflgSYBLRdWQS+APXSsrVjJUiRnP4GKMpPeam+wMFmN+fKXmIEpYcksMYprdvL9Qr6n
	CGJaaEZqmTUcp+fBjG4JdU0DO8hPSQ50zOGWTL2XSxliF80IWzIFC
X-Received: by 2002:a05:6214:2588:b0:702:bd47:c83b with SMTP id 6a1803df08f44-704f6b14502mr218121796d6.45.1752919795438;
        Sat, 19 Jul 2025 03:09:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFehkDz+6k3vy4Why9MJSZaqqZjYifa1Z30P0ziJ8/YT+jYi7ZIiAlsF/cxcytNaLGGtDLW/g==
X-Received: by 2002:a05:6214:2588:b0:702:bd47:c83b with SMTP id 6a1803df08f44-704f6b14502mr218121076d6.45.1752919794955;
        Sat, 19 Jul 2025 03:09:54 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55a31da2274sm655766e87.172.2025.07.19.03.09.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Jul 2025 03:09:53 -0700 (PDT)
Date: Sat, 19 Jul 2025 13:09:52 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jun Nie <jun.nie@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jessica Zhang <quic_jesszhan@quicinc.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v12 10/12] drm/msm/dpu: support SSPP assignment for
 quad-pipe case
Message-ID: <khu6gwzn7gulubwoshdutl4d2nu3c6exnkv4cimjljc5wbxf7l@ho4gxsolq3hn>
References: <20250707-v6-16-rc2-quad-pipe-upstream-v12-0-67e3721e7d83@linaro.org>
 <20250707-v6-16-rc2-quad-pipe-upstream-v12-10-67e3721e7d83@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250707-v6-16-rc2-quad-pipe-upstream-v12-10-67e3721e7d83@linaro.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE5MDEwMCBTYWx0ZWRfX3dPf7wcu9ofL
 ggI8cM2m/j0ynP6aCa24QhNPWr5IClMZog2lxrfo/xHIp42dbuj4gbQB42LS791wgj9M2sP3U6R
 RrfRZQ6j+XsALCcNQVJ7v1A0Wi2Hru8EnsS1fLXqmCMB/h0fhzDu1aZcHmsW1E0d6xdA0E9+JCJ
 Gt5OmnWKLD6srMmzbVOOrxg3aq+1uvin99CwlZUoRse0KS5ciJ9yp1NMXC/TjYcjP8ingNYdhXY
 XmHPUuTrp9g4fqlwv76bol7jpgThU5Qfs/EOT9eUzBVY0ZPAz2clKdQiydm1nkSlsRRk4RK1qlv
 WfCIGYI1aLRp+EtNI0i3AimPcMZBToH75Z+iLdWqvtdDT9Cx5c+BOLcRKq8tl34XpxZvaJq/Y6H
 1Y2MTFgK3uCAKbJmG1Re8A/4eeVGvl8nn7an36lQ9Tiq4Pr12na3q+NGFetKCm1MgfaZRhRi
X-Proofpoint-ORIG-GUID: cqFtffhFOpYVbQSXjjyZ0tjNaUD5nVm5
X-Proofpoint-GUID: cqFtffhFOpYVbQSXjjyZ0tjNaUD5nVm5
X-Authority-Analysis: v=2.4 cv=OPUn3TaB c=1 sm=1 tr=0 ts=687b6ef4 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=sWKEhP36mHoA:10 a=KKAkSRfTAAAA:8 a=X62n9y2ZVatY7HXpRCIA:9
 a=CjuIK1q_8ugA:10 a=pJ04lnu7RYOZP9TFuWaZ:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-19_01,2025-07-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 mlxlogscore=999 lowpriorityscore=0 suspectscore=0
 spamscore=0 mlxscore=0 bulkscore=0 priorityscore=1501 phishscore=0
 malwarescore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507190100

On Mon, Jul 07, 2025 at 02:18:05PM +0800, Jun Nie wrote:
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
>  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 143 +++++++++++++++++++-----------
>  1 file changed, 89 insertions(+), 54 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> index 149e7066480b07f9f6d422748d89ffd6f9416f33..ecfebf7a2406d65930075cc2a4b8a8a7d40b3d3c 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> @@ -954,6 +954,30 @@ static int dpu_plane_is_multirect_parallel_capable(struct dpu_hw_sspp *sspp,
>  		dpu_plane_is_parallel_capable(pipe_cfg, fmt, max_linewidth);
>  }
>  
> +static bool dpu_plane_get_single_pipe(struct dpu_plane_state *pstate,
> +				      struct dpu_sw_pipe **single_pipe,
> +				      struct dpu_sw_pipe_cfg **single_pipe_cfg,
> +				      int *stage_index)
> +{
> +	int stage_idx, pipe_idx, i, valid_pipe = 0;
> +
> +	for (stage_idx = 0; stage_idx < STAGES_PER_PLANE; stage_idx++) {
> +		for (i = 0; i < PIPES_PER_STAGE; i++) {
> +			pipe_idx = stage_idx * PIPES_PER_STAGE + i;
> +			if (drm_rect_width(&pstate->pipe_cfg[pipe_idx].src_rect) != 0) {
> +				valid_pipe++;
> +				if (valid_pipe > 1)
> +					return false;
> +
> +				*single_pipe = &pstate->pipe[pipe_idx];
> +				*single_pipe_cfg = &pstate->pipe_cfg[pipe_idx];
> +				*stage_index = stage_idx;
> +			}
> +		}
> +	}
> +
> +	return valid_pipe == 1;
> +}
>  
>  static int dpu_plane_atomic_check_sspp(struct drm_plane *plane,
>  				       struct drm_atomic_state *state,
> @@ -1021,18 +1045,23 @@ static int dpu_plane_try_multirect_shared(struct dpu_plane_state *pstate,
>  					  const struct msm_format *fmt,
>  					  uint32_t max_linewidth)
>  {
> -	struct dpu_sw_pipe *pipe = &pstate->pipe[0];
> -	struct dpu_sw_pipe *r_pipe = &pstate->pipe[1];
> -	struct dpu_sw_pipe_cfg *pipe_cfg = &pstate->pipe_cfg[0];
> -	struct dpu_sw_pipe *prev_pipe = &prev_adjacent_pstate->pipe[0];
> -	struct dpu_sw_pipe_cfg *prev_pipe_cfg = &prev_adjacent_pstate->pipe_cfg[0];
> +	struct dpu_sw_pipe *pipe, *prev_pipe;
> +	struct dpu_sw_pipe_cfg *pipe_cfg, *prev_pipe_cfg;
>  	const struct msm_format *prev_fmt = msm_framebuffer_format(prev_adjacent_pstate->base.fb);
> +	int stage_index, prev_stage_index;
>  	u16 max_tile_height = 1;
>  
> -	if (prev_adjacent_pstate->pipe[1].sspp != NULL ||
> +	if (!dpu_plane_get_single_pipe(pstate, &pipe, &pipe_cfg, &stage_index))
> +		return false;
> +
> +	if (!dpu_plane_get_single_pipe(prev_adjacent_pstate, &prev_pipe,
> +				       &prev_pipe_cfg, &prev_stage_index) ||
>  	    prev_pipe->multirect_mode != DPU_SSPP_MULTIRECT_NONE)
>  		return false;
>  
> +	if (stage_index != prev_stage_index)
> +		return false;

This should be handled other way around: save N pstates and then loop
over stage indices. If there is no rect at the corresponding stage for a
plane, skip assignment (and use prev_adjacent_pstate for the next plane).

> +
>  	if (!dpu_plane_is_multirect_capable(pipe->sspp, pipe_cfg, fmt) ||
>  	    !dpu_plane_is_multirect_capable(prev_pipe->sspp, prev_pipe_cfg, prev_fmt))
>  		return false;
> @@ -1043,11 +1072,6 @@ static int dpu_plane_try_multirect_shared(struct dpu_plane_state *pstate,
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
> @@ -1176,6 +1200,44 @@ static int dpu_plane_virtual_atomic_check(struct drm_plane *plane,
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
> +		pipe->sspp = dpu_rm_reserve_sspp(&dpu_kms->rm, global_state, crtc, reqs);
> +		if (!pipe->sspp)
> +			return -ENODEV;
> +	}
> +
> +	if (drm_rect_width(&r_pipe_cfg->src_rect) != 0 &&
> +	    dpu_plane_try_multirect_parallel(pipe, pipe_cfg, r_pipe, r_pipe_cfg,
> +					      pipe->sspp,
> +					      msm_framebuffer_format(plane_state->fb),
> +					      dpu_kms->catalog->caps->max_linewidth)) {
> +		goto stage_assinged;
> +	}
> +
> +	if (drm_rect_width(&r_pipe_cfg->src_rect) != 0) {
> +		r_pipe->sspp = dpu_rm_reserve_sspp(&dpu_kms->rm, global_state, crtc, reqs);
> +		if (!r_pipe->sspp)
> +			return -ENODEV;
> +		r_pipe->multirect_index = DPU_SSPP_RECT_SOLO;
> +		r_pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
> +	}
> +
> +stage_assinged:
> +	return 0;
> +}
> +
>  static int dpu_plane_virtual_assign_resources(struct drm_crtc *crtc,
>  					      struct dpu_global_state *global_state,
>  					      struct drm_atomic_state *state,
> @@ -1188,11 +1250,9 @@ static int dpu_plane_virtual_assign_resources(struct drm_crtc *crtc,
>  	struct dpu_rm_sspp_requirements reqs;
>  	struct dpu_plane_state *pstate, *prev_adjacent_pstate;
>  	struct dpu_sw_pipe *pipe;
> -	struct dpu_sw_pipe *r_pipe;
>  	struct dpu_sw_pipe_cfg *pipe_cfg;
> -	struct dpu_sw_pipe_cfg *r_pipe_cfg;
>  	const struct msm_format *fmt;
> -	int i;
> +	int i, stage_id, ret;
>  
>  	if (plane_state->crtc)
>  		crtc_state = drm_atomic_get_new_crtc_state(state,
> @@ -1202,11 +1262,6 @@ static int dpu_plane_virtual_assign_resources(struct drm_crtc *crtc,
>  	prev_adjacent_pstate = prev_adjacent_plane_state ?
>  		to_dpu_plane_state(prev_adjacent_plane_state) : NULL;
>  
> -	pipe = &pstate->pipe[0];
> -	r_pipe = &pstate->pipe[1];
> -	pipe_cfg = &pstate->pipe_cfg[0];
> -	r_pipe_cfg = &pstate->pipe_cfg[1];
> -
>  	for (i = 0; i < PIPES_PER_PLANE; i++)
>  		pstate->pipe[i].sspp = NULL;
>  
> @@ -1220,44 +1275,24 @@ static int dpu_plane_virtual_assign_resources(struct drm_crtc *crtc,
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
> -
> -			pipe->multirect_index = DPU_SSPP_RECT_SOLO;
> -			pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
> +	if (prev_adjacent_pstate &&
> +	    dpu_plane_try_multirect_shared(pstate, prev_adjacent_pstate, fmt,
> +					    dpu_kms->catalog->caps->max_linewidth)) {
> +		goto assigned;
> +	}
>  
> -			r_pipe->multirect_index = DPU_SSPP_RECT_SOLO;
> -			r_pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
> -		}
> +	for (stage_id = 0; stage_id < STAGES_PER_PLANE; stage_id++) {
> +		pipe = &pstate->pipe[stage_id * PIPES_PER_STAGE];
> +		pipe_cfg = &pstate->pipe_cfg[stage_id * PIPES_PER_STAGE];
> +		ret = dpu_plane_assign_resource_in_stage(pipe, pipe_cfg,
> +							 plane_state,
> +							 global_state,
> +							 crtc, &reqs);
> +		if (ret)
> +			return ret;
>  	}
>  
> +assigned:
>  	return dpu_plane_atomic_check_sspp(plane, state, crtc_state);
>  }
>  
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

