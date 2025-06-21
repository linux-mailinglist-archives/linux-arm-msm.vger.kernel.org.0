Return-Path: <linux-arm-msm+bounces-61927-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C36BAAE2883
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 Jun 2025 12:11:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 42CDC189E2E6
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 Jun 2025 10:11:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61AC9156C69;
	Sat, 21 Jun 2025 10:11:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cfUG2dFE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE3871F131A
	for <linux-arm-msm@vger.kernel.org>; Sat, 21 Jun 2025 10:11:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750500669; cv=none; b=lOarU2WZRMJHB1xmU6lyN1zSLNCrCuSTZngq0rdWiA0yBm74Rv4edzdiLUtPgXsu8X/HcfmOykqJHJC/HSuj2YHlIghdlqLyemK3WPr3vZqZvw+itMz1cpeXSzfUA5JRHnbo9iGmbvpxV4fZTuZaGtyxr76v4KBjdRZDYmuhbTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750500669; c=relaxed/simple;
	bh=CZZT3WEEDV87AgzVeppysTU0hqzypFYvVqQ6fABNIxA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BEMd/CFfpJEPiDM4WjsbM1DQ0rqcktJaXwqTdIlmPuIIAuWbInSeDh35UHENdltRvhnepAxWLUxIz/FR6WM1wypXWLd9m1AEpDp8Jx65vWWSlgQRFSmyyowgmVabkxom3Tjj0BEaFALr6M/DpVwkyxeZlO1PhsjmuUVDIRtbaiw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cfUG2dFE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55L8E9qe006141
	for <linux-arm-msm@vger.kernel.org>; Sat, 21 Jun 2025 10:11:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Orq6xVb2NKaaLqSDAmeRwX94lHqJJdwkdgnmCDoC3WE=; b=cfUG2dFE/RicYKGs
	Vc/QrdzjZphcahHjfuSO2/TQildoS4dWYV3saCC7BMGYEQNmMU3uVYJjPzMV06+N
	PcmjPc4EZmFPiN18cPMjuDuP6XauQtmICkxqXNio6moUV/LFCBDHFaarsHLCFyeW
	s+4jjVEdrB/Lilb2qfiUy8FfhigyhX6yuuF6HyizuNX5nWsFidMImN7G7u0YD2kD
	RwP2sBkg7aQvSeQozvw8aR99P6mebg/WkvS600z1bP63iNl9tXFkSJfFJ/2WPnrN
	2P2a1cX/uMeFwxNy6MQ4GhIUelA3FVaQ8Idee4UiTxuMRCSfyDL+TW/s2knXJChw
	sj8ruw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47dpg20b98-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 21 Jun 2025 10:11:06 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6fabbaa1937so5530446d6.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 21 Jun 2025 03:11:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750500666; x=1751105466;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Orq6xVb2NKaaLqSDAmeRwX94lHqJJdwkdgnmCDoC3WE=;
        b=vWPvlQTDtpHCcj9FgR7clkKiAUXw8DZEdUtDrotfZ6SIQOPNjwtrBLHrWBDDCJdHzY
         ZaAhqbTdjOQwfacs3ObnLl55d2PRiN4ozIz3EXb+Xa8XVzc4uw88yX5xzu10ynbgqPRc
         YHGSG7cK2liKK7hd/BimtpMiJYdT93+YOmaLhkAYe1UGteTGqtxw2hDETzJVyBYBl9E8
         pjRnhpiiPmKAQw3U42ZH+8gm05yNthm39UeaU7QpCHEbT7buIEz56hwoJKBlqFlALmfk
         LoOJyua4l46JK3aa6kdYXndgGPD+6LGJy8ANfuMV700tiQdpLJusktMbzpQM/S2lngW3
         9+Jw==
X-Forwarded-Encrypted: i=1; AJvYcCXgJUtxqjDYTg6IJoEDW8PYQbUIxhvOLfHK/e4D5KBDvJDhVorqQsLdRU+gD0dMEZjYfVOeITru7trkyR4u@vger.kernel.org
X-Gm-Message-State: AOJu0YwKxn26e+2+MRp6KTpk0wmVTvZvzhua/LCj1I/z9QcgQaPzVKKS
	Qomp7ho5+WBKtmdYZvQXYOMZIBc8871yuIzGy4SZXRMqNombhdqHZ5CPJR+VWBjC2Sv21nrqHxU
	7r3bc0yR4lciwenompRDm0/iJzXsLenJ8XFPb7/DhmAIyQsH/+RMQzjkPAfjqVnr4PHcw
X-Gm-Gg: ASbGncuoiL+y3FTqxFGQA3+PiI040qtMIeSlSiNSmDbD5OYTAhNVKq5QFxXXbQbcC68
	4OLIp4fJYvfpmtTM5V3EF6qLd4YXEudAlBO9KofuPAcDWy/zTGn5kSfGefkm8WSLgWo/2qSxJwA
	oLBxv0hGgVMWjTvf8DNr4+BCoxFMmh1e2kgbmWmx0+lgnjVZ2NJxJp7q7EMaJHtdI4blyEu+iA4
	sgikNFZwMu2X23zgPMWnlNtLr+9GiJWQukQ3pr+CiRq0igqjp3RgBEY+8V3yjJeK635EM3ZtS5j
	VS16m8EL5CXNiQ7bJoI6gYyIymgKntXVfm0TK9y7qc20LW1SjOc9Dz1+gDLbo5HE1hofTQjTc2O
	4PBE=
X-Received: by 2002:a05:620a:2981:b0:7d3:b0a3:6aa7 with SMTP id af79cd13be357-7d3f98b41f2mr366508185a.3.1750500665803;
        Sat, 21 Jun 2025 03:11:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFI5hLRnCZ0sPSXDM3AR91gKrHB4k2pwB/s4SqmDLL498a11aGnE/v060gc2/bExJIzuAgw5Q==
X-Received: by 2002:a05:620a:2981:b0:7d3:b0a3:6aa7 with SMTP id af79cd13be357-7d3f98b41f2mr366506185a.3.1750500665404;
        Sat, 21 Jun 2025 03:11:05 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae05408300dsm339519466b.95.2025.06.21.03.11.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 21 Jun 2025 03:11:04 -0700 (PDT)
Message-ID: <f83cc435-7736-4003-b5b2-a84e2fe725c6@oss.qualcomm.com>
Date: Sat, 21 Jun 2025 12:11:00 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: qcom: msm8953: Add device tree for
 Billion Capture+
To: Luca Weiss <luca@lucaweiss.eu>, cristian_ci <cristian_ci@protonmail.com>,
        "robh@kernel.org" <robh@kernel.org>,
        "krzk+dt@kernel.org"
 <krzk+dt@kernel.org>,
        "conor+dt@kernel.org" <conor+dt@kernel.org>,
        "andersson@kernel.org" <andersson@kernel.org>,
        "konradybcio@kernel.org" <konradybcio@kernel.org>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        "~postmarketos/upstreaming@lists.sr.ht"
 <~postmarketos/upstreaming@lists.sr.ht>,
        "phone-devel@vger.kernel.org" <phone-devel@vger.kernel.org>
References: <20250620-rimob-initial-devicetree-v1-0-8e667ea21f82@protonmail.com>
 <20250620-rimob-initial-devicetree-v1-3-8e667ea21f82@protonmail.com>
 <d4564d4b-9510-47f8-9930-65d3c4e90e6c@lucaweiss.eu>
 <bWiyUA5cF4NjzEaUwhpDvfeqs0hEizZKFKxQpsfj6htES5mPGO2Yf2AHZQcUEyR4x7Zx9kVvwenpc2djbCN148IbjtgLh7Gq_1HXicp8kms=@protonmail.com>
 <ff29229c-5458-4500-9b11-8044a461cd36@lucaweiss.eu>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <ff29229c-5458-4500-9b11-8044a461cd36@lucaweiss.eu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIxMDA1OSBTYWx0ZWRfXykRtIeJPwv+z
 yAzC+KlF09dDbSjwZjdkYMe/Y1TICNysqReW0IvSCQN8VSGrnUMFJDQhVzdz5uuub45P/6VMDfv
 hckCCjqwxzKgJdZmL8Ja1pU0BZb5tF0P7ImLSKtZ6Y1kO+UF1C87zUzibF+h6oN2/8339xkrQIr
 jo7OeTiuA5gYX8G8Ajqpwq/cesoWuSMhRa6GHObAOXQ48U+i7xWaJKetNfFAA5NCUxI9WLdkkPh
 isFzzKoT1F10Q3A5sVK8y5401C1d7OAByTRoqgCg1iyu5KtjPfL3PEe2BootWmcbHm/UH6eDJCg
 vIiE7wDG+d33nomhAhbio9KAmo1Ml97PJGR+CsCCvAOlJdV2vzsQcbLXZr9/KAsqkmCmdaa4aY2
 zpJt6curj9ZyzPx9HIAts56vUqyHJDUS/KkkzuC2Id9fJmPx2I93IsO+iOBNkAoI7I1t7fz8
X-Proofpoint-GUID: 0jQBkl919U3khbYtxuJZewJ2aVz83So0
X-Authority-Analysis: v=2.4 cv=fb6ty1QF c=1 sm=1 tr=0 ts=6856853a cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8 a=dlmhaOwlAAAA:8
 a=1bQLa7EovWpukNELjvkA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22 a=y4cfut4LVr_MrANMpYTh:22
X-Proofpoint-ORIG-GUID: 0jQBkl919U3khbYtxuJZewJ2aVz83So0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-21_02,2025-06-20_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 mlxlogscore=999 clxscore=1015 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 phishscore=0 suspectscore=0 bulkscore=0 adultscore=0
 impostorscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506210059

On 6/21/25 11:27 AM, Luca Weiss wrote:
> On 21-06-2025 9:07 a.m., cristian_ci wrote:
>> On Saturday, June 21st, 2025 at 00:20, Luca Weiss <luca@lucaweiss.eu> wrote:
>>
>>>> +
>>>> + reserved-memory {
>>>> + qseecom@0 {
>>>
>>>
>>> qseecom@84a00000 ?
>>>
>>>> + reg = <0x00 0x84a00000 0x00 0x1900000>;
>>>> + no-map;
>>>> + };
>>
>> Looking at downstream devicetree, every reserved-memory nodes with "removed-dma-pool" compatible has unit address 0. OTOH, kernel documentation [1] says:
>> "  Following the generic-names recommended practice, node names should
>>    reflect the purpose of the node (ie. "framebuffer" or "dma-pool").
>>    Unit address (@<address>) should be appended to the name if the node
>>    is a static allocation."
>>
>> In my case, downstream devicetree shows:
>>
>>         other_ext_region@0 {
>>             compatible = "removed-dma-pool";
>>             no-map;
>>             reg = <0x00 0x84a00000 0x00 0x1e00000>;
>>         };
>>
>> which will be 'qseecom' reserved-memory node in mainline devicetree.
>>
>> OTOH, 'qseecom' node in downstream devicetree also shows:
>>
>>         qseecom@84a00000 {
>>             compatible = "qcom,qseecom";
>>             reg = <0x84a00000 0x1900000>;
>>                          ...
>>
>> If you confirm what you suggest, 'qseecom' reserved-memory node will look like the following:
>>
>>         qseecom_mem: qseecom@84a00000 {
>>             reg = <0x0 0x84a00000 0x0 0x1900000>;
>>             no-map;
>>         };
>>
>> [1] https://www.kernel.org/doc/Documentation/devicetree/bindings/reserved-memory/reserved-memory.yaml
> 
> The name (qseecom@84a00000) mostly does not matter at runtime, it's just a nice label we give it. The reg is the important bit that gets used in reserved-memory.
> 
> But actually re-checking, I don't think your reserved-memory works right now, msm8953.dtsi has
> 
>     soc: soc@0 {
>         #address-cells = <1>;
>         #size-cells = <1>;
> 
> which means that you should only have one value for address, and one for size, so "reg = <0x84a00000 0x1900000>;". This is different to most other Qualcomm arm64 SoCs.

reserved-memory {
                #address-cells = <2>;
                #size-cells = <2>;
                ranges;


Konrad

