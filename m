Return-Path: <linux-arm-msm+bounces-110704-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wAP9AqNhHmrCiwkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110704-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 02 Jun 2026 06:52:51 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D0EE62837E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 02 Jun 2026 06:52:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A778E303CD02
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Jun 2026 04:50:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8B332DC332;
	Tue,  2 Jun 2026 04:50:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=herrie.org header.i=@herrie.org header.b="QF+rxEF3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from outbound10.mail.transip.nl (outbound10.mail.transip.nl [136.144.136.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA0B82D7DEF;
	Tue,  2 Jun 2026 04:50:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=136.144.136.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780375812; cv=none; b=kRVMzT6Ws+NZaj8H7GfOhnLK1jDQa2++xG8kTi4asZLAXedyn4rCGvCNX9M5+JpoRzzTshjhlbixDOnYiONUTEYJdsaKcm3OGehdqpzPYRiMXHptcFvZFsiCeadT854wh7RwFhDQKYqZg352a0DeQQizXrUkg9mVBztUkj9okX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780375812; c=relaxed/simple;
	bh=5plNzSrY9AC2qHvv7VnHromFMfNP9go+o9niR0KR2qg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TPQWXj5bWyaZHxbvZHeVXGe35b2m7sUX1aeVlvt8hLdYJyGG0RnHxGxDToANao8d0UPLb1LQj6S4o+Ed1hJprl8ll8lIsxCoCtr8vf5E6MSk4Vi+L1AFi20WT9KogbCbm7xDhpu3Pc7IvT7BdKcJVlZ9FgauTFsJJ4QwquDi4Vg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=herrie.org; spf=pass smtp.mailfrom=herrie.org; dkim=pass (2048-bit key) header.d=herrie.org header.i=@herrie.org header.b=QF+rxEF3; arc=none smtp.client-ip=136.144.136.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=herrie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=herrie.org
Received: from submission4.mail.transip.nl (unknown [10.103.8.155])
	by outbound10.mail.transip.nl (Postfix) with ESMTP id 4gTz0F2VM9zTPNxr;
	Tue,  2 Jun 2026 06:50:05 +0200 (CEST)
Received: from herrie-desktop.. (180-93-184-31.ftth.glasoperator.nl [31.184.93.180])
	by submission4.mail.transip.nl (Postfix) with ESMTPA id 4gTz0D5YRcz3R3nyZ;
	Tue,  2 Jun 2026 06:50:04 +0200 (CEST)
From: Herman van Hazendonk <github.com@herrie.org>
To: sboyd@kernel.org
Cc: Herman van Hazendonk <github.com@herrie.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] clk: qcom: lcc-msm8960: serialise probe and block sysfs rebind
Date: Tue,  2 Jun 2026 06:50:00 +0200
Message-ID: <20260602045002.290918-3-github.com@herrie.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260602045002.290918-1-github.com@herrie.org>
References: <20260602045002.290918-1-github.com@herrie.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: ClueGetter at submission4.mail.transip.nl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=transip-a; d=herrie.org; t=1780375804; h=from:subject:to:cc:
 references:in-reply-to:date:mime-version;
 bh=YVtuD2z8bzyhjWdVGl8jesLik3vV5ng950d5DXd+7Nc=;
 b=QF+rxEF3dXg4+ANQ3w/XXp02hyEg6FhPGGqr7RrODmai6E2KqUvkhhmO5FEaRofXXDR51y
 krE+hSbvqTot4XhpmeWNBTxQ7+R6rSP/HMHz4TIqpkzwsoUhk0DUHFACgM5V6jug/xjqMj
 3/eM0lQhvXGxnfO5oQMPeAaAs21R8jMaE83loUnPCXEvl9XxqVpSGulPyzRrMUZWkgo2Cd
 lizhdMGjg5igdUaZ0tmOIZoNaj/udH6dNOmyskAKOW59p2+xygpkYYADOxpd0eYqIm+IrX
 diGFnmUYVCR6tqRZnFp7eRDB5mIGc4+XrUJmp3tgPS7ffpG7zzJQ+co7Opb9SA==
X-Report-Abuse-To: abuse@transip.nl
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[herrie.org:s=transip-a];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-110704-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	DMARC_NA(0.00)[herrie.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[github.com@herrie.org,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[herrie.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: 9D0EE62837E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The probe path mutates file-static clk_rcg structures:

  - The .freq_tbl pointer on slimbus_src, mi2s_osr_src, the four
    codec_i2s_*/spare_i2s_* osr_src entries, and pcm_src is selected
    from the PLL4 L-register read.

  - pxo_parent_data.fw_name/.name and lcc_pxo_pll4[0].fw_name/.name
    are switched to cxo for the MDM9615 compatible.

These are all file-static, and the registered clk_rcg objects are
referenced by qcom_cc_really_probe() through the same pointers. Two
hazards follow from that:

  1. Concurrent probe (a hypothetical second LCC instance, or sysfs
     bind racing the first probe) would race both the freq_tbl
     assignment and qcom_cc_really_probe()'s registration, leaving
     the clock tree in an inconsistent state with no diagnostic.

  2. Sysfs unbind + rebind would either race the previous instance's
     devm cleanup of those clocks (devm teardown runs after .remove
     returns, so concurrent probe-side mutation is observable), or,
     for a MDM9615 -> MSM8960 sequence, leave pxo_parent_data stuck
     on cxo for the new bind because remove cannot easily undo the
     compatible-specific patch.

Address both with a static bool guarded by a mutex (check-and-claim
atomically inside the locked scope so two concurrent probes cannot
both see the flag clear) and .suppress_bind_attrs = true on the
platform_driver. Sysfs bind/unbind is blocked entirely; module
unload is the only tear-down path and is serialised by the module
mutex, so no .remove callback is needed.

Signed-off-by: Herman van Hazendonk <github.com@herrie.org>
---
 drivers/clk/qcom/lcc-msm8960.c | 93 +++++++++++++++++++++++++++++++---
 1 file changed, 85 insertions(+), 8 deletions(-)

diff --git a/drivers/clk/qcom/lcc-msm8960.c b/drivers/clk/qcom/lcc-msm8960.c
index 44321c01f957..1e0873ce1cc2 100644
--- a/drivers/clk/qcom/lcc-msm8960.c
+++ b/drivers/clk/qcom/lcc-msm8960.c
@@ -6,6 +6,7 @@
 #include <linux/kernel.h>
 #include <linux/bitops.h>
 #include <linux/err.h>
+#include <linux/mutex.h>
 #include <linux/platform_device.h>
 #include <linux/module.h>
 #include <linux/of.h>
@@ -450,12 +451,38 @@ static const struct of_device_id lcc_msm8960_match_table[] = {
 };
 MODULE_DEVICE_TABLE(of, lcc_msm8960_match_table);
 
+/*
+ * The probe path mutates file-static clk_rcg structures (.freq_tbl
+ * pointers selected from the PLL4 L-register, and pxo_parent_data /
+ * lcc_pxo_pll4 for the MDM9615 cxo override). All clk_rcg objects in
+ * this file are registered by pointer through qcom_cc_really_probe(),
+ * so a second concurrent probe of the same driver would race both that
+ * registration and the freq_tbl assignment. Enforce single-instance
+ * binding with a static flag protected by an internal mutex.
+ */
+static bool lcc_msm8960_bound;
+static DEFINE_MUTEX(lcc_msm8960_bound_lock);
+
 static int lcc_msm8960_probe(struct platform_device *pdev)
 {
 	u32 val;
 	int ret;
 	struct regmap *regmap;
 
+	mutex_lock(&lcc_msm8960_bound_lock);
+	if (lcc_msm8960_bound) {
+		mutex_unlock(&lcc_msm8960_bound_lock);
+		return dev_err_probe(&pdev->dev, -EBUSY,
+			"only a single LCC instance is supported\n");
+	}
+	/*
+	 * Claim ownership inside the same locked region as the check
+	 * so a second concurrent probe cannot pass the check before
+	 * we set the flag.
+	 */
+	lcc_msm8960_bound = true;
+	mutex_unlock(&lcc_msm8960_bound_lock);
+
 	/* patch for the cxo <-> pxo difference */
 	if (of_device_is_compatible(pdev->dev.of_node, "qcom,lcc-mdm9615")) {
 		pxo_parent_data.fw_name = "cxo";
@@ -465,14 +492,18 @@ static int lcc_msm8960_probe(struct platform_device *pdev)
 	}
 
 	regmap = qcom_cc_map(pdev, &lcc_msm8960_desc);
-	if (IS_ERR(regmap))
-		return PTR_ERR(regmap);
+	if (IS_ERR(regmap)) {
+		ret = PTR_ERR(regmap);
+		goto err_unclaim;
+	}
 
 	/* Use the correct frequency plan depending on speed of PLL4 */
 	ret = regmap_read(regmap, 0x4, &val);
-	if (ret)
-		return dev_err_probe(&pdev->dev, ret,
-				     "failed to read PLL4 L register\n");
+	if (ret) {
+		dev_err_probe(&pdev->dev, ret,
+			      "failed to read PLL4 L register\n");
+		goto err_unclaim;
+	}
 	if (val == 0x12) {
 		slimbus_src.freq_tbl = clk_tbl_aif_osr_492;
 		mi2s_osr_src.freq_tbl = clk_tbl_aif_osr_492;
@@ -484,18 +515,64 @@ static int lcc_msm8960_probe(struct platform_device *pdev)
 	}
 	/* Enable PLL4 source on the LPASS Primary PLL Mux */
 	ret = regmap_write(regmap, 0xc4, 0x1);
+	if (ret) {
+		dev_err_probe(&pdev->dev, ret,
+			      "failed to select PLL4 on LPASS Primary PLL Mux\n");
+		goto err_unclaim;
+	}
+
+	ret = qcom_cc_really_probe(&pdev->dev, &lcc_msm8960_desc, regmap);
 	if (ret)
-		return dev_err_probe(&pdev->dev, ret,
-				     "failed to select PLL4 on LPASS Primary PLL Mux\n");
+		goto err_unclaim;
+
+	return 0;
+
+err_unclaim:
+	mutex_lock(&lcc_msm8960_bound_lock);
+	lcc_msm8960_bound = false;
+	mutex_unlock(&lcc_msm8960_bound_lock);
+	return ret;
+}
 
-	return qcom_cc_really_probe(&pdev->dev, &lcc_msm8960_desc, regmap);
+/*
+ * Clear the singleton bound flag so a future probe can succeed.
+ *
+ * .suppress_bind_attrs = true below blocks the sysfs bind/unbind path,
+ * which is the rebind race window we care about. However, the driver
+ * core can still call .remove via device removal (DT overlay removal,
+ * hot-unplug). Without clearing the flag here, the next probe of a
+ * fresh instance would fail with -EBUSY. The probe and remove on the
+ * same device are serialised by device_lock so this clear does not
+ * race the devm cleanup of the previous instance.
+ */
+static void lcc_msm8960_remove(struct platform_device *pdev)
+{
+	mutex_lock(&lcc_msm8960_bound_lock);
+	lcc_msm8960_bound = false;
+	mutex_unlock(&lcc_msm8960_bound_lock);
 }
 
 static struct platform_driver lcc_msm8960_driver = {
 	.probe		= lcc_msm8960_probe,
+	.remove		= lcc_msm8960_remove,
 	.driver		= {
 		.name	= "lcc-msm8960",
 		.of_match_table = lcc_msm8960_match_table,
+		/*
+		 * The probe path mutates file-static clk_rcg structures
+		 * (.freq_tbl pointers selected from the PLL4 L-register,
+		 * pxo_parent_data switched to cxo for MDM9615) that are
+		 * then registered by pointer through qcom_cc_really_probe().
+		 * A sysfs unbind + rebind would either race the previous
+		 * instance's devm teardown of those clocks or silently
+		 * leave pxo_parent_data stuck on its previous compatible's
+		 * setting (e.g. MDM9615 -> MSM8960 stuck on cxo). Block
+		 * sysfs bind / unbind to remove both hazards; non-sysfs
+		 * removal (DT overlay, hot-unplug) is serialised against
+		 * probe by device_lock so .remove just clears the singleton
+		 * flag and lets devm undo the clock registrations.
+		 */
+		.suppress_bind_attrs = true,
 	},
 };
 module_platform_driver(lcc_msm8960_driver);
-- 
2.43.0


