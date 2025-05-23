Return-Path: <linux-arm-msm+bounces-59178-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DB20AC1EB2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 May 2025 10:30:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 90D694A756B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 May 2025 08:30:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7624E2820B7;
	Fri, 23 May 2025 08:30:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KpHJpQN0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85A2023A9A8
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 May 2025 08:30:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747989011; cv=none; b=A4d2f2RgFOnxrAdog0CqX2zR0uPlm3JeRHXCxYRv1ZL9QXfddx7B9zj+Oz0BsaU1Lx2OEnCK5pA2CoKqOjV9mD9oGYReWRwP7Vv7SFMVv7XyCKxr/V1morIIugLazKnH90sn+lk0klar39/zEQdhqcP2pWpZXLhyfYlCTynsZYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747989011; c=relaxed/simple;
	bh=Ba/qEJqFr6Ls+4+wQI/kPTBtztizrY6suF60TaJ7cfc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=djWAHWekw+qinK5ZiQK76zgMCtHCLswyC+/P3Nr/POOsuKBr/UiV8G4wVP75GfyXD22NrzfcfTBVayr24+PQrMn/9ZRk7JmCiUUf6U9MRX5ROeWIMaRSfLr5EB5gpurYdu6Z5rpntsTVl98/kbG+/JxyFCsoWJUd5wDhBzWmXQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KpHJpQN0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54N3EMhB031739
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 May 2025 08:30:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=VfiheIwlbsPSX3tKRqcUN7oc
	TCW0r9qBhyKUU/kzcNM=; b=KpHJpQN0dwtJLO+HTWzFKrFnk7bx+iSwn8bK+dSQ
	OcDSzPCmLUMrm/kv9g/5xyF0sMhlh7fYHwVBpNLpRtNlXPqjfnzO2V7n7/shn76n
	H+1+qDbvv7oTE12vRufyynS784yTKkqgKG3HYryJHeGvRlw6VpH29+fp5d6v2mh+
	O0EljvCWr36c4t6relmE6w4GeExam1CEKbOEzDi2Vv2gXldPFq+aLeAFJRke+mBQ
	wi4GT93K8pVkXpt80tvRVnaalOgvdiYPtKD4WUzq3WLp8LDuhgYoZIqJPy7cXJB0
	SOeAYJIab+0mlin0k1dpH1a8nO9fBiWQkDml+gGCajTHSw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46s8c27ydk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 May 2025 08:30:08 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c9255d5e8cso1504963085a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 May 2025 01:30:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747989002; x=1748593802;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VfiheIwlbsPSX3tKRqcUN7ocTCW0r9qBhyKUU/kzcNM=;
        b=sjE7j/otVFZEXfksMt10dT+V2P4ObWrQQ3X2j57nTxOxsnyGR1eRZ5vdc760znvgWG
         ip0/sUwkcJvRZ9kRLLiaFXuD4oZxuVQR+UgfO5+O7r146r7TS1w1cPEv3HnkS5hQXLNZ
         fi+qYbzMshPVUx/nIMrvw6Mzq2oPLh7V7D+mrR65o5tG7Gm155j8Id4IVYSm4EAejp1L
         wmSarSWupspEJHBCqBK/g3azB9KoMxtu/3MDBxvgUuCgOERIwoIkoxkSY7vuYXWK4u3u
         OuZZbYt0yW8KVLz84Z/IX+UbpAX7Oxjk1hQqVSEG5RMDqwNCvNluMrzdkmNtoNQh5NWP
         OtCQ==
X-Forwarded-Encrypted: i=1; AJvYcCX8QCii+yEyhl0aLngs9EHpqKe8LOzL79b80omKouCnXVuGY1i0/Fj+IyAwOpE1N1NTN1VUAqvKq/wMOXCE@vger.kernel.org
X-Gm-Message-State: AOJu0YwgwID8l/mlvOpP7U8todzZwsOBUJF0Aq7fYyUei3Srb/o9GEnj
	295f+wS/JzPUuKKmIllrRHG+bb+jELrGyICfIVzyuK3RgPUyNaUZf3KdhimlDzcv5C7GOqhnwwQ
	+KqKpNL6dv5Fi4hxwu5am3NJ4DyGTom8x6JhTigLCZ1Xf647GoXAoVux6ywHswxyXgZ78
X-Gm-Gg: ASbGnctGO547HCSm8jrgucwsOz8j1vYZoW6c0Yj38uclv9M6KpcLhqbQZg72n0DWcHr
	StDhtdhOAWEzeRF9pZUArm17BafaneFPZsNLRSVYWRw845RjoKs9aW2tjaGzD+3oqKtBe5obWQc
	/Lc08pjDWXcKRTUaiktaHwM6b7/HHAuzVIQpyr9H+1OoZWmHJf2uZX1LonGbDHHow6UCX3vG0rx
	73UgYOyeK/3kCBGOp3/cpLnnAdUtepa7sXbuj7PEcr37ZYWCWSZffy9zqMp6I6NKM/z1Nc0JNw4
	fXa5oeLbgjh1WFk65vcNYEo2K9rRweXfziKeSueqftmY6bb7WpCrT4k4Se5LM0MiJ4d5XyRjIoU
	=
X-Received: by 2002:a05:6214:2aa1:b0:6e8:fbb7:675b with SMTP id 6a1803df08f44-6fa93aa463fmr35204586d6.32.1747989002048;
        Fri, 23 May 2025 01:30:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEQTPt4MTIbkICZvOrh1skICymAaWmqgOHvMqVvofwa6vGpCOsSPPMr6URNTP7Fxd27LeFefg==
X-Received: by 2002:a05:6214:2aa1:b0:6e8:fbb7:675b with SMTP id 6a1803df08f44-6fa93aa463fmr35204156d6.32.1747989001635;
        Fri, 23 May 2025 01:30:01 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-551faf6be77sm1933997e87.84.2025.05.23.01.30.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 May 2025 01:30:00 -0700 (PDT)
Date: Fri, 23 May 2025 11:29:59 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Abel Vesa <abel.vesa@linaro.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Jonathan Marek <jonathan@marek.ca>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Clark <robdclark@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Rob Clark <robdclark@chromium.org>, linux-clk@vger.kernel.org,
        Srinivas Kandagatla <srini@kernel.org>
Subject: Re: [PATCH v5 21/24] drm/msm/dpu: Implement 10-bit color alpha for
 v12.0 DPU
Message-ID: <dlkrweid62i6jz3iexahbludm32hppzen2odjx27sxfe6opt5c@zqnryzjpzqoe>
References: <20250430-b4-sm8750-display-v5-0-8cab30c3e4df@linaro.org>
 <20250430-b4-sm8750-display-v5-21-8cab30c3e4df@linaro.org>
 <aDAbxAnCN1lGGcGH@linaro.org>
 <aDAdax7xdeDsvQHB@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aDAdax7xdeDsvQHB@linaro.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIzMDA3NyBTYWx0ZWRfX/WqAzN0EbOd+
 mRAOi2qo8VaDp1te81prFT+12I5UJcWP5gKd1iAxmoj0AUFdwveWeBhJ767ZCEKKTZzpkXCl8tJ
 rlFYCsV9f9boRLORwJ/zJjfxqJjdJzE3wTaFblKgbmYEqFx7NOpRuwQHvJ34Uwfyw6FBOAAY0Fh
 GZBeUfddMSkY75tcibU8aFsxXT1ue4psqZbwHmWkxfvpuWLIfawPzN70dvQE7Z5SheFSN37bfnd
 XNKLfBSfdQoHqaD6V/QyLNg0k4YYe870sl9ZgNPuiNMG5tBD56mhCwUa0hDQyH+Ul56sHIOBxts
 pSCtRcyzTNPIk5zDbVjw4vMR8o7SVlOK4gF4Tq7xuxVAldsvqAwG5PvihUXW0qtpJsfwwXl0514
 5LJhz3x1BckcTWX4v+/2+nXy3exnFfbVxbO6oHrH2xsbixbOB65icE8yz91IfTZhX0QpqV35
X-Authority-Analysis: v=2.4 cv=RIuzH5i+ c=1 sm=1 tr=0 ts=68303210 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=pcGS-iR_AO2RkNitFtoA:9
 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: 4SGdmiSF9hUPAK4eSscBKnv7Vu7R13vB
X-Proofpoint-GUID: 4SGdmiSF9hUPAK4eSscBKnv7Vu7R13vB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-23_02,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 suspectscore=0 malwarescore=0 bulkscore=0
 mlxlogscore=999 spamscore=0 lowpriorityscore=0 mlxscore=0 priorityscore=1501
 adultscore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505230077

On Fri, May 23, 2025 at 10:02:03AM +0300, Abel Vesa wrote:
> On 25-05-23 09:55:00, Abel Vesa wrote:
> > On 25-04-30 15:00:51, Krzysztof Kozlowski wrote:
> > > v12.0 DPU on SM8750 comes with 10-bit color alpha.  Add register
> > > differences and new implementations of setup_alpha_out(),
> > > setup_border_color() and setup_blend_config().
> > > 
> > > Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > > Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> > > 
> > > ---
> > > 
> > > Changes in v4:
> > > 1. Lowercase hex, use spaces for define indentation
> > > 2. _dpu_crtc_setup_blend_cfg(): pass mdss_ver instead of ctl
> > > 
> > > Changes in v3:
> > > 1. New patch, split from previous big DPU v12.0.
> > > ---
> > >  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c  | 19 ++++---
> > >  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c | 84 +++++++++++++++++++++++++++++--
> > >  2 files changed, 94 insertions(+), 9 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> > > index a4b0fe0d9899b32141928f0b6a16503a49b3c27a..90f47fc15ee5708795701d78a1380f4ab01c1427 100644
> > > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> > > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> > > @@ -320,14 +320,20 @@ static bool dpu_crtc_get_scanout_position(struct drm_crtc *crtc,
> > >  }
> > >  
> > >  static void _dpu_crtc_setup_blend_cfg(struct dpu_crtc_mixer *mixer,
> > > -		struct dpu_plane_state *pstate, const struct msm_format *format)
> > > +				      struct dpu_plane_state *pstate,
> > > +				      const struct msm_format *format,
> > > +				      const struct dpu_mdss_version *mdss_ver)
> > >  {
> > >  	struct dpu_hw_mixer *lm = mixer->hw_lm;
> > >  	uint32_t blend_op;
> > > -	uint32_t fg_alpha, bg_alpha;
> > > +	uint32_t fg_alpha, bg_alpha, max_alpha;
> > >  
> > >  	fg_alpha = pstate->base.alpha >> 8;
> > 
> > For the 10-bit alpha, you need to shift here by 5 instead of 8.
> 
> Typo. "6 instead of 8".

Granted there would be a next iteration of this patch, I'd suggest to
modify _dpu_crtc_setup_blend_cfg() to always use 16-bit values and pass
them down to LM's setup_blend_config() callback. Then LM can perform
version-specific shifts, utilizing either 8 bits or 10 bits of alpha
channel values.

-- 
With best wishes
Dmitry

