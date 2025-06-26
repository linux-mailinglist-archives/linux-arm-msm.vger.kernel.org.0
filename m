Return-Path: <linux-arm-msm+bounces-62702-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 986C3AEAAD0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Jun 2025 01:46:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1ED133A9DF5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Jun 2025 23:46:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B14D2153EA;
	Thu, 26 Jun 2025 23:46:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JgdXzffg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 789C61459FA
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Jun 2025 23:46:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750981603; cv=none; b=kSf2hCLg0VSS4aD9PZycjMv6WjlSKz9tYdyPsl4WS/mR6vvjTNetoE160hFEo2TqYB7IomObcbLW1LTe4wPn6B6z13YXm/LLRBZnPbylR5XPG5wmreE4YBDZxoKgra65Af9sFHZY9GjXnm0jvspbhQn/Fiir3gXXBZPDHjG9tZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750981603; c=relaxed/simple;
	bh=69LORJOhchweda7tzHk61b68/mcAIihNisSJ66vzjeA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rTFwju8uRjofqhIhFP/IlCsxALKf1YJxBnd1+fGLZ0uaK8lD2S+9jzVODh+gxZIXwreKCpDTpwrjI/lUaabzp4kg5SUefa8gw0JvKD5k1XYx4/LMEafHhnMvWVIhDbtypRcv6yS7u6sV+t2LkfzDL2ofv0TNNokL99wYiw6Xx7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JgdXzffg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55QJa4XR029548
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Jun 2025 23:46:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7KegPe8W7T2gpH9g2ETCWHauXeLTwZBk9lVvzRO/WrQ=; b=JgdXzffgjuyd+i5J
	R6tI2q7XvuRCnRScdCiGMG4Zd5e7MzRk2gJKF7Jz41ybocbS1OzZ7BjYriZwMHHO
	aHpJ0URto5VO2Mi/EeuXYWpv2+RBNy4o4zetjwDnYDKJ8xykbA7zZzxss3UXxfZ5
	Kd7gi+vSr8uB2GyjDucIlUIB3v3UN6q5Jx+F/smE2r5moTprdM6Ltz7bxkai62xw
	Kwq+A90LkcqGNOFBHGCr1vxnB59SVMPNU0t7mC0oAK30+5i1x6LNT+SbZoof8Pd1
	/FXmOxthtucg0gcCWb/fXFhAvH0m9D3mfRxsynMQBj33Ky511SPRkejCRURr96cK
	Pvb5jA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47esa4x594-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Jun 2025 23:46:40 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6fab979413fso27795306d6.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Jun 2025 16:46:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750981599; x=1751586399;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7KegPe8W7T2gpH9g2ETCWHauXeLTwZBk9lVvzRO/WrQ=;
        b=D6SX6Z0lm6hCcDJ3k1J/afDtgcmCA2CKbgb+By8DVmqlPtQyFSOWRznWN9/6MsyVRg
         MXTND0X1OebXVg117v1l4eLNS01J6swdkdFtVRVieBttGRnPFPjZzj3r+D5uigGr7hVn
         NKpKZBWgF8ssKtoe16SpOU+mYFs0EMlCE3nqV+ILur57SbKKG1JMmjpH77KOeIeWjNrS
         Bcm+md+BoLYUE+Er1m2aantYeM8k9rA1bR81FeovHvp1j9yTgvf2uPwtuHt2UI1WgO2l
         pL5RsUnSKJY6Pxob3dk8KplTocf39VWWkSlGG/sdPfrFvArMpnoxRO4aj6Fcexy8Ebng
         GTYA==
X-Forwarded-Encrypted: i=1; AJvYcCXrY7WBpkRW9M+ZHzU4Ua9l+gFimqur572ZVsGYSQs6tNSXwFZsD7I1r5tk0vhD5GX26cHM8iRMKNMaGxHN@vger.kernel.org
X-Gm-Message-State: AOJu0YzcgF5i9YuVmrp+FRdEWpEdxqWFst5lP0IZxxoG+Z1bpivZLacs
	Knz9kfG/fDfn747IHRe4ww7fk6R3zJXzk4qI+ymoy3wi2XE0zUwL758VJtwiAo8LlEGiq6q4e88
	AbUo0wDFpfQFb0DiW6Dvt2MF4/yCPAgjC85ehYu3s/JsNx2/8dfeeo9o6onWJszj0TURC
X-Gm-Gg: ASbGnctvmWACzoWLpC8iabsJKH6yrv+s+m/9VJvTKvzYto4aSWmuhpNt8nKWLDaZYJi
	wRKlRnTbhjeUVZ+jEhYo3NH6yPZOW6SvwHZA2t/NDh94RWLp+FoTCh/V3xUD/8ILg2XNN9ltQd5
	LjGe61Y+nQV8jy18u1LS95zgSvvEKYOpChvodxADL7dI7AE7QgHcSDq8qkgzx+NuretmUuSgzR5
	Alu9B+aeLCD93JNmvKpV+rwFOf8prAxW3hyOoJmDfnDwRy543CFrZemsuDt3ldznkBIY8aML7PV
	g9tOwT4LLNkhzgpCGibE8P0qkOBJAgZ99xQtWHRcapdFEk2tldFgeN1KSP5BBJUS2VL7jejCa/B
	WqNuxMC7r7LiKOREGRctpZXNNcWC9badoR+Q=
X-Received: by 2002:a05:6214:2f87:b0:6ff:664f:c4ca with SMTP id 6a1803df08f44-70001d66704mr24208846d6.12.1750981599050;
        Thu, 26 Jun 2025 16:46:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF6V3S1K8u35BRIWj4UvPY2uDUKmwFKq2ypmoKF6aUR+WTdlzRmdvuzitBWJTCwteFsgHOszg==
X-Received: by 2002:a05:6214:2f87:b0:6ff:664f:c4ca with SMTP id 6a1803df08f44-70001d66704mr24208586d6.12.1750981598593;
        Thu, 26 Jun 2025 16:46:38 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32cd2ec5deasm3701091fa.58.2025.06.26.16.46.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jun 2025 16:46:37 -0700 (PDT)
Date: Fri, 27 Jun 2025 02:46:34 +0300
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
Message-ID: <54unag6whlbkjujjirsgqqiukadudgbcfsol2jwdbc523ebas7@3shvc3yepkmq>
References: <20250603-v6-15-quad-pipe-upstream-v11-0-c3af7190613d@linaro.org>
 <20250603-v6-15-quad-pipe-upstream-v11-11-c3af7190613d@linaro.org>
 <5hmgt4v4nop3xpqt34wq4yyfjnypkrnlrr5fnt6r72k5c6r4vn@ykmg5ni6hjyt>
 <CABymUCOx-kJ0FpZnvTPAT9i-kvcA8Bs8WxFZZWQXbLZ2Koobpg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CABymUCOx-kJ0FpZnvTPAT9i-kvcA8Bs8WxFZZWQXbLZ2Koobpg@mail.gmail.com>
X-Authority-Analysis: v=2.4 cv=eLYTjGp1 c=1 sm=1 tr=0 ts=685ddbe0 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6IFa9wvqVegA:10 a=sWKEhP36mHoA:10 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=2m9aEEAoIjJPnTDgS3EA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: GljObr4vMK13k9CuykGi1CX-MxdTAM7D
X-Proofpoint-ORIG-GUID: GljObr4vMK13k9CuykGi1CX-MxdTAM7D
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI2MDIwNCBTYWx0ZWRfX5uamrfH4E0XZ
 /+WEeEWy5iKK4EMSvbCjCzAPg0xOIo4p1+f50EKRkxU7ofkEp/Q1lOEZbdTS1wHpWw2rECAPdrl
 FykOlUcWAztTm8BBvGVFhjbKOUu5oyfnDqRg4L2hkbYHcr7RqVfglEKxFCVLaUGN89Wu/ZQgMGd
 pMeDRsWdNO+jZHRSxnRKdH7bzFzqTI5FpUkiS2NP5s52P3RMhypzST30J2/yroxBb1Sq8RAjsWU
 y25SyjJ4qAcHlcRlpgxSKbyH9ragvRJHw1GHmAeL/xxdaeQljiIT9XJWggr5AgA6WA9Qa15rc2d
 KH4Y2O5mhjBYlK9FtC+cgnzxQwXuLT0/mjMgGveydvr92V2v9MNzbDOJnPwgqr7vXnr7h4faqWa
 4lrVgUDd0BwKXlL/ljKZvHTlWhMXy7BWpPwdQ4kO9B80Hpz1EGgO60eZ+sWkS8KiUo/NQC9x
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-26_07,2025-06-26_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 mlxscore=0 clxscore=1015 mlxlogscore=999
 suspectscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0
 adultscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506260204

On Thu, Jun 12, 2025 at 03:44:32PM +0800, Jun Nie wrote:
> Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> 于2025年6月3日周二 18:24写道：
> >
> > On Tue, Jun 03, 2025 at 03:10:10PM +0800, Jun Nie wrote:
> > > The content of every half of screen is sent out via one interface in
> > > dual-DSI case. The content for every interface is blended by a LM
> > > pair in quad-pipe case, thus a LM pair should not blend any content
> > > that cross the half of screen in this case. Clip plane into pipes per
> > > left and right half screen ROI if topology is quad pipe case.
> > >
> > > The clipped rectangle on every half of screen is futher handled by two
> > > pipes if its width exceeds a limit for a single pipe.
> > >
> > > Signed-off-by: Jun Nie <jun.nie@linaro.org>
> > > Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > ---
> > >  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c  |  11 +++
> > >  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h  |   2 +
> > >  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 137 +++++++++++++++++++++---------
> > >  3 files changed, 110 insertions(+), 40 deletions(-)
> > >
> > > @@ -886,35 +887,94 @@ static int dpu_plane_atomic_check_nosspp(struct drm_plane *plane,
> > >
> > >       max_linewidth = pdpu->catalog->caps->max_linewidth;
> > >
> > > -     drm_rect_rotate(&pipe_cfg->src_rect,
> > > +     drm_rect_rotate(&init_pipe_cfg.src_rect,
> > >                       new_plane_state->fb->width, new_plane_state->fb->height,
> > >                       new_plane_state->rotation);
> > >
> > > -     if ((drm_rect_width(&pipe_cfg->src_rect) > max_linewidth) ||
> > > -          _dpu_plane_calc_clk(&crtc_state->adjusted_mode, pipe_cfg) > max_mdp_clk_rate) {
> > > -             if (drm_rect_width(&pipe_cfg->src_rect) > 2 * max_linewidth) {
> > > -                     DPU_DEBUG_PLANE(pdpu, "invalid src " DRM_RECT_FMT " line:%u\n",
> > > -                                     DRM_RECT_ARG(&pipe_cfg->src_rect), max_linewidth);
> > > -                     return -E2BIG;
> > > +     /*
> > > +      * We have 1 mixer pair cfg for 1:1:1 and 2:2:1 topology, 2 mixer pair
> > > +      * configs for left and right half screen in case of 4:4:2 topology.
> > > +      * But we may have 2 rect to split wide plane that exceeds limit with 1
> > > +      * config for 2:2:1. So need to handle both wide plane splitting, and
> > > +      * two halves of screen splitting for quad-pipe case. Check dest
> > > +      * rectangle left/right clipping first, then check wide rectangle
> > > +      * splitting in every half next.
> > > +      */
> > > +     num_stages = (num_lm + 1) / 2;
> >
> > I thought we agreed to loop over all stages, dropping the need for
> > num_lm.
> 
> num_stages is needed here, so that the plane can be cropped into left/right
> half of LCD and result pipe will be handled by 2 stages in quadpipe case.
> While only 1 stage is involved in 1 or 2 pipe case and the crop operation
> does not make a real impact. If we do not care num_lm and use 2 stages
> by default, then we are forcing quad-pipe. Do you have any suggestion?

I'm sorry, it took me a while to respond.

No, this is fine.

> 
> >
> > > +     /* iterate mixer configs for this plane, to separate left/right with the id */
> > > +     for (stage_id = 0; stage_id < num_stages; stage_id++) {
> > > +             struct drm_rect mixer_rect = {
> > > +                     .x1 = stage_id * mode->hdisplay / num_stages,
> > > +                     .y1 = 0,
> > > +                     .x2 = (stage_id + 1) * mode->hdisplay / num_stages,
> 
> The crop window is calculated with num_stages here.

Ack.

> 
> > > +                     .y2 = mode->vdisplay
> > > +                     };
> > > +             int cfg_idx = stage_id * PIPES_PER_STAGE;
> > > +
> > > +             pipe_cfg = &pstate->pipe_cfg[cfg_idx];
> > > +             r_pipe_cfg = &pstate->pipe_cfg[cfg_idx + 1];
> > > +
> > > +             drm_rect_fp_to_int(&pipe_cfg->src_rect, &new_plane_state->src);
> > > +             pipe_cfg->dst_rect = new_plane_state->dst;
> > > +
> > > +             DPU_DEBUG_PLANE(pdpu, "checking src " DRM_RECT_FMT
> > > +                             " vs clip window " DRM_RECT_FMT "\n",
> > > +                             DRM_RECT_ARG(&pipe_cfg->src_rect),
> > > +                             DRM_RECT_ARG(&mixer_rect));
> > > +
> > > +             /*
> > > +              * If this plane does not fall into mixer rect, check next
> > > +              * mixer rect.
> > > +              */
> > > +             if (!drm_rect_clip_scaled(&pipe_cfg->src_rect,
> > > +                                       &pipe_cfg->dst_rect,
> > > +                                       &mixer_rect)) {
> > > +                     memset(pipe_cfg, 0, 2 * sizeof(struct dpu_sw_pipe_cfg));
> > > +
> > > +                     continue;
> > >               }
> > >
> > > -             *r_pipe_cfg = *pipe_cfg;
> > > -             pipe_cfg->src_rect.x2 = (pipe_cfg->src_rect.x1 + pipe_cfg->src_rect.x2) >> 1;
> > > -             pipe_cfg->dst_rect.x2 = (pipe_cfg->dst_rect.x1 + pipe_cfg->dst_rect.x2) >> 1;
> > > -             r_pipe_cfg->src_rect.x1 = pipe_cfg->src_rect.x2;
> > > -             r_pipe_cfg->dst_rect.x1 = pipe_cfg->dst_rect.x2;
> > > -     } else {
> > > -             memset(r_pipe_cfg, 0, sizeof(*r_pipe_cfg));
> > > -     }
> > > +             pipe_cfg->dst_rect.x1 -= mixer_rect.x1;
> > > +             pipe_cfg->dst_rect.x2 -= mixer_rect.x1;
> > > +
> > > +             DPU_DEBUG_PLANE(pdpu, "Got clip src:" DRM_RECT_FMT " dst: " DRM_RECT_FMT "\n",
> > > +                             DRM_RECT_ARG(&pipe_cfg->src_rect), DRM_RECT_ARG(&pipe_cfg->dst_rect));
> > > +
> > > +             /* Split wide rect into 2 rect */
> > > +             if ((drm_rect_width(&pipe_cfg->src_rect) > max_linewidth) ||
> > > +                  _dpu_plane_calc_clk(mode, pipe_cfg) > max_mdp_clk_rate) {
> > > +
> > > +                     if (drm_rect_width(&pipe_cfg->src_rect) > 2 * max_linewidth) {
> > > +                             DPU_DEBUG_PLANE(pdpu, "invalid src " DRM_RECT_FMT " line:%u\n",
> > > +                                             DRM_RECT_ARG(&pipe_cfg->src_rect), max_linewidth);
> > > +                             return -E2BIG;
> > > +                     }
> > > +
> > > +                     memcpy(r_pipe_cfg, pipe_cfg, sizeof(struct dpu_sw_pipe_cfg));
> > > +                     pipe_cfg->src_rect.x2 = (pipe_cfg->src_rect.x1 + pipe_cfg->src_rect.x2) >> 1;
> > > +                     pipe_cfg->dst_rect.x2 = (pipe_cfg->dst_rect.x1 + pipe_cfg->dst_rect.x2) >> 1;
> > > +                     r_pipe_cfg->src_rect.x1 = pipe_cfg->src_rect.x2;
> > > +                     r_pipe_cfg->dst_rect.x1 = pipe_cfg->dst_rect.x2;
> > > +                     DPU_DEBUG_PLANE(pdpu, "Split wide plane into:"
> > > +                                     DRM_RECT_FMT " and " DRM_RECT_FMT "\n",
> > > +                                     DRM_RECT_ARG(&pipe_cfg->src_rect),
> > > +                                     DRM_RECT_ARG(&r_pipe_cfg->src_rect));
> > > +             } else {
> > > +                     memset(r_pipe_cfg, 0, sizeof(struct dpu_sw_pipe_cfg));
> > > +             }
> > >
> > > -     drm_rect_rotate_inv(&pipe_cfg->src_rect,
> > > -                         new_plane_state->fb->width, new_plane_state->fb->height,
> > > -                         new_plane_state->rotation);
> > > -     if (drm_rect_width(&r_pipe_cfg->src_rect) != 0)
> > > -             drm_rect_rotate_inv(&r_pipe_cfg->src_rect,
> > > -                                 new_plane_state->fb->width, new_plane_state->fb->height,
> > > +             drm_rect_rotate_inv(&pipe_cfg->src_rect,
> > > +                                 new_plane_state->fb->width,
> > > +                                 new_plane_state->fb->height,
> > >                                   new_plane_state->rotation);
> > >
> > > +             if (drm_rect_width(&r_pipe_cfg->src_rect) != 0)
> > > +                     drm_rect_rotate_inv(&r_pipe_cfg->src_rect,
> > > +                                         new_plane_state->fb->width,
> > > +                                         new_plane_state->fb->height,
> > > +                                         new_plane_state->rotation);
> > > +     }
> > > +
> > >       pstate->needs_qos_remap = drm_atomic_crtc_needs_modeset(crtc_state);
> > >
> > >       return 0;
> > > @@ -997,20 +1057,17 @@ static int dpu_plane_atomic_check_sspp(struct drm_plane *plane,
> > >               drm_atomic_get_new_plane_state(state, plane);
> > >       struct dpu_plane *pdpu = to_dpu_plane(plane);
> > >       struct dpu_plane_state *pstate = to_dpu_plane_state(new_plane_state);
> > > -     struct dpu_sw_pipe *pipe = &pstate->pipe[0];
> > > -     struct dpu_sw_pipe *r_pipe = &pstate->pipe[1];
> > > -     struct dpu_sw_pipe_cfg *pipe_cfg = &pstate->pipe_cfg[0];
> > > -     struct dpu_sw_pipe_cfg *r_pipe_cfg = &pstate->pipe_cfg[1];
> > > -     int ret = 0;
> > > -
> > > -     ret = dpu_plane_atomic_check_pipe(pdpu, pipe, pipe_cfg,
> > > -                                       &crtc_state->adjusted_mode,
> > > -                                       new_plane_state);
> > > -     if (ret)
> > > -             return ret;
> > > +     struct dpu_sw_pipe *pipe;
> > > +     struct dpu_sw_pipe_cfg *pipe_cfg;
> > > +     int ret = 0, i;
> > >
> > > -     if (drm_rect_width(&r_pipe_cfg->src_rect) != 0) {
> > > -             ret = dpu_plane_atomic_check_pipe(pdpu, r_pipe, r_pipe_cfg,
> > > +     for (i = 0; i < PIPES_PER_PLANE; i++) {
> > > +             pipe = &pstate->pipe[i];
> > > +             pipe_cfg = &pstate->pipe_cfg[i];
> > > +             if (!pipe->sspp)
> > > +                     continue;
> > > +             DPU_DEBUG_PLANE(pdpu, "pipe %d is in use, validate it\n", i);
> > > +             ret = dpu_plane_atomic_check_pipe(pdpu, pipe, pipe_cfg,
> > >                                                 &crtc_state->adjusted_mode,
> > >                                                 new_plane_state);
> > >               if (ret)
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

