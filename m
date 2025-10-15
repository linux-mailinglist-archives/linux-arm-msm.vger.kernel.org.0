Return-Path: <linux-arm-msm+bounces-77362-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A1FEBDE086
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Oct 2025 12:35:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9C6594801BB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Oct 2025 10:34:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE0EC2BE7AD;
	Wed, 15 Oct 2025 10:34:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="daI0TSIY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32B1B31B131
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Oct 2025 10:34:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760524447; cv=none; b=nbHZ30C7q9yldvFOKUiFgNUFL9aCm/vDVNSrgnOhiGw6ZO6oCiPh5FvbA3d8bOGkU4aKaNE9O+m+xceZz0XyiTBAizsaL08LizQPi3ZWb6f/5Mw3y3uxwICnvBvINqtiOj6BTh2U66kfVGVeEbK/3AFeYYJnfd9Otj0O6toDmt0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760524447; c=relaxed/simple;
	bh=t6s+5a0qx+cIEfZCgFCpVTM/4YgqdDw3vQzbv5i/B/E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Wi8IF/giOEzX5Hl0f5+pw+o3KCa0P7EejE6tITlLtya8WlfXayhmj7z4GZu3PRxbEyCsWRDW7U50AzmBDGvB3AYZ52EkbfKct8F81OrH2SJPnenB2j3qhcyN4SHqV4fTo9hA8tzyJr6T97V2Ad4bzSRal1RpXDdqWM0xpg5KDjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=daI0TSIY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59F2sSrr010001
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Oct 2025 10:34:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mb5K7hg5DYmN+vjryrnWGrqFCcB0tj4IX+2kkXwfhVo=; b=daI0TSIYaUZDjzfR
	+GYt6d8RuXp7zbwVTvPiQKNOH31SP5m9idoxQ/aebzSp6iq2YFZ6I784gbAlrGI9
	z5LNpGfEMh9ir13YqF29b5jm70EXk1p4HQgES16Z8bfas08NtJOHMC88143jiB5F
	bN1LsZIp7EGN1/CpbA+ARevHJ14LHrIWaTg6sldTQ0Ggw6dc9KR+xvWHy0UUvY6Z
	KB+7T7XkssZkssYH62j729PxhZH7VsNpgndB0BOO6PApO0xSdAUZzZFdjUyocREF
	fhn650yqr6T9dUGFyen5z5NJi8/4M4aVwrWYUyG+80s3XchLi6Rc2S8BRyNZcTCi
	t2yfNw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qg0c40qg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Oct 2025 10:34:05 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-28e538b5f23so112317495ad.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Oct 2025 03:34:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760524444; x=1761129244;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mb5K7hg5DYmN+vjryrnWGrqFCcB0tj4IX+2kkXwfhVo=;
        b=AP9sazTkQS8J1WGrXF7H6eLJkYUXgAwv4mcezzkJTI6cMBlsw/iHPQjBr7wUYGnBLr
         aWXRalzMiv0M2y+pmfJS1Wq9JGwH1EKe1OtSQC+4xEVtTI6NxcaPqap8pIhXJwRwbBHg
         5qN6GLq4J7OwNor4vkdLVjYtPneRVg+yl1DY3uop7jbSnNYbimFWaWvWb6aG9LZwkQne
         YNNeyXS/xsMoBFYofSoR5+W4vlw8yVvnDLHt/KGhF/l2gHN3KlA6qookiPK/avm3qP6o
         rSUSnDdUUZ++J61l0pjFAn4coXK0FRAH0zF5gNYRnDwIkY3c2aVhYpfrJlj1s7wIbgpc
         ZYtg==
X-Forwarded-Encrypted: i=1; AJvYcCUyTzs0g1aqzTbu9MUDMV9RD1irbEPniMqK71Gx84DlgpPn9EDJmi/l7LLd9lhKOUs/Sbwc7sdB1tCQh0Jq@vger.kernel.org
X-Gm-Message-State: AOJu0YwkyHGF5O2ToTqLf4eltS2qsqNDv3ivTuPwO+BL+6I77ivcG/3h
	ZzTW1XHvLjrz/LpBw8NOPwSarUtmko440DvwSYDhjx+aIEBKyilF+h8/++7T0JLSUQO4Q7zriWU
	oIv4wmh7EB6373SPPfecGlibRFPPOzWEmjPnPrOlFMeOEfgZ3QaUrOPnMLMQoSVU1uhY1oR9jIV
	Qc
X-Gm-Gg: ASbGncutSOZzNUanl4x4xW0xRtqgEj6nIEHj74KkqQpO/+IEYqOCgFDCok2DkxZqTw+
	yHuk/T+Sbi+40LuEs/9bP2az1FUiKw/qYAdyOvaUPb/+zSGqUmukLdStd8ZI3CSUciViCwqgf/n
	HdfuzKA6pKMuO3mCcqRRWkbSDOPuvUxivUPXgGckr4XD4VCpl8xkZLDZJRWbXUqGqrwQX5ixII1
	+YsaKD2VRytSiH+EY+3RdymmszhNIFhrKv9yw5U5KU7h0dV+PhyAr9VRnVzuNksJYgiwFSRH52T
	gwcBMv1gGLOjaH2lV9KMviBTVlXDFneD7dTW+yDquFEU5xmcbVhD9loQewiVnPkWYV22Pz8=
X-Received: by 2002:a17:903:320b:b0:275:b1cf:6dd7 with SMTP id d9443c01a7336-290272c376amr391441675ad.34.1760524444094;
        Wed, 15 Oct 2025 03:34:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHh9WZGfNKaBgWbNK5aLHNx3mn34hyNL6G/4cHtFJK8KrqDiYbFvJ33yvdZKEBJYvqMbGPfkQ==
X-Received: by 2002:a17:903:320b:b0:275:b1cf:6dd7 with SMTP id d9443c01a7336-290272c376amr391441275ad.34.1760524443506;
        Wed, 15 Oct 2025 03:34:03 -0700 (PDT)
Received: from [10.218.44.34] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29034f07741sm192379045ad.61.2025.10.15.03.34.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Oct 2025 03:34:03 -0700 (PDT)
Message-ID: <9865ae77-0051-4a4b-95a6-6e655fc274f3@oss.qualcomm.com>
Date: Wed, 15 Oct 2025 16:03:58 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/24] arm64: dts: qcom: glymur: Add QUPv3 configuration
 for serial engines
To: Abel Vesa <abel.vesa@linaro.org>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250925-v3_glymur_introduction-v1-0-24b601bbecc0@oss.qualcomm.com>
 <20250925-v3_glymur_introduction-v1-4-24b601bbecc0@oss.qualcomm.com>
 <3af57kktkwevbxkno4o54w3o2qajoco5x7dlj3ckepcutlzmdh@2bnqqxndbvf3>
 <odjto4fjqoi5ct33unring22s3p6vwnbrafyrcmrppwcdnm4zq@aabot4m6q2rm>
Content-Language: en-US
From: Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>
In-Reply-To: <odjto4fjqoi5ct33unring22s3p6vwnbrafyrcmrppwcdnm4zq@aabot4m6q2rm>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: tnTptR0axxHXs9nUI-pNd-1C2w92O9Ut
X-Proofpoint-ORIG-GUID: tnTptR0axxHXs9nUI-pNd-1C2w92O9Ut
X-Authority-Analysis: v=2.4 cv=eaIwvrEH c=1 sm=1 tr=0 ts=68ef789d cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=RnZ6wvZhTJBgIj8N7VsA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAyMiBTYWx0ZWRfX0msaPYoUUGI1
 bFvglzrKtRMnm39kXqYnvGINSdsBps/uNHCEKOmfpla8LnapM0mvoOf6neQ1uGpdAJpfdxQxzyC
 NL2GCuANZ0zWN3yJmvwSjBoSa7AyHChFC/l/BmzToik0OtKuC4hmtva47g9miD6N3T7LFWhUfr5
 0sRSl9bBZV+SA+SO5XwHQEfAaCuL9nMOAwktrM/NVx85S2u9K9HqsfhDEDx8NPGgQv4VK0i7G2T
 nZLNDeTM7zzhtOxQdTm+rlowRSIf4tMc7rxLuE03vH2Bi3hrQF8qDw1Pq8XHYUc1fGw83YjdNLS
 oa0Q5r4szc5mYR9vlemnfSNmcLCs++NOib8Ap/WvbNMlFx9tubyoap1ZOl/IAitX2xZV25UrqS9
 8mNDbr9QAVocnMHzVr5IX444V8c7/Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-15_04,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 spamscore=0 impostorscore=0 phishscore=0
 adultscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510110022



On 10/11/2025 4:41 PM, Abel Vesa wrote:
> On 25-10-11 14:06:44, Abel Vesa wrote:
>> On 25-09-25 12:02:12, Pankaj Patil wrote:
>>> From: Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>
>>>
>>> Add device tree support for QUPv3 serial engine protocols on Glymur.
>>> Glymur has 24 QUP serial engines across 3 QUP wrappers, each with
>>> support of GPI DMA engines.
>>>
>>> Signed-off-by: Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>
>>> Signed-off-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
>>> ---
>>>   arch/arm64/boot/dts/qcom/glymur-crd.dts |   43 +
>>>   arch/arm64/boot/dts/qcom/glymur.dtsi    | 3041 +++++++++++++++++++++++++++++--
>>>   2 files changed, 2936 insertions(+), 148 deletions(-)
>>>
>>> diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
>>> index f1c5a0cb483670e9f8044e250950693b4a015479..8674465b22707207523caa8ad635d95a3396497a 100644
>>> --- a/arch/arm64/boot/dts/qcom/glymur.dtsi
>>> +++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
>>> @@ -707,6 +707,32 @@ gcc: clock-controller@100000 {
>>>   			#power-domain-cells = <1>;
>>>   		};
>>>   
>>> +		gpi_dma2: dma-controller@800000 {
>>> +			compatible = "qcom,glymur-gpi-dma", "qcom,sm6350-gpi-dma";
>>> +			reg = <0 0x00800000 0 0x60000>;
>>> +			interrupts = <GIC_SPI 588 IRQ_TYPE_LEVEL_HIGH>,
>>> +				     <GIC_SPI 589 IRQ_TYPE_LEVEL_HIGH>,
>>> +				     <GIC_SPI 590 IRQ_TYPE_LEVEL_HIGH>,
>>> +				     <GIC_SPI 591 IRQ_TYPE_LEVEL_HIGH>,
>>> +				     <GIC_SPI 592 IRQ_TYPE_LEVEL_HIGH>,
>>> +				     <GIC_SPI 593 IRQ_TYPE_LEVEL_HIGH>,
>>> +				     <GIC_SPI 594 IRQ_TYPE_LEVEL_HIGH>,
>>> +				     <GIC_SPI 595 IRQ_TYPE_LEVEL_HIGH>,
>>> +				     <GIC_SPI 596 IRQ_TYPE_LEVEL_HIGH>,
>>> +				     <GIC_SPI 597 IRQ_TYPE_LEVEL_HIGH>,
>>> +				     <GIC_SPI 598 IRQ_TYPE_LEVEL_HIGH>,
>>> +				     <GIC_SPI 599 IRQ_TYPE_LEVEL_HIGH>,
>>> +				     <GIC_ESPI 129 IRQ_TYPE_LEVEL_HIGH>,
>>> +				     <GIC_ESPI 130 IRQ_TYPE_LEVEL_HIGH>,
>>> +				     <GIC_ESPI 131 IRQ_TYPE_LEVEL_HIGH>,
>>> +				     <GIC_ESPI 132 IRQ_TYPE_LEVEL_HIGH>;
>>> +			dma-channels = <16>;
>>> +			dma-channel-mask = <0x3f>;
>>> +			#dma-cells = <3>;
>>> +			iommus = <&apps_smmu 0xd76 0x0>;
>>> +			status = "ok";
>>
>> s/ok/okay/
>>
>> Everywhere actually.
>>
> 
> Actually no. Maybe drop entirely like Konrad already suggested.
> 
> But then everywhere else you do "ok" please replace with "okay",
> otherwise dtbs_check complains.

Sure, will review it.>


