Return-Path: <linux-arm-msm+bounces-112996-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id VCKfEPs7LWrGeAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112996-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 13 Jun 2026 13:16:11 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 99C2D67E6F8
	for <lists+linux-arm-msm@lfdr.de>; Sat, 13 Jun 2026 13:16:10 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=c0r3M2Jo;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=RbmjSA9S;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112996-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112996-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9A5143010EE2
	for <lists+linux-arm-msm@lfdr.de>; Sat, 13 Jun 2026 11:16:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7B853BE627;
	Sat, 13 Jun 2026 11:16:08 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94BC330D41C
	for <linux-arm-msm@vger.kernel.org>; Sat, 13 Jun 2026 11:16:07 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781349368; cv=none; b=foGsmBTeqUJqhjYuFv2Ylb2PBvVplArlvt2gcGa1z0QMnC+gL+jGR4AFSVv6u1TXdJUnC5iKKG9C48o+A2u6eY8PhUgXtY3oeghh8BQSzcJVvzBsJ8E9slA0pDyTWNsljAMcJ0i2JomRYiGSsEMZSOowmqAc/L/xtBUELY4UMBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781349368; c=relaxed/simple;
	bh=YoKsP5jyQNp2ZucctxAXbiSQWgYelgFgXvNPt7Y3Qn4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mCiJbPp1kgkj0YPSqvmibWfY+FA7CqVqxx7Q9ReZI0/lfrWnVSVzQucsENz4qC8OSnN/O0SzYIpOLgz/xpCPCje4UNRjmCPxS+hb5QdOO9DmRg583nKNZYWqSvIu7IWX8b6kn4DFdnwTxYwb8G7Vapm3EgypYyMxpMeMSHlYzEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=c0r3M2Jo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RbmjSA9S; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65DAuIlm2260035
	for <linux-arm-msm@vger.kernel.org>; Sat, 13 Jun 2026 11:16:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5OmjQdfNxH9BcCMT+yXKYbW4+8NRoGCiNzl/yysDUKI=; b=c0r3M2Jo8P6Jb2YP
	Gwe926apPB70ZPiTFw/XNm72qXx3dGhZTK8SuobIPhYrVEOWY0Ceeeb7VznX906R
	DRgkN5HJWKSaSfHYVBePnVUBissJSdIzMsA0TqUwP4NUQ9ztbtahYRSz9saznkDR
	+4S8eiefw0bjFv6YDAgmq+1tleiOeLcPbkHIFFdHsDZ+GTUFfx4+tXFIN4XwqVCF
	0C0M0AtVM7ixUZmjOrLIcn5snP5KVkjrNlYrMf/Q8KHve2VkOhqUvVSeB4HzPZGg
	N3G6DkM8NZC2h4Nt6d/ZeiGTT4UZTwc2l6Ea3Rctu4lruaVZRkaj2KzPTi0/uo8D
	+mqcuQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4erye10uck-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 13 Jun 2026 11:16:06 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8ce9e6cf3aeso33617926d6.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 13 Jun 2026 04:16:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781349366; x=1781954166; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5OmjQdfNxH9BcCMT+yXKYbW4+8NRoGCiNzl/yysDUKI=;
        b=RbmjSA9SSjzRQ6eL0+yG35CCBk8LQ6bcN6/t1TxBbMDWJu8JrK1axXxaytO9vL4ctO
         PtxCjq8u4xCqhr4C/81TGA9VC0j+v44SsauhNuPDfWi/u0FFlx3UiuKmKfCL7zOfs2gI
         cMnU8FtuBhMCz6TGbLaP6QroqPOC57/+R3i/+HBN8UY+ygLhhcK7Ey7YI03WqtAQuKqG
         PKNhijiTLxNnmvPGlwlTNHC6IbWSQneQf0vrXqTpLEY3na7lvjhP0uz23lzB9MWHp7JZ
         KQHOnRO2e+RapUX0lto/VYhdixAx1wc1oVX0UpHjcynMcTEj7egLvHOcHHHhpjh3YqzT
         5z4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781349366; x=1781954166;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5OmjQdfNxH9BcCMT+yXKYbW4+8NRoGCiNzl/yysDUKI=;
        b=C7QlLpVTqOPLF0MEmL/5ghblFshThwhE8Dpg52wIOzz+b3m2jvxu3DyNfZJ+HfFizH
         OoiMLbwr91EiTOkdLSH6gb8MhJrn+QgTrZoMg4fPjNc906xWcIcD0wdcVmn5x36q8aJz
         ECRa2xit5ZWDEcB8eB3/pI8o7xHG6+Cw4pjA+OOjy/RxN/lGg3gw6YT5/YAlZ6Mo4uzv
         OH41Pamj55YL0VhlAH0uULyFfoscwyz9IizZjwyA+ZoC2cQJ7DYxC5sA+Djac5fyGLMm
         FUIIroyf+0AhtenzveTZHTfCiuO+eBWCBHGkHIHSxrjJEKVGoA6yC7rqxRuv1QsYAjgd
         KxyA==
X-Forwarded-Encrypted: i=1; AFNElJ9WWAjaJ6AW+dNtRmFiQRWEkxuK2bgyS8LYJX4JAU6lA407BXIquxy81y/StISIyt0zrNZ4kuTG3o/Q19Cq@vger.kernel.org
X-Gm-Message-State: AOJu0YzcZ7wZt8aUuw2cCGARIOtOz8BRhfYL86w3jlMdYnanQdzdlzpS
	x955oxt9onFUaysQSTakiWpJHSJj+RiFxrcoktZ5IXI3Q/woePmtVdlZFabyjTqpdy6VBj9iSWO
	mv1bh/f0IlmfDOt2ePcFqfC8PbF93l6Cv57dbEpEhoi3vpBTuUZIt+1f4nOeRyWxyOaAI
X-Gm-Gg: Acq92OG3vZZ9Q76TZWa5EUh/Hdy1xyUrZ29U0LaxiPJyeFSb//Adlft2G2aDnk6QVus
	2bI1cXuI+UQa7p/mkFJ1neGk5gqUfGr4WFux87W477BmmP16xlRRPeQKMI0vumFzaZljhnchQls
	8K1OxqipkZ7OKkR0vitriyxkIuRm0K405qs3jpc7vCoNBbJ8gmbJ0XJzLJlJgADcNBbrpdINPdi
	aNUPn8QVo58ov1lP2c96ciluVMh0cxYhr9hIN1iKudTMKxnQ9BK2CLbZNWapmNh5KEY0T4skYXX
	000YnrMQlVYsC4jOOgI/zwC1L84Xg0f1ijjSl29PziCnO4HEUXb5M/8mNOOvrtrI6CK+vElixGc
	2PPYy3c14syC1ER12u6dPmBC2ncOLyCyJ6+GisMttZlku2wZ2++6I7g==
X-Received: by 2002:a05:620a:f01:b0:915:29cd:306f with SMTP id af79cd13be357-917f1c55af3mr560612685a.55.1781349365798;
        Sat, 13 Jun 2026 04:16:05 -0700 (PDT)
X-Received: by 2002:a05:620a:f01:b0:915:29cd:306f with SMTP id af79cd13be357-917f1c55af3mr560606585a.55.1781349365239;
        Sat, 13 Jun 2026 04:16:05 -0700 (PDT)
Received: from [192.168.1.73] ([92.247.57.178])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bfdb44208f8sm214433666b.10.2026.06.13.04.16.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 13 Jun 2026 04:16:04 -0700 (PDT)
Message-ID: <9fab1877-976b-4495-86de-a8c853b9ba24@oss.qualcomm.com>
Date: Sat, 13 Jun 2026 14:16:02 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/4] arm64: dts: qcom: sm8550: Add JPEG encoder node
To: Bryan O'Donoghue <bod@kernel.org>, linux-media@vger.kernel.org
Cc: mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260612194417.1737009-1-atanas.filipov@oss.qualcomm.com>
 <n0iPW9ltP_HyfKgagM8MIvaGg_NF7KvUV834b6MPuE3llz9v6B1jdn6wEvXMkIHS_zLRsjnb7pXY3dURUOSs9g==@protonmail.internalid>
 <20260612194417.1737009-3-atanas.filipov@oss.qualcomm.com>
 <8d230cca-2023-4a13-876f-d5db8eb200a1@kernel.org>
 <Y69RNi5x51R9xs6wvf1lRTwKww7gu_-s3WDlGvLpDuZ4YEhg4lrXnuwn4V2p9bSGUQRM5x-vVsDTNt29kOst3w==@protonmail.internalid>
 <3d4e0147-8e62-4872-b881-1452f5e09e85@oss.qualcomm.com>
 <f754c28c-2d0f-4e10-b542-37eca70b091e@kernel.org>
Content-Language: en-US
From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
In-Reply-To: <f754c28c-2d0f-4e10-b542-37eca70b091e@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: clP0xQjMcilGAAV-ZmpqsWPjaAnoSoi7
X-Authority-Analysis: v=2.4 cv=MNlQXsZl c=1 sm=1 tr=0 ts=6a2d3bf6 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=ybD9qRDIDfZaXNPQ7Ca20A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=CIwv6HcgfBTlmMJXo-UA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjEzMDExNCBTYWx0ZWRfXwk64Yl3z2Qc2
 iHdiC5o3r0bFpbSRN2uLnvPRD9R6aj5GuCwTFBUm9JfJTWwSky5/S2Gr/yLSq6TEEGgcNeRqi9A
 dnsUZbdfES+5DYTjPweIHt3XLDVcqX0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEzMDExNCBTYWx0ZWRfXzSfkUWgCW+q0
 RfdLT2T3h6BNi/Q+Jo/q24I/9hP120q3YjS3uy2nlwLPv+K0+DMOAeiO5Pogkq6bejlanGb+ekZ
 +YeILJJPmnDJvbTHaAFYIpUOtF/+YaUnio+XBHMhcVZKhSLB0aEKi+tBpKwTXOCJVhoKCTVJ5J3
 gV2+HG3AYAtfqWsXhvw19u24P3heJa7AruvBPnlgIgZM4LSkCy71yKe9ymSmAXGtE35qfxqBoQe
 J4b0KkB6CyQONshDwVIgntvVVnpMDoG+txywGnHWfe+ecXD85vbBbDjovyYodYrER+o/bNTLAT4
 aReECujOYE2k78zAiA7LH7mTSjOylk8Cox75GYpy5beCnbqmy0gcJXMVzan0tB6ZVfDdgbaWpUk
 kZ192x63KcGTabyiRmMqyNJ98dvnsGmD8XRyaDJybqZhfzMaiE8aBTHGJxTwxCeOuGWI0PtLCHw
 QVutifiR2HUI3xfZHow==
X-Proofpoint-ORIG-GUID: clP0xQjMcilGAAV-ZmpqsWPjaAnoSoi7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-13_02,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 spamscore=0 priorityscore=1501 phishscore=0
 adultscore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606130114
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-112996-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[atanas.filipov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:bod@kernel.org,m:linux-media@vger.kernel.org,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[atanas.filipov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 99C2D67E6F8

Thank you for the detailed explanation. Let me share my understanding of 
the shared upper-level blocks. They are exactly the reason we have 
frameworks like ICC with aggregate bandwidth voting, reference counting 
in the clock framework, and so on — the same applies to power domains. I 
do not think using shared resources is a problem when the drivers are 
correctly designed.

We have actually validated this: we got CAMSS working alongside the 
Qualcomm downstream camera stack after fixing the shared resource 
management — something everyone considered nearly impossible at the time.

On the CAMNOC and CPAS concern: if that coordination becomes necessary, 
the right fix is to address the resource management in both drivers 
independently, using the aggregate capabilities of the existing 
frameworks — not to introduce a
hierarchical dependency between them. Moving JPEG under CAMSS does not 
solve the CAMNOC, clock and power domain coordination problems, it just 
papers over them.

IMO the problem you are pointing at is more general than just CAMNOC — I 
would add priorities, QoS and other shared resources to the list as 
well. The answer to all of them is the same: correct use of the existing 
frameworks, not driver
merging.

On the idea of putting JPEG inside CAMSS with an external API: CAMSS has 
no engine or pipeline that produces YUV output, which is what the JPEG 
encoder needs as input. If JPEG moves into CAMSS without an external 
API, it becomes
inaccessible to userspace. If it does expose one, we end up with a 
standalone interface anyway, just with an extra layer of indirection on top.

afilipov

On 6/13/2026 12:52 PM, Bryan O'Donoghue wrote:
> On 13/06/2026 10:24, Atanas Filipov wrote:
>> Thank you for the feedback. I understand the reasoning, but I
>> respectfully disagree with this approach for the following reasons.
>>
>> While it is true that the JPEG encoder shares the same camera NOC and
>> power domain infrastructure as CAMSS, that is a hardware topology detail
>> — not a sufficient justification for imposing a software dependency. The
>> driver is a fully
>> self-contained V4L2 mem2mem encoder, implemented like every other JPEG
>> encoder driver currently in the kernel (imx-jpeg, s5p-jpeg, mtk-jpeg,
>> nxp-jpeg). None of those are sub-nodes of a parent ISP or camera
>> subsystem driver.
> 
> That's a backwards understanding of the ethos of DT, which is to 
> describe hardware architecture, to describe hardware, not to subscribe 
> to or proscribe a particular software architecture.
> 
> Those jpeg blocks are standalone, whereas the CAMSS jpeg encoder lives 
> inside of the CAMSS power-island.
>> Making the JPEG encoder a sub-node of camss would introduce an
>> unnecessary and artificial coupling: the JPEG encoder cannot be probed,
>> built, or used independently of the CAMSS driver, even on platforms
>> where CAMSS is disabled. This directly contradicts the kernel's
>> principle of independent, single-purpose drivers.
> 
> - Probed true
> - Built true
> - Used untrue
> 
> Once probed your current driver can chug along pretty much unperturbed, 
> however I don't believe that statement can hold true as more of the 
> camera hardware gets enabled.
>> The shared hardware resources (clocks, interconnects, IOMMU stream IDs,
>> power domain) are already fully described in the device tree node and
>> handled by the standard kernel frameworks — there is no functional
>> reason to nest the node under camss.
> 
> Except that it is a real description of the hardware. "We can model it 
> separately != we have modeled it correctly".
> 
> And at least one thing you are leaving out here is the cam noc - which 
> eventually we will have to start to enable and will almost certainly 
> have to be controlled by the core driver which also owns the power- 
> collapse and muxes, the thing that will also program CPAs - the core 
> CAMSS driver.
> 
> Perhaps we choose to model that NOC as a separate driver or perhaps we 
> expose an API in CAMSS to vote, either way its an intrinsic part of the 
> voltage and clocks in this block.
> 
> Either way sure we could model it as a fully separate node but, that is 
> not really how/where the block lives. It lives inside of a defined CAMSS 
> block, which is its own power-island.
> 
> Switching on the JPEG part of it by inference switches on the top-level 
> of the island so, its not separate at all.
>> For these reasons I would prefer to keep the JPEG encoder as a
>> standalone platform device with its own DT node, consistent with how all
>> comparable JPEG encoder drivers are structured in the kernel today.
>>
>> afilipov
>>
>> On 6/13/2026 2:14 AM, Bryan O'Donoghue wrote:
>>> On 12/06/2026 20:44, Atanas Filipov wrote:
>>>> +        qcom_jpeg_enc: jpeg-encoder@ac4e000 {
>>>
>>> One key bit of review feedback I gave in the previous leaked version of
>>> this driver is that since the jpeg-encoder is part of the CAMSS block it
>>> should be a sub-node of camss as OPE, CSIPHY and other blocks will be.
>>>
>>> Please take that feedback onboard in your v2.
>>>
>>> ---
>>> bod
>>
>>
> 
> And please no top posting !
> 
> ---
> bod
> 


