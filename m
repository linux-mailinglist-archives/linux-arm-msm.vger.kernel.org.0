Return-Path: <linux-arm-msm+bounces-112824-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id zKRKGvc+K2o25AMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112824-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jun 2026 01:04:23 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 57DA5675C0C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jun 2026 01:04:22 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Sv3SWw7q;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=JuxXS6SK;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112824-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112824-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 464CF3010805
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 23:04:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50FD739EF20;
	Thu, 11 Jun 2026 23:04:17 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D67D38E8DC
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 23:04:12 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781219056; cv=none; b=p+yietG/YT7vQaukxJEKFFybIqpQmq2acQ7o+BhrqnDuDHzKdbxJCPdfBXxc/Lacb5CqG5D1UU4dnyxfZLImG2PsJssG4al7OVqykrQqx+DN7jSA031GgNi7VEvXNnWr43JjcttMf1gQKfB52fR5f/gtUXxFMgPb0FQQAsFjp50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781219056; c=relaxed/simple;
	bh=/QCiXj7xop4Q/ete4xTHRSL0F+zfYpEaq2+k2ehu3FU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VjykOy5qTcxtsVMZzlu0ynR5pQ6ws3EgfGWOsySWM6Z6elYjLOMCghC0SBg6v61u1EPwPMfaPqgny5lrIyRa6oEI85K0DlOOZxuzz9tPKxMYOl9vuB+fHZA5G9kDb33CZ+hHUc25QIAr5Y/tuHM//XfzFSfM+Y/SCRwNSjuo4R4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Sv3SWw7q; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JuxXS6SK; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65BMVYnB1947821
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 23:04:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=XVa75DENJyCmyBmxgHD57kf8
	iiHjAucpu9WYVIB0HPo=; b=Sv3SWw7qOzkvh19xLrsp1uTQqv5ff8ujBiAJLLOb
	hOaF7gSyrpgp0HO2J6Sdb7zYDR44WuqBqDq3n4uNgaBJ0IIQqKfJYEOhn+CBF+Tt
	LQmC955HEGUy+bpEmjS8iLEtFdayPaEvHJfhZY2BTYkqg1K/C6owewi/hq2q37HR
	9rcF1llQb6h4EQbjAt429JdV6FblC2SBuNRDhG2oekwu7byDye1zGidP97qlA+HL
	7bn2qtFhmIFPYjv9g/UJZaJBMBYy7X+fqnkrnvyk1L7x3D92vaCzQIIgNhQlX2qY
	i4NRYVUA8xWCVhRliHkFyFDHzQW+g5KMOLYiHtnX+gGIMA==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4er2u40s43-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 23:04:11 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-963d7c11611so125926241.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 16:04:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781219051; x=1781823851; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XVa75DENJyCmyBmxgHD57kf8iiHjAucpu9WYVIB0HPo=;
        b=JuxXS6SKAOZD9J7ewW3020aKgkqnbsGMu/UIbMuNhVO7JWtL3ZwxSJlUyzgFxnjPaJ
         GAnkM2FclKsSqJBCl2UnItthfieC0+xQcYIrbVkSxcY/Ig/rDF915wPECgTOGl8RXM7g
         xbz5qRRCy84XhXTJMnvjudmcNJVQxdHJQRQLX3KHRK8pKzgCqhRzdRrRh9sLSQBwHKT7
         lgf5+m/mX/sBjE74Cd3++WK+PhuegmfbbTTmPpH7lMoeKh8kgHP3ZPsoFNy2a02SHEzH
         FlrrpYKsJW+bbW1qO+LDuREO0kmjZVCVM1tAKXggZMo5yZus4lVLPhWpk36sRhmS/j9V
         5PmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781219051; x=1781823851;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XVa75DENJyCmyBmxgHD57kf8iiHjAucpu9WYVIB0HPo=;
        b=gNV94CiciWjje4tAKpvM76PY2tPCFEO0fY5QwktakYHPllHQ4VsAegrVh8LsW9x0FM
         38EdOaovv765o5XxzbYnUHMm+goPnH0Xuz0CU5EpPwrZmAbGGfpgK9lAlCGNFPqq68DA
         W3HRxOSBm4oXtogvIbnokGHynpoeJdYyb1Whr89Zf/vhR5TK1YBPUPN2hIOO0Rrrnak6
         pIvi+eaAeCXe8J19TmeZ2uBkoxqOumuOMskhARHhBW/KKemsLCwzMWavnBB4kkpxpjOv
         LBnNdx2TCFLkL5Di1iBMqaIMJLoB0TrwMXxLqgbta+4J4FIKecstKd3zT9ywEYiuGxdw
         esWg==
X-Forwarded-Encrypted: i=1; AFNElJ+fZPEKbNVFeIYX+jsQsg25CpZhjka7C+HoPgBgcnGDpn/ytMKOZjO/sc1M9vxa7S9MMVXk6ZTEBONkNmDV@vger.kernel.org
X-Gm-Message-State: AOJu0YwqbiUDOuK8AREUKf97CgGXKXyf8xhE8gf5iicHRb9bujFlEZfa
	z/a9io2TQ8/RKEkgg5SW3Xdo/ov+zZAZobw/plujZkGk8ru0W1ednkaCSrCwwadaJNn3Nu97DjY
	TZl3zSpA2ZcVT5g8UM23x+v89Kmu+CD+q84GkjWeTj7D1tAAhsFRy2hmpmSQfinApZP0K
X-Gm-Gg: Acq92OGGE9X31dxJn4LmA4bPuHbd1j3el9mtjkigV0b36NVQNyElR77hoynhAAtbQkp
	wW2O1A0NsH58SHAY/mm4KrSyNKWr4l2PrtBKa5heW+D7RruIXgGWdCUsdRqYBj6o5JrbtunY0ob
	hLb82SRM86GFKHXkc06F9FxQwtgv2VYQJY+htmqlIIKuO4LMHGuODB8YgK4ZYwpU0zb9Ez9OQvX
	4i7S7qU+QF9yZ0TwayAiC9qgGR+BhmalFAi3VZtqhylae6zqhTBbmKYoZ+VYAOVBAq1tr1op3+o
	rvUNHjuvQjWEY8kJM4hUwFHfH+IuYPtT8N7hXYSmQ7fD+q0vixRWIMQrn1IGOEBgdsQk77zmotK
	WbH3JwqgcYEaufAWAtNR4Sq1YB0t9pjedaKd8zx0EVD3xu8/pawOSFw5XR//85JZekqWpqEgblf
	i7PdndzBUCMKwY9GzDefHPKGSIbCeeCb4Zf9I=
X-Received: by 2002:a05:6102:509f:b0:6e3:c247:1caf with SMTP id ada2fe7eead31-71e88c57a48mr119140137.17.1781219051342;
        Thu, 11 Jun 2026 16:04:11 -0700 (PDT)
X-Received: by 2002:a05:6102:509f:b0:6e3:c247:1caf with SMTP id ada2fe7eead31-71e88c57a48mr119122137.17.1781219050810;
        Thu, 11 Jun 2026 16:04:10 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39929c29b0bsm1128621fa.2.2026.06.11.16.04.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 16:04:08 -0700 (PDT)
Date: Fri, 12 Jun 2026 02:04:05 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
        Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: glymur: fix QUP serial engine IRQs
Message-ID: <hdq5iicr3sawlkhxmeut4ms4n2x7zocwva44lhnjqjfneqwtwe@3amlnfuuanie>
References: <20260611-glymur-geni-irqs-v1-1-269428faeb6d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260611-glymur-geni-irqs-v1-1-269428faeb6d@oss.qualcomm.com>
X-Proofpoint-GUID: ZjPKdz8B6XXPIC1KPKGW59al84j8izzh
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDIzMSBTYWx0ZWRfX3zCESUXFIx7D
 L8Rf89yoR4pKHftu+FDSO917G8RyRWwHUToTrUrEBfhWDAy1mvyAkfp4Ok0s+5H9vHkwEX0PlYp
 ljdDOjnzidx7wk1nVIdrc/BlfgUhB8k=
X-Proofpoint-ORIG-GUID: ZjPKdz8B6XXPIC1KPKGW59al84j8izzh
X-Authority-Analysis: v=2.4 cv=N94Z0W9B c=1 sm=1 tr=0 ts=6a2b3eeb cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=VOXDmvlrnw2WqKqSkOMA:9 a=CjuIK1q_8ugA:10 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDIzMSBTYWx0ZWRfXyHk+TXGITesM
 BuoSjUHLxvaMrH7TXCIQ+M/UtJMGJYAQJXlKhtFyhF+ZYljgFMaQ7+igJiFE9Tp/P3Wl0dY7IIH
 ppy2mZsttmGkd7wiOOmSqVhIIXiP//84WcIT0jXt0xswBDiASapoXDDRanDUKMt5NI/sYFQV2HE
 fJxqnybBmSAYTpLFQZsp8HFjk7MW7X3h+sftpzQmPysafWGjFKw+62oEkCacqH/yDQL6XYV1MLV
 ND/QWIGdVWnsWRs0F+zUb/wGEYzTh5q/8lCSRLblr33IBvm/xgAqkaS5YpU/4BWWXApVhoiLwtB
 mKr5UXcJTHTKD5L94Tt7qHzc+znt/un6bji/ptjhqTvyOhsx1fQDd0t0ySpGS0sPI5uGPm6F2dz
 ARPRRNMP1+VAqJtqrD0dYIMzyjzHsavyokEKDcpv2n7gaLL3pUmOA+dYWw/mPDA7ltMMK+s5k9z
 ppoluqUlDDLXx1ABdAg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_05,2026-06-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0
 priorityscore=1501 adultscore=0 suspectscore=0 bulkscore=0 clxscore=1015
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606110231
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-112824-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:from_mime,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_RECIPIENTS(0.00)[m:bjorn.andersson@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:pankaj.patil@oss.qualcomm.com,m:taniya.das@oss.qualcomm.com,m:manaf.pallikunhi@oss.qualcomm.com,m:jyothi.seerapu@oss.qualcomm.com,m:jishnu.prakash@oss.qualcomm.com,m:maulik.shah@oss.qualcomm.com,m:sibi.sankar@oss.qualcomm.com,m:kamal.wadhwa@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 57DA5675C0C

On Thu, Jun 11, 2026 at 05:22:37PM +0000, Bjorn Andersson wrote:
> The Geni serial-engine interrupts from QUP wrapper 0 all fall in ESPI
> INTIDs space. While some of the i2c instances has gotten their
> interrupt specifiers corrected, even the other functions on the same
> serial-engines are wrong.
> 
> Ensure that all the serial engine interrupts for QUP wrapper 0 matches
> the datasheet.
> 
> Assisted-by: Codex:GPT-5.5
> Fixes: 41b6e8db400c ("arm64: dts: qcom: Introduce Glymur base dtsi")
> Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/glymur.dtsi | 26 +++++++++++++-------------
>  1 file changed, 13 insertions(+), 13 deletions(-)

What about the SPI / I2C controllers which are a part of qupv3_1?


-- 
With best wishes
Dmitry

