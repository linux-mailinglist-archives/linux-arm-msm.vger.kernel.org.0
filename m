Return-Path: <linux-arm-msm+bounces-63619-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 47F60AF8917
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Jul 2025 09:18:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EF91F4A4029
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Jul 2025 07:18:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0BFBF27E1DC;
	Fri,  4 Jul 2025 07:17:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="BWInGkUc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D21A27EC7C
	for <linux-arm-msm@vger.kernel.org>; Fri,  4 Jul 2025 07:17:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751613450; cv=none; b=lbUkKSwrhwneymnZqaqWLGVhcNW6a1bKdr/lP7XJClhym5TPMA9Kytqd0K8pV3Pl/mslxB3Bkmzu9TKsDb3hiIXVDiLvINGRqUEHFzqpjsyYP/E4Egby5T883yQFV1B3Eo74XwAhiQVYtFZL5OdHKTnJrqQhU2FTiJodY6UHhYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751613450; c=relaxed/simple;
	bh=CFa5Xfk1nfkg6tUrH3CtcpwD24L3ZwFkIBoxbhnEYeY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PgK1m+bBJyml3t4gfZQdKb6mSNb7/p9bXc466wE9Sk592iIse4zMJq+aa3Sz++jnvsWkK967dqZBo7FwjOGLBpukwbs918E3Om69zcTBZ3/3tR+vsvlKBWfmS/moAbf8JnNFYYsim7Q/E4cKXS59h3WSb8or6YDr3KHdCG3IYkY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=BWInGkUc; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-ae0d758c3a2so103282766b.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 04 Jul 2025 00:17:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1751613443; x=1752218243; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3mhU3d9i+l+k0Zt7wgwW/HST1zYHmeT8DSvYQtYcUOk=;
        b=BWInGkUcfAmJtE5FEr+vI7Y/B4eAYqc6oNvPtHTLbL39WL0V/EpJpYkRLTJayVZAey
         yKUp4KyBtP99JbUZ8pxc0nwYl/2+d3nL/oSqqmRmssL+OgWSu2rDj0WzThGc2l77ljNL
         hv+PIJRJUHwjLVZrLegCLeLePBZZXRYIOFREAt26SZNXtnIS4eYVhu/gaQLlDyOQD/Dp
         2wBSWZbhMRTA92CmLpk5GBbLGP0NaS4+bGFGKeRo4qJ3w6TCj33c32Ee6OwSWIaNk1c7
         0lZg8OA8RTtxVKEK+XDMgdkoxNxxURbYCgZ801/eJWhyd3dkcFgVJCxCAerC8e7Ui8SK
         L31w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751613443; x=1752218243;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3mhU3d9i+l+k0Zt7wgwW/HST1zYHmeT8DSvYQtYcUOk=;
        b=hrcBhJvSJWPNG3TtuPSUngq8ISgZlSVR9sdxOVKO+jmpBX2QL0w+jwHAXmdBDv4kqc
         fjdx5dfm2KhXilmtOIynC0DRCRCzAAxYXLGxk5+I6JXNh8zLmMOETt8Do3WLkibzs2Dx
         zawouRUWhWAwF2i32smBPhOI/APPTiXGuUGIMYH9AxkwI8rk/QeuDInSBV+KcEPTpO09
         ZFmXZCSHVoOWP2/cvlhYlRXK/5tXe6/s6gYrihJok+ePfV9IUQMHuPjtDaSvaqp/l/WI
         dkkZEznAl7z58xOTFX94a6QycUCkLaloIXz+DkdOwNe8vNzrdElSBVGt9Rno5y2hm9cy
         UTwQ==
X-Forwarded-Encrypted: i=1; AJvYcCXgZm4+NojZlQ+aYQEUYKiSju2SInE1gRn0a/K24GOVtI9Lv6ZqdEkN0N7hKuU6LfpfAmkg7bK+kAGOpJ9K@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2KrQIpssRor9HSzs5VKN1ZeSnMmY2BjTOyf6QafaSdu7O01JF
	yEWKR39KXLs4IHjzF+dBZeTS6ug09cOBcs2TgcYEIyUP8PutIB6prpDQ7UnJw6fBq6s=
X-Gm-Gg: ASbGncs0JHHwjqqqK/Ph57Pp0E6vtT588op+P0EO/86i0F3yNl/tUZPWox42mZrv9X1
	YmiGNlK9tOkPm+CgQUmFw1IxzyqERy1umVwkVLs4bTPXrX1kSvte09n2QeVEMw25A5xwTycVfyK
	R6/iwc6otso5tNkpIrp8dA/IpLjzr+LY1eTD63SJl17ym09TR4u6yw8SZpsQG8CZVRRs7LvW3Dd
	bGZHwFrKQMmr3+N3GobF6+ZSuafLs/7JVcDhG5Ys8+qOCa1Ea6tO/z8IZ1GqDyPvsExF98rPOxo
	R42AtTq7rWIZiQIZhx52fPms0Vn1dkFip27Up/OOYuJsmqtswyVFtnkyOadihjtTr8TSzEf96nG
	m8XhEQXuToKUXL7UMJekgUM/b2oJo4yCQ
X-Google-Smtp-Source: AGHT+IFIUDgrjyqGiW8xl2LM81LcX/n7/fWAGdISPDsnVSWV2bhnTlDcMAJIxiDMSHwcAzcdbqoYKw==
X-Received: by 2002:a17:906:ba87:b0:ae0:ad5c:4185 with SMTP id a640c23a62f3a-ae3fbdca6e0mr110431266b.57.1751613443066;
        Fri, 04 Jul 2025 00:17:23 -0700 (PDT)
Received: from otso.local (144-178-202-139.static.ef-service.nl. [144.178.202.139])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae3f66d1ae3sm119401766b.7.2025.07.04.00.17.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jul 2025 00:17:22 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 04 Jul 2025 09:17:03 +0200
Subject: [PATCH v2 11/11] clk: qcom: Add Video Clock controller (VIDEOCC)
 driver for Milos
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250704-sm7635-clocks-v2-11-9e47a7c0d47f@fairphone.com>
References: <20250704-sm7635-clocks-v2-0-9e47a7c0d47f@fairphone.com>
In-Reply-To: <20250704-sm7635-clocks-v2-0-9e47a7c0d47f@fairphone.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751613431; l=13493;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=CFa5Xfk1nfkg6tUrH3CtcpwD24L3ZwFkIBoxbhnEYeY=;
 b=ZJrgAOVEfHeK1sBi1V9KCl62RuTcwhKwTHtQJreZasjO15h7Xbv7otjIlcvMKt9cT2t3/YTZz
 zwy7hwKGSG0BFBI3dedA/pnMyDuw2nowdUsCMPtHdSNmTJn1hy1mFfA
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Add support for the video clock controller found on Milos (e.g. SM7635)
based devices.

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
2.50.0


