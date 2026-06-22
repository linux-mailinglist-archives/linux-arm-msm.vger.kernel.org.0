Return-Path: <linux-arm-msm+bounces-113970-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id DtlBC0kUOWrxmQcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113970-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2026 12:54:01 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CD5406AEE46
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2026 12:54:00 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=e2FqgVmA;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=PZFV0yQS;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113970-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113970-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 56A8F30233F8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2026 10:51:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F301F379C40;
	Mon, 22 Jun 2026 10:51:51 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F93E378D74
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2026 10:51:49 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782125511; cv=none; b=potiaHy1JXms0o0lv3X/phtlrzJ2u0z9o+Kl4ID7FQjISlxU4Lcr+nqNwQh3c96wSMH7fqdqQ2tDwwrHJYA3b3J7doLb0ZammmkrgR/6nf/u5m/AxGUDXFDNXJ9qF0UAnaXF1GWJjVNinKc0/xBBZeQu8qpYuO3K01vXBnt4dks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782125511; c=relaxed/simple;
	bh=VaTOs4+4dswaW+DNkYBuLLXmhZgxYKZKmrPqfCpTn9g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=s9JulSJ1vFa5mKctrpHHecqVZIghMc1oTT0AAunr9rnzGJL/3Evk7GuEIlacXPqVHef5LRiZYtXqF0zBRD8K5rxEUOCcekdE+Em/pvMpO0J/Kg58tX0H4C54iwmYniuxWKgD2PqqqJcXtQVYDim9nxk3cUmV4MdWdxLJCOl0eoI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=e2FqgVmA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PZFV0yQS; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65MAmspm3213358
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2026 10:51:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GRWuT4a/W1vHiP4VCpkpuuEyUOBb8v5GbViwADDHBes=; b=e2FqgVmA5bq24dvf
	+1jGU+x1GyYipkuo0cy56ZQ644oRopGsax8AyF29bFkeHBqE9w1+qlI2c0EmxZK0
	PFNapeE3iKIlKfi8wy/m9LZSE55jKci8vOo4R2rq+/TwtgkPxCyJ97J99xflP7WO
	m04BUSmmw5NR18F4xBFNZbljZNZZQvqEF2PGuZyTyEyRFRY5fPjCa1zjlUvswQQ7
	RgzgoCUyRy6PF1bx6AwSXj6+vbYs8KQp83trV9lDuvjIWneUczrKfvK8Aey4RPHQ
	0gQ98PWEkoHzIiJwSVk6hL7JXvMoT07aaWkLjYIbyrCeAxJ2Bn6ED2fktu936agE
	20lSCA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ey2yhr5m5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2026 10:51:48 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8df7f21069bso6096716d6.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2026 03:51:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782125508; x=1782730308; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GRWuT4a/W1vHiP4VCpkpuuEyUOBb8v5GbViwADDHBes=;
        b=PZFV0yQShfxhLmiV7+sD9tQTJgostlvZtVPqTAyQCD+2glXSIS1M85KaGAkophZOHq
         QjMdYOx7HRKDIsK80Kcldk1fOY6oY5d5GfjgAT6WvQXgrxiSGeAyL7s6PlbikkYQg5x0
         4Bk38PwFSpmqXR2YWvtDJpwE2OIP8SVaHJ7SVq2o5tT7vF5PzlKQcQDCbDHz5OURhcsM
         ADGbAnMp57LLJvqJnd0V1ZpLmFaRGOCTiI3hZGUi01tLaUPFI1KBzHmxjn1Apks+EdRm
         FK6UdFIFDQTGgIjthpMmJclxArtykqvBZjTTQC7CQstv1Am6L2hPg2gx6kMiaXfN8fJS
         4pXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782125508; x=1782730308;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GRWuT4a/W1vHiP4VCpkpuuEyUOBb8v5GbViwADDHBes=;
        b=YfKaZVqQ4OhczxvqGPD92rOr4171fTzU43g1rDtzqqnBwqxCmEOvqGhWl7hpEMB4tv
         2RG0e6L6T3n3mn+N1QWIAD8aDpkZd+bY3GYeqXtxzS8imCmWGB0/uOrjV5TMROjwYBre
         apxSXBIbE1+bv2Jk+OLBUyj7XGvFbxKdnNcGJ3ikooh4ylODOsvCCRa2WyBid3OYOYZE
         ux+7dGcnJK/njNHLlVDobVb00BjGng/ywR+TRR5ituaiDHZejjgOGWf91wSSs64sNEA8
         3feHPn46aRhS0yept7uLhe2IRA18aJUtqV0Ok/riZhFC0wjyXaAao4hzVtV8WCp6+ApG
         LH4w==
X-Gm-Message-State: AOJu0YwG+ywAkUgDVcQ9OyJj1Fqgw83BkjtXeYvikO8m47eSbWOxNTA/
	fm4O1QetuD8oUYgRcMvpxa7x50KJRS0YExrurqpKHMUFaDNVyF4f+PEjrYDXLBTNI+R2D5B5YGi
	9bynqHojM3DVEwHbdhaYZMJOvt/GhHGTb/XZIbYXLMInehpWhTqen0UoyLVYt3UENU3t+
X-Gm-Gg: AfdE7ckYTR1HsZZx770/cySawyEYY/oOrRQl/JMNKgxPtUy9DxX6ryvy6bDMumkYCfE
	DnSt4OxWisQbwKSNyTBkiTDV2eqYeQTTesQY88Y27gjjWP09yiS+WOzNiGHshhyDPd36EQEaqXe
	PDoTC6EnsWHtQ6NkypLNom71qPkDwJvNHAYY//BnUVD5NvL2aEkozx4niDwKGs/t1ZVJM9uO2kY
	VbTXBWTXHmDJtEbr89ZDPacBrQ+BUiHfKGxP7mXLlAwuu6uEeghnNf57pW0+rZwZhcd2rGSr7TP
	Th5JkyRMP31eV4iHeMLTX3eEoFDrwDe5U5QDFeI5iRCjZVGKtL5Ft4LqlIwuHuT41jZbUw+Bl/+
	sFPJsUbM+1VThKEZ12pxBsdxwXVp9ePVhnig=
X-Received: by 2002:a05:6214:390d:b0:8ce:ddd7:39a8 with SMTP id 6a1803df08f44-8df4837bc2emr116348266d6.5.1782125507666;
        Mon, 22 Jun 2026 03:51:47 -0700 (PDT)
X-Received: by 2002:a05:6214:390d:b0:8ce:ddd7:39a8 with SMTP id 6a1803df08f44-8df4837bc2emr116348116d6.5.1782125507321;
        Mon, 22 Jun 2026 03:51:47 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6977be31c73sm3009575a12.17.2026.06.22.03.51.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Jun 2026 03:51:45 -0700 (PDT)
Message-ID: <6300a2c1-fe20-4573-b65e-cb1ecf3d09b9@oss.qualcomm.com>
Date: Mon, 22 Jun 2026 12:51:43 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] interconnect: qcom: add Maili interconnect
 provider driver
To: Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
        Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>
References: <20260622-maili_icc-v2-0-18b5ac08c04f@oss.qualcomm.com>
 <20260622-maili_icc-v2-2-18b5ac08c04f@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260622-maili_icc-v2-2-18b5ac08c04f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIyMDEwNyBTYWx0ZWRfXy6M99qc3DiSq
 rDknykdbrWGjkdWrrzqnc3yid52ujRm8pxAVe0IQCCxzBNfzKRroOCcnvsnXm5mMBOqvEoWqk1d
 Yx8lF9/qCNjmfd7FvplKSImH7k4eYRA=
X-Proofpoint-ORIG-GUID: cj683ZHOKVzdHSyCmbp-0ZerVf19aSzn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIyMDEwNyBTYWx0ZWRfXwhktkkfvJkDP
 sn7FG+jBsUM+GNA5pDXO1iojxlVE/gSl1B50mlGi8lB5AStT4vAEURDHUqNqQG6vRiNtZhTknRA
 fkDK+FSbWTUpVvjyU3jn/hBgNLrHHATRCh4kQsh+eDmKu+7p6Xld3dr7dGCR1qW3nUcVg9aSYyW
 htsZu1iQUDBUi8lm9tBiUKt/1lLWctYLP9gHNcv4AeH6wu9bcL2PpVxivGHMHPRTlfrjw4YPDtc
 eaBEmnO9gFhz1jnkD7yvcvY5Izf/xKjd4H3Eaqb0y/88IM5Vi7t5dk7A6aqbhj3xD/TwFXic2mC
 3Bgw/X0qvGLK6VrnWJLBZTbYh50llmaAHQN90e+C1RH+/XCgmsKC6/JOzycBRpKyoJvUTsA/u10
 Ojji+BIQUl2Ar/+jaDqcenll9T2MfYkZnWHpZGzQx5AZkzTmqo3pMRCANgkQzBWvV5cYPwU6wtu
 2cs2X3xiHHXPLUOOO7Q==
X-Proofpoint-GUID: cj683ZHOKVzdHSyCmbp-0ZerVf19aSzn
X-Authority-Analysis: v=2.4 cv=cKbQdFeN c=1 sm=1 tr=0 ts=6a3913c4 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=C4gMAf1nVfw50XILYHAA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-22_02,2026-06-18_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 adultscore=0 phishscore=0 spamscore=0
 lowpriorityscore=0 malwarescore=0 impostorscore=0 suspectscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606220107
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
	TAGGED_FROM(0.00)[bounces-113970-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:raviteja.laggyshetty@oss.qualcomm.com,m:djakov@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:jingyi.wang@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-pm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:odelu.kukatla@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
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
X-Rspamd-Queue-Id: CD5406AEE46

On 6/22/26 8:34 AM, Raviteja Laggyshetty wrote:
> Add driver for the Qualcomm interconnect buses found in Maili
> based platforms. The topology consists of several NoCs that are
> controlled by a remote processor that collects the aggregated
> bandwidth for each master-slave pairs.
> 
> Co-developed-by: Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>
> Signed-off-by: Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>
> Signed-off-by: Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

