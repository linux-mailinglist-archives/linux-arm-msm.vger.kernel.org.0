Return-Path: <linux-arm-msm+bounces-111322-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id xhNsE090ImpyXgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111322-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 05 Jun 2026 09:01:35 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 86376645BA8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 05 Jun 2026 09:01:34 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=N0G8QUaH;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=gNdvZ2SI;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111322-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111322-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DA98A300A77C
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Jun 2026 06:51:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6183542849E;
	Fri,  5 Jun 2026 06:51:14 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DBFC426ED6
	for <linux-arm-msm@vger.kernel.org>; Fri,  5 Jun 2026 06:51:11 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780642274; cv=none; b=eX4rRAA/WV/JYlKAIOeVZY7K4tFl9czDJUW7+GPmncHp8IAoFcEEGFTr8OyGF7+rMhYCRAuEVyjp4IFKhgpZq87hNLczFyliEOYF5vyL5MRES6paEczSiSnW1rNI6APh+J98+/38Ms5PIwsr27o+5/p8CmlLGXwLdN7Nlu3UwgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780642274; c=relaxed/simple;
	bh=YCfSjGROjEv47qln7WDmdcB8PlZa092d99y2hi/y6lQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=k26U8KLVnNRj5wGw3tXrqLCXuGEUrC5AoR35zi9CZjPZdtTe+mxkgjmqLn7xXnTBNT2miozNubRiS8AwQT0VXRlE3z0pbw4/0WVRkgW8lOkSWDjgYEyQ6wJm6dfHjwV23k5EJ9pLPu7G/sLPOijwRLg1EyP+o00HNvD29azpDDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=N0G8QUaH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gNdvZ2SI; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6555qGGP2428353
	for <linux-arm-msm@vger.kernel.org>; Fri, 5 Jun 2026 06:51:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NMTybuxZsT1BMMYHZbqITe6tCaMwGKIrBzgFt7cf/oY=; b=N0G8QUaHJb0f/p/j
	m1z9ix02a7ie8Cj3WWckpaT3gg2VLvH4JTd7cY1Ya713zD5mZd1z8yn6kgqiRMvE
	8e2V1DWc8PzrLDnQUh8Qhirg1XraCpDV7jb+ih1OpQEFzRNn1fON7S0p6J/Ub1+Y
	+fJdEa2Zk9Puhj7TuyN1vMFYmExxh2tYPHuCT5w7BQi+xOPN2lk3fyA6JkumJ5MU
	5EGxlo13r7RT41T3eBBMcjgk3As7JEoXQPuyjgZpYwJIuISj+KWrZl/Xc3uyDdwY
	InwDT1gPuHanvkSlaeVPCkPx1JXzfu6dRuVQ9njvFFFjnTkIpR9IFLWxSR/zETW4
	jjnhyA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ekrphg711-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 05 Jun 2026 06:51:10 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2c0d0516ad7so18054545ad.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 04 Jun 2026 23:51:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780642270; x=1781247070; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NMTybuxZsT1BMMYHZbqITe6tCaMwGKIrBzgFt7cf/oY=;
        b=gNdvZ2SI4+vxoU9U/ir1T9z+/2T1kN0qmHDIRKXj8UJEYCfM85hhfeHPV4eEaVERmv
         KcbZJHPad0ZnlICsjj1EyYBgMdotQrzln7PM82llozIc/WCxua38M95/m8mnziNTNB3K
         1/U3eWwHs9pEaJtP5BTOJwV4JPrgCc2qcluO+XEQ3nlaIm4kGThM/JGY3ilkec/ch7Dd
         NwCD1k3bTPQ3Bf2T3LOkLlhGFd5rLteopmd75eX6CX4NWPjuZBisyCqUOCBJQaOqEKfO
         mUJqK9TXNgAFUfGaHt3af/wlcyd3dd7DM7h522PKge5jyZnhZRl88Lt8jCBjR94b5DAg
         0Tvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780642270; x=1781247070;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NMTybuxZsT1BMMYHZbqITe6tCaMwGKIrBzgFt7cf/oY=;
        b=Uu7Ad9/ihiBVWIbhwtFVJG6i7wCwxhb9EgX3MIhQ5j9theh7SaMtyEqUvKaovnIrhA
         gcGx4m4ATqXrh2kcQRhszb3LoWHM1Z/rnDqQtA3DDvrOYoRVhBAp6wQpP7bNBE5wJlq9
         /5quNZItBW8AHsygbNNtlP1cHrVd1K6L+XF5qttQRU3by9WLEj4+6B43+94VBEf4l8Sj
         LblWvTeXXfyXaAI0Jlhv3o3SKDVk/wYFQ3aWQvzy4hFsQ1IMdabjT8v21rxF3UwlmyD+
         9wS0JMYetcAxataO0dq0e2oDOA9MjiwsfhFnDeS8aWHtNwMLJQCJwWmlymYWAsjLpsdx
         Dt2A==
X-Gm-Message-State: AOJu0YxjVGrhSS1QbgpsadcXgeqpfkqLwFl5Jj3qCQGn6YU55+mJlXub
	uTFRJ6sJS8mlFQeiVdRQDuu0XAcfh/7ZCTBVTYf/gtfJaFO9KxdDumEPIISpo6ZWugaQbpmaD0v
	yrA2/g9QutM3xIPQ66mZ6PEoewaUBu8dON/OvlX0JJeJ+Xj3Fo+gLnL1wN7SoL69ShRja
X-Gm-Gg: Acq92OGDRXFvmZ74tWrDU17khKv6L/oss/H5+yPlv7KMwrDUBG84SvD6i+r1JGXyGCK
	Wz+QveUw/9/bF12JPaWAc47Qexl4aivaJeYJaVP4G1LZYztS1sOqcvoYgX1ALzyKeadaXG2KRTf
	o69FjZQsBf3yEpmM+XvvEz5Toqm4kDzhEXeFxiWD/ncwkgx5LBx8aCLgUAwO8pUiq+R7squyR+R
	r8Ie6FCU5oR1b4PvUbuEXxJzc/DOL6P84fZsj7Pn+J0kL4RqDK6JG0INsQwDpwqnS1/Nxe+v5ZI
	Gt4G+oyQGxZuAtYIeHEICo/sODW8OTCggkD7dMsffhw5PFcCc+aRT9vpAafokc5B2EaiXeS0+Kk
	9Pnz7s3/djYRHIZ8k/rohaXS9UabvSL4QAGXZ+y5+a0t5LiCEbHofIpgjCrrV6ih0FdwPNYq/lg
	pH
X-Received: by 2002:a17:90a:e70f:b0:368:6a6e:94dd with SMTP id 98e67ed59e1d1-370f0f43e7dmr2694450a91.24.1780642269797;
        Thu, 04 Jun 2026 23:51:09 -0700 (PDT)
X-Received: by 2002:a17:90a:e70f:b0:368:6a6e:94dd with SMTP id 98e67ed59e1d1-370f0f43e7dmr2694418a91.24.1780642269340;
        Thu, 04 Jun 2026 23:51:09 -0700 (PDT)
Received: from [10.151.37.217] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36f6c668f90sm6819699a91.6.2026.06.04.23.51.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Jun 2026 23:51:08 -0700 (PDT)
Message-ID: <d24238d5-7b71-40e6-b6dd-c2f1aa150d77@oss.qualcomm.com>
Date: Fri, 5 Jun 2026 12:21:04 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] regulator: dt-bindings: qcom,sdm845-refgen-regulator:
 Document IPQ9650
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20260602-ipq9650_refgen-v1-0-55e2afa5ff64@oss.qualcomm.com>
 <20260602-ipq9650_refgen-v1-1-55e2afa5ff64@oss.qualcomm.com>
 <b8758150-00a8-4d6e-bd2d-c1985d70ceac@kernel.org>
Content-Language: en-US
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
In-Reply-To: <b8758150-00a8-4d6e-bd2d-c1985d70ceac@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: wdFRm0hUdNVuq2hG0ADeUIRvf7AWoPf9
X-Proofpoint-GUID: wdFRm0hUdNVuq2hG0ADeUIRvf7AWoPf9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA1MDA2NCBTYWx0ZWRfX92rAN38ZVr1k
 0iVgjqeFa+Lin7x6XD0Zhm0dB2gx0lwmItVzGp80FDrFmJkjmFe0OuCmCJpxgo5YEUgN5OokOKS
 zA84BelLyNrugmDqiHF4i9SS78XKorqk77Ip0jEAQXUW8b3Qbxt+11fabzsWBIjL9/NFnArPV/o
 Pg+IppAH4/ECM3jNhu6487PqlDBGGOpVWOm91Bo94BCJTUe2pTFhiomzZi7SEEnACufiZRfB+Am
 Atf6oT9EySllZMZIddwaxIi9aXaB/kjifUUAxyIWuBwEutt1DImMLUjaAqpBm2N4H8IUG719vIO
 xQkUi4xySdNtEHmL/ErdU4k0+Eqq9InbTE+gOg8DJccJ3Rkb2i8uzBcpPCZa1PoFGBBEIWAXQE+
 xHcfg2jU64g1Wib4tLza3M9yFhbXVITQY1rtv9KBtaq5zWopco5oPhQGxb1JvTiie5+9qcN3D0f
 L3p2s6aSvJbzRyQojZQ==
X-Authority-Analysis: v=2.4 cv=T9a8ifKQ c=1 sm=1 tr=0 ts=6a2271de cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=uTq8weK-lZKwlp8NyDYA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-05_01,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 clxscore=1015 bulkscore=0 adultscore=0
 priorityscore=1501 phishscore=0 spamscore=0 lowpriorityscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606050064
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-111322-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:krzk@kernel.org,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[kathiravan.thirumoorthy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kathiravan.thirumoorthy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 86376645BA8


On 6/4/2026 8:42 PM, Krzysztof Kozlowski wrote:
> On 02/06/2026 11:21, Kathiravan Thirumoorthy wrote:
>> IPQ9650 has two REFGEN blocks which provide reference current to the PCIe,
>> USB and UNIPHY PHYs. Unlike other supported platforms, IPQ9650 requires the
>> REFGEN clocks to be enabled explicitly.
>>
>> Document the IPQ9650 compatible and the required clocks for it.
>>
>> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
>> ---
>>   .../regulator/qcom,sdm845-refgen-regulator.yaml     | 21 +++++++++++++++++++++
>>   1 file changed, 21 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/regulator/qcom,sdm845-refgen-regulator.yaml b/Documentation/devicetree/bindings/regulator/qcom,sdm845-refgen-regulator.yaml
>> index 40f9223d4c27..2686569ca060 100644
>> --- a/Documentation/devicetree/bindings/regulator/qcom,sdm845-refgen-regulator.yaml
>> +++ b/Documentation/devicetree/bindings/regulator/qcom,sdm845-refgen-regulator.yaml
>> @@ -16,6 +16,16 @@ description:
>>   allOf:
>>     - $ref: regulator.yaml#
>>   
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            const: qcom,ipq9650-refgen-regulator
>> +    then:
>> +      required:
>> +        - clocks
>> +        - clock-names
> Entire allOF block goes to the end, see example-schema.

Since the allOf already at the top of the file, I just added under it. 
Let me move it to the end.

>
>> +
>>   properties:
>>     compatible:
>>       oneOf:
>> @@ -29,6 +39,7 @@ properties:
>>   
>>         - items:
>>             - enum:
>> +              - qcom,ipq9650-refgen-regulator
>>                 - qcom,qcs8300-refgen-regulator
>>                 - qcom,sa8775p-refgen-regulator
>>                 - qcom,sc7280-refgen-regulator
>> @@ -45,6 +56,16 @@ properties:
>>     reg:
>>       maxItems: 1
>>   
>> +  clocks:
>> +    items:
>> +      - description: Core reference clock
>> +      - description: AHB interface clock
>> +
>> +  clock-names:
>> +    items:
>> +      - const: core
>> +      - const: hclk
> You just added clocks to each variant, which is not explained in commit
> msg. And it would be a separate commit anyway. Probably you wanted to
> add proper constraints (:false).

Ack, will make the change to define the clock and clock-names only for 
IPQ9650 compatible under the allOf block.

>
>
> Best regards,
> Krzysztof

