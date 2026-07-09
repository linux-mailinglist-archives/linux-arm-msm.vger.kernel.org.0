Return-Path: <linux-arm-msm+bounces-117991-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id bqNeHRieT2qPlAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117991-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 15:11:52 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CCCA67316E3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 15:11:51 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=L+5KOZhA;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=J7NaLcca;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117991-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117991-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3BC8A303352F
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jul 2026 13:09:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7AC23263F34;
	Thu,  9 Jul 2026 13:09:45 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3797625B084
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Jul 2026 13:09:44 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783602585; cv=none; b=b1CCURYjWdtzp+qwQOlUgXA7FSXQ8q/4cJLzAXqHGKQ/E0O+ip0CSPI3FnoX980dR25yON64yxNu1PEROtW/R0KMuLCN5rb3RJjPy6lsQgnP3VLUhG9ZMPm+4NffCHpNY52nS9paAJnCLdfL17bOWDEHi1qvIVs0q32qLbXq7VA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783602585; c=relaxed/simple;
	bh=0t1CQ6bCfFYXWlV5Sj4eNwxVqvgS2k9+lVlmjhzpyiU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TV8i2aoGnvR2oQlXG2Y+8PWb+7ueqxHY2mHoAmDePsVpbU25XeEte2cEncr8xbBZDt5CabZJJzxOFl/8H2YmJEpyMR4Ulfi7hPdMQs4eAL/iFzlrVj6jmfPiOQ6raGmNPG1aWprU1OwDas7PUtQSt5mZeUJ3U59ALOhQ2ApYy/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=L+5KOZhA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=J7NaLcca; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 669BNQ0M1488964
	for <linux-arm-msm@vger.kernel.org>; Thu, 9 Jul 2026 13:09:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/WvX4MwB9EPKjTXBQ5bIbcRPrVXVpb2oyMm+1OJuX6k=; b=L+5KOZhAmLfHGJRj
	3oVNomPbfs42uFUpIRmyIpAi+klYxKTrWsSh+B/pQxc3vMrB0SBW0M0VVKMq6DdA
	fsn8wOifCe7uHPy/8yNo5TcFEtsBkrrS2niNAC/QlW2aUlgEVhIMG+YOaQxEjwPL
	fhHHfUFqCLQqTB1Br7Jrx6fS0iXAbBdr2V1hQnnqiSslRc14MltfmByc8X45jeaM
	rgQBEnr4oLGrKesJio8ddeirT0kosG/0OHgirqN4g6GjURpmicfqMIETWGaWeuro
	bCxzLdGs2MozE82/JnlJQyf9H2FaEHXFYkqxSD/dwhauS1LJttWxrfKM9CLOu6EM
	3ehgVQ==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9wwfub65-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2026 13:09:43 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-96b3854f627so36349241.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2026 06:09:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783602582; x=1784207382; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/WvX4MwB9EPKjTXBQ5bIbcRPrVXVpb2oyMm+1OJuX6k=;
        b=J7NaLcca2CFm4D+8IvnjpwLE8oR9rOlU9D/gqxyk9Viwx86QkEIS3oDBwJHrZTwBI1
         zCZz4FgqqPIYf3mG2VeLRxQTpvH1qYkDDeL2qKsqd2wPTaF4aPmRt//UF3CoqR+ZVyvl
         0S+3VBMUNdWGH5fJgnNs+qzMjSGC981wKc1LU0fyWmKXGGWkvTRY7njVm0sy0+CZloil
         gE53B+0wE1hB87K52PUKcwqF23KNL8y/waFtRwKWFVraS/dA0pkht45nOFRLAV815HjX
         SrMZDVDm/dyDmbjsQojHcEVqVl50JcibLkbj6NWXpXcavpQ7mZYVgv1QKmj6Ekhlny2f
         TbJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783602582; x=1784207382;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/WvX4MwB9EPKjTXBQ5bIbcRPrVXVpb2oyMm+1OJuX6k=;
        b=ozvhr08ULCEDjVQCVLCg2rBzLuARa16OMdfs+u2qpNWjzUyc8hNqqF3J7cB5QFBBqB
         fc2SZCfHUfkmqqure5JAq5tDwikJt2T7eBO0ydOc//JAsjrPXGvlt/qCD784lKFJMard
         fMTnt5tLoWG2iWMqfZtdzdwBP9E04Vd3HCPbtOBpIpasSSWfiQezqOISEyAQjyQrXAfN
         uUWeR73q2hBKotKVXw8MaXTJA5+TLHkv/8kkpc/J2Mp2435nsJfTcQz6cYeCeUU3+ZUU
         /e+E10MBdbW6QVCLE6ofH4BwUb0SLojyf3WXLTnMVW/G87ZetEyEnLM6geewrTubpVhD
         8uhg==
X-Forwarded-Encrypted: i=1; AHgh+Ro0LWJm57VtXQyOq4B3L+6MtmnbrjHzP66/MUiPxqSEDX+/QDjzo7m+8FU1I3oOSB0Mvo9uG0j23rPlEon0@vger.kernel.org
X-Gm-Message-State: AOJu0YyVJDtbZWkkE6WJikvJjAOTH2bhwr8kphWIPFf3iyBVJJ0o+aQj
	99CtkS47M7pIOHUYoYTntNktzhPDDpY6I+GDKj3Keoa6ikMdHnu7e1owjHfJz6QZByLZh8j7SqM
	vcBdEN3tOIbI5w0pf9oF0IN2lw0iH28UC+iI56JQpJW+5ohmi86qFh4EeUfXoNmTVFGRg
X-Gm-Gg: AfdE7clUNrcfo83KAMYcI4EYk0JKhs3Uu1ftLw9Blz1u3Or524oE3+6el7L9JKfSc50
	fGm2uSGi/N2PfhcEAsgTaJoOVgGctNtyvAXWWxycR61sLfokpFq8UjyJV1FFqK7O4nqqFaPflmW
	AlO+EJl7+zmgdz+flGC0DqC8bZ7qfvChSlpweWjikYZ5VgfqKSFb47Zr9OsxkRQzC/BdgL99766
	OL7+VELhdH/uFux67IzoS586Who54XH2HhffoiHtj24UfeWuS7rzRDqsYQ5ZNrEswE8xxZVDMUp
	Vw4HwNteIrxYyTr4HcO0H9jTIZ7DRgt919hKjFCxfT8DMSzeJmcsHhUUrKOwxPQd3PjJNJAPgY7
	+HvCeu94K6HRI6Zcen48zosURjZlo5ZilXTo=
X-Received: by 2002:a05:6102:a51:b0:740:2974:57bc with SMTP id ada2fe7eead31-744f073fc4amr982305137.2.1783602582243;
        Thu, 09 Jul 2026 06:09:42 -0700 (PDT)
X-Received: by 2002:a05:6102:a51:b0:740:2974:57bc with SMTP id ada2fe7eead31-744f073fc4amr982273137.2.1783602581725;
        Thu, 09 Jul 2026 06:09:41 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15adb30f98sm500037966b.55.2026.07.09.06.09.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jul 2026 06:09:40 -0700 (PDT)
Message-ID: <a56f13af-d506-479f-919b-8a4d2e09bd90@oss.qualcomm.com>
Date: Thu, 9 Jul 2026 15:09:38 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 RESEND 2/5] arm64: dts: qcom: Add device tree for Nord
 SoC series
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        Harshal Dev <harshal.dev@oss.qualcomm.com>,
        Herbert Xu <herbert@gondor.apana.org.au>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260526051300.1669201-1-shengchao.guo@oss.qualcomm.com>
 <20260526051300.1669201-3-shengchao.guo@oss.qualcomm.com>
 <65467777-27eb-4b8e-bb36-ace91ad27e0a@oss.qualcomm.com>
 <akhcTp1MyjGnhXav@QCOM-aGQu4IUr3Y>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <akhcTp1MyjGnhXav@QCOM-aGQu4IUr3Y>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDEyOCBTYWx0ZWRfX6hxJTngD2iT0
 yrebj2+I+S47KKWZXvaHcWXHYbJyYOXNjerg87w2GtvVWUYzUCuzntDLEfffSJVA8QofrXRN4oQ
 Q/jD/MpGFR2XX1xCDQEnFHmWoU6z5QE9cblFWI3hPnzRNh3Le5UXNg/S7uxxIrpVrj3hqpvXmI0
 tONjP6BqCB/KpoPxNexwxnWjGeOTFw0JfhdN25bqVhhjHUoWUaIUOq0XXkHRBQaxMSvE3uC/qtc
 NV1D3xqNE/XuABVTyO3tPW8+/ATXhWF4N2SgVYMYx2BlW4TVxFfUKopz4HpaqK0egKtcsQNruNA
 5yoyNCN/uddipyF89kejxEWWCKf2aaKryZ1+EzWLbkD9j16OfgW1bumdt2UcRXvyxvfbXsbO7TR
 FJHZ4KHqdPvxR5amLerq33s9yfdvYwcRUummHpoCc3gMpnFfV8akqq0pMDGVlzlSYjzBT1CAOOL
 q6VDJNvBpkKgULjSV/g==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDEyOCBTYWx0ZWRfX4eXPks7nh/bF
 aScQG2Vs7ZFYDTgg9WbAo9/akVJEBKljMKRJDcQPyrpAUNQGcqy3QHxXD+/IovnhA9B6WeuOQsK
 hAKIoKcUC3t1JXi1Gi6ebw5jeJlq418=
X-Proofpoint-ORIG-GUID: _pfzj9P5E_wWUZnGXmiPKp7flGmRMMpT
X-Proofpoint-GUID: _pfzj9P5E_wWUZnGXmiPKp7flGmRMMpT
X-Authority-Analysis: v=2.4 cv=Krh9H2WN c=1 sm=1 tr=0 ts=6a4f9d97 cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=NU6Q5Yw1M9mtJpQV3egA:9 a=QEXdDO2ut3YA:10 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_02,2026-07-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 adultscore=0 spamscore=0 suspectscore=0 bulkscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607090128
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-117991-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:shengchao.guo@oss.qualcomm.com,m:andersson@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:konradybcio@kernel.org,m:lumag@kernel.org,m:bartosz.golaszewski@oss.qualcomm.com,m:deepti.jaggi@oss.qualcomm.com,m:harshal.dev@oss.qualcomm.com,m:herbert@gondor.apana.org.au,m:devicetree@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CCCA67316E3

On 7/4/26 3:05 AM, Shawn Guo wrote:
> On Tue, Jun 16, 2026 at 12:57:42PM +0200, Konrad Dybcio wrote:
>> On 5/26/26 7:12 AM, Shawn Guo wrote:
>>> Add base device tree include (nord.dtsi) for the Nord SoC series
>>> describing the core hardware components:
>>>
>>>  - 18 Oryon (qcom,oryon-1-5) cores in three clusters, with PSCI-based
>>>    power management and CPU/cluster idle states
>>>  - ARM GICv3 interrupt controller with ITS
>>>  - TLMM GPIO/pinctrl controller
>>>  - 8 TSENS thermal sensors with thermal zones
>>>  - 3 APPS SMMU-500 instances
>>>  - 3 QUPv3 GENI SE QUP blocks
>>>  - PDP SCMI channel and mailbox
>>>  - Watchdog, TRNG and TCSR
>>>  - Reserved memory, CMD-DB and firmware SCM
>>>  - PSCI and architected timers
>>
>> [...]
>>
>>> +		dump_mem: mem-dump-region {
>>> +			alloc-ranges = <0x0 0x00000000 0x0 0xffffffff>;
>>
>> off-by-1?
> 
> Yes. We have the same thing in sdm845.dtsi and sm8750.dtsi. Unless you
> think that missing the last byte is functionally problematic, I would
> rather be consistent with the established pattern in the tree.

It's difficult to tell whether it's cargo cult or whether the hw
actually has an issue decoding 0xffff_ffff. I would skew towards
the former, but I have nothing to prove that

Konrad

