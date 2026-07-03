Return-Path: <linux-arm-msm+bounces-116248-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id wPAfMUl/R2pEZgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116248-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 11:22:17 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id BD896700924
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 11:22:16 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=JUXKMz4o;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=FIIQYgOb;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116248-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116248-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id C2BC23008682
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jul 2026 09:10:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9F6C39EB40;
	Fri,  3 Jul 2026 09:10:13 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79BD3399892
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 Jul 2026 09:10:12 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783069813; cv=none; b=pYytKXzM0y+oWG+to42iPsJI99ty0KSFUzRMbqnSkemJLTefGN2/CFxRhwYWWvdNiKycebVgtI/Ih+0Q9qzCbz0QWIt1uI4+ON5CGqsm4pqMZDV7QpU75oBy6k9HWs0GM2oLGagnPllmyFIaftJ6944A/etotcgipn+Gr9rq9VY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783069813; c=relaxed/simple;
	bh=c+KE0T0IcDDbwoUsTTCmKZqT6Yfzi3GlkZpTMj/zRDg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lTp8T2AyqINGnnZpcSQi/mXXQj47aBMBCEIV1re6FcqWzqaYSDIYiy/i2OCwJrN1Q2hHRDYj/ISgYdlTz8Ewiio5vaXdVj/8PCizEgJIMqNGMgaZY2BGeXdOEXocvKtkc8qu8UlDVBTXino7lNzOhCQ5AW+kp/RkMhzgM9rPppI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JUXKMz4o; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FIIQYgOb; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6635rlPV3088106
	for <linux-arm-msm@vger.kernel.org>; Fri, 3 Jul 2026 09:10:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HYViuiGlDPKweNTZktoxsCGXzpo6eRi1FKY8gO5F6bQ=; b=JUXKMz4ooq0ieK0M
	z7F8OIqACMUia9en66hni9NCbfzgLR1zqdKhMriSvxPfRwmB1ZJmDfiJbBxpVP2f
	Qn8wwfkzyPNNLQ54zofShvhL4p5ll/x13+Z5SWlBcsCvo6mgQWEjDHZIB7CM2XBR
	4nam5hjJ519OUOtKcslVEFOSlowAsfOubCGMbgHnqMsY//Z9ocV4SuId6+IeMfaf
	p/YGnVw7z2PPtFvYWCm6Q6cM0vJs0uStOYOU58fUMLIN0jE/sKwii7gMm6xk/p8M
	8vOWClrSp7dTdtt4TwVjJkQTVIrD7eylw2qhowifXShdH8G/SGCE9bqsngcIEwY8
	jLVPkw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5s2547ww-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jul 2026 09:10:11 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2ca0481106cso5461635ad.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jul 2026 02:10:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783069810; x=1783674610; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HYViuiGlDPKweNTZktoxsCGXzpo6eRi1FKY8gO5F6bQ=;
        b=FIIQYgOb/OEAD0kAP/uQ15uMSDcQ2AZPFsCsfVb8k3uLoFX3Ig5ZE3MOeuh4NI7PF6
         BHOxWITpUw7Xv8NKTZ/TXw8d0z/CwRFZPPDodLtjkUdVAiK/d7vZEWEhxx1V5CRvTKEM
         iUCEXGBMelPmMmHhwB1UylzRPNB3mcws5hIlubE+vEknpoTzq/SwytpOXmkUS8HgcYTL
         qSIapQhdxjphIgfsgHFDxKhbiM02eyw95DRgosum8NLoKskh75oiRK3MnxUeSIKk8Oa8
         tsDwMoUzNmjTu/pULq3jQF/TXpL6wQT1o5KpKCkM7oiU+6qForE+t3jz1mPHfvw6b1a/
         Kwtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783069810; x=1783674610;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HYViuiGlDPKweNTZktoxsCGXzpo6eRi1FKY8gO5F6bQ=;
        b=AlpagC8m3ZLAMxkPclLHMau2QZm2B5K8OkvpO7XABS9SSje9MkLRBZPP6/vYl4PyO0
         0/klROpiJl1joaXwR5+e5xG3vm3o/V0gk235dvp3ZTEJD3hM+mdykahi9WCxE26qH0Zo
         uLbspvS4zu8x75nMdVtJPcsIl1krQGZmwhlelVHuq9Q7bZ+S/73hc3sORC9LVjLWWRmH
         6o911ybQB+FgY0xh+HhkbDwF3BtMI2EjWi7bnoYPb53sXTKhypoU/shPDcV8HCoy9+Zt
         5zmDcoohpb8/611V+JmK4izMCEUdy3U0dIaUqrOgkGvEFBrEZZL7ZFpcGbX0Qcbn86qg
         7RcA==
X-Gm-Message-State: AOJu0YwZGgYAbJNpCJeiWTUHSYmQf4/TUsRHuWhhVGPxyOk58TUP3ey1
	MITBns+lgTGCXi1m6BUq6BWItx/W1MLZarqNTx7XOoox7NEhrm9qwkdnWfKGEcTBcfOB/rPEu8x
	Kc576/36khrzQNuf/7y+PAGr4c8Ih0xDUEtBsAAqeRIutl6bbvJxlchDT7gMkjIsYbsS5
X-Gm-Gg: AfdE7cnAP6C5xMvdDK4Ki3Jc7WMNi0z2KghP/FJSdvseHuZthocNiz2a9YuZKjdUf8t
	YTcdHQucGtuTV/vU5snf1QrGhEOVyqAGSdnRva6320FOPO4KukgbOo7KkojK0988QHNpmEb34IQ
	FuEIqI3HJGLMGNhlaWfxlftbETyZrkb0OXHpTu+5VhtNRmg6hJP0iXWkPcyXC90UYS8x186F4ya
	x5TM3nNF/ODs5w+irKmy3R0AS8OGV4j5npdbfJNYLjQ+0Bd+0gPy+ZNBDyYwKi+HcdCDE9v+Exh
	+jX/o8Pcszw8OHUqY4HRGynhbsRbapT/vOSLdRaOy5FvtzXsuRe1vyZdfcaEHmpldVaNs1UDqfD
	tgfyyGscnAREyxH/2bhTsS4psfxiJ16C7t5fmvl0=
X-Received: by 2002:a17:902:fd86:b0:2c9:97a8:aff4 with SMTP id d9443c01a7336-2ca91232f54mr96529905ad.45.1783069810463;
        Fri, 03 Jul 2026 02:10:10 -0700 (PDT)
X-Received: by 2002:a17:902:fd86:b0:2c9:97a8:aff4 with SMTP id d9443c01a7336-2ca91232f54mr96529435ad.45.1783069809972;
        Fri, 03 Jul 2026 02:10:09 -0700 (PDT)
Received: from [10.204.78.119] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cad7126971sm6279575ad.18.2026.07.03.02.10.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Jul 2026 02:10:09 -0700 (PDT)
Message-ID: <580d67aa-9a5f-4fd0-ad15-f57865b79477@oss.qualcomm.com>
Date: Fri, 3 Jul 2026 14:40:04 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] arm64: defconfig: Enable ILI7807S DSI panel driver
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, arpit.saini@oss.qualcomm.com,
        mohit.dsor@oss.qualcomm.com
References: <20260627-shikra-dt-changes-v1-0-449a402673d0@oss.qualcomm.com>
 <20260627-shikra-dt-changes-v1-3-449a402673d0@oss.qualcomm.com>
 <cfb45d95-7bf1-47dc-96f2-2ea4e9be9e70@kernel.org>
Content-Language: en-GB
From: Nabige Aala <nabige.aala@oss.qualcomm.com>
In-Reply-To: <cfb45d95-7bf1-47dc-96f2-2ea4e9be9e70@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=U7uiy+ru c=1 sm=1 tr=0 ts=6a477c73 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=0nV3PEHnMKbNZb7KTqsA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: Q3HxwfvjHtg-KAfcpipi2EhvR7xDjOvi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDA4NiBTYWx0ZWRfX9hQx87gC+D/s
 VpBIzY8so/JJ1Ezg8aoYywiINMew65pMCPpegXAJeJacqXAspCFgvmVEq4w8D/QGmkp6rxaTawp
 GcIWxXrneSA49geoJepA52BlEOfMRgRk805BvtNtTgmArv6JB1FNqc1WublHpW/WCIpY68KuPdk
 mOHgWRXX/VSnnvVqTttFlugoFvRJoBBvJFR1ctTF+IzCwy9fpyoCN2FUz4Ujchk000qpcr+NMmh
 x1bVON5rVWuozSiFwcpj6R2y0VGTF5GG07HWm4TP4b1BV3JZcIkykP8XTynKoucwOS3IcYxm/E5
 c1qNca8/5t37THgKeB5rB3rDBBNXj8rR/KLPddBEZFh2CMHtB/iL5XmWRQ32x+xeWX3crEqevKh
 4ZcRAuysUnSCDFyDhRnot3soRYfKcwE8DZCp3+mupdISVHlMRKWiP6aRF8C2nB1FNJnjsQbAGqe
 lkZCZ5mhQEmSPS2x7Xw==
X-Proofpoint-GUID: Q3HxwfvjHtg-KAfcpipi2EhvR7xDjOvi
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDA4NiBTYWx0ZWRfXzW3K7dNNp+Tg
 iAxX/zq5wREUg+9G5/eFV5AOmFLBxFPl3go9Fhq2eKAJUjY+boG8vBhtY2BnmS4/4dYYDSJHqNM
 fJmBjJSz3wEhmbIf/YfQHdqP2cNtof0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 suspectscore=0 priorityscore=1501 malwarescore=0
 spamscore=0 lowpriorityscore=0 adultscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030086
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-116248-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[nabige.aala@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:krzk@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:arpit.saini@oss.qualcomm.com,m:mohit.dsor@oss.qualcomm.com,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,vger.kernel.org:from_smtp];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nabige.aala@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RWL_MAILSPIKE_POSSIBLE(0.00)[104.64.211.4:from];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BD896700924


On 6/28/2026 2:14 PM, Krzysztof Kozlowski wrote:
> On 27/06/2026 12:01, Nabige Aala wrote:
>> From: Arpit Saini <arpit.saini@oss.qualcomm.com>
>>
>> Enable the ILI7807S 1080x1920 video-mode DSI panel driver as a module,
>> used on the Shikra board.
> So that's a v4, no changelog, tags ignored, comments not responded and
> also ignored.
>
> You got yourself one NAK, now second:
>
> NAK
>
> Address the comments before you send the next version.
>
> Best regards,
> Krzysztof

Hi Krzysztof,


Regarding your initial comment "Does Samsung Shikra CQM EVK have it? I 
guess no."
I checked internally and found that there is no Samsung specific Shikra 
board. Shikra (CQS and CQM) boards have this panel and i am upstreaming 
for the same boards.

I hope this clarifies the concern. Please let me know if you have any 
further questions.


Thanks,

Nabige


