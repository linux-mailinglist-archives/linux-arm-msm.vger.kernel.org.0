Return-Path: <linux-arm-msm+bounces-89247-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D2F9D27DFB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Jan 2026 19:58:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 90D94309AC25
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Jan 2026 18:36:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC4C73BFE5F;
	Thu, 15 Jan 2026 18:36:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Etm+Kxby";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ffbYjMnf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7E883C0092
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 18:36:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768502203; cv=none; b=P5MChipoi1TNMDgSaHEhATzYuRJkuDhzPrnFceZZYQz+5lTPjQjp2y9cENI/JfrakOT4Er6SecWq9SRiQ+m838dOzHyOpGI2af+2DX/m1mWqHj6dctniIjt3EvAu1Bw4qSEOf316S7MMwfWBxgkddgtfSrzv+8eAu2DQbkU6SD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768502203; c=relaxed/simple;
	bh=UaTJ80s1Z+NFTf+cliMn5brfSOSN467UO5p2RnM+WR8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h6fAQv2LxhDbcWQIma3CJ0itcvGuX1DCTnoP6IcocpFUNrCD+Eej9d1slqe/g1XXO+xZnsr8LQtpHXvIrD01cIqMBL3GhIdb7GtNv8ZDTD4XDyZdOsVUa+DEPWoe/+qo7Rku0J7S19pfEJbPgcYKusTd95RBFXNDrD/KW2uTN1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Etm+Kxby; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ffbYjMnf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60FFY7EM2174365
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 18:36:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TeyA75T2Mxcjvdi8sff1xwTk9Q2QdhifT8D9VGOWElo=; b=Etm+Kxby11Al3ys3
	KcYJC1TsTboDRL5Ai92RbiXb0CNiZdfqbQz2lp3rNZGNwMqgi8g1nrL/21pb9Prz
	8UHWqJogy1X+wHjI+m8RQffgrWFg5nuY2PEbDekhPSTtimitRNzVYwb6yrZyD3aS
	6AcoF8odadr8h3TPTrnUfL77hUozUOevruZmT9i7I9F3ybebguNjax56qwzyWlrS
	cV4rh0rc+W33RXUFAkmo17JJYjU4A/vrvXjCx0TeULS4V6Qo2WdKZe4kGLMt9vDM
	bruVts4+bCpLkouhUbyxV8+hx6kgyCQR0/BuwvbEMJkGlb6cvw2hT/eAztmOYFJ0
	sw/gMw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bq1xh8tnp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 18:36:37 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c52fd47227so240689885a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 10:36:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768502196; x=1769106996; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=TeyA75T2Mxcjvdi8sff1xwTk9Q2QdhifT8D9VGOWElo=;
        b=ffbYjMnfvWHDZNOfjbbcTC4tcmMuY27hML7sa53h9ju/p5TBH5L1UbOb+vo0q9Y5J9
         pTn0tXCKnvbPUG8mfMQGCdzd+mMCc9kdSlqlTvhwJz8+IMuaIhrXwJOFPzK7tFkGRahZ
         omZvHJZKdxuiyD7ptlcGu+NLq4dgQendWF060ewXOgxLmj/mSAuRD14Bu9hGtTBaVA3d
         BzLos3Z1FDlteRe78Xb2bfhqOMmd8pVxfP0Ne5Y7t7Rs0KirM4Q4OHhUD5A5tcdLblMl
         0dZWCDNyZ6xHJUmowqpL870cSSwOkOXgn1xtlOWHtsRd7UzGCbfu+E2slcUPiYR/dLDW
         pAXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768502196; x=1769106996;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TeyA75T2Mxcjvdi8sff1xwTk9Q2QdhifT8D9VGOWElo=;
        b=HLRRr4/4Sx2u6HCBdZJ9gnFG7UKRn4kqtdgVvfGoUSE9hEKQR7lpFXBnvZN91Kupkc
         qD0s0SoJGsdmyZsg19qi3vNRH4d9XSP0V4+rAT3Yew7hH5NV7IhQpLPtUj1ufGK5A0N5
         eVpHeY8AIyQwO91ju4jSEUdpwHO+aTm2XQ3QZzj96Tgo9fCZxvoiLzEvUeFjyH1EpQXw
         CMSdG8y+Fi2YHqjIeIV5wyKR2Ox7fHy003fnWpbVmsy94+b2O99rvKK4k/5x2JBsqN3v
         UaS2W/HXHiV6AKxBaK1F5/H8GuS892iro13/11ebhKGZCunT7nHY+kF7Cig1kIAQ2/be
         W5sg==
X-Forwarded-Encrypted: i=1; AJvYcCXO7spaFXpbF0IhM9pPJGaMHZKEvLfjK4Su9f59YZIgdfpV0nWQcRMjTZdqPvz9tglqS8Ju1RrvHvKWxetR@vger.kernel.org
X-Gm-Message-State: AOJu0YwHepzjWreX5e5wHlAzr1uZ5CeRgjdieAoexAndFewY7Tu/RW6B
	lEKAHpjFr5mq0potK38WuaD9FmQ5DiqDMaRGbjkAvzetuhjIjXv7cXi++e7Irog+Akk+A7K1CnP
	RtPZC6QFV9uJSweQAfyGrqjM889oijduHXHXzFJ4HZKCxNiYCuI6ET8rXiGaAtu3dH0ix
X-Gm-Gg: AY/fxX4oZX6SZ4LAhu3M00JI5zEjh7slO57JPzj6PueM8UJ7JBuEUkyGcu06ntl4dnn
	foMdcDCEI+mkGQQYErMSCRzNBQbo8LzqP0V8uojOyD4rQTvFCYqecDLrRVVBgM1TU56xrkNnCOu
	RLQZqQzH8KKC3ZabvzRdV6qsK69hY/lqltuOMPT9cbMuuzfFMNt7NuFPQw2bSZnAHs1rbigbt4x
	MG+Ix5z+EVuPZ6C2TqwBOFcZzQnog/oHrhlZFmT8GAPuqgrRHdXYpzYyIEEBlHbBJgkCyyQ92Mr
	VwKht6eJ2+r92fFSpQSBiiZDmY6o2sv1C9ZvGyQNisdfsrqmj/7nOOeJAyIJ7V5zw/bKUS+iD/f
	7csefZNbgvHAGUJYWnfUFPEKWtiqdYiex1nV7Bbw1GrWkkvU7XeO1VatUcHeEH5WSbwprjeOMGa
	sZWdpcYdFWmdEO0eMRQ3G5kMs=
X-Received: by 2002:a05:620a:29c5:b0:88f:c5d4:504e with SMTP id af79cd13be357-8c6a6958e1cmr43310385a.81.1768502196075;
        Thu, 15 Jan 2026 10:36:36 -0800 (PST)
X-Received: by 2002:a05:620a:29c5:b0:88f:c5d4:504e with SMTP id af79cd13be357-8c6a6958e1cmr43304085a.81.1768502195428;
        Thu, 15 Jan 2026 10:36:35 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59baf3979eesm60541e87.56.2026.01.15.10.36.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jan 2026 10:36:34 -0800 (PST)
Date: Thu, 15 Jan 2026 20:36:32 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jun Nie <jun.nie@linaro.org>
Cc: Abhinav Kumar <abhinav.kumar@linux.dev>,
        Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v16 09/10] drm/msm/dpu: support plane splitting in
 quad-pipe case
Message-ID: <pxuzmggpbsfl6im33mktaunv5tfrtsmpawypnikvcild2vtzl5@xgic6v2vwrsm>
References: <20250918-v6-16-rc2-quad-pipe-upstream-4-v16-0-ff6232e3472f@linaro.org>
 <20250918-v6-16-rc2-quad-pipe-upstream-4-v16-9-ff6232e3472f@linaro.org>
 <CABymUCNY9uo0Cm0KgM9yChuxJ22=Y-4JjHj7cEh5ByX8Nr3y-w@mail.gmail.com>
 <nvd4eksgcmeqlfwp4jc27fpuzi6otdhzcefdbmj7a2xgv2bqwr@r6rytxs7ibj3>
 <CABymUCP2yAQptCGCBX0X75iRSkKkfctiEaxUH7_eOpspR55_Kg@mail.gmail.com>
 <uh75cutkn4opgjbwebpqvhq4xfzep3jnsblaevpgs3gchg264k@gzgydmui2653>
 <CABymUCPkfYHhtxEqN7KgBPHEvYh=NRotutJ=eiLm=ZUB85t-Qw@mail.gmail.com>
 <CABymUCM_KAAunMSUSXXUWMy45y4yTv4iV5WGo4DG-xv=ExMahA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CABymUCM_KAAunMSUSXXUWMy45y4yTv4iV5WGo4DG-xv=ExMahA@mail.gmail.com>
X-Proofpoint-ORIG-GUID: EtQNMzAxSGEw7XitKb1Io4VE57f2O2rh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE1MDE0NCBTYWx0ZWRfXw2O42rhsBOkD
 +bxrgwOTx63ADASFSpDnQygV660TwCZn8shJ/7zWtAKOCKB8EPAj2FIsM2f2jsFatZxNRkMpSQI
 KS5yzm+E+5vBUgODl4m4vkKmIva058XmvOUP6FBg+5M3PapOXYWn6xy4wA0Eis2EA/Y+1gwztr2
 FPEqtq9aPxVh/KMbyvzZ9tPgDH/rGZMMezXQ719Wia219BLoSCb5qPK/TqjuMAGX9rHX4AnwHM7
 E3XbybK+iixKVgJfN749pBDHKUZOhZyzOiSKIkZMvKIuxsQKg8IrG9Xqx0icClgXrfSFp+MkP9V
 qri47sQjHWwnPZ1aNB3SSpoZqQXEHKRmvETMqrb3QgIK1ML19eibk4u+72BhUEegTWADQ3tE98J
 q9XWEeljv9JFMag2h7UsRAJbWcIv+7KvKk0dovWcmocTqn889LYDX7vqi5TQeDjozwlZoFvn+UX
 nYHIFhWOZTtk0CZGhuA==
X-Authority-Analysis: v=2.4 cv=TdWbdBQh c=1 sm=1 tr=0 ts=696933b5 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=sWKEhP36mHoA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=ALDOug3ZtolWXKxVkt8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: EtQNMzAxSGEw7XitKb1Io4VE57f2O2rh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-15_05,2026-01-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0
 bulkscore=0 priorityscore=1501 adultscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601150144

On Thu, Jan 15, 2026 at 06:10:36PM +0800, Jun Nie wrote:
> Jun Nie <jun.nie@linaro.org> 于2026年1月15日周四 17:57写道：
> >
> > Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> 于2026年1月15日周四 17:39写道：
> > >
> > > On Thu, Jan 15, 2026 at 05:34:28PM +0800, Jun Nie wrote:
> > > > Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> 于2026年1月15日周四 00:12写道：
> > > > >
> > > > > On Wed, Jan 14, 2026 at 10:48:17PM +0800, Jun Nie wrote:
> > > > > > Jun Nie <jun.nie@linaro.org> 于2025年9月18日周四 21:30写道：
> > > > > > >
> > > > > > > The content of every half of screen is sent out via one interface in
> > > > > > > dual-DSI case. The content for every interface is blended by a LM
> > > > > > > pair in quad-pipe case, thus a LM pair should not blend any content
> > > > > > > that cross the half of screen in this case. Clip plane into pipes per
> > > > > > > left and right half screen ROI if topology is quad pipe case.
> > > > > > >
> > > > > > > The clipped rectangle on every half of screen is futher handled by two
> > > > > > > pipes if its width exceeds a limit for a single pipe.
> > > > > > >
> > > > > > > Signed-off-by: Jun Nie <jun.nie@linaro.org>
> > > > > > > Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > > > > > Reviewed-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
> > > > > > > ---
> > > > > > >  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c  |  11 +++
> > > > > > >  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h  |   2 +
> > > > > > >  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 137 +++++++++++++++++++++---------
> > > > > > >  3 files changed, 110 insertions(+), 40 deletions(-)
> > > > > > >
> > > > > > > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> > > > > > > index d825eb8e40ae8bd456ede6269951339e3053d0d3..e925d93b38feac0594d735fdc2c5b9fd5ae83e6a 100644
> > > > > > > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> > > > > > > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> > > > > > > @@ -1604,6 +1604,17 @@ int dpu_crtc_vblank(struct drm_crtc *crtc, bool en)
> > > > > > >         return 0;
> > > > > > >  }
> > > > > > >
> > > > > > > +/**
> > > > > > > + * dpu_crtc_get_num_lm - Get mixer number in this CRTC pipeline
> > > > > > > + * @state: Pointer to drm crtc state object
> > > > > > > + */
> > > > > > > +unsigned int dpu_crtc_get_num_lm(const struct drm_crtc_state *state)
> > > > > > > +{
> > > > > > > +       struct dpu_crtc_state *cstate = to_dpu_crtc_state(state);
> > > > > > > +
> > > > > > > +       return cstate->num_mixers;
> > > > > > > +}
> > > > > > > +
> > > > > > >  #ifdef CONFIG_DEBUG_FS
> > > > > > >  static int _dpu_debugfs_status_show(struct seq_file *s, void *data)
> > > > > > >  {
> > > > > > > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
> > > > > > > index 94392b9b924546f96e738ae20920cf9afd568e6b..6eaba5696e8e6bd1246a9895c4c8714ca6589b10 100644
> > > > > > > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
> > > > > > > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
> > > > > > > @@ -267,4 +267,6 @@ static inline enum dpu_crtc_client_type dpu_crtc_get_client_type(
> > > > > > >
> > > > > > >  void dpu_crtc_frame_event_cb(struct drm_crtc *crtc, u32 event);
> > > > > > >
> > > > > > > +unsigned int dpu_crtc_get_num_lm(const struct drm_crtc_state *state);
> > > > > > > +
> > > > > > >  #endif /* _DPU_CRTC_H_ */
> > > > > > > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> > > > > > > index 5ae58352cbee1251a0140879f04fc7c304cae674..89a5feb6308bcac537562c3dc4e61c16c92e460c 100644
> > > > > > > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> > > > > > > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> > > > > > > @@ -824,8 +824,12 @@ static int dpu_plane_atomic_check_nosspp(struct drm_plane *plane,
> > > > > > >         struct dpu_plane_state *pstate = to_dpu_plane_state(new_plane_state);
> > > > > > >         struct dpu_sw_pipe_cfg *pipe_cfg;
> > > > > > >         struct dpu_sw_pipe_cfg *r_pipe_cfg;
> > > > > > > +       struct dpu_sw_pipe_cfg init_pipe_cfg;
> > > > > > >         struct drm_rect fb_rect = { 0 };
> > > > > > > +       const struct drm_display_mode *mode = &crtc_state->adjusted_mode;
> > > > > > >         uint32_t max_linewidth;
> > > > > > > +       u32 num_lm;
> > > > > > > +       int stage_id, num_stages;
> > > > > > >
> > > > > > >         min_scale = FRAC_16_16(1, MAX_UPSCALE_RATIO);
> > > > > > >         max_scale = MAX_DOWNSCALE_RATIO << 16;
> > > > > > > @@ -848,13 +852,10 @@ static int dpu_plane_atomic_check_nosspp(struct drm_plane *plane,
> > > > > > >                 return -EINVAL;
> > > > > > >         }
> > > > > > >
> > > > > > > -       /* move the assignment here, to ease handling to another pairs later */
> > > > > > > -       pipe_cfg = &pstate->pipe_cfg[0];
> > > > > > > -       r_pipe_cfg = &pstate->pipe_cfg[1];
> > > > > > > -       /* state->src is 16.16, src_rect is not */
> > > > > > > -       drm_rect_fp_to_int(&pipe_cfg->src_rect, &new_plane_state->src);
> > > > > > > +       num_lm = dpu_crtc_get_num_lm(crtc_state);
> > > > > > >
> > > > > > > -       pipe_cfg->dst_rect = new_plane_state->dst;
> > > > > > > +       /* state->src is 16.16, src_rect is not */
> > > > > > > +       drm_rect_fp_to_int(&init_pipe_cfg.src_rect, &new_plane_state->src);
> > > > > > >
> > > > > > >         fb_rect.x2 = new_plane_state->fb->width;
> > > > > > >         fb_rect.y2 = new_plane_state->fb->height;
> > > > > > > @@ -879,35 +880,94 @@ static int dpu_plane_atomic_check_nosspp(struct drm_plane *plane,
> > > > > > >
> > > > > > >         max_linewidth = pdpu->catalog->caps->max_linewidth;
> > > > > > >
> > > > > > > -       drm_rect_rotate(&pipe_cfg->src_rect,
> > > > > > > +       drm_rect_rotate(&init_pipe_cfg.src_rect,
> > > > > > >                         new_plane_state->fb->width, new_plane_state->fb->height,
> > > > > > >                         new_plane_state->rotation);
> > > > > > >
> > > > > > > -       if ((drm_rect_width(&pipe_cfg->src_rect) > max_linewidth) ||
> > > > > > > -            _dpu_plane_calc_clk(&crtc_state->adjusted_mode, pipe_cfg) > max_mdp_clk_rate) {
> > > > > > > -               if (drm_rect_width(&pipe_cfg->src_rect) > 2 * max_linewidth) {
> > > > > > > -                       DPU_DEBUG_PLANE(pdpu, "invalid src " DRM_RECT_FMT " line:%u\n",
> > > > > > > -                                       DRM_RECT_ARG(&pipe_cfg->src_rect), max_linewidth);
> > > > > > > -                       return -E2BIG;
> > > > > > > +       /*
> > > > > > > +        * We have 1 mixer pair cfg for 1:1:1 and 2:2:1 topology, 2 mixer pair
> > > > > > > +        * configs for left and right half screen in case of 4:4:2 topology.
> > > > > > > +        * But we may have 2 rect to split wide plane that exceeds limit with 1
> > > > > > > +        * config for 2:2:1. So need to handle both wide plane splitting, and
> > > > > > > +        * two halves of screen splitting for quad-pipe case. Check dest
> > > > > > > +        * rectangle left/right clipping first, then check wide rectangle
> > > > > > > +        * splitting in every half next.
> > > > > > > +        */
> > > > > > > +       num_stages = (num_lm + 1) / 2;
> > > > > >
> > > > > > Hi Dmitry,
> > > > > > Because the plane is checked before crtc is checked in the drm framework. While
> > > > > > the topology is decided in crtc check. Thus num_lm is 0 when this function is
> > > > > > called for the first time. As a result, the below iteration is not run
> > > > > > at all and leads
> > > > > >  to iommu warning.
> > > > >
> > > > > How does it lead to IOMMU warnings?
> > > >
> > > > Because the pipe is not configured with width/height etc when the iteration is
> > > > skipped. I have not found the root cause so far. But per the null IOMMU iova
> > > > value, suppose it is due to DMA buffer not being prepared when DMA is started.
> > >
> > > I'd think, that corresponding SRC regs are either garbage or zero programmed.
> >
> > You are right in that. Sorry for my words is not accurate. I mean the
> > DMA buffer is not
> > feed to DMA engine correctly.
> > >
> > > >
> > > > >
> > > > > > Do you suggest to change drm framework with adding extra crtc check before
> > > > > > plane check, or you prefer the below line here?
> > > > > >
> > > > > > num_stages = max(1, (num_lm + 1) / 2);
> > > > >
> > > > > DRM framework provides enough hooks to be able to influence the order or
> > > > > operations without changing the framework. But, I'd like to point out
> > > > > that for the virtual plane case we already perform plane operations
> > > > > from dpu_crtc_atomic_check(). You can employ the same approach.
> > > >
> > > > Thanks for the suggestion! I see dpu_assign_plane_resources() is called
> > > > from crtc side, which avoids the plane splitting before topology decision.
> > > > To use this method, it looks like we are enabling the virtual plane by default.
> > > > Because the virtual plane differs from the traditional method only with the
> > > > plane splitting and resource preparation. Can we just enable the virtual
> > > > plane by default in this situation?
> > >
> > > In which situation? It is a global switch. And we need to be able to
> > > work with it turned off, until corresponding code is dropped.
> >
> > I mean the situation that the plane SSPP allocation and related resource
> > preparation shall be deferred until crtc calling the plane API. In this way,
> > the traditional plane management is almost identical with the virtual
> > plane method. Or could you point out what shall differ for the two methods
> > after we deferred the preparation? Thanks!
> 
> You just want to have different SSPP number limit for the 2 methods?

I'm not sure I foolow. Two methods provide different ways of handling
plane <-> SSPP relationship. In non-virtual planes, you'd still have a
fixed pipe <-> plane. I wanted to point out the way to push some of the
checks to the atomic_check(crtc) time. Bonus point if that's unified
between virtual and non-virtual paths.


-- 
With best wishes
Dmitry

