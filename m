Return-Path: <linux-arm-msm+bounces-88734-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 63378D17BDA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Jan 2026 10:45:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6391B300C355
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Jan 2026 09:45:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8CBA387379;
	Tue, 13 Jan 2026 09:45:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Zj7upm3f";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="N+xY98WN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AFBB381715
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 09:45:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768297509; cv=none; b=SYCK33GrgWg2aWFDuIWDohVT9H6fN4EplgztFp25QIomUlJ4k4JPAWBdRhuacNoG8VoN25ok0yqFvlPZP2VHurRnvbGx0covl6FiIP5N+1Z/XGalnKJmvHC8EF4zx+7ctk+h7Tqg0xkdtW3YiH3DkfRaNVJ7s43g1ygW7K8nDSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768297509; c=relaxed/simple;
	bh=RnFT60kr/PfSctcSnbhdFd9ofPDILz/gj4K6sG1WZFM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mboMsyO4lmc/mq5ZaDU2sdZhRJnED29SeROUDnTGDJgMHP4iXC0iJNPoea9vwxI0LyTyUHhydcZFXCS+jRSOM7ZS7yF4oPbG/nYaxQCxbYzSXZFHd9DaQLKpaNzKO00kHVdlxZnKwo6LFc8H3NtGNSUtI4cxnlojJmnttWJhleU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Zj7upm3f; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=N+xY98WN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60D7wcgl3300067
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 09:45:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RnFT60kr/PfSctcSnbhdFd9ofPDILz/gj4K6sG1WZFM=; b=Zj7upm3fDtqwXn9z
	OxLy5XFTcaIQnLWVhW+TEzQGB/UXiwCZN4N5+rPt6K3wxKnQO6IhulusE9++SIZ2
	NbmSUxPKtn9gPO5NNV8xAA65udwzkOzo65z5z2HbSCqE4LpWSW+zz1g4FnAYSel0
	VyiMLxoo3keLJX9u1zJY2euqB3+cMB5XVCyrk51itYTLM6CMIbCaPH/Tt21j1NAp
	D/TdSTjdGNGU71hzI5qYltliVxsDz1jfPbKFWUbpUEvaDru8rF7x3XSDgmnYI2yu
	eWwhJQnF4CVp0Cs0B87vE9QZ+49b2LzXyzvyWiJE78/JWS5X/SGGxjsvfRWatxgl
	7fKMbQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bn6jma8wa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 09:45:07 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4f1e17aa706so38905041cf.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 01:45:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768297506; x=1768902306; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RnFT60kr/PfSctcSnbhdFd9ofPDILz/gj4K6sG1WZFM=;
        b=N+xY98WNUpgnp66FVpkrhETL6BzsLpBq4VhyuovEWWoS3LYJa4w4ozW6mi85HNugZv
         sEPQANgZ8icEfLrPjhdVd4jppk+3mgg/52zVwBn6MZ8YZ1LKTT4EkxorM7n/35tZjivY
         lgUIqbPgfqLWQmDE2i/bfDDac2p3GOt2qGDbjECXX20ygznLl4JKRN3kFkqcBXe2KOVA
         FvnJYH4EvAIHNs1nQGtKPNlB30LgqXgJLeg9pGZ9Gkh6ExOg6vTTfT15adG/yfeI9IS/
         HnLdn9QUybZz8PRqpiPgH5d6pOPWg7QACi8Kltk/1ElJFMoGtQwKFaw7ZjgtWK0f5l3z
         JXeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768297506; x=1768902306;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RnFT60kr/PfSctcSnbhdFd9ofPDILz/gj4K6sG1WZFM=;
        b=TuMKoTKEE9Dx9/0sfm38RgurKJMbcSpuw+Vezgtzj4RtAEl8EiB0YbONnj4zlrjjCs
         ogLtVyx9Ga7XCg9LOGQO55eJKWscYBWciUEV/d1K4+VlV5EtL++ZJdr9A2pMArXojKb+
         R0HUcOo41Smn72JbOVqdzIUniwc7coRiVwYkGYTilUVW2HwIw43Q3Ezrel4V8+bEHnk/
         Hid/i/mFjG8UG3W/hE6PMuEcPXfwdOjwGvYJY+5kO3vVecyOEtKtT5yU0OKVXssY7wIs
         PqUpASOBL4smWdVNFmjbud40l5dgP8J3AwKbJ+fcwuLVkvSQ7emqBFpI+XQmFFjZfxhJ
         WWIg==
X-Forwarded-Encrypted: i=1; AJvYcCW6nooZh7/NKc1NvhDZV/csLRjGDcR6T3kwr9UR5W5k0kbuU2x7Rhv0eaF9ABmxEHQjJm/B4h5unVMY4Rl0@vger.kernel.org
X-Gm-Message-State: AOJu0YzjHeNjr6SKoa18eu7UIOLpZPEYn9HAMXUtzHCi5dHOHgTqjypC
	jy1/de5qRpDRsbu1N2HeueF5NzKH2YDiqEVSVzRz6v5PGJMJLbLwNJtNFw3PXheBSTkH4AROFN5
	Quxsf4KEe9/3i+WF0P6DxPUQWKhUlWAnTDgE2qQi1f61T46YqbRkVVt3umxi0HEnjahjp
X-Gm-Gg: AY/fxX7ZvSF4EwL4M/5xWYzgE/5h9M2+QFtVcLmVpLsS7p+iWZMjkJngWRwivQUxg+W
	8PgTV8/AKX8S92/MGI2BueUL1Yd7QVnqh1PC8meGs7mtQerVepWJiUmoWTxAxEBvWCl84OO51o1
	tvKWYFa1jQSAkamk5/UnWJVxhgbOsUGVFCVjgZC28YAL1AVd0AqRMHH/miQlBjulSzyVsUd7CJc
	7ztYdLuCoU9+WPUHAewUjKo9Z6W6PMvu9LKNnZo2RJ2z/DbvIpbPFugpWm+oaDd83Ra7O0AmU12
	PxqWhS6CVk0EXxb50SkVLeMGgYwxqIjnrwn7Twheyzs5Gia+fTtPqEwqAXO2VxNizcq3xFPAGRC
	d8VUD0ZwJaM6GADbfGtuIlQFFwJ2c+UQtfAAyK2wIcwG5TTeAEU4E0EUWraOqkU/EFXc=
X-Received: by 2002:a05:620a:44c1:b0:8b2:df32:b900 with SMTP id af79cd13be357-8c38937ccc9mr2027630985a.4.1768297506392;
        Tue, 13 Jan 2026 01:45:06 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEGMdhUIah0+kPkq8aX4h9vJ4FJxBVPtReRBnVq6edz29WF1RikziT0hiVy+JhTjeZEsv374g==
X-Received: by 2002:a05:620a:44c1:b0:8b2:df32:b900 with SMTP id af79cd13be357-8c38937ccc9mr2027627885a.4.1768297505810;
        Tue, 13 Jan 2026 01:45:05 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b842a5187afsm2121235466b.58.2026.01.13.01.45.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Jan 2026 01:45:05 -0800 (PST)
Message-ID: <e4f9cdc4-1b3a-44b0-83f1-315c934985ba@oss.qualcomm.com>
Date: Tue, 13 Jan 2026 10:45:02 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/6] arm64: dts: qcom: sm6125-xiaomi-ginkgo: Fix reserved
 gpio ranges
To: barnabas.czeman@mainlining.org
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Gabriel Gonzales <semfault@disroot.org>, Kees Cook <kees@kernel.org>,
        Tony Luck <tony.luck@intel.com>,
        "Guilherme G. Piccoli" <gpiccoli@igalia.com>,
        Biswapriyo Nath <nathbappai@gmail.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-hardening@vger.kernel.org, phone-devel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, linux@mainlining.org
References: <20260112-xiaomi-willow-v1-0-8e4476897638@mainlining.org>
 <20260112-xiaomi-willow-v1-4-8e4476897638@mainlining.org>
 <11ee77c1-2ea6-4c7c-b955-22f10d879ad7@oss.qualcomm.com>
 <dd4ad11c57d00e9d9f532f40f408b637@mainlining.org>
 <9662c03b-a012-4b3c-8061-62f71a3f44a6@oss.qualcomm.com>
 <43741f0228b0e0d6b2991417852f890a@mainlining.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <43741f0228b0e0d6b2991417852f890a@mainlining.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: eT1TxV1vizvHXohEhhScKV7fq3WfrOI-
X-Authority-Analysis: v=2.4 cv=SK1PlevH c=1 sm=1 tr=0 ts=69661423 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Uyhorv2uAAAA:20 a=OuZLqq7tAAAA:8
 a=FRLbyl5siKgbeq2o-74A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22 a=AKGiAy9iJ-JzxKVHQNES:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-ORIG-GUID: eT1TxV1vizvHXohEhhScKV7fq3WfrOI-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEzMDA4MSBTYWx0ZWRfX61/DPHbr68CL
 60+JuSUYeUf7o29aSjm60DzLgvTeOLs60BO0XpQVP5LM8gxTG1kFMEkIWLy9S85EN2voOEFvBEH
 AOKJcgBDErwX8rpzVyFlU2Ky4BykZk+mahg1mPd+und3JWTh6OFq/tmezEQr13Ye3yMlbMVWYXs
 Z9PdeudhBNKH6ZtjokGGbIurDQ7Kr7x7UxVAsEEERXIIo1MXEn8bHaarxnx86tUmjxQTEMOAFlx
 qgwxLn+Ds4JJKMBeVd3gooAfOUyZQpTUSBG2EoeKc4jK0cMfx55vVMsOCkzB6BWevjLxWJrY/XY
 fc5dPT9hIaFbGyu25AV/3+UVVpfaiZVr7gdWt0My1Vc+C1SfOaZ5cOTtOEfNZXjqcmTkknJVTCp
 prAWwPmUzE6u1q62P5BTVhVh69JeCY8FiQrOlQtul/xz3x5OrX8Sy5drK79Fz7WX8v6uGZys/6n
 FnRhVIT0iIdYl2fjzYA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-13_01,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 impostorscore=0 priorityscore=1501
 lowpriorityscore=0 suspectscore=0 clxscore=1015 adultscore=0 bulkscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601130081

On 1/13/26 10:25 AM, barnabas.czeman@mainlining.org wrote:
> On 2026-01-13 10:12, Konrad Dybcio wrote:
>> On 1/13/26 10:08 AM, barnabas.czeman@mainlining.org wrote:
>>> On 2026-01-13 10:01, Konrad Dybcio wrote:
>>>> On 1/12/26 9:13 PM, Barnabás Czémán wrote:
>>>>> The device was crashing on boot because the reserved gpio ranges
>>>>> was wrongly defined. Correct the ranges for avoid pinctrl crashing.
>>>>>
>>>>> Fixes: 9b1a6c925c88 ("arm64: dts: qcom: sm6125: Initial support for xiaomi-ginkgo")
>>>>> Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
>>>>> ---
>>>>
>>>> That's odd.. were you able to confirm that these values are alright for
>>>> both the Note 8 and the 8T?
>>> Yes, it was tested on both devices. The original devicetree was never boot.
>>
>> Fun..
>>
>>>>
>>>>>  arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo.dts | 2 +-
>>>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>>>
>>>>> diff --git a/arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo.dts b/arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo.dts
>>>>> index 666daf4a9fdd..163ecdc7fd6c 100644
>>>>> --- a/arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo.dts
>>>>> +++ b/arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo.dts
>>>>> @@ -296,7 +296,7 @@ &sdhc_2 {
>>>>>  };
>>>>>
>>>>>  &tlmm {
>>>>> -    gpio-reserved-ranges = <22 2>, <28 6>;
>>>>> +    gpio-reserved-ranges = <0 4>, <30 4>;
>>>>
>>>> Any chance you know/could deduce what they're connected to and describe
>>>> it, like in x1-crd.dtsi?
>>> https://github.com/MiCode/Xiaomi_Kernel_OpenSource/blob/willow-p-oss/drivers/pinctrl/qcom/pinctrl-msm.c#L605
>>> https://github.com/MiCode/Xiaomi_Kernel_OpenSource/blob/ginkgo-p-oss/drivers/pinctrl/qcom/pinctrl-msm.c#L610
>>
>> GPIO0-3 sounds like QUP0 and GPIO30-33 sounds like QUP6
>>
>> My guess would be one goes to a fingerprint scanner and one goes to
>> NFC eSE (or N/C for the device without NFC)
>>
>> Could you scan the downstream devicetree for signals of that?
> NFC is using gpio83, gpio84, gpio85 and gpio95.

I was referring to the NFC eSE (embedded Secure Element) which usually
has a separate connection to the SoC

Konrad

