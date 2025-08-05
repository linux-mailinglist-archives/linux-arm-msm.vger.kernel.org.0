Return-Path: <linux-arm-msm+bounces-67772-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F2DDFB1B1E7
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Aug 2025 12:26:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1577F17BB89
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Aug 2025 10:26:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF4A726A1AF;
	Tue,  5 Aug 2025 10:26:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HH5EKlCu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45C6A21D5BC
	for <linux-arm-msm@vger.kernel.org>; Tue,  5 Aug 2025 10:26:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754389566; cv=none; b=Z6ILZR8y352QsEjKcvnNd6YLhD3mapY8oE1I9hSuab5xsH1+M0jaNbQZvVpVwKfKLOHfUuejNsbO6F8QhHaUA88tEBAWJ3r5wIwADxYoSZdmsApKVXNprWbrEFtt9bwlZsprX01/f8U8JKbiJFX82rWeXtKnvXf/mM3Wrzir/4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754389566; c=relaxed/simple;
	bh=hqtLDqqETlGoO03aKynYn/0eKNUxW23Fq0iyoxd0QkQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AyXR6oUUNO5AnSe3v5odF2nCbcpBquGBgRVaFw2kCmrJh9UocdK8kWyDMfIrW4RstUkqIdpARNY4jJubSvoJAJtyEvk264PSlyhvgTvDkL99ntZPDNJXwn1r4nb+dnJkWSpy3qtsRBMaZDCbtA0ZKJxmER+fCKewHZnQI9bKr90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HH5EKlCu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5756iiOw012382
	for <linux-arm-msm@vger.kernel.org>; Tue, 5 Aug 2025 10:26:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+iReZqZKlVGY8y7fQQol3sCZdRqJvzzuk3L/8zG3n1M=; b=HH5EKlCuPgatJRIU
	5Zibas1QYow0eYSJ0f7wOnVI2bp9iHdaVM3aSCbzqDFhbFsbupdo+0ow3yPvMCEL
	tIu4FqxhSMbgP3A1KbUMJIXf2R4zHpN9YAif0QsM2sxMKYUDIETPSyiiazoVRrMG
	o7ZzbL6o6Z6B7PZg7l7TklKCZza8iCjlCYDtO5bhnPSBQsXMUzYsHzS7DpnzUfM6
	iNEx2MQ2SspfYn3lcph5Aw7T6Qko90TfocMgo+geoLRThyHm8Y5vrmCKG6tR1W7q
	ymeMHVRAeF1xTEgcP9OBNl/lSdeJHAKYbBDv+16YmuqYmtwcsZUFIjevYN5qMra+
	/E0pHw==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4898cjrd9f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 05 Aug 2025 10:26:04 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-76be7fe3d65so6624679b3a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 Aug 2025 03:26:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754389563; x=1754994363;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+iReZqZKlVGY8y7fQQol3sCZdRqJvzzuk3L/8zG3n1M=;
        b=F+ssVfwNOpgAUjoyygk3VILhAXbakgqxPkaO4DARJg3wb6O3Dqdwwt2zT5gP0FeYz2
         btYH2qzM/IWkANYoHXfsacXrlykvULtSMfh7iNp/bBLRAmfvRRQFTTB7KX2md+RdZDEw
         6dmJRtdJbgKq/nCeSS/4n7hOsu1uTv18jmbmT8FD51brpr8VqfijXdYe9NQ8wjdao4cG
         cS0fqBhJ5KLRi0OhK6DpqkDcNUAGc2DQKDDGVEKp8XCD3DC/xNvTlVhMbpff/I+g50kF
         c2FwwSYo42ZFRLtLPweuy+beNepIKBE6fqLNeb0JFTlZSoXOHvHLC/mkV4/M4lzzCi5D
         NgLQ==
X-Forwarded-Encrypted: i=1; AJvYcCUiMUj+9QnUKwkl42GRxvOU2f3Chqn0XNv+YVrCOw4PxG9GOzgQ/LQeS5Y7QLgbVe7sA0yWZ0xbXNbWxCUb@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9UQ+oJ/tcq/tp03fL4FqJSlRx/t9ecqqXyxyqr92Xo9g/salg
	T3Tac1Yn6Umt6SB4iz/GBFlDp13iAS+diVM0kLl9KT4cP78WDv4jhy6WeNnVX9wsataf6eJopH9
	ACgNU1ok8dYSb7dDs7qvNLhovdhZ3R2vrkGryx3bhyGE4JVBWdy32fC3AfwjabDvmeRsp
X-Gm-Gg: ASbGnctPZhCcEIHloBe6NvtpdSFUwcnsRSK5isnUHYh94PyNKb+ghAIVlB9pbnqBSCP
	aLuTcP7Hd379Mvx0nhnDtshdfciQymF6CYJUMgCckHHibVE0VQHwVnfgWBSLpwVqBYkSeZ99brn
	D+jVJYYEP2ZKhItn7BUSJ1VT4WB4CKePLEAXf+MRRf+BrAdC96M1FBJj/WuGhkE9CQzwNLbGYa2
	DaQIvGCdZVQZdkdv5lfH4qDBnOCosu11Ijc/GErEsS+Axp8uoutRxouvPABTxbETMraFFCUe4zr
	FFb0d2TY7ssY9dxGg3DCaXR988uy8Wcek7vLXGKws028RU3+W5ScaDlqkm26S0GBIg3S8Ixkmd+
	I6z11uzemDVJ0Rm8KMN5YjWdt
X-Received: by 2002:a05:6a00:2388:b0:749:bb6:3a8e with SMTP id d2e1a72fcca58-76bec303a23mr13892094b3a.1.1754389563415;
        Tue, 05 Aug 2025 03:26:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IESg1QFvv8hqMydjVjeIPEnGudPbS1WSJiVGghbXmiPTDC16eHCWIdklQfsaZxXv+e/uQi36Q==
X-Received: by 2002:a05:6a00:2388:b0:749:bb6:3a8e with SMTP id d2e1a72fcca58-76bec303a23mr13892069b3a.1.1754389562974;
        Tue, 05 Aug 2025 03:26:02 -0700 (PDT)
Received: from [10.133.33.195] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76bccfbcfa0sm12547422b3a.75.2025.08.05.03.25.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Aug 2025 03:26:02 -0700 (PDT)
Message-ID: <bbbec517-cc2b-444b-b76b-a4930902d667@oss.qualcomm.com>
Date: Tue, 5 Aug 2025 18:25:57 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/2] Enable CTCU device for QCS8300
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
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <CAJ9a7VgZ61oL4LLxKSon3LXsYDtaHaPcGNxW=cwzhSOs3ea1PQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=MNBgmNZl c=1 sm=1 tr=0 ts=6891dc3c cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=f8PP91cPUXlTVnoGj10A:9 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: plwK3nlW-Ejvzm-5Qw9cr25986nvkpTg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA1MDA3NSBTYWx0ZWRfXwIHYCTkHwYqU
 qnihQY57Syz7K+2UbtlGneWKkFPzPLMrhHi9rbMNTHVNxAQ1YDkrRuJ4FqDpKjPAW45AhCDM/en
 j4bSq0lCPD8r7zdAN3EMUpL7LEH45dE0ENJV8dOm3zoa/gNraB0GeySxCzXwU3xmMAvjWc+kXDb
 MlnSiUwDKxvLkiQQ0DADcCmPtCUyo5M7VXMLQG1LDiDbR69Z0UzXxDmnNr2i8mGm1/Z5m8G4lum
 mL4D923OV9fsgLOVSZ1RWt595tBQ1e08pqSgjR1uMeP1HDNyYQVbKXYEQESyp27uO25bTSDCg/m
 XgENZgqhG/8akbOpsFt06CVX82QvOymSJUzk880RQvdJzEJawMaqYvvx6xWCdQS0g2uazQpplQF
 U4lz6D6xTaAcwV+WkLpG8RGFJ8o7B0Jjb7qFdfbjE2orDUg4FaIZMy0uHOL2Xfav9gwx2jY1
X-Proofpoint-GUID: plwK3nlW-Ejvzm-5Qw9cr25986nvkpTg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-05_03,2025-08-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 phishscore=0 mlxlogscore=999 suspectscore=0
 spamscore=0 mlxscore=0 priorityscore=1501 clxscore=1015 adultscore=0
 lowpriorityscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2508050075



On 8/5/2025 5:53 PM, Mike Leach wrote:
> Hi Jie,
> 
> On Tue, 5 Aug 2025 at 05:11, Jie Gan <jie.gan@oss.qualcomm.com> wrote:
>>
>>
>>
>> On 7/28/2025 9:08 AM, Jie Gan wrote:
>>>
>>>
>>> On 7/15/2025 8:41 AM, Jie Gan wrote:
>>>>
>>>>
>>>> On 6/24/2025 5:59 PM, Jie Gan wrote:
>>>>> Enable CTCU device for QCS8300 platform. Add a fallback mechnasim in
>>>>> binding to utilize
>>>>> the compitable of the SA8775p platform becuase the CTCU for QCS8300
>>>>> shares same
>>>>> configurations as SA8775p platform.
>>>>
>>>> Gentle ping.
>>>
>>> Gentle ping.
>>
>> Gentle ping.
>> Hi Coresight maintainers,
>>
>> Can you please help to review the patch?
>>
>> Thanks,
>> Jie
>>
>>>
>>> Thanks,
>>> Jie
>>>
>>>>
>>>> Hi Suzuki, Mike, James, Rob
>>>>
>>>> Can you plz help to review the patch from Coresight view?
>>>>
>>>> Thanks,
>>>> Jie
>>>>
>>>>>
>>>>> Changes in V2:
>>>>> 1. Add Krzysztof's R-B tag for dt-binding patch.
>>>>> 2. Add Konrad's Acked-by tag for dt patch.
>>>>> 3. Rebased on tag next-20250623.
>>>>> 4. Missed email addresses for coresight's maintainers in V1, loop them.
>>>>> Link to V1 - https://lore.kernel.org/all/20250327024943.3502313-1-
>>>>> jie.gan@oss.qualcomm.com/
>>>>>
>>>>> Jie Gan (2):
>>>>>     dt-bindings: arm: add CTCU device for QCS8300
>>>>>     arm64: dts: qcom: qcs8300: Add CTCU and ETR nodes
>>>>>
>>>>>    .../bindings/arm/qcom,coresight-ctcu.yaml     |   9 +-
>>>>>    arch/arm64/boot/dts/qcom/qcs8300.dtsi         | 153 ++++++++++++++++++
>>>>>    2 files changed, 160 insertions(+), 2 deletions(-)
>>>>>
>>>>
>>>>
>>>
>>
> 
> You need to send a new patch addressing the comments made by Krzysztof..

Hi Mike,

I just proposed an idea to add a common compatible for CTCU device, its 
not about the patch series itself. We dropped the idea and prefer to add 
the board specific compatible for each platform.

Thanks,
Jie

> 
> Regards
> 
> Mike


