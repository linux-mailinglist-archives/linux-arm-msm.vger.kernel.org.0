Return-Path: <linux-arm-msm+bounces-119023-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 9VsgLPAqVmpB0gAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-119023-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 14:26:24 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0848775482C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 14:26:24 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=BCwC3Yce;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=FMYwXUZ9;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-119023-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-119023-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 368F531C27BC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 12:15:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE6933BFE25;
	Tue, 14 Jul 2026 12:15:37 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF19A3BF684
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 12:15:33 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784031337; cv=none; b=E3Uc7cI/fZOzl7MKx3YRqAfrZ2nNfDJ/pnVtSJrHduseuaEVGjoGKZ7WXn4VwDt3x2qCiSZ0q9IeX2WeZGW1VhsJkK/JIUx2eiAp6/dnjKqyXre90/o1eIq9qw2q5jv/HCZbUKkvkV+NxB5/pHXtYQ4JIBbeIVS6VagTtABjpzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784031337; c=relaxed/simple;
	bh=W/pTqIwe4xUNI9+Bwfc1wa6dgdLWycDVCa4WxTfAbsU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MAEFJohHIQOzO5vQ9E9lfR29PL0yGSOHjtBKucEPjn+LX+G1rDa48rvG/hFJsUtyNDRmtcAsOHqCZS4mIN5nd6u1XVH+RKAiSOYO5pTEriz5AQY0a+jUrVQVDFWyKb6Ier7vo5fZofPsM3vSG6OUwfzGOug3FsolHO9lft/nn4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BCwC3Yce; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FMYwXUZ9; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66EBNoxY376997
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 12:15:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=EbjabJKfrypzaGJPXCP6Zom0
	cRMqI1dN1ZRsHgXVLeg=; b=BCwC3YceSfwa5tCq0n8uf1ZuEWzFe+jcfoePJfUA
	6ns6PPCOYID+3zmLzZ8iioTqcs/5V3hTiZEDX+3Ejj/ojYTb3YxMnDbmGXXRO9ZT
	oTfc/ZsJmtWzfUybVqva0uFoxDTQVcmNt5WgAmC2oNA92NC/rBbhoTDBD3OrIWcf
	59eckJZFwXgmTTWroi/hyhqcjwEO1FVT7WYq6P/iikr6SChYavatcyVRXQ2xoYHW
	T1EZ11BwMgBlNTnmgZmThZirGieP4xYWXUPP0XCgRYntvndYr5cJIbwpxBZnEbEY
	4LAfneq+4ISCv02BNnIkOP/li/HeJXpBWcbrWNMT7LmjLA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fdbr4a55b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 12:15:31 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ccb687f82eso66039125ad.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 05:15:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784031331; x=1784636131; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EbjabJKfrypzaGJPXCP6Zom0cRMqI1dN1ZRsHgXVLeg=;
        b=FMYwXUZ9kSKfBW6QhIs4u56FQsL5cvzgDpUxz06hmu5t2s9YpM+kFrdkFD/8SQfPu4
         s9L3OrXKBZ7EVQYX6uiu/TIVtZWX8Za6vnoC2AzqiPRiazSN+n604dZfgGL6xYeJrFgm
         W3gHIc9bll8G8KtDnixlybma7S070vtcn8XcJsqUzow4K9tsppuYxGc8ZMB4uJ5Z6yh1
         kZPyhB4VNv8ufyDl6D1vmck/PgybZI5loTPF+CF8mdczZGlPglSKcWq8duD2JCmtF+dG
         34WPPSLTjcFPG99R1VE+jLrTIBx2IFcUmkBPTq4gwosS2h9YQN7qTNQax3FXE+wt0i1w
         sSfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784031331; x=1784636131;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EbjabJKfrypzaGJPXCP6Zom0cRMqI1dN1ZRsHgXVLeg=;
        b=Algh+k4zZWQ60Jra3lPNc6pRxnO+kW5Q0/eyPM4mndhL7Dr2IpodjBkWnA03jEPokF
         72XcuRYWUPJT+ZEqk/n37slLbM3w4I6w1uRnx8H3+hon/wIvLjoLytRzWxuO/X0pm/md
         WfVhwyVKyse4tYbGh02FQljeGogHSZfbNY2tIFuuiGt69uuMl0ax1tVfCkpWAd7VucUS
         tvkT3pBfbLlMCylZFo8Ms4K4qF3+daSqBsn5t9siFMjG56FSOP9CmOURxQ9Rl5FiVn3Z
         hb/v1ji7i+YDA5KCDk/OW/8Sd20ZOPIUrMHj8bhTCJJ/7nPxaF/8Bl6DeWXw4BE5xWLc
         Lc7w==
X-Forwarded-Encrypted: i=1; AHgh+Rqjlh2YODU9FgsAHUhgcDQfrPP1/B7ZjdtAJETp4o3wuojK4qiPJlfgdyRRxax7YwxvbROJ2Rmh9sfmcOyz@vger.kernel.org
X-Gm-Message-State: AOJu0Yzs+L3FkmpaQ/SrNSUtFel7iLvzI5gh4mx0C4qEbUcHKu+5qUZX
	zWr4b9D5CT1RJpRzTn8aHIKzjyHCQ+9EqCKRcxDg1G8aFKMu3D8fHTtIkmUUGnyY8OPzlq/uQ6A
	S/eIP08E/FV92CPHwfSbI1OuHHYyT+GycO5SWyALwJe0i1aFVZragSjaKFQUhSgi74cBY
X-Gm-Gg: AfdE7cn0DaEnjjsb28Fcqw244IDtECjLY+0iMq3hdsEkp42cvzZ420BpnVuntu7w0UU
	VUsGIOnm6WN6CdNWSLzk5wX52IT1AtHMXDDJbhEi5gtECCyqD67LIQu9b7hO6tV7C0psWgVYORc
	G+mPKJqfRrjtB6cC77Lwc6ajpOFVmvdStteymA+e0/Dkk671AbQHk+h6fd2RLkxGBgBcDb3u+wy
	lU3tfZHRGOpPoBpI8mK2m2SqHDAY7CM1BmizFpP0Bzc/ktqZHZEFTAlL2vJXpKwMdLS1o1PYpJB
	e8AD0OkVA9YZMe197q6SKX5sJ483dCh3WCMqHzUNQ93wEQ6xMsN+QOKBz0K/ZH5BSVJz8rwqYaX
	zrjcPidf/X1ftaXzZ3FK9tY4Y+KrmalPlw2rbdTtI+CQQzP5ij0/z0g==
X-Received: by 2002:a05:6300:218c:b0:3bf:6c08:fb82 with SMTP id adf61e73a8af0-3c1109ecd0fmr14656803637.50.1784031330525;
        Tue, 14 Jul 2026 05:15:30 -0700 (PDT)
X-Received: by 2002:a05:6300:218c:b0:3bf:6c08:fb82 with SMTP id adf61e73a8af0-3c1109ecd0fmr14656752637.50.1784031329973;
        Tue, 14 Jul 2026 05:15:29 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b9a67c217sm22222147c88.8.2026.07.14.05.15.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 05:15:29 -0700 (PDT)
Date: Tue, 14 Jul 2026 20:15:24 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: Re: [PATCH v5 5/7] arm64: dts: qcom: Add device tree for Nord
 Embedded variant
Message-ID: <alYoXKxcXFd6vSNe@QCOM-aGQu4IUr3Y>
References: <20260709132013.4096850-1-shengchao.guo@oss.qualcomm.com>
 <20260709132013.4096850-6-shengchao.guo@oss.qualcomm.com>
 <alOwD1G9plyy3BO4@baldur>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alOwD1G9plyy3BO4@baldur>
X-Proofpoint-GUID: 3Prk7O5kzd06HxfRA2WQX_MRPytlmU7H
X-Proofpoint-ORIG-GUID: 3Prk7O5kzd06HxfRA2WQX_MRPytlmU7H
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE0MDEyNyBTYWx0ZWRfX5rneghgHJYus
 j8JuC2Bv/wAiXlDnfcTaQmccqv//7arSBOWtih7qsLUgAOFUcY0QRSkYQcwWfJeZ0YgrVa34jZW
 nymB6kznX6NFimbJEgGKH9HEb8NvlI792OsaxQUMdYrN0i0EZn2Y4KkfsEHO5VLK8y5DS5yWEC4
 Z2/XwIKMyy+h0PsoNY4XwsPjd1Dto9z7+Ehb+S25keUF+GAz3JOA+ndeLCMdQLLUUrHXmqYhBDt
 U3chDc6eUs3qywjC4V4JaZqAW8+zcAYXg9cBsDeH4bKmOnCpAhy4h0w96ndlTWbifg1fW2i+ri9
 6Z//dHNZXt3p5rLWY6Iyeo3X0ZBi4cVa6QQq19pBNlWReltUEbzXj45UpZCBardbvI8/fUoNrzc
 y4Z00Xy0pHPlMXPwE/bFBQwJzgiupFf2cVRPAcygV0iYEjb5ck3Oel9Tw/i/MVP6zUEpq0uvjoO
 TkcdO+L2j5uZ88a53Gg==
X-Authority-Analysis: v=2.4 cv=F5hnsKhN c=1 sm=1 tr=0 ts=6a562863 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=EqI0jlZnegA9myTLE5AA:9 a=CjuIK1q_8ugA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE0MDEyNyBTYWx0ZWRfX/xB6TD+Efc9V
 ftN0GzY8oArVqR4U7Gq8JP1i8Wss0r2Kv5lkrfcAvl+rQuFpmPz5xv1AjxzWWwPTt4gIDVNa3fk
 AZUMw+95R0ulRRmVYwcgUme+Jq1RfUs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-14_03,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 malwarescore=0 priorityscore=1501 suspectscore=0
 clxscore=1015 adultscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607140127
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
	TAGGED_FROM(0.00)[bounces-119023-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,QCOM-aGQu4IUr3Y:mid,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:brgl@kernel.org,m:deepti.jaggi@oss.qualcomm.com,m:devicetree@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:bartosz.golaszewski@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
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
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0848775482C

On Sun, Jul 12, 2026 at 10:39:44AM -0500, Bjorn Andersson wrote:
> On Thu, Jul 09, 2026 at 09:20:11PM +0800, Shawn Guo wrote:
> > Unlike the GearVM variant, Nord Embedded variant has platform resources
> > (clocks, regulators, powerdomains, pins, etc.) directly controlled by
> > Linux.
> 
> We're writing DeviceTree here, our job is solely to express the hardware
> and firmware interfaces using the agreed upon bindings.
> As such resources are "directly controlled by the operating system" -
> not "Linux".

Indeed! Thanks for the suggestion!

> 
> That said, this is a good structured commit message, starting with
> problem description, nicely done.
> 
> > Add a separate dtsi file extending the existing top-level
> > nord.dtsi with nodes representing these peripherals as well as describing
> > how they are wired up with the already defined components.
> > 
> > Co-developed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> > Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> > ---
> >  arch/arm64/boot/dts/qcom/nord-embedded.dtsi | 1731 +++++++++++++++++++
> >  1 file changed, 1731 insertions(+)
> >  create mode 100644 arch/arm64/boot/dts/qcom/nord-embedded.dtsi
> > 
> > diff --git a/arch/arm64/boot/dts/qcom/nord-embedded.dtsi b/arch/arm64/boot/dts/qcom/nord-embedded.dtsi
> [..]
> > +/ {
> > +	clk_virt: interconnect-clk-virt {
> > +		compatible = "qcom,nord-clk-virt";
> > +		#interconnect-cells = <2>;
> > +		qcom,bcm-voters = <&apps_bcm_voter>;
> > +	};
> > +
> > +	mc_virt: interconnect-mc-virt {
> > +		compatible = "qcom,nord-mc-virt";
> > +		#interconnect-cells = <2>;
> > +		qcom,bcm-voters = <&apps_bcm_voter>;
> > +	};
> > +};
> > +
> > +&crypto {
> 
> Just to document my concern here as well, splitting the definition of
> IP-blocks like this across two separate files makes it very hard for a
> human to reason about what the actual platform dtsi looks like.
> 
> If the benefit of this reuse is worth the added complexity, I'm
> accepting it, but it does means that I expect that any changes to
> nord.dtsi will be tested across both models!

That's a reasonable ask!

> 
> > +	interconnects = <&aggre1_noc_tile MASTER_CRYPTO_CORE0 QCOM_ICC_TAG_ALWAYS
> > +			 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
> > +	interconnect-names = "memory";
> > +};
> [..]
> > +&ufs_mem_hc {
> > +	reg = <0x0 0x01d44000 0x0 0x3000>,
> > +	      <0x0 0x01d60000 0x0 0x15000>;
> > +	reg-names = "std",
> > +		    "mcq";
> 
> All other changes in this patch directly relates to resource providers,
> why does the UFS controller's mmio ranges change?

We can have them in nord.dtsi just like all other device nodes, but we
will need to delete reg-names from nord-gearvm.dtsi, since
qcom,sa8255p-ufshc binding doesn't require reg-names.

@@ -2907,5 +2907,6 @@ &ufs_mem_hc {
        compatible = "qcom,sa8797p-ufshc",
                     "qcom,sa8255p-ufshc";
        reg = <0x0 0x01d44000 0x0 0x3000>;
+       /delete-property/ reg-names;
        power-domains = <&scmi3_pd 0>;
 };

I will do this with v6, unless you hate delete-property.

Shawn

