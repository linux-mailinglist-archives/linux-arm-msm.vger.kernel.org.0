Return-Path: <linux-arm-msm+bounces-88378-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 30DA9D0E0B3
	for <lists+linux-arm-msm@lfdr.de>; Sun, 11 Jan 2026 03:24:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 00004300F89C
	for <lists+linux-arm-msm@lfdr.de>; Sun, 11 Jan 2026 02:24:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C01F213E7A;
	Sun, 11 Jan 2026 02:24:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VmPiFGX1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="P77JbFYz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA1E31662E7
	for <linux-arm-msm@vger.kernel.org>; Sun, 11 Jan 2026 02:24:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768098253; cv=none; b=SBV0zymsLv6HAhSkJwNCoW5MOoLHJ/bvB2hRCTs5v5nGoigDdtqj7nQAN6Ls6TlWYXF1TOwyMaYdCu7wWBoiLTyHsQCf3ljvQGoiSFyICVA5hDUO8u+2gCg1kgp8B4onU5kbV99eQSEO7iX6/OWQdhdwf/IeidALxwzb+n2GcGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768098253; c=relaxed/simple;
	bh=2prjWFWoahvGVOEJsC3Q0PBw54ytD5CPbFzXsCUECWw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XEABWe14agENKcwPNx4UsI1wzy5WaxMM9jV1hIiI2zu+a/UKhr2cf5xqp2vVKyfB8JZekz72puf12iumgis/WVhoAulGFi3mhoAqZZo4Yrj+cMZW3lW5RsPOKkJ9GRKJZh9I9dnBxCmQZI3d5SZGcrkvOdtydLN9qgH6o+FHUj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VmPiFGX1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=P77JbFYz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60B0ULon600608
	for <linux-arm-msm@vger.kernel.org>; Sun, 11 Jan 2026 02:24:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=GHPzqcfgxDm4hczmWRlV5h6F9HiYXbj6q7EZICcVcYA=; b=Vm
	PiFGX1c1vKbqdU0TKycFLpnnPqXpg5C3Kr4638z6ZzOh55JmoOyz13CjWLkHxkzc
	zMK4DYOIm+wsrMc4Q0+loYnxbFOVz+j/KcSteXejUZ9AVeeorJRnET1+VGulCXXj
	GqL2bXQoE4rwOg25TFap+73Y2w1uznosbJFDWMfc9RRQh3T2SPtLIHp36w+PjgSc
	ttKF9AxzFWlxSvQ7wOxxPQ9kEGBKNz807kOTU8Ob4LVMU8bIGecIuapl26RRfBK2
	lfPLdMDkWKgwatVJMcszzVbIUzystDsIV8xx9YZOP9hV2Ll0enDKc9VpDhId0n24
	NdTxu/FXaDhzWSj5bWMw==
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bkntuh014-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 11 Jan 2026 02:24:11 +0000 (GMT)
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-4514cb26767so7324353b6e.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 10 Jan 2026 18:24:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768098250; x=1768703050; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=GHPzqcfgxDm4hczmWRlV5h6F9HiYXbj6q7EZICcVcYA=;
        b=P77JbFYz5Gyy20qN/hq6BEYyR8G/FNT66GKMjec4D8hDfLmccm5sA+ru6NZG943D7E
         w2vfdwEL1me0geXvI2aJupW1qB3Ld4hm1tmFES1s6MncIR3JnUBax2iiifc5qIVxZBN5
         FSICILtewDUPhMrbdmzdvVdeK5jtkgq4m/WbvLryqQG0Gd2ejHRAxDCqpYPhOr4NI4Pa
         iXZt0x6EJDWV7peRRtpPJXGQnaMhzcC3aeT2JDfN+C/SlQho+c+kX4h86ptW1hPyckTS
         D5AGH8JKAmgSHlvXGeuE5hL6bJWv7mHf7qHjUmcF4r9hbtWH2y69DwZtN4PVqZ3X4HXf
         dL4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768098250; x=1768703050;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GHPzqcfgxDm4hczmWRlV5h6F9HiYXbj6q7EZICcVcYA=;
        b=UQQ7oD4aFK9qIOvZ/OPxlo7ORkRNEP+pF7A6vRQL0HzJEMP8AJ/IyzGW5VF68KQzPf
         tUi4hD3czqhRQoYQfbn/zhNGrDlzvt95VsyqNG3H4p5jjZU9atbgUeV4YQd+Pc8W4FFE
         +JPeyheSug55YvJcS0FmHIrU0YCCFUFGiJP1+vKmAY1P62KS04Kl+kP4W+yz18Buvbnk
         zU3/1Xg2/aBN/hkdQvQdw7SJq5zDpbfJ8YbankqXlL5jhDO+AFtgIouH2O2iW2d4amOD
         6nq6V8id4VYoVQicnLlcry2k236zuMyNfiXlww70H19ketcHoUD4tPRRBhWEsGbMwwrY
         kkbQ==
X-Forwarded-Encrypted: i=1; AJvYcCXoX3123A3qXRfli5NVPqrpwgNz2xZ2UJ38R+3lzJguO7PzomXSYqX9EI+Pip7LMJ0JOlL7UROV8GPYI2sL@vger.kernel.org
X-Gm-Message-State: AOJu0Yzm5MXrQQ77WD+VIvXVbCNth8rLvLkZImUg6fRLnvUOutiEfop2
	8tCSBZjnsb7Go7T7JsdEWPyLLJUM0z8rrFvpAFL9hsmZoeop7gCjQgCuvnqnqXOaxXNkMvFIA7M
	g6Bkg9exSMJ0Yxg413wTDRIK1tC2mKwzbplid3OEJ31niTm5IjuStjYiyLUi286VNdVYx4KrN+0
	QMaMCOjcQmB7t5AnBonWf4UTlgQlfFTZ//c+sB6kZt4AA=
X-Gm-Gg: AY/fxX5u8MQxEbwNKnGH3SjCWu3i+j7QZTzsUmZcextg/jUVMHeRxfF98LjglGOdT7e
	XoHMKmxpXvwrP2v4MxyqB973bl7SUybQ7eOsQBGw03XrGieeUUQMzA/p1Qmeax0Hs4taax+PYi0
	Gl2qm42p48j1rLNbA662BBg8wOQiH868h3o04upDXqNF9r1eNl8m60dpC8QrCNr4vqzg==
X-Received: by 2002:a05:6808:4f28:b0:450:5bbe:642c with SMTP id 5614622812f47-45a6bd53fb9mr7611227b6e.12.1768098250466;
        Sat, 10 Jan 2026 18:24:10 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEZCXxumreVsEAC+mOBpwX0ObCz4RryEbZ294If65z2upgBBXuNeAZ+1GulIUBpl6GgB8Nzvm3UMyAwatN22nk=
X-Received: by 2002:a05:6808:4f28:b0:450:5bbe:642c with SMTP id
 5614622812f47-45a6bd53fb9mr7611210b6e.12.1768098250085; Sat, 10 Jan 2026
 18:24:10 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260109153730.130462-1-robin.clark@oss.qualcomm.com>
 <20260109153730.130462-3-robin.clark@oss.qualcomm.com> <iwmyig2v6lk47gnbimut2qkmp3swscqjxpj2h472q2tqtes5sj@hwlajed33h2t>
In-Reply-To: <iwmyig2v6lk47gnbimut2qkmp3swscqjxpj2h472q2tqtes5sj@hwlajed33h2t>
Reply-To: rob.clark@oss.qualcomm.com
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Sat, 10 Jan 2026 18:23:59 -0800
X-Gm-Features: AZwV_QgCfLYp9_RTLz0X2-33DvwusCJJr2t2IF7t2E866j79DbjUC3J_YmBXnVc
Message-ID: <CACSVV0242GE5adkic6QASUzAsO5eW8Yddf52feRn3k5pktd2FA@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/msm: Fix GMEM_BASE for gen8
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTExMDAxOSBTYWx0ZWRfX8XGOJQQIczuK
 jH/koPARjtVFpqR0IAEqj2XlG0LeIgVXro84IeobqROpa5kwhBWPbUB2HMktvpKQRnX/VgCKaRV
 3uY3omd450Vb94tIA3roe69uyWXzr4bUSMVkDAeQxVOnyZar0nol+0tB5p+tWpnFgJUF+n6/czP
 jYqnWD/iWDDI7x+NVwrbwvwUR9RAeixhUE6IRi5G4tTE06M95bNQWu2WLVpQPLjFo1jJW1G1V8X
 esqPYMB0nOnsx2QBIy3LO9BN7gB6k/CvJu86kUsfG8/GV1mNEufgtmCw09T963Wa6a0pq95aPw0
 J8diqYTVbTDSABzOp7HjxMXiFRVlcNG6uDyBj0GmMDK5PVk6MIrxTIQlxbXgK08bSJ1pz/NGynQ
 Lz9MHQ1LctT/Jpz5VrnVVP6jSJPjx0I2yewNsIY5ZUqO+rpkI39XNgxDNehBRMPdSq1WkikQ6NN
 GX81NYcrEqDeZ4+eiGQ==
X-Authority-Analysis: v=2.4 cv=R6AO2NRX c=1 sm=1 tr=0 ts=696309cb cx=c_pps
 a=WJcna6AvsNCxL/DJwPP1KA==:117 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=wUCF3RwO_GvFUl8ueR4A:9 a=QEXdDO2ut3YA:10 a=_Y9Zt4tPzoBS9L09Snn2:22
X-Proofpoint-ORIG-GUID: 3NtU-U5hcS_4CeUTCCZ5ufxSzRcxK0Wk
X-Proofpoint-GUID: 3NtU-U5hcS_4CeUTCCZ5ufxSzRcxK0Wk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-11_01,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 spamscore=0 clxscore=1015 priorityscore=1501
 adultscore=0 phishscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601110019

On Sat, Jan 10, 2026 at 6:17=E2=80=AFPM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> On Fri, Jan 09, 2026 at 07:37:29AM -0800, Rob Clark wrote:
> > This should also be zero for gen8.
> >
> > Fixes: 288a93200892 ("drm/msm/adreno: Introduce A8x GPU Support")
> > Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
> > ---
> >  drivers/gpu/drm/msm/adreno/adreno_gpu.c | 3 +--
> >  1 file changed, 1 insertion(+), 2 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/=
msm/adreno/adreno_gpu.c
> > index 1c80909e63ca..d5fe6f6f0dec 100644
> > --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> > +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> > @@ -376,8 +376,7 @@ int adreno_get_param(struct msm_gpu *gpu, struct ms=
m_context *ctx,
> >               *value =3D adreno_gpu->info->gmem;
> >               return 0;
> >       case MSM_PARAM_GMEM_BASE:
> > -             if (adreno_is_a650_family(adreno_gpu) ||
> > -                 adreno_is_a740_family(adreno_gpu))
> > +             if (adreno_gpu->info->family >=3D ADRENO_6XX_GEN4)
>
> What about a7xx gen1? should it also be 0?

*probably*.. I'm guessing this was incorrect before

BR,
-R

>
> >                       *value =3D 0;
> >               else
> >                       *value =3D 0x100000;
> > --
> > 2.52.0
> >
>
> --
> With best wishes
> Dmitry

