Return-Path: <linux-arm-msm+bounces-110706-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EAvsEYljHmrCiwkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110706-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 02 Jun 2026 07:00:57 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E2D1F6284A7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 02 Jun 2026 07:00:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 56834304EA17
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Jun 2026 04:57:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 956522DECCB;
	Tue,  2 Jun 2026 04:57:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=herrie.org header.i=@herrie.org header.b="Zo/Q4yOt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from outbound4.mail.transip.nl (outbound4.mail.transip.nl [136.144.136.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F8D92DC332;
	Tue,  2 Jun 2026 04:57:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=136.144.136.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780376249; cv=none; b=tmip/axDgavx0SEVf8xyUZ1vuWKZr71eBvYy7w3JGnT8p3WWZeP79rFWhiVTiZitKEnTRC4qbplrvPIjaXcaTabsWhFGQi+7JS4N2Ma/PFatUn/7W9XxeP0qspNTXeoHns0mVr478R8AlWhUd9G0d3t0iFv+TH0ozwA0q3uIV8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780376249; c=relaxed/simple;
	bh=oaFXf7RNftT9amEsu/HNy2itbS3cl3vHRsdQ+YqACgQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qBzGzBUld3L1xx7Kj+c8q5tduU0XHQcx7Um9p5jnfmgjWhaKLtH1UFSJ4rZE8LG0O7ERqASpO1EJ7NNj4rG6JRY0GC0vinHrNsqz7n3rAwnTLCfTbJYtrcFo7TDtKdDdHRrp58BK+3JM6txOzIi0LcAWdRIK9C0Bk2yKSihiP8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=herrie.org; spf=pass smtp.mailfrom=herrie.org; dkim=pass (2048-bit key) header.d=herrie.org header.i=@herrie.org header.b=Zo/Q4yOt; arc=none smtp.client-ip=136.144.136.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=herrie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=herrie.org
Received: from submission4.mail.transip.nl (unknown [10.103.8.155])
	by outbound4.mail.transip.nl (Postfix) with ESMTP id 4gTz0G1sPzzxNkM;
	Tue,  2 Jun 2026 06:50:06 +0200 (CEST)
Received: from herrie-desktop.. (180-93-184-31.ftth.glasoperator.nl [31.184.93.180])
	by submission4.mail.transip.nl (Postfix) with ESMTPA id 4gTz0F4z9Zz3R3nyb;
	Tue,  2 Jun 2026 06:50:05 +0200 (CEST)
From: Herman van Hazendonk <github.com@herrie.org>
To: sboyd@kernel.org
Cc: Herman van Hazendonk <github.com@herrie.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] clk: qcom: lcc-msm8960: re-apply PLL4 mux on resume
Date: Tue,  2 Jun 2026 06:50:01 +0200
Message-ID: <20260602045002.290918-4-github.com@herrie.org>
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
 s=transip-a; d=herrie.org; t=1780375805; h=from:subject:to:cc:
 references:in-reply-to:date:mime-version;
 bh=yzfoJ/GHFipTDbgWD2TALY01cWpaIJO4dQxXUd7AFqE=;
 b=Zo/Q4yOtTJcblMlfaRNFQNzGx6dRXNvP4fays1C1uaMCslGSw1X0Sq4Sc6YDdqLO69EIc/
 krPP92EsLGWDuVh1AFlb26RemIkX8IehOlF415V9H6DOO+t1XY2qIBDVuXXNROUj2eCVPR
 bZTjlGZ8GfjTdIrvmSOGpJFBpap0HFOZfZ9qi8cDgZNG0hBcFxeIAHukiUoF4S9ddx+xyX
 zgafFEABqvMchdW5Fwr2EE7rfNkVO8NWmu6jud4lD5g4X48NF1nxc7udTjzm3G/Tamzucw
 wfes+SJt4TswKZCaRPraT1/LsLcutFYgHC9XfhfApvfa7b0vE73g59DZvkwevg==
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
	TAGGED_FROM(0.00)[bounces-110706-lists,linux-arm-msm=lfdr.de];
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
X-Rspamd-Queue-Id: E2D1F6284A7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The LPASS power domain on the MSM8x60 family is collapsed during
system sleep, which resets the LPASS Primary PLL Mux register at 0xc4
to its hardware default of 0 (PXO). The probe path arms this register
to 0x1 (PLL4) and the rest of the LCC clock tree assumes that
selection; after the first suspend/resume cycle every LCC clock
silently returns sourced from PXO at 27 MHz, with no diagnostic, and
audio produces wrong rates until the next reboot.

Add a resume PM op that re-asserts PLL4 on the mux. The single
register write is idempotent on platforms that do not exhibit the
power-collapse (the mux is already at 0x1 from probe), so it is safe
to run unconditionally for all compatibles. Stash the regmap in
drvdata during probe so resume can write without walking the
clock-provider tree.

dev_err / raw errno are used here (not dev_err_probe) because resume
cannot defer.

Use pm_ptr(), not pm_sleep_ptr(), to assign the dev_pm_ops pointer.
pm_ptr() is the correct macro for conditionally compiling the .pm
struct pointer based on CONFIG_PM; pm_sleep_ptr() is intended for
gating individual function pointers inside the struct on
CONFIG_PM_SLEEP.

Signed-off-by: Herman van Hazendonk <github.com@herrie.org>
---
 drivers/clk/qcom/lcc-msm8960.c | 39 ++++++++++++++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/drivers/clk/qcom/lcc-msm8960.c b/drivers/clk/qcom/lcc-msm8960.c
index 1e0873ce1cc2..7bfb396b09e2 100644
--- a/drivers/clk/qcom/lcc-msm8960.c
+++ b/drivers/clk/qcom/lcc-msm8960.c
@@ -10,6 +10,7 @@
 #include <linux/platform_device.h>
 #include <linux/module.h>
 #include <linux/of.h>
+#include <linux/pm.h>
 #include <linux/clk-provider.h>
 #include <linux/regmap.h>
 
@@ -525,6 +526,13 @@ static int lcc_msm8960_probe(struct platform_device *pdev)
 	if (ret)
 		goto err_unclaim;
 
+	/*
+	 * Stash the regmap so lcc_msm8960_resume() can re-apply the
+	 * LPASS Primary PLL mux selection without having to walk the
+	 * clock-provider tree. qcom_cc_really_probe() does not touch
+	 * platform drvdata, so this is safe.
+	 */
+	platform_set_drvdata(pdev, regmap);
 	return 0;
 
 err_unclaim:
@@ -552,12 +560,43 @@ static void lcc_msm8960_remove(struct platform_device *pdev)
 	mutex_unlock(&lcc_msm8960_bound_lock);
 }
 
+/*
+ * The LPASS power domain on at least the MSM8x60 family is collapsed
+ * during system sleep, which resets the LPASS Primary PLL Mux at 0xc4
+ * to its hardware default of 0 (PXO). Without re-asserting PLL4 here
+ * every LCC clock would silently come back sourced from PXO at 27 MHz
+ * and audio would produce wrong rates until the next reboot. The
+ * single-register write is idempotent on platforms that do not exhibit
+ * the collapse (the mux is already at 0x1 from probe), so it is safe
+ * to run unconditionally.
+ *
+ * Resume cannot defer; log with dev_err and propagate the raw errno
+ * rather than dev_err_probe (which silences EPROBE_DEFER).
+ */
+static int lcc_msm8960_resume(struct device *dev)
+{
+	struct regmap *regmap = dev_get_drvdata(dev);
+	int ret;
+
+	ret = regmap_write(regmap, 0xc4, 0x1);
+	if (ret)
+		dev_err(dev,
+			"failed to re-select PLL4 on LPASS Primary PLL Mux on resume: %d\n",
+			ret);
+	return ret;
+}
+
+static const struct dev_pm_ops lcc_msm8960_pm_ops = {
+	SYSTEM_SLEEP_PM_OPS(NULL, lcc_msm8960_resume)
+};
+
 static struct platform_driver lcc_msm8960_driver = {
 	.probe		= lcc_msm8960_probe,
 	.remove		= lcc_msm8960_remove,
 	.driver		= {
 		.name	= "lcc-msm8960",
 		.of_match_table = lcc_msm8960_match_table,
+		.pm	= pm_ptr(&lcc_msm8960_pm_ops),
 		/*
 		 * The probe path mutates file-static clk_rcg structures
 		 * (.freq_tbl pointers selected from the PLL4 L-register,
-- 
2.43.0


