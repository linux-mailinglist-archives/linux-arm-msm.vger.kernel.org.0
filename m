Return-Path: <linux-arm-msm+bounces-88453-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 55DBBD10D38
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Jan 2026 08:15:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8A3AA300F32C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Jan 2026 07:14:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CBC4532AACA;
	Mon, 12 Jan 2026 07:14:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hNqwYHDk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KcYb+xZ0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7910D320A06
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jan 2026 07:14:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768202098; cv=none; b=UPIfg7FVPRm87imY9l1jxqWDv/E6ew9gh+NJ+towJYamnTScgrtJc9WisHyGSCM+okGBY/bF4pabo6WLEMB7OkO3FF7GJJg/W7RmBQJcSHtQE8cwtd3H2PYcFGM/KGLrQHDIexQJ54Boy+A1U7kuFUCF1LPjrOnzeo8/Ig5Fzh0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768202098; c=relaxed/simple;
	bh=oe0zdQ31sKVrqQX67MYatzmbLE1OU0+JlNjvK+Kg9QA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hQSNlHQwP0217PxTRdgKGnpZ+5+tZocZXrc6Fiz7JPbtuM5FejBM80k2a+DMZ7h5TnaAFclJNEz+fxMruRccOX2R4+Ms9Q6MAgRtyYmQCHxTSf36l4TnjDWDhMKxV/EKLYoktzsFX/i6qispZsu3s6HuQ2apQ90hEYsYXx0LD6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hNqwYHDk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KcYb+xZ0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60C6wVOY3207283
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jan 2026 07:14:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	61sz1P9DUBPPIhlFcpugdDM2PaZEgojWhWVX/0vXAsE=; b=hNqwYHDkjZCRc+uN
	fxVxiRBRamj2qsfbXjdiRXeiLSYiqwFd9DyRmuX3CSQ7YACV0bqyhZN2GDeLJzCQ
	zfatcuPGhK//pbwpPXYY18uYZnMbPpuFYA73T4G9MdlbvhN0us13L2XHo5DCDTpY
	WRf/SigixpUrAOSGdpJFAq3jUvL0juYI6b6mwrOJwSLt4NrdpRMIitgJFWbJXwP/
	4cN1fyq8MyVHnsrZd/rID9Qn4KQO2zoCXd4icNfKllPImtuFxvmBUvOWE899Hmwu
	FxFdjZQyZXeXHdYaQn+7+f6poy2NQ3ciAETD/5boFcrEG1iQGwHqExPUFgc3g591
	K1VfeQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bkfhakv81-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jan 2026 07:14:56 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4ed69f9ce96so220075991cf.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 11 Jan 2026 23:14:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768202096; x=1768806896; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=61sz1P9DUBPPIhlFcpugdDM2PaZEgojWhWVX/0vXAsE=;
        b=KcYb+xZ0RbydvQvPD9IxIw+vYqJ1CAzcfIsflo1ntabr9rYguOZdwsRwSyWnnvheL1
         CWyaVHyIGzVl3wDFVz9HqmS5EUDNorFx1uQG2B/IVaDsm4BAKPNgW4bYrJ9S92ysAqEV
         1WUdByYRiyf75N7PBDhG7R+Hz4x/QXZgl3jjROMRNsK7w6Z2J6IA6c8YwNEhO/FUbs55
         U7Hxs82YpHpQCBl5ffOT7aTwzkh8DoFviFnu9ihdtZHchO5X16mOiF2KJiFDmkYscK8/
         P1tGTj7nOaIyvgmZVkUTLh+RdcKsY1XPUrXZOdfJ0iZ2FI9XU00ZgZsrw8W7yEbV+6nV
         qGQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768202096; x=1768806896;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=61sz1P9DUBPPIhlFcpugdDM2PaZEgojWhWVX/0vXAsE=;
        b=awQrh5ZGm0L+/QAXzujwwHB8NPF39uWfDAXM2jFLsRplK9gycVF+bKAdjR+qdNULT6
         f9ZYCL2NI9x0RYOmdgs0+g1Z+/CxM7MAanmP8cexd2gJtExIVtuZ0+mk18VwNWZSRlKn
         hm3GNJkLJUwM3fS4B8gAZpKOK+cvqNV9IpDwohZtJjsK6gj7vGEWSqQlbSXbwV7DwZPN
         halpRexV4ZayJZBp6Yfyi9hpGP9+ccP3YpSsttq6WGeHG+0MhC79vYciBS/SguT2k9kn
         tTkuxAu81+ikRiV3C1KJwcwOVmFCbQXQaBpt/Xu3QYgYYPv2FV7CZPmS/KVv8G0l6pKG
         2+FA==
X-Forwarded-Encrypted: i=1; AJvYcCUGNTWIN9Cc9rh0Qj0P4jAIWxCQeZlMcK6Ug9Kdy7r7fWnmEVe8gJ4bnZKI1r0eXpHI5oFV+Ag5eG3fyqym@vger.kernel.org
X-Gm-Message-State: AOJu0YzV30T8ZK7Trs4hHXbvfhYjpHN02p1sdaUjNkYLDAYMPSUxwrtW
	SgxbUzOLHqOrADSOVrwac8KbDMps/tN7Ogf6qnaDxtCZQ/2rW1pcTNWBV+aVvWAJ03qPiCiThjq
	NaOTdZztxNSnmOiDNn6AlMr7QYsZVtpib5cEF5ot1wSf/ooDXez9QLfNjn9O2pztHSKkJ
X-Gm-Gg: AY/fxX5ORgNY8JLplNEpMwGquZynHLqBI1PozB5EdvNCDLv8ZRuQbssXcgTklN8TyBf
	IVSfAoYKazemJHxXnjfvTvXG4fWtk1fuVSmo3Amyj6EBB+EbL+OqVvxxD/0rN9MXqMqn0hAIqYz
	4qeoMk46sT35qEbguetRswXjoof7u1kOniojMxkP44gmwiXBbi9rjEjmG9dirq1antUwAADqrss
	lQTccOqPZY/GOq45UVSXvTTZqEx9mhQxDZKFn5SuJV6cUVqpOg9C+ehvDUN/Dv5XXl/BUh7fArn
	Ciyite/RZvsxow4fYAP9vm1t6FANfYQvBkW4srmRF5Hnv+FDWBdgMOUcFZveqqOSKDAaSXOv0aJ
	Cft+dmpW1M3EsSOq3hIe1UbU3wa7wLpJvfw5JKg==
X-Received: by 2002:ac8:7e82:0:b0:4ee:197a:e80a with SMTP id d75a77b69052e-4ffb4a1d231mr229689401cf.77.1768202095804;
        Sun, 11 Jan 2026 23:14:55 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH/AKsWJUj2GJQlVB/oRGTZBexbiGtibRZPhGC14F/8euSr81m2ti5pd+EYNdXl2sxi2KVnWw==
X-Received: by 2002:ac8:7e82:0:b0:4ee:197a:e80a with SMTP id d75a77b69052e-4ffb4a1d231mr229689191cf.77.1768202095323;
        Sun, 11 Jan 2026 23:14:55 -0800 (PST)
Received: from [192.168.1.29] ([178.197.218.229])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b842a5180bdsm1800440766b.57.2026.01.11.23.14.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 11 Jan 2026 23:14:54 -0800 (PST)
Message-ID: <9b564eec-bea7-49d6-b6b4-614250ff0503@oss.qualcomm.com>
Date: Mon, 12 Jan 2026 08:14:53 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] arm64: dts: qcom: Add base PURWA-IOT-EVK board
To: Yijie Yang <yijie.yang@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20260109-purwa-v2-0-f39ee10684cb@oss.qualcomm.com>
 <20260109080000.606603-4-yijie.yang@oss.qualcomm.com>
 <6e8e6583-033f-439e-bd92-b24fe432fb96@oss.qualcomm.com>
 <3959a318-aca3-43e2-a431-4a9ae40f911f@oss.qualcomm.com>
 <ak6xsow3cobhe64y2koa4v7w5dkdc4v3zlmpokws4nxmu5c6rt@kdgm2oqxxvcl>
 <d5d1d6c0-87ab-42a8-9816-359a64b9112e@oss.qualcomm.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@oss.qualcomm.com; keydata=
 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
 cwzYbmi/Et7T2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <d5d1d6c0-87ab-42a8-9816-359a64b9112e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 86jZbrIUqYMhwh7X5ZRJMEi7lfQv8XoI
X-Authority-Analysis: v=2.4 cv=bOEb4f+Z c=1 sm=1 tr=0 ts=69649f70 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=Eb9f15NH/cHKzfGOmZSO4Q==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=5p-L8BiwTOc0Zqi8YbgA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: 86jZbrIUqYMhwh7X5ZRJMEi7lfQv8XoI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEyMDA1NCBTYWx0ZWRfXwkN4qMhAUw/G
 T90BtpWvuo63cEcncqLNMTwxMS92FHCkT5mknl/63bLv1p9ktlENZUe5GDgAatML4ToGKsqCUXP
 9UaVXXS0rLnEFnFL57VZag07JLHPTwRyqklfIy3KK10dtLAZ2/7Prz6bscOPjao4U39UDS2S/Oa
 dWhpC8dovva7lBIz/xQCTDXiKZe4PjVr2vJ4owq0EXPByAyMhjjegpItEbx3Hhm3AqhYBpkWEyi
 bDc09RdxPf0weaCJd6+CHKEO9fgNmGcT2wplaH69u6iEpudFNtd8WPwVhJFPSggOk4D3PLQ3hgK
 P5TnSVRrhfqSp8KrO+f4UNCst0Fv1Tfkm0paYOi3p1i8PGf6EbDB3ZKMvKAY1nXLQYMVGcQJSYd
 cVLAmRlH7mSKVy6KYzBQVQlRu2hm2dVmfQMPplvwpBAgEi3/5Lj6BhceqEVIOt03jGxjWwbt7/D
 LTGnwWAG3RUJHFznpkA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-12_02,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 impostorscore=0 adultscore=0 suspectscore=0
 clxscore=1015 malwarescore=0 priorityscore=1501 lowpriorityscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601120054

On 12/01/2026 06:51, Yijie Yang wrote:
>>>>
>>>> Is the backlight infra different on the Purwa IoT EVK?
>>>
>>> As you can see, this Purwa file was copied from the latest
>>> hamoa-iot-evk.dts. However, not all nodes have been verified on Purwa.
>>> Therefore, I need to retain only the functions that work correctly and keep
>>> them aligned with the nodes from my initial version. The deleted nodes will
>>> be updated later by the respective authors from different technical areas.
>>
>> Please, only delete nodes which are not present on the Purwa IoT EVK.
> 
> This isn’t a deletion—it’s just not ready yet. Why do we need to include 
> all the nodes like a mature Hamoa platform in the initial push?


Because you said it is exactly the same module...

Best regards,
Krzysztof

