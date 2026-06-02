Return-Path: <linux-arm-msm+bounces-110712-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MJtAF7NqHmqojAkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110712-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 02 Jun 2026 07:31:31 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 201C062893E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 02 Jun 2026 07:31:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7F8BF305F56F
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Jun 2026 05:28:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 844272EB87F;
	Tue,  2 Jun 2026 05:28:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=herrie.org header.i=@herrie.org header.b="cE9x7GUu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from outbound8.mail.transip.nl (outbound8.mail.transip.nl [136.144.136.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCC9122156C;
	Tue,  2 Jun 2026 05:28:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=136.144.136.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780378114; cv=none; b=mZOsmNm1SsnZnh9gKbPbCgw0EbbwzNlpndxJRreStSAQFhesHbIc2hAtF8PWX9Vf3qU0CgsRCvYtRuyJPy57QIg5pzxkzkSVkVKZ/VopKSocyi6BRNLFnakvvO03d6lCecuHjo6cxy+q97rMZ0SZQhyO5T8G9J8pnd1/TwLuzFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780378114; c=relaxed/simple;
	bh=ZJlCPiOCKyk+XfRK590W7ZXZrI06mSN30JJY28kCl3k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DUqC6qF8TeisVef8nuLAeAGrcMASewklesk66ODibQ08qfMV1TOt3Oz02qUQtvMOsInj1ZnXsDtYBfAcsAECI997rbPp/Kfu67Llk0GbpOpc61uueablXf3rK+1m8JGWUq42qCbcFPPoD/iugDRUxppef2SROnVNQmhlGSyQrvY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=herrie.org; spf=pass smtp.mailfrom=herrie.org; dkim=pass (2048-bit key) header.d=herrie.org header.i=@herrie.org header.b=cE9x7GUu; arc=none smtp.client-ip=136.144.136.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=herrie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=herrie.org
Received: from submission5.mail.transip.nl (unknown [10.103.8.156])
	by outbound8.mail.transip.nl (Postfix) with ESMTP id 4gTzrS6d38zY76KF;
	Tue,  2 Jun 2026 07:28:24 +0200 (CEST)
Received: from herrie-desktop.. (180-93-184-31.ftth.glasoperator.nl [31.184.93.180])
	by submission5.mail.transip.nl (Postfix) with ESMTPA id 4gTzrR4BWrz2pRDjL;
	Tue,  2 Jun 2026 07:28:23 +0200 (CEST)
From: Herman van Hazendonk <github.com@herrie.org>
To: sboyd@kernel.org
Cc: Bjorn Andersson <andersson@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Herman van Hazendonk <github.com@herrie.org>
Subject: Re: [PATCH 3/3] clk: qcom: add MSM8x60 MMCC driver
Date: Tue,  2 Jun 2026 07:28:23 +0200
Message-ID: <20260602052823.444262-1-github.com@herrie.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260602043623.285901-4-github.com@herrie.org>
References: <20260602043623.285901-4-github.com@herrie.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: ClueGetter at submission5.mail.transip.nl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=transip-a; d=herrie.org; t=1780378103; h=from:subject:to:cc:
 references:in-reply-to:date:mime-version;
 bh=87rnEHMd/uLYzgepf4vNP3TGJSp9mihLKhCGfxTLAhs=;
 b=cE9x7GUuUIxJRSBJnF4Z5a3EQnddwFa11TYd9xx4wyKoke+uUtJc7p6NomgQg1/8m5ZAuM
 trQxfGWe4EHmal1t1M8qEJvkVJPWmnFAzMlwgZ0SZcv5sQ8JCOfRbTXcEOqgquRvW8P66K
 D5BWInys4HqmpvuRiqLyTm8GEyilxutxcXQp8FSgB98qrxfa4D7YlETd/ZMAHlXt271DHL
 U03q7JcMUZLKntKjquv7Zxs9m1Tti9khqF1eNaOH00/HH20JEysTvKvdInCFnpaDRvoxEB
 Qm7oKnAjfwew5QNFBts6gJorqsBB9ZWPwqbw0UWtUxT/emqK1+6mNP4nw6z6HQ==
X-Report-Abuse-To: abuse@transip.nl
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[herrie.org:s=transip-a];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-110712-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_NA(0.00)[herrie.org];
	DKIM_TRACE(0.00)[herrie.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[github.com@herrie.org,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-0.994];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,herrie.org:mid,herrie.org:dkim]
X-Rspamd-Queue-Id: 201C062893E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi,

Confirmed -- thanks for catching this. mmcc_msm8660_resets[] jumps
straight from FABRIC_AHB_RESET (29) to GFX3D_AHB_RESET (32). Array
indices 30 (GFX2D0_AHB_RESET) and 31 (GFX2D1_AHB_RESET) were
implicitly zero-initialised, so when gfx2d0_gdsc / gfx2d1_gdsc
power-cycle the GDSC the qcom_reset_set_assert() path does a RMW
on { .reg = 0, .bit = 0 } -- toggling bit 0 of register 0x0000
(MMSS PLL0 mode register) on every transition. Genuine silent
clock-controller corruption, not just a missing reset toggle.

v2 will add:

    [GFX2D0_AHB_RESET] = { 0x020c, 12 },
    [GFX2D1_AHB_RESET] = { 0x020c, 11 },

between the FABRIC_AHB_RESET and GFX3D_AHB_RESET entries. Bit
positions match the sibling mmcc-msm8960.c driver -- same hardware
IP, same MMSS_AHB_RESET register layout.

Fix is in my local tree and on-device validated; will land in v2
alongside the unhalt_fabric_ports() -EPROBE_DEFER fix and the
cover-letter dependency on the gdsc framework series:

    https://lore.kernel.org/linux-clk/20260602050840.435933-1-github.com@herrie.org/

On the "MSSS vs MMSS" naming nit: agreed it should be MMSS_, but
that one I'll leave for a separate cleanup so v2 doesn't churn DT
ABI alongside the functional fixes.

Thanks,
Herman

