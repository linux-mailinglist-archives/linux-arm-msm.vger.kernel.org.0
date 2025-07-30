Return-Path: <linux-arm-msm+bounces-67194-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 366FCB16691
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Jul 2025 20:52:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6E4A718C5CFA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Jul 2025 18:52:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 885C62E0B60;
	Wed, 30 Jul 2025 18:52:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="n0DUD4au"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9FDD2DCC11
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Jul 2025 18:52:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753901532; cv=none; b=d/q13RV3XuhI5BKgtHqLopuiZ2VFqs8sV3tHuvzTU7MrN+u2ydR7aC+XQEqzWXZypf2SiOGbIEPy3QeIBRHC746L98aLkZTFybzoYvTh6s6xjM+SVE4WrQ3IuBKvW8LNSufT2OJB7iU5cdWykqu7tV8Lh/WWiwasx7pglYnTIrw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753901532; c=relaxed/simple;
	bh=IbxbUNtJRhezbHfWoj4hG0QyJlDf9fcOcWlxfpdd9Q4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ESwFc9UTWZvnfJpXasZz5deuOQQJyNAIdAE44s0Oh6ILf4oH68beHAficDWZHa1GnrjWeIEo8ktw7JqjENY+lRaDDsoDu7xHlr3qVZAMtLD/eNlPDgZ8HEKElPMSC3z+j7xERqW7RzT/clNUbpjMRQyuNtM8zXUxSUTyTe9PH24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=n0DUD4au; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56UCbBFi012953
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Jul 2025 18:52:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=cTwARdfCwgr/NlvTGtGlbkJb
	A7lOmveqZjNQjd5wXok=; b=n0DUD4augujSkO6bHRI09Nvi0ovzhYVKV406vdZm
	1j36mDe6URlq9d1gCKduKh5g5Gjvi0RaNRO4gS51Jid8RtmWK7ZMKM5IVxqOYn/Y
	tXxP2hRnON5fIJzVoeuYiqrw1pps2k/NokVnNUJTfUac8UGP5Q9TqAEGtvFxFKcC
	fQEIpmEmspTvjgxnbSuo21kkqTF2Y+uhH956B0IN8t18u9S4+5+PyZqE6w3edFJ2
	P0THcwqcQfm1dZZ/dBeKgf+VW9PrF77PfnF6/K3wbohYOUhQLiQ8NTVUiVPfjCpu
	/35EuiwqCl3SMLL/7V17BUS4Ccmy+31RZsQIgCOAbYk6bw==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484pm2mw56-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Jul 2025 18:52:09 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-7073140087aso1391856d6.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Jul 2025 11:52:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753901529; x=1754506329;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cTwARdfCwgr/NlvTGtGlbkJbA7lOmveqZjNQjd5wXok=;
        b=o9pOcDJTBzT4jyr8Cp8UHjW+KqBZ3/vlmmxAfoxC2XZlPr30IVhTzP3Wg/6VGXmf+W
         GVqvTbl/ee6sYeYeWZ6/SIZE8t4FMmhjHeF9JOy35eLQQU3Tg46GViYJJmeHz7FXS7xa
         n6jAy3w3udg9mIi4xHyvqEbvnSGCN2kgYjweYYqiPeIazPeMRC1KC6FYVrOry16vutGe
         LuWAQbyoEkMAHEc7su/2pakF/GoyXN4od2lvSBO3Yu6qotmqe0DJitxrU/4vpTWt2G8W
         gHFSnfelH1RpbLYMRwMKioz2m3rMemZ3bapH8xJ2SUKn741j/G7h/DPaZSoFHUKocmRy
         j+SQ==
X-Forwarded-Encrypted: i=1; AJvYcCXGGpiAHKFDXA+eBuH3BQ3eO5vxWF2qiSktEeCyfrvvCJdtjKWDKM4EROGO15KDOnL4EopNagRb1dFBx2Iq@vger.kernel.org
X-Gm-Message-State: AOJu0YwsBO4gXzbZOXy/jBNo35L9Fi1J/F8PVamzFRIy+zwoMAq2YAfz
	34S40JJ65YGLetT46pvzn0d8cAsNDsVH9EMPzR6Mywqbb9RrX/hNrzYXnTC0T7BAYMxQIm+lNMA
	Ojg78S/CQUnlvcirxCW/CDZVnxyBcMhzSnUtgcimLZ/N+8wt/UZDdxxLbk7f/KkyNtEVN
X-Gm-Gg: ASbGncs1w05opHhrVt2nkFNDcgR4HyFWM3pL73Ybbk3EUKicDJZQZZl8QTNP+GMG7P6
	NJZzAj47adjBku6DdkFWONw4Ezrx3ILj49XrdoEFprO8K4tX5fmFLUeK6VqwCr3FPxYGfAF/hAT
	6pk4T/zGulTHtsJk5BnQjyfb9VRhF+GeCF5gqEd2UkBLT4J5y2IzFyydV3C1oAcYy1fVezi+dl7
	uxfqcxQCJL4gSwbRWTdkwJJxOOwjZVdQME58c/++K+65hUtNtCs13TX3lfCXZ7OOu+17IN8NyFr
	AixgzpP1WAICTZhztx2Cw9fGIg8g9TvNzSqSFSloybmJRzK/ERcqzyCR8DtFif6R9CEm4hBMDsj
	GIhE2rBHlQDCJDWkdHfA3nyHGwG/jPgLlte/frSqp5irOIqU7sMWc
X-Received: by 2002:a05:6214:301a:b0:707:5d28:5756 with SMTP id 6a1803df08f44-707672d5bf0mr58691276d6.38.1753901528419;
        Wed, 30 Jul 2025 11:52:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEUgQbxh6ti7IV0IFdWPPJtqJvpimYqQzIhvgqG6WDSshQjaXtEIX2BkDqpxJvZ79BtOUo2+Q==
X-Received: by 2002:a05:6214:301a:b0:707:5d28:5756 with SMTP id 6a1803df08f44-707672d5bf0mr58690726d6.38.1753901527818;
        Wed, 30 Jul 2025 11:52:07 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55b828b9999sm263879e87.182.2025.07.30.11.52.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Jul 2025 11:52:06 -0700 (PDT)
Date: Wed, 30 Jul 2025 21:52:04 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jun Nie <jun.nie@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jessica Zhang <quic_jesszhan@quicinc.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v13 10/12] drm/msm/dpu: support SSPP assignment for
 quad-pipe case
Message-ID: <4dpeif7wynynbsccbhc253wkshuylnsjslsosmrnyld3bmot5l@yqrmpln44qe2>
References: <20250728-v6-16-rc2-quad-pipe-upstream-v13-0-954e4917fe4f@linaro.org>
 <20250728-v6-16-rc2-quad-pipe-upstream-v13-10-954e4917fe4f@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250728-v6-16-rc2-quad-pipe-upstream-v13-10-954e4917fe4f@linaro.org>
X-Proofpoint-GUID: UKrJAi5XqjsdzY2EdmhG3QbxQC8fCTMt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzMwMDEzNyBTYWx0ZWRfX3m4WHszvT3GN
 Hhpp2mG4B1KneAfzVA4/o9YNzvxKagN8qzEQnAZOJ+FZkpq9eQaYoP1f8umo832d1S6imKXA5ge
 b4GTevG7nPEurftUpxhVJwp6wedOgeOyrW/BjVArjAB6dtfAY2KlNIsBuwX0xaA0Cfz3HoS6Siv
 2iPqrJK2Vfe4YqbqzAFL0X7IX1yXpT8aR8BFEmxwIaOpXFKDSOo0KtJWsgVZO2RFJtl6MbdnZsK
 PWRYsaH1/eS5+A83TZ4SBuB2vD/BAvqWHJPH7Eu5Th/veL5SQzg781WR0z4lC8QlCIRnO2xXtDL
 NMYqb/yPum4tjxfO15ISb88dKBkTj/RUpVpjkiIYyopvNts4PhQf3nfFBEXBsCeErQqYekaEAhv
 UmTu5YDE82bFVg5ejBuvdxQDTTCfAsc5LiXug0xy98UpJZ2LWwvgryZNpWisoIrt5usNJWFy
X-Authority-Analysis: v=2.4 cv=HfYUTjE8 c=1 sm=1 tr=0 ts=688a69d9 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=sWKEhP36mHoA:10 a=KKAkSRfTAAAA:8 a=_amKiFhVn6yWzfpbwTQA:9
 a=CjuIK1q_8ugA:10 a=OIgjcC2v60KrkQgK7BGD:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: UKrJAi5XqjsdzY2EdmhG3QbxQC8fCTMt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-30_05,2025-07-30_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1015 bulkscore=0 suspectscore=0 impostorscore=0
 spamscore=0 lowpriorityscore=0 adultscore=0 mlxlogscore=999 phishscore=0
 priorityscore=1501 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507300137

On Mon, Jul 28, 2025 at 09:14:34PM +0800, Jun Nie wrote:
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
>  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 160 ++++++++++++++++++------------
>  1 file changed, 99 insertions(+), 61 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> index 55429f29a4b95594771d930efe42aaa4126f6f07..e1e16a8d5ac55ba52a0f460d62901dced65e3a9e 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> @@ -959,6 +959,30 @@ static int dpu_plane_is_multirect_parallel_capable(struct dpu_hw_sspp *sspp,
>  }
>  
>  
> +static bool dpu_plane_get_single_pipe_in_stage(struct dpu_plane_state *pstate,
> +					       struct dpu_sw_pipe **single_pipe,
> +					       struct dpu_sw_pipe_cfg **single_pipe_cfg,
> +					       int stage_index)
> +{
> +	int pipe_idx, i, valid_pipe = 0;
> +
> +	for (i = 0; i < PIPES_PER_STAGE; i++) {

Why do you need to loop here? Is there a case when pipe 0 is not
assigned, but pipe 1 is?

> +		pipe_idx = stage_index * PIPES_PER_STAGE + i;
> +		if (drm_rect_width(&pstate->pipe_cfg[pipe_idx].src_rect) != 0) {
> +			valid_pipe++;
> +			if (valid_pipe > 1)
> +				return false;
> +
> +			if (single_pipe)
> +				*single_pipe = &pstate->pipe[pipe_idx];
> +			if (single_pipe_cfg)
> +				*single_pipe_cfg = &pstate->pipe_cfg[pipe_idx];
> +		}
> +	}
> +
> +	return valid_pipe == 1;
> +}
> +
>  static int dpu_plane_atomic_check_sspp(struct drm_plane *plane,
>  				       struct drm_atomic_state *state,
>  				       const struct drm_crtc_state *crtc_state)
> @@ -1023,17 +1047,20 @@ static bool dpu_plane_try_multirect_parallel(struct dpu_sw_pipe *pipe, struct dp
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
> @@ -1048,11 +1075,6 @@ static int dpu_plane_try_multirect_shared(struct dpu_plane_state *pstate,
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
> @@ -1181,36 +1203,69 @@ static int dpu_plane_virtual_atomic_check(struct drm_plane *plane,
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
> @@ -1225,42 +1280,27 @@ static int dpu_plane_virtual_assign_resources(struct drm_crtc *crtc,
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
> +	for (i = 0; i < STAGES_PER_PLANE; i++) {
> +		if (!prev_adjacent_pstate[i])
> +			goto assignment;
>  
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
> +		if (dpu_plane_try_multirect_shared(pstate, prev_adjacent_pstate[i], fmt,
> +						   dpu_kms->catalog->caps->max_linewidth,
> +						   i))
> +			continue;


if (prev_adjacent_pstate[i] &&
    dpu_plane_try_multirect_shared())
	continue;

No need for the goto.

>  
> -			pipe->multirect_index = DPU_SSPP_RECT_SOLO;
> -			pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
> +assignment:
> +		if (dpu_plane_get_single_pipe_in_stage(pstate, NULL, NULL, i))
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
> @@ -1273,7 +1313,7 @@ int dpu_assign_plane_resources(struct dpu_global_state *global_state,
>  			       unsigned int num_planes)
>  {
>  	unsigned int i;
> -	struct drm_plane_state *prev_adjacent_plane_state = NULL;
> +	struct drm_plane_state *prev_adjacent_plane_state[STAGES_PER_PLANE] = { NULL };
>  
>  	for (i = 0; i < num_planes; i++) {
>  		struct drm_plane_state *plane_state = states[i];
> @@ -1284,11 +1324,9 @@ int dpu_assign_plane_resources(struct dpu_global_state *global_state,
>  
>  		int ret = dpu_plane_virtual_assign_resources(crtc, global_state,
>  							     state, plane_state,
> -							     prev_adjacent_plane_state);
> +							     &prev_adjacent_plane_state[0]);

It's exactly the prev_adjacent_plane_state.

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

