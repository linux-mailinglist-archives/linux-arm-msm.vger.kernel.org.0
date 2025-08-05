Return-Path: <linux-arm-msm+bounces-67803-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AA32B1B8F3
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Aug 2025 19:06:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 26BCF18A664D
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Aug 2025 17:07:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3BA0D27EFFB;
	Tue,  5 Aug 2025 17:06:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KCSxoWCr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D3B620A5EC
	for <linux-arm-msm@vger.kernel.org>; Tue,  5 Aug 2025 17:06:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754413597; cv=none; b=Zo6RbTnHTymeaSO5rvplmXJOS248b4qUaWJQXS9e2nKxmG83vVPMPlZpiH+y7ses7srzniXx9FEcABllqPJuLJjRyAAaw17vRxnvq5n6nioTHtFyOysBqz7OE85wRpvD/tL3kIozQ9k9uIIuMwsV7YvWra98oA6V7e4VZNQoPSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754413597; c=relaxed/simple;
	bh=PPiyEpwIMU8cftZVfItlL4WbshbAPLD6/m2rNt1TDzQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FbxUkuD+AKax8PRTYEsXRQhwY3GWElEZO8Y8V9EM0xVzPVblKXxrkCUdzfpN7f2d7jTLQN8NrfWh/ucIR5YV7jZxx8XdUBqSxIsxL1rBdIZ+dvtvHgx9T9RP6tZ9LJLS4euutNhPPMb7fJ28cPY0jXZL0+2MXG8t4BNdjr2nu7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KCSxoWCr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 575APD0B012766
	for <linux-arm-msm@vger.kernel.org>; Tue, 5 Aug 2025 17:06:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rt4nc/wxh+EH+VqdYEzctT4GzuaEB/gmu+a0L2Q1reI=; b=KCSxoWCr0PmEeHdM
	gvnDAYRKFaa7yjBGswgkw2LOV3cVRLlhakfOCfdpNiDoSB3OeMiLbR/c73chkJ/K
	q4ooqXDc0Dc2Wr0Vr/iHuFxg+FzN6pyNDEZZTTeJYYdPjWUVhd5naAhnM8di39nX
	fBm+EN+mQcrEclw7LYgCKYptg7TE83Fi/XTgc5eKL1v3hYLAMPUoRfEL8nJAOgLE
	EsGgZUbvu0k6R3ZCRBu9gemMVs+sCXV7gJaeQEcKqxI8iX3hD1kxCqlVdATVFZWF
	SoSN1u2DA8FQWhP+3/RPZ9tEDh/9B4+yOjbaLLXbns3AEDqyxdcKUuLeLT32Dme8
	DDkTpA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48b8ag2evt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 05 Aug 2025 17:06:34 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4b07b805068so3741071cf.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 Aug 2025 10:06:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754413593; x=1755018393;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rt4nc/wxh+EH+VqdYEzctT4GzuaEB/gmu+a0L2Q1reI=;
        b=Yr4EvP/78Q7VgXKvIPImdz8You+FxhW/ytt7R3meCe9WWP0FlL12X95AVMdKbERe54
         bOw33qoK5JGqjBiO52Yyeb7EpomXn1wkuK1wGLBYxOwpvl2jH7QScUPP0G5G+qliso0X
         j/NFC6QmqV0/esHxPGe8mMblwWLea9iINlB5+b5+dQHIcvqKbp/DyRqjQ96wbHWslGJD
         QfQzHk0eEZQfsv21UsUBU67FL9Rv2VUrRWuYbOUEPQI/FNQvr3cFGEL180MOAU5NnxFp
         MuvyB2L+3rN/lFkHtC9Q/c9pMXAVD/wM7sJI7do7jMICsB7608O4FIE69C1IIGZXL7ZV
         eIyA==
X-Forwarded-Encrypted: i=1; AJvYcCW21yEOipvjvcU6n2n3jqiKyvQiX8MJVSI0+a7lTFxfVM8+BvjrRewNt0VUq78mvdo2rgSmQG4ys3/W0dEL@vger.kernel.org
X-Gm-Message-State: AOJu0YyoiHVIc6DDP6NKgrxHcHG4a83lLr8BSQ5VICxUhQKqpl+IQ/yW
	X15eTFpAmUteEhSpNoYZ35YE1GnWcdbpZlJxMKgzcSdrvDG8jeInHfiuQTys8mxh24HVxNjR0VZ
	xKJXfGDvanuOVaLJjPH5dvB9sXe1DKJyT7A4YspZyIa33LL6Uv7HTQyAPyCLDxxI0aCi6
X-Gm-Gg: ASbGnctfc6bMceDf3QESy7BlXjBeTXuuvzxDjpgMMkp7nsEniMIxds3kJrnYIjgvA4m
	bemfixgxHFtXkzeVgINoGDOrfLlP+p9nsJPd74ONskWKooZenr9D+/NEKOJJQ6MEUjGnjZQHmIo
	nCSDEZeKq2fA3/CypXDr3UtJVXEBqutrleOurMmYrlGeIGTVMIQGlBEC0fS7ORCkBubaTvrtGMx
	P/nBuHcRbJPPoMJ6qQ7mpBRiCG8a/R1jN/hOwkXxFF9vDJmyTGARQtaZiJ4guqrLX/xCqTNO/iu
	UutmQZCIGe3PSm2MlHN9fWwCJDkcH8+SQdS6S7n0jsDEUeJLbySHFfn8P4dLHBEfRLtEgaS+Die
	ib5cHbCO39Tv/MklO3w==
X-Received: by 2002:a05:622a:409:b0:4a9:e46d:ca65 with SMTP id d75a77b69052e-4af1094961cmr104667741cf.3.1754413593237;
        Tue, 05 Aug 2025 10:06:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHMqdQC6buQpdvvqYVY/ppzlsDv5p+scsz8lOs/x1DQWYljQfMBsI0+MjfKKzBFWsWhupDMVw==
X-Received: by 2002:a05:622a:409:b0:4a9:e46d:ca65 with SMTP id d75a77b69052e-4af1094961cmr104667371cf.3.1754413592709;
        Tue, 05 Aug 2025 10:06:32 -0700 (PDT)
Received: from [192.168.43.16] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a21ac0asm938646466b.99.2025.08.05.10.06.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Aug 2025 10:06:32 -0700 (PDT)
Message-ID: <b235e338-8c16-439b-b7a5-24856893fb5d@oss.qualcomm.com>
Date: Tue, 5 Aug 2025 19:06:29 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] arm64: dts: qcom: sa8155: Add gear and rate limit
 properties to UFS
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
        Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>, alim.akhtar@samsung.com,
        avri.altman@wdc.com, bvanassche@acm.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org,
        konradybcio@kernel.org, James.Bottomley@hansenpartnership.com,
        martin.petersen@oracle.com, agross@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250722161103.3938-1-quic_rdwivedi@quicinc.com>
 <20250722161103.3938-3-quic_rdwivedi@quicinc.com>
 <2a3c8867-7745-4f0a-8618-0f0f1bea1d14@kernel.org>
 <jpawj3pob2qqa47qgxcuyabiva3ync7zxnybrazqnfx3vbbevs@sgbegaucevzx>
 <fa1847e3-7dab-45d0-8c1c-0aca1e365a2a@quicinc.com>
 <1701ec08-21bc-45b8-90bc-1cd64401abd8@kernel.org>
 <2nm7xurqgzrnffustrsmswy2rbug6geadaho42qlb7tr2jirlr@uw5gaery445y>
 <11ea828a-6d35-4ac6-a207-0284870c28fc@oss.qualcomm.com>
 <jogwisri2gs77j5cs3xwyezmfsotnizvlruzzelemdj5xadqh4@loe7fsatoass>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <jogwisri2gs77j5cs3xwyezmfsotnizvlruzzelemdj5xadqh4@loe7fsatoass>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: vrfU4CvS-cvtdabok4MyzowpG7OxrVX1
X-Proofpoint-GUID: vrfU4CvS-cvtdabok4MyzowpG7OxrVX1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA1MDExOSBTYWx0ZWRfX2bkyJo8XQbtq
 QOfHV8mEfm4m71jMl4iO86PLSrPUxwr2Y8FzuLas3XbFsGDxuSWpWbi71iOw/HXn1/MV8UnD+GW
 29jkGErN8B+6H4r2FwHxBhrQ7r3aijvlV7Ccfm5p9tIlCq1T7z3h4+uUi+nmg0v7FIu1631FaQJ
 0wVyjtn0VvMv4IL3VDOxpQX9pSNZzTlc3TGeC9z8LI/O1KXkksHxXg646n56wzUjXZyKxO9qV71
 4Ez1SSa3puOO0LFRLlvBkXCA26tnxrfrN2WMSslQylWQcG8PphXk5j4uGtL57aat6zuSlfBD2Ry
 WZEFuw0da+STIUOo4Yc9KY1XKBWnyjZ5x4yhaNpkGwtsWbiEGHHQ4oduRhKxrt7AuGEojgj6jAH
 kR3/boxxJLSowAq54fVcWSRVtZwS6D4zSnl/MuSuVVm6dWajXxDs1WygIyFvpb0nCy+W2dtf
X-Authority-Analysis: v=2.4 cv=aJvwqa9m c=1 sm=1 tr=0 ts=68923a1a cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=Fgd5GahhPM9C-_jtZqkA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-05_04,2025-08-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 mlxscore=0 adultscore=0
 priorityscore=1501 mlxlogscore=999 spamscore=0 impostorscore=0 clxscore=1015
 bulkscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2508050119

On 8/5/25 6:55 PM, Manivannan Sadhasivam wrote:
> On Tue, Aug 05, 2025 at 03:16:33PM GMT, Konrad Dybcio wrote:
>> On 8/1/25 2:19 PM, Manivannan Sadhasivam wrote:
>>> On Fri, Aug 01, 2025 at 11:12:42AM GMT, Krzysztof Kozlowski wrote:
>>>> On 01/08/2025 11:10, Ram Kumar Dwivedi wrote:
>>>>>
>>>>>
>>>>> On 01-Aug-25 1:58 PM, Manivannan Sadhasivam wrote:
>>>>>> On Thu, Jul 24, 2025 at 09:48:53AM GMT, Krzysztof Kozlowski wrote:
>>>>>>> On 22/07/2025 18:11, Ram Kumar Dwivedi wrote:
>>>>>>>> Add optional limit-hs-gear and limit-rate properties to the UFS node to
>>>>>>>> support automotive use cases that require limiting the maximum Tx/Rx HS
>>>>>>>> gear and rate due to hardware constraints.
>>>>>>>
>>>>>>> What hardware constraints? This needs to be clearly documented.
>>>>>>>
>>>>>>
>>>>>> Ram, both Krzysztof and I asked this question, but you never bothered to reply,
>>>>>> but keep on responding to other comments. This won't help you to get this series
>>>>>> merged in any form.
>>>>>>
>>>>>> Please address *all* review comments before posting next iteration.
>>>>>
>>>>> Hi Mani,
>>>>>
>>>>> Apologies for the delay in responding. 
>>>>> I had planned to explain the hardware constraints in the next patchset’s commit message, which is why I didn’t reply earlier. 
>>>>>
>>>>> To clarify: the limitations are due to customer board designs, not our SoC. Some boards can't support higher gear operation, hence the need for optional limit-hs-gear and limit-rate properties.
>>>>>
>>>>
>>>> That's vague and does not justify the property. You need to document
>>>> instead hardware capabilities or characteristic. Or explain why they
>>>> cannot. With such form I will object to your next patch.
>>>>
>>>
>>> I had an offline chat with Ram and got clarified on what these properties are.
>>> The problem here is not with the SoC, but with the board design. On some Qcom
>>> customer designs, both the UFS controller in the SoC and the UFS device are
>>> capable of operating at higher gears (say G5). But due to board constraints like
>>> poor thermal dissipation, routing loss, the board cannot efficiently operate at
>>> the higher speeds.
>>>
>>> So the customers wanted a way to limit the gear speed (say G3) and rate
>>> (say Mode-A) on the specific board DTS.
>>
>> I'm not necessarily saying no, but have you explored sysfs for this?
>>
>> I suppose it may be too late (if the driver would e.g. init the UFS
>> at max gear/rate at probe time, it could cause havoc as it tries to
>> load the userland)..
>>
> 
> If the driver tries to run with unsupported max gear speed/mode, it will just
> crash with the error spit.

OK

just a couple related nits that I won't bother splitting into separate
emails

rate (mode? I'm seeing both names) should probably have dt-bindings defines
while gear doesn't have to since they're called G<number> anyway, with the
bindings description strongly discouraging use, unless absolutely necessary
(e.g. in the situation we have right there)

I'd also assume the code should be moved into the ufs-common code, rather
than making it ufs-qcom specific

Konrad

