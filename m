Return-Path: <linux-arm-msm+bounces-116433-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id WKYUCXBNSGrYogAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116433-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 04 Jul 2026 02:01:52 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 65B2E706303
	for <lists+linux-arm-msm@lfdr.de>; Sat, 04 Jul 2026 02:01:51 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=aj6tkJ+C;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=MhWs8x7c;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116433-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116433-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 994B530276B6
	for <lists+linux-arm-msm@lfdr.de>; Sat,  4 Jul 2026 00:01:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BE32212F89;
	Sat,  4 Jul 2026 00:01:46 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEEAF13DBA0
	for <linux-arm-msm@vger.kernel.org>; Sat,  4 Jul 2026 00:01:44 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783123306; cv=none; b=K6HVDBERF//tITFE1lJdrb9kbz2GIduPsDW3E5u06qnPiR5ZyNgnMJ3Gf4CKUHAIjxAuFlhOd4GdtxGPFrBCfc+EDKMJHt04GANCI9ia4ae3Kpw9QTtdYXsoX6XbMw/zqyG0wiCj8K5NEaRWY819keUYUTc1rE3NBBL4PzgU8e4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783123306; c=relaxed/simple;
	bh=1hgoD/IDOXH1vzUGVqFb9ZBGpf0yUjB+5Uh0JCZ+/8E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a5J/XV9E4WvOayTUnBASzSg8Sx9O0g789mjpVGrYJeDHZUP5q0+zMLihSrQUo9l8mKpoXHXv+vvBmIDquimHql0ISJXiUmATbA/hQ4+LHtoZuUr1CCsaG+T/hvrFwLoRsBGpQI5obfZXLBKv3P2ROsveqGJam2/JHPcTWcAzhCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aj6tkJ+C; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MhWs8x7c; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 663NJmfr1191472
	for <linux-arm-msm@vger.kernel.org>; Sat, 4 Jul 2026 00:01:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=QQ1NaaNFJ8PFY1ShSI3u30+m
	GGXt3cQTpsIVBKABYcI=; b=aj6tkJ+CnAjtbiEG0jLWSCJIEr4rGF/Ci31o3vUn
	Uofvyifup3YZQRvJrqne9nmT808Rflu7GZNkXZrQvlJ2eOTtcBQrpUB3oicCeW1k
	oDGoM5gFRrbipWzQZKzGJlQAcrtPA3HLTcII1ltpH9f8CUMJUxlmzqW/TjupySfo
	toiYOkAqvwQv0XQN6H/uz5hs1Qqq9BgKl9wtGXMkv4sJOfoaGwZ157lsKvGjQ3Ok
	k9JezHXtJC7TXQAmDE0fgNiNlCnb0sPXKR7tj52NeDExI7FamL/nYWXcEzbRSHe6
	iGhSZSpVlhgim9AL5d8EJWhcFIUQ1Oo73j/EMDJp3/NEYA==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f68jyu4pk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 04 Jul 2026 00:01:43 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5bd7f21101aso1190992e0c.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jul 2026 17:01:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783123303; x=1783728103; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=QQ1NaaNFJ8PFY1ShSI3u30+mGGXt3cQTpsIVBKABYcI=;
        b=MhWs8x7cLODN6ulr3fy/WAzHGdPJU9KSPxMSlYoX7RKlMcLseSrcgqUtaw+KN5R7He
         bPenfWkzO1TUkmKNNCQM/rlkXHYE2S8CgtGQCbXPxdH5038ChWKhkOr26kWwzpthtv4Y
         CMnFugMe1+WDK0T4A8fGSU3dwTZApaFXauM4rbnXu9ZtdTAHoncXDUGwJD0CugFqetEB
         Utgx41LI33Co+EjcJsp/3FdiEv4ZfyNdNryfuN0EPlGIJfbqyRq0KUo3wCFcohVPY1cQ
         AHguyQkMJl8/uY23wUDMU00Nvq8PsdMUR0SylsBi04H1Yf+5PpIna9GYOAgsf0EQqKyX
         zrSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783123303; x=1783728103;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QQ1NaaNFJ8PFY1ShSI3u30+mGGXt3cQTpsIVBKABYcI=;
        b=Gcqr6xdXjhESuY1LkBKL/hxlMI5OrN/V5fqrnUWrKCFDtt3tKU2cQj+nUex23Ixtul
         XHVfO6P00InYge4RzCX6wKCKsHk1xwskUMlGyAYW/YG/XWCNZTMnrno9Ho2LycNWhnTt
         yIPUvLd+PMrZNVLOwgNWu88kJjqnxj9lgHSqtU6fOH2gJwErwmy3uGAAPg9A7oeSUF3c
         9+NiUgT+qOjNyjtPdNlZqla3GmcwaSeUd6TJg0KPzZTf/NP//lw8jxou9EIu/ADdg0Wr
         roJHOQ6Vhnm310Xka9UaXdFDL7M2Zw1BQCBN/lrvqhecrcV5k/fDVcul7L79f/bBN2iE
         xsPg==
X-Forwarded-Encrypted: i=1; AHgh+RrKcNiir+du/IH3FCkEnnT8NO2fytEZfuD7iXtCX3GUoHtoqsL0hbBGWkFojrsvtKJFTArU6UV9NK9p52bd@vger.kernel.org
X-Gm-Message-State: AOJu0YyVbweQ0entcFYm9GoJXnT13wIBtqJtBNQ2Al/J4xOD+7J86+xk
	MMDrCa4G4nw4yJ1oyfrnYa7XZhBPE096CU6rjuG43nGRm1ABlkIb6v1hc6WiKp/gSZ+J+hFfDgt
	GJ2pflCnZgVBY2nfwBzjk9ZY3H8+7guv4YES2tHnSMmMbW6hjoz6Vqg22iLt3tj+phNZE
X-Gm-Gg: AfdE7cn6aMrp+OpCFtNApQ/Ysf0kIAobWp4tSHknsIdjY7+KClmm92o+Ydmn9NE8/yx
	BRHlmdHJJSRcki2sVfWPWlJAPp4XwOTClkkj3D8FVQfDHSyWn2OIyk5e/D3c/TMB0MfPTe1gDM9
	lncZiRMl4IS+GlPUuqlwHCi1gnV8nAgw5mat7lHojc9BZjVJ7HxvnedAfeWkflF6Dm9l/cnhZ5i
	qswiw8HXOgA7iNokL8c07zgyxqtxmZD2C5Ur+LXf6ALjO3piamPaA080bccllEnLcxzeCXnE68X
	Ius/8471NMaD2r9EFoSz8ttgWcuSPZE6A/5BB7iIsXmQIeUD7Gdytw3aoxVu53zh+VEzNOJO4ws
	4vyjG+usgR3fxGnssYAh8radU78sTm0njLeNhKZnXk++gYQ9zAJP1gjQ6HaIXgDDSsi6q92QgF7
	3OcTMhRjfqzRfzVezEaxxHisRe
X-Received: by 2002:a05:6122:d15:b0:5bd:fc20:1fc3 with SMTP id 71dfb90a1353d-5be101c9647mr651858e0c.4.1783123302741;
        Fri, 03 Jul 2026 17:01:42 -0700 (PDT)
X-Received: by 2002:a05:6122:d15:b0:5bd:fc20:1fc3 with SMTP id 71dfb90a1353d-5be101c9647mr651766e0c.4.1783123302203;
        Fri, 03 Jul 2026 17:01:42 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aed13bb7dbsm854661e87.45.2026.07.03.17.01.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 17:01:39 -0700 (PDT)
Date: Sat, 4 Jul 2026 03:01:36 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
        Elson Serrao <elson.serrao@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
        Souradeep Chowdhury <quic_schowdhu@quicinc.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/9] dt-bindings: soc: qcom: eud: Add per-path child
 nodes for UTMI routing
Message-ID: <ur3haudwnsvg2vpdwrsea5ik665xxafsuz3iznvjctw6algz2i@amy37zfoumoe>
References: <20260501170635.2641748-1-elson.serrao@oss.qualcomm.com>
 <20260501170635.2641748-2-elson.serrao@oss.qualcomm.com>
 <20260703-manipulative-mauve-centipede-f8c95e@quoll>
 <2105eecd-b2e1-48b0-9795-ddffa8e43937@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2105eecd-b2e1-48b0-9795-ddffa8e43937@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDI0MyBTYWx0ZWRfX017jo1oDr/Z2
 RRSUDBC8gFl0ok5SywpJE9IrGbA/wSU+DGNMr3WJsLwpMNec4r3vw+aCbHa69UqXuezSvWcIETg
 PjdOeH2YpSzN01x6ABPSU9qSF2JcthjguTvEB9ZHmZXpfsiRxB1B9K7c71uqAqA9bfM/zfSakxl
 8X4W03gXRWGbvQUAf2LeHQrcGF9vIH0bDUqxlc+L216Qbu/FVtwmBgvAVDUm33PsTS2nlZPZALh
 zJy1mLFVJwGmxr1NccqFEBJPUEJhJu/kHeMx1rCdmYGIiAitrzlRaIncMPFjVqJzFr5zm2dtDMp
 RIQGsOQNH0RuR/St5i6ygpq8Tuc8w0i+Z0k55AXpEN0ZP0qymkSWHa3mfGat7crgrCCCmcSiq5o
 EFq4rQ7CrSVwSk1h7g7pAGccEKl7rMgxZa+grzERQoa6+inTw5e7T8lAUPk09I5BLpANTFtPa4+
 pKj1ZwLm1daUfwhN3Fw==
X-Proofpoint-GUID: MVznbC0aOItN9CQn93dSdhXCVzPo6NYP
X-Authority-Analysis: v=2.4 cv=QbFWeMbv c=1 sm=1 tr=0 ts=6a484d68 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=mYtunGRVIO_ZSpXlA2wA:9
 a=CjuIK1q_8ugA:10 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-ORIG-GUID: MVznbC0aOItN9CQn93dSdhXCVzPo6NYP
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDI0MyBTYWx0ZWRfX6ZJvaIPmcLNz
 UUZF2zqgycA4f4JcrOEF+oolRJIs09QkjZJBhz3wycAlGftU1F93XrAJr8JAZzs7G3AMEZqH2ea
 pQQpfyS2y7Tb3V1dlVjFw/kebVqBgIk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_04,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 malwarescore=0 suspectscore=0 clxscore=1015
 bulkscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030243
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-116433-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:krzk@kernel.org,m:elson.serrao@oss.qualcomm.com,m:andersson@kernel.org,m:gregkh@linuxfoundation.org,m:konradybcio@kernel.org,m:krzk+dt@kernel.org,m:robh@kernel.org,m:conor+dt@kernel.org,m:quic_schowdhu@quicinc.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-usb@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 65B2E706303

On Fri, Jul 03, 2026 at 10:56:19AM +0200, Konrad Dybcio wrote:
> On 7/3/26 9:45 AM, Krzysztof Kozlowski wrote:
> > On Fri, May 01, 2026 at 10:06:27AM -0700, Elson Serrao wrote:
> >> The Qualcomm Embedded USB Debugger (EUD) can intercept one or two
> >> independent High-Speed UTMI paths, depending on the SoC configuration.
> >> Each path is distinct, with its own connector/controller connection
> >> and role-dependent UTMI routing.
> > 
> > You miss SoC specific compatibles in the patch. Binding describes ONLY
> > SC7280 but you claim here it depends on SoC (not sure what is a
> > "configuration" of a SoC).
> 
> The hardware configuration - some (older) SoCs don't support muxing
> to another port. The binding only says 7280 today, but after some
> version of this series lands, we'll wire it up on basically
> everything that came out in the past 10 years

Yes, but I'd also prefer to see exact words / platforms / references
rather than vague "depending on the SoC configuration".

-- 
With best wishes
Dmitry

