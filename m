Return-Path: <linux-arm-msm+bounces-113271-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id J8FpMi6RMGrsUQUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113271-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 01:56:30 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A3B268AAE2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 01:56:30 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Jcrbfq04;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=S2vkd+cF;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113271-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113271-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AFF5D303CEA0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 23:56:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36B3736DA10;
	Mon, 15 Jun 2026 23:56:20 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E169836B061
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 23:56:18 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781567780; cv=none; b=P53S7jFtBoPdJrAv+U2sacLfURln3VaBGTSi9iBSPsoSwc+5DDVKe2aUGenl6bAOcMZNdbOWasqi5O5Ld18pj8MZaptcXMV0nE8FWxpMBh2Kyi3X9dLZ9w9BTnSJ8QYlbJO4C1YfwRjHveI78o5Zw7snZG1R13EK7CrHVlKEU4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781567780; c=relaxed/simple;
	bh=GSDE17dix6NM4G9TyF8RriQusXi8CIwfyjIN1giOcEo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Mpv+yzPfNGYDROuagMs66PxaGG+Lo2gDqw4YJn6LnTp2B87Z2C24/wSsDi4XsQiiWx2fSEW5uP3ETxvuveY3fWOVzdlqGmnRVzNTSYucG6+4yGHnpDwmOLu2hVqL9LAgFltEOAUE4Bgd/PhRbTBA24VEqETB0FSMQB+Vqw70Ecs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Jcrbfq04; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=S2vkd+cF; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65FJ2Mgm1245790
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 23:56:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=pGRlwJSIZC4OC7CDfGLngBCa
	nYzdpwDoYdH51ukyug4=; b=Jcrbfq04t0NEl+bQ4SMz0vX8ub9D5qnwJMVd+uOr
	T1yuRIzYNPO8JFMhkITMHXWMcZdcF7VPNw7EjcIeJzT3NwfRh0bVp+aaisw4uBMj
	tlhvszUMgO3i8mYCLs0NRcKdENGyfPI4LilFeU/DNcxXI/cEaFi6OmKc6vPwsR5M
	MnInXLQxHZtl2ejQos03+XF0e2os5nZwSfSgcRT6wtGPuKNjMuuIaDT1PAqsSB7h
	MADPTsJ0PhMsNo5FRuS3bHCALMn5Pblnuf2k6wlh220sP2R0WGRZ3NQNmJ356tJ6
	dWWLi+Kb0jO44B+sdhZO5jors91HkKxVsq9qorL9S9J/Jw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4etetf3k7u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 23:56:17 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-915f7bd027eso1037580885a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 16:56:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781567777; x=1782172577; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pGRlwJSIZC4OC7CDfGLngBCanYzdpwDoYdH51ukyug4=;
        b=S2vkd+cFHimI8OUihDK/cJKN7LulzQu6LHCf2l2FktWoTQ9m20GSyKk+Zpp+UkhTGW
         AKsJq/aW9I/Qdq4eOPdjnKgnJ/L4u6BbBA2C6VrdG64i25lqxrU8WN3c+Q6dsQfZh4jd
         uqfATszCjoxGO2z70SNw7NxIie92/0vEpUgD2cQP3mFB7cKBSlBNjACjTAzdiuj1oqR4
         ABe31SvyNYF0eY+JdNmmvSb1jWcc+7uZ+PCzofTLwja4FPdEx98MMyhfOodIsEG5cbsC
         MHiI8xlJd89UIAqCx+o/56nGSer1/tchK7ycZ2fbjEuO9Rn+XJayXWtWR+j8Oof8sijG
         cUlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781567777; x=1782172577;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pGRlwJSIZC4OC7CDfGLngBCanYzdpwDoYdH51ukyug4=;
        b=Q59N3+NZsjz6/++ykf+rMbiIeDc/pwSp8pfV1+A/1Q7iaeXzG2Uo0vkehv5BHTB7aC
         OD+4fR4Zs13a/kxelgusdHwJ1r3OFkXlSiyC7rxSPdmwgx7o1qRxBMjSvGw0UfJCaiwK
         seMsM+LJTYVlFxYxtQLpR1LcG6lDOL3Wi240iklV+ElYtBI8sqgrK8RVDJ2JDad+RUp9
         x5TwuyYspko1fA4+KnxuNtksoMcdjCMEnZ2IuCNVRrOxNJOQH8kaW5641gcWOKPy5agu
         bne14sVTaVcmpN87DKurlfPbQwRTi9osN8SvZPm9ZRx+UxyxUgwsGhps/96EhmfHHrSq
         BIHg==
X-Forwarded-Encrypted: i=1; AFNElJ/A9HixmrlB7xty64PYXpEwqn5X0TM29Qa+LbxQT7kzOMXCRsfDTU6t7gK+EovdnYIw/VlWfDsEGltD+Ely@vger.kernel.org
X-Gm-Message-State: AOJu0Yzu67EDR6Ibqv73QmgmuSlbK/eEOWQfS7KFo0eikAw3wQXDXFNI
	sBmCc3vX6W+89r9mnd4DfDaXm2XELTAJE2OMYihi88hfc61ca8GQqC6Yl9KjY+q2WI2ll4GEXx6
	C4bc+IhomNOX5KyKXGTVbHNk916rkFgOe+6DsO7AfX9CNFLfvQ51k/rwkV6Y8+lSzgv25
X-Gm-Gg: Acq92OEZAC+cuBuGjr8sBTjYsCMqSYJboavP7cq9fphmYCZDDB2xTGFGI82GQed5zuQ
	ScUQ/5+3/2cQgIrzVz2QbZmEWOanMSvHGZX+SuLkL2lG7R67ns5yG6wSnNLMstBRZzK8TGNVIrB
	1Ny13elfai4Rxg79ga/CqF0S/3FBS5kn1FIZ0Dfo5jCQZ1VLgRvZieTjfC6QQAdEeBjHsmijUym
	Ba1gGmw7WAzLFC0bC3c1mGxvyf2d6ZatuUKGpm1exM/mDC7nQsXBU/MMfjlaB6WVvMObHBgbJ/5
	zX0KSuEm7UInhfjdGJAVOcWJdJUmT+67imLJwKxFyVZ7SIkLHeg30X6vpsvCzsHuJVaOP7d1POa
	ZdFPY9Bt8SN0mnWgm8VUKIAO2jup0cQNhwxe8evawsyuXegyorx8NHE7kIncpwb79oaD1ZQu4Q6
	SD7i7urXQipX1EzSVEOXlb44YexEXChVwWuPE=
X-Received: by 2002:a05:620a:1a1a:b0:915:1359:fc5f with SMTP id af79cd13be357-917f03a447dmr1996388785a.14.1781567777161;
        Mon, 15 Jun 2026 16:56:17 -0700 (PDT)
X-Received: by 2002:a05:620a:1a1a:b0:915:1359:fc5f with SMTP id af79cd13be357-917f03a447dmr1996385185a.14.1781567776692;
        Mon, 15 Jun 2026 16:56:16 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ad2e161f74sm3150225e87.7.2026.06.15.16.56.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 16:56:15 -0700 (PDT)
Date: Tue, 16 Jun 2026 02:56:13 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: github.com@herrie.org
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, sboyd@kernel.org,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] clk: qcom: gcc-msm8660: register CE2 H clock
Message-ID: <4g73mxbfc5s23hrmuoacmsqzigtminr3adangfld75l6557shd@w4p2csvkt6u6>
References: <20260602042747.277270-1-github.com@herrie.org>
 <20260602042747.277270-2-github.com@herrie.org>
 <b51b4d7e-fdea-4793-9007-c9e3ee922f70@oss.qualcomm.com>
 <267d1996c4f6b25518d30eeca129fda4@herrie.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <267d1996c4f6b25518d30eeca129fda4@herrie.org>
X-Authority-Analysis: v=2.4 cv=adxRWxot c=1 sm=1 tr=0 ts=6a309121 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=cTwmTnRGAAAA:8
 a=n78FrjUhffZnk7pW8FkA:9 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
 a=GUWCSGlMWfG-xDt5EnV5:22
X-Proofpoint-GUID: K4mMdxjMXiJZY9nwQUlKVDuLrKeL-vhg
X-Proofpoint-ORIG-GUID: K4mMdxjMXiJZY9nwQUlKVDuLrKeL-vhg
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDI1MyBTYWx0ZWRfX4HoWNmIg4xZB
 T1TjBhSWb9/n3pVg23A8puNGerzWZJ0/c6XNRDhMuwUTSvAvR7djJJbH819Wug9PqY5YT/UBO8k
 tKsZ2nhSo67Jvlrkui1f9dckeLJvOqQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDI1MyBTYWx0ZWRfXz4nSPNnVF5sB
 4SxN4P14Mau7sK/JNsQYDQfgmOybkwaiKOEgTatyVAUZoynlUMEn3DEVPW4v9AOgdCC4mtiwwzX
 Qs3nuBJhqhK2QQqAFP+HcPuHO+mhYz7YJLE1Vwv5crGv7/dH5sSK+Xs4ROZsUv3afGxam79TYjC
 RR/6CQU7xYlyQF337FdWsU1MvDdI/hTjWqHjbgzuOPPUpESpPh6zPNc+ZIiyp3Q1Dw+27rNoJOW
 cLSD8+2GUk2bmrq5dPqw0vVur7DdX7GmVmNnl5HZx7NHZ6LqOPJe1UqldXm3ULb3kO5zfn3oj/u
 PQ2KdHk3OMgr74k1TMEeUPflBbQFCKoBJsrt6MtezHyA1aMJ81U4aFCa4O1m3VfYk+6dIP0kw9d
 JqJrrmKEtz49v2Q5gdwzyY9eIPBcfPku13zzh7pzY84ParINuepeIGcGm4qx3Jof0YNMg/B+/uP
 ZypZh7Tq1W/fPOCG0Ag==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_05,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 impostorscore=0 lowpriorityscore=0
 malwarescore=0 suspectscore=0 spamscore=0 phishscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606150253
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
	TAGGED_FROM(0.00)[bounces-113271-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,herrie.org:email,qualcomm.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:from_mime];
	FORGED_RECIPIENTS(0.00)[m:github.com@herrie.org,m:konrad.dybcio@oss.qualcomm.com,m:sboyd@kernel.org,m:andersson@kernel.org,m:mturquette@baylibre.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2A3B268AAE2

On Mon, Jun 15, 2026 at 07:21:24PM +0200, me@herrie.org wrote:
> On 2026-06-15 18:36, Konrad Dybcio wrote:
> > On 6/2/26 6:27 AM, Herman van Hazendonk wrote:
> > > On MSM8x60 the Crypto Engine 2 (CE2) block at 0x18500000 is gated by
> > > a single hardware enable in GCC_CE2_HCLK_CTL (0x2740, BIT(4)). The
> > > existing dt-binding header already reserves CE2_H_CLK (ID 77) for
> > > this clock but the driver never registered an entry for it, so probe
> > > of any consumer that resolves the binding fails: the CE2 MMIO window
> > > reads back 0x0 and qce's DMA hangs indefinitely waiting for handshake
> > > signals that never arrive.
> > 
> > [...]
> > 
> > > +/*
> > > + * Crypto Engine 2 (CE2) clock.
> > > + *
> > > + * On MSM8x60 the CE2 block at 0x18500000 is gated by a single
> > > hardware
> > > + * enable in GCC_CE2_HCLK_CTL (0x2740, BIT(4)). The vendor MSM8660
> > > + * clock-8x60.c routes both the "core" and "iface" consumer-name
> > > lookups
> > > + * to this one register, and the upstream QCE crypto driver requests
> > > + * both clock names via devm_clk_get_optional_enabled(). Without the
> > > + * clock present at probe the QCE MMIO window reads back 0x0 and DMA
> > > + * hangs indefinitely waiting for handshake signals that never
> > > arrive.
> > > + *
> > > + * Register a single clk_branch: the consumer DT can reference the
> > > same
> > > + * clock phandle twice under different clock-names ("core" and
> > > "iface"),
> > > + * which yields the same struct clk for both clk_get() calls. Per-
> > > + * consumer refcounting then works correctly and the single
> > > underlying
> > > + * enable bit is asserted while either consumer holds the clock
> > > + * prepared, instead of having two independent clk_branch structs
> > > + * racing the same hardware bit.
> > > + */
> > 
> > I don't find this comment particularly valuable, given it ends up
> > describing the fact that the common clock framework has refcounted
> > enables (pretty widely known) and details how the DT is going to use
> > this (which we can read in the DT itself)
> > 
> > I think the commit message is really exhaustive and it's a better
> > place for this info anyway
> > 
> > Konrad
> Hi Konrad,
> 
> Happy to clean it up. MSM8x60 is poorly documented in public and whatever is
> available in downstream kernels is often incomplete, so I tried to document
> most in the various commits. Happy to put it in another place if that's more
> appropriate. A lot of the info was found by register poking and trial and
> error because the lack of documentation.

You can move it to the commit message. Another point would be to make
QCE driver request only one clock on this platform. Is there a point in
having two names for a single instance? (well, unless there is a good
reason in the driver).

> 
> Thanks,
> Herman

-- 
With best wishes
Dmitry

