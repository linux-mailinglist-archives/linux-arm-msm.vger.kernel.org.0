Return-Path: <linux-arm-msm+bounces-71772-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 799E4B419EA
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Sep 2025 11:27:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 663AA20679E
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Sep 2025 09:27:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C8F12F0C64;
	Wed,  3 Sep 2025 09:26:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IM2RCMQj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86B012F1FC4
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Sep 2025 09:26:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756891589; cv=none; b=YzoElukS68J9JC14bEk2oBtO/KIKWj598JxKmCkFep+u1F5R/UUS9Mb49rh5FYFWzP8Z6x7eJulgriNIgFDD2LXs9tPXCqSnaRGQYyFV2KVMt9R5+9/yEp4AHXGURO1um1DY9PTb61C2PqSSuWhwkWASQDv8+OqDuuFJelN8kc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756891589; c=relaxed/simple;
	bh=10sA292kwL2A1iaOlb+UU/OrApoXHSI2mjwMRVd0G2s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZR8xtSJZhldsOQJUY/5Ll5bDJGptombcLKV2VPAZl6Saua7C+2JcT+lWQxY0QJ6oQt5MRamkaTWuP7gaOduaqBnZBHXI8IGDU6iHy+xrZ2/zpVwUY6XbhRZ7JTM/HpLImvCo5jPN4E+LHrAqkh4BI+hYk/FPAoKElxaI50aVfz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IM2RCMQj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5832Egsx024030
	for <linux-arm-msm@vger.kernel.org>; Wed, 3 Sep 2025 09:26:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UjHv5Rny7NYvIIV6SOi+RWSfsQ+PhjUoJoUt/TGYKPk=; b=IM2RCMQjbHLbuwvm
	2BmlzDGPZayYsO2J1lR9qLo22+LH1D5ZvmuGZAYEa8W9HqsGkDBEDlylPrQPBvIb
	YE6Uo0ykRkO+REHUELqP0sSvnEEDUBogf6jmygOCaVqcZPZ26w9qM3idbW9WfL2u
	ZVuQt/N5CtCLuZt38SaCCYbglU/f0VEwphCzt77mSgJZB9jop3y14cEb+tCeRk9b
	WqUKC/lvGQetvcIbVaty673cO/NdMVs1rsbj11RlvTocqg6/DzMBhiBZtftQBzmX
	zIBjkmxrDwKtY/819dqGMpYgQBCXSPgy4Wo1AT+NDRYTZNN5RqSHj+se4zm5EaEF
	8lSUYQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ush32vqy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 03 Sep 2025 09:26:27 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-715c9cad6f8so5521816d6.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Sep 2025 02:26:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756891586; x=1757496386;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UjHv5Rny7NYvIIV6SOi+RWSfsQ+PhjUoJoUt/TGYKPk=;
        b=qUTQavUKXUHVwU+sep5aJKEMv9Io6u1dKv2FvdaYFv3REiq8tmQ72x1QwajHP//LIH
         OQhszpdN7Gl1zOQr1Yjdgs5HtfiivsbPRDfIwb9YDfugiWUvJBB1spQTiEbEAr+XUV0r
         B8aHITdCo/4eBEac3Ek8dypAoV4XDKPRv8X67IUHgRi9Vztrbg3D3Yvg20YkkdnxZtj6
         991tGVD5u9xJWY+9Krzp0KDtevbVciIwuiwW4u8JpSfywuotBuvSOu4a1/kcgUHQNjjF
         7ndyhS4LVR6SHgnFNuQU8qaglVZNH2Wer5M+3NVhpUyuOO343YwqY/KkcwPb5aKiZNBi
         jhXQ==
X-Forwarded-Encrypted: i=1; AJvYcCUsvmlNrTI3F2gb294leQhGQ5MksxJmWa0nP8Nq7oZOybApvGAbkJJ+DPpJI3L3ifRI0EQVcDArExSkBKOs@vger.kernel.org
X-Gm-Message-State: AOJu0YyVvlIZZ9fxX+En2W3RmeRh0xLVJPbkwMiokU+pL75ycTez/0x6
	b/j9Z4r/MESOcv4Gan38oDWr2wFByF3eTAJdaojNtj2fC44UD8PFAWBvmW48T6e8n/Z11jgj4y9
	EyM2WxjE9Uevp3tVxbklUA0S+dWyuM1GiPWM9soyIYNJtnJBbMhen4NmTSWVwbxOSXGID
X-Gm-Gg: ASbGncvWyBtJF7MChWAEEF0GEm1zntb0cfRRdZoftCjET5rztPe4JrbM+5mtM0EFvpK
	3pTJfEir6PVLxYKSJGmkPhtbs8w/h1Lwq0o2th5AeIbuMa1b7yxxeBwLqIgnBxCnhRJ1GiXzOxZ
	PCx49OYCFezD8t5/4aG8VaybG6Yp/B1kzCXWEPa+ixOt9xiMSaU+tkoXCwVCd8fhFmieolx69Cq
	bAR6PLgNTf5cWfSm43yuml90wAHw9TEOg2X6BETCDG91n4YGkOA985XxA6jGbUpHMZb8UGpUi+H
	fk0KOMeh+jb+rh4y+U6B3BE50GCRsugHe1UCu3gFG9zDbTGCvKLDmTQQ/APkZMyFELbwkSicQ8u
	EPNjQSiGZUQty8he0W2IDbw==
X-Received: by 2002:ad4:5d4e:0:b0:70d:bcbe:4e79 with SMTP id 6a1803df08f44-70f5a5fae45mr157317986d6.6.1756891585970;
        Wed, 03 Sep 2025 02:26:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEnGodqLINHIr1ti5AIWKv/NvUfg7lci7ZbbtsKiF5IU1s9PYba1/SeEbO5pfCLhRpYbPSD1A==
X-Received: by 2002:ad4:5d4e:0:b0:70d:bcbe:4e79 with SMTP id 6a1803df08f44-70f5a5fae45mr157317826d6.6.1756891585382;
        Wed, 03 Sep 2025 02:26:25 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-61cfc1c7a27sm11650300a12.10.2025.09.03.02.26.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Sep 2025 02:26:23 -0700 (PDT)
Message-ID: <7382b6e3-3872-4e18-a1bc-b2c75c888a5e@oss.qualcomm.com>
Date: Wed, 3 Sep 2025 11:26:20 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] drm/msm/a6xx: Add a comment to acd_probe()
To: rob.clark@oss.qualcomm.com
Cc: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        Jonathan Marek
 <jonathan@marek.ca>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250902-assorted-sept-1-v1-0-f3ec9baed513@oss.qualcomm.com>
 <20250902-assorted-sept-1-v1-4-f3ec9baed513@oss.qualcomm.com>
 <694f0989-64ea-4c3c-8613-863da1dd286a@oss.qualcomm.com>
 <CACSVV037e-GquRk7P1_qT7T4HF=f-TF93FpJ16NiKShqicaCfw@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CACSVV037e-GquRk7P1_qT7T4HF=f-TF93FpJ16NiKShqicaCfw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAzMiBTYWx0ZWRfXxUw5BMyPViry
 bk5w4afobm2aZhLQ7Gqh3VV85flb5NSkv0mwziPCVxqvybXbvvavn+3gH2gro0uuLcdPBvqG1Wn
 4uaIHQ1C7pcRqv1i2TZqHfArcg7ZA1uwuvYUdRxcpF9rV9IC6ezAkP6ah7DmTku/N9VbVqJrL+6
 tfNIf+LOg56jH7JwtaGpw3lYvHyYnfKoMrY3xDEH5QchhlRAauza1KZHvZrLF684VN7sYjOfwgM
 HqR/1gNxA+C4rv8OgzGeiZc0UTnI1DRw3hckYko74cgt1gD1g2Yce0RNAjEDZBwc8zd+I0pREhk
 1HlvTIuCLz64yoVF19p9zPjC2Eaizg8B26P0ErPJWtS8zYEOvyN6koREyj6tUO6Pm9OQ34Elgkh
 48zXuqsD
X-Proofpoint-ORIG-GUID: 108TYO93n-ocNn8lYFrlYHcAvmjgyE1x
X-Proofpoint-GUID: 108TYO93n-ocNn8lYFrlYHcAvmjgyE1x
X-Authority-Analysis: v=2.4 cv=M9NNKzws c=1 sm=1 tr=0 ts=68b809c3 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=5-JTw_7GLCY5IPuysb0A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-03_05,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 clxscore=1015 suspectscore=0 phishscore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508300032

On 9/2/25 5:57 PM, Rob Clark wrote:
> On Tue, Sep 2, 2025 at 5:33 AM Konrad Dybcio
> <konrad.dybcio@oss.qualcomm.com> wrote:
>>
>> On 9/2/25 1:50 PM, Akhil P Oommen wrote:
>>> It is not obvious why we can skip error checking of
>>> dev_pm_opp_find_freq_exact() API. Add a comment explaining it.
>>>
>>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>>> ---
>>>  drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 1 +
>>>  1 file changed, 1 insertion(+)
>>>
>>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
>>> index ea52374c9fcd481d816ed9608e9f6eb1c2e3005a..de8f7051402bf0fd931fc065b5c4c49e2bfd5dc7 100644
>>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
>>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
>>> @@ -1694,6 +1694,7 @@ static int a6xx_gmu_acd_probe(struct a6xx_gmu *gmu)
>>>               u32 val;
>>>
>>>               freq = gmu->gpu_freqs[i];
>>> +             /* This is unlikely to fail because we are passing back a known freq */
>>
>> This could probably mention that known == we just retrieved it a couple
>> function calls above, but I suppose the reader can come up with such
>> conclusions
> 
> Also, I think s/unlikely/not expected/ ?  "Unlikely" implies that it
> could still happen..

Yeah, "unlikely" as in "cosmic rays" or other kinds of mem corruption

Konrad

