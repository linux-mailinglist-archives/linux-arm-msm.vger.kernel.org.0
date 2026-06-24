Return-Path: <linux-arm-msm+bounces-114303-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id If91KoaOO2rdZggAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114303-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2026 10:00:06 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AB126BC62B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2026 10:00:05 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="eDVl8/lF";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="Yud/1KlW";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114303-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114303-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A8D4730028C6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2026 08:00:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3BE1D395AC7;
	Wed, 24 Jun 2026 08:00:01 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0621F392C52
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 07:59:59 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782288001; cv=none; b=lJxtybO6+Y9lC0HGiMDr3cGvJSfq5dpkXoJy6Y4cndZ1jaaMj5inXwKwpn7kWXlqSleoetJWFOvm39qiMrG6A+pDsP0dYnoYEmRKnD5r+Ugw+FEBc2M6Wu0PxLPboDm0qtXNSEOjNLvsss9RA7WACWWKgJOkyb6aTmeCI5krats=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782288001; c=relaxed/simple;
	bh=PoMtRmBnrxMpeXjVWALlkhZR7MOSmDLg/HtlBaZghvI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ouydh54jiwKLePpo+6xe75O/tqh6mUNoURI62yvPudQvB31EyXfWY1kBZl3KoW7ea9YOEE9rPsxnNpe05muT3QPmOd8HSlPuEe0E1xLk2NbH9TYYNh7X7P+iXdCYG1pTVEw3VtHpAO09zowgmCgrNVnorD3ZZPRFtHozqPQHOso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eDVl8/lF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Yud/1KlW; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65O5tqp71892073
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 07:59:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6fZ7VuqcPXvlOshGMCZyxgJiDan4vtXvkbaxQbf6mCY=; b=eDVl8/lFMFgqjYfH
	AFR7LjZRLmq0AqxHum60bHAqvrRwKxSQxDx1OE9VlZBvf5kzQNoMSufU6wzsDBzm
	GXYzM31Ce8MgmT3NwysyP3bltFNp2X5vh2GmeMtDDNBtIDEYPLaBh7WoVHgRNShG
	zcT10bL+D8l5nvXz+jttc0d1h1MlOz4J8GTNvmAr55mZJFIVRj3aOPgYAs7x0PDm
	LUXdcAMz2h15PdtlCeNF0S1QOy6z4Yej+FHtVBHdfEQ8mmdsC2hpmyE7bX7h5TK9
	+CvH9dPQMK7vnnNtppUL0fut1/ifcM7lIDZHoTElgfWiwg/q+kNX6DvRfVrbHP38
	Q+RBaw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f05bf95y8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 07:59:58 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-915827fb1a3so5670685a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 00:59:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782287997; x=1782892797; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6fZ7VuqcPXvlOshGMCZyxgJiDan4vtXvkbaxQbf6mCY=;
        b=Yud/1KlW4/G0j79IGVQUmIOXhUqC+K7VR0GebGu8vg52kuuswiZJ698YBXtWEfcCQf
         hDZDTwzFjWK3jwwyNubM4l8omrVkk5I1vBSvizuMu7jHzIyIFxK0SDJjD5d22mpTjxPQ
         Lyp9wWxGVszz6Ra+rWHsBPm90pEuoesdkfJRnMZjvEwz261ObV50M2u+G6M0hYfjRock
         HQGvadByBFsRQXIP7HgAgpw+10cuhUgtEWQN2hkssJAYrZmli2JMwV2sDyh/z6dT6hkx
         3LCXCYGQ97EpNO6U7Dq0UJPx7Bw5PXEalw8ofEvt1YhungaV+NASKXgS0tnQUjQlYtt1
         jOTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782287997; x=1782892797;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6fZ7VuqcPXvlOshGMCZyxgJiDan4vtXvkbaxQbf6mCY=;
        b=ZD7y5pEn0LjmJNJGuV1iQVEo0b5YQwTukKpQJNzOqJ3f55mMDnolzMfc/OKVxp8RAT
         e5EA5ozhw+InjfH0FIbwY/QWRc7hMXcJ02h1XMmiSLrgb0pcswreSQ+bt0QUWlE6Ig88
         GdcMmdPcyl8PiQ5t5u18vURjYQpCoZ3w9jtGrtnro5dDgiLTo2Jt7Hhj2kylV817s38E
         1okNUHbqGHzDrONvp6Mputa2FDTGvHM8ANe2gI/kXCxAT8LBSN7TFkmlLjlHI0TOdYgW
         43qMs56Mnjp5Se4iY8YriiWCphZLEGGRiAAJCF4fx3MwuQ0VqMNyiOci4amYCg2itSqh
         bk9w==
X-Forwarded-Encrypted: i=1; AFNElJ/54wI18DV+GcFcfUuU6P6EPcyDqrtoQyF+Qiwvrs6aBy//q/h6Kwf330zAkhPIR2kcthS39bWYupoCYOo8@vger.kernel.org
X-Gm-Message-State: AOJu0YzXL4rYuHzDR8RnwsLrRUDOEnsnkpU2tDye2iZ+e5Rq1oNWAdo9
	svlMtwFoX9YA8T2cmDv81mUTtq+0EIKPUc+GiodF+QHr05BqmLvUfFN5A5ZvcYfCVsnNqVH7GXp
	Htd7rd253iCbze8DNutOwX/N8/L+F3qWEZHhP8KhyI2zB/s1dTY3VdjUfjaIedpId6UJ0
X-Gm-Gg: AfdE7cno3cGqc/IvzsJCZCgBd0cxz1jCezvmXzcxh7Op1CauHRgkxwnAUh84ojCB+sc
	AbcVEYMZjRMGceLpwWbr6KjWzojp3e5USMYF2r3AgGb6t1q+oo056Qyzt7JpVSFVkdfjDu1OsCC
	Fc+wL5H5M/r/uB4QzIgLh1Xj+XE7a6+tnOjLfU8Mfsz/UWlAUa0HE3fz6mhpWKlLTiviKeAHfuu
	2IEgLHHQII2ROdwdWmQWLd7o8Jdug9GrYr/uHBE89WS32u6MDQ7Y3omvIfsZv3lsR/idNaHUzEK
	XwZEcUcEowd8h1FE+jk8ktPvHWC5FWiRUMnVwlJsgqVs7qBsdFSxSnj0ft8y4B/jaJAyPWcjjgr
	lGTGtLon53/TcPfWUk2mEp/zUIWQt9veElAA=
X-Received: by 2002:a05:620a:f0f:b0:915:fad5:9096 with SMTP id af79cd13be357-925cb33c4d6mr894295985a.7.1782287997417;
        Wed, 24 Jun 2026 00:59:57 -0700 (PDT)
X-Received: by 2002:a05:620a:f0f:b0:915:fad5:9096 with SMTP id af79cd13be357-925cb33c4d6mr894293885a.7.1782287996987;
        Wed, 24 Jun 2026 00:59:56 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c0c5eaa64c8sm629274366b.26.2026.06.24.00.59.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Jun 2026 00:59:56 -0700 (PDT)
Message-ID: <99654e01-3a52-4a9e-b003-24230aa6a248@oss.qualcomm.com>
Date: Wed, 24 Jun 2026 09:59:53 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] arm64: dts: qcom: kodiak: Sort pinctrl subnodes by
 pins
To: Luca Weiss <luca.weiss@fairphone.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260612-kodiak-cam-mclk-v1-0-fd294ff003a2@fairphone.com>
 <f05ad4ae-140a-40a7-a6ef-9ac2ddb0a939@linaro.org>
 <DJ747VLQEHIN.Q3SS1FFC9I3L@fairphone.com>
 <ba0e9f93-fd2b-4895-b8a7-8e38eeff9bcb@oss.qualcomm.com>
 <DJFDYAS1AY8Z.3GD4A5UMWLAUC@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <DJFDYAS1AY8Z.3GD4A5UMWLAUC@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=X8Bi7mTe c=1 sm=1 tr=0 ts=6a3b8e7e cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=6H0WHjuAAAAA:8 a=XHLXOlM-ELWRbcIoZxcA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-GUID: T_VWmJU62STEGI3mvvkgGZJHCwjm8QLF
X-Proofpoint-ORIG-GUID: T_VWmJU62STEGI3mvvkgGZJHCwjm8QLF
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI0MDA2NSBTYWx0ZWRfX5207kri8jObY
 tvWbdB1A5KtQ6AkTmL5MhkFMZv9qF7aFUE/D/lEEPUPjbUYZWZtvDByu9DRiRNF+IOiyM98luJ4
 qo/yhkXJwf3IYoiyW+hjIpr99N4LRlo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI0MDA2NSBTYWx0ZWRfX51Fjq1aFhYgg
 fwabNuvlFP0ZC/+BvZkew3Sn6mEXC1+Vaa8+xjy4wiBl/3AO10vqvVaBw2hkZ5Pv61qw/bs11ZV
 OSSFCZhCZah8VVqzHhWE5zrfmCm5tudClH5Y6RXK3Sbi9KMnK4OcZMCOxSf2+XZ83/A/jkznR14
 1OasneRhtMgb610BM3Ark77CtVqK21yv+BdoznRKx8aUFHtjOJyHSM/skIhKA1YXcYhKFEeveRl
 5u70QqrdlkIEaS+SzYy+6X87Ti0D/UdSk0KJMXQymxs4v8gyuaJ8nQClnNuJpjfF8wyT3+GqOSP
 JeJNU+G1rkd/xTEwNjcQ79G8I0MbzqD+zfif1vDorjbs/fLvK5e+0KjxeUjAmIIZZtJtblC9FMY
 kPUMLcRkM0m030w4xyv4ylkAO0QaYw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-24_02,2026-06-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 phishscore=0 malwarescore=0 adultscore=0
 spamscore=0 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc=
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2606150000 definitions=main-2606240065
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-114303-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,vger.kernel.org:from_smtp];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_RECIPIENTS(0.00)[m:luca.weiss@fairphone.com,m:vladimir.zapolskiy@linaro.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:~postmarketos/upstreaming@lists.sr.ht,m:phone-devel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9AB126BC62B

On 6/22/26 9:05 AM, Luca Weiss wrote:
> On Mon Jun 15, 2026 at 2:09 PM CEST, Konrad Dybcio wrote:
>> On 6/12/26 3:46 PM, Luca Weiss wrote:
>>> On Fri Jun 12, 2026 at 2:59 PM CEST, Vladimir Zapolskiy wrote:
>>>> As documented in the "Devicetree Sources (DTS) Coding Style" document,
>>>> pinctrl subnodes should be sorted by the pins property. Do this once for
>>>> kodiak.dtsi so that future additions can be added at the right places.
>>>>
>>>> No functional change intended, verified with dtx_diff.
>>>>
>>>> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
>>>> ---
>>>>   arch/arm64/boot/dts/qcom/kodiak.dtsi | 1382 +++++++++++++++++-----------------
>>>>   1 file changed, 691 insertions(+), 691 deletions(-)
>>>>
>>>> diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/qcom/kodiak.dtsi
>>>> index fa540d8c2615..62daef726d32 100644
>>>> --- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
>>>> +++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
>>>
>>> <snip>
>>>
>>>> +			qup_uart12_cts: qup-uart12-cts-state {
>>>> +				pins = "gpio48";
>>>> +				function = "qup14";
>>>> +			};
>>>> +
>>>> +			qup_uart12_rts: qup-uart12-rts-state {
>>>> +				pins = "gpio49";
>>>> +				function = "qup14";
>>>> +			};
>>>> +
>>>> +			qup_uart12_tx: qup-uart12-tx-state {
>>>> +				pins = "gpio50";
>>>> +				function = "qup14";
>>>> +			};
>>>>
>>>> I understand and support the intention to keep this change non-functional,
>>>> but this pad "gpio50" is for qup16 also, right?
>>>
>>> According to my QCM6490 data sheet, GPIO_50 has these functions:
>>> * UART for qup14 (OK)
>>> * SPI for qup14 (OK)
>>> * SPI for qup16 (no pinctrl)
>>
>> "no pinctrl" meaning "not defined in the upstream dt as of today"?
> 
> Correct.
> 
>>>> Similarly pads "gpio54"/"gpio55" for qup14 function, "gpio62"/"gpio63"
>>>> for qup16 function, I find all of these are missing on the original list.
>>>
>>> GPIO_54:
>>> * UART qup15 (OK)
>>> * SPI qup15 (OK)
>>> * SPI qup14 (no pinctrl)
>>>
>>> GPIO_55:
>>> * UART qup15 (OK)
>>> * SPI qup15 (OK)
>>> * SPI qup14 (no pinctrl)
>>>
>>> GPIO_62:
>>> * UART qup17 (OK)
>>> * SPI qup17 (OK)
>>> * SPI qup16 (no pinctrl)
>>>
>>> GPIO_63:
>>> * UART qup16 (?)
>>> * SPI qup16 (lane 3) (?)
>>> * SPI qup16 (lane 5) (?)
>>>
>>> But the GPIO_63 looks weird, is the data sheet wrong?! Where would
>>> UART_RX of QUP1 SE7 go? Maybe it should be UART qup17 and SPI qup17 and
>>> then SPI qup16 ??
>>
>> GPIO63:
>>
>> QUP1_SE6 SPI_CS2
>> QUP1_SE7 UART_RX/SPI_CS0
> 
> That matches pinctrl driver and kodiak.dtsi at least. Still, the data
> sheet is just wrong there. If you have any contact to relevant people
> there, please let them know!

Please share the 80-xxxx-xx number and I'll see what I can do

Konrad

