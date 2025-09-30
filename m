Return-Path: <linux-arm-msm+bounces-75566-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 169F2BABD17
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Sep 2025 09:26:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 728F318881AB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Sep 2025 07:26:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 767562BD5BD;
	Tue, 30 Sep 2025 07:26:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ak/DaJwB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D077227AC3D
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Sep 2025 07:26:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759217170; cv=none; b=fKetvrHz8L/eqAZkvtK5lzMi55HhoqdzONEuFd0R3ZqQftjEXVlkishJwFtRxxaR1o4X0e3hR650W/ijeYBbGbvaosVFouE+grbkz/1bttobuMQg29jPa+aizy0CKXoVbb7dHRGJ/PMCvgD2r2638Rbdl/89Ye44sF85hzZ+SNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759217170; c=relaxed/simple;
	bh=UrXXb74599R8BZwIXkzJxHVqUA8YfSKR3ekHC6kpqv4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ty8yE6eHUhOve8YsrKgjtFO+wXeMvSVJdUPG2CSqosPCi3XsKatlNsZ4nvq27tDK+m4aukybA0GM9Hs55CugtDAJCXFb5GrPnxIYVSC4lpXlerglad6+kyHhfrthIAKC6ei3bMqfR7pwPKHvMLCIotq4Iayg8dBVhu4/qgCKYTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ak/DaJwB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58U4IVWS022345
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Sep 2025 07:26:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=NJKkBSbx/8tqEG8xyEV6jB7VZnVlHiCHJaTcMaV3vdw=; b=Ak
	/DaJwBmKTwW3xCru1IZ19Bx3qchaFKy4WY9jpPbNbKcGYQGlfHSvI1ZU9YSbT3wT
	jKnXCp3NLSNDeM+BZ8pwNUCAspsTnZ013ZmAumkXntu9a9E4uP/YeCo3GMkMoVcX
	3ujKXRjRN145HCmZjr//WUOyVhVhw3zS9iUCVt12OgRpA0KdnL2zzYuu1X/YMzUU
	OZ8SNVNBNZA/Zu2+fPQC+v8XVuoDRRKh1//bL4vbEP+ZI/rNXFJt59TRICLQ3l+c
	j63z0V475fTu89lVoQYzJnJp1gwlC7MlRVNpsTk+PlYXsH2rvYb3FVgadwqeDuS+
	vyKEUcBKULsUZ5PPUA+w==
Received: from mail-oa1-f69.google.com (mail-oa1-f69.google.com [209.85.160.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e6x5r3tv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Sep 2025 07:26:07 +0000 (GMT)
Received: by mail-oa1-f69.google.com with SMTP id 586e51a60fabf-33450d89acaso9456569fac.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Sep 2025 00:26:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759217167; x=1759821967;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NJKkBSbx/8tqEG8xyEV6jB7VZnVlHiCHJaTcMaV3vdw=;
        b=qvwYn4qnYwiNyvtpeSv6e7i3657667onbZQXtzeMSycr7DlSiRVr6q4zSmQGJYepOZ
         k3A0svGypWX8RzBo6sPcSTPpwAo+V6BDvU9dPjJka4DiSw3FuB/NOPyYzNZP/RXgh8mT
         +0fFG8eGWICWg7hlWOb0ARrSYlqnBMH56M9Jthdmuh7FCMdTwzj3vC6gIjBHfkx/+wH9
         stMJ1/jdQDfEYAtGkdQ7MPrFJ0s3qEQRiwgqdkYifXeKO0Fi4h0ApLdjlE+tKMZQ2hgr
         2IEyyvBnuI6Dml8t00HHm/FLoLKKToyB1GN2n1/EXxSmI1mtC3iOY/fLlVzqgfjlo1en
         uiNA==
X-Forwarded-Encrypted: i=1; AJvYcCXv1VafzDu/owfCXkdCTq//KTjMaTs7E+JtAe5ca86ZZySabl4dIsn0gidCoI69hXUPKy3Ih/HDHblvaDYU@vger.kernel.org
X-Gm-Message-State: AOJu0YyDj1PHeQP06uFTt6iy4E8beoX2m1nQO9uzQH6Vj9lbpZY/Ns3t
	YgmCJRqiwdwXZJaHkglU74pizXuILm47Ejc5r8n4+t760lAh3Xe0lUOtzRvLsUiW2jbBJ/TEJxQ
	pA+xvxZM8CtgnUGcUkBRUyXYAA3YcRiSmHM6lkNslCrXjUxBJjuupA5eQ/3Wj4tKedeYsLCHIT9
	BnjgZupV8jY8OzvOvUzxOiUNnepDRXaANMlOzbC2XrXxU=
X-Gm-Gg: ASbGncsRFMND20ocdktE/vBm4KM9FWdjDLxn2cGsg3WakFp9gos/1SVlZAbRYtYVoSK
	VJkf2Qv7ZJXOJ5SR8fY0Toc5zghCl/gFrBz0J1Dysx2AEqLlPc8iz3B+vNrGpPWErDc16GZQWse
	FHy4wpVYCx229QXbSWDJcjhZ2DYsi4zd89fjJsxjzi7yaH9JAFTwM8T00=
X-Received: by 2002:a05:6870:e08f:b0:31a:70c0:d498 with SMTP id 586e51a60fabf-38cadf744d7mr1709958fac.2.1759217166931;
        Tue, 30 Sep 2025 00:26:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGpcV7QCeOoB82oAsfyshYDoFlRPDZXQ5WvKfJlIGOQR9mFN5O4/G07y/zEQHyHa3AJYBNUcaNtfqPGXVCGfxk=
X-Received: by 2002:a05:6870:e08f:b0:31a:70c0:d498 with SMTP id
 586e51a60fabf-38cadf744d7mr1709930fac.2.1759217166525; Tue, 30 Sep 2025
 00:26:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250930-kaana-gpu-support-v1-0-73530b0700ed@oss.qualcomm.com>
 <20250930-kaana-gpu-support-v1-3-73530b0700ed@oss.qualcomm.com> <xsgnpvswvkyuxiviv4uyb6pxbpi646fut6dy54kpyfisqrxycz@tyfox3zdi26e>
In-Reply-To: <xsgnpvswvkyuxiviv4uyb6pxbpi646fut6dy54kpyfisqrxycz@tyfox3zdi26e>
Reply-To: rob.clark@oss.qualcomm.com
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Tue, 30 Sep 2025 00:25:55 -0700
X-Gm-Features: AS18NWACYkWNYimh8t14gY4Dmrp_AbVsBXT_pDvjcLAcFBgJJlOrGd5Fr1oHJ8o
Message-ID: <CACSVV011=_szCPbdm6YA8aJjm76r_BZP9QFeOzcAGCvqUUTebg@mail.gmail.com>
Subject: Re: [PATCH 03/17] drm/msm/adreno: Common-ize PIPE definitions
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Sean Paul <sean@poorly.run>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jonathan Marek <jonathan@marek.ca>,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: 71wLhIFSlXKlpAZn-UmvU6qm8wf6iT2y
X-Proofpoint-ORIG-GUID: 71wLhIFSlXKlpAZn-UmvU6qm8wf6iT2y
X-Authority-Analysis: v=2.4 cv=ZtPg6t7G c=1 sm=1 tr=0 ts=68db860f cx=c_pps
 a=zPxD6eHSjdtQ/OcAcrOFGw==:117 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10
 a=EUspDBNiAAAA:8 a=2l_kmpBevnkUXydlazsA:9 a=QEXdDO2ut3YA:10
 a=y8BKWJGFn5sdPF1Y92-H:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAxOCBTYWx0ZWRfX77EGZB1xg533
 raRj5uNsyWIuPzZ98gcpPzSU9bWv9uGipNaXoTXYzJ3/SmhbBtET8AX/qhTrIyZruN86UY6Hsv2
 TYIfO0Mh0SSxMSV7i+9qg2B4somw4JHR1JQsWFUSMJEeLYJAu3caL2rXaci6xwsK4dUrcDv/zaI
 Lx+o95ofYDsvA83SJKXxfn3wS6EwBw8H+AWtrpWE7rl+DPHrE7GYhsOzUbOuqRBZBSmb5da+wJA
 UqwJVe/bAFeE4WS7sWNrId3zoPfX+9ofL9ehfLlJR7xiJTWZPKlsalVlq02OQW+CiPUdLnNxP3a
 3+b9jWg1uG7ithc5cJj03CrxjWa6Llikq2v7JyQ/FVB/ZVdc9vVwyNcy7EQi2PsPX7yo7drUHrD
 t1hXdxulYY3ygl1nu/kP0bEOhVtFTQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-30_01,2025-09-29_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 priorityscore=1501 malwarescore=0 bulkscore=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509270018

On Tue, Sep 30, 2025 at 12:05=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> On Tue, Sep 30, 2025 at 11:18:08AM +0530, Akhil P Oommen wrote:
> > PIPE enum definitions are backward compatible. So move its definition
> > to adreno_common.xml.
>
> What do you mean here by 'backward compatible'. Are they going to be
> used on a6xx? a5xx? If not, then why do we need to move them?

Newer gen's introduce pipe enums which do not exist on older gens, but
the numeric values do not conflict.  Ie. each gen is a superset of the
previous.

BR,
-R

> >
> > Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> > ---
> >  drivers/gpu/drm/msm/adreno/a6xx_gpu_state.h        |  10 +-
> >  .../gpu/drm/msm/adreno/adreno_gen7_0_0_snapshot.h  | 412 +++++++++----=
-----
> >  .../gpu/drm/msm/adreno/adreno_gen7_2_0_snapshot.h  | 324 +++++++------=
--
> >  .../gpu/drm/msm/adreno/adreno_gen7_9_0_snapshot.h  | 462 ++++++++++---=
--------
> >  drivers/gpu/drm/msm/registers/adreno/a6xx.xml      |   4 +-
> >  .../gpu/drm/msm/registers/adreno/a7xx_enums.xml    |   7 -
> >  .../gpu/drm/msm/registers/adreno/adreno_common.xml |  11 +
> >  7 files changed, 617 insertions(+), 613 deletions(-)
> >
>
> --
> With best wishes
> Dmitry

