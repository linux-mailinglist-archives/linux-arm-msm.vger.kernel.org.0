Return-Path: <linux-arm-msm+bounces-30580-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id EDCD596AC14
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Sep 2024 00:21:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 75D65B25057
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Sep 2024 22:21:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6C0C1D58A2;
	Tue,  3 Sep 2024 22:21:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Etljk7Bp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26ADF3A267;
	Tue,  3 Sep 2024 22:21:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725402063; cv=none; b=Vk1c083uipE57aPy5O75yOc6oD8J28017JgOHuqDOOhkI50hdC4fu5daz121fHYo8xtgQINjOVoOD+WOPOcIDA/+PNG/Ux9NTZ6xtAl7ftupWppb6HadL5aUtSFtXkvt6I6LEqiRKd+DaLaknPN6dQ6QBO1aeDcCZeDTOFYZTMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725402063; c=relaxed/simple;
	bh=yiM8tWV/Ct8UYubGe12YSCMEq8k9CGLTQFJ4hMKDaig=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=s9ILY0y04FRPYUQqfoDN/C8nh7eTWv+lZW6V+nYES61cDmc1JOuNLfePOaaAtW0tK+Yrlp6Ew/Z4etyC25wnEdlwk/B2gwGQrS4Ngfu2TwmLcJnL5/xKbEySK1LB22iyzpzh9FvsG3GcIGZhkG9VH+8vVz1pgCU2nIzk59pWpXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Etljk7Bp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 483LwKB9028269;
	Tue, 3 Sep 2024 22:20:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5j0OpXvCFxUbCCZ05zKzT5gBio/MEcN9YIb08hJBy+A=; b=Etljk7Bpc6RxFs6M
	4YGn3wzPaycjH5SSJYR7z8P611e++hL2XoDdVcJ32C4jklm7nCturesVdcN1/YnT
	0aPNly0uxVobNqlMD+EQ1DPDFqTG4XLcuFXfOw879ut1Ykwv9z8l2fRlbFDWuunL
	OO3xRDxF9pR3oR+K3M9ubqUt1iiHIwoJ+cP0zXu2RG0X0iOitAu5vZ7qV/l78BoH
	qDBlP4akGsBMOUXah8WHnwqFQaD7T1g3cVQUxL6fH5tJIRl6SDb4HQ3gK7ZUi6VR
	WjZseYrAa9PeZQpIjzHELvnNSxx26Vesh9/Kd2iO8Ym+u5SYMhR0oCNQj9+xSgMJ
	QzaRbQ==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41btrxrvjc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 03 Sep 2024 22:20:49 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 483MKmIm029647
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 3 Sep 2024 22:20:48 GMT
Received: from [10.134.70.212] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 3 Sep 2024
 15:20:47 -0700
Message-ID: <85022ded-962a-47ac-a083-88db7cd81f0f@quicinc.com>
Date: Tue, 3 Sep 2024 15:20:47 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/21] drm/msm/dpu: add CWB entry to catalog for SM8650
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Rob Clark <robdclark@gmail.com>, <quic_abhinavk@quicinc.com>,
        Sean Paul
	<sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        "David
 Airlie" <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
        "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard
	<mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, <quic_ebharadw@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
        Rob Clark <robdclark@chromium.org>
References: <20240829-concurrent-wb-v1-0-502b16ae2ebb@quicinc.com>
 <20240829-concurrent-wb-v1-8-502b16ae2ebb@quicinc.com>
 <audsl366wkyqlizb254haxchirlgycr4wpgmp7sbkmynafivoq@pyanmqyfwj7b>
Content-Language: en-US
From: Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <audsl366wkyqlizb254haxchirlgycr4wpgmp7sbkmynafivoq@pyanmqyfwj7b>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: GLe-fU_ol172R9bwXyOeiuZRzFuLLWlG
X-Proofpoint-ORIG-GUID: GLe-fU_ol172R9bwXyOeiuZRzFuLLWlG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-03_10,2024-09-03_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 bulkscore=0
 clxscore=1015 suspectscore=0 phishscore=0 impostorscore=0
 priorityscore=1501 mlxscore=0 mlxlogscore=999 spamscore=0
 lowpriorityscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2407110000 definitions=main-2409030179



On 8/30/2024 10:13 AM, Dmitry Baryshkov wrote:
> On Thu, Aug 29, 2024 at 01:48:29PM GMT, Jessica Zhang wrote:
>> From: Esha Bharadwaj <quic_ebharadw@quicinc.com>
>>
>> Add new block for concurrent writeback mux to HW catalog and change
>> pingpong index names to distinguish between general use pingpong blocks
>> and pingpong blocks dedicated for concurrent writeback
> 
> Please split into two commits.

Hi Dmitry,

Sounds good

> 
>>
>> Signed-off-by: Esha Bharadwaj <quic_ebharadw@quicinc.com>
>> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
>> ---
>>   .../drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h    | 29 +++++++++++++++++++---
>>   .../gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h |  4 +--
>>   .../gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h |  4 +--
>>   .../drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h   |  4 +--
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     | 13 ++++++++++
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h        |  8 +++---
>>   6 files changed, 48 insertions(+), 14 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h
>> index eb5dfff2ec4f..ce2773029763 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h
>> @@ -252,25 +252,25 @@ static const struct dpu_pingpong_cfg sm8650_pp[] = {
>>   		.merge_3d = MERGE_3D_2,
>>   		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 31),
>>   	}, {
>> -		.name = "pingpong_6", .id = PINGPONG_6,
>> +		.name = "pingpong_6", .id = PINGPONG_CWB_0,
> 
> Should we also rename such blocks?

Sure, I can change the name to match the id

Thanks,

Jessica Zhang

> 
>>   		.base = 0x66000, .len = 0,
>>   		.features = BIT(DPU_PINGPONG_DITHER),
>>   		.sblk = &sc7280_pp_sblk,
>>   		.merge_3d = MERGE_3D_3,
> 
> 
> -- 
> With best wishes
> Dmitry

