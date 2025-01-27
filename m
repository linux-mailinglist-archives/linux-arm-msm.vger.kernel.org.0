Return-Path: <linux-arm-msm+bounces-46284-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8984DA1DB8C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Jan 2025 18:50:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DA08A161A28
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Jan 2025 17:50:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D598318C03B;
	Mon, 27 Jan 2025 17:50:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VbqmqTb0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A4F31662EF
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jan 2025 17:50:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738000244; cv=none; b=t68Z61iq3oJXBRif9cnEvPCQUJDoiqD/jM7Zr1N0Rtg30wheGby4rFQWKN8oFJlplmDZ235qt3KRIx+eYq58yQZJglmAscxLONwXQXcdbDfa05jIAS6UtNsvWdO3sN2z5loZBLcUi0nw2bYdxg1YFQHrii+lX017lkSgKBZCgA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738000244; c=relaxed/simple;
	bh=oMtKn1w8MV7RLORjGlWvvKkp8uiAuM8uule2Sri1DiI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Tu9Nlx6dLAWz/5S1AVna5N/0DC7D+H+iJWbLVemGB5voEtXeqjEIkZE6XH2cbADCNezoF9rZG0q4OB6Y+GPIIBFM/oPwhY3XRpuIJlwPDMkBoXChkPcZAKcvBvOOaFIlmNRrM+kHOyMn+KbB4lPL81ZaJ70RbWbeOLoQvyq+lbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VbqmqTb0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50RDSQ6Z024804
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jan 2025 17:50:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JnFriaF66qty0fntObxiPXMC9qtMds3asWVEQb56mxM=; b=VbqmqTb0HjxQSMJX
	Z0rsKuXrXEr4OCJRTmIf+hC4H6uRoYff6BwMe4dia7XPT+cMTueTix0nFY7rfeNQ
	+qW/crq1ILW+Tv0mT5lHJYsbHqW5ET4zLhV4aviwVuATeb2a/wyaEPzely88ppM5
	J8RmS0bYULha9ux02NRlODwp6L1JoGHO2Zapl0+0J9SnilfuJPoOVvNxq/qLMDA4
	qMXRno9sZRqQLqLiwK2U7uhmJRzGo3hmzBUEtuPMcK5Vb6ZwBx2m4m2eOtiLev4l
	2XZh4z0msNtPjdDsihOZ1n1pjL+JGw+3lTigmdLO3XxPHXZRmwnD/zJc5l8T/D3l
	m6mXiQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44eb2crjnf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jan 2025 17:50:40 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-46e4842dbd0so15143471cf.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jan 2025 09:50:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738000239; x=1738605039;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JnFriaF66qty0fntObxiPXMC9qtMds3asWVEQb56mxM=;
        b=pAJW/PWyFHafsWodUnJKh3UAdOZcFjdpGbfV05yuznCJsEX1zRk8PsUuf9lj+v0kb3
         3ghPLfbvswYLTXYjuhB0FvKaJTXK0j3WJCIVTwK15YQFsUmCACsKlZ+uHlI+Rfa6wVJQ
         A6PljJFwyOkih8zabstmFjcmyDey4Vou5zV+bqcwX5v8v+SOqvYjUWDTKcseyQZpJf+C
         ZPwAt1D6r0j5lKcnaHGM5nz5r3rkybP31gZmIXAinEmNE6YRQ7RLxL6O0b/BWu2Lzedp
         ToNrB/0JoOplJhxzRqS7q8ZQ79CzJfhWl/uKBVZjR/nd7dh9eSDB4Ds3ZBLN5n+7L6xu
         yjVw==
X-Forwarded-Encrypted: i=1; AJvYcCV9Wu186ZKjZWra7kN9lIu/D5NkJaYOAiPNubr6DEWnYPslaENvU4y0vNjM6LpQgo/2YyUBEoWXWRg4elyh@vger.kernel.org
X-Gm-Message-State: AOJu0Yyq8/zgrhLamCpAEY5znZmucc1R7lYrN01KjSLpmaEQhtmCdJwE
	U2GNpTXMXDzItL4MJdcEfrtuQF2xLEsMK2E8+LgUVWrg+He4NHQ9PxrpquyOy3R48COA6+tCodB
	IUO827igHcZzI6oY3PV2Rlk13AJvbRzvKqh1S71f0Cs3CkJGOupubKEr13EUJcivH
X-Gm-Gg: ASbGncsOI1hMXIhpFrfwJ+9oFQugZVMYanJJ+8pYC/5NIfBPUSkVNaF86bIdevbIE+D
	NeCLDgiRTuD9o3pFp1dMzHCJB8bcCpyCqxuRgJIcsKO1/r/Zq23jFwq0Nhar5PWcM+FALgie1LB
	cKK5OlTY6QzTd2LtfxOO2np3k/gqqfTBBblRDbEcHxIVkEjDdAPmuxpdR3XtzPhwXLP8YQgY9g5
	C4JoPvBPV5KIrCeYIfANmi14vI57VzZSj6AYdXaLQ8nbNiMuMcr0zFNTCjO7OdS1GawSlkoYupt
	neq4jogRhNWMYoH3uREG0fX1ZtAWthL+s26dmNRI33F+k0isB08+073s18c=
X-Received: by 2002:a05:622a:30c:b0:466:8e17:cd1f with SMTP id d75a77b69052e-46e12a162demr247808711cf.3.1738000239326;
        Mon, 27 Jan 2025 09:50:39 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFTkQ6oLODC3x3JbwOrNQK8XQgzzBtmvlUI8UYGTs+vXLEGw9XGJuWNXuUxMNcvKByjipgqYA==
X-Received: by 2002:a05:622a:30c:b0:466:8e17:cd1f with SMTP id d75a77b69052e-46e12a162demr247808531cf.3.1738000238876;
        Mon, 27 Jan 2025 09:50:38 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dc186d8ad3sm5668983a12.71.2025.01.27.09.50.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Jan 2025 09:50:38 -0800 (PST)
Message-ID: <65a880ba-f721-4720-81f7-6891c335f7aa@oss.qualcomm.com>
Date: Mon, 27 Jan 2025 18:50:34 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/8] dt-bindings: serial: Add support for selecting
 data transfer mode
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Viken Dadhaniya <quic_vdadhani@quicinc.com>, andi.shyti@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        gregkh@linuxfoundation.org, jirislaby@kernel.org, broonie@kernel.or,
        andersson@kernel.org, konradybcio@kernel.org, johan+linaro@kernel.org,
        dianders@chromium.org, agross@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-serial@vger.kernel.org, linux-spi@vger.kernel.org,
        quic_msavaliy@quicinc.com, quic_anupkulk@quicinc.com
References: <20250124105309.295769-1-quic_vdadhani@quicinc.com>
 <20250124105309.295769-5-quic_vdadhani@quicinc.com>
 <10060d39-87a4-4565-a2a6-80c93ac2266a@kernel.org>
 <dudqd2y42wy6iq2k73aphd5ol4mtq7z4c54zhd27rl745rrw5x@p3oummf2jke7>
 <374e16d6-46aa-4bdf-85e9-bc2e33c38057@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <374e16d6-46aa-4bdf-85e9-bc2e33c38057@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: iAGbFY3LcCiCyOm8KpMOpFSkaukSDlAA
X-Proofpoint-GUID: iAGbFY3LcCiCyOm8KpMOpFSkaukSDlAA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-27_08,2025-01-27_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 lowpriorityscore=0 mlxscore=0 mlxlogscore=999 malwarescore=0 bulkscore=0
 phishscore=0 adultscore=0 spamscore=0 impostorscore=0 clxscore=1015
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501270141

On 27.01.2025 5:24 PM, Krzysztof Kozlowski wrote:
> On 27/01/2025 15:27, Dmitry Baryshkov wrote:
>> On Mon, Jan 27, 2025 at 08:02:12AM +0100, Krzysztof Kozlowski wrote:
>>> On 24/01/2025 11:53, Viken Dadhaniya wrote:
>>>> Data transfer mode is fixed by TrustZone (TZ), which currently restricts
>>>> developers from modifying the transfer mode from the APPS side.
>>>>
>>>> Document the 'qcom,xfer-mode' properties to select the data transfer mode,
>>>> either GPI DMA (Generic Packet Interface) or non-GPI mode (PIO/CPU DMA).
>>>>
>>>> UART controller can operate in one of two modes based on the
>>>> 'qcom,xfer-mode' property, and the firmware is loaded accordingly.
>>>>
>>>> Co-developed-by: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
>>>> Signed-off-by: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
>>>> Signed-off-by: Viken Dadhaniya <quic_vdadhani@quicinc.com>
>>>> ---
>>>>
>>>> v1 -> v2:
>>>>
>>>> - Drop 'qcom,load-firmware' property and add 'firmware-name' property in
>>>>   qup common driver.
>>>> - Update commit log.
>>>>
>>>> v1 Link: https://lore.kernel.org/linux-kernel/20241204150326.1470749-4-quic_vdadhani@quicinc.com/
>>>> ---
>>>> ---
>>>>  .../devicetree/bindings/serial/qcom,serial-geni-qcom.yaml | 8 ++++++++
>>>>  1 file changed, 8 insertions(+)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/serial/qcom,serial-geni-qcom.yaml b/Documentation/devicetree/bindings/serial/qcom,serial-geni-qcom.yaml
>>>> index dd33794b3534..383773b32e47 100644
>>>> --- a/Documentation/devicetree/bindings/serial/qcom,serial-geni-qcom.yaml
>>>> +++ b/Documentation/devicetree/bindings/serial/qcom,serial-geni-qcom.yaml
>>>> @@ -56,6 +56,13 @@ properties:
>>>>    reg:
>>>>      maxItems: 1
>>>>  
>>>> +  qcom,xfer-mode:
>>>> +    description: Set the value to 1 for non-GPI (FIFO/CPU DMA) mode and 3 for GPI DMA mode.
>>>> +      The default mode is FIFO.
>>>> +    $ref: /schemas/types.yaml#/definitions/uint32
>>>> +    enum: [1, 3]
>>>> +
>>>> +
>>>
>>> Just one blank line, but anyway, this property should not be in three
>>> places. Do you really expect that each of serial engines within one
>>> GeniQUP will be configured differently by TZ?
>>
>> Yes, each SE is configured separately and it's quite frequent when
>> different SEs have different DMA configuration.
> 
> Well, I checked at sm8550 and sm8650 and each pair of SE - which shares
> resources - has the same DMAs, so I would not call it frequent. Care to
> bring an example where same serial engines have different DMAs and
> different TZ? We do not talk about single QUP.
> 
> Anyway, if you need property per node, this has to be shared schema.

I'd rather ask a different question.. Is there *any* reason to not use
DMA for protocols that support it?

Konrad

