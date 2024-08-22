Return-Path: <linux-arm-msm+bounces-29304-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 071E995BEC6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Aug 2024 21:22:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2880A1C2284C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Aug 2024 19:22:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 225BE1D0498;
	Thu, 22 Aug 2024 19:22:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="kINVqTAV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D7C23F9F9;
	Thu, 22 Aug 2024 19:22:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724354531; cv=none; b=A1CjkWYtqQSCDF3gEQ2pu3qKaHdrUm8JDO+NqNZl24aVGbRVyyBBzEpXqpeyK9WZH0BZlhKSrTvgtNcwFYWNeKC4/oXHocuGSmoO+FUDXnCYUUdUhH9l4cRDCSNcNtZFtzhKz1wU7Tnv1TAHKcFbVT3MJLSjvrj8AE68q5Tfo/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724354531; c=relaxed/simple;
	bh=dIFnx3DMA2z/aQRpGRf3zFPoMrt12Gsl+1c2mpFN5PI=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y1jAsM1+9qC6IvlE1g+ce93sBXQahTzPdD8X5kW8DWCELYxbeDBNIm8jsRopLxUWPMVFZh58o/c26kO2/kRznJta3KBJG86bRK5wIRe6vTnUcB73JiYiLI8CcZCcQsPwrgWBD9tMoU4Xss9lbgwkfQXcgKK5PUUQq9/3nV/RnpQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=kINVqTAV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47MDh5Zl011951;
	Thu, 22 Aug 2024 19:21:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SkVk6w/LpiJSCL+Ax35mZ8fTnNCWU4hM0bRlaiMhjwY=; b=kINVqTAVpaloEM0q
	mz1AgZRO1OEUK1yIIk3iTE21Xk9LtCI6/srL1jb76Loh47CCe1abFDxIMAm3pTxJ
	anCsx7Xl82Pi9iHzT6dl4+W0z0oew9vHx4o7V0t2l95r92HBV+vcQ9s5kQeV6hmb
	W2lcmjwjuCmvsFnSixWg0LIMPXEfcpNx6/2wKVWm9rlhG6AqMrU3WXtXg2+Ah1ke
	pA8f3/N69rE72ILTY/wU0DsZzLSQMVDOqMvnl+A76s/5iBXVaOGNSirBVFzYv1IT
	/dEQsxgFClDZtO+XO+2l5PFTOmC1H38qovAZTZCXxn3+xKG+7LUYYnA6er/kxpsy
	nynJAg==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4166ex8x81-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 22 Aug 2024 19:21:54 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47MJLrur022036
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 22 Aug 2024 19:21:53 GMT
Received: from hu-akhilpo-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 22 Aug 2024 12:21:48 -0700
Date: Fri, 23 Aug 2024 00:51:44 +0530
From: Akhil P Oommen <quic_akhilpo@quicinc.com>
To: Connor Abbott <cwabbott0@gmail.com>
CC: Antonino Maniscalco <antomani103@gmail.com>,
        Rob Clark
	<robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio
	<konrad.dybcio@linaro.org>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        "Dmitry Baryshkov" <dmitry.baryshkov@linaro.org>,
        Marijn Suijten
	<marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, "Daniel
 Vetter" <daniel@ffwll.ch>,
        Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 6/7] drm/msm/A6XX: Add a flag to allow preemption to
 submitqueue_create
Message-ID: <20240822192144.e7u3fhlqpeyypbxp@hu-akhilpo-hyd.qualcomm.com>
References: <20240815-preemption-a750-t-v1-0-7bda26c34037@gmail.com>
 <20240815-preemption-a750-t-v1-6-7bda26c34037@gmail.com>
 <20240819203128.hit2csdpbbsybkoq@hu-akhilpo-hyd.qualcomm.com>
 <CACu1E7GnwjS3Hv140emJ_-yJKDd+FB75upF9z3pDTj7Ey7zWRA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACu1E7GnwjS3Hv140emJ_-yJKDd+FB75upF9z3pDTj7Ey7zWRA@mail.gmail.com>
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: z5MMdcRMd41HgQcy0Annz-ATRb_to7qB
X-Proofpoint-ORIG-GUID: z5MMdcRMd41HgQcy0Annz-ATRb_to7qB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-22_12,2024-08-22_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 malwarescore=0
 adultscore=0 lowpriorityscore=0 impostorscore=0 mlxscore=0 clxscore=1015
 bulkscore=0 mlxlogscore=999 phishscore=0 priorityscore=1501 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2407110000
 definitions=main-2408220146

On Tue, Aug 20, 2024 at 11:48:33AM +0100, Connor Abbott wrote:
> On Mon, Aug 19, 2024 at 9:31 PM Akhil P Oommen <quic_akhilpo@quicinc.com> wrote:
> >
> > On Thu, Aug 15, 2024 at 08:26:16PM +0200, Antonino Maniscalco wrote:
> > > Some userspace changes are necessary so add a flag for userspace to
> > > advertise support for preemption.
> >
> > So the intention is to fallback to level 0 preemption until user moves
> > to Mesa libs with level 1 support for each new GPU? Please elaborate a bit.
> >
> > -Akhil.
> 
> Yes, that's right. My Mesa series fixes L1 preemption and
> skipsaverestore by changing some of the CP_SET_MARKER calls and
> register programming and introducing CP_SET_AMBLE calls and then
> enables the flag on a7xx.

And we want to control L1 preemption per submitqueue because both
freedreno and turnip may not have support ready at the same time?

Antonino, since this is a UAPI update, it is good to have these details
captured in the commit msg for reference.

-Akhil.

> 
> Connor
> 
> >
> > >
> > > Signed-off-by: Antonino Maniscalco <antomani103@gmail.com>
> > > ---
> > >  drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 12 ++++++++----
> > >  include/uapi/drm/msm_drm.h            |  5 ++++-
> > >  2 files changed, 12 insertions(+), 5 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> > > index 1a90db5759b8..86357016db8d 100644
> > > --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> > > +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> > > @@ -453,8 +453,10 @@ static void a7xx_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
> > >       OUT_PKT7(ring, CP_SET_MARKER, 1);
> > >       OUT_RING(ring, 0x101); /* IFPC disable */
> > >
> > > -     OUT_PKT7(ring, CP_SET_MARKER, 1);
> > > -     OUT_RING(ring, 0x00d); /* IB1LIST start */
> > > +     if (submit->queue->flags & MSM_SUBMITQUEUE_ALLOW_PREEMPT) {
> > > +             OUT_PKT7(ring, CP_SET_MARKER, 1);
> > > +             OUT_RING(ring, 0x00d); /* IB1LIST start */
> > > +     }
> > >
> > >       /* Submit the commands */
> > >       for (i = 0; i < submit->nr_cmds; i++) {
> > > @@ -485,8 +487,10 @@ static void a7xx_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
> > >                       update_shadow_rptr(gpu, ring);
> > >       }
> > >
> > > -     OUT_PKT7(ring, CP_SET_MARKER, 1);
> > > -     OUT_RING(ring, 0x00e); /* IB1LIST end */
> > > +     if (submit->queue->flags & MSM_SUBMITQUEUE_ALLOW_PREEMPT) {
> > > +             OUT_PKT7(ring, CP_SET_MARKER, 1);
> > > +             OUT_RING(ring, 0x00e); /* IB1LIST end */
> > > +     }
> > >
> > >       get_stats_counter(ring, REG_A7XX_RBBM_PERFCTR_CP(0),
> > >               rbmemptr_stats(ring, index, cpcycles_end));
> > > diff --git a/include/uapi/drm/msm_drm.h b/include/uapi/drm/msm_drm.h
> > > index 3fca72f73861..f37858db34e6 100644
> > > --- a/include/uapi/drm/msm_drm.h
> > > +++ b/include/uapi/drm/msm_drm.h
> > > @@ -345,7 +345,10 @@ struct drm_msm_gem_madvise {
> > >   * backwards compatibility as a "default" submitqueue
> > >   */
> > >
> > > -#define MSM_SUBMITQUEUE_FLAGS (0)
> > > +#define MSM_SUBMITQUEUE_ALLOW_PREEMPT        0x00000001
> > > +#define MSM_SUBMITQUEUE_FLAGS                    ( \
> > > +             MSM_SUBMITQUEUE_ALLOW_PREEMPT | \
> > > +             0)
> > >
> > >  /*
> > >   * The submitqueue priority should be between 0 and MSM_PARAM_PRIORITIES-1,
> > >
> > > --
> > > 2.46.0
> > >
> > >

