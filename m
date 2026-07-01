Return-Path: <linux-arm-msm+bounces-115755-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 2vonLW4/RWpl9QoAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115755-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Jul 2026 18:25:18 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F2E36EFC28
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Jul 2026 18:25:18 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="f9C+/DmO";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=fJC2q+mE;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115755-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115755-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BE727303A701
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Jul 2026 16:13:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CEC53A254D;
	Wed,  1 Jul 2026 16:12:58 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DD023CAE76
	for <linux-arm-msm@vger.kernel.org>; Wed,  1 Jul 2026 16:12:56 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782922378; cv=none; b=AUY3XMdb1m5czanNUyUuP/5LHBUcga8Ri0HTXAVb6B5ziKNgkNa2Za6awNgkhpkLRX+w1Cb8HZFXqYQfLk5qd0q8hygNkWOzWRAsQklVW85PdJHlpIE8to56y25GKf+slJkAdgI8amqTcFIj3Vw5E2BacQYR5kzSAWzwRWEus1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782922378; c=relaxed/simple;
	bh=+EDqlBmzXp4NJj4jM8XDEyAZhhoWP3EXfYKbXx9vcJ4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hPa2CY83ceGe7uyYvk2KSN3VMrsj+atUqcDZEeKIFt52kSKsNoFj2HPqO1lfSxASazSsxGAbx06IzNjeGZYy3hO7S8J/6m/HJu6HULflLmLoLR7YJR/iya8MtZ5lFv5rtAorPsUmAhiVZdZNAweOqZKsF6g0PX0FCT6kNpJpTBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=f9C+/DmO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fJC2q+mE; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 661Fok0a1547618
	for <linux-arm-msm@vger.kernel.org>; Wed, 1 Jul 2026 16:12:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aJg2zighTM4yKm2FKnvodCu+Sz8tNWMUjR0DJFVA9Pw=; b=f9C+/DmOFRwljiQ4
	+p06L8p4ABT+krHZreXc6U7xpIme71uYYI1cEoFRr/ImXvdHUP4qwZbPkchTpHWd
	ohVLYWXn+ib9czDWe1FF96MdOQ+j0+Ba0EcWmukNpYpFUmVlECiLADnw/ILJ3ZIk
	aujGRsIZTQNyKFaWkcSTAeHX/GrjKrBLiWRDdpNskbuFhooc5Y5dX5Ci7BoEHcGy
	800OcJGVmYepjKWLyNj2kWXd0PsVbY96Ups1GIs+IE35gBzqibIeDVBYRwGkhm2u
	P+oYusFRzde4L5hlOn6oWs6I2+KpC8Nb9VYgZVEy22I6M9ie2f3BW4TRanbe3lTS
	XfIu6g==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f50sqsmd4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 01 Jul 2026 16:12:56 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-7392d893428so44121137.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Jul 2026 09:12:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782922375; x=1783527175; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aJg2zighTM4yKm2FKnvodCu+Sz8tNWMUjR0DJFVA9Pw=;
        b=fJC2q+mEXyKTcHYKA0juKk2eXLt0zSj4aPYEbai6xxY7jemBKctjpj38grIa6XSKtU
         vv/EBvYW/YEEnrnncHycaz4SoJIMAB6ouhN7vKfqdYGkKRFQn5iiKkQfNKbaJ9Yu/Zxu
         u63taiGrn03pwTznttt7NoelJsJE8VWleIksboncEbW02oYaKazDIXZ6oWb7vDYwPDZz
         uvsEdGQvQbSBy5SW5tqZj2uTFAmfc8xMCOGplcqEr0GaOm/jj0jt25p74cwjhnsrauLr
         7hLUabC2hikFam7NFs30jPAI7/fkpQOBZ5s552Bxk2o0iMjEfyQrWgaDZGrWLG+KNxvJ
         MTIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782922375; x=1783527175;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aJg2zighTM4yKm2FKnvodCu+Sz8tNWMUjR0DJFVA9Pw=;
        b=f6iVnTjlkNCETCR2DMjaQrkXmlDGCpWYhr6bDJZj0Q0tMIPe0IOXzCIrdln5Nwf8HP
         wNfrb/5JyneAOhMe16NhmlQH3DetBz3gT4HdgkAFXAYMcD0LLHLHdyNaep1N0RNSbGP4
         lkEC9ClWJTImb4Vgf4Q7RmYUboU6AhvYP5scRA+/O/hhFO0wAK01EIm81bCQUfJkBz8R
         aWZdUWJ7h4EUiNVHDzrN471DEDJOqY+gf2RVA7l5U93mw3DwD7YjPTvcwaQjyU7cKVUp
         EMAWvLDvkCrMCQ9pK+p/XjhijDbmObPleqkjkPQTxfjKBijIHhXRoM2oRBFA/6OXqetF
         6m6Q==
X-Gm-Message-State: AOJu0YxfmfHx39Op//GWhFjuR0voEeFxplH4zWFulwGQfhsUCVskko6O
	NolP4xsrJgT0+EkwGOX3kI+kckGUpenjW5/D38TcCTdIHM8Jmi4BHKq+CpynvNBLrxQvppOzRdg
	/V137TPLo3tOMWQWeribMN+iZK77OgZGerQR1BWbCrb6ceV7ufe0TghSZ/HwbyoTb+/ZE
X-Gm-Gg: AfdE7clojhY6WAh4m1Ndv+eMNkr9WRzJp4lG944MUwATu0Gu+zH5ZeAD2GxSWv6Z5Qr
	8aucYm7AjRwaDnMg5DbPLH1CUOtvn1lSimacOTGWH2rDKTjYSVhVpa/5Ifr+nS63h2ZcdFS7AWx
	ESQUprVzl6A2klRGr6n4kbwLkDAkMCeF8OT4B7oNfDmrhs4/CnBmRSNzriMm44ZbJeC3RYBQDmw
	+5nsMFK34fr+OpXZtTLWxSpgwNyiFjIBeynUSxJpOWXW6UQCvSUmT5sIYbsfL4PV1CHmJii6snB
	hNMd6j2VUNBjuTjF6AFvvMyf5JuDVRCh9kjnT13G3e4DZrwlpbJ/CZv8f3VZSiINU2SYPLphUgo
	rZGU2a0G2R7jVVWGvIFd969QfJsu1fq5lSAQ=
X-Received: by 2002:a05:6102:4415:b0:729:5cd5:8cc4 with SMTP id ada2fe7eead31-73da9af5eeamr407490137.4.1782922375388;
        Wed, 01 Jul 2026 09:12:55 -0700 (PDT)
X-Received: by 2002:a05:6102:4415:b0:729:5cd5:8cc4 with SMTP id ada2fe7eead31-73da9af5eeamr407475137.4.1782922374997;
        Wed, 01 Jul 2026 09:12:54 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c12891785f2sm297128966b.61.2026.07.01.09.12.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Jul 2026 09:12:54 -0700 (PDT)
Message-ID: <b461c125-947b-4e06-b502-abb354e0cba6@oss.qualcomm.com>
Date: Wed, 1 Jul 2026 18:12:52 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sc8280xp: Flatten usb controller nodes
To: Xilin Wu <sophon@radxa.com>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        Qiang Yu <qiang.yu@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260507-sc8280xp-flatten-dwc3-v1-1-b18be56bebba@radxa.com>
 <2cb32deb-4266-416a-8db7-1b3b46b52162@oss.qualcomm.com>
 <843419F943CDE487+c183d00a-3967-4ba7-b6fe-fc50749701b9@radxa.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <843419F943CDE487+c183d00a-3967-4ba7-b6fe-fc50749701b9@radxa.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 26olJFNYWJ-k9NL1bjJkx-_QluBJUnPC
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDE3MSBTYWx0ZWRfX0XIkmQjlSUlw
 iHrwVogZlMfsZMACZYeYxpZ4XAQfFvNuMV3pYCDfByMVA5U2zgZr9VFKfB2CkgD2MfxubRfG0C5
 LS+UxoOqPhEhBpc4RqASI9I9unWlB7o=
X-Proofpoint-ORIG-GUID: 26olJFNYWJ-k9NL1bjJkx-_QluBJUnPC
X-Authority-Analysis: v=2.4 cv=ceHiaHDM c=1 sm=1 tr=0 ts=6a453c88 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=0Miry4rRAAAA:8 a=NEAV23lmAAAA:8 a=ksxQWNrZAAAA:8 a=EUspDBNiAAAA:8
 a=cDOuU2R2u_RE6FqNeRIA:9 a=QEXdDO2ut3YA:10 a=ODZdjJIeia2B_SHc_B0f:22
 a=UT1Yo3WijKgCWNxi40OF:22 a=l7WU34MJF0Z5EO9KEJC3:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDE3MSBTYWx0ZWRfX058qpVSv2TuB
 ZHdpnPk2g7o/hZvb5k8/8LXfY2HaVE5DNqSgrIlgAGWiFLtvXbs3RV18L0TKsrpMZbeHrrRp65A
 cfLX4l2y1KVggTvS3nZOzELI2JjIHFsNrmXRrOCnTybsby7lw8QKVP++cToMJJqNAqWEfJrMIOw
 COY897ttCZ5M8SeArue61n1d4g5va489wknX+eCHdDyr1wOENnrM9mBiFTrlcmp/9LjnjdJtlMI
 XVPXnvCiOOsovjs/LjwSWlpqFuiMz2h1DB0UMsWtU5YypSBHDojnmaK/TLksFMc9G0z+8JyIM8z
 GVjjQBaT2wfr+VDmFVZWuXIDIu+Prj/nesiRVmMu8chOvM/1EOSPccqQLSzwrHSES49BO9l4PvD
 wpkFubqGJesj82F++gbcpGPCs7eEGs2nghT/kGR/N5ws7WCttw3r3XMPllyPMLeWDv6L4N2SFvw
 iE4MQJKUQrBoekYyomg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 clxscore=1015 suspectscore=0 spamscore=0
 malwarescore=0 priorityscore=1501 bulkscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607010171
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-115755-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:sophon@radxa.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:manivannan.sadhasivam@oss.qualcomm.com,m:qiang.yu@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,radxa.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,catirclogs.org:url,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6F2E36EFC28

On 7/1/26 6:04 PM, Xilin Wu wrote:
> On 7/1/2026 11:10 PM, Konrad Dybcio wrote:
>> On 5/7/26 4:29 PM, Xilin Wu wrote:
>>> Flatten usb controller nodes and update to using latest bindings
>>> and flattened driver approach.
>>>
>>> Signed-off-by: Xilin Wu <sophon@radxa.com>
>>> ---
>>
>> I tested this on a CRD and an x13s, both work fine across suspend.
>>
>> Turned out in my local experiments I made a typo in the name of the
>> interrupt that was carried over to the big node..
>>
>> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>> Tested-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com> # X13s, CRD8280
>>
>> Konrad
>>
> 
> Unfortunately as I mentioned on IRC [1], this actually causes random NoC timeout on reboot, which seems to be related to pcie.
> 
> [1] https://oftc.catirclogs.org/linux-msm/2026-06-11#35405057;

Ah, you mentioned this:

https://gist.github.com/strongtz/50bbd71a9f41d0d1aa9849b8cf1dce21

This is an attempt to read CONFIG_SPACE+0x0.. I don't really know..

Maybe +Mani or +Qiang has seen it?

Konrad

