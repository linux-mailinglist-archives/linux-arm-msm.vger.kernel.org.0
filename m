Return-Path: <linux-arm-msm+bounces-95998-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MCKYJL3FrGnTuAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95998-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 08 Mar 2026 01:41:33 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 40E0A22E280
	for <lists+linux-arm-msm@lfdr.de>; Sun, 08 Mar 2026 01:41:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 96EB330151E7
	for <lists+linux-arm-msm@lfdr.de>; Sun,  8 Mar 2026 00:41:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 047591F9F7A;
	Sun,  8 Mar 2026 00:41:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="dM3Jz+JD";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="0sCl8Jxa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B6A522156C;
	Sun,  8 Mar 2026 00:41:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772930485; cv=none; b=SGgKOjOoMWPjmwXs7RKK3m5ixSHj2GVbxFp/i+qPYkoSy7hQeSJpA8ycO6CwoAnPk/tghcJ/HzGCJajtB3VCLFPlMEku6mIfn5McmyrJNSshgF7HoTx5PxpIz40Rq19OKAjR7RGimYT/1YrULFvOg8x9QBG7lVZ//6v18BM09Gk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772930485; c=relaxed/simple;
	bh=oVcpzTisvwej6iDOvDUInCzt+wgu039t2k2D5LNdZg8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=UliLl1k493J5aLCTMCcbmmAuh1V4HangP3FO352aea12rJJhBD+eJIgS/wZDlxkqzwwOF2oP6gtFv8fyesahnsCQywNaZrt2PvMNKJFHb1BCuO/s6SJUgE1MxE2CdcQeA1ngKyN60OTdR90BLQTC5xeOrK+ZT7AD4Ivy1YoPYU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=dM3Jz+JD; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=0sCl8Jxa; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Date:Subject:From; t=1772930384; bh=QEko2f/N9gpotJkT0L/BA/+
	3Gn3caNbdYzS1ydcIDhE=; b=dM3Jz+JDAwY3SZ40YRhouMzSK2ekDuD8F233xz+17CIqNTdANy
	+9KfOE/G++/tN08O86bhkpGqmomQpRnso9+OnX/O4ecegtIC0HDyD18ZYMrhMpEKjq7EH+kZgoN
	IzmrkzVDI+twryk0t6ZIjj4OjHD5akfA4ScJj8RYB8UVNTjRdmjBEZJXbWa9t3paLADCXrvGBPt
	9f0lP9+7+85OiyyelOUlk3ilep//mgzx2sQeE70GsNaZMiBMJYOUPJK4ZrzzYD1GhEI2lJe5fZm
	f4RxVh+MmbJ7VktF3dwVgYBpSgkEenFqvJB3wtgGM5Gzr8h6cgOzmjh5wUmtZZEOWMA==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Date:Subject:From; t=1772930384; bh=QEko2f/N9gpotJkT0L/BA/+
	3Gn3caNbdYzS1ydcIDhE=; b=0sCl8Jxaos4PIF7hi1fuZXEuf/4FN18+bH8ZXIRZTHRVCgT8nZ
	lg35QXJLHlxpTJoywHJlhzTi5huYoaqMXDDg==;
From: Aelin Reidel <aelin@mainlining.org>
Subject: [PATCH 0/4] clk: qcom: Add support for basic clock providers on
 Fillmore SoC
Date: Sun, 08 Mar 2026 01:39:26 +0100
Message-Id: <20260308-fillmore-clks-v1-0-976d9a6bebe7@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDYwND3bTMnJzc/KJU3eSc7GJdS1MDyyRTC4tUc8M0JaCegqLUtMwKsHn
 RsbW1AGRXRmBfAAAA
X-Change-ID: 20260301-fillmore-clks-9509b588e71f
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux@mainlining.org, phone-devel@vger.kernel.org, 
 ~postmarketos/upstreaming@lists.sr.ht, Aelin Reidel <aelin@mainlining.org>
X-Mailer: b4 0.14.2
X-Rspamd-Queue-Id: 40E0A22E280
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[mainlining.org,reject];
	R_DKIM_ALLOW(-0.20)[mainlining.org:s=202507r,mainlining.org:s=202507e];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-95998-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[aelin@mainlining.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[mainlining.org:+];
	NEURAL_HAM(-0.00)[-0.976];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,mainlining.org:dkim,mainlining.org:email,mainlining.org:mid]
X-Rspamd-Action: no action

This series adds the bare minimum clock provider (gcc and rpmh) driver
support for the Fillmore SoC (e.g. SM7450).

With this, it is possible to boot to the rootfs from the UFS storage and
have functioning USB.

The multimedia-specific clock providers will be sent in a follow-up
series.

This patch series was tested on a Xiaomi 13 Lite / Civi 2 (xiaomi-ziyi).

Signed-off-by: Aelin Reidel <aelin@mainlining.org>
---
Aelin Reidel (4):
      dt-bindings: clock: qcom: document the Fillmore Global Clock Controller
      dt-bindings: clock: qcom: Document the Fillmore RPMH Clock Controller
      clk: qcom: Add Global Clock controller (GCC) driver for Fillmore
      clk: qcom: rpmh: Add support for Fillmore rpmh clocks

 .../bindings/clock/qcom,fillmore-gcc.yaml          |   60 +
 .../devicetree/bindings/clock/qcom,rpmhcc.yaml     |    1 +
 drivers/clk/qcom/Kconfig                           |    9 +
 drivers/clk/qcom/Makefile                          |    1 +
 drivers/clk/qcom/clk-rpmh.c                        |   22 +
 drivers/clk/qcom/gcc-fillmore.c                    | 2714 ++++++++++++++++++++
 include/dt-bindings/clock/qcom,fillmore-gcc.h      |  195 ++
 7 files changed, 3002 insertions(+)
---
base-commit: a0ae2a256046c0c5d3778d1a194ff2e171f16e5f
change-id: 20260301-fillmore-clks-9509b588e71f

Best regards,
-- 
Aelin Reidel <aelin@mainlining.org>


