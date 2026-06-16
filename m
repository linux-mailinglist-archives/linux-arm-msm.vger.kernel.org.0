Return-Path: <linux-arm-msm+bounces-113455-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id +dPnLMaBMWqnlAUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113455-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 19:03:02 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FE36692ADF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 19:03:01 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=HBcQsOmQ;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=PxUkZ3W9;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113455-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113455-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id D2F29308439A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 16:50:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0916147B41C;
	Tue, 16 Jun 2026 16:50:27 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A58AD478E55
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 16:50:25 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781628626; cv=none; b=UUgYgvGrtGImdPVL4Yutfu3RpcEdDKq5YnQJ5FkB61FBCcVWI9GBPS8Ehms9t11TfbA3H13dPuJUOhaPrepR7JkYSttJIqX+BJPFxsytGlneIWgzuvK0flnUPbQdYapwBLODChXLMU/4GJ4c8PBhjsKCl/TpkItff0OsRCA7744=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781628626; c=relaxed/simple;
	bh=IeLUcKceMGp4R1jgMISZkNO7RSur2PrOa7F1GuYJITo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fobMbKJlthT4BpwxctHFXb1gi8ui9B7bII4G9EPbPD9MahvCEuDoJR1hkZy59YqWojWnV/MKRuFLwyM0uSPOuvSS9ZnaT1d9MqqCAj9ay/FeyNM4wt+FQmCYxINaChStw9v97YvOfJ/N/1jMb1TqOXgeLtf6+DDNMSq3D/WRKSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HBcQsOmQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PxUkZ3W9; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65GFdlA73997375
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 16:50:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ZOml+89Fh4slDZjDTDeUJgvR
	UxvqEHajVZitLYJCVjk=; b=HBcQsOmQY8YSSYu1Pd7AolxN7wxdOV5JaMmftSza
	1HmnymCwzB0EcCCZ+JHWjGiizsEHouhQPLgJtBorYRsBceIJMn/PdvlvpI/T5KqN
	3AbZMx7/dLKqnMSFkgyOhbbDaufPuy4VSJQNwYKOatlJuZMJUx6VC1ycTewcIuau
	ygQ9FUD/2J52U0O9X8Wku9yfzKGEnp9tumOCHz9H/uujiWMm/gHp/5CGLoR/KSr/
	xaDWJDrdvOsZxAQPnfxJOsH6bzoKNpvIRFDf/gTy4C3JMhSj1EKDnEDGV+2jOvDS
	s2moZqVXkPRroWF42OTK0RTB82EKAbFz1DQCgQWAWcjHyw==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eu09kay5e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 16:50:24 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-84245e2bb00so4235118b3a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 09:50:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781628624; x=1782233424; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZOml+89Fh4slDZjDTDeUJgvRUxvqEHajVZitLYJCVjk=;
        b=PxUkZ3W9pVQyvuiHsXTqube+ha/EBv1GRztZbo/wKUGWW2/x/G9cm+PznGkcQODYU4
         ztZn7rNG8ZTr0NQWyX8z2Qn/UVpbEDZ55zIlUyLKG0kHaC7tmSG04+xH9P+esxdkaPnb
         mbvS01TxsI2wOVE3cBxUA/aLot0ORFRsiv7NZR5PEg/CK/Eyfm+CG0OHwZ5hfqZYVRQJ
         q6mv8QzWCgBNx7axmWsaARY6w/XG482B0oyUw3bd/MP5WCI5ZjMFfecTdlfvJ5ZJxYkM
         Tw6oWGl/yhIn6qQF4DYKuqZCgQdQMHKsZDQITb1Yr90AqViQGSZFHY3MJJt4CSm77Lzl
         u7pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781628624; x=1782233424;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZOml+89Fh4slDZjDTDeUJgvRUxvqEHajVZitLYJCVjk=;
        b=Bp5q0CeV4NVoob1LMSYgBd3UrNk6EZBs8HQbr7Yar6O7Q3TDGDSebVsALR3DiY+4MP
         U5/FIjz2ZZ+5av6sf6gGgB9bXsOuepxIgC9uKGKYtzz7IOc0Skak6pvdyr2W27J1rqQ6
         6ufQPuBkn5EbidrtUzlT9H3f4auBtg+BMFiaCpT3v8sFflh38+GtOLiUf8WydSw67kQZ
         mCG936P9juTmeBRqpWPbgIL6JfuEWxyXugXDZsQOHvARTuuzAkskv8HiRiDpNWvmgPi6
         08Sz7SecCOhfZRkVxM9oG4XlWc/VEoy1fXfGA8BWxOyKgNKfwN1CzaNoTKLsHI+73Mu4
         LEkg==
X-Forwarded-Encrypted: i=1; AFNElJ/+bL1YwqP+jlXInn8Nsw3DIjkO9VlENqsfwNDom/JXjzni2/an5RwvwjABmDs7Av7CiOxr/2J3r+SD7/HQ@vger.kernel.org
X-Gm-Message-State: AOJu0YyXDHlOXVsNza72QPJMMpu/rCm3QkxMkNTzOGGdtuacT8EUot4h
	1nP5S8seKb08Ao966BNZRyQHov4a4orrg9Axt2s3+m3U3TCBp100zZR7sbicS8s6ZG0kmjLCDtU
	+xZTwxs6W0iFMh1A1s0OwTZayg2Qr9GBt9jwhpDJIL3MGU0oWf/ElYNvOqP2cF9NprhtX
X-Gm-Gg: Acq92OEqSt5kembdc0blTnyoEZrrFK21yBPZ7BA20Lr09Uggv21JkuSJlBT/AAYC8FY
	UIm55bc6pIWnMSAzoPZB6JiR39swzZSvFjfkiZI8+2jj7F5hKSCsPgJ4ZJ4ZwXPpGA+XBWOCNjj
	09FUjPUnEc9MBXy+gcl2jBq5Xp/UQZN/5A8Xt/5aK63Ej87X6zeG8L39Eq3e51PC799i2nauA7t
	MheI6uYPZlJwk4MRzX3/25Xsg6Urnlyhe22zm34CtmRNwS+ZZXh9xFqreHyFXKEauDAdth52OVX
	kSBOotiy6i/kJ+Fi5l+Z2HAipSqFqW3tXVMXXqi9WYJebpNoC9aDSC1jvQi8yiBvBqAXEawJ/xO
	Of1Z3OIT8a6IhOYhc211b8PKtUSRG+FR6KP4=
X-Received: by 2002:a05:6a00:94cf:b0:842:5da3:9b83 with SMTP id d2e1a72fcca58-8451561d685mr4168491b3a.33.1781628623527;
        Tue, 16 Jun 2026 09:50:23 -0700 (PDT)
X-Received: by 2002:a05:6a00:94cf:b0:842:5da3:9b83 with SMTP id d2e1a72fcca58-8451561d685mr4168450b3a.33.1781628623026;
        Tue, 16 Jun 2026 09:50:23 -0700 (PDT)
Received: from oss.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8434b040718sm14167850b3a.51.2026.06.16.09.50.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 09:50:22 -0700 (PDT)
Date: Tue, 16 Jun 2026 22:20:14 +0530
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Russell King <linux@armlinux.org.uk>, linux-arm-msm@vger.kernel.org,
        netdev@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH RFC 8/9] arm64: dts: qcom: shikra-cqs-evk: Enable
 ethernet0
Message-ID: <ajF+xlipLuZtf4HL@oss.qualcomm.com>
References: <20260612-shikra_ethernet-v1-0-f0f4a1d19929@oss.qualcomm.com>
 <20260612-shikra_ethernet-v1-8-f0f4a1d19929@oss.qualcomm.com>
 <2cb658f3-f564-4396-884d-d025eaa674a1@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2cb658f3-f564-4396-884d-d025eaa674a1@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE2MDE3MyBTYWx0ZWRfXyznRtK/PxDK0
 P7KYhmD8uF1Y9v6aAbJ0a46T5ZLDB+Alo+FEiw0J3bUyUPwg0NTUQ1IeWSO4vPQvamH0MjLCfSe
 ILC7FcknZlIh5SSH4SSVailh5OBVDOo=
X-Proofpoint-GUID: yGk7t-51EmzsuQUg5X18uqo2AfVdRzgH
X-Authority-Analysis: v=2.4 cv=DoZmPm/+ c=1 sm=1 tr=0 ts=6a317ed0 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=u2jKJf8zFqWonMdemzYA:9 a=CjuIK1q_8ugA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-ORIG-GUID: yGk7t-51EmzsuQUg5X18uqo2AfVdRzgH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE2MDE3MyBTYWx0ZWRfXx3Iv2WSpdj2K
 A/N8iIE26MgqKRAYCu+yPsxZRJCzQdpgsM+LpcoE6SaQOg8MOz+JuijzVCkjTjoL+jMahBaFtre
 uzrooB9ZnLqrgZRROllkFkW/ZPo1tNDQjZjp0yZemX+hs56jdiLnkPCgLcWzbwVTsAAAEqT3n23
 pClqSu3J8Oouzf6GuY3SrMPooREdB1l2nP3ISORZ+wB/jEIQZ5P9blYaoJgJDyf6gRzT1oN6jsP
 tDWACtlhQv1q5+QGa5WnVTdpes00aZvgY14ESPkeYl29T5hm7un9PDa1J1odyDhzec9xEV6WRz5
 lyBCvTqU2r51OT+RzQmWWKv/Wo/NZaKDemFvGhrmmc0CiANOWkyxgH50cQnc6OeP9hT13EW1qa6
 Od3/U2Z64nRlCqb8SeqCerM1+w2UgeNibGsjw+tbjO3MPG/4PIIMxdotKg6hfusN1h4T7x87PDd
 VFMVXe62Qibjcj5EgWg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_05,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 phishscore=0 adultscore=0 impostorscore=0
 suspectscore=0 priorityscore=1501 spamscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606160173
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:dkim,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	FREEMAIL_CC(0.00)[lunn.ch,davemloft.net,google.com,kernel.org,redhat.com,gmail.com,foss.st.com,armlinux.org.uk,vger.kernel.org,st-md-mailman.stormreply.com,lists.infradead.org];
	TAGGED_FROM(0.00)[bounces-113455-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:richardcochran@gmail.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:linux@armlinux.org.uk,m:linux-arm-msm@vger.kernel.org,m:netdev@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:andrew@lunn.ch,m:krzk@kernel.org,m:conor@kernel.org,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	FORGED_SENDER(0.00)[mohd.anwar@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mohd.anwar@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,netdev,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9FE36692ADF

On Tue, Jun 16, 2026 at 11:50:26AM +0200, Konrad Dybcio wrote:
> On 6/11/26 8:37 PM, Mohd Ayaan Anwar wrote:
> 
> > +&tlmm {
> > +	ethernet0_defaults: ethernet0-defaults-state {
> 
> s/defaults/default
> 
> Please move this definition to shikra.dtsi
> 

The CQM and CQS variants have identical GPIO mapping but the IQS is
different. So should I keep this in shikra.dtsi and overwrite for IQS in
shikra-iqs-evk.dts?


> > +
> > +	emac0_phy_en_hog: emac0-phy-en-hog {
> > +		gpio-hog;
> > +		gpios = <149 GPIO_ACTIVE_HIGH>;
> > +		output-high;
> > +		line-name = "emac0-phy-en";
> > +	};
> 
> This looks like a hack - what does this pin actually do?
> 

The power supply to both PHYs on Shikra is gated by a GPIO pin. I am
unsure whether they should be modelled as a fixed, enable-on-boot
regulator or just like this. They need to be powered on early so that
MDIO can detect them.

Thank you for the review. I will fix the stylistic issues in v2.

	Ayaan

