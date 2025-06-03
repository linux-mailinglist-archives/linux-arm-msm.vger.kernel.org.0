Return-Path: <linux-arm-msm+bounces-60128-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C2388ACC43E
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Jun 2025 12:21:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 78EBB3A395C
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Jun 2025 10:21:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF3D91D63E4;
	Tue,  3 Jun 2025 10:21:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Lem0NO5p"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA7A128382
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Jun 2025 10:21:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748946114; cv=none; b=dioX8nNDwR+BXADkzkB80w/2hQAG463RKvt3Gs7KhOdbsVAHZaIz6yuDQHkl06Si+W+an6KENDoQKe1SbJezaSk477sOqmuu0ckSfNR69U5B6iYf/yOcvE+WfSJ9EfL7l48793bZemXs1i9M6TVcbRISqfdTUh2xHkxyueaK3uI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748946114; c=relaxed/simple;
	bh=ezOuF7W6HNCJbC9cen5o46QHDezcQjfR39ml6O7jggw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oep6eAZlMRceArX+/bjvOe9YZQHOqwWpf0cR53WbF0ouyV7MIswB6ZeEwdE/4OdnhYf+FXGuxGtKpyqf+z7fyx3qiaxj+ps9X7L2KkDOIirSVJ5aFO2oQWQLD7P9gZ9NZsBr8qp8n5l6XTHIaA6YKJQmMQFQN5vUJ/2SyqF+8zY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Lem0NO5p; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5539JJEU000560
	for <linux-arm-msm@vger.kernel.org>; Tue, 3 Jun 2025 10:21:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=+yFMWYOsepgGCv6WJkDjVObj
	uomJ6ssrQYWGuL/VKH0=; b=Lem0NO5pvjbail51CcHRVfcA0l0GTaXc05Qefe6O
	960aIU+/kNbrsaJBcTaXHzf7mlS0XezUvHhn3K9iNApgLy76iFOBdTnwBCmSCH8w
	v1Eu0gBIww/WDLtC/Ss7P2s7hNy3lvBlUxDmGnMJS9L8HdbVLWEbirdutky90ola
	0L9w7bG0K9lLYsXSr9I/YXgeqbL01h5LfTzGgygYgodj+IqCYkzldzjgaw/7j2dU
	2WAswJYh/pzL1zMI1VgFtLta4vxawuNxtamJrzVd2VjOv8YAmpPFMgpmfKBA90t+
	Q83CGn93zZDXpRy8vDKhOjj3yYfO8XETcV8xamVk0cjtfA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 471g8ta7g4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 03 Jun 2025 10:21:50 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7cf6c53390eso509371985a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Jun 2025 03:21:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748946110; x=1749550910;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+yFMWYOsepgGCv6WJkDjVObjuomJ6ssrQYWGuL/VKH0=;
        b=PerKJGULaktvASW4ZU0vGEW1JYUuAXZYKsNZ87CiwoFnEGIdkTAe71qhLZGNBw334g
         N/OFr/12lMATwqomRwwhTsjQ4O5S8D4vdnnjXFNyFNvIl6pSDdWggO/Owl8X4sjqQgDo
         wUJEd5dg1Jf9QC1ZhH5Re3jSMoG/JL8KlQzwVcOYwoQplhFAHXl1UqQNtSQ9NNUQVD3h
         FSAjVrj3qN1Wv8n4Jwn2l7rFRiPO+iSxs4vi/Gl6xxKrTag+sPEvmDD3BEfA5d6R5orL
         Y5l+Vj7/GLlY1W8yCgWqaPPufsDgMQ4D+9nV4mf+XMAf84wzxOaKYY3l25NFroU4upLh
         Zysw==
X-Forwarded-Encrypted: i=1; AJvYcCXFm/Z/flYl3DTuQhfKaUhiKITeznsunceVQLBdiZRILkOv4fqAe23IWMhfuTJMkql+/pTUMvqJyxJ3iZF2@vger.kernel.org
X-Gm-Message-State: AOJu0YxCKF8yLc2LJLh870CgnUU2AJWsQULzsO2d4d184EBq9EBfR57r
	2G9Dqh2fqNMwlJZOTS9scF2wdnA8jttc5qskAriFnKrsuigqyhzVByuZbQ1vcS4E2O9uAy+5V8e
	wxdJV0e4fBCPxlykYAhYlaS/XwPs318vNiV4i5fb80ImJBwRybO6a9qhSA4AGigZXlgLD
X-Gm-Gg: ASbGncs4gD94FXdWmUvlWtmHrZVna+0m1zkUCv+sgTlp+O6C1c5p7sMT0nO7Betmly5
	Ft6wLpTULDLKyn687uM5rNSi3Rgztll53WFA8J04V3ym1qUFxABIu9vNLfrMEpISWJKGJMPnUoj
	yzQY9TgiuYpRR80NSOOBgqTUt9QdBebZbswT9Z9YambzQsMsjPR6QafLhuaYSmvQ6QnSjqfS3My
	5N+W8IsR2r5GZeONXs4x7iRTY3c4z+0ciJi0vbmW53M5OLp+5QDteh7xy4PdU7uUjcKOp2X150L
	uJgOmsSIVLmtbH1LeRln9asTmfNefEZN64iDYvfrAY5wjsCEavvdr1jXTSAzK//rJ/28kYn9sqw
	=
X-Received: by 2002:a05:620a:4142:b0:7c5:6678:ab18 with SMTP id af79cd13be357-7d0eacd7f28mr1482547385a.42.1748946109540;
        Tue, 03 Jun 2025 03:21:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFA+wh/4FKedlrkOPQwatQTrmIQIx7FrIJJHycPWZsT+nXMzTZkh9eMA7K4VeFJbCto3w398Q==
X-Received: by 2002:a05:620a:4142:b0:7c5:6678:ab18 with SMTP id af79cd13be357-7d0eacd7f28mr1482541885a.42.1748946108944;
        Tue, 03 Jun 2025 03:21:48 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553378a02bbsm1868277e87.84.2025.06.03.03.21.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jun 2025 03:21:48 -0700 (PDT)
Date: Tue, 3 Jun 2025 13:21:46 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jun Nie <jun.nie@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jessica Zhang <quic_jesszhan@quicinc.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v11 10/12] drm/msm/dpu: support SSPP assignment for
 quad-pipe case
Message-ID: <dsgnmzswhpht4bewf5wld774riqxffojboujxdf4smutuzmuye@ugyhzv6m7mve>
References: <20250603-v6-15-quad-pipe-upstream-v11-0-c3af7190613d@linaro.org>
 <20250603-v6-15-quad-pipe-upstream-v11-10-c3af7190613d@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250603-v6-15-quad-pipe-upstream-v11-10-c3af7190613d@linaro.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjAzMDA5MCBTYWx0ZWRfX+/Pe9TRyKd/Y
 Aa7SpvoqIG9PysSz9mnONCpPDSKWiunNtbehxyu0lCqfmWSte6v4fL1spJuNNQ9y2rdm+FI+NFL
 tc0yT5YKFiISycvtyOuVxyww+UnC0B/1+kfRhgWRlAF9snzVfeJXW85xdSX1H78MLml0X5JBMwh
 4NlrnRlnoVfwBMWn78ypUTs1plbRfJBYT2M8qsDKuiVhho05PtFv1Ax1BDJSIWZasSEt8ZGCW4Z
 T6y0Xtr+peGErJL3Vv5k9P/YYfin93u6arBDJBt2sc8ah9DkYFKM4eQnVhXpPbj2a8X59RgY9vJ
 bu8TvZfzSC98HPYeYJxWqG0F5sp9UPDyF5x0YEbhs38FGKbXqRfDEBjHHwOUYR1wZCCRkc9q8Bk
 Zc5Y7uD687g/fuJ1OKGxEpJu9xG0QqdFyNXhHB1oG6PDwwbTMYAtNeOJgQchX3KlMaeVZwiq
X-Proofpoint-ORIG-GUID: cc8bTf4Ufg6ZnQh_j77MnMhVpMW_aheN
X-Authority-Analysis: v=2.4 cv=OuxPyz/t c=1 sm=1 tr=0 ts=683eccbe cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=sWKEhP36mHoA:10 a=KKAkSRfTAAAA:8 a=kVcFuMI1zxpe4gVQ-GQA:9
 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: cc8bTf4Ufg6ZnQh_j77MnMhVpMW_aheN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-03_01,2025-06-02_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 malwarescore=0 impostorscore=0 mlxlogscore=999
 lowpriorityscore=0 spamscore=0 mlxscore=0 suspectscore=0 priorityscore=1501
 adultscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506030090

On Tue, Jun 03, 2025 at 03:10:09PM +0800, Jun Nie wrote:
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
>  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 148 +++++++++++++++++++-----------
>  1 file changed, 94 insertions(+), 54 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> index 0bb153a71353ca9eaca138ebbee4cd699414771d..501b6a1bad4a1fee832f15efa7caec136a669da5 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> @@ -961,6 +961,33 @@ static int dpu_plane_is_multirect_parallel_capable(struct dpu_hw_sspp *sspp,
>  		dpu_plane_is_parallel_capable(pipe_cfg, fmt, max_linewidth);
>  }
>  
> +static bool dpu_plane_get_single_pipe(struct dpu_plane_state *pstate,
> +				      struct dpu_sw_pipe **single_pipe,
> +				      struct dpu_sw_pipe_cfg **single_pipe_cfg,
> +				      bool config_pipe)

Could you please describe, what does this function do? Why is it
returning the pipe or configuring a pipe?

> +{
> +	int i, valid_pipe = 0;
> +	struct dpu_sw_pipe *pipe;
> +
> +	for (i = 0; i < PIPES_PER_PLANE; i++) {
> +		if (drm_rect_width(&pstate->pipe_cfg[i].src_rect) != 0) {
> +			valid_pipe++;
> +			if (valid_pipe > 1)
> +				return false;
> +			*single_pipe = &pstate->pipe[i];
> +			*single_pipe_cfg = &pstate->pipe_cfg[i];
> +		} else {
> +			if (!config_pipe)
> +				continue;
> +			pipe = &pstate->pipe[i];
> +			pipe->multirect_index = DPU_SSPP_RECT_SOLO;
> +			pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
> +			pipe->sspp = NULL;
> +		}
> +	}
> +
> +	return true;
> +}
>  
>  static int dpu_plane_atomic_check_sspp(struct drm_plane *plane,
>  				       struct drm_atomic_state *state,
> @@ -1028,15 +1055,15 @@ static int dpu_plane_try_multirect_shared(struct dpu_plane_state *pstate,
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
>  	u16 max_tile_height = 1;
>  
> -	if (prev_adjacent_pstate->pipe[1].sspp != NULL ||
> +	if (!dpu_plane_get_single_pipe(pstate, &pipe, &pipe_cfg, true))
> +		return false;
> +
> +	if (!dpu_plane_get_single_pipe(prev_adjacent_pstate, &prev_pipe, &prev_pipe_cfg, false) ||
>  	    prev_pipe->multirect_mode != DPU_SSPP_MULTIRECT_NONE)
>  		return false;
>  
> @@ -1050,11 +1077,6 @@ static int dpu_plane_try_multirect_shared(struct dpu_plane_state *pstate,
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
> @@ -1183,6 +1205,51 @@ static int dpu_plane_virtual_atomic_check(struct drm_plane *plane,
>  	return 0;
>  }
>  
> +static int dpu_plane_try_multirect_in_stage(struct dpu_sw_pipe *pipe,
> +					    struct dpu_sw_pipe_cfg *pipe_cfg,
> +					    struct drm_plane_state *plane_state,
> +					    struct dpu_global_state *global_state,
> +					    struct drm_crtc *crtc,
> +					    struct dpu_rm_sspp_requirements *reqs)
> +{
> +	struct drm_plane *plane = plane_state->plane;
> +	struct dpu_kms *dpu_kms = _dpu_plane_get_kms(plane);
> +	struct dpu_plane *pdpu = to_dpu_plane(plane);
> +	struct dpu_sw_pipe *r_pipe = pipe + 1;
> +	struct dpu_sw_pipe_cfg *r_pipe_cfg = pipe_cfg + 1;
> +	int i;
> +
> +	for (i = 0; i < PIPES_PER_STAGE; i++, pipe++, pipe_cfg++) {
> +		if (drm_rect_width(&pipe_cfg->src_rect) == 0)
> +			continue;
> +
> +		pipe->sspp = dpu_rm_reserve_sspp(&dpu_kms->rm, global_state, crtc, reqs);
> +		if (!pipe->sspp)
> +			return -ENODEV;
> +
> +		/*
> +		 * If current pipe is the first pipe in a stage, check
> +		 * multi-rect opportunity for the 2nd pipe in the stage.
> +		 * SSPP multi-rect mode cross stage is not supported.
> +		 */
> +		if (!i &&

Unroll the loop. I think I've asked a similar change in the review of
the previous patch.

> +		    drm_rect_width(&r_pipe_cfg->src_rect) != 0 &&
> +		    dpu_plane_try_multirect_parallel(pipe, pipe_cfg, r_pipe, r_pipe_cfg,
> +						      pipe->sspp,
> +						      msm_framebuffer_format(plane_state->fb),
> +						      dpu_kms->catalog->caps->max_linewidth)) {
> +			goto stage_assinged;
> +		} else {
> +			/* multirect is not possible, use dedicated SSPP */
> +			pipe->multirect_index = DPU_SSPP_RECT_SOLO;
> +			pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
> +		}
> +	}
> +
> +stage_assinged:
> +	return 0;
> +}
> +
>  static int dpu_plane_virtual_assign_resources(struct drm_crtc *crtc,
>  					      struct dpu_global_state *global_state,
>  					      struct drm_atomic_state *state,
> @@ -1195,11 +1262,9 @@ static int dpu_plane_virtual_assign_resources(struct drm_crtc *crtc,
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
> @@ -1209,11 +1274,6 @@ static int dpu_plane_virtual_assign_resources(struct drm_crtc *crtc,
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
> @@ -1227,44 +1287,24 @@ static int dpu_plane_virtual_assign_resources(struct drm_crtc *crtc,
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

And this needs to take care of LMs. prev_adjacent_pstate should be
per-stage, otherwise you can end up sharing the SSPPs between stages
(which is not allowed).

> +		goto assigned;
> +	}
>  
> -			r_pipe->multirect_index = DPU_SSPP_RECT_SOLO;
> -			r_pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
> -		}
> +	for (stage_id = 0; stage_id < STAGES_PER_PLANE; stage_id++) {
> +		pipe = &pstate->pipe[stage_id * PIPES_PER_STAGE];
> +		pipe_cfg = &pstate->pipe_cfg[stage_id * PIPES_PER_STAGE];
> +		ret = dpu_plane_try_multirect_in_stage(pipe, pipe_cfg,
> +						       plane_state,
> +						       global_state,
> +						       crtc, &reqs);
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

