Return-Path: <linux-arm-msm+bounces-34233-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 27F2099BE1B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Oct 2024 05:20:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4FE161C215DD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Oct 2024 03:20:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 006A25336D;
	Mon, 14 Oct 2024 03:20:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="eKVCRIXL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D08E231C98;
	Mon, 14 Oct 2024 03:20:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728876051; cv=none; b=KAfv+VS+I2vFHWaKXU12dpSSK2VGBeI5HvSHxlIlF336tvZdztxZ4gQtsTuAS9hNwUfGSjknEMD0UD+O9UKa4R4zs0BSi5fzuDL+A+8mHKQsPstfB93fu+RbmI6q2UO5jh7FRr/R35qQyLSB2zpH1FzUN/vppz54WHyEo1j1j2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728876051; c=relaxed/simple;
	bh=nKnDzAdosVLXLbp+d8OY5t5m5TI4hx4V08+XQrkmT4E=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:CC:References:
	 In-Reply-To:Content-Type; b=rbAOKvzF5tZ4sMff6m7YDbYFtdZSLLbU4ddmtUH+iZVvh3S4Ua2Er7luSG87RnXD4umO+wVDpAR57sRCnDxrYpkiLcU4nsG7P8DFtllbsiCBs//pF8+2MFSP3X9U44A6Mt4a/hDks+F9aYHUJkm+CbuIw/hayDECrBYu7VUvTfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=eKVCRIXL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49DNu5t3013174;
	Mon, 14 Oct 2024 03:20:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	e4D2Nfualen50jQ2C1eR41gkOjOmqBtX0FuGq5xmoec=; b=eKVCRIXLvfCtM1Nr
	GThxcAY+po/6d0FKOg0KJX7FrLsPVqJnV1/Ao7g+C+vaibWeXUmlLjorBD5wdzLn
	CUVay32eNDp7EOB2dGGbnH8456ebWTHO0FW+I9kz4jyWrBM/9umXvdA+yrlSHk4Z
	P6nkQIz8HqN4GqBEcfjqYh2MRpTK7tuooh/eLLgAWzQF4NAgMMgs3KexjoPpgeMS
	KmJJN6ZsWB7QnqVBoe5PYQWtMDbnpg9ys+69viE8PV+mZIKNhTurttzMv1i8HefI
	PEC85ZGbqhZHKJVw0SwKvDdF8y6caiXjGfcgx+aAZg5bUxmbGhKNhRYSqollbroR
	R/iP5A==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 427hvfu1wp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 14 Oct 2024 03:20:32 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49E3KVRZ001084
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 14 Oct 2024 03:20:32 GMT
Received: from [10.110.109.95] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sun, 13 Oct
 2024 20:20:30 -0700
Message-ID: <dc3ddbdd-fc69-4858-801d-561d03ce388c@quicinc.com>
Date: Sun, 13 Oct 2024 20:20:29 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/msm: add another DRM_DISPLAY_DSC_HELPER selection
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Lucas De Marchi
	<lucas.demarchi@intel.com>,
        =?UTF-8?Q?Thomas_Hellstr=C3=B6m?=
	<thomas.hellstrom@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard
	<mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie
	<airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Marijn Suijten
	<marijn.suijten@somainline.org>,
        Jessica Zhang <quic_jesszhan@quicinc.com>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <freedreno@lists.freedesktop.org>, kernel test robot <lkp@intel.com>
References: <20240905-fix-dsc-helpers-v1-0-3ae4b5900f89@linaro.org>
 <20240905-fix-dsc-helpers-v1-2-3ae4b5900f89@linaro.org>
 <741111f4-a5de-4c87-9278-c91fc92480ca@quicinc.com>
Content-Language: en-US
In-Reply-To: <741111f4-a5de-4c87-9278-c91fc92480ca@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: ulSSoGJpO8G9Xgyrf7EpUxcLP0J7OiiB
X-Proofpoint-ORIG-GUID: ulSSoGJpO8G9Xgyrf7EpUxcLP0J7OiiB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 phishscore=0 bulkscore=0 mlxlogscore=999 malwarescore=0 mlxscore=0
 clxscore=1015 adultscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410140023



On 10/13/2024 8:11 PM, Abhinav Kumar wrote:
> 
> 
> On 9/4/2024 8:08 PM, Dmitry Baryshkov wrote:
>> In the drm/msm driver both DSI and DPU subdrivers use drm_dsc_*
>> functions, but only DSI selects DRM_DISPLAY_DSC_HELPER symbol. Add
>> missing select to the DPU subdriver too.
>>
>> Fixes: ca097d4d94d8 ("drm/display: split DSC helpers from DP helpers")
>> Reported-by: kernel test robot <lkp@intel.com>
>> Closes: 
>> https://lore.kernel.org/oe-kbuild-all/202409040129.rqhtRTeC-lkp@intel.com/
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
>>   drivers/gpu/drm/msm/Kconfig | 1 +
>>   1 file changed, 1 insertion(+)
>>
> 
> Change LGTM, hence
> 
> Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> 
> But, ca097d4d94d8 ("drm/display: split DSC helpers from DP helpers") is 
> not yet merged, so I will not be able to pick this up for this cycle?
>

Please ignore, I just noticed this series was applied through drm-misc.

>> diff --git a/drivers/gpu/drm/msm/Kconfig b/drivers/gpu/drm/msm/Kconfig
>> index 94d3ed4f7761..c8dda0ebd043 100644
>> --- a/drivers/gpu/drm/msm/Kconfig
>> +++ b/drivers/gpu/drm/msm/Kconfig
>> @@ -92,6 +92,7 @@ config DRM_MSM_DPU
>>       bool "Enable DPU support in MSM DRM driver"
>>       depends on DRM_MSM
>>       select DRM_MSM_MDSS
>> +    select DRM_DISPLAY_DSC_HELPER
>>       default y
>>       help
>>         Compile in support for the Display Processing Unit in
>>

