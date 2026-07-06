Return-Path: <linux-arm-msm+bounces-116655-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 3CHwD4pYS2oXPwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116655-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 09:26:02 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id E7D4170D808
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 09:26:01 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=noQoj6EI;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=ER3HEviS;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116655-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116655-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 60135311839D
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jul 2026 07:07:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9CF063D88F7;
	Mon,  6 Jul 2026 06:50:27 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A7183D7A14
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Jul 2026 06:50:18 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783320626; cv=none; b=aS4KmbKH33jFXERIJ3Pr2wpDovvt+pkAsP1ADmim0i2Lc8Xi7j+geLsOw/ROU4/y3OXp+X6etOrGrdIL4C47uvPW4FHuOtntWMaVdB255vjs5eGO+WpjDMvZcvfrf114ilgElVriwS3ox036rxKPCjY1B7Om59yijaX/vrggYhw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783320626; c=relaxed/simple;
	bh=5XP7U3XbdBQGJ3DIDkBx+wxl+FEgzzyh8LBWUgI6TQs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lbD2ItbT2ukJavWstK+Bdzop3AiTCQ+9LT8xOGc17arL4v2734jaG9jbJJu13tC0We+5SXcG3evCF2sm9KrA6L9So/ZB7/SX2BtujvzU6pD+aV6TUQpiMrMSnZWO6nR7yNkVW/UhRNsUzNE2+zjo8GQ84zegznh1HyZvsY3Atz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=noQoj6EI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ER3HEviS; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66641WOr3615514
	for <linux-arm-msm@vger.kernel.org>; Mon, 6 Jul 2026 06:50:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=IaQwN2nby+dYnOfO1eYFhhN9
	iCDNr2VXqiO2x4Ci9z8=; b=noQoj6EIVIsdeUYLfr71smgxpUhEul3V7Rve2ciI
	PYl+DXCl81H05w/Hp45GE+wEfgE7Dd9tRRWMTYcArDFeGJ/j91TL0aQtD+moxhcS
	YOoX8cw+rv1AlU5W66ugsAeBp/JU3oC5VRt+osXw7FAhdejLbeot8TFWeK8XLjZe
	AHqhx1eD5g14gXbaR9PoRB3aclYacCtqy4PPF7BDKxn2TXQt0uCEIlzvexfKUJY2
	zSROPSYhcy6d8GvK7QfAHNQ+WngIcL8l8jIQyLtkqsyNd1jApqwJizYGUNnnntJi
	ODJFip82kCMFdkTR7XVDlAQusDoTU9UMFeSXoLD4WFG2LQ==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6td3cvgg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 06:50:14 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c8924f4d0a4so3823256a12.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 05 Jul 2026 23:50:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783320614; x=1783925414; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IaQwN2nby+dYnOfO1eYFhhN9iCDNr2VXqiO2x4Ci9z8=;
        b=ER3HEviSlmQBHHlEqbmp/lTQAn7VREiY6kS6cPJo2//dylI2yIMcwoeXEyR2l1RX9h
         tSw2vUmr+lLUvNWoCpXi0h11Ra+nW0YWR5sfbQ87VJj8k+ABEBFuGyLWjM/sZhmDB6YR
         Et+2CrcTtj7gXO/9bWPj1/OlLF9JlAvTrp5rpcBnD9quDVwk+p8zlZfSZpm4lkqjPiMm
         +vdYGWU77xld7DLFn2AjhIwS30QbvlwcvNifwwvKUtWSO8jlCpo4i+gcJDcl0xlZhr8H
         vGtwlNDPumi2iPp9PQ255oPNzU3xA9wT+zpRaYs5kMvBPGHvS5rNwihlhwAKKH8Oas1j
         H6bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783320614; x=1783925414;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IaQwN2nby+dYnOfO1eYFhhN9iCDNr2VXqiO2x4Ci9z8=;
        b=a/L+OTXkZBDOWlIMfMXWK8liCt4K/OM9oUf5lCEWKjf1KmQs/5Kph6PMaRt9RTdh/b
         QRNUxiqn3wBCpNQtVVxvz86ie6Erq0qCwSjZYWlKb8sQseRKJBuQEHP7B8zgXiQL9ufB
         c6iVuQyABTYHktC3aI7r73/xNlpJ6brCq4sxRIm1tmdLs58FuEOcBg4iBTnphgTOVaEo
         BODrz862uUBGGk7NDWAQ4OCL6n9HYPrTirb1SvE/unBZVLMigsU1lP0yLcgqiC90KGY3
         19OVWxko7dzj6CX+FU65sDmSU5ZxdLDDy2kdwZ4otLeghmdruKj4A6rkMeT0sHbZNdPa
         XUMw==
X-Forwarded-Encrypted: i=1; AHgh+Rqcwt+i77qMrCADBW/+qK11k+KGU1MfKvXKQvUYqZPppV5fOhxfGJ32DpYMBPmQn3j2oT5Zp6115UR+bRnN@vger.kernel.org
X-Gm-Message-State: AOJu0YxGbITIY4KvIl2CqsjIu3yR5qEOaz2OziDgQuvLrVyATv4qamyw
	Zc17qDhuj0ydcGRs+kGgQaLWVUvC1SVoRp20GxAoLQ/uuwPNQ34t9mTX169teNLoCyr0l/oXFKJ
	gX+2DKHa/8Vzvhe/t3n0qJLP7egAFp8Bvw0mb4uxyXeFGf6kgrp2aWvQhSbv3iRi4Jh0v
X-Gm-Gg: AfdE7ck5+gVa1e6/cfzjr6UQ53s9sWAqj1tP2jTe6LIJb/0l2Pr+qZKZMECLa8kcNQK
	V5c2vHqIpewf4YYcetMr/bi5sxwW5+SVZ3XIxyuOTh1RxOx8kjAxsC3sWgBJ/EcroxuP1iRwK7I
	rbyXzkXVbWcolZsRV7l0ZrW7N0F4ZZdqvBQD7D9B7g9eN0/Xw4PnPfxz8uoYlF3hI2EHu77cy5X
	F+aEPUVZQj4755D1G9YZE2hCaxQSzr7S2fPTeyUd92xr+KsjRuhvvdMHbFn/5VfGqv+I/61JHrA
	7QpZStWVOaf0ktUcZOwbQ0CMnbh6YwpbtfqwQgqolk0hv3Ra0mt5hKVhukZTjA5iBLP8CyHH0ZL
	iKyQ8af/fCQelOLOsab4O9vSClNe3P8slXsm9+FbCITmomnCn0U5/JY48MRQU
X-Received: by 2002:a05:6300:670e:b0:3bf:c49d:9183 with SMTP id adf61e73a8af0-3c03e592fdfmr8095343637.50.1783320613687;
        Sun, 05 Jul 2026 23:50:13 -0700 (PDT)
X-Received: by 2002:a05:6300:670e:b0:3bf:c49d:9183 with SMTP id adf61e73a8af0-3c03e592fdfmr8095320637.50.1783320613208;
        Sun, 05 Jul 2026 23:50:13 -0700 (PDT)
Received: from hu-anancv-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31158ddede9sm8584495eec.29.2026.07.05.23.50.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 23:50:12 -0700 (PDT)
Date: Sun, 5 Jul 2026 23:50:10 -0700
From: Ananthu C V <ananthu.cv@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH v4 1/3] remoteproc: qcom: pas: add needs_tzmem flag to
 force shmbridge creation
Message-ID: <aktQIt4yEKKW6OKq@hu-anancv-lv.qualcomm.com>
References: <20260703-glymur-soccp-v4-0-b706c4c9b3e2@oss.qualcomm.com>
 <20260703-glymur-soccp-v4-1-b706c4c9b3e2@oss.qualcomm.com>
 <akrWGWtPpIJhL0pF@baldur>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <akrWGWtPpIJhL0pF@baldur>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDA2NiBTYWx0ZWRfX2aUbCt+BvHRU
 Kok42jAwk2+EpaVxzpyAhRj3cb+bZcYpL73Po9St5tAPPGJtPhpIBa4zeic/+kkDNDzfPBusvsq
 0X5FaXrdF5jYN5ltMGlF9uBZcuEX/k0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDA2NiBTYWx0ZWRfX1+a6rm2eensk
 CR3/5UjxO1St7VDswfAduFmK6G4mlwzzLEX+BX50h/fvyeTSK1GD5Hq93JT4WL852QP++IjK2/4
 y+uBz47Mez38d/+YDthf9Zy10Mz1lcMBlNMRZFdYBFYg5K8waWxDQEcah8oPyQmiWGtKp2EAufS
 vUp5LHbDpdWNYfQcVkeBLvzemzuRQ/cfgWiKmCIEe0Ufw4QD70B5Oobi2ZqrwpjW9ByxWKfLwtW
 JUfT3q+o9gf8NXMvc666cFfTUiTEso9rKocnbYx8eOu6nfsoT1ZJHZ6y+5DZpta9SHreVRB8kt/
 dIXtoLvcsVlMFAyz2xffG26DjsHUuIC0rd3CaQqn4DZSNaBmTbrzHmoDFQvaY3DHPpVUGNYIsDv
 YRdxKHp2zk3fitEYK8Tpe1AOsm6Xkl0Rv78mJTCkVpIqHtBEYlF4lsZG29RgDwVpaz9mlssFWi6
 ptKxGzAtZuS3hRup55A==
X-Proofpoint-GUID: wnVXlNvt8MqocdeeskdMea7M1ZwbSlBS
X-Proofpoint-ORIG-GUID: wnVXlNvt8MqocdeeskdMea7M1ZwbSlBS
X-Authority-Analysis: v=2.4 cv=b9GCJNGx c=1 sm=1 tr=0 ts=6a4b5026 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=Q97BnuzodRhVEAZlOpAA:9 a=CjuIK1q_8ugA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-05_02,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 spamscore=0 lowpriorityscore=0 clxscore=1015
 phishscore=0 malwarescore=0 adultscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060066
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-116655-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,vger.kernel.org:from_smtp,hu-anancv-lv.qualcomm.com:mid,qualcomm.com:dkim];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:mathieu.poirier@linaro.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-remoteproc@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[ananthu.cv@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ananthu.cv@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E7D4170D808

Hi Bjorn,

On Sun, Jul 05, 2026 at 05:26:22PM -0500, Bjorn Andersson wrote:
> On Fri, Jul 03, 2026 at 05:31:11AM -0700, Ananthu C V wrote:
> > Most Qualcomm platforms feature Gunyah hypervisor, which typically
> > handles Stage 2 IOMMU configuration.
> 
> This statement is true, but the IOMMU isn't involved in the interaction
> between OS and TZ, so it doesn't add value to your problem description.
> 
> > Additionally, SHM bridge setup is required to enable memory protection
> > for both remoteproc metadata and its memory regions.
> 
> "Additionally"? Isn't this the entire problem?
> 
> > When the aforementioned hypervisor is absent, the operating system
> > must perform these configurations instead.
> 
> Please rephrase these three sentences to make sure we have a clear
> problem description.
> 
> Then, at this point in the text you have established the problem, so
> break the paragraph with an empty line.
> 
> > We've been relying on the iommu property being present for this, but
> > for remoteprocs that are already running like SoCCP the mappings are
> > already in place, and any attempt to recreate them while active would
> > lead to smmu faults and a non-functional remoteproc.
> 
> This is a significant detail. Please expand the description around
> "attempt to recreate them while active" to ensure that it's clear to the
> reader what the problem (what does it mean that mappings are already in
> place).
> 
> Then another </p><p> here, as we're once again in need of some breathing
> and thinking-room.
> 
> > Fix this by adding a needs_tzmem
> > flag which ensures tzmem and SHM bridge setup is performed independent to
> > the iommu property being present.
> 
> "flag which ensures...", the flag doesn't ensure anything, it is
> propagates as an alternative trigger to the PAS helpers to ensure that
> the shmbridge is established.
> 
> Regards,
> Bjorn

ACK to all, will take in the suggestions and improve the commit message.
Thanks for the review.

Best,
Ananthu

