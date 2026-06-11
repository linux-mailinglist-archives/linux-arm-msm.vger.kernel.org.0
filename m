Return-Path: <linux-arm-msm+bounces-112739-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id DjkML62dKmrJtgMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112739-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 13:36:13 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1485267165C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 13:36:13 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="fiw4/e9k";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=SyvOk9gl;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112739-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112739-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0DD953128C82
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 11:36:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 643D33CAA49;
	Thu, 11 Jun 2026 11:36:01 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2718E3E7160
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 11:36:00 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781177761; cv=none; b=LWwvq8NgL9wB0WJZ17bsdyByPPeInGueQ2cm6f18otAuXK6Zt18a1ZSCM7U8CwUWrGpbTRpkieyLCtErUu6T8jchX96WALFbAkq0p5B2XgCakn76LmuYt1kR1vFqhQdtnNXYK/okrl5VMk80JA1XJLHqaGbwfAHUO/e5Cj044mE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781177761; c=relaxed/simple;
	bh=6U2EpQbl70iTBwLkHktdUzi2+kfxjlaFpz2VtqrjLCo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=A49iip71Rfb7ZVpgvogfDDARl4/3k+o0UTz8uLjxTmrR1glUHToJMDrdxpVCRu4egLpgGOCqLD0j9lQe5QMlJ47HleOoW0S4ncB60gk9cVK2qz0X30xcCWjqZwTKwJW5iF4zmUvpJwvw0XHjL/SsGHg9D6raH/ibEzEkLLMSRY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fiw4/e9k; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SyvOk9gl; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65BA10xs299643
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 11:35:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qoo66iTrH2qXAXuURRiKTypPfoX3zlqywZjiMI3hGVE=; b=fiw4/e9kllPWMbLU
	Ie2uDVEGZV4NJR/mKgCJ//WQf10ZCDnR2T4MktsE5LCmKRRv1D85s/f4y/YWenBU
	I7Z4AWLsGVKgi+MBegyrs74HhzkqT9DlASX+itJ7DL2rSRTmx/x8KIDVVsKuJNN8
	LJAmk87lIWth4ZXaVCwe0rKzhz9E1r1SkoxY7K8VAt0aRXKYOgDJjQbOFYKi5hvd
	twOg7DaYC9X9xFDfvVHPF9TxKPrdyH7Z8J8u7ROpKx6ajcmFBhdTuWeDaQPFUXml
	LgHKnkmFDfcGeCbpzrBZw+1+s52GJBU/BvuTtQHiM6MEc6oCtas5dKzI4Z1yeunD
	mGlPCA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eqe70353v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 11:35:59 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5178ded346eso15809351cf.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 04:35:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781177758; x=1781782558; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qoo66iTrH2qXAXuURRiKTypPfoX3zlqywZjiMI3hGVE=;
        b=SyvOk9glSmpdNhrZbZ12rpr3sF0x1E15B3BmEEz9BCrb65wiSdKu/f91g/fxAvKlRA
         yZu50kbprCIWTOQaPAlK9UYGMvh0morCwNRAnZrIt7EoA7dBTum5IZnCZNhZnqFiUp9I
         JJbsM+5eRZqnypxgzlIhtGfnRPkZG0FQoRaENkzR3nIqa2As/xZ3Ds+tuNCG8pxdW1HB
         tRHoHUOJBon+W6QUQpXRZduxmxNmC8W/YMMYe/O03qAVkCKVxGm1hlE3y6dc2pFaj+Wu
         7//yYyfccYGmCKK9OFcB33tK5y0jrnRhuvBhWwBorof2v3c4gA1lRs6a+c4zh3ianJuD
         Loug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781177758; x=1781782558;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qoo66iTrH2qXAXuURRiKTypPfoX3zlqywZjiMI3hGVE=;
        b=fHrgeRQk1tPSjNcnBSBXeP4ocpj/NRBFMdACX81to/VJ7PKTxliWvbJb0hV86bP5M3
         LDYtWof801wfnN4ndyAOYsNW09j2V7YLiZT1nk+g/Eb46JePGckxsw0i5KxVzyt/48N1
         hdR1oE+oL3hTPsK2AMhhMEU8GLY1x5JqH/J1Ct7BdltjR0PLtdD8s0LDITxI88fFmGWE
         hk6fDe3eTTEqBkurz/r91xZeiKvyUCF+TVWoJQcizDfvZEnAmucro78fktEB1/B0kDus
         2z+reHZoQZSRGhUGKO0kwcVvuMcQofiR8nIZjRSVhkqD8LzL4Uole68kCihYQkDEOQ5E
         BL0g==
X-Forwarded-Encrypted: i=1; AFNElJ/PK2drZ+Ic5CZlURaixRLJVNfubzKP499IUhb8KyK2OIc9RcMdOZVwLEEEnp97L24MBb/5cbtGgxWOIyAR@vger.kernel.org
X-Gm-Message-State: AOJu0YzxWAsoMSTWxYx/K+JSPdO3epVePFL1EG+jbKRccEd58o2UQV1j
	pylXSJqXtlYd1lKz5YeYdyy+GUTqvvWiMINmJvjw7VLIwe3fW7rEiRI/Q4glU6Q5g6J/ZtXT2U4
	ZSDpXc95MAPZ7a9AS/loHwg9LO90qi5j9JJESDvvkfayzn3Upd/LkSK76GAEzzf+wYGOi
X-Gm-Gg: Acq92OGdWqHnIX37LGvbt2uEYsm+q3oekn6Zc3lpaC659avJ/4T3YY41b7quQPmigv9
	+PeMAUH6eChEVzgUkW3/P1EvQ3NbUk5QeFsWAE/lsWK4XtlGFgk0FEOua/gCXpLPGf4RfIB0f9y
	Y8OF55uvLypDOfNFknCvk9Hdm4F/AYAAhBkmsO7Md76NDK8HjH/gj3L0Ll/NDa3aUDtVQFgk9WN
	XQp6ymAjP1T2GWympjlsNph8ZeKBd6ADvYvFOtjf/FLrM9gz7qXmNuf/vGho/PBar1LUP8F/Y4V
	ZnypBSPSal+5+Br/dAmv7QAXxDg2SMHUN2SPsyrTznWRPk0LRXJovJ+LGa6Qn3gC2cN4S6CZsaH
	Gxciq+0VgWcHuzV7lxfWAXubhZnJtygKIk7pgaqVdqrpPN7U1iRxPDuY2
X-Received: by 2002:ac8:610f:0:b0:517:71b8:ee37 with SMTP id d75a77b69052e-517ed7bff68mr23862021cf.0.1781177758359;
        Thu, 11 Jun 2026 04:35:58 -0700 (PDT)
X-Received: by 2002:ac8:610f:0:b0:517:71b8:ee37 with SMTP id d75a77b69052e-517ed7bff68mr23861701cf.0.1781177757752;
        Thu, 11 Jun 2026 04:35:57 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bfcb58cedd4sm50499666b.42.2026.06.11.04.35.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Jun 2026 04:35:57 -0700 (PDT)
Message-ID: <0468f9f2-5f44-42f9-a366-0bdada092195@oss.qualcomm.com>
Date: Thu, 11 Jun 2026 13:35:55 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 15/18] arm64: dts: qcom: sm6350: Add minidump SRAM
 config to SCM node
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>
Cc: cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260522195009.2961022-1-mukesh.ojha@oss.qualcomm.com>
 <20260522195009.2961022-16-mukesh.ojha@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260522195009.2961022-16-mukesh.ojha@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: dIjlWHZjQAa-ueP5TIBqSeOqvavqK7wA
X-Authority-Analysis: v=2.4 cv=B9eJFutM c=1 sm=1 tr=0 ts=6a2a9d9f cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=ZpVAhvDm8T4WZmbhYYoA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDExNiBTYWx0ZWRfX6MhnbspCDRkY
 /5aJ6/QP7BQ+r5hJKEgCGpJI9sxtQOBBSjcenU0SniOIpeED2nJ/hX7zn29qANhieKuEp7Jgpco
 fsSvPdRX9tQgJW25i/CH13dLKUaRfpTxDPgkF2jiIUret0q9lU6UGpYWVmQYjrcvbSt5tdtqbVX
 o7j96Zo0hC95pvln7+j2IDqFSPyNoUX61kPneukKUsNGaH/SehWI8bathQ2dzFHJvmvQQB8GVk/
 hzmjprPljwhMONVXVwOqQDeYt/cT7M80weh4/Vj7+LVqiKtdd0NGZDDmAro4Tqv0a5ZJfDHjIcT
 0IIoK4mONIeWcKAi4Gu5PzhQ412iTy9sEm93UZNbM6ydMmB4yj4agGxllw8P54YdZsrsZxP2uxd
 g/l/IFVBktXgbNT0yHNqMYUNWA7pkkgflzEIJNuGKnS7UISdXa44zcKw+WWWqxjUVq8RCdPhkL4
 IA6K3T8Yk/hC+TrgyGQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDExNiBTYWx0ZWRfX8UXXNFLgq2Yq
 F+GjpFhSqw8drvUrT4fDQVK0xmL4/JTT/ah0jPBMLoW2f09OaCtp8AmhKKM14hL2mwu5lkmXKIa
 06B1PRJ28tLq40zrw6qMnMUtdjjcGzI=
X-Proofpoint-ORIG-GUID: dIjlWHZjQAa-ueP5TIBqSeOqvavqK7wA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 malwarescore=0 spamscore=0 bulkscore=0
 phishscore=0 suspectscore=0 clxscore=1015 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606110116
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-112739-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:mukesh.ojha@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:robimarko@gmail.com,m:linux@gurudas.dev,m:cros-qcom-dts-watchers@chromium.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,gmail.com,gurudas.dev];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1485267165C

On 5/22/26 9:50 PM, Mukesh Ojha wrote:
> Point the SCM node at the minidump config slot in the always-on SRAM.
> Boot firmware reads this word before DDR is initialised on a warm reset
> to decide where to deliver the minidump.
> 
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad


