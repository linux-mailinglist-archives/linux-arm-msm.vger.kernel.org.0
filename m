Return-Path: <linux-arm-msm+bounces-114111-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id mLehBZVCOmrD4wcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114111-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 10:23:49 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A8EC16B53FE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 10:23:48 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=samsung.com header.s=mail20170921 header.b=Ta09Kgpr;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114111-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114111-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=samsung.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BF5B0309C4D7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 08:20:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44F4C3CCFC2;
	Tue, 23 Jun 2026 08:20:13 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 619293CBE7A
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 08:20:10 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782202813; cv=none; b=nfXf4QLO1edLiZCZq8QBecV/85YcYpYblwVgsGVEFdbO7CieqSRKOIB7LjslhfevxVyBKjcFUUnmYwBR+WKvTjFgAWsr3mwlMFoJZ+3YQXYIqeyAU2gqp1brCMnOgKQeE08l0mjtpwJZNWaPhPpxhbhPs+1qkaxIMpijhuGn7NE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782202813; c=relaxed/simple;
	bh=58iLx84JGmUa71MP9XBPaAnSf2s8MxXrgG0rp1kq590=;
	h=From:To:In-Reply-To:Subject:Date:Message-ID:MIME-Version:
	 Content-Type:References; b=sI3kpUJhyZEyK8108B7aK6+H7pCLSEok78SpXuJqK8/xAFXZ6fprUDxv2hANlgwulsmM8h5FyNGRViZnHfAZE89XfYdl8bF62fIyFcXu05lpJBI5T1Yqdij5YBCZgimD0SmXe5VblC1IyxRpBvbdFyzw9HTjyXz2iq5PwdZWU/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=Ta09Kgpr; arc=none smtp.client-ip=203.254.224.24
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20260623082003epoutp01be7ba313d380415085f345818603c97c~7qAHOHyUS0250802508epoutp01K
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 08:20:03 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20260623082003epoutp01be7ba313d380415085f345818603c97c~7qAHOHyUS0250802508epoutp01K
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1782202803;
	bh=dZ4TskOON2YvURQFFWmRY4P5Y9n+8Cd9tCS6xs+1hiA=;
	h=From:To:In-Reply-To:Subject:Date:References:From;
	b=Ta09KgprExBRin2bxzqP9FI1SMCkP693d3x8isKsKLVoiUIFml0FLxgUiA63VVrZl
	 rEmtY8m4Xh8YWVcy7SHWRKD7EhTWdDjQRk9X1vUIlC4LO9w4Hi1bl9Yle/xjH/O24f
	 8/TFamVAMvAzBR0YFs9cF97zi46BzrhiGMcGzqMU=
Received: from epsnrtp04.localdomain (unknown [182.195.42.156]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPS id
	20260623082002epcas5p2fe50239167a06f3f585cddc884be7fa9~7qAGuN5CW3001130011epcas5p2C;
	Tue, 23 Jun 2026 08:20:02 +0000 (GMT)
Received: from epcpadp1new (unknown [182.195.40.141]) by
	epsnrtp04.localdomain (Postfix) with ESMTP id 4gkyfp4tcFz6B9m5; Tue, 23 Jun
	2026 08:20:02 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
	20260623060044epcas5p17e4090ee1c1c62fe06e58db8d88a97f1~7oGe2XMKK2254522545epcas5p1J;
	Tue, 23 Jun 2026 06:00:44 +0000 (GMT)
Received: from INBRO002756 (unknown [107.122.3.168]) by epsmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20260623060041epsmtip1414f32065dfa22c1ef1804df9ea3cc7f~7oGbkWuZY1819318193epsmtip1B;
	Tue, 23 Jun 2026 06:00:41 +0000 (GMT)
From: "Alim Akhtar" <alim.akhtar@samsung.com>
To: "'Krzysztof Kozlowski'" <krzysztof.kozlowski@oss.qualcomm.com>, "'Bjorn
 Andersson'" <andersson@kernel.org>, "'Michael Turquette'"
	<mturquette@baylibre.com>, "'Stephen Boyd'" <sboyd@kernel.org>, "'Brian
 Masney'" <bmasney@redhat.com>, "'Rob Herring'" <robh@kernel.org>,
	"'Krzysztof Kozlowski'" <krzk+dt@kernel.org>, "'Conor Dooley'"
	<conor+dt@kernel.org>, "'Sylwester Nawrocki'" <s.nawrocki@samsung.com>,
	"'Chanwoo Choi'" <cw00.choi@samsung.com>, "'Peter	Griffin'"
	<peter.griffin@linaro.org>, "'Barnabas Czeman'"
	<barnabas.czeman@mainlining.org>, "'Tomasz Figa'" <tomasz.figa@gmail.com>,
	<linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-samsung-soc@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<cpgs@samsung.com>
In-Reply-To: <20260623055626.23814-2-krzysztof.kozlowski@oss.qualcomm.com>
Subject: RE: [PATCH] dt-bindings: clock: Replace bouncing emails
Date: Tue, 23 Jun 2026 11:30:39 +0530
Message-ID: <1212772528.01782202802678.JavaMail.epsvc@epcpadp1new>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQLjF+4RorsKFMyV2SdeBPjDChM9owMQIOWktCb6JMA=
Content-Language: en-us
X-CMS-MailID: 20260623060044epcas5p17e4090ee1c1c62fe06e58db8d88a97f1
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
X-CPGSPASS: Y
X-Hop-Count: 3
X-CMS-RootMailID: 20260623055640epcas5p35fd0bc8b355d23ca802ceba85046b836
References: <CGME20260623055640epcas5p35fd0bc8b355d23ca802ceba85046b836@epcas5p3.samsung.com>
	<20260623055626.23814-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[samsung.com:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[samsung.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[samsung.com:s=mail20170921];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:krzysztof.kozlowski@oss.qualcomm.com,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:s.nawrocki@samsung.com,m:cw00.choi@samsung.com,m:peter.griffin@linaro.org,m:barnabas.czeman@mainlining.org,m:tomasz.figa@gmail.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-samsung-soc@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:cpgs@samsung.com,m:krzk@kernel.org,m:conor@kernel.org,m:tomaszfiga@gmail.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	FORGED_SENDER(0.00)[alim.akhtar@samsung.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[20];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,baylibre.com,redhat.com,samsung.com,linaro.org,mainlining.org,gmail.com,vger.kernel.org,lists.infradead.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-114111-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[samsung.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alim.akhtar@samsung.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A8EC16B53FE



> -----Original Message-----
> From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Sent: Tuesday, June 23, 2026 11:26 AM
> To: Bjorn Andersson <andersson@kernel.org>; Michael Turquette
> <mturquette@baylibre.com>; Stephen Boyd <sboyd@kernel.org>; Brian
> Masney <bmasney@redhat.com>; Rob Herring <robh@kernel.org>;
> Krzysztof Kozlowski <krzk+dt@kernel.org>; Conor Dooley
> <conor+dt@kernel.org>; Sylwester Nawrocki <s.nawrocki@samsung.com>;
> Chanwoo Choi <cw00.choi@samsung.com>; Peter Griffin
> <peter.griffin@linaro.org>; Alim Akhtar <alim.akhtar@samsung.com>;
> Barnabas Czeman <barnabas.czeman@mainlining.org>; Tomasz Figa
> <tomasz.figa@gmail.com>; linux-arm-msm@vger.kernel.org; linux-
> clk@vger.kernel.org; devicetree@vger.kernel.org; linux-
> kernel@vger.kernel.org; linux-samsung-soc@vger.kernel.org; linux-arm-
> kernel@lists.infradead.org
> Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Subject: [PATCH] dt-bindings: clock: Replace bouncing emails
> 
> Replace permanently bouncing email addresses (550 5.1.1 Recipient address
> rejected) of Adam Skladowski, Sireesh Kodali and Chanho Park.  There are
no
> new messages from them via other email addresses, so drop them
> permanently.  Add Alim Akhtar to Samsung ExynosAutov9 SoC clocks,
> because he looks at other Samsung clock hardware and drivers.
> 
> Signed-off-by: Krzysztof Kozlowski
> <krzysztof.kozlowski@oss.qualcomm.com>
> 
Acked-by: Alim Akhtar <alim.akhtar@samsung.com>



