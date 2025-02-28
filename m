Return-Path: <linux-arm-msm+bounces-49825-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C3487A49312
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Feb 2025 09:13:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CF69F16F07A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Feb 2025 08:13:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C39641FDA7E;
	Fri, 28 Feb 2025 08:13:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Idzy7Jv7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47B201FCFF1;
	Fri, 28 Feb 2025 08:13:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740730424; cv=none; b=lN7z8bSnvpv/co+6EC9pAOnF9GY6MiBjC6UhqINraf7JeESz+LD2zDOI1JXSPjuHDQ/lXHbMv9kDwWcx+scKyv4+E4MM6iJRtQ4aSiQBoV3nKDnPTbGaLuP4KROu2gjRmKxBJESj0+i/cjTjqKY2ltVckC0ZCnC4PSSSL5ZQJjk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740730424; c=relaxed/simple;
	bh=+xI0/YrWmnIyk7d2VJFE2dYzFFjAGnryzVHEBcN1FsA=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=siZpv7/L6pqz2JnbYGGLg/13beT3ss321YFVgPzOD7X6K6yAY1r9HCK8Y3AGLJYiBn6FGRJhRzlEAD4plLWUYWUEzcIvcZhqjQF0BGd0kzjFFI6kkVOr1gyNUPN5k5PyqUFdgt1X4jOVc1qXBoWnLXCht+Nq89oe11ZaQd0dpu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Idzy7Jv7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51RK4skq017228;
	Fri, 28 Feb 2025 08:13:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vk6FL4pS6q3UJRg3aCm+rZsEKLKYZ2ugK1Iil/+G0MA=; b=Idzy7Jv7kbLg0Irc
	3jduhvEquRpgk/YWXsRoyXtbp4IH/wxvvYmGR8orMpOFbT2ScVhguMALktYCprFo
	RsWfvqnz31S3mfL1VBpJ9RrVFoR0aVZZ7LoKTG8vW8tv9jvTRSowDPArdFp6jgwd
	0Z5og+zf8llFLRZLES9xZ6BISSX85+XCjiqYNmqOPhNi/4WfsMjm5AQWBQRrkKUK
	SSRUoMDYtnjuZbalIdzZXLtlYD2uklqsIfkwnIXaHk02S9DLqEXfFIjCt28XX9Uj
	BDE4sDcAsrzbny1AYaNguEI6QIo7vjUAMgDmqI5+mekGe4/LlkaD9NAX/+HRts9M
	iBInbQ==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 452nqkkem1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 28 Feb 2025 08:13:22 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51S8DLpA027314
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 28 Feb 2025 08:13:21 GMT
Received: from [10.216.6.99] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 28 Feb
 2025 00:13:14 -0800
Message-ID: <4c81f193-a1d0-4abc-8be5-07c862de8937@quicinc.com>
Date: Fri, 28 Feb 2025 13:43:12 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/6] drm/msm/a6xx: Add support for Adreno 623
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        "Konrad
 Dybcio" <konradybcio@kernel.org>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie
	<airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>, Jie Zhang
	<quic_jiezh@quicinc.com>
References: <20250228-a623-gpu-support-v2-0-aea654ecc1d3@quicinc.com>
 <20250228-a623-gpu-support-v2-3-aea654ecc1d3@quicinc.com>
 <67jiudy4bopd3mzoylj47stuxwc5jdt63akxwn5qqo4dov47za@xcece4v2k3m5>
From: Akhil P Oommen <quic_akhilpo@quicinc.com>
Content-Language: en-US
In-Reply-To: <67jiudy4bopd3mzoylj47stuxwc5jdt63akxwn5qqo4dov47za@xcece4v2k3m5>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 76zNlMOeirPR6Igo6MqysBl44PxpTEW2
X-Proofpoint-GUID: 76zNlMOeirPR6Igo6MqysBl44PxpTEW2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-28_02,2025-02-27_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 mlxscore=0
 lowpriorityscore=0 adultscore=0 phishscore=0 bulkscore=0 clxscore=1015
 mlxlogscore=999 suspectscore=0 spamscore=0 malwarescore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2502280058

On 2/28/2025 4:56 AM, Dmitry Baryshkov wrote:
> On Fri, Feb 28, 2025 at 01:37:51AM +0530, Akhil P Oommen wrote:
>> From: Jie Zhang <quic_jiezh@quicinc.com>
>>
>> Add support for Adreno 623 GPU found in QCS8300 chipsets.
>>
>> Signed-off-by: Jie Zhang <quic_jiezh@quicinc.com>
>> Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
>> ---
>>  drivers/gpu/drm/msm/adreno/a6xx_catalog.c   | 29 +++++++++++++++++++++++++++++
>>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c       |  8 ++++++++
>>  drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c |  2 +-
>>  drivers/gpu/drm/msm/adreno/adreno_gpu.h     |  5 +++++
>>  4 files changed, 43 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>> index 0ae29a7c8a4d3f74236a35cc919f69d5c0a384a0..1820c167fcee609deee3d49e7b5dd3736da23d99 100644
>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>> @@ -616,6 +616,14 @@ static void a6xx_calc_ubwc_config(struct adreno_gpu *gpu)
>>  		gpu->ubwc_config.uavflagprd_inv = 2;
>>  	}
>>  
>> +	if (adreno_is_a623(gpu)) {
>> +		gpu->ubwc_config.highest_bank_bit = 16;
> 
> Just to doublecheck, the MDSS patch for QCS8300 used HBB=2, which
> means 15. Is 16 correct here? Or might the be a mistake in the MDSS
> patch?

https://patchwork.freedesktop.org/patch/632957/
I see HBB=3 here.

-Akhil

> 
>> +		gpu->ubwc_config.amsbc = 1;
>> +		gpu->ubwc_config.rgb565_predicator = 1;
>> +		gpu->ubwc_config.uavflagprd_inv = 2;
>> +		gpu->ubwc_config.macrotile_mode = 1;
>> +	}
>> +
>>  	if (adreno_is_a640_family(gpu))
>>  		gpu->ubwc_config.amsbc = 1;
>>  


