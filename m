Return-Path: <linux-arm-msm+bounces-53673-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 66E66A82B93
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Apr 2025 17:59:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5435819E09E1
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Apr 2025 15:53:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3413627BF95;
	Wed,  9 Apr 2025 15:47:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IGXx7aN8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B56C26B0A0
	for <linux-arm-msm@vger.kernel.org>; Wed,  9 Apr 2025 15:47:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744213629; cv=none; b=U/5ezWPi0nLVelBdgtkvMtl6M0RKXuGdVbPAeS0qCMo8hH6Wm2crqrG/c9p9hguoWYj8x6vb9NhnZ41W30Qk4i7x2hz6MlLXYR4rWcMZLrWz2y9loH1sNVQu0FWozjcrlIey67Bfx6kAsSWeBOpczEJys+2y3lAB4FlYY6xjZwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744213629; c=relaxed/simple;
	bh=oG7tmQ/ls/+HhXNBi0mONoy2wFrs+TaCAhJQB10Zq1k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AOH2b3UCMPRMOeVT4/XbFSFhzHjyqnh9oBqGRs1Kb3yXhpGIGjon5wsbMa8So0887NL6xWJwpDniue0kgQzT7yBBgwnQ+kCnfDfFQZ7woAqhsv1w5Z6WLlpJnJkU5/f0Vk3ISXyAqWUB/E93KWsrcUnWCyyU03F336Slnv6NqtE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IGXx7aN8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5398Z75V029085
	for <linux-arm-msm@vger.kernel.org>; Wed, 9 Apr 2025 15:47:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mGj9y69QHKe3+tDT9FnF5QoDdKX7mW0cM2oMhuEhV7U=; b=IGXx7aN8BJcqZ0c/
	ExZcZRCzzLT0FlxaEWfaTB812bIDqg6FoU3dlGv4o63I3ZPeiDF0SsW5SMIrD0Fz
	xJDCNR3aEGiz3D0WsBGoymBOWWi84M6Ez/5OGMYp2/rtCmcpFHW7+0NxBAdv1sXm
	moqUrRDx4i+tDF8HDEVaprvxHd790LuxywfQmUb3uxJrNJ0kNUAUDRn6WjPjUclL
	h0Qc6KNJ12IKfMSKvAA2H/f81mBMyPrKBoRxrFL9Ad8o1US3L9dW7fG85X1j8/o4
	L4Dodd+efAT7iozwI1n5+3qrbkrRKeQ6EB3QMHgPKC9coJnCXpy08+5pPTBkza40
	u8YCNw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twpmbscq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 09 Apr 2025 15:47:05 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c5841ae28eso216941085a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 09 Apr 2025 08:47:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744213624; x=1744818424;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mGj9y69QHKe3+tDT9FnF5QoDdKX7mW0cM2oMhuEhV7U=;
        b=lMHnLBgOm+41jGt9PAvI93DJgrGYfbVQ10E532Cb7rbDIwibaJ0Gfa04IfFv6lz27V
         8CDh1qZ2X+nBpeEsoNPmlLYCgquju5cmdloMBP9tp25MciGd85Nt7sYV7zzW7xEXyY6m
         dZDtBeLPdPElreH3aSV5vVxrr7nDND6Jij7y/2/KfPKHxX9KFQE+en1flDEscbsST/CV
         BqcG37Kj5M4CbXon34rXiMqAV7wq4fzgfET5aPcA4NsnAfpOiFeRl4kv9viexNeHk5a0
         SvpEStSeJiTvsbvzflNAd/JUNRPYJXHnzQvaEFW/3JfvsEM1UcuXikLo/wH0SpdOCIKd
         TAbQ==
X-Forwarded-Encrypted: i=1; AJvYcCVudLh9gbmsKVv8zQaxMSlkMJrCH1FKOOgAFdMj0LZ6TztMHXETsjDroDr+h5V2y+Rqj7O/3nRE7SmYu8NN@vger.kernel.org
X-Gm-Message-State: AOJu0YwTN1pg2vGFrN6fMOg6wPGMq/ArspOOhHF4sW0/6x50oBfI0qv3
	g1YBT6/b2EZJXPRl9kRAGcK2euIeQ6LgtB+aH0m+tDHNcoVCoTGz7Izs4IKviXetkldVv1m+0U7
	2DA+IFm2xvj3bD21yrBnrSpuCZUxN7E0BaOuklMsSkyqP+BqNq4WTZppaMTvEOfXA
X-Gm-Gg: ASbGncsqNyYlNJSINPnhLjI67oLFzy9t0HAb0EJYZZx8vc64O+FRJVPdjMnkJOnG1Dv
	dmGLP5N+RrX6ahiFU2eyUIaB7/6RjThBdTBayFvgf92lIj4Qx34tXMlEBMtx/JbTe2S/rT/TiFu
	Gwgwj/Y9K9ruixpX3wYBkO36hMP3lAMRv7RDsR4OZhNoC/ceekWoXSnqecUve8QFsRDEmIuDG6m
	YRR6e11iMRowvHZzpsBGmXn+1NE88bPf+oVuHRKjX12XPNHgXyV4BbUtxcRWhw8L8jphdOe0eLL
	tr9iL/uvVnfb23UEm5vYBrjs/lLtZ9ModupkebEBmqbUocpimOM9SVcB9BShXAYPtw==
X-Received: by 2002:a05:620a:319d:b0:7c5:8ece:8b56 with SMTP id af79cd13be357-7c79ddc0062mr131355885a.4.1744213623574;
        Wed, 09 Apr 2025 08:47:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH9BR2XdeykvWdhqJj8WMwZYRklWgdHjFIJLEq2GXaWcLHLQ/K0yinWTGwViErAHu3nY6Avsw==
X-Received: by 2002:a05:620a:319d:b0:7c5:8ece:8b56 with SMTP id af79cd13be357-7c79ddc0062mr131352985a.4.1744213623083;
        Wed, 09 Apr 2025 08:47:03 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acaa1be9c0dsm116187766b.61.2025.04.09.08.47.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Apr 2025 08:47:02 -0700 (PDT)
Message-ID: <0fda3b72-8bff-4f3d-b9e2-cfe1ac1d3082@oss.qualcomm.com>
Date: Wed, 9 Apr 2025 17:46:59 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] drm/msm/a6xx: Get HBB dynamically, if available
To: Connor Abbott <cwabbott0@gmail.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-hardening@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
References: <20250409-topic-smem_dramc-v1-0-94d505cd5593@oss.qualcomm.com>
 <20250409-topic-smem_dramc-v1-3-94d505cd5593@oss.qualcomm.com>
 <CACu1E7GMf0Mx2ZX_t76h+b1CPin49LGix7c5uvoWaJZC3dKyOw@mail.gmail.com>
 <c2dac38b-bbe5-4cd1-9d33-b4bba629d54b@oss.qualcomm.com>
 <CACu1E7F71M0Z5KUdArRYbLEMXoS3jQEtp=0-4LEYFRysOsYZfA@mail.gmail.com>
 <9a12e042-487b-4937-a583-709f0c37ab12@oss.qualcomm.com>
 <CACu1E7Hto_Ms3RxQjXXYB+RB+FC5n1VFtohKbe4EzKWgEk9uiQ@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CACu1E7Hto_Ms3RxQjXXYB+RB+FC5n1VFtohKbe4EzKWgEk9uiQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: uM_y12mn0f9s5nJfU6V57yqnUH3vbAcE
X-Proofpoint-ORIG-GUID: uM_y12mn0f9s5nJfU6V57yqnUH3vbAcE
X-Authority-Analysis: v=2.4 cv=MpRS63ae c=1 sm=1 tr=0 ts=67f69679 cx=c_pps a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=o9cw19nxWuB9g-ePJCEA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-09_05,2025-04-08_04,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 mlxlogscore=999 clxscore=1015 priorityscore=1501 impostorscore=0
 spamscore=0 bulkscore=0 suspectscore=0 malwarescore=0 adultscore=0
 phishscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504090100

On 4/9/25 5:44 PM, Connor Abbott wrote:
> On Wed, Apr 9, 2025 at 11:40 AM Konrad Dybcio
> <konrad.dybcio@oss.qualcomm.com> wrote:
>>
>> On 4/9/25 5:30 PM, Connor Abbott wrote:
>>> On Wed, Apr 9, 2025 at 11:22 AM Konrad Dybcio
>>> <konrad.dybcio@oss.qualcomm.com> wrote:
>>>>
>>>> On 4/9/25 5:12 PM, Connor Abbott wrote:
>>>>> On Wed, Apr 9, 2025 at 10:48 AM Konrad Dybcio <konradybcio@kernel.org> wrote:
>>>>>>
>>>>>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>>>>>
>>>>>> The Highest Bank address Bit value can change based on memory type used.
>>>>>>
>>>>>> Attempt to retrieve it dynamically, and fall back to a reasonable
>>>>>> default (the one used prior to this change) on error.
>>>>>>
>>>>>> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>>>>> ---
>>>>>>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 22 ++++++++++++++++------
>>>>>>  1 file changed, 16 insertions(+), 6 deletions(-)
>>>>>>
>>>>>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>>>>>> index 06465bc2d0b4b128cddfcfcaf1fe4252632b6777..0cc397378c99db35315209d0265ad9223e8b55c7 100644
>>>>>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>>>>>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>>>>>> @@ -13,6 +13,7 @@
>>>>>>  #include <linux/firmware/qcom/qcom_scm.h>
>>>>>>  #include <linux/pm_domain.h>
>>>>>>  #include <linux/soc/qcom/llcc-qcom.h>
>>>>>> +#include <linux/soc/qcom/smem.h>
>>>>>>
>>>>>>  #define GPU_PAS_ID 13
>>>>>>
>>>>>> @@ -669,17 +670,22 @@ static void a6xx_calc_ubwc_config(struct adreno_gpu *gpu)
>>>>>>  static void a6xx_set_ubwc_config(struct msm_gpu *gpu)
>>>>>>  {
>>>>>>         struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
>>>>>> +       u32 hbb = qcom_smem_dram_get_hbb();
>>>>>> +       u32 ubwc_mode = adreno_gpu->ubwc_config.ubwc_swizzle & 1;
>>>>>> +       u32 level2_swizzling_dis = !(adreno_gpu->ubwc_config.ubwc_swizzle & 2);
>>>>>> +       u32 hbb_hi, hbb_lo;
>>>>>> +
>>>>>>         /*
>>>>>>          * We subtract 13 from the highest bank bit (13 is the minimum value
>>>>>>          * allowed by hw) and write the lowest two bits of the remaining value
>>>>>>          * as hbb_lo and the one above it as hbb_hi to the hardware.
>>>>>>          */
>>>>>> -       BUG_ON(adreno_gpu->ubwc_config.highest_bank_bit < 13);
>>>>>> -       u32 hbb = adreno_gpu->ubwc_config.highest_bank_bit - 13;
>>>>>> -       u32 hbb_hi = hbb >> 2;
>>>>>> -       u32 hbb_lo = hbb & 3;
>>>>>> -       u32 ubwc_mode = adreno_gpu->ubwc_config.ubwc_swizzle & 1;
>>>>>> -       u32 level2_swizzling_dis = !(adreno_gpu->ubwc_config.ubwc_swizzle & 2);
>>>>>> +       if (hbb < 0)
>>>>>> +               hbb = adreno_gpu->ubwc_config.highest_bank_bit;
>>>>>
>>>>> No. The value we expose to userspace must match what we program.
>>>>> You'll break VK_EXT_host_image_copy otherwise.
>>>>
>>>> I didn't know that was exposed to userspace.
>>>>
>>>> The value must be altered either way - ultimately, the hardware must
>>>> receive the correct information. ubwc_config doesn't seem to be const,
>>>> so I can edit it there if you like it better.
>>>>
>>>> Konrad
>>>
>>> Yes, you should be calling qcom_smem_dram_get_hbb() in
>>> a6xx_calc_ubwc_config(). You can already see there's a TODO there to
>>> plug it in.
>>
>> Does this look good instead?
>>
>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>> index 0cc397378c99..ae8dbc250e6a 100644
>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>> @@ -588,6 +588,8 @@ static void a6xx_set_cp_protect(struct msm_gpu *gpu)
>>
>>  static void a6xx_calc_ubwc_config(struct adreno_gpu *gpu)
>>  {
>> +       u8 hbb;
> 
> You can't make it u8 and then test for a negative value on error.

Fair. I think it was u8 in a pre-release version of the patchset and it
stuck in my mind.. though I'dve expected clang to warn me here..

> Other than that, looks good.

Thanks, I'll change it in v2.

Konrad

