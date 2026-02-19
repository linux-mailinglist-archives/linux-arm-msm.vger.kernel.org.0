Return-Path: <linux-arm-msm+bounces-93385-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2GUZOksLl2lEuAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93385-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Feb 2026 14:08:27 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 47AFF15EE8E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Feb 2026 14:08:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DB2503007CA7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Feb 2026 13:04:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 625FC20C463;
	Thu, 19 Feb 2026 13:04:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="g/xLzWYa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hb1k7hsU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F71733A715
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Feb 2026 13:04:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771506267; cv=none; b=UjvaI8WQz5DBeeBdVkjDJK7er44HSxECrNiKujgToa7FkmJOiCvDBRpD8X7SP5uoEDlyT27yrL0ibMNpys15ZuZQvnWFa5fzH+vWZYztrtZcPhNYOwAaiEE7M/jhPNHLI0iSx2eRqxd4M/6hL5j3YDhQwTLLe+LZeVEGC4qYANc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771506267; c=relaxed/simple;
	bh=1NeJm8sPIVVg4lGdDswPtIieqlhK9RJ0JG6NPd8z2MI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZR2KUvlnlFbZ2oHfF9c9hF0bI+98sjYvL0b4DX3SlRyPrcXT2g/roCImI4QJ46yq31+jQR+tsjvwSvfbIY+Djm7CxijqOItIOa5wPfQrVIRZDLJyYxn7cFH0GgdCGAGHMvqGrsVYu8h+uMXg26Orl+jVoCi+Hn9aRWJRrVhyIIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=g/xLzWYa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hb1k7hsU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61JCF68e2883165
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Feb 2026 13:04:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Tta6p1UfArJB2f1ZLaS24vMXG5SGG6hI3ls4c9vUi0s=; b=g/xLzWYaZAS2bBWg
	JWzT/LveWvegH3N7zrFO6QdRNJTcLZNISsMN/krf3tyC9PLv1D8EtakrRm/X+nUO
	QTiwOgOcHeYp0b7TBQFkyqMuoBSt8ySJQIxK/gY2CIWczSrNWOgaN3sHXNoOVfbg
	1PRjlp5l9CJfTUom8JpT3ILdYazTR/mhBTo5T25pPdChfjWvaahZ9XbmiLMnTVlE
	Yrhuwspltlf7Q/5xFgiD5tqR903bwKKN38k8csF6m/+xbTKATAe4JBoPSlmLTnqt
	CQUf1pv5UaKqCToE/zboS2IO9fJdhZKHCQQClxWTgz2l89s5oin6V5K7O0n08ivJ
	Uq1ygA==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cdqfg9mhy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Feb 2026 13:04:24 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-5fd493bc7a2so187908137.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Feb 2026 05:04:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771506264; x=1772111064; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Tta6p1UfArJB2f1ZLaS24vMXG5SGG6hI3ls4c9vUi0s=;
        b=hb1k7hsUmcebMIUlmFtPvkIh5d6NiF/OhfBrZCPF/7oAOFE1MhRSxshgRV8PfZyEyt
         5e3A+Gppc8Twp6nXBXkJMawf3pxwXg4PxTw9QfMcJB69u4HdahX8AiOh2sA9M95ZGzec
         CZdsqGAKnCnY7+7JgW9rO9XkQmYIZARsFQbSsDTkTzs4KSm4TbZVXxa3iS1erztOXWJf
         szgSmD4VrFXzPgY0DaF2v0YPvhPymg/8b1/I4ZZP1d2bgOtrK3aln7LfHucutQRKn2ks
         NrDJ3UYLXguUzxQPbQ6g6Kuk1IMWDjw6bbDpS2gPpgXv/s8hJEsl0v9AXGceUCrfcgnn
         fM6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771506264; x=1772111064;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Tta6p1UfArJB2f1ZLaS24vMXG5SGG6hI3ls4c9vUi0s=;
        b=n+oQ2w1Ucqkvol5HXp1UAAjc/rHlKa+iLzDQkDF0o5jOAy0s+tJX+PGeBdb5K0pvv0
         h3BJLxbeSpQ4SO03po4ZWOQgr4Pfkk3sYRwngyTrdDCWChNQA6wgIIxE8MJ2I8fKTFWA
         ep6cJsKHESedSEwUP37qL2rNWwpzBPv7H7b3LKMBFqrMuBsdelMxufuAJfvyO/al0r7q
         /9azxr3s+bk63gYIMRf9bHvdDWzWekf4hJQ5ZkRiYKzP4zc6NK4dEgAvEbw8ZhNOWL/5
         PIk5yoTzyzlQa64x+91x+uozXzi+4/EJEsKyfGdcbJhif8Non0pjSmxS4hfdrr9g8lTw
         G2AQ==
X-Forwarded-Encrypted: i=1; AJvYcCUf4EKXyiXtF5t+JGoHBO/j0PbYqJ1fgb4ckIfg1NN0OI5Big6VwYTSn6NtU/vmmUTNacXDs71U5EX3Hy8s@vger.kernel.org
X-Gm-Message-State: AOJu0YzY5p0n5KXkQF9n/jrN9hIOGnXywGYmVkX58GqXWF068QmG9LtV
	+ZTxA/m6E+qjAvbpYuXftgJ5zvObfod4pRXS0f5bM3nFTAcBFMKgFjDTbzbcrlTvHzTIKI1Enq2
	2cMTOMaclleGd+2gDMAntx3EPW1VkVAu69PCneQWY/X0k2tKUsz+3vD4af+TqnxFTA5GE
X-Gm-Gg: AZuq6aLBMMvmzaNidX1zAbwqCfHVzYbT4Kishr1UA3uPqFrs5mZgdNfEnIjOPvjCnPD
	moO8nj3YnUqnMxKdq8RL7A0onFg5qnaAQpWsCIxwpO4BnFpfc2F32R083FK+oA6MID2jkufQBTp
	vp2VhdjtfZ3bJYDxZd2HS0CWWclyKCpufEOWBfvXbTe6X5A8IKHu69Aa85EYt7xvZaSP6ELoWNY
	lmgep/Hob1bgbvOBjwrqmmIizkj3OJ2H42zntE+POhm0H2YDEzWmFhPIPgyQejuf+Y3ByDBpkyH
	SQ3c6SHketJO47b2c4KmWjbrEsZ/jjyNKzL8aL4+rab+RbYQgBV0THoc0UbNAznfIMSoQqNVAk0
	v1dkjp81/CTnTeEpUAzhuX/NtfuDHiu7tUK3aFV/YKgQpHOzd5faY9jMvvkHfvj4QAA5u+3AiRh
	P2PmE=
X-Received: by 2002:a05:6102:3f09:b0:5ec:95a0:6aac with SMTP id ada2fe7eead31-5fe16e93895mr4524650137.4.1771506264144;
        Thu, 19 Feb 2026 05:04:24 -0800 (PST)
X-Received: by 2002:a05:6102:3f09:b0:5ec:95a0:6aac with SMTP id ada2fe7eead31-5fe16e93895mr4524635137.4.1771506263611;
        Thu, 19 Feb 2026 05:04:23 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8fc7627895sm583473766b.31.2026.02.19.05.04.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Feb 2026 05:04:23 -0800 (PST)
Message-ID: <81d31750-f301-4332-84fa-a5c1aa401507@oss.qualcomm.com>
Date: Thu, 19 Feb 2026 14:04:20 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] arm64: dts: qcom: pm7250b: Enable Qualcomm BCL device
To: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
        Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, amit.kucheria@oss.qualcomm.com,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Cc: linux-hwmon@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260206-qcom-bcl-hwmon-v1-0-7b426f0b77a1@oss.qualcomm.com>
 <20260206-qcom-bcl-hwmon-v1-3-7b426f0b77a1@oss.qualcomm.com>
 <98ad13d8-82d0-4def-917d-b99cf455c5f1@oss.qualcomm.com>
 <fa6ce650-42b8-4090-9c80-7f4e4c85a96e@oss.qualcomm.com>
 <91425550-35f6-4941-917c-f639dfadb42d@oss.qualcomm.com>
 <f62c0595-16ce-4af3-b0e1-0ebb84dc4236@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <f62c0595-16ce-4af3-b0e1-0ebb84dc4236@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: aDgmc3UjutoKjMR-GdUZPd-gvoKO1grl
X-Proofpoint-ORIG-GUID: aDgmc3UjutoKjMR-GdUZPd-gvoKO1grl
X-Authority-Analysis: v=2.4 cv=A6hh/qWG c=1 sm=1 tr=0 ts=69970a58 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=MO18dg7sMrBkYyaxiDMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE5MDExOSBTYWx0ZWRfX9/YlsMWvATti
 XmuNOUNCSaOZp0ii7RTlb6M+G0cHrtgR/1tU50MHCnvF/c1HUg/8uAuvSJophOpTjyo0mUxQJmI
 Wb+9KOmyKUPZ8zkHr+81LqMTCuhSDDTWqanAdSpNMMiBI3jJ42D4tCCIJB4wIh2VzEU7WmARdEP
 gDkTqSPb6+z+fqilPqiYFylXLT+/yowUnRPA7v9Is4ifyiBb6XRHj8sM9ksyeEHEM+d2n4kw492
 FMHQ7Kf/zwr/rsVTjExZ+EDck6ZfXi5kNcvENErXeWiAyZSC7cY/3XJUnGN98Nnuo+/kWHbIp/L
 PjTcgLKTTSXnFv+sVKWwxGgBeEFSPRr35Ku7zZrla3N0ZQr8ZVYubVCUnr9v88gikb6A/lqE3I3
 9o8zrRmcXU2dr6FYG6aPQSewpyzdsv4C+hukXCzWgWsrx86vVOwz2cpKaE6mfJD89G7reqPsCJO
 2GJdsVLl78l0VykFskg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-19_03,2026-02-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 adultscore=0 impostorscore=0 suspectscore=0
 spamscore=0 malwarescore=0 clxscore=1015 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602190119
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-93385-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,1d00:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,c000:email,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 47AFF15EE8E
X-Rspamd-Action: no action

On 2/19/26 12:34 PM, Manaf Meethalavalappu Pallikunhi wrote:
> Hi Konrad,
> 
> On 2/16/2026 5:18 PM, Konrad Dybcio wrote:
>> On 2/13/26 12:55 PM, Manaf Meethalavalappu Pallikunhi wrote:
>>> Hi Konrad,
>>>
>>> On 2/6/2026 2:41 PM, Konrad Dybcio wrote:
>>>> On 2/5/26 10:14 PM, Manaf Meethalavalappu Pallikunhi wrote:
>>>>> Enable Qualcomm BCL hardware devicetree binding configuration
>>>>> for pm7250b.
>>>>>
>>>>> Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
>>>>> ---
>>>>>    arch/arm64/boot/dts/qcom/pm7250b.dtsi | 10 ++++++++++
>>>>>    1 file changed, 10 insertions(+)
>>>>>
>>>>> diff --git a/arch/arm64/boot/dts/qcom/pm7250b.dtsi b/arch/arm64/boot/dts/qcom/pm7250b.dtsi
>>>>> index 0761e6b5fd8d..69ad76831cde 100644
>>>>> --- a/arch/arm64/boot/dts/qcom/pm7250b.dtsi
>>>>> +++ b/arch/arm64/boot/dts/qcom/pm7250b.dtsi
>>>>> @@ -202,6 +202,16 @@ pm7250b_gpios: gpio@c000 {
>>>>>                interrupt-controller;
>>>>>                #interrupt-cells = <2>;
>>>>>            };
>>>>> +
>>>>> +        bcl@1d00 {
>>>>> +            compatible = "qcom,pm7250b-bcl", "qcom,bcl-v1";
>>>>> +            reg = <0x1d00>;
>>>>> +            interrupts = <PM7250B_SID 0x1d 0x0 IRQ_TYPE_EDGE_RISING>,
>>>>> +                     <PM7250B_SID 0x1d 0x1 IRQ_TYPE_EDGE_RISING>;
>>>>> +            interrupt-names = "bcl-max-min",
>>>>> +                      "bcl-critical";
>>>> We should strip the "bcl-" prefix, since these interrupts happen
>>>> to be under the bcl device
>>> Ack
>>>>
>>>>> +            overcurrent-thresholds-milliamp = <5500 6000>;
>>>> Is that something that we expect to change between boards, or is
>>>> that an electrical characteristic of the PM7250B?
>>> Yes,  It can change based on battery used for that board as these thresholds will be close below battery OCP spec.
>>> It is not based on pmic spec. Max current threshold support for specific pmic bcl is taken care in driver pmic data.
>>
>> Okay, so this property must not live in the common PMIC DTSI then..
> 
> Ack, I will move it into board file wherever it is required in next revision
> 
>>
>> I think ideally this could be communicated over battmgr, since it already
>> has a lot of information about the battery that's currently connected to
>> the device. Do you think that would be reasonable? Would you know who we
>> could talk to internally?
> 
> We are not adding any battery information here. This configuration is specifically for the BCL peripheral to monitor current and trigger an over‑current alarm. While the BCL settings are derived from battery specifications, they are not the same as the battery’s own limits,the BCL thresholds will always be set below the battery’s OCP specification.
> The intent of the BCL is to provide early detection of over‑current or under‑voltage conditions, notify the SoC/peripherals, and allow corrective action before the system ever reaches the battery’s actual protection limits.

Right, but as you say they are derived from the battery spec, I would
guesstimate it's something like "90% max current", so swapping out different
batteries for the same device could potentially affect this value. Since we
already have a place where OEMs are required to add the battery specs, I
would imagine this could be beneficial to move over to battmgr in the future

Konrad

