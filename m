Return-Path: <linux-arm-msm+bounces-66060-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 67A6EB0D8DD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Jul 2025 14:04:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6B6B87A7EC7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Jul 2025 12:03:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 359242E2EFF;
	Tue, 22 Jul 2025 12:04:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iHpK7gm0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D4802E1C4E
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Jul 2025 12:04:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753185865; cv=none; b=G81PJ8RAMj1YFMbltKDqk76SK/jVkl32vbIw3HYlhuYXysLpHNjJ1pWx/H382V9aiRmwoKBHC6C06LAfVFcc2gG7r2GXVNWblxebTmKKA6zH+hQgBCz7I6ueeBPDpgMmOdEemuUJrqXT32jUmsPTNqqp5lQwOO4GTvFryCitWDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753185865; c=relaxed/simple;
	bh=w5eOi1dZCOz5BoRdHIIAPqoVyn6NH5m8G7Ay3W5vMlA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SdE53sQwSss8lXkFWruPW5qP+Urku840j8jgKFdXIrF3tVP//gX/GBBbSq9WiAYkmX/siQe6sT/U1biCUtsj2bHo0nVfXuFeYrhqsBpOdspO+/xMiJz0vrDCVGNFPU3dvpqUBUtRhrJujTfkEEWaaE60HnSJXh3sv0ZhozoZeIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iHpK7gm0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56M78AF4009627
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Jul 2025 12:04:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+XG90C/um6yxXD5+3AqDRLT4qWkqNRjAHgyLRjePWmw=; b=iHpK7gm01yqL68ho
	w6aYJlpsBxQGMZxx07WGAIQDw6Pi1yVgXo2GVTyHu+NIzq2acs18/7n1qPRZaXmt
	EPOBGNJ/rey0N22VULsXpgGZGucedm6UabuVM4SN9EEm7B80jBpQKOU0nA1mUfwE
	lTKkLsGqehH1c8jqLamXg2h3Uy/X5LoauF1mRy9IQC3iKLXaJGGxfBRpdDtyu7/+
	GwQ2NPAuhTTGpp2oJ7pM5N+80YPNfmRv75DCSlTEugFwWdm79R7jfVHn06Tb0g0R
	u4tMjMVmeFV7gQaTXPjMzigGSuPBs3OKtpEY92SkuRzwN2YvqDTdJL+OVM/sjxpZ
	2XQvqQ==
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48045vynuw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Jul 2025 12:04:21 +0000 (GMT)
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-41b398d3704so4993690b6e.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Jul 2025 05:04:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753185861; x=1753790661;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+XG90C/um6yxXD5+3AqDRLT4qWkqNRjAHgyLRjePWmw=;
        b=ZtQxXZrHHxltl20DmYAR/henmqH1Zkw+84PeEiLmMSG7sagRdglDMeeis7SpLcQhm6
         +FdAxR/MbEwIy4ZLlrRRZGZkJspqsWmzUoTmbp0qlpHA2OLjeWfAY31EdzwS9j4UrRCi
         0flVDxSJV3b3AZhF+K8z/x33JFHWSobB/W8s5YnJWRDMgzqrtXOZRQD9CWRHT+252JJi
         WESgi53hPEzFJqE2Rt0Qt34l3F7e95JSd+U3hus565r9rTVOSfbuchOYAwl/w05UGcIE
         NBW6z0bSHQUNNa6IyK0SYQbURb8FIMbSM3Px7o4X90GleB9laYDDA6jjFKb82nrO19LU
         S4Dw==
X-Forwarded-Encrypted: i=1; AJvYcCUY4qDU+XdG1MY1FWbZk1xLKQGCLd6NseIaaeBues4Er2tiTFjrR/tYsPwmlFaa92Vj5x18ErJeB0C3hE8A@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5aCPUd/1/dRdMZN4pUgATf7PTxh5fKwDpJz9Gu6DK8DXh8Rn/
	Iy3KiHnf8hq9PPGtGOtOzuKNYIMe6UwB8xrbZcd6ly5keT44uVPU0Nke2iGKU5z8PCTYFi6i9lP
	6YgGRLd3C+pSRQCRzS9gyQKFtuUF/Ad1fMpzqaU++MOv7qYU3yYzX46jhVTRqpNZcvCIR
X-Gm-Gg: ASbGncvNcKKOt/ll8DhnDv1iKV7n/XF5kxOLJWdIGDAjqpfZvvjo2nL9zAI+x5Gu1DK
	mf38BKmbUVQugLogv+ku9fz/KhjMQSxATM95BJywOcwVkzpJNNYWA4fhbn/UU0XkVz7zjqK3hWA
	t1UQ0qrgG94wKlMVAN8HRkFHHGl8/QLPTI6/s1RmOqUdqTWcRg2DHVoYOwAgtXSmjqqe58d2++/
	2nlH68B18Afzq4N2GRJzbR0jn5gNo2xKGGY6PkfIS6zSuxkFKk0dEkNcjKcanJgoK6NUv0W+9rf
	NV3mMuzG/Gq+3k7oAQYE7f9V+4QL3NG1YHjC7M207QleCbJknpgWmsqgD3XFB0k4/ckL2/wuyzJ
	BOL78GUrnvmfu82ebdzGyjDjhty5AvSSH+kKMU6G3LSl+KdCRwvZ+
X-Received: by 2002:a05:6808:2384:b0:407:59ac:d73f with SMTP id 5614622812f47-41cefe09d5cmr17438878b6e.21.1753185860641;
        Tue, 22 Jul 2025 05:04:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEtOpeAIrEejTxoISQ16qIfCCckK6NW452J8VXPtxZ/pM+GeGglMjw99eFXvizXAXL3yitDqg==
X-Received: by 2002:a05:6808:2384:b0:407:59ac:d73f with SMTP id 5614622812f47-41cefe09d5cmr17438811b6e.21.1753185860015;
        Tue, 22 Jul 2025 05:04:20 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55a31d7c6dcsm1937261e87.101.2025.07.22.05.04.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Jul 2025 05:04:19 -0700 (PDT)
Date: Tue, 22 Jul 2025 15:04:16 +0300
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
Message-ID: <bxual3dbzffgbe6vziwumaqpyxrnjbvnljy2pg2o5mtgixufbm@mjvg5em2xklf>
References: <20250707-v6-16-rc2-quad-pipe-upstream-v12-0-67e3721e7d83@linaro.org>
 <20250707-v6-16-rc2-quad-pipe-upstream-v12-10-67e3721e7d83@linaro.org>
 <khu6gwzn7gulubwoshdutl4d2nu3c6exnkv4cimjljc5wbxf7l@ho4gxsolq3hn>
 <CABymUCPhjugvyQ2KQabjTn3XNEDRSnQgRX5te-tHKT8hBLPdMQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CABymUCPhjugvyQ2KQabjTn3XNEDRSnQgRX5te-tHKT8hBLPdMQ@mail.gmail.com>
X-Authority-Analysis: v=2.4 cv=LL1mQIW9 c=1 sm=1 tr=0 ts=687f7e46 cx=c_pps
 a=WJcna6AvsNCxL/DJwPP1KA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Wb1JkmetP80A:10 a=sWKEhP36mHoA:10 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=S6PJxlnTzXtoPlSZMcIA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=_Y9Zt4tPzoBS9L09Snn2:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: mu6qNV9l4lnumN2iv5BpmEcLsxgtvd4G
X-Proofpoint-ORIG-GUID: mu6qNV9l4lnumN2iv5BpmEcLsxgtvd4G
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIyMDA5OCBTYWx0ZWRfX617Cyqv/xnfI
 n0oySrYCKsZ4E5Fmwtqjn/y4AYxSOfBMn+6gWslTXsk/CMbVf991HK9co8lcuHnGZFsefGB823L
 8ivOkzNcPbhFmkr2qh2/n0tlwscIlRYE2z286PhykBqAzTYD/RCmxQblqio1Yky8S8JuOZmIIKR
 S45z3BQpb/pdV+AJnPnPzSOq7fv0Xh3fVh9UHd6K5QjJH2BJAyLUSMWd0Le9dWgduLN3/o5Ff8b
 aC5s1yJMIbU2fq8MwQE4TiR2xYem76Pan3i7M9otIJdZp5Q1YnLoe7VBsrG0T7DpPXPCZv2pSav
 7QiAfcAm4XYAK0xOispLEhZW+P7sjt1N2dBHSuSx29KVyRWbXkiBuMWbbtr365zAIZbAaPv/oPK
 RQ9fxeZVNocN7e3CkJmnwjtMjEYVTQckh64YMfaXeHVbIYnOLXSUTvr8nCPnVj/HueY/qxOi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-22_02,2025-07-21_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 mlxlogscore=999 clxscore=1015 mlxscore=0 adultscore=0
 suspectscore=0 spamscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 lowpriorityscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507220098

On Mon, Jul 21, 2025 at 04:06:13PM +0800, Jun Nie wrote:
> Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> 于2025年7月19日周六 18:09写道：
> >
> > On Mon, Jul 07, 2025 at 02:18:05PM +0800, Jun Nie wrote:
> > > Currently, SSPPs are assigned to a maximum of two pipes. However,
> > > quad-pipe usage scenarios require four pipes and involve configuring
> > > two stages. In quad-pipe case, the first two pipes share a set of
> > > mixer configurations and enable multi-rect mode when certain
> > > conditions are met. The same applies to the subsequent two pipes.
> > >
> > > Assign SSPPs to the pipes in each stage using a unified method and
> > > to loop the stages accordingly.
> > >
> > > Signed-off-by: Jun Nie <jun.nie@linaro.org>
> > > ---
> > >  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 143 +++++++++++++++++++-----------
> > >  1 file changed, 89 insertions(+), 54 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> > > index 149e7066480b07f9f6d422748d89ffd6f9416f33..ecfebf7a2406d65930075cc2a4b8a8a7d40b3d3c 100644
> > > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> > > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> > > @@ -954,6 +954,30 @@ static int dpu_plane_is_multirect_parallel_capable(struct dpu_hw_sspp *sspp,
> > >               dpu_plane_is_parallel_capable(pipe_cfg, fmt, max_linewidth);
> > >  }
> > >
> > > +static bool dpu_plane_get_single_pipe(struct dpu_plane_state *pstate,
> > > +                                   struct dpu_sw_pipe **single_pipe,
> > > +                                   struct dpu_sw_pipe_cfg **single_pipe_cfg,
> > > +                                   int *stage_index)
> > > +{
> > > +     int stage_idx, pipe_idx, i, valid_pipe = 0;
> > > +
> > > +     for (stage_idx = 0; stage_idx < STAGES_PER_PLANE; stage_idx++) {
> > > +             for (i = 0; i < PIPES_PER_STAGE; i++) {
> > > +                     pipe_idx = stage_idx * PIPES_PER_STAGE + i;
> > > +                     if (drm_rect_width(&pstate->pipe_cfg[pipe_idx].src_rect) != 0) {
> > > +                             valid_pipe++;
> > > +                             if (valid_pipe > 1)
> > > +                                     return false;
> > > +
> > > +                             *single_pipe = &pstate->pipe[pipe_idx];
> > > +                             *single_pipe_cfg = &pstate->pipe_cfg[pipe_idx];
> > > +                             *stage_index = stage_idx;
> > > +                     }
> > > +             }
> > > +     }
> > > +
> > > +     return valid_pipe == 1;
> > > +}
> > >
> > >  static int dpu_plane_atomic_check_sspp(struct drm_plane *plane,
> > >                                      struct drm_atomic_state *state,
> > > @@ -1021,18 +1045,23 @@ static int dpu_plane_try_multirect_shared(struct dpu_plane_state *pstate,
> > >                                         const struct msm_format *fmt,
> > >                                         uint32_t max_linewidth)
> > >  {
> > > -     struct dpu_sw_pipe *pipe = &pstate->pipe[0];
> > > -     struct dpu_sw_pipe *r_pipe = &pstate->pipe[1];
> > > -     struct dpu_sw_pipe_cfg *pipe_cfg = &pstate->pipe_cfg[0];
> > > -     struct dpu_sw_pipe *prev_pipe = &prev_adjacent_pstate->pipe[0];
> > > -     struct dpu_sw_pipe_cfg *prev_pipe_cfg = &prev_adjacent_pstate->pipe_cfg[0];
> > > +     struct dpu_sw_pipe *pipe, *prev_pipe;
> > > +     struct dpu_sw_pipe_cfg *pipe_cfg, *prev_pipe_cfg;
> > >       const struct msm_format *prev_fmt = msm_framebuffer_format(prev_adjacent_pstate->base.fb);
> > > +     int stage_index, prev_stage_index;
> > >       u16 max_tile_height = 1;
> > >
> > > -     if (prev_adjacent_pstate->pipe[1].sspp != NULL ||
> > > +     if (!dpu_plane_get_single_pipe(pstate, &pipe, &pipe_cfg, &stage_index))
> > > +             return false;
> > > +
> > > +     if (!dpu_plane_get_single_pipe(prev_adjacent_pstate, &prev_pipe,
> > > +                                    &prev_pipe_cfg, &prev_stage_index) ||
> > >           prev_pipe->multirect_mode != DPU_SSPP_MULTIRECT_NONE)
> > >               return false;
> > >
> > > +     if (stage_index != prev_stage_index)
> > > +             return false;
> >
> > This should be handled other way around: save N pstates and then loop
> > over stage indices. If there is no rect at the corresponding stage for a
> > plane, skip assignment (and use prev_adjacent_pstate for the next plane).
> 
> You mean dpu_plane_virtual_assign_resources() shall notify its caller
> dpu_assign_plane_resources() to skip updating prev_adjacent_plane_state
> if dpu_plane_try_multirect_shared() return false? If so, we can add an
> argument "bool pipe_shared" in dpu_plane_virtual_assign_resources() to
> get the status. But that is an optimization to share pipes across multiple
> planes. Can we add new patches based on current patch set later?
> 
> Or my understanding is not aligned with your thoughts?

Not quite. I think we need to store all NUM_STAGES 'prev_adjancent' states and
update them as the driver loops through the stages for each plane.

> 
> - Jun
> >
> > > +
> > >       if (!dpu_plane_is_multirect_capable(pipe->sspp, pipe_cfg, fmt) ||
> > >           !dpu_plane_is_multirect_capable(prev_pipe->sspp, prev_pipe_cfg, prev_fmt))
> > >               return false;
> > > @@ -1043,11 +1072,6 @@ static int dpu_plane_try_multirect_shared(struct dpu_plane_state *pstate,
> > >       if (MSM_FORMAT_IS_UBWC(prev_fmt))
> > >               max_tile_height = max(max_tile_height, prev_fmt->tile_height);
> > >
> > > -     r_pipe->multirect_index = DPU_SSPP_RECT_SOLO;
> > > -     r_pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
> > > -
> > > -     r_pipe->sspp = NULL;
> > > -
> > >       if (dpu_plane_is_parallel_capable(pipe_cfg, fmt, max_linewidth) &&
> > >           dpu_plane_is_parallel_capable(prev_pipe_cfg, prev_fmt, max_linewidth) &&
> > >           (pipe_cfg->dst_rect.x1 >= prev_pipe_cfg->dst_rect.x2 ||
> > > @@ -1176,6 +1200,44 @@ static int dpu_plane_virtual_atomic_check(struct drm_plane *plane,
> > >       return 0;
> > >  }
> > >
> > > +static int dpu_plane_assign_resource_in_stage(struct dpu_sw_pipe *pipe,
> > > +                                           struct dpu_sw_pipe_cfg *pipe_cfg,
> > > +                                           struct drm_plane_state *plane_state,
> > > +                                           struct dpu_global_state *global_state,
> > > +                                           struct drm_crtc *crtc,
> > > +                                           struct dpu_rm_sspp_requirements *reqs)
> > > +{
> > > +     struct drm_plane *plane = plane_state->plane;
> > > +     struct dpu_kms *dpu_kms = _dpu_plane_get_kms(plane);
> > > +     struct dpu_sw_pipe *r_pipe = pipe + 1;
> > > +     struct dpu_sw_pipe_cfg *r_pipe_cfg = pipe_cfg + 1;
> > > +
> > > +     if (drm_rect_width(&pipe_cfg->src_rect) != 0) {
> > > +             pipe->sspp = dpu_rm_reserve_sspp(&dpu_kms->rm, global_state, crtc, reqs);
> > > +             if (!pipe->sspp)
> > > +                     return -ENODEV;
> > > +     }
> > > +
> > > +     if (drm_rect_width(&r_pipe_cfg->src_rect) != 0 &&
> > > +         dpu_plane_try_multirect_parallel(pipe, pipe_cfg, r_pipe, r_pipe_cfg,
> > > +                                           pipe->sspp,
> > > +                                           msm_framebuffer_format(plane_state->fb),
> > > +                                           dpu_kms->catalog->caps->max_linewidth)) {
> > > +             goto stage_assinged;
> > > +     }
> > > +
> > > +     if (drm_rect_width(&r_pipe_cfg->src_rect) != 0) {
> > > +             r_pipe->sspp = dpu_rm_reserve_sspp(&dpu_kms->rm, global_state, crtc, reqs);
> > > +             if (!r_pipe->sspp)
> > > +                     return -ENODEV;
> > > +             r_pipe->multirect_index = DPU_SSPP_RECT_SOLO;
> > > +             r_pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
> > > +     }
> > > +
> > > +stage_assinged:
> > > +     return 0;
> > > +}
> > > +
> > >  static int dpu_plane_virtual_assign_resources(struct drm_crtc *crtc,
> > >                                             struct dpu_global_state *global_state,
> > >                                             struct drm_atomic_state *state,
> > > @@ -1188,11 +1250,9 @@ static int dpu_plane_virtual_assign_resources(struct drm_crtc *crtc,
> > >       struct dpu_rm_sspp_requirements reqs;
> > >       struct dpu_plane_state *pstate, *prev_adjacent_pstate;
> > >       struct dpu_sw_pipe *pipe;
> > > -     struct dpu_sw_pipe *r_pipe;
> > >       struct dpu_sw_pipe_cfg *pipe_cfg;
> > > -     struct dpu_sw_pipe_cfg *r_pipe_cfg;
> > >       const struct msm_format *fmt;
> > > -     int i;
> > > +     int i, stage_id, ret;
> > >
> > >       if (plane_state->crtc)
> > >               crtc_state = drm_atomic_get_new_crtc_state(state,
> > > @@ -1202,11 +1262,6 @@ static int dpu_plane_virtual_assign_resources(struct drm_crtc *crtc,
> > >       prev_adjacent_pstate = prev_adjacent_plane_state ?
> > >               to_dpu_plane_state(prev_adjacent_plane_state) : NULL;
> > >
> > > -     pipe = &pstate->pipe[0];
> > > -     r_pipe = &pstate->pipe[1];
> > > -     pipe_cfg = &pstate->pipe_cfg[0];
> > > -     r_pipe_cfg = &pstate->pipe_cfg[1];
> > > -
> > >       for (i = 0; i < PIPES_PER_PLANE; i++)
> > >               pstate->pipe[i].sspp = NULL;
> > >
> > > @@ -1220,44 +1275,24 @@ static int dpu_plane_virtual_assign_resources(struct drm_crtc *crtc,
> > >
> > >       reqs.rot90 = drm_rotation_90_or_270(plane_state->rotation);
> > >
> > > -     if (drm_rect_width(&r_pipe_cfg->src_rect) == 0) {
> > > -             if (!prev_adjacent_pstate ||
> > > -                 !dpu_plane_try_multirect_shared(pstate, prev_adjacent_pstate, fmt,
> > > -                                                 dpu_kms->catalog->caps->max_linewidth)) {
> > > -                     pipe->sspp = dpu_rm_reserve_sspp(&dpu_kms->rm, global_state, crtc, &reqs);
> > > -                     if (!pipe->sspp)
> > > -                             return -ENODEV;
> > > -
> > > -                     r_pipe->sspp = NULL;
> > > -
> > > -                     pipe->multirect_index = DPU_SSPP_RECT_SOLO;
> > > -                     pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
> > > -
> > > -                     r_pipe->multirect_index = DPU_SSPP_RECT_SOLO;
> > > -                     r_pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
> > > -             }
> > > -     } else {
> > > -             pipe->sspp = dpu_rm_reserve_sspp(&dpu_kms->rm, global_state, crtc, &reqs);
> > > -             if (!pipe->sspp)
> > > -                     return -ENODEV;
> > > -
> > > -             if (!dpu_plane_try_multirect_parallel(pipe, pipe_cfg, r_pipe, r_pipe_cfg,
> > > -                                                   pipe->sspp,
> > > -                                                   msm_framebuffer_format(plane_state->fb),
> > > -                                                   dpu_kms->catalog->caps->max_linewidth)) {
> > > -                     /* multirect is not possible, use two SSPP blocks */
> > > -                     r_pipe->sspp = dpu_rm_reserve_sspp(&dpu_kms->rm, global_state, crtc, &reqs);
> > > -                     if (!r_pipe->sspp)
> > > -                             return -ENODEV;
> > > -
> > > -                     pipe->multirect_index = DPU_SSPP_RECT_SOLO;
> > > -                     pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
> > > +     if (prev_adjacent_pstate &&
> > > +         dpu_plane_try_multirect_shared(pstate, prev_adjacent_pstate, fmt,
> > > +                                         dpu_kms->catalog->caps->max_linewidth)) {
> > > +             goto assigned;
> > > +     }
> > >
> > > -                     r_pipe->multirect_index = DPU_SSPP_RECT_SOLO;
> > > -                     r_pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
> > > -             }
> > > +     for (stage_id = 0; stage_id < STAGES_PER_PLANE; stage_id++) {
> > > +             pipe = &pstate->pipe[stage_id * PIPES_PER_STAGE];
> > > +             pipe_cfg = &pstate->pipe_cfg[stage_id * PIPES_PER_STAGE];
> > > +             ret = dpu_plane_assign_resource_in_stage(pipe, pipe_cfg,
> > > +                                                      plane_state,
> > > +                                                      global_state,
> > > +                                                      crtc, &reqs);
> > > +             if (ret)
> > > +                     return ret;
> > >       }
> > >
> > > +assigned:
> > >       return dpu_plane_atomic_check_sspp(plane, state, crtc_state);
> > >  }
> > >
> > >
> > > --
> > > 2.34.1
> > >
> >
> > --
> > With best wishes
> > Dmitry

-- 
With best wishes
Dmitry

