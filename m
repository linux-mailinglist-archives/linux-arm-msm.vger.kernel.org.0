Return-Path: <linux-arm-msm+bounces-26398-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 01AD193346B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jul 2024 01:04:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B4D7C283326
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jul 2024 23:04:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23A5213C693;
	Tue, 16 Jul 2024 23:04:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ApEC3jWU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8412321350
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jul 2024 23:04:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721171050; cv=none; b=etizjhz0TZngJQls3y71k5QpJjnHMliJlT2lKIH7jAZYRKYsSayEHyKAE6ExcfFEJezuvOQI7w0fhOFSdwl/xOjsMX1v6n0bRMTts2j1GHlWke1sA+2WNlTFRQP5/wmwS1BxshfQM0j50UyXef2PQe+kE+9GSU/ujQKZWXkLw/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721171050; c=relaxed/simple;
	bh=DVI+IUu4HiacFxdr7pwFuUX2lCW0EdBpGZbabBWr8yI=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=mtRVE6rhu3Tow1fwgbak/WGHbr8WnhVlgjBQNbvmFP9TmPqMdb4vfkfZ1YYrfK121aaJFtlZ6bem0OpPEo0vw0Nj3lsRr3k5n7LcKSl9y7BeMdBdCr+kxXDm6JQpfOHwo/IVhzmCZo/iplpAiGtkYLWc3VKs2XN7wKBFloQ8DK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ApEC3jWU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46GHem1u023068;
	Tue, 16 Jul 2024 23:03:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xc+1nWKL5m3GIa7ZDLyIdaod7OXqYMhpie3fO87KuCw=; b=ApEC3jWU7FAnQ4hy
	mGMtHDDPQFeFXaGeA1WLJKuELr9Rvx3BCcUMlV8vxJ5fRYAzv2C6zoEjKQrOUJ+s
	ltrxDhEcJbgGgeAZNxsXmtilPP3R5wjVCzqBKcMmsuC/tf5+x6xQhijRus/B+YNq
	4pK0Apepq1bk9BTOEWgtARXMazko32y8lqqOjwRg+vJ9CUehKMrJNgshWaFXRPGr
	USaHOO0bz7GjCvXIjjRXOt5tki15KPxyZcvTPG+NVU8CLHB79kEQnOfozY/YqK4Y
	2/r1VQF0n9U4QFOVqI+bxZ2LrfLRma6b+zRgBQDA7slsUUqVoxU2ntzNjdn4gDuz
	MPh8+g==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40dwfngjde-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 16 Jul 2024 23:03:59 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 46GN3wvA028472
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 16 Jul 2024 23:03:58 GMT
Received: from [10.71.110.34] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 16 Jul
 2024 16:03:57 -0700
Message-ID: <bf1889df-b156-45e5-a749-87e7b59b9113@quicinc.com>
Date: Tue, 16 Jul 2024 16:03:56 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 07/16] drm/msm/dpu: drop extra aspace checks in
 dpu_formats
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark
	<robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten
	<marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Daniel
 Vetter <daniel@ffwll.ch>
CC: Abel Vesa <abel.vesa@linaro.org>, Johan Hovold <johan+linaro@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>
References: <20240625-dpu-mode-config-width-v5-0-501d984d634f@linaro.org>
 <20240625-dpu-mode-config-width-v5-7-501d984d634f@linaro.org>
Content-Language: en-US
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20240625-dpu-mode-config-width-v5-7-501d984d634f@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: ZVXaAZ8hjt2sn2sTM3y_1Ta3b3AdTBPQ
X-Proofpoint-ORIG-GUID: ZVXaAZ8hjt2sn2sTM3y_1Ta3b3AdTBPQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-16_02,2024-07-16_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 clxscore=1015 spamscore=0 mlxscore=0 phishscore=0
 mlxlogscore=485 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2407110000 definitions=main-2407160169



On 6/24/2024 2:13 PM, Dmitry Baryshkov wrote:
> The DPU driver isn't expected to be used without an IOMMU. Thus the
> aspace will be always present. Not to mention that mdp4/mdp5 drivers
> call msm_framebuffer_iova() without such checks, as the whole
> msm_framebuffer layer is expected to support both IOMMU and IOMMU-less
> configurations.
> 
> Drop these useless if (aspace) checks.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c | 7 ++-----
>   1 file changed, 2 insertions(+), 5 deletions(-)
> 

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

