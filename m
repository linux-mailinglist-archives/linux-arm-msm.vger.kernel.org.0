Return-Path: <linux-arm-msm+bounces-89808-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aO2pKP0jcGlRVwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-89808-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 01:55:25 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D7AF4EBEF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 01:55:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 76B11727472
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Jan 2026 10:53:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8D2F3BF2FA;
	Tue, 20 Jan 2026 10:53:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=machinesoul.in header.i=@machinesoul.in header.b="SXnUHz+0";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="0SK9V55E"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from fout-a5-smtp.messagingengine.com (fout-a5-smtp.messagingengine.com [103.168.172.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13352F507;
	Tue, 20 Jan 2026 10:53:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768906434; cv=none; b=o1KD8RaoP4s+gqxGExpY9S7z43DrPyRvepGzj4ePnodvDNavOWGDTGkGx7FQKveraUIyb+t5Qmye0KjUoCkBpZgQQh3jCJ6LdRgwgCUy/P2U5DX7FYo6QdE2Cbf5tqGoRQQEmOEqO/3t8+nW1Rja0+ygTR3imrGV+p1j8wwxifQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768906434; c=relaxed/simple;
	bh=PvYuqTp/zxnJTZa25yGtnsjIHXl1URwdBAeM8AzczX4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ahkIBUj7bWHnHP+LSDjY7dNiha4kCjh8hK2HEmUEt+krJE+T0bPs2Alx2clFtH9Y2amN2cp0EXEHlC1o9laSfFiuQUj8uRNZRjbd/ayH+YmizQ0xYrCgxzNvqaWDRXAnjmnorpXAr1uJ9O8LoFAyl+EbhykBrq5A+pmnMC08etA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=machinesoul.in; spf=pass smtp.mailfrom=machinesoul.in; dkim=pass (2048-bit key) header.d=machinesoul.in header.i=@machinesoul.in header.b=SXnUHz+0; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=0SK9V55E; arc=none smtp.client-ip=103.168.172.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=machinesoul.in
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=machinesoul.in
Received: from phl-compute-08.internal (phl-compute-08.internal [10.202.2.48])
	by mailfout.phl.internal (Postfix) with ESMTP id 35441EC00AA;
	Tue, 20 Jan 2026 05:53:51 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-08.internal (MEProxy); Tue, 20 Jan 2026 05:53:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=machinesoul.in;
	 h=cc:cc:content-transfer-encoding:content-type:content-type
	:date:date:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:subject:subject:to:to; s=fm2;
	 t=1768906431; x=1768992831; bh=qgTGHf8ClPccFRWlPfS+X4BvRns7/Og7
	S6s/d/ixkhY=; b=SXnUHz+0T31QiJEFnL9AjbRBW4wSAL4Dn8aeBN0UPG/tNMC8
	meQB3MWFSjn2Jtk8Ic0IaUxUwHWuu8Kp8nbcxfjHNFUqZWaziiNFhJRYPt8XX6R0
	Cy67NJNne6qc3YeMIywR1KnT0PdEM1xE3Hqg7YhnzbMldw7Qli+8l5xK7JQWt18V
	kGCVz1eVYds0KsdH8vxGdB8eG23T8erif6aDz0e/ca36SFBTtNyxcvtD0e2B/SuH
	HbjzkhK093DvKamTojymbhqLukxKqc+OrBrh3zFfeSh6M02l2Byq5V3UxkWDKxpp
	0c2BOr+MRg2kl2h13DL8T91k6yzaIE+TG2Uvdg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1768906431; x=
	1768992831; bh=qgTGHf8ClPccFRWlPfS+X4BvRns7/Og7S6s/d/ixkhY=; b=0
	SK9V55EHagBbtGe32nEWvO+zJrizFoarwweKoz/HZR2EaDC9NMfku+Mc+gRNmm8k
	kaA9L3FRGc8xD+Uat00VmeOyA05Izv5XtMXtvU1U40vPJuKccjxhHZsajK8uC78F
	h8BcPlGPJY+Uxr6xZDnXG4OR7nWQnl3FfQo4KK+T4KRau1ixlDGCpADewdpkyaen
	khv479+76X0RLEKZalrEl20duj6VQZ5xAonQIDL7qy69gdlPQYyFxMPJzUKkeBCr
	/SVG2NS2BJFilxwM2V2/9x4McFEYbYwnS+2NHYYUsUWZIpmFSPGnbO+P0VOFBdCi
	2PHV9JEq25qkVlTOgI6jg==
X-ME-Sender: <xms:vl5vafx8UJowe6X0TsF3R1eKVbKt41-MN--8OxgvEuUYVsWKwgbw0Q>
    <xme:vl5vaRq0FEyZOhVCnrmAXdv2wUNIQ5n9tJrjvHYRMTdoltxH68oDgXbT7r7He6ryO
    NGogXdNpbfOKXmhlgL6sW8mqybK_aOqQuD16NL3Kd0s7MJJJ5G0a5w>
X-ME-Received: <xmr:vl5vafeqXj_ML_IYUJ5N9gjjkYmfsdx7ugSotsnTHdbnyp9iklvQUP8MhhR9QLdFErk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddugedtvddvucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhephffvvefufffkjghfggfgtgesthfuredttddtjeenucfhrhhomhepuehhuhhshhgr
    nhcuufhhrghhuceosghhuhhshhgrnhdrshhhrghhsehmrggthhhinhgvshhouhhlrdhinh
    eqnecuggftrfgrthhtvghrnhepgeeftdeuheetjeevveehkeegledttdeikeejledvgfdu
    tddvteevkeehudduledvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrg
    hilhhfrhhomhepsghhuhhshhgrnhdrshhhrghhsehmrggthhhinhgvshhouhhlrdhinhdp
    nhgspghrtghpthhtohepudegpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopegrnh
    guvghrshhsohhnsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehkohhnrhgrugihsggt
    ihhosehkvghrnhgvlhdrohhrghdprhgtphhtthhopehrohgshheskhgvrhhnvghlrdhorh
    hgpdhrtghpthhtohepkhhriihkodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohep
    tghonhhorhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegtrhhoshdqqhgtoh
    hmqdguthhsqdifrghttghhvghrshestghhrhhomhhiuhhmrdhorhhgpdhrtghpthhtohep
    sghhrghrrggufigrjhdrrhgrjhhusehmrggthhhinhgvshhouhhlrdhinhdprhgtphhtth
    hopegrlhgvgigrnhgurhgvrdhfvghrrhhivghugiesohhrrghnghgvrdgtohhmpdhrtghp
    thhtoheplhhutggrrdifvghishhssehfrghirhhphhhonhgvrdgtohhm
X-ME-Proxy: <xmx:vl5vaUrZA_IyR7wk44KuMoYOAXibJmCRKudnFKbB9vX5MEfqH6BX2w>
    <xmx:vl5vaZkFP5Ey3Bp4i8rb2JQUY-cXACD5PwoR3gd7gjmYUYGU7E-3sw>
    <xmx:vl5vaVRLk4G_g1tCkaEhck1gh4QUeT8AqixjwxiXCQJecabDYePuPw>
    <xmx:vl5vafb6tytaSZYEOA282o6iJqsWix3gha5A-d_61nCKvucyBa1_Qg>
    <xmx:v15vaWbD-b1kgzJ4rRcC6bFgSmbDNsHS-mr5QJLEBXZJBsF8ZBupfsSj>
Feedback-ID: i6b0e4831:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 20 Jan 2026 05:53:46 -0500 (EST)
From: Bhushan Shah <bhushan.shah@machinesoul.in>
To: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 cros-qcom-dts-watchers@chromium.org,
 Bharadwaj Raju <bharadwaj.raju@machinesoul.in>,
 Alexandre Ferrieux <alexandre.ferrieux@orange.com>,
 Luca Weiss <luca.weiss@fairphone.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH] arm64: dts: qcom: kodiak: Add missing clock votes for lpass_tlmm
Date: Tue, 20 Jan 2026 16:23:09 +0530
Message-ID: <5976946.DvuYhMxLoT@antlia>
In-Reply-To: <6749502.DvuYhMxLoT@antlia>
References:
 <20260109-kodiak-lpass-tlmm-clocks-v1-1-746112687772@fairphone.com>
 <6749502.DvuYhMxLoT@antlia>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
X-Spamd-Result: default: False [1.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	CTE_CASE(0.50)[];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[machinesoul.in:s=fm2,messagingengine.com:s=fm2];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-89808-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_NA(0.00)[machinesoul.in];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[machinesoul.in:+,messagingengine.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bhushan.shah@machinesoul.in,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:7979, ipnet:2605:f480::/32, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[dfw.mirrors.kernel.org:rdns,dfw.mirrors.kernel.org:helo,messagingengine.com:dkim,fairphone.com:email,machinesoul.in:email,machinesoul.in:dkim]
X-Rspamd-Queue-Id: 8D7AF4EBEF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Friday, 9 January 2026 21:08:32 IST Bhushan Shah wrote:
> On Friday, 9 January 2026 20:44:34 IST Luca Weiss wrote:
> > Without the correct clock votes set, we may be hitting a synchronous
> > external abort error when touching the lpi registers.
> > 
> >   Internal error: synchronous external abort: 0000000096000010 [#1]  SMP
> >   <...>
> >   
> >   Call trace:
> >    lpi_gpio_read.isra.0+0x2c/0x58 (P)
> >    pinmux_enable_setting+0x218/0x300
> >    pinctrl_commit_state+0xb0/0x280
> >    pinctrl_select_state+0x28/0x48
> >    pinctrl_bind_pins+0x1f4/0x2a0
> >    really_probe+0x64/0x3a8
> > 
> > Add the clocks to fix that.
> > 
> > Platforms with this SoC using AudioReach won't be impacted due to
> > qcs6490-audioreach.dtsi already setting clocks & clock-names for
> > q6prmcc. The sc7280-chrome-common.dtsi has also been adjusted to keep
> > the behavior the same as they also do not use Elite with q6afecc.
> > 
> > Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> 
> Tested-by: Bhushan Shah <bhushan.shah@machinesoul.in> # On fairphone-fp5

As a follow-up;

While this fixes original abort, it seems on some coldboots or as such(?); it fails
to vote the clocks and then eventually soundcard fails to probe, so there is still
some issue that needs to be solved.

[   17.944296] Bluetooth: hci0: Frame reassembly failed (-84)
[   20.961100] qcom-q6afe aprsvc:service:4:4: AFE failed to vote (3)
[   20.961131] Failed to prepare clk 'core': -110                                                                                           
[   20.961137] qcom-sc7280-lpass-lpi-pinctrl 33c0000.pinctrl: error -ETIMEDOUT: Can't enable clocks
[   20.961144] qcom-sc7280-lpass-lpi-pinctrl 33c0000.pinctrl: probe with driver qcom-sc7280-lpass-lpi-pinctrl failed with error -110

So far I was not able to find a precise pattern to this, but doing bunch of coldboots
is most easiest way to reproduce I have found.

If anyone has any inputs on this, I would love to hear.

Best Regards,
Bhushan



