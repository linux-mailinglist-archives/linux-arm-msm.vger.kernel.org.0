Return-Path: <linux-arm-msm+bounces-110431-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6Px5GXO0G2pVFgkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110431-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 31 May 2026 06:09:23 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B63CD614537
	for <lists+linux-arm-msm@lfdr.de>; Sun, 31 May 2026 06:09:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EE3FF300B47F
	for <lists+linux-arm-msm@lfdr.de>; Sun, 31 May 2026 04:09:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B6DC2D6407;
	Sun, 31 May 2026 04:09:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=herrie.org header.i=@herrie.org header.b="luIpqhIw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from outbound10.mail.transip.nl (outbound10.mail.transip.nl [136.144.136.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F64C263C8F;
	Sun, 31 May 2026 04:09:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=136.144.136.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780200553; cv=none; b=HgpOJNtZ5/TT8XpIdN+3fHDW5/I1M2qca9wU1rojJTcQ6o4jpLKcP3L++5UPUg9n8/XRWSrJs2D9cecTTLjD3sOjriQgZqqS45aeePsQrLNtS4EbThTR2pVOv+pfh7ha7XVpfiTnMTGEtVxSIFeDXfiQIiOh1+XRfHhZG3fD4zI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780200553; c=relaxed/simple;
	bh=RllGI30v7s/jc87HganImQLdwf4Q9DvHvOq+m4Tsi/c=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=q8gBYvwKna2o1HBqq7wpqByodXUV1TULyOrNas3MVzS1vvh6Mwp7g4BhXHiipke/xy0F5eUAmyAfWVa9an6zEDEF7vhlUokLNQ9uZKIoJHBfDQWZttSjVn/VRENkgvKOwtUqDLxwazQgixJoT93jBx4QN8cRotvtS2N+t/wUtb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=herrie.org; spf=pass smtp.mailfrom=herrie.org; dkim=pass (2048-bit key) header.d=herrie.org header.i=@herrie.org header.b=luIpqhIw; arc=none smtp.client-ip=136.144.136.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=herrie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=herrie.org
Received: from submission10.mail.transip.nl (unknown [10.103.8.161])
	by outbound10.mail.transip.nl (Postfix) with ESMTP id 4gSk9s4QvdzTPNX6;
	Sun, 31 May 2026 06:09:05 +0200 (CEST)
Received: from herrie-desktop.. (180-93-184-31.ftth.glasoperator.nl [31.184.93.180])
	by submission10.mail.transip.nl (Postfix) with ESMTPA id 4gSk9r6bHjz1g92mW;
	Sun, 31 May 2026 06:09:04 +0200 (CEST)
From: Herman van Hazendonk <github.com@herrie.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Michael Turquette <mturquette@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>
Subject: [PATCH v2 3/3] clk: qcom: add MSM8x60 LCC (LPASS) driver
Date: Sun, 31 May 2026 06:09:02 +0200
Message-ID: <f5db4c0e8826d597338fb98e5d8f71ce97aa1cbd.1780197511.git.github.com@herrie.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1780197511.git.github.com@herrie.org>
References: <cover.1780148149.git.github.com@herrie.org> <cover.1780197511.git.github.com@herrie.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: ClueGetter at submission10.mail.transip.nl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=transip-a; d=herrie.org; t=1780200545; h=from:subject:to:references:
 in-reply-to:date:mime-version;
 bh=58851k7dxqxXk6rXsgJgSXYV21hona3ss3fC+VT/0bc=;
 b=luIpqhIwdNZuuHm984PAP2eBojUj3PDsfKoxA37lYviRQH/BcffZBNxi8XfvKOygVbDNk1
 iPF4h7XlxEIzOVginQS8D1BCtRXROO24ssjqzidnjYtTC6TEwKYe0c3+C4JlAtawjnFmkv
 N9MKWcJ7kt3vxBZYBEp/6tlf1TmaxIwVA5tNrxXNDJDwwmDk4CgmCTjWJaGeOA1AeY9FWU
 XOTbO9ZHyFKC8my/RAC+MnaPYRy0VjZiFhtioSFA+QCslyrKQc5+sHzY/CqmqGpvvQTvxA
 TLFq75R18yal58rZlvcDDX6+TK4raAgNSleCNT4Rhg7fQYpZW1ZKegjdSitCbQ==
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
	TAGGED_FROM(0.00)[bounces-110431-lists,linux-arm-msm=lfdr.de];
	DMARC_NA(0.00)[herrie.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[github.com@herrie.org,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: B63CD614537
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add a clock driver for the LPASS (Low Power Audio SubSystem) Clock
Controller on the MSM8x60 family (MSM8260/MSM8660/APQ8060) - the
Scorpion-class generation that preceded MSM8960's Krait CPUs.

The register layout, parent muxing and divider topology of the LPASS
PLL/clk fabric differ from MSM8960's LCC enough that a clean separate
driver is simpler than parameterising mmcc-msm8960.c. Both drivers
can coexist in tree (different KConfig options, different match
table, different device-tree compatible).

Used on the HP TouchPad (Tenderloin) where the LPASS Q6 audio DSP
needs functional MI2S / SLIMBus / PCM clocks before audio playback
or capture works.

Signed-off-by: Herman van Hazendonk <github.com@herrie.org>
---
 drivers/clk/qcom/Kconfig       |   9 +
 drivers/clk/qcom/Makefile      |   1 +
 drivers/clk/qcom/lcc-msm8660.c | 551 +++++++++++++++++++++++++++++++++
 3 files changed, 561 insertions(+)
 create mode 100644 drivers/clk/qcom/lcc-msm8660.c

diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
index d9cff5b0281d..2ea95f69355e 100644
--- a/drivers/clk/qcom/Kconfig
+++ b/drivers/clk/qcom/Kconfig
@@ -547,6 +547,15 @@ config MSM_LCC_8960
 	  Say Y if you want to use audio devices such as i2s, pcm,
 	  SLIMBus, etc.
 
+config MSM_LCC_8660
+	tristate "MSM8x60 LPASS Clock Controller"
+	depends on ARM || COMPILE_TEST
+	help
+	  Support for the LPASS clock controller on the MSM8x60 family
+	  (MSM8260/MSM8660/APQ8060). MSM8960 is the newer
+	  Krait-based generation handled separately by MSM_LCC_8960.
+	  Say Y if you want to use audio devices such as i2s, pcm, SLIMBus.
+
 config MDM_GCC_9607
 	tristate "MDM9607 Global Clock Controller"
 	depends on ARM || COMPILE_TEST
diff --git a/drivers/clk/qcom/Makefile b/drivers/clk/qcom/Makefile
index e100cfd6a52d..41c973d7db59 100644
--- a/drivers/clk/qcom/Makefile
+++ b/drivers/clk/qcom/Makefile
@@ -77,6 +77,7 @@ obj-$(CONFIG_MSM_GCC_8974) += gcc-msm8974.o
 obj-$(CONFIG_MSM_GCC_8976) += gcc-msm8976.o
 obj-$(CONFIG_MSM_GCC_8994) += gcc-msm8994.o
 obj-$(CONFIG_MSM_GCC_8996) += gcc-msm8996.o
+obj-$(CONFIG_MSM_LCC_8660) += lcc-msm8660.o
 obj-$(CONFIG_MSM_LCC_8960) += lcc-msm8960.o
 obj-$(CONFIG_MSM_GCC_8998) += gcc-msm8998.o
 obj-$(CONFIG_MSM_GPUCC_8998) += gpucc-msm8998.o
diff --git a/drivers/clk/qcom/lcc-msm8660.c b/drivers/clk/qcom/lcc-msm8660.c
new file mode 100644
index 000000000000..f71846d493f8
--- /dev/null
+++ b/drivers/clk/qcom/lcc-msm8660.c
@@ -0,0 +1,551 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2014, The Linux Foundation. All rights reserved.
+ * Copyright (c) 2026 Herman van Hazendonk <github.com@herrie.org>
+ *
+ * Qualcomm MSM8x60 family (MSM8260/MSM8660/APQ8060) LPASS Clock Controller driver.
+ *
+ * Split from lcc-msm8960.c because the MSM8x60 family is a separate
+ * SoC generation (Scorpion) from MSM8960 (Krait). The clock topology is
+ * compatible but PLL4 runs at a different rate (540.672 MHz, L=22) and the
+ * driver has no need for the MDM9615 CXO patch or the 492 MHz frequency plan.
+ */
+
+#include <linux/kernel.h>
+#include <linux/bitops.h>
+#include <linux/err.h>
+#include <linux/platform_device.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/clk-provider.h>
+#include <linux/regmap.h>
+
+#include <dt-bindings/clock/qcom,lcc-msm8660.h>
+
+#include "common.h"
+#include "clk-regmap.h"
+#include "clk-pll.h"
+#include "clk-rcg.h"
+#include "clk-branch.h"
+#include "clk-regmap-divider.h"
+#include "clk-regmap-mux.h"
+
+static struct clk_pll pll4 = {
+	.l_reg = 0x4,
+	.m_reg = 0x8,
+	.n_reg = 0xc,
+	.config_reg = 0x14,
+	.mode_reg = 0x0,
+	.status_reg = 0x18,
+	.status_bit = 16,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "pll4",
+		.parent_data = &(const struct clk_parent_data){
+			.fw_name = "pxo", .name = "pxo_board",
+		},
+		.num_parents = 1,
+		.ops = &clk_pll_ops,
+	},
+};
+
+enum {
+	P_PXO,
+	P_PLL4,
+};
+
+static const struct parent_map lcc_pxo_pll4_map[] = {
+	{ P_PXO, 0 },
+	{ P_PLL4, 2 }
+};
+
+static const struct clk_parent_data lcc_pxo_pll4[] = {
+	{ .fw_name = "pxo", .name = "pxo_board" },
+	{ .fw_name = "pll4_vote", .name = "pll4_vote" },
+};
+
+/*
+ * MSM8x60 PLL4 runs at 540.672 MHz (24.576 MHz * 22, L=0x16).
+ * Divisors taken from the legacy webOS clock-8x60.c driver.
+ * AIF_OSR has an 8-bit M/N counter, so 512000 Hz is not achievable with
+ * this PLL frequency and is intentionally omitted from the 540 MHz tables.
+ */
+static const struct freq_tbl clk_tbl_aif_osr_540[] = {
+	{   768000, P_PLL4, 4, 1, 176 },
+	{  1024000, P_PLL4, 4, 1, 132 },
+	{  1536000, P_PLL4, 4, 1,  88 },
+	{  2048000, P_PLL4, 4, 1,  66 },
+	{  3072000, P_PLL4, 4, 1,  44 },
+	{  4096000, P_PLL4, 4, 1,  33 },
+	{  6144000, P_PLL4, 4, 1,  22 },
+	{  8192000, P_PLL4, 2, 1,  33 },
+	{ 12288000, P_PLL4, 4, 1,  11 },
+	{ 24576000, P_PLL4, 2, 1,  11 },
+	{ 27000000, P_PXO,  1, 0,   0 },
+	{ }
+};
+
+static const struct freq_tbl clk_tbl_aif_osr_393[] = {
+	{   512000, P_PLL4, 4, 1, 192 },
+	{   768000, P_PLL4, 4, 1, 128 },
+	{  1024000, P_PLL4, 4, 1,  96 },
+	{  1536000, P_PLL4, 4, 1,  64 },
+	{  2048000, P_PLL4, 4, 1,  48 },
+	{  3072000, P_PLL4, 4, 1,  32 },
+	{  4096000, P_PLL4, 4, 1,  24 },
+	{  6144000, P_PLL4, 4, 1,  16 },
+	{  8192000, P_PLL4, 4, 1,  12 },
+	{ 12288000, P_PLL4, 4, 1,   8 },
+	{ 24576000, P_PLL4, 4, 1,   4 },
+	{ 27000000, P_PXO,  1, 0,   0 },
+	{ }
+};
+
+#define CLK_AIF_OSR_SRC(prefix, _ns, _md)			\
+static struct clk_rcg prefix##_osr_src = {			\
+	.ns_reg = _ns,						\
+	.md_reg = _md,						\
+	.mn = {							\
+		.mnctr_en_bit = 8,				\
+		.mnctr_reset_bit = 7,				\
+		.mnctr_mode_shift = 5,				\
+		.n_val_shift = 24,				\
+		.m_val_shift = 8,				\
+		.width = 8,					\
+	},							\
+	.p = {							\
+		.pre_div_shift = 3,				\
+		.pre_div_width = 2,				\
+	},							\
+	.s = {							\
+		.src_sel_shift = 0,				\
+		.parent_map = lcc_pxo_pll4_map,			\
+	},							\
+	.freq_tbl = clk_tbl_aif_osr_393,			\
+	.clkr = {						\
+		.enable_reg = _ns,				\
+		.enable_mask = BIT(9),				\
+		.hw.init = &(struct clk_init_data){		\
+			.name = #prefix "_osr_src",		\
+			.parent_data = lcc_pxo_pll4,		\
+			.num_parents = ARRAY_SIZE(lcc_pxo_pll4), \
+			.ops = &clk_rcg_ops,			\
+			.flags = CLK_SET_RATE_GATE,		\
+		},						\
+	},							\
+};								\
+
+#define CLK_AIF_OSR_CLK(prefix, _ns, hr, en_bit)		\
+static struct clk_branch prefix##_osr_clk = {			\
+	.halt_reg = hr,						\
+	.halt_bit = 1,						\
+	.halt_check = BRANCH_HALT_ENABLE,			\
+	.clkr = {						\
+		.enable_reg = _ns,				\
+		.enable_mask = BIT(en_bit),			\
+		.hw.init = &(struct clk_init_data){		\
+			.name = #prefix "_osr_clk",		\
+			.parent_hws = (const struct clk_hw*[]){	\
+				&prefix##_osr_src.clkr.hw,	\
+			},					\
+			.num_parents = 1,			\
+			.ops = &clk_branch_ops,			\
+			.flags = CLK_SET_RATE_PARENT,		\
+		},						\
+	},							\
+};								\
+
+#define CLK_AIF_OSR_DIV_CLK(prefix, _ns, _width)		\
+static struct clk_regmap_div prefix##_div_clk = {		\
+	.reg = _ns,						\
+	.shift = 10,						\
+	.width = _width,					\
+	.clkr = {						\
+		.hw.init = &(struct clk_init_data){		\
+			.name = #prefix "_div_clk",		\
+			.parent_hws = (const struct clk_hw*[]){	\
+				&prefix##_osr_src.clkr.hw,	\
+			},					\
+			.num_parents = 1,			\
+			.ops = &clk_regmap_div_ops,		\
+		},						\
+	},							\
+};								\
+
+#define CLK_AIF_OSR_BIT_DIV_CLK(prefix, _ns, hr, en_bit)	\
+static struct clk_branch prefix##_bit_div_clk = {		\
+	.halt_reg = hr,						\
+	.halt_bit = 0,						\
+	.halt_check = BRANCH_HALT_ENABLE,			\
+	.clkr = {						\
+		.enable_reg = _ns,				\
+		.enable_mask = BIT(en_bit),			\
+		.hw.init = &(struct clk_init_data){		\
+			.name = #prefix "_bit_div_clk",		\
+			.parent_hws = (const struct clk_hw*[]){	\
+				&prefix##_div_clk.clkr.hw,	\
+			},					\
+			.num_parents = 1,			\
+			.ops = &clk_branch_ops,			\
+			.flags = CLK_SET_RATE_PARENT,		\
+		},						\
+	},							\
+};								\
+
+#define CLK_AIF_OSR_BIT_CLK(prefix, _ns, _shift)		\
+static struct clk_regmap_mux prefix##_bit_clk = {		\
+	.reg = _ns,						\
+	.shift = _shift,					\
+	.width = 1,						\
+	.clkr = {						\
+		.hw.init = &(struct clk_init_data){		\
+			.name = #prefix "_bit_clk",		\
+			.parent_data = (const struct clk_parent_data[]){ \
+				{ .hw = &prefix##_bit_div_clk.clkr.hw, }, \
+				{ .fw_name = #prefix "_codec_clk", \
+				  .name = #prefix "_codec_clk", }, \
+			},					\
+			.num_parents = 2,			\
+			.ops = &clk_regmap_mux_closest_ops,	\
+			.flags = CLK_SET_RATE_PARENT,		\
+		},						\
+	},							\
+};
+
+CLK_AIF_OSR_SRC(mi2s, 0x48, 0x4c)
+CLK_AIF_OSR_CLK(mi2s, 0x48, 0x50, 17)
+CLK_AIF_OSR_DIV_CLK(mi2s, 0x48, 4)
+CLK_AIF_OSR_BIT_DIV_CLK(mi2s, 0x48, 0x50, 15)
+CLK_AIF_OSR_BIT_CLK(mi2s, 0x48, 14)
+
+/*
+ * CLK_AIF_OSR_DIV - Audio Interface with divider clocks.
+ *
+ * MSM8x60 LPASS AIF register layout, verified against the legacy
+ * downstream Samsung MSM8660 source and the webOS clock-8x60.c
+ * CLK_AIF_BIT macro. Both legacy sources agree on the bit assignment:
+ * the bit-divider field starts at offset 10 and is four bits wide;
+ * bit 14 doubles as the cdiv external-source select; BIT_DIV branch
+ * enable is BIT(15); OSR branch enable is BIT(17); the BIT clock mux
+ * select is BIT(18) for codec_i2s and spare_i2s (mi2s uses bit 14,
+ * handled explicitly above this macro); reset is BIT(19).
+ *
+ * Earlier revisions of this driver used a width of 8 here, inherited
+ * from lcc-msm8960.c whose enables are at BIT(19) and BIT(21) and so
+ * do not overlap a wide divider field. On MSM8x60 the enables are at
+ * BIT(15) and BIT(17), so a width of 8 made the divider field cover
+ * bits 10 through 17 and a read-modify-write on the divider would
+ * clobber the two branch gates. A width of 4 confines the divider to
+ * bits 10 through 13, matching the standalone mi2s div clock above
+ * and what the legacy stack programs.
+ */
+#define CLK_AIF_OSR_DIV(prefix, _ns, _md, hr)			\
+	CLK_AIF_OSR_SRC(prefix, _ns, _md)			\
+	CLK_AIF_OSR_CLK(prefix, _ns, hr, 17)			\
+	CLK_AIF_OSR_DIV_CLK(prefix, _ns, 4)			\
+	CLK_AIF_OSR_BIT_DIV_CLK(prefix, _ns, hr, 15)		\
+	CLK_AIF_OSR_BIT_CLK(prefix, _ns, 18)
+
+CLK_AIF_OSR_DIV(codec_i2s_mic, 0x60, 0x64, 0x68);
+CLK_AIF_OSR_DIV(spare_i2s_mic, 0x78, 0x7c, 0x80);
+CLK_AIF_OSR_DIV(codec_i2s_spkr, 0x6c, 0x70, 0x74);
+CLK_AIF_OSR_DIV(spare_i2s_spkr, 0x84, 0x88, 0x8c);
+
+/* PCM frequency table for MSM8x60 with PLL4 at 540.672 MHz */
+static const struct freq_tbl clk_tbl_pcm_540[] = {
+	{   256000, P_PLL4, 4, 1, 528 },
+	{   512000, P_PLL4, 4, 1, 264 },
+	{   768000, P_PLL4, 4, 1, 176 },
+	{  1024000, P_PLL4, 4, 1, 132 },
+	{  1536000, P_PLL4, 4, 1,  88 },
+	{  2048000, P_PLL4, 4, 1,  66 },
+	{  3072000, P_PLL4, 4, 1,  44 },
+	{  4096000, P_PLL4, 4, 1,  33 },
+	{  6144000, P_PLL4, 4, 1,  22 },
+	{  8192000, P_PLL4, 2, 1,  33 },
+	{ 12288000, P_PLL4, 4, 1,  11 },
+	{ 24576000, P_PLL4, 2, 1,  11 },
+	{ 27000000, P_PXO,  1, 0,   0 },
+	{ }
+};
+
+static const struct freq_tbl clk_tbl_pcm_393[] = {
+	{   256000, P_PLL4, 4, 1, 384 },
+	{   512000, P_PLL4, 4, 1, 192 },
+	{   768000, P_PLL4, 4, 1, 128 },
+	{  1024000, P_PLL4, 4, 1,  96 },
+	{  1536000, P_PLL4, 4, 1,  64 },
+	{  2048000, P_PLL4, 4, 1,  48 },
+	{  3072000, P_PLL4, 4, 1,  32 },
+	{  4096000, P_PLL4, 4, 1,  24 },
+	{  6144000, P_PLL4, 4, 1,  16 },
+	{  8192000, P_PLL4, 4, 1,  12 },
+	{ 12288000, P_PLL4, 4, 1,   8 },
+	{ 24576000, P_PLL4, 4, 1,   4 },
+	{ 27000000, P_PXO,  1, 0,   0 },
+	{ }
+};
+
+static struct clk_rcg pcm_src = {
+	.ns_reg = 0x54,
+	.md_reg = 0x58,
+	.mn = {
+		.mnctr_en_bit = 8,
+		.mnctr_reset_bit = 7,
+		.mnctr_mode_shift = 5,
+		.n_val_shift = 16,
+		.m_val_shift = 16,
+		.width = 16,
+	},
+	.p = {
+		.pre_div_shift = 3,
+		.pre_div_width = 2,
+	},
+	.s = {
+		.src_sel_shift = 0,
+		.parent_map = lcc_pxo_pll4_map,
+	},
+	.freq_tbl = clk_tbl_pcm_393,
+	.clkr = {
+		.enable_reg = 0x54,
+		.enable_mask = BIT(9),
+		.hw.init = &(struct clk_init_data){
+			.name = "pcm_src",
+			.parent_data = lcc_pxo_pll4,
+			.num_parents = ARRAY_SIZE(lcc_pxo_pll4),
+			.ops = &clk_rcg_ops,
+			.flags = CLK_SET_RATE_GATE,
+		},
+	},
+};
+
+static struct clk_branch pcm_clk_out = {
+	.halt_reg = 0x5c,
+	.halt_bit = 0,
+	.halt_check = BRANCH_HALT_ENABLE,
+	.clkr = {
+		.enable_reg = 0x54,
+		.enable_mask = BIT(11),
+		.hw.init = &(struct clk_init_data){
+			.name = "pcm_clk_out",
+			.parent_hws = (const struct clk_hw*[]){
+				&pcm_src.clkr.hw
+			},
+			.num_parents = 1,
+			.ops = &clk_branch_ops,
+			.flags = CLK_SET_RATE_PARENT,
+		},
+	},
+};
+
+static struct clk_regmap_mux pcm_clk = {
+	.reg = 0x54,
+	.shift = 10,
+	.width = 1,
+	.clkr = {
+		.hw.init = &(struct clk_init_data){
+			.name = "pcm_clk",
+			.parent_data = (const struct clk_parent_data[]){
+				{ .hw = &pcm_clk_out.clkr.hw },
+				{ .fw_name = "pcm_codec_clk", .name = "pcm_codec_clk" },
+			},
+			.num_parents = 2,
+			.ops = &clk_regmap_mux_closest_ops,
+			.flags = CLK_SET_RATE_PARENT,
+		},
+	},
+};
+
+static struct clk_rcg slimbus_src = {
+	.ns_reg = 0xcc,
+	.md_reg = 0xd0,
+	.mn = {
+		.mnctr_en_bit = 8,
+		.mnctr_reset_bit = 7,
+		.mnctr_mode_shift = 5,
+		.n_val_shift = 24,
+		.m_val_shift = 8,
+		.width = 8,
+	},
+	.p = {
+		.pre_div_shift = 3,
+		.pre_div_width = 2,
+	},
+	.s = {
+		.src_sel_shift = 0,
+		.parent_map = lcc_pxo_pll4_map,
+	},
+	.freq_tbl = clk_tbl_aif_osr_393,
+	.clkr = {
+		.enable_reg = 0xcc,
+		.enable_mask = BIT(9),
+		.hw.init = &(struct clk_init_data){
+			.name = "slimbus_src",
+			.parent_data = lcc_pxo_pll4,
+			.num_parents = ARRAY_SIZE(lcc_pxo_pll4),
+			.ops = &clk_rcg_ops,
+			.flags = CLK_SET_RATE_GATE,
+		},
+	},
+};
+
+static struct clk_branch audio_slimbus_clk = {
+	.halt_reg = 0xd4,
+	.halt_bit = 0,
+	.halt_check = BRANCH_HALT_ENABLE,
+	.clkr = {
+		.enable_reg = 0xcc,
+		.enable_mask = BIT(10),
+		.hw.init = &(struct clk_init_data){
+			.name = "audio_slimbus_clk",
+			.parent_hws = (const struct clk_hw*[]){
+				&slimbus_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.ops = &clk_branch_ops,
+			.flags = CLK_SET_RATE_PARENT,
+		},
+	},
+};
+
+static struct clk_branch sps_slimbus_clk = {
+	.halt_reg = 0xd4,
+	.halt_bit = 1,
+	.halt_check = BRANCH_HALT_ENABLE,
+	.clkr = {
+		.enable_reg = 0xcc,
+		.enable_mask = BIT(12),
+		.hw.init = &(struct clk_init_data){
+			.name = "sps_slimbus_clk",
+			.parent_hws = (const struct clk_hw*[]){
+				&slimbus_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.ops = &clk_branch_ops,
+			.flags = CLK_SET_RATE_PARENT,
+		},
+	},
+};
+
+static struct clk_regmap *lcc_msm8660_clks[] = {
+	[PLL4] = &pll4.clkr,
+	[MI2S_OSR_SRC] = &mi2s_osr_src.clkr,
+	[MI2S_OSR_CLK] = &mi2s_osr_clk.clkr,
+	[MI2S_DIV_CLK] = &mi2s_div_clk.clkr,
+	[MI2S_BIT_DIV_CLK] = &mi2s_bit_div_clk.clkr,
+	[MI2S_BIT_CLK] = &mi2s_bit_clk.clkr,
+	[PCM_SRC] = &pcm_src.clkr,
+	[PCM_CLK_OUT] = &pcm_clk_out.clkr,
+	[PCM_CLK] = &pcm_clk.clkr,
+	[SLIMBUS_SRC] = &slimbus_src.clkr,
+	[AUDIO_SLIMBUS_CLK] = &audio_slimbus_clk.clkr,
+	[SPS_SLIMBUS_CLK] = &sps_slimbus_clk.clkr,
+	[CODEC_I2S_MIC_OSR_SRC] = &codec_i2s_mic_osr_src.clkr,
+	[CODEC_I2S_MIC_OSR_CLK] = &codec_i2s_mic_osr_clk.clkr,
+	[CODEC_I2S_MIC_DIV_CLK] = &codec_i2s_mic_div_clk.clkr,
+	[CODEC_I2S_MIC_BIT_DIV_CLK] = &codec_i2s_mic_bit_div_clk.clkr,
+	[CODEC_I2S_MIC_BIT_CLK] = &codec_i2s_mic_bit_clk.clkr,
+	[SPARE_I2S_MIC_OSR_SRC] = &spare_i2s_mic_osr_src.clkr,
+	[SPARE_I2S_MIC_OSR_CLK] = &spare_i2s_mic_osr_clk.clkr,
+	[SPARE_I2S_MIC_DIV_CLK] = &spare_i2s_mic_div_clk.clkr,
+	[SPARE_I2S_MIC_BIT_DIV_CLK] = &spare_i2s_mic_bit_div_clk.clkr,
+	[SPARE_I2S_MIC_BIT_CLK] = &spare_i2s_mic_bit_clk.clkr,
+	[CODEC_I2S_SPKR_OSR_SRC] = &codec_i2s_spkr_osr_src.clkr,
+	[CODEC_I2S_SPKR_OSR_CLK] = &codec_i2s_spkr_osr_clk.clkr,
+	[CODEC_I2S_SPKR_DIV_CLK] = &codec_i2s_spkr_div_clk.clkr,
+	[CODEC_I2S_SPKR_BIT_DIV_CLK] = &codec_i2s_spkr_bit_div_clk.clkr,
+	[CODEC_I2S_SPKR_BIT_CLK] = &codec_i2s_spkr_bit_clk.clkr,
+	[SPARE_I2S_SPKR_OSR_SRC] = &spare_i2s_spkr_osr_src.clkr,
+	[SPARE_I2S_SPKR_OSR_CLK] = &spare_i2s_spkr_osr_clk.clkr,
+	[SPARE_I2S_SPKR_DIV_CLK] = &spare_i2s_spkr_div_clk.clkr,
+	[SPARE_I2S_SPKR_BIT_DIV_CLK] = &spare_i2s_spkr_bit_div_clk.clkr,
+	[SPARE_I2S_SPKR_BIT_CLK] = &spare_i2s_spkr_bit_clk.clkr,
+};
+
+static const struct regmap_config lcc_msm8660_regmap_config = {
+	.reg_bits	= 32,
+	.reg_stride	= 4,
+	.val_bits	= 32,
+	.max_register	= 0xfc,
+	.fast_io	= true,
+};
+
+static const struct qcom_cc_desc lcc_msm8660_desc = {
+	.config = &lcc_msm8660_regmap_config,
+	.clks = lcc_msm8660_clks,
+	.num_clks = ARRAY_SIZE(lcc_msm8660_clks),
+};
+
+static const struct of_device_id lcc_msm8660_match_table[] = {
+	{ .compatible = "qcom,lcc-msm8260" },
+	{ .compatible = "qcom,lcc-msm8660" },
+	{ .compatible = "qcom,lcc-apq8060" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, lcc_msm8660_match_table);
+
+static int lcc_msm8660_probe(struct platform_device *pdev)
+{
+	const struct freq_tbl *aif_osr_tbl, *pcm_tbl;
+	struct regmap *regmap;
+	const char *plan_name;
+	u32 val;
+	int ret;
+
+	regmap = qcom_cc_map(pdev, &lcc_msm8660_desc);
+	if (IS_ERR(regmap))
+		return PTR_ERR(regmap);
+
+	/*
+	 * MSM8x60 should always boot with PLL4 L=22 (540.672 MHz).
+	 * Detect anyway so a board with a non-standard L value still gets a
+	 * coherent frequency plan instead of silently producing wrong rates.
+	 */
+	ret = regmap_read(regmap, 0x4, &val);
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret,
+				     "failed to read PLL4 L register\n");
+
+	if (val == 0x16) {
+		aif_osr_tbl = clk_tbl_aif_osr_540;
+		pcm_tbl = clk_tbl_pcm_540;
+		plan_name = "540MHz";
+	} else {
+		aif_osr_tbl = clk_tbl_aif_osr_393;
+		pcm_tbl = clk_tbl_pcm_393;
+		plan_name = "fallback 393MHz";
+	}
+
+	/*
+	 * Pick the matching frequency table on both branches; assigning
+	 * unconditionally also restores the default if this driver is
+	 * ever rebound on a system whose PLL4 has been reprogrammed.
+	 */
+	slimbus_src.freq_tbl		   = aif_osr_tbl;
+	mi2s_osr_src.freq_tbl		   = aif_osr_tbl;
+	codec_i2s_mic_osr_src.freq_tbl	   = aif_osr_tbl;
+	spare_i2s_mic_osr_src.freq_tbl	   = aif_osr_tbl;
+	codec_i2s_spkr_osr_src.freq_tbl	   = aif_osr_tbl;
+	spare_i2s_spkr_osr_src.freq_tbl	   = aif_osr_tbl;
+	pcm_src.freq_tbl		   = pcm_tbl;
+
+	dev_info(&pdev->dev, "PLL4 L=0x%x, using %s frequency plan\n",
+		 val, plan_name);
+
+	/* Enable PLL4 source on the LPASS Primary PLL Mux */
+	regmap_write(regmap, 0xc4, 0x1);
+
+	return qcom_cc_really_probe(&pdev->dev, &lcc_msm8660_desc, regmap);
+}
+
+static struct platform_driver lcc_msm8660_driver = {
+	.probe		= lcc_msm8660_probe,
+	.driver		= {
+		.name	= "lcc-msm8660",
+		.of_match_table = lcc_msm8660_match_table,
+	},
+};
+module_platform_driver(lcc_msm8660_driver);
+
+MODULE_DESCRIPTION("Qualcomm MSM8x60 LPASS Clock Controller driver");
+MODULE_LICENSE("GPL");
+MODULE_ALIAS("platform:lcc-msm8660");
-- 
2.43.0


