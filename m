Return-Path: <linux-arm-msm+bounces-89568-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B39BD39F6F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Jan 2026 08:12:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2B38E304BD35
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Jan 2026 07:10:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 071AA2DC337;
	Mon, 19 Jan 2026 07:10:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="m/dKHOT3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FYii0XnV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 483AA28CF5D
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 07:10:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768806632; cv=none; b=MiotazClGQ1mtcgMhP34kUshwxMGgkvVuLZbhjzxXVPMe3ibBzEvmIM1OD2kf8CSZeNa/xPPQiQlBnrORi28OkWnLqZLCm4ebMboPSMDwA1pXRYuFyYfxdey34mYC7ocQr4rtkfAbVreQdm0h0g1pvRsbwfsEt3Xdi++DaR8LGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768806632; c=relaxed/simple;
	bh=pUC9v9oitjZLE64qwOFr3kGrcoEEO5fBHZGhYe5+YHY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XnBpHaiikP//YrVPTBMhPaS7S0FGsnxd2S5ZqfsTHQwybSPQ4YAnhfdg9TM9oCQ3o+rcsQmN78GIanjZkMMyU2N9AacN84Y1ExTZCMspFfswG/k5c2REDFMd3VV1dxXkUeC08zKhr07qGLA+9FY1Q1uOBwOx+DW9QYXYzJXGajo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=m/dKHOT3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FYii0XnV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60ILObd0439256
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 07:10:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	V8g+LK10KwOQVtxVMa00VwCtVnFyBFrSBG1PYxfFG6o=; b=m/dKHOT3Tx7l92iD
	ZvkeI/DCr1DNxbTnIZov5llu2GlLVkpit1rVAGl5xbHpfzPZG6uVVbkg+5Xk5aXp
	JqjRf/0c1JWdL0LDiedMJ7NR2ZEIWEvmZaQvylWurU/zqBLFEFPO+oR/7bsqWdJQ
	7CUuGGnTUb8cduARoXzOkFPEFdtEOqCNZva2oKJVbOOIhvSnuS5HbFv2na2KYMqZ
	vzGXn7Ua4Zsjb18hKBH2r2yFoDpHtuCWW6NFceLBK6j41mGk5Je+PPSPcbut4dgd
	ICicK1Nf+QMpvI6IoOBDnKXUg+dE4FAzuVl0hJNXDFdXaimkqBQ2quwFzDBFC+25
	3/poDg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4br1e5m7yv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 07:10:29 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2a58c1c74a3so33476105ad.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 18 Jan 2026 23:10:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768806629; x=1769411429; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=V8g+LK10KwOQVtxVMa00VwCtVnFyBFrSBG1PYxfFG6o=;
        b=FYii0XnVPCr1t2eKboDBwfxYU4F0IyHmWP5yJR8LmeEggvOXI2qQC0JeBSe3lliz7I
         bJMFmlWXSPX22w/KGBuutgug3ILLRa1TujlmovKV6YXgJCgP0Gp1JntagvUpZwVVZhcy
         6osvX+F5pNjkGjvBnBwa/eCfIJLFqWZP85pIvUjLL9DwQScSyaJU36NOFMl5kEPZU8oS
         Wo30pV+/8cbJ7bBtGALt1PR6ZrIC73ChFmaxZaoQKi9L1Yj3tPT9JQFGRbAFDT27qmRl
         /RgU043BzudJV2XcbHJA543UOtVTcytFSV6YeahXDnbNV+c2bCH9vzbGDaBEDP2S/o55
         Iufg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768806629; x=1769411429;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V8g+LK10KwOQVtxVMa00VwCtVnFyBFrSBG1PYxfFG6o=;
        b=VYjHdNDC2q/FyZgwigrnphQf9MA214Su1DgW4nlzDtYNSzCk2yHY58SUMWvlsxJ2Lc
         eUkYuB+W+BSFrHmvYBPBDfm107l9GecgNXYsnVM9AmVAlPm/kzOd9Oq/HIwgAEohiqCg
         SDZ5lgRTLPbetiepwmRJa5S0NAoFjCOqGJNFb1hiXfSjkjyQeRPRc1qmIiuAIhWu5dws
         G4036POta+OxyNbXAUukZU3yohVOvymgd35Rq2qlKbolkb9KcDgvUD+9dg40Zi8F+isa
         9Iv5bwkrfx2zdA4vFlORD1cAgWrMN/VHE30cJqnp5LtXvPOqWkKVirbsviAuMXphvcb0
         KWBw==
X-Forwarded-Encrypted: i=1; AJvYcCVvTnwojk7oVY3bS3tlxTw8oyZFs3tMFnsF1rIJDAOFXtOd6TfINcb2oK/OyT+r7P735wsoixyyqntjpnZ+@vger.kernel.org
X-Gm-Message-State: AOJu0YyobpyeOXFJNN5iec5XkzikLaI4qgXNMrRgDNqvLWAeNhnrRArh
	drMF5LHOmX6QCCWaRwiylxGKXHvsgRjE3JkjDU/aoERjxXPJF/+QPBI/sHGKZEkaA8c6DiVbHGL
	nKsP32XKH1zOiHkYgwWgelpYCEtO40+sbSLEVzjalNhXCZc1LhOjyCoPmuyqa6ocZ6o6n
X-Gm-Gg: AZuq6aKFKJgsppPY4zqIGkuX3KPSoDmCKx46DRY891tf8XLcC/cNWF8FfsWUHtfNJ63
	WjHB0wMybBHB2ZgWojPitJX07kB7h2rbKKkGCj7Vu6TitLl6XFOafbt/l0pZ+tnx25JX8b4QO20
	UVCEyeiEMpUhGy4hMSsIb+G1wit76qSEegb2NB0iSFJqJEQ3GAzh69530kymqZcYpht+wAoHy/K
	loh6aIh0PnXT2FTnx81IQ16+Q0HZnuTp4kqrFoCnxIJEKzEZAByIvhz5kgX5Iinub4qb7yft382
	oh7bqHHXZvsHjTRVZM4pDWnmhZip5PXDpmi4FPs9LJIRI+o2XU/89eaz6AW/5hsKjmtdIHLba0V
	GO1Hp2DJug7rgDj6ZnbL4p2oPDlWOJQgS8unRBBGlKaNmRPckk627ng6Ywu73udKlzvwX2d6qgi
	cFBXw=
X-Received: by 2002:a17:903:17c3:b0:2a0:fe9f:1884 with SMTP id d9443c01a7336-2a718973282mr87977875ad.55.1768806628959;
        Sun, 18 Jan 2026 23:10:28 -0800 (PST)
X-Received: by 2002:a17:903:17c3:b0:2a0:fe9f:1884 with SMTP id d9443c01a7336-2a718973282mr87977635ad.55.1768806628437;
        Sun, 18 Jan 2026 23:10:28 -0800 (PST)
Received: from [10.133.33.126] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a7190ce2ebsm86095595ad.32.2026.01.18.23.10.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 18 Jan 2026 23:10:28 -0800 (PST)
Message-ID: <4345645e-c1d0-46ea-b0d7-1c7c13b22a7e@oss.qualcomm.com>
Date: Mon, 19 Jan 2026 15:10:22 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/4] arm64: dts: qcom: Add base PURWA-IOT-EVK board
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20260116-purwa-v4-0-89b2adae9f09@oss.qualcomm.com>
 <20260116104136.2922032-4-yijie.yang@oss.qualcomm.com>
 <d15bbe2a-a88a-4a88-a685-ecd4f058c3af@kernel.org>
 <3404f2f4-7edb-4bff-925b-0a6a7a450f5c@oss.qualcomm.com>
 <eawxuhblnho4pyeyskvk5s4ouqser7o5jh267ttinzeeowxfxs@y6nl2qbdydb2>
Content-Language: en-US
From: Yijie Yang <yijie.yang@oss.qualcomm.com>
In-Reply-To: <eawxuhblnho4pyeyskvk5s4ouqser7o5jh267ttinzeeowxfxs@y6nl2qbdydb2>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE5MDA1OCBTYWx0ZWRfX+MFXrqG5XXcf
 7D12gSNFDW6MV02kBlFlfaGfa+1B8G69VyaJ+wsqJFv+5ujZX/sffavq9VOIf2b47sq0i7yLSjp
 vLJUQ6b8ixD7gQXjMTakw3ecYjA7FKZfBQKOq91mM07T70Y7sBIvFn9LDWZ349Z72X3hlFV2X7d
 5IRu4ihdAypSGdpVJOEVQzdDg2MuxAPir4tGef8PWGNF+xrLCxwur3bppi6WfyCiXmboH5uKXfb
 g3g4oygpK1agAgoL2FdRcIE9xAyy1uiM+aIf8zAOWezjPoMTjNt1iWWHT9kmnTYGS861Fzrcs+T
 gP+5szvvIz3Fzic06Jkns0d5g6IBVcbQhTj4MDIFPaV32lpZI4W2O990w+aXBflA26KzBqPMIig
 zeIeU2M2ykZR+R1cenmoGDnzXd94IypYry50ioEsLoJupU+pmPL9zELeJx9r0ojp6edd8S/DhrC
 QuPumjBOMJ0Qn/HKEmw==
X-Proofpoint-GUID: 8a-PwuL4pEqF-JaL2LwbaiCIqK4bVHms
X-Authority-Analysis: v=2.4 cv=U5yfzOru c=1 sm=1 tr=0 ts=696dd8e5 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=1ir06EIKMARb4SxFNewA:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: 8a-PwuL4pEqF-JaL2LwbaiCIqK4bVHms
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-19_01,2026-01-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 spamscore=0 phishscore=0 bulkscore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601190058



On 1/19/2026 2:33 PM, Dmitry Baryshkov wrote:
> On Mon, Jan 19, 2026 at 11:13:29AM +0800, Yijie Yang wrote:
>>
>>
>> On 1/17/2026 12:19 AM, Krzysztof Kozlowski wrote:
>>> On 16/01/2026 11:41, YijieYang wrote:
>>>> From: Yijie Yang <yijie.yang@oss.qualcomm.com>
>>>>
>>>> The PURWA-IOT-EVK is an evaluation platform for IoT products, composed of
>>>> the Purwa IoT SoM and a carrier board. Together, they form a complete
>>>> embedded system capable of booting to UART.
>>>>
>>>> PURWA-IOT-EVK uses the PS8833 as a retimer for USB0, unlike HAMOA-IOT-EVK.
>>>> Meanwhile, USB0 bypasses the SBU selector FSUSB42.
>>>>
>>>
>>> NAK.
>>>
>>> Warnings were reported at v3. Did you address them? No, you completely
>>> ignored them, so warnings are reported again at v4.
>>>
>>> What do you think these emails are for?
>>
>> This warning is caused by the pcie3_phy node in purwa.dtsi, which is not
>> introduced by this patch set. Since it does not impact functionality, would
>> it be appropriate to fix it in a separate patch?
> 
> Why can't it be fixed as a part of this patchset?

I will fix this after evaluating the impact of this feature.

> 
>>
>>>
>>> Best regards,
>>> Krzysztof
>>
>> -- 
>> Best Regards,
>> Yijie
>>
> 

-- 
Best Regards,
Yijie


