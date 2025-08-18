Return-Path: <linux-arm-msm+bounces-69618-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id AB946B2B42D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Aug 2025 00:41:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4E4D37AB92D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Aug 2025 22:40:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7DD0F265632;
	Mon, 18 Aug 2025 22:41:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jiiOGsUi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AE1C223DD1
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 Aug 2025 22:41:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755556890; cv=none; b=ootLX/jC7dYGp/tzc0OYEuHHqUhyyCBzIbP4+l7itmvjgXA0+oI5L5ihW6oUkJHMuxp9Pa7yPnPyFJxVwEsWBkhgIPla/9xO5fAshUuU565PQQ+QdCSlzojLJOdslkkshjQhV+nGzSnfGxbxlhINSsMrwdTnuHJKXxbaaeBarYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755556890; c=relaxed/simple;
	bh=rBFZr1nKLCM/xAt0ecebyX8Bifk6mm8EEy36e94vBUg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Yp4lDHEXdW46muWW/TxooHRlcA/YaSJLI+JFNHYv89txzoUNNjwP6LmECtbXWwMmV5YXyzX1XG8xjy0XGOuoaEfTtIMbOIaSw3wdD1d5SCTAMoJKz0AQe2cgrVghSSZsBWjt5/E+3puM7BfFEidwxOkpA//bSLyeCT2ISWQTe2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jiiOGsUi; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57IEbGoq029100
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 Aug 2025 22:41:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7P/JHJKLT9w4c6lzg9KOPNMGpcYpg8DaqFdOyPWwpPQ=; b=jiiOGsUiBDs9aTUT
	g2mohKSTkC5RAgLbJVO7EVvibN7c5DwGL1P50hFvyyzxbBSzqAYgPd5/9svYa/R2
	eyI7hpOXw1iHFDxHBgKwTUUlozTd3hNeCFvUHzjGFFitawJC/vTF8ZZC0XzBFmPc
	OJmEE05Iwo40VLx/xiG8h0QGAOEKffKs5sRPfncmVa5f0ZUVaRQfEbY3Y0dfj4vA
	z7msHh99bcGu+OqhC1KL2vQcFqMbEcn0bS7vWbap9Tcw27z45Xl3guszDmknuQ7t
	QRM4FLI82HN30gxIBcIr8ac6y03AZBdklw7pCyn966e5y9A0Y1lGB2yyfT4feaQl
	gGOrPQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48jj2uefty-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 Aug 2025 22:41:27 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-76e2e614e73so4481351b3a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 Aug 2025 15:41:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755556886; x=1756161686;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7P/JHJKLT9w4c6lzg9KOPNMGpcYpg8DaqFdOyPWwpPQ=;
        b=R9EHiAFjBzfSE+EEn9XhtdUDoppF1WOf/qStGhOrHSR21U9aCpS3b2pEXWxLRGLHCo
         2mE//qVDZOnun9qBqmVwpuAGT5Xf5A0YYvyg4NkWZej++AJilQTwOWeN++5zTn6PZO1o
         X0GSA9ltMWiOXZD8pxvYXZpUF8QvGyBWbfup/EJOW1gg1zX7K7kJTY6Fy6BuHdQ3YPeQ
         YznCGVJToP5bnxmSU2zjm9mv7ScluW7DX4YOMtdVe6ytR8WuqVh7LWleC3a2xvG+6vlW
         l0aKSp1smOpD/emdaJEBwp0s+IrhAq6A6XJ5FQWw9DcCJ7aZ4rUh5OzQfYSLprgs/1wm
         b0Zg==
X-Gm-Message-State: AOJu0Yz2EwRMQlwdHOFXc7cdF2qyvgbSpxDE4qkw+VlDMyYmuT34AZjU
	IxyG/is4CazPRu17XHX1TaH0nA/ARw3rzxopxFEOBr/n79BFSHsj5U3r964yXppcNcUsIcx8fg7
	XQpYRTCUnZqHjPVXVMtqPsFv/auuoO03mTyj6yX51zsf8qvREJ8M+p6cxQ6p/+EOrIiQbkjxRBd
	26
X-Gm-Gg: ASbGncuQp0V+MeV+zELhym1TcCTS17ugekmtba9ZhQBlw5lXQeYsEKuCgwM2NW5INkN
	TMM9Al/4kclICpGbSfRRnTjzfd0/qyDuqpCq1vAQGF3n6yiv8zoXEAuSrhLnomIqtU3cEpgKI/R
	MaS6XQe6F+iZzBiTjoYETgxWNeNpvPYA7RpDv5MMcOgVc9YHD/sWosmAkdmsf0WRCaaVC1NI8vZ
	wKcwOZIcJANM7aQUQrGX4j6m5H8bH2ccBGSqEIBir1AAiCXmZdO3LCyqJ64bdFizgWN7wCJMYhY
	Kgt3TwmVisSTjlEoMpfdlIwUCuLhR7GYSBytCfWI9MlqUxnStnDnisqh8VFaxj4Omcxh24NdUOo
	M9M/WROIuK/+24R3NoGYhgg==
X-Received: by 2002:a05:6a20:9183:b0:240:fe4:10f9 with SMTP id adf61e73a8af0-2430d315743mr385151637.6.1755556885715;
        Mon, 18 Aug 2025 15:41:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGhv1KT0N/Yb9OEQp3gwas5QRRgVZWFG8QHg4nd7jQThmfu3uXvpF4Li5SELrsXFL/a80H9lw==
X-Received: by 2002:a05:6a20:9183:b0:240:fe4:10f9 with SMTP id adf61e73a8af0-2430d315743mr385121637.6.1755556885200;
        Mon, 18 Aug 2025 15:41:25 -0700 (PDT)
Received: from [10.134.71.99] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b475095ef3bsm1262674a12.46.2025.08.18.15.41.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Aug 2025 15:41:24 -0700 (PDT)
Message-ID: <f39c4cc4-d5b1-4c7e-9843-f54e4846feac@oss.qualcomm.com>
Date: Mon, 18 Aug 2025 15:41:21 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v14 12/13] drm/msm/dpu: support plane splitting in
 quad-pipe case
To: Jun Nie <jun.nie@linaro.org>, Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250801-v6-16-rc2-quad-pipe-upstream-v14-0-b626236f4c31@linaro.org>
 <20250801-v6-16-rc2-quad-pipe-upstream-v14-12-b626236f4c31@linaro.org>
Content-Language: en-US
From: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
In-Reply-To: <20250801-v6-16-rc2-quad-pipe-upstream-v14-12-b626236f4c31@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=MJ9gmNZl c=1 sm=1 tr=0 ts=68a3ac17 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=sWKEhP36mHoA:10 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=0jnu4QEfhkydoQV895IA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: sRDG88fd4OGylsit132StxGpiM1HZXzf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE2MDAzMSBTYWx0ZWRfX/BpXLo5k4bpF
 Bh2clo9ZJ94+tHrol9/dnbWjuSFJapuTRT1Z7KBHT9mxK6OCt3OWJD5YQ/pCP/XRs5yckcGzAyN
 scMRlJTR6I5A3efM9TGWREuqTRO0Al5CPYxPKFytVAzi5UGuLVzh2Vxch3vR8qzqnir92/ML2k8
 d9+SLYv/XMknozY6ZAZ+vIEE5H50iWmYOJXQM5zjAVXGPevcHbm4FLwOWYGLAfH1qb5Dbyvvb8z
 XKAiOvwVbuB3dSu2YCRq/AZMHd2vzxUdGSW1tedjvMaL30REBnNMmd68e724dFn+sVHywfU4Ujl
 T+Y4ldCoesk+xWFtQBuSLYx/5SoetNUlq+0186w2VmC3h2p/ZRtRXIWIeO3mEiY9Cc9Z1uQRfd0
 ZKoETP7Q
X-Proofpoint-GUID: sRDG88fd4OGylsit132StxGpiM1HZXzf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-18_06,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 phishscore=0 bulkscore=0 malwarescore=0
 spamscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508160031



On 8/1/2025 8:07 AM, Jun Nie wrote:
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

Reviewed-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>

> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c  |  11 +++
>   drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h  |   2 +
>   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 137 +++++++++++++++++++++---------
>   3 files changed, 110 insertions(+), 40 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> index c7dc5b47ae18ebd78de30d2a0605caa7dd547850..1c7a5e545745320018c3e9a2d163cbfd3dceaf7b 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> @@ -1592,6 +1592,17 @@ int dpu_crtc_vblank(struct drm_crtc *crtc, bool en)
>   	return 0;
>   }
>   
> +/**
> + * dpu_crtc_get_num_lm - Get mixer number in this CRTC pipeline
> + * @state: Pointer to drm crtc state object
> + */
> +unsigned int dpu_crtc_get_num_lm(const struct drm_crtc_state *state)
> +{
> +	struct dpu_crtc_state *cstate = to_dpu_crtc_state(state);
> +
> +	return cstate->num_mixers;
> +}
> +
>   #ifdef CONFIG_DEBUG_FS
>   static int _dpu_debugfs_status_show(struct seq_file *s, void *data)
>   {
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
> index 94392b9b924546f96e738ae20920cf9afd568e6b..6eaba5696e8e6bd1246a9895c4c8714ca6589b10 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
> @@ -267,4 +267,6 @@ static inline enum dpu_crtc_client_type dpu_crtc_get_client_type(
>   
>   void dpu_crtc_frame_event_cb(struct drm_crtc *crtc, u32 event);
>   
> +unsigned int dpu_crtc_get_num_lm(const struct drm_crtc_state *state);
> +
>   #endif /* _DPU_CRTC_H_ */
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> index 9671af9620037b5c341e404bb3b2fc21696ce79e..1cd3d04b1d1b10cf803090c080e54611d943c053 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> @@ -824,8 +824,12 @@ static int dpu_plane_atomic_check_nosspp(struct drm_plane *plane,
>   	struct dpu_plane_state *pstate = to_dpu_plane_state(new_plane_state);
>   	struct dpu_sw_pipe_cfg *pipe_cfg;
>   	struct dpu_sw_pipe_cfg *r_pipe_cfg;
> +	struct dpu_sw_pipe_cfg init_pipe_cfg;
>   	struct drm_rect fb_rect = { 0 };
> +	const struct drm_display_mode *mode = &crtc_state->adjusted_mode;
>   	uint32_t max_linewidth;
> +	u32 num_lm;
> +	int stage_id, num_stages;
>   
>   	min_scale = FRAC_16_16(1, MAX_UPSCALE_RATIO);
>   	max_scale = MAX_DOWNSCALE_RATIO << 16;
> @@ -848,13 +852,10 @@ static int dpu_plane_atomic_check_nosspp(struct drm_plane *plane,
>   		return -EINVAL;
>   	}
>   
> -	/* move the assignment here, to ease handling to another pairs later */
> -	pipe_cfg = &pstate->pipe_cfg[0];
> -	r_pipe_cfg = &pstate->pipe_cfg[1];
> -	/* state->src is 16.16, src_rect is not */
> -	drm_rect_fp_to_int(&pipe_cfg->src_rect, &new_plane_state->src);
> +	num_lm = dpu_crtc_get_num_lm(crtc_state);
>   
> -	pipe_cfg->dst_rect = new_plane_state->dst;
> +	/* state->src is 16.16, src_rect is not */
> +	drm_rect_fp_to_int(&init_pipe_cfg.src_rect, &new_plane_state->src);
>   
>   	fb_rect.x2 = new_plane_state->fb->width;
>   	fb_rect.y2 = new_plane_state->fb->height;
> @@ -879,35 +880,94 @@ static int dpu_plane_atomic_check_nosspp(struct drm_plane *plane,
>   
>   	max_linewidth = pdpu->catalog->caps->max_linewidth;
>   
> -	drm_rect_rotate(&pipe_cfg->src_rect,
> +	drm_rect_rotate(&init_pipe_cfg.src_rect,
>   			new_plane_state->fb->width, new_plane_state->fb->height,
>   			new_plane_state->rotation);
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
>   		}
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
>   				    new_plane_state->rotation);
>   
> +		if (drm_rect_width(&r_pipe_cfg->src_rect) != 0)
> +			drm_rect_rotate_inv(&r_pipe_cfg->src_rect,
> +					    new_plane_state->fb->width,
> +					    new_plane_state->fb->height,
> +					    new_plane_state->rotation);
> +	}
> +
>   	pstate->needs_qos_remap = drm_atomic_crtc_needs_modeset(crtc_state);
>   
>   	return 0;
> @@ -984,20 +1044,17 @@ static int dpu_plane_atomic_check_sspp(struct drm_plane *plane,
>   		drm_atomic_get_new_plane_state(state, plane);
>   	struct dpu_plane *pdpu = to_dpu_plane(plane);
>   	struct dpu_plane_state *pstate = to_dpu_plane_state(new_plane_state);
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
>   						  &crtc_state->adjusted_mode,
>   						  new_plane_state);
>   		if (ret)
> 


