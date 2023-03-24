Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A91586C87D3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Mar 2023 22:56:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232194AbjCXV4F (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 24 Mar 2023 17:56:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45178 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232268AbjCXV4E (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 24 Mar 2023 17:56:04 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36E0F1EBD5
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Mar 2023 14:55:58 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id y20so3971767lfj.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Mar 2023 14:55:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679694956;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nu901lze/0PkXCYI460oSI/dwvTbPVkwaruabozMIj8=;
        b=GB3bHFPV4+KMiP6OQGMknvh2f80eger6zzkYdKzFWANm/C4kcSljpsEDxEZzpilud2
         HgqVLxhi0vLjeGbNh9S87FuLlmhBLNp6qCkR+LnocK+e3jTk/kFnjQXadv2j8Uu6unpU
         9LuzJ35ZyLTOeS0T6PcRHijWqlXXs/ZQgAr+SnOfc9rsaJuGU3nVSpoto4wX8/kwoTse
         b4gD9S5P0t+KCGOxH9e6MUDKCWdDv/Kz1rgeGPdQGSPOuWXVNMfVDNDjaMxJWET/8Ic7
         tMfoPzMdFuR74w13TkeHRyVqI7lPe+ei+vFaY5lbKhFtoOmoWodq1sQeAP1Uzvrrpv05
         zKZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679694956;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nu901lze/0PkXCYI460oSI/dwvTbPVkwaruabozMIj8=;
        b=mVWrBh27y/UwuOBhg2xmg0P6beQgjrTHRbMITMyJMmmeSGtdv3Ij90qXpG2wHR103w
         W1EigCHa/DkSj4cnvI6Iwo4Gd4RcKyMZQss42iIYcKiA1n4ddRITgNUqCWXJsj292p37
         INyJ33b8rB2gCDJH1nAnlKZZL1DU0UqoJsZzJTLmX8K6c/fwjEIPLkvCnaehs83JLBRh
         itTJ5r3eLZpysMdk1LbwlvM9ATnJeA84LhSMbpqkH6jGV7IrRPmz0gXr8VLWjpeqSlAC
         +WKvEWbeCkaop8B1JxEk9WKVktaotO7vwkazMmAiUvikajzDfixZh9q9InBo+HGCUxOO
         OVTA==
X-Gm-Message-State: AAQBX9fE6B/PQXZZZ/LGFjxjdL++xSx/tnt4+6axWdsRyPvid5aAj7sT
        Ny7pCCou85QnKanyFwb6wgJ0fg==
X-Google-Smtp-Source: AKy350YFZ+ksEx/g4JXXPZrbr3HKTCVLQKyHEDl4XcKrmfV4vBDk6pgwwrwdPqbwwyDr0WwuWb5fJg==
X-Received: by 2002:ac2:5159:0:b0:4e7:dd1e:e521 with SMTP id q25-20020ac25159000000b004e7dd1ee521mr1213015lfd.9.1679694956187;
        Fri, 24 Mar 2023 14:55:56 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id y1-20020a197501000000b004dcf20843efsm3488285lfe.239.2023.03.24.14.55.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Mar 2023 14:55:55 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        Johan Hovold <johan+linaro@kernel.org>,
        devicetree@vger.kernel.org
Subject: [PATCH 5/5] phy: qcom-qmp-usb: split off the legacy USB+dp_com support
Date:   Sat, 25 Mar 2023 00:55:50 +0300
Message-Id: <20230324215550.1966809-6-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230324215550.1966809-1-dmitry.baryshkov@linaro.org>
References: <20230324215550.1966809-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

When adding support for some of the platforms (sc7180, sc8180x, sdm845,
sm8[1234]50), we added USB PHYs for the combo USB+DP QMP PHYs. Now all
such usecases were migrated to use USB+DP Combo driver. To simplify the
qcom-qmp-usb PHY driver split the legacy USB+dp_com support into a
separate driver.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/phy/qualcomm/Kconfig                  |   10 +
 drivers/phy/qualcomm/Makefile                 |    1 +
 .../phy/qualcomm/phy-qcom-qmp-usb-legacy.c    | 1407 +++++++++++++++++
 drivers/phy/qualcomm/phy-qcom-qmp-usb.c       |  556 -------
 4 files changed, 1418 insertions(+), 556 deletions(-)
 create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-usb-legacy.c

diff --git a/drivers/phy/qualcomm/Kconfig b/drivers/phy/qualcomm/Kconfig
index 4850d48f31fa..aa0d4f099e09 100644
--- a/drivers/phy/qualcomm/Kconfig
+++ b/drivers/phy/qualcomm/Kconfig
@@ -99,6 +99,16 @@ config PHY_QCOM_QMP_USB
 	  Enable this to support the QMP USB PHY transceiver that is used
 	  with USB3 controllers on Qualcomm chips.
 
+config PHY_QCOM_QMP_USB_LEGACY
+	tristate "Qualcomm QMP legacy USB PHY Driver"
+	select GENERIC_PHY
+	default n
+	help
+	  Enable this legacy driver to support the QMP USB+DisplayPort Combo
+	  PHY transceivers working only in USB3 mode on Qualcomm chips. This
+	  driver exists only for compatibility with older device trees,
+	  existing users have been migrated to PHY_QCOM_QMP_COMBO driver.
+
 endif # PHY_QCOM_QMP
 
 config PHY_QCOM_QUSB2
diff --git a/drivers/phy/qualcomm/Makefile b/drivers/phy/qualcomm/Makefile
index de3dc9ccf067..e7e6aa4a0363 100644
--- a/drivers/phy/qualcomm/Makefile
+++ b/drivers/phy/qualcomm/Makefile
@@ -11,6 +11,7 @@ obj-$(CONFIG_PHY_QCOM_QMP_PCIE)		+= phy-qcom-qmp-pcie.o
 obj-$(CONFIG_PHY_QCOM_QMP_PCIE_8996)	+= phy-qcom-qmp-pcie-msm8996.o
 obj-$(CONFIG_PHY_QCOM_QMP_UFS)		+= phy-qcom-qmp-ufs.o
 obj-$(CONFIG_PHY_QCOM_QMP_USB)		+= phy-qcom-qmp-usb.o
+obj-$(CONFIG_PHY_QCOM_QMP_USB_LEGACY)	+= phy-qcom-qmp-usb-legacy.o
 
 obj-$(CONFIG_PHY_QCOM_QUSB2)		+= phy-qcom-qusb2.o
 obj-$(CONFIG_PHY_QCOM_SNPS_EUSB2)	+= phy-qcom-snps-eusb2.o
diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-usb-legacy.c b/drivers/phy/qualcomm/phy-qcom-qmp-usb-legacy.c
new file mode 100644
index 000000000000..cf466f6df94d
--- /dev/null
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-usb-legacy.c
@@ -0,0 +1,1407 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2017, The Linux Foundation. All rights reserved.
+ */
+
+#include <linux/clk.h>
+#include <linux/clk-provider.h>
+#include <linux/delay.h>
+#include <linux/err.h>
+#include <linux/io.h>
+#include <linux/iopoll.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_device.h>
+#include <linux/of_address.h>
+#include <linux/phy/phy.h>
+#include <linux/platform_device.h>
+#include <linux/regulator/consumer.h>
+#include <linux/reset.h>
+#include <linux/slab.h>
+
+#include "phy-qcom-qmp.h"
+#include "phy-qcom-qmp-pcs-misc-v3.h"
+#include "phy-qcom-qmp-pcs-usb-v4.h"
+#include "phy-qcom-qmp-pcs-usb-v5.h"
+
+/* QPHY_SW_RESET bit */
+#define SW_RESET				BIT(0)
+/* QPHY_POWER_DOWN_CONTROL */
+#define SW_PWRDN				BIT(0)
+/* QPHY_START_CONTROL bits */
+#define SERDES_START				BIT(0)
+#define PCS_START				BIT(1)
+/* QPHY_PCS_STATUS bit */
+#define PHYSTATUS				BIT(6)
+
+/* QPHY_V3_DP_COM_RESET_OVRD_CTRL register bits */
+/* DP PHY soft reset */
+#define SW_DPPHY_RESET				BIT(0)
+/* mux to select DP PHY reset control, 0:HW control, 1: software reset */
+#define SW_DPPHY_RESET_MUX			BIT(1)
+/* USB3 PHY soft reset */
+#define SW_USB3PHY_RESET			BIT(2)
+/* mux to select USB3 PHY reset control, 0:HW control, 1: software reset */
+#define SW_USB3PHY_RESET_MUX			BIT(3)
+
+/* QPHY_V3_DP_COM_PHY_MODE_CTRL register bits */
+#define USB3_MODE				BIT(0) /* enables USB3 mode */
+#define DP_MODE					BIT(1) /* enables DP mode */
+
+/* QPHY_PCS_AUTONOMOUS_MODE_CTRL register bits */
+#define ARCVR_DTCT_EN				BIT(0)
+#define ALFPS_DTCT_EN				BIT(1)
+#define ARCVR_DTCT_EVENT_SEL			BIT(4)
+
+/* QPHY_PCS_LFPS_RXTERM_IRQ_CLEAR register bits */
+#define IRQ_CLEAR				BIT(0)
+
+/* QPHY_V3_PCS_MISC_CLAMP_ENABLE register bits */
+#define CLAMP_EN				BIT(0) /* enables i/o clamp_n */
+
+#define PHY_INIT_COMPLETE_TIMEOUT		10000
+
+struct qmp_phy_init_tbl {
+	unsigned int offset;
+	unsigned int val;
+	/*
+	 * mask of lanes for which this register is written
+	 * for cases when second lane needs different values
+	 */
+	u8 lane_mask;
+};
+
+#define QMP_PHY_INIT_CFG(o, v)		\
+	{				\
+		.offset = o,		\
+		.val = v,		\
+		.lane_mask = 0xff,	\
+	}
+
+#define QMP_PHY_INIT_CFG_LANE(o, v, l)	\
+	{				\
+		.offset = o,		\
+		.val = v,		\
+		.lane_mask = l,		\
+	}
+
+/* set of registers with offsets different per-PHY */
+enum qphy_reg_layout {
+	/* PCS registers */
+	QPHY_SW_RESET,
+	QPHY_START_CTRL,
+	QPHY_PCS_STATUS,
+	QPHY_PCS_AUTONOMOUS_MODE_CTRL,
+	QPHY_PCS_LFPS_RXTERM_IRQ_CLEAR,
+	QPHY_PCS_POWER_DOWN_CONTROL,
+	/* Keep last to ensure regs_layout arrays are properly initialized */
+	QPHY_LAYOUT_SIZE
+};
+
+static const unsigned int qmp_v3_usb3phy_regs_layout[QPHY_LAYOUT_SIZE] = {
+	[QPHY_SW_RESET]			= QPHY_V3_PCS_SW_RESET,
+	[QPHY_START_CTRL]		= QPHY_V3_PCS_START_CONTROL,
+	[QPHY_PCS_STATUS]		= QPHY_V3_PCS_PCS_STATUS,
+	[QPHY_PCS_AUTONOMOUS_MODE_CTRL]	= QPHY_V3_PCS_AUTONOMOUS_MODE_CTRL,
+	[QPHY_PCS_LFPS_RXTERM_IRQ_CLEAR] = QPHY_V3_PCS_LFPS_RXTERM_IRQ_CLEAR,
+	[QPHY_PCS_POWER_DOWN_CONTROL]	= QPHY_V3_PCS_POWER_DOWN_CONTROL,
+};
+
+static const unsigned int qmp_v4_usb3phy_regs_layout[QPHY_LAYOUT_SIZE] = {
+	[QPHY_SW_RESET]			= QPHY_V4_PCS_SW_RESET,
+	[QPHY_START_CTRL]		= QPHY_V4_PCS_START_CONTROL,
+	[QPHY_PCS_STATUS]		= QPHY_V4_PCS_PCS_STATUS1,
+	[QPHY_PCS_POWER_DOWN_CONTROL]	= QPHY_V4_PCS_POWER_DOWN_CONTROL,
+
+	/* In PCS_USB */
+	[QPHY_PCS_AUTONOMOUS_MODE_CTRL]	= QPHY_V4_PCS_USB3_AUTONOMOUS_MODE_CTRL,
+	[QPHY_PCS_LFPS_RXTERM_IRQ_CLEAR] = QPHY_V4_PCS_USB3_LFPS_RXTERM_IRQ_CLEAR,
+};
+
+static const unsigned int qmp_v5_usb3phy_regs_layout[QPHY_LAYOUT_SIZE] = {
+	[QPHY_SW_RESET]			= QPHY_V5_PCS_SW_RESET,
+	[QPHY_START_CTRL]		= QPHY_V5_PCS_START_CONTROL,
+	[QPHY_PCS_STATUS]		= QPHY_V5_PCS_PCS_STATUS1,
+	[QPHY_PCS_POWER_DOWN_CONTROL]	= QPHY_V5_PCS_POWER_DOWN_CONTROL,
+
+	/* In PCS_USB */
+	[QPHY_PCS_AUTONOMOUS_MODE_CTRL]	= QPHY_V5_PCS_USB3_AUTONOMOUS_MODE_CTRL,
+	[QPHY_PCS_LFPS_RXTERM_IRQ_CLEAR] = QPHY_V5_PCS_USB3_LFPS_RXTERM_IRQ_CLEAR,
+};
+
+static const struct qmp_phy_init_tbl qmp_v3_usb3_serdes_tbl[] = {
+	QMP_PHY_INIT_CFG(QSERDES_V3_COM_PLL_IVCO, 0x07),
+	QMP_PHY_INIT_CFG(QSERDES_V3_COM_SYSCLK_EN_SEL, 0x14),
+	QMP_PHY_INIT_CFG(QSERDES_V3_COM_BIAS_EN_CLKBUFLR_EN, 0x08),
+	QMP_PHY_INIT_CFG(QSERDES_V3_COM_CLK_SELECT, 0x30),
+	QMP_PHY_INIT_CFG(QSERDES_V3_COM_SYS_CLK_CTRL, 0x02),
+	QMP_PHY_INIT_CFG(QSERDES_V3_COM_RESETSM_CNTRL2, 0x08),
+	QMP_PHY_INIT_CFG(QSERDES_V3_COM_CMN_CONFIG, 0x16),
+	QMP_PHY_INIT_CFG(QSERDES_V3_COM_SVS_MODE_CLK_SEL, 0x01),
+	QMP_PHY_INIT_CFG(QSERDES_V3_COM_HSCLK_SEL, 0x80),
+	QMP_PHY_INIT_CFG(QSERDES_V3_COM_DEC_START_MODE0, 0x82),
+	QMP_PHY_INIT_CFG(QSERDES_V3_COM_DIV_FRAC_START1_MODE0, 0xab),
+	QMP_PHY_INIT_CFG(QSERDES_V3_COM_DIV_FRAC_START2_MODE0, 0xea),
+	QMP_PHY_INIT_CFG(QSERDES_V3_COM_DIV_FRAC_START3_MODE0, 0x02),
+	QMP_PHY_INIT_CFG(QSERDES_V3_COM_CP_CTRL_MODE0, 0x06),
+	QMP_PHY_INIT_CFG(QSERDES_V3_COM_PLL_RCTRL_MODE0, 0x16),
+	QMP_PHY_INIT_CFG(QSERDES_V3_COM_PLL_CCTRL_MODE0, 0x36),
+	QMP_PHY_INIT_CFG(QSERDES_V3_COM_INTEGLOOP_GAIN1_MODE0, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V3_COM_INTEGLOOP_GAIN0_MODE0, 0x3f),
+	QMP_PHY_INIT_CFG(QSERDES_V3_COM_VCO_TUNE2_MODE0, 0x01),
+	QMP_PHY_INIT_CFG(QSERDES_V3_COM_VCO_TUNE1_MODE0, 0xc9),
+	QMP_PHY_INIT_CFG(QSERDES_V3_COM_CORECLK_DIV_MODE0, 0x0a),
+	QMP_PHY_INIT_CFG(QSERDES_V3_COM_LOCK_CMP3_MODE0, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V3_COM_LOCK_CMP2_MODE0, 0x34),
+	QMP_PHY_INIT_CFG(QSERDES_V3_COM_LOCK_CMP1_MODE0, 0x15),
+	QMP_PHY_INIT_CFG(QSERDES_V3_COM_LOCK_CMP_EN, 0x04),
+	QMP_PHY_INIT_CFG(QSERDES_V3_COM_CORE_CLK_EN, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V3_COM_LOCK_CMP_CFG, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V3_COM_VCO_TUNE_MAP, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V3_COM_SYSCLK_BUF_ENABLE, 0x0a),
+	QMP_PHY_INIT_CFG(QSERDES_V3_COM_SSC_EN_CENTER, 0x01),
+	QMP_PHY_INIT_CFG(QSERDES_V3_COM_SSC_PER1, 0x31),
+	QMP_PHY_INIT_CFG(QSERDES_V3_COM_SSC_PER2, 0x01),
+	QMP_PHY_INIT_CFG(QSERDES_V3_COM_SSC_ADJ_PER1, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V3_COM_SSC_ADJ_PER2, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V3_COM_SSC_STEP_SIZE1, 0x85),
+	QMP_PHY_INIT_CFG(QSERDES_V3_COM_SSC_STEP_SIZE2, 0x07),
+};
+
+static const struct qmp_phy_init_tbl qmp_v3_usb3_tx_tbl[] = {
+	QMP_PHY_INIT_CFG(QSERDES_V3_TX_HIGHZ_DRVR_EN, 0x10),
+	QMP_PHY_INIT_CFG(QSERDES_V3_TX_RCV_DETECT_LVL_2, 0x12),
+	QMP_PHY_INIT_CFG(QSERDES_V3_TX_LANE_MODE_1, 0x16),
+	QMP_PHY_INIT_CFG(QSERDES_V3_TX_RES_CODE_LANE_OFFSET_RX, 0x09),
+	QMP_PHY_INIT_CFG(QSERDES_V3_TX_RES_CODE_LANE_OFFSET_TX, 0x06),
+};
+
+static const struct qmp_phy_init_tbl qmp_v3_usb3_rx_tbl[] = {
+	QMP_PHY_INIT_CFG(QSERDES_V3_RX_UCDR_FASTLOCK_FO_GAIN, 0x0b),
+	QMP_PHY_INIT_CFG(QSERDES_V3_RX_RX_EQU_ADAPTOR_CNTRL2, 0x0f),
+	QMP_PHY_INIT_CFG(QSERDES_V3_RX_RX_EQU_ADAPTOR_CNTRL3, 0x4e),
+	QMP_PHY_INIT_CFG(QSERDES_V3_RX_RX_EQU_ADAPTOR_CNTRL4, 0x18),
+	QMP_PHY_INIT_CFG(QSERDES_V3_RX_RX_EQ_OFFSET_ADAPTOR_CNTRL1, 0x77),
+	QMP_PHY_INIT_CFG(QSERDES_V3_RX_RX_OFFSET_ADAPTOR_CNTRL2, 0x80),
+	QMP_PHY_INIT_CFG(QSERDES_V3_RX_SIGDET_CNTRL, 0x03),
+	QMP_PHY_INIT_CFG(QSERDES_V3_RX_SIGDET_DEGLITCH_CNTRL, 0x16),
+	QMP_PHY_INIT_CFG(QSERDES_V3_RX_UCDR_SO_SATURATION_AND_ENABLE, 0x75),
+};
+
+static const struct qmp_phy_init_tbl qmp_v3_usb3_pcs_tbl[] = {
+	/* FLL settings */
+	QMP_PHY_INIT_CFG(QPHY_V3_PCS_FLL_CNTRL2, 0x83),
+	QMP_PHY_INIT_CFG(QPHY_V3_PCS_FLL_CNT_VAL_L, 0x09),
+	QMP_PHY_INIT_CFG(QPHY_V3_PCS_FLL_CNT_VAL_H_TOL, 0xa2),
+	QMP_PHY_INIT_CFG(QPHY_V3_PCS_FLL_MAN_CODE, 0x40),
+	QMP_PHY_INIT_CFG(QPHY_V3_PCS_FLL_CNTRL1, 0x02),
+
+	/* Lock Det settings */
+	QMP_PHY_INIT_CFG(QPHY_V3_PCS_LOCK_DETECT_CONFIG1, 0xd1),
+	QMP_PHY_INIT_CFG(QPHY_V3_PCS_LOCK_DETECT_CONFIG2, 0x1f),
+	QMP_PHY_INIT_CFG(QPHY_V3_PCS_LOCK_DETECT_CONFIG3, 0x47),
+	QMP_PHY_INIT_CFG(QPHY_V3_PCS_POWER_STATE_CONFIG2, 0x1b),
+
+	QMP_PHY_INIT_CFG(QPHY_V3_PCS_RX_SIGDET_LVL, 0xba),
+	QMP_PHY_INIT_CFG(QPHY_V3_PCS_TXMGN_V0, 0x9f),
+	QMP_PHY_INIT_CFG(QPHY_V3_PCS_TXMGN_V1, 0x9f),
+	QMP_PHY_INIT_CFG(QPHY_V3_PCS_TXMGN_V2, 0xb7),
+	QMP_PHY_INIT_CFG(QPHY_V3_PCS_TXMGN_V3, 0x4e),
+	QMP_PHY_INIT_CFG(QPHY_V3_PCS_TXMGN_V4, 0x65),
+	QMP_PHY_INIT_CFG(QPHY_V3_PCS_TXMGN_LS, 0x6b),
+	QMP_PHY_INIT_CFG(QPHY_V3_PCS_TXDEEMPH_M6DB_V0, 0x15),
+	QMP_PHY_INIT_CFG(QPHY_V3_PCS_TXDEEMPH_M3P5DB_V0, 0x0d),
+	QMP_PHY_INIT_CFG(QPHY_V3_PCS_TXDEEMPH_M6DB_V1, 0x15),
+	QMP_PHY_INIT_CFG(QPHY_V3_PCS_TXDEEMPH_M3P5DB_V1, 0x0d),
+	QMP_PHY_INIT_CFG(QPHY_V3_PCS_TXDEEMPH_M6DB_V2, 0x15),
+	QMP_PHY_INIT_CFG(QPHY_V3_PCS_TXDEEMPH_M3P5DB_V2, 0x0d),
+	QMP_PHY_INIT_CFG(QPHY_V3_PCS_TXDEEMPH_M6DB_V3, 0x15),
+	QMP_PHY_INIT_CFG(QPHY_V3_PCS_TXDEEMPH_M3P5DB_V3, 0x1d),
+	QMP_PHY_INIT_CFG(QPHY_V3_PCS_TXDEEMPH_M6DB_V4, 0x15),
+	QMP_PHY_INIT_CFG(QPHY_V3_PCS_TXDEEMPH_M3P5DB_V4, 0x0d),
+	QMP_PHY_INIT_CFG(QPHY_V3_PCS_TXDEEMPH_M6DB_LS, 0x15),
+	QMP_PHY_INIT_CFG(QPHY_V3_PCS_TXDEEMPH_M3P5DB_LS, 0x0d),
+
+	QMP_PHY_INIT_CFG(QPHY_V3_PCS_RATE_SLEW_CNTRL, 0x02),
+	QMP_PHY_INIT_CFG(QPHY_V3_PCS_PWRUP_RESET_DLY_TIME_AUXCLK, 0x04),
+	QMP_PHY_INIT_CFG(QPHY_V3_PCS_TSYNC_RSYNC_TIME, 0x44),
+	QMP_PHY_INIT_CFG(QPHY_V3_PCS_PWRUP_RESET_DLY_TIME_AUXCLK, 0x04),
+	QMP_PHY_INIT_CFG(QPHY_V3_PCS_RCVR_DTCT_DLY_P1U2_L, 0xe7),
+	QMP_PHY_INIT_CFG(QPHY_V3_PCS_RCVR_DTCT_DLY_P1U2_H, 0x03),
+	QMP_PHY_INIT_CFG(QPHY_V3_PCS_RCVR_DTCT_DLY_U3_L, 0x40),
+	QMP_PHY_INIT_CFG(QPHY_V3_PCS_RCVR_DTCT_DLY_U3_H, 0x00),
+	QMP_PHY_INIT_CFG(QPHY_V3_PCS_RXEQTRAINING_WAIT_TIME, 0x75),
+	QMP_PHY_INIT_CFG(QPHY_V3_PCS_LFPS_TX_ECSTART_EQTLOCK, 0x86),
+	QMP_PHY_INIT_CFG(QPHY_V3_PCS_RXEQTRAINING_RUN_TIME, 0x13),
+};
+
+static const struct qmp_phy_init_tbl sm8150_usb3_serdes_tbl[] = {
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_SSC_EN_CENTER, 0x01),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_SSC_PER1, 0x31),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_SSC_PER2, 0x01),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_SSC_STEP_SIZE1_MODE0, 0xde),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_SSC_STEP_SIZE2_MODE0, 0x07),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_SSC_STEP_SIZE1_MODE1, 0xde),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_SSC_STEP_SIZE2_MODE1, 0x07),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_SYSCLK_BUF_ENABLE, 0x0a),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_CMN_IPTRIM, 0x20),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_CP_CTRL_MODE0, 0x06),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_CP_CTRL_MODE1, 0x06),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_PLL_RCTRL_MODE0, 0x16),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_PLL_RCTRL_MODE1, 0x16),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_PLL_CCTRL_MODE0, 0x36),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_PLL_CCTRL_MODE1, 0x36),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_SYSCLK_EN_SEL, 0x1a),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_LOCK_CMP_EN, 0x04),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_LOCK_CMP1_MODE0, 0x14),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_LOCK_CMP2_MODE0, 0x34),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_LOCK_CMP1_MODE1, 0x34),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_LOCK_CMP2_MODE1, 0x82),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_DEC_START_MODE0, 0x82),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_DEC_START_MODE1, 0x82),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_DIV_FRAC_START1_MODE0, 0xab),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_DIV_FRAC_START2_MODE0, 0xea),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_DIV_FRAC_START3_MODE0, 0x02),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_VCO_TUNE_MAP, 0x02),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_DIV_FRAC_START1_MODE1, 0xab),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_DIV_FRAC_START2_MODE1, 0xea),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_DIV_FRAC_START3_MODE1, 0x02),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_VCO_TUNE1_MODE0, 0x24),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_VCO_TUNE1_MODE1, 0x24),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_VCO_TUNE2_MODE1, 0x02),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_HSCLK_SEL, 0x01),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_CORECLK_DIV_MODE1, 0x08),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_BIN_VCOCAL_CMP_CODE1_MODE0, 0xca),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_BIN_VCOCAL_CMP_CODE2_MODE0, 0x1e),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_BIN_VCOCAL_CMP_CODE1_MODE1, 0xca),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_BIN_VCOCAL_CMP_CODE2_MODE1, 0x1e),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_BIN_VCOCAL_HSCLK_SEL, 0x11),
+};
+
+static const struct qmp_phy_init_tbl sm8150_usb3_tx_tbl[] = {
+	QMP_PHY_INIT_CFG(QSERDES_V4_TX_RES_CODE_LANE_TX, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V4_TX_RES_CODE_LANE_RX, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V4_TX_LANE_MODE_1, 0xd5),
+	QMP_PHY_INIT_CFG(QSERDES_V4_TX_RCV_DETECT_LVL_2, 0x12),
+	QMP_PHY_INIT_CFG(QSERDES_V4_TX_PI_QEC_CTRL, 0x20),
+};
+
+static const struct qmp_phy_init_tbl sm8150_usb3_rx_tbl[] = {
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_UCDR_SO_GAIN, 0x05),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_UCDR_FASTLOCK_FO_GAIN, 0x2f),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_UCDR_SO_SATURATION_AND_ENABLE, 0x7f),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_UCDR_FASTLOCK_COUNT_LOW, 0xff),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_UCDR_FASTLOCK_COUNT_HIGH, 0x0f),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_UCDR_PI_CONTROLS, 0x99),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_UCDR_SB2_THRESH1, 0x04),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_UCDR_SB2_THRESH2, 0x08),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_UCDR_SB2_GAIN1, 0x05),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_UCDR_SB2_GAIN2, 0x05),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_VGA_CAL_CNTRL1, 0x54),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_VGA_CAL_CNTRL2, 0x0e),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_EQU_ADAPTOR_CNTRL2, 0x0f),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_EQU_ADAPTOR_CNTRL3, 0x4a),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_EQU_ADAPTOR_CNTRL4, 0x0a),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_IDAC_TSETTLE_LOW, 0xc0),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_IDAC_TSETTLE_HIGH, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_EQ_OFFSET_ADAPTOR_CNTRL1, 0x77),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_SIGDET_CNTRL, 0x04),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_SIGDET_DEGLITCH_CNTRL, 0x0e),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_MODE_00_LOW, 0xbf),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_MODE_00_HIGH, 0xbf),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_MODE_00_HIGH2, 0x3f),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_MODE_00_HIGH3, 0x7f),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_MODE_00_HIGH4, 0x94),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_MODE_01_LOW, 0xdc),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_MODE_01_HIGH, 0xdc),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_MODE_01_HIGH2, 0x5c),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_MODE_01_HIGH3, 0x0b),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_MODE_01_HIGH4, 0xb3),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_DFE_EN_TIMER, 0x04),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_DFE_CTLE_POST_CAL_OFFSET, 0x38),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_AUX_DATA_TCOARSE_TFINE, 0xa0),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_DCC_CTRL1, 0x0c),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_GM_CAL, 0x1f),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_VTH_CODE, 0x10),
+};
+
+static const struct qmp_phy_init_tbl sm8150_usb3_pcs_tbl[] = {
+	/* Lock Det settings */
+	QMP_PHY_INIT_CFG(QPHY_V4_PCS_LOCK_DETECT_CONFIG1, 0xd0),
+	QMP_PHY_INIT_CFG(QPHY_V4_PCS_LOCK_DETECT_CONFIG2, 0x07),
+	QMP_PHY_INIT_CFG(QPHY_V4_PCS_LOCK_DETECT_CONFIG6, 0x13),
+
+	QMP_PHY_INIT_CFG(QPHY_V4_PCS_REFGEN_REQ_CONFIG1, 0x21),
+	QMP_PHY_INIT_CFG(QPHY_V4_PCS_RX_SIGDET_LVL, 0xaa),
+	QMP_PHY_INIT_CFG(QPHY_V4_PCS_CDR_RESET_TIME, 0x0a),
+	QMP_PHY_INIT_CFG(QPHY_V4_PCS_ALIGN_DETECT_CONFIG1, 0x88),
+	QMP_PHY_INIT_CFG(QPHY_V4_PCS_ALIGN_DETECT_CONFIG2, 0x13),
+	QMP_PHY_INIT_CFG(QPHY_V4_PCS_PCS_TX_RX_CONFIG, 0x0c),
+	QMP_PHY_INIT_CFG(QPHY_V4_PCS_EQ_CONFIG1, 0x4b),
+	QMP_PHY_INIT_CFG(QPHY_V4_PCS_EQ_CONFIG5, 0x10),
+};
+
+static const struct qmp_phy_init_tbl sm8150_usb3_pcs_usb_tbl[] = {
+	QMP_PHY_INIT_CFG(QPHY_V4_PCS_USB3_LFPS_DET_HIGH_COUNT_VAL, 0xf8),
+	QMP_PHY_INIT_CFG(QPHY_V4_PCS_USB3_RXEQTRAINING_DFE_TIME_S2, 0x07),
+};
+
+static const struct qmp_phy_init_tbl sm8250_usb3_tx_tbl[] = {
+	QMP_PHY_INIT_CFG(QSERDES_V4_TX_RES_CODE_LANE_TX, 0x60),
+	QMP_PHY_INIT_CFG(QSERDES_V4_TX_RES_CODE_LANE_RX, 0x60),
+	QMP_PHY_INIT_CFG(QSERDES_V4_TX_RES_CODE_LANE_OFFSET_TX, 0x11),
+	QMP_PHY_INIT_CFG(QSERDES_V4_TX_RES_CODE_LANE_OFFSET_RX, 0x02),
+	QMP_PHY_INIT_CFG(QSERDES_V4_TX_LANE_MODE_1, 0xd5),
+	QMP_PHY_INIT_CFG(QSERDES_V4_TX_RCV_DETECT_LVL_2, 0x12),
+	QMP_PHY_INIT_CFG_LANE(QSERDES_V4_TX_PI_QEC_CTRL, 0x40, 1),
+	QMP_PHY_INIT_CFG_LANE(QSERDES_V4_TX_PI_QEC_CTRL, 0x54, 2),
+};
+
+static const struct qmp_phy_init_tbl sm8250_usb3_rx_tbl[] = {
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_UCDR_SO_GAIN, 0x06),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_UCDR_FASTLOCK_FO_GAIN, 0x2f),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_UCDR_SO_SATURATION_AND_ENABLE, 0x7f),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_UCDR_FASTLOCK_COUNT_LOW, 0xff),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_UCDR_FASTLOCK_COUNT_HIGH, 0x0f),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_UCDR_PI_CONTROLS, 0x99),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_UCDR_SB2_THRESH1, 0x04),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_UCDR_SB2_THRESH2, 0x08),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_UCDR_SB2_GAIN1, 0x05),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_UCDR_SB2_GAIN2, 0x05),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_VGA_CAL_CNTRL1, 0x54),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_VGA_CAL_CNTRL2, 0x0c),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_EQU_ADAPTOR_CNTRL2, 0x0f),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_EQU_ADAPTOR_CNTRL3, 0x4a),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_EQU_ADAPTOR_CNTRL4, 0x0a),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_IDAC_TSETTLE_LOW, 0xc0),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_IDAC_TSETTLE_HIGH, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_EQ_OFFSET_ADAPTOR_CNTRL1, 0x77),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_SIGDET_CNTRL, 0x04),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_SIGDET_DEGLITCH_CNTRL, 0x0e),
+	QMP_PHY_INIT_CFG_LANE(QSERDES_V4_RX_RX_MODE_00_LOW, 0xff, 1),
+	QMP_PHY_INIT_CFG_LANE(QSERDES_V4_RX_RX_MODE_00_LOW, 0x7f, 2),
+	QMP_PHY_INIT_CFG_LANE(QSERDES_V4_RX_RX_MODE_00_HIGH, 0x7f, 1),
+	QMP_PHY_INIT_CFG_LANE(QSERDES_V4_RX_RX_MODE_00_HIGH, 0xff, 2),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_MODE_00_HIGH2, 0x7f),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_MODE_00_HIGH3, 0x7f),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_MODE_00_HIGH4, 0x97),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_MODE_01_LOW, 0xdc),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_MODE_01_HIGH, 0xdc),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_MODE_01_HIGH2, 0x5c),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_MODE_01_HIGH3, 0x7b),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_MODE_01_HIGH4, 0xb4),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_DFE_EN_TIMER, 0x04),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_DFE_CTLE_POST_CAL_OFFSET, 0x38),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_AUX_DATA_TCOARSE_TFINE, 0xa0),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_DCC_CTRL1, 0x0c),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_GM_CAL, 0x1f),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_VTH_CODE, 0x10),
+};
+
+static const struct qmp_phy_init_tbl sm8250_usb3_pcs_tbl[] = {
+	QMP_PHY_INIT_CFG(QPHY_V4_PCS_LOCK_DETECT_CONFIG1, 0xd0),
+	QMP_PHY_INIT_CFG(QPHY_V4_PCS_LOCK_DETECT_CONFIG2, 0x07),
+	QMP_PHY_INIT_CFG(QPHY_V4_PCS_LOCK_DETECT_CONFIG3, 0x20),
+	QMP_PHY_INIT_CFG(QPHY_V4_PCS_LOCK_DETECT_CONFIG6, 0x13),
+	QMP_PHY_INIT_CFG(QPHY_V4_PCS_REFGEN_REQ_CONFIG1, 0x21),
+	QMP_PHY_INIT_CFG(QPHY_V4_PCS_RX_SIGDET_LVL, 0xa9),
+	QMP_PHY_INIT_CFG(QPHY_V4_PCS_CDR_RESET_TIME, 0x0a),
+	QMP_PHY_INIT_CFG(QPHY_V4_PCS_ALIGN_DETECT_CONFIG1, 0x88),
+	QMP_PHY_INIT_CFG(QPHY_V4_PCS_ALIGN_DETECT_CONFIG2, 0x13),
+	QMP_PHY_INIT_CFG(QPHY_V4_PCS_PCS_TX_RX_CONFIG, 0x0c),
+	QMP_PHY_INIT_CFG(QPHY_V4_PCS_EQ_CONFIG1, 0x4b),
+	QMP_PHY_INIT_CFG(QPHY_V4_PCS_EQ_CONFIG5, 0x10),
+};
+
+static const struct qmp_phy_init_tbl sm8250_usb3_pcs_usb_tbl[] = {
+	QMP_PHY_INIT_CFG(QPHY_V4_PCS_USB3_LFPS_DET_HIGH_COUNT_VAL, 0xf8),
+	QMP_PHY_INIT_CFG(QPHY_V4_PCS_USB3_RXEQTRAINING_DFE_TIME_S2, 0x07),
+};
+
+static const struct qmp_phy_init_tbl sm8350_usb3_tx_tbl[] = {
+	QMP_PHY_INIT_CFG(QSERDES_V5_TX_RES_CODE_LANE_TX, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V5_TX_RES_CODE_LANE_RX, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V5_TX_RES_CODE_LANE_OFFSET_TX, 0x16),
+	QMP_PHY_INIT_CFG(QSERDES_V5_TX_RES_CODE_LANE_OFFSET_RX, 0x0e),
+	QMP_PHY_INIT_CFG(QSERDES_V5_TX_LANE_MODE_1, 0x35),
+	QMP_PHY_INIT_CFG(QSERDES_V5_TX_LANE_MODE_3, 0x3f),
+	QMP_PHY_INIT_CFG(QSERDES_V5_TX_LANE_MODE_4, 0x7f),
+	QMP_PHY_INIT_CFG(QSERDES_V5_TX_LANE_MODE_5, 0x3f),
+	QMP_PHY_INIT_CFG(QSERDES_V5_TX_RCV_DETECT_LVL_2, 0x12),
+	QMP_PHY_INIT_CFG(QSERDES_V5_TX_PI_QEC_CTRL, 0x21),
+};
+
+static const struct qmp_phy_init_tbl sm8350_usb3_rx_tbl[] = {
+	QMP_PHY_INIT_CFG(QSERDES_V5_RX_UCDR_FO_GAIN, 0x0a),
+	QMP_PHY_INIT_CFG(QSERDES_V5_RX_UCDR_SO_GAIN, 0x05),
+	QMP_PHY_INIT_CFG(QSERDES_V5_RX_UCDR_FASTLOCK_FO_GAIN, 0x2f),
+	QMP_PHY_INIT_CFG(QSERDES_V5_RX_UCDR_SO_SATURATION_AND_ENABLE, 0x7f),
+	QMP_PHY_INIT_CFG(QSERDES_V5_RX_UCDR_FASTLOCK_COUNT_LOW, 0xff),
+	QMP_PHY_INIT_CFG(QSERDES_V5_RX_UCDR_FASTLOCK_COUNT_HIGH, 0x0f),
+	QMP_PHY_INIT_CFG(QSERDES_V5_RX_UCDR_PI_CONTROLS, 0x99),
+	QMP_PHY_INIT_CFG(QSERDES_V5_RX_UCDR_SB2_THRESH1, 0x08),
+	QMP_PHY_INIT_CFG(QSERDES_V5_RX_UCDR_SB2_THRESH2, 0x08),
+	QMP_PHY_INIT_CFG(QSERDES_V5_RX_UCDR_SB2_GAIN1, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V5_RX_UCDR_SB2_GAIN2, 0x04),
+	QMP_PHY_INIT_CFG(QSERDES_V5_RX_VGA_CAL_CNTRL1, 0x54),
+	QMP_PHY_INIT_CFG(QSERDES_V5_RX_VGA_CAL_CNTRL2, 0x0f),
+	QMP_PHY_INIT_CFG(QSERDES_V5_RX_RX_EQU_ADAPTOR_CNTRL2, 0x0f),
+	QMP_PHY_INIT_CFG(QSERDES_V5_RX_RX_EQU_ADAPTOR_CNTRL3, 0x4a),
+	QMP_PHY_INIT_CFG(QSERDES_V5_RX_RX_EQU_ADAPTOR_CNTRL4, 0x0a),
+	QMP_PHY_INIT_CFG(QSERDES_V5_RX_RX_IDAC_TSETTLE_LOW, 0xc0),
+	QMP_PHY_INIT_CFG(QSERDES_V5_RX_RX_IDAC_TSETTLE_HIGH, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V5_RX_RX_EQ_OFFSET_ADAPTOR_CNTRL1, 0x47),
+	QMP_PHY_INIT_CFG(QSERDES_V5_RX_SIGDET_CNTRL, 0x04),
+	QMP_PHY_INIT_CFG(QSERDES_V5_RX_SIGDET_DEGLITCH_CNTRL, 0x0e),
+	QMP_PHY_INIT_CFG(QSERDES_V5_RX_RX_MODE_00_LOW, 0xbb),
+	QMP_PHY_INIT_CFG(QSERDES_V5_RX_RX_MODE_00_HIGH, 0x7b),
+	QMP_PHY_INIT_CFG(QSERDES_V5_RX_RX_MODE_00_HIGH2, 0xbb),
+	QMP_PHY_INIT_CFG_LANE(QSERDES_V5_RX_RX_MODE_00_HIGH3, 0x3d, 1),
+	QMP_PHY_INIT_CFG_LANE(QSERDES_V5_RX_RX_MODE_00_HIGH3, 0x3c, 2),
+	QMP_PHY_INIT_CFG(QSERDES_V5_RX_RX_MODE_00_HIGH4, 0xdb),
+	QMP_PHY_INIT_CFG(QSERDES_V5_RX_RX_MODE_01_LOW, 0x64),
+	QMP_PHY_INIT_CFG(QSERDES_V5_RX_RX_MODE_01_HIGH, 0x24),
+	QMP_PHY_INIT_CFG(QSERDES_V5_RX_RX_MODE_01_HIGH2, 0xd2),
+	QMP_PHY_INIT_CFG(QSERDES_V5_RX_RX_MODE_01_HIGH3, 0x13),
+	QMP_PHY_INIT_CFG(QSERDES_V5_RX_RX_MODE_01_HIGH4, 0xa9),
+	QMP_PHY_INIT_CFG(QSERDES_V5_RX_DFE_EN_TIMER, 0x04),
+	QMP_PHY_INIT_CFG(QSERDES_V5_RX_DFE_CTLE_POST_CAL_OFFSET, 0x38),
+	QMP_PHY_INIT_CFG(QSERDES_V5_RX_AUX_DATA_TCOARSE_TFINE, 0xa0),
+	QMP_PHY_INIT_CFG(QSERDES_V5_RX_DCC_CTRL1, 0x0c),
+	QMP_PHY_INIT_CFG(QSERDES_V5_RX_GM_CAL, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V5_RX_VTH_CODE, 0x10),
+};
+
+static const struct qmp_phy_init_tbl sm8350_usb3_pcs_tbl[] = {
+	QMP_PHY_INIT_CFG(QPHY_V4_PCS_RCVR_DTCT_DLY_P1U2_L, 0xe7),
+	QMP_PHY_INIT_CFG(QPHY_V4_PCS_RCVR_DTCT_DLY_P1U2_H, 0x03),
+	QMP_PHY_INIT_CFG(QPHY_V4_PCS_LOCK_DETECT_CONFIG1, 0xd0),
+	QMP_PHY_INIT_CFG(QPHY_V4_PCS_LOCK_DETECT_CONFIG2, 0x07),
+	QMP_PHY_INIT_CFG(QPHY_V4_PCS_LOCK_DETECT_CONFIG3, 0x20),
+	QMP_PHY_INIT_CFG(QPHY_V4_PCS_LOCK_DETECT_CONFIG6, 0x13),
+	QMP_PHY_INIT_CFG(QPHY_V4_PCS_REFGEN_REQ_CONFIG1, 0x21),
+	QMP_PHY_INIT_CFG(QPHY_V4_PCS_RX_SIGDET_LVL, 0xaa),
+	QMP_PHY_INIT_CFG(QPHY_V4_PCS_CDR_RESET_TIME, 0x0a),
+	QMP_PHY_INIT_CFG(QPHY_V4_PCS_ALIGN_DETECT_CONFIG1, 0x88),
+	QMP_PHY_INIT_CFG(QPHY_V4_PCS_ALIGN_DETECT_CONFIG2, 0x13),
+	QMP_PHY_INIT_CFG(QPHY_V4_PCS_PCS_TX_RX_CONFIG, 0x0c),
+	QMP_PHY_INIT_CFG(QPHY_V4_PCS_EQ_CONFIG1, 0x4b),
+	QMP_PHY_INIT_CFG(QPHY_V4_PCS_EQ_CONFIG5, 0x10),
+};
+
+static const struct qmp_phy_init_tbl sm8350_usb3_pcs_usb_tbl[] = {
+	QMP_PHY_INIT_CFG(QPHY_V5_PCS_USB3_RCVR_DTCT_DLY_U3_L, 0x40),
+	QMP_PHY_INIT_CFG(QPHY_V5_PCS_USB3_RCVR_DTCT_DLY_U3_H, 0x00),
+	QMP_PHY_INIT_CFG(QPHY_V5_PCS_USB3_LFPS_DET_HIGH_COUNT_VAL, 0xf8),
+	QMP_PHY_INIT_CFG(QPHY_V5_PCS_USB3_RXEQTRAINING_DFE_TIME_S2, 0x07),
+};
+
+struct qmp_usb_legacy_offsets {
+	u16 serdes;
+	u16 pcs;
+	u16 pcs_usb;
+	u16 tx;
+	u16 rx;
+};
+
+/* struct qmp_phy_cfg - per-PHY initialization config */
+struct qmp_phy_cfg {
+	int lanes;
+
+	const struct qmp_usb_legacy_offsets *offsets;
+
+	/* Init sequence for PHY blocks - serdes, tx, rx, pcs */
+	const struct qmp_phy_init_tbl *serdes_tbl;
+	int serdes_tbl_num;
+	const struct qmp_phy_init_tbl *tx_tbl;
+	int tx_tbl_num;
+	const struct qmp_phy_init_tbl *rx_tbl;
+	int rx_tbl_num;
+	const struct qmp_phy_init_tbl *pcs_tbl;
+	int pcs_tbl_num;
+	const struct qmp_phy_init_tbl *pcs_usb_tbl;
+	int pcs_usb_tbl_num;
+
+	/* clock ids to be requested */
+	const char * const *clk_list;
+	int num_clks;
+	/* resets to be requested */
+	const char * const *reset_list;
+	int num_resets;
+	/* regulators to be requested */
+	const char * const *vreg_list;
+	int num_vregs;
+
+	/* array of registers with different offsets */
+	const unsigned int *regs;
+
+	/* Offset from PCS to PCS_USB region */
+	unsigned int pcs_usb_offset;
+};
+
+struct qmp_usb {
+	struct device *dev;
+
+	const struct qmp_phy_cfg *cfg;
+
+	void __iomem *serdes;
+	void __iomem *pcs;
+	void __iomem *pcs_misc;
+	void __iomem *pcs_usb;
+	void __iomem *tx;
+	void __iomem *rx;
+	void __iomem *tx2;
+	void __iomem *rx2;
+
+	void __iomem *dp_com;
+
+	struct clk *pipe_clk;
+	struct clk_bulk_data *clks;
+	struct reset_control_bulk_data *resets;
+	struct regulator_bulk_data *vregs;
+
+	enum phy_mode mode;
+
+	struct phy *phy;
+
+	struct clk_fixed_rate pipe_clk_fixed;
+};
+
+static inline void qphy_setbits(void __iomem *base, u32 offset, u32 val)
+{
+	u32 reg;
+
+	reg = readl(base + offset);
+	reg |= val;
+	writel(reg, base + offset);
+
+	/* ensure that above write is through */
+	readl(base + offset);
+}
+
+static inline void qphy_clrbits(void __iomem *base, u32 offset, u32 val)
+{
+	u32 reg;
+
+	reg = readl(base + offset);
+	reg &= ~val;
+	writel(reg, base + offset);
+
+	/* ensure that above write is through */
+	readl(base + offset);
+}
+
+/* list of clocks required by phy */
+static const char * const qmp_v3_phy_clk_l[] = {
+	"aux", "cfg_ahb", "ref", "com_aux",
+};
+
+static const char * const qmp_v4_ref_phy_clk_l[] = {
+	"aux", "ref_clk_src", "ref", "com_aux",
+};
+
+/* the primary usb3 phy on sm8250 doesn't have a ref clock */
+static const char * const qmp_v4_sm8250_usbphy_clk_l[] = {
+	"aux", "ref_clk_src", "com_aux"
+};
+
+/* list of resets */
+static const char * const msm8996_usb3phy_reset_l[] = {
+	"phy", "common",
+};
+
+static const char * const sc7180_usb3phy_reset_l[] = {
+	"phy",
+};
+
+/* list of regulators */
+static const char * const qmp_phy_vreg_l[] = {
+	"vdda-phy", "vdda-pll",
+};
+
+static const struct qmp_phy_cfg qmp_v3_usb3phy_cfg = {
+	.lanes			= 2,
+
+	.serdes_tbl		= qmp_v3_usb3_serdes_tbl,
+	.serdes_tbl_num		= ARRAY_SIZE(qmp_v3_usb3_serdes_tbl),
+	.tx_tbl			= qmp_v3_usb3_tx_tbl,
+	.tx_tbl_num		= ARRAY_SIZE(qmp_v3_usb3_tx_tbl),
+	.rx_tbl			= qmp_v3_usb3_rx_tbl,
+	.rx_tbl_num		= ARRAY_SIZE(qmp_v3_usb3_rx_tbl),
+	.pcs_tbl		= qmp_v3_usb3_pcs_tbl,
+	.pcs_tbl_num		= ARRAY_SIZE(qmp_v3_usb3_pcs_tbl),
+	.clk_list		= qmp_v3_phy_clk_l,
+	.num_clks		= ARRAY_SIZE(qmp_v3_phy_clk_l),
+	.reset_list		= msm8996_usb3phy_reset_l,
+	.num_resets		= ARRAY_SIZE(msm8996_usb3phy_reset_l),
+	.vreg_list		= qmp_phy_vreg_l,
+	.num_vregs		= ARRAY_SIZE(qmp_phy_vreg_l),
+	.regs			= qmp_v3_usb3phy_regs_layout,
+};
+
+static const struct qmp_phy_cfg sc7180_usb3phy_cfg = {
+	.lanes			= 2,
+
+	.serdes_tbl		= qmp_v3_usb3_serdes_tbl,
+	.serdes_tbl_num		= ARRAY_SIZE(qmp_v3_usb3_serdes_tbl),
+	.tx_tbl			= qmp_v3_usb3_tx_tbl,
+	.tx_tbl_num		= ARRAY_SIZE(qmp_v3_usb3_tx_tbl),
+	.rx_tbl			= qmp_v3_usb3_rx_tbl,
+	.rx_tbl_num		= ARRAY_SIZE(qmp_v3_usb3_rx_tbl),
+	.pcs_tbl		= qmp_v3_usb3_pcs_tbl,
+	.pcs_tbl_num		= ARRAY_SIZE(qmp_v3_usb3_pcs_tbl),
+	.clk_list		= qmp_v3_phy_clk_l,
+	.num_clks		= ARRAY_SIZE(qmp_v3_phy_clk_l),
+	.reset_list		= sc7180_usb3phy_reset_l,
+	.num_resets		= ARRAY_SIZE(sc7180_usb3phy_reset_l),
+	.vreg_list		= qmp_phy_vreg_l,
+	.num_vregs		= ARRAY_SIZE(qmp_phy_vreg_l),
+	.regs			= qmp_v3_usb3phy_regs_layout,
+};
+
+static const struct qmp_phy_cfg sm8150_usb3phy_cfg = {
+	.lanes			= 2,
+
+	.serdes_tbl		= sm8150_usb3_serdes_tbl,
+	.serdes_tbl_num		= ARRAY_SIZE(sm8150_usb3_serdes_tbl),
+	.tx_tbl			= sm8150_usb3_tx_tbl,
+	.tx_tbl_num		= ARRAY_SIZE(sm8150_usb3_tx_tbl),
+	.rx_tbl			= sm8150_usb3_rx_tbl,
+	.rx_tbl_num		= ARRAY_SIZE(sm8150_usb3_rx_tbl),
+	.pcs_tbl		= sm8150_usb3_pcs_tbl,
+	.pcs_tbl_num		= ARRAY_SIZE(sm8150_usb3_pcs_tbl),
+	.pcs_usb_tbl		= sm8150_usb3_pcs_usb_tbl,
+	.pcs_usb_tbl_num	= ARRAY_SIZE(sm8150_usb3_pcs_usb_tbl),
+	.clk_list		= qmp_v4_ref_phy_clk_l,
+	.num_clks		= ARRAY_SIZE(qmp_v4_ref_phy_clk_l),
+	.reset_list		= msm8996_usb3phy_reset_l,
+	.num_resets		= ARRAY_SIZE(msm8996_usb3phy_reset_l),
+	.vreg_list		= qmp_phy_vreg_l,
+	.num_vregs		= ARRAY_SIZE(qmp_phy_vreg_l),
+	.regs			= qmp_v4_usb3phy_regs_layout,
+	.pcs_usb_offset		= 0x300,
+};
+
+static const struct qmp_phy_cfg sm8250_usb3phy_cfg = {
+	.lanes			= 2,
+
+	.serdes_tbl		= sm8150_usb3_serdes_tbl,
+	.serdes_tbl_num		= ARRAY_SIZE(sm8150_usb3_serdes_tbl),
+	.tx_tbl			= sm8250_usb3_tx_tbl,
+	.tx_tbl_num		= ARRAY_SIZE(sm8250_usb3_tx_tbl),
+	.rx_tbl			= sm8250_usb3_rx_tbl,
+	.rx_tbl_num		= ARRAY_SIZE(sm8250_usb3_rx_tbl),
+	.pcs_tbl		= sm8250_usb3_pcs_tbl,
+	.pcs_tbl_num		= ARRAY_SIZE(sm8250_usb3_pcs_tbl),
+	.pcs_usb_tbl		= sm8250_usb3_pcs_usb_tbl,
+	.pcs_usb_tbl_num	= ARRAY_SIZE(sm8250_usb3_pcs_usb_tbl),
+	.clk_list		= qmp_v4_sm8250_usbphy_clk_l,
+	.num_clks		= ARRAY_SIZE(qmp_v4_sm8250_usbphy_clk_l),
+	.reset_list		= msm8996_usb3phy_reset_l,
+	.num_resets		= ARRAY_SIZE(msm8996_usb3phy_reset_l),
+	.vreg_list		= qmp_phy_vreg_l,
+	.num_vregs		= ARRAY_SIZE(qmp_phy_vreg_l),
+	.regs			= qmp_v4_usb3phy_regs_layout,
+	.pcs_usb_offset		= 0x300,
+};
+
+static const struct qmp_phy_cfg sm8350_usb3phy_cfg = {
+	.lanes			= 2,
+
+	.serdes_tbl		= sm8150_usb3_serdes_tbl,
+	.serdes_tbl_num		= ARRAY_SIZE(sm8150_usb3_serdes_tbl),
+	.tx_tbl			= sm8350_usb3_tx_tbl,
+	.tx_tbl_num		= ARRAY_SIZE(sm8350_usb3_tx_tbl),
+	.rx_tbl			= sm8350_usb3_rx_tbl,
+	.rx_tbl_num		= ARRAY_SIZE(sm8350_usb3_rx_tbl),
+	.pcs_tbl		= sm8350_usb3_pcs_tbl,
+	.pcs_tbl_num		= ARRAY_SIZE(sm8350_usb3_pcs_tbl),
+	.pcs_usb_tbl		= sm8350_usb3_pcs_usb_tbl,
+	.pcs_usb_tbl_num	= ARRAY_SIZE(sm8350_usb3_pcs_usb_tbl),
+	.clk_list		= qmp_v4_sm8250_usbphy_clk_l,
+	.num_clks		= ARRAY_SIZE(qmp_v4_sm8250_usbphy_clk_l),
+	.reset_list		= msm8996_usb3phy_reset_l,
+	.num_resets		= ARRAY_SIZE(msm8996_usb3phy_reset_l),
+	.vreg_list		= qmp_phy_vreg_l,
+	.num_vregs		= ARRAY_SIZE(qmp_phy_vreg_l),
+	.regs			= qmp_v5_usb3phy_regs_layout,
+	.pcs_usb_offset		= 0x300,
+};
+
+static void qmp_usb_legacy_configure_lane(void __iomem *base,
+					const struct qmp_phy_init_tbl tbl[],
+					int num,
+					u8 lane_mask)
+{
+	int i;
+	const struct qmp_phy_init_tbl *t = tbl;
+
+	if (!t)
+		return;
+
+	for (i = 0; i < num; i++, t++) {
+		if (!(t->lane_mask & lane_mask))
+			continue;
+
+		writel(t->val, base + t->offset);
+	}
+}
+
+static void qmp_usb_legacy_configure(void __iomem *base,
+				   const struct qmp_phy_init_tbl tbl[],
+				   int num)
+{
+	qmp_usb_legacy_configure_lane(base, tbl, num, 0xff);
+}
+
+static int qmp_usb_legacy_serdes_init(struct qmp_usb *qmp)
+{
+	const struct qmp_phy_cfg *cfg = qmp->cfg;
+	void __iomem *serdes = qmp->serdes;
+	const struct qmp_phy_init_tbl *serdes_tbl = cfg->serdes_tbl;
+	int serdes_tbl_num = cfg->serdes_tbl_num;
+
+	qmp_usb_legacy_configure(serdes, serdes_tbl, serdes_tbl_num);
+
+	return 0;
+}
+
+static void qmp_usb_legacy_init_dp_com(struct phy *phy)
+{
+	struct qmp_usb *qmp = phy_get_drvdata(phy);
+	void __iomem *dp_com = qmp->dp_com;
+
+	qphy_setbits(dp_com, QPHY_V3_DP_COM_POWER_DOWN_CTRL,
+		     SW_PWRDN);
+	/* override hardware control for reset of qmp phy */
+	qphy_setbits(dp_com, QPHY_V3_DP_COM_RESET_OVRD_CTRL,
+		     SW_DPPHY_RESET_MUX | SW_DPPHY_RESET |
+		     SW_USB3PHY_RESET_MUX | SW_USB3PHY_RESET);
+
+	/* Default type-c orientation, i.e CC1 */
+	qphy_setbits(dp_com, QPHY_V3_DP_COM_TYPEC_CTRL, 0x02);
+
+	qphy_setbits(dp_com, QPHY_V3_DP_COM_PHY_MODE_CTRL,
+		     USB3_MODE | DP_MODE);
+
+	/* bring both QMP USB and QMP DP PHYs PCS block out of reset */
+	qphy_clrbits(dp_com, QPHY_V3_DP_COM_RESET_OVRD_CTRL,
+		     SW_DPPHY_RESET_MUX | SW_DPPHY_RESET |
+		     SW_USB3PHY_RESET_MUX | SW_USB3PHY_RESET);
+
+	qphy_clrbits(dp_com, QPHY_V3_DP_COM_SWI_CTRL, 0x03);
+	qphy_clrbits(dp_com, QPHY_V3_DP_COM_SW_RESET, SW_RESET);
+}
+
+static int qmp_usb_legacy_init(struct phy *phy)
+{
+	struct qmp_usb *qmp = phy_get_drvdata(phy);
+	const struct qmp_phy_cfg *cfg = qmp->cfg;
+	void __iomem *pcs = qmp->pcs;
+	int ret;
+
+	ret = regulator_bulk_enable(cfg->num_vregs, qmp->vregs);
+	if (ret) {
+		dev_err(qmp->dev, "failed to enable regulators, err=%d\n", ret);
+		return ret;
+	}
+
+	ret = reset_control_bulk_assert(cfg->num_resets, qmp->resets);
+	if (ret) {
+		dev_err(qmp->dev, "reset assert failed\n");
+		goto err_disable_regulators;
+	}
+
+	ret = reset_control_bulk_deassert(cfg->num_resets, qmp->resets);
+	if (ret) {
+		dev_err(qmp->dev, "reset deassert failed\n");
+		goto err_disable_regulators;
+	}
+
+	ret = clk_bulk_prepare_enable(cfg->num_clks, qmp->clks);
+	if (ret)
+		goto err_assert_reset;
+
+	qmp_usb_legacy_init_dp_com(phy);
+
+	qphy_setbits(pcs, cfg->regs[QPHY_PCS_POWER_DOWN_CONTROL], SW_PWRDN);
+
+	return 0;
+
+err_assert_reset:
+	reset_control_bulk_assert(cfg->num_resets, qmp->resets);
+err_disable_regulators:
+	regulator_bulk_disable(cfg->num_vregs, qmp->vregs);
+
+	return ret;
+}
+
+static int qmp_usb_legacy_exit(struct phy *phy)
+{
+	struct qmp_usb *qmp = phy_get_drvdata(phy);
+	const struct qmp_phy_cfg *cfg = qmp->cfg;
+
+	reset_control_bulk_assert(cfg->num_resets, qmp->resets);
+
+	clk_bulk_disable_unprepare(cfg->num_clks, qmp->clks);
+
+	regulator_bulk_disable(cfg->num_vregs, qmp->vregs);
+
+	return 0;
+}
+
+static int qmp_usb_legacy_power_on(struct phy *phy)
+{
+	struct qmp_usb *qmp = phy_get_drvdata(phy);
+	const struct qmp_phy_cfg *cfg = qmp->cfg;
+	void __iomem *tx = qmp->tx;
+	void __iomem *rx = qmp->rx;
+	void __iomem *pcs = qmp->pcs;
+	void __iomem *status;
+	unsigned int val;
+	int ret;
+
+	qmp_usb_legacy_serdes_init(qmp);
+
+	ret = clk_prepare_enable(qmp->pipe_clk);
+	if (ret) {
+		dev_err(qmp->dev, "pipe_clk enable failed err=%d\n", ret);
+		return ret;
+	}
+
+	/* Tx, Rx, and PCS configurations */
+	qmp_usb_legacy_configure_lane(tx, cfg->tx_tbl, cfg->tx_tbl_num, 1);
+	qmp_usb_legacy_configure_lane(rx, cfg->rx_tbl, cfg->rx_tbl_num, 1);
+
+	if (cfg->lanes >= 2) {
+		qmp_usb_legacy_configure_lane(qmp->tx2, cfg->tx_tbl, cfg->tx_tbl_num, 2);
+		qmp_usb_legacy_configure_lane(qmp->rx2, cfg->rx_tbl, cfg->rx_tbl_num, 2);
+	}
+
+	qmp_usb_legacy_configure(pcs, cfg->pcs_tbl, cfg->pcs_tbl_num);
+
+	usleep_range(10, 20);
+
+	/* Pull PHY out of reset state */
+	qphy_clrbits(pcs, cfg->regs[QPHY_SW_RESET], SW_RESET);
+
+	/* start SerDes and Phy-Coding-Sublayer */
+	qphy_setbits(pcs, cfg->regs[QPHY_START_CTRL], SERDES_START | PCS_START);
+
+	status = pcs + cfg->regs[QPHY_PCS_STATUS];
+	ret = readl_poll_timeout(status, val, !(val & PHYSTATUS), 200,
+				 PHY_INIT_COMPLETE_TIMEOUT);
+	if (ret) {
+		dev_err(qmp->dev, "phy initialization timed-out\n");
+		goto err_disable_pipe_clk;
+	}
+
+	return 0;
+
+err_disable_pipe_clk:
+	clk_disable_unprepare(qmp->pipe_clk);
+
+	return ret;
+}
+
+static int qmp_usb_legacy_power_off(struct phy *phy)
+{
+	struct qmp_usb *qmp = phy_get_drvdata(phy);
+	const struct qmp_phy_cfg *cfg = qmp->cfg;
+
+	clk_disable_unprepare(qmp->pipe_clk);
+
+	/* PHY reset */
+	qphy_setbits(qmp->pcs, cfg->regs[QPHY_SW_RESET], SW_RESET);
+
+	/* stop SerDes and Phy-Coding-Sublayer */
+	qphy_clrbits(qmp->pcs, cfg->regs[QPHY_START_CTRL],
+			SERDES_START | PCS_START);
+
+	/* Put PHY into POWER DOWN state: active low */
+	qphy_clrbits(qmp->pcs, cfg->regs[QPHY_PCS_POWER_DOWN_CONTROL],
+			SW_PWRDN);
+
+	return 0;
+}
+
+static int qmp_usb_legacy_enable(struct phy *phy)
+{
+	int ret;
+
+	ret = qmp_usb_legacy_init(phy);
+	if (ret)
+		return ret;
+
+	ret = qmp_usb_legacy_power_on(phy);
+	if (ret)
+		qmp_usb_legacy_exit(phy);
+
+	return ret;
+}
+
+static int qmp_usb_legacy_disable(struct phy *phy)
+{
+	int ret;
+
+	ret = qmp_usb_legacy_power_off(phy);
+	if (ret)
+		return ret;
+	return qmp_usb_legacy_exit(phy);
+}
+
+static int qmp_usb_legacy_set_mode(struct phy *phy, enum phy_mode mode, int submode)
+{
+	struct qmp_usb *qmp = phy_get_drvdata(phy);
+
+	qmp->mode = mode;
+
+	return 0;
+}
+
+static const struct phy_ops qmp_usb_legacy_phy_ops = {
+	.init		= qmp_usb_legacy_enable,
+	.exit		= qmp_usb_legacy_disable,
+	.set_mode	= qmp_usb_legacy_set_mode,
+	.owner		= THIS_MODULE,
+};
+
+static void qmp_usb_legacy_enable_autonomous_mode(struct qmp_usb *qmp)
+{
+	const struct qmp_phy_cfg *cfg = qmp->cfg;
+	void __iomem *pcs_usb = qmp->pcs_usb ?: qmp->pcs;
+	void __iomem *pcs_misc = qmp->pcs_misc;
+	u32 intr_mask;
+
+	if (qmp->mode == PHY_MODE_USB_HOST_SS ||
+	    qmp->mode == PHY_MODE_USB_DEVICE_SS)
+		intr_mask = ARCVR_DTCT_EN | ALFPS_DTCT_EN;
+	else
+		intr_mask = ARCVR_DTCT_EN | ARCVR_DTCT_EVENT_SEL;
+
+	/* Clear any pending interrupts status */
+	qphy_setbits(pcs_usb, cfg->regs[QPHY_PCS_LFPS_RXTERM_IRQ_CLEAR], IRQ_CLEAR);
+	/* Writing 1 followed by 0 clears the interrupt */
+	qphy_clrbits(pcs_usb, cfg->regs[QPHY_PCS_LFPS_RXTERM_IRQ_CLEAR], IRQ_CLEAR);
+
+	qphy_clrbits(pcs_usb, cfg->regs[QPHY_PCS_AUTONOMOUS_MODE_CTRL],
+		     ARCVR_DTCT_EN | ALFPS_DTCT_EN | ARCVR_DTCT_EVENT_SEL);
+
+	/* Enable required PHY autonomous mode interrupts */
+	qphy_setbits(pcs_usb, cfg->regs[QPHY_PCS_AUTONOMOUS_MODE_CTRL], intr_mask);
+
+	/* Enable i/o clamp_n for autonomous mode */
+	if (pcs_misc)
+		qphy_clrbits(pcs_misc, QPHY_V3_PCS_MISC_CLAMP_ENABLE, CLAMP_EN);
+}
+
+static void qmp_usb_legacy_disable_autonomous_mode(struct qmp_usb *qmp)
+{
+	const struct qmp_phy_cfg *cfg = qmp->cfg;
+	void __iomem *pcs_usb = qmp->pcs_usb ?: qmp->pcs;
+	void __iomem *pcs_misc = qmp->pcs_misc;
+
+	/* Disable i/o clamp_n on resume for normal mode */
+	if (pcs_misc)
+		qphy_setbits(pcs_misc, QPHY_V3_PCS_MISC_CLAMP_ENABLE, CLAMP_EN);
+
+	qphy_clrbits(pcs_usb, cfg->regs[QPHY_PCS_AUTONOMOUS_MODE_CTRL],
+		     ARCVR_DTCT_EN | ARCVR_DTCT_EVENT_SEL | ALFPS_DTCT_EN);
+
+	qphy_setbits(pcs_usb, cfg->regs[QPHY_PCS_LFPS_RXTERM_IRQ_CLEAR], IRQ_CLEAR);
+	/* Writing 1 followed by 0 clears the interrupt */
+	qphy_clrbits(pcs_usb, cfg->regs[QPHY_PCS_LFPS_RXTERM_IRQ_CLEAR], IRQ_CLEAR);
+}
+
+static int __maybe_unused qmp_usb_legacy_runtime_suspend(struct device *dev)
+{
+	struct qmp_usb *qmp = dev_get_drvdata(dev);
+	const struct qmp_phy_cfg *cfg = qmp->cfg;
+
+	dev_vdbg(dev, "Suspending QMP phy, mode:%d\n", qmp->mode);
+
+	if (!qmp->phy->init_count) {
+		dev_vdbg(dev, "PHY not initialized, bailing out\n");
+		return 0;
+	}
+
+	qmp_usb_legacy_enable_autonomous_mode(qmp);
+
+	clk_disable_unprepare(qmp->pipe_clk);
+	clk_bulk_disable_unprepare(cfg->num_clks, qmp->clks);
+
+	return 0;
+}
+
+static int __maybe_unused qmp_usb_legacy_runtime_resume(struct device *dev)
+{
+	struct qmp_usb *qmp = dev_get_drvdata(dev);
+	const struct qmp_phy_cfg *cfg = qmp->cfg;
+	int ret = 0;
+
+	dev_vdbg(dev, "Resuming QMP phy, mode:%d\n", qmp->mode);
+
+	if (!qmp->phy->init_count) {
+		dev_vdbg(dev, "PHY not initialized, bailing out\n");
+		return 0;
+	}
+
+	ret = clk_bulk_prepare_enable(cfg->num_clks, qmp->clks);
+	if (ret)
+		return ret;
+
+	ret = clk_prepare_enable(qmp->pipe_clk);
+	if (ret) {
+		dev_err(dev, "pipe_clk enable failed, err=%d\n", ret);
+		clk_bulk_disable_unprepare(cfg->num_clks, qmp->clks);
+		return ret;
+	}
+
+	qmp_usb_legacy_disable_autonomous_mode(qmp);
+
+	return 0;
+}
+
+static const struct dev_pm_ops qmp_usb_legacy_pm_ops = {
+	SET_RUNTIME_PM_OPS(qmp_usb_legacy_runtime_suspend,
+			   qmp_usb_legacy_runtime_resume, NULL)
+};
+
+static int qmp_usb_legacy_vreg_init(struct qmp_usb *qmp)
+{
+	const struct qmp_phy_cfg *cfg = qmp->cfg;
+	struct device *dev = qmp->dev;
+	int num = cfg->num_vregs;
+	int i;
+
+	qmp->vregs = devm_kcalloc(dev, num, sizeof(*qmp->vregs), GFP_KERNEL);
+	if (!qmp->vregs)
+		return -ENOMEM;
+
+	for (i = 0; i < num; i++)
+		qmp->vregs[i].supply = cfg->vreg_list[i];
+
+	return devm_regulator_bulk_get(dev, num, qmp->vregs);
+}
+
+static int qmp_usb_legacy_reset_init(struct qmp_usb *qmp)
+{
+	const struct qmp_phy_cfg *cfg = qmp->cfg;
+	struct device *dev = qmp->dev;
+	int i;
+	int ret;
+
+	qmp->resets = devm_kcalloc(dev, cfg->num_resets,
+				   sizeof(*qmp->resets), GFP_KERNEL);
+	if (!qmp->resets)
+		return -ENOMEM;
+
+	for (i = 0; i < cfg->num_resets; i++)
+		qmp->resets[i].id = cfg->reset_list[i];
+
+	ret = devm_reset_control_bulk_get_exclusive(dev, cfg->num_resets, qmp->resets);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to get resets\n");
+
+	return 0;
+}
+
+static int qmp_usb_legacy_clk_init(struct qmp_usb *qmp)
+{
+	const struct qmp_phy_cfg *cfg = qmp->cfg;
+	struct device *dev = qmp->dev;
+	int num = cfg->num_clks;
+	int i;
+
+	qmp->clks = devm_kcalloc(dev, num, sizeof(*qmp->clks), GFP_KERNEL);
+	if (!qmp->clks)
+		return -ENOMEM;
+
+	for (i = 0; i < num; i++)
+		qmp->clks[i].id = cfg->clk_list[i];
+
+	return devm_clk_bulk_get(dev, num, qmp->clks);
+}
+
+static void phy_clk_release_provider(void *res)
+{
+	of_clk_del_provider(res);
+}
+
+/*
+ * Register a fixed rate pipe clock.
+ *
+ * The <s>_pipe_clksrc generated by PHY goes to the GCC that gate
+ * controls it. The <s>_pipe_clk coming out of the GCC is requested
+ * by the PHY driver for its operations.
+ * We register the <s>_pipe_clksrc here. The gcc driver takes care
+ * of assigning this <s>_pipe_clksrc as parent to <s>_pipe_clk.
+ * Below picture shows this relationship.
+ *
+ *         +---------------+
+ *         |   PHY block   |<<---------------------------------------+
+ *         |               |                                         |
+ *         |   +-------+   |                   +-----+               |
+ *   I/P---^-->|  PLL  |---^--->pipe_clksrc--->| GCC |--->pipe_clk---+
+ *    clk  |   +-------+   |                   +-----+
+ *         +---------------+
+ */
+static int phy_pipe_clk_register(struct qmp_usb *qmp, struct device_node *np)
+{
+	struct clk_fixed_rate *fixed = &qmp->pipe_clk_fixed;
+	struct clk_init_data init = { };
+	int ret;
+
+	ret = of_property_read_string(np, "clock-output-names", &init.name);
+	if (ret) {
+		dev_err(qmp->dev, "%pOFn: No clock-output-names\n", np);
+		return ret;
+	}
+
+	init.ops = &clk_fixed_rate_ops;
+
+	/* controllers using QMP phys use 125MHz pipe clock interface */
+	fixed->fixed_rate = 125000000;
+	fixed->hw.init = &init;
+
+	ret = devm_clk_hw_register(qmp->dev, &fixed->hw);
+	if (ret)
+		return ret;
+
+	ret = of_clk_add_hw_provider(np, of_clk_hw_simple_get, &fixed->hw);
+	if (ret)
+		return ret;
+
+	/*
+	 * Roll a devm action because the clock provider is the child node, but
+	 * the child node is not actually a device.
+	 */
+	return devm_add_action_or_reset(qmp->dev, phy_clk_release_provider, np);
+}
+
+static void __iomem *qmp_usb_legacy_iomap(struct device *dev, struct device_node *np,
+					int index, bool exclusive)
+{
+	struct resource res;
+
+	if (!exclusive) {
+		if (of_address_to_resource(np, index, &res))
+			return IOMEM_ERR_PTR(-EINVAL);
+
+		return devm_ioremap(dev, res.start, resource_size(&res));
+	}
+
+	return devm_of_iomap(dev, np, index, NULL);
+}
+
+static int qmp_usb_legacy_parse_dt_legacy(struct qmp_usb *qmp, struct device_node *np)
+{
+	struct platform_device *pdev = to_platform_device(qmp->dev);
+	const struct qmp_phy_cfg *cfg = qmp->cfg;
+	struct device *dev = qmp->dev;
+	bool exclusive = true;
+
+	qmp->serdes = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(qmp->serdes))
+		return PTR_ERR(qmp->serdes);
+
+	qmp->dp_com = devm_platform_ioremap_resource(pdev, 1);
+	if (IS_ERR(qmp->dp_com))
+		return PTR_ERR(qmp->dp_com);
+
+	/*
+	 * Get memory resources for the PHY:
+	 * Resources are indexed as: tx -> 0; rx -> 1; pcs -> 2.
+	 * For dual lane PHYs: tx2 -> 3, rx2 -> 4, pcs_misc (optional) -> 5
+	 * For single lane PHYs: pcs_misc (optional) -> 3.
+	 */
+	qmp->tx = devm_of_iomap(dev, np, 0, NULL);
+	if (IS_ERR(qmp->tx))
+		return PTR_ERR(qmp->tx);
+
+	qmp->rx = devm_of_iomap(dev, np, 1, NULL);
+	if (IS_ERR(qmp->rx))
+		return PTR_ERR(qmp->rx);
+
+	qmp->pcs = qmp_usb_legacy_iomap(dev, np, 2, exclusive);
+	if (IS_ERR(qmp->pcs))
+		return PTR_ERR(qmp->pcs);
+
+	if (cfg->pcs_usb_offset)
+		qmp->pcs_usb = qmp->pcs + cfg->pcs_usb_offset;
+
+	if (cfg->lanes >= 2) {
+		qmp->tx2 = devm_of_iomap(dev, np, 3, NULL);
+		if (IS_ERR(qmp->tx2))
+			return PTR_ERR(qmp->tx2);
+
+		qmp->rx2 = devm_of_iomap(dev, np, 4, NULL);
+		if (IS_ERR(qmp->rx2))
+			return PTR_ERR(qmp->rx2);
+
+		qmp->pcs_misc = devm_of_iomap(dev, np, 5, NULL);
+	} else {
+		qmp->pcs_misc = devm_of_iomap(dev, np, 3, NULL);
+	}
+
+	if (IS_ERR(qmp->pcs_misc)) {
+		dev_vdbg(dev, "PHY pcs_misc-reg not used\n");
+		qmp->pcs_misc = NULL;
+	}
+
+	qmp->pipe_clk = devm_get_clk_from_child(dev, np, NULL);
+	if (IS_ERR(qmp->pipe_clk)) {
+		return dev_err_probe(dev, PTR_ERR(qmp->pipe_clk),
+				     "failed to get pipe clock\n");
+	}
+
+	return 0;
+}
+
+static int qmp_usb_legacy_parse_dt(struct qmp_usb *qmp)
+{
+	struct platform_device *pdev = to_platform_device(qmp->dev);
+	const struct qmp_phy_cfg *cfg = qmp->cfg;
+	const struct qmp_usb_legacy_offsets *offs = cfg->offsets;
+	struct device *dev = qmp->dev;
+	void __iomem *base;
+
+	if (!offs)
+		return -EINVAL;
+
+	base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(base))
+		return PTR_ERR(base);
+
+	qmp->serdes = base + offs->serdes;
+	qmp->pcs = base + offs->pcs;
+	qmp->pcs_usb = base + offs->pcs_usb;
+	qmp->tx = base + offs->tx;
+	qmp->rx = base + offs->rx;
+
+	qmp->pipe_clk = devm_clk_get(dev, "pipe");
+	if (IS_ERR(qmp->pipe_clk)) {
+		return dev_err_probe(dev, PTR_ERR(qmp->pipe_clk),
+				     "failed to get pipe clock\n");
+	}
+
+	return 0;
+}
+
+static int qmp_usb_legacy_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct phy_provider *phy_provider;
+	struct device_node *np;
+	struct qmp_usb *qmp;
+	int ret;
+
+	qmp = devm_kzalloc(dev, sizeof(*qmp), GFP_KERNEL);
+	if (!qmp)
+		return -ENOMEM;
+
+	qmp->dev = dev;
+
+	qmp->cfg = of_device_get_match_data(dev);
+	if (!qmp->cfg)
+		return -EINVAL;
+
+	ret = qmp_usb_legacy_clk_init(qmp);
+	if (ret)
+		return ret;
+
+	ret = qmp_usb_legacy_reset_init(qmp);
+	if (ret)
+		return ret;
+
+	ret = qmp_usb_legacy_vreg_init(qmp);
+	if (ret)
+		return ret;
+
+	/* Check for legacy binding with child node. */
+	np = of_get_next_available_child(dev->of_node, NULL);
+	if (np) {
+		ret = qmp_usb_legacy_parse_dt_legacy(qmp, np);
+	} else {
+		np = of_node_get(dev->of_node);
+		ret = qmp_usb_legacy_parse_dt(qmp);
+	}
+	if (ret)
+		goto err_node_put;
+
+	pm_runtime_set_active(dev);
+	ret = devm_pm_runtime_enable(dev);
+	if (ret)
+		goto err_node_put;
+	/*
+	 * Prevent runtime pm from being ON by default. Users can enable
+	 * it using power/control in sysfs.
+	 */
+	pm_runtime_forbid(dev);
+
+	ret = phy_pipe_clk_register(qmp, np);
+	if (ret)
+		goto err_node_put;
+
+	qmp->phy = devm_phy_create(dev, np, &qmp_usb_legacy_phy_ops);
+	if (IS_ERR(qmp->phy)) {
+		ret = PTR_ERR(qmp->phy);
+		dev_err(dev, "failed to create PHY: %d\n", ret);
+		goto err_node_put;
+	}
+
+	phy_set_drvdata(qmp->phy, qmp);
+
+	of_node_put(np);
+
+	phy_provider = devm_of_phy_provider_register(dev, of_phy_simple_xlate);
+
+	return PTR_ERR_OR_ZERO(phy_provider);
+
+err_node_put:
+	of_node_put(np);
+	return ret;
+}
+
+static const struct of_device_id qmp_usb_legacy_of_match_table[] = {
+	{
+		.compatible = "qcom,sc7180-qmp-usb3-phy",
+		.data = &sc7180_usb3phy_cfg,
+	}, {
+		.compatible = "qcom,sc8180x-qmp-usb3-phy",
+		.data = &sm8150_usb3phy_cfg,
+	}, {
+		.compatible = "qcom,sdm845-qmp-usb3-phy",
+		.data = &qmp_v3_usb3phy_cfg,
+	}, {
+		.compatible = "qcom,sm8150-qmp-usb3-phy",
+		.data = &sm8150_usb3phy_cfg,
+	}, {
+		.compatible = "qcom,sm8250-qmp-usb3-phy",
+		.data = &sm8250_usb3phy_cfg,
+	}, {
+		.compatible = "qcom,sm8350-qmp-usb3-phy",
+		.data = &sm8350_usb3phy_cfg,
+	}, {
+		.compatible = "qcom,sm8450-qmp-usb3-phy",
+		.data = &sm8350_usb3phy_cfg,
+	},
+	{ },
+};
+MODULE_DEVICE_TABLE(of, qmp_usb_legacy_of_match_table);
+
+static struct platform_driver qmp_usb_legacy_driver = {
+	.probe		= qmp_usb_legacy_probe,
+	.driver = {
+		.name	= "qcom-qmp-usb-legacy-phy",
+		.pm	= &qmp_usb_legacy_pm_ops,
+		.of_match_table = qmp_usb_legacy_of_match_table,
+	},
+};
+
+module_platform_driver(qmp_usb_legacy_driver);
+
+MODULE_AUTHOR("Vivek Gautam <vivek.gautam@codeaurora.org>");
+MODULE_DESCRIPTION("Qualcomm QMP legacy USB+DP PHY driver");
+MODULE_LICENSE("GPL v2");
diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-usb.c b/drivers/phy/qualcomm/phy-qcom-qmp-usb.c
index a49711c5a63d..da50aa673cea 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-usb.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-usb.c
@@ -285,112 +285,6 @@ static const struct qmp_phy_init_tbl msm8996_usb3_pcs_tbl[] = {
 	QMP_PHY_INIT_CFG(QPHY_V2_PCS_POWER_STATE_CONFIG2, 0x08),
 };
 
-static const struct qmp_phy_init_tbl qmp_v3_usb3_serdes_tbl[] = {
-	QMP_PHY_INIT_CFG(QSERDES_V3_COM_PLL_IVCO, 0x07),
-	QMP_PHY_INIT_CFG(QSERDES_V3_COM_SYSCLK_EN_SEL, 0x14),
-	QMP_PHY_INIT_CFG(QSERDES_V3_COM_BIAS_EN_CLKBUFLR_EN, 0x08),
-	QMP_PHY_INIT_CFG(QSERDES_V3_COM_CLK_SELECT, 0x30),
-	QMP_PHY_INIT_CFG(QSERDES_V3_COM_SYS_CLK_CTRL, 0x02),
-	QMP_PHY_INIT_CFG(QSERDES_V3_COM_RESETSM_CNTRL2, 0x08),
-	QMP_PHY_INIT_CFG(QSERDES_V3_COM_CMN_CONFIG, 0x16),
-	QMP_PHY_INIT_CFG(QSERDES_V3_COM_SVS_MODE_CLK_SEL, 0x01),
-	QMP_PHY_INIT_CFG(QSERDES_V3_COM_HSCLK_SEL, 0x80),
-	QMP_PHY_INIT_CFG(QSERDES_V3_COM_DEC_START_MODE0, 0x82),
-	QMP_PHY_INIT_CFG(QSERDES_V3_COM_DIV_FRAC_START1_MODE0, 0xab),
-	QMP_PHY_INIT_CFG(QSERDES_V3_COM_DIV_FRAC_START2_MODE0, 0xea),
-	QMP_PHY_INIT_CFG(QSERDES_V3_COM_DIV_FRAC_START3_MODE0, 0x02),
-	QMP_PHY_INIT_CFG(QSERDES_V3_COM_CP_CTRL_MODE0, 0x06),
-	QMP_PHY_INIT_CFG(QSERDES_V3_COM_PLL_RCTRL_MODE0, 0x16),
-	QMP_PHY_INIT_CFG(QSERDES_V3_COM_PLL_CCTRL_MODE0, 0x36),
-	QMP_PHY_INIT_CFG(QSERDES_V3_COM_INTEGLOOP_GAIN1_MODE0, 0x00),
-	QMP_PHY_INIT_CFG(QSERDES_V3_COM_INTEGLOOP_GAIN0_MODE0, 0x3f),
-	QMP_PHY_INIT_CFG(QSERDES_V3_COM_VCO_TUNE2_MODE0, 0x01),
-	QMP_PHY_INIT_CFG(QSERDES_V3_COM_VCO_TUNE1_MODE0, 0xc9),
-	QMP_PHY_INIT_CFG(QSERDES_V3_COM_CORECLK_DIV_MODE0, 0x0a),
-	QMP_PHY_INIT_CFG(QSERDES_V3_COM_LOCK_CMP3_MODE0, 0x00),
-	QMP_PHY_INIT_CFG(QSERDES_V3_COM_LOCK_CMP2_MODE0, 0x34),
-	QMP_PHY_INIT_CFG(QSERDES_V3_COM_LOCK_CMP1_MODE0, 0x15),
-	QMP_PHY_INIT_CFG(QSERDES_V3_COM_LOCK_CMP_EN, 0x04),
-	QMP_PHY_INIT_CFG(QSERDES_V3_COM_CORE_CLK_EN, 0x00),
-	QMP_PHY_INIT_CFG(QSERDES_V3_COM_LOCK_CMP_CFG, 0x00),
-	QMP_PHY_INIT_CFG(QSERDES_V3_COM_VCO_TUNE_MAP, 0x00),
-	QMP_PHY_INIT_CFG(QSERDES_V3_COM_SYSCLK_BUF_ENABLE, 0x0a),
-	QMP_PHY_INIT_CFG(QSERDES_V3_COM_SSC_EN_CENTER, 0x01),
-	QMP_PHY_INIT_CFG(QSERDES_V3_COM_SSC_PER1, 0x31),
-	QMP_PHY_INIT_CFG(QSERDES_V3_COM_SSC_PER2, 0x01),
-	QMP_PHY_INIT_CFG(QSERDES_V3_COM_SSC_ADJ_PER1, 0x00),
-	QMP_PHY_INIT_CFG(QSERDES_V3_COM_SSC_ADJ_PER2, 0x00),
-	QMP_PHY_INIT_CFG(QSERDES_V3_COM_SSC_STEP_SIZE1, 0x85),
-	QMP_PHY_INIT_CFG(QSERDES_V3_COM_SSC_STEP_SIZE2, 0x07),
-};
-
-static const struct qmp_phy_init_tbl qmp_v3_usb3_tx_tbl[] = {
-	QMP_PHY_INIT_CFG(QSERDES_V3_TX_HIGHZ_DRVR_EN, 0x10),
-	QMP_PHY_INIT_CFG(QSERDES_V3_TX_RCV_DETECT_LVL_2, 0x12),
-	QMP_PHY_INIT_CFG(QSERDES_V3_TX_LANE_MODE_1, 0x16),
-	QMP_PHY_INIT_CFG(QSERDES_V3_TX_RES_CODE_LANE_OFFSET_RX, 0x09),
-	QMP_PHY_INIT_CFG(QSERDES_V3_TX_RES_CODE_LANE_OFFSET_TX, 0x06),
-};
-
-static const struct qmp_phy_init_tbl qmp_v3_usb3_rx_tbl[] = {
-	QMP_PHY_INIT_CFG(QSERDES_V3_RX_UCDR_FASTLOCK_FO_GAIN, 0x0b),
-	QMP_PHY_INIT_CFG(QSERDES_V3_RX_RX_EQU_ADAPTOR_CNTRL2, 0x0f),
-	QMP_PHY_INIT_CFG(QSERDES_V3_RX_RX_EQU_ADAPTOR_CNTRL3, 0x4e),
-	QMP_PHY_INIT_CFG(QSERDES_V3_RX_RX_EQU_ADAPTOR_CNTRL4, 0x18),
-	QMP_PHY_INIT_CFG(QSERDES_V3_RX_RX_EQ_OFFSET_ADAPTOR_CNTRL1, 0x77),
-	QMP_PHY_INIT_CFG(QSERDES_V3_RX_RX_OFFSET_ADAPTOR_CNTRL2, 0x80),
-	QMP_PHY_INIT_CFG(QSERDES_V3_RX_SIGDET_CNTRL, 0x03),
-	QMP_PHY_INIT_CFG(QSERDES_V3_RX_SIGDET_DEGLITCH_CNTRL, 0x16),
-	QMP_PHY_INIT_CFG(QSERDES_V3_RX_UCDR_SO_SATURATION_AND_ENABLE, 0x75),
-};
-
-static const struct qmp_phy_init_tbl qmp_v3_usb3_pcs_tbl[] = {
-	/* FLL settings */
-	QMP_PHY_INIT_CFG(QPHY_V3_PCS_FLL_CNTRL2, 0x83),
-	QMP_PHY_INIT_CFG(QPHY_V3_PCS_FLL_CNT_VAL_L, 0x09),
-	QMP_PHY_INIT_CFG(QPHY_V3_PCS_FLL_CNT_VAL_H_TOL, 0xa2),
-	QMP_PHY_INIT_CFG(QPHY_V3_PCS_FLL_MAN_CODE, 0x40),
-	QMP_PHY_INIT_CFG(QPHY_V3_PCS_FLL_CNTRL1, 0x02),
-
-	/* Lock Det settings */
-	QMP_PHY_INIT_CFG(QPHY_V3_PCS_LOCK_DETECT_CONFIG1, 0xd1),
-	QMP_PHY_INIT_CFG(QPHY_V3_PCS_LOCK_DETECT_CONFIG2, 0x1f),
-	QMP_PHY_INIT_CFG(QPHY_V3_PCS_LOCK_DETECT_CONFIG3, 0x47),
-	QMP_PHY_INIT_CFG(QPHY_V3_PCS_POWER_STATE_CONFIG2, 0x1b),
-
-	QMP_PHY_INIT_CFG(QPHY_V3_PCS_RX_SIGDET_LVL, 0xba),
-	QMP_PHY_INIT_CFG(QPHY_V3_PCS_TXMGN_V0, 0x9f),
-	QMP_PHY_INIT_CFG(QPHY_V3_PCS_TXMGN_V1, 0x9f),
-	QMP_PHY_INIT_CFG(QPHY_V3_PCS_TXMGN_V2, 0xb7),
-	QMP_PHY_INIT_CFG(QPHY_V3_PCS_TXMGN_V3, 0x4e),
-	QMP_PHY_INIT_CFG(QPHY_V3_PCS_TXMGN_V4, 0x65),
-	QMP_PHY_INIT_CFG(QPHY_V3_PCS_TXMGN_LS, 0x6b),
-	QMP_PHY_INIT_CFG(QPHY_V3_PCS_TXDEEMPH_M6DB_V0, 0x15),
-	QMP_PHY_INIT_CFG(QPHY_V3_PCS_TXDEEMPH_M3P5DB_V0, 0x0d),
-	QMP_PHY_INIT_CFG(QPHY_V3_PCS_TXDEEMPH_M6DB_V1, 0x15),
-	QMP_PHY_INIT_CFG(QPHY_V3_PCS_TXDEEMPH_M3P5DB_V1, 0x0d),
-	QMP_PHY_INIT_CFG(QPHY_V3_PCS_TXDEEMPH_M6DB_V2, 0x15),
-	QMP_PHY_INIT_CFG(QPHY_V3_PCS_TXDEEMPH_M3P5DB_V2, 0x0d),
-	QMP_PHY_INIT_CFG(QPHY_V3_PCS_TXDEEMPH_M6DB_V3, 0x15),
-	QMP_PHY_INIT_CFG(QPHY_V3_PCS_TXDEEMPH_M3P5DB_V3, 0x1d),
-	QMP_PHY_INIT_CFG(QPHY_V3_PCS_TXDEEMPH_M6DB_V4, 0x15),
-	QMP_PHY_INIT_CFG(QPHY_V3_PCS_TXDEEMPH_M3P5DB_V4, 0x0d),
-	QMP_PHY_INIT_CFG(QPHY_V3_PCS_TXDEEMPH_M6DB_LS, 0x15),
-	QMP_PHY_INIT_CFG(QPHY_V3_PCS_TXDEEMPH_M3P5DB_LS, 0x0d),
-
-	QMP_PHY_INIT_CFG(QPHY_V3_PCS_RATE_SLEW_CNTRL, 0x02),
-	QMP_PHY_INIT_CFG(QPHY_V3_PCS_PWRUP_RESET_DLY_TIME_AUXCLK, 0x04),
-	QMP_PHY_INIT_CFG(QPHY_V3_PCS_TSYNC_RSYNC_TIME, 0x44),
-	QMP_PHY_INIT_CFG(QPHY_V3_PCS_PWRUP_RESET_DLY_TIME_AUXCLK, 0x04),
-	QMP_PHY_INIT_CFG(QPHY_V3_PCS_RCVR_DTCT_DLY_P1U2_L, 0xe7),
-	QMP_PHY_INIT_CFG(QPHY_V3_PCS_RCVR_DTCT_DLY_P1U2_H, 0x03),
-	QMP_PHY_INIT_CFG(QPHY_V3_PCS_RCVR_DTCT_DLY_U3_L, 0x40),
-	QMP_PHY_INIT_CFG(QPHY_V3_PCS_RCVR_DTCT_DLY_U3_H, 0x00),
-	QMP_PHY_INIT_CFG(QPHY_V3_PCS_RXEQTRAINING_WAIT_TIME, 0x75),
-	QMP_PHY_INIT_CFG(QPHY_V3_PCS_LFPS_TX_ECSTART_EQTLOCK, 0x86),
-	QMP_PHY_INIT_CFG(QPHY_V3_PCS_RXEQTRAINING_RUN_TIME, 0x13),
-};
-
 static const struct qmp_phy_init_tbl qmp_v3_usb3_uniphy_serdes_tbl[] = {
 	QMP_PHY_INIT_CFG(QSERDES_V3_COM_PLL_IVCO, 0x07),
 	QMP_PHY_INIT_CFG(QSERDES_V3_COM_SYSCLK_EN_SEL, 0x14),
@@ -611,117 +505,6 @@ static const struct qmp_phy_init_tbl msm8998_usb3_pcs_tbl[] = {
 	QMP_PHY_INIT_CFG(QPHY_V3_PCS_RXEQTRAINING_RUN_TIME, 0x13),
 };
 
-static const struct qmp_phy_init_tbl sm8150_usb3_serdes_tbl[] = {
-	QMP_PHY_INIT_CFG(QSERDES_V4_COM_SSC_EN_CENTER, 0x01),
-	QMP_PHY_INIT_CFG(QSERDES_V4_COM_SSC_PER1, 0x31),
-	QMP_PHY_INIT_CFG(QSERDES_V4_COM_SSC_PER2, 0x01),
-	QMP_PHY_INIT_CFG(QSERDES_V4_COM_SSC_STEP_SIZE1_MODE0, 0xde),
-	QMP_PHY_INIT_CFG(QSERDES_V4_COM_SSC_STEP_SIZE2_MODE0, 0x07),
-	QMP_PHY_INIT_CFG(QSERDES_V4_COM_SSC_STEP_SIZE1_MODE1, 0xde),
-	QMP_PHY_INIT_CFG(QSERDES_V4_COM_SSC_STEP_SIZE2_MODE1, 0x07),
-	QMP_PHY_INIT_CFG(QSERDES_V4_COM_SYSCLK_BUF_ENABLE, 0x0a),
-	QMP_PHY_INIT_CFG(QSERDES_V4_COM_CMN_IPTRIM, 0x20),
-	QMP_PHY_INIT_CFG(QSERDES_V4_COM_CP_CTRL_MODE0, 0x06),
-	QMP_PHY_INIT_CFG(QSERDES_V4_COM_CP_CTRL_MODE1, 0x06),
-	QMP_PHY_INIT_CFG(QSERDES_V4_COM_PLL_RCTRL_MODE0, 0x16),
-	QMP_PHY_INIT_CFG(QSERDES_V4_COM_PLL_RCTRL_MODE1, 0x16),
-	QMP_PHY_INIT_CFG(QSERDES_V4_COM_PLL_CCTRL_MODE0, 0x36),
-	QMP_PHY_INIT_CFG(QSERDES_V4_COM_PLL_CCTRL_MODE1, 0x36),
-	QMP_PHY_INIT_CFG(QSERDES_V4_COM_SYSCLK_EN_SEL, 0x1a),
-	QMP_PHY_INIT_CFG(QSERDES_V4_COM_LOCK_CMP_EN, 0x04),
-	QMP_PHY_INIT_CFG(QSERDES_V4_COM_LOCK_CMP1_MODE0, 0x14),
-	QMP_PHY_INIT_CFG(QSERDES_V4_COM_LOCK_CMP2_MODE0, 0x34),
-	QMP_PHY_INIT_CFG(QSERDES_V4_COM_LOCK_CMP1_MODE1, 0x34),
-	QMP_PHY_INIT_CFG(QSERDES_V4_COM_LOCK_CMP2_MODE1, 0x82),
-	QMP_PHY_INIT_CFG(QSERDES_V4_COM_DEC_START_MODE0, 0x82),
-	QMP_PHY_INIT_CFG(QSERDES_V4_COM_DEC_START_MODE1, 0x82),
-	QMP_PHY_INIT_CFG(QSERDES_V4_COM_DIV_FRAC_START1_MODE0, 0xab),
-	QMP_PHY_INIT_CFG(QSERDES_V4_COM_DIV_FRAC_START2_MODE0, 0xea),
-	QMP_PHY_INIT_CFG(QSERDES_V4_COM_DIV_FRAC_START3_MODE0, 0x02),
-	QMP_PHY_INIT_CFG(QSERDES_V4_COM_VCO_TUNE_MAP, 0x02),
-	QMP_PHY_INIT_CFG(QSERDES_V4_COM_DIV_FRAC_START1_MODE1, 0xab),
-	QMP_PHY_INIT_CFG(QSERDES_V4_COM_DIV_FRAC_START2_MODE1, 0xea),
-	QMP_PHY_INIT_CFG(QSERDES_V4_COM_DIV_FRAC_START3_MODE1, 0x02),
-	QMP_PHY_INIT_CFG(QSERDES_V4_COM_VCO_TUNE1_MODE0, 0x24),
-	QMP_PHY_INIT_CFG(QSERDES_V4_COM_VCO_TUNE1_MODE1, 0x24),
-	QMP_PHY_INIT_CFG(QSERDES_V4_COM_VCO_TUNE2_MODE1, 0x02),
-	QMP_PHY_INIT_CFG(QSERDES_V4_COM_HSCLK_SEL, 0x01),
-	QMP_PHY_INIT_CFG(QSERDES_V4_COM_CORECLK_DIV_MODE1, 0x08),
-	QMP_PHY_INIT_CFG(QSERDES_V4_COM_BIN_VCOCAL_CMP_CODE1_MODE0, 0xca),
-	QMP_PHY_INIT_CFG(QSERDES_V4_COM_BIN_VCOCAL_CMP_CODE2_MODE0, 0x1e),
-	QMP_PHY_INIT_CFG(QSERDES_V4_COM_BIN_VCOCAL_CMP_CODE1_MODE1, 0xca),
-	QMP_PHY_INIT_CFG(QSERDES_V4_COM_BIN_VCOCAL_CMP_CODE2_MODE1, 0x1e),
-	QMP_PHY_INIT_CFG(QSERDES_V4_COM_BIN_VCOCAL_HSCLK_SEL, 0x11),
-};
-
-static const struct qmp_phy_init_tbl sm8150_usb3_tx_tbl[] = {
-	QMP_PHY_INIT_CFG(QSERDES_V4_TX_RES_CODE_LANE_TX, 0x00),
-	QMP_PHY_INIT_CFG(QSERDES_V4_TX_RES_CODE_LANE_RX, 0x00),
-	QMP_PHY_INIT_CFG(QSERDES_V4_TX_LANE_MODE_1, 0xd5),
-	QMP_PHY_INIT_CFG(QSERDES_V4_TX_RCV_DETECT_LVL_2, 0x12),
-	QMP_PHY_INIT_CFG(QSERDES_V4_TX_PI_QEC_CTRL, 0x20),
-};
-
-static const struct qmp_phy_init_tbl sm8150_usb3_rx_tbl[] = {
-	QMP_PHY_INIT_CFG(QSERDES_V4_RX_UCDR_SO_GAIN, 0x05),
-	QMP_PHY_INIT_CFG(QSERDES_V4_RX_UCDR_FASTLOCK_FO_GAIN, 0x2f),
-	QMP_PHY_INIT_CFG(QSERDES_V4_RX_UCDR_SO_SATURATION_AND_ENABLE, 0x7f),
-	QMP_PHY_INIT_CFG(QSERDES_V4_RX_UCDR_FASTLOCK_COUNT_LOW, 0xff),
-	QMP_PHY_INIT_CFG(QSERDES_V4_RX_UCDR_FASTLOCK_COUNT_HIGH, 0x0f),
-	QMP_PHY_INIT_CFG(QSERDES_V4_RX_UCDR_PI_CONTROLS, 0x99),
-	QMP_PHY_INIT_CFG(QSERDES_V4_RX_UCDR_SB2_THRESH1, 0x04),
-	QMP_PHY_INIT_CFG(QSERDES_V4_RX_UCDR_SB2_THRESH2, 0x08),
-	QMP_PHY_INIT_CFG(QSERDES_V4_RX_UCDR_SB2_GAIN1, 0x05),
-	QMP_PHY_INIT_CFG(QSERDES_V4_RX_UCDR_SB2_GAIN2, 0x05),
-	QMP_PHY_INIT_CFG(QSERDES_V4_RX_VGA_CAL_CNTRL1, 0x54),
-	QMP_PHY_INIT_CFG(QSERDES_V4_RX_VGA_CAL_CNTRL2, 0x0e),
-	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_EQU_ADAPTOR_CNTRL2, 0x0f),
-	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_EQU_ADAPTOR_CNTRL3, 0x4a),
-	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_EQU_ADAPTOR_CNTRL4, 0x0a),
-	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_IDAC_TSETTLE_LOW, 0xc0),
-	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_IDAC_TSETTLE_HIGH, 0x00),
-	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_EQ_OFFSET_ADAPTOR_CNTRL1, 0x77),
-	QMP_PHY_INIT_CFG(QSERDES_V4_RX_SIGDET_CNTRL, 0x04),
-	QMP_PHY_INIT_CFG(QSERDES_V4_RX_SIGDET_DEGLITCH_CNTRL, 0x0e),
-	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_MODE_00_LOW, 0xbf),
-	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_MODE_00_HIGH, 0xbf),
-	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_MODE_00_HIGH2, 0x3f),
-	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_MODE_00_HIGH3, 0x7f),
-	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_MODE_00_HIGH4, 0x94),
-	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_MODE_01_LOW, 0xdc),
-	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_MODE_01_HIGH, 0xdc),
-	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_MODE_01_HIGH2, 0x5c),
-	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_MODE_01_HIGH3, 0x0b),
-	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_MODE_01_HIGH4, 0xb3),
-	QMP_PHY_INIT_CFG(QSERDES_V4_RX_DFE_EN_TIMER, 0x04),
-	QMP_PHY_INIT_CFG(QSERDES_V4_RX_DFE_CTLE_POST_CAL_OFFSET, 0x38),
-	QMP_PHY_INIT_CFG(QSERDES_V4_RX_AUX_DATA_TCOARSE_TFINE, 0xa0),
-	QMP_PHY_INIT_CFG(QSERDES_V4_RX_DCC_CTRL1, 0x0c),
-	QMP_PHY_INIT_CFG(QSERDES_V4_RX_GM_CAL, 0x1f),
-	QMP_PHY_INIT_CFG(QSERDES_V4_RX_VTH_CODE, 0x10),
-};
-
-static const struct qmp_phy_init_tbl sm8150_usb3_pcs_tbl[] = {
-	/* Lock Det settings */
-	QMP_PHY_INIT_CFG(QPHY_V4_PCS_LOCK_DETECT_CONFIG1, 0xd0),
-	QMP_PHY_INIT_CFG(QPHY_V4_PCS_LOCK_DETECT_CONFIG2, 0x07),
-	QMP_PHY_INIT_CFG(QPHY_V4_PCS_LOCK_DETECT_CONFIG6, 0x13),
-
-	QMP_PHY_INIT_CFG(QPHY_V4_PCS_REFGEN_REQ_CONFIG1, 0x21),
-	QMP_PHY_INIT_CFG(QPHY_V4_PCS_RX_SIGDET_LVL, 0xaa),
-	QMP_PHY_INIT_CFG(QPHY_V4_PCS_CDR_RESET_TIME, 0x0a),
-	QMP_PHY_INIT_CFG(QPHY_V4_PCS_ALIGN_DETECT_CONFIG1, 0x88),
-	QMP_PHY_INIT_CFG(QPHY_V4_PCS_ALIGN_DETECT_CONFIG2, 0x13),
-	QMP_PHY_INIT_CFG(QPHY_V4_PCS_PCS_TX_RX_CONFIG, 0x0c),
-	QMP_PHY_INIT_CFG(QPHY_V4_PCS_EQ_CONFIG1, 0x4b),
-	QMP_PHY_INIT_CFG(QPHY_V4_PCS_EQ_CONFIG5, 0x10),
-};
-
-static const struct qmp_phy_init_tbl sm8150_usb3_pcs_usb_tbl[] = {
-	QMP_PHY_INIT_CFG(QPHY_V4_PCS_USB3_LFPS_DET_HIGH_COUNT_VAL, 0xf8),
-	QMP_PHY_INIT_CFG(QPHY_V4_PCS_USB3_RXEQTRAINING_DFE_TIME_S2, 0x07),
-};
-
 static const struct qmp_phy_init_tbl sm8150_usb3_uniphy_serdes_tbl[] = {
 	QMP_PHY_INIT_CFG(QSERDES_V4_COM_SYSCLK_EN_SEL, 0x1a),
 	QMP_PHY_INIT_CFG(QSERDES_V4_COM_BIN_VCOCAL_HSCLK_SEL, 0x11),
@@ -833,78 +616,6 @@ static const struct qmp_phy_init_tbl sm8150_usb3_uniphy_pcs_usb_tbl[] = {
 	QMP_PHY_INIT_CFG(QPHY_V4_PCS_USB3_RXEQTRAINING_DFE_TIME_S2, 0x07),
 };
 
-static const struct qmp_phy_init_tbl sm8250_usb3_tx_tbl[] = {
-	QMP_PHY_INIT_CFG(QSERDES_V4_TX_RES_CODE_LANE_TX, 0x60),
-	QMP_PHY_INIT_CFG(QSERDES_V4_TX_RES_CODE_LANE_RX, 0x60),
-	QMP_PHY_INIT_CFG(QSERDES_V4_TX_RES_CODE_LANE_OFFSET_TX, 0x11),
-	QMP_PHY_INIT_CFG(QSERDES_V4_TX_RES_CODE_LANE_OFFSET_RX, 0x02),
-	QMP_PHY_INIT_CFG(QSERDES_V4_TX_LANE_MODE_1, 0xd5),
-	QMP_PHY_INIT_CFG(QSERDES_V4_TX_RCV_DETECT_LVL_2, 0x12),
-	QMP_PHY_INIT_CFG_LANE(QSERDES_V4_TX_PI_QEC_CTRL, 0x40, 1),
-	QMP_PHY_INIT_CFG_LANE(QSERDES_V4_TX_PI_QEC_CTRL, 0x54, 2),
-};
-
-static const struct qmp_phy_init_tbl sm8250_usb3_rx_tbl[] = {
-	QMP_PHY_INIT_CFG(QSERDES_V4_RX_UCDR_SO_GAIN, 0x06),
-	QMP_PHY_INIT_CFG(QSERDES_V4_RX_UCDR_FASTLOCK_FO_GAIN, 0x2f),
-	QMP_PHY_INIT_CFG(QSERDES_V4_RX_UCDR_SO_SATURATION_AND_ENABLE, 0x7f),
-	QMP_PHY_INIT_CFG(QSERDES_V4_RX_UCDR_FASTLOCK_COUNT_LOW, 0xff),
-	QMP_PHY_INIT_CFG(QSERDES_V4_RX_UCDR_FASTLOCK_COUNT_HIGH, 0x0f),
-	QMP_PHY_INIT_CFG(QSERDES_V4_RX_UCDR_PI_CONTROLS, 0x99),
-	QMP_PHY_INIT_CFG(QSERDES_V4_RX_UCDR_SB2_THRESH1, 0x04),
-	QMP_PHY_INIT_CFG(QSERDES_V4_RX_UCDR_SB2_THRESH2, 0x08),
-	QMP_PHY_INIT_CFG(QSERDES_V4_RX_UCDR_SB2_GAIN1, 0x05),
-	QMP_PHY_INIT_CFG(QSERDES_V4_RX_UCDR_SB2_GAIN2, 0x05),
-	QMP_PHY_INIT_CFG(QSERDES_V4_RX_VGA_CAL_CNTRL1, 0x54),
-	QMP_PHY_INIT_CFG(QSERDES_V4_RX_VGA_CAL_CNTRL2, 0x0c),
-	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_EQU_ADAPTOR_CNTRL2, 0x0f),
-	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_EQU_ADAPTOR_CNTRL3, 0x4a),
-	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_EQU_ADAPTOR_CNTRL4, 0x0a),
-	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_IDAC_TSETTLE_LOW, 0xc0),
-	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_IDAC_TSETTLE_HIGH, 0x00),
-	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_EQ_OFFSET_ADAPTOR_CNTRL1, 0x77),
-	QMP_PHY_INIT_CFG(QSERDES_V4_RX_SIGDET_CNTRL, 0x04),
-	QMP_PHY_INIT_CFG(QSERDES_V4_RX_SIGDET_DEGLITCH_CNTRL, 0x0e),
-	QMP_PHY_INIT_CFG_LANE(QSERDES_V4_RX_RX_MODE_00_LOW, 0xff, 1),
-	QMP_PHY_INIT_CFG_LANE(QSERDES_V4_RX_RX_MODE_00_LOW, 0x7f, 2),
-	QMP_PHY_INIT_CFG_LANE(QSERDES_V4_RX_RX_MODE_00_HIGH, 0x7f, 1),
-	QMP_PHY_INIT_CFG_LANE(QSERDES_V4_RX_RX_MODE_00_HIGH, 0xff, 2),
-	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_MODE_00_HIGH2, 0x7f),
-	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_MODE_00_HIGH3, 0x7f),
-	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_MODE_00_HIGH4, 0x97),
-	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_MODE_01_LOW, 0xdc),
-	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_MODE_01_HIGH, 0xdc),
-	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_MODE_01_HIGH2, 0x5c),
-	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_MODE_01_HIGH3, 0x7b),
-	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_MODE_01_HIGH4, 0xb4),
-	QMP_PHY_INIT_CFG(QSERDES_V4_RX_DFE_EN_TIMER, 0x04),
-	QMP_PHY_INIT_CFG(QSERDES_V4_RX_DFE_CTLE_POST_CAL_OFFSET, 0x38),
-	QMP_PHY_INIT_CFG(QSERDES_V4_RX_AUX_DATA_TCOARSE_TFINE, 0xa0),
-	QMP_PHY_INIT_CFG(QSERDES_V4_RX_DCC_CTRL1, 0x0c),
-	QMP_PHY_INIT_CFG(QSERDES_V4_RX_GM_CAL, 0x1f),
-	QMP_PHY_INIT_CFG(QSERDES_V4_RX_VTH_CODE, 0x10),
-};
-
-static const struct qmp_phy_init_tbl sm8250_usb3_pcs_tbl[] = {
-	QMP_PHY_INIT_CFG(QPHY_V4_PCS_LOCK_DETECT_CONFIG1, 0xd0),
-	QMP_PHY_INIT_CFG(QPHY_V4_PCS_LOCK_DETECT_CONFIG2, 0x07),
-	QMP_PHY_INIT_CFG(QPHY_V4_PCS_LOCK_DETECT_CONFIG3, 0x20),
-	QMP_PHY_INIT_CFG(QPHY_V4_PCS_LOCK_DETECT_CONFIG6, 0x13),
-	QMP_PHY_INIT_CFG(QPHY_V4_PCS_REFGEN_REQ_CONFIG1, 0x21),
-	QMP_PHY_INIT_CFG(QPHY_V4_PCS_RX_SIGDET_LVL, 0xa9),
-	QMP_PHY_INIT_CFG(QPHY_V4_PCS_CDR_RESET_TIME, 0x0a),
-	QMP_PHY_INIT_CFG(QPHY_V4_PCS_ALIGN_DETECT_CONFIG1, 0x88),
-	QMP_PHY_INIT_CFG(QPHY_V4_PCS_ALIGN_DETECT_CONFIG2, 0x13),
-	QMP_PHY_INIT_CFG(QPHY_V4_PCS_PCS_TX_RX_CONFIG, 0x0c),
-	QMP_PHY_INIT_CFG(QPHY_V4_PCS_EQ_CONFIG1, 0x4b),
-	QMP_PHY_INIT_CFG(QPHY_V4_PCS_EQ_CONFIG5, 0x10),
-};
-
-static const struct qmp_phy_init_tbl sm8250_usb3_pcs_usb_tbl[] = {
-	QMP_PHY_INIT_CFG(QPHY_V4_PCS_USB3_LFPS_DET_HIGH_COUNT_VAL, 0xf8),
-	QMP_PHY_INIT_CFG(QPHY_V4_PCS_USB3_RXEQTRAINING_DFE_TIME_S2, 0x07),
-};
-
 static const struct qmp_phy_init_tbl sm8250_usb3_uniphy_tx_tbl[] = {
 	QMP_PHY_INIT_CFG(QSERDES_V4_TX_RCV_DETECT_LVL_2, 0x12),
 	QMP_PHY_INIT_CFG(QSERDES_V4_TX_LANE_MODE_1, 0xd5),
@@ -1066,84 +777,6 @@ static const struct qmp_phy_init_tbl sdx65_usb3_uniphy_rx_tbl[] = {
 	QMP_PHY_INIT_CFG(QSERDES_V5_RX_SIGDET_ENABLES, 0x00),
 };
 
-static const struct qmp_phy_init_tbl sm8350_usb3_tx_tbl[] = {
-	QMP_PHY_INIT_CFG(QSERDES_V5_TX_RES_CODE_LANE_TX, 0x00),
-	QMP_PHY_INIT_CFG(QSERDES_V5_TX_RES_CODE_LANE_RX, 0x00),
-	QMP_PHY_INIT_CFG(QSERDES_V5_TX_RES_CODE_LANE_OFFSET_TX, 0x16),
-	QMP_PHY_INIT_CFG(QSERDES_V5_TX_RES_CODE_LANE_OFFSET_RX, 0x0e),
-	QMP_PHY_INIT_CFG(QSERDES_V5_TX_LANE_MODE_1, 0x35),
-	QMP_PHY_INIT_CFG(QSERDES_V5_TX_LANE_MODE_3, 0x3f),
-	QMP_PHY_INIT_CFG(QSERDES_V5_TX_LANE_MODE_4, 0x7f),
-	QMP_PHY_INIT_CFG(QSERDES_V5_TX_LANE_MODE_5, 0x3f),
-	QMP_PHY_INIT_CFG(QSERDES_V5_TX_RCV_DETECT_LVL_2, 0x12),
-	QMP_PHY_INIT_CFG(QSERDES_V5_TX_PI_QEC_CTRL, 0x21),
-};
-
-static const struct qmp_phy_init_tbl sm8350_usb3_rx_tbl[] = {
-	QMP_PHY_INIT_CFG(QSERDES_V5_RX_UCDR_FO_GAIN, 0x0a),
-	QMP_PHY_INIT_CFG(QSERDES_V5_RX_UCDR_SO_GAIN, 0x05),
-	QMP_PHY_INIT_CFG(QSERDES_V5_RX_UCDR_FASTLOCK_FO_GAIN, 0x2f),
-	QMP_PHY_INIT_CFG(QSERDES_V5_RX_UCDR_SO_SATURATION_AND_ENABLE, 0x7f),
-	QMP_PHY_INIT_CFG(QSERDES_V5_RX_UCDR_FASTLOCK_COUNT_LOW, 0xff),
-	QMP_PHY_INIT_CFG(QSERDES_V5_RX_UCDR_FASTLOCK_COUNT_HIGH, 0x0f),
-	QMP_PHY_INIT_CFG(QSERDES_V5_RX_UCDR_PI_CONTROLS, 0x99),
-	QMP_PHY_INIT_CFG(QSERDES_V5_RX_UCDR_SB2_THRESH1, 0x08),
-	QMP_PHY_INIT_CFG(QSERDES_V5_RX_UCDR_SB2_THRESH2, 0x08),
-	QMP_PHY_INIT_CFG(QSERDES_V5_RX_UCDR_SB2_GAIN1, 0x00),
-	QMP_PHY_INIT_CFG(QSERDES_V5_RX_UCDR_SB2_GAIN2, 0x04),
-	QMP_PHY_INIT_CFG(QSERDES_V5_RX_VGA_CAL_CNTRL1, 0x54),
-	QMP_PHY_INIT_CFG(QSERDES_V5_RX_VGA_CAL_CNTRL2, 0x0f),
-	QMP_PHY_INIT_CFG(QSERDES_V5_RX_RX_EQU_ADAPTOR_CNTRL2, 0x0f),
-	QMP_PHY_INIT_CFG(QSERDES_V5_RX_RX_EQU_ADAPTOR_CNTRL3, 0x4a),
-	QMP_PHY_INIT_CFG(QSERDES_V5_RX_RX_EQU_ADAPTOR_CNTRL4, 0x0a),
-	QMP_PHY_INIT_CFG(QSERDES_V5_RX_RX_IDAC_TSETTLE_LOW, 0xc0),
-	QMP_PHY_INIT_CFG(QSERDES_V5_RX_RX_IDAC_TSETTLE_HIGH, 0x00),
-	QMP_PHY_INIT_CFG(QSERDES_V5_RX_RX_EQ_OFFSET_ADAPTOR_CNTRL1, 0x47),
-	QMP_PHY_INIT_CFG(QSERDES_V5_RX_SIGDET_CNTRL, 0x04),
-	QMP_PHY_INIT_CFG(QSERDES_V5_RX_SIGDET_DEGLITCH_CNTRL, 0x0e),
-	QMP_PHY_INIT_CFG(QSERDES_V5_RX_RX_MODE_00_LOW, 0xbb),
-	QMP_PHY_INIT_CFG(QSERDES_V5_RX_RX_MODE_00_HIGH, 0x7b),
-	QMP_PHY_INIT_CFG(QSERDES_V5_RX_RX_MODE_00_HIGH2, 0xbb),
-	QMP_PHY_INIT_CFG_LANE(QSERDES_V5_RX_RX_MODE_00_HIGH3, 0x3d, 1),
-	QMP_PHY_INIT_CFG_LANE(QSERDES_V5_RX_RX_MODE_00_HIGH3, 0x3c, 2),
-	QMP_PHY_INIT_CFG(QSERDES_V5_RX_RX_MODE_00_HIGH4, 0xdb),
-	QMP_PHY_INIT_CFG(QSERDES_V5_RX_RX_MODE_01_LOW, 0x64),
-	QMP_PHY_INIT_CFG(QSERDES_V5_RX_RX_MODE_01_HIGH, 0x24),
-	QMP_PHY_INIT_CFG(QSERDES_V5_RX_RX_MODE_01_HIGH2, 0xd2),
-	QMP_PHY_INIT_CFG(QSERDES_V5_RX_RX_MODE_01_HIGH3, 0x13),
-	QMP_PHY_INIT_CFG(QSERDES_V5_RX_RX_MODE_01_HIGH4, 0xa9),
-	QMP_PHY_INIT_CFG(QSERDES_V5_RX_DFE_EN_TIMER, 0x04),
-	QMP_PHY_INIT_CFG(QSERDES_V5_RX_DFE_CTLE_POST_CAL_OFFSET, 0x38),
-	QMP_PHY_INIT_CFG(QSERDES_V5_RX_AUX_DATA_TCOARSE_TFINE, 0xa0),
-	QMP_PHY_INIT_CFG(QSERDES_V5_RX_DCC_CTRL1, 0x0c),
-	QMP_PHY_INIT_CFG(QSERDES_V5_RX_GM_CAL, 0x00),
-	QMP_PHY_INIT_CFG(QSERDES_V5_RX_VTH_CODE, 0x10),
-};
-
-static const struct qmp_phy_init_tbl sm8350_usb3_pcs_tbl[] = {
-	QMP_PHY_INIT_CFG(QPHY_V4_PCS_RCVR_DTCT_DLY_P1U2_L, 0xe7),
-	QMP_PHY_INIT_CFG(QPHY_V4_PCS_RCVR_DTCT_DLY_P1U2_H, 0x03),
-	QMP_PHY_INIT_CFG(QPHY_V4_PCS_LOCK_DETECT_CONFIG1, 0xd0),
-	QMP_PHY_INIT_CFG(QPHY_V4_PCS_LOCK_DETECT_CONFIG2, 0x07),
-	QMP_PHY_INIT_CFG(QPHY_V4_PCS_LOCK_DETECT_CONFIG3, 0x20),
-	QMP_PHY_INIT_CFG(QPHY_V4_PCS_LOCK_DETECT_CONFIG6, 0x13),
-	QMP_PHY_INIT_CFG(QPHY_V4_PCS_REFGEN_REQ_CONFIG1, 0x21),
-	QMP_PHY_INIT_CFG(QPHY_V4_PCS_RX_SIGDET_LVL, 0xaa),
-	QMP_PHY_INIT_CFG(QPHY_V4_PCS_CDR_RESET_TIME, 0x0a),
-	QMP_PHY_INIT_CFG(QPHY_V4_PCS_ALIGN_DETECT_CONFIG1, 0x88),
-	QMP_PHY_INIT_CFG(QPHY_V4_PCS_ALIGN_DETECT_CONFIG2, 0x13),
-	QMP_PHY_INIT_CFG(QPHY_V4_PCS_PCS_TX_RX_CONFIG, 0x0c),
-	QMP_PHY_INIT_CFG(QPHY_V4_PCS_EQ_CONFIG1, 0x4b),
-	QMP_PHY_INIT_CFG(QPHY_V4_PCS_EQ_CONFIG5, 0x10),
-};
-
-static const struct qmp_phy_init_tbl sm8350_usb3_pcs_usb_tbl[] = {
-	QMP_PHY_INIT_CFG(QPHY_V5_PCS_USB3_RCVR_DTCT_DLY_U3_L, 0x40),
-	QMP_PHY_INIT_CFG(QPHY_V5_PCS_USB3_RCVR_DTCT_DLY_U3_H, 0x00),
-	QMP_PHY_INIT_CFG(QPHY_V5_PCS_USB3_LFPS_DET_HIGH_COUNT_VAL, 0xf8),
-	QMP_PHY_INIT_CFG(QPHY_V5_PCS_USB3_RXEQTRAINING_DFE_TIME_S2, 0x07),
-};
-
 static const struct qmp_phy_init_tbl sm8350_usb3_uniphy_tx_tbl[] = {
 	QMP_PHY_INIT_CFG(QSERDES_V5_TX_LANE_MODE_1, 0xa5),
 	QMP_PHY_INIT_CFG(QSERDES_V5_TX_LANE_MODE_2, 0x82),
@@ -1450,9 +1083,6 @@ struct qmp_phy_cfg {
 	/* true, if PHY needs delay after POWER_DOWN */
 	bool has_pwrdn_delay;
 
-	/* true, if PHY has a separate DP_COM control block */
-	bool has_phy_dp_com_ctrl;
-
 	/* Offset from PCS to PCS_USB region */
 	unsigned int pcs_usb_offset;
 };
@@ -1471,8 +1101,6 @@ struct qmp_usb {
 	void __iomem *tx2;
 	void __iomem *rx2;
 
-	void __iomem *dp_com;
-
 	struct clk *pipe_clk;
 	struct clk_bulk_data *clks;
 	struct reset_control_bulk_data *resets;
@@ -1526,11 +1154,6 @@ static const char * const qmp_v4_ref_phy_clk_l[] = {
 	"aux", "ref_clk_src", "ref", "com_aux",
 };
 
-/* the primary usb3 phy on sm8250 doesn't have a ref clock */
-static const char * const qmp_v4_sm8250_usbphy_clk_l[] = {
-	"aux", "ref_clk_src", "com_aux"
-};
-
 /* usb3 phy on sdx55 doesn't have com_aux clock */
 static const char * const qmp_v4_sdx55_usbphy_clk_l[] = {
 	"aux", "cfg_ahb", "ref"
@@ -1545,10 +1168,6 @@ static const char * const msm8996_usb3phy_reset_l[] = {
 	"phy", "common",
 };
 
-static const char * const sc7180_usb3phy_reset_l[] = {
-	"phy",
-};
-
 static const char * const qcm2290_usb3phy_reset_l[] = {
 	"phy_phy", "phy",
 };
@@ -1606,52 +1225,6 @@ static const struct qmp_phy_cfg msm8996_usb3phy_cfg = {
 	.regs			= qmp_v2_usb3phy_regs_layout,
 };
 
-static const struct qmp_phy_cfg qmp_v3_usb3phy_cfg = {
-	.lanes			= 2,
-
-	.serdes_tbl		= qmp_v3_usb3_serdes_tbl,
-	.serdes_tbl_num		= ARRAY_SIZE(qmp_v3_usb3_serdes_tbl),
-	.tx_tbl			= qmp_v3_usb3_tx_tbl,
-	.tx_tbl_num		= ARRAY_SIZE(qmp_v3_usb3_tx_tbl),
-	.rx_tbl			= qmp_v3_usb3_rx_tbl,
-	.rx_tbl_num		= ARRAY_SIZE(qmp_v3_usb3_rx_tbl),
-	.pcs_tbl		= qmp_v3_usb3_pcs_tbl,
-	.pcs_tbl_num		= ARRAY_SIZE(qmp_v3_usb3_pcs_tbl),
-	.clk_list		= qmp_v3_phy_clk_l,
-	.num_clks		= ARRAY_SIZE(qmp_v3_phy_clk_l),
-	.reset_list		= msm8996_usb3phy_reset_l,
-	.num_resets		= ARRAY_SIZE(msm8996_usb3phy_reset_l),
-	.vreg_list		= qmp_phy_vreg_l,
-	.num_vregs		= ARRAY_SIZE(qmp_phy_vreg_l),
-	.regs			= qmp_v3_usb3phy_regs_layout,
-
-	.has_pwrdn_delay	= true,
-	.has_phy_dp_com_ctrl	= true,
-};
-
-static const struct qmp_phy_cfg sc7180_usb3phy_cfg = {
-	.lanes			= 2,
-
-	.serdes_tbl		= qmp_v3_usb3_serdes_tbl,
-	.serdes_tbl_num		= ARRAY_SIZE(qmp_v3_usb3_serdes_tbl),
-	.tx_tbl			= qmp_v3_usb3_tx_tbl,
-	.tx_tbl_num		= ARRAY_SIZE(qmp_v3_usb3_tx_tbl),
-	.rx_tbl			= qmp_v3_usb3_rx_tbl,
-	.rx_tbl_num		= ARRAY_SIZE(qmp_v3_usb3_rx_tbl),
-	.pcs_tbl		= qmp_v3_usb3_pcs_tbl,
-	.pcs_tbl_num		= ARRAY_SIZE(qmp_v3_usb3_pcs_tbl),
-	.clk_list		= qmp_v3_phy_clk_l,
-	.num_clks		= ARRAY_SIZE(qmp_v3_phy_clk_l),
-	.reset_list		= sc7180_usb3phy_reset_l,
-	.num_resets		= ARRAY_SIZE(sc7180_usb3phy_reset_l),
-	.vreg_list		= qmp_phy_vreg_l,
-	.num_vregs		= ARRAY_SIZE(qmp_phy_vreg_l),
-	.regs			= qmp_v3_usb3phy_regs_layout,
-
-	.has_pwrdn_delay	= true,
-	.has_phy_dp_com_ctrl	= true,
-};
-
 static const struct qmp_phy_cfg sc8280xp_usb3_uniphy_cfg = {
 	.lanes			= 1,
 
@@ -1716,32 +1289,6 @@ static const struct qmp_phy_cfg msm8998_usb3phy_cfg = {
 	.regs                   = qmp_v3_usb3phy_regs_layout,
 };
 
-static const struct qmp_phy_cfg sm8150_usb3phy_cfg = {
-	.lanes			= 2,
-
-	.serdes_tbl		= sm8150_usb3_serdes_tbl,
-	.serdes_tbl_num		= ARRAY_SIZE(sm8150_usb3_serdes_tbl),
-	.tx_tbl			= sm8150_usb3_tx_tbl,
-	.tx_tbl_num		= ARRAY_SIZE(sm8150_usb3_tx_tbl),
-	.rx_tbl			= sm8150_usb3_rx_tbl,
-	.rx_tbl_num		= ARRAY_SIZE(sm8150_usb3_rx_tbl),
-	.pcs_tbl		= sm8150_usb3_pcs_tbl,
-	.pcs_tbl_num		= ARRAY_SIZE(sm8150_usb3_pcs_tbl),
-	.pcs_usb_tbl		= sm8150_usb3_pcs_usb_tbl,
-	.pcs_usb_tbl_num	= ARRAY_SIZE(sm8150_usb3_pcs_usb_tbl),
-	.clk_list		= qmp_v4_ref_phy_clk_l,
-	.num_clks		= ARRAY_SIZE(qmp_v4_ref_phy_clk_l),
-	.reset_list		= msm8996_usb3phy_reset_l,
-	.num_resets		= ARRAY_SIZE(msm8996_usb3phy_reset_l),
-	.vreg_list		= qmp_phy_vreg_l,
-	.num_vregs		= ARRAY_SIZE(qmp_phy_vreg_l),
-	.regs			= qmp_v4_usb3phy_regs_layout,
-	.pcs_usb_offset		= 0x300,
-
-	.has_pwrdn_delay	= true,
-	.has_phy_dp_com_ctrl	= true,
-};
-
 static const struct qmp_phy_cfg sm8150_usb3_uniphy_cfg = {
 	.lanes			= 1,
 
@@ -1767,32 +1314,6 @@ static const struct qmp_phy_cfg sm8150_usb3_uniphy_cfg = {
 	.has_pwrdn_delay	= true,
 };
 
-static const struct qmp_phy_cfg sm8250_usb3phy_cfg = {
-	.lanes			= 2,
-
-	.serdes_tbl		= sm8150_usb3_serdes_tbl,
-	.serdes_tbl_num		= ARRAY_SIZE(sm8150_usb3_serdes_tbl),
-	.tx_tbl			= sm8250_usb3_tx_tbl,
-	.tx_tbl_num		= ARRAY_SIZE(sm8250_usb3_tx_tbl),
-	.rx_tbl			= sm8250_usb3_rx_tbl,
-	.rx_tbl_num		= ARRAY_SIZE(sm8250_usb3_rx_tbl),
-	.pcs_tbl		= sm8250_usb3_pcs_tbl,
-	.pcs_tbl_num		= ARRAY_SIZE(sm8250_usb3_pcs_tbl),
-	.pcs_usb_tbl		= sm8250_usb3_pcs_usb_tbl,
-	.pcs_usb_tbl_num	= ARRAY_SIZE(sm8250_usb3_pcs_usb_tbl),
-	.clk_list		= qmp_v4_sm8250_usbphy_clk_l,
-	.num_clks		= ARRAY_SIZE(qmp_v4_sm8250_usbphy_clk_l),
-	.reset_list		= msm8996_usb3phy_reset_l,
-	.num_resets		= ARRAY_SIZE(msm8996_usb3phy_reset_l),
-	.vreg_list		= qmp_phy_vreg_l,
-	.num_vregs		= ARRAY_SIZE(qmp_phy_vreg_l),
-	.regs			= qmp_v4_usb3phy_regs_layout,
-	.pcs_usb_offset		= 0x300,
-
-	.has_pwrdn_delay	= true,
-	.has_phy_dp_com_ctrl	= true,
-};
-
 static const struct qmp_phy_cfg sm8250_usb3_uniphy_cfg = {
 	.lanes			= 1,
 
@@ -1868,32 +1389,6 @@ static const struct qmp_phy_cfg sdx65_usb3_uniphy_cfg = {
 	.has_pwrdn_delay	= true,
 };
 
-static const struct qmp_phy_cfg sm8350_usb3phy_cfg = {
-	.lanes			= 2,
-
-	.serdes_tbl		= sm8150_usb3_serdes_tbl,
-	.serdes_tbl_num		= ARRAY_SIZE(sm8150_usb3_serdes_tbl),
-	.tx_tbl			= sm8350_usb3_tx_tbl,
-	.tx_tbl_num		= ARRAY_SIZE(sm8350_usb3_tx_tbl),
-	.rx_tbl			= sm8350_usb3_rx_tbl,
-	.rx_tbl_num		= ARRAY_SIZE(sm8350_usb3_rx_tbl),
-	.pcs_tbl		= sm8350_usb3_pcs_tbl,
-	.pcs_tbl_num		= ARRAY_SIZE(sm8350_usb3_pcs_tbl),
-	.pcs_usb_tbl		= sm8350_usb3_pcs_usb_tbl,
-	.pcs_usb_tbl_num	= ARRAY_SIZE(sm8350_usb3_pcs_usb_tbl),
-	.clk_list		= qmp_v4_sm8250_usbphy_clk_l,
-	.num_clks		= ARRAY_SIZE(qmp_v4_sm8250_usbphy_clk_l),
-	.reset_list		= msm8996_usb3phy_reset_l,
-	.num_resets		= ARRAY_SIZE(msm8996_usb3phy_reset_l),
-	.vreg_list		= qmp_phy_vreg_l,
-	.num_vregs		= ARRAY_SIZE(qmp_phy_vreg_l),
-	.regs			= qmp_v5_usb3phy_regs_layout,
-	.pcs_usb_offset		= 0x300,
-
-	.has_pwrdn_delay	= true,
-	.has_phy_dp_com_ctrl	= true,
-};
-
 static const struct qmp_phy_cfg sm8350_usb3_uniphy_cfg = {
 	.lanes			= 1,
 
@@ -1982,7 +1477,6 @@ static int qmp_usb_init(struct phy *phy)
 	struct qmp_usb *qmp = phy_get_drvdata(phy);
 	const struct qmp_phy_cfg *cfg = qmp->cfg;
 	void __iomem *pcs = qmp->pcs;
-	void __iomem *dp_com = qmp->dp_com;
 	int ret;
 
 	ret = regulator_bulk_enable(cfg->num_vregs, qmp->vregs);
@@ -2007,29 +1501,6 @@ static int qmp_usb_init(struct phy *phy)
 	if (ret)
 		goto err_assert_reset;
 
-	if (cfg->has_phy_dp_com_ctrl) {
-		qphy_setbits(dp_com, QPHY_V3_DP_COM_POWER_DOWN_CTRL,
-			     SW_PWRDN);
-		/* override hardware control for reset of qmp phy */
-		qphy_setbits(dp_com, QPHY_V3_DP_COM_RESET_OVRD_CTRL,
-			     SW_DPPHY_RESET_MUX | SW_DPPHY_RESET |
-			     SW_USB3PHY_RESET_MUX | SW_USB3PHY_RESET);
-
-		/* Default type-c orientation, i.e CC1 */
-		qphy_setbits(dp_com, QPHY_V3_DP_COM_TYPEC_CTRL, 0x02);
-
-		qphy_setbits(dp_com, QPHY_V3_DP_COM_PHY_MODE_CTRL,
-			     USB3_MODE | DP_MODE);
-
-		/* bring both QMP USB and QMP DP PHYs PCS block out of reset */
-		qphy_clrbits(dp_com, QPHY_V3_DP_COM_RESET_OVRD_CTRL,
-			     SW_DPPHY_RESET_MUX | SW_DPPHY_RESET |
-			     SW_USB3PHY_RESET_MUX | SW_USB3PHY_RESET);
-
-		qphy_clrbits(dp_com, QPHY_V3_DP_COM_SWI_CTRL, 0x03);
-		qphy_clrbits(dp_com, QPHY_V3_DP_COM_SW_RESET, SW_RESET);
-	}
-
 	qphy_setbits(pcs, cfg->regs[QPHY_PCS_POWER_DOWN_CONTROL], SW_PWRDN);
 
 	return 0;
@@ -2412,12 +1883,6 @@ static int qmp_usb_parse_dt_legacy(struct qmp_usb *qmp, struct device_node *np)
 	if (IS_ERR(qmp->serdes))
 		return PTR_ERR(qmp->serdes);
 
-	if (cfg->has_phy_dp_com_ctrl) {
-		qmp->dp_com = devm_platform_ioremap_resource(pdev, 1);
-		if (IS_ERR(qmp->dp_com))
-			return PTR_ERR(qmp->dp_com);
-	}
-
 	/*
 	 * FIXME: These bindings should be fixed to not rely on overlapping
 	 *        mappings for PCS.
@@ -2597,18 +2062,9 @@ static const struct of_device_id qmp_usb_of_match_table[] = {
 	}, {
 		.compatible = "qcom,qcm2290-qmp-usb3-phy",
 		.data = &qcm2290_usb3phy_cfg,
-	}, {
-		.compatible = "qcom,sc7180-qmp-usb3-phy",
-		.data = &sc7180_usb3phy_cfg,
-	}, {
-		.compatible = "qcom,sc8180x-qmp-usb3-phy",
-		.data = &sm8150_usb3phy_cfg,
 	}, {
 		.compatible = "qcom,sc8280xp-qmp-usb3-uni-phy",
 		.data = &sc8280xp_usb3_uniphy_cfg,
-	}, {
-		.compatible = "qcom,sdm845-qmp-usb3-phy",
-		.data = &qmp_v3_usb3phy_cfg,
 	}, {
 		.compatible = "qcom,sdm845-qmp-usb3-uni-phy",
 		.data = &qmp_v3_usb3_uniphy_cfg,
@@ -2621,27 +2077,15 @@ static const struct of_device_id qmp_usb_of_match_table[] = {
 	}, {
 		.compatible = "qcom,sm6115-qmp-usb3-phy",
 		.data = &qcm2290_usb3phy_cfg,
-	}, {
-		.compatible = "qcom,sm8150-qmp-usb3-phy",
-		.data = &sm8150_usb3phy_cfg,
 	}, {
 		.compatible = "qcom,sm8150-qmp-usb3-uni-phy",
 		.data = &sm8150_usb3_uniphy_cfg,
-	}, {
-		.compatible = "qcom,sm8250-qmp-usb3-phy",
-		.data = &sm8250_usb3phy_cfg,
 	}, {
 		.compatible = "qcom,sm8250-qmp-usb3-uni-phy",
 		.data = &sm8250_usb3_uniphy_cfg,
-	}, {
-		.compatible = "qcom,sm8350-qmp-usb3-phy",
-		.data = &sm8350_usb3phy_cfg,
 	}, {
 		.compatible = "qcom,sm8350-qmp-usb3-uni-phy",
 		.data = &sm8350_usb3_uniphy_cfg,
-	}, {
-		.compatible = "qcom,sm8450-qmp-usb3-phy",
-		.data = &sm8350_usb3phy_cfg,
 	},
 	{ },
 };
-- 
2.30.2

