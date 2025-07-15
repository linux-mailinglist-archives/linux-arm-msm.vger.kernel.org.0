Return-Path: <linux-arm-msm+bounces-64947-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CA0FEB0530C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Jul 2025 09:26:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CB1B11881ACF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Jul 2025 07:25:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5491828A73E;
	Tue, 15 Jul 2025 07:19:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="jhfjTDB4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 444FC2D97B0
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Jul 2025 07:19:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752563977; cv=none; b=MFydcCrXvYsdyd/E5jgl1QIv92ZLdDRd2QZidXbF0uAj6FpfIRPRZ0XTTV0MSzs1hsZHSHVEzxmCE7E9O05FUpz1zqnYT1DXlJd5jxl/TUlE1yrZonZ9SMfizHk5CCWKBmxF/e8yYwBxtZOJdZgkRUAsoZRPADCMcK5tl0qPUdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752563977; c=relaxed/simple;
	bh=+lLREFl83l0g40C0XZboGLIIzlTO5YDf7qHiqDgyRf0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MXRRDOND0JX9aU1aTyyYMUc9Gfgj/k+bsMCfHWPjcMoFi6Mza4a4neHMZF1IqWYuDWyONbnpI1NVFzCfQc9zMCfiDIbLRlwlZZJKFzq+78gJaBRdKFVV/fCXl+hbPI9GY/by0O5Z6lvn5tKCov3i279ljIGg1wgjX4vaVTvT6Ws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=jhfjTDB4; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-60bf5a08729so9450532a12.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Jul 2025 00:19:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1752563971; x=1753168771; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hRsVBYN6XE92rZ75Qx6o32od4wa0wrMrjK8o4Kst6mI=;
        b=jhfjTDB4Fq9cId5/r6Sz5jWwFcxSzMTLqg9B/JBWb4OIAGGp/Pm/GvO0x51pmh5BJb
         xoQ0qH93L/Qdiw80i7SQlFZ8J2E9gvtYBKLOFitQz3xpR3U8fsbXKsSCJJPZU6x+NHTX
         9o8DJKLN83hs9kJwRu9wOrFFL2gV7Vd4wW5t3YUwOZLuHs698Sg80hYgsJGMFse7Gt9j
         7dg1eXXmcGqPgW+5+y4uvYRjtOOxBgB5yB9kQfvLM6bAzmWhh4NYJ9Ssj+Ok4EgabyYp
         t0dlSAwftp56ba5b7ybDwMzDiQruaQ3RstBK/Chx9Qz9qsf3Yl+2sEiInfggk8AQybyp
         oXfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752563971; x=1753168771;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hRsVBYN6XE92rZ75Qx6o32od4wa0wrMrjK8o4Kst6mI=;
        b=W46AnKbInazLk6SQmpPj8TFG8kXa7BrC7d95rrAAjRw/7eVkHjLzV3M2zpqtmmrRG+
         tVDftAGyRMZGfI9B9AJGSviapzX3n2HOqJ5GeHoK2g3hfr3ysMWgrnJz3mqTB9Hz3kN6
         4I5aPDi8j1rfOIQvxZE1GcGuH2mdHQxYpSxQtgqTCoqaIkejwyCcXnbblq62fA0J3vHt
         hZcs1UgWtNGRUbKFhVINLV5+0VxgWqYByxkGZaDAa1zBApkIbriwPABznseJhZNTSc7Y
         sFMlRX3TDQLmT5WtOpPA5KObm5aIXjk9u+0d7M9lJdh2q1jKjWKmiu8rL4m8eLoJRR7W
         1XhA==
X-Forwarded-Encrypted: i=1; AJvYcCVbpeAHzO4dBVkkpk7Ybwx9CFTe18T/FuhwLJImwt/mShTevdXxtgDq//EvTQk4JksohEeO7L9J6yqjv78+@vger.kernel.org
X-Gm-Message-State: AOJu0YztIE20Tr8v9uqQY5M/6hqZrI5Z2+FRftulrF2Kwgo8r4QhiGGP
	pPuv6Q6VN6UHQPbvItuSjNASWSya5toFG6ewd8CVzkXbMIzbAUC7YhvZzbW9biNaZJw=
X-Gm-Gg: ASbGncvdOIG2xIBWNnhBDbuukxjUf8Kauk/Bt+M/JUjXotjLtmp5XzXmDxBq9/hG7UH
	+MJukrAi2zCz1LhpERAKyTtQX054eceIIQU9p296tsUXdO9NB2RerFWnP1C25g/qMy3CqbcxDwO
	rDXN10KRn5YaSW3aNpXzjY5qmTLKInCdJRf8uvrkTFn1c+gtVLUTQ86fvSKDAMpR+NtB7gaw8T9
	NiCbTsjqWbp9IMeWJTxEPP1fa8RwUjKvq7q3/gKtin1305AsfABIvGQ2CgGQao96qFQWOcWOiNa
	It8wi4CeOlZzO2OWUAgowMOg0VXEi+iOnnT25VVcCCjF8Dq2DLA5j8Wpqk2ANRDkFeJtE71Ylkm
	pnW98q4DdL/vzvi39VAgmfhM4GwXmAzNT6FSNvH2LIeAcMZhbGavUTGR5
X-Google-Smtp-Source: AGHT+IEiinJ0TnBmrUGpiwUVk8k6prRwRulRnvyRXto3kpnY0fO/4NZxuKbRCdEijaZJc4zd23LahQ==
X-Received: by 2002:a50:f68c:0:b0:5f7:f55a:e5c8 with SMTP id 4fb4d7f45d1cf-611e84ae931mr9692124a12.21.1752563970783;
        Tue, 15 Jul 2025 00:19:30 -0700 (PDT)
Received: from otso.local (212095005088.public.telering.at. [212.95.5.88])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-611c976fcfcsm6873715a12.66.2025.07.15.00.19.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jul 2025 00:19:30 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Tue, 15 Jul 2025 09:19:11 +0200
Subject: [PATCH v3 11/11] clk: qcom: Add Video Clock controller (VIDEOCC)
 driver for Milos
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250715-sm7635-clocks-v3-11-18f9faac4984@fairphone.com>
References: <20250715-sm7635-clocks-v3-0-18f9faac4984@fairphone.com>
In-Reply-To: <20250715-sm7635-clocks-v3-0-18f9faac4984@fairphone.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752563952; l=13554;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=+lLREFl83l0g40C0XZboGLIIzlTO5YDf7qHiqDgyRf0=;
 b=lPFOuikUGEcWGF2TDoL9R2YgZi9omblSGxa8DqqaYMCYp7DSdYEOabXXW+LjIqlOu1k3pN167
 CS8enigypYdBxJSLEHszu0sbQW8EMiiA5wlYlP2SxwRgxuQSSGPR9Qa
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Add support for the video clock controller found on Milos (e.g. SM7635)
based devices.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 drivers/clk/qcom/Kconfig         |  11 ++
 drivers/clk/qcom/Makefile        |   1 +
 drivers/clk/qcom/videocc-milos.c | 403 +++++++++++++++++++++++++++++++++++++++
 3 files changed, 415 insertions(+)

diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
index 9063ee3831efd2dad99611cb90ea79e0cd04f8bf..774e152bc154293b8409e5af52ff944964ce73fb 100644
--- a/drivers/clk/qcom/Kconfig
+++ b/drivers/clk/qcom/Kconfig
@@ -1394,6 +1394,17 @@ config SM_VIDEOCC_7150
 	  Say Y if you want to support video devices and functionality such as
 	  video encode and decode.
 
+config SM_VIDEOCC_MILOS
+	tristate "Milos Video Clock Controller"
+	depends on ARM64 || COMPILE_TEST
+	select SM_GCC_MILOS
+	select QCOM_GDSC
+	help
+	  Support for the video clock controller on Qualcomm Technologies, Inc.
+	  Milos devices.
+	  Say Y if you want to support video devices and functionality such as
+	  video encode/decode.
+
 config SM_VIDEOCC_8150
 	tristate "SM8150 Video Clock Controller"
 	depends on ARM64 || COMPILE_TEST
diff --git a/drivers/clk/qcom/Makefile b/drivers/clk/qcom/Makefile
index 07ab4128e9d30012127ba3a138c9f18d117cb787..cf978290516a05c999ff1a53e5d6820658bc4b6c 100644
--- a/drivers/clk/qcom/Makefile
+++ b/drivers/clk/qcom/Makefile
@@ -176,6 +176,7 @@ obj-$(CONFIG_SM_VIDEOCC_8250) += videocc-sm8250.o
 obj-$(CONFIG_SM_VIDEOCC_8350) += videocc-sm8350.o
 obj-$(CONFIG_SM_VIDEOCC_8450) += videocc-sm8450.o
 obj-$(CONFIG_SM_VIDEOCC_8550) += videocc-sm8550.o
+obj-$(CONFIG_SM_VIDEOCC_MILOS) += videocc-milos.o
 obj-$(CONFIG_SPMI_PMIC_CLKDIV) += clk-spmi-pmic-div.o
 obj-$(CONFIG_KPSS_XCC) += kpss-xcc.o
 obj-$(CONFIG_QCOM_HFPLL) += hfpll.o
diff --git a/drivers/clk/qcom/videocc-milos.c b/drivers/clk/qcom/videocc-milos.c
new file mode 100644
index 0000000000000000000000000000000000000000..998301e0ba887e192b2a3873eb81fa88962834cf
--- /dev/null
+++ b/drivers/clk/qcom/videocc-milos.c
@@ -0,0 +1,403 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2023, Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) 2025, Luca Weiss <luca.weiss@fairphone.com>
+ */
+
+#include <linux/clk-provider.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+
+#include <dt-bindings/clock/qcom,milos-videocc.h>
+
+#include "clk-alpha-pll.h"
+#include "clk-branch.h"
+#include "clk-rcg.h"
+#include "clk-regmap.h"
+#include "clk-regmap-divider.h"
+#include "common.h"
+#include "gdsc.h"
+#include "reset.h"
+
+/* Need to match the order of clocks in DT binding */
+enum {
+	DT_BI_TCXO,
+	DT_BI_TCXO_AO,
+	DT_SLEEP_CLK,
+	DT_IFACE,
+};
+
+enum {
+	P_BI_TCXO,
+	P_SLEEP_CLK,
+	P_VIDEO_CC_PLL0_OUT_MAIN,
+};
+
+static const struct pll_vco lucid_ole_vco[] = {
+	{ 249600000, 2300000000, 0 },
+};
+
+/* 604.8 MHz Configuration */
+static const struct alpha_pll_config video_cc_pll0_config = {
+	.l = 0x1f,
+	.alpha = 0x8000,
+	.config_ctl_val = 0x20485699,
+	.config_ctl_hi_val = 0x00182261,
+	.config_ctl_hi1_val = 0x82aa299c,
+	.test_ctl_val = 0x00000000,
+	.test_ctl_hi_val = 0x00000003,
+	.test_ctl_hi1_val = 0x00009000,
+	.test_ctl_hi2_val = 0x00000034,
+	.user_ctl_val = 0x00000000,
+	.user_ctl_hi_val = 0x00000005,
+};
+
+static struct clk_alpha_pll video_cc_pll0 = {
+	.offset = 0x0,
+	.config = &video_cc_pll0_config,
+	.vco_table = lucid_ole_vco,
+	.num_vco = ARRAY_SIZE(lucid_ole_vco),
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_OLE],
+	.clkr = {
+		.hw.init = &(const struct clk_init_data) {
+			.name = "video_cc_pll0",
+			.parent_data = &(const struct clk_parent_data) {
+				.index = DT_BI_TCXO,
+			},
+			.num_parents = 1,
+			.ops = &clk_alpha_pll_lucid_evo_ops,
+		},
+	},
+};
+
+static const struct parent_map video_cc_parent_map_0[] = {
+	{ P_BI_TCXO, 0 },
+};
+
+static const struct clk_parent_data video_cc_parent_data_0[] = {
+	{ .index = DT_BI_TCXO },
+};
+
+static const struct clk_parent_data video_cc_parent_data_0_ao[] = {
+	{ .index = DT_BI_TCXO_AO },
+};
+
+static const struct parent_map video_cc_parent_map_1[] = {
+	{ P_BI_TCXO, 0 },
+	{ P_VIDEO_CC_PLL0_OUT_MAIN, 1 },
+};
+
+static const struct clk_parent_data video_cc_parent_data_1[] = {
+	{ .index = DT_BI_TCXO },
+	{ .hw = &video_cc_pll0.clkr.hw },
+};
+
+static const struct parent_map video_cc_parent_map_2[] = {
+	{ P_SLEEP_CLK, 0 },
+};
+
+static const struct clk_parent_data video_cc_parent_data_2_ao[] = {
+	{ .index = DT_SLEEP_CLK },
+};
+
+static const struct freq_tbl ftbl_video_cc_ahb_clk_src[] = {
+	F(19200000, P_BI_TCXO, 1, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 video_cc_ahb_clk_src = {
+	.cmd_rcgr = 0x8030,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = video_cc_parent_map_0,
+	.freq_tbl = ftbl_video_cc_ahb_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "video_cc_ahb_clk_src",
+		.parent_data = video_cc_parent_data_0_ao,
+		.num_parents = ARRAY_SIZE(video_cc_parent_data_0_ao),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_video_cc_mvs0_clk_src[] = {
+	F(604800000, P_VIDEO_CC_PLL0_OUT_MAIN, 1, 0, 0),
+	F(720000000, P_VIDEO_CC_PLL0_OUT_MAIN, 1, 0, 0),
+	F(1014000000, P_VIDEO_CC_PLL0_OUT_MAIN, 1, 0, 0),
+	F(1098000000, P_VIDEO_CC_PLL0_OUT_MAIN, 1, 0, 0),
+	F(1332000000, P_VIDEO_CC_PLL0_OUT_MAIN, 1, 0, 0),
+	F(1656000000, P_VIDEO_CC_PLL0_OUT_MAIN, 1, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 video_cc_mvs0_clk_src = {
+	.cmd_rcgr = 0x8000,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = video_cc_parent_map_1,
+	.freq_tbl = ftbl_video_cc_mvs0_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "video_cc_mvs0_clk_src",
+		.parent_data = video_cc_parent_data_1,
+		.num_parents = ARRAY_SIZE(video_cc_parent_data_1),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_video_cc_sleep_clk_src[] = {
+	F(32000, P_SLEEP_CLK, 1, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 video_cc_sleep_clk_src = {
+	.cmd_rcgr = 0x8128,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = video_cc_parent_map_2,
+	.freq_tbl = ftbl_video_cc_sleep_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "video_cc_sleep_clk_src",
+		.parent_data = video_cc_parent_data_2_ao,
+		.num_parents = ARRAY_SIZE(video_cc_parent_data_2_ao),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static struct clk_rcg2 video_cc_xo_clk_src = {
+	.cmd_rcgr = 0x810c,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = video_cc_parent_map_0,
+	.freq_tbl = ftbl_video_cc_ahb_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "video_cc_xo_clk_src",
+		.parent_data = video_cc_parent_data_0,
+		.num_parents = ARRAY_SIZE(video_cc_parent_data_0),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static struct clk_regmap_div video_cc_mvs0_div_clk_src = {
+	.reg = 0x80c4,
+	.shift = 0,
+	.width = 4,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "video_cc_mvs0_div_clk_src",
+		.parent_hws = (const struct clk_hw*[]) {
+			&video_cc_mvs0_clk_src.clkr.hw,
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_regmap_div_ro_ops,
+	},
+};
+
+static struct clk_regmap_div video_cc_mvs0c_div2_div_clk_src = {
+	.reg = 0x8070,
+	.shift = 0,
+	.width = 4,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "video_cc_mvs0c_div2_div_clk_src",
+		.parent_hws = (const struct clk_hw*[]) {
+			&video_cc_mvs0_clk_src.clkr.hw,
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_regmap_div_ro_ops,
+	},
+};
+
+static struct clk_branch video_cc_mvs0_clk = {
+	.halt_reg = 0x80b8,
+	.halt_check = BRANCH_HALT_VOTED,
+	.hwcg_reg = 0x80b8,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x80b8,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "video_cc_mvs0_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&video_cc_mvs0_div_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch video_cc_mvs0_shift_clk = {
+	.halt_reg = 0x8144,
+	.halt_check = BRANCH_HALT_VOTED,
+	.hwcg_reg = 0x8144,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x8144,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "video_cc_mvs0_shift_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&video_cc_xo_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch video_cc_mvs0c_clk = {
+	.halt_reg = 0x8064,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x8064,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "video_cc_mvs0c_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&video_cc_mvs0c_div2_div_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch video_cc_mvs0c_shift_clk = {
+	.halt_reg = 0x8148,
+	.halt_check = BRANCH_HALT_VOTED,
+	.hwcg_reg = 0x8148,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x8148,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "video_cc_mvs0c_shift_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&video_cc_xo_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct gdsc video_cc_mvs0c_gdsc = {
+	.gdscr = 0x804c,
+	.en_rest_wait_val = 0x2,
+	.en_few_wait_val = 0x2,
+	.clk_dis_wait_val = 0x6,
+	.pd = {
+		.name = "video_cc_mvs0c_gdsc",
+	},
+	.pwrsts = PWRSTS_OFF_ON,
+	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
+};
+
+static struct gdsc video_cc_mvs0_gdsc = {
+	.gdscr = 0x80a4,
+	.en_rest_wait_val = 0x2,
+	.en_few_wait_val = 0x2,
+	.clk_dis_wait_val = 0x6,
+	.pd = {
+		.name = "video_cc_mvs0_gdsc",
+	},
+	.pwrsts = PWRSTS_OFF_ON,
+	.parent = &video_cc_mvs0c_gdsc.pd,
+	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE | HW_CTRL_TRIGGER,
+};
+
+static struct clk_regmap *video_cc_milos_clocks[] = {
+	[VIDEO_CC_AHB_CLK_SRC] = &video_cc_ahb_clk_src.clkr,
+	[VIDEO_CC_MVS0_CLK] = &video_cc_mvs0_clk.clkr,
+	[VIDEO_CC_MVS0_CLK_SRC] = &video_cc_mvs0_clk_src.clkr,
+	[VIDEO_CC_MVS0_DIV_CLK_SRC] = &video_cc_mvs0_div_clk_src.clkr,
+	[VIDEO_CC_MVS0_SHIFT_CLK] = &video_cc_mvs0_shift_clk.clkr,
+	[VIDEO_CC_MVS0C_CLK] = &video_cc_mvs0c_clk.clkr,
+	[VIDEO_CC_MVS0C_DIV2_DIV_CLK_SRC] = &video_cc_mvs0c_div2_div_clk_src.clkr,
+	[VIDEO_CC_MVS0C_SHIFT_CLK] = &video_cc_mvs0c_shift_clk.clkr,
+	[VIDEO_CC_PLL0] = &video_cc_pll0.clkr,
+	[VIDEO_CC_SLEEP_CLK_SRC] = &video_cc_sleep_clk_src.clkr,
+	[VIDEO_CC_XO_CLK_SRC] = &video_cc_xo_clk_src.clkr,
+};
+
+static struct gdsc *video_cc_milos_gdscs[] = {
+	[VIDEO_CC_MVS0C_GDSC] = &video_cc_mvs0c_gdsc,
+	[VIDEO_CC_MVS0_GDSC] = &video_cc_mvs0_gdsc,
+};
+
+static const struct qcom_reset_map video_cc_milos_resets[] = {
+	[VIDEO_CC_INTERFACE_BCR] = { 0x80f0 },
+	[VIDEO_CC_MVS0_BCR] = { 0x80a0 },
+	[VIDEO_CC_MVS0C_CLK_ARES] = { 0x8064, 2 },
+	[VIDEO_CC_MVS0C_BCR] = { 0x8048 },
+};
+
+static struct clk_alpha_pll *video_cc_milos_plls[] = {
+	&video_cc_pll0,
+};
+
+static u32 video_cc_milos_critical_cbcrs[] = {
+	0x80f4, /* VIDEO_CC_AHB_CLK */
+	0x8140, /* VIDEO_CC_SLEEP_CLK */
+	0x8124, /* VIDEO_CC_XO_CLK */
+};
+
+static const struct regmap_config video_cc_milos_regmap_config = {
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.max_register = 0x9f50,
+	.fast_io = true,
+};
+
+static struct qcom_cc_driver_data video_cc_milos_driver_data = {
+	.alpha_plls = video_cc_milos_plls,
+	.num_alpha_plls = ARRAY_SIZE(video_cc_milos_plls),
+	.clk_cbcrs = video_cc_milos_critical_cbcrs,
+	.num_clk_cbcrs = ARRAY_SIZE(video_cc_milos_critical_cbcrs),
+};
+
+static struct qcom_cc_desc video_cc_milos_desc = {
+	.config = &video_cc_milos_regmap_config,
+	.clks = video_cc_milos_clocks,
+	.num_clks = ARRAY_SIZE(video_cc_milos_clocks),
+	.resets = video_cc_milos_resets,
+	.num_resets = ARRAY_SIZE(video_cc_milos_resets),
+	.gdscs = video_cc_milos_gdscs,
+	.num_gdscs = ARRAY_SIZE(video_cc_milos_gdscs),
+	.use_rpm = true,
+	.driver_data = &video_cc_milos_driver_data,
+};
+
+static const struct of_device_id video_cc_milos_match_table[] = {
+	{ .compatible = "qcom,milos-videocc" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, video_cc_milos_match_table);
+
+static int video_cc_milos_probe(struct platform_device *pdev)
+{
+	return qcom_cc_probe(pdev, &video_cc_milos_desc);
+}
+
+static struct platform_driver video_cc_milos_driver = {
+	.probe = video_cc_milos_probe,
+	.driver = {
+		.name = "video_cc-milos",
+		.of_match_table = video_cc_milos_match_table,
+	},
+};
+
+module_platform_driver(video_cc_milos_driver);
+
+MODULE_DESCRIPTION("QTI VIDEO_CC Milos Driver");
+MODULE_LICENSE("GPL");

-- 
2.50.1


