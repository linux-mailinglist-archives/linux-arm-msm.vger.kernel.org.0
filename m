Return-Path: <linux-arm-msm+bounces-70477-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FF2CB3290B
	for <lists+linux-arm-msm@lfdr.de>; Sat, 23 Aug 2025 16:16:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CED1C1C8511B
	for <lists+linux-arm-msm@lfdr.de>; Sat, 23 Aug 2025 14:17:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F65B1DF756;
	Sat, 23 Aug 2025 14:16:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QJZIvXYC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09E95184
	for <linux-arm-msm@vger.kernel.org>; Sat, 23 Aug 2025 14:16:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755958601; cv=none; b=hqtDR5v08jzpfL9apG2ovk/9rIqn2JFP0GK5tRRwPRr7zYDQUStyL/jy38NjWeNb2CEgZEsyGHhaqG1Y8dEN06zjmnIrixBeZAZD50u2Z7BDmULhy/BSWUY4jIEVIBB/kMwgIBChvIgCgn1InjKUOHnMUiwAKpze4/OVzWXR8+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755958601; c=relaxed/simple;
	bh=Atwhe2gdv8aHQur/RkhiNK9hSbUPHXW7FLc82xCY0gs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NFEu4n7X7NxL80fWxpg1jvDgeREFYt5DNLKVCfz4PZ97kxvNqCCYqedxqFgmvqouq1YYHldWQhD1O2R4oniwVHUR1CQa5vxAqH93bMkrAXUxsUtQHlO0CIIMmbkKv0R218xm4xXvWPn+QpJXTNx0RgqR3FpBj6PDP8FJ+Ad+k7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QJZIvXYC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57N4BuOb002779
	for <linux-arm-msm@vger.kernel.org>; Sat, 23 Aug 2025 14:16:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=tHzxtlQVpVC5JdCMc8tuGtFWq2Ma7Zo03QGkzubuu/k=; b=QJ
	ZIvXYC9caKCMuFvHsPznNdXgrlUedgIWff8OAzNC8Mzr1/qQDLxMyksoHorQKthX
	wlCutlJw1i8TlLQw5opH4ZFTMIYN8WLn+l+Ao6DZNDKxuj4UPBrT6/kGmfLS42h5
	JDHXmzS21lI7Gw1xEoYHEY0hF1pFIgX6PtBMmNDaKfg1bSZTmNUmOLOKU3rxlw/Z
	fmNo1RWb5anVLNXdyCQEQSHs2C6AaJRhKougHbuGpzMDuDN3lNMKfI47JaO+ipFM
	xEXTK/oAKUhT1Dp859imWZ3c65HpGKUR7QcquORDD+MAssKoqMjhnrBEYNGRaNT6
	Ui8qAQTukisojZ+XFBOQ==
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q6de0x2b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 23 Aug 2025 14:16:37 +0000 (GMT)
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-435de5be117so3092532b6e.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 23 Aug 2025 07:16:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755958596; x=1756563396;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tHzxtlQVpVC5JdCMc8tuGtFWq2Ma7Zo03QGkzubuu/k=;
        b=i1qpxLLc4zdeKzAdiAwUlAsn3tSmgpv46KBIgpDp2wxrmWPCuqZjOBe1NcIZrEMcSR
         vPevA9dpAVzEdthKyG/sxTIsNoChHWZF8GR04/eG8E8VpNXdquT4ys0G0hvmxMXhQWAf
         nsMlFW4VqMWgzkbyurPd4dBcoQOl4yc26hbZjqKgF9kdLxSNJBHSl+7KnG1rTNoQePLm
         22VC0ZR14cAFDAlyNtwXl8KzXQhqzjS136Nl2togvOyrO58pTGxDkoBVZoDgxE1quKah
         BSa2e5/IWSgIgBENIb32JkWlG+bLCrM8HQFTdbNgXuJ5Kg31zfmZ9z4HwrTDZHAKeY3W
         SPgg==
X-Forwarded-Encrypted: i=1; AJvYcCWpXgTVpFajc2QYgCbL9RBpwG2F85GZZ1+fDHIoKCN2BbBtfVNU1JLrVdaOuWRej5+sv9qvolhjunmRKCoh@vger.kernel.org
X-Gm-Message-State: AOJu0YyVCx5eZzaFmftkzxj5WN78QiV8YT2YJIBUMaklRZUQJJEmT+C8
	V5Tt4NI1UIUNZVcpqacBndNuHiX+nsXLtWDLpVAQRHw+EpSiaN/HTAmPCSGMt9ggpKBvxx7DGr5
	1Fct82YEm0awZPTE++mqickwMl6lEvILS7xrzQH9b77EzfEtt54NeyEBWrBVKi75Ncn5qYBbvZ6
	pDZCLgdjuBggyf3wIZf6E5Xc5kJE+zXKHpXtzaAzB6R3Y=
X-Gm-Gg: ASbGncsBpFa2dKovxi7ThV5al+ER5ML/9fzWHpImoS3AmZeRf24TUhZVhidXTDNeDTT
	lxWxGUMomtU51pPfWrddJwmvIYiwKtzrADGFObArcaGgMk+PLnWZCgbZCAZCy0BuZrjgMmZeXGm
	zwrk1FaWnEwvr+svAm4q6B0IoR5GyPrZiuTwp0SeEjbp8823NP5sDa
X-Received: by 2002:a05:6808:1816:b0:437:75ea:6c73 with SMTP id 5614622812f47-4377db3d1bamr4164399b6e.22.1755958595934;
        Sat, 23 Aug 2025 07:16:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGz45QXys2oJtBIlZEp22ZSDXi2Xy8ce0RKvLyzN43wVE0rZMnjq6sHqDOzozGaYpqLEzp3LKatNVdSmB3HMgQ=
X-Received: by 2002:a05:6808:1816:b0:437:75ea:6c73 with SMTP id
 5614622812f47-4377db3d1bamr4164390b6e.22.1755958595550; Sat, 23 Aug 2025
 07:16:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250823020919.9947-1-alex@ironrobin.net> <6sdzghcc4uynvmk6r4axpwgqlmgxqzi457ttedqlrql7f7lt47@glsrzu46a63x>
In-Reply-To: <6sdzghcc4uynvmk6r4axpwgqlmgxqzi457ttedqlrql7f7lt47@glsrzu46a63x>
Reply-To: rob.clark@oss.qualcomm.com
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Sat, 23 Aug 2025 07:16:24 -0700
X-Gm-Features: Ac12FXxJo_V8NE2Itbp6c9Xk0uvP-h0DrvgmNQ_gM5X36Csd4Q3N56neCim3asw
Message-ID: <CACSVV01R=FPAErpfJJvESKig+Z8=amEkpf6QFnkXHhTjFsPf5g@mail.gmail.com>
Subject: Re: [PATCH] drm/msm: fix race in Adreno header generation
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Alex Robinson <alex@ironrobin.net>, lumag@kernel.org,
        abhinav.kumar@linux.dev, jessica.zhang@oss.qualcomm.com,
        sean@poorly.run, marijn.suijten@somainline.org, airlied@gmail.com,
        simona@ffwll.ch, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzNyBTYWx0ZWRfX7JeDGAnKZMKC
 KtbLxLlzBwjlmc0KxImfbKRmJHcfmYQh8nKl1UhcQuyszVmjN/kKZMTU9UbDQsPMdNWO2CObryz
 ObCVMOi8NaTqrk8kyAGG72kAuGcvFXWozNKgPSG6CUnM41jHSwNC2cARYl0hUSKnd4RDqTlC69b
 4kJoXQ/JaaZfcJhH+aNBrvRBzHR4HKzVAiZVRQp8TkTnrkl0ZIdNqUJva8/0CSRmtBB3YXKcfhD
 SNBfTp9ltN03WpXnKq+qbOFy8Ge0IHoaekMPcuJSklGyxZNGj4F2NhqG7k588a8BZQhu/R6Fvnj
 mG5VF43SXiuuMyk7nbkXNUaNcV+FFTBOV8N6z6hO1xAGJbzmP+ZmJsVAVQT8j+eSKxyQ12C1+4R
 j3RfY92N
X-Proofpoint-ORIG-GUID: KugI0Anmf0RZeLUcdHMdWrLmMvLT6sZk
X-Proofpoint-GUID: KugI0Anmf0RZeLUcdHMdWrLmMvLT6sZk
X-Authority-Analysis: v=2.4 cv=K7UiHzWI c=1 sm=1 tr=0 ts=68a9cd45 cx=c_pps
 a=yymyAM/LQ7lj/HqAiIiKTw==:117 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10
 a=EUspDBNiAAAA:8 a=foaXouvCAAAA:8 a=4hXh_QXROP5yvhQfHEYA:9 a=QEXdDO2ut3YA:10
 a=efpaJB4zofY2dbm2aIRb:22 a=lBkOZJTZZNyIbKe29SIT:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-23_01,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 malwarescore=0 suspectscore=0 adultscore=0
 bulkscore=0 phishscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230037

On Sat, Aug 23, 2025 at 6:49=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> On Sat, Aug 23, 2025 at 02:09:39AM +0000, Alex Robinson wrote:
> > Builds can compile msm-y objects (e.g. msm_gpu_devfreq.o)
> > before adreno_common.xml.h is generated in trees that generate Adreno
> > headers at build time. Make msm-y depend on the generated headers,
> > removing the race.
> >
> > Signed-off-by: Alex Robinson <alex@ironrobin.net>
> > ---
> >  drivers/gpu/drm/msm/Makefile | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/drivers/gpu/drm/msm/Makefile b/drivers/gpu/drm/msm/Makefil=
e
> > index 0c0dfb25f01b..1a918d44ac48 100644
> > --- a/drivers/gpu/drm/msm/Makefile
> > +++ b/drivers/gpu/drm/msm/Makefile
> > @@ -221,6 +221,7 @@ DISPLAY_HEADERS =3D \
> >       generated/sfpb.xml.h
> >
> >  $(addprefix $(obj)/,$(adreno-y)): $(addprefix $(obj)/,$(ADRENO_HEADERS=
))
> > +$(addprefix $(obj)/,$(msm-y)): $(addprefix $(obj)/,$(ADRENO_HEADERS))
>
> I'd say, no. The idea was that msm-y should not depend on
> ADRENO_HEADERS. If there is any dependency, please move it to adreno-y.

probably we should s/adreno/gpu/ and move all the msm_gpu*.* there..

In the mean time, I think we were going to drop this patch from the IFPC se=
ries

BR,
-R

> >  $(addprefix $(obj)/,$(msm-display-y)): $(addprefix $(obj)/,$(DISPLAY_H=
EADERS))
> >
> >  targets +=3D $(ADRENO_HEADERS) $(DISPLAY_HEADERS)
> > --
> > 2.50.1
> >
> >
>
> --
> With best wishes
> Dmitry

