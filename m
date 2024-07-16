Return-Path: <linux-arm-msm+bounces-26375-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6262F933342
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jul 2024 23:10:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 949071C221E8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jul 2024 21:10:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 584AD5C8FC;
	Tue, 16 Jul 2024 21:10:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="eL33vpUy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E9E455894;
	Tue, 16 Jul 2024 21:10:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721164210; cv=none; b=WgnqkQXRWj+ZIl5E1b55q1WLM22nvc1MfEauLVmPJXpZz+BGJLzmUBZJYFeGf+rvprFLhzRd6mxfo2apAzykKnYewMIY+KXYc9H7ZjYXKgmuiQBb9+cyhDAzLPIXm6KXU+b+XKb1dxqioO974QxlhCVuIbnzQFMnaRhxPdtr7+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721164210; c=relaxed/simple;
	bh=E5Rhmq4w2aJRUdzOViHh0PMnhhGECVJsX0hiriu14jM=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=iNDgzZQcfSecR5XLo/SqN2uzup+nDceFsX6qFQ+J2TVis/1UDr+qhpWqwcMNufgSUtgqpxIg5ApChq/2d48s8pX0toKQr4pXHXdyjOyPg7GcgBx3h1gETzeELtxMJasb7I+H3xLPIM9ijyIW/Q20GlCJrmW1oH1hdPzDxwMFpyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=eL33vpUy; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46GHfd6I007015;
	Tue, 16 Jul 2024 21:09:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8EFgWzQ4bEsVEGlDIPChjTC7s40nDC03SbozmjUVxv8=; b=eL33vpUy8bWKasqY
	zcVwbxWwmgo2HNFQJMPr00nuQZGh07iqDaBVoXSseF3/SG/1cPoHcY4tV/vqazQG
	SEtB3S18c8IayLVhWzzIwISu7X2FCf8/nRdlVILNM9g3PzqepAX4Y2sONT++HxLn
	CGRGnzJvf2nGpMeIMcRX3jtwS2eUFrwicFJ71WXfSR0vkVFIUnagpLwq+e5Pj2Zw
	scYmJskdQ9niJIOkR98pXq8qtutrHbAQ3RZBDs3ttJ7PE0C0OWLBXobodQeU3nHu
	cLsdN1l928E7612542wVpE2/6pWlxKk1EROYF74jzZ0+u/G/nHOooGkyQmToGXN0
	n3L7VQ==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40dwfx8cps-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 16 Jul 2024 21:09:56 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 46GL9tpm005192
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 16 Jul 2024 21:09:55 GMT
Received: from [10.71.110.34] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 16 Jul
 2024 14:09:54 -0700
Message-ID: <5f80ca29-994c-4a74-a929-0480b0f2c157@quicinc.com>
Date: Tue, 16 Jul 2024 14:09:53 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] drm/msm/iommu: introduce msm_iommu_disp_new() for
 msm_kms
To: Rob Clark <robdclark@gmail.com>
CC: <freedreno@lists.freedesktop.org>,
        Dmitry Baryshkov
	<dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten
	<marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, "Daniel
 Vetter" <daniel@ffwll.ch>,
        <dri-devel@lists.freedesktop.org>, <quic_jesszhan@quicinc.com>,
        <swboyd@chromium.org>, <dianders@chromium.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20240628214848.4075651-1-quic_abhinavk@quicinc.com>
 <20240628214848.4075651-4-quic_abhinavk@quicinc.com>
 <CAF6AEGt2zX5anreTLnMFEiPToGFJdgYZHHpqJfUtaOkdr+Wbbw@mail.gmail.com>
Content-Language: en-US
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <CAF6AEGt2zX5anreTLnMFEiPToGFJdgYZHHpqJfUtaOkdr+Wbbw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: g7nO_hvTfjwzfwMJbO9efbhcjepe4UA3
X-Proofpoint-GUID: g7nO_hvTfjwzfwMJbO9efbhcjepe4UA3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-15_19,2024-07-16_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 lowpriorityscore=0 suspectscore=0 mlxlogscore=965 bulkscore=0 adultscore=0
 spamscore=0 clxscore=1015 mlxscore=0 phishscore=0 priorityscore=1501
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2407160154



On 7/1/2024 1:41 PM, Rob Clark wrote:
> On Fri, Jun 28, 2024 at 2:49 PM Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>>
>> Introduce a new API msm_iommu_disp_new() for display use-cases.
>>
>> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
>> ---
>>   drivers/gpu/drm/msm/msm_iommu.c | 26 ++++++++++++++++++++++++++
>>   drivers/gpu/drm/msm/msm_mmu.h   |  1 +
>>   2 files changed, 27 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/msm/msm_iommu.c b/drivers/gpu/drm/msm/msm_iommu.c
>> index a79cd18bc4c9..0420bdc4a224 100644
>> --- a/drivers/gpu/drm/msm/msm_iommu.c
>> +++ b/drivers/gpu/drm/msm/msm_iommu.c
>> @@ -343,6 +343,17 @@ static int msm_gpu_fault_handler(struct iommu_domain *domain, struct device *dev
>>          return 0;
>>   }
>>
>> +static int msm_disp_fault_handler(struct iommu_domain *domain, struct device *dev,
>> +                                 unsigned long iova, int flags, void *arg)
>> +{
>> +       struct msm_iommu *iommu = arg;
>> +
>> +       if (iommu->base.handler)
>> +               return iommu->base.handler(iommu->base.arg, iova, flags, NULL);
>> +
>> +       return -ENOSYS;
>> +}
>> +
>>   static void msm_iommu_resume_translation(struct msm_mmu *mmu)
>>   {
>>          struct adreno_smmu_priv *adreno_smmu = dev_get_drvdata(mmu->dev);
>> @@ -434,6 +445,21 @@ struct msm_mmu *msm_iommu_new(struct device *dev, unsigned long quirks)
>>          return &iommu->base;
>>   }
>>
>> +struct msm_mmu *msm_iommu_disp_new(struct device *dev, unsigned long quirks)
>> +{
>> +       struct msm_iommu *iommu;
>> +       struct msm_mmu *mmu;
>> +
>> +       mmu = msm_iommu_new(dev, quirks);
>> +       if (IS_ERR_OR_NULL(mmu))
>> +               return mmu;
>> +
>> +       iommu = to_msm_iommu(mmu);
>> +       iommu_set_fault_handler(iommu->domain, msm_disp_fault_handler, iommu);
>> +
>> +       return mmu;
>> +}
> 
> Hmm, are we using dev drvdata for the display pdev?  If
> dev_get_drvdata() returns NULL for display pdev, we could get away
> without having a different fault handler.
> 
> BR,
> -R

It is being set to struct msm_drm_private* currently. So it shouldnt 
return NULL.

I also thought of re-using the same API as GPU but the drvdata along 
with its own fault handler and having below code in the gpu handler all 
made me conclude that its cleaner to let display have its own handler.

         if (adreno_smmu->set_stall)
                 adreno_smmu->set_stall(adreno_smmu->cookie, true);

> 
>> +
>>   struct msm_mmu *msm_iommu_gpu_new(struct device *dev, struct msm_gpu *gpu, unsigned long quirks)
>>   {
>>          struct adreno_smmu_priv *adreno_smmu = dev_get_drvdata(dev);
>> diff --git a/drivers/gpu/drm/msm/msm_mmu.h b/drivers/gpu/drm/msm/msm_mmu.h
>> index 88af4f490881..730458d08d6b 100644
>> --- a/drivers/gpu/drm/msm/msm_mmu.h
>> +++ b/drivers/gpu/drm/msm/msm_mmu.h
>> @@ -42,6 +42,7 @@ static inline void msm_mmu_init(struct msm_mmu *mmu, struct device *dev,
>>
>>   struct msm_mmu *msm_iommu_new(struct device *dev, unsigned long quirks);
>>   struct msm_mmu *msm_iommu_gpu_new(struct device *dev, struct msm_gpu *gpu, unsigned long quirks);
>> +struct msm_mmu *msm_iommu_disp_new(struct device *dev, unsigned long quirks);
>>
>>   static inline void msm_mmu_set_fault_handler(struct msm_mmu *mmu, void *arg,
>>                  int (*handler)(void *arg, unsigned long iova, int flags, void *data))
>> --
>> 2.44.0
>>

