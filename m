Return-Path: <linux-arm-msm+bounces-58318-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 52394ABAF49
	for <lists+linux-arm-msm@lfdr.de>; Sun, 18 May 2025 12:32:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2230F18955AA
	for <lists+linux-arm-msm@lfdr.de>; Sun, 18 May 2025 10:33:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E95E1A2643;
	Sun, 18 May 2025 10:32:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Cagupj3D"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E34451A0B08
	for <linux-arm-msm@vger.kernel.org>; Sun, 18 May 2025 10:32:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747564367; cv=none; b=eBnXqStwoQcyYH5Mn87HV+pkOx4uyYB1cMuuejn4o48xye+HCZ7kp40cDwYf7GBFeuOEaRwBFCV3+A/vVnaM49zEuv6VHbkEcc06qTVgv0KxQI8I0U+m2uXNlduLTSob7CidaVTSrxFGO2pf8rulTZtlwBrW3aiX0f5Ul0Mip5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747564367; c=relaxed/simple;
	bh=rSNr1F8OgyIGJLC0wtphqTviRCaYM5uKzSUj+k5gOJk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pwqs8XPtIMfuUpBmOecv6gCKoURri3bcydQfvpsqnBp1ul7RYAM6nvtUnUi7nNSOt2hfP352TLTNemkxZ6OY2+k+Brmag37LBwmLL0Rzo3WTNVggO1N/H8RGaUyKSb9SVnSM1Gn8CHPJxlxcj9bJVKltgl+XyBdvERMCWozyuVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Cagupj3D; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54I8vA0e014012
	for <linux-arm-msm@vger.kernel.org>; Sun, 18 May 2025 10:32:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2KMB4Lkwm4bquu4Frj3qRe08ajtmQ9XJffkypZKuOtk=; b=Cagupj3DupOaDdl6
	hZIHTICpCYogEUpG17UOi7aniNW9zbtJ8S0B/WFJKxGBujRSALz40kNN67ic6Imb
	dafeHScYr+SEcsBPMejJ+zgPXIXnlKRnwP1STx1djW7IIlJl7IUw+5oPB5J/bzb6
	ZsvFkYLDfF11iRCuGNAwkf2wf6NBJ9lxxqTSdZhOOJdY8l8CvkgLLANKhK6W2dGo
	CBdBJXZXsW2N91bQjdZKPJVyXiVNPkeEoU6tt7mW6t+0fd+o6DWDupPeWvuEGfJk
	d2hsn9F1ZpxgTeHBorfPP9RWlPbm8oZMuh9vlFsKtdPsjwjKMXu+mfITrA2PHg8Y
	xYoukQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pkmm9s9x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 18 May 2025 10:32:44 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6f8af2b8e5fso54331426d6.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 18 May 2025 03:32:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747564363; x=1748169163;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2KMB4Lkwm4bquu4Frj3qRe08ajtmQ9XJffkypZKuOtk=;
        b=ndLbdf762C4/hFd4N5Y2YFvRK8Q5NdCP2umkIp2NLMDbhsw1fZFQ2/JeNNsoilwvkX
         7MIvLcE+bvZu1pPnwBphmneBNSZxoNyUdlDoEy46+noww2TIIfSpv350DiqP2Bf+Fdm1
         RUCZh4KplSj+XKrvSBFHWNPln/fZz9jlulWw4YPzeqn1/Bx/YW2vWJIMz20KNWWgYCeF
         kxxv4j34B3/TBQXzuC8tWPVeNKRXJKMYDC79j5XXKpnAZTXWNq5Vu2uhqO15x4RBZPTn
         RY7nIjoONe0PTG1kDg73ioCvkBetFlSVIH9MolflZZrOOUqPflOh6Sur1nkdt3p+1NkB
         6vgA==
X-Forwarded-Encrypted: i=1; AJvYcCVouCGHt32qozSPKIuGKmx1zIe01YPI5EbSmiZzgDcTf2NZVEH5FZEylAG8RdFTkrMKoNi+AS8iq5wsjRbv@vger.kernel.org
X-Gm-Message-State: AOJu0YxF52JLQ3fQskUR9lyOb5C1m2glEAjRpFaBNiwNoW7UlkQyVRwR
	tjlFacks3kBLkZjfOJqe2PdtVsU2YYfS1AGeU2kj9V/vI+84p+JHRIABZj/vF1cox/VjuFAQ9ir
	PETYuoDApTqsAMLgINLI587uzoWI/p5wa7p4uBBQ3sqa7fNkmgLT46XeFGlcGKXhfmxm4
X-Gm-Gg: ASbGnct1O1NzUecPW2AVYe+n84z1SYKcxKEVXUqGc4Z4JMWMrEmtubRBBQoDjQL3t8K
	7/I4cnNDnbym/oARrMAT/8VhxvYYI5lSFXXUkkVIKJSofaThjUfLFIoET+wCEayL4v61jq9m3kd
	ozRPcKBHqRTE72kjrc9UMOmsAiOVru+U42bpWoC0lY8ytMlt2/tuPsGlNqZuCA0YeNmZLqn7O/W
	L4+Pc1kcTcxXuY70+y/9Q/cuGwnoNKZ7PmOuPaQD2Z09PyEEi8SAsdhfaj6JsMRzZC5VZpjjkBI
	ermHJU44sRdBI8X/gl6nLvj8DhT4OC5sQPMug+L9QYiGex1OrCU36E23bPyEtz9qpxk8dn2A9DY
	=
X-Received: by 2002:a05:6214:14ec:b0:6f8:c23c:5257 with SMTP id 6a1803df08f44-6f8c23c82b2mr69977826d6.11.1747564363363;
        Sun, 18 May 2025 03:32:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEPoFsBUaDrnwOXnuPwNlAF6cFAuLO04cfaVzqOcUVBeyq/FhbV/KeXlfPcZ1p20TjPJxmqKw==
X-Received: by 2002:a05:6214:14ec:b0:6f8:c23c:5257 with SMTP id 6a1803df08f44-6f8c23c82b2mr69977686d6.11.1747564363030;
        Sun, 18 May 2025 03:32:43 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e6f161bcsm1392553e87.7.2025.05.18.03.32.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 May 2025 03:32:42 -0700 (PDT)
Date: Sun, 18 May 2025 13:32:40 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Clark <robdclark@gmail.com>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 11/11] drm/msm: make it possible to disable GPU support
Message-ID: <b7zkrdxmigz3bmgphedzoosgesxs3y24wgi4l52zf6r6djo7vo@aupsak7d6ma2>
References: <20250503-msm-gpu-split-v2-0-1292cba0f5ad@oss.qualcomm.com>
 <20250503-msm-gpu-split-v2-11-1292cba0f5ad@oss.qualcomm.com>
 <CAF6AEGt8uB-KWLDora9SN3K_VntSYZ4HNay4XLd+KqQzcQNfcg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAF6AEGt8uB-KWLDora9SN3K_VntSYZ4HNay4XLd+KqQzcQNfcg@mail.gmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE4MDA5OSBTYWx0ZWRfX04SGl6C7+CmW
 elhDeMh1dxIHuFb09CzM7ohpxeQmGlj0LnbQV3yMxybBbIjMu2F+MDdZAMQgPz8YwJ5ejID5Ptk
 qMF6aEcftnuG8zsw/hIIviG4OAvUNVn2yJ/92EFuBU4n9p1jIlV/tw3BOkSivCwIKabeJNgdKG8
 5gOL/EP0GzGe4MWeYTktA7MOMod+KuDiv2u/gjxG/tKosPppwPnuMAfwzUkxYmZlUgzyrBVye5B
 NeEH7U4k0iJB0VLOfuNsIAlhqq7PCfHNfXkLCTgx0iaFywY2sBpKgV1JtbmUAbUsJLju9r4IDpv
 c6ijmcvO0c4maYuwBglr4aKi4Z74dNcG9NiJl9draGCQ0oW/RC8G+ZWhD+jahpxdn4VNo64RN6O
 t58+IOr3JyWJlSrXyZp6jipP8YsaL0qFJpsAr0C1XKCUu1QX5ple1MmPoYqyrWx6vQtJd9QU
X-Proofpoint-ORIG-GUID: uGn21ulpCBQgfrRRLlcaGWMKH2TN6HKN
X-Authority-Analysis: v=2.4 cv=PpyTbxM3 c=1 sm=1 tr=0 ts=6829b74c cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=hVAVfT_TPH0Tf30rILYA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-GUID: uGn21ulpCBQgfrRRLlcaGWMKH2TN6HKN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-18_05,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 mlxscore=0 adultscore=0 clxscore=1015
 lowpriorityscore=0 mlxlogscore=999 priorityscore=1501 phishscore=0
 bulkscore=0 impostorscore=0 suspectscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505180099

On Wed, May 07, 2025 at 09:45:26AM -0700, Rob Clark wrote:
> On Sat, May 3, 2025 at 12:17 AM Dmitry Baryshkov
> <dmitry.baryshkov@oss.qualcomm.com> wrote:
> >
> > Some of the platforms don't have onboard GPU or don't provide support
> > for the GPU in the drm/msm driver. Make it possible to disable the GPU
> > part of the driver and build the KMS-only part.
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > ---
> >  drivers/gpu/drm/msm/Kconfig           |  20 +++--
> >  drivers/gpu/drm/msm/Makefile          |  14 ++--
> >  drivers/gpu/drm/msm/msm_debugfs.c     | 135 ++++++++++++++++++----------------
> >  drivers/gpu/drm/msm/msm_drv.c         |  37 ++++++++--
> >  drivers/gpu/drm/msm/msm_drv.h         |   3 +
> >  drivers/gpu/drm/msm/msm_gpu.h         |  71 +++++++++++++++---
> >  drivers/gpu/drm/msm/msm_submitqueue.c |  12 +--
> >  7 files changed, 191 insertions(+), 101 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/Kconfig b/drivers/gpu/drm/msm/Kconfig
> > index f6360931ae55a2923264f0e6cc33c6af0d50c706..5605d2bc93a8ad9cb33afcb8ca9da44c68250620 100644
> > --- a/drivers/gpu/drm/msm/Kconfig
> > +++ b/drivers/gpu/drm/msm/Kconfig
> > @@ -15,29 +15,37 @@ config DRM_MSM
> >         select IOMMU_IO_PGTABLE
> >         select QCOM_MDT_LOADER if ARCH_QCOM
> >         select REGULATOR
> > -       select DRM_EXEC
> > -       select DRM_SCHED
> >         select SHMEM
> >         select TMPFS
> >         select QCOM_SCM
> >         select WANT_DEV_COREDUMP
> >         select SND_SOC_HDMI_CODEC if SND_SOC
> > -       select SYNC_FILE
> 
> fwiw, atomic depends on SYNC_FILE... otoh it is selected at the
> toplevel by CONFIG_DRM

Within drm/msm it is only used by GEM_SUBMIT code, so I still think this
is correct.

-- 
With best wishes
Dmitry

