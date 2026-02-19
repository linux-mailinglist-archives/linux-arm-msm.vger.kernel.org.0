Return-Path: <linux-arm-msm+bounces-93371-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4PxNJU71lmndrQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93371-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Feb 2026 12:34:38 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BA51615E4ED
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Feb 2026 12:34:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 23AE93002F5C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Feb 2026 11:34:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70ED11EA7DB;
	Thu, 19 Feb 2026 11:34:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bYxjMDFg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TNO4LkR1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F5B876026
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Feb 2026 11:34:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771500873; cv=none; b=uI0F0/rdEBol2wJwLnYFd74DYCVq6QNJagb3Yhvcfv/cDyyVhX+JNbCRBevoTA4FmDRJeihkmwZyxezN8dXiwdfggyfHrm1Rmo68g2gTOmlMIrnehSVg9ws6tci+FluqInh0RNokulDLEzevt7jHTZ2R5jmhoaZnIkCX5MAD9SI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771500873; c=relaxed/simple;
	bh=oUyXB+CcIwbGHWIhJYWqa28ISLsKSEJ27xTfntLMOyA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qJJ8+p0E89M8qb/j22xbpuffwjzWuckUReArZrf6dCTKBM+XpeoHyLNgdGnes5YmGAyjPIdbQOFnEbNZJohayGEnSeVLi4pNUtwUj99TASG8AkirbSxrQX9tCDmdIkxV+ySzIRdy3wB1EF13o9q3h2kQBdIPwVwIX0BS0fJiVSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bYxjMDFg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TNO4LkR1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61JAOS8S3133109
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Feb 2026 11:34:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	P9+d9vwGLTBNf371LFltJnF/8rrYiRV01DBK1yVs86I=; b=bYxjMDFgorXVUUXl
	BlS/Rco9z96Vgbz0ba35wh+pF9ehymEJSOzR/NcG5qMwKEcOaLI0vyg5H6IcEeHj
	06jCpXm1FToqo07ciGAhIaFhwyUDm1/cjntQTi+65SgCheFmToXVm/0tqH061RNH
	HlRovB9OM0eaQEsoSjDc1T8aoFkITHdqQ6b1xOlAbLYJzjjpcwJo4BjJZ962ilQM
	8hZd3yVHmI6PKBIVQTiPWD1DXGScsFDiFryEicblbSv51f8ndg+aP+24YcNyEj9f
	+dGH81WhdVsCNXxL+wq+4r+e+oLU8/32jmEQ9g2VaCoQu8BgX4SowaeMdKGSZuSl
	p9ddGw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cdmxvsuq1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Feb 2026 11:34:31 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2a76f2d7744so8844675ad.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Feb 2026 03:34:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771500871; x=1772105671; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=P9+d9vwGLTBNf371LFltJnF/8rrYiRV01DBK1yVs86I=;
        b=TNO4LkR1LzVbr1jJApm6A0jA09JBG1GM5LWFKtyLUm7DYv/YpWXlGau3yYUO6dW4PS
         vPLQJ1DDlPIGOES2M5zNslft+4SAyOjLqXaXoRqWzazhAh/ZV+a/NxEqNwldsXrsSQ2a
         Sz/e48PdMHg9QMSsrvkN1Gz4Adjt/xYLLjykt0t4mbDN3gv2bjCK2KOj1pglGFNDk8E5
         N+sC0TTt5Q+1yOu5HiGJ8I0FFE8uXZla9kHxcNZnCY1qvfu3PSMwHoKAWb10gRccuUPk
         yWOqW+Fc1U/DxT+bK1oaGEKysMaK6T2kS6nDrRTyEx86jUrPg9YkwEgxll3+Ir5fyTQD
         f9Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771500871; x=1772105671;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=P9+d9vwGLTBNf371LFltJnF/8rrYiRV01DBK1yVs86I=;
        b=GhVgK4O75fGV6BmbuszDkwdDY8280Q3SrqwKohKOIDjHZyki3k0y/KdjGfSPM/u/Wd
         /T0Qzg3aA3BPZCY/vP1rC2PuTtTOmL3YtV1sbOfXa0HJzC85a/IwPSaKD6ZaqIMmgLzi
         3nWXKBW7t/aGZK8zBd2KusydGcuGiQE4SRDRRTQmOdVtKwGFa1NfqDkRFMHVpNEGLgrF
         8AEcgYM/Py1NCH/eD1xKwshJFG+xTc6Va+2YGWaD0zNsyTYMGFCI8Ho9CGK7VIp/mj4y
         jdUjVSBalSOhEqTyrGmO9hfG7hI9lChnlJS6llpcBjIHYKC7QSYI9/7a3mShn5ksJPxv
         UcFw==
X-Forwarded-Encrypted: i=1; AJvYcCXk8hgRMkZpyunA4/eo6u9NurKSL0vaO5EMwintqHpQuyYZ1/XFvl5uH91o+z0uiwgWe8kpxjiJwqP6XX1y@vger.kernel.org
X-Gm-Message-State: AOJu0Ywdm+m4FeZsiA/g3eB2qcB6Fwe8bor0YAU0L6i0cVs7MbGsvTzz
	dw4CDouGLcctHFAvYGUeE8FaC5ehF876J1MZ9t65CTMQ7GEZ2nA8mUOYtcjuswU7CgNc/rIj4o2
	KoAb6194oLfI/FHridY9D4iGPGKysnowf79Z/0BvqLNnSCcQk/upIrql8UsZ26K9UjvVf
X-Gm-Gg: AZuq6aLUXAWBwsN6/WrDRPT6NpqvfSSBAelKOIzf6NNDFz/YWc3GcJsEPireIXO81PX
	syXbxPBEiSe9DSZGSy6H17UP9lEvHL0+DL7kf4Zd3tOJX8yUbmiORUq35cUfCD6bgCh4IzaJ8+e
	yqXS8j/8XIQ73ZbzRn1tuj5WekEzi0hxyOlrwWfZIfxwL4zWlYdIZmK0QjLCWcUhjlaTq2oKvKq
	+ElgekRr7ucaTrCH9DvX8U63qynxxP9boQjepv/xLfM1xwzsR6Eyd5HEB6srjZt858SNwAgzlat
	Pt1QFyaK2xs5k2+eKv9JBqQubukOw6btksKJuad4xXpA/RbRJ1BG3qNd6QKFSp3s8CbL0t+vc3h
	4CYCy5RxkOQLwMxD+tpwUQcXiM5yMgXpWbc2wO1PBM4ASnVF2Mhq/TaVt4g==
X-Received: by 2002:a17:903:3c68:b0:2a9:3211:29f0 with SMTP id d9443c01a7336-2ad50ff2e5bmr40930175ad.58.1771500870508;
        Thu, 19 Feb 2026 03:34:30 -0800 (PST)
X-Received: by 2002:a17:903:3c68:b0:2a9:3211:29f0 with SMTP id d9443c01a7336-2ad50ff2e5bmr40929965ad.58.1771500869953;
        Thu, 19 Feb 2026 03:34:29 -0800 (PST)
Received: from [10.217.198.130] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ad1a73b0fesm163193945ad.38.2026.02.19.03.34.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Feb 2026 03:34:29 -0800 (PST)
Message-ID: <f62c0595-16ce-4af3-b0e1-0ebb84dc4236@oss.qualcomm.com>
Date: Thu, 19 Feb 2026 17:04:24 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] arm64: dts: qcom: pm7250b: Enable Qualcomm BCL device
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
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
Content-Language: en-US
From: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
In-Reply-To: <91425550-35f6-4941-917c-f639dfadb42d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: bG_obUVPSKruN03RkytYDNwzzCMpq7XV
X-Proofpoint-ORIG-GUID: bG_obUVPSKruN03RkytYDNwzzCMpq7XV
X-Authority-Analysis: v=2.4 cv=XpX3+FF9 c=1 sm=1 tr=0 ts=6996f547 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=qeKA5tGg5t4KbAWVeC4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE5MDEwNSBTYWx0ZWRfX+g/X4GD2r5QA
 A2HdMiLOAonFYlbKc2Pk13Y3MCL5icZZV1/bogMGVTREdArN75kEqPtRrIkt81oA7HmdRXGjgTO
 3afEQTNvNCS4Oid3mu2xB+SgokMQ5gZgj9wVL1qWet7RzMVCySLDROj29I6nheVJLXtBFex6jJc
 RUIGurwaELcfUun9A4+GSZmFUKire8snao7dGCvrpxHZWIzZe0w3LH+Ezuf05JnztHN4Hc3R3Z5
 OyoYCwXobnfN4fKMatNe1fgMtsjZ6Vr7MkbR6+nmErCK7oTrQd19sL/kSBD1HGBAypNP0HYK5sF
 Vztf5dyM8/J2EXYr9Oa6s3rit03v9TJGwecmIZM+4QZrdcXoCZ40QL6L3zmzlAq72Qdsq7pso4o
 7/L1rpAwffm8NXqFmsnoQcnJH3wqg/T0MB0EB03Cm34tL/KRIAwPPNNWdE8nLnJ1YznofaYqxyr
 ldEEihJCNtKlnRhUvLQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-19_03,2026-02-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 suspectscore=0 clxscore=1015 adultscore=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602190105
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-93371-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,c000:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[manaf.pallikunhi@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: BA51615E4ED
X-Rspamd-Action: no action

Hi Konrad,

On 2/16/2026 5:18 PM, Konrad Dybcio wrote:
> On 2/13/26 12:55 PM, Manaf Meethalavalappu Pallikunhi wrote:
>> Hi Konrad,
>>
>> On 2/6/2026 2:41 PM, Konrad Dybcio wrote:
>>> On 2/5/26 10:14 PM, Manaf Meethalavalappu Pallikunhi wrote:
>>>> Enable Qualcomm BCL hardware devicetree binding configuration
>>>> for pm7250b.
>>>>
>>>> Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
>>>> ---
>>>>    arch/arm64/boot/dts/qcom/pm7250b.dtsi | 10 ++++++++++
>>>>    1 file changed, 10 insertions(+)
>>>>
>>>> diff --git a/arch/arm64/boot/dts/qcom/pm7250b.dtsi b/arch/arm64/boot/dts/qcom/pm7250b.dtsi
>>>> index 0761e6b5fd8d..69ad76831cde 100644
>>>> --- a/arch/arm64/boot/dts/qcom/pm7250b.dtsi
>>>> +++ b/arch/arm64/boot/dts/qcom/pm7250b.dtsi
>>>> @@ -202,6 +202,16 @@ pm7250b_gpios: gpio@c000 {
>>>>                interrupt-controller;
>>>>                #interrupt-cells = <2>;
>>>>            };
>>>> +
>>>> +        bcl@1d00 {
>>>> +            compatible = "qcom,pm7250b-bcl", "qcom,bcl-v1";
>>>> +            reg = <0x1d00>;
>>>> +            interrupts = <PM7250B_SID 0x1d 0x0 IRQ_TYPE_EDGE_RISING>,
>>>> +                     <PM7250B_SID 0x1d 0x1 IRQ_TYPE_EDGE_RISING>;
>>>> +            interrupt-names = "bcl-max-min",
>>>> +                      "bcl-critical";
>>> We should strip the "bcl-" prefix, since these interrupts happen
>>> to be under the bcl device
>> Ack
>>>
>>>> +            overcurrent-thresholds-milliamp = <5500 6000>;
>>> Is that something that we expect to change between boards, or is
>>> that an electrical characteristic of the PM7250B?
>> Yes,  It can change based on battery used for that board as these thresholds will be close below battery OCP spec.
>> It is not based on pmic spec. Max current threshold support for specific pmic bcl is taken care in driver pmic data.
> 
> Okay, so this property must not live in the common PMIC DTSI then..

Ack, I will move it into board file wherever it is required in next revision

> 
> I think ideally this could be communicated over battmgr, since it already
> has a lot of information about the battery that's currently connected to
> the device. Do you think that would be reasonable? Would you know who we
> could talk to internally?

We are not adding any battery information here. This configuration is 
specifically for the BCL peripheral to monitor current and trigger an 
over‑current alarm. While the BCL settings are derived from battery 
specifications, they are not the same as the battery’s own limits,the 
BCL thresholds will always be set below the battery’s OCP specification.
The intent of the BCL is to provide early detection of over‑current or 
under‑voltage conditions, notify the SoC/peripherals, and allow 
corrective action before the system ever reaches the battery’s actual 
protection limits.

Thanks,
Manaf
> 
> Konrad


