Return-Path: <linux-arm-msm+bounces-110729-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yIHLF7eDHmqhkQkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110729-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 02 Jun 2026 09:18:15 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BB723629777
	for <lists+linux-arm-msm@lfdr.de>; Tue, 02 Jun 2026 09:18:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 23783302BEA5
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Jun 2026 07:14:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B22B93AA1AE;
	Tue,  2 Jun 2026 07:14:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=herrie.org header.i=@herrie.org header.b="AL8oNF15"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from outbound2.mail.transip.nl (outbound2.mail.transip.nl [149.210.149.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 923843A9601;
	Tue,  2 Jun 2026 07:14:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=149.210.149.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780384476; cv=none; b=er9CIgrxPF1FIVUgNmCKgs4VmUJJvxZqYagOGTf/sSLdGqPmtAGIml5fh6eN+bDGhxcip2FT3YwEU2fo9ft1QflceYp5R1ocOKV8im5unhuwIyAh54CHfv8+2AL5N5acoshfuBI2Exmiursv0YltHuTKIljfSkACVVL/GSCEJng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780384476; c=relaxed/simple;
	bh=Gj/r5QUg7A/QXq3itAwYNsrU2+XVRdz7h/xXuvpjcRk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Y1KhILxoXeAzSXr8ekclmvmkBnfITUyMYhnw72cUbT4xzBXpDUiEK1almqNJ+vAnpU9Kpc5WRnxgVVcpCn1u+u+dXWuRj8xJTWLEUtEwCxu3/j6KF2S9mueD33aIV60DjXi5s2GLfSOOB7gdq7preq8X8JOyhKkliamh8pUqztc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=herrie.org; spf=pass smtp.mailfrom=herrie.org; dkim=pass (2048-bit key) header.d=herrie.org header.i=@herrie.org header.b=AL8oNF15; arc=none smtp.client-ip=149.210.149.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=herrie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=herrie.org
Received: from submission6.mail.transip.nl (unknown [10.103.8.157])
	by outbound2.mail.transip.nl (Postfix) with ESMTP id 4gV2Bq39lhzYdrM;
	Tue,  2 Jun 2026 09:14:27 +0200 (CEST)
Received: from herrie-desktop.. (180-93-184-31.ftth.glasoperator.nl [31.184.93.180])
	by submission6.mail.transip.nl (Postfix) with ESMTPA id 4gV2Bp57c9z3ZVDrg;
	Tue,  2 Jun 2026 09:14:26 +0200 (CEST)
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
Date: Tue,  2 Jun 2026 09:14:25 +0200
Message-ID: <20260602071426.1057324-1-github.com@herrie.org>
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
X-Scanned-By: ClueGetter at submission6.mail.transip.nl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=transip-a; d=herrie.org; t=1780384467; h=from:subject:to:cc:
 references:in-reply-to:date:mime-version;
 bh=nxE0F+TFdlccFuPwMmOYD9rX+zpVkgN8oTJtXG4QvV0=;
 b=AL8oNF15eZyA7WBerWWVHaMIAbc6za4GAPOdKZxPyS4sKvnWNYwhFu81KLfWnia5KClaGO
 6q/vbFW6DrWfnZadWYk85h9nVYJHCEdPlha14oWX5SSeFblgPC85o7XwPbVLJzDfoesLe9
 UxUOZg8rifF0BDM2mF19gvYPhhUPEWqylpgaYjDApucWX3LEHxf9t2sN/+SSkjknFf+wcO
 PS8j31BfwUcX5GFt329P5LaiDLfeCBR3dpnnYlaeZMF7UwMrin626ZoxJozewWOzCi9q6h
 0P6r/EHW5IO9e99aFsDhR16pTYjwnFSeTkkoFYhlJo9B3t3UHLWG46/RJoaEVg==
X-Report-Abuse-To: abuse@transip.nl
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[herrie.org:s=transip-a];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-110729-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_NA(0.00)[herrie.org];
	DKIM_TRACE(0.00)[herrie.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[github.com@herrie.org,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,herrie.org:email,herrie.org:mid,herrie.org:dkim]
X-Rspamd-Queue-Id: BB723629777
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi,

Thanks for the thorough pass. All 5 items confirmed and queued for
v2. Triage:

[Medium] Kconfig: select QCOM_COMMON_CLK is a bogus symbol.

Confirmed -- that symbol does not exist. The qcom clk infra is pulled
in transitively via select QCOM_GDSC + select MSM_GCC_8660. The
sibling MSM_MMCC_8960 stanza carries no analogous select either.
v2 will drop the line.

[High] DSI src/byte/esc clocks use clk_rcg_bypass_ops with empty or
missing freq_tbl.

Confirmed. clk_rcg_bypass_ops dereferences freq_tbl[0] for src and
pre_div: with the empty/placeholder table, src resolves to P_PXO and
pre_div to (0 - 1) = 255, shifting outside the bitmask and corrupting
NS-register bits 14..21. dsi1_byte_src and dsi1_esc_src were even
worse -- no freq_tbl at all, so the deref hits a NULL.

Fix matches the table-less ops mainline mmcc-msm8960.c uses for the
same hardware (cross-checked against the legacy vendor 2.6.35-palm
arch/arm/mach-msm/clock-8x60.c's clk_tbl_dsi_byte and the parent-PLL
"src = SRC_NONE" comment that documents the divider-only intent):

  dsi1_src       -> clk_rcg_bypass2_ops + CLK_SET_RATE_PARENT
  dsi1_byte_src  -> clk_rcg_bypass2_ops + CLK_SET_RATE_PARENT
  dsi1_esc_src   -> clk_rcg_esc_ops     + CLK_SET_RATE_PARENT
  dsi1_pixel_src -> clk_rcg_pixel_ops   + CLK_SET_RATE_PARENT

The clk_tbl_dsi placeholder is removed.

[High] vcodec_axi_clk / _a / _b missing BRANCH_HALT_SKIP.

Confirmed. The rot_axi_clk and gfx3d_axi_clk entries already note
the MMSS-fabric-stuck-at-on case, and rot_axi_clk's comment even
calls out vcodec_axi_b_clk by name as a peer -- I just forgot to
actually carry the flag onto the three vcodec_axi branches. v2 will
add .halt_check = BRANCH_HALT_SKIP to all three.

[High] mmcc_msm8660_unhalt_fabric_ports() UAF window during RPM
probe failure.

Confirmed, and well caught. device_link_add() does not block on
supplier->bound; it can succeed against a supplier mid-probe, with
drvdata set early but a still-to-fail probe path that re-clears
drvdata and frees the qcom_rpm structure via devres.

The earlier -EPROBE_DEFER fix I sent covers the "drvdata still NULL"
case but does not close the "drvdata went non-NULL transiently and
will be freed after we sampled it" window. Fix: take
device_lock(&rpm_pdev->dev) and check device_is_bound() (exported
by drivers/base/dd.c) before reading drvdata, and hold the lock
across the single qcom_rpm_write() commit. The lock does not nest
with anything qcom_rpm_write touches (rpm->lock + the mailbox
subsystem; neither takes device_lock).

The legacy 2.6.35-palm vendor kernel does not exhibit this race
because it accesses RPM as a global singleton via msm_rpm_set_*
APIs -- no platform_device, no drvdata, no device_link. The race is
intrinsic to the modern discrete-driver split, so the fix needs to
live here.

All four are applied to my local tree and on-device validated.
v2 reroll will batch:

  - Kconfig drop
  - DSI ops fix + clk_tbl_dsi removal
  - vcodec_axi BRANCH_HALT_SKIP
  - device_lock + device_is_bound around unhalt drvdata read
  - (earlier rounds) GFX2D[01]_AHB_RESET entries
  - (earlier rounds) unhalt -EPROBE_DEFER

plus cover-letter pointers to the gdsc framework prereq
(LEGACY_FOOTSWITCH / RPM_ALWAYS_ON, sent separately as
20260602050840.435933-1-github.com@herrie.org).

Holding v2 until the first round of v1 feedback has had a chance
to settle and the prereq series have review traction.

Thanks,
Herman

