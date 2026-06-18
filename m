Return-Path: <linux-arm-msm+bounces-113686-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id hxL6Gk1ZM2q2/gUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113686-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jun 2026 04:34:53 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C402169D23F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jun 2026 04:34:52 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=EV5vcgoY;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="X/ODIsBa";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113686-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113686-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CC7A6304B569
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jun 2026 02:34:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3430A2FE59C;
	Thu, 18 Jun 2026 02:34:51 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8C772F3C13
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2026 02:34:49 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781750091; cv=none; b=XRySN4dg08PS8wMWBvjHVOB6WoiVmdIpWAh0LxjGQbca6g0U40azQ+RmwtreL1EGZc26BfLl2pEj17LwOtM+Kcgu8pvGAqsoAnaQGpj0VPOeEnX3p2iz6Tx+aqyyNZBRGWPiWlVww865sTSEYpUJg9U8XyvlmvOxO+FXaSK7XE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781750091; c=relaxed/simple;
	bh=CfuK7Yai7UVyLm8X0nYd0q5AiDAwYNu1UR8Y6QvJZ7k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FlHSOVvPQ/z1e7aK5uQwnSDtey8SkZcPqqnmOJ0OQQcmLA7UTuYogt/+H1YAud9qVmiIyTnRN/AznhOb5lK3BfKVE/c34C8go9cHU9M4El5/fm/9W/g5+uwKh3YiGBhJ/G2ho/nE2hMIAOqqgstwx0/2ANL5PwMiwtGQTPVUNp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EV5vcgoY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=X/ODIsBa; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65HJbRsU3515504
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2026 02:34:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=5b9KVnuPgA23rMKIBEpEA5dr
	XdebUDUhX9JkClEFb6Y=; b=EV5vcgoYtPlTS6h7mn5fpSXgCPtCnfgVWVGm0v7+
	mVRqXXTkCE2UUE0EoqUVq3ay8rtWJQsQpk5JrvBBCajwz3icu2LXcZy81aux9Nej
	W1LdCReisa2Nq9ozaDr8kaHyv627nD6mxb1RsB73Kx0BoQihnwh4qVGlVgOCePAy
	Ia164FmhqzmjGJoR+ecFFOYR+9vtNcg0yWHiV5mQ4vGGhlLTldKg/qz6tYv/3ZGJ
	O1rl+f839kg2q2UofaqnQJj0+BnQJS9K2sPs3RZm+INQSDi+sOSQUJwEQgC7Zpya
	kTCubDuMtArFf1Ucu8hdxh1rHHGCLsXNtt72fr1Kr70VJA==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ev1wc17wa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2026 02:34:48 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-304b8d0ee63so1179066eec.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 19:34:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781750088; x=1782354888; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5b9KVnuPgA23rMKIBEpEA5drXdebUDUhX9JkClEFb6Y=;
        b=X/ODIsBas8YA6F0yI+L464nnUSewR+49Y+9wgQaTOJsTIMFxfqA7Sb/0bLN0fkN6Un
         sBfqPY4Hw3HcQ+kmRRjD8UeqVRakXXUHslcmBSD34WwA6ltuTvK8G9uOZGi4tlF+ZjiY
         5vU9Vh5/RauKfnAfNhH2RdAJMQhziVJoX9K/SndYaUjnpqzAehilFuzTJ0RbsN8ubGDu
         t0GX49maqIH/qtlBEenmrMwQvd72HjBwGODwnjI8X0CVaXQWQ0wH6qTRDownTnmm0xa0
         CHzwgCbqEfK3a8yp02f0xAZ5/HLmMia8c8M20gHBfwnND0R0lw/dlfRxltb3fmqDGPiU
         C4+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781750088; x=1782354888;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5b9KVnuPgA23rMKIBEpEA5drXdebUDUhX9JkClEFb6Y=;
        b=FF/HVhgSN9bBzhyWXGbqcirM5fP1q8awODK+uBiir8Ab0WzwomN7CV4CLa7QSuwkKO
         Kai02N7nGUb+c1r5CPdT0Ch2CTEp8zkTf3OxLe4NCfUj3lq0aD4zOEU/vWx+vThXc87X
         hKF4tzflO+jVjq+Ye70csCm58DPwT9UvlAefSs8wtvQQMBEjMb1zH+7kx+jIY1Ke8Pl6
         qpIu5+m7fZDRrsBeBq9YzB+KYMdVl+QJVGKvGzQYF+3obLhFHCGlqBijKsB+o0zX4zNI
         CooA0o3igt6tQGLtQjKAer2J8+HDbR7Fih0UIImm7lj1rzpM+XeSLkXuA/KWvsflFfD0
         QwKQ==
X-Forwarded-Encrypted: i=1; AFNElJ9USZsFSNh/Q6/xh+GSp3L3P3MaPnAeALLnfIyd6NCm2PNDEPU7Y8tAayLOZhpzZecqLjzQMV3yn9iAvqd+@vger.kernel.org
X-Gm-Message-State: AOJu0YwDwo/VIDrKbpuoYYyrOK2xi7ewl3CEFf6ZE5P9L+Io67QiqZlM
	pOJfeoVan8r60AIu9fxNNifg+UHxLUqGZ0ooLVypnu7kjgKq2v1br37DrkbAlYAkwnK5/V32bEr
	u/9e1wLstLTSD5fg8oKvAg+2OfqV/m9NN2gzHaAL2PefYb3sT3zS8JnCvsKW8mDmwZenEiO/Y+N
	W7
X-Gm-Gg: AfdE7ck7FS6An+JyUsp5DeMULO+Fwj+A9k5DaT8LlbzHNijiK1yTCeLCf3vSsPeenWH
	B3nabUEWDXEvIbrYxRnx2VL50M+2I73Ctpx/VX50744T/V7J1Yw59I5bhAtEJKUa312ip4qqh5L
	VK0z84clrPIDD2QoT2lFUycphKJ8Sp61xo8NtqXD2GPnOCHLmcAkMYre151qM5XX2x7Ww+dzRms
	LIkhXkAEcEb0EgHxXvfNTe0oh2W98NT5wqzhTmpf6aFF12m5wZLlH1wjtbbC/3jGd0ADZj6a1Gg
	Z1bjJHup09ZoGMQo7jdMLf0lzWOSHZFT0W3VORwIR5WsfGX1j99gSpwaN0ietZWPiyQ8QKSsOiW
	g9ECWrhZLIUNc24HoI/jwTgcQ/M69E/YhS3ms9G4RlbrDlhcvRcZ+OQmhSg==
X-Received: by 2002:a05:7301:3809:b0:304:de94:1c55 with SMTP id 5a478bee46e88-30bf09f6196mr1183241eec.35.1781750087735;
        Wed, 17 Jun 2026 19:34:47 -0700 (PDT)
X-Received: by 2002:a05:7301:3809:b0:304:de94:1c55 with SMTP id 5a478bee46e88-30bf09f6196mr1183189eec.35.1781750087151;
        Wed, 17 Jun 2026 19:34:47 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30bd8ab412fsm4091630eec.31.2026.06.17.19.34.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 19:34:46 -0700 (PDT)
Date: Wed, 17 Jun 2026 19:34:44 -0700
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, krishna.chundru@oss.qualcomm.com
Subject: Re: [PATCH v4 7/7] arm64: dts: qcom: mahua: Switch pcie5_phy ref
 clock to RPMH_CXO_CLK
Message-ID: <ajNZRKln79gY5fS1@hu-qianyu-lv.qualcomm.com>
References: <20260527-tcsr_qref_0527-v4-0-ded83866c9d9@oss.qualcomm.com>
 <20260527-tcsr_qref_0527-v4-7-ded83866c9d9@oss.qualcomm.com>
 <db074223-ac01-4ffe-ae82-187ef0cb2cbb@oss.qualcomm.com>
 <ai+9CYntPuyEEcLX@hu-qianyu-lv.qualcomm.com>
 <a956a733-7bb0-46f3-bf21-142d5cb8fc3e@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a956a733-7bb0-46f3-bf21-142d5cb8fc3e@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=TMt1jVla c=1 sm=1 tr=0 ts=6a335948 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=g0m48HacwZqLR8_YHKYA:9 a=CjuIK1q_8ugA:10 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-GUID: ccV9oQrV7cezMkNTbYh2RZZgzGnqfqVc
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE4MDAyMSBTYWx0ZWRfX+sItRfMIE6ig
 uVRIfjSxf615pRScYW4+xMw/ZwsO9Zudh4T1B6cgxGIFYFdt3kSIVZ300Gd5zr2IvmdwOkVrct0
 RyQR3eUw64rJ3KM0K7is7JRlUhbUklQ=
X-Proofpoint-ORIG-GUID: ccV9oQrV7cezMkNTbYh2RZZgzGnqfqVc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE4MDAyMSBTYWx0ZWRfX/2MUqyiFil0r
 S0mD7ZyamHSz3qObh4SC/lM6hC5m79bozVltHot1cuPAmZ567PLU83XgBPllfugYatsym73s5tZ
 3u89TggKaGXTus+CrESDAUw1Yw9SwyKNECjVduY0N3ZmzgCjV/3ZDpECixRW47G6VmsbFUs729H
 46w2WT/VsjH44y83LGW0A5OfsWt6GTfcf8B+QgFuX/xj3X+WlWbr9brInCxiOMDyqhx216PWaGW
 CQHBxfImZBCOlnBtg55ssV9EFzO/1idU86vxHSRE1Dhqy+uh9ueJLMox+GMRoCAHlrUl+ieLbH9
 5XAV3YQu0b4YxnpYHGPb5KZk1YtnqcUTlXqebl37POGmuEOVBHkj4DjpkURUSvfzIZiZJn7t7t0
 fUXKqbwLBeHuvngVEAKjyygMjPf2fgqtwgv8vnhoOhu/1NaQetAWfsI+QcVOfomk2dUPRo/ofAf
 /KY/Vj0kA4C0gmQtoJA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-17_02,2026-06-17_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 adultscore=0 impostorscore=0 priorityscore=1501
 suspectscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606180021
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-113686-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:dkim,oss.qualcomm.com:dkim,oss.qualcomm.com:from_mime,hu-qianyu-lv.qualcomm.com:mid];
	FORGED_SENDER(0.00)[qiang.yu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:taniya.das@oss.qualcomm.com,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krishna.chundru@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[qiang.yu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C402169D23F

On Wed, Jun 17, 2026 at 02:11:33PM +0200, Konrad Dybcio wrote:
> On 6/15/26 10:51 AM, Qiang Yu wrote:
> > On Tue, Jun 09, 2026 at 03:06:02PM +0200, Konrad Dybcio wrote:
> >> On 5/28/26 4:29 AM, Qiang Yu wrote:
> >>> PCIe5 PHY on Mahua gets refclk from CXO0 pad directly, so no QREF
> >>> clkref_en voting is required. Override the clock list to use RPMH_CXO_CLK
> >>> directly instead.
> >>
> >> This is the last piece of the puzzle that this series is missing.
> >> There's no QREF clkref_en, but there is a refgen that needs to be
> >> powered. For PCIe5 on Mahua this would be L2F_E0 (0p9) and L4H_E0
> >> (1p2).
> >>
> >> I think the easiest (laziest?) solution would be to add dummy clocks
> >> in the clkref driver and only toggle the required regulators. Another
> >> option is to defer back to individual drivers (such as PCIe QMPPHY).
> >>
> >> I kinda like the "one central node to drive power" approach, but I'm
> >> not sure others agree, since it stretches truth just a tiny bit
> >> (although not as much as one would think since there are *some*
> >> controls for the transparent-to-the-OS hw pieces in these paths still
> >> in TCSR).. Dmitry, Krzysztof, would you object to that?
> >>
> > 
> > PCIe5 PHY on Mahua does not use QREF at all, so there is no refgen for
> > QREF either. The refgen supplies you mentioned are for the PCIe5 PHY
> > itself, not for QREF. For other PHYs that do use QREF, there are two
> > refgens: one for QREF (voted here in the TCSR clkref driver) and one for
> > the PHY (which should be voted in the PHY driver).
> 
> Okay, so in this case we have the refgen regulator hardwired into the
> PHY block and we just consume it from the PHY node&driver, am I following
> correctly?
>

The refgen regulators are not hardwired into the QREF or PHY blocks
directly. They power the REFGEN block, which provides the reference
voltage to QREF and PHY.

- Qiang Yu


