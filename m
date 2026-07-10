Return-Path: <linux-arm-msm+bounces-118191-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 2ML4AgSzUGp53gIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118191-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 10:53:24 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D1DC738AEC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 10:53:23 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=NLPEk8Ku;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=dEmSexwu;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118191-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118191-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AA61A3011F0C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 08:45:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60B3227E07E;
	Fri, 10 Jul 2026 08:45:53 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A6B2372ECD
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 08:45:51 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783673153; cv=none; b=FRcrpyHkNNqioOV/wb+hJ7Kqg7w4QJ8Qdq3t84zvKafZTKlVYLvpNd9SKrIcDUALhJjDS8ufkCiKgenX8oMWSEAK3rbuIkfUQCwBjWmXm2LptdKjji0WYxYhGEMMn+8ue+/E8RtKxlIABMxvLGHFmRqJ83/v90r9OoL6GuYlNYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783673153; c=relaxed/simple;
	bh=93H6QnCZTWco0dDKzCEqp+f1r3474kSBPomyp0+wnns=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VhMTlrZqf/IXi9+S0LLRxyXTbJ3i1xqXg/Us357AHRagoCacKLEyF0H61i26Gas0gx1QIoiWmU9a4prG6XHNNtdjHQ/AUHTCCDp7YoY3dwMUUe/9CTgqgPZWa7SJjH7Fd140WH3oHPT6R5unYfa9xYvRrAoV1DY1AxiMZ6kq420=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NLPEk8Ku; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dEmSexwu; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66A7dfFN000391
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 08:45:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	92BYDITXUy/lUIpojbG4HaYyj+mWGh/4KTP7YRWB7Oc=; b=NLPEk8Kuh+jFvg7K
	iSp/0ZSe1/Rm7g/xZm1arUFNwRVANAL3AAJvGpTNyr6egouHIIRWrg2+oaIIIKy4
	tSTMD254zOj2MCZHLD0dLDuOvY8nLvFDgtXWzURYBQMitbmTiHEXEkHyQhJ97liX
	yy7cq2X4OuwKb6J7z0tb2S3a0iTzVpWUd6MAl7Sy/r+PZ8oRWQEhrKAgyIx9KE9J
	nBAKdmzWYBtDu8CS0Enq+bNElhogs3LqM4ZHLZcqFth+p5J/le7RvELKSue5OP5N
	R70KJnQVB9hXGNYvee6THGQ+IeCkKn0CzpbzbtgkhfF9tvkk/tbiR6xjRQhpFW+x
	IWF4Lw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4faf24udvb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 08:45:50 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92e69a569ffso21665585a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 01:45:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783673150; x=1784277950; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=92BYDITXUy/lUIpojbG4HaYyj+mWGh/4KTP7YRWB7Oc=;
        b=dEmSexwuYS+pL2ph9W1A/BZBM2t/10zczlJQnUDp452TCLDIpOh/+IVbxrd36pW+r0
         FH6YVn/M3DPDTd4mmI/F+9TC7StplgXa3j17slbEF1atc5xte5xGk2fwvLf3A2q6ftuO
         6Nw3jrt58mQMK6hiN045zmj9gdL3dHwkZS10owNYEOxqm0Y3nYUyzPiWXqa6lnC7EBKs
         gouAvp5espEur57PhV1q/uwX5qCmOBxkIKUD8grB3ZZv/qQYTfZ8Hm6XaFMZkoZEnJb7
         VXhvrXB0/AKJHTkCG7FybvILVNy1XMvqPujIoRT5soqYZ7XDmicGQBTYl3szzZGXi76x
         y8zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783673150; x=1784277950;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=92BYDITXUy/lUIpojbG4HaYyj+mWGh/4KTP7YRWB7Oc=;
        b=go/eoSeCUEsu1P9RCOmaPj1bmvwa1AYMNM1M3NBSuIX9mIn06b3thdhdhTfmtLa1zw
         kLPhhPYdNdITC2g36R8Wdfp3+9bLFWPIdfS5a5Or1KQkqBu6koxzKNOX549OadZEax+8
         jCEX8at8VFDPBZFFy8pumS1Uidod3IdzyoHMipQ2bKHWm+Xo3NhphVDR6HN32TjAUJnb
         6/9UszjsPCMhcxRNA0aizjlG1ZHLsm4HRk0aKjUiOSpo/fb/OKx+zt4CvC5oEOw7I7W6
         t0eZZ5zJzyIlYdFHDLb8LkjwU7+E39mj8cPmIqRI2LgASD4NiuSwFMey/JR/5RLDgrkc
         88Tg==
X-Gm-Message-State: AOJu0Ywiv4zYNlJHMI8qmwgu/rZMt4SnCMxf9zKEcGdBEbMomOn2bHdu
	EB/WDAuXV9Ie32tju3404RzJdMeIi7/udHPLUvzjaKKkZDDRqqAJk41gC9Ml87hyLE6bOfooYMx
	uZ5z8wIcbhFPvOlVVV1BQWstbquBIMopOXpov6mViH776mv8LARFwe4fs62jIyXOub4k8
X-Gm-Gg: AfdE7clGpDsdUawEUbGih0hZdqSgIPWC8ShgDHfTJdnRziO/finlqi+wahdpW7a9Szz
	JMqO80gmImk/RbB4hnMg0Q3mAPsg+YlTbJYIT1UQ0SGotKrKXMhrp3lTzUAvRFMY/l8j2jtZxJb
	5taSYgayHuY5d4A5tEq0FC6ityvnu7kG9e6aEljHWDM/VhE49IgtNqxY7N6NVXXIE9v449kZRjs
	+KGJn/ManPGtX5+/oTEjBbQTFZCj5kUh4VCGE5pCuBhgyBJyz4kUfMCNy/Kqh+pjYZ0fxkFOs4O
	OTWq1C/34ZTdBVsTY406ZBNJKUgYQ69NRpxjnZAJKzD1LzPkqnqbW71vCkoW9kv3hLuKxqOW+93
	evbOf0x0pNp58r10AhFCZgNzm3P7/V8HjJTU=
X-Received: by 2002:a05:620a:19a7:b0:915:fad5:9096 with SMTP id af79cd13be357-92ed7a2f551mr622063985a.7.1783673150337;
        Fri, 10 Jul 2026 01:45:50 -0700 (PDT)
X-Received: by 2002:a05:620a:19a7:b0:915:fad5:9096 with SMTP id af79cd13be357-92ed7a2f551mr622062385a.7.1783673149895;
        Fri, 10 Jul 2026 01:45:49 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15c3f5ca3fsm415859766b.51.2026.07.10.01.45.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Jul 2026 01:45:49 -0700 (PDT)
Message-ID: <e233721d-5e84-4edb-95ce-596f12cf557c@oss.qualcomm.com>
Date: Fri, 10 Jul 2026 10:45:47 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sm8250-xiaomi-elish: Remove
 camera_front_active pinctrl
To: Xin Xu <xxsemail@qq.com>, andersson@kernel.org, konradybcio@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <tencent_AEB4238D8669271E5C1CD19C2C61A45AD108@qq.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <tencent_AEB4238D8669271E5C1CD19C2C61A45AD108@qq.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 3nEaegftIuzo7B8FxSOYRDk7L1M_5XUC
X-Proofpoint-ORIG-GUID: 3nEaegftIuzo7B8FxSOYRDk7L1M_5XUC
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDA4NCBTYWx0ZWRfXwvhtJfs4zE9y
 u7hK7V0AqYy8+r3GxDWwF/w2SB7iFWvvbv2lmbTJbDjDVH35+ozE42ekkLRBs6sS62CRE5QXZnE
 hW3aZT86roMulqe46r1wm3lcq0ItmcA=
X-Authority-Analysis: v=2.4 cv=daKwG3Xe c=1 sm=1 tr=0 ts=6a50b13e cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=dZbOZ2KzAAAA:8 a=1iJjRMtDBWalc44gueMA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDA4NCBTYWx0ZWRfX7o1XVLqUfFvL
 W+JNN1Cz/redDbLuG/bJMns9uoQJ1KpBlswgAYsJIjCTQYS4lJbeEoMTz5xynTiJBocf3OkL1CR
 T+ziQsKb80hLqCiGXpeUdgP/BYWdX/XS1vgtxA7ZwwwLEE5TOMijA3iCbUnKSoxMoVcmz4EhaVT
 yk7izmvxsWkoVgIWPFeiRruLHGCZV8NcZgNF0ztVokpHUWRtkSI+yiuP/yFPREa7Mz7CbY86kqi
 KfhA/buh8VzeY3o8vVsuaFXd45V1A2SMVdrbalznAvTu91AP0XqCrZRGZK/25rxtiVUEjgiO/on
 wbwyM47AxPBR0/8v8cpYlI5BEysKawDE4ZLUp/7YilWk+wsiTXlbP8KwLBWwRlt3Bl7XvKDWxpV
 EA/4sAmiGlEVaFLH/S+jhniXHgcKl8qpgLRJhFycJ/i80tV8KSlwvHztg+UdyI7Rcx0pCsGCe2o
 WOQomRsZKAOoyaMsqkw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-10_02,2026-07-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0
 clxscore=1015 malwarescore=0 priorityscore=1501 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607100084
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-118191-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:xxsemail@qq.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qq.com:email,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[qq.com,kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4D1DC738AEC

On 7/10/26 8:22 AM, Xin Xu wrote:
> Remove the redundant camera_front_active pinctrl node, as its GPIO 109
> configuration duplicates the reset-gpios property.
> 
> Signed-off-by: Xin Xu <xxsemail@qq.com>
> ---

The reset-gpios property lets the kernel consume it as a GPIO.
The pinctrl state ensures the correct pinmux/pinconf properties
are applied.

Konrad

