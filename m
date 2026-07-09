Return-Path: <linux-arm-msm+bounces-117884-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id cYViKAhUT2o0egIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117884-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 09:55:52 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C5C272DFB2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 09:55:51 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=DRo2GoJh;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="I/TyhNrf";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117884-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117884-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id D916530447E7
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jul 2026 07:43:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC58A3E5A01;
	Thu,  9 Jul 2026 07:43:20 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4685A3C1974
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Jul 2026 07:43:19 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783583000; cv=none; b=slvZc0WKhazsc4dLSn8aEmKI7JeiAF3rhGunrJ7FsK6EXK7Lpxx+Vt4gZFxr+Izu005YVEXiz3U8LVSSCWMFI+Vb38A7sffo/bsco6rROKcjKl/ejnel5FoaH9MBls30duTeuUPGz1DI1yYxEOHNcG/vRpfi+6kdCrsmD2DMViA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783583000; c=relaxed/simple;
	bh=N2AKOZPF3QCaU8pDNcD5OHSjYdPrRJn+VfVH8dstl/c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jmI0lISeCjDGuruykE6V8NtLUkZlm2CXquyoeTv9jbgUiiGpQDVwhmhk6yccDBe0eRT7mPWR1FlP1IoX/3FiIrxYSCmTNiq5Mi74EosQDffHXuynNMdDB9VEfwdhgwrz3and9Thlm67o+uz8E3dBTTL/TR8ZWIN/nzGFu08jV9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DRo2GoJh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=I/TyhNrf; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 669619ZB933370
	for <linux-arm-msm@vger.kernel.org>; Thu, 9 Jul 2026 07:43:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=iEaAOjzS0I8yEOShcxjJ6Zu0
	Kvm310/Pv3hHpz2NeO8=; b=DRo2GoJhCoxoV+Yadd1GZopMJ+VP6HYguBwCK+6U
	6mAy1OpV1Nz7Zp/ukUdzUxikQr/MQJvBaaep+WSnXlAfkPjdeg2Sdt5ruJjRbvjc
	Sjnu3PQymcMWUH84o3rY4DlJCUW5v2w2JGXNEfbCOnhkqMvu1PF4gYW4ISN5nAeL
	v+Te4uNpkyIYe1QxycTP1UXB+zwFaZWknI8NdMLSrPl3U6pidTlGCpzRko+Mt0/a
	2eReUihmq8U2eiy4wI3FFpoiOt0VCn+/t1eAVCzlesnYN9/uX/GpsKZCd0mvgCx2
	aoFreZH+mEeX+K0RurYp5kpi3BaFvpujU/WBOH7YFrmIPw==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9ug6jh28-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2026 07:43:18 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-744c204396cso1365387137.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2026 00:43:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783582998; x=1784187798; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=iEaAOjzS0I8yEOShcxjJ6Zu0Kvm310/Pv3hHpz2NeO8=;
        b=I/TyhNrf14ChlFBUM/3gxGbx1MAqF+dlPJmOxCqUspGZK7Vu/CsEU13AqQcigPYP8y
         ETGdzTJ/xGn+huY3KFU5sW0ecWttI7S4Vm6IawB3nvkdwx4sTA0TS7SNAT5gufau2GEM
         sOo57HqtvjQg4iijl1oQJidEYP7rXqz7YVwbPjwrQQTayCsvOJZdxbDcRtNAuopPgGNR
         GYI3fLZclrhpTZiq2GsN66gQ9YAmzI61sHzjsnRIuU8bCPxjEMbrb4QiZlocdZ7Ob8Ti
         LBAvmsOXWhFYoWjTyTttaQIxPJmX9VTtSh6PD7KvarWz6CmrrH/7Wn+YQG5417MaEXqo
         EHNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783582998; x=1784187798;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iEaAOjzS0I8yEOShcxjJ6Zu0Kvm310/Pv3hHpz2NeO8=;
        b=oSma4xWnzqQg/jAroqIujNRhNSuCPsU6DaSKB+MqjY7DiG1DAdCeHII+WXuczKh/Bf
         fgSzO3BFzof0Uo9L5cXBUO2kIx4U5L52/QLvQ0eF7NBtyUVjkO+oOx+8hz28xkuTLd0c
         RTFXcRwp/PF7HCzT5WskmbiCzcfXW6qvlfLwfKq+blQAFW6G2KLY5g6hopgF1TLar14y
         Vr83Rq8vI5fNh3mo5Ekv0bSf90BDjDLSFi7XGYMqK5GtFoqvvG5zUcxwcjoaDMIUstt2
         8cZxFpBSI/cvocGOH4AwnOTjdsvscSuxWxIcoD3eJKOVREZ2qtQquO5YR8hfKqn/j+N1
         TGlw==
X-Forwarded-Encrypted: i=1; AHgh+RoiEROpii6V5wF/up2Npw6MVT7NZq4t3skI1CUGuyIV4QvYA6aoMlBQJJT/CAN2LAj+kVfx7VgTKOUE0R19@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6n5kEIzJCpiFNcClncIxLwAYL4SOISJAP4Q+K/Alg3k0Gorfa
	IvCeMTsGbD38ysn+PMmFz3HowZ9Z2LyfEhc+dXop9p4kjXPqghojdiBBQrHo2z0mJ700fGA/1Q7
	Dy4+79Gu0gQovnu8xTj/V2+ITRd6P/pDr8VvK4rIsilm/qZNMdRXqrZCz1MLZ5lpi+g+w
X-Gm-Gg: AfdE7cn8wAIKE8VYIae/IeQn2PW9AY89yJX+N8JceR21iZFyvFf1+7Bq6yly7MzyRhJ
	g44LyqepUrfXkORhlEKXyfgtmTiHOh0RAxYPL9DtmoElzq+TWmNTdeS9vFm5obNNea+ggeH6ZHN
	V+6YWK3Asi70MYqKkaiJXH1BeZhgDeXOwqi6WwbcWA7BSeSZSnQo52oEZZWIp32u/FdkiKgnxzk
	5TYaqs5hocFyhyLl6rfCaRlJr+wO7nDTAntbgSb1Ps6JRnBXsrAmQwhvoD2TCLS9QX18pCVwjy7
	sSpywC9cIq8ZMXZlXWdUpOWyoFU9NrWJvXNdhiYhW3GadjuRCS0B4l81xV17h8c6DYZj+cmg7Np
	IP40V+JdTReUbibmXF2TiARqS5Ve14Yc7YGm59ev0ge/TksLvzBZdbLKYsuEpa/aW7g3GhGAxtj
	zUyY36MDxoiBAHAP0G5jkV4iiL
X-Received: by 2002:a05:6102:a4b:b0:73a:16eb:ac94 with SMTP id ada2fe7eead31-744e0327293mr3634273137.19.1783582997497;
        Thu, 09 Jul 2026 00:43:17 -0700 (PDT)
X-Received: by 2002:a05:6102:a4b:b0:73a:16eb:ac94 with SMTP id ada2fe7eead31-744e0327293mr3634256137.19.1783582997038;
        Thu, 09 Jul 2026 00:43:17 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b017f150f3sm199031e87.30.2026.07.09.00.43.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 00:43:15 -0700 (PDT)
Date: Thu, 9 Jul 2026 10:43:13 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
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
Message-ID: <axs3k2rvgmlatpmyexs5lnwukufdmsxipl5npqygpwhyvonaal@3j6nuwgo6pqw>
References: <20260526051300.1669201-1-shengchao.guo@oss.qualcomm.com>
 <20260526051300.1669201-4-shengchao.guo@oss.qualcomm.com>
 <eb197cd7-c1cb-4edb-951c-dba08864ec74@quicinc.com>
 <46af10c8-8400-4131-ac87-b3f17350bb65@oss.qualcomm.com>
 <bdb6ea4a-9536-4b4e-9849-2ebf2d26fd60@quicinc.com>
 <e4a4088a-89a8-4234-8469-a5f4ee0b9d6e@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e4a4088a-89a8-4234-8469-a5f4ee0b9d6e@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDA3MiBTYWx0ZWRfX04n/M4HeJCIk
 kIPSDRnZelv1G6NBGPow4V+SRLGqZFbKg1ixg4OT9PFz8Tkpm1SE1bj28j+mvgpsINmmCsxm+FF
 WA3wfSmzwwAksssoBvGrLf//rEjj4sI=
X-Proofpoint-GUID: CO9k2U-jF7Ns2nIRbYD5irJHktR_jg7-
X-Authority-Analysis: v=2.4 cv=cL3QdFeN c=1 sm=1 tr=0 ts=6a4f5116 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=2Sg93fSZGufiyqZajnoA:9
 a=CjuIK1q_8ugA:10 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-ORIG-GUID: CO9k2U-jF7Ns2nIRbYD5irJHktR_jg7-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDA3MiBTYWx0ZWRfX2SgLxqTR7NSN
 lvMPiYChiqiRl9gmMuKqRGSNouYmMMR596Kr663l2mYFpFiN08VszusmDR/YvJa7px1ShhI6rZO
 7SNrcdt0Ek34oiVzhNbgkP6ndHlnM7pczVjAwwO3OOpRWgMBWSmsPbI2HyJPJ0Akf9LPh1Edx0i
 DVRxDEc/COxwQZ/HKsd+ER9IrCXzfkAP7dTMTXEF7L2JddZ8DSOI6G7VdtFtulpP940LiIcj3QD
 ytExR1jeoZjpqP5BkpdEUGupsi+WcngLQJcjjftowjglnkXAi94dt75CjkmjsSkWuOnmjJQXFiv
 hCqM5PFBD76xI5eTLErCXuksd3nOOI9wiyH+HcBo8EU5BEgjGwn8PDv4Fe7SZpg3AuRcS98CJw3
 ZFpe7v4boNVXiVwoQoQbM7udvlbQUFGisFmnxHfDr5ynxugsjQlavxsvekFCKe8Pfr0TkIKTadA
 NY1fNIVW6PWlhtImSew==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_01,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 suspectscore=0 adultscore=0 spamscore=0
 phishscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607090072
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-117884-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,vger.kernel.org:from_smtp,3j6nuwgo6pqw:mid];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_RECIPIENTS(0.00)[m:deepti.jaggi@oss.qualcomm.com,m:pavan.kondeti@oss.qualcomm.com,m:shengchao.guo@oss.qualcomm.com,m:andersson@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:konradybcio@kernel.org,m:lumag@kernel.org,m:bartosz.golaszewski@oss.qualcomm.com,m:harshal.dev@oss.qualcomm.com,m:herbert@gondor.apana.org.au,m:devicetree@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8C5C272DFB2

On Wed, Jul 08, 2026 at 08:19:06PM -0700, Deepti Jaggi wrote:
> 
> 
> On 7/6/2026 8:38 PM, Pavan Kondeti wrote:
> > On Mon, Jul 06, 2026 at 07:15:15PM -0700, Deepti Jaggi wrote:
> >>
> >>
> >> On 7/6/2026 6:57 AM, Pavan Kondeti wrote:
> >>> On Tue, May 26, 2026 at 01:12:58PM +0800, Shawn Guo wrote:
> >>>> diff --git a/arch/arm64/boot/dts/qcom/scmi-common.dtsi b/arch/arm64/boot/dts/qcom/scmi-common.dtsi
> >>>> new file mode 100644
> >>>> index 000000000000..0c7ffe9e415c
> >>>> --- /dev/null
> >>>> +++ b/arch/arm64/boot/dts/qcom/scmi-common.dtsi
> >>>> @@ -0,0 +1,1918 @@
> >>>> +// SPDX-License-Identifier: BSD-3-Clause
> >>>> +/*
> >>>> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> >>>> + */
> >>>> +
> >>>> +#include <dt-bindings/interrupt-controller/arm-gic.h>
> >>>> +
> >>>> +&firmware {
> >>>> +	scmi0: scmi-0 {
> >>>> +		compatible = "qcom,scmi-smc";
> >>>> +		arm,smc-id = <0xc6008012>;
> >>>> +		shmem = <&shmem0>;
> >>>> +		interrupts = <GIC_SPI 963 IRQ_TYPE_EDGE_RISING>;
> >>>> +		interrupt-names = "a2p";
> >>>
> >>> I believe this interrupt source is GearVM firmware via Gunyah's
> >>> doorbell, correct? How do we know that scmi0 instance's interrupt 
> >>> is GIC_SPI#963? Are these assumed to be constant/fixed through out
> >>> the life time of this SoC?
> >>
> >> Yes, this interrupt is a Gunyah Rx doorbell VIRQ for SCMI a2p completion
> >> from GearVM to Linux. It is allocated by Gunyah RM from the platform's virtual
> >> IRQ range and patched into the DTB by Linux bootloader at boot stage.
> >>  
> >>>
> > 
> > Thanks Deepti. IIUC, GIC_SPI#963 may be overridden by bootloader and
> > potentially this IRQ can change across runs or when firmware is changed
> > etc. The interrupt property is a place holder. can you confirm please?
> >
> 
> IRQ will not change across runs , it may change with firmware updates.

If it is provided by the firmware, why is it a part of the DT?

-- 
With best wishes
Dmitry

