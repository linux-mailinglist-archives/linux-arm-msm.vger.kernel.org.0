Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 46E3829D6D9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Oct 2020 23:19:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729986AbgJ1WS5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 28 Oct 2020 18:18:57 -0400
Received: from mail.kernel.org ([198.145.29.99]:60548 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731681AbgJ1WRn (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 28 Oct 2020 18:17:43 -0400
Received: from localhost.localdomain (unknown [122.171.163.58])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 3FC0124630;
        Wed, 28 Oct 2020 08:30:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1603873834;
        bh=yfRnR2kcEcmI0HZVXck0BkXyEbDtL8vXWwXlpClgNno=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=uidGV2GThQq0ulPUoDifV0xsXUmTTra7lkqtcaCIto8K3GTMbDGGFcFTthyRJV9iS
         V/QtzShMLksLwVg/z2mmq94p6/DlGAbyIAvq1CveiLik/6OY9JP5JhFMAxNrGD+cRj
         A5cD7YGvoAC5Fv4z6MnsqiXDeeEWrsHPEdJ/PyIo=
From:   Vinod Koul <vkoul@kernel.org>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Jeevan Shriram <jshriram@codeaurora.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Vinod Koul <vkoul@kernel.org>
Subject: [PATCH 2/2] pinctrl: qcom: Add SDX55 pincontrol driver
Date:   Wed, 28 Oct 2020 14:00:17 +0530
Message-Id: <20201028083017.611810-2-vkoul@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201028083017.611810-1-vkoul@kernel.org>
References: <20201028083017.611810-1-vkoul@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Jeevan Shriram <jshriram@codeaurora.org>

Add initial Qualcomm SDX55 pinctrl driver to support pin configuration
with pinctrl framewor for SDX55 SoC.

Signed-off-by: Jeevan Shriram <jshriram@codeaurora.org>
[ported from downstream and tidy up]
Signed-off-by: Vinod Koul <vkoul@kernel.org>
---
 drivers/pinctrl/qcom/Kconfig         |    9 +
 drivers/pinctrl/qcom/Makefile        |    1 +
 drivers/pinctrl/qcom/pinctrl-sdx55.c | 1364 ++++++++++++++++++++++++++
 3 files changed, 1374 insertions(+)
 create mode 100644 drivers/pinctrl/qcom/pinctrl-sdx55.c

diff --git a/drivers/pinctrl/qcom/Kconfig b/drivers/pinctrl/qcom/Kconfig
index 5fe7b8aaf69d..a84961d415fa 100644
--- a/drivers/pinctrl/qcom/Kconfig
+++ b/drivers/pinctrl/qcom/Kconfig
@@ -218,6 +218,15 @@ config PINCTRL_SDM845
 	 Qualcomm Technologies Inc TLMM block found on the Qualcomm
 	 Technologies Inc SDM845 platform.
 
+config PINCTRL_SDX55
+	tristate "Qualcomm Technologies Inc SDX55 pin controller driver"
+	depends on GPIOLIB && OF
+	select PINCTRL_MSM
+	help
+	 This is the pinctrl, pinmux, pinconf and gpiolib driver for the
+	 Qualcomm Technologies Inc TLMM block found on the Qualcomm
+	 Technologies Inc SDX55 platform.
+
 config PINCTRL_SM8150
 	tristate "Qualcomm Technologies Inc SM8150 pin controller driver"
 	depends on GPIOLIB && OF
diff --git a/drivers/pinctrl/qcom/Makefile b/drivers/pinctrl/qcom/Makefile
index 9e3d9c91a444..2f9e5bbadeda 100644
--- a/drivers/pinctrl/qcom/Makefile
+++ b/drivers/pinctrl/qcom/Makefile
@@ -26,5 +26,6 @@ obj-$(CONFIG_PINCTRL_QCOM_SSBI_PMIC) += pinctrl-ssbi-mpp.o
 obj-$(CONFIG_PINCTRL_SC7180)	+= pinctrl-sc7180.o
 obj-$(CONFIG_PINCTRL_SDM660)   += pinctrl-sdm660.o
 obj-$(CONFIG_PINCTRL_SDM845) += pinctrl-sdm845.o
+obj-$(CONFIG_PINCTRL_SDX55) += pinctrl-sdx55.o
 obj-$(CONFIG_PINCTRL_SM8150) += pinctrl-sm8150.o
 obj-$(CONFIG_PINCTRL_SM8250) += pinctrl-sm8250.o
diff --git a/drivers/pinctrl/qcom/pinctrl-sdx55.c b/drivers/pinctrl/qcom/pinctrl-sdx55.c
new file mode 100644
index 000000000000..02dffe450043
--- /dev/null
+++ b/drivers/pinctrl/qcom/pinctrl-sdx55.c
@@ -0,0 +1,1364 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2018-2020, The Linux Foundation. All rights reserved.
+ */
+
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/pinctrl/pinctrl.h>
+
+#include "pinctrl-msm.h"
+
+#define FUNCTION(fname)			                \
+	[msm_mux_##fname] = {		                \
+		.name = #fname,				\
+		.groups = fname##_groups,               \
+		.ngroups = ARRAY_SIZE(fname##_groups),	\
+	}
+
+#define REG_SIZE 0x1000
+
+#define PINGROUP(id, f1, f2, f3, f4, f5, f6, f7, f8, f9)	\
+	{					        \
+		.name = "gpio" #id,			\
+		.pins = gpio##id##_pins,		\
+		.npins = (unsigned int)ARRAY_SIZE(gpio##id##_pins),	\
+		.funcs = (int[]){			\
+			msm_mux_gpio, /* gpio mode */	\
+			msm_mux_##f1,			\
+			msm_mux_##f2,			\
+			msm_mux_##f3,			\
+			msm_mux_##f4,			\
+			msm_mux_##f5,			\
+			msm_mux_##f6,			\
+			msm_mux_##f7,			\
+			msm_mux_##f8,			\
+			msm_mux_##f9			\
+		},				        \
+		.nfuncs = 10,				\
+		.ctl_reg = REG_SIZE * id,			\
+		.io_reg = 0x4 + REG_SIZE * id,		\
+		.intr_cfg_reg = 0x8 + REG_SIZE * id,		\
+		.intr_status_reg = 0xc + REG_SIZE * id,	\
+		.intr_target_reg = 0x8 + REG_SIZE * id,	\
+		.mux_bit = 2,			\
+		.pull_bit = 0,			\
+		.drv_bit = 6,			\
+		.oe_bit = 9,			\
+		.in_bit = 0,			\
+		.out_bit = 1,			\
+		.intr_enable_bit = 0,		\
+		.intr_status_bit = 0,		\
+		.intr_target_bit = 5,		\
+		.intr_target_kpss_val = 3,	\
+		.intr_raw_status_bit = 4,	\
+		.intr_polarity_bit = 1,		\
+		.intr_detection_bit = 2,	\
+		.intr_detection_width = 2,	\
+	}
+
+#define SDC_PINGROUP(pg_name, ctl, pull, drv)	\
+	{					        \
+		.name = #pg_name,			\
+		.pins = pg_name##_pins,			\
+		.npins = (unsigned int)ARRAY_SIZE(pg_name##_pins),	\
+		.ctl_reg = ctl,				\
+		.io_reg = 0,				\
+		.intr_cfg_reg = 0,			\
+		.intr_status_reg = 0,			\
+		.intr_target_reg = 0,			\
+		.mux_bit = -1,				\
+		.pull_bit = pull,			\
+		.drv_bit = drv,				\
+		.oe_bit = -1,				\
+		.in_bit = -1,				\
+		.out_bit = -1,				\
+		.intr_enable_bit = -1,			\
+		.intr_status_bit = -1,			\
+		.intr_target_bit = -1,			\
+		.intr_raw_status_bit = -1,		\
+		.intr_polarity_bit = -1,		\
+		.intr_detection_bit = -1,		\
+		.intr_detection_width = -1,		\
+	}
+
+#define UFS_RESET(pg_name, offset)				\
+	{					        \
+		.name = #pg_name,			\
+		.pins = pg_name##_pins,			\
+		.npins = (unsigned int)ARRAY_SIZE(pg_name##_pins),	\
+		.ctl_reg = offset,			\
+		.io_reg = offset + 0x4,			\
+		.intr_cfg_reg = 0,			\
+		.intr_status_reg = 0,			\
+		.intr_target_reg = 0,			\
+		.mux_bit = -1,				\
+		.pull_bit = 3,				\
+		.drv_bit = 0,				\
+		.oe_bit = -1,				\
+		.in_bit = -1,				\
+		.out_bit = 0,				\
+		.intr_enable_bit = -1,			\
+		.intr_status_bit = -1,			\
+		.intr_target_bit = -1,			\
+		.intr_raw_status_bit = -1,		\
+		.intr_polarity_bit = -1,		\
+		.intr_detection_bit = -1,		\
+		.intr_detection_width = -1,		\
+	}
+
+static const struct pinctrl_pin_desc sdx55_pins[] = {
+	PINCTRL_PIN(0, "GPIO_0"),
+	PINCTRL_PIN(1, "GPIO_1"),
+	PINCTRL_PIN(2, "GPIO_2"),
+	PINCTRL_PIN(3, "GPIO_3"),
+	PINCTRL_PIN(4, "GPIO_4"),
+	PINCTRL_PIN(5, "GPIO_5"),
+	PINCTRL_PIN(6, "GPIO_6"),
+	PINCTRL_PIN(7, "GPIO_7"),
+	PINCTRL_PIN(8, "GPIO_8"),
+	PINCTRL_PIN(9, "GPIO_9"),
+	PINCTRL_PIN(10, "GPIO_10"),
+	PINCTRL_PIN(11, "GPIO_11"),
+	PINCTRL_PIN(12, "GPIO_12"),
+	PINCTRL_PIN(13, "GPIO_13"),
+	PINCTRL_PIN(14, "GPIO_14"),
+	PINCTRL_PIN(15, "GPIO_15"),
+	PINCTRL_PIN(16, "GPIO_16"),
+	PINCTRL_PIN(17, "GPIO_17"),
+	PINCTRL_PIN(18, "GPIO_18"),
+	PINCTRL_PIN(19, "GPIO_19"),
+	PINCTRL_PIN(20, "GPIO_20"),
+	PINCTRL_PIN(21, "GPIO_21"),
+	PINCTRL_PIN(22, "GPIO_22"),
+	PINCTRL_PIN(23, "GPIO_23"),
+	PINCTRL_PIN(24, "GPIO_24"),
+	PINCTRL_PIN(25, "GPIO_25"),
+	PINCTRL_PIN(26, "GPIO_26"),
+	PINCTRL_PIN(27, "GPIO_27"),
+	PINCTRL_PIN(28, "GPIO_28"),
+	PINCTRL_PIN(29, "GPIO_29"),
+	PINCTRL_PIN(30, "GPIO_30"),
+	PINCTRL_PIN(31, "GPIO_31"),
+	PINCTRL_PIN(32, "GPIO_32"),
+	PINCTRL_PIN(33, "GPIO_33"),
+	PINCTRL_PIN(34, "GPIO_34"),
+	PINCTRL_PIN(35, "GPIO_35"),
+	PINCTRL_PIN(36, "GPIO_36"),
+	PINCTRL_PIN(37, "GPIO_37"),
+	PINCTRL_PIN(38, "GPIO_38"),
+	PINCTRL_PIN(39, "GPIO_39"),
+	PINCTRL_PIN(40, "GPIO_40"),
+	PINCTRL_PIN(41, "GPIO_41"),
+	PINCTRL_PIN(42, "GPIO_42"),
+	PINCTRL_PIN(43, "GPIO_43"),
+	PINCTRL_PIN(44, "GPIO_44"),
+	PINCTRL_PIN(45, "GPIO_45"),
+	PINCTRL_PIN(46, "GPIO_46"),
+	PINCTRL_PIN(47, "GPIO_47"),
+	PINCTRL_PIN(48, "GPIO_48"),
+	PINCTRL_PIN(49, "GPIO_49"),
+	PINCTRL_PIN(50, "GPIO_50"),
+	PINCTRL_PIN(51, "GPIO_51"),
+	PINCTRL_PIN(52, "GPIO_52"),
+	PINCTRL_PIN(53, "GPIO_53"),
+	PINCTRL_PIN(54, "GPIO_54"),
+	PINCTRL_PIN(55, "GPIO_55"),
+	PINCTRL_PIN(56, "GPIO_56"),
+	PINCTRL_PIN(57, "GPIO_57"),
+	PINCTRL_PIN(58, "GPIO_58"),
+	PINCTRL_PIN(59, "GPIO_59"),
+	PINCTRL_PIN(60, "GPIO_60"),
+	PINCTRL_PIN(61, "GPIO_61"),
+	PINCTRL_PIN(62, "GPIO_62"),
+	PINCTRL_PIN(63, "GPIO_63"),
+	PINCTRL_PIN(64, "GPIO_64"),
+	PINCTRL_PIN(65, "GPIO_65"),
+	PINCTRL_PIN(66, "GPIO_66"),
+	PINCTRL_PIN(67, "GPIO_67"),
+	PINCTRL_PIN(68, "GPIO_68"),
+	PINCTRL_PIN(69, "GPIO_69"),
+	PINCTRL_PIN(70, "GPIO_70"),
+	PINCTRL_PIN(71, "GPIO_71"),
+	PINCTRL_PIN(72, "GPIO_72"),
+	PINCTRL_PIN(73, "GPIO_73"),
+	PINCTRL_PIN(74, "GPIO_74"),
+	PINCTRL_PIN(75, "GPIO_75"),
+	PINCTRL_PIN(76, "GPIO_76"),
+	PINCTRL_PIN(77, "GPIO_77"),
+	PINCTRL_PIN(78, "GPIO_78"),
+	PINCTRL_PIN(79, "GPIO_79"),
+	PINCTRL_PIN(80, "GPIO_80"),
+	PINCTRL_PIN(81, "GPIO_81"),
+	PINCTRL_PIN(82, "GPIO_82"),
+	PINCTRL_PIN(83, "GPIO_83"),
+	PINCTRL_PIN(84, "GPIO_84"),
+	PINCTRL_PIN(85, "GPIO_85"),
+	PINCTRL_PIN(86, "GPIO_86"),
+	PINCTRL_PIN(87, "GPIO_87"),
+	PINCTRL_PIN(88, "GPIO_88"),
+	PINCTRL_PIN(89, "GPIO_89"),
+	PINCTRL_PIN(90, "GPIO_90"),
+	PINCTRL_PIN(91, "GPIO_91"),
+	PINCTRL_PIN(92, "GPIO_92"),
+	PINCTRL_PIN(93, "GPIO_93"),
+	PINCTRL_PIN(94, "GPIO_94"),
+	PINCTRL_PIN(95, "GPIO_95"),
+	PINCTRL_PIN(96, "GPIO_96"),
+	PINCTRL_PIN(97, "GPIO_97"),
+	PINCTRL_PIN(98, "GPIO_98"),
+	PINCTRL_PIN(99, "GPIO_99"),
+	PINCTRL_PIN(100, "GPIO_100"),
+	PINCTRL_PIN(101, "GPIO_101"),
+	PINCTRL_PIN(102, "GPIO_102"),
+	PINCTRL_PIN(103, "GPIO_103"),
+	PINCTRL_PIN(104, "GPIO_104"),
+	PINCTRL_PIN(105, "GPIO_105"),
+	PINCTRL_PIN(106, "GPIO_106"),
+	PINCTRL_PIN(107, "GPIO_107"),
+	PINCTRL_PIN(108, "UFS_RESET"),
+	PINCTRL_PIN(109, "SDC1_RCLK"),
+	PINCTRL_PIN(110, "SDC1_CLK"),
+	PINCTRL_PIN(111, "SDC1_CMD"),
+	PINCTRL_PIN(112, "SDC1_DATA"),
+};
+
+#define DECLARE_MSM_GPIO_PINS(pin) \
+	static const unsigned int gpio##pin##_pins[] = { pin }
+DECLARE_MSM_GPIO_PINS(0);
+DECLARE_MSM_GPIO_PINS(1);
+DECLARE_MSM_GPIO_PINS(2);
+DECLARE_MSM_GPIO_PINS(3);
+DECLARE_MSM_GPIO_PINS(4);
+DECLARE_MSM_GPIO_PINS(5);
+DECLARE_MSM_GPIO_PINS(6);
+DECLARE_MSM_GPIO_PINS(7);
+DECLARE_MSM_GPIO_PINS(8);
+DECLARE_MSM_GPIO_PINS(9);
+DECLARE_MSM_GPIO_PINS(10);
+DECLARE_MSM_GPIO_PINS(11);
+DECLARE_MSM_GPIO_PINS(12);
+DECLARE_MSM_GPIO_PINS(13);
+DECLARE_MSM_GPIO_PINS(14);
+DECLARE_MSM_GPIO_PINS(15);
+DECLARE_MSM_GPIO_PINS(16);
+DECLARE_MSM_GPIO_PINS(17);
+DECLARE_MSM_GPIO_PINS(18);
+DECLARE_MSM_GPIO_PINS(19);
+DECLARE_MSM_GPIO_PINS(20);
+DECLARE_MSM_GPIO_PINS(21);
+DECLARE_MSM_GPIO_PINS(22);
+DECLARE_MSM_GPIO_PINS(23);
+DECLARE_MSM_GPIO_PINS(24);
+DECLARE_MSM_GPIO_PINS(25);
+DECLARE_MSM_GPIO_PINS(26);
+DECLARE_MSM_GPIO_PINS(27);
+DECLARE_MSM_GPIO_PINS(28);
+DECLARE_MSM_GPIO_PINS(29);
+DECLARE_MSM_GPIO_PINS(30);
+DECLARE_MSM_GPIO_PINS(31);
+DECLARE_MSM_GPIO_PINS(32);
+DECLARE_MSM_GPIO_PINS(33);
+DECLARE_MSM_GPIO_PINS(34);
+DECLARE_MSM_GPIO_PINS(35);
+DECLARE_MSM_GPIO_PINS(36);
+DECLARE_MSM_GPIO_PINS(37);
+DECLARE_MSM_GPIO_PINS(38);
+DECLARE_MSM_GPIO_PINS(39);
+DECLARE_MSM_GPIO_PINS(40);
+DECLARE_MSM_GPIO_PINS(41);
+DECLARE_MSM_GPIO_PINS(42);
+DECLARE_MSM_GPIO_PINS(43);
+DECLARE_MSM_GPIO_PINS(44);
+DECLARE_MSM_GPIO_PINS(45);
+DECLARE_MSM_GPIO_PINS(46);
+DECLARE_MSM_GPIO_PINS(47);
+DECLARE_MSM_GPIO_PINS(48);
+DECLARE_MSM_GPIO_PINS(49);
+DECLARE_MSM_GPIO_PINS(50);
+DECLARE_MSM_GPIO_PINS(51);
+DECLARE_MSM_GPIO_PINS(52);
+DECLARE_MSM_GPIO_PINS(53);
+DECLARE_MSM_GPIO_PINS(54);
+DECLARE_MSM_GPIO_PINS(55);
+DECLARE_MSM_GPIO_PINS(56);
+DECLARE_MSM_GPIO_PINS(57);
+DECLARE_MSM_GPIO_PINS(58);
+DECLARE_MSM_GPIO_PINS(59);
+DECLARE_MSM_GPIO_PINS(60);
+DECLARE_MSM_GPIO_PINS(61);
+DECLARE_MSM_GPIO_PINS(62);
+DECLARE_MSM_GPIO_PINS(63);
+DECLARE_MSM_GPIO_PINS(64);
+DECLARE_MSM_GPIO_PINS(65);
+DECLARE_MSM_GPIO_PINS(66);
+DECLARE_MSM_GPIO_PINS(67);
+DECLARE_MSM_GPIO_PINS(68);
+DECLARE_MSM_GPIO_PINS(69);
+DECLARE_MSM_GPIO_PINS(70);
+DECLARE_MSM_GPIO_PINS(71);
+DECLARE_MSM_GPIO_PINS(72);
+DECLARE_MSM_GPIO_PINS(73);
+DECLARE_MSM_GPIO_PINS(74);
+DECLARE_MSM_GPIO_PINS(75);
+DECLARE_MSM_GPIO_PINS(76);
+DECLARE_MSM_GPIO_PINS(77);
+DECLARE_MSM_GPIO_PINS(78);
+DECLARE_MSM_GPIO_PINS(79);
+DECLARE_MSM_GPIO_PINS(80);
+DECLARE_MSM_GPIO_PINS(81);
+DECLARE_MSM_GPIO_PINS(82);
+DECLARE_MSM_GPIO_PINS(83);
+DECLARE_MSM_GPIO_PINS(84);
+DECLARE_MSM_GPIO_PINS(85);
+DECLARE_MSM_GPIO_PINS(86);
+DECLARE_MSM_GPIO_PINS(87);
+DECLARE_MSM_GPIO_PINS(88);
+DECLARE_MSM_GPIO_PINS(89);
+DECLARE_MSM_GPIO_PINS(90);
+DECLARE_MSM_GPIO_PINS(91);
+DECLARE_MSM_GPIO_PINS(92);
+DECLARE_MSM_GPIO_PINS(93);
+DECLARE_MSM_GPIO_PINS(94);
+DECLARE_MSM_GPIO_PINS(95);
+DECLARE_MSM_GPIO_PINS(96);
+DECLARE_MSM_GPIO_PINS(97);
+DECLARE_MSM_GPIO_PINS(98);
+DECLARE_MSM_GPIO_PINS(99);
+DECLARE_MSM_GPIO_PINS(100);
+DECLARE_MSM_GPIO_PINS(101);
+DECLARE_MSM_GPIO_PINS(102);
+DECLARE_MSM_GPIO_PINS(103);
+DECLARE_MSM_GPIO_PINS(104);
+DECLARE_MSM_GPIO_PINS(105);
+DECLARE_MSM_GPIO_PINS(106);
+DECLARE_MSM_GPIO_PINS(107);
+
+static const unsigned int ufs_reset_pins[] = { 108 };
+static const unsigned int sdc1_rclk_pins[] = { 109 };
+static const unsigned int sdc1_clk_pins[] = { 110 };
+static const unsigned int sdc1_cmd_pins[] = { 111 };
+static const unsigned int sdc1_data_pins[] = { 112 };
+
+enum sdx55_functions {
+	msm_mux_adsp_ext,
+	msm_mux_atest,
+	msm_mux_audio_ref,
+	msm_mux_bimc_dte0,
+	msm_mux_bimc_dte1,
+	msm_mux_blsp_i2c1,
+	msm_mux_blsp_i2c2,
+	msm_mux_blsp_i2c3,
+	msm_mux_blsp_i2c4,
+	msm_mux_blsp_spi1,
+	msm_mux_blsp_spi2,
+	msm_mux_blsp_spi3,
+	msm_mux_blsp_spi4,
+	msm_mux_blsp_uart1,
+	msm_mux_blsp_uart2,
+	msm_mux_blsp_uart3,
+	msm_mux_blsp_uart4,
+	msm_mux_char_exec,
+	msm_mux_coex_uart,
+	msm_mux_coex_uart2,
+	msm_mux_cri_trng,
+	msm_mux_cri_trng0,
+	msm_mux_cri_trng1,
+	msm_mux_dbg_out,
+	msm_mux_ddr_bist,
+	msm_mux_ddr_pxi0,
+	msm_mux_ebi0_wrcdc,
+	msm_mux_ebi2_a,
+	msm_mux_ebi2_lcd,
+	msm_mux_emac_gcc0,
+	msm_mux_emac_gcc1,
+	msm_mux_emac_pps0,
+	msm_mux_emac_pps1,
+	msm_mux_ext_dbg,
+	msm_mux_gcc_gp1,
+	msm_mux_gcc_gp2,
+	msm_mux_gcc_gp3,
+	msm_mux_gcc_plltest,
+	msm_mux_gpio,
+	msm_mux_i2s_mclk,
+	msm_mux_jitter_bist,
+	msm_mux_ldo_en,
+	msm_mux_ldo_update,
+	msm_mux_mgpi_clk,
+	msm_mux_m_voc,
+	msm_mux_native_char,
+	msm_mux_native_char0,
+	msm_mux_native_char1,
+	msm_mux_native_char2,
+	msm_mux_native_char3,
+	msm_mux_native_tsens,
+	msm_mux_native_tsense,
+	msm_mux_nav_gpio,
+	msm_mux_pa_indicator,
+	msm_mux_pcie_clkreq,
+	msm_mux_pci_e,
+	msm_mux_pll_bist,
+	msm_mux_pll_ref,
+	msm_mux_pll_test,
+	msm_mux_pri_mi2s,
+	msm_mux_prng_rosc,
+	msm_mux_qdss_cti,
+	msm_mux_qdss_gpio,
+	msm_mux_qdss_gpio0,
+	msm_mux_qdss_gpio1,
+	msm_mux_qdss_gpio2,
+	msm_mux_qdss_gpio3,
+	msm_mux_qdss_gpio4,
+	msm_mux_qdss_gpio5,
+	msm_mux_qdss_gpio6,
+	msm_mux_qdss_gpio7,
+	msm_mux_qdss_gpio8,
+	msm_mux_qdss_gpio9,
+	msm_mux_qdss_gpio10,
+	msm_mux_qdss_gpio11,
+	msm_mux_qdss_gpio12,
+	msm_mux_qdss_gpio13,
+	msm_mux_qdss_gpio14,
+	msm_mux_qdss_gpio15,
+	msm_mux_qdss_stm0,
+	msm_mux_qdss_stm1,
+	msm_mux_qdss_stm2,
+	msm_mux_qdss_stm3,
+	msm_mux_qdss_stm4,
+	msm_mux_qdss_stm5,
+	msm_mux_qdss_stm6,
+	msm_mux_qdss_stm7,
+	msm_mux_qdss_stm8,
+	msm_mux_qdss_stm9,
+	msm_mux_qdss_stm10,
+	msm_mux_qdss_stm11,
+	msm_mux_qdss_stm12,
+	msm_mux_qdss_stm13,
+	msm_mux_qdss_stm14,
+	msm_mux_qdss_stm15,
+	msm_mux_qdss_stm16,
+	msm_mux_qdss_stm17,
+	msm_mux_qdss_stm18,
+	msm_mux_qdss_stm19,
+	msm_mux_qdss_stm20,
+	msm_mux_qdss_stm21,
+	msm_mux_qdss_stm22,
+	msm_mux_qdss_stm23,
+	msm_mux_qdss_stm24,
+	msm_mux_qdss_stm25,
+	msm_mux_qdss_stm26,
+	msm_mux_qdss_stm27,
+	msm_mux_qdss_stm28,
+	msm_mux_qdss_stm29,
+	msm_mux_qdss_stm30,
+	msm_mux_qdss_stm31,
+	msm_mux_qlink0_en,
+	msm_mux_qlink0_req,
+	msm_mux_qlink0_wmss,
+	msm_mux_qlink1_en,
+	msm_mux_qlink1_req,
+	msm_mux_qlink1_wmss,
+	msm_mux_spmi_coex,
+	msm_mux_sec_mi2s,
+	msm_mux_spmi_vgi,
+	msm_mux_tgu_ch0,
+	msm_mux_uim1_clk,
+	msm_mux_uim1_data,
+	msm_mux_uim1_present,
+	msm_mux_uim1_reset,
+	msm_mux_uim2_clk,
+	msm_mux_uim2_data,
+	msm_mux_uim2_present,
+	msm_mux_uim2_reset,
+	msm_mux_usb2phy_ac,
+	msm_mux_vsense_trigger,
+	msm_mux__,
+};
+
+static const char * const gpio_groups[] = {
+	"gpio0", "gpio1", "gpio2", "gpio3", "gpio4", "gpio5", "gpio6", "gpio7",
+	"gpio8", "gpio9", "gpio10", "gpio11", "gpio12", "gpio13", "gpio14",
+	"gpio15", "gpio16", "gpio17", "gpio18", "gpio19", "gpio20", "gpio21",
+	"gpio22", "gpio23", "gpio24", "gpio25", "gpio26", "gpio27", "gpio28",
+	"gpio29", "gpio30", "gpio31", "gpio32", "gpio33", "gpio34", "gpio35",
+	"gpio36", "gpio37", "gpio38", "gpio39", "gpio40", "gpio41", "gpio42",
+	"gpio43", "gpio44", "gpio45", "gpio46", "gpio47", "gpio48", "gpio49",
+	"gpio50", "gpio51", "gpio52", "gpio52", "gpio53", "gpio53", "gpio54",
+	"gpio55", "gpio56", "gpio57", "gpio58", "gpio59", "gpio60", "gpio61",
+	"gpio62", "gpio63", "gpio64", "gpio65", "gpio66", "gpio67", "gpio68",
+	"gpio69", "gpio70", "gpio71", "gpio72", "gpio73", "gpio74", "gpio75",
+	"gpio76", "gpio77", "gpio78", "gpio79", "gpio80", "gpio81", "gpio82",
+	"gpio83", "gpio84", "gpio85", "gpio86", "gpio87", "gpio88", "gpio89",
+	"gpio90", "gpio91", "gpio92", "gpio93", "gpio94", "gpio95", "gpio96",
+	"gpio97", "gpio98", "gpio99", "gpio100", "gpio101", "gpio102",
+	"gpio103", "gpio104", "gpio105", "gpio106", "gpio107",
+};
+
+static const char * const qdss_stm11_groups[] = {
+	"gpio44",
+};
+
+static const char * const qdss_stm10_groups[] = {
+	"gpio45",
+};
+
+static const char * const ddr_pxi0_groups[] = {
+	"gpio45", "gpio46",
+};
+
+static const char * const m_voc_groups[] = {
+	"gpio46", "gpio48", "gpio49", "gpio59", "gpio60",
+};
+
+static const char * const ddr_bist_groups[] = {
+	"gpio46", "gpio47", "gpio48", "gpio49",
+};
+
+static const char * const blsp_spi1_groups[] = {
+	"gpio52", "gpio62", "gpio71", "gpio80", "gpio81", "gpio82", "gpio83",
+};
+
+static const char * const qdss_stm14_groups[] = {
+	"gpio52",
+};
+
+static const char * const pci_e_groups[] = {
+	"gpio53",
+};
+
+static const char * const qdss_stm13_groups[] = {
+	"gpio53",
+};
+
+static const char * const tgu_ch0_groups[] = {
+	"gpio55",
+};
+
+static const char * const pcie_clkreq_groups[] = {
+	"gpio56",
+};
+
+static const char * const qdss_stm9_groups[] = {
+	"gpio56",
+};
+
+static const char * const qdss_stm15_groups[] = {
+	"gpio57",
+};
+
+static const char * const mgpi_clk_groups[] = {
+	"gpio61", "gpio71",
+};
+
+static const char * const qdss_stm12_groups[] = {
+	"gpio61",
+};
+
+static const char * const i2s_mclk_groups[] = {
+	"gpio62",
+};
+
+static const char * const audio_ref_groups[] = {
+	"gpio62",
+};
+
+static const char * const ldo_update_groups[] = {
+	"gpio62",
+};
+
+static const char * const qdss_stm8_groups[] = {
+	"gpio62",
+};
+
+static const char * const qdss_stm7_groups[] = {
+	"gpio63",
+};
+
+static const char * const qdss_gpio4_groups[] = {
+	"gpio63",
+};
+
+static const char * const atest_groups[] = {
+	"gpio63",  "gpio64", "gpio65", "gpio66", "gpio67",
+};
+
+static const char * const qdss_stm6_groups[] = {
+	"gpio64",
+};
+
+static const char * const qdss_gpio5_groups[] = {
+	"gpio64",
+};
+
+static const char * const qdss_stm5_groups[] = {
+	"gpio65",
+};
+
+static const char * const qdss_gpio6_groups[] = {
+	"gpio65",
+};
+
+static const char * const qdss_stm4_groups[] = {
+	"gpio66",
+};
+
+static const char * const qdss_gpio7_groups[] = {
+	"gpio66",
+};
+
+static const char * const uim1_data_groups[] = {
+	"gpio67",
+};
+
+static const char * const uim1_present_groups[] = {
+	"gpio68",
+};
+
+static const char * const uim1_reset_groups[] = {
+	"gpio69",
+};
+
+static const char * const uim1_clk_groups[] = {
+	"gpio70",
+};
+
+static const char * const qlink1_en_groups[] = {
+	"gpio72",
+};
+
+static const char * const qlink1_req_groups[] = {
+	"gpio73",
+};
+
+static const char * const qlink1_wmss_groups[] = {
+	"gpio74",
+};
+
+static const char * const coex_uart2_groups[] = {
+	"gpio75", "gpio76",
+};
+
+static const char * const spmi_vgi_groups[] = {
+	"gpio78", "gpio79",
+};
+
+static const char * const gcc_plltest_groups[] = {
+	"gpio81", "gpio82",
+};
+
+static const char * const usb2phy_ac_groups[] = {
+	"gpio93",
+};
+
+static const char * const emac_pps1_groups[] = {
+	"gpio95",
+};
+
+static const char * const emac_pps0_groups[] = {
+	"gpio106",
+};
+
+static const char * const uim2_data_groups[] = {
+	"gpio0",
+};
+
+static const char * const qdss_stm31_groups[] = {
+	"gpio0",
+};
+
+static const char * const ebi0_wrcdc_groups[] = {
+	"gpio0", "gpio2",
+};
+
+static const char * const uim2_present_groups[] = {
+	"gpio1",
+};
+
+static const char * const qdss_stm30_groups[] = {
+	"gpio1",
+};
+
+static const char * const blsp_uart1_groups[] = {
+	"gpio0", "gpio1", "gpio2", "gpio3", "gpio20", "gpio21", "gpio22",
+	"gpio23",
+};
+
+static const char * const uim2_reset_groups[] = {
+	"gpio2",
+};
+
+static const char * const blsp_i2c1_groups[] = {
+	"gpio2", "gpio3", "gpio82", "gpio83",
+};
+
+static const char * const qdss_stm29_groups[] = {
+	"gpio2",
+};
+
+static const char * const uim2_clk_groups[] = {
+	"gpio3",
+};
+
+static const char * const qdss_stm28_groups[] = {
+	"gpio3",
+};
+
+static const char * const blsp_spi2_groups[] = {
+	"gpio4", "gpio5", "gpio6", "gpio7", "gpio52", "gpio62", "gpio71",
+};
+
+static const char * const blsp_uart2_groups[] = {
+	"gpio4", "gpio5", "gpio6", "gpio7", "gpio63", "gpio64", "gpio65",
+	"gpio66",
+};
+
+static const char * const qdss_stm23_groups[] = {
+	"gpio4",
+};
+
+static const char * const qdss_gpio3_groups[] = {
+	"gpio4",
+};
+
+static const char * const qdss_stm22_groups[] = {
+	"gpio5",
+};
+
+static const char * const qdss_gpio2_groups[] = {
+	"gpio5",
+};
+
+static const char * const blsp_i2c2_groups[] = {
+	"gpio6", "gpio7", "gpio65", "gpio66",
+};
+
+static const char * const char_exec_groups[] = {
+	"gpio6", "gpio7",
+};
+
+static const char * const qdss_stm21_groups[] = {
+	"gpio6",
+};
+
+static const char * const qdss_gpio1_groups[] = {
+	"gpio6",
+};
+
+static const char * const qdss_stm20_groups[] = {
+	"gpio7",
+};
+
+static const char * const qdss_gpio0_groups[] = {
+	"gpio7",
+};
+
+static const char * const pri_mi2s_groups[] = {
+	"gpio8", "gpio9", "gpio10", "gpio11", "gpio12", "gpio13", "gpio14",
+	"gpio15",
+};
+
+static const char * const blsp_spi3_groups[] = {
+	"gpio8", "gpio9", "gpio10", "gpio11", "gpio52", "gpio62", "gpio71",
+};
+
+static const char * const blsp_uart3_groups[] = {
+	"gpio8", "gpio9", "gpio10", "gpio11",
+};
+
+static const char * const ext_dbg_groups[] = {
+	"gpio8", "gpio9", "gpio10", "gpio11",
+};
+
+static const char * const ldo_en_groups[] = {
+	"gpio8",
+};
+
+static const char * const blsp_i2c3_groups[] = {
+	"gpio10", "gpio11",
+};
+
+static const char * const gcc_gp3_groups[] = {
+	"gpio11",
+};
+
+static const char * const qdss_stm19_groups[] = {
+	"gpio12",
+};
+
+static const char * const qdss_gpio12_groups[] = {
+	"gpio12",
+};
+
+static const char * const qdss_stm18_groups[] = {
+	"gpio13",
+};
+
+static const char * const qdss_gpio13_groups[] = {
+	"gpio13",
+};
+
+static const char * const emac_gcc1_groups[] = {
+	"gpio14",
+};
+
+static const char * const qdss_stm17_groups[] = {
+	"gpio14",
+};
+
+static const char * const qdss_gpio14_groups[] = {
+	"gpio14",
+};
+
+static const char * const bimc_dte0_groups[] = {
+	"gpio14", "gpio59",
+};
+
+static const char * const native_tsens_groups[] = {
+	"gpio14",
+};
+
+static const char * const vsense_trigger_groups[] = {
+	"gpio14",
+};
+
+static const char * const emac_gcc0_groups[] = {
+	"gpio15",
+};
+
+static const char * const qdss_stm16_groups[] = {
+	"gpio15",
+};
+
+static const char * const qdss_gpio15_groups[] = {
+	"gpio15",
+};
+
+static const char * const bimc_dte1_groups[] = {
+	"gpio15", "gpio61",
+};
+
+static const char * const sec_mi2s_groups[] = {
+	"gpio16", "gpio17", "gpio18", "gpio19", "gpio20", "gpio21", "gpio22",
+	"gpio23",
+};
+
+static const char * const blsp_spi4_groups[] = {
+	"gpio16", "gpio17", "gpio18", "gpio19", "gpio52", "gpio62", "gpio71",
+};
+
+static const char * const blsp_uart4_groups[] = {
+	"gpio16", "gpio17", "gpio18", "gpio19", "gpio20", "gpio21", "gpio22",
+	"gpio23",
+};
+
+static const char * const qdss_cti_groups[] = {
+	"gpio16", "gpio16", "gpio17", "gpio17", "gpio22", "gpio22", "gpio23",
+	"gpio23", "gpio54", "gpio54", "gpio55", "gpio55", "gpio59", "gpio60",
+	"gpio94", "gpio94", "gpio95", "gpio95",
+};
+
+static const char * const qdss_stm27_groups[] = {
+	"gpio16",
+};
+
+static const char * const qdss_gpio8_groups[] = {
+	"gpio16",
+};
+
+static const char * const qdss_stm26_groups[] = {
+	"gpio17",
+};
+
+static const char * const qdss_gpio9_groups[] = {
+	"gpio17",
+};
+
+static const char * const blsp_i2c4_groups[] = {
+	"gpio18", "gpio19", "gpio78", "gpio79",
+};
+
+static const char * const gcc_gp1_groups[] = {
+	"gpio18",
+};
+
+static const char * const qdss_stm25_groups[] = {
+	"gpio18",
+};
+
+static const char * const qdss_gpio10_groups[] = {
+	"gpio18",
+};
+
+static const char * const jitter_bist_groups[] = {
+	"gpio19",
+};
+
+static const char * const gcc_gp2_groups[] = {
+	"gpio19",
+};
+
+static const char * const qdss_stm24_groups[] = {
+	"gpio19",
+};
+
+static const char * const qdss_gpio11_groups[] = {
+	"gpio19",
+};
+
+static const char * const ebi2_a_groups[] = {
+	"gpio20",
+};
+
+static const char * const qdss_stm3_groups[] = {
+	"gpio20",
+};
+
+static const char * const ebi2_lcd_groups[] = {
+	"gpio21", "gpio22", "gpio23",
+};
+
+static const char * const qdss_stm2_groups[] = {
+	"gpio21",
+};
+
+static const char * const pll_bist_groups[] = {
+	"gpio22",
+};
+
+static const char * const qdss_stm1_groups[] = {
+	"gpio22",
+};
+
+static const char * const qdss_stm0_groups[] = {
+	"gpio23",
+};
+
+static const char * const adsp_ext_groups[] = {
+	"gpio24", "gpio25",
+};
+
+static const char * const native_char_groups[] = {
+	"gpio26",
+};
+
+static const char * const qlink0_wmss_groups[] = {
+	"gpio28",
+};
+
+static const char * const native_char3_groups[] = {
+	"gpio28",
+};
+
+static const char * const native_char2_groups[] = {
+	"gpio29",
+};
+
+static const char * const native_tsense_groups[] = {
+	"gpio29",
+};
+
+static const char * const nav_gpio_groups[] = {
+	"gpio31", "gpio32", "gpio76",
+};
+
+static const char * const pll_ref_groups[] = {
+	"gpio32",
+};
+
+static const char * const pa_indicator_groups[] = {
+	"gpio33",
+};
+
+static const char * const native_char0_groups[] = {
+	"gpio33",
+};
+
+static const char * const qlink0_en_groups[] = {
+	"gpio34",
+};
+
+static const char * const qlink0_req_groups[] = {
+	"gpio35",
+};
+
+static const char * const pll_test_groups[] = {
+	"gpio35",
+};
+
+static const char * const cri_trng_groups[] = {
+	"gpio36",
+};
+
+static const char * const dbg_out_groups[] = {
+	"gpio36",
+};
+
+static const char * const prng_rosc_groups[] = {
+	"gpio38",
+};
+
+static const char * const cri_trng0_groups[] = {
+	"gpio40",
+};
+
+static const char * const cri_trng1_groups[] = {
+	"gpio41",
+};
+
+static const char * const qdss_gpio_groups[] = {
+	"gpio42", "gpio61",
+};
+
+static const char * const native_char1_groups[] = {
+	"gpio42",
+};
+
+static const char * const coex_uart_groups[] = {
+	"gpio44", "gpio45",
+};
+
+static const char * const spmi_coex_groups[] = {
+	"gpio44", "gpio45",
+};
+
+static const struct msm_function sdx55_functions[] = {
+	FUNCTION(adsp_ext),
+	FUNCTION(atest),
+	FUNCTION(audio_ref),
+	FUNCTION(bimc_dte0),
+	FUNCTION(bimc_dte1),
+	FUNCTION(blsp_i2c1),
+	FUNCTION(blsp_i2c2),
+	FUNCTION(blsp_i2c3),
+	FUNCTION(blsp_i2c4),
+	FUNCTION(blsp_spi1),
+	FUNCTION(blsp_spi2),
+	FUNCTION(blsp_spi3),
+	FUNCTION(blsp_spi4),
+	FUNCTION(blsp_uart1),
+	FUNCTION(blsp_uart2),
+	FUNCTION(blsp_uart3),
+	FUNCTION(blsp_uart4),
+	FUNCTION(char_exec),
+	FUNCTION(coex_uart),
+	FUNCTION(coex_uart2),
+	FUNCTION(cri_trng),
+	FUNCTION(cri_trng0),
+	FUNCTION(cri_trng1),
+	FUNCTION(dbg_out),
+	FUNCTION(ddr_bist),
+	FUNCTION(ddr_pxi0),
+	FUNCTION(ebi0_wrcdc),
+	FUNCTION(ebi2_a),
+	FUNCTION(ebi2_lcd),
+	FUNCTION(emac_gcc0),
+	FUNCTION(emac_gcc1),
+	FUNCTION(emac_pps0),
+	FUNCTION(emac_pps1),
+	FUNCTION(ext_dbg),
+	FUNCTION(gcc_gp1),
+	FUNCTION(gcc_gp2),
+	FUNCTION(gcc_gp3),
+	FUNCTION(gcc_plltest),
+	FUNCTION(gpio),
+	FUNCTION(i2s_mclk),
+	FUNCTION(jitter_bist),
+	FUNCTION(ldo_en),
+	FUNCTION(ldo_update),
+	FUNCTION(mgpi_clk),
+	FUNCTION(m_voc),
+	FUNCTION(native_char),
+	FUNCTION(native_char0),
+	FUNCTION(native_char1),
+	FUNCTION(native_char2),
+	FUNCTION(native_char3),
+	FUNCTION(native_tsens),
+	FUNCTION(native_tsense),
+	FUNCTION(nav_gpio),
+	FUNCTION(pa_indicator),
+	FUNCTION(pcie_clkreq),
+	FUNCTION(pci_e),
+	FUNCTION(pll_bist),
+	FUNCTION(pll_ref),
+	FUNCTION(pll_test),
+	FUNCTION(pri_mi2s),
+	FUNCTION(prng_rosc),
+	FUNCTION(qdss_cti),
+	FUNCTION(qdss_gpio),
+	FUNCTION(qdss_gpio0),
+	FUNCTION(qdss_gpio1),
+	FUNCTION(qdss_gpio2),
+	FUNCTION(qdss_gpio3),
+	FUNCTION(qdss_gpio4),
+	FUNCTION(qdss_gpio5),
+	FUNCTION(qdss_gpio6),
+	FUNCTION(qdss_gpio7),
+	FUNCTION(qdss_gpio8),
+	FUNCTION(qdss_gpio9),
+	FUNCTION(qdss_gpio10),
+	FUNCTION(qdss_gpio11),
+	FUNCTION(qdss_gpio12),
+	FUNCTION(qdss_gpio13),
+	FUNCTION(qdss_gpio14),
+	FUNCTION(qdss_gpio15),
+	FUNCTION(qdss_stm0),
+	FUNCTION(qdss_stm1),
+	FUNCTION(qdss_stm2),
+	FUNCTION(qdss_stm3),
+	FUNCTION(qdss_stm4),
+	FUNCTION(qdss_stm5),
+	FUNCTION(qdss_stm6),
+	FUNCTION(qdss_stm7),
+	FUNCTION(qdss_stm8),
+	FUNCTION(qdss_stm9),
+	FUNCTION(qdss_stm10),
+	FUNCTION(qdss_stm11),
+	FUNCTION(qdss_stm12),
+	FUNCTION(qdss_stm13),
+	FUNCTION(qdss_stm14),
+	FUNCTION(qdss_stm15),
+	FUNCTION(qdss_stm16),
+	FUNCTION(qdss_stm17),
+	FUNCTION(qdss_stm18),
+	FUNCTION(qdss_stm19),
+	FUNCTION(qdss_stm20),
+	FUNCTION(qdss_stm21),
+	FUNCTION(qdss_stm22),
+	FUNCTION(qdss_stm23),
+	FUNCTION(qdss_stm24),
+	FUNCTION(qdss_stm25),
+	FUNCTION(qdss_stm26),
+	FUNCTION(qdss_stm27),
+	FUNCTION(qdss_stm28),
+	FUNCTION(qdss_stm29),
+	FUNCTION(qdss_stm30),
+	FUNCTION(qdss_stm31),
+	FUNCTION(qlink0_en),
+	FUNCTION(qlink0_req),
+	FUNCTION(qlink0_wmss),
+	FUNCTION(qlink1_en),
+	FUNCTION(qlink1_req),
+	FUNCTION(qlink1_wmss),
+	FUNCTION(spmi_coex),
+	FUNCTION(sec_mi2s),
+	FUNCTION(spmi_vgi),
+	FUNCTION(tgu_ch0),
+	FUNCTION(uim1_clk),
+	FUNCTION(uim1_data),
+	FUNCTION(uim1_present),
+	FUNCTION(uim1_reset),
+	FUNCTION(uim2_clk),
+	FUNCTION(uim2_data),
+	FUNCTION(uim2_present),
+	FUNCTION(uim2_reset),
+	FUNCTION(usb2phy_ac),
+	FUNCTION(vsense_trigger),
+};
+
+/* Every pin is maintained as a single group, and missing or non-existing pin
+ * would be maintained as dummy group to synchronize pin group index with
+ * pin descriptor registered with pinctrl core.
+ * Clients would not be able to request these dummy pin groups.
+ */
+static const struct msm_pingroup sdx55_groups[] = {
+	[0] = PINGROUP(0, uim2_data, blsp_uart1, qdss_stm31, ebi0_wrcdc, _,
+		       _, _, _, _),
+	[1] = PINGROUP(1, uim2_present, blsp_uart1, qdss_stm30, _, _, _, _,
+		       _, _),
+	[2] = PINGROUP(2, uim2_reset, blsp_uart1, blsp_i2c1, qdss_stm29,
+		       ebi0_wrcdc, _, _, _, _),
+	[3] = PINGROUP(3, uim2_clk, blsp_uart1, blsp_i2c1, qdss_stm28, _, _,
+		       _, _, _),
+	[4] = PINGROUP(4, blsp_spi2, blsp_uart2, _, qdss_stm23, qdss_gpio3,
+		       _, _, _, _),
+	[5] = PINGROUP(5, blsp_spi2, blsp_uart2, _, qdss_stm22, qdss_gpio2,
+		       _, _, _, _),
+	[6] = PINGROUP(6, blsp_spi2, blsp_uart2, blsp_i2c2, char_exec, _,
+		       qdss_stm21, qdss_gpio1, _, _),
+	[7] = PINGROUP(7, blsp_spi2, blsp_uart2, blsp_i2c2, char_exec, _,
+		       qdss_stm20, qdss_gpio0, _, _),
+	[8] = PINGROUP(8, pri_mi2s, blsp_spi3, blsp_uart3, ext_dbg, ldo_en, _,
+		       _, _, _),
+	[9] = PINGROUP(9, pri_mi2s, blsp_spi3, blsp_uart3, ext_dbg, _, _, _,
+		       _, _),
+	[10] = PINGROUP(10, pri_mi2s, blsp_spi3, blsp_uart3, blsp_i2c3,
+			ext_dbg, _, _, _, _),
+	[11] = PINGROUP(11, pri_mi2s, blsp_spi3, blsp_uart3, blsp_i2c3,
+			ext_dbg, gcc_gp3, _, _, _),
+	[12] = PINGROUP(12, pri_mi2s, _, qdss_stm19, qdss_gpio12, _, _, _,
+			_, _),
+	[13] = PINGROUP(13, pri_mi2s, _, qdss_stm18, qdss_gpio13, _, _, _,
+			_, _),
+	[14] = PINGROUP(14, pri_mi2s, emac_gcc1, _, _, qdss_stm17,
+			qdss_gpio14, bimc_dte0, native_tsens, vsense_trigger),
+	[15] = PINGROUP(15, pri_mi2s, emac_gcc0, _, _, qdss_stm16,
+			qdss_gpio15, bimc_dte1, _, _),
+	[16] = PINGROUP(16, sec_mi2s, blsp_spi4, blsp_uart4, qdss_cti,
+			qdss_cti, _, _, qdss_stm27, qdss_gpio8),
+	[17] = PINGROUP(17, sec_mi2s, blsp_spi4, blsp_uart4, qdss_cti,
+			qdss_cti, _, qdss_stm26, qdss_gpio9, _),
+	[18] = PINGROUP(18, sec_mi2s, blsp_spi4, blsp_uart4, blsp_i2c4,
+			gcc_gp1, qdss_stm25, qdss_gpio10, _, _),
+	[19] = PINGROUP(19, sec_mi2s, blsp_spi4, blsp_uart4, blsp_i2c4,
+			jitter_bist, gcc_gp2, _, qdss_stm24, qdss_gpio11),
+	[20] = PINGROUP(20, sec_mi2s, ebi2_a, blsp_uart1, blsp_uart4,
+			qdss_stm3, _, _, _, _),
+	[21] = PINGROUP(21, sec_mi2s, ebi2_lcd, blsp_uart1, blsp_uart4, _,
+			qdss_stm2, _, _, _),
+	[22] = PINGROUP(22, sec_mi2s, ebi2_lcd, blsp_uart1, qdss_cti, qdss_cti,
+			blsp_uart4, pll_bist, _, qdss_stm1),
+	[23] = PINGROUP(23, sec_mi2s, ebi2_lcd, qdss_cti, qdss_cti, blsp_uart1,
+			blsp_uart4, qdss_stm0, _, _),
+	[24] = PINGROUP(24, adsp_ext, _, _, _, _, _, _, _, _),
+	[25] = PINGROUP(25, adsp_ext, _, _, _, _, _, _, _, _),
+	[26] = PINGROUP(26, _, _, _, native_char, _, _, _, _, _),
+	[27] = PINGROUP(27, _, _, _, _, _, _, _, _, _),
+	[28] = PINGROUP(28, qlink0_wmss, _, native_char3, _, _, _, _, _,
+			_),
+	[29] = PINGROUP(29, _, _, _, native_char2, native_tsense, _, _,
+			_, _),
+	[30] = PINGROUP(30, _, _, _, _, _, _, _, _, _),
+	[31] = PINGROUP(31, nav_gpio, _, _, _, _, _, _, _, _),
+	[32] = PINGROUP(32, nav_gpio, pll_ref, _, _, _, _, _, _, _),
+	[33] = PINGROUP(33, _, pa_indicator, native_char0, _, _, _, _, _,
+			_),
+	[34] = PINGROUP(34, qlink0_en, _, _, _, _, _, _, _, _),
+	[35] = PINGROUP(35, qlink0_req, pll_test, _, _, _, _, _, _, _),
+	[36] = PINGROUP(36, _, _, cri_trng, dbg_out, _, _, _, _, _),
+	[37] = PINGROUP(37, _, _, _, _, _, _, _, _, _),
+	[38] = PINGROUP(38, _, _, prng_rosc, _, _, _, _, _, _),
+	[39] = PINGROUP(39, _, _, _, _, _, _, _, _, _),
+	[40] = PINGROUP(40, _, _, cri_trng0, _, _, _, _, _, _),
+	[41] = PINGROUP(41, _, _, cri_trng1, _, _, _, _, _, _),
+	[42] = PINGROUP(42, _, qdss_gpio, native_char1, _, _, _, _, _,
+			_),
+	[43] = PINGROUP(43, _, _, _, _, _, _, _, _, _),
+	[44] = PINGROUP(44, coex_uart, spmi_coex, _, qdss_stm11, _, _, _,
+			_, _),
+	[45] = PINGROUP(45, coex_uart, spmi_coex, qdss_stm10, ddr_pxi0, _, _,
+			_, _, _),
+	[46] = PINGROUP(46, m_voc, ddr_bist, ddr_pxi0, _, _, _, _, _, _),
+	[47] = PINGROUP(47, ddr_bist, _, _, _, _, _, _, _, _),
+	[48] = PINGROUP(48, m_voc, ddr_bist, _, _, _, _, _, _, _),
+	[49] = PINGROUP(49, m_voc, ddr_bist, _, _, _, _, _, _, _),
+	[50] = PINGROUP(50, _, _, _, _, _, _, _, _, _),
+	[51] = PINGROUP(51, _, _, _, _, _, _, _, _, _),
+	[52] = PINGROUP(52, blsp_spi2, blsp_spi1, blsp_spi3, blsp_spi4, _, _,
+			qdss_stm14, _, _),
+	[53] = PINGROUP(53, pci_e, _, _, qdss_stm13, _, _, _, _, _),
+	[54] = PINGROUP(54, qdss_cti, qdss_cti, _, _, _, _, _, _, _),
+	[55] = PINGROUP(55, qdss_cti, qdss_cti, tgu_ch0, _, _, _, _, _,
+			_),
+	[56] = PINGROUP(56, pcie_clkreq, _, qdss_stm9, _, _, _, _, _, _),
+	[57] = PINGROUP(57, _, qdss_stm15, _, _, _, _, _, _, _),
+	[58] = PINGROUP(58, _, _, _, _, _, _, _, _, _),
+	[59] = PINGROUP(59, qdss_cti, m_voc, bimc_dte0, _, _, _, _, _, _),
+	[60] = PINGROUP(60, qdss_cti, _, m_voc, _, _, _, _, _, _),
+	[61] = PINGROUP(61, mgpi_clk, qdss_stm12, qdss_gpio, bimc_dte1, _, _,
+			_, _, _),
+	[62] = PINGROUP(62, i2s_mclk, audio_ref, blsp_spi1, blsp_spi2,
+			blsp_spi3, blsp_spi4, ldo_update, qdss_stm8, _),
+	[63] = PINGROUP(63, blsp_uart2, _, qdss_stm7, qdss_gpio4, atest,
+			_, _, _, _),
+	[64] = PINGROUP(64, blsp_uart2, qdss_stm6, qdss_gpio5, atest, _,
+			_, _, _, _),
+	[65] = PINGROUP(65, blsp_uart2, blsp_i2c2, _, qdss_stm5, qdss_gpio6,
+			atest, _, _, _),
+	[66] = PINGROUP(66, blsp_uart2, blsp_i2c2, qdss_stm4, qdss_gpio7,
+			atest, _, _, _, _),
+	[67] = PINGROUP(67, uim1_data, atest, _, _, _, _, _, _, _),
+	[68] = PINGROUP(68, uim1_present, _, _, _, _, _, _, _, _),
+	[69] = PINGROUP(69, uim1_reset, _, _, _, _, _, _, _, _),
+	[70] = PINGROUP(70, uim1_clk, _, _, _, _, _, _, _, _),
+	[71] = PINGROUP(71, mgpi_clk, blsp_spi1, blsp_spi2, blsp_spi3,
+			blsp_spi4, _, _, _, _),
+	[72] = PINGROUP(72, qlink1_en, _, _, _, _, _, _, _, _),
+	[73] = PINGROUP(73, qlink1_req, _, _, _, _, _, _, _, _),
+	[74] = PINGROUP(74, qlink1_wmss, _, _, _, _, _, _, _, _),
+	[75] = PINGROUP(75, coex_uart2, _, _, _, _, _, _, _, _),
+	[76] = PINGROUP(76, coex_uart2, nav_gpio, _, _, _, _, _, _, _),
+	[77] = PINGROUP(77, _, _, _, _, _, _, _, _, _),
+	[78] = PINGROUP(78, spmi_vgi, blsp_i2c4, _, _, _, _, _, _, _),
+	[79] = PINGROUP(79, spmi_vgi, blsp_i2c4, _, _, _, _, _, _, _),
+	[80] = PINGROUP(80, _, blsp_spi1, _, _, _, _, _, _, _),
+	[81] = PINGROUP(81, _, blsp_spi1, _, gcc_plltest, _, _, _, _, _),
+	[82] = PINGROUP(82, _, blsp_spi1, _, blsp_i2c1, gcc_plltest, _, _,
+			_, _),
+	[83] = PINGROUP(83, _, blsp_spi1, _, blsp_i2c1, _, _, _, _, _),
+	[84] = PINGROUP(84, _, _, _, _, _, _, _, _, _),
+	[85] = PINGROUP(85, _, _, _, _, _, _, _, _, _),
+	[86] = PINGROUP(86, _, _, _, _, _, _, _, _, _),
+	[87] = PINGROUP(87, _, _, _, _, _, _, _, _, _),
+	[88] = PINGROUP(88, _, _, _, _, _, _, _, _, _),
+	[89] = PINGROUP(89, _, _, _, _, _, _, _, _, _),
+	[90] = PINGROUP(90, _, _, _, _, _, _, _, _, _),
+	[91] = PINGROUP(91, _, _, _, _, _, _, _, _, _),
+	[92] = PINGROUP(92, _, _, _, _, _, _, _, _, _),
+	[93] = PINGROUP(93, _, _, usb2phy_ac, _, _, _, _, _, _),
+	[94] = PINGROUP(94, qdss_cti, qdss_cti, _, _, _, _, _, _, _),
+	[95] = PINGROUP(95, qdss_cti, qdss_cti, emac_pps1, _, _, _, _, _,
+			_),
+	[96] = PINGROUP(96, _, _, _, _, _, _, _, _, _),
+	[97] = PINGROUP(97, _, _, _, _, _, _, _, _, _),
+	[98] = PINGROUP(98, _, _, _, _, _, _, _, _, _),
+	[99] = PINGROUP(99, _, _, _, _, _, _, _, _, _),
+	[100] = PINGROUP(100, _, _, _, _, _, _, _, _, _),
+	[101] = PINGROUP(101, _, _, _, _, _, _, _, _, _),
+	[102] = PINGROUP(102, _, _, _, _, _, _, _, _, _),
+	[103] = PINGROUP(103, _, _, _, _, _, _, _, _, _),
+	[104] = PINGROUP(104, _, _, _, _, _, _, _, _, _),
+	[105] = PINGROUP(105, _, _, _, _, _, _, _, _, _),
+	[106] = PINGROUP(106, emac_pps0, _, _, _, _, _, _, _, _),
+	[107] = PINGROUP(107, _, _, _, _, _, _, _, _, _),
+	[108] = UFS_RESET(ufs_reset, 0x0),
+	[109] = SDC_PINGROUP(sdc1_rclk, 0x9a000, 15, 0),
+	[110] = SDC_PINGROUP(sdc1_clk, 0x9a000, 13, 6),
+	[111] = SDC_PINGROUP(sdc1_cmd, 0x9a000, 11, 3),
+	[112] = SDC_PINGROUP(sdc1_data, 0x9a000, 9, 0),
+};
+
+static const struct msm_pinctrl_soc_data sdx55_pinctrl = {
+	.pins = sdx55_pins,
+	.npins = ARRAY_SIZE(sdx55_pins),
+	.functions = sdx55_functions,
+	.nfunctions = ARRAY_SIZE(sdx55_functions),
+	.groups = sdx55_groups,
+	.ngroups = ARRAY_SIZE(sdx55_groups),
+	.ngpios = 108,
+};
+
+static int sdx55_pinctrl_probe(struct platform_device *pdev)
+{
+	return msm_pinctrl_probe(pdev, &sdx55_pinctrl);
+}
+
+static const struct of_device_id sdx55_pinctrl_of_match[] = {
+	{ .compatible = "qcom,sdx55-pinctrl", },
+	{ },
+};
+
+static struct platform_driver sdx55_pinctrl_driver = {
+	.driver = {
+		.name = "sdx55-pinctrl",
+		.of_match_table = sdx55_pinctrl_of_match,
+	},
+	.probe = sdx55_pinctrl_probe,
+	.remove = msm_pinctrl_remove,
+};
+
+static int __init sdx55_pinctrl_init(void)
+{
+	return platform_driver_register(&sdx55_pinctrl_driver);
+}
+arch_initcall(sdx55_pinctrl_init);
+
+static void __exit sdx55_pinctrl_exit(void)
+{
+	platform_driver_unregister(&sdx55_pinctrl_driver);
+}
+module_exit(sdx55_pinctrl_exit);
+
+MODULE_DESCRIPTION("QTI sdx55 pinctrl driver");
+MODULE_LICENSE("GPL v2");
+MODULE_DEVICE_TABLE(of, sdx55_pinctrl_of_match);
-- 
2.26.2

