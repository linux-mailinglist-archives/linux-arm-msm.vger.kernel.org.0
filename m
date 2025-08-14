Return-Path: <linux-arm-msm+bounces-69283-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 27B0EB26DFA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Aug 2025 19:54:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 27BC73B5A05
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Aug 2025 17:52:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6326A31076D;
	Thu, 14 Aug 2025 17:52:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AMPkh4oK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACC9A30E85D
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 Aug 2025 17:52:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755193942; cv=none; b=dV0fMHZ9xPq8nnNPlASmXgRFDbCQfktehiQQqeHIq+uvgLPFpX8/kaMuIX7DjDfV6WwB75tjjWBOnzJHHMnYNoET+UODMuyziSMdami9FiT7QymFaZhDDrCHI8oQ0FSQItufpRWNjI5OxnBA8KtLmTTQNw4GjxJeuKfkdhf/eXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755193942; c=relaxed/simple;
	bh=AdeW0M9x6hlf8EJEHi1iljsXA5eJV8IK5H5QGQIhK2A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=P61cmh0WMsFZA3SfNICHcGOBtMYz2El9qM7Mej7eSGLtGcYs85HXcSXT03+W+5k/AoeICSmH+6bh9qv+z+FZspWBDxUEFjV/+natkuKY0RjjFY54xpyjJgtR2uU9B/vPXZPQXZAgczC/2uFkA/wpNyaBEZQj2AjrfarJMG4zX/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AMPkh4oK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57EHWU6M020683
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 Aug 2025 17:52:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kf1KNla6dRvfydP3rOxmCpoNvWjKiR17gEq81Ru/7Mk=; b=AMPkh4oKUw7tc07r
	34OjQkKiwy94XH8TppZ8C0lknz/11zIT/IR0EFDCgRTD3PvdsFAR3xGHJQdyiPRE
	iAgUFqASufFQRS4qPJ/XvxEkt355x48vQjd/p1sCOgMnGRqzY/Zp+OVhTXupdNVX
	EGdm4jUfq5pjyO701DXBcLGIxqXdcELfLRGa12K+Lgm+Jc6okDLmvFNFPMeNLegZ
	t7ZRsE5ALL+zSNoStzyy6tmgCgK8Bd8iL/vRKAvsbSo0/15nZ3mHreNK1KKGklmd
	2MW9Vildv2eHkJ3TEPR16aoZo/RJOGVnJUCb32IVFrRNObQgtIaexOOJnVY+MmwZ
	I1URnQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48g5hmgp37-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 Aug 2025 17:52:19 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4b109c6bf1dso2804751cf.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Aug 2025 10:52:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755193938; x=1755798738;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kf1KNla6dRvfydP3rOxmCpoNvWjKiR17gEq81Ru/7Mk=;
        b=O+QQdvEDKcHmDK1aLRQjZlCKCqQPrJ5udGwynxg7k5r11u9cv8nXKnRebwxeWeF9JD
         iakZwgFw4tySKbcO6tKUaSj6/JCTUfCEB7eSr0orSCSU/LRw0HCLIkiIQW9pPWXQ+e6/
         R8I4Jpwvtk5FgLSBUZb+7TCvYdWyMalJsiS2bTH/P+kcQhjAgd00/jO2y9m63WSXSc6k
         hAfqTTHx4Iqe8aTS9cW5L9wHw2azNWbpTtp4AOXeuyAtQPa0X66Qwuz0ghGlJkoVNXJs
         //hc8HMu8pZQKSXdzH8eSm32iXEcsxXlUD96FyG6IaJ0LOEb8HEPbcC9y9f/grhKQbkU
         FNgw==
X-Gm-Message-State: AOJu0YxQvR92cJxMqXA7LEZvCXJLAHqzMgj79EQxeIpslWnsVhbgA9UB
	hGWEemoKK3Tp7bwLE6gzcLbTxj2HRy7nCCWtPcGNi3i0+0AlJTrm34sOYXHKhMNSdmosc6u06fF
	pqEJPnZv4N6nkLeUCO2AAyKQ69cMnZu8jsYB0AtoqM+D5JaUwiCwKre0rw3KJ2DqFp6Dj
X-Gm-Gg: ASbGnctqA+KrbWal4ubhKV/SvfFmFIBMvtMo542m/yp7gXNmOC+gTdqHVsm5WvNIWF9
	0lQrRwP2CQ1gPStufIpq2aSEAux1DZjagjV65BnyItZhAGuCt1ikntjs68ErogBOPNrHe/gM6+/
	8bbDvXBxQitMuWCWTyjkcuvzaeh6e7ovHKGVmcelo73BmWA0v5WsQKLs4cfgpOnNRYv/sanb2lB
	NLtc76ZOEIblaotphF1QC1bd9PgKZPn6J38uFGhxPxwt5MwT0ijtYcSuQ6T5tNjzP97a1vXcN1o
	Wx0oxIMgJaICvuo3b/QaaSQ8vbtWYPid8D9HEbTn8qMOA+/IrUUe/evPBPgrUloraQRNcaAoGkV
	e18cEYouxf4EG5rzXxw==
X-Received: by 2002:ac8:7d12:0:b0:4ab:7633:c58e with SMTP id d75a77b69052e-4b10a98ac48mr29607241cf.2.1755193937984;
        Thu, 14 Aug 2025 10:52:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFnts5b3T3oPwnRC47gGDR5vru1FmCBJm2j7CtF+T0NTcUjDzn2U3ZeqG7szkJIlGQBWfi7zA==
X-Received: by 2002:ac8:7d12:0:b0:4ab:7633:c58e with SMTP id d75a77b69052e-4b10a98ac48mr29606861cf.2.1755193937163;
        Thu, 14 Aug 2025 10:52:17 -0700 (PDT)
Received: from [192.168.43.16] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a0766d1sm2630993066b.18.2025.08.14.10.52.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Aug 2025 10:52:16 -0700 (PDT)
Message-ID: <df007b41-5c3d-4c69-81b9-27155485ccf9@oss.qualcomm.com>
Date: Thu, 14 Aug 2025 19:52:13 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/msm: adreno: a6xx: enable GMU bandwidth voting for
 x1e80100 GPU
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20250725-topic-x1e80100-gpu-bwvote-v2-1-58d2fbb6a127@linaro.org>
 <e7ddfe18-d2c7-4201-a271-81be7c814011@oss.qualcomm.com>
 <33442cc4-a205-46a8-a2b8-5c85c236c8d4@oss.qualcomm.com>
 <b4f283ce-5be1-4d2f-82e2-e9c3be22a37f@oss.qualcomm.com>
 <269506b6-f51b-45cc-b7cc-7ad0e5ceea47@linaro.org>
 <1727374d-0461-4442-ab35-9acb8ef7f666@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <1727374d-0461-4442-ab35-9acb8ef7f666@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODEyMDExOSBTYWx0ZWRfX+60nMeVNBi6n
 7YSAtXiiIFrhnZ67cf0pooX22KPFO2dLLduSFoAQO/vNGASKAWgPVeE84tzrKYP8kzrb1nX5OCS
 Brqf+ZwmfPPcq3STSkbaMEs0ZwiFRnMpKskS0PUltmD/97SIfuadi/V4/eCIQhwMi+ibf61smvv
 dcsBmYdGg8EOU8EnkUmFIE7EI8mRmBxnxKBRHiNKiv85D6dfpKsL5MoURk9aLm5MNWDAFeQJU7H
 Col4/Ok8zLXDp5OPWtqqctLQs9dH7INyA+9pXvJ1Bc6QgwwMkWljLfnzhOB6bLykW1NZkT6a2AJ
 LoWsynlhCXzJyLVog6nPibGY4oxkXuw9vh7H2xmFIxpDem6NXCpCFRPrc6PLNg8xgFapgrDKBtA
 wgNFF8J8
X-Proofpoint-GUID: gOxUBGbAgczlb72nOwOqWk82q-oG3gN9
X-Proofpoint-ORIG-GUID: gOxUBGbAgczlb72nOwOqWk82q-oG3gN9
X-Authority-Analysis: v=2.4 cv=d4b1yQjE c=1 sm=1 tr=0 ts=689e2253 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=KKAkSRfTAAAA:8 a=06jlRiaS0U7peylTb-kA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-13_02,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 spamscore=0 phishscore=0 adultscore=0
 bulkscore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508120119

On 8/14/25 6:38 PM, Akhil P Oommen wrote:
> On 8/14/2025 7:56 PM, Neil Armstrong wrote:
>> Hi,
>>
>> On 14/08/2025 13:22, Konrad Dybcio wrote:
>>> On 8/14/25 1:21 PM, Konrad Dybcio wrote:
>>>> On 7/31/25 12:19 PM, Konrad Dybcio wrote:
>>>>> On 7/25/25 10:35 AM, Neil Armstrong wrote:
>>>>>> The Adreno GPU Management Unit (GMU) can also scale DDR Bandwidth
>>>>>> along
>>>>>> the Frequency and Power Domain level, but by default we leave the
>>>>>> OPP core scale the interconnect ddr path.
>>>>>>
>>>>>> Declare the Bus Control Modules (BCMs) and the corresponding
>>>>>> parameters
>>>>>> in the GPU info struct to allow the GMU to vote for the bandwidth.
>>>>>>
>>>>>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>>>>>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>>>>>> ---
>>>>>> Changes in v2:
>>>>>> - Used proper ACV perfmode bit/freq
>>>>>> - Link to v1: https://lore.kernel.org/r/20250721-topic-x1e80100-
>>>>>> gpu-bwvote-v1-1-946619b0f73a@linaro.org
>>>>>> ---
>>>>>>   drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 11 +++++++++++
>>>>>>   1 file changed, 11 insertions(+)
>>>>>>
>>>>>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/
>>>>>> gpu/drm/msm/adreno/a6xx_catalog.c
>>>>>> index
>>>>>> 00e1afd46b81546eec03e22cda9e9a604f6f3b60..892f98b1f2ae582268adebd758437ff60456cdd5 100644
>>>>>> --- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
>>>>>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
>>>>>> @@ -1440,6 +1440,17 @@ static const struct adreno_info a7xx_gpus[] = {
>>>>>>               .pwrup_reglist = &a7xx_pwrup_reglist,
>>>>>>               .gmu_chipid = 0x7050001,
>>>>>>               .gmu_cgc_mode = 0x00020202,
>>>>>> +            .bcms = (const struct a6xx_bcm[]) {
>>>>>> +                { .name = "SH0", .buswidth = 16 },
>>>>>> +                { .name = "MC0", .buswidth = 4 },
>>>>>> +                {
>>>>>> +                    .name = "ACV",
>>>>>> +                    .fixed = true,
>>>>>> +                    .perfmode = BIT(3),
>>>>>> +                    .perfmode_bw = 16500000,
>>>>>
>>>>> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>>>
>>>> Actually no, BIT(3) is for the CPU (OS), GPU should use BIT(2)
> 
> You are right that BIT(2) is GPU specific, but that support was
> commercialized from A7XX_GEN3. Anyway, the Win KMD uses BIT(2), so lets
> use that in Linux too.
> 
> I know some docs show BIT(2) support, but lets not bring in untested
> configurations.

Eh, then let's get the docs fixed if you don't trust them because we can't
work like that..

FWIW this is information from per-platform RPMh cmd-db data

Konrad

