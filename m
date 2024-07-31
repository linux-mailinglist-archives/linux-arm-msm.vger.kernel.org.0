Return-Path: <linux-arm-msm+bounces-27579-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5695E943671
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Jul 2024 21:31:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 881591C21AED
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Jul 2024 19:31:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B443F18B09;
	Wed, 31 Jul 2024 19:31:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="aD91ibri"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 473851401B;
	Wed, 31 Jul 2024 19:31:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722454288; cv=none; b=uZmm+EUgmv7MGKTjdqLikZw8DC+rWSmMpG/fHdRQ+4zoH6YhngToYP6L7CnDH5J73W4AhUwu3l8AgXyqL8sFEDlgSmVzCS6W9skUcVxHo4inoHRc4hkrTIZlsJMb5UGW0JvY/2IOvpYm4n+tvuf2bplklez4hBmN2P2f+xa/aBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722454288; c=relaxed/simple;
	bh=vXRm5J11J0e4bYBzzk+9Kgfv/g0TNnIoy10i4hnwa4k=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=gR+FjLQmalaouPL7OBhyzJMLdixsPAJiICGLJlsVK4BDWwqazLt3x5QMd394itvg3dAHRS6oKef699Y2dW7VoWWfFYv9BDzApOtTnyw0L0i7l8KUBODCKo97aRCsqeVSyV0910pKh53UNduJWBydeSJcp0kLFLZLH3H+vkTKJIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=aD91ibri; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46VGDcPQ024192;
	Wed, 31 Jul 2024 19:31:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MzNvmDvwUbkO7SGJCvUOQ7NQNSnc77o+783TBMI9/oU=; b=aD91ibriPNnMt229
	nSFF+DthuzjOqBo0o6nR2fNsXb9QWuEDljTYB38evslTfJieh7BdGAquTC5mGDTz
	PDs91M2pKR9nhbWsWoy1v7Db27j8ckzAtiJOb2NVtmM5K0IjrB18oUoG+WrsQmzQ
	e6MTKoXFCXHP/JTLL1/H6Dr+DUwrmv6KIzbT7MvJINxf2Em6IKeOMlMjToArjRoG
	rQeuT4Zhe5V4ozoQnTnGaQ1Z7+o1tyzNxkbnMI2pz4PquV5wZD52nD3+W3qN1l7H
	R/r5ksBC4SCoVmqHQDeYQ6uDs0HDv7R0GOXnRl4cziGaLTOf5v7hkfWIBlPKUuvg
	2ScgCw==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40ms43cams-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 31 Jul 2024 19:31:19 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 46VJVIAa024732
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 31 Jul 2024 19:31:18 GMT
Received: from [10.134.71.247] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 31 Jul
 2024 12:31:18 -0700
Message-ID: <ee78f758-8b49-4292-b1aa-d16db860501e@quicinc.com>
Date: Wed, 31 Jul 2024 12:31:17 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 01/12] drm/msm/dpu: limit QCM2290 to RGB formats only
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark
	<robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten
	<marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Daniel
 Vetter <daniel@ffwll.ch>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
References: <20240627-dpu-virtual-wide-v5-0-5efb90cbb8be@linaro.org>
 <20240627-dpu-virtual-wide-v5-1-5efb90cbb8be@linaro.org>
Content-Language: en-US
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20240627-dpu-virtual-wide-v5-1-5efb90cbb8be@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: VGOS0GDsp3Kc-E3kQ9fMDDRnDn2Eidoj
X-Proofpoint-ORIG-GUID: VGOS0GDsp3Kc-E3kQ9fMDDRnDn2Eidoj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-31_10,2024-07-31_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 impostorscore=0 spamscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0
 mlxlogscore=804 suspectscore=0 phishscore=0 priorityscore=1501
 clxscore=1015 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2407310137



On 6/26/2024 2:45 PM, Dmitry Baryshkov wrote:
> The QCM2290 doesn't have CSC blocks, so it can not support YUV formats
> even on ViG blocks. Fix the formats declared by _VIG_SBLK_NOSCALE().
> 
> Fixes: 5334087ee743 ("drm/msm: add support for QCM2290 MDSS")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

