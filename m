Return-Path: <linux-arm-msm+bounces-41396-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 650AA9EC2E5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Dec 2024 04:10:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3D46B283034
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Dec 2024 03:09:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 246CC20A5CF;
	Wed, 11 Dec 2024 03:09:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="LKq4hFWh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DA9B209F40;
	Wed, 11 Dec 2024 03:09:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733886583; cv=none; b=ZNFrBVAQpul3vZdNcHdzfxPfonxO1NN49cujBzfbf8KcJLeLBUNWSDxsW98CfQVZb3LPJrSvRc8dw+C3C0QOcqieVdJ2xW/twsDhWZQJsUcga7fQde5oxPE0KmYNvVaz/KnhSigfNSEzXFoK0pvSa7zS7F5F2Xs+JfpM1FbQnMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733886583; c=relaxed/simple;
	bh=RcIFBaM9Q6wbTnWfTkgHcWYlbRBN/+x+dHMqLBYrx+8=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Hac3qbSkAU9ZYFDrPMK70m/N1JYxFUgjDA5jKW5Cxfr42N4AEYdpdlFdXOFQdRVvyJTCTL+FCSGZQ6A8E+hrR+G3pe0L5VDD1Vo7JU/z8E+JzN7woC8m2n2SYF/lqlK13OwU43asp9w5xoqOPsrBKO1U7qSZiIreTwpP+rLVM3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=LKq4hFWh; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BB38mhl014601;
	Wed, 11 Dec 2024 03:09:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BOuCHWqNGxQ20QctQ2U+nSgIvO7pAYpz581bH69U8H4=; b=LKq4hFWhXSA+U7w+
	dySsfzvDYqWb/Rm8f1cxhr6wkUhCxUptvNUybQauXCgRhsf6j67c+DwZf+ZiqaPx
	JLalhtUo0KGQwjUbyv8WI0C8AhwgExaeR6A341JLZ8DRjEYRrGbDgv5m1LpUsp1J
	jjcGWg7QYfNIwkZKOz+nZcaS9436chpT/jJjHvuJXtD+rUeDu3CHhzt67bbmTudM
	r6wJfq2RJy1WY7+TwTlPPwrqKVQRAHDOH4/84FOAVnZHqVyDnIeuKFukZmwzV6Wi
	EdW+k+6nZfY9fkwwR+1fla5z0LSBeHb6bB6NARxKDIT0KlqHuebV35eC2kkIcTNb
	rMyM4g==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43ee3nbh41-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 11 Dec 2024 03:09:30 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BB39TB0016490
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 11 Dec 2024 03:09:29 GMT
Received: from [10.216.62.17] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 10 Dec
 2024 19:09:24 -0800
Message-ID: <0df78884-e734-4d34-adf0-c5cba2a0d9da@quicinc.com>
Date: Wed, 11 Dec 2024 08:39:21 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm/a6xx: Skip gpu secure fw load in EL2 mode
To: Elliot Berman <quic_eberman@quicinc.com>
CC: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        "Konrad
 Dybcio" <konradybcio@kernel.org>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Marijn Suijten
	<marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, "Simona
 Vetter" <simona@ffwll.ch>,
        Pavan Kondeti <quic_pkondeti@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
References: <20241209-drm-msm-kvm-support-v1-1-1c983a8a8087@quicinc.com>
 <20241210125012120-0800.eberman@hu-eberman-lv.qualcomm.com>
Content-Language: en-US
From: Akhil P Oommen <quic_akhilpo@quicinc.com>
In-Reply-To: <20241210125012120-0800.eberman@hu-eberman-lv.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: Z5s_VoZPQDMLp02hzhF-9iYGtVolxUnd
X-Proofpoint-ORIG-GUID: Z5s_VoZPQDMLp02hzhF-9iYGtVolxUnd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 suspectscore=0
 malwarescore=0 spamscore=0 priorityscore=1501 mlxscore=0 impostorscore=0
 mlxlogscore=999 lowpriorityscore=0 adultscore=0 clxscore=1015 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2412110022

On 12/11/2024 2:24 AM, Elliot Berman wrote:
> On Mon, Dec 09, 2024 at 01:49:15PM +0530, Akhil P Oommen wrote:
>> When kernel is booted in EL2, SECVID registers are accessible to the
>> KMD. So we can use that to switch GPU's secure mode to avoid dependency
>> on Zap firmware. Also, we can't load a secure firmware without a
>> hypervisor that supports it.
>>
>> Tested following configurations on sa8775p chipset (Adreno 663 gpu):
>>
>> 1. Gunyah (No KVM) - Loads zap shader based on DT
>> 2. KVM in VHE - Skips zap shader load and programs SECVID register
>> 3. KVM in nVHE - Loads zap shader based on DT
> 
> I think this might be misleading. As I understand, KVM in nVHE doesn't
> support loading secure firmware. I'm not aware of any support added to
> make it work. So, the driver will try to load zap shader and it fails
> same as it does today.
>

I see that now. I was trying to document the decision logic in each case.

-Akhil.

>> 4. Kernel in EL2 with CONFIG_KVM=n - Skips zap shader load and
>> 	programs SECVID register
>>
>> For (1) and (3) configuration, this patch doesn't have any impact.
>> Driver loads secure firmware based on other existing hints.
>>
>> Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
>> ---
>> ---
>>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 82 +++++++++++++++++++++++------------
>>  1 file changed, 54 insertions(+), 28 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>> index 019610341df1..9dcaa8472430 100644
>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>> @@ -14,6 +14,10 @@
>>  #include <linux/pm_domain.h>
>>  #include <linux/soc/qcom/llcc-qcom.h>
>>  
>> +#ifdef CONFIG_ARM64
>> +#include <asm/virt.h>
>> +#endif
>> +
>>  #define GPU_PAS_ID 13
>>  
>>  static inline bool _a6xx_check_idle(struct msm_gpu *gpu)
>> @@ -998,6 +1002,54 @@ static int a6xx_zap_shader_init(struct msm_gpu *gpu)
>>  	return ret;
>>  }
>>  
>> +static int a6xx_switch_secure_mode(struct msm_gpu *gpu)
>> +{
>> +	int ret;
>> +
>> +#ifdef CONFIG_ARM64
>> +	/*
>> +	 * We can access SECVID_TRUST_CNTL register when kernel is booted in EL2 mode. So, use it
>> +	 * to switch the secure mode to avoid the dependency on zap shader.
>> +	 */
>> +	if (is_kernel_in_hyp_mode())
>> +		goto direct_switch;
>> +#endif
>> +
>> +	/*
>> +	 * Try to load a zap shader into the secure world. If successful
>> +	 * we can use the CP to switch out of secure mode. If not then we
>> +	 * have no resource but to try to switch ourselves out manually. If we
>> +	 * guessed wrong then access to the RBBM_SECVID_TRUST_CNTL register will
>> +	 * be blocked and a permissions violation will soon follow.
>> +	 */
>> +	ret = a6xx_zap_shader_init(gpu);
>> +	if (ret == -ENODEV) {
>> +		/*
>> +		 * This device does not use zap shader (but print a warning
>> +		 * just in case someone got their dt wrong.. hopefully they
>> +		 * have a debug UART to realize the error of their ways...
>> +		 * if you mess this up you are about to crash horribly)
>> +		 */
>> +		dev_warn_once(gpu->dev->dev,
>> +			"Zap shader not enabled - using SECVID_TRUST_CNTL instead\n");
>> +		goto direct_switch;
>> +	} else if (ret)
>> +		return ret;
>> +
>> +	OUT_PKT7(gpu->rb[0], CP_SET_SECURE_MODE, 1);
>> +	OUT_RING(gpu->rb[0], 0x00000000);
>> +
>> +	a6xx_flush(gpu, gpu->rb[0]);
>> +	if (!a6xx_idle(gpu, gpu->rb[0]))
>> +		return -EINVAL;
>> +
>> +	return 0;
>> +
>> +direct_switch:
>> +	gpu_write(gpu, REG_A6XX_RBBM_SECVID_TRUST_CNTL, 0x0);
>> +	return 0;
>> +}
>> +
>>  #define A6XX_INT_MASK (A6XX_RBBM_INT_0_MASK_CP_AHB_ERROR | \
>>  		       A6XX_RBBM_INT_0_MASK_RBBM_ATB_ASYNCFIFO_OVERFLOW | \
>>  		       A6XX_RBBM_INT_0_MASK_CP_HW_ERROR | \
>> @@ -1341,35 +1393,9 @@ static int hw_init(struct msm_gpu *gpu)
>>  	if (ret)
>>  		goto out;
>>  
>> -	/*
>> -	 * Try to load a zap shader into the secure world. If successful
>> -	 * we can use the CP to switch out of secure mode. If not then we
>> -	 * have no resource but to try to switch ourselves out manually. If we
>> -	 * guessed wrong then access to the RBBM_SECVID_TRUST_CNTL register will
>> -	 * be blocked and a permissions violation will soon follow.
>> -	 */
>> -	ret = a6xx_zap_shader_init(gpu);
>> -	if (!ret) {
>> -		OUT_PKT7(gpu->rb[0], CP_SET_SECURE_MODE, 1);
>> -		OUT_RING(gpu->rb[0], 0x00000000);
>> -
>> -		a6xx_flush(gpu, gpu->rb[0]);
>> -		if (!a6xx_idle(gpu, gpu->rb[0]))
>> -			return -EINVAL;
>> -	} else if (ret == -ENODEV) {
>> -		/*
>> -		 * This device does not use zap shader (but print a warning
>> -		 * just in case someone got their dt wrong.. hopefully they
>> -		 * have a debug UART to realize the error of their ways...
>> -		 * if you mess this up you are about to crash horribly)
>> -		 */
>> -		dev_warn_once(gpu->dev->dev,
>> -			"Zap shader not enabled - using SECVID_TRUST_CNTL instead\n");
>> -		gpu_write(gpu, REG_A6XX_RBBM_SECVID_TRUST_CNTL, 0x0);
>> -		ret = 0;
>> -	} else {
>> +	ret = a6xx_switch_secure_mode(gpu);
>> +	if (!ret)
>>  		return ret;
>> -	}
>>  
>>  out:
>>  	if (adreno_has_gmu_wrapper(adreno_gpu))
>>
>> ---
>> base-commit: f4a867a46862c1743501bbe8c813238456ec8699
>> change-id: 20241120-drm-msm-kvm-support-cd6e6744ced6
>>
>> Best regards,
>> -- 
>> Akhil P Oommen <quic_akhilpo@quicinc.com>
>>


