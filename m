Return-Path: <linux-arm-msm+bounces-115617-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id rqOpLOLZRGp12AoAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115617-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Jul 2026 11:12:02 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AFC426EB7EE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Jul 2026 11:12:01 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=b9Sm65oC;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=ISxRAn5h;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115617-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115617-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 924593033EFF
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Jul 2026 09:08:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 516593E6DFF;
	Wed,  1 Jul 2026 09:07:46 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 761273F482F
	for <linux-arm-msm@vger.kernel.org>; Wed,  1 Jul 2026 09:07:43 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782896865; cv=none; b=IT9wzBqAaH8ymRRrREW1uCOsaCslQSM3echh2eGz0VRGDWLXMzvQ9K8V9jO/rCuQD/jbICu/qxVULogXkb3BbslnR0mvm9TCSBF6Dg5M2AJ19mGYjTL/wTxPlbHOkDV25B9MNoEb3DsiTCCqgMbWqJjy6RoaE26vOcURJsGcyuM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782896865; c=relaxed/simple;
	bh=jNUvXUzWVUVxHPQn/XcF+BeGL5jG8XLLXmo5wRcbFoA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G4XzvasUcSidEYKINpZYRyZ6XXpXaNraG0vF34lpj6FnQlYpuJzHoNvsepQiOzGPiX49ZcSFh8OyD2BUcvosYpyXf0UMOfaxowmoa3MOOne9vgEOaSl6WLLYNCmc6XcHTXEKlgDbgViWrbmG+trkT3UitFM2svxNr2h2mB18zLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=b9Sm65oC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ISxRAn5h; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6618G23L456073
	for <linux-arm-msm@vger.kernel.org>; Wed, 1 Jul 2026 09:07:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=SIo/Kr2b/QKYf+Ssgghdgmh7
	XUPBIGLixRtlJEqDmCk=; b=b9Sm65oCwroboIvhH/FZh6GZSnc1MCE3dxeUjsN8
	M+1GEYYTZWAOJJ5iWfkj6EJ7DgifISUbp8om9ZqwXUVg7vTrxDLlyPAwS/18FoJT
	92Xku97wVa0wGtcKKeUS9v5KSpphhOFXnD5Mn/C0sUuTeJzgS2YotpMS36oXUevN
	kLRM1bizvLuv9E2/l+iCE9oKXhHLsp4K6ZeXYrhcpDm3GFafN6Er2BQvWezO0NCV
	qQgcy+ZKX2BBk9fKLOd+Emzj6TGwA7xrGB9pAje8tmuV66nBgUDce8ILW1s8UtIg
	hKDoSYdFZgQ+ixOBzebQzLkQji/YUzzSk7+pZQGBrDQzJA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f4jvwb6wc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 01 Jul 2026 09:07:41 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c110a3b6aso5600341cf.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Jul 2026 02:07:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782896861; x=1783501661; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SIo/Kr2b/QKYf+Ssgghdgmh7XUPBIGLixRtlJEqDmCk=;
        b=ISxRAn5hb3rWq54XGgJHhkpUUDSP4EMZ2G4yduvMW+zxBGMo4hJYYVYcR/Qxltf7I/
         vdpf9zTKw5O18/OtwFNAP4pegPKTB7Fzt3hhkzZRzE6PXfPXBRbRuOB20JIk4pYv6HcH
         uDP13S0SYRL6neUaMl1wCuzGvW1EiDRlI7ecgp5RGsABG4TSP7IIIeGXEbMisy/2Y7ol
         sUICu3AKwNMZ4BKFewYkbRsaU1iTlTqOjHIYEW1LWkdkZ372L4Q+MmrGixP4VDqPCb4d
         OZVuH6kz3wG4bcCayX2wi7+194YdJfpTZrs2syNHhjcO4hJDBUGl50Hi3TMjUen0F3m5
         X+jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782896861; x=1783501661;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SIo/Kr2b/QKYf+Ssgghdgmh7XUPBIGLixRtlJEqDmCk=;
        b=rzB8tJER5r0ZMWu7THhRGGGxguhrukDcYQlQ1b3eWYf7XM9/8wkyAEh2Bo3ImkCTkQ
         mVulOxnpC4UCkVguaekq3BxvMO2VJ6YrUarir8+14WqlQZA6bBkv4hvWyAcRiZHSU8SK
         KZfOPOwc4WTxde5KU6hPm5gJr2jqB7VfBTm1KhNpASlqUQa0ykuglBwmOH582JwY00bP
         SNitZeK7qPEwSLpv3bNZ7scTOmTkA+V78iQCu2MNK+k+/QODR9kjVxY/9Lt1uCm1q+nm
         RuVCXqs4JqHyeUHgRQfVhboeo6rjr4TV3HS0ZTdG1hs7/nPNBQImpsQHXHnauBbJY/lA
         AwJQ==
X-Gm-Message-State: AOJu0YxSdPuKrsyJgUn4QTPQ4EIiA+ONWzM6MqhvgjQd0WQ4BQEM0Uoq
	ON/+z00S03KLR4S6p7kFvE0CFK26RBtyDWQHqCFh4NqBHluJ+tNXfwJPEAdLpl3wuXH5cFy3d4M
	eY3PYADi7m+WmCHQABKNI7sAtyuQoAkZLzqxafTc7Vs4KFul2pUJHOfs6kyXV2kI2+A+sadYTM7
	Mu
X-Gm-Gg: AfdE7cmK7bOSLld75cnlUfjI3OeGmGpotLvONusf73L7DoQ6+SRf2Nn87G2ekJarANg
	C8L3YO2+2JOWNAOHSBFtBy1WsKOK9xfuWN2EiDLds44Rx3rF1Q08RD44qiM9x+QIc8Gv1qN4L+I
	tDLA4ABfkWVq2qRUCUtDH4kTc+4VeUYhvKvppB8LjW/U1AELt7biUKRrYIxqpCAb0gdYwlJuXOW
	dlTiHuS+V02VjYMbAty6fzbO5iBE0ma3O9GgIq5DdXq6NFOcJBNwxmlsfYWziFKoudVt6u5SYMT
	qDte3EiZq5pBb42VoFuCLLvDpskF7jHsU1rZaWQZk0gJbdpm/R/BtRvu+8udsV5ZlRPOftun/hg
	STNihYxOPIx1NcDKTT8Zb1Qp0VD9BoWhd6n+HlBbMonslGA==
X-Received: by 2002:ac8:5995:0:b0:519:f59e:8108 with SMTP id d75a77b69052e-51c26a96c5cmr8715991cf.31.1782896861026;
        Wed, 01 Jul 2026 02:07:41 -0700 (PDT)
X-Received: by 2002:a17:902:f549:b0:2c9:97a7:f544 with SMTP id d9443c01a7336-2ca7e8dc7c2mr9348205ad.42.1782896475252;
        Wed, 01 Jul 2026 02:01:15 -0700 (PDT)
Received: from hu-mchunara-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ca3828c6d2sm29037065ad.39.2026.07.01.02.01.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 02:01:14 -0700 (PDT)
Date: Wed, 1 Jul 2026 14:31:08 +0530
From: Monish Chunara <monish.chunara@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org,
        dmitry.baryshkov@oss.qualcomm.com, mani@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, sarthak.garg@oss.qualcomm.com,
        pradeep.pragallapati@oss.qualcomm.com, nitin.rawat@oss.qualcomm.com
Subject: Re: [PATCH V1 0/2] arm64: dts: qcom: lemans-evk: Update SDHC storage
 support via overlays
Message-ID: <akTXVNYamY7hguLo@hu-mchunara-hyd.qualcomm.com>
References: <20260227102405.2339544-1-monish.chunara@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260227102405.2339544-1-monish.chunara@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: 7X3QLuTE3OFJ8jP6nBQP868isBUAVLht
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDA5MiBTYWx0ZWRfX5BpABtrQB/XG
 Zt4s1Ee8Dno4bm998PJU3SGIMM45GaLPov0xc8CVUh9Jl1A3yr+CUJ7S9rCiX2EXEzN5r8p30hN
 Xj+9JZZR2BIsFxLqVUeUdEySl0Nvbhg=
X-Authority-Analysis: v=2.4 cv=JKgLdcKb c=1 sm=1 tr=0 ts=6a44d8dd cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=Xq9aKHyif9_oXKuhy5kA:9 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: 7X3QLuTE3OFJ8jP6nBQP868isBUAVLht
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDA5MiBTYWx0ZWRfX+46KUf1RPkD9
 EBgb/9zBroI5XCZibH8jEAs9Lr5IPT7PPEnI94d0UjMU7djwGr9Js/tIKHforMzjma7tHvWhKwa
 P2c5rY7J1MMovpSw2EnczFYQ8jp3JS4eEQ8XSfJe5I0JPf9IHI9Gp0IETRFFogD/BQQIYWbFFBH
 NeHCUgJPn7dueY8WZXtB8rrnoZhs8MsXiyW5cLhFzHd+FjRjCICCOtMULqG/OUa1IFnyd3uSOUB
 MfDYu2/qJAMDqf+xQLwcD34i8/d74AI66bCGwIXr2Gg2Dl9sJpoFXtM33c9rTIpwArhoN2HswNM
 9aOGztIEvIHNwZUrAMPagSMPIBQEELKR9mv0RjF5dRL74vG8mjF3+C+L+dyhPk4kyks7WjjcUgP
 exhUXF4vpr9u3d0CMHjAZ4ZPbRP8aMIiRsP/HebeE37YRp1jFnw3kieQ6oRSIi9zu0ioceE238F
 AHplBbVVc4WLPHdzVHw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 suspectscore=0 clxscore=1015
 malwarescore=0 impostorscore=0 adultscore=0 phishscore=0 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607010092
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-115617-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:from_mime,qualcomm.com:dkim,hu-mchunara-hyd.qualcomm.com:mid];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:dmitry.baryshkov@oss.qualcomm.com,m:mani@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:sarthak.garg@oss.qualcomm.com,m:pradeep.pragallapati@oss.qualcomm.com,m:nitin.rawat@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[monish.chunara@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCPT_COUNT_TWELVE(0.00)[13];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[monish.chunara@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	TO_DN_NONE(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: AFC426EB7EE

On Fri, Feb 27, 2026 at 03:54:03PM +0530, Monish Chunara wrote:
> This series updates the device tree configuration for the LeMans EVK
> board to support dynamic selection between SD card and eMMC storage.
> 
> The LeMans EVK hardware supports either an SD card or eMMC, but the
> interfaces are mutually exclusive as they share the same controller and
> resources. Previously, SD card support was hardcoded in the main device
> tree, preventing easy switching to eMMC.
> 
> This series refactors the SDHC configuration by:
> 
> 1. Moving the existing SD card configuration into a dedicated overlay.
> 2. Adding a new overlay to support eMMC.
> 3. Updating the common SDHC node in the SoC dtsi to include necessary
> resources (clocks, register ranges) required by the eMMC configuration.
> 
> This allows the bootloader to apply the appropriate overlay based on the
> desired storage medium.
> 
> Monish Chunara (2):
>   arm64: dts: qcom: lemans-evk: Move SD card support to overlay
>   arm64: dts: qcom: lemans-evk: Add SDHCI support for eMMC via overlay
> 
>  arch/arm64/boot/dts/qcom/Makefile             |  6 ++
>  arch/arm64/boot/dts/qcom/lemans-evk-emmc.dtso | 64 +++++++++++++++++++
>  .../boot/dts/qcom/lemans-evk-sd-card.dtso     | 25 ++++++++
>  arch/arm64/boot/dts/qcom/lemans-evk.dts       | 16 -----
>  arch/arm64/boot/dts/qcom/lemans.dtsi          | 10 ++-
>  5 files changed, 102 insertions(+), 19 deletions(-)
>  create mode 100644 arch/arm64/boot/dts/qcom/lemans-evk-emmc.dtso
>  create mode 100644 arch/arm64/boot/dts/qcom/lemans-evk-sd-card.dtso
>

Since these changes have been discussed upon separately and reached a
conclusion, requesting for a re-review from maintainers to get these changes
mainlined in linux-next.

Regards,
Monish

