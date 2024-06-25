Return-Path: <linux-arm-msm+bounces-24147-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3104B916FE4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Jun 2024 20:09:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AE70B1F21142
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Jun 2024 18:09:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49733177991;
	Tue, 25 Jun 2024 18:08:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Sl+0PY5F"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B1FA1448D9;
	Tue, 25 Jun 2024 18:08:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719338939; cv=none; b=Zh7qjJDylF34uePUj66RbILBf8XjdszElqHuUKx05jYB9ZNPezL1BW09Ucb7KQAjJrM/mc4pDxtO1j2B2N3iopqkZiGJ0d8xkBi4lwTq0xx+vjb1WKf6XxSaSb6vT55M7MniggcgjgbS83wz7OQ0DHjckUiKwSOMwdK5XrhQnmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719338939; c=relaxed/simple;
	bh=AN2gZtOrjNs2QAyvcb3/Z2z2KnAuUXwpT0fTixNOa90=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ntYV6xZXTZ49YkNz8Y9K4/VY5sWKmg6mYafMW/yosXYbzClK7zPSQ+9kEWltUaAntssZ9rq+1DxHNRuX2iJX6gZTya+j5JQTPyDlX7ZrOFX9QqvBQ4LnhYdkcKXpSvPqw8glGJnrStNwlOum8OWDXmfwyIZcGD72dHAunv5jsao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Sl+0PY5F; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45PHavnd014015;
	Tue, 25 Jun 2024 18:08:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=3JsXq62eYBU+AgpK93injFlx
	U51RPJcpGnlvOv5wTAU=; b=Sl+0PY5FiMSN8KUU6iobtbV7noaA33mnJpaK+TK/
	xZeufliz68mek3H9inna31HRrc/9/oMSrs8AhHM2cYh/XUEp4IXa4Cro5TTmoZbW
	x+VAUqF1n4TnvrlphVRbhjwSREPpMmWT9MYjqHcNcKlIExE2byC0qM+k4X14ZkwQ
	84iC7tTuiuovEHeDSIfYwAQaF5L1u6cl2LyIVUdKkXcb65zlMG60hsU9MoclUv+r
	s1p36hzk428Ifjtj2WyOPQHFnAmNv2Fs2ux0S/OZEaKiuQxjvouz6DtsiXNaw/Yd
	HVh2x1ilvQ0DQIXSrH4Wgxk+5BLUSHo37HVC5xpY+gD55Q==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ywnxgy8n1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Jun 2024 18:08:41 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45PI8ef1029978
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Jun 2024 18:08:40 GMT
Received: from hu-akhilpo-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 25 Jun 2024 11:08:35 -0700
Date: Tue, 25 Jun 2024 23:38:31 +0530
From: Akhil P Oommen <quic_akhilpo@quicinc.com>
To: Konrad Dybcio <konrad.dybcio@linaro.org>
CC: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        "Abhinav
 Kumar" <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov
	<dmitry.baryshkov@linaro.org>,
        Marijn Suijten
	<marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, "Daniel
 Vetter" <daniel@ffwll.ch>,
        Rob Clark <robdclark@chromium.org>, <linux-arm-msm@vger.kernel.org>,
        <dri-devel@lists.freedesktop.org>, <freedreno@lists.freedesktop.org>,
        <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] drm/msm/adreno: De-spaghettify the use of memory barriers
Message-ID: <20240625180831.7ng5suoo57b5neue@hu-akhilpo-hyd.qualcomm.com>
References: <20240508-topic-adreno-v1-1-1babd05c119d@linaro.org>
 <20240514183849.6lpyplifero5u35r@hu-akhilpo-hyd.qualcomm.com>
 <5ff40fba-e45a-4a5c-b5a7-7ef5a799a008@linaro.org>
 <20240618163823.t3hqxyqeopkilxej@hu-akhilpo-hyd.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240618163823.t3hqxyqeopkilxej@hu-akhilpo-hyd.qualcomm.com>
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: eU7HIRKfVnzerdzXx4fOkFeubgInutp2
X-Proofpoint-ORIG-GUID: eU7HIRKfVnzerdzXx4fOkFeubgInutp2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-25_13,2024-06-25_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 clxscore=1015
 suspectscore=0 spamscore=0 lowpriorityscore=0 adultscore=0 mlxscore=0
 malwarescore=0 priorityscore=1501 mlxlogscore=966 impostorscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2406250133

On Tue, Jun 18, 2024 at 10:08:23PM +0530, Akhil P Oommen wrote:
> On Tue, Jun 04, 2024 at 07:35:04PM +0200, Konrad Dybcio wrote:
> > 
> > 
> > On 5/14/24 20:38, Akhil P Oommen wrote:
> > > On Wed, May 08, 2024 at 07:46:31PM +0200, Konrad Dybcio wrote:
> > > > Memory barriers help ensure instruction ordering, NOT time and order
> > > > of actual write arrival at other observers (e.g. memory-mapped IP).
> > > > On architectures employing weak memory ordering, the latter can be a
> > > > giant pain point, and it has been as part of this driver.
> > > > 
> > > > Moreover, the gpu_/gmu_ accessors already use non-relaxed versions of
> > > > readl/writel, which include r/w (respectively) barriers.
> > > > 
> > > > Replace the barriers with a readback that ensures the previous writes
> > > > have exited the write buffer (as the CPU must flush the write to the
> > > > register it's trying to read back) and subsequently remove the hack
> > > > introduced in commit b77532803d11 ("drm/msm/a6xx: Poll for GBIF unhalt
> > > > status in hw_init").
> > > > 
> > > > Fixes: b77532803d11 ("drm/msm/a6xx: Poll for GBIF unhalt status in hw_init")
> > > > Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> > > > ---
> > > >   drivers/gpu/drm/msm/adreno/a6xx_gmu.c |  5 ++---
> > > >   drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 14 ++++----------
> > > >   2 files changed, 6 insertions(+), 13 deletions(-)
> > > 
> > > I prefer this version compared to the v2. A helper routine is
> > > unnecessary here because:
> > > 1. there are very few scenarios where we have to read back the same
> > > register.
> > > 2. we may accidently readback a write only register.
> > 
> > Which would still trigger an address dependency on the CPU, no?
> 
> Yes, but it is not a good idea to read a write-only register. We can't be
> sure about its effect on the endpoint.
> 
> > 
> > > 
> > > > 
> > > > diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> > > > index 0e3dfd4c2bc8..4135a53b55a7 100644
> > > > --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> > > > +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> > > > @@ -466,9 +466,8 @@ static int a6xx_rpmh_start(struct a6xx_gmu *gmu)
> > > >   	int ret;
> > > >   	u32 val;
> > > > -	gmu_write(gmu, REG_A6XX_GMU_RSCC_CONTROL_REQ, 1 << 1);
> > > > -	/* Wait for the register to finish posting */
> > > > -	wmb();
> > > > +	gmu_write(gmu, REG_A6XX_GMU_RSCC_CONTROL_REQ, BIT(1));
> > > > +	gmu_read(gmu, REG_A6XX_GMU_RSCC_CONTROL_REQ);
> > > 
> > > This is unnecessary because we are polling on a register on the same port below. But I think we
> > > can replace "wmb()" above with "mb()" to avoid reordering between read
> > > and write IO instructions.
> > 
> > Ok on the dropping readback part
> > 
> > + AFAIU from Will's response, we can drop the barrier as well

Yes, let drop the the barrier.

> 
> Lets wait a bit on Will's response on compiler reordering.
> 
> > 
> > > 
> > > >   	ret = gmu_poll_timeout(gmu, REG_A6XX_GMU_RSCC_CONTROL_ACK, val,
> > > >   		val & (1 << 1), 100, 10000);
> > > > diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> > > > index 973872ad0474..0acbc38b8e70 100644
> > > > --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> > > > +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> > > > @@ -1713,22 +1713,16 @@ static int hw_init(struct msm_gpu *gpu)
> > > >   	}
> > > >   	/* Clear GBIF halt in case GX domain was not collapsed */
> > > > +	gpu_write(gpu, REG_A6XX_GBIF_HALT, 0);
> > > 
> > > We need a full barrier here to avoid reordering. Also, lets add a
> > > comment about why we are doing this odd looking sequence.

Please ignore this.

> > > 
> > > > +	gpu_read(gpu, REG_A6XX_GBIF_HALT);
> > > >   	if (adreno_is_a619_holi(adreno_gpu)) {
> > > > -		gpu_write(gpu, REG_A6XX_GBIF_HALT, 0);
> > > >   		gpu_write(gpu, REG_A6XX_RBBM_GPR0_CNTL, 0);
> > > > -		/* Let's make extra sure that the GPU can access the memory.. */
> > > > -		mb();
> > > 
> > > We need a full barrier here.

Please ignore this.

> > > 
> > > > +		gpu_read(gpu, REG_A6XX_RBBM_GPR0_CNTL);
> > > >   	} else if (a6xx_has_gbif(adreno_gpu)) {
> > > > -		gpu_write(gpu, REG_A6XX_GBIF_HALT, 0);
> > > >   		gpu_write(gpu, REG_A6XX_RBBM_GBIF_HALT, 0);
> > > > -		/* Let's make extra sure that the GPU can access the memory.. */
> > > > -		mb();
> > > 
> > > We need a full barrier here.
> > 
> > Not sure we do between REG_A6XX_GBIF_HALT & REG_A6XX_RBBM_(GBIF_HALT/GPR0_CNTL),
> > but I suppose keeping the one after REG_A6XX_RBBM_(GBIF_HALT/GPR0_CNTL) makes
> > sense to avoid the possibility of configuring the GPU before it can access DRAM..
> 
> Techinically, I think we don't need a barrier or the below read back.
> Because the above write is ordered with the write (on CP_CNTL reg) which
> finally triggers CP INIT later. GPU won't access memory before CP INIT.
> 
> > 
> > > 
> > > > +		gpu_read(gpu, REG_A6XX_RBBM_GBIF_HALT);
> > > >   	}
> > > > -	/* Some GPUs are stubborn and take their sweet time to unhalt GBIF! */
> > > > -	if (adreno_is_a7xx(adreno_gpu) && a6xx_has_gbif(adreno_gpu))
> > > > -		spin_until(!gpu_read(gpu, REG_A6XX_GBIF_HALT_ACK));
> > > > -
> > > 
> > > Why is this removed?
> > 
> > Because it was a hack in the first place and the enforcement of GBIF
> > unhalt requests coming through before proceeding further removes the
> > necessity to check this (unless there's some hw-mandated delay we should
> > keep in mind, but kgsl doesn't have that and there doesn't seem to be
> > any from testing on 8[456]50).
> 
> Oh! I just saw the history. There is no ack for 'unhalt' in hw.
> Anyway this chunk is an unrelated change. Should be a separate change,
> no?

I need this fix this as soon as possible for the x185 support. It is
almost unusable without it. Could you spin off a separate patch and get
it picked up via fixes branch?

-Akhil.

> 
> -Akhil.
> 
> > 
> > Konrad
> 

