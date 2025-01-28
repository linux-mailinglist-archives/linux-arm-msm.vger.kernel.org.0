Return-Path: <linux-arm-msm+bounces-46378-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EACA0A209DE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Jan 2025 12:41:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3C294163DF1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Jan 2025 11:41:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03DF51A08A0;
	Tue, 28 Jan 2025 11:41:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hG/u7FyW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AA0019D8A7
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jan 2025 11:41:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738064461; cv=none; b=n4dDlOVNeCe0bEQui6uV3WmV+Yd/Le5gQ/S/nW6/RNudvKLxXsOxEH3i8hw6A8IEBlSMfPMOXzs3wzwLfXRBk0ATe7EvlqeFQjsGPa9dFD1Y6coe1FqlULe0wdO+IrxWkjr09zmnPxkma/1qgBlUXAUrJltCFyzPSOqZONMHEWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738064461; c=relaxed/simple;
	bh=0iFCwS6n5V7IzcqYwsDRIIklZJjISlLC21qyBkhEvZk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=vFS21jO77a6QZcby8OkqjXdrbAphlP3dKyfAMhaU0bq0s8cCZo/XD/J+EnuN5wU7kk3wPK2RJDVnO0QB9MsUbOKsOHqee+YCUlgrRHN+dXyYs1n/Blf3gQuASIECz5qh/1E2OygZCT94+eEn3WVH5HoCy6GbD/bJRQubh3jGU6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hG/u7FyW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50S63ZS5011340
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jan 2025 11:40:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qJQJVddmQT/TZOOgF6MQNyU12sRZZbRBhEd91lNoK9U=; b=hG/u7FyWx2CFBvlQ
	Ca6zkPK6sq448AYrrvx2jeph76JXeMWpRyJLJRJhwu96L2skyWMTbwQ0mBbz/ekE
	+i5hiSKTnoMxEudoNOQeYy88XvKy4BVnkbv/MhHF9dRh86SuOZ8VEBf7dcA317EO
	P45Nu5XIlkRN0kadwcKX0AWL79YB1l/GsESFU4+fwEphDQ2aK6B5js7kUMHlghid
	YbHdCZyhLhUq1oxb3dCGFkZGH2B+R6BGRZ/XocDirDU5qCiMIzrsii0gcWdLFxtS
	cgyGrSZ80fUH9a4IODU94Su6FO4GgXHLICGTteB4kSee5WQDMuiX0oyaoXUoGqqU
	HmCBag==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44esmw8rv3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jan 2025 11:40:59 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4679af4d6b7so9937801cf.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jan 2025 03:40:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738064458; x=1738669258;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qJQJVddmQT/TZOOgF6MQNyU12sRZZbRBhEd91lNoK9U=;
        b=V4f4REt+MZucmaOpXuEn8EQeHSt3aWKXU1cHTMAIcmE6l0SeBM6ZQEzKUOC0Bt6EAB
         fQC0z7xaBu+5NCkpWzjybZelAgIkeD3qgxOJz7Ck6+TSxmv/2YHGuU8bFDttk7n0S0WI
         dseeqqg4cdVyumT8e9Y666uF+eUeL4HHW2olnDPYuU3Ni4OndopiPPIWZs5Dz4x1r5P8
         Qa4vCDwPpH6QsyUEaHlyV3kb41szBXqA38J7azw2Ytx2YZTNY2jYcQwD09b4qDP+Rr8K
         iCZE/E0ZTeu0P9ZDMZw7wXxYW1AclIZ4dAdJUlH/2c9mE6dhzlpAS1m3AK9Fhq6exg1E
         WHrg==
X-Forwarded-Encrypted: i=1; AJvYcCVdg7DebaqUPy6emG2/9a6K9r8ZtV6yTUjR6HDibx85/u9mnr8FPHEn1qee7GBfrVqFe2c+yLkwm4hRrQug@vger.kernel.org
X-Gm-Message-State: AOJu0Yzyi1+aBbmrKlhTyRPfLqtH9hwDdTxf+TtkqaAgopbcX0NJjmXA
	tVYZRrNffIU708S5iWbfRCX/cj5KFLo2rq3nzfX0Vox5W5Ac7Jo7DH8Xm4rBH7ws6agoXzvBhTv
	eqMndHqtfg1W88DeehlTx4dIIRcnpoIOE8DXx0uK6uK/FktuhzCcd/qUzaB9ph2IH
X-Gm-Gg: ASbGncs2Q+gP9jXAyXD0NmN6ZVbwjo5yRp/MYhPW+jjFXIMs1Vj9AUks5A0UU96wq3P
	FuPCj7MOsmsDWiM1QcSA5HfFcE5NkIrUH38bW4YalTkMrNxiSH77/rvcVFEYW7AipXZYAM21Qch
	EvyBVo79PiKPLFfX1YnyMKsFbuMkxmwdONWgtnx39Qzd6w2Gp/VGWLzwGaeoap60mbp3KxRwub7
	6HMzcqhkxEs+MBvwMZOE/DF3AFjx3ryVxd5DjDNJOh1RefGmm4rt9rNoKrN0HtEdUFGifSwYiX5
	gLrxYmdjqehaaPyn40scU9HOr4ue6QqYIQRHmxKPnXKcUXnzHhosw8oMsGU=
X-Received: by 2002:a05:622a:453:b0:467:95c2:d8a3 with SMTP id d75a77b69052e-46e12a55c9cmr230730531cf.6.1738064458481;
        Tue, 28 Jan 2025 03:40:58 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGR5VS1dWzO4khznGgpsO/jMCtdkvK6pJci/0akamEvgGIS4WWmuYIykOhh6oJd4q5RY4Go+Q==
X-Received: by 2002:a05:622a:453:b0:467:95c2:d8a3 with SMTP id d75a77b69052e-46e12a55c9cmr230730351cf.6.1738064458131;
        Tue, 28 Jan 2025 03:40:58 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab6c4b0af38sm84689166b.149.2025.01.28.03.40.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Jan 2025 03:40:57 -0800 (PST)
Message-ID: <23a9b13c-0bb8-4145-8e1b-4624d13538c4@oss.qualcomm.com>
Date: Tue, 28 Jan 2025 12:40:54 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/8] dt-bindings: serial: Add support for selecting
 data transfer mode
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
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
 <65a880ba-f721-4720-81f7-6891c335f7aa@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <65a880ba-f721-4720-81f7-6891c335f7aa@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: wyi4BZXAi8HuF1CZ_Mr_BmsSgoP-lRxb
X-Proofpoint-GUID: wyi4BZXAi8HuF1CZ_Mr_BmsSgoP-lRxb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-28_04,2025-01-27_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 suspectscore=0
 impostorscore=0 clxscore=1015 spamscore=0 phishscore=0 lowpriorityscore=0
 mlxlogscore=999 bulkscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2501280090

On 27.01.2025 6:50 PM, Konrad Dybcio wrote:
> On 27.01.2025 5:24 PM, Krzysztof Kozlowski wrote:
>> On 27/01/2025 15:27, Dmitry Baryshkov wrote:
>>> On Mon, Jan 27, 2025 at 08:02:12AM +0100, Krzysztof Kozlowski wrote:
>>>> On 24/01/2025 11:53, Viken Dadhaniya wrote:
>>>>> Data transfer mode is fixed by TrustZone (TZ), which currently restricts
>>>>> developers from modifying the transfer mode from the APPS side.
>>>>>
>>>>> Document the 'qcom,xfer-mode' properties to select the data transfer mode,
>>>>> either GPI DMA (Generic Packet Interface) or non-GPI mode (PIO/CPU DMA).
>>>>>
>>>>> UART controller can operate in one of two modes based on the
>>>>> 'qcom,xfer-mode' property, and the firmware is loaded accordingly.
>>>>>
>>>>> Co-developed-by: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
>>>>> Signed-off-by: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
>>>>> Signed-off-by: Viken Dadhaniya <quic_vdadhani@quicinc.com>
>>>>> ---
>>>>>
>>>>> v1 -> v2:
>>>>>
>>>>> - Drop 'qcom,load-firmware' property and add 'firmware-name' property in
>>>>>   qup common driver.
>>>>> - Update commit log.
>>>>>
>>>>> v1 Link: https://lore.kernel.org/linux-kernel/20241204150326.1470749-4-quic_vdadhani@quicinc.com/
>>>>> ---
>>>>> ---
>>>>>  .../devicetree/bindings/serial/qcom,serial-geni-qcom.yaml | 8 ++++++++
>>>>>  1 file changed, 8 insertions(+)
>>>>>
>>>>> diff --git a/Documentation/devicetree/bindings/serial/qcom,serial-geni-qcom.yaml b/Documentation/devicetree/bindings/serial/qcom,serial-geni-qcom.yaml
>>>>> index dd33794b3534..383773b32e47 100644
>>>>> --- a/Documentation/devicetree/bindings/serial/qcom,serial-geni-qcom.yaml
>>>>> +++ b/Documentation/devicetree/bindings/serial/qcom,serial-geni-qcom.yaml
>>>>> @@ -56,6 +56,13 @@ properties:
>>>>>    reg:
>>>>>      maxItems: 1
>>>>>  
>>>>> +  qcom,xfer-mode:
>>>>> +    description: Set the value to 1 for non-GPI (FIFO/CPU DMA) mode and 3 for GPI DMA mode.
>>>>> +      The default mode is FIFO.
>>>>> +    $ref: /schemas/types.yaml#/definitions/uint32
>>>>> +    enum: [1, 3]
>>>>> +
>>>>> +
>>>>
>>>> Just one blank line, but anyway, this property should not be in three
>>>> places. Do you really expect that each of serial engines within one
>>>> GeniQUP will be configured differently by TZ?
>>>
>>> Yes, each SE is configured separately and it's quite frequent when
>>> different SEs have different DMA configuration.
>>
>> Well, I checked at sm8550 and sm8650 and each pair of SE - which shares
>> resources - has the same DMAs, so I would not call it frequent. Care to
>> bring an example where same serial engines have different DMAs and
>> different TZ? We do not talk about single QUP.
>>
>> Anyway, if you need property per node, this has to be shared schema.
> 
> I'd rather ask a different question.. Is there *any* reason to not use
> DMA for protocols that support it?

If not, we can simplify this to:

xfer_mode = protocol == PROTOCOL_UART ? XFER_FIFO : XFER_DMA

Konrad

