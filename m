Return-Path: <linux-arm-msm+bounces-24369-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D8BB19199BF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Jun 2024 23:25:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8CA151F21B92
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Jun 2024 21:25:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6D75193079;
	Wed, 26 Jun 2024 21:25:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="mJlb6Z/V"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEB3116A928;
	Wed, 26 Jun 2024 21:25:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719437116; cv=none; b=eMLkHrDjtgJBFzYjTR9+nfxwjE5J8KmtDoq8BCbJYX9G8/Jhpro+MXjQutpUWwADvRYwHbsYZ9pt576x0rGCFwULpa9JMjJcSyH1CMV6Me2xUlNbEttBTQbMTxN0T55yqSxcqRsa/3qpYVuRTSVEKfy2Ps2I3zWOP17w6QOFyPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719437116; c=relaxed/simple;
	bh=yz02GQg7SnGbDofjQXyTGYwb1dI9XdurlWALT8/xE+4=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dJD/gl5emdE7UMt/ahAGqFFo8tHwhu32s0Jq/JTDsqxgbldBTVZF7MqTnSavlYKrfbRAbQYmkgjm0mGld5QBDOWBuaJE0EIFDAvh6nl/SWO516pmCuptbZrKYoFtyupsowbQO/iEGOhl9e6WHQhZ+JMfI3swqzMJd8OAlKmbVP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=mJlb6Z/V; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45QAfO9k022637;
	Wed, 26 Jun 2024 21:25:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=nWi1f4L6tVObOEm0tdP1wqNu
	RubnmH3/3FPWzgfwbQs=; b=mJlb6Z/VWX8GpiF+D84oBEackWRDCwqfyfLXlk0t
	MDBDBQV86YGAYoiaBDWAO30kRqMDQl0TX50M06CkeqyxAtb5Gqusr9sijoL4+esT
	5/1moBOO9Vt1M+RSZRl7jglLvTOGPdcKQznCjtcqEqy3ZX3Jokt1tfkUX7AbRQLS
	I14Mq5BwUYmt8bJY3uwsnXJtOo+YC5Kw35FcX2F/8IED08MtnS0Sucm/JrpaMjYU
	He+F2+koEpG2u76YFl8ePMYI+J8XTPpOFjrio59k7jFic5BNcQH+YHzOeQuhqIfM
	icHxbsuwgACUu0lEjt3HHGQN9eXr9+3rCjUtcZzTO+WN9Q==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ywqw9j6pq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Jun 2024 21:25:06 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45QLP5mG000516
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Jun 2024 21:25:05 GMT
Received: from hu-akhilpo-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 26 Jun 2024 14:25:01 -0700
Date: Thu, 27 Jun 2024 02:54:57 +0530
From: Akhil P Oommen <quic_akhilpo@quicinc.com>
To: Daniel Vetter <daniel@ffwll.ch>
CC: Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark <robdclark@gmail.com>,
        Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        David Airlie
	<airlied@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 1/2] drm/msm/adreno: De-spaghettify the use of memory
 barriers
Message-ID: <20240626212457.6io63avdbncuq6hb@hu-akhilpo-hyd.qualcomm.com>
References: <20240625-adreno_barriers-v2-0-c01f2ef4b62a@linaro.org>
 <20240625-adreno_barriers-v2-1-c01f2ef4b62a@linaro.org>
 <ZnvKa29EceUyZ62U@phenom.ffwll.local>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ZnvKa29EceUyZ62U@phenom.ffwll.local>
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: LBvcysRC4AIoKKe671z-k03d7RCFP9HA
X-Proofpoint-GUID: LBvcysRC4AIoKKe671z-k03d7RCFP9HA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-26_14,2024-06-25_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0
 priorityscore=1501 clxscore=1015 impostorscore=0 mlxscore=0
 lowpriorityscore=0 malwarescore=0 mlxlogscore=999 phishscore=0 bulkscore=0
 adultscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2406140001 definitions=main-2406260157

On Wed, Jun 26, 2024 at 09:59:39AM +0200, Daniel Vetter wrote:
> On Tue, Jun 25, 2024 at 08:54:41PM +0200, Konrad Dybcio wrote:
> > Memory barriers help ensure instruction ordering, NOT time and order
> > of actual write arrival at other observers (e.g. memory-mapped IP).
> > On architectures employing weak memory ordering, the latter can be a
> > giant pain point, and it has been as part of this driver.
> > 
> > Moreover, the gpu_/gmu_ accessors already use non-relaxed versions of
> > readl/writel, which include r/w (respectively) barriers.
> > 
> > Replace the barriers with a readback (or drop altogether where possible)
> > that ensures the previous writes have exited the write buffer (as the CPU
> > must flush the write to the register it's trying to read back).
> > 
> > Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> 
> Some in pci these readbacks are actually part of the spec and called
> posting reads. I'd very much recommend drivers create a small wrapper
> function for these cases with a void return value, because it makes the
> code so much more legible and easier to understand.

For Adreno which is configured via mmio, we don't need to do this often. GBIF_HALT
is a scenario where we need to be extra careful as it can potentially cause some
internal lockup. Another scenario I can think of is GPU soft reset where need to
keep a delay on cpu side after triggering. We should closely scrutinize any
other instance that comes up. So I feel a good justification as a comment here
would be enough, to remind the reader. Think of it as a way to discourage the
use by making it hard.

This is a bit subjective, I am fine if you have a strong opinion on this.

-Akhil.

> -Sima
> 
> > ---
> >  drivers/gpu/drm/msm/adreno/a6xx_gmu.c |  4 +---
> >  drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 10 ++++++----
> >  2 files changed, 7 insertions(+), 7 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> > index 0e3dfd4c2bc8..09d640165b18 100644
> > --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> > +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> > @@ -466,9 +466,7 @@ static int a6xx_rpmh_start(struct a6xx_gmu *gmu)
> >  	int ret;
> >  	u32 val;
> >  
> > -	gmu_write(gmu, REG_A6XX_GMU_RSCC_CONTROL_REQ, 1 << 1);
> > -	/* Wait for the register to finish posting */
> > -	wmb();
> > +	gmu_write(gmu, REG_A6XX_GMU_RSCC_CONTROL_REQ, BIT(1));
> >  
> >  	ret = gmu_poll_timeout(gmu, REG_A6XX_GMU_RSCC_CONTROL_ACK, val,
> >  		val & (1 << 1), 100, 10000);
> > diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> > index c98cdb1e9326..4083d0cad782 100644
> > --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> > +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> > @@ -855,14 +855,16 @@ static int hw_init(struct msm_gpu *gpu)
> >  	/* Clear GBIF halt in case GX domain was not collapsed */
> >  	if (adreno_is_a619_holi(adreno_gpu)) {
> >  		gpu_write(gpu, REG_A6XX_GBIF_HALT, 0);
> > +		gpu_read(gpu, REG_A6XX_GBIF_HALT);
> > +
> >  		gpu_write(gpu, REG_A6XX_RBBM_GPR0_CNTL, 0);
> > -		/* Let's make extra sure that the GPU can access the memory.. */
> > -		mb();
> > +		gpu_read(gpu, REG_A6XX_RBBM_GPR0_CNTL);
> >  	} else if (a6xx_has_gbif(adreno_gpu)) {
> >  		gpu_write(gpu, REG_A6XX_GBIF_HALT, 0);
> > +		gpu_read(gpu, REG_A6XX_GBIF_HALT);
> > +
> >  		gpu_write(gpu, REG_A6XX_RBBM_GBIF_HALT, 0);
> > -		/* Let's make extra sure that the GPU can access the memory.. */
> > -		mb();
> > +		gpu_read(gpu, REG_A6XX_RBBM_GBIF_HALT);
> >  	}
> >  
> >  	/* Some GPUs are stubborn and take their sweet time to unhalt GBIF! */
> > 
> > -- 
> > 2.45.2
> > 
> 
> -- 
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch

