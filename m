Return-Path: <linux-arm-msm+bounces-55161-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D4C1A99264
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Apr 2025 17:44:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9B37D9225E3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Apr 2025 15:35:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4B5228A40A;
	Wed, 23 Apr 2025 15:23:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OM9E2ZUy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 237062853ED
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Apr 2025 15:23:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745421831; cv=none; b=rsA8c94VD99m7RcAFRNSfpTvSVCa40VVr67zb2Tkw5G4w0DIR3Mi8nTNH3zGq97hfYJqhHST/P9vsKRh44oe/YQWCywvIL5caSih0trFF20Q4fudD6A9Md0Y3+cmghpWXxWomioxGGfou5aVkFWs5tD6ymu/Q2fzWiqK5uUtLvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745421831; c=relaxed/simple;
	bh=gSm/AiRykANY2AJ0cb/yFH+ci18lEO4IfixJct9VIbQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jywNSsjzDcnyq2G7dzVW9/rqRjZkp9FceowfJdtM3oFRrG4uhNSTyLUD5iikJGE523j7s0CfsqldgVPt95fdk26gO+JfbyLXZaBtb9M6PmVY3tnF+X3TDraO3SWoMVs0Sy5rgNc1tFqiu2mzLaqFktx5BQS/ijUO2YE28J2Gnro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OM9E2ZUy; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53NApP62020408
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Apr 2025 15:23:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	r3FIkxvIinGQIcn2H7NbkL17x51IYW6d98QsKUMr6mM=; b=OM9E2ZUy88IfGzVL
	FoatmTtvhHzimCX7SP40jD5dm4SdjRbCGLzLC8D/vnO3aIYKZF5HdjzMVGMlqZPy
	mqojsB0Jv2CVheREflSAupJj2e5l21D4FfGn1TWumer7Tl1a9jaLOy25UN6uze7V
	zszN9rfpfUXbRDR0Fl0KBeL/r4UmLVBi79RGr/jGus4XfKqWlRwbnQCIYC+LcK7k
	C77M7vBEehcysBHElXFFeR40tWqcdY/38hjCI3WEAz09wtb4JSBD2MH5VJm8YCHS
	ezXgBV7ZY56YWioqDuzBv9O7JUgJxRdcKQBRPwZ4R6GKUtufn7hvQv33ZgHsFT+k
	yFxR9A==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh22k98-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Apr 2025 15:23:49 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c955be751aso7757885a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Apr 2025 08:23:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745421828; x=1746026628;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=r3FIkxvIinGQIcn2H7NbkL17x51IYW6d98QsKUMr6mM=;
        b=BlGBy5kGYSy7fWX3M5WoZwUFhe5y7XsDjEID0rlh4zpQ2yTZbM4LJT64bOi6UmVioj
         M+rmcPWlyUUDu+Q7jt5sXsdC7k8qJeWlz4baYPosqEi2EPqG/xDBruWHsCVq6lzJscbd
         kd/I4Nw/ElTd5LKcUxdLLOeREB2VlM7xHTDPGbL7kMcV679GOLReW9ZujJan6BsCAv4M
         7w33Zk7psjmMWGRWMq2jipDX4BCwVdP/cOHvDkqAURjTsLT+PPv5SaDfEN95Rbx7/nFZ
         9Y/ie51OQZtGMv4iPSgUbIg2iWTbupWLPWZWb7xC84qlEzKSNLh0S/8IzuiQ2t7hFXuS
         bZ6g==
X-Forwarded-Encrypted: i=1; AJvYcCXCGhNKRc/r75OLGWgp5IiOWsh2phwpP4qhxFo4U7rk5QvfOiwK3jPU58ntbqDT50xpyR1c46HkGAcjNo51@vger.kernel.org
X-Gm-Message-State: AOJu0YxiYJsXtjAxk2CQdP2cSSA2y0CIXZawNRTHLCCHBGWEqIdAusly
	gCD1DZaBJ/o6F2CBZwiKub6PI+P6AoC9yHlaYLBVtDWo1xYiN370hs+R4vRsCuK+fjbT5KV0Biq
	3V/5DDd+xpfQ+DaDPgCT1lUmsq79bVY3sDywYft+MWQwqz80VQfNyHQMnA04MGvBC
X-Gm-Gg: ASbGncvooaAkGCd9q/i9eC2/ddOooUeT0M2ABqlJ5tV9FwZLFNl5yXurvdNlIFUhdwY
	49kYRnq1I39ZKe22wsLD/ftcLGi6ZeunemYORYuAg6DBmdFKovsYYh9ikCkQiMRL5sAzSaT4v12
	MpeqPg6xs18JUZhZtJTgR0QhPceeyMeTA0QNitOlTD8w1ifwv4SAQuwCAJG75XwTYNeqyV5b0io
	7vxBOxx1tXrHm2EZ7YYQR9FhxEKRP/CMQtstJw5mbP4TjjH82vtEJLPwNjkJxnGGaPg164hBL20
	WtwNMxn46xNKYdXha9N1vbHufcFe4ncWxKiXYMKDZ71cq5+zTvzTkLNc4MS2wl10f16fH+CnalT
	PvlVWRRiy5VXDQ6ow0pd+32guGipN2XO207Yw3iuHw+AL0Cmo7qD+bbzAxBPAEVn2
X-Received: by 2002:a05:620a:4149:b0:7c5:3cf6:7838 with SMTP id af79cd13be357-7c92805dcd3mr3251754785a.49.1745421827617;
        Wed, 23 Apr 2025 08:23:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF4VINuu2Xy9f+Jgd9x+sEEy1ml8USXXDrXZs3i+/S1a0FB6ilwJUPYzKZPPdxuaxS+9i8laA==
X-Received: by 2002:a05:620a:4149:b0:7c5:3cf6:7838 with SMTP id af79cd13be357-7c92805dcd3mr3251749885a.49.1745421827190;
        Wed, 23 Apr 2025 08:23:47 -0700 (PDT)
Received: from ?IPV6:2001:14bb:ce:6a0b:b501:c51a:e775:2fe5? (2001-14bb-ce-6a0b-b501-c51a-e775-2fe5.rev.dnainternet.fi. [2001:14bb:ce:6a0b:b501:c51a:e775:2fe5])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-31090822c3asm19762901fa.65.2025.04.23.08.23.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Apr 2025 08:23:46 -0700 (PDT)
Message-ID: <6233171a-2964-4d57-986c-d3f1725eacd6@oss.qualcomm.com>
Date: Wed, 23 Apr 2025 18:23:44 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] drm/msm/a6xx: Get HBB dynamically, if available
To: Rob Clark <robdclark@gmail.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Akhil P Oommen <quic_akhilpo@quicinc.com>,
        Connor Abbott <cwabbott0@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        linux-hardening@vger.kernel.org,
        dri-devel
 <dri-devel@lists.freedesktop.org>,
        freedreno@lists.freedesktop.org
References: <20250410-topic-smem_dramc-v2-0-dead15264714@oss.qualcomm.com>
 <20250410-topic-smem_dramc-v2-3-dead15264714@oss.qualcomm.com>
 <20911703-ab4e-4eb2-8611-294730a06d2f@quicinc.com>
 <CACu1E7HDmQXDNtEQCXpHXsOKPCOgrWgo+_kcgizo9Mp1ntjDbA@mail.gmail.com>
 <1282bf58-e431-4a07-97e5-628437e7ce5f@quicinc.com>
 <CACu1E7GwMCt6+JJQGgSvJObTMMWYLPd69owyFo7S=sxu_EEsUw@mail.gmail.com>
 <16845de2-a40a-4e3d-b3aa-c91e7072b57f@quicinc.com>
 <CAF6AEGvyeRLHFBYmxkevgT+hosXGiH_w8Z+UjQmL+LdbNfVZ+w@mail.gmail.com>
 <acd1c8dd-286b-40b7-841d-e53e2d155a61@oss.qualcomm.com>
 <CAF6AEGts5rWvgyZy8RtAaUOsad362AG-uNjxF9vyj4szg=b5Bw@mail.gmail.com>
Content-Language: en-US
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <CAF6AEGts5rWvgyZy8RtAaUOsad362AG-uNjxF9vyj4szg=b5Bw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=EtLSrTcA c=1 sm=1 tr=0 ts=68090605 cx=c_pps a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=INHOtyMNgn4pQtdJY3IA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: Q5IlvBmcrGtZCl78CJ5j4GSQbaqrKb6Q
X-Proofpoint-ORIG-GUID: Q5IlvBmcrGtZCl78CJ5j4GSQbaqrKb6Q
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDIzMDEwOCBTYWx0ZWRfX4qn/vdmAq6Bp d3INlaPak8rSS2cbBIYJmcL2p4roaGetvdchPWsH8/8acX/0I6jQsQ2Vn0pEHCTkMXVS+Q5Ykfr 9IA8bMTWCXMVI1a0eNd34fD6O+Gh4YvX06uvwzRl2zfL4RozK6SkIfQYstQO+DIdnjr8kmIWAM7
 qN7RH8kmuVANcbwslKd1xwhGSYAHISOfvz32c0QpUpRZomaOe0qmJWLkVR15wRPCX/wgIgeaaLp pFCBo7UbH30rt7LkXYYfWoXv7cv5CXfMJAQynajNnl5f0+5lB48AkcyIJjJBNV4MDVsHz6RYQhw xToZ/s8YhYr0uTBGdoDzl//1Iqzmp3n6s+7Dt00uvICd1GuPJiAtikDJNfpi1HpzpG9luixksQh
 ReC5c/Ai66a+TasMg60G+8x8njhnpwJ346I437nUatkUWr543SKJOTshC5X0utKl7Y92+1ha
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-23_09,2025-04-22_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 phishscore=0
 suspectscore=0 mlxscore=0 clxscore=1015 spamscore=0 mlxlogscore=999
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504230108

On 23/04/2025 17:55, Rob Clark wrote:
> On Tue, Apr 22, 2025 at 4:57 PM Konrad Dybcio
> <konrad.dybcio@oss.qualcomm.com> wrote:
>>
>> On 4/21/25 10:13 PM, Rob Clark wrote:
>>> On Fri, Apr 18, 2025 at 9:00 AM Akhil P Oommen <quic_akhilpo@quicinc.com> wrote:
>>>>
>>>> On 4/18/2025 6:40 AM, Connor Abbott wrote:
>>>>> On Thu, Apr 17, 2025, 1:50 PM Akhil P Oommen <quic_akhilpo@quicinc.com> wrote:
>>>>>>
>>>>>> On 4/17/2025 9:02 PM, Connor Abbott wrote:
>>>>>>> On Thu, Apr 17, 2025 at 3:45 AM Akhil P Oommen <quic_akhilpo@quicinc.com> wrote:
>>>>>>>>
>>>>>>>> On 4/10/2025 11:13 PM, Konrad Dybcio wrote:
>>>>>>>>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>>>>>>>>
>>>>>>>>> The Highest Bank address Bit value can change based on memory type used.
>>>>>>>>>
>>>>>>>>> Attempt to retrieve it dynamically, and fall back to a reasonable
>>>>>>>>> default (the one used prior to this change) on error.
>>>>>>>>>
>>>>>>>>> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>>>>>>>> ---
>>>>>>>>>   drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 15 ++++++++++++++-
>>>>>>>>>   1 file changed, 14 insertions(+), 1 deletion(-)
>>>>>>>>>
>>>>>>>>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>>>>>>>>> index 06465bc2d0b4b128cddfcfcaf1fe4252632b6777..a6232b382bd16319f20ae5f8f5e57f38ecc62d9f 100644
>>>>>>>>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>>>>>>>>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>>>>>>>>> @@ -13,6 +13,7 @@
>>>>>>>>>   #include <linux/firmware/qcom/qcom_scm.h>
>>>>>>>>>   #include <linux/pm_domain.h>
>>>>>>>>>   #include <linux/soc/qcom/llcc-qcom.h>
>>>>>>>>> +#include <linux/soc/qcom/smem.h>
>>>>>>>>>
>>>>>>>>>   #define GPU_PAS_ID 13
>>>>>>>>>
>>>>>>>>> @@ -587,6 +588,8 @@ static void a6xx_set_cp_protect(struct msm_gpu *gpu)
>>>>>>>>>
>>>>>>>>>   static void a6xx_calc_ubwc_config(struct adreno_gpu *gpu)
>>>>>>>>>   {
>>>>>>>>> +     int hbb;
>>>>>>>>> +
>>>>>>>>>        gpu->ubwc_config.rgb565_predicator = 0;
>>>>>>>>>        gpu->ubwc_config.uavflagprd_inv = 0;
>>>>>>>>>        gpu->ubwc_config.min_acc_len = 0;
>>>>>>>>> @@ -635,7 +638,6 @@ static void a6xx_calc_ubwc_config(struct adreno_gpu *gpu)
>>>>>>>>>            adreno_is_a690(gpu) ||
>>>>>>>>>            adreno_is_a730(gpu) ||
>>>>>>>>>            adreno_is_a740_family(gpu)) {
>>>>>>>>> -             /* TODO: get ddr type from bootloader and use 2 for LPDDR4 */
>>>>>>>>>                gpu->ubwc_config.highest_bank_bit = 16;
>>>>>>>>>                gpu->ubwc_config.amsbc = 1;
>>>>>>>>>                gpu->ubwc_config.rgb565_predicator = 1;
>>>>>>>>> @@ -664,6 +666,13 @@ static void a6xx_calc_ubwc_config(struct adreno_gpu *gpu)
>>>>>>>>>                gpu->ubwc_config.highest_bank_bit = 14;
>>>>>>>>>                gpu->ubwc_config.min_acc_len = 1;
>>>>>>>>>        }
>>>>>>>>> +
>>>>>>>>> +     /* Attempt to retrieve the data from SMEM, keep the above defaults in case of error */
>>>>>>>>> +     hbb = qcom_smem_dram_get_hbb();
>>>>>>>>> +     if (hbb < 0)
>>>>>>>>> +             return;
>>>>>>>>> +
>>>>>>>>> +     gpu->ubwc_config.highest_bank_bit = hbb;
>>>>>>>>
>>>>>>>> I am worried about blindly relying on SMEM data directly for HBB for
>>>>>>>> legacy chipsets. There is no guarantee it is accurate on every chipset
>>>>>>>> and every version of firmware. Also, until recently, this value was
>>>>>>>> hardcoded in Mesa which matched the value in KMD.
>>>>>>>
>>>>>>> To be clear about this, from the moment we introduced host image
>>>>>>> copies in Mesa we added support for querying the HBB from the kernel,
>>>>>>> explicitly so that we could do what this series does without Mesa ever
>>>>>>> breaking. Mesa will never assume the HBB unless the kernel is too old
>>>>>>> to support querying it. So don't let Mesa be the thing that stops us
>>>>>>> here.
>>>>>>
>>>>>> Thanks for clarifying about Mesa. I still don't trust a data source that
>>>>>> is unused in production.
>>>>>
>>>>> Fair enough, I'm not going to argue with that part. Just wanted to
>>>>> clear up any confusion about Mesa.
>>>>>
>>>>> Although, IIRC kgsl did set different values for a650 depending on
>>>>> memory type... do you know what source that used?
>>>>
>>>> KGSL relies on an undocumented devicetree node populated by bootloader
>>>> to detect ddrtype and calculates the HBB value based on that.
>>>
>>> Would it be reasonable to use the smem value, but if we find the
>>> undocumented dt property, WARN_ON() if it's value disagrees with smem?
>>>
>>> That would at least give some confidence, or justified un-confidence
>>> about the smem values
>>
>> The aforementioned value is populated based on the data that this
>> driver reads out, and only on the same range of platforms that this
>> driver happens to cater to
> 
> Did I understand that correctly to mean that the dt property is based
> on the same smem value that you are using?  In that case, there should
> be no argument against using the smem value as the source of truth.

It is, but is done by the bootloader that knows exact format of the data.


-- 
With best wishes
Dmitry

