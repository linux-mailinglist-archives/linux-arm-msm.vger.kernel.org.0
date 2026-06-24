Return-Path: <linux-arm-msm+bounces-114339-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 7VYdFvTJO2qkdAgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114339-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2026 14:13:40 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B68246BE04D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2026 14:13:39 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=V0dxZSSr;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=hr4EezwT;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114339-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114339-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id AA7723060762
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2026 12:12:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65B4C3451D6;
	Wed, 24 Jun 2026 12:12:26 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 294B7286409
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 12:12:25 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782303146; cv=none; b=E6H078X1lu1jahcSjLLFCZqhvX/+5PXWX3/CPpAVSrHOf774KuX9z/oTbpTN4NxM/CVO0JvTkm83XP/DnteDAKazAgdy1PAkWJTju+AYpblk0DpQfrKWxZ+eEnwFrRcw6YILYdq+Oh1w1U9S++dI89u9yybAkviREE8nMQZJDg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782303146; c=relaxed/simple;
	bh=VQaQaReWebVOMn6fouhgktp+o54ktSN9vZsrXEZr7vo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IXGB8RamicDS0OMNGRlt/nvtuorrACDBEqF6YBlY7svW/kfvUhc5d1LL+0wZ6KWW2JDVE+vDzxzmJZbnskXow52RyAnCkR88LivdVeA9uZEYUfM0d7b9JXJzUehcy4Y1cErVMvP+HB1JHb6svLkEX6eEjQanjp3R6XypyhU4hrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=V0dxZSSr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hr4EezwT; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65OANloa2586224
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 12:12:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	W9d5uZ4kaUOPlkaQZfkAgT8ELlBWwy/PRGB6ginLC/c=; b=V0dxZSSrWW8p/JD9
	F24/CrjZxkLJj9hGHKjjn9kj8u4dOal4jOW4uyvm4AlHgtwZRH2dilcjTEMTS2om
	2aiurGZqv5PqjDLAVO32y2P2pZsd28OKIJSepHaU/f6ICoItrEyC5TV7kJyOB0ES
	lC21fCNhAwjvURMphrZUDs9b6fXvdmQYfWO4/RN1B/i2BEZghrQ+cRuFfA3ovbZJ
	dR2yRDQherJwg4p08IHW/Oo4gcLWqC9OdJqmNq1/sanvwUwEOj7LF7eQfR0iK5jV
	R7MoEj0rmrzP75u797NZXG2fy5tZdXS3Mu5cpRPDUz4M4520k95fM/irONKArq4v
	hASdqw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f05aqa3s1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 12:12:23 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51a07295d67so3222901cf.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 05:12:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782303143; x=1782907943; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=W9d5uZ4kaUOPlkaQZfkAgT8ELlBWwy/PRGB6ginLC/c=;
        b=hr4EezwTIfnIvobJGr+IXz5F6WDhZWefC8GYZkj+lMJEmLuFZBNreK1rctFlQ/qcQI
         YOQeqEewGzV06IbOGIPcFDkpP0QMezBXCj5JEcePle0WLkHd0hPNmgepTqKHWDOfiql4
         ztK72GlShZOxC7+/JuTrYDv1mk0gM8UshJq6NmVMqOAHfF8i9IVqoGnC3KQ08AhPamNM
         JSxveOXmzD7/2GxABhoFFV+NrZEpEg4ZkzOaBKNgWHwKfYaR8f3oe/1BUki33XU9UrNn
         yy0oRSU2A1XhdHmjiSvwXZ1cIUmbnNfocAOhcBKtEr8Ti85PTkKUj6d/QpR3x32386/T
         NPig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782303143; x=1782907943;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W9d5uZ4kaUOPlkaQZfkAgT8ELlBWwy/PRGB6ginLC/c=;
        b=WEAYhaINjLqDwHfGigO/yNy5ToS4zbOYyo2DJTx6NGkv/EB6rX1sSCgKKNskeOlLJ+
         uHvyFtY3z8mBbKwy8C1P4g5QaOShiv1QwuNP3OFgjCA254e1B+PCjSvpmo/nEToFZ5cu
         umF0mCKtttspHDxHZ5MFNfEkbZqCUYv80K802eyhj/1JZjwv1S1QP8dK+fjd9q4axHL2
         jli96IHISeR1zT37AuSAXhPukfeNgUndu7Po8+IpRjtiPZ307HOdqmkNW3pE1MbaEgeV
         eFCtpTD1RC7CA9+8oBUL3SFdIX1CwdOH19Tos2pv3z42jhGBopwy+KE8FuOba/qh3EiH
         3P8Q==
X-Forwarded-Encrypted: i=1; AFNElJ/cHK7yH7uFLS8f12JKRZB5FH+jT9g7q93CUxn3ZyrYGNIeL0ibYquHv/ysyaOVRz6p00w1KVvYxvXsH27O@vger.kernel.org
X-Gm-Message-State: AOJu0Yydi+a+BM1NY1lbYCJ+x+9zVVDSliG8M0Dd68MVQKZN0hTMDRAV
	P/VT8cpCQ4MZbjeXfqYu6agZ7aiLlkjGl2WAlnt3FkpRMajTeGmf6HudlDzmuvtK4c672cDk68H
	9NOx3MQmp+53dnQbwAc/Yiga5oL29Y8xwxMiKOIiPyNkRrScA8v8puKkUdb29Odj0GYi/
X-Gm-Gg: AfdE7cki8aWvsC3U0LNiDHdmrmBxkXpTmGt1riH6BFLF1IqAOz1QafIW1L/1FIKudAu
	rAxQ1xVcC+9PeYBhQhRyTeChxmQSQOEZijpF8GL2jloFwyN7shEhzqeFiOfB/SSQSF2k7SIqk+p
	iG1MeuhqTdxVnTqMYPwLontgBG8hHtUllL2bmSg1UwUMZrT10d/m9GdNop+ypqAM7WrTW7rrg2l
	h4nyD3oMQLb+1fiJjUUwkHqLkBvUF19O0FO2O2dzmoLyn6yWkzfp5PQoQTFrmXQ4V9J9iHLe9Rq
	wFpqZXSA2Wrv+JplnXSN2dURqqqFSJkPG/EMB2LggnSrsWyg/HH/GnbjEkB7VUnyeZ3llDY/FzI
	mWz7I9x4PyedSGEBW3aZ7mu0y8oft7sw1jok=
X-Received: by 2002:a05:620a:808b:b0:915:4ca0:1210 with SMTP id af79cd13be357-925c95b20b4mr930676085a.3.1782303142534;
        Wed, 24 Jun 2026 05:12:22 -0700 (PDT)
X-Received: by 2002:a05:620a:808b:b0:915:4ca0:1210 with SMTP id af79cd13be357-925c95b20b4mr930672185a.3.1782303142014;
        Wed, 24 Jun 2026 05:12:22 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c0c5e49aa07sm650190966b.10.2026.06.24.05.12.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Jun 2026 05:12:20 -0700 (PDT)
Message-ID: <f802a990-cd11-4a77-acdd-018677ae8c62@oss.qualcomm.com>
Date: Wed, 24 Jun 2026 14:12:18 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/3] arm64: dts: qcom: Add Vicharak Axon Mini
To: Ajit Singh <blfizzyy@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260607113658.25117-1-blfizzyy@gmail.com>
 <20260607113658.25117-4-blfizzyy@gmail.com>
 <39228ace-9404-4ade-bcb1-28e763548b7f@oss.qualcomm.com>
 <aiuGjH4qeOIXXgqq@page.local>
 <5c80c430-8bc7-4d03-be7e-c6dd518705e7@oss.qualcomm.com>
 <ajOO6bx3KmYzhVdy@page.local>
 <c16a2837-4b04-466a-bf4a-3717436c25be@oss.qualcomm.com>
 <ajYcnHPZjkFwGjly@page.local>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <ajYcnHPZjkFwGjly@page.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI0MDA5OSBTYWx0ZWRfX7iuyJlIEsLzR
 Qszln6HJKyMpHGvXd+3nA0BXBpW9isHJAI0w5uNKP2vCbeNQsL0N4aohR/MNr3s96gotojuNcwz
 0xl5qJ6S/3lZtxLxZ4xBWH4IUagKL2o=
X-Proofpoint-GUID: BPZH3OWe_jmoaQ9WUsc0SBvEcywYVgZz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI0MDA5OSBTYWx0ZWRfX/aLK/0ZaT02D
 wR0EwY65dJNSCoCaYXOhfyzGQeL/riPw5QceR+HUEo4JKGbTpr/IhlCuRE/ENN8eg4NHtd2rftI
 jp6mEhaAVUHFZWuHQ2LmvKrV7P+YgMhvxaoaBRe7kdIdE9+hgElU1bslQrUNuzgsAs3Ket0JKQO
 wMvk+JuTOGKhfVbhSrXJ1FgatM8CmlBz+//mplP58PmiSHDfQz+a+I1iWehvbHbleDqqtCbYkfC
 MI9KynypDqJv2/Wu7ZjOXX/P0cDI5Bw1b7hx0gWX9HL6QO8UJFEmohe8HBpvk24oSSYQs5P2GrK
 diE+5cNi6HCyhCbHNfoWnpQ0/sxU+UhB7YFEyTtOFyATSnZsG1htXSNzbq64xRtb9JGn5wfy0+2
 m5/AEvlC4gco+tAEk86JihFFDMixlw==
X-Authority-Analysis: v=2.4 cv=UphT8ewB c=1 sm=1 tr=0 ts=6a3bc9a7 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=pGLkceISAAAA:8 a=rCQGlBV6-1WLTuut6Q0A:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: BPZH3OWe_jmoaQ9WUsc0SBvEcywYVgZz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-24_03,2026-06-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 phishscore=0 spamscore=0 suspectscore=0
 malwarescore=0 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606240099
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-114339-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:blfizzyy@gmail.com,m:andersson@kernel.org,m:bartosz.golaszewski@oss.qualcomm.com,m:dmitry.baryshkov@oss.qualcomm.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp,qualcomm.com:dkim,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B68246BE04D

On 6/20/26 6:57 AM, Ajit Singh wrote:
> On Fri, Jun 19, 2026 at 05:30:40PM +0530, Konrad Dybcio wrote:
>> On 6/18/26 8:29 AM, Ajit Singh wrote:
>>> On Tue, Jun 16, 2026 at 02:10:44PM +0530, Konrad Dybcio wrote:
>>>> On 6/12/26 6:16 AM, Ajit Singh wrote:
>>>>> On Wed, Jun 10, 2026 at 02:58:19PM +0530, Konrad Dybcio wrote:
>>>>>> On 6/7/26 1:36 PM, Ajit Singh wrote:
>>>>>>> Add DTS for the Vicharak Axon Mini board based on the Qualcomm
>>>>>>> QCS6490 SoC.
>>>>>>>
>>>>>>> This adds debug UART, eMMC, UFS, SDIO WLAN, USB 2.0 host, PCIe
>>>>>>> support along with regulators.
>>>>>>>
>>>>>>> The UFS ICE block is kept disabled because enabling it currently causes
>>>>>>> an SError during qcom_ice_create() on this board. UFS works without ICE.
>>>>>>>
>>>>>>> Signed-off-by: Ajit Singh <blfizzyy@gmail.com>
>>>>>>> ---

[...]

>>
>> most notably though, it seems that the brcmfmac driver doesn't even use
>> the regulator framework, probably because all of the SDIO WLANs that
>> Linux supports were wired in a more "embedded" way, where the V(Q)MMC
>> supplies were enough.. unless it's the case here too?
> 
> It might not be possible to drop regulator-always-on for VREG_L12C here. The
> SDHC2 host already has its own vmmc/vqmmc rails:
> 
> vqmmc-supply = <&vreg_l2c_1p62>;
> vmmc-supply = <&vreg_l6c_2p96>;
> 
> VREG_L12C is a separate module-side VDDIO rail for the AP6272S WLAN/BT module.
> There is no separate GPIO-controlled enable for this rail;
> 
> as you said, since brcmfmac does not appear to consume an extra VDDIO regulator
> from the SDIO child node, so unless there is a preferred way to model this
> module-side VDDIO rail, I think VREG_L12C still needs to stay always-on.

OK, let's get this merged then

Konrad

