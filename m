Return-Path: <linux-arm-msm+bounces-70534-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A9F1B3338F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Aug 2025 03:33:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BE6371B228F2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Aug 2025 01:33:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C38DD1F4634;
	Mon, 25 Aug 2025 01:33:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="W9KN47ch"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54FAA1E51EF
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 Aug 2025 01:33:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756085587; cv=none; b=KGt9bfej2kv3xpH7DkzE5wWSCiHhjWNgxNL/citvNfdSousNwCtn6JvDNTId6SxxK8E41rYYTfq2G6IGgMoUbUjCddDwfb4gszuUYLzcdh4wwmZOsnDiJSNHQgg3b06afTYZ2+16S3povLXAChlENFZmmBvX1Jsx0xM0aX7X0Bg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756085587; c=relaxed/simple;
	bh=IEnN5jzC0xPifQD1FTMG4+swJ7cJ8LQtCAIwc/49fU4=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=ekb0kS6ox7a78g91rU5Tf8FZpkvDNciskZTlcl9WX7dIktaUH5JlY9JyHY+J9g9SjZ5gSoTMFq67FskRhCFP+79tLTAw6tBRAn04YgW/GkzeP+4/J5XVtKoWQvhjOv9OjN81z36AK9HlXtMft/hvLNbjqonwRoRLCUaC7KlKn3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=W9KN47ch; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57P00Qux010020
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 Aug 2025 01:33:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	K6E22yah7RSaBBMqG2z+3SW7CvB325/vsH5zTcMNA9Q=; b=W9KN47ch+CdMX9XM
	MP7DMdWXixwcEekg2jQ1kogTdnBPsM6//cCJVzKzGoXNggSXYcTIwzRTAesfC1R9
	ebmxW2ujk5pR4O5HAMUpnprbBnn9q1pk6bagr3GW/Qxe2d3imsG6gGOxzJmKrm0Z
	vXabB3r61hRyM606cAe87ZO53ewpZSptRMbNTzh8V+9ns/b2s+JrrczBJpeqtOEk
	lQUL8JAJyrR6QrCiLQOo1KJiBuYetCr73jB4Ts4M6Q9oiIt/jOsYHNBWl6xtIOnj
	nECZM3J/Y07kmbY6vrr/76knhY1MVyzL/Thf9sl5Jxfo9XsxT5hMWWxXhT4dcI2e
	UreKDw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q6de39tc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 Aug 2025 01:33:05 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-246164c4743so67810485ad.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 24 Aug 2025 18:33:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756085585; x=1756690385;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=K6E22yah7RSaBBMqG2z+3SW7CvB325/vsH5zTcMNA9Q=;
        b=TvgMhBE/ZS4A51+vkoW8PMLM4pxZ41Xyro2aVSBtWuOzv3DxJklI1qWXRJoStjzm7G
         o0JWU5etq2l1dzlMKZnMe1+XtNW4cAoS73QZfg8qCb3dhdQdidjnlJ7eJgAjg20hnn8Z
         JZCkomH14rTt9SemR7ut51R+wIqiWngG128LCszABbXnYn5pS2AtxGloCLdyZRuePHLU
         /AVOM0hlYd67GhHbFSCoGhRZO2sp8LzuLBhn7nTi8SAyz6okp2WMZKmZzntZU0aos5M8
         aZxeIOxbSSO1EDSVvwqsXEQ9jPp9QEfABWcxvkcAVJRDoiczHECvV5KHJJPbR94wjG+X
         FaKg==
X-Forwarded-Encrypted: i=1; AJvYcCV24EAYoRrMpxGZ3QGND3CBvAbHgWwI7fUxL6Sug8RKFYn31lxDfotFL/M+t5vYvyJ2qfuF/aOulnyYkvaU@vger.kernel.org
X-Gm-Message-State: AOJu0YxgYztrzOTVl2x0QW96BmCXJzAJg6htiKIyctzFqCT55twn07tJ
	oH3cfH8VMNvuHRBYHa+DyPWGs5gWO6c0ACm958OkCC3EsJG2mJv02RUn0qKODXglokgMIH18HMr
	HlO4ZLGvJUn8Rmyvq2Pvw3dtdwGEKQ9MAuukNfIIYcAvON8t1ioHvjNP7lQWvZz90raov
X-Gm-Gg: ASbGnctkPaLlvXAUx6Ab3vL34mygrTAiJRvtcsccrX/whYQY1gtI5ktHzhSvI+G9MmZ
	NESV8/Js1h+EKGhXTtODzrudyufehfigniTDxsg+0x6yuReODQIq7WyaRGath5hxf+Og7tRtmWT
	IHnmey3OuHqhSHHQVxPG62U3LcCgspt4zTp37VguvMpfdsw+6nCoMsrsKAnbzJmtAb8l7bHN56s
	UU/ywjG03BlSe08RR53o6BXMOJtKXDeeU0LxMDYTCG4QxTNdWRYGQ5qNYa1Yw4wwNkh0OGPhl9s
	/lMCTJct2wldLR/ZNdYFrqmtewQ3LI8ym1JhFD0kc61rF9H4E+JJzfHoSL6tBXzJoiTpKxIhcfF
	mnTLRbtmE6aSe4RlzrlqIy1y4ojwunQ==
X-Received: by 2002:a17:902:ecc6:b0:243:38d:b3c5 with SMTP id d9443c01a7336-2462ef1564amr146761595ad.47.1756085584623;
        Sun, 24 Aug 2025 18:33:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFJHNnP7iSIPuTBnCfkd1kHAo6DmPEz7vDeIdsiBninAkHPKiPmI83toT+uDqJlo73Uw+Et1Q==
X-Received: by 2002:a17:902:ecc6:b0:243:38d:b3c5 with SMTP id d9443c01a7336-2462ef1564amr146761305ad.47.1756085584073;
        Sun, 24 Aug 2025 18:33:04 -0700 (PDT)
Received: from [10.133.33.155] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-246687b0feasm52811395ad.46.2025.08.24.18.32.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 24 Aug 2025 18:33:03 -0700 (PDT)
Message-ID: <74038a79-8c59-496c-9a61-08dc786f9c10@oss.qualcomm.com>
Date: Mon, 25 Aug 2025 09:32:57 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/2] Enable CTCU device for QCS8300
From: Jie Gan <jie.gan@oss.qualcomm.com>
To: Mike Leach <mike.leach@linaro.org>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
        James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250624095905.7609-1-jie.gan@oss.qualcomm.com>
 <c7cca483-f1d3-45b4-abef-ec5019ad57dd@oss.qualcomm.com>
 <c6f74d55-6ea8-498f-a05a-000599f93ac6@oss.qualcomm.com>
 <b5f8fce0-afe8-409b-b43d-fa9f413cd442@oss.qualcomm.com>
 <CAJ9a7VgZ61oL4LLxKSon3LXsYDtaHaPcGNxW=cwzhSOs3ea1PQ@mail.gmail.com>
 <bbbec517-cc2b-444b-b76b-a4930902d667@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <bbbec517-cc2b-444b-b76b-a4930902d667@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzNyBTYWx0ZWRfXx7XiIj6OUNbQ
 8rNQf2nxao/i9glJy+mvCLO2mmvIe7Ds/R7SNqS5ExKHoxLKJGIqQ6BrXk+5X+esGXBFbGUMd6O
 0a7/p4DKhIO7bmPZO0BIBFZfSiYW5aJNJk33yAUDVr0JB8PuPe9dip2597UDFt+9fWHc+drwx/R
 6MUMNVDhmvIqqCCF9dJPi2735qccr2jkmDRSwWg7/UwCIqeIcV7VGLIOfHmnQk+rZcIPG6YYOwH
 DbIWc7PEIXhMt9MZ1Gsuv9Ex006cP0lbjSLphF1DjYKqT9gGk/KJZCki3vgbfOPNulEsKyDr2ji
 Xx1KzSqz4ntVqtn4D/6JfGoiTiihMyGIY23FkIdO1r2G3nj46ggq02VXCFPUhkxiu/9p6xZhrkR
 osaUDSf8
X-Proofpoint-ORIG-GUID: -ACWnXX5ZGTw8aHFKHh1taQqE_ZFr9ov
X-Proofpoint-GUID: -ACWnXX5ZGTw8aHFKHh1taQqE_ZFr9ov
X-Authority-Analysis: v=2.4 cv=K7UiHzWI c=1 sm=1 tr=0 ts=68abbd51 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=KrWnKaeQ6KOPjblB_ggA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-24_08,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 malwarescore=0 suspectscore=0 adultscore=0
 bulkscore=0 phishscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230037



On 8/5/2025 6:25 PM, Jie Gan wrote:
> 
> 
> On 8/5/2025 5:53 PM, Mike Leach wrote:
>> Hi Jie,
>>
>> On Tue, 5 Aug 2025 at 05:11, Jie Gan <jie.gan@oss.qualcomm.com> wrote:
>>>
>>>
>>>
>>> On 7/28/2025 9:08 AM, Jie Gan wrote:
>>>>
>>>>
>>>> On 7/15/2025 8:41 AM, Jie Gan wrote:
>>>>>
>>>>>
>>>>> On 6/24/2025 5:59 PM, Jie Gan wrote:
>>>>>> Enable CTCU device for QCS8300 platform. Add a fallback mechnasim in
>>>>>> binding to utilize
>>>>>> the compitable of the SA8775p platform becuase the CTCU for QCS8300
>>>>>> shares same
>>>>>> configurations as SA8775p platform.
>>>>>
>>>>> Gentle ping.
>>>>
>>>> Gentle ping.
>>>
>>> Gentle ping.
>>> Hi Coresight maintainers,
>>>
>>> Can you please help to review the patch?
>>>
>>> Thanks,
>>> Jie
>>>
>>>>
>>>> Thanks,
>>>> Jie
>>>>
>>>>>
>>>>> Hi Suzuki, Mike, James, Rob
>>>>>
>>>>> Can you plz help to review the patch from Coresight view?
>>>>>
>>>>> Thanks,
>>>>> Jie
>>>>>
>>>>>>
>>>>>> Changes in V2:
>>>>>> 1. Add Krzysztof's R-B tag for dt-binding patch.
>>>>>> 2. Add Konrad's Acked-by tag for dt patch.
>>>>>> 3. Rebased on tag next-20250623.
>>>>>> 4. Missed email addresses for coresight's maintainers in V1, loop 
>>>>>> them.
>>>>>> Link to V1 - https://lore.kernel.org/all/20250327024943.3502313-1-
>>>>>> jie.gan@oss.qualcomm.com/
>>>>>>
>>>>>> Jie Gan (2):
>>>>>>     dt-bindings: arm: add CTCU device for QCS8300
>>>>>>     arm64: dts: qcom: qcs8300: Add CTCU and ETR nodes
>>>>>>
>>>>>>    .../bindings/arm/qcom,coresight-ctcu.yaml     |   9 +-
>>>>>>    arch/arm64/boot/dts/qcom/qcs8300.dtsi         | 153 +++++++++++ 
>>>>>> +++++++
>>>>>>    2 files changed, 160 insertions(+), 2 deletions(-)
>>>>>>
>>>>>
>>>>>
>>>>
>>>
>>
>> You need to send a new patch addressing the comments made by Krzysztof..
> 
> Hi Mike,
> 
> I just proposed an idea to add a common compatible for CTCU device, its 
> not about the patch series itself. We dropped the idea and prefer to add 
> the board specific compatible for each platform.
> 
> Thanks,
> Jie

Hi Suzuki, Mike, James

We already have the tag from dt-binding and dt maintainers. We haven't 
additional modification for this patch series. Can you please help to 
review the patch series from Coresight View?

Thanks,
Jie

> 
>>
>> Regards
>>
>> Mike
> 
> 


