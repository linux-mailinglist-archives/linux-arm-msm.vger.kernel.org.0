Return-Path: <linux-arm-msm+bounces-110709-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wLr/B5RlHmoNjAkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110709-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 02 Jun 2026 07:09:40 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id AFEC162868D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 02 Jun 2026 07:09:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 107453038C71
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Jun 2026 05:08:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A53DF2F12AD;
	Tue,  2 Jun 2026 05:08:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=herrie.org header.i=@herrie.org header.b="cK/rJq4j"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from outbound7.mail.transip.nl (outbound7.mail.transip.nl [136.144.136.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B16342DF13B;
	Tue,  2 Jun 2026 05:08:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=136.144.136.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780376927; cv=none; b=nIffn77VOzkIQwsdkjtuOQO3dHLt3FubsfSB5HIYSLuaf1+S6gpLR4nYf2odydBQu8KwCUlrSfd/4iWlKfaz5/89+zgb+7NFjuVSRnx6kPBUAMfJ9uNkitVD4sWbSq+ik6vkPiK3pcO2nXxd8sv1TNxWYTmUAwpo5jURGx40yhM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780376927; c=relaxed/simple;
	bh=k0gvra76LrNwju/rDJjUMZpBSEh3V2gB5ZKWHLMGpFk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VWeMwGDgdJOs9S62x7uy8xwFjrXfrL5G8qlBcbPy1Etr5j5pqyYLfUhGhg7sWnyJV//G1eY1eRJWwYdp5ysAoUen4UxGHc0pJPr4B9WmrWEdOJ+/PT6SSFX0sdScpYFt8Gw0DSFZ9M5RT6UXax3m6ytdUB6n6IeR9/DD49jSQ0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=herrie.org; spf=pass smtp.mailfrom=herrie.org; dkim=pass (2048-bit key) header.d=herrie.org header.i=@herrie.org header.b=cK/rJq4j; arc=none smtp.client-ip=136.144.136.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=herrie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=herrie.org
Received: from submission2.mail.transip.nl (unknown [10.100.4.71])
	by outbound7.mail.transip.nl (Postfix) with ESMTP id 4gTzPk12DgzQvv76;
	Tue,  2 Jun 2026 07:08:42 +0200 (CEST)
Received: from herrie-desktop.. (180-93-184-31.ftth.glasoperator.nl [31.184.93.180])
	by submission2.mail.transip.nl (Postfix) with ESMTPA id 4gTzPj4BnZzJjhXt;
	Tue,  2 Jun 2026 07:08:41 +0200 (CEST)
From: Herman van Hazendonk <github.com@herrie.org>
To: sboyd@kernel.org
Cc: Herman van Hazendonk <github.com@herrie.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] clk: qcom: gdsc: add LEGACY_FOOTSWITCH support for MSM8x60
Date: Tue,  2 Jun 2026 07:08:37 +0200
Message-ID: <20260602050840.435933-2-github.com@herrie.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260602050840.435933-1-github.com@herrie.org>
References: <20260602050840.435933-1-github.com@herrie.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: ClueGetter at submission2.mail.transip.nl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=transip-a; d=herrie.org; t=1780376921; h=from:subject:to:cc:
 references:in-reply-to:date:mime-version;
 bh=hge+9x0VBx4cN7QPqOGaCS0FdDjmY3Xi89F3pPllKGg=;
 b=cK/rJq4jfhm4x2t/YDPJhOvR66NPeqTaJ13UYq8x+BPILmc1dXgroQWpy0tvue/WVbIlxQ
 UWQteHVmFsb41gHq0qSQONVUZszm7d8+E78p8LMJD3QWA0XkfxuKgM5cW6qGNWYWkmJU5y
 OOtvEdfw00AO0TlzkwD7SweIvr0IvjjaaZJLQ8IQl0Zk/MAqFSXxMrx4F6UJNSDEGhHrjT
 qLCodxvU8VVSDxMuFdMpLuw2xDIf695L/ReLDqZtsBt/uGBNwK+5FIELrRz33Z83U8n5Lk
 BFc0J1j+yPQP/3dIEZeSy28L6ThdtgFliSf+onax7M+2nMJ9uXm2b9NMxVv3SA==
X-Report-Abuse-To: abuse@transip.nl
X-Spamd-Result: default: False [-0.16 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[herrie.org:s=transip-a];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[herrie.org:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-110709-lists,linux-arm-msm=lfdr.de];
	DMARC_NA(0.00)[herrie.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[github.com@herrie.org,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[herrie.org:email,herrie.org:mid,herrie.org:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: AFEC162868D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

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
SoCs:

  enable:  assert resets -> set ENABLE -> 2us settle ->
           deassert resets -> clear CLAMP -> 5us settle
  disable: assert resets -> set CLAMP -> clear ENABLE

If the ENABLE write fails after asserting resets, deassert them
again before returning so the hardware block is not left stuck
in reset for the remainder of the system's lifetime.

In gdsc_init(), clear the RETENTION bit (BIT 9) before jumping to
the common state-sync block. The vendor MSM8x60 footswitch driver
does the same one-shot clear at probe for every footswitch; without
it the reset-default value is unspecified per board and a stuck-set
retention bit would leave the rail draining power while looking
collapsed in software.

This patch only adds the infrastructure; the MSM8x60 MMCC driver
that consumes it lands in a follow-up series.

Signed-off-by: Herman van Hazendonk <github.com@herrie.org>
---
 drivers/clk/qcom/gdsc.c | 147 ++++++++++++++++++++++++++++++++++++++++
 drivers/clk/qcom/gdsc.h |   7 ++
 2 files changed, 154 insertions(+)

diff --git a/drivers/clk/qcom/gdsc.c b/drivers/clk/qcom/gdsc.c
index 95aa07120245..64a9b315a9c2 100644
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
@@ -63,6 +68,23 @@ static int gdsc_check_status(struct gdsc *sc, enum gdsc_status status)
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
+		switch (status) {
+		case GDSC_ON:
+			return !!(val & LEGACY_FS_ENABLE_MASK);
+		case GDSC_OFF:
+			return !(val & LEGACY_FS_ENABLE_MASK);
+		}
+		return -EINVAL;
+	}
+
 	if (sc->flags & POLL_CFG_GDSCR)
 		reg = sc->gdscr + CFG_GDSCR_OFFSET;
 	else if (sc->gds_hw_ctrl)
@@ -121,6 +143,18 @@ static int gdsc_update_collapse_bit(struct gdsc *sc, bool val)
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
@@ -240,6 +274,23 @@ static inline void gdsc_assert_clamp_io(struct gdsc *sc)
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
@@ -264,6 +315,55 @@ static int gdsc_enable(struct generic_pm_domain *domain)
 	if (sc->pwrsts == PWRSTS_ON)
 		return gdsc_deassert_reset(sc);
 
+	/*
+	 * Legacy MSM8x60 footswitch enable sequence:
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
+		if (sc->flags & SW_RESET)
+			gdsc_assert_reset(sc);
+
+		ret = gdsc_update_collapse_bit(sc, false);
+		if (ret) {
+			/*
+			 * Power-up write failed -- release the reset we
+			 * just asserted so the block does not stay stuck
+			 * in reset for the rest of the system's lifetime.
+			 */
+			if (sc->flags & SW_RESET)
+				gdsc_deassert_reset(sc);
+			return ret;
+		}
+
+		udelay(2);
+
+		if (sc->flags & SW_RESET)
+			gdsc_deassert_reset(sc);
+
+		ret = legacy_fs_deassert_clamp(sc);
+		if (ret) {
+			/*
+			 * Rail is already powered up; if we cannot release
+			 * the I/O clamp, collapse the rail again to avoid
+			 * leaving the block live but isolated.
+			 */
+			gdsc_update_collapse_bit(sc, true);
+			return ret;
+		}
+
+		udelay(5);
+
+		return 0;
+	}
+
 	if (sc->flags & SW_RESET) {
 		gdsc_assert_reset(sc);
 		udelay(1);
@@ -322,6 +422,31 @@ static int gdsc_disable(struct generic_pm_domain *domain)
 	if (sc->pwrsts == PWRSTS_ON)
 		return gdsc_assert_reset(sc);
 
+	/*
+	 * Legacy MSM8x60 footswitch disable sequence:
+	 *   1. assert per-block resets (if SW_RESET)
+	 *   2. set CLAMP in GDSCR to hold I/O at safe values across collapse
+	 *   3. clear ENABLE in GDSCR to collapse the rail
+	 */
+	if (sc->flags & LEGACY_FOOTSWITCH) {
+		if (sc->flags & SW_RESET)
+			gdsc_assert_reset(sc);
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
+		return gdsc_update_collapse_bit(sc, true);
+	}
+
 	/* Turn off HW trigger mode if supported */
 	if (sc->flags & HW_CTRL) {
 		ret = gdsc_hwctrl(sc, false);
@@ -405,6 +530,27 @@ static int gdsc_init(struct gdsc *sc)
 	u32 mask, val;
 	int on, ret;
 
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
+
 	/*
 	 * Disable HW trigger: collapse/restore occur based on registers writes.
 	 * Disable SW override: Use hardware state-machine for sequencing.
@@ -428,6 +574,7 @@ static int gdsc_init(struct gdsc *sc)
 	if (ret)
 		return ret;
 
+skip_wait_config:
 	/* Force gdsc ON if only ON state is supported */
 	if (sc->pwrsts == PWRSTS_ON) {
 		ret = gdsc_toggle_logic(sc, GDSC_ON, false);
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


