Return-Path: <linux-arm-msm+bounces-55360-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D143BA9A9FF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Apr 2025 12:22:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 15F5117DA32
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Apr 2025 10:22:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21DF721D584;
	Thu, 24 Apr 2025 10:22:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ljeIjiWM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CE72221F0A
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Apr 2025 10:22:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745490162; cv=none; b=T5tkyi2UrgRleMzG+1zfzx2KsWHBpFAua3t3dU5rxJpXQnDb4GR4NKv5JQZ4mZ4wGaHeV+XpBDVFYcaORQUx7uJTwj7MCf0RDO3jDutMJLMqvDuSVCFaLmwxhklyOZJvobS2cb90xl9akppPTVChqz0Dq270jy62mHQENJjoYUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745490162; c=relaxed/simple;
	bh=BAtigd51U4uYQawH2leKL2DrNhD2xbURj0nU4NCxYSI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GXZubSORe9D6DjXiKM6wZ8lsa0FDMELeVR8JMPuU7P6Xv/VqilBJJARr6t2l8rzxGN6ce7aWAOKfApe49NFBIJDQJJfqFb8VyMsButyjV+QhLVi50DBK8ES5WjWT8Rr4u19p0KdgaNHEoBQwAGFJR58ww06wqurtSuMPMmGQQHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ljeIjiWM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53OA8AHj003415
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Apr 2025 10:22:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=SRAxpDNuwfhW3PHrfYeTwTaf
	uh1/vvz3kKMzJSGCp2s=; b=ljeIjiWMTqg6x1v1U/Tu9BxU0yP/PtChw5oBLEOl
	stSVbEmAl1+g6WEzxTMaGkkBD4kyCQkoWVbgIyB90Z/MOrVj4mtYm+P8ww6EVTwZ
	Iy6SLeNIkw3xd5dCQDUMGBUhhnCIpIl8t3/ax+ls8q0N2eCnTQl36deQRr9vR5SM
	9RyghjNu9WyhCaDgxwSm8j9py8myvS5/MFeEplfsvzHxQoVSp5kc27e05ODhXB35
	21lK7kpSQ/SCUgZQHa8hCA8KJpaG4fIb07TUIUDra5xWT2RDCbK4eXXKprulbInB
	YQ9N70nQ7VKg3OJVqTEgB38qvyUb2ilkZ5uym6JzrHvhcA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh0n490-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Apr 2025 10:22:37 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c5c82c6d72so137596985a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Apr 2025 03:22:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745490157; x=1746094957;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SRAxpDNuwfhW3PHrfYeTwTafuh1/vvz3kKMzJSGCp2s=;
        b=oZDv1DsrmE4PgxaLaiAnVeiZGZ4oQTImQxj0TErdAisx/z58OOrsWkniLjndbYFzh6
         HaVP3iveomE37o06P/XHvfPsMJvRiTXs/ukAJi1H6yAcRwsmADUxh8fO8JmrtmzUFGKS
         mEKAUJ/rm6Rv0OVKye0/bTRCvTf0UUYIZX7TD/9hnqgSg3gTI5EqNuLc7eYJ3NoJrUcg
         bJo/WVac/07w6Ath6ySqNdUuM1k2fBTYbJYCuRlo9xRd+C5jC1flG9pKf6WwZKKOV2k+
         dkWxz4MFJyu8dfAkFJoCTx0b/fhVKL8cQAnePhwUcBbSo+xY3d18TE1PMtsl6TGMMxhB
         YsEQ==
X-Forwarded-Encrypted: i=1; AJvYcCWVREA/uAmq2KlVzI2E9zmVtJszYYHBVVJsUWw5yQiAZ2dXp2WtRjjbX9jDXPOZ9xAK0hkb+yM5y7bYaR0m@vger.kernel.org
X-Gm-Message-State: AOJu0YznAUuXewmOwXb/rDzc/QRxYhQJW8nREdAyiXhj8p/OiXHB5jgu
	jM0IWFmC8jZBN88PWh5Jix741j1UjLb7FY3oeWoAgvU3G5WQQpcmtDMZNmXTW3DQ+zt5xOjTPDO
	n81xpq8x/oKYjq4S6HRTYmu1eYHUl0WTmNSlaKS2jDjARXSUzkQG0s2uts91mZmb8
X-Gm-Gg: ASbGncvnqyty39yd28cAGldbFe/IhEq8Vuko1vfc5gVqRdQCxpb/Jl3SSuEGjClYxM7
	9zlbCvG63Mf8M56REEUSjDjr9DVB8hwXYjBZarhjTguV7D6/WRP5mP/CtbBcmVd+ezesi80PXv9
	aakGQ5ebbLV0O3j7J3vNGee6vyN14G3GodqXay0NEsDDaS3QAJAPIZKxy7XT+aqO6g0bLi1ATdt
	8y0wZ6Ge1azXv9nk81RhRNJSZxsbOKgydq1Ul6/Tztp+q1lTSEQJsBuH6AqvZQCRG+9R9UMhhIc
	cVFFhpco1y+Rm7mBo5/08LkVDqyMtx2UCoDMctYrz7q/jHs274vwIJWQPA5HMts8wFpD+geQDQg
	=
X-Received: by 2002:ad4:5c48:0:b0:6e8:efd0:2dad with SMTP id 6a1803df08f44-6f4bfbea7a2mr28149406d6.12.1745490157191;
        Thu, 24 Apr 2025 03:22:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHgzsgx15Qut4NSB+bBKJh1rVxVjonV6TkGCbeCeN7hQttgUdN1oI7waEXbtgP5UUOSfMKNrA==
X-Received: by 2002:ad4:5c48:0:b0:6e8:efd0:2dad with SMTP id 6a1803df08f44-6f4bfbea7a2mr28149076d6.12.1745490156892;
        Thu, 24 Apr 2025 03:22:36 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-317cf659af7sm2028831fa.15.2025.04.24.03.22.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 03:22:36 -0700 (PDT)
Date: Thu, 24 Apr 2025 13:22:34 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v3 3/7] drm/msm/mdp4: register the LVDS PLL as a clock
 provider
Message-ID: <orh3v7knajhmpv4uzmarpgdbfhkhtipjxc7agfmvlqdzggpwzz@yohc5d763ynp>
References: <20250227-fd-mdp4-lvds-v3-0-c983788987ae@linaro.org>
 <20250227-fd-mdp4-lvds-v3-3-c983788987ae@linaro.org>
 <029f3bfb-a031-4dfe-a2b4-bc41a0da7772@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <029f3bfb-a031-4dfe-a2b4-bc41a0da7772@quicinc.com>
X-Proofpoint-ORIG-GUID: ATE-tRrVCQ7km-F9C9u3JzpUnUVO89z3
X-Authority-Analysis: v=2.4 cv=ftfcZE4f c=1 sm=1 tr=0 ts=680a10ed cx=c_pps a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=DMSj4145jBr-G1g3eIsA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: ATE-tRrVCQ7km-F9C9u3JzpUnUVO89z3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI0MDA2OSBTYWx0ZWRfX2+CqZRjQyxOa cXcWKFeSX8J56mSYGG3iteP8cJ96vSgzm31pbqCva884N6zh+GA0Xy4zec9i60n/nW/KWucqvdf xVEKPM6hfbZysSPAnaKGDUnahoTxISJsAeI3r3B3VwddE/coqnafberS+TDMPGz4QZbCSLPnkyy
 5iPDApCzThrRdP6xkaBjjh5UABE0Vnw3S/pTPleNP7NHvW3i8ekvXM/5gaFHvJK/Rt83IAzbIFw Y8Y7s7SzgbHnC/yxl0eAkzH/4O3nq4T0pdKKPeyBesOUoyRu9X0J4o/U2dbLII5z+VCS0/kd6LB EAT2ldOFV02fJfsaWWJPxR2tKg8Apo24IK0I6z4Ka/cIVmpbf0vSWro01qgDNuDqd66eshfEKxN
 GLbOVk8XRIIfPiZE06Fq3OlCqwS2pncGENkdCCtbwfo9mZVl9kkh3vs0Ligl8N5+ZripWcyO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-24_05,2025-04-22_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxscore=0
 suspectscore=0 mlxlogscore=999 lowpriorityscore=0 phishscore=0
 malwarescore=0 impostorscore=0 adultscore=0 spamscore=0 clxscore=1015
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504240069

On Wed, Apr 23, 2025 at 03:54:13PM -0700, Abhinav Kumar wrote:
> 
> 
> On 2/26/2025 6:25 PM, Dmitry Baryshkov wrote:
> > The LVDS/LCDC controller uses pixel clock coming from the multimedia
> > controller (mmcc) rather than using the PLL directly. Stop using LVDS
> > PLL directly and register it as a clock provider. Use lcdc_clk as a
> > pixel clock for the LCDC.
> > 
> > Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >   drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.h          |  2 +-
> >   drivers/gpu/drm/msm/disp/mdp4/mdp4_lcdc_encoder.c |  8 +++++++-
> >   drivers/gpu/drm/msm/disp/mdp4/mdp4_lvds_pll.c     | 22 +++++++---------------
> >   3 files changed, 15 insertions(+), 17 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.h b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.h
> > index 142ccb68b435263f91ba1ab27676e426d43e5d84..b8bdc3712c73b14f3547dce3439a895e3d10f193 100644
> > --- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.h
> > +++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.h
> > @@ -207,6 +207,6 @@ static inline struct drm_encoder *mdp4_dsi_encoder_init(struct drm_device *dev)
> >   }
> >   #endif
> > -struct clk *mpd4_lvds_pll_init(struct drm_device *dev);
> > +int mpd4_lvds_pll_init(struct drm_device *dev);
> >   #endif /* __MDP4_KMS_H__ */
> > diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_lcdc_encoder.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_lcdc_encoder.c
> > index 8bbc7fb881d599e7d309cc61bda83697fecd253a..db93795916cdaa87ac8e61d3b44c2dadac10fd9e 100644
> > --- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_lcdc_encoder.c
> > +++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_lcdc_encoder.c
> > @@ -381,7 +381,13 @@ struct drm_encoder *mdp4_lcdc_encoder_init(struct drm_device *dev,
> >   	drm_encoder_helper_add(encoder, &mdp4_lcdc_encoder_helper_funcs);
> >   	/* TODO: do we need different pll in other cases? */
> > -	mdp4_lcdc_encoder->lcdc_clk = mpd4_lvds_pll_init(dev);
> > +	ret = mpd4_lvds_pll_init(dev);
> > +	if (ret) {
> > +		DRM_DEV_ERROR(dev->dev, "failed to register LVDS PLL\n");
> > +		return ERR_PTR(ret);
> > +	}
> > +
> > +	mdp4_lcdc_encoder->lcdc_clk = devm_clk_get(dev->dev, "lcdc_clk");
> >   	if (IS_ERR(mdp4_lcdc_encoder->lcdc_clk)) {
> >   		DRM_DEV_ERROR(dev->dev, "failed to get lvds_clk\n");
> >   		return ERR_CAST(mdp4_lcdc_encoder->lcdc_clk);
> 
> Change seems fine to me, one question on the order of changes, DT change has
> to be merged first otherwise it will fail here?

It is already semi-broken, as just enabling the PLL is not enough. The
branch clocks in MMSS are to be toggled / manipulated. As such, it's
questionable if we need to coordinate or not.

> 
> Will that be managed by co-ordinating with the DT maintainer?
> 

-- 
With best wishes
Dmitry

