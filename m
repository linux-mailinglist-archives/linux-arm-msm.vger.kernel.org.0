Return-Path: <linux-arm-msm+bounces-117108-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id xkHUH7Z0TGpJkwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117108-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 05:38:30 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 816A07171AC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 05:38:29 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=nPspTZmr;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=gOQUQuKE;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117108-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117108-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 0BD183005148
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jul 2026 03:38:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F9B02E7361;
	Tue,  7 Jul 2026 03:38:24 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECF642472A2
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Jul 2026 03:38:22 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783395504; cv=none; b=Ko72aW/vnF9awEblz6NqorJxIVebGqgoUPsgaruEHHBoQiNjJoL1hZK4O6MogfuElr7RlRki3kCVUqZFAEkN/LVFMu8wau16uGJ5kGt+RT3LOgAKPLtaLpzUo4VgkzibMX1X2k8vD948lRfaaf8QJ+OLMElfS70HhKD8ayKQzng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783395504; c=relaxed/simple;
	bh=1R19W3UJiMF+o5dXiMyPiCVU0LUlZzWvzTRuI3yjAWY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C3pw/PZ6YaqxeSaaOFnTqDE4+pqA1KbHHO+uXL0CmjI2CzHInbWyWGXzb8iJqpO7rpP4Twl0BMNaUJ23pbr2gidWCvaka4jZrcfAxXK0wvEb+hkATYXKsFAWFUagv1kpbi1toiHmP5iCz2I6M097fY/ux6kCiYMO3qM4mRAri6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nPspTZmr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gOQUQuKE; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666KEOim1613950
	for <linux-arm-msm@vger.kernel.org>; Tue, 7 Jul 2026 03:38:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=B2TcjwvrSLcx95mIcFbiGsi6
	rjGASOKN5ZORqhzeVGk=; b=nPspTZmrl/QhCJ2qBdBBBGG6cQo0ZHrLpnyjILAE
	tQBQsSsIFf9S2sH8oWbLTez3mH/Es1OGrP0hs6c6UPYhmfNkvhf242C8h8lj5f9+
	Nk5g3EGtf2S7nDYl+DP/CTh2ogvPkV1LLr392P1yPKbYrd2SVVRiSgouVbV8lhsp
	lgHtjdIzwChh6fJx4ESddXHkAxxeaGYvt+QvkiNxWc5O0pdxB3vFYUgI2NHQhqYy
	u2Dk8W/dIfgF4A80og0PsukAV8uNbfO26bmFjRYV6s9Zq0ulf6fIjxmbH/cnMKgu
	WCDxDfVbc78Y5RUJFSTNrRiUtPZbHpyC2R1WyRXW/FfKeA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f88h54aya-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 03:38:21 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38096521198so5872359a91.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 20:38:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783395501; x=1784000301; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=B2TcjwvrSLcx95mIcFbiGsi6rjGASOKN5ZORqhzeVGk=;
        b=gOQUQuKEfVUcZKcxr9DK9ePqBImeKA9Lyp49vZ8sS2pdsBtqscZVEKQHgh31gqEsqW
         S5jnA5eG5TM1xd1CiM8TNCEix/RCe+s+fhy2ioc1BU/K0znz6vs7eDq/a3jyePtVsc0z
         Oq7GX6oURRwZ3z0VSGc6e11IE/ywCZ27N1giYYrRlbNWnARDTV7svAy3HBj0rUSBxuhF
         nojgAtRwGHkRNYFLQDDKSZny3dzgTAE2YONwOIgRvHz8mmcd6hAmyCCf2yuZCCTcFtnA
         N8QsnnLNGxX9pxrAo9qJg69YjvrVhgg6m98K3tFxFwDPvhchNSr20IuWaoAaRRvx+dL4
         uEnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783395501; x=1784000301;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=B2TcjwvrSLcx95mIcFbiGsi6rjGASOKN5ZORqhzeVGk=;
        b=iOwrbodg8PEaU3tVhQM+9LJ4nNnEv9+Xm33RED6K+uKTTdWuRBes/6OipuHL36SU+r
         sclgVYQinycpsH/a9VvdG8mCg7PFzo6r4sS20Za9xKsWjzbXnpfKpi/EHrTHi/x268TJ
         ahlCt/6rJ+dICMpIUFCyUDvH0smLC4KYIGrx3If+olI1IAN6KPkZiIW44Ah590AiRPw/
         aL34B2znKYwSJe4poS5DWfOtrsJC60NJ77rDflpGGZo9eFzT36Di8rcT9YSbcVgG+IS3
         mMWs72BfWigOhnMVVVX2cdoOszI6N9yBCYfeqFTuAto+e1F50MA4jHlpiU6oahbHKwUZ
         1fMw==
X-Forwarded-Encrypted: i=1; AHgh+RpXiXs1iqeD7nRMNqMlSRlMDvjWzXWvT0xKu6mGQIL+BblGiYGubQfhUEwXOVpZSndS0tLjHj8MHOy0VMUn@vger.kernel.org
X-Gm-Message-State: AOJu0YxFtx4ZlD9HN16u+594yWfworNjsACkAkXBo0vlh1LAoNbf2R/s
	eEDFYPTCdHWF0tvccRwx7VVy9oqfwi7lFS0sZX9hATlNVp3ou8XK0SSzKKN5IDmhNNc88EyA5h9
	kDJCCtdIrt24pdCutMm4ssx6+PBasEsKamaPgCmIwoOd9XmOlsqK7oJSg9+pfZ73DCLsB
X-Gm-Gg: AfdE7cn3sQvo0civcw36gzyDrrd05ejqa17Lg7LjD8CrrbWPtP5Xf2V0FmigEwLdhbs
	EBXoe/Prtjg+OvQDlg1WGz8TKdhFpOQX0SXkM/ONLAnOo/SdtwPx614zGoFI/i9dQoTyIqbrq/D
	77tC1gO3v42PS16Aoi7cnacHKZKIo0a4Z3SVr65HGt1HrqTTU0cAX4A6oCMnJjRtdJL2vrRdgzx
	ONy1c+cpI3tR7oupKHd26970KKg4G8o+gPKOz33uE6QKpOUKQLZCk0jlKvHv21cYWfqy/JYs3jM
	tt/0QOF6X9XyoEeKuVGD9bY2Exbkl0kuKQPu/HpUGNPQYNiC+nkLN6BQtR2l+cu3ON10vbdZXxh
	UWrYO+iElHxI4BUb+hkX3UHRhiSuzK8IxeHzYO2vf0UA2
X-Received: by 2002:a17:90b:2e48:b0:37d:9874:9363 with SMTP id 98e67ed59e1d1-387568026b5mr3341542a91.2.1783395500938;
        Mon, 06 Jul 2026 20:38:20 -0700 (PDT)
X-Received: by 2002:a17:90b:2e48:b0:37d:9874:9363 with SMTP id 98e67ed59e1d1-387568026b5mr3341504a91.2.1783395500404;
        Mon, 06 Jul 2026 20:38:20 -0700 (PDT)
Received: from hu-pkondeti-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31174ac178dsm3126112eec.28.2026.07.06.20.38.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 20:38:20 -0700 (PDT)
Date: Tue, 7 Jul 2026 09:08:13 +0530
From: Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>
To: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
Cc: Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Harshal Dev <harshal.dev@oss.qualcomm.com>,
        Herbert Xu <herbert@gondor.apana.org.au>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 RESEND 3/5] arm64: dts: qcom: Add device tree for Nord
 SA8797P SoC
Message-ID: <bdb6ea4a-9536-4b4e-9849-2ebf2d26fd60@quicinc.com>
References: <20260526051300.1669201-1-shengchao.guo@oss.qualcomm.com>
 <20260526051300.1669201-4-shengchao.guo@oss.qualcomm.com>
 <eb197cd7-c1cb-4edb-951c-dba08864ec74@quicinc.com>
 <46af10c8-8400-4131-ac87-b3f17350bb65@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <46af10c8-8400-4131-ac87-b3f17350bb65@oss.qualcomm.com>
X-Proofpoint-GUID: CJcw5_6f6XGwMz2m3jiwUwelUzGOZyJX
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDAzMCBTYWx0ZWRfXyOIaeISvnP3Y
 hi9ugqtDnxafJ0RhrbspQSi9HepTUB+FxN5glq5Qjtk9xbcVt97bszHpRtWTYAWnxQGfzQ0arqv
 vX/+RPkU5JiV6uiu5Z8dnJORaY+OcUQ=
X-Authority-Analysis: v=2.4 cv=EPU2FVZC c=1 sm=1 tr=0 ts=6a4c74ad cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=1l3KTh2Z3xRHg-jYdCcA:9 a=CjuIK1q_8ugA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDAzMCBTYWx0ZWRfX359oggPoPSpL
 lOn3hTNTIAhKSUBw61QVR1W/0W6QpWf+4/uBPOxj1pdkVT9Ic3ciEjWQk3v66huD15QurORs2bA
 sdTkNNhXOhsBQlft5aP8gXI5gaY+d7WwgfqM30krZDei/axTdvXZFGNHWOaSiKRmeLYj8q61hw7
 1xWBOi/cdxeYqNIwPWxdaL9rMyZ+ZkxBjX/wQ05+70rSr7nPE+YZ3Rl9alfeI8z6BrTmFCbAA6s
 JjXx+AtAdErPD7EJN1ACYv6xriFJC2ex6U87aykVmZQUD8vqGPsP1+XLmVPB7x4f0I7lvucYwfX
 UFPmaO5jrz3zlYUuIROjGamaU4RS9/2ap3E6MNRF7cNXLUQ15cTmkHhM8/DdMH9AW2gyWquK14c
 /A8b3l5YnIUUZI/M/mWFiyfAdw5iwYYkzDPlJYB9H2FVNyHpxC6QicxsVIC9HIhtDx+Le9bpjrv
 kEKOZ5r6Ny40QjhH40A==
X-Proofpoint-ORIG-GUID: CJcw5_6f6XGwMz2m3jiwUwelUzGOZyJX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_03,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 malwarescore=0
 spamscore=0 adultscore=0 suspectscore=0 phishscore=0 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607070030
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-117108-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:deepti.jaggi@oss.qualcomm.com,m:pavan.kondeti@oss.qualcomm.com,m:shengchao.guo@oss.qualcomm.com,m:andersson@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:konradybcio@kernel.org,m:lumag@kernel.org,m:bartosz.golaszewski@oss.qualcomm.com,m:harshal.dev@oss.qualcomm.com,m:herbert@gondor.apana.org.au,m:devicetree@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,vger.kernel.org:from_smtp,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_SENDER(0.00)[pavan.kondeti@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pavan.kondeti@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 816A07171AC

On Mon, Jul 06, 2026 at 07:15:15PM -0700, Deepti Jaggi wrote:
> 
> 
> On 7/6/2026 6:57 AM, Pavan Kondeti wrote:
> > On Tue, May 26, 2026 at 01:12:58PM +0800, Shawn Guo wrote:
> >> diff --git a/arch/arm64/boot/dts/qcom/scmi-common.dtsi b/arch/arm64/boot/dts/qcom/scmi-common.dtsi
> >> new file mode 100644
> >> index 000000000000..0c7ffe9e415c
> >> --- /dev/null
> >> +++ b/arch/arm64/boot/dts/qcom/scmi-common.dtsi
> >> @@ -0,0 +1,1918 @@
> >> +// SPDX-License-Identifier: BSD-3-Clause
> >> +/*
> >> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> >> + */
> >> +
> >> +#include <dt-bindings/interrupt-controller/arm-gic.h>
> >> +
> >> +&firmware {
> >> +	scmi0: scmi-0 {
> >> +		compatible = "qcom,scmi-smc";
> >> +		arm,smc-id = <0xc6008012>;
> >> +		shmem = <&shmem0>;
> >> +		interrupts = <GIC_SPI 963 IRQ_TYPE_EDGE_RISING>;
> >> +		interrupt-names = "a2p";
> > 
> > I believe this interrupt source is GearVM firmware via Gunyah's
> > doorbell, correct? How do we know that scmi0 instance's interrupt 
> > is GIC_SPI#963? Are these assumed to be constant/fixed through out
> > the life time of this SoC?
> 
> Yes, this interrupt is a Gunyah Rx doorbell VIRQ for SCMI a2p completion
> from GearVM to Linux. It is allocated by Gunyah RM from the platform's virtual
> IRQ range and patched into the DTB by Linux bootloader at boot stage.
>  
> > 

Thanks Deepti. IIUC, GIC_SPI#963 may be overridden by bootloader and
potentially this IRQ can change across runs or when firmware is changed
etc. The interrupt property is a place holder. can you confirm please?

Thanks,
Pavan

