Return-Path: <linux-arm-msm+bounces-86904-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8810ACE898C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Dec 2025 03:51:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B7507300E786
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Dec 2025 02:51:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 427672D9EE3;
	Tue, 30 Dec 2025 02:51:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ISLuFuLP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hhHXmuyg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86BB41DED4C
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Dec 2025 02:51:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767063071; cv=none; b=qiiT0NkwBWxAuXwJDV6CgjC478c+JOfuEiZPUn+R5uRWYD9oI4Ot9LQjz7sepzMg9CEEZdPMUgP2Hscz95infum6dIayVb3qxnaXlkkayeBUHewwDNdhsF27vnYc2YkMKZc9YxuBrjlKqJ/V1EN2opF1KwsMviH1+gE57czaaYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767063071; c=relaxed/simple;
	bh=ObOFyByshmjKwRlPR9hg6l4OLsEM+eJp+3uBC0YGokk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hK8U8VGWFzUgsDhVzPjl++vlgdKeOdL84yrlxdNPqRdSTvoen7JINJFJydJVeKpOBGsShv+wJ1bELf4E+RNpbZyqba6zvNCb7g9CBBKJmuQKshlppuks4f57wke3SeZakYhR5tXH4znG+c15vXBPFiI3x7+LrN90Hguv4q51hMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ISLuFuLP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hhHXmuyg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BTId3cV2288651
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Dec 2025 02:51:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+rUc/e3E9ZSswwiL4DZymVorpQAEBtWThsFqfoKpRKg=; b=ISLuFuLPFTRyDiQY
	hKH/tJKBDxb8ZXBdvA+8q/Owt7rk3on7NC1+i/J0pDpjcCVUDL280i3Cw59OIMlx
	2O5sFBr8RB0Ei9gRDxEn+9HQ5wCa45m6RdloPypjxzCbPtzlDHu17AYZOqOGVnMX
	sivVUAzwjtOdWY9F/N2Wkbz3zkGzsFe/oh4xaYO4kyQNaEoC45hIYTsSW0CHAIV0
	H90CvnOiC+ZNiitvPCBib0L5gTbX4mKSmL4gZzvulj5DzzQSCHtc6sMMYrGs3Vph
	PASJMS8UaN8n7g24mQddkrqQ+pxyD11uW3bin2yBSt73QgJkmUplXYmyOnbINVL4
	dDrOQA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ba87bwxfh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Dec 2025 02:51:08 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-29f8e6a5de4so131007205ad.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Dec 2025 18:51:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767063068; x=1767667868; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+rUc/e3E9ZSswwiL4DZymVorpQAEBtWThsFqfoKpRKg=;
        b=hhHXmuygepacFvaWcqkrYsvKr5UX0Oxuet/DROXgdqwC9vXnkW8xl6fFCz99NeOnfx
         vjxIrZHjG80qf908YNanj++o5kEGFZk8NtvFvNLExar2fZ4O3n7ZXbwAp+B0/khVnSRF
         CfuiWBj5Vu3ynQbe+D8LHiuhs/yUUC+3A6QKKKVol5N75vM79a7NRX80u5Ukza6KCetr
         7U9XnyZ68LmfaP+20NuMTM6VNmiYTCwLe+8NBJbyqdtZ3sW9bLEipsI7ZwFcchpc871T
         z+XI9Ked7te4IROfTLz4L6aspJYkSvyypmFImvGROkzllbtNupT9lfpwmY5ojiYKbMG8
         m8FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767063068; x=1767667868;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+rUc/e3E9ZSswwiL4DZymVorpQAEBtWThsFqfoKpRKg=;
        b=J77qAZd7R/m6G+SRh9zMJbUtm2mhR6mfTXq28WuosfogBh260ZYWBQqG3pYod67C+H
         U1SC/5OdNd7VshQzORU5ax53Fc0h8f78UBLZZQNkhcloBZs/w7lgoMXhlvfrX/szKagc
         fOfc4w3DAPoOtaA/BptHwl3Oa2SRWnuynxFrotke87zsR9ayvdHdRbH0kzS28qNyBEAR
         zVA8pfuYGa7hedW+30obA42D8C7TdEhYNFXewlbpXy32gw5ShiABglpBqXdDl2zE6yBi
         TS44b3dYD8f1702ZZYrj4A336GyscA/KitZiyfE5UC5emfRA1v2eQHM+RA+XJ0f+zLNr
         ZY9A==
X-Forwarded-Encrypted: i=1; AJvYcCVN5Eh4dJcAj+f+a7QH1z8b47c2S6ZSsH0nVCTKmj9rjalbjHYVzXg0xXGdNHCDByFGpu75/2ck9egbjBF8@vger.kernel.org
X-Gm-Message-State: AOJu0YyLY7cfKBPzrS0sZw4jl8CjHHtQAEkAJnz4F/Fd/JKvMOgdEAaS
	hgGkrH1l+IL/Ai0iNDlJUyg/lpDRv+3bNjRK/p9WvAjYxNqjq/hulO+bKS+mYaKotKAQeWxi+KL
	JJWCBHFf4aQhuj+UdEZep5hPooQuKL+4+EQbnTt1P0HtwUvgG2ksWCAwQLcOxuq0rgOGl
X-Gm-Gg: AY/fxX57OwvSxQkHZvLYU2BwKXLMRLjj+On395RAUx8aQhESweup2ce1nt20TQTUO9c
	deJvVPDA+S7NCTVQ+Yx8shqY4DFFfM1VIgSgNB15PMygeuUir2XqdUfol2nFWKx9bKfglVH0rk5
	8+wifZA27dkVPPJJvTMvwLMkJB0/8wOlKeEx97SxxK9e7YOCsEWEfcTKSHksfIg+Zu37q2QVfG+
	6mmG8oMJSLWNWQpbF7UI8K3byPxD9dpRwdS+AASe6ObfcwLLe7nJrq4Ym3UOR4JWf8MdPIrWLi2
	zetXs9udhSfr7e0TnjqRXS36GLYZX+FiyksUF6fS5sMl0F/0Qc6uaVn3lM8AFr0faSWa/5xCwqA
	UUBkIPmjB8ezm8X/CDCSUrR21pkZlaDgmOKrsHn7hNF1mJMw3rCcl+5x3swN39PAOFA==
X-Received: by 2002:a17:902:c950:b0:297:d4c4:4d99 with SMTP id d9443c01a7336-2a2f220d3ecmr359575695ad.6.1767063067984;
        Mon, 29 Dec 2025 18:51:07 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHd/nVv47KUg4jDJq/bOU4T3gN9b1wKRUq91S06v1YpKCNSC8SO5upnVKECiwVvuxK1z2I/JQ==
X-Received: by 2002:a17:902:c950:b0:297:d4c4:4d99 with SMTP id d9443c01a7336-2a2f220d3ecmr359575485ad.6.1767063067454;
        Mon, 29 Dec 2025 18:51:07 -0800 (PST)
Received: from [10.133.33.16] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3d4cb3csm288644965ad.58.2025.12.29.18.51.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Dec 2025 18:51:07 -0800 (PST)
Message-ID: <9804a98e-ffc0-4346-8b49-0d7670e150ec@oss.qualcomm.com>
Date: Tue, 30 Dec 2025 10:51:01 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] Initial patch set for PURWA-IOT-EVK
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20251222-purwa-v1-0-14ab9316e5ff@oss.qualcomm.com>
 <dmdtwsdwl2bl7mn6j4d4xv76h6bo57van3ni4zt3iapq5bonsp@rxoqan4nahud>
 <d8642ba4-9a6f-4fb2-bd0c-419ead2630d3@oss.qualcomm.com>
 <0593cc2e-0114-404f-929a-0860d60afefb@oss.qualcomm.com>
 <d15c68bf-1a34-4024-b508-dc3f2676cdea@oss.qualcomm.com>
 <9648b69d-bec8-4f4e-8db6-b94972971454@oss.qualcomm.com>
Content-Language: en-US
From: Yijie Yang <yijie.yang@oss.qualcomm.com>
In-Reply-To: <9648b69d-bec8-4f4e-8db6-b94972971454@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: RHg0QpBlZh9_Gzqs4cULhQX0ngXSsgc9
X-Proofpoint-GUID: RHg0QpBlZh9_Gzqs4cULhQX0ngXSsgc9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjMwMDAyNSBTYWx0ZWRfX6/FBX2+p2629
 pOAWNDkHAXAAfeFseqIqtQRc/0zi5R6KqGE/Czl7LSQYRWupITqyp5q6sBVJT+XbKeAjSudW+Xy
 f4fxRlEIYB6eWoFpsy3I5U0Jlbl0RBFoV3A7JfCGcJIpiZst0DbmlkY5dY3OZJYYkQp5AcPhIxP
 5JQGhUclCmRUeyv3yAWeIPYyURT9uh2+0rYvpUuuLWoDVDFEHr1wVGeb17Laai1pYO4fXu7R4vJ
 ypzlXNA+Lg08OKhi7wCCwQD5qCQexueDwJA4c2XwM4fcmb1LguS1+jKS4i2yu0kGBNMZ8781ksM
 mTBJbN/4plHj2tYkolC8HYxyE5JsfZSXQzWCxHIRWOarg2zaaU501YC9G6vEonXby6cOLOYf/+J
 hfj86/k7HsWQpqeEBNVCH3e3tmkKCurkFfpOrj5LIGZmTFytLC56jT5QBJtvInM8YrJMVuBqML3
 E0JvUs+3jCT7jgg+Lcg==
X-Authority-Analysis: v=2.4 cv=do7Wylg4 c=1 sm=1 tr=0 ts=69533e1c cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=KZpCQj3iTLzay5iD_AYA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-29_07,2025-12-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 adultscore=0 spamscore=0 suspectscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512300025



On 12/29/2025 8:18 PM, Konrad Dybcio wrote:
> On 12/24/25 3:02 AM, Yijie Yang wrote:
>>
>>
>> On 12/24/2025 1:27 AM, Konrad Dybcio wrote:
>>> On 12/23/25 3:12 AM, Yijie Yang wrote:
>>>>
>>>>
>>>> On 12/22/2025 5:18 PM, Dmitry Baryshkov wrote:
>>>>> On Mon, Dec 22, 2025 at 02:03:25PM +0800, YijieYang wrote:
>>>>>> From: Yijie Yang <yijie.yang@oss.qualcomm.com>
>>>>>>
>>>>>> Introduce the device tree, DT bindings, and driver modifications required
>>>>>> to bring up the PURWA-IOT-EVK evaluation board.
>>>>>>
>>>>>> Purwa and Hamoa are IoT variants of x1p42100 and x1e80100, both based on
>>>>>> the IQ-X SoC series. Consequently, the two common files in this series are
>>>>>> prefixed with 'iq-x-iot' to reflect this relationship.
>>>>>>
>>>>>> PURWA-IOT-EVK shares almost the same hardware design with HAMOA-IOT-EVK,
>>>>>> except for differences in the BOM. As a result, most of the DTS can be
>>>>>> shared between them.
>>>>>>
>>>>>> The changes focus on two key hardware components: the PURWA-IOT-SOM and
>>>>>> the PURWA-IOT-EVK carrier board.
>>>>>>
>>>>>> Hardware delta between Hamoa and Purwa:
>>>>>> - Display: Purwa’s display uses a different number of clocks, and its
>>>>>>      frequency differs from Hamoa.
>>>>>> - GPU: Purwa requires a separate firmware compared to Hamoa.
>>>>>
>>>>> Is it just a separate firmware, or does it use a different _GPU_?
>>>>
>>>> It uses a different GPU.
>>>
>>> I think it would be useful to call this paragraph "Hardware delta between
>>> Hamoa-IoT-SoM/EVK and Purwa-IoT-whatever - because now Dmitry is asking
>>> about differences between Hamoa-the-SoC and Purwa-the-SoC which we
>>> expressed in purwa.dtsi
>>
>> I want to provide readers with a comprehensive comparison of the two boards, Hamoa-IoT-EVK and Purwa-IoT-EVK, covering all differences in both the SOM and the carrier board.
> 
> Of course - my comment points out that the specific wording of "delta
> between Hamoa and Purwa" may be easily misinterpreted as not what you're
> saying above

Okay, I’ll update it.

> 
> Konrad

-- 
Best Regards,
Yijie


