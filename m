Return-Path: <linux-arm-msm+bounces-117337-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 70qANfIETWpZtgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117337-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 15:53:54 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D5DB71C27A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 15:53:54 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=fYveQ7fs;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=QIGruPp8;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117337-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117337-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F2A8031D792B
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jul 2026 13:46:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 504E43EF650;
	Tue,  7 Jul 2026 13:46:00 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B86193D47DD
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Jul 2026 13:45:58 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783431960; cv=none; b=POS4NhHF5EbEjIlbDPx4r1TlJptUybHT2SV+yHhERgaLAJlvQHK5sA+7j8eHFD8rCMccvHJ5XFWtsqQx00ls+7xAlYj3Unw4EmrMfXuXd2h2bH298EBtqUnxLQmO80YKetcfckEX3TXdkeUH44Y1j4aw7zkjAiQ0eAEQ1z4tdeM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783431960; c=relaxed/simple;
	bh=H6ISUgvvUmYatElh3G4kdB6ORgdfQA25rvLAZIRdZlY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k/JN9Yjf0Y2aftPP1Ivb5QecJjIkdZBjkEB3/Em6NDnPx2hfbEsLfxTLNL9syrhl+4A2+g407G9hxdIl5cnSLgd9peBSaYCGCpE61gKWUwGyK/FJk52ApjuxzaG8zcjI/nxOgDMd6WZBBO/Z7K6vGG9H3/F1oW3G0qJ+FxKmeGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fYveQ7fs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QIGruPp8; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 667C8pKI3749128
	for <linux-arm-msm@vger.kernel.org>; Tue, 7 Jul 2026 13:45:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=GNX/n6rhA9GuCnykNLXrkk2v
	INoSmJwEZ7raUHgbTH8=; b=fYveQ7fsWLL/LkUWJty2q1jGJ3ZMDK/d6YhoM23f
	qJYFI7GkSyZGQcloGr0XgimmsdsTE+FLyUl9dgxgglMnjdMNxy7yDzCC5Yu3xcmN
	jLjo+/KX+roVzZT+QRQLKQO2EW3w0UywXHIx6/9aCzt0P+HL7sablXASnUktOj6g
	h0KpfUZrHdcDVcxnbMlSCo2Q9DCSgfENfRkgTrjFDMxfYSiHmaY7vhWuUu4wmzLR
	UNfyPFNiA3hIdcytf+lfrmuYWKf/74zeBTswxBNHJIztVUWqMT8bR0zUVTpK4pV+
	I/wYlztAHLN/DVYfSAn9UH5ZobQtytq1WGfvTnR+7pe+CQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8vdj9pfm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 13:45:57 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2c80f89b64bso74516855ad.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 06:45:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783431957; x=1784036757; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=GNX/n6rhA9GuCnykNLXrkk2vINoSmJwEZ7raUHgbTH8=;
        b=QIGruPp86aL0KSJmgUn2DC8QH10gxOV/p30R9gf/5lQ7bpOkrjzdj3Gvhaaap5gCw3
         TBF7yqnmrD/mTvmUjOA0v2kObDfOik6EEcw2yD8m9NHmvKvid7fJcf3ldzq1y+3kEkmY
         0Vi3by0GJkTyIbtGIUzqlqVxTdzTg1Vq+dCtuz/GB/BU+HuJ6HjTd4vwW8jee5uAgdX1
         QoCtgI+wsubhZ9K+5LHHxcfrgNx/avaC02JnNJZOaKb3EsubfkcIdREyEIc/Ev4mWNcO
         VzeBaU8a6ruWJHKK2v9JELndJwUn7VNLDlmAGxjwgG9rft5RAdAWG+DKH1RkgerQRiD7
         fWmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783431957; x=1784036757;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GNX/n6rhA9GuCnykNLXrkk2vINoSmJwEZ7raUHgbTH8=;
        b=ltF1Cun5kK4Hyt2KYUGyE/Wi2HwR7LFbKZoEyUZkpzwAHK1NxMfW2BS5nKyjGYq0jr
         Y4TAb3neuCG0T+c1w/l6BRHC3xzlxraIjUnnbS5bAqWqPRAZvdDckwuRIxe083vK/wCB
         rfodgc3oQzl53UtbxdRVOCQFl8JS+ZetRwAGfd5ihAsTiV9denYYjaFMENk4ifrbJrmT
         uvmZ+oeVNY7GiiSSVLJxZxC36cGCOovCOPH9jGOsIwLJ360Wjuj/AMFCob/p2CkL15WB
         XKieegUiHzI+TzMP9HkD9+dFJ+LATrkpsgwEHMZtCne4OqLOcuHrWHkn6zwNEIH5HVSa
         Wt2g==
X-Forwarded-Encrypted: i=1; AHgh+Rr6glpPSSLLOdn6SRTMJmkqUDQbIsCML+TU9tUFepu6nGDsDpOZsQ7jTvPLpzMIPylffNJubW3BU+1x5vKG@vger.kernel.org
X-Gm-Message-State: AOJu0YxVP9KEppd94DiZftrkhaStziRg7rHoxZzGDFn0aDZlDUVsEJIY
	lp3gjZw1FBIytFjjFemzw787jmm6xNJFETYK16RkuX3iiv2Sbn+hWp6AhSHY32xYgI8ihrb18ip
	MkZTGhtM4BhSL+uOuviDPLLEJqtYH5q/+as7+kRAKDcG4g78sRuDY0KJLmnbMJJnSMmrN
X-Gm-Gg: AfdE7cnMlFyyt17CO+iso0LlZMVT0iwDX962VQYQJg8GOhN5US54TtD16zIX26q7JKI
	1fOGFraBBV8Y4aU6ggrkPIq6qw2EcQReHs15XET8LaYPY8MvTTU+s3N+d6V17T8fgDUTvndvfn8
	oYN3qi+ZM+zu8l++edtpmcRudIXoOW6bs+Ht/uK8tE2zy3LokkQLzJQyMR6D6ut17YU2ylZERAg
	Te/q4VoL7RKdqgPmY6pp0/1UT01vd6T7RqKUo03JkkV36qxKACVyIhMjzsT8IGiF0ecLdWrifMl
	p3TNCmZOHqTw8/JhjM8O6LASrPUxKIw55QX+riBy4OpaFn9YbCZoBahPTqdAS/F3NRwclRM8kmg
	WlVt4AFceqBN6dI03ChC6XNufu1zQahkEv94TeOxNtIMKGzd7ujRlqw==
X-Received: by 2002:a17:903:285:b0:2ca:c799:6ca0 with SMTP id d9443c01a7336-2ccbe614ff7mr50439245ad.15.1783431956753;
        Tue, 07 Jul 2026 06:45:56 -0700 (PDT)
X-Received: by 2002:a17:903:285:b0:2ca:c799:6ca0 with SMTP id d9443c01a7336-2ccbe614ff7mr50438895ad.15.1783431955885;
        Tue, 07 Jul 2026 06:45:55 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9d3d474sm12584915ad.70.2026.07.07.06.45.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 06:45:55 -0700 (PDT)
Date: Tue, 7 Jul 2026 21:45:50 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 0/4] Add initial device trees for Nord SA8797P
Message-ID: <ak0DDpsgemoQBzf9@QCOM-aGQu4IUr3Y>
References: <20260707123902.3868016-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260707123902.3868016-1-shengchao.guo@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=R7cz39RX c=1 sm=1 tr=0 ts=6a4d0315 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=5gf-YUv2CDOQ-a_CTGIA:9 a=CjuIK1q_8ugA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: zNxjxgms4V5JpDN2aG0ScGQvbxUt7aGf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDEzMyBTYWx0ZWRfX6JBpzCpbPi44
 9QkVN6D/jPzq2wq4e98qgeCjy3LvmgCn1ecfIZFioApfQmZ5Q7QcRGNRu9QMCvitbSnfgTJu6Fn
 /p0ruOits6bGZwKraXEnEBGzlrDTN3OarmOEbe2VBeG5E3uH0E0LmmoxvGD4iajCDtYMEJDoEFb
 N6c2+TSG+q8wov/8cO9JOHa9GebtkyUkdqGm/KVLkIzPlGm1rve7AJLAriVTw0vBDxLPDM7YAt+
 ZPDaR4Dp+UkgdR0mrNlHhz5hANsmC7UVfoXR7CAZ6ygehFEPlKAHBxPjyjkbI3plXmcTCuFttAB
 RQX5edcqjXhzE7ZUj4ALDLTIQ6Bf652H+hEQWk8dVz2EuHj/WRh9cl0t8XXWAT1tLPIhQO73eZD
 rNPoPemOwIkCmbuxPudVlNtYdgl4V7M9NJF4jdRWTNUR7wLCtgagpcSbB5NaK2E5cNckY+HZMM5
 LEOuCgmHOghOhLsAY/g==
X-Proofpoint-ORIG-GUID: zNxjxgms4V5JpDN2aG0ScGQvbxUt7aGf
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDEzMyBTYWx0ZWRfX/huOJZoBlAmh
 J1yGzQvgA6dOcjp85izwFNPR3z23h2K1WhEHZnlULTD2jqhu6crO4TPurcC4ZmqKxG4mF4nCWV7
 mP48zhJbhhSIwLTCXjsRNFluEWogCQo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_03,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015 malwarescore=0
 bulkscore=0 spamscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070133
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-117337-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,QCOM-aGQu4IUr3Y:mid,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:brgl@kernel.org,m:deepti.jaggi@oss.qualcomm.com,m:devicetree@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[shengchao.guo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shengchao.guo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0D5DB71C27A

On Tue, Jul 07, 2026 at 08:38:58PM +0800, Shawn Guo wrote:
> This series adds initial device tree support for Qualcomm's Nord SA8797P
> SoC and the SA8797P Ride reference board.
> 
> The Nord is a new generation of SoC series from Qualcomm built around
> 18 Oryon cores (qcom,oryon-1-5) organized in three clusters. SA8797P
> is the automotive variant in the family.  The IoT variant IQ-10 will be
> added later, by sharing the base nord.dtsi with SA8797P.
> 
> Binding Dependencies:
> - ICE: https://lore.kernel.org/all/20260704004408.2303468-1-shengchao.guo@oss.qualcomm.com/
> - I2C: https://lore.kernel.org/all/20260707095708.3801043-1-shengchao.guo@oss.qualcomm.com/
> 
> Changes for v4:
> - Rebase on next-20260706
> - 1/4: Drop unuseful comments from arm,gic-v3 reg property
> - 1/4: One triple per line for qcom,pdc-ranges
> - 2/4: Improve commit log as suggested by Konrad
> - 4/4: Drop 0 polling-delay as that's the default value
> - 4/4: Name PMIC thermal zones with prefix "pmic" rather than "pm"
> - 4/4: Drop 135 C trip point from PMIC thermal zones as hardware will shutdown
>   at 125 C
> - 4/4: Have trip0 at 105 C as passive and trip1 at 115 C as critical for UFS
>   and SDRAM thermal zones

I have to resend to include a change missing from committing. Sorry
about that!

Shawn

