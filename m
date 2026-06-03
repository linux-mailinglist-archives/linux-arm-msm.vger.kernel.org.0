Return-Path: <linux-arm-msm+bounces-110974-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id niZyGBwsIGqhyAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110974-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 03 Jun 2026 15:29:00 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 533E76380D2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 03 Jun 2026 15:28:59 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=aIG5ks45;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Cei4H35T;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-110974-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-110974-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 9BAE4306AEA8
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Jun 2026 13:19:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6EB1D31A56D;
	Wed,  3 Jun 2026 13:19:33 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37EE431A570
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Jun 2026 13:19:32 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780492773; cv=none; b=MfewpnEuWbRdtUFSFAxHZSjUrMzFx26Djh1Zwa5dOvTbTfwIsbL8NnTZ6txstdIJaX6WRmXE4lcVTluqi+DGHe4+3WvWwIEUzK7c3bIQN+dX7Fl9+Po5l5NWySKvuim63rwNcELSK4CgCo2NcBd2SLNrQBzhBa2mOhxLQOew5vA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780492773; c=relaxed/simple;
	bh=1nBMSmHkUb3Jkq9JMXc+5j0fs9PgAQlDAMdQSLgzC2E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oRMhdkOMujoKAeWJkQ5WKM8LwkuXHzNDjzimYCK3dbieaUuEWgCdyWpe60cCU0SnGdCzLQ5D/gd+5YJM9knDHOxxEg/qniSCw/kDfXmlyC2oUTVnbWncvBSAzSEW7/Phly+AdP6DOPYUwO1UruvFkyyjC5pG1MFRqhU3+W2aBYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aIG5ks45; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Cei4H35T; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 653AB5I53552309
	for <linux-arm-msm@vger.kernel.org>; Wed, 3 Jun 2026 13:19:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ZQM1x4Esz4yRdbII/P6eIDfx
	ohTjz68+7v0muOP15vI=; b=aIG5ks45N2mu/zbkGH1OWKWZrUSRPGfglAxBph1O
	N8eAVRUeYqEK4rzaIELDKoX++7MJL8iXsmufopxacx2HgBBiklHaXsapgrlEsaWn
	G9z1nEZh1zbAvUVE/4n/oxBNA+5H5AhrOGjQz5g9u24yzBFv5NDeqyBFqM/MkrrM
	N9WAs/DAP7xWnzGRAQGg/pCIWO5TaPEnOO7HQ+VmtS0EKmnGV35iXkiz3nb1Wxrk
	jDMgo2aRx9PqYV5oV2UabtP1laYDh4gbWLV1n+QsXrmj/01TNEJdeRpSu+W65C2s
	lv6jnttT/K4Q0XfFeWkfSRKVoROFz7c3rNxaKoDRnFIwzg==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejj9mrp1v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 03 Jun 2026 13:19:31 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-6c152655acfso2607748137.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Jun 2026 06:19:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780492770; x=1781097570; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZQM1x4Esz4yRdbII/P6eIDfxohTjz68+7v0muOP15vI=;
        b=Cei4H35Tx/cYUB4GJe/dKLDj0ZM2hRKbwXI0O50hiQUOnRUQNv/HG/mfpTgsb7ZFAh
         bUrAMOK8tfAYj5axon2EcIQvRjEc8sHigMLJNEEmI3DiUV8DxFrmtptD+hYV321kTpqo
         nwPjdTP8+Un5+KHbeU0/JRESfZ4nfKYDRzxi/P4OcEg2cpycCcj5GsKAvHcOdsLCOulD
         xLf2UD9O4+wOxS+MnrjkruqYuKwhPBZeA5ZHTZ0Eo7pAgt47+YyyF8vizQwgHlePjm9V
         YXACtaMeKM6yvDtZxwluACS/EZD4/bJlft2FTHhFahtvqqViGRkj6FgkiN+LMVUEZaAy
         wQYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780492770; x=1781097570;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZQM1x4Esz4yRdbII/P6eIDfxohTjz68+7v0muOP15vI=;
        b=NcS5FvFwjSE56HgXN3KmrgP3OnhUMuiO0Xwwq6tnBnKBlxsa6nnNtTzSHZxu+mkSu+
         asJtKcvKV5sCTBlHa3qDI5ZXgW6NNTDogrzQeMSLmRmIDV8qYA18Mi9fTTLsN77ycjax
         RsWnPSA15fb6f1OKfyczlx+F1unt7+j4djtEF1pz+gexUWV2rSy99/vCxiSthhQV8ebR
         IHR1g5ruXZAmVR0JSyYvW9yo7odL9AJP4Y1Ewl/enh6GgPp/N2o+HCaT0rqN+RGiPsvQ
         gWVNOhw7xrJqd+L205qNvmBK4bFkIQ81J+gGDOZnjPmfLCIZ9+4O+LKObOPHeM2wN9fG
         C5Gw==
X-Forwarded-Encrypted: i=1; AFNElJ8J/VsAssMD4YCaMB4FY43zD4a+YRX28mY0O3XLcfGSFeiEGyW87CW4HQKZSslybad1vk9/bx5c2S6CT/Rl@vger.kernel.org
X-Gm-Message-State: AOJu0Ywtgs9x545LmDM3YdSIS2XekeLMZv+wj1yqIFbrpBayWeuG0B/Y
	uZQt/oTMLL4O/qF4hKjsLo0lCrspE8xmKARMyBoG3CAA9FRcadiXGA/GIz7cvtyo0dzAynSNdko
	8eKq6mgC1T7uzNfrfgFwRNeZt/GPpi7QSahLPY5sAq31njHCz3k6BGnQKdPnyPoICPw7c
X-Gm-Gg: Acq92OHB8UkzcIdWLQtr3nmBEtcCdivo6F6vXB52jiviQQxTLamQhOkcSzh3GCAjEEU
	i61OZMCOWQcHfso+V5CQ3XZDkEMJIczHKRhAPVxJg8cb20U+OwpRnuNpPfQLxfZNqwxo3riJAjB
	6fbR7Lhjy+bPBTp+VXozZPaMh0/hgZCIVF4bnL1TJcv9mugnAcsM03zGqeCUieeGSfkOSbvEM/c
	+zmKmVeZ51oKSEwu98fRarOUzvY/q1FY9cNHYnzq5VGFzkUf9/B/+4ogIVwhotKitb5NOTOPjHQ
	jG/Aj4nVfDmQ5Q5t1GIydBvKkrion7dOoLlEvihEoyNqPbLHsn2ljsbzuYf+IetntJppG87TLVQ
	+lm+u+QkFK1oKpyuMKCNgerfOAzsJYvCvht+wnF5NiVudJzg8+oZOvRUwC2DdTfNGPl2ETgiddL
	raT3tuBt2kDd2lV9Q/W6YRwFJzJV1EDwXwMlHuGxh5/3hq+g==
X-Received: by 2002:a05:6102:9d3:b0:631:2f82:c3ce with SMTP id ada2fe7eead31-6ec2b92f476mr1386561137.10.1780492770609;
        Wed, 03 Jun 2026 06:19:30 -0700 (PDT)
X-Received: by 2002:a05:6102:9d3:b0:631:2f82:c3ce with SMTP id ada2fe7eead31-6ec2b92f476mr1386534137.10.1780492770149;
        Wed, 03 Jun 2026 06:19:30 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-396abf678d7sm9164781fa.7.2026.06.03.06.19.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 06:19:29 -0700 (PDT)
Date: Wed, 3 Jun 2026 16:19:27 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: MINETTE Alexandre <contact@alex-min.fr>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        MyungJoo Ham <myungjoo.ham@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Guru Das Srinagesh <linux@gurudas.dev>,
        Linus Walleij <linusw@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Kees Cook <kees@kernel.org>,
        Tony Luck <tony.luck@intel.com>,
        "Guilherme G. Piccoli" <gpiccoli@igalia.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        iommu@lists.linux.dev, phone-devel@vger.kernel.org
Subject: Re: [PATCH v2 7/8] ARM: dts: qcom: pm8921: Add USB ID extcon
Message-ID: <xklnqbeuf4gblh3l57cfpd2xchfy3rug7b37f4redumfsl4g52@dh57ssbrhaz3>
References: <20260427-mainline-send-v1-sending-v2-0-dcaa9178007b@alex-min.fr>
 <20260427-mainline-send-v1-sending-v2-7-dcaa9178007b@alex-min.fr>
 <20260428-jumping-discerning-oarfish-d2caf1@quoll>
 <50c433df-d737-45da-93dc-76d365052a6c@app.fastmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <50c433df-d737-45da-93dc-76d365052a6c@app.fastmail.com>
X-Proofpoint-GUID: QaqGY1DWXsZ_CP29aqYPvpQ9Bs7mZhr7
X-Authority-Analysis: v=2.4 cv=XK0AjwhE c=1 sm=1 tr=0 ts=6a2029e3 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=AvYuMi_7Bs4finmeaUUA:9
 a=CjuIK1q_8ugA:10 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAzMDEyNyBTYWx0ZWRfXy2jqvyubLph0
 OK7RLJchNWMHOxFxaBI1j+ZTVH/qz07FVY1K8WoKCwQ9YoUqi+I/+b77WRvN7qZRUOP3egVF9+o
 KSNyyMfUvMtC0t1WbkjsvX0t+ufNooEU7mauBeh9tZHLRxzWaVa9San/99EAsINwTlE/oZ+zXYW
 4wTuEcaIJUxt9rHfgszbSZ2gmhyTmX+p5H6oNca/73sGK041uxhd9RhaTknF9Szl8nNxk6XZdBB
 D9aOBXqtHOM01aVBPZH+UXep4GiDZwP+BL+70otGMzvANka7OBjmUzN+ign2gasNdMBbwbYyNKX
 SjrlNXSHqiSUL9P1FLi3VvuEjPwBdRDrJ8a94zJ7FtU+OWwPPveIWO9ScWF1IZc/7Ahw9ukeLVZ
 szN7Wey0o7njEUut+OFEIQSG1R9X2u1ydWrv0oOxFqGi8aQ+0SoPpAgKe/jqimBeXYN/vddzpbh
 RaAhOBDTeUXjGepKfDw==
X-Proofpoint-ORIG-GUID: QaqGY1DWXsZ_CP29aqYPvpQ9Bs7mZhr7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-03_04,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 phishscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606030127
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
	TAGGED_FROM(0.00)[bounces-110974-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[24];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:contact@alex-min.fr,m:krzk@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:myungjoo.ham@samsung.com,m:cw00.choi@samsung.com,m:linux@gurudas.dev,m:linusw@kernel.org,m:robin.clark@oss.qualcomm.com,m:joro@8bytes.org,m:will@kernel.org,m:robin.murphy@arm.com,m:kees@kernel.org,m:tony.luck@intel.com,m:gpiccoli@igalia.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:iommu@lists.linux.dev,m:phone-devel@vger.kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:dkim,vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 533E76380D2

On Wed, Jun 03, 2026 at 10:39:24AM +0200, MINETTE Alexandre wrote:
> Thanks for the feedback, Krzysztof.
> 
> Do you mean that the PM8921 USB ID handling should be exposed by the
> PM8921 parent node itself, so USB consumers would reference the PMIC
> directly, e.g.:

Please stop top-posting. Post your replies under the phrase you are
responding to.

> 

-- 
With best wishes
Dmitry

