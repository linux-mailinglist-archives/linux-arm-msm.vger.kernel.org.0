Return-Path: <linux-arm-msm+bounces-112138-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id oV9SCqP0J2of6QIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112138-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 13:10:27 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A43E65F550
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 13:10:26 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Koi4N7dV;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=N0VTh1oq;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112138-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112138-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5BD87314C7B1
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jun 2026 10:59:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E962401486;
	Tue,  9 Jun 2026 10:58:00 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1EB9400DF9
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Jun 2026 10:57:58 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781002680; cv=none; b=YKGz0Y/MfryonpSvlV4q8+U+PkuXkdFvVts24qxqfbhQTcKX4NFGc/ELqP8Hpi7D5/tFKBwYvkicveWq9SxE40VKTBz6nzP/6SRBfspcXisM00uz4y1IwfekYIyQxrIj3MdGHKnQA4AeIhjxNAdA2t9gaNh7wAe7oyh63rLYUC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781002680; c=relaxed/simple;
	bh=Snhn7dRLdqS8fBHHgHnMySufiY9dAPo2wQhFcMJ8E7U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z965oQEnstlHUaPLCTMQxzO6ljS6LzwFhmhiodAcrE1rHjs/neLJzWBJqRh3uW0IsN3LYzh+8V2xHDJ7Y6OPOKqP6jqDBSbaPmH0n3rcvyKLcMrXobGGJ+9H+IU36NDFWiOMp8KwI0gAJF5STEzbuIeaml1jcefFubiY5a0Lx70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Koi4N7dV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=N0VTh1oq; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6599vKAS1869336
	for <linux-arm-msm@vger.kernel.org>; Tue, 9 Jun 2026 10:57:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	f6ILln5Oc0CWwbe2t2UAsyz9mJqiBbsefhKMfnN8zy8=; b=Koi4N7dVFxWniD0C
	y+nFDFeFKdRgtI8TYcWSeSOxgWyBvJJybKtueHZjAeFaqdXxkIB1Ra5OK7dycHVX
	crUdNWPOItJB9i2v9O041mNl38BmagGRoO09Xn8QxLONy74mSe+vqUEo5kZQl6NB
	OSKycl+O04ZgtoR4fKh0waf5jj59OUqTrjAh3+JuMpg/lpJde/+yu9ZQN0YvMgYQ
	HnQ49ozTGWi4T5KcpdhpRAb6HcWCuqkc3QIvExbLZ2IeVURqwfuR6L5Sz4AjxkLb
	50zXKFltP1usSJUx0LxsSBGyGcBNjud6ZBGcSMBbh2a/DnyY5U8UaZw8jNtXTD6r
	21VTPw==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epeqggryf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 10:57:58 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-6c69c788ce7so2248901137.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 03:57:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781002677; x=1781607477; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=f6ILln5Oc0CWwbe2t2UAsyz9mJqiBbsefhKMfnN8zy8=;
        b=N0VTh1oqT0fi3tT42PIiUv060nj0+k57o2BGnFfWAabDy5oOluMzdmuvKTQz6k8zrs
         Ko8Pa3zy8uM1I0naA91Hy3bppBWGjwPCnjJ2gZRq81YiWG50aRDAFZiGJl1HA7jaU2ul
         eSvIiuil8Oa1C3OjEwVF2hdx1cUmQqwBgB7bMXG2J+3/1pFnitb3c1aOon/QpyVIq1BJ
         n9E7VzLQYGnadvsPxFrRQ4GNDOQ5psxWm3avauBXPB4QxR4wz99Jbn+dO34hd8B3SW0W
         UOCmRc8M27IXDX8EfZbLXUq6HYncmYiKmYkpSm8+jb7infAZystrJLeV5jKq/0JeTD7j
         ZRlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781002677; x=1781607477;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=f6ILln5Oc0CWwbe2t2UAsyz9mJqiBbsefhKMfnN8zy8=;
        b=Y4rz3IulPLHl+362bhbV+xw1pf1zliY0Z0cvqS8+enEevFYuc8+oRJJyZAHmF7fL00
         2YUVoipM4kaCRi0yBTJV2BXF+FJXfcGnMiL9m8nXNjQrFPtarvKDzP3Ha2u1SP98iAzM
         osfgvuD77k6JUnkhsB6GSXb6c8ckFhHSDwHGLEAz8wlKdUUfNYzzf1gfR5RbapupaqZO
         L8i/JL+nLFZHNSvM8Kcqjq2i9L2oNg5wuPDx7sBimTrl6TxQpIHAf79+msGAk9R5B7Al
         3D637QXfjkEkEF25ihBHoo0gu9mLegDaFubHBPS2AMXbTakD6RgOpiexUKxRpA/leA5g
         uwpQ==
X-Forwarded-Encrypted: i=1; AFNElJ9QOtAwQpDdAoQy5jDgab0zVHsdXd5DmHORay4dKknWF/05r+gxU3haI4DE1INmDHUQFeYpq17JMX0Nc/07@vger.kernel.org
X-Gm-Message-State: AOJu0YzZvM9PU5qMc5fb4R+qOWm/iP7rSineQzjYhNaOfCSTGAHurZAF
	EJ1I9TWthrhm2UM96fnzbhfKgIkHSQ9ocmHjhp0TWp/Xe3faFB8dM4OHl0CP/K52ZYKxWh/iz1t
	G26Wh1+GoiUkopBTuN9wpfQLjCjhSwPJySowqTJQai592MS/lWZFaZ2VOiwBh2Q3C8UhG
X-Gm-Gg: Acq92OGQHz4jCNOiX9M9IoMAAckU0dgld/60X++6dd3W0XxNIteWuq9lCPjl4rWh3gu
	GIv4gc6lK9g5rD/clt2yLYLUmAng4WhREpbStsKGufXCusDec4k/FRqjMkWOZ1PQrR3yo0Z2JH2
	cT3BbPV4U7h37PUyXa2kEDPIGOT8EidrPzVMOGuselTEel4jI2f8kEcS/Br+OZKrHavubSZ9vyt
	xcesLEm4Vmu+r59L0/hReAZWk5SvLa9/ZnooDt+GIgqmVwmCMCmj54OGGB55+qlung3Ugp8+oTw
	KnMLFQ8LI9JEwbTGb9D4dqA4xYASid7mrWTDZEH3891u+5c2/bWl0HYRB8MgwMP2pNQfiL1zq9F
	z5IOn/Smx4CkBpnjaf9C4oiqFcdvFVQ11FGDE39YjtTRtcISTH8yCHkjvLDJ4cK8RP/pE/lfas+
	a3AVkzfsw9UaBP5j4XNtMMq/5uo9IkG7EFvOXr8PNp9ecEww==
X-Received: by 2002:a05:6102:fa0:b0:611:e0c2:1604 with SMTP id ada2fe7eead31-719367de123mr712100137.19.1781002676996;
        Tue, 09 Jun 2026 03:57:56 -0700 (PDT)
X-Received: by 2002:a05:6102:fa0:b0:611:e0c2:1604 with SMTP id ada2fe7eead31-719367de123mr712082137.19.1781002676561;
        Tue, 09 Jun 2026 03:57:56 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa7b97a74asm4447482e87.53.2026.06.09.03.57.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 03:57:55 -0700 (PDT)
Date: Tue, 9 Jun 2026 13:57:53 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Amit Kucheria <amit.kucheria@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-hardening@vger.kernel.org,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
Subject: Re: [PATCH v3 4/8] arm64: dts: qcom: kodiak: Enable CDSP & Modem
 cooling
Message-ID: <pf6rymdtbfcqqzt6vnn6gc3uuod4vlfpw42dxxag33aom7lltu@6ymibirvwfnc>
References: <20260609-qmi-tmd-v3-0-291a2ff4c634@oss.qualcomm.com>
 <20260609-qmi-tmd-v3-4-291a2ff4c634@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260609-qmi-tmd-v3-4-291a2ff4c634@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDEwMiBTYWx0ZWRfX6QC3IwV3oC7R
 IzpDl/YASPNcXiV2mny7kxVqqoWCiT1D0JD+X5j7uSfRiFuQj07mQ9b4pdjyahXRGAuz+jG7xg4
 X9vAQYVhMoMHSbAQ7HTzs3aoRPRRu/UkTwVSJybUyQCvNo9AoqqqVinBrqeOHEvKqsJGiOSKb/8
 9e42W85BrL3MtKc9d1SlT1Vrp/Qg4OJ2cjO9mwdT2t0q4cIsIRiI/fnltRGl8o/rodsKFCNFc1r
 Wg9VQ5+c8ENqgV7w6p5dQSxU6rHvSNiE2Knc8RjP1KjJJzAKIuMoubsyWXbzTsdG+N9MsMWnQ9R
 qOwLdu7/N8HsLDVdbspRf6ous/BVHce2ik32jxH/6zFcLDawVPRjMQoi7fsUZSQPnfYLpS5JY6f
 bBkKmCSSlmDMfM4LMyw+he65KAzq9yVcyNEbvvmv7q7T1pHr/rx+Z9wps56LMxakoZusGhosHia
 J1BTOO+X/UACmpvM4mw==
X-Proofpoint-ORIG-GUID: nxm32dOKsunJY68p2JM0rVMRS_r_I7q2
X-Authority-Analysis: v=2.4 cv=KdHidwYD c=1 sm=1 tr=0 ts=6a27f1b6 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=LIoh_saxUwtCYziVtm8A:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-GUID: nxm32dOKsunJY68p2JM0rVMRS_r_I7q2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606090102
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-112138-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[20];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:gaurav.kohli@oss.qualcomm.com,m:andersson@kernel.org,m:mathieu.poirier@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:daniel.lezcano@oss.qualcomm.com,m:amit.kucheria@oss.qualcomm.com,m:mani@kernel.org,m:konradybcio@kernel.org,m:kees@kernel.org,m:gustavoars@kernel.org,m:cros-qcom-dts-watchers@chromium.org,m:linux-arm-msm@vger.kernel.org,m:linux-remoteproc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-pm@vger.kernel.org,m:linux-hardening@vger.kernel.org,m:manaf.pallikunhi@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:from_mime,6ymibirvwfnc:mid];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8A43E65F550

On Tue, Jun 09, 2026 at 03:52:59PM +0530, Gaurav Kohli wrote:
> Unlike the CPU, the CDSP/Modem does not throttle its speed automatically
> when it reaches high temperatures in kodiak.
> 
> Set up CDSP cooling by throttling the cdsp when it reaches 100°C and
> for modem when it reaches to 95°C.
> 
> Remove inherited mdmss cooling-map nodes for Non Modem kodiak variant.

Why? If it is a GNSS-only MPSS, does it not provide any thermal
mitigation mechanisms? Does ADSP provide those? WPSS?

> 
> Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/kodiak.dtsi               | 127 ++++++++++++++++++++-
>  .../boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts     |  17 +++

So, you removed those for Radxa Q6A, but not forRB3 Gen2. Why?

>  .../dts/qcom/qcs6490-thundercomm-minipc-g1iot.dts  |  17 +++
>  .../boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts |  17 +++
>  .../boot/dts/qcom/sc7280-herobrine-lte-sku.dtsi    |  18 +++
>  .../boot/dts/qcom/sc7280-herobrine-wifi-sku.dtsi   |  16 +++
>  6 files changed, 208 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/qcom/kodiak.dtsi
> index fa540d8c2615..d345add2d8c8 100644
> --- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
> +++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
> @@ -3427,6 +3427,9 @@ remoteproc_mpss: remoteproc@4080000 {
>  			qcom,smem-states = <&modem_smp2p_out 0>;
>  			qcom,smem-state-names = "stop";
>  
> +			#cooling-cells = <3>;
> +			tmd-names = "pa", "modem";
> +
>  			status = "disabled";
>  
>  			glink-edge {
> @@ -4787,6 +4790,9 @@ remoteproc_cdsp: remoteproc@a300000 {
>  			qcom,smem-states = <&cdsp_smp2p_out 0>;
>  			qcom,smem-state-names = "stop";
>  
> +			#cooling-cells = <2>;
> +			tmd-names = "cdsp_sw";

I'm going to review only this DT, the comments apply to the rest of
them.

So, we have two cases, CDSP and MPSS. Why does CDSP have only 2 cells?
Just because tmd-names has only one name? What if we add another
mitigation (which can be added in the firmware), do we suddenly have to
change number of cells and all the cooling devices to reflect it?

Finally. If I understand correctly, these mitigtion mechanisms are
provided by the firmware. Firmware differs between the boards. Vendors
(in theory) can change them. Why do we list these names here, in the SoC
DT?

> +
>  			status = "disabled";
>  
>  			glink-edge {
> +			cooling-maps {
> +				map0 {
> +					trip = <&mdmss0_alert1>;
> +					cooling-device = <&remoteproc_mpss 0 0 2>;

What does this mean? I assume that the first cell is one of the
mechanisms. What is the difference between them? Do we really need to
list them one by one here?

What do other cells mean? Why are they 0 and 2 rather than
THERMAL_NO_LIMIT? How does one come with those values? This should all
be documented and explained somewhere.

> +				};
> +
> +				map1 {
> +					trip = <&mdmss0_alert1>;
> +					cooling-device = <&remoteproc_mpss 1 0 2>;
> +				};
> +			};
>  		};
>  

-- 
With best wishes
Dmitry

