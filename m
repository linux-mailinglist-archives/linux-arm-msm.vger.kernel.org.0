Return-Path: <linux-arm-msm+bounces-104071-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SJC2B1em6GngOAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104071-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 12:43:35 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2419F444DBE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 12:43:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 2ABF53006221
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 10:43:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C6943CCFA0;
	Wed, 22 Apr 2026 10:43:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NSeTiXaF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="M3RA2oL7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28E4D3C277B
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 10:43:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776854609; cv=none; b=WYrDSRKctn0bFRllwLU5+ar/aK3DX8GRAET/47D4N4pbhvxsqrJReu7VACM+zW9+NY2kPAZ+WgnLMYVO7n7jVugc/Dq99Ta6iaiooTzR1F7lR0a+ZN21oXRGnVJNeEBK4lInwx1q2x4cOzw9dYC5cQSCxt3dRZKeWqT2qvRmpHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776854609; c=relaxed/simple;
	bh=8wklWtiVxDYxVgHNwWNekFxzc3gACA/rQ1gC+kqtsGY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ENPWWBorQihHI7Nhx94oQ0NDlfZURfSmcBO+rCTQn2mzH2OPsAhGkEsEZKlELfz+HjRBQtKgox0mVG5DMD8e64tY1LPAlmCzPbWTHm9Vjf9o0Z1pGNhp5lpqhnQk2R8v1R6ccaKlu78Y2R/3wDjuuPkRREwEHPMZGV6QdN5El7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NSeTiXaF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=M3RA2oL7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63M5gkdr2209292
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 10:43:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=hRrn8ywoRO5vBFN6sqKv8Laa
	itGx6MT0mFCNEXlt+jI=; b=NSeTiXaFjL6ID3nAveNpaMhkDwnZkDa8X1eLz/82
	DnNvJ7DeZUaZNNmsZJHTpB/uZg5fMufu8+QRpq5jRj4qD39yjBaXFpwDh+Jz1Dst
	o9dLwVZz0hfyPC+Ssg8vOKNvQBRrqeCIadZLg/egiJBcMRJxDwVj+PW9+n4wCvmT
	yIF1hmoMPylK1d4TBdqSXlXPphLDeZrrSajdyD+2EqFcieAdH3OyGcFpe6DDJbwk
	A5zWVAQEQ2N7qMmLIi2u1fbodofFsqLGbfgvbg+GUV/E5tyJ8nw7ab/8+M36vaA8
	rkVLAFQ4Olr57xfUQ4epZ9O6phmwjGArfKKozWOUQA08Fw==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dpengay8p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 10:43:27 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-12c726f4019so6637020c88.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 03:43:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776854606; x=1777459406; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hRrn8ywoRO5vBFN6sqKv8LaaitGx6MT0mFCNEXlt+jI=;
        b=M3RA2oL7kPxIRqJhmsgGkEdR4xwic83CG7jSUDYOuPAknyWtFbEZ/RaK+0RYto3Ptc
         5xmSvnuSHUMhZaKWvHQe0KRj6+WUwrORW+dvtZt5KYev1DiVsllq1yFZhq8JY81QlsGn
         nRsELaQvRd8vqWsSJ8UCPiwyKv0QzJwiXcBhZ8+pwY4quQ+X7xBFdo1q0JDvXpztBFzl
         KTfYmeKO+DZGyfU60XrrZy/I19FU7EL8ZDNzKiAVLThSgvc4EO8BbSkztDrkSpecdbsc
         XoTVqYXUkXFPxdTmQ4knLYzLA03ucTe5ZPlkS5y/F7exMKwEmbLkr4lLbJ3NN5Twfuc3
         cTqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776854606; x=1777459406;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hRrn8ywoRO5vBFN6sqKv8LaaitGx6MT0mFCNEXlt+jI=;
        b=Ecr2/okiYQwPqqV18w/AznY3Clgp/C6CYaECeOAcp1g9lM/Y2hmc3v/PXykaWM0wb3
         BNOa7f8RNTPbSpoShpZOPLsoeKRL1plL4iqPWEX2gB9AqxhsfAH6SCVCkrT1RnB7ptPE
         N7esIkmJzIjqB7x293dl6TIQfzdB64YWy18eQtpVJ5QlUUg13T01JZfb/tIGOp9cK7A9
         /+FDt+8kFxpb9eTKoAK6WeaMrCJZu3FjbcNT/4/AdC1VBXPFhR1m0KgZrbb+9BHGXdNZ
         ljor1lFO1FEPLSMSU4An+YrLbwZxSSIluwSI7tUGjjRrMD6YtZBZxVBgHE9yd0InF4eN
         0wvw==
X-Forwarded-Encrypted: i=1; AFNElJ+wbw9ErkShug99K+Xf6nJfZjnHUUww0WImGL05TfrLbCBgZrnfmwrKTOQEJtO0gr2qeSvm9Z3aGtIzPvUL@vger.kernel.org
X-Gm-Message-State: AOJu0YynHsF6ieYv6CxhFAVih7HkIZg81KpcPXmLIXmwxR6mb6A5TmUK
	OB4g18yyrbPxXor7hzRSNxBshR1QjMUf8VF4um7fxGENhC0HJ05oibttmoD1iCoG2aJXOqgdVsp
	RJXP2gorcg1MqmUgR7r2K2HwfduehJrj41GmlbXWK58S03S0aU7XtkSS50E7Y5k4XvHX6VQxZhe
	6KE1E=
X-Gm-Gg: AeBDietonUbWHZapIxH2Nbc6vHqMyTKVk0m+0Uzi31xoUwD6PywQMTcOwRHJ+4qDjke
	KIUa8LO0GHHuvN0YJArMHZPPz9MD0iJGfZrOK1TvOT+7g4ypN9tBIvwcpNZ12AGvuZ1K2qFnjd3
	ZaO3YKKIOc4A+TDDoP+HuCIhsT8YSBgCWh2sBnbKm7pFF2hNMx3oTQtuiVF1MsdbSf4qmxwJhL+
	RUnFe7o8zrpjlTmmw01r86sMKz2/Ha+Uv6euFF57iM1GaRZ2QAsyasL/Bw/oOLjvXqTovZYbyEL
	d2vrs9+GpzrQD26ldRVaglEV6Qfynet7K+mr2Yl4cPULf9JpNKb4C64AUVdiwD41qrzxj6TM92a
	9Z//kwloclKBYiThM8o410stZb4koPD+3GwLc8MLzka2L8xMAJ4AQ6O3FussNkykG+HsKydn6Ny
	4=
X-Received: by 2002:a05:7022:4395:b0:128:d24a:a5ba with SMTP id a92af1059eb24-12c73f90c45mr11089495c88.20.1776854606000;
        Wed, 22 Apr 2026 03:43:26 -0700 (PDT)
X-Received: by 2002:a05:7022:4395:b0:128:d24a:a5ba with SMTP id a92af1059eb24-12c73f90c45mr11089471c88.20.1776854605409;
        Wed, 22 Apr 2026 03:43:25 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12dbaab165bsm2589231c88.6.2026.04.22.03.43.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2026 03:43:24 -0700 (PDT)
Date: Wed, 22 Apr 2026 18:43:18 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Jassi Brar <jassisinghbrar@gmail.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: mailbox: qcom: Document Nord CPUCP
 mailbox controller
Message-ID: <aeimRgvAORJGer8d@QCOM-aGQu4IUr3Y>
References: <20260420034932.1247344-1-shengchao.guo@oss.qualcomm.com>
 <20260420034932.1247344-2-shengchao.guo@oss.qualcomm.com>
 <20260421-free-meticulous-beetle-bb3fcd@quoll>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260421-free-meticulous-beetle-bb3fcd@quoll>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIyMDEwMiBTYWx0ZWRfX8tYqvd5MRAii
 mr4qdrsJNh9cNZ6qJWIpBQCMH/9smggHrOXNLJ7JVigwO0lprydXxaLcYSqbIFMNQGU0QVthA0d
 C1N9StqbLcjYQziRkzyLvHzWKVwxbGBYOxC8wW12kj7GfmqGQ5nFWSB9TeAX7RTRoJykkAQWYMg
 884k4o3XVhXfohN/411YC9IG7DUGQog2/ZrGsAYuaCbxpFbdg73Kgd1yDvsySWlS8K24Lmd/X3s
 4331TUQYCex9B5GIPvK/Rjfdt+Qs9Pa1dkVRvH02Vemeh7bhMN44OFSdIeot0vUA/KnYD1WFxaK
 JnYqZ6+9I5qsQ90GxbYiOlUXsvAycCY4Wr5vlQpSdGM6Ne7ErohlKeR3FUAww6fr/0LDtCBz/PM
 xxhZF87z8v7kqod03XzPfcLiZalVauMgVxcGp+EvBAu+5w7eeEp+JC2M0Sb5pUyv8N3RGIZVLN9
 Hn2rXEEdGRtykjmpbFQ==
X-Proofpoint-ORIG-GUID: -zWJ1wq41WT-pVyRaVDiXNySxJt0YME9
X-Authority-Analysis: v=2.4 cv=RYygzVtv c=1 sm=1 tr=0 ts=69e8a64f cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=Uy6chZUXMGaN_UA6pYUA:9 a=CjuIK1q_8ugA:10
 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-GUID: -zWJ1wq41WT-pVyRaVDiXNySxJt0YME9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-22_01,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 adultscore=0 phishscore=0 malwarescore=0
 suspectscore=0 bulkscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604220102
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-104071-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[gmail.com,oss.qualcomm.com,kernel.org,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 2419F444DBE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Apr 21, 2026 at 12:30:11PM +0200, Krzysztof Kozlowski wrote:
> On Mon, Apr 20, 2026 at 11:49:31AM +0800, Shawn Guo wrote:
> > From: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
> > 
> > Document CPUSS Control Processor (CPUCP) mailbox controller for Qualcomm
> > Nord SoC.  It has 16 IPC channels, compared to 3 on X1E80100 CPUCP.
> 
> And more channels does not make it incompatible (see writing bindings or
> DTS101 slides). Please provide explanation why devices are not
> compatible.

I will list it as compatible with X1E80100 CPUCP.

Thank you for the comment!

Shawn

