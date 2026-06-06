Return-Path: <linux-arm-msm+bounces-111505-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id m4zHOOcTJGr02gEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111505-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 06 Jun 2026 14:34:47 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C8DF64D6F0
	for <lists+linux-arm-msm@lfdr.de>; Sat, 06 Jun 2026 14:34:47 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=herrie.org header.s=transip-a header.b=OJSFSOAK;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111505-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111505-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2F6953016503
	for <lists+linux-arm-msm@lfdr.de>; Sat,  6 Jun 2026 12:34:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E1443A5434;
	Sat,  6 Jun 2026 12:34:41 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from outbound8.mail.transip.nl (outbound8.mail.transip.nl [136.144.136.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23C301E376C;
	Sat,  6 Jun 2026 12:34:34 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780749281; cv=none; b=jB5uLuXZNP1mca8wRLrUxkus9rJO5ktFO3OhqYsl9BBRtUqOflll47mKQ0ZeQWkqefKD69rvChbQv0xVrLpMcg7UChB23l+Jcuk8AVMaubokJ8gDYuqcFipjSdYG052Cw61dOOMIiGUXHI3H3/uKjxLlqTY/MTPMnCBw0hAQbhQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780749281; c=relaxed/simple;
	bh=hgk/JsgCpMXpD1kgHnjMQw+KScZgIAnIClXZj+rpQ0c=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=OGKWwWNlDZqUsc9IHmMhmY2eJHioLbjl5X0vdpZD/cK9dVZUh0C7rhYQHvusqXjrzo489sYewaajraPJJV4LBfEZD1c3XxVazBHe3+IkZdUXpEAOYXFeihzKbtLBByfGcoKTz38FeEtOxx4ZDmQDj1QmlPYN2XuoGgNZjNhYOsg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=herrie.org; spf=pass smtp.mailfrom=herrie.org; dkim=pass (2048-bit key) header.d=herrie.org header.i=@herrie.org header.b=OJSFSOAK; arc=none smtp.client-ip=136.144.136.8
Received: from submission1.mail.transip.nl (unknown [10.100.4.70])
	by outbound8.mail.transip.nl (Postfix) with ESMTP id 4gXd6C00pRzY76X0;
	Sat,  6 Jun 2026 14:34:27 +0200 (CEST)
Received: from [127.0.1.1] (180-93-184-31.ftth.glasoperator.nl [31.184.93.180])
	by submission1.mail.transip.nl (Postfix) with ESMTPA id 4gXd6B1HjdzJjhYK;
	Sat,  6 Jun 2026 14:34:26 +0200 (CEST)
From: Herman van Hazendonk <github.com@herrie.org>
Subject: [PATCH v2 0/2] clk: qcom: gdsc: add MSM8x60 LEGACY_FOOTSWITCH +
 RPM_ALWAYS_ON support
Date: Sat, 06 Jun 2026 14:34:25 +0200
Message-Id: <20260606-submit-clk-gdsc-msm8x60-legacy-v2-0-187a32d2f015@herrie.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANETJGoC/x2NwQqDMBAFf0X23IU0liD+SunBJK/porElq2IR/
 72hzGkuMwcpikCpbw4q2ETlPVexl4bCa5gTWGJ1ssY6U2FdfZaFwzRyiho4a+52Z3hCGsKXr+j
 izbetAzzVyKfgKft/cH+c5w/RRcZTcAAAAA==
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Herman van Hazendonk <github.com@herrie.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780749266; l=3995;
 i=github.com@herrie.org; s=20240417; h=from:subject:message-id;
 bh=hgk/JsgCpMXpD1kgHnjMQw+KScZgIAnIClXZj+rpQ0c=;
 b=fLbirAMHvtS0Shy6FvJdyfQwUhrEGx6Vc8PGsjZebqaR3J1Q+uzB7I2TMYHwDiGoiRAXtiGGq
 YpvC3o1E9RaBHnpymqXmKeSh9k+WmIakKR+j2w0XjqzxBeFk2ypxUvc
X-Developer-Key: i=github.com@herrie.org; a=ed25519;
 pk=YYxdq8fb5O9vhkW3n2dCH044FPZZO5718v/du7fRhFw=
X-Scanned-By: ClueGetter at submission1.mail.transip.nl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=transip-a; d=herrie.org; t=1780749266; h=from:subject:to:cc:date:
 mime-version:content-type;
 bh=WZb3PZhfqkfQ5lawbj7nw/mnMBgdkG8MrHg1p8EFY18=;
 b=OJSFSOAKG60wNMyoTpXd7i7O72zWp2YBQ5+aCmBYtVT/fpQfvI/HHgahEsa2Iwd75r+DLI
 q4mKQqqYgMc0DRNLpX4vGP4V0i+ESGD2WagGUglMJ96jsMYoDsbSI3tdRLdT5jCKxL8TNW
 n46Ja+liNEF8/Y+++n886A8hlGhC6VgF4CxUGoW74wzLO+rZ8EeQnqO3qoXCIhiKgdpG0O
 /6EmDqEeUV3W1ppJa+OS1b854hdy6WExo75qI1TWhaNS1drqQYxfWng/7JVgIsDJJ7AY3c
 yLlACUa3uE1+mpCpBIWsYpvA4eyByclOWMcBgXHEMFoj/r2p6veWxyqP/LCpDg==
X-Report-Abuse-To: abuse@transip.nl
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[herrie.org:s=transip-a];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER(0.00)[github.com@herrie.org,linux-arm-msm@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-111505-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[herrie.org:+];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DMARC_NA(0.00)[herrie.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:sboyd@kernel.org,m:mturquette@baylibre.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-pm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:github.com@herrie.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[github.com@herrie.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,herrie.org:mid,herrie.org:dkim,herrie.org:from_mime,herrie.org:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7C8DF64D6F0

The MSM8x60 family (MSM8260 / MSM8660 / APQ8060) uses a pre-modern
"footswitch" power-domain block (GFS) for its multimedia GDSCs that
predates the modern qcom GDSC programming model. The legacy block has
a single-register layout (ENABLE / CLAMP / RETENTION at fixed bits in
the GDSCR) instead of the modern split GDSCR / CFG_GDSCR pair, no
power-status bit (state has to be inferred from ENABLE + CLAMP), and a
fixed-delay handoff sequence with no completion register to poll.

Patch 1 adds a LEGACY_FOOTSWITCH flag plus the supporting helpers
(legacy enable / disable sequencing, gdsc_check_status fallback,
legacy clamp helpers). Patch 2 adds an RPM_ALWAYS_ON flag wiring the
PWRSTS_ON ALWAYS_ON paths to GENPD_FLAG_RPM_ALWAYS_ON; this is needed
because some MSM8x60 GDSCs are managed by RPM firmware and the kernel
must keep its genpd vote alive across runtime PM transitions.

v2 folds 2 High Sashiko findings on the v1 patchset, both vote-balance
bugs in gdsc_init() (see below). Both folds verified on HW; no
regulator-imbalance WARNs in dmesg post-fix.

Signed-off-by: Herman van Hazendonk <github.com@herrie.org>
---
Changes in v2:

Both Sashiko findings folded:

  - [High] gdsc_init() PWRSTS_ON + LEGACY_FOOTSWITCH + initial_on
    triple condition: the PWRSTS_ON block calls gdsc_enable() above,
    which on the legacy path takes a regulator_enable() vote
    unconditionally. The downstream "sync" block at line ~737 then
    voted *again* because initial_on=true, while gdsc_disable() only
    unwinds the vote once -> permanent +1 ref-count imbalance per
    probe. Skip the sync vote when
    (pwrsts == PWRSTS_ON && LEGACY_FOOTSWITCH).
    Folded into patch 1 (LEGACY_FOOTSWITCH support).

  - [High] gdsc_init() ALWAYS_ON / RPM_ALWAYS_ON block: the
    unconditional gdsc_enable() call ignored its return value and
    unconditionally set on=true. If gdsc_enable() failed (e.g. an
    internal regulator_enable failure) the subsequent
    pm_genpd_init() error path would call regulator_disable() for a
    vote that was never actually taken -> regulator ref-count
    underflow and vote leak. Propagate the gdsc_enable() return
    immediately. Folded into patch 2 (RPM_ALWAYS_ON flag).

Test results (v2, HP TouchPad APQ8060, kernel 7.1.0-rc1):

  - Boot clean. All MSM8x60 GDSCs probe and reach their expected
    initial state: vfe / ved / rot / mdp / gfx3d on (bootloader
    handoff); ijpeg / vpe / gfx2d0 / gfx2d1 off-0 (kernel-managed).

  - Camera stream stress (20x rapid pix640 + pix1280 + 60s
    unbind/rebind race on mt9m113 -> exercises vfe domain off/on
    cycles + ved bringup): zero regulator-imbalance WARNs, zero
    "Unbalanced disable" messages from regulator/core.c, zero
    clk-refcount underflow WARNs.

  - 120s concurrent multi-subsystem load (camera stream loop + dd
    to eMMC + /dev/urandom + filesystem walk): all GDSCs stay in
    expected state, no genpd warnings, USB stayed up, MDP stayed
    active. Driver still bound at the end.

  - dmesg post-load: 0 WARN, 0 BUG, 0 Oops from gdsc /
    regulator / clk frameworks. The only routine "CSIPHY1:
    usleep 10-15ms for GDSC stabilize" info lines (camss
    pre-existing chatter, not gdsc-related) are visible.

  - Kernel build clean (ARCH=arm, CONFIG_QCOM_GDSC=y,
    CONFIG_QCOM_CLK_RPM=y, CONFIG_MSM_MMCC_8660=y).

- Link to v1: https://lore.kernel.org/r/20260602050840.435933-1-github.com@herrie.org

---
Herman van Hazendonk (2):
      clk: qcom: gdsc: add LEGACY_FOOTSWITCH support for MSM8x60
      clk: qcom: gdsc: add RPM_ALWAYS_ON flag

 drivers/clk/qcom/gdsc.c | 344 ++++++++++++++++++++++++++++++++++++++++++++++--
 drivers/clk/qcom/gdsc.h |  19 +++
 2 files changed, 351 insertions(+), 12 deletions(-)
---
base-commit: 944125b4c454b58d2fe6e35f1087a932b2050dff
change-id: 20260606-submit-clk-gdsc-msm8x60-legacy-1e8d4b336eeb

Best regards,
-- 
Herman van Hazendonk <github.com@herrie.org>


