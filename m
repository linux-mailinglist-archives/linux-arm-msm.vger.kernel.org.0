Return-Path: <linux-arm-msm+bounces-116451-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id gwE5KtZiSGrmpgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116451-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 04 Jul 2026 03:33:10 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 70B877065D5
	for <lists+linux-arm-msm@lfdr.de>; Sat, 04 Jul 2026 03:33:09 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=GT1DJE5K;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Zob2pm7O;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116451-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116451-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 712D0300609C
	for <lists+linux-arm-msm@lfdr.de>; Sat,  4 Jul 2026 01:33:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BBE8B36C0CE;
	Sat,  4 Jul 2026 01:33:04 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87667217F33
	for <linux-arm-msm@vger.kernel.org>; Sat,  4 Jul 2026 01:33:03 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783128784; cv=none; b=gh+C2xpjSuRDZxz+9anMyMcu37Trgmd30W5EbPNXyJaX5J0zTW6s0wBLWFlTh/G3O+ebe4Ydv5hHUuiE2IkaAFpzxOCebPZN651vMz01ZJW9m+KaXB6j8+NH5LLgqZc6qvVXDGf0YafpzDxUkYqxAYTruyeo/kv2Cj6AjoE2SSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783128784; c=relaxed/simple;
	bh=cL20gV13J+1kL8sm+4UZLCloZhf5IQMRz4hwsb3m9b0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S+MEmPZs0/vaOWC/cBSXd2Ep4BeiEwqMNsjm4QFhp4M2fF8UWpNzD8eWEnsOG92Ee9YlP4JgZNT2hsgZo9c3HIMUWF5ap1cSeJtc0TOhrrD0fL3dgi7ouZM7Ei3JLM9ZSCa7XJvRxXW20LMgUoStdFTKzfgnXulXm+7nzr6A898=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GT1DJE5K; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Zob2pm7O; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6640iVCH1551973
	for <linux-arm-msm@vger.kernel.org>; Sat, 4 Jul 2026 01:33:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=qPBfOOGxXvjk8V8KWTJiCP98
	Ny3/zANKNhi6DinyuRc=; b=GT1DJE5Kgo8SerFdU5VlkawpWieqvXVVadu1G2pj
	GAqR9mt7G3/onXdkZSqhtQVQrbz8AtTH5CmyUjHXJSpRE+JiH3TVflETqqLzOLq2
	XC/JxdDR/dmClWKJrvB+IsWQDVihNAKy73i3PpKExp80H+FuWXAWfezQXWaBaFyc
	qis9XeEOmosksU10kz6cSn2UX3Vtl17hCWvgxq6imtqBXPi72UDVKO8l4Q6vn8kK
	/+eZOUglkS8Ay4eh4kCNge233UNcsvY8xY/AZYc1eaJQ9IX6sPBxPNsATEheX3tB
	MgqlRHjBtfALQX5c5klnxtaIaA0pxexGMLAAsJIJEACqog==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6qvgr32r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 04 Jul 2026 01:33:02 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-380b630c505so1378753a91.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jul 2026 18:33:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783128782; x=1783733582; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qPBfOOGxXvjk8V8KWTJiCP98Ny3/zANKNhi6DinyuRc=;
        b=Zob2pm7O6ZVJZb4ttlJ26c7bFqSzEzwTu/BW5FE26FdFRwVR5X0IYlsxaFdzSxkdv+
         9uDHdwf2VayZzwnaMNiJokP9zNLCbUfZPni+JPizmG4u0O1az3BE0A7HjBPB1uBV3k9r
         gYUu5VDjmM7dYdYu8rcNN80cvQz13Zka2YQeeTuQZTCiYDTqIq29w5AL+phHpg8lCsDc
         YL5HrxoD4i/dwL8j+QGgtmOrpmg7TC5NTKIaOOMpWcv12ua8mEhZsqhMiLte6mGT4p5/
         922tHe1oY7OviP7nMKi9FeKJzP2MAHb0I+xVJg4TCNXnn/0v/TnBAhdzSL60EQmLlktk
         D+2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783128782; x=1783733582;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qPBfOOGxXvjk8V8KWTJiCP98Ny3/zANKNhi6DinyuRc=;
        b=o5I9+QmVB4YqUvvLGdJX02M/SjhtSGpY2KkFT96+D1gqw+CMfCumQnbcX6S2omPImf
         Xf5X5837YwMf+pPWQ5DOmwAbxoC19k0Rzum/8Ox/LpwToaRNR9Y07TTZVHpgp7kTR+5p
         cQYo5rHTbzI1zYzhEysp0HkhJm6bWwp7JBoDmQUwxfZznkiZK1zKZgmt9Je0ntCVVI00
         ExclAtPmkTzKO7+0S/BlsqFHmMvkwZLq068cuv/kNbaxH7VGqCzbztIOeGKjDQM2iI/p
         4yEMgdQZSxYHcgv4euk6VFwANQIKqNVNmnzpgtpzwunHvvBTGvpExnSe/GGGGzUCZs8T
         V02w==
X-Forwarded-Encrypted: i=1; AHgh+RpmynmLoNYOu+MqlXyTcDv3tWZGsop77TpxMBmIPebxE9Q5ABxyT0mxp92duMv0rvxpe/f5UuXZCm8oxpqM@vger.kernel.org
X-Gm-Message-State: AOJu0Ywux0fKiRyTHyS7jTcPckpp4XplYlpQd1FMRyvwXkFWqdtd7rWn
	QLyFVp7LySQwW4QtHVHln57sRAD2coWZ1yL7dDyiog05ytYA0+quPp74ck4P+tn6e9SKGjxA0bi
	XR6gnyKGXjCu42VwRkzG39+hyBSyncbIrr3DgD2HPHHhv6IfcICLS6/wzx97xmsnfdjyT
X-Gm-Gg: AfdE7cmkCaz+U85SBwm3mwQ8LHic5vir0Gr6zisP6Sc+Qn2SRMV5k/1Yjc9wy6qEvTo
	p1XzKmw/BsrOQA9zbyMOiULW0TXwXYgTnG8tqRb6cskjJx4WSgEJeDfGqFMJR+wG4Eg+mcnbhGG
	nazngug9GaKx3ebZUcPOMYAkfLhj7p+ep9hdOVOcYZYnawAkfPRI7bsVcxR6WZyNqjJgNypH8pE
	fNo3a72CIx0v9INYNPXRFpDFSARAIPI5hATo1CEqgXHF+jbCaqIIV7HK6sIwM/LFIFEAr8LZ9uY
	ctG8UmqMZ1nVosijrWxAI8FE5gKCi2twW3iSCuRV1RXLFE8G/GIDzV6N6p9B+zmY8n4r5KoazVU
	dSNgwyHu9TXl8wKIVCZoQhBFI1byl13yKdQlx4xQr/U+xsJvVr8u3SQ==
X-Received: by 2002:a17:90b:2e48:b0:37f:fdc8:71b4 with SMTP id 98e67ed59e1d1-382803b66famr1755735a91.2.1783128782098;
        Fri, 03 Jul 2026 18:33:02 -0700 (PDT)
X-Received: by 2002:a17:90b:2e48:b0:37f:fdc8:71b4 with SMTP id 98e67ed59e1d1-382803b66famr1755704a91.2.1783128781595;
        Fri, 03 Jul 2026 18:33:01 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f3c8b19c7sm5776851eec.4.2026.07.03.18.32.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 18:33:01 -0700 (PDT)
Date: Sat, 4 Jul 2026 09:32:55 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        Harshal Dev <harshal.dev@oss.qualcomm.com>,
        Herbert Xu <herbert@gondor.apana.org.au>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 RESEND 3/5] arm64: dts: qcom: Add device tree for Nord
 SA8797P SoC
Message-ID: <akhix2qrSBp4elR3@QCOM-aGQu4IUr3Y>
References: <20260526051300.1669201-1-shengchao.guo@oss.qualcomm.com>
 <20260526051300.1669201-4-shengchao.guo@oss.qualcomm.com>
 <0355cf52-b9ca-443e-88e7-2e7457e4b576@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0355cf52-b9ca-443e-88e7-2e7457e4b576@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=VvoTxe2n c=1 sm=1 tr=0 ts=6a4862ce cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=WVMw9i2Su9l4J9phZI8A:9 a=CjuIK1q_8ugA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: qk7d9x5nqE1wpnn-kOt8FDAHlXi2v_Md
X-Proofpoint-GUID: qk7d9x5nqE1wpnn-kOt8FDAHlXi2v_Md
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA0MDAxMSBTYWx0ZWRfX+cz8DRRE/W3/
 QjbGVN58gGsxqkVSw4MbIVwqUm4D0MZ4IVQfOE4rcej8bix1+AQSfgTC19K+iMoRl62Vkn9rOD9
 +S4SlkKhEcfHMHMIO3eROTgOHyxaZWw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA0MDAxMSBTYWx0ZWRfXyN20rNwxJVcX
 OUj6IWyYQ9tBCk4ucnqrVhszsqmAmjqdd8meRUGAQYziMRebzTqBOI9BZbPqZA8OM9OblekZ/+U
 1MUEusueESP+z+eZHRnpXAMnud3s7OG8U9nmRfNxCUYczTqooEMDkz7U9UKgrc6VSuKn8rGX++N
 bENXWC0ZB865CpBEBzuxfG/g2cf1uI+by4ekEpxRrdwhdiGP6bUaK+kgdxSZ/OWF5EIHzJO/EWY
 UUeQJyev8CgKrPWW6Yv1CRjLqR7OyKEy0PXO3vuj66akoDUjOggCPPHNfGM2q7ys2ZYg8DNlKUz
 uJmGFE5v+YvSI1bLkNMF+4MFKZjzBjGrYrQrv+E4zsoRpzDA7rpgXA2eeR4FcEYyzawmOm/GqVs
 efiO9HuNGQTWpNcPjLLmngiFWKsWsgA4Vyy0mG716D9PzppaWt4VukQMSnjtncCilO2l2mx59tU
 1G43aq538mgtKn/dPBw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_04,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0
 suspectscore=0 impostorscore=0 clxscore=1015 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607040011
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-116451-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim];
	FORGED_SENDER(0.00)[shengchao.guo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:andersson@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:konradybcio@kernel.org,m:lumag@kernel.org,m:bartosz.golaszewski@oss.qualcomm.com,m:deepti.jaggi@oss.qualcomm.com,m:harshal.dev@oss.qualcomm.com,m:herbert@gondor.apana.org.au,m:devicetree@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shengchao.guo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 70B877065D5

On Tue, Jun 16, 2026 at 01:00:32PM +0200, Konrad Dybcio wrote:
> On 5/26/26 7:12 AM, Shawn Guo wrote:
> > From: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
> > 
> > Add SoC-level device tree include for SA8797P, an automotive variant
> > of the Nord SoC family. The dtsi covers:
> > 
> >  - 64 SCMI shared memory regions reserved at 0xd7600000-0xd763f000
> >    for SMC-based firmware communication channels
> >  - Three QUPV3 GENI SE QUP blocks (qupv3_0/1/2) with UART controllers
> >    using SCMI power and performance domains via scmi11
> >  - UFS host controller with SCMI power domain via scmi3
> > 
> > Also introduce scmi-common.dtsi providing the firmware-level SCMI
> > channel nodes shared across SCMI based SoCs.
> 
> "across SoCs with GearVM firmware that utilize SCMI for resource
> management"

Sure!

> Is the scmi-common.dtsi actually any common? Are e.g. the interrupt
> numbers going to be stable?

Yes, from what I can see, it's completely common for Lemans and Nord
GearVM variant.

Shawn

