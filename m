Return-Path: <linux-arm-msm+bounces-81596-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id DB982C57154
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Nov 2025 12:05:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 9BF983541BE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Nov 2025 11:01:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 378063396F1;
	Thu, 13 Nov 2025 11:00:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RjbrXA50";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="joYBJEgN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABEA53385A5
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Nov 2025 11:00:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763031649; cv=none; b=cAvNqOgwS3Gtxu/Xta8ETRE+hTvUA3zqL12qYTtCF79oATReGGmz95TxDU2T/1JjOdYjWdpr5nh/FadEkOrOUXB+TCI07WgoiFpuQo3iIsgUNPuUmaFiHcVonY8ujdT4NNgfG2VANS9eGqb9l8JDkvAFU8VwP4P26VzOSr7JAQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763031649; c=relaxed/simple;
	bh=m5MeXEG3jZ6w84sxyLlnVWrLy9Qi9HUWIDgjc4XX0dk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bDLApCFYm0xkQWekUzLZzIN8zuOsH6g2O7AP74hcrGlroSxoXkvSQdNeYWXTJc8Jf13EE+Z06/CUuDgSdSdykP832RAG2gg9dcHj08TxGTkeqVcg9ZYzmAlTs7V3TZlmWfjrP1MzD0souRiWjVEhAYSX7gVVHAZeJu79I+GRr5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RjbrXA50; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=joYBJEgN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AD8v1eU3035671
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Nov 2025 11:00:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Dctm8dTwaNPV9EO1BqVmXYSJCSP7ANhI7WYmBi6vq2c=; b=RjbrXA50z6h7NNvg
	jOCNuSSFppBjleq/dMjJ6ijGPRgNDSWUbjMfByueEa18RzFDKdyhNbzY/l8qkkVE
	FBTEl0I/4TMpsiCyaAdwDROO+BLSNJOU8EQCmDotWjsW/jepZRq2C48sRc0Ph3wT
	ChkTBLlZL+/Yglk1uQTJoSIo9jDXEYRql3QF1INXtKAgMEziQkGwu8jMOHtDkT7t
	X8KB2KJcTGh3QEGxFF1taxqg2LlrxDvSUh3z9livUcPjBfFsRnfGItETb/9SZe3q
	LzlI0P8HJsuMFvHcrHT7Haf6kE8oLJXRj9sT7me/jpaNyATHWUOd1XFbFpqUTCdg
	6Vo0pQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ad4ju9tqx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Nov 2025 11:00:46 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4edde056714so801671cf.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Nov 2025 03:00:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763031646; x=1763636446; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Dctm8dTwaNPV9EO1BqVmXYSJCSP7ANhI7WYmBi6vq2c=;
        b=joYBJEgNPr0Tn3imDasr75grsem/t8CV/rJPIMzd+vXK8hX3QXR6Gh+hG1HHCjDg+O
         1/5+GYtOJF2x3cQRmzymN9iDozoJvpyppL1nPHoIKcUWLP5nvKOmyhCtM3+FrKMtsMpj
         dJvWgPs3BatIaLfy3mAcG4NOM4XTqJ6xlAuBqawPSdaL4Onb85zg+OvgX1D4n7ENmKwA
         8NctrUtxULljvlkN65zEmuJnuCpPH9FI9w8Anc0drJIxck0P9/ewkdfsCpu5LxbKAmX4
         c8GAxyAUBKSiF2AFRj024wvNH+EQa1wtMKVe+6/eLEm20R1L+yFWZ6frzDXo0n3AQdAE
         YgYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763031646; x=1763636446;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Dctm8dTwaNPV9EO1BqVmXYSJCSP7ANhI7WYmBi6vq2c=;
        b=NJUWcxXla2DwqJ7nMGiHN4eyj8D7zaezJsdCpNTI3doF3tZOtxSpXcFmOQvt6ZX7Sw
         /7MusGzzKzrmfS7JCTCeo5m65jKciuKaPb3Ft4ntAtmyuFbxRp3XSnr6Q9YdZbLKLb82
         +bbGE4756wqkstqkO0UZRaoV2pxwYNRlyqszWyajD60W9Bfi3x0VsA4Qf9NWxZLsvDg0
         IM6NE5CZYc/s4cQrk1ApKE9AkNz62MvVCZxi3CeFY+ZGNbVij7IFVU4IDRAzzgFxh/qw
         rTUw5GdwywcjCgLNEjMALiLoxHuKCxQgWfx6Dxpip/HQP1WePXRJ4p4UVtTUe3u0sqwS
         tJFA==
X-Forwarded-Encrypted: i=1; AJvYcCUEkXr+7ylA+QXN3VeB33+8HRPCbH9O01kN7citCcrX8BTBiVYs3On58ZSbm6doRcW1FsYU0PYKfn8JHW7+@vger.kernel.org
X-Gm-Message-State: AOJu0Yzm7Hs6WjrCVTVFcTOxxDZHS1uzZvq6ZZBV0b7MOtnE1yuN5qua
	qjI5Mqp1eOQBHwXfc1hWFPdB8XzrYjKc96J0GW+ILeBq/apS/k6dvlU9ahjYGK34jvV9F8eIN+C
	A4gRN1R04gKI2Od6Jwk5SVdY3FUYPlA7nlCBVYg0DWvok/yq1AT75UnSpsk5vqf0CbeZg
X-Gm-Gg: ASbGncvdvD+UXR1a/q7LUUKNQ0i69nqlnJPbk73ACwlCrws8u3D8I4Iy+2UvMpB5Y0Z
	5Ygyg+Gy+XkluW1G6lPxkxpK1wHP0UM3yRIxJKSguLDorNAtXWiDKxcMG6/G6beM7O+WriYzIJE
	v2IyJPmXJ9duKj52nzVIeQ55Ail0zpe/bmI9RWDMCqCcUble+MsMdPknwYKtGyWFa3Z4vtQQzEB
	Dg5NnAPp9IeuGByeKBNEzwk5lid8U3uLluMWnF1cY1Rf1X7guV92mQSkecYnLTQ9j9xs7uuu8Oh
	o2lW+8I/dGG7ZBGiO0JZYXnS1NZ1NCst77p1YzeLlra+kifxehGgmY2Kzi9wFThVikZBPMj4Si6
	v6lUdJ5KlmrLCu6/A3qf2JsCkjV0l85FtthXSNw2HS2Qkk0iECZRDfoR/
X-Received: by 2002:a05:622a:1a18:b0:4ed:afb4:5e30 with SMTP id d75a77b69052e-4ede794dc16mr20378481cf.11.1763031645529;
        Thu, 13 Nov 2025 03:00:45 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFlVsSXjGAfEYJjZnev0pvnXR+ZCVmOPqmdnlNGvxTXW2vNS2YbvXEmH1mcjxmr+DTcdG+UNw==
X-Received: by 2002:a05:622a:1a18:b0:4ed:afb4:5e30 with SMTP id d75a77b69052e-4ede794dc16mr20376831cf.11.1763031643184;
        Thu, 13 Nov 2025 03:00:43 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b734ff75e4fsm137001066b.12.2025.11.13.03.00.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Nov 2025 03:00:42 -0800 (PST)
Message-ID: <fcb093e3-05e6-4e77-9150-25f9a76f8937@oss.qualcomm.com>
Date: Thu, 13 Nov 2025 12:00:40 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] dt-bindings: firmware: qcom,scm: Document reboot mode
To: Bjorn Andersson <andersson@kernel.org>
Cc: Loic Poulain <loic.poulain@oss.qualcomm.com>, konradybcio@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        sre@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-pm@vger.kernel.org
References: <20251103182006.1158383-1-loic.poulain@oss.qualcomm.com>
 <20251103182006.1158383-4-loic.poulain@oss.qualcomm.com>
 <aqoxdaq72prkeqwxmmohlmbpx7icuc32sej7did6vt6rzrgfib@bvmt7ppkvloc>
 <CAFEp6-2GGA2gvBKfO0fZemVmJmjQpTQEJ0vLfEewfhHKOYQGSQ@mail.gmail.com>
 <be0a418b-5e8f-4895-a3b8-482b6ad6a40e@oss.qualcomm.com>
 <sdhnchve6r5i4frhlx5q7lod5npzosbfdjjyd56l2z5ksoe4t4@lhm6d2pzsztm>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <sdhnchve6r5i4frhlx5q7lod5npzosbfdjjyd56l2z5ksoe4t4@lhm6d2pzsztm>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: -8PvtlFj8uIsRJTaPIg0JRvc6qdhqwJb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEzMDA4MSBTYWx0ZWRfXw/zNpiNmZVkU
 Jdf51zPt+vMAv9psR9yFb7C9VUMmMFyX0PiPIklJPxr3lQsAdY5mEMlz6weuFx756xvKSOv9AjX
 D28xXPYBxcBhwONVu9GQUolmKk2rA4JhUa7swb5SiyI6Dx26XBTAb9BM09rowH4PWiRhVkzb9lA
 xzJluja5WACaaQcGx+yIp0u9HufDeuyBvG644bOGURzFxwirFVp6EAQoqLbMavOBy7MR9iGgOw5
 Zh3Rgj9soEX2wvYDoBOQ44xULJkm/VeE2KhkS7vHQL2AzgR6LNDATLhgu9tl2s7l/Z86GsDf0wi
 l3YOgVqSBQJFPth0RKdTAnaiKHHbVHpP8v4hgUPTfaEs2H+ADUkVcJ7eBH3e3QrQY3DReFuUfZB
 /04xdieLTWuwJb44AiX1S2h5oxaaDQ==
X-Authority-Analysis: v=2.4 cv=BdnVE7t2 c=1 sm=1 tr=0 ts=6915ba5e cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=hsPK79fdjXi5lFZ4yDYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: -8PvtlFj8uIsRJTaPIg0JRvc6qdhqwJb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-13_01,2025-11-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 bulkscore=0 priorityscore=1501 spamscore=0
 lowpriorityscore=0 suspectscore=0 malwarescore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511130081

On 11/12/25 5:36 PM, Bjorn Andersson wrote:
> On Wed, Nov 05, 2025 at 10:44:05AM +0100, Konrad Dybcio wrote:
>> On 11/4/25 10:19 PM, Loic Poulain wrote:
>>> On Tue, Nov 4, 2025 at 3:12 AM Bjorn Andersson <andersson@kernel.org> wrote:
>>>>
>>>> On Mon, Nov 03, 2025 at 07:20:04PM +0100, Loic Poulain wrote:
>>>>> SCM can be used to support reboot mode such as Emergency Recovery Mode.
>>>>
>>>> "such as"? Do we have any other useful bits in here?
>>>
>>>  I heard we may have different EDL modes supported like USB or SD
>>> based EDL, but I don't know much about the details.
>>>
>>>>
>>>>>
>>>>> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
>>>>> ---
>>>>>  Documentation/devicetree/bindings/firmware/qcom,scm.yaml | 4 ++++
>>>>>  1 file changed, 4 insertions(+)
>>>>>
>>>>> diff --git a/Documentation/devicetree/bindings/firmware/qcom,scm.yaml b/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
>>>>> index b913192219e4..c8bb7dacd900 100644
>>>>> --- a/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
>>>>> +++ b/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
>>>>> @@ -121,6 +121,10 @@ properties:
>>>>>            - description: offset of the download mode control register
>>>>>      description: TCSR hardware block
>>>>>
>>>>> +patternProperties:
>>>>> +  "^mode-.*$":
>>>>
>>>> I'd only ever expect mode-edl = <1>. Do we have additional modes that
>>>> warrant the generic nature of this?
>>>
>>> We may extend this to mode-ramdump if it makes sense, but as of now
>>> it's indeed only edl, will fix it.
>>
>> Would adding ramdump here be a matter of:
>>
>> + mode-ramdump = <0xmagic>
>>
>> ?
>>
>> If so, please add it too
>>
> 
> But what does that mean? "Hey computer, perform a graceful shutdown and
> when you're done, give me a ramdump"?

I.. guess?

Perhaps it could be useful for registering a panic handler to reboot
into ramdump in case that's not enabled by deafult (but is that
possible with our fw?)

Konrad

