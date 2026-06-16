Return-Path: <linux-arm-msm+bounces-113398-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id QcdEKwc+MWoAfAUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113398-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 14:13:59 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 25DCE68F2FF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 14:13:59 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=klUSxgpX;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=VQs2wv2+;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113398-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113398-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D95F8310AD34
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 12:03:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7255F43DA24;
	Tue, 16 Jun 2026 12:00:12 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E30C4418EE
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 12:00:10 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781611212; cv=none; b=g1Sk88BVcDwwn51wcKoW9G3b869rITm2GLThXMq2PNRfHlGTEnKqPIc0vV632EV6XuZx5zKMNeCViiKH5vcvlPJ+BxHmnCuwapQm/8G4fJr3i+EOwE7GXCQ5U+i7nWLipJpR5xjGnT/kTjkSvDQohmmw03Aank6pqu3xj24OvMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781611212; c=relaxed/simple;
	bh=RP05cdVRyEgCRmaS1UsZPi2+neNfPD4tg03i5mfdXng=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZMpBTqGruKHwmxYZfoAQDDDj/2i3DDEZEpV15bKhciMxm4K+FjRK+N9qjamwcIdThpKEGwG4ZP8toDQju026d+sV9SOJ59K9VIob+zDhoJc6jL6u0mJiT3zTc0S5s4AB0MRwyOOi4bf2OU6nCp9AMa/j7W7MGlco3s+vwGWwGUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=klUSxgpX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VQs2wv2+; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65GACUtc3474752
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 12:00:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IzUX60GvOS40Xc/59yiLIRyohnTxUcrKAkEp2XOlfjE=; b=klUSxgpX4O1I79ya
	Gv3nHbHTf3JReJSFg4+ztGkzKMlCZQi6rA/hQzNPFus0x7ZjtcvRhAS81W9fA1EE
	MHi/cnnqA1tkEgj/NFBnlX/sJgo/NhRmDabX299anHB+PbyaBVnxKud0B0+JWgo+
	dPjq51ZkifxdZ9NB9S34YW0E1721S0sHfZ1GWGK1BN5tFaaPB2/bIwEuiIfHvhVQ
	F2mibudoFomBIRpr1UiIHoC7MJCH14xR/pOVpa5VqJUe2G3p85raHrdcikW4yiGF
	J7URH7c7cf4oYnwNoTTkH6fawnpgJavmUCHc/bERM8eV8NqDalx0YCi1Nhn8/Zbi
	/PjIyQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ety52svq3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 12:00:09 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51968526a68so6405181cf.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 05:00:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781611209; x=1782216009; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IzUX60GvOS40Xc/59yiLIRyohnTxUcrKAkEp2XOlfjE=;
        b=VQs2wv2+oQobSMKYZpMPEyQdYpWNbwXDmkdZS8IB7O2cAYv1dWbI6tTEdtdzlr4gFg
         ZcshHRtTwM6HSddwSqY4t5kXlRcgaLUEkQ9PmD++R9UPO9eEYRr1o7qwtD+aUCqKYdwl
         T2lwo+ZodiqRpE8HAEIJHwaja8bGY+AinzGDzBHpkKXGpJvdpJSbBwKzIEsyMxAT+dGV
         JSBMSsjaor6aTOFZFMq+drkC1BHSn403ZKM+mnlbw2GWDtudbKK8m51D0ER8ZkaUovmH
         BZkUAGSocEV6UkzMLTIyC1plvv1ukI5DMWfYNbtNYtI7woR9K9KY2z3DVqZ/a4GhCABv
         jGqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781611209; x=1782216009;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IzUX60GvOS40Xc/59yiLIRyohnTxUcrKAkEp2XOlfjE=;
        b=CQO3AjAUT6YfDi2vQED94coYa7lNEqCPAotqbpuOjqBev+wL44xztEbV0cOJMeR6Dz
         cuPKao5d9sNjCHUBer3j6cLcZ5qHmX5oSJTyJlytNvGjGq3deRS2nmrwQyaka07kOjqs
         UzfSPYgdR8GZl3F8ipRdUhloNnuKoJFXmnF1YK/N49BTUmtYRRafWHblP71/Yw7VBl9Z
         2+n8qYS6exCuD66/AjQvXO/nBY6Aqg8t0w3+Ia1PJFH5sxY89HjNHnE37F1zdKC/10Ut
         1834jFSZ3teQoq0L5CT8+BZLlN5ZAdIB13dib2mZZI4oGCDhB9LhbhkrAqI5tph7W9cP
         ahRg==
X-Gm-Message-State: AOJu0YyPRiAK/y1kqGhlyUQHF3EKxSPw3qSVGYrG7FZF/RAJ8cXtNBpv
	KmnzIz30NDHfodzSfHhJgyg5PwmNo2ixo52oZAeYBVZcZDgK0iQxl50apUsLv0sKYqp+TF3NICH
	6viy2WbRt/XMUZztAc3n4/0S6BdZE6eN5ClTgF0sr+jWXy1wYJaHhbRc1vKis4u2g7udQ
X-Gm-Gg: Acq92OFKyMSnJAYltTJAU4wji6H44PybpOEKnrm5c+AFZX1OfW/VCEKVNQhQn++Zmzk
	6E28Qjyvb+YXJJH7GgSQUCN4uqAu1rjFibYE4dXUuseahBOZX7m9UkmM2ZDovwOczC7kltYSU66
	AVRBA0B4pRNc66Gs5urYCSXCiRoWTsLcnPUAuc1kLzE3fKi1vTi2LRAaT8QSpSm1XDeCe/pGTi8
	3xnXEhpREgQ/a4N3JnknzDXTNGUqdvu4UgF77Ob65iJzCt6NRjSTSGlzd8cNhtAQjJXmVJ8n17+
	ti4t3HO2LPZYaWvbPXTNv+7piiznAyIczdGwVFxAY1FstEgYa2gu2xlsZzyEyfehpx8mWuZNGAp
	cE9UZ2CYEsGEpEv6IoM5lJTgeKAF6H7uap3JU0hCdySllAQ==
X-Received: by 2002:ac8:545:0:b0:519:9efb:56f6 with SMTP id d75a77b69052e-5199efb5908mr6738791cf.7.1781611209214;
        Tue, 16 Jun 2026 05:00:09 -0700 (PDT)
X-Received: by 2002:ac8:545:0:b0:519:9efb:56f6 with SMTP id d75a77b69052e-5199efb5908mr6737901cf.7.1781611208504;
        Tue, 16 Jun 2026 05:00:08 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bfdb51007a9sm625307866b.21.2026.06.16.05.00.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Jun 2026 05:00:07 -0700 (PDT)
Message-ID: <160da619-2966-477e-bd2b-863e118403ca@oss.qualcomm.com>
Date: Tue, 16 Jun 2026 14:00:05 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sm8750: Add UART15
To: webgeek1234@gmail.com, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Teguh Sobirin <teguh@sobir.in>
References: <20260605-sm8750-uart15-v1-1-93e660722e61@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260605-sm8750-uart15-v1-1-93e660722e61@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE2MDEyMiBTYWx0ZWRfX1mSni497Bz0k
 RI7SU2z567z8/goj1OZLo/uLAUGLi08CfYWffFqa2+4LUCzM8FGV2O5ruhXzsBS3gKwixW9HTh8
 JaSCY5kncum+X5KjOuabhXJB0E4oPqY=
X-Authority-Analysis: v=2.4 cv=FJwrAeos c=1 sm=1 tr=0 ts=6a313ac9 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=h4QezvlwQ886wjDLtIIA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE2MDEyMiBTYWx0ZWRfX3NyGcYpb2Qzz
 yNdwkiL0Fiemb3hnkafZGvtxb3Ycj8FB9xhIG9YhracRz+nTB+68E4RnjpXt2rIDWl3bqBZ29+w
 oD+WaHnN4w47OjvvaTPDZJIPpNKT1ZKYdJqnSpy7Fps9sRRLmfYSXQwWyAaglNT/jGd8XiJZgfX
 Xwa9EpaazVcVoN2Qci+1Y9+vs/IDDym1ubMkAid2O/CIGsMtHb3EWtbcSguhywlIioqccq87L9/
 oCMniRbs39AW0G0EWpqHlH0egMWspEI1vUcmy+kEwid+OnFPKT3J5NT/jAD/GCuti+G/Jy5e1gt
 18kvJy3moEFPQn8E90wWbo0cU+UUdvmM869HEB8WToWddTau4msafXAPIAE7OUuKYBfbP2YfMqU
 mWEfwFCEvDwUjz6wFqxl40O3Y8/f7RpPW2xxwy9NRJRp7fCsUA0+oQjP03dZZ67ZjwzsCfT8Hm7
 fmrCk4Elqn468LQRnPQ==
X-Proofpoint-ORIG-GUID: DLa9OYi4g44RcavhUbq96gC2-OYaFsZx
X-Proofpoint-GUID: DLa9OYi4g44RcavhUbq96gC2-OYaFsZx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_03,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 spamscore=0 phishscore=0 malwarescore=0
 impostorscore=0 adultscore=0 suspectscore=0 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606160122
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-113398-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sobir.in:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:webgeek1234@gmail.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:teguh@sobir.in,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 25DCE68F2FF

On 6/6/26 12:49 AM, Aaron Kling via B4 Relay wrote:
> From: Teguh Sobirin <teguh@sobir.in>
> 
> Add uart15 node for the UART bus present on the sm8750 SoC.
> 
> Signed-off-by: Teguh Sobirin <teguh@sobir.in>
> Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

