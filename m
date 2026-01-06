Return-Path: <linux-arm-msm+bounces-87594-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B907FCF63E4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 06 Jan 2026 02:24:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BC05930208C1
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Jan 2026 01:24:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B4D31DD889;
	Tue,  6 Jan 2026 01:24:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Efv8DDhc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gEDiEwZH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66A0D3B7A8
	for <linux-arm-msm@vger.kernel.org>; Tue,  6 Jan 2026 01:24:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767662687; cv=none; b=MnPaJrTaYnbCVufqwNRLOayFZqlKHCNAKqqW2x3sbZNRTeTwnzKrn5l0oOkOV0eloqUxXFzZPGuCBqgDdTzfnedl08XV+b/In4jHha7VwcdWEpsUKjwvaA5mLsOShH91/Dn8Nza/5YF8puavcIdCTNADgpM0ueeptE0Q90c8ies=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767662687; c=relaxed/simple;
	bh=Zi91t+yDAGBNj0Wf+xn51Qwt2DFUmcMLUYGn67KjtPY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=umMxw7lUcyo9DEqxfZ/je9W3UTZMJQM+Yiy/GwQrH1uP9ql5RC57FvxpatGFGqAl5B6QCGICh1gVE36LItyd4Kauuzay+aYpBKgraBaWIZkfR6vQIr6vCAWDHjBDQv757BHP3NH7mRZBQMpaUH+L/NB3poJe9+xPi+U6+5KGDAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Efv8DDhc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gEDiEwZH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60617pqd2784725
	for <linux-arm-msm@vger.kernel.org>; Tue, 6 Jan 2026 01:24:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Rgdj9JVSXam/U0sf7Dh+VmV41kCy2PTQBaLABR0ltjg=; b=Efv8DDhcATSDw88E
	83MPiIxbNj2aaL9oQ6irxlPvb5sa9FVwoCJcBgLpPCZh43xHKKkHbkTHtYbI/s58
	opwD6OnD66WdspbBUAcOMa29YX3Vfw2sh9SvyLOgAR/wU8lZLKIAntuL/xSad2Qs
	mbo4A3vHPXF9hgbhu/QaDU3jO+eRO43aRcZKwNLzx4d9Iwb5XjUoE4PRSaohI2mb
	ZPPdt3WIfv5LNBKL4sLL/Myzu/ouN4+5BXzLjV2xfunlO4mjg5IJF5QaH47Lepsc
	5ku/NwaZ8NHAcKnC2PJmQ3Z7aHh9FlBNE9cjo+ba7GErciFfU7cpr7qF+CeXqpcs
	WaFmUw==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bgrf7g157-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 06 Jan 2026 01:24:44 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-7b9208e1976so1347650b3a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 05 Jan 2026 17:24:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767662684; x=1768267484; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Rgdj9JVSXam/U0sf7Dh+VmV41kCy2PTQBaLABR0ltjg=;
        b=gEDiEwZHtGz9tWXjNPySFt7pMyT08ih4lq56WW7Ro3xLYmA3qG+Sz4XN9SjEQsVpKJ
         S+FyYgOi6D8QB0w7vvHPuVrO4hNGfJ0Thw6sKj9JZsrTScKPK/WyAIuU7vMfdBtBlPlp
         zGW8nmrhdGczcthXlQGJspRnASXwIRzd2wTCQHuSAOUQiiiQ/JI4ZTcJhwIQiAZIQZzA
         e0+RNourn8tqu2PDzKnhYhxn0md8v5c8l5encXLBpZUa9aJNBRVyF7CNZer6G4pRW58v
         KjfRNjy4/MZtwDrztkzk9kc7KsEs/t22LwvoUdOyXy6QBSIIVtzeHQEoZwaC+TyoDxn4
         AUvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767662684; x=1768267484;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Rgdj9JVSXam/U0sf7Dh+VmV41kCy2PTQBaLABR0ltjg=;
        b=GvOe3FqhmmGobmsf1FTDz5cj5fxeiRK0uTUd+LItmgjbKO1zByqYp1QBNvurj0QCh1
         XXaLJ1FLjD2ISS1CjCOji+aOXmifWZeNsVJvGo83FUQfm5gRZs6dQTus8iTIWmKULQY7
         hnmzWCkhXW54BkkovM9VUOf8P8iSKZL230qT5P68ybNVagy29HbtYTRAL3vvbatjknUz
         mHXy46F50/QhfHO/5SnXcF+aHx6HGkKi4DMXQQbEab+SDY/xMdOKaZykwktGwHAJuJ+Q
         8LgZn33xL1nDrBXJwDMVBHjfRTFCIOPMStNGVg/vFz0PU5qiHm8vQSlhOPjV1qMTwF2c
         Josw==
X-Forwarded-Encrypted: i=1; AJvYcCWADxWExjZBT2ed9LPxvSUelCXFqKcPLiDmn080pk957podvt1UgzAoHaFpex95srbjhR8BVuwiQMskuYQk@vger.kernel.org
X-Gm-Message-State: AOJu0Yx08p0yeYDRczsH7rAyUJWsdVThKXIOd+2rpbaRBHbbmJuR1Jb9
	Gl07SStzsqKSnymhnI/FVMrPkNttncZYJe/a6AjQFfgYTUHME8GaE7HtA2l9JYI7ZOK+Gquy6iS
	oy1S+aIVY42B9JQ9RtCsH2QLrpmnHB1wbwxwoRlYd4Z9HUFiB9PWXnYQihDSq8gg17g3L
X-Gm-Gg: AY/fxX7ab6hiEttNjcbmy1yZsOtq1w7kGDn9N6s0OgTU3pw5jqgDEWsuPI3JJY5y9o6
	sSEb4fEqSviSrVDey7p/mteS4Zh9gN2mElt0cLBze3igtAUAuzFK9g7LhJqvh2SQvNHizZ6/O0x
	XBVrKKttHP/V99oJANY5MtSO336oy0QIeL5J9XItyR1KViCGtIG304HhGRV0SrUreaQqwk2LlWn
	IW9Oppi/L2K2FhGRQLEZH5SqIJ98VyPlq8L80Es6haVNJ3qCIYmD0gQ2XhwpAPOb36nTgvJuKgT
	Qu+RIJge906m1P4bnkbMRXbvc3IbRcraitsxBpLfI9/OI0QVB4cM2EuykpqZlmbFkNsvTgNgc07
	EGp98boSGHi0yCVivdg2+eQW5YdIVBB9LFUcCI3dJQGh7q89Rei1d9fMGwcfRKJaxCKwdPjNU8U
	BOwVQekw==
X-Received: by 2002:a05:6a00:4ac9:b0:7f1:7b2a:ab5b with SMTP id d2e1a72fcca58-8187dcd0629mr1271703b3a.27.1767662683767;
        Mon, 05 Jan 2026 17:24:43 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF3urWCguYaYUeKZrZEm5CcNDL24/JpPF3uSutfTy7tGULB2dLbAC87YGfsLVPwZYeU19kHEQ==
X-Received: by 2002:a05:6a00:4ac9:b0:7f1:7b2a:ab5b with SMTP id d2e1a72fcca58-8187dcd0629mr1271687b3a.27.1767662683158;
        Mon, 05 Jan 2026 17:24:43 -0800 (PST)
Received: from [10.133.33.108] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-819c5302c61sm345100b3a.42.2026.01.05.17.24.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Jan 2026 17:24:42 -0800 (PST)
Message-ID: <bab3794d-d7f8-492a-82a2-6a8a6f80a708@oss.qualcomm.com>
Date: Tue, 6 Jan 2026 09:24:38 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] arm64: dts: qcom: Commonize IQ-X-IOT DTSI
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Yijie Yang <yijie.yang@oss.qualcomm.com>, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20251222-purwa-v1-0-14ab9316e5ff@oss.qualcomm.com>
 <20251222060335.3485729-3-yijie.yang@oss.qualcomm.com>
 <20251222-fluorescent-turkey-of-gallantry-df0906@quoll>
 <b8f0e8d9-449e-4f32-832e-f1d5597ff496@oss.qualcomm.com>
 <6421f044-2b07-4518-9edc-b9b2ef49f4fb@kernel.org>
 <8bcf058f-5bf9-46ce-a188-e94954101f2f@oss.qualcomm.com>
 <4f79d090-7d1c-4fb3-a835-a7e4ff96f79c@oss.qualcomm.com>
 <448f2efa-5b1e-4855-a62d-2e375938b36f@kernel.org>
 <c7983b8c-5085-43a0-bd5e-1194df2f0ee5@oss.qualcomm.com>
 <a2b62af6-fe17-4c4b-9dea-4ba9cf312765@kernel.org>
 <j7i2oryel7d5u6gsbb54iaer7amqre2vzwkb6fieybascvonwi@bmt7zmcvg7yi>
 <36cb7d6e-ece4-42c7-bc11-b66837df5fc4@kernel.org>
 <469d89c9-8f6c-4abe-9d9f-b6a47f8cefd8@oss.qualcomm.com>
 <f54dc011-1796-4088-8bfe-be19e8bd9157@kernel.org>
Content-Language: en-US
From: Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>
In-Reply-To: <f54dc011-1796-4088-8bfe-be19e8bd9157@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: RakXxockswn5kukY2k8g1hLKGCWaATQX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA2MDAxMCBTYWx0ZWRfX6PF3RCok4sFM
 75SBsWKpW78MQX/espk9o1Teh4xIcgkCWR1e3cSUvAD6/1rQRj6fetdpwi3AQHcY/9TT16C9nf9
 z7KQTFg3NutfiwWPcDrGLikuSN28YmvX81Z7SXHrPAGiwrsCSzZf6lMZWhCrz6H9JdTutmpvusM
 ixXwhfZ/w0wRKwZ+ffLo7GamZ5g33dNiyO0u2Ha0+jBCZeerB898U2t/um/Zt9yhYVD10hkTdOB
 xVhkc+wzjSYdtQEivCrgOlVcCc2LonJT1ooIJtHkdyKuS1HcuGrMXtNX6xh0pPf9OmmkqW5uoRg
 EoiuVT/GT+gyjgbDcqgqjO1veW+Y7zqdbJG7sFXDafSMyesC6xc+aoHO5m4Kx2MnWe5k2BDfttv
 Rwm5OV+P7jCghvwlES0HgUs7thl8NXCshZuI7HnPJR3J4Nrs3Zv07iM5IpCC4pCC1w5crOYNQnN
 0LS+liOipI7beJIu6iA==
X-Proofpoint-GUID: RakXxockswn5kukY2k8g1hLKGCWaATQX
X-Authority-Analysis: v=2.4 cv=FK0WBuos c=1 sm=1 tr=0 ts=695c645c cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=xUmP3_sUEaRp8AZHE-AA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-05_02,2026-01-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 impostorscore=0 bulkscore=0 malwarescore=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601060010



On 1/5/2026 11:09 PM, Krzysztof Kozlowski wrote:
> On 05/01/2026 06:36, Tingwei Zhang wrote:
>>
>> On 12/30/2025 3:21 PM, Krzysztof Kozlowski wrote:
>>> On 29/12/2025 21:08, Dmitry Baryshkov wrote:
>>>> On Mon, Dec 29, 2025 at 09:47:05AM +0100, Krzysztof Kozlowski wrote:
>>>>> On 29/12/2025 08:38, Yijie Yang wrote:
>>>>>> On 12/29/2025 3:21 PM, Krzysztof Kozlowski wrote:
>>>>>>> On 29/12/2025 02:23, Tingwei Zhang wrote:
>>>>>>>> On 12/24/2025 8:12 AM, Tingwei Zhang wrote:
>>>>>>>>> On 12/23/2025 9:41 PM, Krzysztof Kozlowski wrote:
>>>>>>>>>> On 23/12/2025 04:38, Tingwei Zhang wrote:
>>>>>>>>>>> On 12/22/2025 5:11 PM, Krzysztof Kozlowski wrote:
>>>>>>>>>>>> On Mon, Dec 22, 2025 at 02:03:28PM +0800, YijieYang wrote:
>>>>>>>>>>>>> From: Yijie Yang <yijie.yang@oss.qualcomm.com>
>>>>>>>>>>>>>
>>>>>>>>>>>>> HAMOA-IOT-EVK and PURWA-IOT-EVK share a similar board design. Extract
>>>>>>>>>>>>> the common components into separate files for better maintainability.
>>>>>>>>>>>> SoMs do not share actual hardware. DTSI does not represent what looks
>>>>>>>>>>>> similar to you, but actually common parts.
>>>>>>>>>>> Purwa SOM board and Hamoa SOM board share same design. They share same PCB.
>>>>>>>>>>> The difference is only on chip. Purwa SOM board has Purwa and Hamoa SOM board
>>>>>>>>>>> has Hamoa on it.
>>>>>>>>>> I do not speak about boards. Read carefully feedback and respond to the
>>>>>>>>>> actual feedback, not some other arguments.
>>>>>>>>>>
>>>>>>>>>> NAK
>>>>>>>>> In this change, the SoM hardware except SoC is described by iq-x-iot-som.dtsi since it's common between Hamoa and Purwa. Hamoa and Purwa SoC hardware is described in hamoa.dtsi and purwa.dtsi. Hamoa-iot-som.dtsi includes iq-x-iot-som.dtsi and hamoa.dtsi. This change could reduce the duplicate code and review effort on a totally new purwa-iot-som.dtsi. If we found any bug, it can be fixed in one common file instead of two separate files. Same idea is used in x1-crd.dtsi. X1e80100-crd.dts include x1-crd.dtsi and hamoa.dtsi.
>>>>>>>> Krzysztof,
>>>>>>>> Please let me know your opinion on this. This could be a common case for
>>>>>>>> Hamoa/Purwa boards share same PCB. Share same dtsi file like x1-crd.dtsi
>>>>>>> It's not the same PCB.  You did not really respond to my first message,
>>>>>>> so I responded to you - I do not speak about boards. Then again you did
>>>>>>> not respond to it and brought some irrelevant arguments.
>>>>>>>
>>>>>>>> would reduce maintenance effort.
>>>>>>> Does not matter, I do not question this. Why are you responding to some
>>>>>>> questions which were never asked?
>>>>>>>
>>>>>>> DTSI represents actual shared physical aspect and you cannot share SoM
>>>>>>> physically. It's not the same PCB, because you do not have a socket on
>>>>>>> the SoM.
> HERE - socket.
>
>>>>>> x1e80100-crd and x1p42100-crd are different boards, yet they share the 
>>>>>> same x1-crd.dtsi. Why can’t we apply the same approach here?
>>>>> You should ask the authors there, not me. I presume that the baseboard
>>>>> is the same or very similar. Or pieces of the baseboard are re-used
>>>>> which could be visible in the schematics (same MCN numbers etc).
>>>> For me this sounds like a new rule, which didn't exist beforehand. We
>>>> have enough foo-common.dtsi fragments, covering similar phones, but we
>>>> never required the knowledge of those phones having the same PCB.
>>> I am speaking about it since 2020? 2021? So how new? Other people in
>>> other SoCs were sometimes speaking about it in 2016 or something
>> There’s no doubt that using a common DTSI makes sense when the boards
>> share the same baseboard.
>> I think the real question is whether the baseboards are defined so
>> similarly that they can be treated as the same.
>> For example, would swapping to a different SoC—similar to the
>> Hamoa/Purwa CRD scenario—still be acceptable?
>> Would exchanging components such as the display panel, a single camera
>> lens (not the sensor, as far as I can tell), or removing the 3D iToF
>> module[1] still qualify as the “same” board?
>> In other words, can we consider two boards identical if the underlying
>> circuit board is the same but a few parts are swapped out?
> I received IDs of the schematics for these boards, but they are called
> "IPC BGA module" and what I saw usually is that BGA modules are not
> mountable but solderable. This does not matter that much but should have
> been said, because it might mean this is not even a SoM. There are many
> SoMs which are BGA, not pluggable or pin-based, but I have just doubts
> that authors share everything...
Thanks for taking the time and review the schematics. That's soldered BGA 
modules. It's SoM since that's a module with minimal system including
SoC, PMIC, DDR. This module is available for customer to order so customer
can focus on carrier board. The hardware and software of SoM can be
reused.
> Anyway the BGA modules for Hamoa and Purwa have almost the same
> schematics, indeed, except differences in PCI, APC supply and lack of
> one PMIC.
Yes. These two modules are very similar.
> If this was the same SoM, just with different SoC soldered, it would
> have the same PMICs. Different PMICs means different SoM...
I agree. It's not same SoM, but they are very similar with same circuit board.
> Anyway, I shared my opinion and I am not going to spend more time on
> this. It should not be my task to go through schematics and prove that
> PMICs differ. Authors should.
We will make it more clear in the description about PMIC difference.
Since we have the agreement that Hamoa/Purwa modules are very similar,
we will use common dtsi in next version. Please let me know if you think
that's not correct thing to do.
> Best regards,
> Krzysztof


