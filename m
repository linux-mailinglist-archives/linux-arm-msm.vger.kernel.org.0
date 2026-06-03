Return-Path: <linux-arm-msm+bounces-110934-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id X+X9DG0DIGo/uAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110934-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 03 Jun 2026 12:35:25 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AF67636A47
	for <lists+linux-arm-msm@lfdr.de>; Wed, 03 Jun 2026 12:35:24 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=AS0wMddM;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="cxU9W/Qr";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-110934-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-110934-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 614D330C5A5A
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Jun 2026 10:27:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69B2E3CB919;
	Wed,  3 Jun 2026 10:27:22 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05FF0384CF2
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Jun 2026 10:27:20 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780482442; cv=none; b=P8cFtpS2xfd5bLRbArSV8HOFjfpzIYWIeD8EBFt7EFnYygChLRdH7gata6AAt6viTRw/nRWRzlSocX+vq5JEecfRAKKMjgNSzRtmxtklfze+gwJppGesCriseeXVDqXSrQQumRttXomcTDkwchYOnVbvA3kw70rLf2rd2NpGth8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780482442; c=relaxed/simple;
	bh=WaJnq4vJPJN0OK3iw6juyyLuxpGKER8KzYNWQqTNCUQ=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=k/3dU72gNZTrYLpNxlkvTM/WAidQfDOmreH35d0yI031UPFcGXyiCUgi9utnHVVehuR0Wzzj2drZ6/5QZ9Qcpn9FtV6mWwHpUIbJVCASi1NbTZS6iFBPsNJg/WoXPvU5nrrx0DJ+99aJrp4HKbK0pWyNPP3yLkc9853rGBe35Nc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AS0wMddM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cxU9W/Qr; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6536RLlX873749
	for <linux-arm-msm@vger.kernel.org>; Wed, 3 Jun 2026 10:27:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ke6hFaye3GUWTYMdDv1mH0rJhnS2IhQe2jTb8z6TWDU=; b=AS0wMddMbp1fh/so
	LCIczNK/D0EgtaowsN9foXMEEKOaP+ydRDWE+hyr9/xJGowRNASIbON7wol+YolX
	w+ZV0MlQQdZcmb+g0chRUlOTwsdR/uQ3Q5w86GrjOHw7VoHBxAi8NOhioaWAp517
	VN+pq5VzwCIdTVtNvziq4m4HIBxXoF5zO/Ii2Z7/z9Df+hU6L425FABWtyQLG5lM
	THtDxm9XMG6QumSe8rWzPVjfxiCCie7lflQPtTBAE27WA4kAOKlj2sa4qAomd+qB
	CMTmXw1csnyc4Cu+mHgQIg2LkvxSLVpittDnhXAnX+JnVeM6pJ/yC1C1Dpq4tAJI
	ZWFgfQ==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ej6a9k01k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 03 Jun 2026 10:27:20 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-84227ba0a8fso933770b3a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Jun 2026 03:27:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780482440; x=1781087240; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Ke6hFaye3GUWTYMdDv1mH0rJhnS2IhQe2jTb8z6TWDU=;
        b=cxU9W/QrOGq0x74ri8BqVkKorIs6Ql2vOcuSNdtbtU7dWjRA+CueJ2ivm2CHJnHD5H
         O6DlQMapio8hS0S9fVvpPYQgk8pJKSIJbaxamkhJLscrHx7FM62On1TE2P3jbpZS7s3X
         pxh0wv3vBEhUMrVPszzRlwRUsh8vYCXvu7XxfaP7X3/k7PFqd3HTLvJTX1rcTaD+SIz1
         BwV0OKJMvHCEH+95+V+UKfQ/aQk/rC7hcsjBxsJ+KjDXdd82mQ4Gz2tdKY6uTC2Tv+wh
         iDr6BO+PCmcwxvRm3W5ntrMjDjpq5AorPPhhtXI4ThFxcT3obkGOwXNjkX88wbeJWxHf
         5VKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780482440; x=1781087240;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ke6hFaye3GUWTYMdDv1mH0rJhnS2IhQe2jTb8z6TWDU=;
        b=gRuQKCDcJns2f467+DAtxLkkFhzaREB3VeIJxcqSzoMa4pNEuSLiCBsETP37jq+C2y
         vKbDlEy88jZaGesnV+HtPGzraI60eFv7y095ur65CoxP+XQi4sVOVFq++xg1CcQZzUjE
         zWwrdH+RRb8fmfXyhmAzr5PT8a/GSBmDbgAsZNGxnntUf94Kn1WZ6jwxxoLItYpxEAZp
         TzESeJApQNrdtcZ3a5w59R6WRacy+USgRek5EuZ0uQy73B5SFGbn++CNXbeKihax+ZD8
         QcvP3u+t9G1Eex6x9m/1ILJqgmZHy/ZO/GyObHhuKDdgmop92SazmDxd42O+x2BcrccB
         6OQg==
X-Forwarded-Encrypted: i=1; AFNElJ+UBsfi7HtORIiTnqKr/3PpJMutpHuN4vZT/od9qyl/TSRwzh7buMa91FiXfN61m42saeEXAWBmboivuP5t@vger.kernel.org
X-Gm-Message-State: AOJu0YxCyzJBV91TSx8JH12f2ao0bFVlipQ8/zIWjPG3QAr/JtaPJKTI
	6uv0l3tc6HEBVNdWf+aNUimmqi9tePmsi11x9vrGdQ3JRQCjfJGrm7j/6MY3MFJHqwdmDvkGqYK
	sjzSKrCqPEeNkjiz937mfyfi8psszANpQFyvvQFNDvyMkC01INrA6gc1Woh1zb7VJ4qFo
X-Gm-Gg: Acq92OHPxMP824d4SmQZuOCFv5s+/+9b+ODAyCcsNONpot6WABqgPNF0XH+Cv3gq1Po
	UezKNcT6FQswtwoM3ttZq/K2FFMzxq/KgatXWo965jOxeAfODlPm+G546e+2mYGddrw0Pfbu1VX
	I2e3bPQiZJG24MFG4K5JJObXOlVC7EP8LK8GW/RZ8uYwLDz0NRysc0UyGL6voYKIj7mFaqKUry9
	kM+tHRPSa/4vfyAfVUV1mTTfF54rrq3HyTV/ywEdhVNFPF4yEkPDhKs7lHumVOyuXhoRuSg2OTH
	n/G53FY5wJPZS4RsJqb057VuMoWUo7G7t8mgcqYoyEhvYYyiJFcNGdfdGSydyEYltA4qKdqWEVi
	GS3D6wRst/+GJhfsrgFTQiXtWmjnQJtirZpaqeKzYT2Cw6AkpxtUJLQH1e3cK
X-Received: by 2002:a05:6a00:3a27:b0:842:2d2c:2b58 with SMTP id d2e1a72fcca58-842838e011amr1625213b3a.5.1780482439592;
        Wed, 03 Jun 2026 03:27:19 -0700 (PDT)
X-Received: by 2002:a05:6a00:3a27:b0:842:2d2c:2b58 with SMTP id d2e1a72fcca58-842838e011amr1625198b3a.5.1780482439078;
        Wed, 03 Jun 2026 03:27:19 -0700 (PDT)
Received: from [10.92.217.24] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8428237430esm2428145b3a.21.2026.06.03.03.27.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Jun 2026 03:27:18 -0700 (PDT)
Message-ID: <fd5c9415-5275-4c0b-90ee-d81a5d5b660f@oss.qualcomm.com>
Date: Wed, 3 Jun 2026 15:57:10 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/8] dt-bindings: arm: ras: Introduce bindings for ARM
 AEST
From: Umang Chheda <umang.chheda@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>
Cc: Ruidong Tian <tianruidond@linux.alibaba.com>,
        Tony Luck <tony.luck@intel.com>, Borislav Petkov <bp@alien8.de>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, catalin.marinas@arm.com,
        will@kernel.org, lpieralisi@kernel.org, rafael@kernel.org,
        mark.rutland@arm.com, Sudeep Holla <sudeep.holla@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-acpi@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-edac@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20260505-aest-devicetree-support-v1-0-d5d6ffacf0a5@oss.qualcomm.com>
 <20260505-aest-devicetree-support-v1-5-d5d6ffacf0a5@oss.qualcomm.com>
 <20260513175823.GA1471517-robh@kernel.org>
 <48e298d0-f4cb-4afb-8ba1-a6b39f3285cb@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <48e298d0-f4cb-4afb-8ba1-a6b39f3285cb@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: gXFnI31HBcqetoTDarPZCWG6qAnzDpit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAzMDEwMCBTYWx0ZWRfX2OHEg3nB60rd
 BkrLpSZUatVyhQ4tV0OoCAT0wBBz/dvdIFH3BTodTRqxEjWmQ8ZHtRKkkPwqsu5pUiGD3VKzBF6
 iAkFf2RJJilNQ8w7uKr62czc85VXTDlp+kg6aSUTbhY4q2pPUtDi6InSxa2puELMzc0MgnjO+av
 /nMzuGiVgm9ob1AZqhvhtnqlsZ8YTMagNpVHMjvDYzqfaJlHXoUpDCapsRWLkgHKTPX5w0DyaKt
 UAUlEl27Abe8LNFe6EwHGJkwpq+hLOe4ctsa/LU8UE5sTV7Wthi9ESUelQn/X07s2Sq6ynPMhdU
 6rQHj8WvHP/71oAUBw2F7E/naGKmjziAl6Q3RShek1YGmyCX/sxvfuRr0YtKEsOdPiSmdzAJtmP
 XOBMjqfeaJZI/3zso63XS56TOXbxIxaDq1kbV+LEq8meIkBy6QzRjrBrP2949T8iazRhG8fTu+C
 ox5DYW2sJRCy3DhmfxA==
X-Authority-Analysis: v=2.4 cv=I/9Vgtgg c=1 sm=1 tr=0 ts=6a200188 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=AMbOtgs2x-SaA9YGKiUA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-ORIG-GUID: gXFnI31HBcqetoTDarPZCWG6qAnzDpit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-03_03,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 impostorscore=0 adultscore=0 suspectscore=0
 malwarescore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606030100
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-110934-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,devicetree.org:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp];
	FORGED_SENDER(0.00)[umang.chheda@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[20];
	FORGED_RECIPIENTS(0.00)[m:robh@kernel.org,m:tianruidond@linux.alibaba.com,m:tony.luck@intel.com,m:bp@alien8.de,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:catalin.marinas@arm.com,m:will@kernel.org,m:lpieralisi@kernel.org,m:rafael@kernel.org,m:mark.rutland@arm.com,m:sudeep.holla@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-acpi@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-edac@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[umang.chheda@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8AF67636A47

Hello Rob,

On 5/20/2026 11:43 PM, Umang Chheda wrote:
> Hello Rob,
> 
> Thanks for helping reviewing the code!
> 
> On 5/13/2026 11:28 PM, Rob Herring wrote:
>> On Tue, May 05, 2026 at 05:53:49PM +0530, Umang Chheda wrote:
>>> The Arm Error Source Table (AEST) specification describes how firmware
>>> exposes RAS error source topology to the operating system. On ACPI
>>> systems this information is provided via the AEST ACPI table.
>>>
>>> Introduce Device Tree bindings that provide an equivalent description
>>> of AEST error sources for DT-based platforms.
>>>
>>> Signed-off-by: Umang Chheda <umang.chheda@oss.qualcomm.com>
>>> ---
>>>  .../devicetree/bindings/arm/arm,aest.yaml          | 406 +++++++++++++++++++++
>>>  include/dt-bindings/arm/aest.h                     |  43 +++
>>>  2 files changed, 449 insertions(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/arm/arm,aest.yaml b/Documentation/devicetree/bindings/arm/arm,aest.yaml
>>> new file mode 100644
>>> index 000000000000..7809a0d38270
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/arm/arm,aest.yaml
>>> @@ -0,0 +1,406 @@
>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>>> +%YAML 1.2
>>> +---
>>> +$id: http://devicetree.org/schemas/arm/arm,aest.yaml#
>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>> +
>>> +title: Arm Error Source Table (AEST)
>>> +
>>> +maintainers:
>>> +  - Umang Chheda <umang.chheda@oss.qualcomm.com>
>>> +
>>> +description:
>>> +  The Arm Error Source Table (AEST) describes RAS error sources and their
>>> +  register interfaces. Each error source exposes one or more error records
>>> +  through either system registers or a memory-mapped register window, and
>>> +  may signal errors via interrupts. The top-level node acts as a container
>>> +  for one or more child nodes, each describing a single AEST error source.
>>> +  Refer to the Arm AEST specification (DEN0085 / DDI 0587B) for details.
>>> +  Flag bit constants for use in DT source files are defined in
>>> +  <dt-bindings/arm/aest.h>.
>>> +
>>> +properties:
>>> +  compatible:
>>> +    const: arm,aest
>>> +
>>> +  "#address-cells":
>>> +    const: 2
>>> +
>>> +  "#size-cells":
>>> +    const: 2
>>> +
>>> +  ranges: true
>>> +
>>> +required:
>>> +  - compatible
>>> +
>>> +additionalProperties: false
>>> +
>>> +patternProperties:
>>> +  "^aest-[a-z0-9-]+(@[0-9a-f]+)?$":
>>> +    type: object
>>> +    description:
>>> +      An AEST error source node describing one error source defined by
>>> +      the Arm AEST specification.
>>> +
>>> +    properties:
>>> +      compatible:
>>> +        description:
>>> +          Identifies the type of AEST error source. Each value corresponds to
>>> +          a distinct error source class defined by the Arm AEST specification.
>>> +          arm,aest-proxy represents a proxy error source that forwards errors
>>> +          from another error source.
>>> +        enum:
>>> +          - arm,aest-processor
>>> +          - arm,aest-memory
>>> +          - arm,aest-smmu
>>> +          - arm,aest-gic
>>> +          - arm,aest-pcie
>>> +          - arm,aest-vendor
>>> +          - arm,aest-proxy
>>
>> This is a fundamental difference how DT and ACPI get structured. ACPI 
>> defines new table for some feature and puts everything in that table. 
>> For DT, these all belong in the node for the corresponding h/w. For 
>> example, if the GIC supports AEST, then that belongs in the GIC node.
> 
> Thanks for the feedback. To clarify your suggestion — should the AEST
> RAS properties be added directly as properties of the hardware node
> (e.g. arm,ras-num-records inside the cpu@0 node itself), or as a child
> node under the hardware node (e.g. a ras-error-source {} child under cpu@0)?

Can you please help with this query ?

> 
> 
>>
>>> +
>>> +      reg:
>>> +        description:
>>> +          Register ranges for the error source. Absence of reg implies
>>> +          system-register access (interface type 0). A single range implies
>>> +          memory-mapped access (interface type 1). Two ranges imply
>>> +          single-record memory-mapped access (interface type 2).
>>> +        minItems: 1
>>> +        maxItems: 4
>>> +
>>> +      reg-names:
>>> +        description:
>>> +          Names for the register ranges. The base error-record window is
>>> +          unnamed (or first entry). Optional named ranges provide access to
>>> +          the fault-injection, error-group, and interrupt-config register
>>> +          windows defined by the AEST specification.
>>> +        minItems: 1
>>> +        maxItems: 4
>>> +        items:
>>> +          enum:
>>> +            - fault-inject
>>> +            - err-group
>>> +            - irq-config
>>> +
>>> +      interrupts:
>>> +        description: Interrupts associated with the error source.
>>> +        minItems: 1
>>> +        maxItems: 2
>>> +
>>> +      interrupt-names:
>>> +        description: Names of the interrupts associated with the error source.
>>> +        minItems: 1
>>> +        maxItems: 2
>>> +        items:
>>> +          enum:
>>> +            - fhi
>>> +            - eri
>>> +
>>> +      arm,fhi-flags:
>>> +        description:
>>> +          Bitmask of flags for the fault-handling interrupt (FHI), as defined
>>> +          in the AEST node interrupt structure flags field. Constants are
>>> +          defined in <dt-bindings/arm/aest.h> - AEST_IRQ_MODE_LEVEL (0),
>>> +          AEST_IRQ_MODE_EDGE (1).
>>
>> DT already has a way to define interrupt flags. Why invent something 
>> new?
> 
> Ack, this flag is not needed for DT based systems, will remove this.
> 
>>
>> Rob
> 
> Thanks,
> Umang
> 
> 

Thanks,
Umang



