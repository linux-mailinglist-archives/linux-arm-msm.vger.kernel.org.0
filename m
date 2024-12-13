Return-Path: <linux-arm-msm+bounces-42107-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 500EC9F1304
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Dec 2024 17:55:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 611B3163AE1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Dec 2024 16:55:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A16EF1E32A2;
	Fri, 13 Dec 2024 16:55:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="iRSjz4np"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF34B15573A;
	Fri, 13 Dec 2024 16:55:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734108923; cv=none; b=HSSCFAvxGBjhCnXYaqW4d4KwKY7Dn5NTARCReNm0wKr5N/iT4fD8i26mjpoTYelK8kzTxWR/vniX7vuJJ/EMXdhBIOIcJyrLcJ4ZIHvepetvwmUTzgsWyaBP+FiZjV89SI5doaUtRuuK4l+bflIz5Jy7AD4Mk2h47aLvC1s+Mq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734108923; c=relaxed/simple;
	bh=0mkPiBKDmeqEBcn6gn2UjS0Y5uqOgx+LaEzI1iO7nwk=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=XrWve/Xh4xhZIcNChEaa6bZaSEULy1l1K2gDLXi8Egfm7NU+RsZT6ZpAMkAf+/eKGzW8rceOQjd+5ea0JlCZK6p8afBgJ0D31PaUUOLIeMZ3P8gYK83bv601jaUAx0SBynetuJwQJts/VaoQvV03ZIs+RBKCQG1k+WROb/wxzvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=iRSjz4np; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BDA3bAd012385;
	Fri, 13 Dec 2024 16:55:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OG6DEaXWqaHrMS+72+voLRoVAZ7IyG5g6zSp/nL5gBs=; b=iRSjz4npkyiV17ge
	2Hcw4/CgMG4WWO6/N+lGN+q2YcEBgpZW9du7qb/PQRPfw5VBI18T8M8HnN2cqLis
	dal4IiWrTrWvlCkNk1z5MPwfZEUsGyEDBe+dRmEIQYulTV6xS4Ev5QfdpBQW4+n5
	54UdRnxpD376q4WiunGXpJtBIN48zrAE9jeY7LIathJOhq2Ih7FRInxdm7Yhv4Is
	bQceSlt0wMu0NQyonjBLDYF5YRo7+8jomIeL/XWZ86326+DmV6x6FST9gtLoSuX9
	HsqwzEFX7QEdn00EKPwVoKl8mDWbt8UcU2qAk2nmAQJ8cXZ39l1mLbaSgefAJtlj
	Gj9sSQ==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43gjudh3uu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 13 Dec 2024 16:55:10 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BDGt95C000751
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 13 Dec 2024 16:55:09 GMT
Received: from [10.204.101.130] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 13 Dec
 2024 08:55:04 -0800
Message-ID: <cf298ca5-e2fe-4e0e-a0e7-a2cdad3c657b@quicinc.com>
Date: Fri, 13 Dec 2024 22:25:01 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 4/7] drm/msm: adreno: find bandwidth index of OPP and
 set it along freq index
To: <neil.armstrong@linaro.org>,
        Konrad Dybcio
	<konrad.dybcio@oss.qualcomm.com>,
        Rob Clark <robdclark@gmail.com>, Sean Paul
	<sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abhinav Kumar
	<quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie
	<airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Bjorn Andersson
	<andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>
References: <20241211-topic-sm8x50-gpu-bw-vote-v5-0-6112f9f785ec@linaro.org>
 <20241211-topic-sm8x50-gpu-bw-vote-v5-4-6112f9f785ec@linaro.org>
 <ddf91ba2-cab2-4653-b842-65a8e82b5160@oss.qualcomm.com>
 <2f1c6deb-29f8-4144-b086-743fb0f8495c@linaro.org>
 <80bed70e-7802-4555-a15e-e06fe46214c6@quicinc.com>
 <c2d8f443-5876-4293-8d2b-ecd13eaf8285@oss.qualcomm.com>
 <268d67c0-efdf-4ad4-b5fe-5b4f04e73131@linaro.org>
 <0d4d3ca3-ec8a-4e85-9838-a2bf1e07e872@oss.qualcomm.com>
 <9dcf26e5-1c25-4a18-ab01-58ddf3fbd607@linaro.org>
Content-Language: en-US
From: Akhil P Oommen <quic_akhilpo@quicinc.com>
In-Reply-To: <9dcf26e5-1c25-4a18-ab01-58ddf3fbd607@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: HnMkp7Mk8WikLHn48v_M8l4p_jw4Jg3-
X-Proofpoint-ORIG-GUID: HnMkp7Mk8WikLHn48v_M8l4p_jw4Jg3-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 clxscore=1015
 impostorscore=0 bulkscore=0 phishscore=0 mlxlogscore=999 suspectscore=0
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 spamscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412130119

On 12/13/2024 10:10 PM, neil.armstrong@linaro.org wrote:
> On 13/12/2024 17:31, Konrad Dybcio wrote:
>> On 13.12.2024 5:28 PM, neil.armstrong@linaro.org wrote:
>>> On 13/12/2024 16:37, Konrad Dybcio wrote:
>>>> On 13.12.2024 2:12 PM, Akhil P Oommen wrote:
>>>>> On 12/13/2024 3:07 AM, Neil Armstrong wrote:
>>>>>> On 12/12/2024 21:21, Konrad Dybcio wrote:
>>>>>>> On 11.12.2024 9:29 AM, Neil Armstrong wrote:
>>>>>>>> The Adreno GPU Management Unit (GMU) can also scale the DDR
>>>>>>>> Bandwidth
>>>>>>>> along the Frequency and Power Domain level, until now we left
>>>>>>>> the OPP
>>>>>>>> core scale the OPP bandwidth via the interconnect path.
>>>>>>>>
>>>>>>>> In order to enable bandwidth voting via the GPU Management
>>>>>>>> Unit (GMU), when an opp is set by devfreq we also look for
>>>>>>>> the corresponding bandwidth index in the previously generated
>>>>>>>> bw_table and pass this value along the frequency index to the GMU.
>>>>>>>>
>>>>>>>> The GMU also takes another vote called AB which is a 16bit
>>>>>>>> quantized
>>>>>>>> value of the floor bandwidth against the maximum supported
>>>>>>>> bandwidth.
>>>>>>>>
>>>>>>>> The AB is calculated with a default 25% of the bandwidth like the
>>>>>>>> downstream implementation too inform the GMU firmware the minimal
>>>>>>>> quantity of bandwidth we require for this OPP.
>>>>>>>>
>>>>>>>> Since we now vote for all resources via the GMU, setting the OPP
>>>>>>>> is no more needed, so we can completely skip calling
>>>>>>>> dev_pm_opp_set_opp() in this situation.
>>>>>>>>
>>>>>>>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>>>>>>> Reviewed-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
>>>>>>>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>>>>>>>> ---
>>>>>>>>     drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 39 +++++++++++++++++
>>>>>>>> +++++++
>>>>>>>> +++++++++--
>>>>>>>>     drivers/gpu/drm/msm/adreno/a6xx_gmu.h |  2 +-
>>>>>>>>     drivers/gpu/drm/msm/adreno/a6xx_hfi.c |  6 +++---
>>>>>>>>     drivers/gpu/drm/msm/adreno/a6xx_hfi.h |  5 +++++
>>>>>>>>     4 files changed, 46 insertions(+), 6 deletions(-)
>>>>>>>>
>>>>>>>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/
>>>>>>>> gpu/drm/
>>>>>>>> msm/adreno/a6xx_gmu.c
>>>>>>>> index
>>>>>>>> 36696d372a42a27b26a018b19e73bc6d8a4a5235..46ae0ec7a16a41d55755ce04fb32404cdba087be 100644
>>>>>>>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
>>>>>>>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
>>>>>>>> @@ -110,9 +110,11 @@ void a6xx_gmu_set_freq(struct msm_gpu *gpu,
>>>>>>>> struct dev_pm_opp *opp,
>>>>>>>>                    bool suspended)
>>>>>>>>     {
>>>>>>>>         struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
>>>>>>>> +    const struct a6xx_info *info = adreno_gpu->info->a6xx;
>>>>>>>>         struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
>>>>>>>>         struct a6xx_gmu *gmu = &a6xx_gpu->gmu;
>>>>>>>>         u32 perf_index;
>>>>>>>> +    u32 bw_index = 0;
>>>>>>>>         unsigned long gpu_freq;
>>>>>>>>         int ret = 0;
>>>>>>>>     @@ -125,6 +127,37 @@ void a6xx_gmu_set_freq(struct msm_gpu
>>>>>>>> *gpu,
>>>>>>>> struct dev_pm_opp *opp,
>>>>>>>>             if (gpu_freq == gmu->gpu_freqs[perf_index])
>>>>>>>>                 break;
>>>>>>>>     +    /* If enabled, find the corresponding DDR bandwidth
>>>>>>>> index */
>>>>>>>> +    if (info->bcms && gmu->nr_gpu_bws > 1) {
>>>>>>>
>>>>>>> if (gmu->nr_gpu_bws)
>>>>>>
>>>>>> gmu->nr_gpu_bws == 1 means there's not BW in the OPPs (index 0 is the
>>>>>> "off" state)
>>>>>>
>>>>>>>
>>>>>>>> +        unsigned int bw = dev_pm_opp_get_bw(opp, true, 0);
>>>>>>>> +
>>>>>>>> +        for (bw_index = 0; bw_index < gmu->nr_gpu_bws - 1;
>>>>>>>> bw_index+
>>>>>>>> +) {
>>>>>>>> +            if (bw == gmu->gpu_bw_table[bw_index])
>>>>>>>> +                break;
>>>>>>>> +        }
>>>>>>>> +
>>>>>>>> +        /* Vote AB as a fraction of the max bandwidth */
>>>>>>>> +        if (bw) {
>>>>>>>
>>>>>>> This seems to only be introduced with certain a7xx too.. you should
>>>>>>> ping the GMU with HFI_VALUE_GMU_AB_VOTE to check if it's supported
>>>>>>
>>>>>> Good point
>>>>>
>>>>> No no. Doing this will trigger some assert in pre-A750 gmu
>>>>> firmwares. We
>>>>> learned it the hard way. No improvisation please. :)
>>>>
>>>> We shouldn't be sending that AB data to firmware that doesn't expect
>>>> it either too, though..
>>>
>>> Well we don't !
>>
>> The code in the scope that I quoted above does that
> 
> No it doesn't, if the proper bcms are not declared in the gpu_info, it
> won't

I think what Konrad meant was that IB voting is supported from a650+,
but AB voting is support only from a750+. So we can add bcm nodes to
enable IB voting, but how do we ensure AB voting via GMU is done only on
a750+.

-Akhil

> 
> Neil
> 
>>
>> see the full explanation here
>>
>> https://git.codelinaro.org/clo/le/platform/vendor/qcom/opensource/
>> graphics-kernel/-/commit/6026c31a54444b712f7ea36ac1aafaaeef07fa4e
>>
>> Konrad
> 


