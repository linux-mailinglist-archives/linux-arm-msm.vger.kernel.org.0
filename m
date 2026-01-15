Return-Path: <linux-arm-msm+bounces-89190-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D160CD23A12
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Jan 2026 10:39:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0BB5D30869A9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Jan 2026 09:39:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B788534E761;
	Thu, 15 Jan 2026 09:39:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bm+TPvTW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="L/XKXAy2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9C18359FB4
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 09:39:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768469949; cv=none; b=UGrFtR1mru32fUFoo6rX3oxCEY2ZEdKI8ZfcC3ZU4zZaj6TVtXYKtq+7gRgM83DzD/Bm+Wj5vEsREXLkPRNlIMySgQgmAOdTwo0Id+Hj00QEUN1OvKBAfUM3DYAVIGqRdaXAJb26cuAeIzv3+xIOLjvLyjXosrVeqqpIe7xXeE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768469949; c=relaxed/simple;
	bh=Da8Ctkq8veGl2PRp2Z2G/KZzqIuckcql1ksWtyMVSDI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OFpMJ3X/xOztoXcMBSsA+N9GlHBZhltcKRao/JoOdcJOZ5NJfwWyJKHdiN2+dgh0jvrQ44K6vqELfBfOHI0XvdYCZgdV1LyZ7NHUPmV6dnRpd/ie1njn0aYC1WTnUsP4K8vr+V7Yeyuv36YD3yIj5ymyvgtpOP9GI23bqTQcrTU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bm+TPvTW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=L/XKXAy2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60F6fp5d1170788
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 09:39:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sIl66dlruuXNU821cYXGzfF3YYebMAS06VChYc3I744=; b=bm+TPvTWFzSOgfOy
	h5dmypeHCJi2tyoVbWQfuJIec3ZCFrwh5DxuaMcDfK/oiRyA8tGGSrf245Roxl1l
	aP1e+jY0h9Jah68A+4uvJ+SYkl4YHdSF2o1g/s0452REzItZR0m6qzbrJjGZxUK0
	L214QYGDyGs0tQiM/RHzVsfCu/YPwHGTwlBPb8GeAtIDft2gidbNwKsCcAsybah1
	lSWQ+QWsbspCkxL3Rggm3lTnb3JlUaZwJ5F7j/iaEhAYJPtN72lXK7ySaBYxQxKQ
	F0OibpKEbv5PjqJOeDlvtCmNWKJeXGS0yacAIeslB8kkvhRn7jb58G5Uzbm4rvtc
	O8Co4g==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bpg84adq1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 09:39:06 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c2a3a614b5so188492685a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 01:39:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768469943; x=1769074743; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=sIl66dlruuXNU821cYXGzfF3YYebMAS06VChYc3I744=;
        b=L/XKXAy2sBqmpafo/NcOdvyyiNchFl89RaGO8DslI7mXiMY1s4Q8uQIA5xm2xWLtTD
         ETmDq90tHdf8mkPC6X3j/7/M9op8H7ztl8r7XFsteGzw9kxg5H4yS+aZivEL5tqG+UtI
         Wa1AF/Hqh5YSRYF5bxAaSZaWPigspPBvRgAE5bG8qMrpZa6/kz1wqmEBvBxXS84+MnUG
         o/AtLhjzHTwpnUvvWaB2nYe0HpMdyoAlUN5SNZLtrHs4LkBOo9zQOeYLdS951hEjagck
         XcRoUTeuq9MEZiZf9FROlnMwBj/Ejv6DzhbQERS8IW9NSIH6vaM5LlWL1uPBv3HHpjFr
         rrHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768469943; x=1769074743;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sIl66dlruuXNU821cYXGzfF3YYebMAS06VChYc3I744=;
        b=RNON3mVn7kvKNFzUeO7CL7ULS6lm1ep0gGcj5EQRJZpmgi7HUQ0Or40FIdomVWoGSl
         wrzU7NiTLiqr2SrkI4ehK6mr83POWpvbNslKgJXIYi3trkUJzW6VfALmlr3U9LS9QY9S
         JiynvhftPNcsidz0gK+a2fFgrE0yOrQr64vJlApL3xYpMm4LX6YqdyMBulhtsC9JxVej
         YjdccwnTRZUkbHuKO42G+YaAXp1rIMUc+2p5sZLphSRCD9wOqgv/RhtvMRwv18t9PIMO
         0tTgro7OBhnQWiXl7YKwpSM48ocFOrPuTetk3iYzizYfFSip6/FU+lCo4uMPHOOqx7HV
         JxQg==
X-Forwarded-Encrypted: i=1; AJvYcCXgcEaSB43SrMdTRNxCBvuNydhDKJtF+b1pwrlQSByZYVCTzRalceIYdVsqpcdyYBgHIoRVx1fdzNNQ/eIa@vger.kernel.org
X-Gm-Message-State: AOJu0YzK81rPngolforxCGdRavf/Yrlkdu6D9DPg+8y51b0kcfsvOZ4w
	0Docudcr/W8b5RKoE9rzQWQN69c3NAflFMhuSswurwKMzjghFfWtzOGz0EQd7KKczdzs1uDPW7i
	u3aCUf9DTH0V/8LWsmCP67fD9+NK2geBI1l35j8BVkFi0FK3sxnR1Tpi7oE53Im2uDLpK
X-Gm-Gg: AY/fxX4RCFYh2A9dFtKA9fxYrQIKQFO2ePjqXdzSd42G5N+Am/WPAo2Q/FKrJK7E6lb
	pXGsV7FFvgOZokD3gL5Rt8ARUZDwcG0ws26QLJBMx89J9A6rLWL0IjSKiFU1ZrTlOZCTQjtyp7U
	hFaQ77S4TioAym6IlNK267vbQkjLqn7IjMCeuq2nGwjCWRB91n9E2nYYmYk45PNoIS2T87gRSzg
	hCaFsZqj5cEmVSDmK3jBmfx3Aj6hkcrQK2im2bVTciE+TVgyNwEgI8AppFCxsUw4v6tBObemQOw
	MEZgWmsCrmlKrt5Rj1W7uQsxGFg38PH13pAB7R0ky+7/aTchf3iPebakOpirFD3lLRfBx+tEv+/
	dNnRbJHqDXgXN3B4Mmlu0qW42+8BHHu1l8tw5bjzW2XXufQrCvIROyXceQp+b2wekbW+OLEosVm
	CvnVNrp+gpAF+LpbDYsoQCgC8=
X-Received: by 2002:a05:620a:2a04:b0:8b2:ea3f:2fa4 with SMTP id af79cd13be357-8c589b853b9mr308444985a.6.1768469943034;
        Thu, 15 Jan 2026 01:39:03 -0800 (PST)
X-Received: by 2002:a05:620a:2a04:b0:8b2:ea3f:2fa4 with SMTP id af79cd13be357-8c589b853b9mr308442885a.6.1768469942520;
        Thu, 15 Jan 2026 01:39:02 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59ba9e32e12sm529060e87.27.2026.01.15.01.39.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jan 2026 01:39:01 -0800 (PST)
Date: Thu, 15 Jan 2026 11:38:59 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jun Nie <jun.nie@linaro.org>
Cc: Abhinav Kumar <abhinav.kumar@linux.dev>,
        Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v16 09/10] drm/msm/dpu: support plane splitting in
 quad-pipe case
Message-ID: <uh75cutkn4opgjbwebpqvhq4xfzep3jnsblaevpgs3gchg264k@gzgydmui2653>
References: <20250918-v6-16-rc2-quad-pipe-upstream-4-v16-0-ff6232e3472f@linaro.org>
 <20250918-v6-16-rc2-quad-pipe-upstream-4-v16-9-ff6232e3472f@linaro.org>
 <CABymUCNY9uo0Cm0KgM9yChuxJ22=Y-4JjHj7cEh5ByX8Nr3y-w@mail.gmail.com>
 <nvd4eksgcmeqlfwp4jc27fpuzi6otdhzcefdbmj7a2xgv2bqwr@r6rytxs7ibj3>
 <CABymUCP2yAQptCGCBX0X75iRSkKkfctiEaxUH7_eOpspR55_Kg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CABymUCP2yAQptCGCBX0X75iRSkKkfctiEaxUH7_eOpspR55_Kg@mail.gmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE1MDA2OCBTYWx0ZWRfX4lDVguD0snYT
 uoJ8xw02GT4xb1KW2RRMjM0qb3g2iE4WUQyWvZ2RQztOhFC6cJq8Pz1OEQer+kmpNlS17L2rhSY
 3phy+4+4C/bYOo2Hf0vPC1ahhKedTfa+ZNdMo6s3YiohOPlVbFWe/zhgB7oKjyjzXYUhm83VN2+
 gEv0fzwI4jAEQ7LYBm+WOH7ZaPNEQGfw5m3TuNLhHjsFEiS7itD3W9lmJ4Dv4XMmtoVcakPeZmO
 UsSVGTpptYWlxnjwUXstYWfKA7ct+Wwwe4XdxLkSon+qCMDZ1vwy6WxNP9oLMsEcbg06q16jXhT
 terWPSsKf3K6znwh2vcfqpLNOav0OI4kZiSc2Fq2MuNxliX9pbGiuSu7lDEeIICGBN3xzBJMtVu
 mcs7uX2pDtwBVk9sZrH4H3eBST6LR9P9zHvlytszu8FI95fzdo8NInRXuzBej4imS7Kx5bZB0Ou
 yk79A2wSworGZLu/Z3A==
X-Authority-Analysis: v=2.4 cv=IO8PywvG c=1 sm=1 tr=0 ts=6968b5ba cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=sWKEhP36mHoA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=49zKgsZv9mWLMjEby-4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: Eye77OD81XkMphM0vxTU27kjyowIn4uG
X-Proofpoint-ORIG-GUID: Eye77OD81XkMphM0vxTU27kjyowIn4uG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-15_03,2026-01-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0
 priorityscore=1501 impostorscore=0 adultscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601150068

On Thu, Jan 15, 2026 at 05:34:28PM +0800, Jun Nie wrote:
> Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> 于2026年1月15日周四 00:12写道：
> >
> > On Wed, Jan 14, 2026 at 10:48:17PM +0800, Jun Nie wrote:
> > > Jun Nie <jun.nie@linaro.org> 于2025年9月18日周四 21:30写道：
> > > >
> > > > The content of every half of screen is sent out via one interface in
> > > > dual-DSI case. The content for every interface is blended by a LM
> > > > pair in quad-pipe case, thus a LM pair should not blend any content
> > > > that cross the half of screen in this case. Clip plane into pipes per
> > > > left and right half screen ROI if topology is quad pipe case.
> > > >
> > > > The clipped rectangle on every half of screen is futher handled by two
> > > > pipes if its width exceeds a limit for a single pipe.
> > > >
> > > > Signed-off-by: Jun Nie <jun.nie@linaro.org>
> > > > Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > > Reviewed-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
> > > > ---
> > > >  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c  |  11 +++
> > > >  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h  |   2 +
> > > >  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 137 +++++++++++++++++++++---------
> > > >  3 files changed, 110 insertions(+), 40 deletions(-)
> > > >
> > > > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> > > > index d825eb8e40ae8bd456ede6269951339e3053d0d3..e925d93b38feac0594d735fdc2c5b9fd5ae83e6a 100644
> > > > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> > > > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> > > > @@ -1604,6 +1604,17 @@ int dpu_crtc_vblank(struct drm_crtc *crtc, bool en)
> > > >         return 0;
> > > >  }
> > > >
> > > > +/**
> > > > + * dpu_crtc_get_num_lm - Get mixer number in this CRTC pipeline
> > > > + * @state: Pointer to drm crtc state object
> > > > + */
> > > > +unsigned int dpu_crtc_get_num_lm(const struct drm_crtc_state *state)
> > > > +{
> > > > +       struct dpu_crtc_state *cstate = to_dpu_crtc_state(state);
> > > > +
> > > > +       return cstate->num_mixers;
> > > > +}
> > > > +
> > > >  #ifdef CONFIG_DEBUG_FS
> > > >  static int _dpu_debugfs_status_show(struct seq_file *s, void *data)
> > > >  {
> > > > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
> > > > index 94392b9b924546f96e738ae20920cf9afd568e6b..6eaba5696e8e6bd1246a9895c4c8714ca6589b10 100644
> > > > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
> > > > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
> > > > @@ -267,4 +267,6 @@ static inline enum dpu_crtc_client_type dpu_crtc_get_client_type(
> > > >
> > > >  void dpu_crtc_frame_event_cb(struct drm_crtc *crtc, u32 event);
> > > >
> > > > +unsigned int dpu_crtc_get_num_lm(const struct drm_crtc_state *state);
> > > > +
> > > >  #endif /* _DPU_CRTC_H_ */
> > > > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> > > > index 5ae58352cbee1251a0140879f04fc7c304cae674..89a5feb6308bcac537562c3dc4e61c16c92e460c 100644
> > > > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> > > > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> > > > @@ -824,8 +824,12 @@ static int dpu_plane_atomic_check_nosspp(struct drm_plane *plane,
> > > >         struct dpu_plane_state *pstate = to_dpu_plane_state(new_plane_state);
> > > >         struct dpu_sw_pipe_cfg *pipe_cfg;
> > > >         struct dpu_sw_pipe_cfg *r_pipe_cfg;
> > > > +       struct dpu_sw_pipe_cfg init_pipe_cfg;
> > > >         struct drm_rect fb_rect = { 0 };
> > > > +       const struct drm_display_mode *mode = &crtc_state->adjusted_mode;
> > > >         uint32_t max_linewidth;
> > > > +       u32 num_lm;
> > > > +       int stage_id, num_stages;
> > > >
> > > >         min_scale = FRAC_16_16(1, MAX_UPSCALE_RATIO);
> > > >         max_scale = MAX_DOWNSCALE_RATIO << 16;
> > > > @@ -848,13 +852,10 @@ static int dpu_plane_atomic_check_nosspp(struct drm_plane *plane,
> > > >                 return -EINVAL;
> > > >         }
> > > >
> > > > -       /* move the assignment here, to ease handling to another pairs later */
> > > > -       pipe_cfg = &pstate->pipe_cfg[0];
> > > > -       r_pipe_cfg = &pstate->pipe_cfg[1];
> > > > -       /* state->src is 16.16, src_rect is not */
> > > > -       drm_rect_fp_to_int(&pipe_cfg->src_rect, &new_plane_state->src);
> > > > +       num_lm = dpu_crtc_get_num_lm(crtc_state);
> > > >
> > > > -       pipe_cfg->dst_rect = new_plane_state->dst;
> > > > +       /* state->src is 16.16, src_rect is not */
> > > > +       drm_rect_fp_to_int(&init_pipe_cfg.src_rect, &new_plane_state->src);
> > > >
> > > >         fb_rect.x2 = new_plane_state->fb->width;
> > > >         fb_rect.y2 = new_plane_state->fb->height;
> > > > @@ -879,35 +880,94 @@ static int dpu_plane_atomic_check_nosspp(struct drm_plane *plane,
> > > >
> > > >         max_linewidth = pdpu->catalog->caps->max_linewidth;
> > > >
> > > > -       drm_rect_rotate(&pipe_cfg->src_rect,
> > > > +       drm_rect_rotate(&init_pipe_cfg.src_rect,
> > > >                         new_plane_state->fb->width, new_plane_state->fb->height,
> > > >                         new_plane_state->rotation);
> > > >
> > > > -       if ((drm_rect_width(&pipe_cfg->src_rect) > max_linewidth) ||
> > > > -            _dpu_plane_calc_clk(&crtc_state->adjusted_mode, pipe_cfg) > max_mdp_clk_rate) {
> > > > -               if (drm_rect_width(&pipe_cfg->src_rect) > 2 * max_linewidth) {
> > > > -                       DPU_DEBUG_PLANE(pdpu, "invalid src " DRM_RECT_FMT " line:%u\n",
> > > > -                                       DRM_RECT_ARG(&pipe_cfg->src_rect), max_linewidth);
> > > > -                       return -E2BIG;
> > > > +       /*
> > > > +        * We have 1 mixer pair cfg for 1:1:1 and 2:2:1 topology, 2 mixer pair
> > > > +        * configs for left and right half screen in case of 4:4:2 topology.
> > > > +        * But we may have 2 rect to split wide plane that exceeds limit with 1
> > > > +        * config for 2:2:1. So need to handle both wide plane splitting, and
> > > > +        * two halves of screen splitting for quad-pipe case. Check dest
> > > > +        * rectangle left/right clipping first, then check wide rectangle
> > > > +        * splitting in every half next.
> > > > +        */
> > > > +       num_stages = (num_lm + 1) / 2;
> > >
> > > Hi Dmitry,
> > > Because the plane is checked before crtc is checked in the drm framework. While
> > > the topology is decided in crtc check. Thus num_lm is 0 when this function is
> > > called for the first time. As a result, the below iteration is not run
> > > at all and leads
> > >  to iommu warning.
> >
> > How does it lead to IOMMU warnings?
> 
> Because the pipe is not configured with width/height etc when the iteration is
> skipped. I have not found the root cause so far. But per the null IOMMU iova
> value, suppose it is due to DMA buffer not being prepared when DMA is started.

I'd think, that corresponding SRC regs are either garbage or zero programmed.

> 
> >
> > > Do you suggest to change drm framework with adding extra crtc check before
> > > plane check, or you prefer the below line here?
> > >
> > > num_stages = max(1, (num_lm + 1) / 2);
> >
> > DRM framework provides enough hooks to be able to influence the order or
> > operations without changing the framework. But, I'd like to point out
> > that for the virtual plane case we already perform plane operations
> > from dpu_crtc_atomic_check(). You can employ the same approach.
> 
> Thanks for the suggestion! I see dpu_assign_plane_resources() is called
> from crtc side, which avoids the plane splitting before topology decision.
> To use this method, it looks like we are enabling the virtual plane by default.
> Because the virtual plane differs from the traditional method only with the
> plane splitting and resource preparation. Can we just enable the virtual
> plane by default in this situation?

In which situation? It is a global switch. And we need to be able to
work with it turned off, until corresponding code is dropped.

> 
> Jun
> 
> >
> >
> > --
> > With best wishes
> > Dmitry

-- 
With best wishes
Dmitry

