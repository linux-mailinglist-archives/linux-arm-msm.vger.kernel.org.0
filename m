Return-Path: <linux-arm-msm+bounces-82789-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BDE1C78210
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Nov 2025 10:23:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id A5C104EA299
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Nov 2025 09:23:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00619341678;
	Fri, 21 Nov 2025 09:19:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="o5wR2HXt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="M3FxpTtP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6067F33CE91
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Nov 2025 09:19:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763716779; cv=none; b=es7wW8O/EQ7kkHYIS/bpIlecNtYUvIBRDwlKkyosQGcf+aJXLsu+9xCQ88aAkvRzIw7BZVTlgUe9SgSRg6KurHE+/sQmoBuWL1+TjyU6TaiJ2R9TMP9vEaXG1mNimSVjYyRPVHBPzHeJv6QcnCWWfrwrFM2jnGGlHBJJDbArMkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763716779; c=relaxed/simple;
	bh=93pp6K5KRJ0nOULLGFyNsHHqNK/ssHzPkmeZq5LEK7s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XJExgGSp9asZr/KzxfVTMdhXfbIkKwfBAt+VWaQCxA9v6e5g0E1VCqOZrMNMW9Vkh1b5p9h0uqdNN/6uG+InC1/r8fwq5evseMb2CWcJBwxkGxZt5yHd2zoP9Pal8tBorvF1fb6M7KO+1ZYgREqMvbQlZKVTDb1hu5JR2HZPRtw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=o5wR2HXt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=M3FxpTtP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AL65oTX1337817
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Nov 2025 09:19:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	C8ThIwuK59MSjkJYMBHga8gJe9326S5J7eRXrlnJw1w=; b=o5wR2HXtfvbjsLBf
	3Shqp5dNFmnEEdFMbhXWNEa3iWL5pEIgrw7ir8h0Ez4VoPdS90t7lEVR1O4J6bwy
	OE8/QXU1D5p10AANBMsZD2riEjlVnAJMbNa72fj3/DBt/WyKOJCgTAlUJXU3zlbv
	MNnCoQiHLL9ENd8SEAMLpRw1qDBLF+vKuz7m77rrhJOcKzrrAXoJgkCxTXjLC4dD
	c3Pcf/ZRHq5CdFUH+hORunZrzin2S/IBDvay7HGfJvJ0Xv9MNgvBu9vdVc7BCqwM
	OuoflmvibRUve/b/X0a2LM/wvgJGdbHIGXmNvvvMzW5gcgg1wPz5sLJ37NNsp0mA
	41VLrw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aj5y7tyq1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Nov 2025 09:19:37 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4ede0bd2154so5913911cf.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Nov 2025 01:19:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763716776; x=1764321576; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=C8ThIwuK59MSjkJYMBHga8gJe9326S5J7eRXrlnJw1w=;
        b=M3FxpTtPjLs4QU/QAuWzM/tHWSzRVWGJlnV6tWzRZ+I0V0L2Es87nicjCIzL/LQbqa
         HI9JqW5uuqq8GpJ0IkWzkK55dCmPe2+JaR2qa6ZPiN921olQ3TU6ML9ECkS+LwEZrIcT
         9MAFzQ8X/xkq9T1CenFSbrREh2dRK3dirFpxviux2sQyaEE9TDqx+/svXpv5KfTrqpgb
         +rrPMNh9VvYcQCiEkn1ngYN62p/0hb1gZ522VeKjcPg78meQx5aFr1WPskBkMzc5O2ik
         /4vF6GqnaeQE37zIlZsBOVNyj1igRwEur/X0uDo/PMtzo8gPOfiXmT4xWJhgWOkgk1kY
         5PnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763716776; x=1764321576;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=C8ThIwuK59MSjkJYMBHga8gJe9326S5J7eRXrlnJw1w=;
        b=dcDUsE3HrKRlSaU1NCklfJeNoQKxMS0IaINREYHBGGuWhwdxoIJtsTqlAV9pSUik0g
         jmToCe9ysLIW1QFn4bqm1hVKLDwnuQcZ3klLNZvQ15+bisf/+31mhHvP3oPH9YDoQCMO
         6WeyMWFUbsPAtGy5H7rCo/QUmyFfKJgd0PqTe7rUkYrm1lmQOkGls9u+vhJ9VooTTv7E
         SzIjnINdM7y94QBwP9zACuo2e+/MQku7J5EexZiC3IKzGqRsUVfHJIVUhX12pz4841s1
         wojzdHgmWPobZrAAjTuXVDKj8YEBkscf4aKB1Ms2qB60rohuS1PvDaAWvOYIp3Yw7Qfw
         NLIg==
X-Forwarded-Encrypted: i=1; AJvYcCXiJbfa+LvpFlogiQVtGo/I5HIgvSOMj8QZSroIPrYHv+jYgmLfUEntw2F/EkHO5nfu5oF7sv0Ob9FOVFmm@vger.kernel.org
X-Gm-Message-State: AOJu0YyAciGZkmWzJ0aTXaEnngZ2oAceoyj1f/sM8cdglAxFwj98sfZa
	vfy3t0K43aoaQcussBxU3ZXlCGckejHR6hSSbuUoP5OpXSUl+2XXxg3g5pg27X/JcQAt4WoFhEG
	kF/ZalJ902Ttlrj68aWHKvWOIU/ON8Jg6COW9J9gOpzhfxQIdGLTaqONLAIgOo2Y5GF9s
X-Gm-Gg: ASbGncvp1KZvLjrQGRUgjKjKd+0moTs5gLL/ukLckkY1ItOQK0YaHvP0BaHm2eovJ0k
	gygUR6gRwVej1RiWSlvTaKXq7h1ML1PIN2Q3fBApwmVDIk5Oxwhc2cAWi+g8pKmrd6xukEjVExU
	TDnK5/Jop1Sw4E3vYWWtXxyHDPBYf1AlsgyTlAs6eHQUN33JzxL5xOsCZ66uB1keHmsR4ClW2Jv
	ku3prYEX8lVeQm4OKjdUTq8xeHjysUZ5pDBS5KyTCt9rKBwez5jmZZVBYgDvfaRBS5+zbmgk/7l
	azOuo5LHCacW95BapkB6n8/68sHkn9M1jZFtsipvpyMIFlxGk/JlDzyoAOEWk3XFvAFZ/LFLOrd
	4cYxVy2Dv/USHULKa/aFuVQXwUximgI+xM1tHGk8JkgC14wHqnVhCK43OQa5CZtZlzxI=
X-Received: by 2002:a05:622a:c3:b0:4ee:2580:9bc5 with SMTP id d75a77b69052e-4ee5883ae04mr16435941cf.2.1763716776389;
        Fri, 21 Nov 2025 01:19:36 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFm/JGHQ40fJEftfT3CcvrQpmlf+U6w8IwlHK/aospVSRLrwkNSqWoX994rgeL5orZIkHPZtw==
X-Received: by 2002:a05:622a:c3:b0:4ee:2580:9bc5 with SMTP id d75a77b69052e-4ee5883ae04mr16435791cf.2.1763716775832;
        Fri, 21 Nov 2025 01:19:35 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b7654cdd62bsm419357466b.5.2025.11.21.01.19.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Nov 2025 01:19:35 -0800 (PST)
Message-ID: <5ee9f41b-979f-4c44-a009-f0d94f6854b6@oss.qualcomm.com>
Date: Fri, 21 Nov 2025 10:19:33 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: arm: qcom: add ipq8064 board variants
To: Christian Marangi <ansuelsmth@gmail.com>, Rob Herring <robh@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251120135435.12824-1-ansuelsmth@gmail.com>
 <8e75be2b-643e-4380-a018-3cb718745101@oss.qualcomm.com>
 <691f3465.050a0220.105096.7667@mx.google.com>
 <20251120174119.GA1586641-robh@kernel.org>
 <691f9aee.050a0220.138abd.0f33@mx.google.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <691f9aee.050a0220.138abd.0f33@mx.google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=QMxlhwLL c=1 sm=1 tr=0 ts=69202ea9 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8
 a=9UnCyIbBERiO__AbIc4A:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: uE_ZS5HBp1InrOssC1ikebG22pg_NV-I
X-Proofpoint-ORIG-GUID: uE_ZS5HBp1InrOssC1ikebG22pg_NV-I
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTIxMDA3MCBTYWx0ZWRfX42wt5GgisSva
 CQ/eudJjacN9tEzNiQ0Bi8eNRvQOALO18qaEfIO01vLocEhh3SmhXMHzeGU7CQWi3HsMBRYlIsV
 lqoBTLJOzdwRyPjzPiN+fOqSoqL0pPmMQ13UeMctvUfCKuL6Tn3UH9wtRqQt9VT6qMXksYe17Yq
 g9IkTHbqqOomcepdhyJoBdYMoX1Y50V+WE2d66CbrI0PyXpwgG8fTyrOCgMzlIxXPHrVsvHsHK1
 e9L174nq+icpdzv0oWQU/dIF8D+MqvB5s5ZRYeObPwl9sCS/hfLcuqpTWdjk9plbskiBWfGv86P
 26P0nMf/iSB3h6f3RD9kyg3v7JSMN81srhXds/xPRJoGwm3tPQlVypBExJbGLE4r6dO05yn6Vqs
 xB5oYRT5uU9H/8Ythqixxmgcp4uoiA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-21_02,2025-11-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 clxscore=1015 spamscore=0
 adultscore=0 impostorscore=0 phishscore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511210070

On 11/20/25 11:49 PM, Christian Marangi wrote:
> On Thu, Nov 20, 2025 at 11:41:19AM -0600, Rob Herring wrote:
>> On Thu, Nov 20, 2025 at 04:31:47PM +0100, Christian Marangi wrote:
>>> On Thu, Nov 20, 2025 at 04:25:37PM +0100, Konrad Dybcio wrote:
>>>> On 11/20/25 2:54 PM, Christian Marangi wrote:
>>>>> Document QCOM ipq8064 board variants ipq8062, ipq8065, ipq8066,
>>>>> ipq8068, ipq8069 now matched by the QCOM cpufreq nvmem driver if
>>>>> socinfo can't derive the variant from SMEM.
>>>>>
>>>>> Suggested-by: Rob Herring <robh@kernel.org>
>>>>> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
>>>>> ---
>>>>>  .../devicetree/bindings/arm/qcom.yaml         | 20 +++++++++++++++++++
>>>>>  1 file changed, 20 insertions(+)
>>>>>
>>>>> diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
>>>>> index 18b5ed044f9f..0eb1619fede8 100644
>>>>> --- a/Documentation/devicetree/bindings/arm/qcom.yaml
>>>>> +++ b/Documentation/devicetree/bindings/arm/qcom.yaml
>>>>> @@ -299,12 +299,32 @@ properties:
>>>>>                - qcom,ipq5424-rdp466
>>>>>            - const: qcom,ipq5424
>>>>>  
>>>>> +      - items:
>>>>> +          - const: qcom,ipq8062
>>>>> +          - const: qcom,ipq8064
>>>>
>>>> Since 'items' requires that all items are present (and in this order),
>>>> we would normally have a board name go first.. but I suppose this is
>>>> some sort of a fix to the issue that sparked this (posting the link
>>>> for others to have more context)
>>>>
>>>> But since these SoCs do exist, I wouldn't say this is necessarily
>>>> wrong..
>>>>
>>>
>>> Well we can see this as a ""template"" for device that might be added
>>> using the ipq8062 or ipq8065 compatible.
>>>
>>> When device with that variant will be added we would have to just add an
>>> enum with the real device name on top of it (as first element).
>>>
>>> Honestly I should have added these compatible long time ago as on
>>> OpenWrt we have tons of device that are ipq8062 or ipq8065 with the
>>> compatible structure
>>>
>>> "device,name", "qcom,ipq8065", "qcom,ipq8064".
>>
>> If you don't you have any boards yet, you can do:
>>
>> items:
>>   - description: ...
>>   - const: qcom,ipq8065
>>   - const: qcom,ipq8064
>>
>> Just to prevent skipping a board compatible.
>>
>> But you said you have tons of devices, so...
>>
> 
> Yes the problem is that it might take a while for the DTS to be picked
> so maybe it's better to push for the description solution?

DT depends on bindings, it's not so stringent the other way around

Konrad
> 

