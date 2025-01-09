Return-Path: <linux-arm-msm+bounces-44580-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A071A07714
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jan 2025 14:19:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9CB41168D5B
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jan 2025 13:19:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59B322185AB;
	Thu,  9 Jan 2025 13:18:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BcWLRure"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC3CE2040BF
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Jan 2025 13:18:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736428720; cv=none; b=Po7mBpDaPD6Y86NhhXbA/73zG/gsylvSwIOjRX0Wtfw/YDbpkShI1kQJXdDz3VXuteCzvYFAq9hFbbb5207rkqViTnuufikg68qnBPnBniEfcOXp9at9l8zrGTHaWwTDJBA1sDefE411uwbPukCSm/FH05keW5sN87yA7/U42ds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736428720; c=relaxed/simple;
	bh=TaIOHD5qOC9eQbkC2KwUCC+oNlvRDSN8i27bzPIAphg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PhznXc4UBl6/by/WMhwYeHmce74CBNtQJjUbXfKDM9xfe3aXygJYX8J0RpIEVzpY7zKyXws2YfRdN2zX4S3YvRxRFVWSzhNBRO9mJfrAxVgNvmhykslWphc5DPJm1p3TJeLZ5EQZnefZofAN/7ZdlCa9ghjZmz3nX1lAIOxVnWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BcWLRure; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5097H9im019545
	for <linux-arm-msm@vger.kernel.org>; Thu, 9 Jan 2025 13:18:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pAinXbrU54YDWSX+TXddpuW5K6ve1Twi3iiA/2chiCM=; b=BcWLRurexoqUrzil
	CGrFm5ROVN8ieMEH5KtvzD14VWbPC9F/MFgpZA3SFpXoyEQjsa5DOK8dLHFXfZFH
	ESpck5PSTXWnCKGtcgbNRfmqYsYugqscLL9ZH58LZPJMMPU88MQsIMWjNmSTyQdA
	9+xAbz1fASA71qbd46FSVUQYPFgcYO0yztOUj/8O8aUVFL1rJYuc4uqgIcLRF1a4
	BDXTQbcDOi347zK6J5gVivAjkHRfQe2Dd6MUZgesPBFgTh9avZtmCdH/HC+RfuH7
	xzkJBOFWRVLyZDBMzji5CqyQx9PcfgN32LFVhxn09r3MaIVU1IzgqHMDVRCJjECx
	mXGClg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4429x50uda-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jan 2025 13:18:37 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-469059f07e2so585821cf.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jan 2025 05:18:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736428716; x=1737033516;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pAinXbrU54YDWSX+TXddpuW5K6ve1Twi3iiA/2chiCM=;
        b=fDCnA70HoC3GP/kfeL7ejf7BXoa4YlHZE3dgzVRcGtw2Jtro+bowe0nvkkepTv9D85
         xzP/5VDXp0FcB6Pwgedwn+UchYXBZIgOsrPHuLPMq5CCwO5YerlwZHRAkP8TE2ZEkxE/
         XZnJ3HY48FFEIhpW75h9sSYYG+VISdHfP3y5wonEkG6QETBzTxJoni9PjLYsgTpHA+j5
         pjt2WQDK0BqBh76D/zeL3yUhVww25FvzFOTEXQCF/udkvpzucTrfC+PV3tH4MWyUZXLT
         i7P+UkU8ip59KJObqrnyDAViy980gbRidvLzBuo6I6P5XJApBkg++CRKChyRMizHjTWt
         X+tg==
X-Gm-Message-State: AOJu0YyBGegPhMcvFlBPluD7Y+Un0qpoFkCH/WQGzbAnBNYFSB5MH85V
	EmrkuGnFhVVUwbssTD7IM8ViltcIkic8R2+F4244KFP3WDdI9aR+QSZwWFV8GmiJesP0+jF+JXE
	5xgGZEfJ7C6bwyKbbyURK+RW+yiWxtFgtz374zj1HFHR33vmpGnHA00Fm/zmR2W7/
X-Gm-Gg: ASbGncujxOEg3psSvbxSzuL92Rp+02vUdrGrOObVa0y8MunUYEFoT2H1HjyM8/EluP7
	zO3UXM+IUzuu43y1r9zIOgd1kEqsS8mRWTzGsOGId7BBZSS+smm4Ub1EnSfyc/8qR6MXMbHqhPm
	8PBNOOB+XSdPh6LDpgWeC7gHjLwoHzTim59ZhEJKFBP/5KaGmM0x0Cf9smgLbYZww5vIYmK/Y/P
	bkU6izRa2ft1UPS2CY1V7jKgAsDd5AgNc7DTKO8nTHCT+Lmskwwj2LuFwdIrg+z+QCyHGKaTarO
	PKB0wNTBYfpB5L/AM00SVTgQGmQ1pPgAReg=
X-Received: by 2002:a05:622a:1210:b0:467:5eaf:7d22 with SMTP id d75a77b69052e-46c7107d773mr39277881cf.10.1736428716430;
        Thu, 09 Jan 2025 05:18:36 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG6kvir4x6bXBZGJQpNMnh+xnivzaxOEAhM6X+eUDPYvw1UTSVFnpcbtAmlt9R06v1GvxWRsQ==
X-Received: by 2002:a05:622a:1210:b0:467:5eaf:7d22 with SMTP id d75a77b69052e-46c7107d773mr39277661cf.10.1736428716024;
        Thu, 09 Jan 2025 05:18:36 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d99046ddabsm573823a12.68.2025.01.09.05.18.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jan 2025 05:18:35 -0800 (PST)
Message-ID: <e934d116-f8ab-4efd-947c-e5c34b102409@oss.qualcomm.com>
Date: Thu, 9 Jan 2025 14:18:31 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/7] drm/msm/adreno: Add module param to disable ACD
To: Akhil P Oommen <quic_akhilpo@quicinc.com>,
        Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Maya Matuszczyk <maccraft123mc@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org
References: <20250109-gpu-acd-v4-0-08a5efaf4a23@quicinc.com>
 <20250109-gpu-acd-v4-4-08a5efaf4a23@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250109-gpu-acd-v4-4-08a5efaf4a23@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: YoAfKeQl3yaCGPAv7ol5v99jjXPv3KOs
X-Proofpoint-ORIG-GUID: YoAfKeQl3yaCGPAv7ol5v99jjXPv3KOs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 impostorscore=0
 bulkscore=0 mlxlogscore=999 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 malwarescore=0 mlxscore=0 spamscore=0 adultscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501090105

On 8.01.2025 9:40 PM, Akhil P Oommen wrote:
> Add a module param to disable ACD which will help to quickly rule it
> out for any GPU issues.
> 
> Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gmu.c      | 7 +++++++
>  drivers/gpu/drm/msm/adreno/adreno_device.c | 4 ++++
>  2 files changed, 11 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> index 1f213a0fc61b..ce08eed572c8 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> @@ -1475,6 +1475,13 @@ static int a6xx_gmu_acd_probe(struct a6xx_gmu *gmu)
>  	struct adreno_gpu *adreno_gpu = &a6xx_gpu->base;
>  	struct msm_gpu *gpu = &adreno_gpu->base;
>  	int ret, i, cmd_idx = 0;
> +	extern bool disable_acd;
> +
> +	/* Skip ACD probe if requested via module param */
> +	if (disable_acd) {
> +		DRM_DEV_ERROR(gmu->dev, "Skipping GPU ACD probe\n");
> +		return 0;
> +	}
>  
>  	cmd->version = 1;
>  	cmd->stride = 1;
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
> index 236b25c094cd..f4552b8c6767 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_device.c
> +++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
> @@ -24,6 +24,10 @@ int enable_preemption = -1;
>  MODULE_PARM_DESC(enable_preemption, "Enable preemption (A7xx only) (1=on , 0=disable, -1=auto (default))");
>  module_param(enable_preemption, int, 0600);
>  
> +bool disable_acd;
> +MODULE_PARM_DESC(disable_acd, "Forcefully disable GPU ACD");
> +module_param_unsafe(disable_acd, bool, 0600);

IIUC 0600 makes it sysfs-writeable, which we don't want, as it takes
effect during probe (meaning booting with =0 and writing 1 later on
has no effect)

Konrad

