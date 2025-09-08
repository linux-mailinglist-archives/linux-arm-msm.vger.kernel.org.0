Return-Path: <linux-arm-msm+bounces-72615-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A135BB49540
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Sep 2025 18:29:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9FEB27A46AE
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Sep 2025 16:28:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D5A530BBA4;
	Mon,  8 Sep 2025 16:29:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="f8OUVLXO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89E901DF26E
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Sep 2025 16:29:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757348986; cv=none; b=EPChwOGyKVrPkK32yKkvyexIwAZyJEFLdvhcgYSpUxeCmJjloX3L2BF5r9E6Y0GaDZX4dXUVQ+GyMzz/bf0G8jMBT6FH3kJZWZNHygScTQ2WG1ssFRWVr631C7yRUHjNQhF3UuCamg70UcQUn2YZNBtWES7VQ3AzXpxQbJ22XMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757348986; c=relaxed/simple;
	bh=Oaf4UR4kcYEDjrjDdJDdwybHl3Nk89X2OSd7beG9THI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jbK909BAFPEZhTEwtvO46+OYTA1GyVlLZTnUX0nZ3cUBN+hMruSFDzkIKyazHUSvo6hq2VERrihs/wi3xo5eLxHGlofNl8qcqKSaOxpa9PC0jJqghN5HJmkiNiLusoTKcN62ni5a1aBk1i0dJW6oTRPoyow2K4Phop+3k0nmdr4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=f8OUVLXO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 588GOF8M009866
	for <linux-arm-msm@vger.kernel.org>; Mon, 8 Sep 2025 16:29:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1/JrYL6eSgak4nQJFxzbTbTPiEgAtTyrBvDwY7/FkW8=; b=f8OUVLXOkN1IkvFW
	mfSJ3ZpfSOjczj4/jphBKPL74qCnrhFfv2xWEbDgj7/4DGZxSWhXYyxl+1XRFTXB
	qXamamEgsGs4k8YSnsyIxlkKhQkIUf7xa/o9smN80bHol5YbvaEqJCErpSvp45r0
	7HNbS8CXpUfR0gmVz/oLwjAe035aBq+ZfiCVUDkJOyOiiU+w4wA3X9MGhsf/5P1s
	VFBpb5ZNde66D6aH2t+Ljt9VRoLBwcUjYXSPq0NBiefUadvb/Xd4c4wVPtfdfOsa
	5hcv4HOUWtDkviK4vvx+AZ3SUgu88FVQfmryaB/CsTrGLbogVWFH99ZJUavQfHDx
	RnBrlQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490c9j5cyn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 08 Sep 2025 16:29:43 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-24c8264a137so58025055ad.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Sep 2025 09:29:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757348982; x=1757953782;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1/JrYL6eSgak4nQJFxzbTbTPiEgAtTyrBvDwY7/FkW8=;
        b=fxYAEVtP8VkboN/2spDUk5D759p0Zmt/0Q5+EJuMhwENGYr17eeY6EwY8DmYsLbfU0
         P7t1zIfycdBRQF8XVuQW1gQ2G+bmt1MkgX5BPYkizBJ5UvKnyVQkSu2bCY0lJeQEj1oV
         m5CXmVd7nOTNGCsdAOuLCm2o3860gjQlYsnj7bxkdDr5XFVd7QX5u0F3P0xI0iHUCwsv
         eUARJySDZarlZkBjbjDWa8+SdhLjkHZxXC3o7hyVgBFghkU8x6Jfbw40RELXiIUvMr7f
         ZWZ0+bMicRjiUatG76kCJFLGXccDswQPPwVi0VWwigmu0v2j/W9poq0PIxwrCQkJnNFq
         9Ngg==
X-Forwarded-Encrypted: i=1; AJvYcCWXSbDB0126+vD9ioBJr3y6Wuj4386LBY3bqgVKZeJcE0yQZ/AnOc+J8YQgn4nRHVlroNKTereIz4PE0dId@vger.kernel.org
X-Gm-Message-State: AOJu0YybpK/+q8IxeoSTILhBG0P3pGPn4R8De6DN+iwKFBVF7xUAp6ge
	mEiisPQXIMNjOn9YO+EnV3Of6t9ts4QoF6pGkHkrK2MIUNqmOiS6VHkhmLbt5i/+Pi+bZ5wzy7F
	fREHBvy5ufHdk6Gp6hVaL0lJTwRJWuvWyy5d1J0HLe5l4ABTqjsN5FX65mUDaMBCPCzIx
X-Gm-Gg: ASbGncuVFQbV1d+WR/JxN280IXQpGCaXKZPOfFEuksdgjUcfwdf3DulRqgQ3XNNVFZy
	T8Sl6nnEVUhuMkpOXb1sSSvehugP23ReOertaVkQEOlKklXaQGCokLSL1obOg5hbM5j8VaWDCOO
	vBwunIZ+cBpLnEx8ontHl5dr6G/Oc0sJjWbDc81t6X71sbmHUH5vaMd83tEgJxBhFcgDCdf/g/S
	kY3D3dPS1n3G85zt73FlwRDqIsOgTnC9KU7qpj8ZLmn7YljhAQlRVSlKN3vY4rVYXL9R5XQe970
	Segqtm4vuFE1+9DIj5zTnUWxX+S5Gv+sSVFrJb7GMVeZkJyjs2TJ5TcnwRhoug==
X-Received: by 2002:a17:903:2b06:b0:24e:e5c9:ecf7 with SMTP id d9443c01a7336-25170c416ebmr108420705ad.34.1757348982043;
        Mon, 08 Sep 2025 09:29:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE8/ux+pl7ggDeP2V1/4IdQKuSpSB/3AQUQSSiAQ4GvrfZVtuHWRtKw2FqRwI/7hSQpSYGa7Q==
X-Received: by 2002:a17:903:2b06:b0:24e:e5c9:ecf7 with SMTP id d9443c01a7336-25170c416ebmr108420405ad.34.1757348981586;
        Mon, 08 Sep 2025 09:29:41 -0700 (PDT)
Received: from [10.91.118.43] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-329dcc0af56sm19952353a91.24.2025.09.08.09.29.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Sep 2025 09:29:41 -0700 (PDT)
Message-ID: <dad0a37f-38b7-48b4-983d-fba265bc66f1@oss.qualcomm.com>
Date: Mon, 8 Sep 2025 21:59:35 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/msm: adreno: a6xx: enable GMU bandwidth voting for
 x1e80100 GPU
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250725-topic-x1e80100-gpu-bwvote-v2-1-58d2fbb6a127@linaro.org>
 <e7ddfe18-d2c7-4201-a271-81be7c814011@oss.qualcomm.com>
 <33442cc4-a205-46a8-a2b8-5c85c236c8d4@oss.qualcomm.com>
 <b4f283ce-5be1-4d2f-82e2-e9c3be22a37f@oss.qualcomm.com>
 <269506b6-f51b-45cc-b7cc-7ad0e5ceea47@linaro.org>
 <1727374d-0461-4442-ab35-9acb8ef7f666@oss.qualcomm.com>
 <df007b41-5c3d-4c69-81b9-27155485ccf9@oss.qualcomm.com>
 <pxigrjxtizcrhn4l25ph4yh4runebintfp4swqfiewfq5hqceo@g5cy3mdgjir5>
 <77db4861-4868-4110-8c31-eb2045ddbf4b@oss.qualcomm.com>
 <4fa44ec5-2792-45e3-af87-b3e4d2ed5d86@oss.qualcomm.com>
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <4fa44ec5-2792-45e3-af87-b3e4d2ed5d86@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAyMiBTYWx0ZWRfX6br94L8U5aD3
 KYocEZlbk7UAWWzis5DCZWNfvmvObkA4vg/mpENqLbVutmE21x36j70BRufFTGlg3adnGXv4gnK
 gb/4V1lKLYTIklNi1G1vB78r0Uhw9sx+txLcUP7gyilLS7Th7KFAzAkeoxmWf7f8iv6xN8lQyKN
 ojdiq1mEcHD+RXl5SD4/+iYOT+Y+/VjYMf2hIi90i5GZzpGLTIb+dI4uqgqe5DuP89bn5h9HEj2
 FaNOkKT7qOTLO5q41E0Ctnil7dbqhTuMxGYxAO6sR/hIrfOWg37pIhpPezCgb8nQCFGUrvK+0y1
 mUJNVsXfn+VB/I2eU/xac0Bva9RTtGFPy+2hhL84jdByE6tV+MsqG5H7MLeqwJcN+4SmljkD2Ca
 /FnQU0ub
X-Proofpoint-ORIG-GUID: lGjIuY52s6myefDa8lh81mS6Lu8U1VXT
X-Authority-Analysis: v=2.4 cv=PpOTbxM3 c=1 sm=1 tr=0 ts=68bf0477 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=KKAkSRfTAAAA:8 a=PfGohb2nDGJMFqWtIAwA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: lGjIuY52s6myefDa8lh81mS6Lu8U1VXT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-08_06,2025-09-08_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 spamscore=0 bulkscore=0 clxscore=1015
 malwarescore=0 adultscore=0 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060022

On 9/8/2025 9:52 PM, Konrad Dybcio wrote:
> On 8/18/25 9:17 AM, Akhil P Oommen wrote:
>> On 8/16/2025 3:45 AM, Dmitry Baryshkov wrote:
>>> On Thu, Aug 14, 2025 at 07:52:13PM +0200, Konrad Dybcio wrote:
>>>> On 8/14/25 6:38 PM, Akhil P Oommen wrote:
>>>>> On 8/14/2025 7:56 PM, Neil Armstrong wrote:
>>>>>> Hi,
>>>>>>
>>>>>> On 14/08/2025 13:22, Konrad Dybcio wrote:
>>>>>>> On 8/14/25 1:21 PM, Konrad Dybcio wrote:
>>>>>>>> On 7/31/25 12:19 PM, Konrad Dybcio wrote:
>>>>>>>>> On 7/25/25 10:35 AM, Neil Armstrong wrote:
>>>>>>>>>> The Adreno GPU Management Unit (GMU) can also scale DDR Bandwidth
>>>>>>>>>> along
>>>>>>>>>> the Frequency and Power Domain level, but by default we leave the
>>>>>>>>>> OPP core scale the interconnect ddr path.
>>>>>>>>>>
>>>>>>>>>> Declare the Bus Control Modules (BCMs) and the corresponding
>>>>>>>>>> parameters
>>>>>>>>>> in the GPU info struct to allow the GMU to vote for the bandwidth.
>>>>>>>>>>
>>>>>>>>>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>>>>>>>>>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>>>>>>>>>> ---
>>>>>>>>>> Changes in v2:
>>>>>>>>>> - Used proper ACV perfmode bit/freq
>>>>>>>>>> - Link to v1: https://lore.kernel.org/r/20250721-topic-x1e80100-
>>>>>>>>>> gpu-bwvote-v1-1-946619b0f73a@linaro.org
>>>>>>>>>> ---
>>>>>>>>>>   drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 11 +++++++++++
>>>>>>>>>>   1 file changed, 11 insertions(+)
>>>>>>>>>>
>>>>>>>>>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/
>>>>>>>>>> gpu/drm/msm/adreno/a6xx_catalog.c
>>>>>>>>>> index
>>>>>>>>>> 00e1afd46b81546eec03e22cda9e9a604f6f3b60..892f98b1f2ae582268adebd758437ff60456cdd5 100644
>>>>>>>>>> --- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
>>>>>>>>>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
>>>>>>>>>> @@ -1440,6 +1440,17 @@ static const struct adreno_info a7xx_gpus[] = {
>>>>>>>>>>               .pwrup_reglist = &a7xx_pwrup_reglist,
>>>>>>>>>>               .gmu_chipid = 0x7050001,
>>>>>>>>>>               .gmu_cgc_mode = 0x00020202,
>>>>>>>>>> +            .bcms = (const struct a6xx_bcm[]) {
>>>>>>>>>> +                { .name = "SH0", .buswidth = 16 },
>>>>>>>>>> +                { .name = "MC0", .buswidth = 4 },
>>>>>>>>>> +                {
>>>>>>>>>> +                    .name = "ACV",
>>>>>>>>>> +                    .fixed = true,
>>>>>>>>>> +                    .perfmode = BIT(3),
>>>>>>>>>> +                    .perfmode_bw = 16500000,
>>>>>>>>>
>>>>>>>>> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>>>>>>>
>>>>>>>> Actually no, BIT(3) is for the CPU (OS), GPU should use BIT(2)
>>>>>
>>>>> You are right that BIT(2) is GPU specific, but that support was
>>>>> commercialized from A7XX_GEN3. Anyway, the Win KMD uses BIT(2), so lets
>>>>> use that in Linux too.
>>>>>
>>>>> I know some docs show BIT(2) support, but lets not bring in untested
>>>>> configurations.
>>>>
>>>> Eh, then let's get the docs fixed if you don't trust them because we can't
>>>> work like that..
>>>>
>>>> FWIW this is information from per-platform RPMh cmd-db data
>>>
>>> If it comes from cmd-db, then we should be requesting it from the cmd-db
>>> driver rather than hardcoding it here.
> 
> No, what I meant is that there is a piece of configuration that reflects
> what goes into cmd-db as its compiled and that's where I found that
> information
> 
>>
>> Not really. This should be under the control of GPU driver.
>> BIT(3) is correct for X1E.
> 
> BIT(3) is for APPS, see the interconnect driver which also uses it.
> This will create conflicts and may cause unvotes when some other
> driver requests perf_mode through the ICC API, but the GPU is sitting
> idle.

No. GPU vote goes via a different DRV. So it is independent. Anyway, I
checked this further earlier. X1E platform doesn't implement any
perfmode vote. So both BIT(3) and BIT(2) are no-op and are ignored by
AOSS. ICC driver's vote too should be no-op on X1E.

-Akhil.

> 
> Konrad


