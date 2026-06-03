Return-Path: <linux-arm-msm+bounces-111067-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Xti3D7yvIGrF6gAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111067-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Jun 2026 00:50:36 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id D2C4863BA9C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Jun 2026 00:50:35 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=WLlgWh7z;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=PmTWIfHw;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111067-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111067-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 48452300E2B2
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Jun 2026 22:50:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9FE164DB549;
	Wed,  3 Jun 2026 22:50:31 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A0C23B2FF8
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Jun 2026 22:50:23 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780527031; cv=none; b=NBP4gtrbxQ6ofIOe3jYJY++2lIlpcjyDtZwRg9L1YhVmrc1ArmX5UP4zScbAbFNTd7SorUQq2ovA0XvaWVz/M79JbkGKkcgLONASeQ96EKtd+NPXNI0g9gHAdmndsCAHqVHiT6PuLUJuJ7WpthPvnT4o1AoHueNqIboWREQdqMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780527031; c=relaxed/simple;
	bh=a7KAIbcdTWgMluL6cWR+pQDx4ZaQkwMAIAuYfXQ6F94=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XKMPiPq+WUVt0qrvKH4B6pI84uidVzg6YaV9gSRFujieZbfkxoqZNMMMNOxRbcQ0rDRa2zNd4fESI9jASMNh3acNo+Mr89+0DV1fLXPlHWrT0C83YcQ2EQG6CC1klNYtAWIMw9VFS0mwpkat1DnEy07JhVQOCh8vGeAmPagI0dI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WLlgWh7z; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PmTWIfHw; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 653Hw1jF3234473
	for <linux-arm-msm@vger.kernel.org>; Wed, 3 Jun 2026 22:50:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cNObVBNLEg+eZ9cz3ROctZYYJKCbvCSf2jNLJlucXDI=; b=WLlgWh7zOGaJ5nwR
	2cH/abLdEw2K/aSn4qg3xkAMqrvi9AEhdqNWZROF56pGuZarKWndS1SxI37Z7ZjW
	paOdd+HPFmXlpipFxR69nOsaDVbv/5rW2WXFsQyqaoP1L0ysrllYkLDB2EoT81j3
	IiwT93spaJtl9FAsA0vrOut4z19/3AdaUjKftqs7tdNsbLnIfCCp1DUYDmMqduZY
	KAgohzu7ljeHntxyZU2d2rC9s6apIcLzyq3/c5eHGZ93Bu2roxtcgXvfY1fcF/Yi
	86nbqE+4tK3I1pgnIw9v8E0fbICfKul8HnxSzIOsuWiRVZsbhZ9q1F3uXQV7J3fM
	hfppmw==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejs4s11dq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 03 Jun 2026 22:50:22 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8424aac207eso58055b3a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Jun 2026 15:50:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780527021; x=1781131821; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cNObVBNLEg+eZ9cz3ROctZYYJKCbvCSf2jNLJlucXDI=;
        b=PmTWIfHwj/ZkO5vkJ/N7oOHYIa9uHex8JO9cx55QIYh3oe2olyW4oJJPcnBnjzTaBk
         VHLE7rkRz6Cv87IYJkNhzKL4QZdHTo8gnuZSPOAwJactXkM/BR4vFPuC/xXhcwc3W/lk
         euud7TyyePxwaMRmOBLZ4Dtfbit+MH3Mg8tMi5JESCV8k+yszXUzEp00v8SCkmPBwZGJ
         A++AkZUSxImeaz3ItOfQSj/VmzzMz5K5eEgwEOlDsCf29riAzFxw9B3DhG8rRPtx6k9R
         5sRxWgiaN1WYGqVsN8GCHajcof4zJh71ii3pvYZRSb35xOnIiT1diQvFj2i8v9r9vNTv
         Vhug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780527021; x=1781131821;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cNObVBNLEg+eZ9cz3ROctZYYJKCbvCSf2jNLJlucXDI=;
        b=engVz1Hb4DWAWWdqE+8wsCUrq81CtIF0JWPcBpA7IJwzS9a29OD+PAv671/Hbpmqvo
         EujYOavrP/gKiERwXVF7z01u9UWZnSTo50jvT+cXA6dmlacjzaj+NRy5mQyIqW6NTMUA
         UTn93dZjnCljvhbmbqtanwvmsu/ZbdJQx75eGF46o2L0g/eBFtuAEbfDtsDYe2ijS1gL
         tYOFE6kNL/59baujKzSPIEJfAm+sGGNHu7oT/eOjnt+oyHPE77oexYpGguuESeP45+e2
         gc9zBSUtEtVk+6hdSyQyxnVg1HizperIWk6guXcJ/QsxODjdcI6xKlj6AqXsj/vtVSiJ
         Bmdg==
X-Forwarded-Encrypted: i=1; AFNElJ+BtR10pudR61kFFB+Ausx81TM4ZSdKl2q0lLetQGudUHPvVG0DPYSdskxEzRU9FjRIOKPfHifBig1idwy6@vger.kernel.org
X-Gm-Message-State: AOJu0YyiIDe+LsxLuMj2xFHIfpH2SXKX2RBtmSfuMRMb53FyYYlUaxrG
	erEqTMvizDVUDs68gU7bCi0UyXg53roykr6gTtv2QPSFMKvHUsKVRUItvHmZLKApvlzzwYlHbIY
	T8e2rFQq1JfVv0jN7F+QLMFa0idvlYUtlwKiPKJlB+42c7p7yBR29AVvHdzgiK1uU+/RO
X-Gm-Gg: Acq92OGBfbLyuoAPeuc4FwVpXCHxH9Toa34yy23Ty3SJlkrv2gHBMBmTe1gWIDqnSEv
	dISHUlr5ADufSK+0KJYbGSglihYrQ4qAbW4+4ln+XofaGqR0OfbxfeSaZYA7XJ/GEBLstO8wlEQ
	BqF1vziDIycE1hpb7+xT5LhWpLmnHFG0tAvYYDNsnhIrsfu9Bfi5t4pMJsfODqxVRlGlz3TleWb
	VeqZF89AhJdUAfqAqOZohfUY+nPh7i9pJUjjhIt/VSzhEVhfEhZkJq2ZPO/mz3qNHZHB7JPcz1q
	2nCs/jt8IU6iA0MKMxpELof2ppY+2xZW0eQ8h322ahd2q68YO0YKJJbmRAc1EYMBwNUk9Yr35Jk
	8et8MTma4EmUEvGoAN2h14hf7/WgKCk24TdH2V2kaK0y8mUkaRBnOmpuT6VISdkERqV43Kdb8N8
	m6uYjRDjjupDX9/4J3GoszlQ==
X-Received: by 2002:a05:6a00:4b14:b0:842:2f3d:dff2 with SMTP id d2e1a72fcca58-84284fc0529mr5182362b3a.34.1780527021063;
        Wed, 03 Jun 2026 15:50:21 -0700 (PDT)
X-Received: by 2002:a05:6a00:4b14:b0:842:2f3d:dff2 with SMTP id d2e1a72fcca58-84284fc0529mr5182342b3a.34.1780527020523;
        Wed, 03 Jun 2026 15:50:20 -0700 (PDT)
Received: from [10.133.33.141] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84282882170sm4518711b3a.30.2026.06.03.15.50.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Jun 2026 15:50:20 -0700 (PDT)
Message-ID: <e1c53e32-a777-46ea-8843-1f143706e762@oss.qualcomm.com>
Date: Thu, 4 Jun 2026 06:50:15 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] interconnect: qcom: add MSM8x60 (MSM8660/APQ8060) NoC
 driver
To: Herman van Hazendonk <github.com@herrie.org>, djakov@kernel.org
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260603163410.2312712-1-github.com@herrie.org>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <20260603163410.2312712-1-github.com@herrie.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: IxIr1H05ZZu0voq5ohQHIMJ3RBXaQd_V
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAzMDIyMiBTYWx0ZWRfX2Zh5rPc8S1GO
 H6TILoKz3cs2p6Krg7vJmmut/vWZKREWuPZ8qdWEfejblb1xU+3e+lQyhsrImjYGofEHRGq2XfU
 oFDJukJg6sizFS7nCGsV4tARz4uHX4+FFvLRze1QE5S80WHjROZZibaiY+Csw2zWbzl4Qo7Dd4d
 hz6mm2QGd8kjAHJgqoJe0VJ0c78NokSSTGWXlOXZ7SOGlL4klO7uIx0EZCqamFP1y2+Tt+L47nP
 gMh+ca8xntNMuGmv0U81mGAZCzOtdImEH6ICEwecgvyFIiTAiCti76diPno8OZTIi+yDcQC8ITM
 16tYpWKXtCzRQZFZa6zjnbZCouz17ZBc55giNYfLsNnwynrgEOCAtHN7m65ysGkkX+Qcve3iMk+
 kRorMCdpAdOCFN+4r1Nwxg2hzVN0IxVIHfoTFJIZwqwqeX51z22FHRnaDT24QkyKS6v0xzWQkwn
 jAQPUVVT1T93bDPPGcg==
X-Authority-Analysis: v=2.4 cv=afRRWxot c=1 sm=1 tr=0 ts=6a20afae cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=cTwmTnRGAAAA:8 a=4LjftOisGNAN7MZtn1oA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22 a=GUWCSGlMWfG-xDt5EnV5:22
X-Proofpoint-GUID: IxIr1H05ZZu0voq5ohQHIMJ3RBXaQd_V
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-03_06,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 bulkscore=0 phishscore=0 clxscore=1015
 adultscore=0 lowpriorityscore=0 spamscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606030222
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-111067-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[jie.gan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:github.com@herrie.org,m:djakov@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-pm@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jie.gan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D2C4863BA9C



On 6/4/2026 12:34 AM, Herman van Hazendonk wrote:
> Add interconnect support for the MSM8x60 family (MSM8260, MSM8660,
> APQ8060) — Qualcomm's Scorpion dual-core SoC generation used in devices
> like the HP TouchPad, HTC EVO 3D and HTC Sensation.
> 

Missed dt-binding doc for the new added driver.

Thanks,
Jie

> The chip's Network-on-Chip fabric is divided into four sub-fabrics:
> 
>    AFAB  - Applications fabric: Scorpion CPU + L2 cache, paths to EBI
>    SFAB  - System fabric: DMA engines, SPS, USB HS, LPASS, MSS
>    MMFAB - Multimedia fabric: MDP, GPU, camera (VFE/JPEG), video codec
>    DFAB  - Daytona fabric: eMMC/SD (SDC), ADM DMA, USB voter
> 
> Bandwidth requests are committed to the RPM firmware via its shared-memory
> arbitration tables using the qcom-rpm driver backend; each fabric also has
> a bus clock whose rate is derived from the aggregated bandwidth.
> 
> The driver includes a 384 MHz bus clock floor, replacing the previous
> 266 MHz minimum that caused USB starvation on real hardware, and careful
> devm/device_link lifecycle to handle EPROBE_DEFER from both RPM and
> clock lookups without leaking clock prepare/enable references.
> 
> Signed-off-by: Herman van Hazendonk <github.com@herrie.org>
> 
> Herman van Hazendonk (2):
>    dt-bindings: interconnect: qcom: add msm8660 fabric IDs
>    interconnect: qcom: add MSM8x60 NoC driver
> 
>   drivers/interconnect/qcom/Kconfig             |   14 +
>   drivers/interconnect/qcom/Makefile            |    2 +
>   drivers/interconnect/qcom/msm8660.c           | 1147 +++++++++++++++++
>   .../dt-bindings/interconnect/qcom,msm8660.h   |  156 +++
>   4 files changed, 1319 insertions(+)
>   create mode 100644 drivers/interconnect/qcom/msm8660.c
>   create mode 100644 include/dt-bindings/interconnect/qcom,msm8660.h
> 
> 
> base-commit: 944125b4c454b58d2fe6e35f1087a932b2050dff


