Return-Path: <linux-arm-msm+bounces-89032-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 52EF7D201CF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Jan 2026 17:14:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8C488300EA11
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Jan 2026 16:12:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E59A2DCBE6;
	Wed, 14 Jan 2026 16:12:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fw4ly/Sy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CjSUr67N"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4A72220F3E
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Jan 2026 16:12:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768407172; cv=none; b=CItO29vyiPOAI7yioV+fwKsTBgMVI/rhBvedo/lZ/D6RNphiaIr2UFqX+IabtyXX0q+RNk03FQeaR/TY8D1k9xfxntBOb20189cjIoGYD+KlXWkg7O+ROAR1Gg9oLXvquiEoCUHOpZn3qyS2w0HOMP439/6oLVL45xb2/KnGLbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768407172; c=relaxed/simple;
	bh=s1Sowcqw9IUlTqh31TOrT3wM4ttc15KOWjw+hiVqBsU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Gu8tcwuOVNWy5RySgKYVjBYGnZwL0HrSNueAdn8PesBTmw0iuGUW9+hYmeV7OXfcLmfEg0gEVIhD0oSES/YBjqoeXvuBt8Ql1STEoEqfSZpkhygwHfLLNJIYwPJtMX3xeTEnQYW96t9Z3wm82j7+aS0DVoFsJb+hnOAk90UskUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fw4ly/Sy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CjSUr67N; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60EB2br03416256
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Jan 2026 16:12:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3udo9Mw+DK3PwA7JzXb/AilVbOQhXrI/Va8VuA69IyQ=; b=fw4ly/SyPvv2f5pF
	evdxFZZoz0rj5qITvIN+htu5Ay4m4RTwbfFqvXDTCr1BQNSo9Zkj7YNHrr0mAMnA
	akaAkLX0VHmD+2xgcBO7je9MFTQ7YjCC9s4GgxV5AWoYo9Z54PAqhR50pG6wUzvF
	Kxo5R5UuIGNMxgreoUMF4yNucU2Y14VabOCbADoXw1QTMOoqi5h4NLSVgkCcwglA
	SvqxBcrrSz40NwYpkwwVRKSqZSyqSS+CJSLDjC23lwJwTTE+sUfAsZoN9xzZE+nP
	hmur9AQRz+4blgT2k/nf/jlVK2vjqKjJZsdQ8QNvwKUc72DK3WodU442ptVuD83A
	yJeWuA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bp9x2h1f5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Jan 2026 16:12:45 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8b2e2342803so2346724385a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Jan 2026 08:12:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768407164; x=1769011964; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3udo9Mw+DK3PwA7JzXb/AilVbOQhXrI/Va8VuA69IyQ=;
        b=CjSUr67NOia8e0mOou0y6yav/vLS0Q+CPX1ufXH+YLaxdYpJl1YXK5/j3zdjTlCQUu
         JODd+xWKY49CVHKZdw+4ePdfi02HRkpJGSclpCHV4Kx8BB3kkoWE9S5vuSizETDJjvDq
         NV4DSM0hyI/4eFm4teF+5PM8RBZk4DM+LUabs30Ts7NLbsPSA4PJoNjyS2LHq66BlA29
         GIhj2Vp2rlwcCF/j9Kt1ihUzWzOalol8QUeWFZvm3c8wImG8U8lIVO+H0pE9NdGxkMrs
         MZmT/ISp35e3xSE735bBTCz88p2x4N+AebT381kfbs7GcLD9zClV66XhQPJvcWOxb4Gq
         QyfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768407164; x=1769011964;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3udo9Mw+DK3PwA7JzXb/AilVbOQhXrI/Va8VuA69IyQ=;
        b=Mk087JSiBAgxDG3ZPDUwMlfN9Q6nkhxjA/j0K2FBaaNemRNg12W9fCqPznQGogeLu2
         RlLnrdqPLcVX4FxaZhNOX+zyN6eidFCdoy/rT5w8FizBwZ2uJJ4srURrQNHUzUHvlEmk
         Osn30QqRnNygpnmTp+qUv6BhXWfW7isvaD3KAGfzv33FA59nnZy8JZTHFb+eBvRhjAS5
         DOCrw4D67mXjit38EWsZuA+eZpR1EM7zK0dFVQWZR31mHXSlh2GfNnzl4tkiSZc2XhzG
         zX59eFs9Ee2lcZldu/i6Ce8QtJ2YApXALxD3GmuXiRlQ4/swrSp63WHiv7lBrx9C8LSe
         y7WA==
X-Forwarded-Encrypted: i=1; AJvYcCVBcOdydEHMHCg4iASVccj6DlGTr2Ff6FSH+KunmsT/zsKK9CNr2pfJRfYMMIiZmyZg/2oLRQD8p7j804qh@vger.kernel.org
X-Gm-Message-State: AOJu0YzXWWR8V3hnMDRZOQC63/xaX3k/NHr8flwR7ebu3WPNq+NUXH1Y
	1h5xzZ/Zj3/iiLaOHz4UvMzcgpwkg0IG8P6KuqDe9QxDmKnn9nYxLE+fhkVQxNMrbaK8RrS12/A
	BneZLzqCtU5goLYzjrTPH9qJDHnA8AeUtmxfY3q4PgGHNpabrGH6fXfCwu5H67xPyikIh
X-Gm-Gg: AY/fxX61vDSDnpMDwIDbg3zTac6ro69sRwj2OvhD82Nlc/mjyxBLptf5GcFGq5NvRH8
	AQDlD5bMioQIRUH756WMiR2fSC1HsN49DDSmZKctja2d7ifavV7bVxukird860lHcNqI4AsMgPz
	HH2jgknxdoD8tF94O8PYwKC2GpOGTs4mSXOXsbBzGcoQp6jgbIuvRICH6SlrUKHWyw2016pXOfp
	eywKYiNnAwkw7dt+l2HiwbEkk4AAaKcsic2Dq1kaNJ6Yoi2HXmIr/ip7UH1irRVf9mht6uBHAIV
	GeOIQOAo6KaMK9DS+t2F3X9ntEFjxCqob+rBLUHRezYtINLGOjTKPTXhCvLRj5Vrqfn8LPsAj+o
	6vKVCwblSH2y9YyBrW1Eh6QxPh2BENEoM5nLZ2ELvx+tP7NFpl9CyYstWuDtQbCC8+eyDnoyPsa
	Pe2ORFoMhHdWdCa7CV6Zw9sg8=
X-Received: by 2002:a05:620a:4502:b0:8b9:7a1a:8c73 with SMTP id af79cd13be357-8c52fb90a04mr493627085a.46.1768407163672;
        Wed, 14 Jan 2026 08:12:43 -0800 (PST)
X-Received: by 2002:a05:620a:4502:b0:8b9:7a1a:8c73 with SMTP id af79cd13be357-8c52fb90a04mr493619385a.46.1768407163009;
        Wed, 14 Jan 2026 08:12:43 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-382fc959db1sm46330641fa.2.2026.01.14.08.12.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 08:12:42 -0800 (PST)
Date: Wed, 14 Jan 2026 18:12:40 +0200
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
Message-ID: <nvd4eksgcmeqlfwp4jc27fpuzi6otdhzcefdbmj7a2xgv2bqwr@r6rytxs7ibj3>
References: <20250918-v6-16-rc2-quad-pipe-upstream-4-v16-0-ff6232e3472f@linaro.org>
 <20250918-v6-16-rc2-quad-pipe-upstream-4-v16-9-ff6232e3472f@linaro.org>
 <CABymUCNY9uo0Cm0KgM9yChuxJ22=Y-4JjHj7cEh5ByX8Nr3y-w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CABymUCNY9uo0Cm0KgM9yChuxJ22=Y-4JjHj7cEh5ByX8Nr3y-w@mail.gmail.com>
X-Proofpoint-ORIG-GUID: VWiwLa_2uMRwM161Kwt7jE1TxZPU1SqP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE0MDEzNSBTYWx0ZWRfX1Nn67GDGZ9G9
 A4AiM1Dqc267RvjoSpiYdd3TCC9IgezZmZLq0g3B3XVLVy2eqHksauZ4kUHecR4PfRSdFaxnAjD
 RHs0OTWfBk4B+P9+kR+mDJ5biGCs584DWs/+H6WqLQT4pezu/93YvUJGjstZ2IPqHuiKPcaSy5W
 WktTXjY5zVkYxKODNufVEg9Zzve7jtul5IEgVgOCzBHaK/46MC0wdr/QortdfJ1C5N2vwjdeAPK
 l8d7uzaod5v1TIws/id68ls5YHuWFfW39BEWytVVxZtIqNoc+XZ+fOy1v3eRaYEoYu0Eao164d6
 vAnK8X402BgjxdFWgtcDwFxvTI9s3ZUskFDDaJffY1QUgcxhBZ/kzwj/IQZo5cmbaVmskKRM4L3
 VQsFXnhy9DOUWB791c1xjZ4QVCAZuCwIPOAvqm68qxbfzeWuRLlijBgD6ocPhFclV+V0ehGb0V3
 KnscoEMbf+pVKPF4JBA==
X-Authority-Analysis: v=2.4 cv=Fr0IPmrq c=1 sm=1 tr=0 ts=6967c07d cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=sWKEhP36mHoA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=7nXcqi-YNvihj1AckBkA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: VWiwLa_2uMRwM161Kwt7jE1TxZPU1SqP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-14_05,2026-01-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 adultscore=0 impostorscore=0 malwarescore=0
 lowpriorityscore=0 priorityscore=1501 bulkscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601140135

On Wed, Jan 14, 2026 at 10:48:17PM +0800, Jun Nie wrote:
> Jun Nie <jun.nie@linaro.org> 于2025年9月18日周四 21:30写道：
> >
> > The content of every half of screen is sent out via one interface in
> > dual-DSI case. The content for every interface is blended by a LM
> > pair in quad-pipe case, thus a LM pair should not blend any content
> > that cross the half of screen in this case. Clip plane into pipes per
> > left and right half screen ROI if topology is quad pipe case.
> >
> > The clipped rectangle on every half of screen is futher handled by two
> > pipes if its width exceeds a limit for a single pipe.
> >
> > Signed-off-by: Jun Nie <jun.nie@linaro.org>
> > Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > Reviewed-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
> > ---
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c  |  11 +++
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h  |   2 +
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 137 +++++++++++++++++++++---------
> >  3 files changed, 110 insertions(+), 40 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> > index d825eb8e40ae8bd456ede6269951339e3053d0d3..e925d93b38feac0594d735fdc2c5b9fd5ae83e6a 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> > @@ -1604,6 +1604,17 @@ int dpu_crtc_vblank(struct drm_crtc *crtc, bool en)
> >         return 0;
> >  }
> >
> > +/**
> > + * dpu_crtc_get_num_lm - Get mixer number in this CRTC pipeline
> > + * @state: Pointer to drm crtc state object
> > + */
> > +unsigned int dpu_crtc_get_num_lm(const struct drm_crtc_state *state)
> > +{
> > +       struct dpu_crtc_state *cstate = to_dpu_crtc_state(state);
> > +
> > +       return cstate->num_mixers;
> > +}
> > +
> >  #ifdef CONFIG_DEBUG_FS
> >  static int _dpu_debugfs_status_show(struct seq_file *s, void *data)
> >  {
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
> > index 94392b9b924546f96e738ae20920cf9afd568e6b..6eaba5696e8e6bd1246a9895c4c8714ca6589b10 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
> > @@ -267,4 +267,6 @@ static inline enum dpu_crtc_client_type dpu_crtc_get_client_type(
> >
> >  void dpu_crtc_frame_event_cb(struct drm_crtc *crtc, u32 event);
> >
> > +unsigned int dpu_crtc_get_num_lm(const struct drm_crtc_state *state);
> > +
> >  #endif /* _DPU_CRTC_H_ */
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> > index 5ae58352cbee1251a0140879f04fc7c304cae674..89a5feb6308bcac537562c3dc4e61c16c92e460c 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> > @@ -824,8 +824,12 @@ static int dpu_plane_atomic_check_nosspp(struct drm_plane *plane,
> >         struct dpu_plane_state *pstate = to_dpu_plane_state(new_plane_state);
> >         struct dpu_sw_pipe_cfg *pipe_cfg;
> >         struct dpu_sw_pipe_cfg *r_pipe_cfg;
> > +       struct dpu_sw_pipe_cfg init_pipe_cfg;
> >         struct drm_rect fb_rect = { 0 };
> > +       const struct drm_display_mode *mode = &crtc_state->adjusted_mode;
> >         uint32_t max_linewidth;
> > +       u32 num_lm;
> > +       int stage_id, num_stages;
> >
> >         min_scale = FRAC_16_16(1, MAX_UPSCALE_RATIO);
> >         max_scale = MAX_DOWNSCALE_RATIO << 16;
> > @@ -848,13 +852,10 @@ static int dpu_plane_atomic_check_nosspp(struct drm_plane *plane,
> >                 return -EINVAL;
> >         }
> >
> > -       /* move the assignment here, to ease handling to another pairs later */
> > -       pipe_cfg = &pstate->pipe_cfg[0];
> > -       r_pipe_cfg = &pstate->pipe_cfg[1];
> > -       /* state->src is 16.16, src_rect is not */
> > -       drm_rect_fp_to_int(&pipe_cfg->src_rect, &new_plane_state->src);
> > +       num_lm = dpu_crtc_get_num_lm(crtc_state);
> >
> > -       pipe_cfg->dst_rect = new_plane_state->dst;
> > +       /* state->src is 16.16, src_rect is not */
> > +       drm_rect_fp_to_int(&init_pipe_cfg.src_rect, &new_plane_state->src);
> >
> >         fb_rect.x2 = new_plane_state->fb->width;
> >         fb_rect.y2 = new_plane_state->fb->height;
> > @@ -879,35 +880,94 @@ static int dpu_plane_atomic_check_nosspp(struct drm_plane *plane,
> >
> >         max_linewidth = pdpu->catalog->caps->max_linewidth;
> >
> > -       drm_rect_rotate(&pipe_cfg->src_rect,
> > +       drm_rect_rotate(&init_pipe_cfg.src_rect,
> >                         new_plane_state->fb->width, new_plane_state->fb->height,
> >                         new_plane_state->rotation);
> >
> > -       if ((drm_rect_width(&pipe_cfg->src_rect) > max_linewidth) ||
> > -            _dpu_plane_calc_clk(&crtc_state->adjusted_mode, pipe_cfg) > max_mdp_clk_rate) {
> > -               if (drm_rect_width(&pipe_cfg->src_rect) > 2 * max_linewidth) {
> > -                       DPU_DEBUG_PLANE(pdpu, "invalid src " DRM_RECT_FMT " line:%u\n",
> > -                                       DRM_RECT_ARG(&pipe_cfg->src_rect), max_linewidth);
> > -                       return -E2BIG;
> > +       /*
> > +        * We have 1 mixer pair cfg for 1:1:1 and 2:2:1 topology, 2 mixer pair
> > +        * configs for left and right half screen in case of 4:4:2 topology.
> > +        * But we may have 2 rect to split wide plane that exceeds limit with 1
> > +        * config for 2:2:1. So need to handle both wide plane splitting, and
> > +        * two halves of screen splitting for quad-pipe case. Check dest
> > +        * rectangle left/right clipping first, then check wide rectangle
> > +        * splitting in every half next.
> > +        */
> > +       num_stages = (num_lm + 1) / 2;
> 
> Hi Dmitry,
> Because the plane is checked before crtc is checked in the drm framework. While
> the topology is decided in crtc check. Thus num_lm is 0 when this function is
> called for the first time. As a result, the below iteration is not run
> at all and leads
>  to iommu warning.

How does it lead to IOMMU warnings?

> Do you suggest to change drm framework with adding extra crtc check before
> plane check, or you prefer the below line here?
> 
> num_stages = max(1, (num_lm + 1) / 2);

DRM framework provides enough hooks to be able to influence the order or
operations without changing the framework. But, I'd like to point out
that for the virtual plane case we already perform plane operations
from dpu_crtc_atomic_check(). You can employ the same approach.


-- 
With best wishes
Dmitry

