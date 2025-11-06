Return-Path: <linux-arm-msm+bounces-80564-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5786EC39FC0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 06 Nov 2025 11:01:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AA2F6424882
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Nov 2025 09:54:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74D5830F52A;
	Thu,  6 Nov 2025 09:51:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TNlZMLsb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SqM5DmOC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DFD430C631
	for <linux-arm-msm@vger.kernel.org>; Thu,  6 Nov 2025 09:51:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762422670; cv=none; b=pcJOQIMkJ8D1OUChA+aVAT8D8EQdLO1rcdaPs6/Awh9g02CSZei3N3uP06bE6TSbHxVFG9W5z8fDDRWwUpKtHFhwC7mfPf8LFaulZ3BA33grh5FXM4tf3yu1aRb/rvUablyTPfQY2K/LfS8O6sMIAOCNT/h5eSrm/46QFxR/KwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762422670; c=relaxed/simple;
	bh=nXSRMf9/aZ7Q9VqSPsWiKmuE1hBg/kBZqOFH3xssUmw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TbJCO2y2VeZqmmd/lBRKNJPdo7lE1SRtRpeTgkptD1dlZbEoaDlCbKWScZzkg+7v2Gj5KtUaK4hekh670TVApa6f3HqZ6xds5Iba7GGud9dntnNR+6bxND5xpCAPdxuCZdHzhFn9RMsmiTnaTzBByO1RA51lnvoUML90KXnqkYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TNlZMLsb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SqM5DmOC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A66KXbM1689574
	for <linux-arm-msm@vger.kernel.org>; Thu, 6 Nov 2025 09:51:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tZsRCzXp9F2PQY4ggZIqyN7UEW8FExIqJdOsCcIvnqU=; b=TNlZMLsbj7CDm8hw
	biToZd0J9wQhXAyeUjAmL/EB4ts6sHqw54l1TTgkCeIWG1YDdcPAXRDZuPbb5Aac
	7v7dBAklyq36/LWH7D+pho6m7X7TOnYDrEYKmetg57G8akLonrVw2LN8WctArYIY
	doZI5SvBHzgIXCSQJbVmUI7d+0gv00jrqKbnuef4qIM1xjaI+hCjDiE/NNLQHAdg
	gj1ZpebOTriQfd4AKZqMt6CVHtPEOFZwpbCcnjH0zWbzSmqs9R4GqxU1SRuOMZFp
	TVdYTI2u85qzVPhI1AvSoJc7K7uqLE6fxy3OsHP9jo8Xp4dmq4K7LSRqqiwp5mXa
	bStvEg==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a88pjb3q2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 06 Nov 2025 09:51:07 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8801e695903so1537216d6.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Nov 2025 01:51:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762422667; x=1763027467; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tZsRCzXp9F2PQY4ggZIqyN7UEW8FExIqJdOsCcIvnqU=;
        b=SqM5DmOCi1rCDij3p1z2uFc65WMYrvlPQE7LhwsZvPT1u7UKSLASbxeLWitsnp6Cyo
         MFqWCoIqUg0QgcGGczeJDTiHeFZT63ZowvR9ErV+P9NY1atSK5/vvB1n5tiB7xwHBr46
         Av6Aa6olMfoct5H1ur0RwxVYGuOIGNJwf2dpa4i3Ij6KiI3s0es+R/hFwpsyXcnt6Kdy
         4AEZhTb/IC52X5+7D8T94xSf3ZDAJLZv3tQ0nAD2Bl+c8KmogFT78KCj+lVgNBt3o27i
         WfNea1Ou425HLelwLTYLg7dl+ggOFEormoCEEYT80bXC1sBWJ6z41CRv15MohMGT2iOY
         8y7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762422667; x=1763027467;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tZsRCzXp9F2PQY4ggZIqyN7UEW8FExIqJdOsCcIvnqU=;
        b=WJ67Z4WGJeEpNsi1aHGkxoItyikKZz8EHhLd3wozX2lgFIzS7AUxuR/lQz1ZOGeih4
         kbmoC89jMIya1QUZMqm1E1SFXgcLJxBgrxoQIAAGxi2+o7dZaVUrs5CS6sJuFvt6WtBu
         cuNNo/L/4sHAAOtVUk8gbEwb26Z59T/ZiCOjJ5PejMbTRdGjwj3OM85XYuS/yCW2RfTQ
         CFK0LSZPBZw6nbX08J7+7EY+p0QmLyLVA/QuY7Cuw/Zv5pXUVz2LtwKYHtaHTJcIR75E
         FN6lyShHAghq5qpMGNx367sumb7Ya/XtEFyhV1rZ7kezleq8iXOKSK/G6Q4dtNO1Yyw2
         v+/Q==
X-Forwarded-Encrypted: i=1; AJvYcCWoPl3t6fSpmrZQrJDAL2IKoepSAcp21Wo1YLd2uSz0sOyTJmrBxjE+FkZXP/cb01kMNTgF1PzPxhF7w2TK@vger.kernel.org
X-Gm-Message-State: AOJu0YyafWAfWBe9UEaYtOwCsnpNk6dljHp610NTZbgh3hrP9SheNsMn
	Ds8p01LR6u3imhpK6DoQfj/zdf7XiMPW6jVvH1OJdM114+Jus1JF59o2lnyZiP07L4DPdSXUmlD
	yVMYeNTx+GzDa8Lmmnzv8eHwrhnfn6sVgf5MTjhJtkfmVLquAwU95HK4JiFvC+7M4jsao
X-Gm-Gg: ASbGncs2PkIUsLSoY4t5wnA2Zpgb5hkOPl2tWjy8WmrtC8xDYOdbLLsgi43jVvujtEn
	WiW4F1ymt9bjhPoXT7Fdn4BjS5cX3z1KRbvJL410Z5G7WoMfgkIM8LGCVImtIBOkVOVe2/WmyGN
	6UBXjJZmsqzkxIXTS8pmyYb/AEJwSLire2fWXWVjwe2+SOBWLjxrrvOXdMRLNzljVeY8GrU6rcR
	BiqFiO5ccOppysUX01KRSaxwASlc/TfdyhhSDMdAc1PlVVVe6G26/h2wSsxxKSwYyhsWhrrz/rN
	3gKq5XomcrJQdGhtp0UXfv2u4KgoOvsG1fNttJCeKMlRsqqs3aoHuJk5+weJncffM+S4giOZhtd
	j/p2X7ghSd6MnwKs+tktHZtlsDzRLZL3DDcI2SZOLe8DOkq3RRG8nnpht
X-Received: by 2002:ad4:5f86:0:b0:87c:2360:d41f with SMTP id 6a1803df08f44-88082f23ee9mr18251036d6.3.1762422666523;
        Thu, 06 Nov 2025 01:51:06 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHPT/BAVfUWlvYl6K4WhBqXTZmQpbLXz9xtVoeJwcK31/pU4lMp/uDh04+Fm7fJy69yKEsuhw==
X-Received: by 2002:ad4:5f86:0:b0:87c:2360:d41f with SMTP id 6a1803df08f44-88082f23ee9mr18250936d6.3.1762422666082;
        Thu, 06 Nov 2025 01:51:06 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b7289334257sm182354966b.6.2025.11.06.01.51.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Nov 2025 01:51:05 -0800 (PST)
Message-ID: <6bd38ab5-cf60-48b3-a27c-a33de9762cf0@oss.qualcomm.com>
Date: Thu, 6 Nov 2025 10:51:03 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] dt-bindings: firmware: qcom,scm: Document reboot mode
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, konradybcio@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        sre@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-pm@vger.kernel.org
References: <20251103182006.1158383-1-loic.poulain@oss.qualcomm.com>
 <20251103182006.1158383-4-loic.poulain@oss.qualcomm.com>
 <aqoxdaq72prkeqwxmmohlmbpx7icuc32sej7did6vt6rzrgfib@bvmt7ppkvloc>
 <CAFEp6-2GGA2gvBKfO0fZemVmJmjQpTQEJ0vLfEewfhHKOYQGSQ@mail.gmail.com>
 <be0a418b-5e8f-4895-a3b8-482b6ad6a40e@oss.qualcomm.com>
 <CAFEp6-1qPw7vdqYNKYv00M1sDo0HhEPgrHuEZAJ5vabErR7ChA@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CAFEp6-1qPw7vdqYNKYv00M1sDo0HhEPgrHuEZAJ5vabErR7ChA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: nBm4XH51D8HGS4o59dqnD8sQQ4PcaJRi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA2MDA3OCBTYWx0ZWRfXyV3/3eom5DPY
 7/SIpVjWtPBHmo/JEA+Sx4mXdV9dDIuPA3o06S0a5jpui316dUnLLRSDZwEmvbuHCk9kJdUL5A0
 i8yFB/lYpmGe6LyBrTcz1MwVJxPYPkOHEl8ftUJwhSqOc3SCL/lKt0vhSeFsDeCdO98V05H2R/+
 ckI+vnIFGsvcSHfF7eKXwwJa7D4kG3fiusVHnt4vyxc5GY2GtXuMkUllO2TCwkPZRpXzTXcdNc/
 I0wiv9istFOMgwwab403QpxHIDzEB4xTgNDt0PiJoi7b029GoexdTGpa0t3WLlcrxntaVyIXzVY
 5AdVNm6CIA7GT+pthezN17dtQGl4YKcrH+Hekd1V9+gLh4mrlj4iuid1rKddp1vxmdfVtUG5fr7
 LLnsogVCw89DUlhz4jecpL0VHcWa4Q==
X-Proofpoint-ORIG-GUID: nBm4XH51D8HGS4o59dqnD8sQQ4PcaJRi
X-Authority-Analysis: v=2.4 cv=ZODaWH7b c=1 sm=1 tr=0 ts=690c6f8b cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8
 a=U3JJaeWcYHlj1SPvQKAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-06_02,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 phishscore=0 spamscore=0 clxscore=1015
 impostorscore=0 malwarescore=0 lowpriorityscore=0 priorityscore=1501
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511060078

On 11/5/25 9:17 PM, Loic Poulain wrote:
> On Wed, Nov 5, 2025 at 10:44 AM Konrad Dybcio
> <konrad.dybcio@oss.qualcomm.com> wrote:
>>
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
> 
> Not in its current form, I’ll need to slightly adjust the qcom,scm
> driver mask for the reboot mode and also prevent the dload inhibit
> during reboot. I can include these changes in v2 if that would be
> helpful.

Let's do it incrementally, as changing the scope usually ends up
causing chaos

Konrad

