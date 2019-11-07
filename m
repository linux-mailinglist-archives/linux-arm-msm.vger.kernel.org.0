Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 09600F3879
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Nov 2019 20:21:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725823AbfKGTVl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 7 Nov 2019 14:21:41 -0500
Received: from mail-pl1-f195.google.com ([209.85.214.195]:34425 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725497AbfKGTVl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 7 Nov 2019 14:21:41 -0500
Received: by mail-pl1-f195.google.com with SMTP id k7so2215606pll.1;
        Thu, 07 Nov 2019 11:21:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=NHTFT2cPFjuYBwVPZwFdreRjeBfaRUvxuPeY2T7WcJ8=;
        b=SAV2fdjaY/lz7R4b0tK5HDkEhr0Z5CgVcPqhZuiJT5gH2/yLcJjkqKxOwwPvNpXd80
         IuFs5fk0Woqb7lNK99CkiFunuJEpp+srqJA7e0POoSonJygR80MUSA/ti1fbfgtnFg+b
         f7nXcLZNSraVRuW884FykA5H+7eUYsFYw+8TJRIWycMEa+VzNgHn0fpkh8KT81EVr50K
         Jz69li8ulT9hRhmNMMWdoHEjC/ZoGCc1e1asuXhyUGTTZxWXZ/zdskJQcY8kyZBeBrfF
         2TQs00sqSqElBUkJ7oZ52nszBDs3ni/4oGMfsTtAcI9QDNbChGZSbRfmHVq0RAjWuWKv
         WbeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=NHTFT2cPFjuYBwVPZwFdreRjeBfaRUvxuPeY2T7WcJ8=;
        b=I9LKkuQaHBhJqcbHJXHqIUyxfIjLUmaan3/r8U6RbWWvoceaJoD4wCHrh2WR3YWrWV
         3lD1UfGpvMbTCGllTlEP0iozpEzGcviFXds7vom6osKzk6a0T16N3Oh0LmeJc1tU7beo
         auneQz3picbJJzuePw80/uYVbaILn4zL4IGv6LjeAxkQnPDirBKZmuOkASdWJfwXy3E4
         LOMCb6K/x63cawyKlI+HMJR0+wH7I2pCKQ38le0V215Dpx6YM0fxcpwb9XJd3hmUUkW8
         i2dPC8fS1iFuD9KdXLyPCnd5S2LIQA/NTwAnB6LIP0u8IzhqIG/kX3A6hJRlQfS8f5vB
         1pnA==
X-Gm-Message-State: APjAAAUmXBonAvX843zPfGAwzuPyF7Dfwo8vnX5/f5bu82lQ2FTFODZD
        lQLTNVDae4KST47kky4ZARM=
X-Google-Smtp-Source: APXvYqyCYF32nN8OLrhrMBeafgSWVVqI+xn+ZmEnLg3wEbdX3piHCvEQbtLxuYyX57sZxqahmbgDnQ==
X-Received: by 2002:a17:90a:24ac:: with SMTP id i41mr7650334pje.11.1573154500304;
        Thu, 07 Nov 2019 11:21:40 -0800 (PST)
Received: from aw-bldr-10.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id b25sm3328796pfi.155.2019.11.07.11.21.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Nov 2019 11:21:39 -0800 (PST)
From:   Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
To:     mturquette@baylibre.com, sboyd@kernel.org
Cc:     agross@kernel.org, bjorn.andersson@linaro.org,
        sibis@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Subject: [PATCH] clk: qcom: Enumerate clocks and reset needed to boot the 8998 modem
Date:   Thu,  7 Nov 2019 11:21:36 -0800
Message-Id: <20191107192136.5880-1-jeffrey.l.hugo@gmail.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

We need to control five additional clocks and a reset inorder to boot the
modem on msm8998.  If we can boot the modem, we have a place to run the
wlan firmware and get wifi up and running.

Signed-off-by: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
---
 drivers/clk/qcom/gcc-msm8998.c               | 72 ++++++++++++++++++++
 include/dt-bindings/clock/qcom,gcc-msm8998.h |  6 ++
 2 files changed, 78 insertions(+)

diff --git a/drivers/clk/qcom/gcc-msm8998.c b/drivers/clk/qcom/gcc-msm8998.c
index 091acd59c1d6..cf31b5d03270 100644
--- a/drivers/clk/qcom/gcc-msm8998.c
+++ b/drivers/clk/qcom/gcc-msm8998.c
@@ -1266,6 +1266,72 @@ static struct clk_branch gcc_bimc_mss_q6_axi_clk = {
 	},
 };
 
+static struct clk_branch gcc_mss_cfg_ahb_clk = {
+	.halt_reg = 0x8a000,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x8a000,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_mss_cfg_ahb_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_mss_snoc_axi_clk = {
+	.halt_reg = 0x8a03c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x8a03c,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_mss_snoc_axi_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_mss_mnoc_bimc_axi_clk = {
+	.halt_reg = 0x8a004,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x8a004,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_mss_mnoc_bimc_axi_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_boot_rom_ahb_clk = {
+	.halt_reg = 0x38004,
+	.halt_check = BRANCH_HALT_VOTED,
+	.hwcg_reg = 0x38004,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x52004,
+		.enable_mask = BIT(10),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_boot_rom_ahb_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_mss_gpll0_div_clk_src = {
+	.halt_check = BRANCH_HALT_DELAY,
+	.clkr = {
+		.enable_reg = 0x5200c,
+		.enable_mask = BIT(2),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_mss_gpll0_div_clk_src",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
 static struct clk_branch gcc_blsp1_ahb_clk = {
 	.halt_reg = 0x17004,
 	.halt_check = BRANCH_HALT_VOTED,
@@ -2832,6 +2898,11 @@ static struct clk_regmap *gcc_msm8998_clocks[] = {
 	[GCC_USB3_CLKREF_CLK] = &gcc_usb3_clkref_clk.clkr,
 	[GCC_PCIE_CLKREF_CLK] = &gcc_pcie_clkref_clk.clkr,
 	[GCC_RX1_USB2_CLKREF_CLK] = &gcc_rx1_usb2_clkref_clk.clkr,
+	[GCC_MSS_CFG_AHB_CLK] = &gcc_mss_cfg_ahb_clk.clkr,
+	[GCC_BOOT_ROM_AHB_CLK] = &gcc_boot_rom_ahb_clk.clkr,
+	[GCC_MSS_GPLL0_DIV_CLK_SRC] = &gcc_mss_gpll0_div_clk_src.clkr,
+	[GCC_MSS_SNOC_AXI_CLK] = &gcc_mss_snoc_axi_clk.clkr,
+	[GCC_MSS_MNOC_BIMC_AXI_CLK] = &gcc_mss_mnoc_bimc_axi_clk.clkr,
 };
 
 static struct gdsc *gcc_msm8998_gdscs[] = {
@@ -2928,6 +2999,7 @@ static const struct qcom_reset_map gcc_msm8998_resets[] = {
 	[GCC_GPU_BCR] = { 0x71000 },
 	[GCC_SPSS_BCR] = { 0x72000 },
 	[GCC_OBT_ODT_BCR] = { 0x73000 },
+	[GCC_MSS_RESTART] = { 0x79000 },
 	[GCC_VS_BCR] = { 0x7a000 },
 	[GCC_MSS_VS_RESET] = { 0x7a100 },
 	[GCC_GPU_VS_RESET] = { 0x7a104 },
diff --git a/include/dt-bindings/clock/qcom,gcc-msm8998.h b/include/dt-bindings/clock/qcom,gcc-msm8998.h
index ab376262fcea..de1d8a1f5966 100644
--- a/include/dt-bindings/clock/qcom,gcc-msm8998.h
+++ b/include/dt-bindings/clock/qcom,gcc-msm8998.h
@@ -177,6 +177,11 @@
 #define GCC_UFS_CLKREF_CLK					168
 #define GCC_PCIE_CLKREF_CLK					169
 #define GCC_RX1_USB2_CLKREF_CLK					170
+#define GCC_MSS_CFG_AHB_CLK					171
+#define GCC_BOOT_ROM_AHB_CLK					172
+#define GCC_MSS_GPLL0_DIV_CLK_SRC				173
+#define GCC_MSS_SNOC_AXI_CLK					174
+#define GCC_MSS_MNOC_BIMC_AXI_CLK				175
 
 #define PCIE_0_GDSC						0
 #define UFS_GDSC						1
@@ -290,5 +295,6 @@
 #define GCC_MSMPU_BCR						105
 #define GCC_QUSB2PHY_PRIM_BCR					106
 #define GCC_QUSB2PHY_SEC_BCR					107
+#define GCC_MSS_RESTART						108
 
 #endif
-- 
2.17.1

