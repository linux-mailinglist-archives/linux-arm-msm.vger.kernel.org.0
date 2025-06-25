Return-Path: <linux-arm-msm+bounces-62340-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id F20CAAE7BF4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jun 2025 11:15:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 062441BC7CD2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jun 2025 09:16:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 827052C08BD;
	Wed, 25 Jun 2025 09:12:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="tyOoBBKR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34AE029E112
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jun 2025 09:12:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750842769; cv=none; b=AgIKx1UNZcfK/pz5bGAMuGN5fQb7L74GxIqkKhBTUT2g3j4f/ebl03yHWPkUZimCLniZPxJ6ox66NSD0Ep/3RphhwqetP2X7iK6f6MhDvD0eYVObIfxmqyc5PSQpiURmxEtJ+Ohep7tGJVrRGv1Uqsc7pogCCl9T5u20+XU15Bg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750842769; c=relaxed/simple;
	bh=vxnSaTqeUJDO9O6msCHg07IPERzZWFhTlmL7vhpi2GY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=o3DKB59wYC28jDagpJpgfrC26Btjg9nwSZwwX0ZM7yOwYz89n0SevojKamm42bR+wFag1yOaj1k1a1lufFz97NZtrLr7A4VSY9lux9TriOIAbaXZ54NVZbrLX6Rg+ihDZCxgdw/zfLv6UX+ki5Cdjc7Fv1worgukkjrvRXxNpPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=tyOoBBKR; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-acb5ec407b1so1055436266b.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jun 2025 02:12:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1750842759; x=1751447559; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WM/iwMQIMQ1j4HAQ+DJc1D+yYwhc26xJOa1r6fdsCnQ=;
        b=tyOoBBKRIxF/KUHZS9bx+bJ6Ch8FdtmTvBEaPXJWjUDBXoZ/MndnWypv9H3DgqomMl
         J7gBGWZqIWWfIgfAGAQw/OSyqLkXt1YTAla5ECkYZZ7dMbQdzMI70bpzs0Pf2GArreIL
         +eTZHK662Z79NjK9nc7kdbLnEb14+KY2W1CpssI2X/GbXkv8bJUJyhlJEB8AAX4JCD+k
         Ic8TeG/jgWGpBlVvIJttXHHyaS1fZVgDfE+FE1Uh7JBxyR3JNIC4e08aZppuoFsu/BBA
         r7ojOjPJTjy0XiHPHNGzgrxmDhjmb6CP0SjstxfPxkjIM4Z2gCx/EpcxIt5sQyfKD1Bb
         n+9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750842759; x=1751447559;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WM/iwMQIMQ1j4HAQ+DJc1D+yYwhc26xJOa1r6fdsCnQ=;
        b=xFTBd0y0zOZuMHehBuKmTVAa8ZhnyGAdmpbiWlYqiUykW/dFc8E2VbL7vGHJLObTRZ
         gxm+1LyQD9Kjx2D+NybS6KfY/xDv53+4ZhWtBHpIhar8MSVzoqYnSwc/Dq8AI/NY6Emf
         Rg1D4pSkIkUcDqYUc5+IOPPOOwPPTjAXltLgq6LG3PV3JyyXiafZvMrjMOw5JOtp2WER
         Vp5eVDWzP1uwlPrTwnsl/qGFQCHi/i18pY7t99/W3waotuXTeRtVYeDAG8n4YPJRtpcj
         EhiLhF7lZo2oNBYxMoxUfniFia3vElsFg3b0dQGLEIOWRJrAJeBvgOVUmg/b25yjGItW
         Kv0g==
X-Forwarded-Encrypted: i=1; AJvYcCUQ6/+AcsYi4TzRLXqwwZwOYyQOIFOfS3xhwNvI0vFBlzSc8LAVYKJ1KY49ciwi7MUbZ2dKyYPBaFO0SJ62@vger.kernel.org
X-Gm-Message-State: AOJu0YybY3OVP+5I3fDcgm9YsvY1wNqZhGe9M22/N/ANjBzrylx/Uw+Z
	14hPgwynOonWMCfQeVMK605bMFk7DwVOBI7qBxcXXOAcKJwI7Cc6JO7KR4vQZCNAg50=
X-Gm-Gg: ASbGnctTAZzrsbJYiKfQ5emPHPvgMdkaOQu1T1c/LF+gtFjcmuBMfYvhxxQ2vyibEhR
	p1Aampv9t0+J0YO5wCj8y99lzusglRKbQF4CPN+Znr0uRVugxPaT/M7RJeVEirqIdDZUnXrsgLd
	lENr1cxjrT9DU8lpK/ubEOay3AL7t0e+VZ8KOknZlHq2hNXX89Occ1Q6JoELwvxU78H7RHQ3PcY
	PlwV+dO9Ui338z3z0SikuxZO0GBkZftlG9EF2Y0TxhM+seAuw+KemQ/pERfXtUrJv3Z7v6uRB45
	aOqPw32q+GhMrZ80Hj+ngFotX0OxJnHZpKGVpQ51Ta1VewcOzgr1lbEfV+DoF9hSierhDyJYNqH
	YPpIn6zL96e8vcK3hoHtqnhB/Re5718Ha
X-Google-Smtp-Source: AGHT+IETMQzYRl+PjA238BQTVMp9x+7d4jtAzDbj18SUQFzauLUf7T11kootQ2WXRFpxVnw6qMKLog==
X-Received: by 2002:a17:906:6a12:b0:ad8:8529:4f77 with SMTP id a640c23a62f3a-ae0bea790d5mr230460266b.38.1750842758823;
        Wed, 25 Jun 2025 02:12:38 -0700 (PDT)
Received: from otso.local (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae0b887ab4csm154937366b.129.2025.06.25.02.12.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 02:12:38 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Wed, 25 Jun 2025 11:12:28 +0200
Subject: [PATCH 10/10] clk: qcom: Add Video Clock controller (VIDEOCC)
 driver for SM7635
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250625-sm7635-clocks-v1-10-ca3120e3a80e@fairphone.com>
References: <20250625-sm7635-clocks-v1-0-ca3120e3a80e@fairphone.com>
In-Reply-To: <20250625-sm7635-clocks-v1-0-ca3120e3a80e@fairphone.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750842748; l=13668;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=vxnSaTqeUJDO9O6msCHg07IPERzZWFhTlmL7vhpi2GY=;
 b=bQj+SCKWekn7Zwz6eu6xQ2L8O6QYplv+Zx5a7147h20yIauUF/JomvLWOL5whTlzDHU/JvqqK
 J+tKnRjYEdrA5VgGRqIlVmp+XIp16evFIygG9nxva3qd8Oui2yQLdWq
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Add support for the video clock controller found on SM7635 based
devices.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 drivers/clk/qcom/Kconfig          |  11 +
 drivers/clk/qcom/Makefile         |   1 +
 drivers/clk/qcom/videocc-sm7635.c | 412 ++++++++++++++++++++++++++++++++++++++
 3 files changed, 424 insertions(+)

diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
index fc8c3e488a43dc50c8a3671da9ac6d32a28a4438..b1d9e0e8be59317b1bbdbfa61c9baf1333b881aa 100644
--- a/drivers/clk/qcom/Kconfig
+++ b/drivers/clk/qcom/Kconfig
@@ -1375,6 +1375,17 @@ config SM_VIDEOCC_7150
 	  Say Y if you want to support video devices and functionality such as
 	  video encode and decode.
 
+config SM_VIDEOCC_7635
+	tristate "SM7635 Video Clock Controller"
+	depends on ARM64 || COMPILE_TEST
+	select SM_GCC_7635
+	select QCOM_GDSC
+	help
+	  Support for the video clock controller on Qualcomm Technologies, Inc.
+	  SM7635 devices.
+	  Say Y if you want to support video devices and functionality such as
+	  video encode/decode.
+
 config SM_VIDEOCC_8150
 	tristate "SM8150 Video Clock Controller"
 	depends on ARM64 || COMPILE_TEST
diff --git a/drivers/clk/qcom/Makefile b/drivers/clk/qcom/Makefile
index 59e165e8ec4436931652387cee10177336b7d8d6..7cc74d4f7af99cea1a9fed3b6523a71afcc7d40c 100644
--- a/drivers/clk/qcom/Makefile
+++ b/drivers/clk/qcom/Makefile
@@ -169,6 +169,7 @@ obj-$(CONFIG_SM_TCSRCC_8550) += tcsrcc-sm8550.o
 obj-$(CONFIG_SM_TCSRCC_8650) += tcsrcc-sm8650.o
 obj-$(CONFIG_SM_TCSRCC_8750) += tcsrcc-sm8750.o
 obj-$(CONFIG_SM_VIDEOCC_7150) += videocc-sm7150.o
+obj-$(CONFIG_SM_VIDEOCC_7635) += videocc-sm7635.o
 obj-$(CONFIG_SM_VIDEOCC_8150) += videocc-sm8150.o
 obj-$(CONFIG_SM_VIDEOCC_8250) += videocc-sm8250.o
 obj-$(CONFIG_SM_VIDEOCC_8350) += videocc-sm8350.o
diff --git a/drivers/clk/qcom/videocc-sm7635.c b/drivers/clk/qcom/videocc-sm7635.c
new file mode 100644
index 0000000000000000000000000000000000000000..2e1a4904a5b6a8bbbd0c513def58c314695c9678
--- /dev/null
+++ b/drivers/clk/qcom/videocc-sm7635.c
@@ -0,0 +1,412 @@
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
+#include <linux/pm_runtime.h>
+#include <linux/regmap.h>
+
+#include <dt-bindings/clock/qcom,sm7635-videocc.h>
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
+static struct clk_regmap *video_cc_sm7635_clocks[] = {
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
+static struct gdsc *video_cc_sm7635_gdscs[] = {
+	[VIDEO_CC_MVS0C_GDSC] = &video_cc_mvs0c_gdsc,
+	[VIDEO_CC_MVS0_GDSC] = &video_cc_mvs0_gdsc,
+};
+
+static const struct qcom_reset_map video_cc_sm7635_resets[] = {
+	[VIDEO_CC_INTERFACE_BCR] = { 0x80f0 },
+	[VIDEO_CC_MVS0_BCR] = { 0x80a0 },
+	[VIDEO_CC_MVS0C_CLK_ARES] = { 0x8064, 2 },
+	[VIDEO_CC_MVS0C_BCR] = { 0x8048 },
+};
+
+static const struct regmap_config video_cc_sm7635_regmap_config = {
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.max_register = 0x9f50,
+	.fast_io = true,
+};
+
+static struct qcom_cc_desc video_cc_sm7635_desc = {
+	.config = &video_cc_sm7635_regmap_config,
+	.clks = video_cc_sm7635_clocks,
+	.num_clks = ARRAY_SIZE(video_cc_sm7635_clocks),
+	.resets = video_cc_sm7635_resets,
+	.num_resets = ARRAY_SIZE(video_cc_sm7635_resets),
+	.gdscs = video_cc_sm7635_gdscs,
+	.num_gdscs = ARRAY_SIZE(video_cc_sm7635_gdscs),
+};
+
+static const struct of_device_id video_cc_sm7635_match_table[] = {
+	{ .compatible = "qcom,sm7635-videocc" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, video_cc_sm7635_match_table);
+
+static int video_cc_sm7635_probe(struct platform_device *pdev)
+{
+	struct regmap *regmap;
+	int ret;
+
+	ret = devm_pm_runtime_enable(&pdev->dev);
+	if (ret)
+		return ret;
+
+	ret = pm_runtime_resume_and_get(&pdev->dev);
+	if (ret)
+		return ret;
+
+	regmap = qcom_cc_map(pdev, &video_cc_sm7635_desc);
+	if (IS_ERR(regmap)) {
+		pm_runtime_put(&pdev->dev);
+		return PTR_ERR(regmap);
+	}
+
+	clk_lucid_ole_pll_configure(&video_cc_pll0, regmap, &video_cc_pll0_config);
+
+	/* Keep some clocks always-on */
+	qcom_branch_set_clk_en(regmap, 0x80f4); /* VIDEO_CC_AHB_CLK */
+	qcom_branch_set_clk_en(regmap, 0x8140); /* VIDEO_CC_SLEEP_CLK */
+	qcom_branch_set_clk_en(regmap, 0x8124); /* VIDEO_CC_XO_CLK */
+
+	ret = qcom_cc_really_probe(&pdev->dev, &video_cc_sm7635_desc, regmap);
+
+	pm_runtime_put(&pdev->dev);
+
+	return ret;
+}
+
+static struct platform_driver video_cc_sm7635_driver = {
+	.probe = video_cc_sm7635_probe,
+	.driver = {
+		.name = "video_cc-sm7635",
+		.of_match_table = video_cc_sm7635_match_table,
+	},
+};
+
+module_platform_driver(video_cc_sm7635_driver);
+
+MODULE_DESCRIPTION("QTI VIDEO_CC SM7635 Driver");
+MODULE_LICENSE("GPL");

-- 
2.50.0


