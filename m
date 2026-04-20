Return-Path: <linux-arm-msm+bounces-103761-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wBDfGMsi5mkMsAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103761-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 14:57:47 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id B9ACE42B15B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 14:57:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D1085301724B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 12:57:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B481B39FCB5;
	Mon, 20 Apr 2026 12:57:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DOpVZm/x";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ymy336hn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 451D539FCAD
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 12:57:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776689854; cv=none; b=djT5P5XgTL6acw9F9iOdMgNm8Kmvhev5XS5V95lniv0a+nvEpaXHNaqvLfWM7m6j+Jynjzm7wERcXQApcg1BaTZEi5Z7S0Bh7a9MG6OXJtXuEjl/tkwBrLi4pUisvofPOwHXFqbwauIuSqu8BPs5Kz9UZKoCvGz8/UCETmtQuTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776689854; c=relaxed/simple;
	bh=2yuzhsqIoFkC93c8bQUG7uE36plzmoFPEtctfPNZbxo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UNmjvfpSqQFQpnz+HvhKp9pXOhy/PtXAbPBA8aMnPdeVIDszUAlVGs+hqci4ZhBj7teAQgHPotza6VNmC8G/91zZx4IyBkHpIU8zUIFb1AjO1XAKlKmHVPWXBKA1bW2N4mq8ym1DlxKNyKJr/zDy3Hd0ba//7xuW3uBmGhfjE0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DOpVZm/x; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ymy336hn; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63K7ZE7p3456412
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 12:57:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=41og4mU1cLDXbt7IUpYZOpMl
	mqtt4dfz8VnoGJQGa8U=; b=DOpVZm/xN/P2BBvah3VvNjMlOn5xsAXk5r9cx/RR
	jn/gCp6WiV2dtQpJ/Yf7wGvknOeNQMsM5o+hYsZqh/YbkJWoXgEhy8M8f8OEfW4D
	AwSpAWaSyrY3Y16RU41RgFqmPLNmWonnyaR833AZsykPu/xrFIjjU9UG4YKl84GX
	POSpm3vnRPrT6m6MUCPeWKBwfay/VXtkr6So7Z9LCs0LWFXZ2jIIdpgujkoNvu+M
	HAdBS0emtefdUg7WWDcqyqU8Z4w8JDEtar1FE2my+TpbeWakq/MxNtxQOZ/zlVOi
	YvPUwUu0PgnumtjcBiYV+ms3B4jGH4jh55GV/ToxoddiIw==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dnfvjsaed-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 12:57:32 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-127876be621so2677460c88.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 05:57:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776689851; x=1777294651; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=41og4mU1cLDXbt7IUpYZOpMlmqtt4dfz8VnoGJQGa8U=;
        b=Ymy336hneZq8kQqKCHEOgaaL+gDp5WbC0Y82vPyUE+ydgIUDpoX1BY19CDVjy+O3Q4
         Ws7jhbTeOwxEuFJdSYmUgPc5pu1R2UY0POb4bT3LUfVbGYtsCMkxpJjpV8HKf6um/WHL
         mEN+iBcYcIEuX02OudJIbtaYe3hsY/Oa5VzoI6wBWk/s4bxMNhdzsyByMmzM1hGYF5RV
         tHxLwHYLat0m1P3CSm5oVZUYiQ/uuWw9NBclB7wzfwBC1ztAoNPxKtzIFjhTn1Ln+5Rd
         1fipFQUeoDjRNOLwDEmhBXPGdfBs4+dk6UMkpr3kXj1eWi660zJgs0GLz/qP80ZNQYFt
         BITw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776689851; x=1777294651;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=41og4mU1cLDXbt7IUpYZOpMlmqtt4dfz8VnoGJQGa8U=;
        b=KaRQ9idUKdd4I/4piqVEwgJsKrvgILbppYnnVQ1H8bmD3EfwzsF6X2mdWOxkLo/c7V
         AcJ531vuuRbp+KnL6+II5xK2l6NRolqHf7dj/ahB4fn1yG5asx1xj2E4iG6+cvhOhiOL
         JxjNKiBG8usPwL0tM6SGzoEvUnp8yLi0eXjdGOYIYKPoFSoswN2Q3cjGGkHxqqVp4tlj
         lnylFInuLDN9VE0an5A2euJ3P47EvoRaemhFKAPAgVIYqJmkO1gMBRXg9rioT4cND7mp
         UMzXA1hfU4fC3BD5aTHXjE0JxGNmM+FB2l96anzO13f2vtgIrk2ZzZDdzpSkdutN1liL
         jUBA==
X-Forwarded-Encrypted: i=1; AFNElJ/hVrHPaxxwMWpzXDL5ukoZ4Yajm7HoOQTP+HcqkLL0vBMo7OV3QgXxrmyhewpO0zeUq4JD2nzYluZwOEHv@vger.kernel.org
X-Gm-Message-State: AOJu0YyuaWbgA2QW627V2dPf6uRNPprvuTXDCCvOzVnLBLr53zS9BXXF
	acxlH4/hysQu+M95+wkF/cQOi4Dt8sloXar42wvbgh0xy9YnWfvFAc3zVwrI7wPecU3sQhCquEL
	M18GALcYxb8UY8LVUCbik6HU0rDw80oxKdKp57U3OxoVcCaOcx/kH4AozfKbGnzkeDHZE
X-Gm-Gg: AeBDiev8CKiuXkGPGzplG4aITJQ2tWoztGvdhrSQHg/WQ52tzEM4QcncCvVpMC37S58
	y3V2aConetwoeXnmMFBMZtPUyIslhABCDLQMfcVhKeVAphboR8Ld5vwOl7dBeTVSPTRI7WY+S7i
	DzpDUCdkv32xkbDxp14+++76LBvhIYI2I4c3oz40hqE9QjK77S/6aPU5Jjmnk6cva89rUjSOXrG
	y1HlVUolza1Y0dJ5/oE35a2AObJDN9njrF4FLTBoNvRmBYoDjEREDxdgdQsqwngcCx1BFYSsSj2
	LZQ0cn0mbIIaQz6LvX7PQC2d3FIUUJHgaoAl94aJQc+HDkGBImgtkZ45qTvIJ8Kb9KPL4FH2nWp
	Bfiw/etd2wpk4A09MRKnHAJ2AW5bejkvQyyU97FWRQzssY6eqK7HKTeppp2Ml3ZChQxRBT/Ejpn
	Q=
X-Received: by 2002:a05:7022:1281:b0:11c:883d:1ef0 with SMTP id a92af1059eb24-12c73b2c248mr5226092c88.15.1776689851130;
        Mon, 20 Apr 2026 05:57:31 -0700 (PDT)
X-Received: by 2002:a05:7022:1281:b0:11c:883d:1ef0 with SMTP id a92af1059eb24-12c73b2c248mr5226067c88.15.1776689850578;
        Mon, 20 Apr 2026 05:57:30 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12c7b62fe87sm10608117c88.2.2026.04.20.05.57.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 05:57:30 -0700 (PDT)
Date: Mon, 20 Apr 2026 20:57:23 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Herbert Xu <herbert@gondor.apana.org.au>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        linux-crypto@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: crypto: qcom,inline-crypto-engine: Document
 Nord ICE
Message-ID: <aeYis8uC0BcGXB3Z@QCOM-aGQu4IUr3Y>
References: <20260420073301.1250197-1-shengchao.guo@oss.qualcomm.com>
 <dd5ee12e-1aac-494f-a8f8-74e236ecb47c@kernel.org>
 <aeXmOSfAFoxhIAcD@QCOM-aGQu4IUr3Y>
 <4b074757-ac44-4077-8ab4-5a983d1be50b@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4b074757-ac44-4077-8ab4-5a983d1be50b@kernel.org>
X-Proofpoint-ORIG-GUID: lsypgGSkzogRTQFt6zeAjkyHxCSuKmBG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIwMDEyNiBTYWx0ZWRfXxK113UKpBC3h
 xp+zpVEbfiB2nYyjHhAF6FE4Brq6ki2RAdhHnNwHuzKVjeZqOnwNERf4cPJRnEQOUPEQ/Wkm6H+
 K1ndUFTpeueL6cNIUHI5HHq8GhcTu8t7RqILutDIEOZIPwnXqklI7hURzQPDoIVN4pLLypp2u/Y
 aQEOBYV0YAgmhclhtlLLr1PeHzMfpqj23YxdxFH31OlTS0vSt28g7gaAXYUBQEHgz7tXWsAAkJ5
 NPGkOlX2TGU77zCKp1mBGQXnQBhc8SI7GYBBiELMKQpepZyHCeUoOOmJUtZKDslI8q14FE8QHmw
 x3o0lenCIG1coQqtsmdzFPPAK0CU/wa5DOCKgVGsplJ400CDOmzcAJh9vFwFSp0ASrK1TWMvzsR
 kypjUA7O5Di8mMTX4Y1Tq62H6rfZ+QLCl/clxFbP5xCOuWiuWNs00njJgMlOa6fqo+51PggsR2b
 zWqldAlh6IZEaqg1NQA==
X-Authority-Analysis: v=2.4 cv=XNMAjwhE c=1 sm=1 tr=0 ts=69e622bc cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=NEAV23lmAAAA:8 a=lIS4hxcDbv2UqGGAmQAA:9 a=CjuIK1q_8ugA:10
 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-GUID: lsypgGSkzogRTQFt6zeAjkyHxCSuKmBG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-20_02,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 impostorscore=0 suspectscore=0 clxscore=1015
 phishscore=0 malwarescore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604200126
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-103761-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:dkim,qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shengchao.guo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: B9ACE42B15B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Apr 20, 2026 at 01:56:46PM +0200, Krzysztof Kozlowski wrote:
> On 20/04/2026 10:39, Shawn Guo wrote:
> > On Mon, Apr 20, 2026 at 10:27:56AM +0200, Krzysztof Kozlowski wrote:
> >> On 20/04/2026 09:33, Shawn Guo wrote:
> >>> Add compatible for Inline Crypto Engine (ICE) on Qualcomm Nord SoC
> >>> witha fallback on qcom,inline-crypto-engine.
> >>
> >> Don't explain what the diff is doing. Explain why. Why do you use fallback?
> >>
> >> What is Nord? It's nowhere explained. First posting was 1.5 months ago
> >> and it did not provide any explanation. I don't see any information
> >> being posted in the series sent now.
> > 
> > I'm still checking internally to see how we can get the best socinfo
> > patch describing Nord which is a SoC family covering both SA8997P and
> > IQ10 variant.  Hopefully I will get it soon.
> 
> I found the DTS on:
> https://github.com/qualcomm-linux/kernel-topics/commits/early/hwe/nord/
> so it should be mentioned somewhere, which I kind of asked when we
> discussed about adding compatibles used by that DTS. You would solve
> yourself all my questions from three threads.

Ah, I see.  I thought only patches posted to list count.

Thanks!

Shawn

