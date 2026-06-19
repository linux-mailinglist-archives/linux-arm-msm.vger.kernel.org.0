Return-Path: <linux-arm-msm+bounces-113851-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id T4Z+G95SNWoMtAYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113851-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Jun 2026 16:31:58 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E3846A66C0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Jun 2026 16:31:57 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=h6SqJU6T;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=LaPZW7By;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113851-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113851-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 4F47930095D7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Jun 2026 14:31:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89F5139F19E;
	Fri, 19 Jun 2026 14:31:53 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31E873A0EB3
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Jun 2026 14:31:48 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781879513; cv=none; b=sevRbAVQ63AqlJeUVS6xUg60vd0S0aQ7FljI3oGajpzd6jcCBdBVOwErkDzsqS7zUlOBoEsUuNXVDzP+aVpLgru2FEAROSUAp0wrJL1wLnB2fEGE8e4yJco8yk0e3hSYbbdSkFWd01TfZ2ndMAZocRXJzWfMq9PQPgfmh6gaqFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781879513; c=relaxed/simple;
	bh=LJdnh2HS0tF/xyGE8ExaAQswGjGzrHLipDvrQ2bYaX0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=szQKORyfyNPwx+EEnQMSSRWlBoIBN6s8/w5yMULXz3QpA4TCA9sOTmj7cp9JBvb4R5BwADIRm6y1wqR7Iog7h3+gEOPC8UIblhZGy8sRYXWR5Hsh9ZsQYMzWUmp7znEUU0/zZluXcnk9rvuDKWItPbuh7GYEQ/pU4eK0gHO/qRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=h6SqJU6T; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LaPZW7By; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65JDAamB175186
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Jun 2026 14:31:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	v1XXoqxMnSgXD6o5pvkQCf4rFypZQ0pr8ir/56ByDZc=; b=h6SqJU6TkKy+EuHa
	fXkxiTS7J6n5o4ve6mXweznkyz5mzC4OJ1p5SIKAXyNyn3iJ0Rel14jGZfuzXR4C
	YzGgDGuW3t7KCvYH7rUxsXQ5k7WMlwvy0M56jm1ht2rVj/iksjA8P0uJCdhihRxu
	uEFYgeI7D4lGP8+Xn/BfD8eUNg0WGWfBdherdlvONAz67ZQvkn95WABlx8r3GCVe
	Q/lf9lwzN1kPxfwqu255sIT0kzG03hXaKmoJZWKzxPBABweui6d9nFU+lcM4tkRo
	NPvaVCbvYQqv4+l1yYaKP1ExDyR5AoiK9mOY57SDRsgaNmTu2qzw1uBbfmotS9tq
	8MupNg==
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com [209.85.210.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4evkvf44jt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Jun 2026 14:31:47 +0000 (GMT)
Received: by mail-ot1-f72.google.com with SMTP id 46e09a7af769-7e6fe5ab3b0so308936a34.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 Jun 2026 07:31:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781879507; x=1782484307; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=v1XXoqxMnSgXD6o5pvkQCf4rFypZQ0pr8ir/56ByDZc=;
        b=LaPZW7ByxsOf1tVUYO+VPSCW1ZeC1txnSAaTFEowrSbrVZKIEldcM5qhP4xtX/nOUm
         Hg9SuXrSdWuPy/tawAJPOAT5z2IIDvySyScKfbmtOazT4sM1x6XY3TzFe8BwR7w0OE+D
         nle7qNqjxR2tpzbgnUufVdeRgl8WMa5cBUj1u2ItsTeJipCV6nq+4UNG0W+xc0rvf4q/
         6D5ux7NMqAXqpDlVf4VbNZqDDfbyzxLXVgtYxVMZEEVJX5nE8+m7B35EG2zcIpiKaHqO
         D5Nfa3qnt/JAxAKzzblGUdAfS931pM18KupAAzH/i66Ptvd/eU9lnGxSW6f/3F2GBVgC
         2eEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781879507; x=1782484307;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v1XXoqxMnSgXD6o5pvkQCf4rFypZQ0pr8ir/56ByDZc=;
        b=BKXNxvH5NpBYyD1b82OBMU9aBI/cdht4L5Al6IJh1nfnFe/+s4RhoV3+KEhmx/89NX
         SWYBceQNjOJFd1vZudnpQVYzv84YinUhcnE5lxDOGfzZBUJrKnOmlZF51RPT+Fwezc1R
         FsibXKfFQi59gGOYiBeF3RnJ04LNP0g3aIYYs6oIMARIoC+Ki2gn43MOaL/6y9a3q2Ou
         7QxeZVU4kKusvL3dUmm0g1z6qS1M2acX+Seg4aceUMa/9iH/ZhT/YoU7hPJA1RYuIG3C
         Z1x0EDZGC5LObM9ZX2iBpfys3MNfOjLI4id86iNQxEkjWw/uv7WIj684HmrmhePGv5N/
         sH1g==
X-Forwarded-Encrypted: i=1; AFNElJ9pzP0+KkbC5xlGqUhpSHC4b/LEtMUaPUkBHexpH1o2cqyi7R9bQn/fLFdBGpJIj1gFpneaczGnBuOQWhA3@vger.kernel.org
X-Gm-Message-State: AOJu0YxPYcZ0KhsSRRhTYupcUlGIuZiupIZjUYDvf/pId6tsv4PtAWyU
	EMZ4fo5uXhixXImOTxXIrShdMXo7LYh4uEKp2TofbTuQsfhKpuKTg/s0pO6IZemBpA5OHOEUbB5
	IgQPxhd7rvVo4pORyNe8vQhBX+OfxBzMPDsUl1K8zLjJxwuYf+ElPMvkWfCvAsOf8elyQ
X-Gm-Gg: AfdE7cmnxggS2aCEcik6MNK5Rxybun2w6y71RkAJE12/e5oLuuBeVWPL0xujCL9qEvC
	RITcnVWWP1k1j9POTvBBcn74Z/9uBbJ1pvAmr3XmHWoQS3fWGBQ8hAXHfIkNqlOmF8M0LD6hDAH
	6ytRTBm8DfOCz4yyyWnfJ7WNgY+IlH+ryv63F/wguiUY/+mphASIBfGx3UGZgqoQhww8B0/y3wT
	E0fZZJRnYMjmDRgT/XWhzIvB23WDkBhmUooydNNzUqVgyMI/QJrcUrs/4dJ/dM/XlMCp2gglvty
	xKvlKAG+xbyvtlsH3XpfkPijLMa4rD+YnN81gS2eGxeeJ48xMeg5ZBXJqRbB5JawdIrjl6dJkjn
	K2VMLBdoc7zUHg/R1s5GnF7HID19zxnZzNh4=
X-Received: by 2002:a05:6830:410c:b0:7e6:6f9f:7446 with SMTP id 46e09a7af769-7e92d9d0f71mr1516303a34.4.1781879506931;
        Fri, 19 Jun 2026 07:31:46 -0700 (PDT)
X-Received: by 2002:a05:6830:410c:b0:7e6:6f9f:7446 with SMTP id 46e09a7af769-7e92d9d0f71mr1516270a34.4.1781879506460;
        Fri, 19 Jun 2026 07:31:46 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c0a9a1568dcsm92462266b.51.2026.06.19.07.31.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Jun 2026 07:31:45 -0700 (PDT)
Message-ID: <45163c0b-e33f-4080-a424-9d0d8942a533@oss.qualcomm.com>
Date: Fri, 19 Jun 2026 16:31:42 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 08/11] clk: qcom: dispcc-sm8250: Enable parents for
 pixel clocks
To: Marek Szyprowski <m.szyprowski@samsung.com>,
        Val Packett <val@packett.cool>, Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Jonathan Marek <jonathan@marek.ca>
Cc: Konrad Dybcio <konradybcio@kernel.org>,
        Johan Hovold <johan+linaro@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260312112321.370983-1-val@packett.cool>
 <20260312112321.370983-9-val@packett.cool>
 <CGME20260320113219eucas1p1bc2f238b689c55ba256c4694eb067d35@eucas1p1.samsung.com>
 <2f5b98a4-80a6-4611-9615-ab0202a8c455@samsung.com>
 <f9511ec8-be32-4232-9168-00f967c29508@oss.qualcomm.com>
 <6e0d6119-c7ef-40d8-bf0f-6a5b6f6b00cf@samsung.com>
 <d4c1e329-78de-4d02-99e5-3e4887bdecf8@samsung.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <d4c1e329-78de-4d02-99e5-3e4887bdecf8@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE5MDEzNyBTYWx0ZWRfX/EyEvWmuyfRI
 EuaCQf/I1Mfm3BloilkW110yrZVARjmzE1qeGvHW/mRzArC6vhvjxDKcNLtFl8jKT1q6Y8Jf9TC
 7J8p9t7Ygpcz12ZcQ1fV673kBcJH/OQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE5MDEzNyBTYWx0ZWRfX3aZGeQMUXYJx
 mbwVMswPPbaBE5pouu1wVTNMvzbMxjnQ7XN5KdTPet8ZN+EHog2SE88QRv+MVai3cVcw57gbo0M
 HbvnkIR+PSLVC1UaUs15vpaenajXtIPfz1uKJOarmuVQvXPwY05aMBzfUxMR5FJ78nelQuQTgUj
 FAajAp4lT9vA15Ry0j7SfRk8yQJg1fIfFnDa9yyg+caGhl427m0XBqUSKgnSULIcEw01FuCUwzy
 7yw+reHtRAOo37Vi1iL49pClg1hVUV+oMxK/EqKSSRddF/i8hKAzrgw/KMms01pmdDDlPI5xuks
 2e1/EaG7wEeerOP85FjWttpRyv+0ctKFvZU+smPwziM2KIcXe1SZQhXs+4J/sz3kwkh86IE9K4x
 66qX3ssr29avJD/kwDr3vnBO4TxYbtU6mCxq1TAHIJNo3V+Zz0T5VCyzM43cixkU+aXgpWQGQ9g
 3h1EUChZWM1lWSvHQXA==
X-Authority-Analysis: v=2.4 cv=H/3rBeYi c=1 sm=1 tr=0 ts=6a3552d3 cx=c_pps
 a=+3WqYijBVYhDct2f5Fivkw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=CBy3kSv35Q_usJoEGC8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=eYe2g0i6gJ5uXG_o6N4q:22
X-Proofpoint-ORIG-GUID: rJ6NqhdESEcVQEA3Uqdq1HoAB3ovMrSJ
X-Proofpoint-GUID: rJ6NqhdESEcVQEA3Uqdq1HoAB3ovMrSJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-19_03,2026-06-18_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 clxscore=1015 impostorscore=0 spamscore=0
 suspectscore=0 phishscore=0 bulkscore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606190137
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	TAGGED_FROM(0.00)[bounces-113851-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:m.szyprowski@samsung.com,m:val@packett.cool,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:jonathan@marek.ca,m:konradybcio@kernel.org,m:johan+linaro@kernel.org,m:mani@kernel.org,m:lumag@kernel.org,m:luzmaximilian@gmail.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:johan@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,vger.kernel.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:dkim,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,linaro];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5E3846A66C0

On 6/18/26 1:37 PM, Marek Szyprowski wrote:
> On 16.06.2026 16:31, Marek Szyprowski wrote:
>> On 16.06.2026 13:33, Konrad Dybcio wrote:
>>> On 3/20/26 12:32 PM, Marek Szyprowski wrote:
>>>> On 12.03.2026 12:12, Val Packett wrote:
>>>>> Add CLK_OPS_PARENT_ENABLE to MDSS pixel clock sources to ensure parent
>>>>> clocks are enabled during clock operations, preventing potential
>>>>> stability issues during display configuration.
>>>>>
>>>>> Fixes: 80a18f4a8567 ("clk: qcom: Add display clock controller driver for SM8150 and SM8250")
>>>>> Signed-off-by: Val Packett <val@packett.cool>
>>>> This patch landed in yesterday's linux-next as commit. In my tests I 
>>>> found that it triggers the following warning on RB5 board:
>>> Hi, I was clearing out my inbox.. Is this still happening on the latest
>>> next?
>> Yes, still happens here with next-20260615.
> 
> 
> I've just played a bit with that code and RB5 board and found that this issue
> happens, because enabling the DSI PLL clock fails for unknown reason.
> 
> 
> Here is what happens just before the warnings (I've missed that in the initial
> report):
> 
> DSI PLL(0) lock failed, status=0x00000000
> PLL(0) lock failed
> 
> It looks that the generic clock code doesn't take care to properly balance
> enable/disable in __clk_set_parent_after() when enabling one of the parent
> clock fails in __clk_set_parent_before().

Hm, indeed.. Interestingly the return value of clk_core_prepare_enable()
(defined static inside clk.c) is never evaluated, across all of the calls

Konrad

