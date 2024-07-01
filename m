Return-Path: <linux-arm-msm+bounces-24767-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id F13BC91D7B1
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Jul 2024 07:51:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 25B331C2229C
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Jul 2024 05:51:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60A7338397;
	Mon,  1 Jul 2024 05:51:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="T1eWx6OJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E72AFF9F8;
	Mon,  1 Jul 2024 05:51:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719813085; cv=none; b=r7a18IztMUzpfSp/bQxiWYdhUGUK+s5+oEVU0kaYWoy4sIOlqpkrMng8JRrykGtM4vFKQOFyZViOrZW02jhU3AExIRI2gpj3S7IF9KMHMd73OqD4bq9FOScYpm6wxPDfPSdpWOSZ8qOgabWtCxmIVqujLz0jxhevy4uL/SImchw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719813085; c=relaxed/simple;
	bh=86cdlPrxWyCNweDyitOQiuhUq9SGWkQjidN4YDN7Op0=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DndvdII0RNt7P5DMucrDvIyo0MVIaJol1e3aBUjdR/XJLWj6OSWvYSdeLbnTdEpvZiz5WYiONBkUVXuodwZKvxtRv01OXtevDR9NBKY6s8lysIvw+JTWH5M3ol6ZxqfiErUj9vPXwqvZHoXIQbvTb9LT81sLjz/mWeU1CugldfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=T1eWx6OJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45UNhNPl009177;
	Mon, 1 Jul 2024 05:51:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=U8w4D1r7t7niSc/XiQ8MWOlU
	ZfgvTBRs8X6EjKJ4vwY=; b=T1eWx6OJLaaLAXZWIoAdhOPKH/C2jnVRXZHiJ7b9
	ma0QL6ElXYT62aSSjODmfFFonSdpZ02m77m0sODF8Mk2BbeqPQfyv9hz3SeVa0Al
	0CNMJwiAIVOFoDtXVPmZxSEojHqqB1FzjsRVDHwkUdGeMhqtH9ul1XFJPPSRSiDI
	y5CUCGI/wPts8gHepD4Vsfhrq/AYqsZlBqbkYy8epVo0ZQZqcTE/+VWhrzVd5HSt
	gAlJUdLVSvL+oDs3Tf8UdOv7YGbCdrLrutw+SRjwWMRsUHNME0ivPiSs/Iqhzw2v
	Yhj3p9K0FKaEXVaCPxDR4/gcNhRJkwPt5vEOS93bwZM6KA==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 402bejjw3w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 01 Jul 2024 05:51:13 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 4615pCTs027669
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 1 Jul 2024 05:51:12 GMT
Received: from hu-akhilpo-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Sun, 30 Jun 2024 22:51:07 -0700
Date: Mon, 1 Jul 2024 11:21:03 +0530
From: Akhil P Oommen <quic_akhilpo@quicinc.com>
To: Konrad Dybcio <konrad.dybcio@linaro.org>
CC: freedreno <freedreno@lists.freedesktop.org>,
        <dri-devel@lists.freedesktop.org>, <linux-arm-msm@vger.kernel.org>,
        "OPEN
 FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Clark <robdclark@gmail.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Krzysztof Kozlowski
	<krzk@kernel.org>, Will Deacon <will@kernel.org>,
        Abhinav Kumar
	<quic_abhinavk@quicinc.com>,
        Daniel Vetter <daniel@ffwll.ch>, David Airlie
	<airlied@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        "Sean
 Paul" <sean@poorly.run>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 3/5] drm/msm/adreno: Introduce gmu_chipid for a740 &
 a750
Message-ID: <20240701055103.srt6olauy7ux5um5@hu-akhilpo-hyd.qualcomm.com>
References: <20240629015111.264564-1-quic_akhilpo@quicinc.com>
 <20240629015111.264564-4-quic_akhilpo@quicinc.com>
 <243c0432-a681-4932-957b-e80f2f4ef295@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <243c0432-a681-4932-957b-e80f2f4ef295@linaro.org>
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: YTnb4gfmvQsDbz3CbM_Kw55DIfWsDEV1
X-Proofpoint-ORIG-GUID: YTnb4gfmvQsDbz3CbM_Kw55DIfWsDEV1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-01_04,2024-06-28_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxlogscore=999
 impostorscore=0 spamscore=0 clxscore=1015 mlxscore=0 suspectscore=0
 bulkscore=0 adultscore=0 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2407010043

On Sat, Jun 29, 2024 at 03:06:22PM +0200, Konrad Dybcio wrote:
> On 29.06.2024 3:49 AM, Akhil P Oommen wrote:
> > To simplify, introduce the new gmu_chipid for a740 & a750 GPUs.
> > 
> > Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
> > ---
> 
> This gets rid of getting patchid from dts, but I suppose that's fine,
> as we can just add a new entry to the id table
> 
> [...]
> 
> > --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> > +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> > @@ -771,7 +771,7 @@ static int a6xx_gmu_fw_start(struct a6xx_gmu *gmu, unsigned int state)
> >  	struct adreno_gpu *adreno_gpu = &a6xx_gpu->base;
> >  	const struct a6xx_info *a6xx_info = adreno_gpu->info->a6xx;
> >  	u32 fence_range_lower, fence_range_upper;
> > -	u32 chipid, chipid_min = 0;
> > +	u32 chipid = 0;
> 
> The initialization doesn't seem necessary

Rob, would it be possible to fix this up when you pick this patch?

-Akhil.

> 
> otherwise:
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> 
> Konrad

