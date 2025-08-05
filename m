Return-Path: <linux-arm-msm+bounces-67808-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F3CF9B1B98B
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Aug 2025 19:41:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 94DAA18A7150
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Aug 2025 17:42:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F08BA1F8EEC;
	Tue,  5 Aug 2025 17:41:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SdC+Q7kn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B9F022CBD3
	for <linux-arm-msm@vger.kernel.org>; Tue,  5 Aug 2025 17:41:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754415701; cv=none; b=hw45JHHA5MqtdIw5Ng0oRkTsGfQ8SdmpCMrzpPdjz4Ooc5zN9xLzHpW3QVebYkkt4O2f7LHwbXzeyxk5u1BcDkcgSz4PjXz22QoFJJL+h/Gmf9uKen9zB/ZR4xvczAlCToUINLEzdSZBo/QRNjq5wcvGIbemMVGEL3Xuc45v4xE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754415701; c=relaxed/simple;
	bh=rMkA5RiDJXWmKMzU79X+CVM3moHKrjOdTD2NiIhyWi8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mE0JU+0RIUpV64o785sgxDDHx5dUMYv85AAlOw/pfaw765PNuNLAK8C83MyfPuyrmxjBwhBRyXQ5GHMFfpFVs8oq1Mcu9BxBnJbgv5raSnKdOcwE7Penqns3SWHfwYxUn+mrmLzEtMeTMMRQofGpS9GhnS5Cr9VrdtU3OUNconQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SdC+Q7kn; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 575BQWCs011363
	for <linux-arm-msm@vger.kernel.org>; Tue, 5 Aug 2025 17:40:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2mEjso+MHTmFdrnw8L4UXzTgRbSzPxuCfvfs53kAta0=; b=SdC+Q7knQTBkxjoW
	Ka2joYgrQobaOMOxOOVNO3UBNZahrbjfzWlYcdrlZE+FT+VZmk4+ZDWdcgw4DdJ8
	uZtkHXzR0up5iv7pcIn0Adt49lYV1z7HNcxeyV80bc8YISWiw/wQ3Km+9J1R3RJf
	yZUopbwoPRuN+diwYuErImM1typh78pscsHPIePh8uRaACYqAd8fvsVELKsSiV63
	fw9OXodLQK+Ary2YKj4ruGTEGvSKJk+bhnEqyB6CpGPFQBwf18oG/jf2Nr3H2qqr
	MVnv1QCUt7tJTSUmCGMtIK10zFkSZlJS8larLCk6ptLS21wSUdoPl20GlBJDs3DL
	K4Az8g==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48avvucc88-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 05 Aug 2025 17:40:34 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7e33990ba42so58081285a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 Aug 2025 10:40:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754415634; x=1755020434;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2mEjso+MHTmFdrnw8L4UXzTgRbSzPxuCfvfs53kAta0=;
        b=fhsPFjFj3Gx9t380zAQmwoxCReeIqhy5KhlIXZZ4radDtc9wClAHQMBCad01/vBEra
         pvIsEJKjB6X8lwk4C4aAJaeuetlmlD0FYGT8lHHXkuimmqF2zGZ/MNNmaGvidrs6k35W
         F+Z8NiyodG8JwdCBWPFA/iApv4koNQiU2vUp0sOgvuFeORjrDctn1LlSpi4oHVerx+k2
         wDeL6jsj+zW/CggdYmdhQn6Z7kIxSbtcvqudCuAVjYigXDlSr4LJ1l1nARJJ2WZpU9hs
         vbvYpxF+r0GIOEkvGZpl1uJQ3sqnWYL4T7syIymXhBt93s9zMuLzwzeW+X9NnWS1shl5
         YXQw==
X-Forwarded-Encrypted: i=1; AJvYcCVkKNghnUCaesDKdtaZUAAsITfeQSdfbUFYyFDQHXMLqVtpiP6upehtX4zlhgfbI3Y9boqxaho4GFJmZTmH@vger.kernel.org
X-Gm-Message-State: AOJu0YxFH6akhKd37ug1924CLAEvjGXONPgIZeFW7mplWVRGlG5oFzza
	n5nrGPpQPFSTXVdFUU2VgjCzB1Jy1X8pwWU5AiHKAb15/Q0GGo+X4daCmWsIFDLWv1VGcVkhPlq
	mZM4+/SSuiesLwjiQ/Jd4Ar77IlFHxH62QefMpLagLyhWTvJVPX5nOE2Y+XxjdBiw8Tl2
X-Gm-Gg: ASbGncvUYBNzJYmboIF9eWFA7VDX53hzgbI2rtXc+L+bkN3hB/Q8MV4ffirJGDAGxxC
	5Dw7tHuIQwXakyNFoXeeo2gkqP94u2uKi/NyfqvwoSVwD/BtX19dAOgCtZZH3kLcZX0OxuZJ1Vq
	q4yxGX35nnB+WLv5qa9dyfmqLhBPbmsjeHjKyuFQ3zN/YW+BkPWTzRuLIr1yu5gzA5pzKJS2ANs
	BudQmi0vaMpIntevKtKVlBkG6dqiJOVnyfR5iiIigSbNsiSnsdPT0hwpdpfgB4XwImNiWbCoRvf
	z8cX3zwYWpncHBEXTAh9kSFD0T1NYPE1zYQNeLqnySjXlXt2dFtpUD8DmDSDrl1tDLiTkfid8EL
	SpbU0qLdCDTIvKEEKpQ==
X-Received: by 2002:a05:620a:31aa:b0:7e6:9e1a:19 with SMTP id af79cd13be357-7e814efc94fmr5347985a.13.1754415633758;
        Tue, 05 Aug 2025 10:40:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGN61724+FWqz+IOFVoaAZfGxTWvMM8Tyky7Q5EoDS+vMDpv+5lunJYIZkQhEwOeqX/LwZPWw==
X-Received: by 2002:a05:620a:31aa:b0:7e6:9e1a:19 with SMTP id af79cd13be357-7e814efc94fmr5345585a.13.1754415633254;
        Tue, 05 Aug 2025 10:40:33 -0700 (PDT)
Received: from [192.168.43.16] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a1e8359sm942723166b.89.2025.08.05.10.40.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Aug 2025 10:40:32 -0700 (PDT)
Message-ID: <87c37d65-5ab1-4443-a428-dc3592062cdc@oss.qualcomm.com>
Date: Tue, 5 Aug 2025 19:40:29 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] arm64: dts: qcom: sa8155: Add gear and rate limit
 properties to UFS
To: Alim Akhtar <alim.akhtar@samsung.com>,
        'Manivannan Sadhasivam' <mani@kernel.org>
Cc: 'Krzysztof Kozlowski' <krzk@kernel.org>,
        'Ram Kumar Dwivedi' <quic_rdwivedi@quicinc.com>, avri.altman@wdc.com,
        bvanassche@acm.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
        James.Bottomley@hansenpartnership.com, martin.petersen@oracle.com,
        agross@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-scsi@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <2a3c8867-7745-4f0a-8618-0f0f1bea1d14@kernel.org>
 <jpawj3pob2qqa47qgxcuyabiva3ync7zxnybrazqnfx3vbbevs@sgbegaucevzx>
 <fa1847e3-7dab-45d0-8c1c-0aca1e365a2a@quicinc.com>
 <1701ec08-21bc-45b8-90bc-1cd64401abd8@kernel.org>
 <2nm7xurqgzrnffustrsmswy2rbug6geadaho42qlb7tr2jirlr@uw5gaery445y>
 <11ea828a-6d35-4ac6-a207-0284870c28fc@oss.qualcomm.com>
 <jogwisri2gs77j5cs3xwyezmfsotnizvlruzzelemdj5xadqh4@loe7fsatoass>
 <CGME20250805170638epcas5p4cb0cc78c5b5d77072cec547380b9f03d@epcas5p4.samsung.com>
 <b235e338-8c16-439b-b7a5-24856893fb5d@oss.qualcomm.com>
 <061b01dc062d$25c47800$714d6800$@samsung.com>
 <i6eyiscdf2554znc4aaglhi22opfgyicif3y7kzjafwsrtdrtm@jjpzak64gdft>
 <061c01dc062f$70ec34b0$52c49e10$@samsung.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <061c01dc062f$70ec34b0$52c49e10$@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA1MDEyMyBTYWx0ZWRfXxKqeZkt4ysdr
 rrSKzznQIcNbgnhMTW5jR/dahZPRPWUVrDjE7PUN82vktcKQBwci2mMN3FzoLAeGTRYQF37jGjF
 lGdYcHVsw9dDDASUqf0V0XLbccmvm8qH7rCWkYgCiRsa1dNpCEsx+2PXNBYhQQXd+QwKcjrlGia
 df4UwCvJXZ7uM9iCH+oug3dgrjt6G1W3B3IT7mEQBCF5mpBNfdgTbxIyS7nmp7iHVks5AJA6O3h
 YL+0ebS5sdFpLbuqwm0EP3T73+s0G7RajBh9yLZ7oO+muldSenXbIIHVdBpC3FRJEx68XVudxuF
 6ugySz9u0Nk+5F3T+1cQqpA4VaJCUQGalpE0qHRrwy2EyVVIyZBrCttvUogNcNu/2OwTi/fDx37
 hyaw0dmbo/tJE8b5t3d+3/dlW9mgfVHaW4CBim7p1hJwBP5nPdXiiRCY9QacPaulewdYwS2w
X-Proofpoint-GUID: OVd2DbFwBxs3UsEh6BzuYu__OlflWt6N
X-Authority-Analysis: v=2.4 cv=OYKYDgTY c=1 sm=1 tr=0 ts=68924212 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=hD80L64hAAAA:8
 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=JF9118EUAAAA:8 a=N54-gffFAAAA:8
 a=bLk-5xynAAAA:8 a=yPCof4ZbAAAA:8 a=_u80KDpoiKaTEXzHalMA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22 a=TjNXssC_j7lpFel5tvFf:22
 a=xVlTc564ipvMDusKsbsT:22 a=zSyb8xVVt2t83sZkrLMb:22
X-Proofpoint-ORIG-GUID: OVd2DbFwBxs3UsEh6BzuYu__OlflWt6N
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-05_04,2025-08-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 impostorscore=0 phishscore=0 spamscore=0
 priorityscore=1501 mlxlogscore=999 malwarescore=0 adultscore=0 suspectscore=0
 clxscore=1015 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2508050123

On 8/5/25 7:36 PM, Alim Akhtar wrote:
> 
> 
>> -----Original Message-----
>> From: 'Manivannan Sadhasivam' <mani@kernel.org>
>> Sent: Tuesday, August 5, 2025 10:52 PM
>> To: Alim Akhtar <alim.akhtar@samsung.com>
>> Cc: 'Konrad Dybcio' <konrad.dybcio@oss.qualcomm.com>; 'Krzysztof
>> Kozlowski' <krzk@kernel.org>; 'Ram Kumar Dwivedi'
>> <quic_rdwivedi@quicinc.com>; avri.altman@wdc.com;
>> bvanassche@acm.org; robh@kernel.org; krzk+dt@kernel.org;
>> conor+dt@kernel.org; andersson@kernel.org; konradybcio@kernel.org;
>> James.Bottomley@hansenpartnership.com; martin.petersen@oracle.com;
>> agross@kernel.org; linux-arm-msm@vger.kernel.org; linux-
>> scsi@vger.kernel.org; devicetree@vger.kernel.org; linux-
>> kernel@vger.kernel.org
>> Subject: Re: [PATCH 2/3] arm64: dts: qcom: sa8155: Add gear and rate limit
>> properties to UFS
>>
>> On Tue, Aug 05, 2025 at 10:49:45PM GMT, Alim Akhtar wrote:
>>>
>>>
>>>> -----Original Message-----
>>>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>>> Sent: Tuesday, August 5, 2025 10:36 PM
>>>> To: Manivannan Sadhasivam <mani@kernel.org>
>>>> Cc: Krzysztof Kozlowski <krzk@kernel.org>; Ram Kumar Dwivedi
>>>> <quic_rdwivedi@quicinc.com>; alim.akhtar@samsung.com;
>>>> avri.altman@wdc.com; bvanassche@acm.org; robh@kernel.org;
>>>> krzk+dt@kernel.org; conor+dt@kernel.org; andersson@kernel.org;
>>>> konradybcio@kernel.org; James.Bottomley@hansenpartnership.com;
>>>> martin.petersen@oracle.com; agross@kernel.org; linux-arm-
>>>> msm@vger.kernel.org; linux-scsi@vger.kernel.org;
>>>> devicetree@vger.kernel.org; linux-kernel@vger.kernel.org
>>>> Subject: Re: [PATCH 2/3] arm64: dts: qcom: sa8155: Add gear and rate
>>>> limit properties to UFS
>>>>
>>>> On 8/5/25 6:55 PM, Manivannan Sadhasivam wrote:
>>>>> On Tue, Aug 05, 2025 at 03:16:33PM GMT, Konrad Dybcio wrote:
>>>>>> On 8/1/25 2:19 PM, Manivannan Sadhasivam wrote:
>>>>>>> On Fri, Aug 01, 2025 at 11:12:42AM GMT, Krzysztof Kozlowski wrote:
>>>>>>>> On 01/08/2025 11:10, Ram Kumar Dwivedi wrote:
>>>>>>>>>
>>>>>>>>>
>>>>>>>>> On 01-Aug-25 1:58 PM, Manivannan Sadhasivam wrote:
>>>>>>>>>> On Thu, Jul 24, 2025 at 09:48:53AM GMT, Krzysztof Kozlowski
>> wrote:
>>>>>>>>>>> On 22/07/2025 18:11, Ram Kumar Dwivedi wrote:
>>>>>>>>>>>> Add optional limit-hs-gear and limit-rate properties to the
>>>>>>>>>>>> UFS node to support automotive use cases that require
>>>>>>>>>>>> limiting the maximum Tx/Rx HS gear and rate due to hardware
>> constraints.
>>>>>>>>>>>
>>>>>>>>>>> What hardware constraints? This needs to be clearly
>> documented.
>>>>>>>>>>>
>>>>>>>>>>
>>>>>>>>>> Ram, both Krzysztof and I asked this question, but you never
>>>>>>>>>> bothered to reply, but keep on responding to other comments.
>>>>>>>>>> This won't help you to get this series merged in any form.
>>>>>>>>>>
>>>>>>>>>> Please address *all* review comments before posting next
>> iteration.
>>>>>>>>>
>>>>>>>>> Hi Mani,
>>>>>>>>>
>>>>>>>>> Apologies for the delay in responding.
>>>>>>>>> I had planned to explain the hardware constraints in the next
>>>> patchset’s commit message, which is why I didn’t reply earlier.
>>>>>>>>>
>>>>>>>>> To clarify: the limitations are due to customer board designs,
>>>>>>>>> not our
>>>> SoC. Some boards can't support higher gear operation, hence the need
>>>> for optional limit-hs-gear and limit-rate properties.
>>>>>>>>>
>>>>>>>>
>>>>>>>> That's vague and does not justify the property. You need to
>>>>>>>> document instead hardware capabilities or characteristic. Or
>>>>>>>> explain why they cannot. With such form I will object to your
>>>>>>>> next
>>>> patch.
>>>>>>>>
>>>>>>>
>>>>>>> I had an offline chat with Ram and got clarified on what these
>>>>>>> properties
>>>> are.
>>>>>>> The problem here is not with the SoC, but with the board design.
>>>>>>> On some Qcom customer designs, both the UFS controller in the
>>>>>>> SoC and the UFS device are capable of operating at higher gears (say
>> G5).
>>>>>>> But due to board constraints like poor thermal dissipation,
>>>>>>> routing loss, the board cannot efficiently operate at the higher
>> speeds.
>>>>>>>
>>>>>>> So the customers wanted a way to limit the gear speed (say G3)
>>>>>>> and rate (say Mode-A) on the specific board DTS.
>>>>>>
>>>>>> I'm not necessarily saying no, but have you explored sysfs for this?
>>>>>>
>>>>>> I suppose it may be too late (if the driver would e.g. init the
>>>>>> UFS at max gear/rate at probe time, it could cause havoc as it
>>>>>> tries to load the userland)..
>>>>>>
>>>>>
>>>>> If the driver tries to run with unsupported max gear speed/mode,
>>>>> it will just crash with the error spit.
>>>>
>>>> OK
>>>>
>>>> just a couple related nits that I won't bother splitting into
>>>> separate emails
>>>>
>>>> rate (mode? I'm seeing both names) should probably have dt-bindings
>>>> defines while gear doesn't have to since they're called G<number>
>>>> anyway, with the bindings description strongly discouraging use,
>>>> unless absolutely necessary (e.g. in the situation we have right
>>>> there)
>>>>
>>>> I'd also assume the code should be moved into the ufs-common code,
>>>> rather than making it ufs-qcom specific
>>>>
>>>> Konrad
>>> Since this is a board specific constrains and not a SoC properties, have an
>> option of handling this via bootloader is explored?
>>
>> Both board and SoC specific properties *should* be described in devicetree
>> if they are purely describing the hardware.
>>
> Agreed, what I understood from above conversation is that, we are try to solve a very *specific* board problem here, 
> this does not looks like a generic problem to me and probably should be handled within the specific driver.

Introducing generic solutions preemptively for problems that are simple
in concept and can occur widely is good practice (although it's sometimes
hard to gauge whether this is a one-off), as if the issue spreads a
generic solution will appear at some point, but we'll have to keep
supporting the odd ones as well

Konrad

