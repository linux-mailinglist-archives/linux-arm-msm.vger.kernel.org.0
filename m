Return-Path: <linux-arm-msm+bounces-111778-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id SZN0OYyMJmpVYgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111778-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 11:34:04 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 40A91654A1B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 11:34:04 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=O99SheKv;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Pc2BvqTo;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111778-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111778-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 79FA5300E70B
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jun 2026 09:27:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21C13302146;
	Mon,  8 Jun 2026 09:27:23 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF5C235295C
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Jun 2026 09:27:21 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780910843; cv=none; b=UTb0bltu6UZegwMkJMayjx7VJKtZ+GeChn1rcJxqnFXpLIbpwQ3fAGXp1cqhPT+0psUD6sSDniF5aqi/StA50OzkcCP+Fv0gHq1yrUmHw7yI60G9WOukPHNMJoAYQqyBLgUQbr8tnxZbosdPnfXE+GWfILJQwJ/EuptqGSgjfi0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780910843; c=relaxed/simple;
	bh=vtqs9b/nCTg7Jdo+I3HvK36EwG+bfIQaRz9HpBO/Mxo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CADmCKpSCxA1StCHiHbZ6N5NreY+85fx8uGF4+2+aTeF3MyzXPmtvimFg104aLeyEjqEyIOK7pdvO41tOxfeMiBL1J6aa5b2YsREphVZwvhuBbILOOhDW4Y4VJiJpK4qZhDIYMozdhdCbEuG4srvrEayPBTOohSR9rHqo+2jkQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=O99SheKv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Pc2BvqTo; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6586OlhL2382908
	for <linux-arm-msm@vger.kernel.org>; Mon, 8 Jun 2026 09:27:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kX85k3rL3r+ScToe/ZghRHldTzTEj8XiK57rN6oEbXQ=; b=O99SheKv6wdWPUQx
	8Hvzl9CQmZSlsGs2FaOdVl/1YOHJKpOilALJIbnsY15QRzVeU+1gKQEjVTrAXCJF
	p3xFJ1IK5Op6wR8aG0UZd+XBY1Jz/Es60XfaEtBk072o5ZlAYc5WqwAQnnC5GKRj
	CR9xNgud38JkUXb6q8mPW9ApZCdqT4qOU4gk9NBZGY8Bh3gYKMN3oxBFX9zVcgmz
	v/jxDaLQ8N4Y/HmZdhzSN9VRWzINz4D+ZvtNzVrNrWbW9zmLnajsHwG3sBGUcdVR
	Ljs6vULYodnRPTZXfi4BWHTCnsTyB3qQys3KNJp9mbBxCG23ZlMsJrbIRaozfTMG
	4KY9Ag==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4em98cykfk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2026 09:27:21 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5178ac43d27so11514531cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2026 02:27:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780910840; x=1781515640; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kX85k3rL3r+ScToe/ZghRHldTzTEj8XiK57rN6oEbXQ=;
        b=Pc2BvqTohvoEJNr2NfYN/zioQzt8aEXpMXVL/uep8yhiK+mn+GVTC4E4Ziw9j2AHcC
         DQdyB55k8LUQgW0bLCNRt4PDx6Gs5wiJ51jJgbZNtQsZW5dwfJTO2gXWKOmNO6tk89W/
         ulvQTdEWTOfWzYNY/zyMCgcY456MWq9faLdueT12/y1HUc/0ifLAnB9a6917YpyeU0GK
         Ckn+26xTkVK8ONrY43Hfr7AvUMwxQst2uekual1Yv0Xwt4mSF0ThPJZdqsyBk3j5DH3f
         AZAJ6Ulfk9S//eec0PqE0grHGkX3yWM5ONK110uNMDxM3R+t7x70Yyoy1zfg8guuVrbM
         pCXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780910840; x=1781515640;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kX85k3rL3r+ScToe/ZghRHldTzTEj8XiK57rN6oEbXQ=;
        b=MN1Z8ey31tdWl1G+K2j7ix3DBsup8T/J0eZGguhV2EFar8hqcAA6R3raofQe8EZWyd
         j72U8Q8WX7pVV61+NNeno5B4S6lgfWRWqabaGwzRg95ii14QB0YTdPRaCtVpEbOogryX
         /GwqbBH6q0cflrFAVKdv912K2MJihI5N3ug0qWEPCZOuFPDoDt5XWzxogdXDK/OLb6HR
         8Pz699fupoagtxkLrKiVAxiuMLxihhm0dmvxzyxiEumZwEc5KHvuogBIf2Y2A+HfUveO
         vPiM2IgttO8AuG8p1YfGDEJ9rGKiSlg983bMi6pDH24RaRL2pwS85bI4qcnw+3/P6ZlJ
         e7XA==
X-Forwarded-Encrypted: i=1; AFNElJ/9FYNkBNtpLKBXkF+WAIzMPvtTlhK51UuSYu1YA/IFvafyK6e1MTzhW1kLyVh2K6KxNeIUnQDcCKgMbFz4@vger.kernel.org
X-Gm-Message-State: AOJu0YzOJMI0tdIQZVvUx0Fhd6ffyWhjWND97FRX+Lmi+MQrt2C/Q4lT
	yhHw32nkcR+9BL7fTwjk7tYQrjAO36aIASbI/Kz0HlRDoOpsu873IksMj8Jz44d9j0TqGPGTKKs
	ofVtUApQJ8jRYWuE9imMOBI6Hn6fdpmOlBApCKARTlF96nuh1kq14ajLW2t8h8mzJAqbl
X-Gm-Gg: Acq92OGoaGIm1EIWQRHipkaAxmK6VlwoGRW8drY4C125v1J/TVk42IxCOuzW4YSKoOq
	Zw8ohK8P4+dde7muoO0KtGMCXypDGDiIAddRdIjjbKqNIjELDkikWfLcSq0/PKqjck2E3nJjMIf
	GHlqZDlMVUaI2QHt2UvtxPdR64pSdi/j2ve1hh03y3j0XW/EQ7R7hvZmtfvS0qwDGRFjrWB3811
	wMyFSDNMUX/d7o2Ut/bI8FWkrjI96XtMV3UAC7g6QWjvNFbUJLTrqbqUNbpaJNjM+D4shd/Ru+E
	+LPvIXKQq5+gc3SFsV6xKtahCS7RWrRI/ZZjUbMvsbqSAZb3JKwnFThFQMQWzhHghW3EUVk59Lz
	jzD7v9aXBL+bwqaVutQEw6Qxk2r5OrUjoBANa3QywS7WIEJ9ughphcdo4
X-Received: by 2002:a05:622a:120b:b0:50d:9138:3322 with SMTP id d75a77b69052e-51795bebe2dmr138740091cf.7.1780910840326;
        Mon, 08 Jun 2026 02:27:20 -0700 (PDT)
X-Received: by 2002:a05:622a:120b:b0:50d:9138:3322 with SMTP id d75a77b69052e-51795bebe2dmr138739871cf.7.1780910839954;
        Mon, 08 Jun 2026 02:27:19 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf054dfe3aesm841409866b.37.2026.06.08.02.27.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Jun 2026 02:27:19 -0700 (PDT)
Message-ID: <77797477-a6dd-4704-b441-b39b0a3c5e5d@oss.qualcomm.com>
Date: Mon, 8 Jun 2026 11:27:17 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] clk: qcom: lcc-msm8960: check
 regmap_read/regmap_write return values in probe
To: Herman van Hazendonk <github.com@herrie.org>, sboyd@kernel.org
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260602045002.290918-1-github.com@herrie.org>
 <20260602045002.290918-2-github.com@herrie.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260602045002.290918-2-github.com@herrie.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDA4NyBTYWx0ZWRfX5lBFH8E80oUp
 fDouwg7mENCkDma0hi5neMAFJRyVZvOISdfII/IXGX6p/HX+Qjr3oQlGBCHCBQYPtBoNfpSnQVy
 KeJNXOnzX5ztKs/W1IddZ3kbS8zA8jueptMPmH/dWAXlpmj4ycHy/hnMxVP4pkvXObSFjEAjRdH
 xKJe3pzJ0TcgDzaxVZTTDeAr8ji5+uQGk84e3RhuJcCkceD59+YRj0NZzgJo0IfQcp3Jpf1KS9p
 azaDV8+7SPohAXn6qvxY5RAz/qB5o+YFOEU626uDWMkkCJfRfQkkwH5xPH+Z2S+5giMnNLGwYHH
 PcGQARoWeHyXr1hCVRwA9TfbtVmKo1Twe09DW+yvqKKZ/cGcljQoD3ZYoeNc5z/ld+1k2TUI2ji
 +ST7pajumokL/Db4GWoH+i7z/d8yWY0vUbMzQB0BSxh6M7AhSIVd1/foUu0qXcSqlOQF/99mT/2
 /+atOs0ePTqBrUHIS9w==
X-Proofpoint-ORIG-GUID: nl5kuLcZ0WvlIgmh_PXFi0UkUDKvBYgH
X-Proofpoint-GUID: nl5kuLcZ0WvlIgmh_PXFi0UkUDKvBYgH
X-Authority-Analysis: v=2.4 cv=A/pc+aWG c=1 sm=1 tr=0 ts=6a268af9 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=cTwmTnRGAAAA:8 a=Ut5rIDj74-HqtMDnOCEA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22 a=GUWCSGlMWfG-xDt5EnV5:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_02,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 spamscore=0 malwarescore=0
 adultscore=0 priorityscore=1501 phishscore=0 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606080087
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-111778-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:github.com@herrie.org,m:sboyd@kernel.org,m:andersson@kernel.org,m:mturquette@baylibre.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 40A91654A1B

On 6/2/26 6:49 AM, Herman van Hazendonk wrote:
> The PLL4 L-register read in probe was used to select between the 393 MHz
> and 492 MHz frequency plans without checking whether the underlying
> regmap operation succeeded; a silent failure would leave the rcg
> structures pointing at whatever default they had at startup (the 393
> MHz plan) and the chosen plan could be wrong for the running PLL,
> producing incorrect audio clock rates without any diagnostic.
> 
> The unconditional write to register 0xc4 that arms the LPASS Primary
> PLL mux on PLL4 had the same problem: a bus-level failure would leave
> the mux at its default (PXO) and every downstream LCC clock would be
> sourced from the wrong parent without a warning.
> 
> Use dev_err_probe() in both spots so the error is surfaced (and the
> deferred-probe state machine handles the EPROBE_DEFER-from-bus-arbiter
> case correctly) and the driver does not bind in a known-bad
> configuration.
> 
> Signed-off-by: Herman van Hazendonk <github.com@herrie.org>
> ---

Can this happen in practice?

LCC seems to be a device on the MMIO bus..

Konrad

