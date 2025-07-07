Return-Path: <linux-arm-msm+bounces-63939-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id ABAC1AFB9AA
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Jul 2025 19:09:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F16B1176703
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Jul 2025 17:09:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1893A18035;
	Mon,  7 Jul 2025 17:09:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CosisA/n"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64B37245020
	for <linux-arm-msm@vger.kernel.org>; Mon,  7 Jul 2025 17:09:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751908166; cv=none; b=MlxPuU8NicIEcFJghpou+ROY+II1YBiSODe2vELg6YDA0/66hylI1AQLbVSDCKaS4PZlEwLenbpWkanGLxKcZux6iV1jstrnxeJon8oZfpI8B4HvLZSibNESulbraM2I0fVbTgLejOjOTMVyP3WgL2F3TEM8lQgB6BzPtXYvSEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751908166; c=relaxed/simple;
	bh=CAw4r4s8A3zwCVG37cGZ7evQRzMirsghvG1uh3y/t8Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NhMvhPz0vMPXtTxL7EIa9aAEdbgKCgfNztAdTfopNaz8rgDeqyPjniruYq5aTsVko1SUKGItzlu+47GtngH3G7Tqpqzm6pcXmmmBwe4fLrf9ewiBjRxyeb8XxuC2F4ch9ygwUKBo+GcE8qCKlEsAKhc+abyC6CIXJ89ojeG1MzE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CosisA/n; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 567DaIxB013890
	for <linux-arm-msm@vger.kernel.org>; Mon, 7 Jul 2025 17:09:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=oT1DtUsRaA/zcFPtBS//4Isnss8E6kQPFTLhfURqEU4=; b=Co
	sisA/nNcWtS2/DV2jolq9HasCQctsMa5kfPmFIqLDrVOD1SDgP0JSJgyJ1+PFaS1
	zjXJ1V7DJ1yyptbgELitJYpBKHrxrieEgYp5KbfPTqfnPWHCIkO+CxmK/CMNu6H+
	1O/QSGgTmGJOo63j14IBH7EBOM97D6IUYWh61F7qbeX4l9LLcvIHZKP63SaDU8+V
	y2ewIpWM/aj8VE13eJtZv1qU+7/RTiNKWHayoFuWlhvsV9dDPmsqeXo8rqkMPy3W
	q6X6h0xSyp2wAs2whPMcFR7/wRHbjR6qJPAPx7yPqK8ICRqILPop9LqpjpX0QRj7
	BPn03wJP/Zj0p6K3qCHQ==
Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com [209.85.161.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47r9b0mmuv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 07 Jul 2025 17:09:23 +0000 (GMT)
Received: by mail-oo1-f72.google.com with SMTP id 006d021491bc7-60f3442c58cso2645411eaf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 07 Jul 2025 10:09:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751908162; x=1752512962;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oT1DtUsRaA/zcFPtBS//4Isnss8E6kQPFTLhfURqEU4=;
        b=sY2Za4Fq7UjRN87RB9byhhorxzVLsSHm9wmnHTC1ta+jBCBlRxCFsGuJQSlUmDJ5R3
         B0cCEdtbWJSeYGCGqEg1AOlBNKzDwYJdanPqrdkYTaAD/seiEuwz+jqoHUgDm5zi+R46
         X7mtKnp7yqqXqy6awaHQ+daZJk4/fL4A2mY0mpeI+lQAyNt5fOQkj2ppZUWcREMNjFXc
         y0DDb1RkxeY7Jr9kZ0lvzbyu3C5eUVEQ69skK5j1xo2AdLO7dZ8ZCymWQay73U7f1FDI
         C4y+qs5avHCzQBhBIoASZUry2NcGlYRGwy+NmtJz+aVoZ+zPN+eEd+GREaywKE0rYNrB
         ZRDw==
X-Forwarded-Encrypted: i=1; AJvYcCXV5osART0b1frIUrcaoTchbh/NEyyXoR37BH0TDJ60Zz2BHWJiEf2zf0o8FhU0GZTR1e5Kfq97zrcr5npT@vger.kernel.org
X-Gm-Message-State: AOJu0YyMItNmEweuxAdY8Dsnsl7hb02i4S9JM1mZaeD0oTk/hk+Yv0mI
	rVOHH7xWwrcB3+2uT01UM3Dgy7WZAMwvII2m54MNikwr5ifzEn+S22MLMn/WyshmDq/R4BcZq3h
	sV6osX03lAx+6aHMQRSPH6RHklMzxbI7oqUIHti5DK2pOUOp0YfT7Y82iL+4GV+QOSSvWDk+2sL
	jZDgrgZx+Dt/kOtD5I+gY+aIP4pq+RS5oVlX4L+vfGrLg=
X-Gm-Gg: ASbGnctAQtyTbxJ6kuE/wGg7jEXGsDQbUD0zqlqgDuQialHPYaWxf6Tb6M18Y/sYOxo
	3aLlrJJ4iwGZn/NoPVSKW5MLdVhMXo3b8NUQoqZPLVJnAbynaF3+3VpOqyzqHVdaishBVYSdFzF
	nQ6R31cVYzx6fjcNiuWjcrIuA0yDU1G2rh/T0=
X-Received: by 2002:a05:6808:211f:b0:40c:5b58:c9f9 with SMTP id 5614622812f47-40d073ccd23mr8743850b6e.22.1751908162421;
        Mon, 07 Jul 2025 10:09:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFJFgTDJSExh2v7ckh3Wk01zSJ3P5QE5VWongvlxIz7t3sbZ/GbabrbWMQ+rzFK8GgUIeDgxM2pypdJm3Jto6Y=
X-Received: by 2002:a05:6808:211f:b0:40c:5b58:c9f9 with SMTP id
 5614622812f47-40d073ccd23mr8743829b6e.22.1751908162097; Mon, 07 Jul 2025
 10:09:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250705145242.781821-1-robin.clark@oss.qualcomm.com>
 <20250705145242.781821-2-robin.clark@oss.qualcomm.com> <6579c65c-877d-44fe-aa81-5b0e602b33f5@oss.qualcomm.com>
In-Reply-To: <6579c65c-877d-44fe-aa81-5b0e602b33f5@oss.qualcomm.com>
Reply-To: rob.clark@oss.qualcomm.com
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Mon, 7 Jul 2025 10:09:10 -0700
X-Gm-Features: Ac12FXxuUa5Yn05AD9M7jkS94r-Rdb6D2yJUjRtTcPRlVGpITucDmRppAplnMyc
Message-ID: <CACSVV03U75=5LYdWkbQ-FOU6L-F50iZ+XgpT=f6+-sRNkEv6sA@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm/msm: Clean up split driver features
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=dYuA3WXe c=1 sm=1 tr=0 ts=686bff43 cx=c_pps
 a=wURt19dY5n+H4uQbQt9s7g==:117 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10
 a=EUspDBNiAAAA:8 a=mFyTvTkbTY4ge-DhZPYA:9 a=QEXdDO2ut3YA:10
 a=-UhsvdU3ccFDOXFxFb4l:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA3MDEwOCBTYWx0ZWRfX7cEPpNafh9Wm
 9BE9eHiiTdtdhYXcd44E9Mc3e5+VWrhsjdn3rcKOkieWwIvr2TRiIn3QRPjmW00wpDyyCs/FH7Z
 o0rnLe6EZw4ZHZuHqLGVoi+n06RWs7sEjfmngPkMR6kStvyXRuG+C1bOMmF5pA/Z+DOqLSYpK6z
 uE44hg2T3tRsl77rsn40LlGPezNAR+rhogbrJ2KsMvL22S1dcMP/t6Xi7ydryAXyoPTvmLVlB+l
 LZ3lh1uf0lqF1fHbMtkoz4P5c/7/Ne91N7iFfS3px/dtq+Bvv03jxFygKVlE77WBI2sEhFtVm7H
 whPj+avyijyScDsefKTRvxzxvbJL8zMs6mI0hpPYOXDdrj7/6T8GwNkUf5tIqWZrtNLRs4em4FK
 Mbq68o9hU4KyxD11bDpFumGmqOKo5r5qtfQOxFOnADHoqv6bI/Li2wHTUsB3MTLK2jWnkA4J
X-Proofpoint-GUID: rAL02_tzgudvwCb_sDATRCuzpeBMuYCC
X-Proofpoint-ORIG-GUID: rAL02_tzgudvwCb_sDATRCuzpeBMuYCC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-07_04,2025-07-07_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 adultscore=0 mlxlogscore=999 malwarescore=0
 mlxscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507070108

On Mon, Jul 7, 2025 at 4:42=E2=80=AFAM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 7/5/25 4:52 PM, Rob Clark wrote:
> > Avoid the possibility of missing features between the split and unified
> > drm driver cases by defining DRIVER_FEATURES_GPU / KMS and using those
> > in the drm_driver initializations.
> >
> > Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
> > ---
> >  drivers/gpu/drm/msm/msm_drv.c | 31 ++++++++++++++++---------------
> >  1 file changed, 16 insertions(+), 15 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_dr=
v.c
> > index b6efc5b9933b..5695de1bbae2 100644
> > --- a/drivers/gpu/drm/msm/msm_drv.c
> > +++ b/drivers/gpu/drm/msm/msm_drv.c
> > @@ -816,14 +816,21 @@ static const struct file_operations fops =3D {
> >       .show_fdinfo =3D drm_show_fdinfo,
> >  };
> >
> > +#define DRIVER_FEATURES_GPU ( \
> > +             DRIVER_GEM | \
> > +             DRIVER_GEM_GPUVA | \
> > +             DRIVER_RENDER | \
> > +             DRIVER_SYNCOBJ_TIMELINE | \
> > +             0 )
> > +
> > +#define DRIVER_FEATURES_KMS ( \
> > +             DRIVER_GEM | \
> > +             DRIVER_ATOMIC | \
> > +             DRIVER_MODESET | \
> > +             0 )
>
> Perhaps I'm missing some C lore, but do we need the "| 0"?

It is just to avoid later diffstat noise when new flags are added :-)

BR,
-R

