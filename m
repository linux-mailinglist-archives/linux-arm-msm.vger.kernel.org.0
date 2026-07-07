Return-Path: <linux-arm-msm+bounces-117372-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id jbSdDVwtTWrKwAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117372-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 18:46:20 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CB5071DFD0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 18:46:19 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=inV6jako;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=b8QWBNgo;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117372-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117372-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 1C8AF300371F
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jul 2026 16:46:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D587527732;
	Tue,  7 Jul 2026 16:46:01 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 991DA26B74A
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Jul 2026 16:46:00 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783442761; cv=none; b=Os1pWeUABbYibs1HQPffMKxSFnN+YIm/2DLeAbFzVp4SnNS5jW+Dr8Q6Kgl1YZSV+gbFyCl2rdEnIRwJPo64sbuBGNy7+VumpILi8IjNh1Kh9ORCrzpHouDv9IJv/wxlZ2t5f/ksB6F1nhN4X17gwisdcSRT+bplakGyAYf3kPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783442761; c=relaxed/simple;
	bh=Q4ubu0LoZOVjTnMIFREBOyr3zA3F/vFWUl5oOcKA4d4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LKivu6slaivTyvM+ucH34WEk6tRhXroewPixtXgz8TX57xUPab2jvFH8BNF8lohlpvL7rxZvCaKe1LKyRJCTQ383N6RccaahXQq2yXjwEoVHcLiMg4IMPKa7uePVDuvrWtKKcGYEeGDMW9m4ajdRd6c4J/cI+8vekURq767cGwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=inV6jako; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=b8QWBNgo; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 667FTHIS4074212
	for <linux-arm-msm@vger.kernel.org>; Tue, 7 Jul 2026 16:46:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=li0pG6/934G8KYeHkJPSyW/N
	lEpOX2i7l0YxZTpF5vA=; b=inV6jako9JYZ8EFjKbuloptedCjrnSnPruF+dgAQ
	VgHrpNwQaKOATc1se5S2oJy7pOyJAjFC+ClHzRnY1aplgAhAffRIt64wYJLNR8di
	crSe2WeYD1mQ+dhrrHvmMkKv7xq8mhqP/B2ocvAdvxHO4/kqlai8Ab6QZ3nyVitG
	viTSf3RKrv8kGAoq1QeLoG7y9XtQyA8Q9ILm09coOJWpc26I2fpsMiaIGKLRv49v
	Huul7FbPtEHnG9GYmixxaxwoyYd1gqRKD7foDk0sTW8z02Zc+nBwG7VRRfTxWT/q
	pjBt53ScX2JninJNiffyfpone+MxZm7AHkF7gZi8p6Qedw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8vun2bx7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 16:45:59 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c1d30035dso37275261cf.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 09:45:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783442759; x=1784047559; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=li0pG6/934G8KYeHkJPSyW/NlEpOX2i7l0YxZTpF5vA=;
        b=b8QWBNgoaqi6YAolIn3x5jdJ3R08ZVuOHTWr8Hn5OkyyXAZKg9hAMeIHDcDQKzYc2Y
         j8EXw08ni4uf6jzoLpBbALkuyeSXrnlDjgPV+tDFKJCx+/vz0BMH+NNZyfwgdUJhkvGM
         t7DDoCXrNdF5Ii59XVujtb9fz0jq522sdRZQR0Yc09kRgXsFvUN2T4mliBWhciETCJFO
         imoASgv0Zi+4HjV6BI6DXE8HDuwAxJR5z+xdKWlC2LTIiHC4bzx3NCbHAGpWy/eSgp8F
         jWxgPvRpjKxPo4Q5q9Sh4Yf4KV6GQ+O52FX/ljkLzl/+s48o/8n1Cm7MNvpSBefpfyJm
         cJ/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783442759; x=1784047559;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=li0pG6/934G8KYeHkJPSyW/NlEpOX2i7l0YxZTpF5vA=;
        b=rrjLNhvQty+mFf3hRM06JSd8dBPdTOhxMRa1+kmomw0LuWD9dXttvgPZtwOvcEe91b
         6Duuo1QLUuGtzdr8yd9XfyhS1OQe5txwtjZvxgWBF6jRRef/NSWIRgddW3+kgTq5f2Lj
         I03/fVByb63kWRhNnvwXaMowztZ3+r+dNnxYW3tULBGwK/dZmPBPH/eexi+PQYfqTemM
         qiBSOO8cavYDiekNV/4+Mamuv7nGcQiv2p6hEot6i9BrAolxQFikyFbxcdh1Z7VYWDHg
         /ZVBoWBGf6YL2UD90Lwi/kaCW/i8x0q/WhHfvItlQpROgzNwmFTNLRSplkxge40Ja62f
         nFng==
X-Forwarded-Encrypted: i=1; AHgh+RouKzf98sBRN9RqlMKCjafdaPMF3OwzB5506rvwfUiGCv62q7kmWfPCa+fOX+H+vpM9C1QV0U6nb1o9dlb1@vger.kernel.org
X-Gm-Message-State: AOJu0YwG3d+jBdBjmsz4dcqj1KIdc3pYXx956UtDxwT7jZvKmLfKIA71
	YHDIKuKe0L3dqaJsdf9gC1OELU269QSiVmupF+as4qhYY7PkSyumo5yDZl1cveyIYA75B0FONWi
	dtyYvO9dSwpWqou3mlW4tguw1taXWwIua4V0dMLBGl7OQVg6fDaHkeM2kZ7JC05fz/oOXNh49L9
	py
X-Gm-Gg: AfdE7cktlVD15Ne81rYXWBbMn1VuTOVJpNt4Z9if8ZiqjZSI4q6oEquBIKY7vNhVlBQ
	QnTMA0+i6SDGKcmYJrpVi32QpLXVSC+SsYA6x1Qt7MYdduOWe1R5+XXj+7Ndi7egUjCFXIHfHX1
	IYfms4+sI6SKkP61RUXTd4Prs8b/DRH4nekYPgkaXFTFX42VqRoXK1P2U9PnvhCeuewofuU+CQz
	wWY6gmTjlblCKmEW1p2kPZ3xN/3/kSHg4M5y16r5YJvZHWKVFIVRlTJQ8CXCoFNo27DwqHW53fX
	7sbAzRmEZGVYG/3BQcn2iPowFcqVvzuR1Vt5hrpQSN0fsWktHcANoQvrln0hxzPsuv4eqhseY0o
	MffMI9g/tbruquRp62zdPM0Dq+X8GTB9Jpv5gymS2bqoCUNhWtQZ86gRPoPo95wTBMfsV15rfLK
	hhk+FnfgGhjsgKX+D9N8JSdOjs
X-Received: by 2002:ac8:6f10:0:b0:517:6550:2a0 with SMTP id d75a77b69052e-51c747e7017mr67956691cf.19.1783442758273;
        Tue, 07 Jul 2026 09:45:58 -0700 (PDT)
X-Received: by 2002:ac8:6f10:0:b0:517:6550:2a0 with SMTP id d75a77b69052e-51c747e7017mr67956291cf.19.1783442757448;
        Tue, 07 Jul 2026 09:45:57 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aed13c3a0asm3798176e87.71.2026.07.07.09.45.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 09:45:56 -0700 (PDT)
Date: Tue, 7 Jul 2026 19:45:54 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: esteuwu@proton.me
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Alex Elder <elder@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org
Subject: Re: [PATCH 0/3] SM8450 IPA support
Message-ID: <udhpg625pgm2zoeohuvlg5ndr6ivnjkrwxzy5vklno2ktcnro3@ryigk22l64ji>
References: <20260622-sm8450-ipa-v1-0-532f0299f96e@proton.me>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260622-sm8450-ipa-v1-0-532f0299f96e@proton.me>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDE2NCBTYWx0ZWRfXxARknPd81bFm
 /bkPNCQov6spIRZQfuyg826b+nh/2ofgQXP7gRgnAIymkTTduwJUJkK0deSZv2mufd7rADSOOSa
 w+3jFu86Ap3ipLSyCxXJqWyxeTx1ojw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDE2NCBTYWx0ZWRfX4/IGs8o/nBAI
 C/EXj7gZ0OOETUAoLhAweMrxyNwblJ+J4uMRXiJ0msa7ehis7Qy2Q5JNAuhJJI6uQgEcjL7c4EF
 7/TIAGtD0W7Y3IOj6/O/FXykFSQrienbub6jtm7i0sUuT7ao4fCTXG7+AaLWRH5+I4euCa9JOMJ
 xYvUhe70YqhsNcggi8ZPwNhNt+4ia+xa3oAviCzlzIozoNUDG8DgjTTA7My23x+IPX1G4N/hkWn
 WfAFfA4tWFjunNUHD6x69WCmUrAjdqjGKP+6icYqMIHcVUQuazKX/Ixih49IrdrSz82QvxAglMq
 h85+Y3EyJ+scSwrbgUbU8u/U7oVHC3tvdMazNXwN3f2m/63HwLO4C/9yktg839nyJjF4h+VWhoQ
 m0oHuDBbmYkEfWB//CHIZFmVDe0SlVdB11cx10pQbBjjPFpIP/J1sAycyBl42mmeDfLgtFL9DLl
 NRUVeo4gp4B3zfRTR0w==
X-Proofpoint-GUID: 55mJurNotcxhsL6Dwoel5pRDs1owY5bG
X-Authority-Analysis: v=2.4 cv=N+IZ0W9B c=1 sm=1 tr=0 ts=6a4d2d47 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=MRZpAjOZwpHdsA9w-08A:9
 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: 55mJurNotcxhsL6Dwoel5pRDs1owY5bG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_04,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 priorityscore=1501 clxscore=1015 adultscore=0
 bulkscore=0 suspectscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070164
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-117372-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:esteuwu@proton.me,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:elder@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:netdev@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,m:andrew@lunn.ch,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,proton.me:email,qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,vger.kernel.org:from_smtp];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,netdev];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2CB5071DFD0

On Mon, Jun 22, 2026 at 09:44:16PM -0400, Esteban Urrutia via B4 Relay wrote:
> This series adds support for the IPA subsystem found in the SM8450 SoC.
> While IPA v5.0 is very similar to IPA v5.1 (heck, it even managed to
> properly get the modem up and running), it wasn't perfect, since the
> modem would sometimes hang when rebooting or powering the AP off.
> After a thorough investigation, I managed to create the proper data file
> required for IPA v5.1.
> 
> Regards,
> Esteban
> 
> Signed-off-by: Esteban Urrutia <esteuwu@proton.me>
> ---
> Esteban Urrutia (3):
>       arm64: dts: qcom: sm8450: Add IPA support
>       dt-bindings: net: qcom,ipa: Add SM8450 compatible string
>       net: ipa: Add IPA v5.1 data

Please reoder the patches:
- DT bindings
- driver
- DTS.

It follows the natural way you'd read the patchset.

> 
>  .../devicetree/bindings/net/qcom,ipa.yaml          |   1 +
>  arch/arm64/boot/dts/qcom/sm8450.dtsi               |  55 ++-
>  drivers/net/ipa/Makefile                           |   2 +-
>  drivers/net/ipa/data/ipa_data-v5.1.c               | 477 +++++++++++++++++++++
>  drivers/net/ipa/gsi_reg.c                          |   1 +
>  drivers/net/ipa/ipa_data.h                         |   1 +
>  drivers/net/ipa/ipa_main.c                         |   4 +
>  drivers/net/ipa/ipa_reg.c                          |   1 +
>  8 files changed, 536 insertions(+), 6 deletions(-)
> ---
> base-commit: 948efecf22e49aa4bf55bb73ec79a0ddcfd38571
> change-id: 20260622-sm8450-ipa-5da81f67eb65
> 
> Best regards,
> --  
> Esteban Urrutia <esteuwu@proton.me>
> 
> 

-- 
With best wishes
Dmitry

