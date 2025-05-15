Return-Path: <linux-arm-msm+bounces-58092-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F3E14AB8C33
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 May 2025 18:21:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7F311165326
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 May 2025 16:21:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 539B514B092;
	Thu, 15 May 2025 16:21:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Qzhs6woK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEA00145323
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 May 2025 16:21:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747326072; cv=none; b=csLqcOplVZdAhOyAK+9F6WSCupJTbFBU/LYiBWS5z6+RgnwCnPbV4QiAN6dXXp7sSfFB/Fdu0J3tkJwZHzsKyyc20EgnDY3i5LMHP7Yy2N19pHLjjC3dcFCIYs8VEWq/T5usUpcGlf6VeP/DxVZ4MI7WDHKCt6ljVhxBZ+QPtW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747326072; c=relaxed/simple;
	bh=OdV5xtby0NaZtkm8ktq0lFOKdk3sTIFj5kO3sjL0nVE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NIXb+dTGoYWj9ifXLXaZGc6nM7lrYOm+A/d95uVBQra9nCS5T8dV19kfLtjwDDt9KkSWlH6tWs4xRPOxcWKgsgkncOwOUUlRBKg8pWmoV8nbngNsWyUA90/9vU7sduE2SfVc2QEy/1Dp65/rSh6tKMZKqdHDjvnc+RRn1hmtHhs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Qzhs6woK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54FEFFho031488
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 May 2025 16:21:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JTTwAwIwQWjmD8gLCq4Q+1jUTZITLoJMG79zsA19CmE=; b=Qzhs6woKqgLcQM4F
	mo3bSRNGgibENom+M/j8TlDg+uKulhCrhAa71MSSZxBpQZUZ3z/0aLoT0kbfBtdf
	+lMZ8I+/nLGHa23jAiWkuyYhGHz9XXz4Aok5pddGEOoK1w+bhY5ltH6RPAH79Mqv
	NZB6EQ6QBKK+sGTuYkt/HOgG/2yHkFb/KyCJD3/UTwwSCKDaK7YKggtEO/e41tkZ
	ib+NahtjwEukfPr8GpHJ4BW0R1uqd6wS1PyjlXxLmP2f7TG80CNeEpU6JMu3mE4U
	wcKhdE54Sx2jUuWuWIkmsLeCc2u15HR6cV9/oosEbUMue8gpXr+rcVv9OoAmM++o
	c+xYKQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbcr6pfa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 May 2025 16:21:09 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6f54244bc32so22302156d6.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 May 2025 09:21:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747326068; x=1747930868;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JTTwAwIwQWjmD8gLCq4Q+1jUTZITLoJMG79zsA19CmE=;
        b=X4B+EEF9P9ivhOSNr7bF6Tfud6V+ES2WCky2iGz7F26K+bW1vrJYN6EcJussK/SCkl
         99PtqHOWTuiwKu43RF3cIa9MM7rny0hKFe9nV+PPycrfR4EWT5chUfwWZZdent9qndfe
         uw4Hx6lb6SMLvJiW2XdyrDHt9J3ZP5U0ZGHRJb8d95xkhJJKDjyTWE4qoXiTEQq6pEUK
         AAX5I0ws2aCLTRNQJLrYA+CILzJqGZCLLM0pwxxdjTOiMQJZwii3Kb0N6ESIg5csi8J2
         MpSuTcGAAsNsYCL30hoL9jjEfusuTHWAPqDx2LRj7wiI0r/IbClSyWLe/uK5+PGe5M5t
         pGEA==
X-Forwarded-Encrypted: i=1; AJvYcCVljYu69mXcbhxko+v9bxoCSLuhxwK+/3A5sRDe6CyM3yA38aARFybp/ZasNoIzSNthGTWIaX600CGXk19S@vger.kernel.org
X-Gm-Message-State: AOJu0Yzc4YclwRVwvFkoDEud8uCI2XP/DYYaL6mqQ4r6bNrLSSx3ckmr
	RC70R7Khnhxfk/138Mrp+edmXEeB6d6bSRA3dFGxl+zX/k5OO6JhMaBWC/qV1kMkMHPLli+F1h9
	rrZS72QjOJKyUM9ChyDrJxcf6gz4E+NN97S0l636hiLSkH2Xh4KQVbLy+GxBZbCMwwo6+
X-Gm-Gg: ASbGncudxkcGxYW+8Z6+x04gXrQhjIzFnm3/+J4r0gZq3KHqQ0RqZkvUWbclkBzdFGJ
	wQudhfqCU/HaHH4Eash0r95lY//vOhCwAONE5/Pj8sClkrCWhYL49xVPfyJF5/r4dwkc5y40RYz
	/rHeKrfcEpMo2zWFOrvT41LA4+cHKV7hBXs/KhUAfhHn/2nUhrLGxukLSDvVC2GLKQqGqZpfBom
	RxbZUNmjI1qE8ZxYZGKZQsZ6WEE4LssbGKfSJUsFnEghOXMFA/HL859L/mfw8JgnGmyF4RFUvxv
	ZW8+rHzuAZ1HQsN8N2JEPHyEn6+FGARlszWbbC9fYQDX6AErbHYSRwYBHrywgz9OIoIFJIsmZ1b
	LYc0IbaB+gj7O0A==
X-Received: by 2002:a05:6214:2602:b0:6f4:c422:53e6 with SMTP id 6a1803df08f44-6f8b083535dmr5196796d6.1.1747326068428;
        Thu, 15 May 2025 09:21:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IECqqbNfcUEPKfdTCgqfKl4Z0zZC1Q0WBDRWwk2WXOPhNGQkHsa6MQR6aSQ0s64MqRrX5qcBg==
X-Received: by 2002:a05:6214:2602:b0:6f4:c422:53e6 with SMTP id 6a1803df08f44-6f8b083535dmr5196206d6.1.1747326067958;
        Thu, 15 May 2025 09:21:07 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0c3:3a00::4c9? (2001-14ba-a0c3-3a00--4c9.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::4c9])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-328042e18a4sm1346261fa.14.2025.05.15.09.21.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 May 2025 09:21:07 -0700 (PDT)
Message-ID: <4ec678b4-9e69-4ba0-a59d-f2e0948a73ce@oss.qualcomm.com>
Date: Thu, 15 May 2025 19:21:06 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFT v2 13/15] soc: qcom: ubwc: Fix SM6125's ubwc_swizzle
 value
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Akhil P Oommen <quic_akhilpo@quicinc.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
References: <20250514-topic-ubwc_central-v2-0-09ecbc0a05ce@oss.qualcomm.com>
 <20250514-topic-ubwc_central-v2-13-09ecbc0a05ce@oss.qualcomm.com>
 <lkkwnmnk32igcev3gykmtxsohyskj6ehylaypg2dyxbedvksee@lnuc4lfmzrkm>
 <9a05d545-1bf2-4f66-8838-b6969ba37baa@oss.qualcomm.com>
 <d7417290-a245-422c-ba00-3532661ea02d@oss.qualcomm.com>
 <466148c9-2461-4140-9ba9-5a3427ec6461@oss.qualcomm.com>
Content-Language: en-US
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <466148c9-2461-4140-9ba9-5a3427ec6461@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: NxvOlQd029iHrOKbd17DEfzy_Aku9HD6
X-Authority-Analysis: v=2.4 cv=Auju3P9P c=1 sm=1 tr=0 ts=68261475 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=GOhw9KrRKE3HJMKjvYgA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: NxvOlQd029iHrOKbd17DEfzy_Aku9HD6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE1MDE2MiBTYWx0ZWRfX3mJ0jTlQZ/c7
 Fujglw+TYoKcW5z2GqtYhYHca1HNU6GADcwVRezw3A0rb5RUvtNJGyhQGtWHMuCio6cAaUHXYLH
 HpjhVzUEsWIdzhkggkBBekfEx/C0d3fI1/rYR48sTsU5YK9tiLltFPFqxVpRFuWOnnLYw6rYT/B
 2D3NZkjju5K29HNWJdhN2f9b3MjgJecbdnZNvHwihjzfK/Qk3IBXPa8Lr2eS6VVEL2BzdtI5wIU
 vpbAdXd0WlxXfteEWNmkIntQoWWUyHecklvI/X33396NkAkS/PCm0XsucrlGgTl8ifFEjN8eHtn
 7DKN/TqO1dg9RWrfoFQGf5TSJ/GguMnvZfwcBevsdENXLvj/TjSKpmdXWCferpDyIKXCNTUyZHA
 aB7ojd5o+0iT450QX7rRcvXNDcUt4JfRzVnHH1iEHUcQOjgCXwR9Au1eZwIiWGkNa5y+4B8l
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-15_07,2025-05-15_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 spamscore=0 impostorscore=0 lowpriorityscore=0
 malwarescore=0 mlxscore=0 adultscore=0 priorityscore=1501 mlxlogscore=999
 phishscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505150162

On 15/05/2025 19:18, Konrad Dybcio wrote:
> On 5/14/25 10:33 PM, Dmitry Baryshkov wrote:
>> On 14/05/2025 23:05, Konrad Dybcio wrote:
>>> On 5/14/25 9:23 PM, Dmitry Baryshkov wrote:
>>>> On Wed, May 14, 2025 at 05:10:33PM +0200, Konrad Dybcio wrote:
>>>>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>>>>
>>>>> The value of 7 (a.k.a. GENMASK(2, 0), a.k.a. disabling levels 1-3 of
>>>>> swizzling) is what we want on this platform (and others with a UBWC
>>>>> 1.0 encoder).
>>>>>
>>>>> Fix it to make mesa happy (the hardware doesn't care about the 2 higher
>>>>> bits, as they weren't consumed on this platform).
>>>>>
>>>>> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>>>> ---
>>>>>    drivers/soc/qcom/ubwc_config.c | 2 +-
>>>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>>>
>>>>> diff --git a/drivers/soc/qcom/ubwc_config.c b/drivers/soc/qcom/ubwc_config.c
>>>>> index 9caecd071035ccb03f14464e9b7129ba34a7f862..96b94cf01218cce2dacdba22c7573ba6148fcdd1 100644
>>>>> --- a/drivers/soc/qcom/ubwc_config.c
>>>>> +++ b/drivers/soc/qcom/ubwc_config.c
>>>>> @@ -103,7 +103,7 @@ static const struct qcom_ubwc_cfg_data sm6115_data = {
>>>>>    static const struct qcom_ubwc_cfg_data sm6125_data = {
>>>>>        .ubwc_enc_version = UBWC_1_0,
>>>>>        .ubwc_dec_version = UBWC_3_0,
>>>>> -    .ubwc_swizzle = 1,
>>>>> +    .ubwc_swizzle = 7,
>>>>>        .highest_bank_bit = 14,
>>>>>    };
>>>>
>>>> Add a comment and squash into the patch 1.
>>>
>>> I don't think that's a good idea, plus this series should be merged
>>> together anyway
>>
>> Well... Granted Rob's comment, I really think the patches should be reordered a bit:
>>
>> - MDSS: offset HBB by 13 (patch 2)
>> - switch drm/msm/mdss and display to common DB (patches 1+3 squashed)
>> - get a handle (patch 4)
>> - resolve / simplify (patches 5-10, not squashed)
>> - fix sm6125 (patch 13)
>> - WARN_ON (swizzle != swizzle) or (HBB != HBB)
>> - switch to common R/O config, keeping WARN_ON for the calculated values (with the hope to drop them after testing)
> 
> Does this bring any functional benefit? This series is unfun to remix

I know the pain.

The functional benefit is to have the WARN_ON and side-by-side 
comparison of common_ubwc_config vs computed ubwc_config for HBB and 
swizzle.

You can say that I dislike the idea of copying & modifying config as 
this is the code that we will drop later (hopefully).



-- 
With best wishes
Dmitry

