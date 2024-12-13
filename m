Return-Path: <linux-arm-msm+bounces-42087-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CABC9F1233
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Dec 2024 17:31:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B994D28396D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Dec 2024 16:31:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4277F16D9DF;
	Fri, 13 Dec 2024 16:31:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BIkpJ37w"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7593513AD1C
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Dec 2024 16:31:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734107501; cv=none; b=ZGl4dL/9RMlK4XBdLDj/LQK9vfaVm1gPBrMfo+s2bRDhLn9RjBEFo6jLSFtv2+Pw7l2G21YQZQfk2XWnf/1wguSopwfTer7vwJ40ly3+wvT1++hYMa9n/ov7X6xwJCw2I3PLg0a4nS46CG/LCJaMn4cOV23AqH6xovWJ8hwXzow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734107501; c=relaxed/simple;
	bh=50EklN3H+8pm/zBroBvX0z1zQjU0ddpWvrDrKolGzdw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dJnI02IiaWgixR06oUY3+bRvwnlLBuuQjTQP73Hu7Rw6nYbfN8ZeqZRapwardfWKG5i8V2EAbPburJHjbGjPeGFs1ZdAfkmwlmi/8Uq/c6xN7PPNHlpeZVatAXtMw9D14/BHwgmH9grHH/z0m66MtuSA2yILjcrsdAuM+6/Q8Aw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BIkpJ37w; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BD7R2nu032190
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Dec 2024 16:31:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nOF/Pv8G40IeIzUV5T5zTR4LFB1jVSawnpEDizMFrIY=; b=BIkpJ37wIDcJNHYd
	j1TViYWEO6bip95oZ1yb2wMIULs+quoiBx3nmdDjIqI8MiCRmu1mcpAwJYd9sHoi
	AbN7rkhBtJjpDWkxpCame6VNPBMfab7efXXrTAg05QUva3LxoTU1dt9LsrLEz6fu
	x038vnIchsTpiL8e6xGP40sJrpsZum6I2MPibxblZPk2cA6xHyo9flgKWBi6Enjh
	ktuAuplcIOJsiPZsJTlWpwsWgUyrOkJldIwvh7TRr4iCYuLf7EWOD0n8MbDfhmWM
	wpauYx6XUmtMEaEA7m3Nc4akW7vmoLEe4zwb/h4w2SYWMNQrrvhl5uayuNKjy6aN
	XyA8jg==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43f6tfg5xc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Dec 2024 16:31:38 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6db1009a608so3601056d6.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Dec 2024 08:31:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734107497; x=1734712297;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nOF/Pv8G40IeIzUV5T5zTR4LFB1jVSawnpEDizMFrIY=;
        b=L30GlBG1kumAvJCnbV7wR97ck+mlXFSvzdxjrphE6fJ8b8OwhHEgQ6vhlQYnokzSJ3
         vUMjmi0UC9Kv3PuGo0KuhHVwOL7rU9X0d4HpbsIIxccljl0TTjXp4yhLY1vAcqFLBtNW
         s9XycIUsP3C/oMFfLzia3oI3/wbdFJQZIuuLmFLVwwUWMzYZmtqBJvuczJStf3aS0uSA
         GxpjWgl4e/qQsQWglWrKjcKS7oPD6Kydd/0zOZoITIubr5QGQwGsMP8memGYABYDFyap
         rl1E1T8lv4McC5fbbc4mmiUaylyQWJvKHUSqEWT+Gg+jnrysrmZQekOciA/MKzC8Dqrj
         vQaQ==
X-Gm-Message-State: AOJu0YzLuAoEpybMcTe/dOVnW8pPIdCZ4OTpVyZ9VmjGSNtUJm5P0sAe
	BITPU+15z0JZYdjIx0M+tR7Oy/fL1+nLnbT6wlAsiBGxghl1n2lqP5jH4BwvRc/ZMoDtGBUUHB5
	1lpXUBTT92TXeuPxmBfAvZeWLP1WlE3M9FZV9G89QMSzv3tlQyxHmnYrYU0PssO2Q
X-Gm-Gg: ASbGnctaAuzUbmiVGep5eEts+sUhvSC79XcDBexjB9L/5+/wouBn4GDtJxLIDyx+Qx7
	PGEH1uaxW84W/7o3PUPpLse0Mr3vcx4q9/Ybe/1vcgds0fsjsUV68ywfBF46pAXIs2XlKmSlmZN
	H2MQvL8w7GLGvR05nPFBQUlywEX+V21gUitdY5DlgaAkuuzsSpzpZXISg58Ch8HPG33ZxbQ2kBa
	BwwaNYLR5EZJkld++eYdXNds+bSddMqK/7FLOtdhKyBQTJbfAHHGfjkuAQKDnP/87G4ZU/DN64v
	HF3ytapYm6/zCWkFir6CiSWNkavcjyigIKd4
X-Received: by 2002:a05:620a:2994:b0:7b6:e126:3dee with SMTP id af79cd13be357-7b6fbec4726mr149251585a.3.1734107496820;
        Fri, 13 Dec 2024 08:31:36 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGTbrWUDH1tEiGe9hJw3p0ll2n39imLNVxTdCBQwJ960b8VbLVSns1/390GlH7821voC/N4RA==
X-Received: by 2002:a05:620a:2994:b0:7b6:e126:3dee with SMTP id af79cd13be357-7b6fbec4726mr149244385a.3.1734107495091;
        Fri, 13 Dec 2024 08:31:35 -0800 (PST)
Received: from [192.168.58.241] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa6590f5457sm927094266b.195.2024.12.13.08.31.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Dec 2024 08:31:34 -0800 (PST)
Message-ID: <0d4d3ca3-ec8a-4e85-9838-a2bf1e07e872@oss.qualcomm.com>
Date: Fri, 13 Dec 2024 17:31:32 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 4/7] drm/msm: adreno: find bandwidth index of OPP and
 set it along freq index
To: neil.armstrong@linaro.org, Konrad Dybcio
 <konrad.dybcio@oss.qualcomm.com>,
        Akhil P Oommen <quic_akhilpo@quicinc.com>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20241211-topic-sm8x50-gpu-bw-vote-v5-0-6112f9f785ec@linaro.org>
 <20241211-topic-sm8x50-gpu-bw-vote-v5-4-6112f9f785ec@linaro.org>
 <ddf91ba2-cab2-4653-b842-65a8e82b5160@oss.qualcomm.com>
 <2f1c6deb-29f8-4144-b086-743fb0f8495c@linaro.org>
 <80bed70e-7802-4555-a15e-e06fe46214c6@quicinc.com>
 <c2d8f443-5876-4293-8d2b-ecd13eaf8285@oss.qualcomm.com>
 <268d67c0-efdf-4ad4-b5fe-5b4f04e73131@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <268d67c0-efdf-4ad4-b5fe-5b4f04e73131@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: -UQnOHE7b7Q4Fj3CTXyn-beUEoyOd9SX
X-Proofpoint-ORIG-GUID: -UQnOHE7b7Q4Fj3CTXyn-beUEoyOd9SX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 suspectscore=0
 mlxlogscore=999 malwarescore=0 spamscore=0 lowpriorityscore=0
 impostorscore=0 adultscore=0 bulkscore=0 phishscore=0 priorityscore=1501
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412130116

On 13.12.2024 5:28 PM, neil.armstrong@linaro.org wrote:
> On 13/12/2024 16:37, Konrad Dybcio wrote:
>> On 13.12.2024 2:12 PM, Akhil P Oommen wrote:
>>> On 12/13/2024 3:07 AM, Neil Armstrong wrote:
>>>> On 12/12/2024 21:21, Konrad Dybcio wrote:
>>>>> On 11.12.2024 9:29 AM, Neil Armstrong wrote:
>>>>>> The Adreno GPU Management Unit (GMU) can also scale the DDR Bandwidth
>>>>>> along the Frequency and Power Domain level, until now we left the OPP
>>>>>> core scale the OPP bandwidth via the interconnect path.
>>>>>>
>>>>>> In order to enable bandwidth voting via the GPU Management
>>>>>> Unit (GMU), when an opp is set by devfreq we also look for
>>>>>> the corresponding bandwidth index in the previously generated
>>>>>> bw_table and pass this value along the frequency index to the GMU.
>>>>>>
>>>>>> The GMU also takes another vote called AB which is a 16bit quantized
>>>>>> value of the floor bandwidth against the maximum supported bandwidth.
>>>>>>
>>>>>> The AB is calculated with a default 25% of the bandwidth like the
>>>>>> downstream implementation too inform the GMU firmware the minimal
>>>>>> quantity of bandwidth we require for this OPP.
>>>>>>
>>>>>> Since we now vote for all resources via the GMU, setting the OPP
>>>>>> is no more needed, so we can completely skip calling
>>>>>> dev_pm_opp_set_opp() in this situation.
>>>>>>
>>>>>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>>>>> Reviewed-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
>>>>>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>>>>>> ---
>>>>>>    drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 39 ++++++++++++++++++++++++
>>>>>> +++++++++--
>>>>>>    drivers/gpu/drm/msm/adreno/a6xx_gmu.h |  2 +-
>>>>>>    drivers/gpu/drm/msm/adreno/a6xx_hfi.c |  6 +++---
>>>>>>    drivers/gpu/drm/msm/adreno/a6xx_hfi.h |  5 +++++
>>>>>>    4 files changed, 46 insertions(+), 6 deletions(-)
>>>>>>
>>>>>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/
>>>>>> msm/adreno/a6xx_gmu.c
>>>>>> index
>>>>>> 36696d372a42a27b26a018b19e73bc6d8a4a5235..46ae0ec7a16a41d55755ce04fb32404cdba087be 100644
>>>>>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
>>>>>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
>>>>>> @@ -110,9 +110,11 @@ void a6xx_gmu_set_freq(struct msm_gpu *gpu,
>>>>>> struct dev_pm_opp *opp,
>>>>>>                   bool suspended)
>>>>>>    {
>>>>>>        struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
>>>>>> +    const struct a6xx_info *info = adreno_gpu->info->a6xx;
>>>>>>        struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
>>>>>>        struct a6xx_gmu *gmu = &a6xx_gpu->gmu;
>>>>>>        u32 perf_index;
>>>>>> +    u32 bw_index = 0;
>>>>>>        unsigned long gpu_freq;
>>>>>>        int ret = 0;
>>>>>>    @@ -125,6 +127,37 @@ void a6xx_gmu_set_freq(struct msm_gpu *gpu,
>>>>>> struct dev_pm_opp *opp,
>>>>>>            if (gpu_freq == gmu->gpu_freqs[perf_index])
>>>>>>                break;
>>>>>>    +    /* If enabled, find the corresponding DDR bandwidth index */
>>>>>> +    if (info->bcms && gmu->nr_gpu_bws > 1) {
>>>>>
>>>>> if (gmu->nr_gpu_bws)
>>>>
>>>> gmu->nr_gpu_bws == 1 means there's not BW in the OPPs (index 0 is the
>>>> "off" state)
>>>>
>>>>>
>>>>>> +        unsigned int bw = dev_pm_opp_get_bw(opp, true, 0);
>>>>>> +
>>>>>> +        for (bw_index = 0; bw_index < gmu->nr_gpu_bws - 1; bw_index+
>>>>>> +) {
>>>>>> +            if (bw == gmu->gpu_bw_table[bw_index])
>>>>>> +                break;
>>>>>> +        }
>>>>>> +
>>>>>> +        /* Vote AB as a fraction of the max bandwidth */
>>>>>> +        if (bw) {
>>>>>
>>>>> This seems to only be introduced with certain a7xx too.. you should
>>>>> ping the GMU with HFI_VALUE_GMU_AB_VOTE to check if it's supported
>>>>
>>>> Good point
>>>
>>> No no. Doing this will trigger some assert in pre-A750 gmu firmwares. We
>>> learned it the hard way. No improvisation please. :)
>>
>> We shouldn't be sending that AB data to firmware that doesn't expect
>> it either too, though..
> 
> Well we don't !

The code in the scope that I quoted above does that

see the full explanation here

https://git.codelinaro.org/clo/le/platform/vendor/qcom/opensource/graphics-kernel/-/commit/6026c31a54444b712f7ea36ac1aafaaeef07fa4e

Konrad

