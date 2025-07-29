Return-Path: <linux-arm-msm+bounces-67009-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C32FB14E8B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Jul 2025 15:40:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4FEA0545F63
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Jul 2025 13:40:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 306AE1A2547;
	Tue, 29 Jul 2025 13:40:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="k67GQX+y"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C56819EED3
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Jul 2025 13:40:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753796421; cv=none; b=tEQaGN0BmHmc5YicEHUQ1mhlOp0bKM/D/7wk10N5+rQ44ldVkQrB6ZgqPETEabJyd2ZzQ+VmaXd2EQ7a5fCO73IOPnpQ8ejaESMUlAyOfk44HkY1pEP+aS+OqCRNaDfNR57NPYsyZYpoAeyqUqSLKxPnroj7mOoTNJtkAi8GuVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753796421; c=relaxed/simple;
	bh=JuUR2v0lz8uvI1VxvsVABNkZZwcyePThry1CF7Ju3ys=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kV8Cl6L90agrsoaU1BpmmzIv1yp+jNbu+Diqyrau0cCMTef/gtWFF1njEY0BiYc2st8q4IBvLlbwBeoe5Mkn/1Iwa/aQAAjEV48cSDpi9GKgeqbYnWuCI6VCIbVFYiBHDUcTUUlri3vdpvfinf5hsmLBw6qI40hviNSnCykkqN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=k67GQX+y; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56T8EL3f031277
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Jul 2025 13:40:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=HLQ2yUgG0gFIFURD76i4Mqz/jV+uThgccL9ep7CGuxI=; b=k6
	7GQX+yLg6ftc4AUhslhPJ/bzpJSeGBK4cIhSIKmHQGil9vtARXhgDZPJGxMXmuGC
	sMY4lnFuSjZYQ+aiYIUjngUi9JtW7pYQWU02fvjE6jEoDzl5cg81WjIsX7iNK5Zv
	WLvHBSRBgiEIhzdZk+hVclfIs4vcwqsYwZq95ij0m4/+BnURhjslpGP/ym5ykHNi
	Y35ut2bmqB+JCIZP2lYWPTPCC44T0r9PSrmhDvScS/8IUaLGxhNCjbdnlgNtK7lr
	3CIvauZabbUGs1vauPChnIkCdlOr+FKV5XbuFw6ZuPZWph6pVFTt9B51PkRxXLYO
	WgneYO33PsSnS3ixK1jw==
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 485v1xdnk9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Jul 2025 13:40:17 +0000 (GMT)
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-40b99df0be7so6028179b6e.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Jul 2025 06:40:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753796416; x=1754401216;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HLQ2yUgG0gFIFURD76i4Mqz/jV+uThgccL9ep7CGuxI=;
        b=ZNHGku0drkoHeyNYdrqTbyvAeV3bLVIDy4Bi6sMkFhiLQAcu3JYLqJFGnynL+zDEw6
         Mn1onV4qP4W2WKc6D/VLPirPDt2DGIoRSuvCYcM+vKmUBLXFPcdUhdcrHBL6AE+YiKNg
         G7pkTGi2cEuc+LSD5Oyyn5E08xZ6Oba+KSbt7m5XmWXXVK3OY3nHI0w2ZlVSCuVqzyUk
         cl03TrU7GNlHpa8ptWX6rRHUiGt2993MkW0+BLx0ZncZLHtrb0AuueKOE1gPxxPet4Ob
         XgztLPhwUMxVxnr7IDSHmqHDV5NVQxdXoCsCOdOI7k97Voayngyty+dwTN/LAl4b1Iwe
         rPqg==
X-Forwarded-Encrypted: i=1; AJvYcCWscKM2VxWnAPB7Kutec//zBJYkw/v0veEpmS2fmTepi95gG42diIKcGZU8KxgPCCHfrjPw+vg9hD4E6MBk@vger.kernel.org
X-Gm-Message-State: AOJu0YwIaCmQW2ez5Mgchfw6jB5Sg8gpwdT7tsb24U8CoVV62QLRMOFH
	hzCbbuUO9kA6mswYJOhwNarcJqyVqYlbuO+C2sBNoKeolT2ru/gFQ5F25Xq2H4jGcvPTPl7/Lee
	ikKM51tvx/rCOtMmG3hD+Iu4XADWc007Ap9w1uLmY94/0Xft1KyYnCSuGM+zognnpXTk1+6Htre
	fhbgE/PG9shNGNFcUswSPoizL3aVurcyhvxn04qSno8kc=
X-Gm-Gg: ASbGnctmALGgvtBgkgCokBEXEAB7FmFDCSqWtZhxq0mYs+FrdFDGGxs2okPbEO5jgx2
	UuuU6RaMSmHdKiOTb4AnpldqMSHMNQE8kAEPXmFJwntYKKXH6QO9erKtfNd2v0cACzpapRdJp0o
	qGYmaSpJNrcJQUlFZzxrgywnS0JDAZGBmwKF9y4HNRZXXbgrWfOm/p
X-Received: by 2002:a05:6808:6801:b0:404:dad4:f971 with SMTP id 5614622812f47-42bb972a2e3mr9290694b6e.33.1753796412976;
        Tue, 29 Jul 2025 06:40:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFqf4clMcdqT5vWJ+nvIVIeCHsaCdP9DQ2Xz98Wpurg/ABYUj+EgAD19sV+SQb892Lv/ifuAOnr9etFXbN2drw=
X-Received: by 2002:a05:6808:6801:b0:404:dad4:f971 with SMTP id
 5614622812f47-42bb972a2e3mr9290665b6e.33.1753796412292; Tue, 29 Jul 2025
 06:40:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250728203412.22573-1-robin.clark@oss.qualcomm.com>
 <20250728203412.22573-2-robin.clark@oss.qualcomm.com> <CACu1E7F=Y2oKfiWtD0VYfmLkL24e7JrZYMt8dmoGW7zrq7bd2g@mail.gmail.com>
 <CACSVV02W28L0MS32J0n1PTpEsaq_6RxEPgb_6y6G=6TryGEPQw@mail.gmail.com>
In-Reply-To: <CACSVV02W28L0MS32J0n1PTpEsaq_6RxEPgb_6y6G=6TryGEPQw@mail.gmail.com>
Reply-To: rob.clark@oss.qualcomm.com
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Tue, 29 Jul 2025 06:40:01 -0700
X-Gm-Features: Ac12FXx6wa3mBL8aH-OOfMIc4b5Q0MeA9kQw7eyuD2mIfr3Ns8qFmq3Be1tUb5g
Message-ID: <CACSVV02DLSM2dHUj4MiPpogF3pgjk4ex5=9_P2AKdGmtx4bd=g@mail.gmail.com>
Subject: Re: [PATCH 1/7] drm/msm: Add missing "location"s to devcoredump
To: Connor Abbott <cwabbott0@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI5MDEwNCBTYWx0ZWRfX3CqAX4Kiafnr
 /Xn4dP5dAlWlSiie9dkcwJpWTjJ/rbph5mvJqTyGaOgywknzxpgylerkpaEid+zZXjG1TgDe/jJ
 C5FR2qoJChBcx7muC/69tQgxP62m4si3XdfiU0NJogY78D7tSkeMCEW62Ppsqlzwm1jSbzjgvdd
 hMe7dv93PYvfLGasxrERupZMwQwc9yxLEAvv0fJDaDm8y6PPrSPzz3CmSlExY9Ms3R99L3CRiDf
 V4pSuYTCUf0Lt3wQFzJ6MwjOAZinpifoQ2q7G6lmSrk0tOIQNAs4Op4wGGMAHNIaBJ1C+7VpGPn
 TJw3fxX3CjQSkepyfj/hWDnRwXBhbtT2HWsh35IIoHEgWLudQFwCFC0k18V8DiV+Cio+aBMmqGj
 KaBdDgXRcxxli6/nnYUN1yks5babNqZ5J7K+SWCeoM4MtYfrgl19jeZJpJj5bvNDHGt4UjyM
X-Authority-Analysis: v=2.4 cv=JKw7s9Kb c=1 sm=1 tr=0 ts=6888cf41 cx=c_pps
 a=yymyAM/LQ7lj/HqAiIiKTw==:117 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10
 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=0I_rIkXGDByXq9DAmH4A:9 a=QEXdDO2ut3YA:10
 a=efpaJB4zofY2dbm2aIRb:22
X-Proofpoint-ORIG-GUID: 5vwPxlYCRVLPjwT7AGo4kSK-F1rdFIhs
X-Proofpoint-GUID: 5vwPxlYCRVLPjwT7AGo4kSK-F1rdFIhs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-29_03,2025-07-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0 clxscore=1015
 mlxlogscore=999 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507290104

On Mon, Jul 28, 2025 at 3:15=E2=80=AFPM Rob Clark <rob.clark@oss.qualcomm.c=
om> wrote:
>
> On Mon, Jul 28, 2025 at 2:04=E2=80=AFPM Connor Abbott <cwabbott0@gmail.co=
m> wrote:
> >
> > On Mon, Jul 28, 2025 at 4:43=E2=80=AFPM Rob Clark <robin.clark@oss.qual=
comm.com> wrote:
> > >
> > > This is needed to properly interpret some of the sections.
> > >
> > > Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
> > > ---
> > >  drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c | 2 ++
> > >  1 file changed, 2 insertions(+)
> > >
> > > diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c b/drivers/gp=
u/drm/msm/adreno/a6xx_gpu_state.c
> > > index faca2a0243ab..e586577e90de 100644
> > > --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
> > > +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
> > > @@ -1796,6 +1796,7 @@ static void a7xx_show_shader(struct a6xx_gpu_st=
ate_obj *obj,
> > >
> > >         print_name(p, "  - type: ", a7xx_statetype_names[block->state=
type]);
> > >         print_name(p, "    - pipe: ", a7xx_pipe_names[block->pipeid])=
;
> > > +       drm_printf(p, "    - location: %d", block->location);
> >
> > We should probably at least try to keep it proper YAML by indenting
> > everything after another level...
>
> this made me realize I missed a \n... but otherwise I think the indent
> is correct?  Or should location not have a leading '-'?

beyond that, even without the added location field, some random online
yaml checker is telling me that we were already not proper yaml.. so I
guess, :shrug:?

BR,
-R

