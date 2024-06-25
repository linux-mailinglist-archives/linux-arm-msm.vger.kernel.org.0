Return-Path: <linux-arm-msm+bounces-24167-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 63781917285
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Jun 2024 22:27:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E50CE284835
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Jun 2024 20:27:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1E2717D36A;
	Tue, 25 Jun 2024 20:27:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="GkAf8mD+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A6DB14830C;
	Tue, 25 Jun 2024 20:27:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719347272; cv=none; b=bkAgQkHtOgi5YNaXarQLs868+rynwpwHjyeoVt7kmzTO6LhzI56SiH9fm5bquaYOXXiIWV3LjWSeODs+WbsmLhPl64aD1O8oyUTfEhTal2xKwILec82AB+8mkI578ghadNICOOFUriVXxn15FYAbsqcCV/VZZ6zlMKrUVhChvdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719347272; c=relaxed/simple;
	bh=1jbj0bZ2z5oDpF4eRWeY6bCIb0yLbPAnXv6znVAN7CE=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cYBt0kQhzAfwfC5JGKQrz+9dw2z7RVVnAQ1MKJM7mcnxevqkO3EHDIGUTaEA9EfrPxxDnWnv16jAv5OZK4k53YohNJa911u0GjfRsqhgfQHJDUHjbD5kopsj+8Ybcc63z3hP1A2GzlIVbuH//AtEd7nhZEdhV7KSEIpreeBQ6v4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=GkAf8mD+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45PHdP1W008003;
	Tue, 25 Jun 2024 20:27:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=J2T8ePpeXSq20maliOvh9+K9
	vL7toXvotbxHcVYYXbY=; b=GkAf8mD+oDjySmxPbPjc52cFkUNdgYwJEd7hwUdR
	zwMA2UrdqniEQzg9Ce11Ez+6kCfRGiVl7A8s1jULbyJyNstd9VKJND2J8vRL8upm
	u72iLwnXzn4QOfA++vRFCb4mn54AK51MgNN154DOntauQW/RRcBmttVL9t/h/AUd
	03ftdxSumAAzVD7wrXSAzBl/OCjyjkWKu44LBeCig3dpf31y1WvxJ+9Fwq8psJIx
	0kc3ANVe6ccswS+dInuC+6tFYk6dgqm2zeNpBACSKGG9w5mtJRHOHD2RX9u+5lbT
	Uk3RsJ8KRrsO5ggpODGkxy9yBJvdCeBKgjOy4Q6yY/RndQ==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ywnjrynw4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Jun 2024 20:27:42 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45PKRftu031455
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Jun 2024 20:27:41 GMT
Received: from hu-akhilpo-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 25 Jun 2024 13:27:37 -0700
Date: Wed, 26 Jun 2024 01:57:33 +0530
From: Akhil P Oommen <quic_akhilpo@quicinc.com>
To: Konrad Dybcio <konrad.dybcio@linaro.org>
CC: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        "Abhinav
 Kumar" <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov
	<dmitry.baryshkov@linaro.org>,
        David Airlie <airlied@gmail.com>, "Daniel
 Vetter" <daniel@ffwll.ch>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 0/2] Clean up barriers
Message-ID: <20240625202733.wpybnxisniykvaid@hu-akhilpo-hyd.qualcomm.com>
References: <20240625-adreno_barriers-v2-0-c01f2ef4b62a@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240625-adreno_barriers-v2-0-c01f2ef4b62a@linaro.org>
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: Kl2Gs9YgQEhIjAuFaYokEfvdcaUYczIJ
X-Proofpoint-ORIG-GUID: Kl2Gs9YgQEhIjAuFaYokEfvdcaUYczIJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-25_15,2024-06-25_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 clxscore=1015 mlxscore=0 suspectscore=0 adultscore=0 mlxlogscore=640
 impostorscore=0 bulkscore=0 malwarescore=0 spamscore=0 phishscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2406250151

On Tue, Jun 25, 2024 at 08:54:40PM +0200, Konrad Dybcio wrote:
> Changes in v3:
> - Drop the wrapper functions
> - Drop the readback in GMU code
> - Split the commit in two
> 
> Link to v2: https://lore.kernel.org/linux-arm-msm/20240509-topic-adreno-v2-1-b82a9f99b345@linaro.org/
> 
> Changes in v2:
> - Introduce gpu_write_flush() and use it
> - Don't accidentally break a630 by trying to write to non-existent GBIF
> 
> Link to v1: https://lore.kernel.org/linux-arm-msm/20240508-topic-adreno-v1-1-1babd05c119d@linaro.org/
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
> Konrad Dybcio (2):
>       drm/msm/adreno: De-spaghettify the use of memory barriers
>       Revert "drm/msm/a6xx: Poll for GBIF unhalt status in hw_init"
> 
>  drivers/gpu/drm/msm/adreno/a6xx_gmu.c |  4 +---
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 14 ++++++--------
>  2 files changed, 7 insertions(+), 11 deletions(-)
> ---
> base-commit: 0fc4bfab2cd45f9acb86c4f04b5191e114e901ed
> change-id: 20240625-adreno_barriers-29f356742418

for the whole series:
Reviewed-by: Akhil P Oommen <quic_akhilpo@quicinc.com>

-Akhil

> 
> Best regards,
> -- 
> Konrad Dybcio <konrad.dybcio@linaro.org>
> 

