Return-Path: <linux-arm-msm+bounces-39741-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E823D9DF301
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 Nov 2024 21:31:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 57AB928114B
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 Nov 2024 20:31:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B31FF13D638;
	Sat, 30 Nov 2024 20:30:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="JlOygxyu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFAFF17BD3;
	Sat, 30 Nov 2024 20:30:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732998658; cv=none; b=R8DTMuGd5SpBTwxdfkvMSjZ3ynScIhHmdfpxxPXnEyoeQ8EyAB+0/vAr+1hzzQUHwD9kc636qLMakkfhFS6tnSm6VVPuzTTNCCbB26KiPv+vNVCaNdx7cAL+d+Yj216ZxxZltfHxF1Ai4O0f7yIh5EwtYUbiR11aeJ7h8u07dt4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732998658; c=relaxed/simple;
	bh=GlJxr9xeZDwebsLehlSWwFhYrF/kSr5SxzIhanknMU8=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=jMCK06oaGQ1yb7j3EbalvXdSvTM7o1wC526bAdsLNOvCVm0MznXNkaxd/jWRq2wRwH0XOkS1S8mZHnnacqckxCr2+zmHHfJCkSuc0ZsT2NWOZ7qHpmd+Wz4hqtPYmq8XIs56aoo0CFjO75VQixIyYaDjjodVZt5sYHk3UAfMhAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=JlOygxyu; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AUKGYOv011526;
	Sat, 30 Nov 2024 20:30:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	t1ORG0fBBgNPFaObUlJk6QJBG5BZhhPxJnhqQF7/XPg=; b=JlOygxyuoLpDpz+F
	sNDDMBQEgb5QFWls/fttBNOd1EjwUbxUYZ2A3P3PJ87n/RoDbyydapTIsvVZU6yH
	TWz79ICSkJHrAnvJpm5oHBKE1vtaYTcw+LqIkuFeuPFM+CJ4A8n75vvmnR8Czy7z
	zp1dPWCNY1dJSAFOHsZWMfl7Dg3e76RJSKxwQlH9xCzdJULaoVdExXlawJrujzTV
	wZStC3B1Ojqt1f1ydE3Jc8VM13KRCDXwN5kC0FyaIgUx4AY9aLManHbjJE544Ksd
	yFgIw2TFvJTRRB/IKD0gSNd6RhYS/vR/3SRSMsnkaJVvhIOgUpWPxdBvVrpVs7aY
	tZPcPA==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 437sq61bp4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 30 Nov 2024 20:30:45 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AUKUi41023758
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 30 Nov 2024 20:30:44 GMT
Received: from [10.216.58.247] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sat, 30 Nov
 2024 12:30:40 -0800
Message-ID: <0aa547fc-4c88-4457-8d01-81f93fb3832c@quicinc.com>
Date: Sun, 1 Dec 2024 02:00:38 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] drm/msm/adreno: Introduce ADRENO_QUIRK_NO_SYSCACHE
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Rob Clark
	<robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio
	<konradybcio@kernel.org>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        "Dmitry
 Baryshkov" <dmitry.baryshkov@linaro.org>,
        Marijn Suijten
	<marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, "Simona
 Vetter" <simona@ffwll.ch>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
References: <20241125-a612-gpu-support-v2-0-b7cc38e60191@quicinc.com>
 <20241125-a612-gpu-support-v2-1-b7cc38e60191@quicinc.com>
 <752484b5-2db1-4714-8046-17cd5496d81d@oss.qualcomm.com>
Content-Language: en-US
From: Akhil P Oommen <quic_akhilpo@quicinc.com>
In-Reply-To: <752484b5-2db1-4714-8046-17cd5496d81d@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: Yz7k_xb3kUovrGdvE9_7c0N0e2gJfPbU
X-Proofpoint-ORIG-GUID: Yz7k_xb3kUovrGdvE9_7c0N0e2gJfPbU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 bulkscore=0
 priorityscore=1501 mlxscore=0 clxscore=1015 lowpriorityscore=0
 suspectscore=0 adultscore=0 spamscore=0 impostorscore=0 mlxlogscore=999
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2411300174

On 11/30/2024 7:01 PM, Konrad Dybcio wrote:
> On 25.11.2024 5:33 PM, Akhil P Oommen wrote:
>> There are a few chipsets which don't have system cache a.k.a LLC.
>> Currently, the assumption in the driver is that the system cache
>> availability correlates with the presence of GMU or RPMH, which
>> is not true. For instance, Snapdragon 6 Gen 1 has RPMH and a GPU
>> with a full blown GMU, but doesnot have a system cache. So,
>> introduce an Adreno Quirk flag to check support for system cache
>> instead of using gmu_wrapper flag.
>>
>> Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
>> ---
>>  drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 3 ++-
>>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c     | 7 +------
>>  drivers/gpu/drm/msm/adreno/adreno_gpu.h   | 1 +
>>  3 files changed, 4 insertions(+), 7 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
>> index 0c560e84ad5a..5e389f6b8b8a 100644
>> --- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
>> @@ -682,6 +682,7 @@ static const struct adreno_info a6xx_gpus[] = {
>>  		},
>>  		.gmem = (SZ_128K + SZ_4K),
>>  		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
>> +		.quirks = ADRENO_QUIRK_NO_SYSCACHE,
>>  		.init = a6xx_gpu_init,
>>  		.zapfw = "a610_zap.mdt",
>>  		.a6xx = &(const struct a6xx_info) {
>> @@ -1331,7 +1332,7 @@ static const struct adreno_info a7xx_gpus[] = {
>>  		},
>>  		.gmem = SZ_128K,
>>  		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
>> -		.quirks = ADRENO_QUIRK_HAS_HW_APRIV,
>> +		.quirks = ADRENO_QUIRK_HAS_HW_APRIV | ADRENO_QUIRK_NO_SYSCACHE,
>>  		.init = a6xx_gpu_init,
>>  		.zapfw = "a702_zap.mbn",
>>  		.a6xx = &(const struct a6xx_info) {
> 
> +a619_holi
> 
>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>> index 019610341df1..a8b928d0f320 100644
>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>> @@ -1863,10 +1863,6 @@ static void a7xx_llc_activate(struct a6xx_gpu *a6xx_gpu)
>>  
>>  static void a6xx_llc_slices_destroy(struct a6xx_gpu *a6xx_gpu)
>>  {
>> -	/* No LLCC on non-RPMh (and by extension, non-GMU) SoCs */
>> -	if (adreno_has_gmu_wrapper(&a6xx_gpu->base))
>> -		return;
>> -
>>  	llcc_slice_putd(a6xx_gpu->llc_slice);
>>  	llcc_slice_putd(a6xx_gpu->htw_llc_slice);
>>  }
>> @@ -1876,8 +1872,7 @@ static void a6xx_llc_slices_init(struct platform_device *pdev,
>>  {
>>  	struct device_node *phandle;
>>  
>> -	/* No LLCC on non-RPMh (and by extension, non-GMU) SoCs */
>> -	if (adreno_has_gmu_wrapper(&a6xx_gpu->base))
>> +	if (a6xx_gpu->base.info->quirks & ADRENO_QUIRK_NO_SYSCACHE)
>>  		return;
> 
> I think A612 is the "quirky" one here.. it has some sort of a GMU,
> but we're choosing not to implement it. maybe a check for
> 
> if (adreno_has_gmu_wrapper && !adreno_is_a612)
> 
> would be clearer here, with a comment that RGMU support is not
> implemented
> 
> 
> 
> But going further, I'm a bit concerned about dt-bindings.. If we
> implement RGMU on the driver side in the future, that will require
> DT changes which will make the currently proposed description invalid.
> 
> I think a better angle would be to add a adreno_has_rgmu() func with
> a qcom,adreno-rgmu compatible and plumb it correctly from the get-go.
> 
> This way, we can avoid this syscache quirk as well.
> 

I am aware of at least Adreno 710 which doesn't have syscache, but has
proper GMU. And I don't see any reason why there couldn't be another one
in future to save silicon area. So, a quirk flag doesn't seem so bad in
this case.

The correct way to avoid this quirk flag is by making LLCC driver return
a proper error to detect the absence of syscache. Currently, it just
returns EPROBE_DEFER which put driver in an infinite probe loop.

Agree about the dt binding suggestion. I will define a new compatible
string for rgmu.

-Akhil.

> Konrad


