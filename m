Return-Path: <linux-arm-msm+bounces-111506-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 4iCWAPcTJGr92gEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111506-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 06 Jun 2026 14:35:03 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8544964D701
	for <lists+linux-arm-msm@lfdr.de>; Sat, 06 Jun 2026 14:35:02 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=herrie.org header.s=transip-a header.b=tcGjbA4D;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111506-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111506-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3A224302E435
	for <lists+linux-arm-msm@lfdr.de>; Sat,  6 Jun 2026 12:34:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DD043A7D6F;
	Sat,  6 Jun 2026 12:34:44 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from outbound11.mail.transip.nl (outbound11.mail.transip.nl [136.144.136.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D1C235B631;
	Sat,  6 Jun 2026 12:34:35 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780749284; cv=none; b=OhmGuZ9hSgAb5NGn4/ndkm9NrA0U2Kjv8/WHy+0jOzzjrR5kpxgsUA6zigA2lkF1VCFzXHNI9ooG3J1vLN5QXA7KUCfxcwox7Z8w4bDg60ovEspSdYP4rBOUkjiVoQna7dpot1VlA6pg/aFdDCk57spEz2jbwYOBezn1qiyhQNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780749284; c=relaxed/simple;
	bh=DSEE5W+bUq/qz4HSuUOBsJojBrNkZwP6W5Me/2XZooo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LSH11fagiLruDqcWDFHNgPK01V9+W1mZElJeP/76oNTqFDH5WkLQ6FBUIHeEN9Efewvc3VALdZWaKnm638YyGPdImKu2ko9MiZjO0DCh+FHnN0zi3lZfKxK9Ngo5wxixaB/8urxIpAHvij9HE+aLYTTx1+7doICh+zpNTx7iZy0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=herrie.org; spf=pass smtp.mailfrom=herrie.org; dkim=pass (2048-bit key) header.d=herrie.org header.i=@herrie.org header.b=tcGjbA4D; arc=none smtp.client-ip=136.144.136.18
Received: from submission1.mail.transip.nl (unknown [10.100.4.70])
	by outbound11.mail.transip.nl (Postfix) with ESMTP id 4gXd6C58G0zkQNln;
	Sat,  6 Jun 2026 14:34:27 +0200 (CEST)
Received: from [127.0.1.1] (180-93-184-31.ftth.glasoperator.nl [31.184.93.180])
	by submission1.mail.transip.nl (Postfix) with ESMTPA id 4gXd6C03XnzJjhYM;
	Sat,  6 Jun 2026 14:34:26 +0200 (CEST)
From: Herman van Hazendonk <github.com@herrie.org>
Date: Sat, 06 Jun 2026 14:34:26 +0200
Subject: [PATCH v2 1/2] clk: qcom: gdsc: add LEGACY_FOOTSWITCH support for
 MSM8x60
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260606-submit-clk-gdsc-msm8x60-legacy-v2-1-187a32d2f015@herrie.org>
References: <20260606-submit-clk-gdsc-msm8x60-legacy-v2-0-187a32d2f015@herrie.org>
In-Reply-To: <20260606-submit-clk-gdsc-msm8x60-legacy-v2-0-187a32d2f015@herrie.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Herman van Hazendonk <github.com@herrie.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780749266; l=17570;
 i=github.com@herrie.org; s=20240417; h=from:subject:message-id;
 bh=DSEE5W+bUq/qz4HSuUOBsJojBrNkZwP6W5Me/2XZooo=;
 b=QUvLveF2BYHpMrW9XxreCBfkn3jumUiycHuB7LexC5MyM7gypAn1DH6gcsIXaNoOtSZOMLW3k
 K13Qk6pXvgNBQpRPba3yv/C+l2RW7wnwBkAzKclcOedLu0Zx1vKQ8bk
X-Developer-Key: i=github.com@herrie.org; a=ed25519;
 pk=YYxdq8fb5O9vhkW3n2dCH044FPZZO5718v/du7fRhFw=
X-Scanned-By: ClueGetter at submission1.mail.transip.nl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=transip-a; d=herrie.org; t=1780749267; h=from:subject:to:cc:
 references:in-reply-to:date:mime-version:content-type;
 bh=zO2CAJBh9pdl2OXKCjRyvHeHsuKRc1CG5wQZ8yl072M=;
 b=tcGjbA4DP4Wjt679IpwIceLvre6yDUi6uX4mRfyqYbKiVLVbm1Zni8DPasGPrj6r8ZwTkl
 kqPMYlqhP53NLlIEXSmQfGwhHQRd8c+qKD6tByJ+H/VZidcoNk33LxoXQUUeHmjT8IV4+f
 3CkYwhT6wF191JRQbAs/EQIYsCc8Ml2t3m+X/2zsyQDQRqTdXDhsHuo/sAfQnz44oiz9tJ
 uIZ/scww+HNi3P9yd00fo2Mt/IvKEpzTSh6tIwzxM//JZlNY00M8y+aKT9/10ItNhp4hul
 TSPNBHO6ZXaTxMnL6vUhk46dOg8mCoLe8TDfsbcZiTCEkEUtIuiX/eFA60U8Wg==
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
	TAGGED_FROM(0.00)[bounces-111506-lists,linux-arm-msm=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,herrie.org:mid,herrie.org:dkim,herrie.org:from_mime,herrie.org:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8544964D701

The MSM8x60 family (MSM8260, MSM8660, APQ8060) ships an older
footswitch (FS / "GFS") block that pre-dates the GDSC programming
model the existing driver was designed around. Adding GDSC entries
for that family's MMCC power domains needs the driver to understand
the legacy register layout:

  - the CLAMP, ENABLE and RETENTION bits live in the main GDSCR
    register rather than in a separate clamp_io_ctrl;
  - there is no power-status bit, so software cannot poll for the
    transition completing and has to gate progress on a fixed
    udelay() after toggling ENABLE;
  - ENABLE is positive-logic (set to power up, clear to collapse)
    rather than the modern inverted SW_COLLAPSE semantics;
  - none of the modern wait-time / HW-trigger / SW-override fields
    are present, so gdsc_init() must skip the wait-config
    programming block entirely.

Introduce a LEGACY_FOOTSWITCH flag and the matching code paths in
gdsc_check_status(), gdsc_update_collapse_bit(), gdsc_enable(),
gdsc_disable() and gdsc_init(). The enable / disable sequences
mirror what the downstream vendor footswitch driver did on these
SoCs, with the regulator hand-off normally done by
gdsc_toggle_logic() spliced in at the matching points so a legacy
domain that has a parent regulator still gets voted up/down:

  enable:  regulator_enable -> assert resets -> set ENABLE ->
           2us settle -> deassert resets -> clear CLAMP ->
           5us settle
  disable: assert resets -> set CLAMP -> clear ENABLE ->
           regulator_disable

Every register-write failure inside the sequence walks the partial
state back to a defined endpoint before returning the error, so a
mid-sequence failure cannot strand the block in "rail powered but
clamped + in reset" (or the symmetric "clamped + reset asserted +
ENABLE still set"). The two pwrsts == PWRSTS_ON short-circuits at
the top of gdsc_enable() / gdsc_disable() are gated on
!(sc->flags & LEGACY_FOOTSWITCH) for the same reason: a legacy
footswitch declared PWRSTS_ON still has a real rail and clamp,
which the reset-only fast path would silently skip. gdsc_init()'s
PWRSTS_ON force-enable goes through gdsc_enable() for legacy
domains for the same reason.

In gdsc_init(), clear the RETENTION bit (BIT 9) before jumping to
the common state-sync block. The vendor MSM8x60 footswitch driver
does the same one-shot clear at probe for every footswitch; without
it the reset-default value is unspecified per board and a stuck-set
retention bit would leave the rail draining power while looking
collapsed in software.

This patch only adds the infrastructure; the MSM8x60 MMCC driver
that consumes it lands in a follow-up series.

Assisted-by: Claude:claude-opus-4-7 Sashiko:claude-haiku-4-5
Signed-off-by: Herman van Hazendonk <github.com@herrie.org>
---
 drivers/clk/qcom/gdsc.c | 323 ++++++++++++++++++++++++++++++++++++++++++++++--
 drivers/clk/qcom/gdsc.h |   7 ++
 2 files changed, 321 insertions(+), 9 deletions(-)

diff --git a/drivers/clk/qcom/gdsc.c b/drivers/clk/qcom/gdsc.c
index 95aa07120245..1f80bebe88c7 100644
--- a/drivers/clk/qcom/gdsc.c
+++ b/drivers/clk/qcom/gdsc.c
@@ -27,6 +27,11 @@
 #define GMEM_CLAMP_IO_MASK	BIT(0)
 #define GMEM_RESET_MASK		BIT(4)
 
+/* Legacy MSM8x60 footswitch register bits (single register layout) */
+#define LEGACY_FS_CLAMP_MASK		BIT(5)
+#define LEGACY_FS_ENABLE_MASK		BIT(8)
+#define LEGACY_FS_RETENTION_MASK	BIT(9)
+
 /* CFG_GDSCR */
 #define GDSC_POWER_UP_COMPLETE		BIT(16)
 #define GDSC_POWER_DOWN_COMPLETE	BIT(15)
@@ -63,6 +68,32 @@ static int gdsc_check_status(struct gdsc *sc, enum gdsc_status status)
 	u32 val;
 	int ret;
 
+	/*
+	 * Legacy footswitches have no power-status bit: software has to
+	 * infer the state from the ENABLE bit it just wrote.
+	 */
+	if (sc->flags & LEGACY_FOOTSWITCH) {
+		ret = regmap_read(sc->regmap, sc->gdscr, &val);
+		if (ret)
+			return ret;
+		/*
+		 * A block with ENABLE=1 but CLAMP=1 is electrically isolated:
+		 * the rail is powered but all I/O is clamped. The downstream
+		 * vendor footswitch driver (footswitch-8x60.c) treats the block
+		 * as "ON" only when ENABLE is set AND CLAMP is clear -- mirror
+		 * that convention so callers don't mistake a clamped-but-
+		 * powered block for a fully usable one.
+		 */
+		switch (status) {
+		case GDSC_ON:
+			return (val & (LEGACY_FS_ENABLE_MASK | LEGACY_FS_CLAMP_MASK))
+			       == LEGACY_FS_ENABLE_MASK;
+		case GDSC_OFF:
+			return !(val & LEGACY_FS_ENABLE_MASK);
+		}
+		return -EINVAL;
+	}
+
 	if (sc->flags & POLL_CFG_GDSCR)
 		reg = sc->gdscr + CFG_GDSCR_OFFSET;
 	else if (sc->gds_hw_ctrl)
@@ -121,6 +152,18 @@ static int gdsc_update_collapse_bit(struct gdsc *sc, bool val)
 	u32 reg, mask;
 	int ret;
 
+	/*
+	 * Legacy footswitches do not have an inverted SW_COLLAPSE bit;
+	 * instead the same bit means ENABLE: clear to disable the rail,
+	 * set to enable it. Invert the caller's "collapse" intent.
+	 */
+	if (sc->flags & LEGACY_FOOTSWITCH) {
+		reg = sc->gdscr;
+		mask = LEGACY_FS_ENABLE_MASK;
+		return regmap_update_bits(sc->regmap, reg, mask,
+					  val ? 0 : mask);
+	}
+
 	if (sc->collapse_mask) {
 		reg = sc->collapse_ctrl;
 		mask = sc->collapse_mask;
@@ -240,6 +283,23 @@ static inline void gdsc_assert_clamp_io(struct gdsc *sc)
 			   GMEM_CLAMP_IO_MASK, 1);
 }
 
+/*
+ * Legacy MSM8x60 footswitches keep the I/O clamp bit in the main GDSCR
+ * (no separate clamp_io_ctrl register), so the helpers here use sc->gdscr.
+ */
+static inline int legacy_fs_deassert_clamp(struct gdsc *sc)
+{
+	return regmap_update_bits(sc->regmap, sc->gdscr,
+				  LEGACY_FS_CLAMP_MASK, 0);
+}
+
+static inline int legacy_fs_assert_clamp(struct gdsc *sc)
+{
+	return regmap_update_bits(sc->regmap, sc->gdscr,
+				  LEGACY_FS_CLAMP_MASK,
+				  LEGACY_FS_CLAMP_MASK);
+}
+
 static inline void gdsc_assert_reset_aon(struct gdsc *sc)
 {
 	regmap_update_bits(sc->regmap, sc->clamp_io_ctrl,
@@ -259,11 +319,121 @@ static void gdsc_retain_ff_on(struct gdsc *sc)
 static int gdsc_enable(struct generic_pm_domain *domain)
 {
 	struct gdsc *sc = domain_to_gdsc(domain);
-	int ret;
+	int ret, rc;
 
-	if (sc->pwrsts == PWRSTS_ON)
+	/*
+	 * Modern PWRSTS_ON-only GDSCs are pure reset-controllers: there
+	 * is no rail to bring up so only the reset deassert is needed.
+	 * Legacy footswitches always need the full power-up + clamp-
+	 * release sequence below, even when declared PWRSTS_ON, so they
+	 * must not take this short-circuit.
+	 */
+	if (sc->pwrsts == PWRSTS_ON && !(sc->flags & LEGACY_FOOTSWITCH))
 		return gdsc_deassert_reset(sc);
 
+	/*
+	 * Legacy MSM8x60 footswitch enable sequence:
+	 *   0. enable the parent regulator supply (if any)
+	 *   1. assert per-block resets (if SW_RESET)
+	 *   2. set ENABLE in GDSCR to power up the rail
+	 *   3. wait 2us for the rail to fully charge
+	 *   4. deassert resets
+	 *   5. clear CLAMP in GDSCR to release the I/O clamp
+	 *   6. wait 5us for clamps to release and signals to settle
+	 *
+	 * No status-bit polling -- the hardware does not expose one, so
+	 * the fixed delays below are the only safe synchronisation point.
+	 */
+	if (sc->flags & LEGACY_FOOTSWITCH) {
+		if (sc->rsupply) {
+			ret = regulator_enable(sc->rsupply);
+			if (ret < 0)
+				return ret;
+		}
+
+		if (sc->flags & SW_RESET) {
+			gdsc_assert_reset(sc);
+			/*
+			 * Wait for synchronous resets to propagate before
+			 * raising ENABLE: matches footswitch-8x60.c's
+			 * udelay(RESET_DELAY_US) between assert and enable.
+			 */
+			udelay(1);
+		}
+
+		ret = gdsc_update_collapse_bit(sc, false);
+		if (ret) {
+			/*
+			 * Power-up write failed -- release the reset we
+			 * just asserted so the block does not stay stuck
+			 * in reset for the rest of the system's lifetime,
+			 * and roll back the regulator vote we just took.
+			 */
+			if (sc->flags & SW_RESET)
+				gdsc_deassert_reset(sc);
+			if (sc->rsupply)
+				regulator_disable(sc->rsupply);
+			return ret;
+		}
+
+		udelay(2);
+
+		/*
+		 * Release the I/O clamp BEFORE deasserting resets: the
+		 * downstream vendor footswitch driver (footswitch-8x60.c)
+		 * always clears CLAMP_BIT first, then deasserts per-block
+		 * resets. This lets the block's outputs settle in a known
+		 * reset state before they become visible to consumers.
+		 */
+		ret = legacy_fs_deassert_clamp(sc);
+		if (ret) {
+			/*
+			 * Rail is already powered up; if we cannot release
+			 * the I/O clamp, collapse the rail again to avoid
+			 * leaving the block live but isolated, re-assert
+			 * the reset so the block ends in a defined
+			 * power-off state, and undo the regulator vote.
+			 * Errors from these best-effort rollback steps are
+			 * reported but do not override the original error
+			 * returned to the caller -- the secondary failure
+			 * means the hardware state is already indeterminate
+			 * and the regulator vote must still be released.
+			 */
+			rc = gdsc_update_collapse_bit(sc, true);
+			if (rc) {
+				/*
+				 * Collapse also failed: the rail is still ON.
+				 * Do NOT call regulator_disable() -- the rail
+				 * is still drawing from the supply and cutting
+				 * it while ENABLE is set risks hardware damage.
+				 * Mirror gdsc_disable()'s collapse-failure path
+				 * which deliberately skips regulator_disable()
+				 * when the rail did not collapse.
+				 */
+				pr_err("%s: rail collapse rollback failed (%d) after clamp release failure (%d); rail may be ON, regulator vote leaked\n",
+				       sc->pd.name, rc, ret);
+			} else {
+				if (sc->flags & SW_RESET)
+					gdsc_assert_reset(sc);
+				if (sc->rsupply) {
+					rc = regulator_disable(sc->rsupply);
+					if (rc)
+						pr_err("%s: regulator_disable failed (%d) in clamp-release rollback\n",
+						       sc->pd.name, rc);
+				}
+			}
+			return ret;
+		}
+
+		/* Deassert resets now that clamp is released (vendor order). */
+		if (sc->flags & SW_RESET)
+			gdsc_deassert_reset(sc);
+
+		udelay(5);
+
+		return 0;
+	}
+
 	if (sc->flags & SW_RESET) {
 		gdsc_assert_reset(sc);
 		udelay(1);
@@ -317,11 +487,91 @@ static int gdsc_enable(struct generic_pm_domain *domain)
 static int gdsc_disable(struct generic_pm_domain *domain)
 {
 	struct gdsc *sc = domain_to_gdsc(domain);
-	int ret;
+	int ret, rc;
 
-	if (sc->pwrsts == PWRSTS_ON)
+	/*
+	 * Symmetric to gdsc_enable: modern PWRSTS_ON-only GDSCs only
+	 * need a reset assert, but legacy footswitches with PWRSTS_ON
+	 * still need to clamp I/O and collapse the rail explicitly so
+	 * they must not take this short-circuit.
+	 */
+	if (sc->pwrsts == PWRSTS_ON && !(sc->flags & LEGACY_FOOTSWITCH))
 		return gdsc_assert_reset(sc);
 
+	/*
+	 * Legacy MSM8x60 footswitch disable sequence:
+	 *   1. assert per-block resets (if SW_RESET)
+	 *   2. set CLAMP in GDSCR to hold I/O at safe values across collapse
+	 *   3. clear ENABLE in GDSCR to collapse the rail
+	 *   4. drop the parent regulator vote (if any)
+	 */
+	if (sc->flags & LEGACY_FOOTSWITCH) {
+		if (sc->flags & SW_RESET) {
+			gdsc_assert_reset(sc);
+			/*
+			 * Wait for synchronous resets to propagate before
+			 * clamping I/O: footswitch-8x60.c udelay(RESET_DELAY_US)
+			 * between assert and CLAMP_BIT set.
+			 */
+			udelay(1);
+		}
+
+		ret = legacy_fs_assert_clamp(sc);
+		if (ret) {
+			/*
+			 * Clamp programming failed -- release the reset we
+			 * just asserted so the block is not stranded in
+			 * reset, then surface the error.
+			 */
+			if (sc->flags & SW_RESET)
+				gdsc_deassert_reset(sc);
+			return ret;
+		}
+
+		ret = gdsc_update_collapse_bit(sc, true);
+		if (ret) {
+			/*
+			 * Collapse failed -- the rail is still ON. Walk
+			 * back the clamp and reset so the block returns
+			 * to its enabled state rather than being stranded
+			 * in the half-disabled "clamped + reset + on"
+			 * state; the regulator vote stays in place because
+			 * the rail is still drawing from it. A secondary
+			 * failure of the clamp release is reported but
+			 * cannot override the original error: the rail is
+			 * still ON, so the caller's view ("disable failed,
+			 * leave ON") is the correct outcome regardless.
+			 */
+			rc = legacy_fs_deassert_clamp(sc);
+			if (rc)
+				pr_err("%s: clamp release rollback failed (%d) after rail collapse failure (%d); hw may be clamped+ON\n",
+				       sc->pd.name, rc, ret);
+			if (sc->flags & SW_RESET)
+				gdsc_deassert_reset(sc);
+			return ret;
+		}
+
+		if (sc->rsupply) {
+			ret = regulator_disable(sc->rsupply);
+			if (ret < 0) {
+				/*
+				 * The rail is already collapsed. Reporting
+				 * the regulator error to genpd would leave it
+				 * thinking the domain is still ON when the
+				 * silicon is in fact off; the next consumer
+				 * enable would then be no-op'd by genpd and
+				 * hit dead hardware. Better to leak the
+				 * regulator vote (visible via /sys/.../
+				 * regulator) than to corrupt genpd state.
+				 */
+				pr_err("%s: regulator_disable failed (%d) after rail collapse; vote leaked, genpd state kept consistent with silicon\n",
+				       sc->pd.name, ret);
+			}
+		}
+
+		return 0;
+	}
+
 	/* Turn off HW trigger mode if supported */
 	if (sc->flags & HW_CTRL) {
 		ret = gdsc_hwctrl(sc, false);
@@ -403,7 +653,28 @@ static bool gdsc_get_hwmode(struct generic_pm_domain *domain, struct device *dev
 static int gdsc_init(struct gdsc *sc)
 {
 	u32 mask, val;
-	int on, ret;
+	int initial_on, on, ret;
+
+	/*
+	 * Legacy MSM8x60 footswitches share none of the modern GDSC
+	 * wait-time fields and have no HW trigger / SW override bits at
+	 * all, so skip the wait-config programming and jump straight to
+	 * the common state-sync block below.
+	 *
+	 * Clear the retention bit (BIT 9) so subsequent disable actually
+	 * power-collapses the rail rather than holding state. The vendor
+	 * MSM8x60 footswitch driver does the same one-shot clear at probe
+	 * for every footswitch; without it the reset-default value is
+	 * unspecified per board and a stuck-set retention bit would leave
+	 * the rail draining power while looking collapsed in software.
+	 */
+	if (sc->flags & LEGACY_FOOTSWITCH) {
+		ret = regmap_update_bits(sc->regmap, sc->gdscr,
+					 LEGACY_FS_RETENTION_MASK, 0);
+		if (ret)
+			return ret;
+		goto skip_wait_config;
+	}
 
 	/*
 	 * Disable HW trigger: collapse/restore occur based on registers writes.
@@ -428,9 +699,31 @@ static int gdsc_init(struct gdsc *sc)
 	if (ret)
 		return ret;
 
-	/* Force gdsc ON if only ON state is supported */
+skip_wait_config:
+	/*
+	 * Sample the GDSC power state BEFORE any probe-time enable below
+	 * so the "sync the kernel state" regulator vote only runs when the
+	 * GDSC was already on at probe (bootloader handoff). For the
+	 * PWRSTS_ON / ALWAYS_ON force-enable paths, gdsc_enable() and
+	 * gdsc_toggle_logic() take the vote themselves -- re-voting from
+	 * the sync block would double-vote rsupply and leak a reference.
+	 */
+	initial_on = gdsc_check_status(sc, GDSC_ON);
+	if (initial_on < 0)
+		return initial_on;
+
+	/*
+	 * Force gdsc ON if only ON state is supported. For legacy
+	 * footswitches, gdsc_toggle_logic() would only flip the ENABLE
+	 * bit and skip the I/O-clamp release + settle delay that the
+	 * MSM8x60 power-up sequence requires; call gdsc_enable() instead
+	 * so the full legacy sequence runs.
+	 */
 	if (sc->pwrsts == PWRSTS_ON) {
-		ret = gdsc_toggle_logic(sc, GDSC_ON, false);
+		if (sc->flags & LEGACY_FOOTSWITCH)
+			ret = gdsc_enable(&sc->pd);
+		else
+			ret = gdsc_toggle_logic(sc, GDSC_ON, false);
 		if (ret)
 			return ret;
 	}
@@ -440,8 +733,20 @@ static int gdsc_init(struct gdsc *sc)
 		return on;
 
 	if (on) {
-		/* The regulator must be on, sync the kernel state */
-		if (sc->rsupply) {
+		/*
+		 * Sync the kernel regulator state only if the GDSC was
+		 * already on at probe; if we just enabled it above, the
+		 * vote was taken inside gdsc_enable() / gdsc_toggle_logic().
+		 *
+		 * Special case: PWRSTS_ON + LEGACY_FOOTSWITCH always routes
+		 * through gdsc_enable() above (lines around the PWRSTS_ON
+		 * block), which calls regulator_enable() unconditionally on
+		 * the legacy path. Skip the sync vote in that case to avoid
+		 * a double-vote that gdsc_disable() only unwinds once.
+		 */
+		if (sc->rsupply && initial_on &&
+		    !(sc->pwrsts == PWRSTS_ON &&
+		      (sc->flags & LEGACY_FOOTSWITCH))) {
 			ret = regulator_enable(sc->rsupply);
 			if (ret < 0)
 				return ret;
diff --git a/drivers/clk/qcom/gdsc.h b/drivers/clk/qcom/gdsc.h
index dd843e86c05b..13ca09f93a01 100644
--- a/drivers/clk/qcom/gdsc.h
+++ b/drivers/clk/qcom/gdsc.h
@@ -68,6 +68,13 @@ struct gdsc {
 #define RETAIN_FF_ENABLE	BIT(7)
 #define NO_RET_PERIPH	BIT(8)
 #define HW_CTRL_TRIGGER	BIT(9)
+/*
+ * Legacy MSM8x60-family footswitch (a.k.a. "GFS"). Different register layout
+ * from the modern GDSC blocks: CLAMP at bit 5, ENABLE at bit 8, RETENTION at
+ * bit 9, and there is no power-status bit so software has to assume the
+ * transition completed after a fixed delay rather than polling status.
+ */
+#define LEGACY_FOOTSWITCH	BIT(10)
 	struct reset_controller_dev	*rcdev;
 	unsigned int			*resets;
 	unsigned int			reset_count;

-- 
2.43.0


