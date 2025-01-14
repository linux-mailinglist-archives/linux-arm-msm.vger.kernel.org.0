Return-Path: <linux-arm-msm+bounces-45034-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BE5BA110D5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jan 2025 20:06:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D746E3A5C7A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jan 2025 19:06:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C24241FC7C8;
	Tue, 14 Jan 2025 19:06:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="E/ZX6RRn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE2791F9AAB
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jan 2025 19:06:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736881578; cv=none; b=EWSTHWGIMFG8apPjBBf3WZ9KsLF2l7MvHpOGP0hMz9JafvoDLTPmvwnsRhyC/e250qKQZ5aOm9OvgxzB46TNR7Yg3WsUmSJfuYFqmsZdlbG2v+0Ga7Y7zxU+NXQO5sYzATVFSaOXb6YcjsEvacWTAhEb2XTv5QeOCq2gx7nymNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736881578; c=relaxed/simple;
	bh=jEqRHvLrIAETyxzwLGglcWjxrVPQ6vVluYulADe2rgk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nC37oc6migwyUp23rxY0HkkaU7V8ZeRmmzCDXs7m5VeurSwaJcdFCGcAqzjW2JR5JiiVu5f0kbVhrQyXmCGz8chph5yE24TQM8HsPTPTmI4Sx9p4YyZk0MMUG4j41xkBbVV2ZSYLGpr3/tG0Y1gNgszzKkn4qT3uulBktUIBayc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=E/ZX6RRn; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4363299010dso6322465e9.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jan 2025 11:06:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736881575; x=1737486375; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ug2wj18cjREimSMJl3DTD/Gr3H2+vfbGZ8jWXir0LFQ=;
        b=E/ZX6RRnaeHTlPrh7dzV75UEMglF3MZfaWajIhhp5tVMHjzjHk/Nk8GclBAPywsE+F
         Pfx3bI5eGsheTOBWK07TGau1YTHSWyBbe84wElRYH5/ecKWRlUl3obGsJYrP+hLE1bI4
         WhjhF78raw91uYfR9jh6KMqe0+oFZnEtH5Kgxk/7lkF07GOm+T7hTFf4n4s4AEMMhhXe
         AsBkfWwZI1q0Sm3Bd680N5/ZrF6gqoPn6GlzWfAKPKva8YuYyZgRa2OQ2JjvfY4oyV3K
         gCBBlhrtqfgnzForrUOkUJhSd6LtazC5fQzOr6BmTBfictuoxbspqLH2aDy0HznFyEer
         sg+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736881575; x=1737486375;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ug2wj18cjREimSMJl3DTD/Gr3H2+vfbGZ8jWXir0LFQ=;
        b=rfCpule1s0LUPNKSfMQrvhI3o2A3nqQ/gDzgV+3C3XLYMidsDMLkvE8yW2iBpcCr5P
         CM+DWJ9JVdaR1ya9/Oe2p6PoP/QG9wp2HcKswRnUFQAqFHQKG/O0Ag4Fju8EEtCwp1GM
         9zgQlenBQ+F6yb0OIpqyRF5k/SxFxbNefTYBArCobAyePr9wT9j/IXIPtg1TfJCTxHqO
         h97jVsA/4i98HfJZC1QDMqQPIYkCDhTagk8UMC7eBE34+XUPP576Q9E/kBbwXyFlbQP6
         CfNtpI+L7RHoooy5x35fBYQWU4UdBONfXMDfv0hKlhzG6V27KIte/J9rkd0tmZ0bFqLb
         6oXA==
X-Forwarded-Encrypted: i=1; AJvYcCWdFAt8XQ47wKvmRltH6i6E3x5ZHXFbIfKjNYHxaXOA+YZ4B2AqGg15M/tGWuNBJklq0vrXtTbYgzevVEyf@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6JVxgv+6iupqlWvWB84Llr+bd2zf7/BuRcLAwtCIZbjo3MuGm
	Wsb2Cc0+AFABsAsMdbrnHEfWS6TSj65XlzlPtjlQeop4t+QTq2u0EoYipFKwmhc=
X-Gm-Gg: ASbGncsYuEJwBs4xtdSGlefzkcrz+JoUQJJV4jyWXEP84bfr/7uaVM1xMXUjKa/PILM
	RWLvUkH52RqaIKv8JTcmTwdsZYYuW4meLCTVUdwiHQ7h9ZyVtzgRoT8i3y5r5lbhvSwca+/Vd5H
	xrWl3IFjQwocUDlyiEi9Du5B+MQqmL/PRfXlM2/n8vXcrs4cpBmBZiLgQ/NoNjKIEMvlIjIfrB8
	Yfc5AE9rtAONCD6evmcfBmHdGzTYi+kY10ILamJKw73roE4I7hWzdLhLmqZVjrhkS+iCYI=
X-Google-Smtp-Source: AGHT+IFImMOmtgZS9Sl5xUd+t9teQiBmkHvNXwnB0+XwZRB4xxUckm9dhGwsh72cuUI2ybXH0UMA/w==
X-Received: by 2002:a5d:648f:0:b0:385:f479:ef46 with SMTP id ffacd0b85a97d-38a87310d7bmr8399078f8f.13.1736881575209;
        Tue, 14 Jan 2025 11:06:15 -0800 (PST)
Received: from krzk-bin.. ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a8e4c1b44sm15771296f8f.90.2025.01.14.11.06.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jan 2025 11:06:14 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2] clk: Use str_enable_disable-like helpers
Date: Tue, 14 Jan 2025 20:06:12 +0100
Message-ID: <20250114190612.846696-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace ternary (condition ? "enable" : "disable") syntax with helpers
from string_choices.h because:
1. Simple function call with one argument is easier to read.  Ternary
   operator has three arguments and with wrapping might lead to quite
   long code.
2. Is slightly shorter thus also easier to read.
3. It brings uniformity in the text - same string.
4. Allows deduping by the linker, which results in a smaller binary
   file.

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Changes in v2:
1. Also: drivers/clk/clk-xgene.c
2. Rb tag
---
 drivers/clk/bcm/clk-kona.c  | 3 ++-
 drivers/clk/clk-nomadik.c   | 5 +++--
 drivers/clk/clk-xgene.c     | 4 ++--
 drivers/clk/qcom/clk-rpmh.c | 3 ++-
 4 files changed, 9 insertions(+), 6 deletions(-)

diff --git a/drivers/clk/bcm/clk-kona.c b/drivers/clk/bcm/clk-kona.c
index ec5749e301ba..2b0ea882f1e4 100644
--- a/drivers/clk/bcm/clk-kona.c
+++ b/drivers/clk/bcm/clk-kona.c
@@ -10,6 +10,7 @@
 #include <linux/io.h>
 #include <linux/kernel.h>
 #include <linux/clk-provider.h>
+#include <linux/string_choices.h>
 
 /*
  * "Policies" affect the frequencies of bus clocks provided by a
@@ -502,7 +503,7 @@ static int clk_gate(struct ccu_data *ccu, const char *name,
 		return 0;
 
 	pr_err("%s: failed to %s gate for %s\n", __func__,
-		enable ? "enable" : "disable", name);
+		str_enable_disable(enable), name);
 
 	return -EIO;
 }
diff --git a/drivers/clk/clk-nomadik.c b/drivers/clk/clk-nomadik.c
index 06245681dac7..f3a73ac5a1b9 100644
--- a/drivers/clk/clk-nomadik.c
+++ b/drivers/clk/clk-nomadik.c
@@ -17,6 +17,7 @@
 #include <linux/debugfs.h>
 #include <linux/seq_file.h>
 #include <linux/spinlock.h>
+#include <linux/string_choices.h>
 #include <linux/reboot.h>
 
 /*
@@ -116,9 +117,9 @@ static void __init nomadik_src_init(void)
 
 	val = readl(src_base + SRC_XTALCR);
 	pr_info("SXTALO is %s\n",
-		(val & SRC_XTALCR_SXTALDIS) ? "disabled" : "enabled");
+		str_enabled_disabled(val & SRC_XTALCR_SXTALDIS));
 	pr_info("MXTAL is %s\n",
-		(val & SRC_XTALCR_MXTALSTAT) ? "enabled" : "disabled");
+		str_enabled_disabled(val & SRC_XTALCR_MXTALSTAT));
 	if (of_property_read_bool(np, "disable-sxtalo")) {
 		/* The machine uses an external oscillator circuit */
 		val |= SRC_XTALCR_SXTALDIS;
diff --git a/drivers/clk/clk-xgene.c b/drivers/clk/clk-xgene.c
index 0c3d0cee98c8..96946a8e2854 100644
--- a/drivers/clk/clk-xgene.c
+++ b/drivers/clk/clk-xgene.c
@@ -7,6 +7,7 @@
  */
 #include <linux/module.h>
 #include <linux/spinlock.h>
+#include <linux/string_choices.h>
 #include <linux/io.h>
 #include <linux/of.h>
 #include <linux/clkdev.h>
@@ -520,8 +521,7 @@ static int xgene_clk_is_enabled(struct clk_hw *hw)
 		data = xgene_clk_read(pclk->param.csr_reg +
 					pclk->param.reg_clk_offset);
 		pr_debug("%s clock is %s\n", clk_hw_get_name(hw),
-			data & pclk->param.reg_clk_mask ? "enabled" :
-							"disabled");
+			str_enabled_disabled(data & pclk->param.reg_clk_mask));
 	} else {
 		return 1;
 	}
diff --git a/drivers/clk/qcom/clk-rpmh.c b/drivers/clk/qcom/clk-rpmh.c
index 18de31889525..c7675930fde1 100644
--- a/drivers/clk/qcom/clk-rpmh.c
+++ b/drivers/clk/qcom/clk-rpmh.c
@@ -9,6 +9,7 @@
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
+#include <linux/string_choices.h>
 #include <soc/qcom/cmd-db.h>
 #include <soc/qcom/rpmh.h>
 #include <soc/qcom/tcs.h>
@@ -206,7 +207,7 @@ static int clk_rpmh_aggregate_state_send_command(struct clk_rpmh *c,
 		c->state = c->valid_state_mask;
 
 	WARN(1, "clk: %s failed to %s\n", c->res_name,
-	     enable ? "enable" : "disable");
+	     str_enable_disable(enable));
 	return ret;
 }
 
-- 
2.43.0


