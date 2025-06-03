Return-Path: <linux-arm-msm+bounces-60129-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 87316ACC444
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Jun 2025 12:24:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4896C16FB31
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Jun 2025 10:24:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E3861DE4C2;
	Tue,  3 Jun 2025 10:24:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HQ5oROgZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36E1E4A35
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Jun 2025 10:24:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748946288; cv=none; b=NUml86qTDC+N2MyrAhlHC096o9OBzjo4zIjayNhW03GIGuzb4GFO8Yv9fERs6M5j92wzxxe6ufxuZgB5T3lCYBBG9AkH0NQ3D2Hd3eKaQE/duGzE6v3OzAru8HLKLUqOE+FCqyV6nec1/zXQYodmvaKaGoBBkIwdi/m/evoe7jQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748946288; c=relaxed/simple;
	bh=L5SSiNoM99AoVFDZrjuwmHOFjybATeShnd6SJRZziS8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IVZhUsPlI9iJmrZwtlTEtKa0ob6TTXJNOz/LakEMKiPvlzQHJq20lhpadD1CpU8S8OCX98grv+EfkYzoO38N/L6F4694nNZPL8jqR2sTEBVeoNZ53/5g6peLlTZ7FYiKbTUaYKCJJRhYl+WeHKNcsJNLHv3SvIlrZU1qYa28rFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HQ5oROgZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5539JHjr006342
	for <linux-arm-msm@vger.kernel.org>; Tue, 3 Jun 2025 10:24:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=8X/sdHFYG4xEls9KgUDjyGuo
	Kkp1AX+QACpgspI0LJs=; b=HQ5oROgZMVVuu3tSigG8HkTg7bnK44pS11ajrjga
	ty5ORBWMri/ln0RysVOeAa5/dFvdLbsxAVZWFhcLpYvlaCUrXBK9BlK3W6pIUkjs
	EBToKoh9MrCD5kFUJ48yxY8Y3isvkwMWU3q1hK6nJOUMTcezSukoadf5IdOLqV6w
	sr1BYbyMft6j2Rpc4EgvMdqy9ykGqb5CCcy4RWceHLwH191LJ+uKv6oXinr/UqUq
	spTBif9cEg414zA/w9D8+XihOXRxf9lvwPv3xS/Nvu/S9v1ROhiBdIU585rR45yP
	SQzkhSyp75PMm0Y/siaT+qzGl5LU1mMWvil2W85x/1SXHg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 471g8st6j5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 03 Jun 2025 10:24:45 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c5f3b8b1a1so952277285a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Jun 2025 03:24:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748946284; x=1749551084;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8X/sdHFYG4xEls9KgUDjyGuoKkp1AX+QACpgspI0LJs=;
        b=TEqDBX7/79IudpPMYYyQl+EkgK++McXeko+3qemL47X3xDr7Myy2wCdiudVv/IRj0f
         FB6AotowtCsdXwZI0hnzGravubiw/GiZcQINoG/bzM5wlQ8DfehP2Rbv74k/e8mT6UqC
         KwrwouEnkWUxv/6El0F6kxq96L09N5aOFH4NqSi3jpuMIbb8KbRN5SJ571s3tSVof6uh
         jp5b9StBsDeEm/xcaG6vPZMfonZMsLBWBUXF1UEaIOFOIsQef8cYsfDqMh02kzRe914a
         fsljCLSgY7gHVuZEepWVmwmVEaqFVQqh5wvmWWYVigGQOeO89prE5k5lyDir1Blauf36
         c3gQ==
X-Forwarded-Encrypted: i=1; AJvYcCVjcz/egpv6GYrGUqcYf5JRnDrCATHx1pCcdIHwfUGIwPS4cHBGapPzYtSVnyGw+OvVeVbyZDDlzjDkwPEX@vger.kernel.org
X-Gm-Message-State: AOJu0YyY7gXbeQVHvm8MnE5SEGrCw6tB/iZqehjdotQplQRRLPKUJlo4
	y7PFvCUd73ZKO+goXTUvwEAyY6xBMJM+ht6NHhWY+d8XbMjPURP6HP9reMo4tc/ZcG0GkNfiV0X
	8NkQwCRVWULURalRx12xTpqb5jyKQW7aLpT2Uu1lkueXIbOEGfMA8mBTT0RkBN+jxcsfB
X-Gm-Gg: ASbGncvlmHtK00y0pvht4IE6NmRhRhjeIUSPAuxK8cbjlwsS1j54GX4MoVUA/iaa9b5
	bhxPiHUhN6yaQ2303+tmw7SBm7Xkxs8ScjXmKCL2WBy9Vd7LBPLXHgAaa0Kz4pbA01EVpv5ikrf
	oKPCZMNKFl+UgykY80wv+jny5rv9cLV0bt09sxDuMedVMcUC0z6RqsTUS5L16CBjRV5dOGLtdT+
	ZqZTVd2Y+ZUpKHDrOW62Dn3MdvzJpePA3ajb0+Rq83YVcLqFsi7WXmbCDcoqOdredxhKEj5UlQd
	yQ0wX9m4WWdZg3qS/WRxvUBh9O8WIQohBSC/No9fJ+tUorD23LLZBuNiMRuP+uUfeMGsu4vtM+0
	=
X-Received: by 2002:a05:620a:2a05:b0:7cd:565b:dbc9 with SMTP id af79cd13be357-7d0eacaff1emr1546419285a.26.1748946283766;
        Tue, 03 Jun 2025 03:24:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEIHzhH2SJMVGYPwtzq1agpq1FHt0yACqP7MZbotmEP0Z6ueg0f6IDu07/7/Dr+I9bfBtdGsA==
X-Received: by 2002:a05:620a:2a05:b0:7cd:565b:dbc9 with SMTP id af79cd13be357-7d0eacaff1emr1546416385a.26.1748946283327;
        Tue, 03 Jun 2025 03:24:43 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55337913421sm1880194e87.117.2025.06.03.03.24.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jun 2025 03:24:42 -0700 (PDT)
Date: Tue, 3 Jun 2025 13:24:40 +0300
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
Subject: Re: [PATCH v11 11/12] drm/msm/dpu: support plane splitting in
 quad-pipe case
Message-ID: <5hmgt4v4nop3xpqt34wq4yyfjnypkrnlrr5fnt6r72k5c6r4vn@ykmg5ni6hjyt>
References: <20250603-v6-15-quad-pipe-upstream-v11-0-c3af7190613d@linaro.org>
 <20250603-v6-15-quad-pipe-upstream-v11-11-c3af7190613d@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250603-v6-15-quad-pipe-upstream-v11-11-c3af7190613d@linaro.org>
X-Proofpoint-ORIG-GUID: WKjAUocdmT-JnsxThUvO56a_vSn0wANp
X-Authority-Analysis: v=2.4 cv=EPcG00ZC c=1 sm=1 tr=0 ts=683ecd6d cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=sWKEhP36mHoA:10 a=KKAkSRfTAAAA:8 a=OoP3oNsDoWyiozS0VdIA:9
 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: WKjAUocdmT-JnsxThUvO56a_vSn0wANp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjAzMDA5MSBTYWx0ZWRfX6tZJehxZk0ej
 BxqjfF5C0N5imG4qrvRfBqoqz7gXf315UX35Aq05mkh5t0ufkuSbjLIQY9VUdhPWucanWODhsLO
 QoUUEQVhuxfFZtgdLf+Nj1Jt24G+nP/X1J1ovUN0oi90O7GJkKRq3pJhb1CCAAA4ySxV6uGE71K
 424P4Iix2FWv08AhmiuDlf5V69+Q7aEClUy4fISxVF/t5LoOAlVGtXKF0ASQQr42z0LGarjZhuT
 Il37yvpfECVY9F141O+Vx9A3vPbg1voA/vTStPrAEQ4HzcKfhAAQUxQBjm1b2BkLxUvwMV70Gkw
 Xe5IXlhH2agoraGJX2TYyeh/LLpbxFc/u957c4wb6pavpzmY7j2jkk47zx2smnu972Yv+NOJgoK
 L0vlvrDhEuIs29wyWC5kCdhOXTd7gkhhKMp6hwJN+yFgsvv0pO1fd7j+s6SrbN0vKCtQp3Fw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-03_01,2025-06-02_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 bulkscore=0 priorityscore=1501 phishscore=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0 mlxscore=0
 clxscore=1015 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506030091

On Tue, Jun 03, 2025 at 03:10:10PM +0800, Jun Nie wrote:
> The content of every half of screen is sent out via one interface in
> dual-DSI case. The content for every interface is blended by a LM
> pair in quad-pipe case, thus a LM pair should not blend any content
> that cross the half of screen in this case. Clip plane into pipes per
> left and right half screen ROI if topology is quad pipe case.
> 
> The clipped rectangle on every half of screen is futher handled by two
> pipes if its width exceeds a limit for a single pipe.
> 
> Signed-off-by: Jun Nie <jun.nie@linaro.org>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c  |  11 +++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h  |   2 +
>  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 137 +++++++++++++++++++++---------
>  3 files changed, 110 insertions(+), 40 deletions(-)
> 
> @@ -886,35 +887,94 @@ static int dpu_plane_atomic_check_nosspp(struct drm_plane *plane,
>  
>  	max_linewidth = pdpu->catalog->caps->max_linewidth;
>  
> -	drm_rect_rotate(&pipe_cfg->src_rect,
> +	drm_rect_rotate(&init_pipe_cfg.src_rect,
>  			new_plane_state->fb->width, new_plane_state->fb->height,
>  			new_plane_state->rotation);
>  
> -	if ((drm_rect_width(&pipe_cfg->src_rect) > max_linewidth) ||
> -	     _dpu_plane_calc_clk(&crtc_state->adjusted_mode, pipe_cfg) > max_mdp_clk_rate) {
> -		if (drm_rect_width(&pipe_cfg->src_rect) > 2 * max_linewidth) {
> -			DPU_DEBUG_PLANE(pdpu, "invalid src " DRM_RECT_FMT " line:%u\n",
> -					DRM_RECT_ARG(&pipe_cfg->src_rect), max_linewidth);
> -			return -E2BIG;
> +	/*
> +	 * We have 1 mixer pair cfg for 1:1:1 and 2:2:1 topology, 2 mixer pair
> +	 * configs for left and right half screen in case of 4:4:2 topology.
> +	 * But we may have 2 rect to split wide plane that exceeds limit with 1
> +	 * config for 2:2:1. So need to handle both wide plane splitting, and
> +	 * two halves of screen splitting for quad-pipe case. Check dest
> +	 * rectangle left/right clipping first, then check wide rectangle
> +	 * splitting in every half next.
> +	 */
> +	num_stages = (num_lm + 1) / 2;

I thought we agreed to loop over all stages, dropping the need for
num_lm.

> +	/* iterate mixer configs for this plane, to separate left/right with the id */
> +	for (stage_id = 0; stage_id < num_stages; stage_id++) {
> +		struct drm_rect mixer_rect = {
> +			.x1 = stage_id * mode->hdisplay / num_stages,
> +			.y1 = 0,
> +			.x2 = (stage_id + 1) * mode->hdisplay / num_stages,
> +			.y2 = mode->vdisplay
> +			};
> +		int cfg_idx = stage_id * PIPES_PER_STAGE;
> +
> +		pipe_cfg = &pstate->pipe_cfg[cfg_idx];
> +		r_pipe_cfg = &pstate->pipe_cfg[cfg_idx + 1];
> +
> +		drm_rect_fp_to_int(&pipe_cfg->src_rect, &new_plane_state->src);
> +		pipe_cfg->dst_rect = new_plane_state->dst;
> +
> +		DPU_DEBUG_PLANE(pdpu, "checking src " DRM_RECT_FMT
> +				" vs clip window " DRM_RECT_FMT "\n",
> +				DRM_RECT_ARG(&pipe_cfg->src_rect),
> +				DRM_RECT_ARG(&mixer_rect));
> +
> +		/*
> +		 * If this plane does not fall into mixer rect, check next
> +		 * mixer rect.
> +		 */
> +		if (!drm_rect_clip_scaled(&pipe_cfg->src_rect,
> +					  &pipe_cfg->dst_rect,
> +					  &mixer_rect)) {
> +			memset(pipe_cfg, 0, 2 * sizeof(struct dpu_sw_pipe_cfg));
> +
> +			continue;
>  		}
>  
> -		*r_pipe_cfg = *pipe_cfg;
> -		pipe_cfg->src_rect.x2 = (pipe_cfg->src_rect.x1 + pipe_cfg->src_rect.x2) >> 1;
> -		pipe_cfg->dst_rect.x2 = (pipe_cfg->dst_rect.x1 + pipe_cfg->dst_rect.x2) >> 1;
> -		r_pipe_cfg->src_rect.x1 = pipe_cfg->src_rect.x2;
> -		r_pipe_cfg->dst_rect.x1 = pipe_cfg->dst_rect.x2;
> -	} else {
> -		memset(r_pipe_cfg, 0, sizeof(*r_pipe_cfg));
> -	}
> +		pipe_cfg->dst_rect.x1 -= mixer_rect.x1;
> +		pipe_cfg->dst_rect.x2 -= mixer_rect.x1;
> +
> +		DPU_DEBUG_PLANE(pdpu, "Got clip src:" DRM_RECT_FMT " dst: " DRM_RECT_FMT "\n",
> +				DRM_RECT_ARG(&pipe_cfg->src_rect), DRM_RECT_ARG(&pipe_cfg->dst_rect));
> +
> +		/* Split wide rect into 2 rect */
> +		if ((drm_rect_width(&pipe_cfg->src_rect) > max_linewidth) ||
> +		     _dpu_plane_calc_clk(mode, pipe_cfg) > max_mdp_clk_rate) {
> +
> +			if (drm_rect_width(&pipe_cfg->src_rect) > 2 * max_linewidth) {
> +				DPU_DEBUG_PLANE(pdpu, "invalid src " DRM_RECT_FMT " line:%u\n",
> +						DRM_RECT_ARG(&pipe_cfg->src_rect), max_linewidth);
> +				return -E2BIG;
> +			}
> +
> +			memcpy(r_pipe_cfg, pipe_cfg, sizeof(struct dpu_sw_pipe_cfg));
> +			pipe_cfg->src_rect.x2 = (pipe_cfg->src_rect.x1 + pipe_cfg->src_rect.x2) >> 1;
> +			pipe_cfg->dst_rect.x2 = (pipe_cfg->dst_rect.x1 + pipe_cfg->dst_rect.x2) >> 1;
> +			r_pipe_cfg->src_rect.x1 = pipe_cfg->src_rect.x2;
> +			r_pipe_cfg->dst_rect.x1 = pipe_cfg->dst_rect.x2;
> +			DPU_DEBUG_PLANE(pdpu, "Split wide plane into:"
> +					DRM_RECT_FMT " and " DRM_RECT_FMT "\n",
> +					DRM_RECT_ARG(&pipe_cfg->src_rect),
> +					DRM_RECT_ARG(&r_pipe_cfg->src_rect));
> +		} else {
> +			memset(r_pipe_cfg, 0, sizeof(struct dpu_sw_pipe_cfg));
> +		}
>  
> -	drm_rect_rotate_inv(&pipe_cfg->src_rect,
> -			    new_plane_state->fb->width, new_plane_state->fb->height,
> -			    new_plane_state->rotation);
> -	if (drm_rect_width(&r_pipe_cfg->src_rect) != 0)
> -		drm_rect_rotate_inv(&r_pipe_cfg->src_rect,
> -				    new_plane_state->fb->width, new_plane_state->fb->height,
> +		drm_rect_rotate_inv(&pipe_cfg->src_rect,
> +				    new_plane_state->fb->width,
> +				    new_plane_state->fb->height,
>  				    new_plane_state->rotation);
>  
> +		if (drm_rect_width(&r_pipe_cfg->src_rect) != 0)
> +			drm_rect_rotate_inv(&r_pipe_cfg->src_rect,
> +					    new_plane_state->fb->width,
> +					    new_plane_state->fb->height,
> +					    new_plane_state->rotation);
> +	}
> +
>  	pstate->needs_qos_remap = drm_atomic_crtc_needs_modeset(crtc_state);
>  
>  	return 0;
> @@ -997,20 +1057,17 @@ static int dpu_plane_atomic_check_sspp(struct drm_plane *plane,
>  		drm_atomic_get_new_plane_state(state, plane);
>  	struct dpu_plane *pdpu = to_dpu_plane(plane);
>  	struct dpu_plane_state *pstate = to_dpu_plane_state(new_plane_state);
> -	struct dpu_sw_pipe *pipe = &pstate->pipe[0];
> -	struct dpu_sw_pipe *r_pipe = &pstate->pipe[1];
> -	struct dpu_sw_pipe_cfg *pipe_cfg = &pstate->pipe_cfg[0];
> -	struct dpu_sw_pipe_cfg *r_pipe_cfg = &pstate->pipe_cfg[1];
> -	int ret = 0;
> -
> -	ret = dpu_plane_atomic_check_pipe(pdpu, pipe, pipe_cfg,
> -					  &crtc_state->adjusted_mode,
> -					  new_plane_state);
> -	if (ret)
> -		return ret;
> +	struct dpu_sw_pipe *pipe;
> +	struct dpu_sw_pipe_cfg *pipe_cfg;
> +	int ret = 0, i;
>  
> -	if (drm_rect_width(&r_pipe_cfg->src_rect) != 0) {
> -		ret = dpu_plane_atomic_check_pipe(pdpu, r_pipe, r_pipe_cfg,
> +	for (i = 0; i < PIPES_PER_PLANE; i++) {
> +		pipe = &pstate->pipe[i];
> +		pipe_cfg = &pstate->pipe_cfg[i];
> +		if (!pipe->sspp)
> +			continue;
> +		DPU_DEBUG_PLANE(pdpu, "pipe %d is in use, validate it\n", i);
> +		ret = dpu_plane_atomic_check_pipe(pdpu, pipe, pipe_cfg,
>  						  &crtc_state->adjusted_mode,
>  						  new_plane_state);
>  		if (ret)
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

