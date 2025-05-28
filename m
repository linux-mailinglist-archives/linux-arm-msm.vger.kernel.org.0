Return-Path: <linux-arm-msm+bounces-59732-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B81DAC70D0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 May 2025 20:22:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8432A9E2F75
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 May 2025 18:22:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1410F28CF61;
	Wed, 28 May 2025 18:22:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SR0X2GWM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D075428DF21
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 May 2025 18:22:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748456556; cv=none; b=thux5AywwOmfDcV4dWxsSLFsAI3oM3/m6+tUxNWnmv+zCx29RMNJIRs7tv2frinLREoJRDEOYnqVwKq2xq6RMVcdlJ/LB4o2crjPtlvu99mN7wq07yI1iPqLNJjRUYg4m3PNjlIBFVpU+W2YZAtQvRGdmly4P+k2vY3A2YVRobY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748456556; c=relaxed/simple;
	bh=m2bWizstM8R2IyWJ5UZGzimLBXaHf+NXg+15yOIEsvY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uAUS4zfU0W2YxDITRjaFA+zvdZBtEtyyE4VyuDpYFDa+0Tw1jntXVaTXSoY36iBkVtvzzSb+TtgGAPEsEjHZ/ipbHGNCUbYdI+GudBpqoq1V0tmyxoglJR73tfDwB2vUw+G338Fu7R6moV75QGG0/ARB2A6pkJ/sUvztjGV+JWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SR0X2GWM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54SHuA7Y002083
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 May 2025 18:22:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=VSqQFgb0vNsBP9uzJZGqkiym
	8JmNyD9K1JA4p69RyL4=; b=SR0X2GWMZdeo5YIMfu1V5VWPXhm5fizEiLOyztxn
	Z31tpRZ5q6jNRWmaYP+x8IHw0ufMx5363oFhVUhFnrTxk/zjJSVSuVK8PnZFR5gC
	bE6BeHJJii2czVgO5uOnjNSdNYYzEjsPtxzE/32hPxmLoj4VYG44PYcu8s5p+elY
	zgT2AtngHJT+lduDoIt+ig4bjYQ1aPEZXmgHNLWTZM7Z6hBrMT0lmR45xlg6Brjd
	7uqgILGSKM7p14GZDFhBQx9fPQsMH0NfhpV6K+MQzR9m534ylmFFbY8mJVgeF1ua
	SA8D7ZH8KXzbFEpvb8Tisqc0VasR+SX0gANBDJKCvyj70A==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46u6g935p3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 May 2025 18:22:32 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4769273691dso1031851cf.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 May 2025 11:22:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748456550; x=1749061350;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VSqQFgb0vNsBP9uzJZGqkiym8JmNyD9K1JA4p69RyL4=;
        b=GlkfpFnECuEAx1aN6JyQjwDjnpBO/m5HeTuZlYVOQrwGEt6A3QgBY6dz8pViwIxGA0
         aPPTci79dMW+WWEwCP0FmqlXptOkbOYTdWXgG+Ywzk5OS6y6EqxdWxvf02FaHNXq90c0
         9Avyer9VcUjBSw0b93OsyCqoOvGs7jgLYIJb2Gw0/Vbi1Q5JGxwNITurcL+RnbgEYhyG
         M9IAL47Cxw9LMF0Xsl4PCy8+9D4ezR7j8z4wUrEEyOxEuGMuY6rMa9/IYofVFu0d9iBZ
         dXZ7xqrQHLQ9HEgquCzuJVgB5Fa5wsx6aZ12tutbHBHVI5lz2U7AoodBdpMwRArC2xgx
         6+JQ==
X-Forwarded-Encrypted: i=1; AJvYcCUMIhkc4JMCSYZ6Ju1DK3upeaYW2LJRC9AkBPOFwBRKP1DXlwv10UV4L5R2n6fW+XLrB1zfrl224WMvTmJE@vger.kernel.org
X-Gm-Message-State: AOJu0YwvgthBKlMgEQpqWthDWpjjdN3/Ny3bpZvdJDBKNw53LsyNm/CD
	I0rh8oN7amdts60ATTDAxe8+hM/i9G2fatASQpJLRWJUFn/99T4ZzYdxZbZ2thZ4qcxFEdlPrqh
	Y5j2G6p1weY1k1bvKgn2kBNHnSTWbMTS3EC2pS+uj9Yjkc+Mv3KjzC0mCRcasBly5Foy0GU/O/C
	3t
X-Gm-Gg: ASbGncsTQAQ6wgrJ7JV4qXSxUkcK/2vacjDadv1j05tYY8hH/nuzyzsv7hCsXgB7fJj
	uDqRqIyVf4J8wqvMvBLqO/I15E+b5nYlDt5969Ag77IPdKu9wtV4+R3WcsTWa8ZMaZLChXN8cG9
	nJKcFLcKQAagqsPZ4O04u4Wkc4cKRI24sXMj5qH9fgBno+ujCpi4aEbLNQrzOxipXrss2OCDG2v
	9Ky3w+bKJyiLlSWVxyG+U/78Ot0yNcoQCXkbDG5Z76qhQu3kej8botEfYTSYmw+BYf0mT/pnF0r
	5aPuBkiDV63HZz9OFHJ0BMAWDJNkyw2E/yfgccewbxzXp+5+Im9vZYIn0eseh3dBqN+CiKRcGJ8
	=
X-Received: by 2002:a05:622a:2591:b0:4a4:2c75:aa57 with SMTP id d75a77b69052e-4a42c75abf4mr42554491cf.44.1748456550325;
        Wed, 28 May 2025 11:22:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHBgHDOWO+XsRhKCVgZVBb0vNNcV9Fn1O7FSP1azZt5CGQL4wmPuRN66m2zfRg/m3rWXeXP6g==
X-Received: by 2002:a05:620a:4587:b0:7c5:61b2:b95 with SMTP id af79cd13be357-7ceecc33813mr2659680885a.30.1748456539153;
        Wed, 28 May 2025 11:22:19 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5532f69a484sm378762e87.116.2025.05.28.11.22.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 11:22:16 -0700 (PDT)
Date: Wed, 28 May 2025 21:22:15 +0300
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
Subject: Re: [PATCH v10 10/12] drm/msm/dpu: support SSPP assignment for
 quad-pipe case
Message-ID: <45hk22fdghaqnilukvqayjcbnf3btntknqrwf5ivx346vrgag3@aebzt76tkjzw>
References: <20250526-v6-15-quad-pipe-upstream-v10-0-5fed4f8897c4@linaro.org>
 <20250526-v6-15-quad-pipe-upstream-v10-10-5fed4f8897c4@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250526-v6-15-quad-pipe-upstream-v10-10-5fed4f8897c4@linaro.org>
X-Authority-Analysis: v=2.4 cv=d4b1yQjE c=1 sm=1 tr=0 ts=68375468 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=sWKEhP36mHoA:10 a=KKAkSRfTAAAA:8 a=giFwS8THduiqBY6JDEUA:9
 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: MyRVo0RX5qYg-5eSeRsR0Qcoo4BeaX_6
X-Proofpoint-GUID: MyRVo0RX5qYg-5eSeRsR0Qcoo4BeaX_6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI4MDE2MCBTYWx0ZWRfX2UlO0ijgvhJQ
 uBJBYJWYZuINcWHNDxDhS1OSQeike47Y/vQBQNEFuMDzU0G07HlfPNrs+5bge1FtRLyXXMtKi9R
 wVEfOCwCohVVI7LSMGgidsY6Vp2JHmsi96bJ+1kQhtIEt8f4CboIvuWcZ0rh/tFYg/XDJ5AdcsN
 1V6G66A7l/NDj0mEG9W0HRdi3nwZ+rvUXe/2eYGd5bsKtgPOHagFJYMWZZCdW2DRGJe3MwOdAm+
 A0QPkR7tsVetMbHWGnQiZ73rQXxr/MWoutESRTuttrvHG713DEIryaXxl8ZKQKK3waGmYrXNxQm
 JeoO7aUO7RTSZV82JXVfYVhH4JHYeOakVEYKmdYoNkzZ1r3mTxQCQLgQbtZHmjLorhuHDk8ewZw
 olXV9UcaAGE+oXFaPzQdlqp1t+V48C8TRpT2NAaQ6MsKqZyB+Ntope6pYCvoLyXtm/20cEBP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-28_09,2025-05-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 malwarescore=0 phishscore=0 mlxlogscore=999
 lowpriorityscore=0 priorityscore=1501 bulkscore=0 spamscore=0 clxscore=1015
 impostorscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505280160

On Mon, May 26, 2025 at 05:28:28PM +0800, Jun Nie wrote:
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
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c  |  11 +++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h  |   2 +
>  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 126 ++++++++++++++++++------------
>  3 files changed, 88 insertions(+), 51 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> index 85f585206218f4578e18b00452762dbada060e9c..47ab43dfec76acc058fb275d1928603e8e8e7fc6 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> @@ -1562,6 +1562,17 @@ int dpu_crtc_vblank(struct drm_crtc *crtc, bool en)
>  	return 0;
>  }
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
>  #ifdef CONFIG_DEBUG_FS
>  static int _dpu_debugfs_status_show(struct seq_file *s, void *data)
>  {
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
> index 94392b9b924546f96e738ae20920cf9afd568e6b..6eaba5696e8e6bd1246a9895c4c8714ca6589b10 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
> @@ -267,4 +267,6 @@ static inline enum dpu_crtc_client_type dpu_crtc_get_client_type(
>  
>  void dpu_crtc_frame_event_cb(struct drm_crtc *crtc, u32 event);
>  
> +unsigned int dpu_crtc_get_num_lm(const struct drm_crtc_state *state);
> +
>  #endif /* _DPU_CRTC_H_ */
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> index 0bb153a71353ca9eaca138ebbee4cd699414771d..f721dc504bbbe3a49986239adee113bfb6790f70 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> @@ -961,6 +961,33 @@ static int dpu_plane_is_multirect_parallel_capable(struct dpu_hw_sspp *sspp,
>  		dpu_plane_is_parallel_capable(pipe_cfg, fmt, max_linewidth);
>  }
>  
> +static bool dpu_plane_check_single_pipe(struct dpu_plane_state *pstate,
> +					struct dpu_sw_pipe **single_pipe,
> +					struct dpu_sw_pipe_cfg **single_pipe_cfg,
> +					bool config_pipe)
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

If this function is 'check', then why does it change something in the
pipe configuration?

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
> +	if (!dpu_plane_check_single_pipe(pstate, &pipe, &pipe_cfg, true))
> +		return false;
> +
> +	if (!dpu_plane_check_single_pipe(prev_adjacent_pstate, &prev_pipe, &prev_pipe_cfg, false) ||
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
> @@ -1194,12 +1216,11 @@ static int dpu_plane_virtual_assign_resources(struct drm_crtc *crtc,
>  	struct dpu_kms *dpu_kms = _dpu_plane_get_kms(plane);
>  	struct dpu_rm_sspp_requirements reqs;
>  	struct dpu_plane_state *pstate, *prev_adjacent_pstate;
> -	struct dpu_sw_pipe *pipe;
> -	struct dpu_sw_pipe *r_pipe;
> -	struct dpu_sw_pipe_cfg *pipe_cfg;
> -	struct dpu_sw_pipe_cfg *r_pipe_cfg;
> +	struct dpu_sw_pipe *pipe, *r_pipe;
> +	struct dpu_sw_pipe_cfg *pipe_cfg, *r_pipe_cfg;
> +	struct dpu_plane *pdpu = to_dpu_plane(plane);
>  	const struct msm_format *fmt;
> -	int i;
> +	int i, num_lm, stage_id, num_stages;
>  
>  	if (plane_state->crtc)
>  		crtc_state = drm_atomic_get_new_crtc_state(state,
> @@ -1209,11 +1230,6 @@ static int dpu_plane_virtual_assign_resources(struct drm_crtc *crtc,
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
> @@ -1227,44 +1243,52 @@ static int dpu_plane_virtual_assign_resources(struct drm_crtc *crtc,
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
> +	if (prev_adjacent_pstate &&
> +	    dpu_plane_try_multirect_shared(pstate, prev_adjacent_pstate, fmt,
> +					    dpu_kms->catalog->caps->max_linewidth)) {
> +		goto assigned;
> +	}
>  
> -			r_pipe->sspp = NULL;
> +	num_lm = dpu_crtc_get_num_lm(crtc_state);
> +	num_stages = (num_lm + 1) / 2;
> +	for (stage_id = 0; stage_id < num_stages; stage_id++) {

Can't we just loop through all possible stages? Same result, but makes
the logic somewhat easier.

> +		for (i = stage_id * PIPES_PER_STAGE; i < (stage_id + 1) * PIPES_PER_STAGE; i++) {

I still really don't like this idea (and especially the part with
(i % PIPES_PER_STAGE == 0) condition). Extract current code which deals
with two planes and a single stage. Call it for each stage. That's it.

> +			pipe = &pstate->pipe[i];
> +			pipe_cfg = &pstate->pipe_cfg[i];
>  
> -			pipe->multirect_index = DPU_SSPP_RECT_SOLO;
> -			pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
> +			if (drm_rect_width(&pipe_cfg->src_rect) == 0)
> +				break;
>  
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
> +			pipe->sspp = dpu_rm_reserve_sspp(&dpu_kms->rm, global_state, crtc, &reqs);
> +			if (!pipe->sspp)
>  				return -ENODEV;
>  
> -			pipe->multirect_index = DPU_SSPP_RECT_SOLO;
> -			pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
> -
> -			r_pipe->multirect_index = DPU_SSPP_RECT_SOLO;
> -			r_pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
> +			r_pipe = &pstate->pipe[i + 1];
> +			r_pipe_cfg = &pstate->pipe_cfg[i + 1];
> +
> +			/*
> +			 * If current pipe is the first pipe in pipe pair, check
> +			 * multi-rect opportunity for the 2nd pipe in the pair.
> +			 * SSPP multi-rect mode cross mixer pairs is not supported.
> +			 */
> +			if ((i % PIPES_PER_STAGE == 0) &&
> +			    drm_rect_width(&r_pipe_cfg->src_rect) != 0 &&
> +			    dpu_plane_try_multirect_parallel(pipe, pipe_cfg, r_pipe, r_pipe_cfg,
> +							      pipe->sspp,
> +							      msm_framebuffer_format(plane_state->fb),
> +							      dpu_kms->catalog->caps->max_linewidth)) {
> +				i++;
> +			} else {
> +				/* multirect is not possible, use two SSPP blocks */
> +				pipe->multirect_index = DPU_SSPP_RECT_SOLO;
> +				pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
> +				DPU_DEBUG_PLANE(pdpu, "allocating sspp_%d for pipe %d.\n",
> +						pipe->sspp->idx - SSPP_NONE, i);
> +			}
>  		}
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

