Return-Path: <linux-arm-msm+bounces-44995-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A846A104C3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jan 2025 11:56:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 843E91885F56
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jan 2025 10:56:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF3CB28EC63;
	Tue, 14 Jan 2025 10:56:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="f5FDdLXo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B705284A7C
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jan 2025 10:56:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736852184; cv=none; b=WuqAt4RPQeKq6Z5g2VTXQMxMrADokceOrBDcJbwiMYmEKWRdYZgfgy9ZsJKZEizLoUo0Cx8nGFLzqhqCZD4T7OOyEdQqmJbVzt8uhaEO0jq+eGTXk83qKilLOHf39ZyAiB1i7w1w4KQYQXBqNX/z+TkOj5Z+gkXW2LZ+dok98nc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736852184; c=relaxed/simple;
	bh=1hmd0MyMkQMTbVa+ERj+P7pc6GuuTSoTkyZlJUbbMm4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=d4uwA0y76Ah4qQunnMIZ1TjaxmwS0DiBFywYp84Q0dyXacFd3JcGMrqPkj3L80/kZza7t90f5XhUBTOveMB+9d2zdBkR8nwdfMeALqpm04Mtv1ki2ZTAFIlzR4v96pAiU5pxC0ooDTk5E3brTwkd+OXoI1kyom+SUWqq7ifPtFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=f5FDdLXo; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-5d3cd821c60so964259a12.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jan 2025 02:56:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736852181; x=1737456981; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4rykRosxrDs/XntXu5KrgDY2INQy7eN85k18sGRgzP0=;
        b=f5FDdLXonOBBHHvU0zNmU8Iym2H6Vtvd2uzzv/6zFLrctZHrD4eAeN8x8QX89tsEm6
         eI3m+b4hdj70m48/PTE+U0UCXObdbCU/XkjrcZXBllXxroT3qnk6yqPrcHwPHCJAjEfW
         AzHROU2FLa6R4Zns06G77F/m0x10eXB8FzH99KePn7F5DYlon+wcj0ly/9zhOFaYbvLF
         XQMtJRX8KglW1S4wgozQN5bgB01wnhmWi4KrzpQYw4AXndz/sIlPhTgLTwkAX7pq4552
         FEqxJnIClsstOh0Ti81gDXmvc71NH2tufJb/3FX9E60IEU8w4il1KLp3ZNA2sIs/r/tW
         0Djw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736852181; x=1737456981;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4rykRosxrDs/XntXu5KrgDY2INQy7eN85k18sGRgzP0=;
        b=nprcfrxuTDcq9WxMKsp2ITMCqflTxLljvxlCuMiZPxIaC0+dep/L2fkoDj62ad8lzc
         poiXP3IZY50YIk1JFYRfEt0r7NIRQIo1V5mLZhJbE3vH7uzRxUTjIdF+r4MwLwO0X3t1
         feRQMu3M99CbuiZXQ9k2NDguSIrYWftHYxToSdLqhASYBiAeVRivdKdScw2khS11cxgn
         cinYyDmB11vgAHcCSnABRDdD9jw0JrA//O+t70viBLc2c8AcNsPvXldD2cy+2pgYp55/
         +yaJNIfoJtUt2cVOzQcVR13Zt9Lv0tyByTxgSwK2MUvLuYFo3gm5xYxpHCZwjzgALt/D
         tfuA==
X-Forwarded-Encrypted: i=1; AJvYcCXZHETGtRT1l5BSWW9u8kFVvSsY2Z8GVzXrtHvk0WNO+zrkwkkiw8nPdhqKcQE43jHyZzlpGDlbMuAyjGPm@vger.kernel.org
X-Gm-Message-State: AOJu0YwS+we1MXdhxwy7Me9SdZ/zy00RbLuFRzqp8AawR9gz0UtSZPlP
	+fXoCHkWzFnS/4Rgzbs/5lyvB0U84kAQoSpWdERQ8oV/YFccqdbDaA8+Ul4q8XM=
X-Gm-Gg: ASbGnctNRj6qLWz+goTZchAAanagcuLxTwB5wtxBWtlZAYXXwSg3wPCK9JXOfwm2Cru
	V9WaRdhwzku4Ax4eoc4Os0AgdS/+5FAVojqv7VehwKT4qfP/OwXVgVuJW0SEzO1Ji6JMe/B0Lqf
	1PzFJMrsjXBI7Qsr/DGeHkwZyC0OXlDQ7zTTwyZeGKgKwjyI1JXX1MahlhutwYSW9MzYQH6rBTY
	xyImI4u3W7nLaL4ZeJ0AxtC6dZcl5CKPZJa07yFsuENQ4H62k6W0ae9zqB1AyLV1ApNyYM=
X-Google-Smtp-Source: AGHT+IFVeBR38XvGrfM1ABZ8o3cSy39ubNwiQmJTMlI/28V9aP4xs9GINfaB9e0nRKdDsH7KYOVo0g==
X-Received: by 2002:a05:6402:1f4c:b0:5d3:fdf5:4b28 with SMTP id 4fb4d7f45d1cf-5d972e88f88mr8233931a12.10.1736852181413;
        Tue, 14 Jan 2025 02:56:21 -0800 (PST)
Received: from krzk-bin.. ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d9904a40e8sm6118257a12.76.2025.01.14.02.56.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jan 2025 02:56:20 -0800 (PST)
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
Subject: [PATCH] clk: Use str_enable_disable-like helpers
Date: Tue, 14 Jan 2025 11:56:18 +0100
Message-ID: <20250114105618.273302-1-krzysztof.kozlowski@linaro.org>
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

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/clk/bcm/clk-kona.c  | 3 ++-
 drivers/clk/clk-nomadik.c   | 5 +++--
 drivers/clk/qcom/clk-rpmh.c | 3 ++-
 3 files changed, 7 insertions(+), 4 deletions(-)

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


