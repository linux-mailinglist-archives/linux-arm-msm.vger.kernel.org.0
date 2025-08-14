Return-Path: <linux-arm-msm+bounces-69282-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 314D9B26CB1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Aug 2025 18:41:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D3DA45A1D4B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Aug 2025 16:38:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6AD052566D2;
	Thu, 14 Aug 2025 16:38:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DgD3YFgW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 950FD32143E
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 Aug 2025 16:38:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755189516; cv=none; b=S7HqkKklhiWansT9nxpCpFhGqfPmEQmROLnRaTshonWuIpceP0JzBes3li1SjvUw+iPxo95nsbbhxM0NdQ9mw+0BoIhw/i55fzXRMoso6yjz/CNLCNnQcXYUb+ixfPld2jXC6opjYnqRqFd31njhLJTevnUcsgL8GGuhldxZ3lQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755189516; c=relaxed/simple;
	bh=9ANSziEU7LiyMu+M2PSkJh95p9gLb+UL9MxA+IfBKBA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qPcZFx3V+t2n/Dm0KMRNjhyjOLLoNn+s54JGDkjAU1IVkggTcy2hfVN2QOQRtfyHuWZtTB9Ss9pyVdLVRcavVjSrkkIJFGyxRIf+lt27t2uB7eBE9MAnaf8JGtC6Xr8/sv2Z1UNJnZ819CqS4BAilzgUetZFvosObzYiqJSbR98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DgD3YFgW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57E9l5Sv029470
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 Aug 2025 16:38:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jaTQfIJ1yVIsO9S61XfkZRmWT+mBRLlhDRy6dXJpoxk=; b=DgD3YFgWJFQFRh1m
	hGf1+FIo04Co6vUTW+fhtdIbSuyhnAGxW33sLBlzoDM7UglZcHUvJOG9+3DmxE9/
	8WKWrvmWg60Q17oFHxtnY9Wvqm98uZnTDd7/IFscWIwC9Mv67pqmfNKMocrL1MhT
	DDSFiZAOLvv3nPg/OMRJJlVqaHhOLZ0XC09/Z1WrWrXdQPb8h6T+9XxKkOBl71s5
	ASLQPsYfyMZdbGIeGJSyy/5Ksc7dvyNsatzr6cRVqr3hJ6ZeSvn2ndrWF1uEUh6p
	O27e9tRl4i/oTTApczcM1e3J4c33c/iw+/GXyK5F45RmtpAaTIrXOLmatCmftUUN
	V82GWQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48g9q9yg07-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 Aug 2025 16:38:33 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-321cfa79cb3so2089102a91.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Aug 2025 09:38:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755189513; x=1755794313;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jaTQfIJ1yVIsO9S61XfkZRmWT+mBRLlhDRy6dXJpoxk=;
        b=fnL6j4Rwz0RUgxSSZig4W9S2sRvx9fVimFL4IXH/aze6wydPV84WiRUjJd5TGcen9q
         LJFbbdS/Y375Af2c1BvVop28MaVbHBCiJbIKQeRiPm76dWbhM7wBqmxVqTMbxefqElF6
         VEdJCPnFRU08NhGL0Ub/gKWJ80m7WTr1U64VgKnCafZNMIAjET5R6pDYAbusOXTbP2wx
         HsI1hx9+b2qcVU4FJ5efrcG+9907Ei3ytVy6uOhZ9mJOSYjq4wZDzlJxFNeNI2Uzfb36
         H324R216yWiR0dnC5MuzSVgygwTEd7SMf1RZ5F84Zq8zTVIKh21a8CTpB1EthNxnmvct
         RNjw==
X-Gm-Message-State: AOJu0YwUq+rfrkw2ytti0Cu0KQlXUTr2iArPMkgIUHbfN0o3sSBr45Yf
	n2rnIO6pZC8ZXR3M55+tJMWuTAm3/yXwCjaRIHxnsdOKz/9DWNz4wuB1UqrNYEWNvL6omxKp3DE
	i0qrUhN7GgTU/55x4yCjDqEuCNHVbFpxb1rsmA7Rf/uHkApnfZOQ60xv7wDzIf7maJofX
X-Gm-Gg: ASbGnculo5jxVFZkh5PogHv7WZCkTAJ6wuWZXaZP4G6d/7xiNcmFvmRCdiDq/Zy/Ebo
	yqpa3hZNn5LwdA7xsvZLGJNEEBkIupd8imNXGLavjGDkKD/6MSdZUpsbm0weIjGVFRpeH+n1ys4
	YAxtvctKtMqwsyHEAQtZucmYeoyD7etLEVG0FyBNCyCKxdAa9bU1wvcBz6Z5wagOD/Cx0mqSx53
	aoEUuenfH+nQjlnRVy1pNP/ZPK4XOT/NTo4wiX3aIhNKGHUmxHRviv39wbvLaqk/XT53xLc9DSu
	FiH1JODcTaQ2rXlyXNMEvU5awnzIg1R+UhX4d6llObjf+P0wITuNKfrvdR1fkGE=
X-Received: by 2002:a17:902:d483:b0:234:1e11:95a3 with SMTP id d9443c01a7336-2445978c8ccmr56761415ad.13.1755189512848;
        Thu, 14 Aug 2025 09:38:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFA5KjhREwZxocKHlp81qbREqS5IgYM2U1497mlRdma3ow5tbSm83x7BFjlpFu8sePsAp2J/g==
X-Received: by 2002:a17:902:d483:b0:234:1e11:95a3 with SMTP id d9443c01a7336-2445978c8ccmr56760915ad.13.1755189512299;
        Thu, 14 Aug 2025 09:38:32 -0700 (PDT)
Received: from [192.168.1.5] ([106.222.235.33])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-24300f8c9d1sm71788655ad.129.2025.08.14.09.38.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Aug 2025 09:38:31 -0700 (PDT)
Message-ID: <1727374d-0461-4442-ab35-9acb8ef7f666@oss.qualcomm.com>
Date: Thu, 14 Aug 2025 22:08:26 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/msm: adreno: a6xx: enable GMU bandwidth voting for
 x1e80100 GPU
To: Neil Armstrong <neil.armstrong@linaro.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
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
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <269506b6-f51b-45cc-b7cc-7ad0e5ceea47@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=CNMqXQrD c=1 sm=1 tr=0 ts=689e1109 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=geSN8yY6MFID4zSGlH7RRw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=KKAkSRfTAAAA:8 a=7lXMnOvvf2IE2kTxY-AA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: xHLVTKzF4xbRTvw7eZjHtgxUs_aL10KJ
X-Proofpoint-ORIG-GUID: xHLVTKzF4xbRTvw7eZjHtgxUs_aL10KJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODEyMDE2NCBTYWx0ZWRfXx0xP5CJqxbfi
 lJvPpMkxX8sBVGOlzifOZfxBRBv7dKSpHvaGOs4FMw6sr4Esdj6Ol1RCXbwNg8cPjLsGDbjDN2l
 XGPopbT0S3BTewiWkcp5yEbXeT4RcSa18mABHsV8INaTlBBsF3WqnqcHrYprpF+ld9f8Gg7o4ug
 /REOhEUfjh9fmdV9yxSnCv5DtQe7RFwGYktofbWr1f1817rXIH9zvOF++qKgr9Dx0pQ/Hwpx6bP
 cqWtVyf0uTGIPie7CzoCgQZUtBhxlUnenBYell4SSJdVjifxNJ6FTMiKNLCPOsd+imjSwXTRz5d
 vKudIzQUg2j/dElQ9wQ9NioBqUFv/2ThuvSl9tms/sHsISBUA/d1rO4idu1GsG2pLUN8FpyKQqM
 5NhkIsll
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-13_02,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 phishscore=0 bulkscore=0 clxscore=1015
 malwarescore=0 impostorscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508120164

On 8/14/2025 7:56 PM, Neil Armstrong wrote:
> Hi,
> 
> On 14/08/2025 13:22, Konrad Dybcio wrote:
>> On 8/14/25 1:21 PM, Konrad Dybcio wrote:
>>> On 7/31/25 12:19 PM, Konrad Dybcio wrote:
>>>> On 7/25/25 10:35 AM, Neil Armstrong wrote:
>>>>> The Adreno GPU Management Unit (GMU) can also scale DDR Bandwidth
>>>>> along
>>>>> the Frequency and Power Domain level, but by default we leave the
>>>>> OPP core scale the interconnect ddr path.
>>>>>
>>>>> Declare the Bus Control Modules (BCMs) and the corresponding
>>>>> parameters
>>>>> in the GPU info struct to allow the GMU to vote for the bandwidth.
>>>>>
>>>>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>>>>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>>>>> ---
>>>>> Changes in v2:
>>>>> - Used proper ACV perfmode bit/freq
>>>>> - Link to v1: https://lore.kernel.org/r/20250721-topic-x1e80100-
>>>>> gpu-bwvote-v1-1-946619b0f73a@linaro.org
>>>>> ---
>>>>>   drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 11 +++++++++++
>>>>>   1 file changed, 11 insertions(+)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/
>>>>> gpu/drm/msm/adreno/a6xx_catalog.c
>>>>> index
>>>>> 00e1afd46b81546eec03e22cda9e9a604f6f3b60..892f98b1f2ae582268adebd758437ff60456cdd5 100644
>>>>> --- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
>>>>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
>>>>> @@ -1440,6 +1440,17 @@ static const struct adreno_info a7xx_gpus[] = {
>>>>>               .pwrup_reglist = &a7xx_pwrup_reglist,
>>>>>               .gmu_chipid = 0x7050001,
>>>>>               .gmu_cgc_mode = 0x00020202,
>>>>> +            .bcms = (const struct a6xx_bcm[]) {
>>>>> +                { .name = "SH0", .buswidth = 16 },
>>>>> +                { .name = "MC0", .buswidth = 4 },
>>>>> +                {
>>>>> +                    .name = "ACV",
>>>>> +                    .fixed = true,
>>>>> +                    .perfmode = BIT(3),
>>>>> +                    .perfmode_bw = 16500000,
>>>>
>>>> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>>
>>> Actually no, BIT(3) is for the CPU (OS), GPU should use BIT(2)

You are right that BIT(2) is GPU specific, but that support was
commercialized from A7XX_GEN3. Anyway, the Win KMD uses BIT(2), so lets
use that in Linux too.

I know some docs show BIT(2) support, but lets not bring in untested
configurations.

-Akhil.

>>
>> This is *very* platform-dependent, goes without saying..
>>
>> I see BIT(2) is also valid for X1P4
> 
> 
> I'm confused, Akhil can you confirm ?
> 
> Neil>
>>
>> Konrad
> 


