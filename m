Return-Path: <linux-arm-msm+bounces-113898-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id vu2yHnXmN2qZVQcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113898-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 21 Jun 2026 15:26:13 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id E42D56AAE25
	for <lists+linux-arm-msm@lfdr.de>; Sun, 21 Jun 2026 15:26:12 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Zh59p1nm;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=j6LKl9nM;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113898-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113898-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id EBF34301440B
	for <lists+linux-arm-msm@lfdr.de>; Sun, 21 Jun 2026 13:26:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 332103655DE;
	Sun, 21 Jun 2026 13:26:09 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E31FA2701C4
	for <linux-arm-msm@vger.kernel.org>; Sun, 21 Jun 2026 13:26:07 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782048369; cv=none; b=BhDSSFGIvDrLwziGyBOdlQ7GJZVuSxXl9vus5fPivCRC5vj0O++HlRVqXn6BY8NErGL28rt248KQwruPzcdO4StqJtF2DSt+wXM5IvHvLZ1TCQoIo0K5I6g7M4RO8WqL5hxANHFZunZK1D6CK5++cZECJ8hv+6j8JRbENU/vkeU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782048369; c=relaxed/simple;
	bh=sxbJyRUQvldWAxJc7L72BkA3Q+j4Xzvlov4wtcHv4RU=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=o+Ezl9YbAKxEyUpDNu8ew2MP02Y5Bqxj7Fb4rwSlMHOXW6mPxVYxwuEbU7Z3/B93rxy5YDfFshA+JXyAOl2ImGfuuAf8Yi88vLroGSAdtMIMY3ugatr2jtWwq6TCABMNcJL/+HuP5fwoMJh+zLQDl5ViyxZSr3tAxpIekCo3DTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Zh59p1nm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=j6LKl9nM; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65L9uqj32104336
	for <linux-arm-msm@vger.kernel.org>; Sun, 21 Jun 2026 13:26:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+RcTKE/9DoE6dBWweLVTGAqtmWmBxPGlNR4Xl8V5Rtc=; b=Zh59p1nmikZdSUOZ
	Zd4jxV4fmxFc0xckXq4X0b7TMeI1+ROR4AD0p/QoPQvdsXpAxgUAQuHCYVesN0UQ
	0njDQqeqxzaxsByD5MIhntIy1BZNE1CTKA8pNkRlf3VUHfw+HErs91q2x3jlmH6C
	55cRaREkDXWPpHqK67Y8yPf8znEqYxpGAj6um9yF3ZiEde7GkbZOZYnm79UCbNiJ
	OLLeeFcll3nR8KsSv03MauF3EW0Fd7nmRAKPoLIZtMu3eSTGqGetYS6HfFegtdUG
	xsFI0ols+/WjVFiYkqv6Hza6uYtU9BZ4KDpneHmErddAxTRUvvpXlLjNTeIsrT5H
	bcjB1Q==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ewhv5k84k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 21 Jun 2026 13:26:06 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-37d4f1f836aso729033a91.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 21 Jun 2026 06:26:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782048366; x=1782653166; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+RcTKE/9DoE6dBWweLVTGAqtmWmBxPGlNR4Xl8V5Rtc=;
        b=j6LKl9nMSX3ynuCSG8ANoI2KCJAL20IGKoHilrl9DyWLBYdkPZJObjKvK7AuoJTQQU
         ZdYKghBH38YcKnjFpOvKZ3uMXPhH6d806pLan9daCasxOEfNghLi6pt6vwbNcEayLZES
         pVIAFFoXWRfvLEAiY3mdAhWloz9g70fZPet1dmifT5zEKz0eLdIlRDrrVV5mSGr//qPu
         r42m6D82hYUP6rd7Q1YT5eqZBwiHgdGjFBCPMCYRDaNYUg8PsB89uhWSM6Fy0FUd/Q+c
         zrZkyH8jpbI4USn+zr2ZhDVvNYrB/WV92VuakiiMQXqg5/LMGBacse+IcVOfiXsUtM8C
         NgPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782048366; x=1782653166;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+RcTKE/9DoE6dBWweLVTGAqtmWmBxPGlNR4Xl8V5Rtc=;
        b=ZbK/czXv2RkYNRw32wcfCdqn67js65l5IPyAni5KjdhZlRtqU4hvlxL6TOvO/L8sAT
         jiyz3szl2zmS7Sw8Ms723Cj2PspY2XDzhbPYix+AJXcNMZeDtwM2hPzD5ETzpVJU52V4
         wK6ioFdLShHWwdfc7ziVk2CK5IcTFGoJJ/zsCWN26r0lAQ1OknfaQSKfh8u1u7LKMIi4
         k2srom0gg95T4Gqj0rL1iCKIm16gg0OoRA6uFMS3zQ1LYJieW5EhI5B4LOmM4NFOIDxR
         28hQLC+sZsOFE9taW0AJBkcmmXBUyWLoAANyRQ1PM+PHiBZ65+DN66lmwyJyO0A+KyKg
         3uNA==
X-Forwarded-Encrypted: i=1; AHgh+RoDtlK12rIB8foW5hFdSepMdCfZORzSCxerzqfpziYFkZMCgTGfgcJoTErzStQ6xqoH5qAERCz7pbybk9tE@vger.kernel.org
X-Gm-Message-State: AOJu0YyfgJf01lHjHpeq7YSyEwyKFcbLM+EMdkGAj5Uh7COvwoG+aHs8
	LoqzpyFHqyr4CHYl0+Qe/LXD4rZjFLsmst635fjtZlTi9E4ahHDqWvxKmh4MrzAo8A//aW/zaK8
	VrxIOQ0ojaU10PdBeg95xryrIMfKwFrbwD4eU56JhrZnOszC3bCYPpkfN3gQhJa1LlroP
X-Gm-Gg: AfdE7cn2evwuk7nAO+qAjZEyE2K2cRzBfAXEyJCVAmjXNP6oYHSl8W0Fjo5VhqcAaWx
	HPUbNTSRekvzsRv1O80Z9LtnGHO4Wr4+NCE3S1lKfYgvyeVqrAd/BXRhWZtgSmCo3b8Q8+XDZD3
	LSUj8fzskOMLhv87jrtvbislrc/NLgBr/z0UKcPpPFkQBzrABwglQGXugpds79qOW5cml/p9HYV
	ox8jz4RYHZx9S/V2urJZb+ALnxAep6QkrcXKrOl08FYQJSDl4Kdpa/nM/iW4GnyycST8qN8RGrO
	8EFtliYDhh9rqEHlP4KLeDTV0jS7KPNzVIYH9TShUa1zCktB+pmBGm5s7s31zYZ63hDduiD2NfX
	32FVKr14zVvbxSbnHPHz2J9qvjG0y25ZAfUMFs6nK
X-Received: by 2002:a17:90b:5708:b0:375:2a38:1d40 with SMTP id 98e67ed59e1d1-37d1617a684mr10789833a91.20.1782048365875;
        Sun, 21 Jun 2026 06:26:05 -0700 (PDT)
X-Received: by 2002:a17:90b:5708:b0:375:2a38:1d40 with SMTP id 98e67ed59e1d1-37d1617a684mr10789810a91.20.1782048365428;
        Sun, 21 Jun 2026 06:26:05 -0700 (PDT)
Received: from [192.168.29.32] ([49.43.225.115])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37d4f2d2615sm4469608a91.10.2026.06.21.06.25.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 21 Jun 2026 06:26:04 -0700 (PDT)
Message-ID: <70f37f20-dce7-4592-afb2-4fac6d7c513c@oss.qualcomm.com>
Date: Sun, 21 Jun 2026 18:55:52 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
Subject: Re: [PATCH v4 02/13] dt-bindings: clock: qcom,qcm2290-dispcc: Add
 DSI1 PHY and sleep clocks
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Brian Masney <bmasney@redhat.com>,
        Ajit Pandey
 <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260604-shikra-dispcc-gpucc-v4-0-8204f1029311@oss.qualcomm.com>
 <20260604-shikra-dispcc-gpucc-v4-2-8204f1029311@oss.qualcomm.com>
 <20260605-eager-lynx-of-eternity-f77ecb@quoll>
Content-Language: en-US
In-Reply-To: <20260605-eager-lynx-of-eternity-f77ecb@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIxMDEzNiBTYWx0ZWRfX3MDyGBJb9KK8
 dQU7/gKeoCVk6Mm05oiAq6TBJ4DERzePSR56l2S/Kx9TRUHZ2N6nAHaScmVkSpsK7S19jQI63l4
 OQP5MT3wYWqcPrrPlNuG4sDag+6RydheRBxOXmAIHQQfKRgHiHN3LPd4M94WFJpTphbe4YDd2tV
 lhbYejK1EDWEzW73bjeeGJ6h3rn/x8tdkNFWyyai2B5MaaCYv9xsJZEfrWCs4Dh94Yd9kUbqyKp
 RriWotLFhbrkI13OFFZDcHuBRBU8aMxZRwYDV9++1JFymZ8e63wMGDDDk8wroK3EZiaHKjAc2b5
 UpWdcMapWZr98PNdqYXf6w8In54iDH6c8KoMSBVLvAbAY33+S1QrOfxw141JqFnXQNuH5+FA2MG
 Okuunztp3pxOYgXyWPv+ivTsdh91Pms07iCBD/G8LurnXQEzmD7yVhf+QfliugCS0sOSsKusP4s
 RHDqTAc20lSIYv54Pkw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIxMDEzNiBTYWx0ZWRfX6J4xdELrpmNE
 K6fhX/FFsHTZtiXujrwmj7xjBeue0Uaqk71vAqfQ9txoJe4QFDGZaIWGI6jgTIp46xXIeES+vE4
 N9uXUQg1lJukFDAkaYYwjmhKdfl3RnQ=
X-Proofpoint-ORIG-GUID: 4tQEAFyVv2Qi3aUmNnDsK5caaPfYV-9M
X-Proofpoint-GUID: 4tQEAFyVv2Qi3aUmNnDsK5caaPfYV-9M
X-Authority-Analysis: v=2.4 cv=UrZT8ewB c=1 sm=1 tr=0 ts=6a37e66e cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=HwFTmRh04JSsUSWzyQ2edw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=6Xi6mpGAEk2f3eWU2LkA:9 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-21_01,2026-06-18_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 impostorscore=0 clxscore=1015 malwarescore=0
 bulkscore=0 suspectscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606210136
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-113898-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[imran.shaik@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_RECIPIENTS(0.00)[m:krzk@kernel.org,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:konradybcio@kernel.org,m:loic.poulain@oss.qualcomm.com,m:bmasney@redhat.com,m:ajit.pandey@oss.qualcomm.com,m:taniya.das@oss.qualcomm.com,m:jagadeesh.kona@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[imran.shaik@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E42D56AAE25



On 05-06-2026 03:53 pm, Krzysztof Kozlowski wrote:
> On Thu, Jun 04, 2026 at 10:56:08AM +0530, Imran Shaik wrote:
>> Update the QCM2290 DISPCC binding to document additional clock inputs
>> supported by the hardware, including DSI1 PHY byte/pixel clocks and
>> the sleep clock, alongside the existing clock list. This is an ABI
>> extension, and existing clock inputs ordering is unchanged.
> 
> That's ABI break, not extension, because you require all these clocks.
> And "dtbs_check" would tell you that it is a break.
> 
> You need to provide reasons why they have to be added - something was
> not working? Something was missing? Did it matter?
> 

Apologies for the late reply.

The DISPCC hardware supports additional external clocks (DSI1 PHY 
byte/pixel and sleep clocks) which are currently missing from the 
binding. I will capture these details in commit text and update the ABI 
break details in next series.

Thanks,
Imran

