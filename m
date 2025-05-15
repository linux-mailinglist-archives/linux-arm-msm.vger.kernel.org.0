Return-Path: <linux-arm-msm+bounces-58088-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D19DAAB8B76
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 May 2025 17:51:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5D1FA4E1A5E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 May 2025 15:51:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD6B220B80B;
	Thu, 15 May 2025 15:51:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="leUOTINV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 173B0187332
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 May 2025 15:51:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747324298; cv=none; b=uYmgmrlZzw/gZkoqoq3TyEX52w1pZpgdW+in5LeZvyCEMbbx246u4CoreUcgnWhwd/DNLwenFw8G2dnB4qdI3nwkuj/Zo919nXwz6cAZzFeO/LgmqSGFGkHUdJ998N/A/9yFfhpa/veK/YUHT49HwlZgpmsRdyqxxWMjXqs6eng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747324298; c=relaxed/simple;
	bh=cmMwaQXb+aIMfxzyzJMuGvBUdjVg14ixWeZDo74S2QI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BnhzmYFfVvHNP5zNviCPozEtXrsEK72tTFhy30XB6WT498WMKDVD03qrql5xpZG2NhjqHbuTBs7GZxFTkZxyL58GY1P/ZVUApbPaf/G/Q38LAYg2/TlA4GbnwercyQWwxFhwWpWHLDy5TkoEqy+HklRsntYlfXCFRUIbcX9dvRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=leUOTINV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54FEFWa1021298
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 May 2025 15:51:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+e+5/dGFTBvTUJTFnStarpjY0VEAdmkaML06k5ujGeE=; b=leUOTINVq/54ZUdU
	vQv4+xzg3M/uywuo6dM2OpTinZku8k8A8Xp/jSUkY1bCs0Ae0cEwExkXVVNacxX7
	lHzVX5oFrpO4fmvNs08fms/IF0t9EoxIeswc2x5BBPSNknLJeIF1M9cTDCrS+hOW
	eR6w+nK3rd9zwJsmDIVoFD95zI96i8YZ8Uxg/9joylQeSAGZHjzlnKR/YGQg7KOs
	NBJS2XBih/4MwNbs/OdSVjlDPCdjNBrxntKbnrKzZmPGdVUEcORkcLUiRctOfdgO
	w0QtZ7fQHW/3jjeuZj1bIS0qLWvRtU3p8GKp0oJze8Py+hUAEaGu1NkaDyhawm0C
	/xWYdg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbew6mdr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 May 2025 15:51:35 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6f8ac35546eso373766d6.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 May 2025 08:51:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747324295; x=1747929095;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+e+5/dGFTBvTUJTFnStarpjY0VEAdmkaML06k5ujGeE=;
        b=wZJRmZ31QKhMGZbpFtfcxuPXraWOFfeoABS+zowbrsV3U2pnKrTCU/+TVfaqROtx12
         DnyER5j+7NsQ7yuWjdoA0gG4CtbZyeD+d7F9W60xdA4INpR8nBljo8mO9SYWSpiuDAfI
         kQl4fTPjFwW+lS4Rjd/oel6UuCXXYqluJdMhslPTz6saxPmYHvTTCF2r/qRxOE0vFIY1
         asG625ubdTvgGBLZ7WyZh8dKNo7LwNjm+BO6pFCBMz//ivWiDGRErYbZnsKQ8RwaVotY
         ocJxt6aukSO1/QfWCgVUKnO5LNf/GdDnk1Yvt/5Cd8wh0X8Z79t3m58/+y2+tXkWl+Yn
         4YIg==
X-Forwarded-Encrypted: i=1; AJvYcCWMZcDPG7IZdWaSI6cFeU7/wo2owBRZLHEivWJdutsLJvy1fTJbPqDLGsG6F2Ixiz4f7LMzl7MTKCXe1KVE@vger.kernel.org
X-Gm-Message-State: AOJu0YzNi2Smw9LH/Qms+/UCMfsyoe57d4HdssgA3x+/01ONNSxMYdNP
	V8Dj1lbUBopBu+rGFCOXw0FwsDqvTwbkiaAK4YMaoIp9BbdQKa3iQdvMpwO7Kdh+YgyAIHLCcHI
	IUb9hGhMk71Q0CPyNDPwzGnjHsAla74migLMhy/vJmxQzu7A7DVj2boVr8Bo+1+TjKJE4
X-Gm-Gg: ASbGncvVSGmBJdnFujvRAyv/Hp7dhegLGHtxgecuzYAd8bueypStMHeNuWFXls4ZyKS
	4AIhXIN9WBuzZibL88YbTNbgZNhd2Q8u2Qm9mrbtm34ycu9UkJgzDCYXD1tGJv7YC7pahAzeV24
	7c7K1L+oCBr9XeYAtOlugoF+V7ebHMYcSdGKYDwFWIVVl8Ccj/DB7Tjh63LKU93+lp9HHn3foIc
	GVAzYZNbUfHl3kMKRSAXOm8jy4nk6x+I7jUiEcKhi2/qNtbZtr+9ueAY9pjSZgKE/dhuiBXoBOC
	hUem7h15hQNahZ/mTLr1WYA4wDoh2ZrWY5EdPLK+MUrQpe6bjLscfkpL1alall8JXw==
X-Received: by 2002:a05:6214:20ab:b0:6f8:95ee:9da2 with SMTP id 6a1803df08f44-6f8b08ab968mr1250196d6.10.1747324294903;
        Thu, 15 May 2025 08:51:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGfaZCHStwDbGBnyL2BR4sz8v/EdIJECgWgLt80+ba9IIvBZ4s0JC+YbhOTKTK6PxxUotlxYA==
X-Received: by 2002:a05:6214:20ab:b0:6f8:95ee:9da2 with SMTP id 6a1803df08f44-6f8b08ab968mr1249956d6.10.1747324294537;
        Thu, 15 May 2025 08:51:34 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad52d4ca2bfsm6455966b.157.2025.05.15.08.51.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 May 2025 08:51:34 -0700 (PDT)
Message-ID: <503932a8-3124-4448-b18a-e25554745488@oss.qualcomm.com>
Date: Thu, 15 May 2025 17:51:31 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFT v2 11/15] drm/msm/adreno: Switch to the common UBWC
 config struct
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Akhil P Oommen <quic_akhilpo@quicinc.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20250514-topic-ubwc_central-v2-0-09ecbc0a05ce@oss.qualcomm.com>
 <20250514-topic-ubwc_central-v2-11-09ecbc0a05ce@oss.qualcomm.com>
 <qhmayxvlyz2txum5rs5vaf3iqzniz6nktr4zatru6bhgp6tdah@uq24obw2ro5f>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <qhmayxvlyz2txum5rs5vaf3iqzniz6nktr4zatru6bhgp6tdah@uq24obw2ro5f>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: su-A1wdB-iWBfFXsOiewBdYyqFf0lKtp
X-Proofpoint-ORIG-GUID: su-A1wdB-iWBfFXsOiewBdYyqFf0lKtp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE1MDE1NyBTYWx0ZWRfX0YAThE/w7+qt
 GgVxeJDXbp17f9e/qsDbFDJNZsMv5QUUn2yX10tOEgSEjoQ2W7xDQeh5yu+2aGlg5jyM0KpKhhM
 kZZKNQAHtGrm3x20wJIJCjadP/iicFqNDjyfarGnyDsz8d95K4fppDTLzzTs+6SUAGPJm/R6CsK
 qyJZWacLxpgNCsSG9K7chwO14j/hfLKjTngbeA5TmlVQ6Kzl2fpytcRL1FVLZegZTvfWS9Pnx3g
 prQp12D2YV8TQ1JNtqnlCoqfS2Pb9RY5/JWoQ1uhb4ONBlIEQ3tusRpM57ELqrW7exhDHyLizr0
 XCcwUcB7hZ//nj+TdsmgZB2DbmX0Qepdv4kVEmDC+QkXhUMA3vhXY9hUlZsKSJkn1GO7wSRfcvH
 nZMtRRGYSwbC7Bv/URVjxzv3H/u4qWP8NlwUTnb55N+CuelMa8NFzwd5so8r0arQUa3vghXc
X-Authority-Analysis: v=2.4 cv=LOFmQIW9 c=1 sm=1 tr=0 ts=68260d87 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=hON3piRNd2u2ny3NyMoA:9
 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-15_06,2025-05-15_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 adultscore=0 priorityscore=1501 suspectscore=0
 mlxscore=0 malwarescore=0 mlxlogscore=999 impostorscore=0 bulkscore=0
 clxscore=1015 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505150157

On 5/14/25 9:22 PM, Dmitry Baryshkov wrote:
> On Wed, May 14, 2025 at 05:10:31PM +0200, Konrad Dybcio wrote:
>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>
>> Now that Adreno specifics are out of the way, use the common config
>> (but leave the HBB hardcoding in place until that is wired up on the
>> other side).
>>
>> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>> ---
>>  drivers/gpu/drm/msm/adreno/a5xx_gpu.c   | 20 +++++------
>>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c   | 64 ++++++++++++++++-----------------
>>  drivers/gpu/drm/msm/adreno/adreno_gpu.c |  6 ++--
>>  drivers/gpu/drm/msm/adreno/adreno_gpu.h | 45 ++++-------------------
>>  4 files changed, 50 insertions(+), 85 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
>> index 650e5bac225f372e819130b891f1d020b464f17f..611e0eb26d0e19d431673d08e042162375fd400f 100644
>> --- a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
>> +++ b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
>> @@ -833,8 +833,8 @@ static int a5xx_hw_init(struct msm_gpu *gpu)
>>  
>>  	gpu_write(gpu, REG_A5XX_RBBM_AHB_CNTL2, 0x0000003F);
>>  
>> -	BUG_ON(adreno_gpu->ubwc_config.highest_bank_bit < 13);
>> -	hbb = adreno_gpu->ubwc_config.highest_bank_bit - 13;
>> +	BUG_ON(adreno_gpu->ubwc_config->highest_bank_bit < 13);
>> +	hbb = adreno_gpu->ubwc_config->highest_bank_bit - 13;
>>  
>>  	gpu_write(gpu, REG_A5XX_TPL1_MODE_CNTL, hbb << 7);
>>  	gpu_write(gpu, REG_A5XX_RB_MODE_CNTL, hbb << 1);
>> @@ -1754,6 +1754,7 @@ struct msm_gpu *a5xx_gpu_init(struct drm_device *dev)
>>  	struct msm_drm_private *priv = dev->dev_private;
>>  	struct platform_device *pdev = priv->gpu_pdev;
>>  	struct adreno_platform_config *config = pdev->dev.platform_data;
>> +	const struct qcom_ubwc_cfg_data *common_cfg;
>>  	struct a5xx_gpu *a5xx_gpu = NULL;
>>  	struct adreno_gpu *adreno_gpu;
>>  	struct msm_gpu *gpu;
>> @@ -1790,15 +1791,14 @@ struct msm_gpu *a5xx_gpu_init(struct drm_device *dev)
>>  	/* Set up the preemption specific bits and pieces for each ringbuffer */
>>  	a5xx_preempt_init(gpu);
>>  
>> -	/* Set the highest bank bit */
>> -	if (adreno_is_a540(adreno_gpu) || adreno_is_a530(adreno_gpu))
>> -		adreno_gpu->ubwc_config.highest_bank_bit = 15;
>> -	else
>> -		adreno_gpu->ubwc_config.highest_bank_bit = 14;
>> +	/* Inherit the common config and make some necessary fixups */
>> +	common_cfg = qcom_ubwc_config_get_data();
>> +	if (IS_ERR(common_cfg))
>> +		return ERR_PTR(-EINVAL);
>>  
>> -	/* a5xx only supports UBWC 1.0, these are not configurable */
>> -	adreno_gpu->ubwc_config.macrotile_mode = 0;
>> -	adreno_gpu->ubwc_config.ubwc_swizzle = 0x7;
>> +	/* Copy the data into the internal struct to drop the const qualifier (temporarily) */
>> +	adreno_gpu->_ubwc_config = *common_cfg;
>> +	adreno_gpu->ubwc_config = &adreno_gpu->_ubwc_config;
> 
> Ugh. I'd rather keep the ubwc config r/o.
> 
>>  
>>  	adreno_gpu->uche_trap_base = 0x0001ffffffff0000ull;
>>  
>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>> index fdc843c47c075a92ec8305217c355e4ccee876dc..ae0bb7934e7ed203aa3b81e28767de204f0a4d60 100644
>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>> @@ -587,64 +587,62 @@ static void a6xx_set_cp_protect(struct msm_gpu *gpu)
>>  
>>  static int a6xx_calc_ubwc_config(struct adreno_gpu *gpu)
>>  {
>> +	const struct qcom_ubwc_cfg_data *common_cfg;
>> +	struct qcom_ubwc_cfg_data *cfg = &gpu->_ubwc_config;
>> +
>>  	/* Inherit the common config and make some necessary fixups */
>> -	gpu->common_ubwc_cfg = qcom_ubwc_config_get_data();
>> -	if (IS_ERR(gpu->common_ubwc_cfg))
>> +	common_cfg = qcom_ubwc_config_get_data();
>> +	if (IS_ERR(common_cfg))
>>  		return -EINVAL;
>>  
>> -	gpu->ubwc_config.ubwc_swizzle = 0x6;
>> -	gpu->ubwc_config.macrotile_mode = 0;
>> -	gpu->ubwc_config.highest_bank_bit = 15;
>> +	/* Copy the data into the internal struct to drop the const qualifier (temporarily) */
>> +	*cfg = *common_cfg;
>> +
>> +	cfg->ubwc_swizzle = 0x6;
>> +	cfg->highest_bank_bit = 15;
>>  
> 
> This begs for WARN_ON(cfg->ubwc_swizzle !=
> gpu->common_ubwc_cfg->ubwc_swizzle) and similar change for HBB. Then
> after testing we should be able to drop r/w part of the config.

I'd rather put the warn in ubwc_config.c

Konrad

