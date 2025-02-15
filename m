Return-Path: <linux-arm-msm+bounces-48111-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E889BA36DDD
	for <lists+linux-arm-msm@lfdr.de>; Sat, 15 Feb 2025 12:50:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F3AB9171483
	for <lists+linux-arm-msm@lfdr.de>; Sat, 15 Feb 2025 11:50:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8B971AAA0D;
	Sat, 15 Feb 2025 11:50:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="SY1DdM/L"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFBF7191F75;
	Sat, 15 Feb 2025 11:50:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739620203; cv=none; b=dSRV7DNxR5tqIne4Q+U/XcHa5ekYZ1lfhaPV0ileroKV2M5FU0sj2vKPUtWkuWjjWDn5AtvBwPoiO+7b6GrVT9vJk2Jz2QbZOO4u8SwhtS4eAoSZr1V3TTcvRyD+631u9/BZ0DueMJkjy8U53vDQu1X7vHSBjh9OC/+mK9beIuM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739620203; c=relaxed/simple;
	bh=Fs5UveEaIDoISFa7M98IagHDHCEkTg/NDXCCXkbaMC8=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=KiiGlzjCHxgXpoSpX7NZ7bgQbYhHRD2eQsQC7vlUy0LEzFXSW2nMZVrIxNWU61H9FHssS9Vaa+mc73A9MVgK+6U329HAJfERrzigAXFoOirSQx4Tno2S9q1Sw79VX8l+vEQj95uC5Ir1SAdOlBsR6CoRkD0h/dO7tpacJLyzi9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=SY1DdM/L; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51FAidhu008563;
	Sat, 15 Feb 2025 11:49:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	haO7wmDHIMtM6c5v1RgC2Q4mqukTFfgaoIqbl8FyAWE=; b=SY1DdM/LVFdmsMDH
	5uZkNfJNHsknObXhDTx3+JYd9sZUiBivUGEZdK8vaFNYb1YMkY3FcgxIwJjm9jHk
	o1/ZgDzoRx2ewysCdnghioiDMKZHPUxZs2dYLqtelpkWCuTAbrcDo7B+rEl5sbOr
	qXcD+pPHx7XhVz5qGjb4uXVXAEPAZcf+5kBewLUy3DLCJSWXI6FUidAJE4AW9vwF
	ge6B71P88P1qAwcVR5HPTmqjMHB20S5KBrh0b6nYDOiWMJAdq3IAI6IHZYBg8xPB
	rvEY2RmlgcaAWsvUvMrvBcg9Kxl5QyjVFtRb7q7uL4jvZZbn20LxZRBX0G7oHaWm
	10uz+g==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44tm3gres7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 15 Feb 2025 11:49:46 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51FBnjgM014817
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 15 Feb 2025 11:49:45 GMT
Received: from [10.216.9.140] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sat, 15 Feb
 2025 03:49:38 -0800
Message-ID: <182b7896-9cfc-4f94-b9d4-759fd85fd997@quicinc.com>
Date: Sat, 15 Feb 2025 17:19:35 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] drm/msm/a6xx: Add support for Adreno 623
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
References: <20250213-a623-gpu-support-v1-0-993c65c39fd2@quicinc.com>
 <20250213-a623-gpu-support-v1-2-993c65c39fd2@quicinc.com>
 <ttipuo56z76svx3womcrrqurglvovkqehsx2orgnegjj2z7uxn@d3cov6qmmalm>
From: Akhil P Oommen <quic_akhilpo@quicinc.com>
Content-Language: en-US
In-Reply-To: <ttipuo56z76svx3womcrrqurglvovkqehsx2orgnegjj2z7uxn@d3cov6qmmalm>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: F0rhQWccDnNCDqMUeNMOUdFqwH-YEh4e
X-Proofpoint-GUID: F0rhQWccDnNCDqMUeNMOUdFqwH-YEh4e
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-15_05,2025-02-13_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 bulkscore=0
 suspectscore=0 spamscore=0 priorityscore=1501 clxscore=1015
 lowpriorityscore=0 mlxlogscore=999 mlxscore=0 malwarescore=0 adultscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502150105

On 2/13/2025 10:24 PM, Dmitry Baryshkov wrote:
> On Thu, Feb 13, 2025 at 09:40:07PM +0530, Akhil P Oommen wrote:
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
>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
>> index edffb7737a97..ac156c8b5af9 100644
>> --- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
>> @@ -879,6 +879,35 @@ static const struct adreno_info a6xx_gpus[] = {
>>  			{ 0, 0 },
>>  			{ 137, 1 },
>>  		),
>> +	}, {
>> +		.chip_ids = ADRENO_CHIP_IDS(0x06020300),
>> +		.family = ADRENO_6XX_GEN3,
>> +		.fw = {
>> +			[ADRENO_FW_SQE] = "a650_sqe.fw",
>> +			[ADRENO_FW_GMU] = "a623_gmu.bin",
>> +		},
>> +		.gmem = SZ_512K,
>> +		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
>> +		.quirks = ADRENO_QUIRK_HAS_CACHED_COHERENT |
>> +			ADRENO_QUIRK_HAS_HW_APRIV,
>> +		.init = a6xx_gpu_init,
>> +		.a6xx = &(const struct a6xx_info) {
>> +			.hwcg = a620_hwcg,
>> +			.protect = &a650_protect,
>> +			.gmu_cgc_mode = 0x00020200,
>> +			.prim_fifo_threshold = 0x00010000,
>> +			.bcms = (const struct a6xx_bcm[]) {
>> +				{ .name = "SH0", .buswidth = 16 },
>> +				{ .name = "MC0", .buswidth = 4 },
>> +				{
>> +					.name = "ACV",
>> +					.fixed = true,
>> +					.perfmode = BIT(3),
>> +				},
>> +				{ /* sentinel */ },
>> +			},
>> +		},
>> +		.address_space_size = SZ_16G,
>>  	}, {
>>  		.chip_ids = ADRENO_CHIP_IDS(
>>  			0x06030001,
>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>> index 0ae29a7c8a4d..1820c167fcee 100644
>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>> @@ -616,6 +616,14 @@ static void a6xx_calc_ubwc_config(struct adreno_gpu *gpu)
>>  		gpu->ubwc_config.uavflagprd_inv = 2;
>>  	}
>>  
>> +	if (adreno_is_a623(gpu)) {
>> +		gpu->ubwc_config.highest_bank_bit = 16;
>> +		gpu->ubwc_config.amsbc = 1;
> 
> This bit causes my question: the patch for msm_mdss states that on the
> display side both UBWC encoder and decoder are 4.0, which means that the
> UBWC_AMSBC bit won't be set in the UBWC_STATIC register.

Not sure, but my guess is that AMSBC encoding is probably implicitly
enabled by MDSS HW when UBWC v4 is configured.

-Akhil

> 
>> +		gpu->ubwc_config.rgb565_predicator = 1;
>> +		gpu->ubwc_config.uavflagprd_inv = 2;
>> +		gpu->ubwc_config.macrotile_mode = 1;
>> +	}
>> +
>>  	if (adreno_is_a640_family(gpu))
>>  		gpu->ubwc_config.amsbc = 1;
>>  
>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
>> index 2c10474ccc95..3222a406d089 100644
>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
>> @@ -1227,7 +1227,7 @@ static void a6xx_get_gmu_registers(struct msm_gpu *gpu,
>>  	_a6xx_get_gmu_registers(gpu, a6xx_state, &a6xx_gmu_reglist[1],
>>  		&a6xx_state->gmu_registers[1], true);
>>  
>> -	if (adreno_is_a621(adreno_gpu))
>> +	if (adreno_is_a621(adreno_gpu) || adreno_is_a623(adreno_gpu))
>>  		_a6xx_get_gmu_registers(gpu, a6xx_state, &a621_gpucc_reg,
>>  			&a6xx_state->gmu_registers[2], false);
>>  	else
>> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
>> index dcf454629ce0..92caba3584da 100644
>> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
>> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
>> @@ -442,6 +442,11 @@ static inline int adreno_is_a621(const struct adreno_gpu *gpu)
>>  	return gpu->info->chip_ids[0] == 0x06020100;
>>  }
>>  
>> +static inline int adreno_is_a623(const struct adreno_gpu *gpu)
>> +{
>> +	return gpu->info->chip_ids[0] == 0x06020300;
>> +}
>> +
>>  static inline int adreno_is_a630(const struct adreno_gpu *gpu)
>>  {
>>  	return adreno_is_revn(gpu, 630);
>>
>> -- 
>> 2.45.2
>>
> 


