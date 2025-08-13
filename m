Return-Path: <linux-arm-msm+bounces-69038-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 56769B2522F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Aug 2025 19:40:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 10BDB8822A8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Aug 2025 17:40:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFF3F244673;
	Wed, 13 Aug 2025 17:40:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WZHLL5AQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AE9F1F582E
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 Aug 2025 17:40:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755106831; cv=none; b=K+bfodN4ibjmAD1uuHTTatJ4KGRJ44WnBIVS4InsM4i9WFDC2Icw0dkUg8ZT+PDmMdKt/kR9E9GBxgquM8eItYjgxcW6myiHfNx5JOiwL+4L9/174xeWqKngW9+0CEZwWXMgTth6rXzO1QJ460hmvQZGImyyOQzZDhNpnNYoraY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755106831; c=relaxed/simple;
	bh=wOSj2Ah2UgduIpbrNuIewezDqNh/Xvc0kQlIW+94XPA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SWpxwM9b2BZSfEXe1C+rM70klwCajJd6W717cP1vAblW56JpGJhZ6u1sLAQGsB/uFcmjQqMObCyL8o0fV74haUbg61j3XK6O+EUJ0BsVhFkr3NSmQTeT23JSNHq0VRdUIFBwwcqcxWQLEHgna6ZPU/MxUTSeqgi9fnzsMSOQHbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WZHLL5AQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57DBLgkr030136
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 Aug 2025 17:40:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SGOnx8wASardlLmh6F+MJ3xLLydD3abWl/e37ujFDdw=; b=WZHLL5AQnirT0KJQ
	1IJe83vJhzUs/s44Jt9JxckEh+IY5kC5OixiGT+CLmR1z37ANq7EwwVaiUeN+4S7
	0aCWLW4gZJkrqSdxLm1dQp7XYaWcSEvEw+vjMzimZHhiZeW2P/ZV7inhrnFo7dKI
	G7vZgD+2LFYLvqtx0kcx5FVmksOKvN03zMDNFXecKKnLlikeQci8YdlkLyDi4SVF
	ib7JdMiyEGZpH4tssw7jZ5qP6Vb3eb8xB2wkzCiaktGdyjDzAbdr1AV3Apocvv96
	MRGcpOT7wjh8Aa24mo9X3wRXSdfRqUP6ue3UUQ71yiuF2Gd39D60epy5GvpZYZjT
	zGbLKw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48fm3vqn63-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 Aug 2025 17:40:28 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4b10993f679so2463081cf.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 Aug 2025 10:40:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755106828; x=1755711628;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SGOnx8wASardlLmh6F+MJ3xLLydD3abWl/e37ujFDdw=;
        b=Mx3CJ0GxqZ94SuHRwyw698tm/GsQPiS70phKk/he05FMbj9AzjSmHZyOAMuXQ3fM52
         uGJYR7lW13weVHSQhTa7HnvIkB8Gp0EbwilOt7d0lnttaTuDlCfDWDrwGVGffYcHiveU
         ti64jTWmLActo60MtixvFsQRhz39grJylYzmk1kzIpVU3ILZO0uDk3Fs3xmXkhTKpEr0
         /bWunxVeCr6iKs/dQApgQ0TDs4InVhQbnOnBMSJaByHSJUVOSnO14NAf6SmLy+4Gv6mP
         GwZXWNyby7oL0wgqzOWp17LPxzM/5U5bizmPW5dCL9p9XOBFYfkhqqywjaAS0UyjiQCQ
         d81w==
X-Forwarded-Encrypted: i=1; AJvYcCU4QuO8wsnkunl8OlI2xU3iPQv5tGcGGlGmdsqtLGRegusWAAdptklArJe+r0NGc72ntbcPoMXd6CvIecHy@vger.kernel.org
X-Gm-Message-State: AOJu0YwLuhTJ3BTKxQCu8vBkaDX4P1T0ZcaX4upW/NoQzDAB/ZIag5mF
	UlbbZnyBSkqy8uFmF6OW1AFUf0iE41xsuF3afeviEHNEVEH+zrv9Z7zsB5biEynOjx0D4XhmH+r
	BUB6hALvmtLnnv/UoeBwGbvhtsHBtEMrLmxI4V85tNUrLw6SidSJfcShQETrAAbJbjYHj
X-Gm-Gg: ASbGncs7ZkwuvqvgJ/XTmv6OyyC0+KOzsMzvZoW/o8ZEj0eYCbKmqr4LDbd7ZVl2YqF
	v7q8bXS1ZrbGMpkb7j26MvshXZ5gOPqH5W0PJZ2ARQDf8dnluwh9pSveFJpC6y1QP1m/Yp+Zg+x
	BtvkKoyN8ZkDZYMLFWdZ+/eNe9E44ZV3zvaZHdXJ7jecLySLviM6VIOQZjBEsyU3KExCMips+iH
	aG2kUJH0+B88cYmo50dHEKviemfdeC0kXy/zL0ajqVnqX1xeF3+J/4cOKAop+tBOL4HUIKugrXG
	CZwD7zh1XJRg7ogPhypEZpocmGhmuxE5ZfpU3IOETSh9VFXHTjjXzU1w9INgo3TnT6MQ3Gj9eVx
	EVn4z4Hn0Uy0dyPoVOojsYwPQIF/u9tVLdkNG6LJnrALnuM1gnGR/
X-Received: by 2002:a05:622a:1826:b0:4b0:80c7:ba32 with SMTP id d75a77b69052e-4b10aa6b551mr698431cf.38.1755106827958;
        Wed, 13 Aug 2025 10:40:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFGSYwB2jPhXDGF7QnvYQoWrDeEZN5VgRz2fGxMg00AQDFPHwe889FhEH4ieuMEs9en12IG6Q==
X-Received: by 2002:a05:622a:1826:b0:4b0:80c7:ba32 with SMTP id d75a77b69052e-4b10aa6b551mr697831cf.38.1755106827256;
        Wed, 13 Aug 2025 10:40:27 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55b8898bd63sm5375446e87.20.2025.08.13.10.40.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Aug 2025 10:40:26 -0700 (PDT)
Date: Wed, 13 Aug 2025 20:40:24 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Chenyuan Yang <chenyuan0y@gmail.com>
Cc: robin.clark@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
        jessica.zhang@oss.qualcomm.com, sean@poorly.run,
        marijn.suijten@somainline.org, airlied@gmail.com, simona@ffwll.ch,
        tglx@linutronix.de, krzysztof.kozlowski@linaro.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm/dpu: Add a null ptr check for
 dpu_encoder_needs_modeset
Message-ID: <2rtdf7azwluus757f3azwjacoiqussnoxfqqxtr3p3l4l7rkrt@dbk5pfdglugu>
References: <20250722211740.3697191-1-chenyuan0y@gmail.com>
 <ciawdvjevycjjuowmykfux2v25lvr66kzey4jklq7t5cjzqalj@qfcva77k2bvr>
 <CALGdzurR2XPoai8qshTX6hzgF-zLQ-FrsWxu5NGjrkjNzWaHaQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CALGdzurR2XPoai8qshTX6hzgF-zLQ-FrsWxu5NGjrkjNzWaHaQ@mail.gmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODExMDEwNyBTYWx0ZWRfX7ioslMVAS+RE
 jSDoZOU6Iqg4vZ2SGW1qgqQjvASyneH9TUtPmvBx9Kyl8Z6XIDYCkx0CYajUHdHtJyrGbRi2ev4
 IzG9IZoxjN9mxTPcEpkdXJwXQh4q+xEJh9KMQzgsOsisFv2duTJ5nTYkZH3JCrvCZ1hOdylXvrq
 v92tEdOVA6j6ehylK76eKeRHhZHVE0OjD+Xmsx96TTDA+T5KHRHXoAzkLZtygdQbQcm/z0PB/4T
 h1OyFLr24g00U/ewZd07DBVnkzwNLIBu8b7RlCopTy2OBG7KseGKuvyj/30V2pGGqob6x7x7j1+
 Gr6Wda+T68FoZouuzdOGvKYfw+Q6yqq4lmNtGoQI/G//GbU5wZF++1bc6HQp9x1rYnHNuluH7Sp
 9rQAoDhZ
X-Proofpoint-GUID: QRBr67P2_7QOYC5oH6xVSb_wDtE5TQyq
X-Authority-Analysis: v=2.4 cv=A+1sP7WG c=1 sm=1 tr=0 ts=689cce0d cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=jpGDCbsBDmrldJ3tXloA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: QRBr67P2_7QOYC5oH6xVSb_wDtE5TQyq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-13_01,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 priorityscore=1501 malwarescore=0 spamscore=0
 phishscore=0 clxscore=1015 adultscore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508110107

On Wed, Jul 23, 2025 at 12:43:06PM -0700, Chenyuan Yang wrote:
> On Wed, Jul 23, 2025 at 12:05 PM Dmitry Baryshkov
> <dmitry.baryshkov@oss.qualcomm.com> wrote:
> >
> > On Tue, Jul 22, 2025 at 04:17:40PM -0500, Chenyuan Yang wrote:
> > > The drm_atomic_get_new_connector_state() can return NULL if the
> > > connector is not part of the atomic state. Add a check to prevent
> > > a NULL pointer dereference.
> > >
> > > This follows the same pattern used in dpu_encoder_update_topology()
> > > within the same file, which checks for NULL before using conn_state.
> > >
> > > Signed-off-by: Chenyuan Yang <chenyuan0y@gmail.com>
> > > Fixes: 1ce69c265a53 ("drm/msm/dpu: move resource allocation to CRTC")
> > > ---
> > >  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 2 ++
> > >  1 file changed, 2 insertions(+)
> > >
> > > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> > > index c0ed110a7d30..4bddb9504796 100644
> > > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> > > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> > > @@ -729,6 +729,8 @@ bool dpu_encoder_needs_modeset(struct drm_encoder *drm_enc, struct drm_atomic_st
> > >               return false;
> > >
> > >       conn_state = drm_atomic_get_new_connector_state(state, connector);
> > > +     if (!conn_state)
> > > +             return false;
> >
> > Did this happen in a real case or is it just
> > yet-another-static-analysys?
> 
> This is a static-analysis detected bug.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>



> 
> > >
> > >       /**
> > >        * These checks are duplicated from dpu_encoder_update_topology() since
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

