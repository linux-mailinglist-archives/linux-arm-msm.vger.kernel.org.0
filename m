Return-Path: <linux-arm-msm+bounces-58091-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A9C5AB8C2C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 May 2025 18:19:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 308EFA0639B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 May 2025 16:18:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DD8221B910;
	Thu, 15 May 2025 16:18:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BF3cvFgJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4F3C208994
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 May 2025 16:18:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747325917; cv=none; b=M1UqXaVdq8cxoeS1GQgRupNVELuizKFYwJ7FyiIND8VKrRSnA0eA2JpFo5t/owRJf6J+JzgHS1XOGX0HpJP3ga/9S7HpvpzvWN6E/zLs5kKhbS6FFzjGXxe5u/1/v3HNKwTEQQe3oC+ZbTPID1cWBhUbbERuEePoTaOzKG7ZrM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747325917; c=relaxed/simple;
	bh=2/kjnN8zQR+qtnayP7lkAqy0pxVPK2sXezwBc0V/tJ8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CpPvh28LDGTd0zmCUokPqWVSxymVgyMzc4MC9sMED+eNp1vqxSbh+xNpXVJk60AepuSraG0LztTeZ+XixYMajjPJN0cBZLSVkkP4Asfzqmlo21CpwgefHY0hBQmoIfTj6WzSaq30QhzkD/UWL6+iH4U3DbdvWXFO49GYkFxKvtM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BF3cvFgJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54FEFEfa001801
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 May 2025 16:18:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qX+FKmvWae7qk6ZxShDL/DRRc09xp5kjpRbX5MzVt+8=; b=BF3cvFgJQh0FUiNG
	Ha8PNY81gbzM3nBFoNq6K4IgbvECb3TRxgAcOYMl7gfyB3IPggYT6NQGz0z9iNjK
	C5wniCpHjaCmOw3V6Mv2HrL67z+CAKVcpInvglt7fpmpun1aMHVux4pjFBYy5xEN
	wnv77ppz+7FvqJzhA5T/EUghYpQfRXf0X1BstFeUqYdmfhdBY8PrqVNQC1thF3Xx
	tek/PPOqSgp5qE5SESZE+3YGyhEw6HZO0JwzI748WpvJ/2Aq9V4vtiDTAk11wrx7
	N6c8TyJZXt0frd/NXNaWuPlil6Aeu4qwVe3KAA/i38ydmfcoBjwM0ObufZmJt9wX
	k2HJPw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbcreqeu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 May 2025 16:18:34 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6f899c646afso3651916d6.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 May 2025 09:18:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747325913; x=1747930713;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qX+FKmvWae7qk6ZxShDL/DRRc09xp5kjpRbX5MzVt+8=;
        b=hcff07VTQXC7fPeAjRPaF0Uc79fmV5ed8Gl22x5sMDY6TZOk7DOBZfWjArgeeykIwL
         0YBhwKdNUAT/YmXsXaCBnj6VtME+iR1omqLLEfkr0NYQd7xQIBbBhHxFEVfU4TwvgcyE
         F+SI0ig7wuMFZ++X68Sd90rNz6eqV2PIw7FTKzUsxy5rYasCX1pSEo83g9gC4eUf2PnA
         7Q9n1v61Pd52+PSwGuW9roEWiFETFUgZ+xZ9hNc3ELOXPECp3TZk8wWadQb2hRaNRx3n
         LaEXFGm9fJrtMNO7pjyqigtlSciYUfx54C+jFjB56var9R2yty4fgswkv8GK0Eri/xwf
         4nng==
X-Forwarded-Encrypted: i=1; AJvYcCWBb6fx21qSafQAvCRJvVfzA+6evUVIeVs5Viy7iezWVt93bBApIKEcH9RuiWCjzmHg1ji1h36nrYw6USCK@vger.kernel.org
X-Gm-Message-State: AOJu0YySsSU5l4LfYsXOulPNECR+j7Tpvd2+M/X50+ql/qXiZG/kc4mJ
	VBrNevWAv0HFpiPd6iJIXBbrIKUYpAwWKFFthpdy04gVKw7JzXfqxYwx161WCYkxGKiGxWg5JKv
	1I4Fk5iB6zaH65jpBL5urAgrI4UJHMESemxV4l0OBw1YpCVvWXMH2zcf8/vIkVqCnOJQSzU3v9B
	zv
X-Gm-Gg: ASbGncvwo6MlzYcBlhg/F9ZCU/bjJc5rUi9See/AXNIbinVX4pUs1u1NciUWLcOlQoU
	9yuNLrDKyh4IBLWxUh0Db1R7975Kuy+q3vJHCoL1PRJM05BmJodAJh9D9R6qda7oIki198UB35t
	FjxvX8Vs2LJaElRwoQpCcToE1GhCha8NJHIUFyo5SekoghDvSD5dMEW31aFEdQpvIrIPCt6QnVd
	nhuZnU7JYGrpLbz378fDrhDD/82ntV0S8iB7yCnRAXCEGG7qyli4j8Peqr3pFrr4IDeJxwGFbf5
	8x69tXEtBMZ03fnwrvER9HR+0H72bHXAEqMwsrf0j47KbyEyG4BRbMJe1aVYUZKfAA==
X-Received: by 2002:a05:6214:f0c:b0:6e4:501d:4129 with SMTP id 6a1803df08f44-6f8b09398f4mr1585796d6.11.1747325913502;
        Thu, 15 May 2025 09:18:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEs5o7TMvuHlAVqEVKuzoLrDE2O7PdxwnnYC6+0RPVnhmYXHkLwqwBcqjjj6lsYHcU9JpqmmA==
X-Received: by 2002:a05:6214:f0c:b0:6e4:501d:4129 with SMTP id 6a1803df08f44-6f8b09398f4mr1585516d6.11.1747325912806;
        Thu, 15 May 2025 09:18:32 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad52d441fb5sm9987466b.108.2025.05.15.09.18.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 May 2025 09:18:32 -0700 (PDT)
Message-ID: <466148c9-2461-4140-9ba9-5a3427ec6461@oss.qualcomm.com>
Date: Thu, 15 May 2025 18:18:29 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFT v2 13/15] soc: qcom: ubwc: Fix SM6125's ubwc_swizzle
 value
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
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
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <d7417290-a245-422c-ba00-3532661ea02d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: vGlinI-VlbnVee7Sbq7176KiHDfohvC8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE1MDE2MiBTYWx0ZWRfX3xCEIl0E9Dkt
 vXgxBK3uOmCDOZmb1TGEk5RXUh5FNheIhs/4FJ/bIxoFE0AYU5TEJhRVBHlYvHnpRCoHS0vdQJw
 1SswKyjKsq6d7QiYpbRoWB3dkIAgLvnLEZClz8lHWQUvreOHbGIvUgMjNVEce99sWxSqyf4PxeP
 RTwmJmw56AmBmvp64W8z85inMzFVT7ZRYWhoE5NHy53yjGmh0xLgLz2FIBPa016kEa9Sg5ZfTEY
 ODOLnLtzUQiDKNihULo6cwYoZPCdOy60utQBdtvuiWxMa/vPkeBP8mKnme15KDgKW+f1Dpd9WRf
 a1iMIZmluuIwwPQijPdicjTi0TiNpC+A3Xnln4ROT3SPHiT7qcf8Xn0x6/MayyxNuLdvClM/2DX
 cLGT0ZfvQeh1ub/4cVAMlbEtF/PskeJBWcWttUw6/4iefxXzDqrYAi7Ph16Gxtc1XBtQBogd
X-Authority-Analysis: v=2.4 cv=K7UiHzWI c=1 sm=1 tr=0 ts=682613da cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=4UHGY1WjEP5fiMyc6oEA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: vGlinI-VlbnVee7Sbq7176KiHDfohvC8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-15_07,2025-05-15_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 mlxscore=0 suspectscore=0 malwarescore=0
 phishscore=0 mlxlogscore=999 clxscore=1015 bulkscore=0 impostorscore=0
 lowpriorityscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505150162

On 5/14/25 10:33 PM, Dmitry Baryshkov wrote:
> On 14/05/2025 23:05, Konrad Dybcio wrote:
>> On 5/14/25 9:23 PM, Dmitry Baryshkov wrote:
>>> On Wed, May 14, 2025 at 05:10:33PM +0200, Konrad Dybcio wrote:
>>>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>>>
>>>> The value of 7 (a.k.a. GENMASK(2, 0), a.k.a. disabling levels 1-3 of
>>>> swizzling) is what we want on this platform (and others with a UBWC
>>>> 1.0 encoder).
>>>>
>>>> Fix it to make mesa happy (the hardware doesn't care about the 2 higher
>>>> bits, as they weren't consumed on this platform).
>>>>
>>>> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>>> ---
>>>>   drivers/soc/qcom/ubwc_config.c | 2 +-
>>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>>
>>>> diff --git a/drivers/soc/qcom/ubwc_config.c b/drivers/soc/qcom/ubwc_config.c
>>>> index 9caecd071035ccb03f14464e9b7129ba34a7f862..96b94cf01218cce2dacdba22c7573ba6148fcdd1 100644
>>>> --- a/drivers/soc/qcom/ubwc_config.c
>>>> +++ b/drivers/soc/qcom/ubwc_config.c
>>>> @@ -103,7 +103,7 @@ static const struct qcom_ubwc_cfg_data sm6115_data = {
>>>>   static const struct qcom_ubwc_cfg_data sm6125_data = {
>>>>       .ubwc_enc_version = UBWC_1_0,
>>>>       .ubwc_dec_version = UBWC_3_0,
>>>> -    .ubwc_swizzle = 1,
>>>> +    .ubwc_swizzle = 7,
>>>>       .highest_bank_bit = 14,
>>>>   };
>>>
>>> Add a comment and squash into the patch 1.
>>
>> I don't think that's a good idea, plus this series should be merged
>> together anyway
> 
> Well... Granted Rob's comment, I really think the patches should be reordered a bit:
> 
> - MDSS: offset HBB by 13 (patch 2)
> - switch drm/msm/mdss and display to common DB (patches 1+3 squashed)
> - get a handle (patch 4)
> - resolve / simplify (patches 5-10, not squashed)
> - fix sm6125 (patch 13)
> - WARN_ON (swizzle != swizzle) or (HBB != HBB)
> - switch to common R/O config, keeping WARN_ON for the calculated values (with the hope to drop them after testing)

Does this bring any functional benefit? This series is unfun to remix

Konrad

