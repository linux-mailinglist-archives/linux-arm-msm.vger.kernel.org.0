Return-Path: <linux-arm-msm+bounces-116452-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 1YDnDQ54SGqMqgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116452-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 04 Jul 2026 05:03:42 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A9A4D706835
	for <lists+linux-arm-msm@lfdr.de>; Sat, 04 Jul 2026 05:03:41 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Vr7fzxEZ;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=EDCFye7c;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116452-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116452-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D701F30179F4
	for <lists+linux-arm-msm@lfdr.de>; Sat,  4 Jul 2026 03:03:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C334325B0AA;
	Sat,  4 Jul 2026 03:03:38 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51DC01F099C
	for <linux-arm-msm@vger.kernel.org>; Sat,  4 Jul 2026 03:03:37 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783134218; cv=none; b=InWfzV1/S73qSxgLYRNWO+U1oF7gmBXrmR3FYZ67v70bj+qAlIFtLv7G8uL7f8MZQn9aMrbCq16zsasaNbFIFyYmnGuri8YS7XXG0JIvl81SuXaPw086H+V9g/oVEOKcWTzJW9XGgdVeoTiJzyEvRdrkJUkn+a2+BJe0/iM+vN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783134218; c=relaxed/simple;
	bh=iEHv7UMoiSJV97OklKpGEpVkcXtx1gJB1xBAgSSkTEc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AK5eGsn4IhjXycTH31gUgHsecrvzrHMIQbaQI1nHbyVjkhrCaoYqHHnUth00CcCnKEV0Loy7H0NrtCZVAwbn17PDY9Qkffdkd1vhfuU5fbCaKSnFrQxQpuj5OTotjrnaMl1uUC+vz9iYnqI3AJkbnah2hmpbbz10JVbMhOw5Yf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Vr7fzxEZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EDCFye7c; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6640JwnK1451611
	for <linux-arm-msm@vger.kernel.org>; Sat, 4 Jul 2026 03:03:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=1tjnRdUqE/YJn3Zw6TREOKX5
	v3gb3EVZKs+4fo/HdIw=; b=Vr7fzxEZ+sXW6VwfMnDSWPzWMFqZDMdtbOaQR7RC
	d0naoaZ+rPk//G+aXK2iCEt8H61B6x+CoFY41Em0SrbAqlvDqwKCgXj5MEDKTtLW
	b2IFeeImGh4I50tmrBaVet5U6qE+aQFYLOgk+63f9dLUZP7PcisTl2quyvdgRp0H
	o03A0pI+1Tze8R6whsEMxdoX+QsIG6J54AFw6TYzl1PcBZQgxkHJ2dmoYKyQ11yh
	ZBtIWx/h3Rde56l/Ab+MSPpFZR/vwUfszF1iR4sH2h0r6y7pA4dEgIspX6I+X1YU
	OVQTGSEu5bCb+f0oQXA3u75ADFG/XtRqUiI9DqBWvPG08w==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6qhng8yy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 04 Jul 2026 03:03:36 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38001e788d6so1438022a91.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jul 2026 20:03:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783134215; x=1783739015; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1tjnRdUqE/YJn3Zw6TREOKX5v3gb3EVZKs+4fo/HdIw=;
        b=EDCFye7cqMdLJDzionzamAZO9GyDlJ9m4VD5/YNOWq3WlI1u79412urd853jCy4HYk
         dmRdlo+Fp0YBC+7bsy81FehWyRSDzTZlV5JKdJ5zCaZl/27fEl5vwnStKo0RM71BlecM
         pqaN8IvoEUtCSgIDCi7Qpolx+TRYAP0OvvKk76gWGsUFtZI8jxFgU/fHSYB5bN3fmyt3
         Pe5sE/U1IzxBt/P0dWRLdd0gRME0nDU+8bI9uvdcqJhdwgMTXzvPVF/9AvBBv1X1PKNi
         TzcjSSfKbKjjX0XKg0O9I97KAP6XVnsQX443t5INwvfGPSZorZ65et/Vk+8uVSRuqp5s
         X7LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783134215; x=1783739015;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1tjnRdUqE/YJn3Zw6TREOKX5v3gb3EVZKs+4fo/HdIw=;
        b=F3NrtZHqA5x4jZb+CqOs5LCBC6Oo8iq7pOYZOFN1CVwBGDrpUmyB69QKOWGFWDqkl6
         +5HiJY8hSxlRiiyjkdJx1G72xQJMBQjBMgqM40F0+2lyxQDEB75C6a+mO0Eru/QSVFOs
         uE+zzOarkQ0birWpGQR48vVuBt0BaEHVisAaw1P7aQcvoPXe62502M1jw1QtPGg9B79H
         6NOsjlrN3IMeiWhTsg2jOC/thKIrX85cAwDCtLiTJRibtBI2qRkB3qOoBQ+JrprNzhTU
         2xYyBAtmERsPNdEMPxpstu+EwIm83SNxSrPLGqr50P+xuXrRz/2HeL5Y6RXa1cdksFyW
         Gxwg==
X-Forwarded-Encrypted: i=1; AHgh+RpR5FgKlK6j46Fp3W7Jtew4kYylkG4xmfPiMyjo66ove6ThOlC2hHGtT6+zBcvdKNFFoFjAjBxdkJbYRwBf@vger.kernel.org
X-Gm-Message-State: AOJu0YyYvp8GSMWrRHk6tc5EEFDLVrEQ7tXLZLAg0yeNFtUGM8f/MF4e
	1nvB3lFr7TcMRL0lLgOJQlR0TKic1adrWMrmjTvczAWCQIhpRC85NqgW12DvDaSTbDtQBu6xPBs
	Fh3k3B3aDVdR4ZaO80Qu5b8qhnQ4Xee59vSb1Jvck4nktL6dn8Os+hT2yalW4QG0tLugf
X-Gm-Gg: AfdE7cmHL//UXY8BREMy5OZkECMKcdUhOJqpeBJY3lYGjdWAJuQqnNv34Rn4+Xxb5gI
	+L5/qxDwxBlGpOmD9Pzi3IC3UQvEF+rjbtHrouyEpcYNmQgSbvTw5O9/NEoRMKvErn1+zPXMLps
	2HLUOwspijzjWLOIik4MAcZRTMuMtgBUxvmKJqBu2Px4atdAc+RtaxzVauJXawordNYQx9f51ME
	IdEG/RG0jSZszwS5PibwSHDNjFCJ0TJcYdaAzNBKO3eQ+a04wrDZB+GXiuI98OY3dOo0Q0OALN8
	OcXwxpCPh7nUawjonal0zCZ+fzbEbX3MKXbRbvBoXW5mQlm00rXHPOtitL7Rs12bPLVw3whDZg5
	L7IaDqIyfea4tedtM3ls1+94vl3SB4t/+fF8xQewqGYMzZPBa7CgJhA==
X-Received: by 2002:a17:90b:17c1:b0:369:a359:b181 with SMTP id 98e67ed59e1d1-3829f5ebebdmr1827433a91.23.1783134215158;
        Fri, 03 Jul 2026 20:03:35 -0700 (PDT)
X-Received: by 2002:a17:90b:17c1:b0:369:a359:b181 with SMTP id 98e67ed59e1d1-3829f5ebebdmr1827387a91.23.1783134214689;
        Fri, 03 Jul 2026 20:03:34 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f3a9341e0sm10181137eec.12.2026.07.03.20.03.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 20:03:34 -0700 (PDT)
Date: Sat, 4 Jul 2026 11:03:28 +0800
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
Subject: Re: [PATCH v3 RESEND 5/5] arm64: dts: qcom: Add device tree for
 SA8797P Ride board
Message-ID: <akh4AEIyhHIQDsOJ@QCOM-aGQu4IUr3Y>
References: <20260526051300.1669201-1-shengchao.guo@oss.qualcomm.com>
 <20260526051300.1669201-6-shengchao.guo@oss.qualcomm.com>
 <65995138-0d0b-4b8f-ac13-8daeb82d1767@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <65995138-0d0b-4b8f-ac13-8daeb82d1767@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA0MDAyNiBTYWx0ZWRfX5R6HguQ7PX9l
 LfTF0Fosjd9DughVrXG6665c3gEUxH6Qiw+6qjuZBMpY53kHk0P7Aa9hAsMhfhTWJGi+fE522IL
 8E9wk26uGVBd1XGVY+JK1xaiCp1UmZI=
X-Proofpoint-ORIG-GUID: qWiABgmjuQRnxQzeODaVQRNlMTwVVhsL
X-Authority-Analysis: v=2.4 cv=J+yaKgnS c=1 sm=1 tr=0 ts=6a487808 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=fVJQK2QLqq40QL6N-J4A:9 a=CjuIK1q_8ugA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA0MDAyNiBTYWx0ZWRfX04nycTcKuymo
 CO1L2sV6fpUAqg3cRCUnFmVX1c7YhRva/KG4bSMe890h8u1zYEjTwSdqW3eQq5XH9LcaYORJii/
 c8GGSIbkI/+4k7zdhRkv5+7jyLYlPFQEm4T+9oimVTK6ilhpsndQcboOEzpioFk5Yer/68NnqFZ
 TQILuHhnjgZqrzl1xy8fgPDJ2vHjiKTR9KaFMybOyNv5W4Rr00okmS1zASFt0kkCXHfIiSXce4M
 SP1P4L9K0H1RNn2nFjyu0katPi+rrg0Gd5fzOTpb+a84HdH6Cu/TR2Pq2O2SIwVmBnVm1Ui8OTe
 f6CFUdKIivEUtavF+ftLEDpqy94pJAldUKYICI/e5rsNsrCZINnKZZGi3BSz3ArY2f9c8t/kIbL
 3axyBTpAe0sf4FT8RvexHm4K/pgFdGOcTS5Q447hSzBBmUiWqzgg1Krrihy/0PTQA4Y9XRFBYr0
 /RgqAiDC3N7wsRLN5VQ==
X-Proofpoint-GUID: qWiABgmjuQRnxQzeODaVQRNlMTwVVhsL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_04,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501
 phishscore=0 impostorscore=0 adultscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607040026
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-116452-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A9A4D706835

On Tue, Jun 16, 2026 at 01:02:06PM +0200, Konrad Dybcio wrote:
> On 5/26/26 7:13 AM, Shawn Guo wrote:
> > From: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
> > 
> > Add initial device tree for the Qualcomm SA8797P Ride reference board.
> > 
> >  - Configure UART15 as the primary console and UART4 as the secondary
> >    serial port
> >  - Enable UFS storage support
> >  - Define thermal zones for PMIC dies, UFS, and two SDRAM sensors,
> >    all sourced from SCMI sensor protocol on channel 23
> > 
> > Signed-off-by: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
> > Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> > ---
> 
> [...]
> 
> > +&thermal_zones {
> > +	pm_kobra_thermal: pm-a-die-thermal {
> > +		polling-delay-passive = <100>;
> > +		polling-delay = <0>;
> 
> 0 is the default value, you can drop these lines

Will do.

> 
> [...]
> 
> > +	pm_kai_0_thermal: pm-e-die-thermal {
> 
> s/pm/pmic

Good suggestion!

> 
> > +		polling-delay-passive = <100>;
> > +		polling-delay = <0>;
> > +		thermal-sensors = <&scmi23_sensor 4>;
> > +
> > +		trips {
> > +			trip0 {
> > +				temperature = <115000>;
> > +				hysteresis = <5000>;
> > +				type = "passive";
> > +			};
> > +
> > +			trip1 {
> > +				temperature = <135000>;
> > +				hysteresis = <5000>;
> > +				type = "passive";
> > +			};
> 
> Do we need two passive trip points?

The trips are indeed problematic. After consulting internally, we will
make the following changes.

- Drop 135 C trip point from PMIC thermal zones as hardware will shutdown
  at 125 C
- Have trip0 at 105 C as passive and trip1 at 115 C as critical for UFS
  and SDRAM thermal zones

Shawn

