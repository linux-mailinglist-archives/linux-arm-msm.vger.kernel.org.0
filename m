Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D2D60528378
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 May 2022 13:45:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235818AbiEPLpj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 16 May 2022 07:45:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57654 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236353AbiEPLpg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 16 May 2022 07:45:36 -0400
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7263AE085
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 May 2022 04:45:32 -0700 (PDT)
Received: by mail-lj1-x232.google.com with SMTP id m23so17806828ljc.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 May 2022 04:45:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=TVO8WYfl6zqG92zF+4nnUlvC08zTkHbrDtlMd6kOcMA=;
        b=VI3T7uPCAcndv6KHxGZbjodyA+pxWZbaXU+0rpsMAGEvqKppZ2Bp1dQOlB5vx3jfyC
         zfQzwo/fXB/DtnWPpdiHLilwlNX4KWVk5yaojdLlelN0+03wn5xECD+PJojxjY3mx8Du
         lia2PqhH/2jx9ohRA/JX4gNYFZdVlcQNKdqYbthBmBGe6CZKBh6d5Lr04m6MP7939OT/
         TUX77VQ323kfxQh0/9ysJ1xazEnS+qoqD+kkNF7hqgajFiOyx1949VVcRmhfdeO9cevX
         eUUbksd25AG5pylJLT/+O49GWWVnPMvbRmmJuagRK1G4dkyfxiiuxmp87ba9IEcqO16q
         pw2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=TVO8WYfl6zqG92zF+4nnUlvC08zTkHbrDtlMd6kOcMA=;
        b=ZMZiflVWmWQT0P/P6PYVoIfZghgXNgks7ssK2415rtnBbq8Ee7g2mLVN7p7Oe9j0nO
         KCvUIZnub3tQr8vOUOfv1MAu+Z2J6h66JSWUAyDlGWlfOkLFUzXV9MSdVYaQnScc8nIV
         LHdyXZ+kxlpptr/nrzdYbesYfqJbNvJEua1gRy90QxKcYLRgeG0py5/TOZ/4WVC6u87F
         T/Yg15nTM94nGT1ImUEZKjKEDD2ut1mBE2+w/m05MbqG9V4jRLhoyEgWsHGe46Qut4Sh
         1AaoPjKlbiIRfKzsdC1EECYVi8Nen1EiBhvRW6AlI/3ExqexmZDzeFvasfo5UCGPkMCX
         YDDQ==
X-Gm-Message-State: AOAM5326/UjFIBSbqKPYGmbjXPezq0ypvp7P7CyvaniNDVwrPg/qeTn+
        EBOxR37oUFv0j7DRdHm9xFngOw==
X-Google-Smtp-Source: ABdhPJxxFaCJVr6eSsOtOANSWeIo/+uqDp2J3MxY4Fp/sY+PBAEDo3WKnNX4sA/UXVOO/3NAetz9Fg==
X-Received: by 2002:a2e:9649:0:b0:24f:15e6:a6c5 with SMTP id z9-20020a2e9649000000b0024f15e6a6c5mr10723681ljh.86.1652701530452;
        Mon, 16 May 2022 04:45:30 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id r18-20020ac24d12000000b0047255d2111csm1286079lfi.75.2022.05.16.04.45.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 May 2022 04:45:29 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org
Subject: [RFC PATCH 3/5] phy: qcom-qmp: split UFS PHY support
Date:   Mon, 16 May 2022 14:45:23 +0300
Message-Id: <20220516114525.3596196-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220516114525.3596196-1-dmitry.baryshkov@linaro.org>
References: <20220516114525.3596196-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,UPPERCASE_50_75
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Proceed with splitting the QMP PHY functionality. Move UFS PHY support
to a separate source file.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/phy/qualcomm/Makefile           |   2 +-
 drivers/phy/qualcomm/phy-qcom-qmp-lib.h |   3 +
 drivers/phy/qualcomm/phy-qcom-qmp-ufs.c | 863 ++++++++++++++++++++++++
 drivers/phy/qualcomm/phy-qcom-qmp.c     | 828 ++---------------------
 drivers/phy/qualcomm/phy-qcom-qmp.h     |  43 ++
 5 files changed, 978 insertions(+), 761 deletions(-)
 create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-ufs.c

diff --git a/drivers/phy/qualcomm/Makefile b/drivers/phy/qualcomm/Makefile
index 699550467891..ee2265de537a 100644
--- a/drivers/phy/qualcomm/Makefile
+++ b/drivers/phy/qualcomm/Makefile
@@ -5,7 +5,7 @@ obj-$(CONFIG_PHY_QCOM_EDP)		+= phy-qcom-edp.o
 obj-$(CONFIG_PHY_QCOM_IPQ4019_USB)	+= phy-qcom-ipq4019-usb.o
 obj-$(CONFIG_PHY_QCOM_IPQ806X_SATA)	+= phy-qcom-ipq806x-sata.o
 obj-$(CONFIG_PHY_QCOM_PCIE2)		+= phy-qcom-pcie2.o
-obj-$(CONFIG_PHY_QCOM_QMP)		+= phy-qcom-qmp.o phy-qcom-qmp-combo.o
+obj-$(CONFIG_PHY_QCOM_QMP)		+= phy-qcom-qmp.o phy-qcom-qmp-combo.o phy-qcom-qmp-ufs.o
 obj-$(CONFIG_PHY_QCOM_QUSB2)		+= phy-qcom-qusb2.o
 obj-$(CONFIG_PHY_QCOM_USB_HS) 		+= phy-qcom-usb-hs.o
 obj-$(CONFIG_PHY_QCOM_USB_HSIC) 	+= phy-qcom-usb-hsic.o
diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-lib.h b/drivers/phy/qualcomm/phy-qcom-qmp-lib.h
index 0511c7155a5a..a0c5983b2f43 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-lib.h
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-lib.h
@@ -222,7 +222,10 @@ int qcom_qmp_phy_common_init(struct platform_device *pdev, const struct qmp_phy_
 			     int expected_phys);
 void qcom_qmp_phy_serdes_init(struct qmp_phy *qphy);
 void qcom_qmp_phy_lanes_init(struct phy *phy);
+void qcom_qmp_phy_pcs_init(struct phy *phy);
 int qcom_qmp_phy_com_init(struct qmp_phy *qphy);
+int qcom_qmp_phy_com_power_on(struct qmp_phy *qphy);
+int qcom_qmp_phy_com_power_off(struct qmp_phy *qphy);
 int qcom_qmp_phy_com_exit(struct qmp_phy *qphy);
 
 int qcom_qmp_phy_setup(struct device *dev, struct device_node *np, int id,
diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c b/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
new file mode 100644
index 000000000000..081cdee420e4
--- /dev/null
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
@@ -0,0 +1,863 @@
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
+#include <dt-bindings/phy/phy.h>
+
+#include "phy-qcom-qmp.h"
+#include "phy-qcom-qmp-lib.h"
+
+static const unsigned int msm8996_ufsphy_regs_layout[QPHY_LAYOUT_SIZE] = {
+	[QPHY_START_CTRL]		= 0x00,
+	[QPHY_PCS_READY_STATUS]		= 0x168,
+};
+
+static const unsigned int sdm845_ufsphy_regs_layout[QPHY_LAYOUT_SIZE] = {
+	[QPHY_START_CTRL]		= 0x00,
+	[QPHY_PCS_READY_STATUS]		= 0x160,
+};
+
+static const unsigned int sm6115_ufsphy_regs_layout[QPHY_LAYOUT_SIZE] = {
+	[QPHY_START_CTRL]		= 0x00,
+	[QPHY_PCS_READY_STATUS]		= 0x168,
+};
+
+static const unsigned int sm8150_ufsphy_regs_layout[QPHY_LAYOUT_SIZE] = {
+	[QPHY_START_CTRL]		= QPHY_V4_PCS_UFS_PHY_START,
+	[QPHY_PCS_READY_STATUS]		= QPHY_V4_PCS_UFS_READY_STATUS,
+	[QPHY_SW_RESET]			= QPHY_V4_PCS_UFS_SW_RESET,
+};
+
+static const struct qmp_phy_init_tbl msm8996_ufs_serdes_tbl[] = {
+	QMP_PHY_INIT_CFG(QPHY_POWER_DOWN_CONTROL, 0x01),
+	QMP_PHY_INIT_CFG(QSERDES_COM_CMN_CONFIG, 0x0e),
+	QMP_PHY_INIT_CFG(QSERDES_COM_SYSCLK_EN_SEL, 0xd7),
+	QMP_PHY_INIT_CFG(QSERDES_COM_CLK_SELECT, 0x30),
+	QMP_PHY_INIT_CFG(QSERDES_COM_SYS_CLK_CTRL, 0x06),
+	QMP_PHY_INIT_CFG(QSERDES_COM_BIAS_EN_CLKBUFLR_EN, 0x08),
+	QMP_PHY_INIT_CFG(QSERDES_COM_BG_TIMER, 0x0a),
+	QMP_PHY_INIT_CFG(QSERDES_COM_HSCLK_SEL, 0x05),
+	QMP_PHY_INIT_CFG(QSERDES_COM_CORECLK_DIV, 0x0a),
+	QMP_PHY_INIT_CFG(QSERDES_COM_CORECLK_DIV_MODE1, 0x0a),
+	QMP_PHY_INIT_CFG(QSERDES_COM_LOCK_CMP_EN, 0x01),
+	QMP_PHY_INIT_CFG(QSERDES_COM_VCO_TUNE_CTRL, 0x10),
+	QMP_PHY_INIT_CFG(QSERDES_COM_RESETSM_CNTRL, 0x20),
+	QMP_PHY_INIT_CFG(QSERDES_COM_CORE_CLK_EN, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_COM_LOCK_CMP_CFG, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_COM_VCO_TUNE_TIMER1, 0xff),
+	QMP_PHY_INIT_CFG(QSERDES_COM_VCO_TUNE_TIMER2, 0x3f),
+	QMP_PHY_INIT_CFG(QSERDES_COM_VCO_TUNE_MAP, 0x54),
+	QMP_PHY_INIT_CFG(QSERDES_COM_SVS_MODE_CLK_SEL, 0x05),
+	QMP_PHY_INIT_CFG(QSERDES_COM_DEC_START_MODE0, 0x82),
+	QMP_PHY_INIT_CFG(QSERDES_COM_DIV_FRAC_START1_MODE0, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_COM_DIV_FRAC_START2_MODE0, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_COM_DIV_FRAC_START3_MODE0, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_COM_CP_CTRL_MODE0, 0x0b),
+	QMP_PHY_INIT_CFG(QSERDES_COM_PLL_RCTRL_MODE0, 0x16),
+	QMP_PHY_INIT_CFG(QSERDES_COM_PLL_CCTRL_MODE0, 0x28),
+	QMP_PHY_INIT_CFG(QSERDES_COM_INTEGLOOP_GAIN0_MODE0, 0x80),
+	QMP_PHY_INIT_CFG(QSERDES_COM_INTEGLOOP_GAIN1_MODE0, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_COM_VCO_TUNE1_MODE0, 0x28),
+	QMP_PHY_INIT_CFG(QSERDES_COM_VCO_TUNE2_MODE0, 0x02),
+	QMP_PHY_INIT_CFG(QSERDES_COM_LOCK_CMP1_MODE0, 0xff),
+	QMP_PHY_INIT_CFG(QSERDES_COM_LOCK_CMP2_MODE0, 0x0c),
+	QMP_PHY_INIT_CFG(QSERDES_COM_LOCK_CMP3_MODE0, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_COM_DEC_START_MODE1, 0x98),
+	QMP_PHY_INIT_CFG(QSERDES_COM_DIV_FRAC_START1_MODE1, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_COM_DIV_FRAC_START2_MODE1, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_COM_DIV_FRAC_START3_MODE1, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_COM_CP_CTRL_MODE1, 0x0b),
+	QMP_PHY_INIT_CFG(QSERDES_COM_PLL_RCTRL_MODE1, 0x16),
+	QMP_PHY_INIT_CFG(QSERDES_COM_PLL_CCTRL_MODE1, 0x28),
+	QMP_PHY_INIT_CFG(QSERDES_COM_INTEGLOOP_GAIN0_MODE1, 0x80),
+	QMP_PHY_INIT_CFG(QSERDES_COM_INTEGLOOP_GAIN1_MODE1, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_COM_VCO_TUNE1_MODE1, 0xd6),
+	QMP_PHY_INIT_CFG(QSERDES_COM_VCO_TUNE2_MODE1, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_COM_LOCK_CMP1_MODE1, 0x32),
+	QMP_PHY_INIT_CFG(QSERDES_COM_LOCK_CMP2_MODE1, 0x0f),
+	QMP_PHY_INIT_CFG(QSERDES_COM_LOCK_CMP3_MODE1, 0x00),
+};
+
+static const struct qmp_phy_init_tbl msm8996_ufs_tx_tbl[] = {
+	QMP_PHY_INIT_CFG(QSERDES_TX_HIGHZ_TRANSCEIVEREN_BIAS_DRVR_EN, 0x45),
+	QMP_PHY_INIT_CFG(QSERDES_TX_LANE_MODE, 0x02),
+};
+
+static const struct qmp_phy_init_tbl msm8996_ufs_rx_tbl[] = {
+	QMP_PHY_INIT_CFG(QSERDES_RX_SIGDET_LVL, 0x24),
+	QMP_PHY_INIT_CFG(QSERDES_RX_SIGDET_CNTRL, 0x02),
+	QMP_PHY_INIT_CFG(QSERDES_RX_RX_INTERFACE_MODE, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_RX_SIGDET_DEGLITCH_CNTRL, 0x18),
+	QMP_PHY_INIT_CFG(QSERDES_RX_UCDR_FASTLOCK_FO_GAIN, 0x0B),
+	QMP_PHY_INIT_CFG(QSERDES_RX_RX_TERM_BW, 0x5b),
+	QMP_PHY_INIT_CFG(QSERDES_RX_RX_EQ_GAIN1_LSB, 0xff),
+	QMP_PHY_INIT_CFG(QSERDES_RX_RX_EQ_GAIN1_MSB, 0x3f),
+	QMP_PHY_INIT_CFG(QSERDES_RX_RX_EQ_GAIN2_LSB, 0xff),
+	QMP_PHY_INIT_CFG(QSERDES_RX_RX_EQ_GAIN2_MSB, 0x0f),
+	QMP_PHY_INIT_CFG(QSERDES_RX_RX_EQU_ADAPTOR_CNTRL2, 0x0E),
+};
+
+static const struct qmp_phy_init_tbl sm6115_ufsphy_serdes_tbl[] = {
+	QMP_PHY_INIT_CFG(QSERDES_COM_CMN_CONFIG, 0x0e),
+	QMP_PHY_INIT_CFG(QSERDES_COM_SYSCLK_EN_SEL, 0x14),
+	QMP_PHY_INIT_CFG(QSERDES_COM_CLK_SELECT, 0x30),
+	QMP_PHY_INIT_CFG(QSERDES_COM_SYS_CLK_CTRL, 0x02),
+	QMP_PHY_INIT_CFG(QSERDES_COM_BIAS_EN_CLKBUFLR_EN, 0x08),
+	QMP_PHY_INIT_CFG(QSERDES_COM_BG_TIMER, 0x0a),
+	QMP_PHY_INIT_CFG(QSERDES_COM_HSCLK_SEL, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_COM_CORECLK_DIV, 0x0a),
+	QMP_PHY_INIT_CFG(QSERDES_COM_CORECLK_DIV_MODE1, 0x0a),
+	QMP_PHY_INIT_CFG(QSERDES_COM_LOCK_CMP_EN, 0x01),
+	QMP_PHY_INIT_CFG(QSERDES_COM_VCO_TUNE_CTRL, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_COM_RESETSM_CNTRL, 0x20),
+	QMP_PHY_INIT_CFG(QSERDES_COM_CORE_CLK_EN, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_COM_LOCK_CMP_CFG, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_COM_VCO_TUNE_TIMER1, 0xff),
+	QMP_PHY_INIT_CFG(QSERDES_COM_VCO_TUNE_TIMER2, 0x3f),
+	QMP_PHY_INIT_CFG(QSERDES_COM_VCO_TUNE_MAP, 0x04),
+	QMP_PHY_INIT_CFG(QSERDES_COM_SVS_MODE_CLK_SEL, 0x05),
+	QMP_PHY_INIT_CFG(QSERDES_COM_DEC_START_MODE0, 0x82),
+	QMP_PHY_INIT_CFG(QSERDES_COM_DIV_FRAC_START1_MODE0, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_COM_DIV_FRAC_START2_MODE0, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_COM_DIV_FRAC_START3_MODE0, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_COM_CP_CTRL_MODE0, 0x0b),
+	QMP_PHY_INIT_CFG(QSERDES_COM_PLL_RCTRL_MODE0, 0x16),
+	QMP_PHY_INIT_CFG(QSERDES_COM_PLL_CCTRL_MODE0, 0x28),
+	QMP_PHY_INIT_CFG(QSERDES_COM_INTEGLOOP_GAIN0_MODE0, 0x80),
+	QMP_PHY_INIT_CFG(QSERDES_COM_INTEGLOOP_GAIN1_MODE0, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_COM_VCO_TUNE1_MODE0, 0x28),
+	QMP_PHY_INIT_CFG(QSERDES_COM_VCO_TUNE2_MODE0, 0x02),
+	QMP_PHY_INIT_CFG(QSERDES_COM_LOCK_CMP1_MODE0, 0xff),
+	QMP_PHY_INIT_CFG(QSERDES_COM_LOCK_CMP2_MODE0, 0x0c),
+	QMP_PHY_INIT_CFG(QSERDES_COM_LOCK_CMP3_MODE0, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_COM_DEC_START_MODE1, 0x98),
+	QMP_PHY_INIT_CFG(QSERDES_COM_DIV_FRAC_START1_MODE1, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_COM_DIV_FRAC_START2_MODE1, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_COM_DIV_FRAC_START3_MODE1, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_COM_CP_CTRL_MODE1, 0x0b),
+	QMP_PHY_INIT_CFG(QSERDES_COM_PLL_RCTRL_MODE1, 0x16),
+	QMP_PHY_INIT_CFG(QSERDES_COM_PLL_CCTRL_MODE1, 0x28),
+	QMP_PHY_INIT_CFG(QSERDES_COM_INTEGLOOP_GAIN0_MODE1, 0x80),
+	QMP_PHY_INIT_CFG(QSERDES_COM_INTEGLOOP_GAIN1_MODE1, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_COM_VCO_TUNE1_MODE1, 0xd6),
+	QMP_PHY_INIT_CFG(QSERDES_COM_VCO_TUNE2_MODE1, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_COM_LOCK_CMP1_MODE1, 0x32),
+	QMP_PHY_INIT_CFG(QSERDES_COM_LOCK_CMP2_MODE1, 0x0f),
+	QMP_PHY_INIT_CFG(QSERDES_COM_LOCK_CMP3_MODE1, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_COM_PLL_IVCO, 0x0f),
+	QMP_PHY_INIT_CFG(QSERDES_COM_BG_TRIM, 0x0f),
+	QMP_PHY_INIT_CFG(QSERDES_COM_VCO_TUNE_INITVAL1, 0xff),
+	QMP_PHY_INIT_CFG(QSERDES_COM_VCO_TUNE_INITVAL2, 0x00),
+
+	/* Rate B */
+	QMP_PHY_INIT_CFG(QSERDES_COM_VCO_TUNE_MAP, 0x44),
+};
+
+static const struct qmp_phy_init_tbl sm6115_ufsphy_tx_tbl[] = {
+	QMP_PHY_INIT_CFG(QSERDES_TX_HIGHZ_TRANSCEIVEREN_BIAS_DRVR_EN, 0x45),
+	QMP_PHY_INIT_CFG(QSERDES_TX_LANE_MODE, 0x06),
+};
+
+static const struct qmp_phy_init_tbl sm6115_ufsphy_rx_tbl[] = {
+	QMP_PHY_INIT_CFG(QSERDES_RX_SIGDET_LVL, 0x24),
+	QMP_PHY_INIT_CFG(QSERDES_RX_SIGDET_CNTRL, 0x0F),
+	QMP_PHY_INIT_CFG(QSERDES_RX_RX_INTERFACE_MODE, 0x40),
+	QMP_PHY_INIT_CFG(QSERDES_RX_SIGDET_DEGLITCH_CNTRL, 0x1E),
+	QMP_PHY_INIT_CFG(QSERDES_RX_UCDR_FASTLOCK_FO_GAIN, 0x0B),
+	QMP_PHY_INIT_CFG(QSERDES_RX_RX_TERM_BW, 0x5B),
+	QMP_PHY_INIT_CFG(QSERDES_RX_RX_EQ_GAIN1_LSB, 0xFF),
+	QMP_PHY_INIT_CFG(QSERDES_RX_RX_EQ_GAIN1_MSB, 0x3F),
+	QMP_PHY_INIT_CFG(QSERDES_RX_RX_EQ_GAIN2_LSB, 0xFF),
+	QMP_PHY_INIT_CFG(QSERDES_RX_RX_EQ_GAIN2_MSB, 0x3F),
+	QMP_PHY_INIT_CFG(QSERDES_RX_RX_EQU_ADAPTOR_CNTRL2, 0x0D),
+	QMP_PHY_INIT_CFG(QSERDES_RX_UCDR_SVS_SO_GAIN_HALF, 0x04),
+	QMP_PHY_INIT_CFG(QSERDES_RX_UCDR_SVS_SO_GAIN_QUARTER, 0x04),
+	QMP_PHY_INIT_CFG(QSERDES_RX_UCDR_SVS_SO_GAIN, 0x04),
+	QMP_PHY_INIT_CFG(QSERDES_RX_UCDR_SO_SATURATION_AND_ENABLE, 0x5B),
+};
+
+static const struct qmp_phy_init_tbl sm6115_ufsphy_pcs_tbl[] = {
+	QMP_PHY_INIT_CFG(QPHY_RX_PWM_GEAR_BAND, 0x15),
+	QMP_PHY_INIT_CFG(QPHY_RX_SIGDET_CTRL2, 0x6d),
+	QMP_PHY_INIT_CFG(QPHY_TX_LARGE_AMP_DRV_LVL, 0x0f),
+	QMP_PHY_INIT_CFG(QPHY_TX_SMALL_AMP_DRV_LVL, 0x02),
+	QMP_PHY_INIT_CFG(QPHY_RX_MIN_STALL_NOCONFIG_TIME_CAP, 0x28),
+	QMP_PHY_INIT_CFG(QPHY_RX_SYM_RESYNC_CTRL, 0x03),
+	QMP_PHY_INIT_CFG(QPHY_TX_LARGE_AMP_POST_EMP_LVL, 0x12),
+	QMP_PHY_INIT_CFG(QPHY_TX_SMALL_AMP_POST_EMP_LVL, 0x0f),
+	QMP_PHY_INIT_CFG(QPHY_RX_MIN_HIBERN8_TIME, 0x9a), /* 8 us */
+};
+
+static const struct qmp_phy_init_tbl sdm845_ufsphy_serdes_tbl[] = {
+	QMP_PHY_INIT_CFG(QSERDES_V3_COM_SYS_CLK_CTRL, 0x02),
+	QMP_PHY_INIT_CFG(QSERDES_V3_COM_BIAS_EN_CLKBUFLR_EN, 0x04),
+	QMP_PHY_INIT_CFG(QSERDES_V3_COM_BG_TIMER, 0x0a),
+	QMP_PHY_INIT_CFG(QSERDES_V3_COM_PLL_IVCO, 0x07),
+	QMP_PHY_INIT_CFG(QSERDES_V3_COM_CMN_CONFIG, 0x06),
+	QMP_PHY_INIT_CFG(QSERDES_V3_COM_SYSCLK_EN_SEL, 0xd5),
+	QMP_PHY_INIT_CFG(QSERDES_V3_COM_RESETSM_CNTRL, 0x20),
+	QMP_PHY_INIT_CFG(QSERDES_V3_COM_CLK_SELECT, 0x30),
+	QMP_PHY_INIT_CFG(QSERDES_V3_COM_HSCLK_SEL, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V3_COM_LOCK_CMP_EN, 0x01),
+	QMP_PHY_INIT_CFG(QSERDES_V3_COM_VCO_TUNE_CTRL, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V3_COM_CORE_CLK_EN, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V3_COM_VCO_TUNE_MAP, 0x04),
+	QMP_PHY_INIT_CFG(QSERDES_V3_COM_SVS_MODE_CLK_SEL, 0x05),
+	QMP_PHY_INIT_CFG(QSERDES_V3_COM_VCO_TUNE_INITVAL1, 0xff),
+	QMP_PHY_INIT_CFG(QSERDES_V3_COM_VCO_TUNE_INITVAL2, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V3_COM_DEC_START_MODE0, 0x82),
+	QMP_PHY_INIT_CFG(QSERDES_V3_COM_CP_CTRL_MODE0, 0x06),
+	QMP_PHY_INIT_CFG(QSERDES_V3_COM_PLL_RCTRL_MODE0, 0x16),
+	QMP_PHY_INIT_CFG(QSERDES_V3_COM_PLL_CCTRL_MODE0, 0x36),
+	QMP_PHY_INIT_CFG(QSERDES_V3_COM_INTEGLOOP_GAIN0_MODE0, 0x3f),
+	QMP_PHY_INIT_CFG(QSERDES_V3_COM_INTEGLOOP_GAIN1_MODE0, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V3_COM_VCO_TUNE1_MODE0, 0xda),
+	QMP_PHY_INIT_CFG(QSERDES_V3_COM_VCO_TUNE2_MODE0, 0x01),
+	QMP_PHY_INIT_CFG(QSERDES_V3_COM_LOCK_CMP1_MODE0, 0xff),
+	QMP_PHY_INIT_CFG(QSERDES_V3_COM_LOCK_CMP2_MODE0, 0x0c),
+	QMP_PHY_INIT_CFG(QSERDES_V3_COM_DEC_START_MODE1, 0x98),
+	QMP_PHY_INIT_CFG(QSERDES_V3_COM_CP_CTRL_MODE1, 0x06),
+	QMP_PHY_INIT_CFG(QSERDES_V3_COM_PLL_RCTRL_MODE1, 0x16),
+	QMP_PHY_INIT_CFG(QSERDES_V3_COM_PLL_CCTRL_MODE1, 0x36),
+	QMP_PHY_INIT_CFG(QSERDES_V3_COM_INTEGLOOP_GAIN0_MODE1, 0x3f),
+	QMP_PHY_INIT_CFG(QSERDES_V3_COM_INTEGLOOP_GAIN1_MODE1, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V3_COM_VCO_TUNE1_MODE1, 0xc1),
+	QMP_PHY_INIT_CFG(QSERDES_V3_COM_VCO_TUNE2_MODE1, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V3_COM_LOCK_CMP1_MODE1, 0x32),
+	QMP_PHY_INIT_CFG(QSERDES_V3_COM_LOCK_CMP2_MODE1, 0x0f),
+
+	/* Rate B */
+	QMP_PHY_INIT_CFG(QSERDES_V3_COM_VCO_TUNE_MAP, 0x44),
+};
+
+static const struct qmp_phy_init_tbl sdm845_ufsphy_tx_tbl[] = {
+	QMP_PHY_INIT_CFG(QSERDES_V3_TX_LANE_MODE_1, 0x06),
+	QMP_PHY_INIT_CFG(QSERDES_V3_TX_RES_CODE_LANE_OFFSET_TX, 0x04),
+	QMP_PHY_INIT_CFG(QSERDES_V3_TX_RES_CODE_LANE_OFFSET_RX, 0x07),
+};
+
+static const struct qmp_phy_init_tbl sdm845_ufsphy_rx_tbl[] = {
+	QMP_PHY_INIT_CFG(QSERDES_V3_RX_SIGDET_LVL, 0x24),
+	QMP_PHY_INIT_CFG(QSERDES_V3_RX_SIGDET_CNTRL, 0x0f),
+	QMP_PHY_INIT_CFG(QSERDES_V3_RX_SIGDET_DEGLITCH_CNTRL, 0x1e),
+	QMP_PHY_INIT_CFG(QSERDES_V3_RX_RX_INTERFACE_MODE, 0x40),
+	QMP_PHY_INIT_CFG(QSERDES_V3_RX_UCDR_FASTLOCK_FO_GAIN, 0x0b),
+	QMP_PHY_INIT_CFG(QSERDES_V3_RX_RX_TERM_BW, 0x5b),
+	QMP_PHY_INIT_CFG(QSERDES_V3_RX_RX_EQU_ADAPTOR_CNTRL2, 0x06),
+	QMP_PHY_INIT_CFG(QSERDES_V3_RX_RX_EQU_ADAPTOR_CNTRL3, 0x04),
+	QMP_PHY_INIT_CFG(QSERDES_V3_RX_RX_EQU_ADAPTOR_CNTRL4, 0x1b),
+	QMP_PHY_INIT_CFG(QSERDES_V3_RX_UCDR_SVS_SO_GAIN_HALF, 0x04),
+	QMP_PHY_INIT_CFG(QSERDES_V3_RX_UCDR_SVS_SO_GAIN_QUARTER, 0x04),
+	QMP_PHY_INIT_CFG(QSERDES_V3_RX_UCDR_SVS_SO_GAIN, 0x04),
+	QMP_PHY_INIT_CFG(QSERDES_V3_RX_UCDR_SO_SATURATION_AND_ENABLE, 0x4b),
+	QMP_PHY_INIT_CFG(QSERDES_V3_RX_UCDR_PI_CONTROLS, 0x81),
+	QMP_PHY_INIT_CFG(QSERDES_V3_RX_UCDR_FASTLOCK_COUNT_LOW, 0x80),
+	QMP_PHY_INIT_CFG(QSERDES_V3_RX_RX_MODE_00, 0x59),
+};
+
+static const struct qmp_phy_init_tbl sdm845_ufsphy_pcs_tbl[] = {
+	QMP_PHY_INIT_CFG(QPHY_V3_PCS_RX_SIGDET_CTRL2, 0x6e),
+	QMP_PHY_INIT_CFG(QPHY_V3_PCS_TX_LARGE_AMP_DRV_LVL, 0x0a),
+	QMP_PHY_INIT_CFG(QPHY_V3_PCS_TX_SMALL_AMP_DRV_LVL, 0x02),
+	QMP_PHY_INIT_CFG(QPHY_V3_PCS_RX_SYM_RESYNC_CTRL, 0x03),
+	QMP_PHY_INIT_CFG(QPHY_V3_PCS_TX_MID_TERM_CTRL1, 0x43),
+	QMP_PHY_INIT_CFG(QPHY_V3_PCS_RX_SIGDET_CTRL1, 0x0f),
+	QMP_PHY_INIT_CFG(QPHY_V3_PCS_RX_MIN_HIBERN8_TIME, 0x9a),
+	QMP_PHY_INIT_CFG(QPHY_V3_PCS_MULTI_LANE_CTRL1, 0x02),
+};
+
+static const struct qmp_phy_init_tbl sm8150_ufsphy_serdes_tbl[] = {
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_SYSCLK_EN_SEL, 0xd9),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_HSCLK_SEL, 0x11),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_HSCLK_HS_SWITCH_SEL, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_LOCK_CMP_EN, 0x01),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_VCO_TUNE_MAP, 0x02),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_PLL_IVCO, 0x0f),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_VCO_TUNE_INITVAL2, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_BIN_VCOCAL_HSCLK_SEL, 0x11),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_DEC_START_MODE0, 0x82),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_CP_CTRL_MODE0, 0x06),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_PLL_RCTRL_MODE0, 0x16),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_PLL_CCTRL_MODE0, 0x36),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_LOCK_CMP1_MODE0, 0xff),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_LOCK_CMP2_MODE0, 0x0c),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_BIN_VCOCAL_CMP_CODE1_MODE0, 0xac),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_BIN_VCOCAL_CMP_CODE2_MODE0, 0x1e),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_DEC_START_MODE1, 0x98),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_CP_CTRL_MODE1, 0x06),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_PLL_RCTRL_MODE1, 0x16),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_PLL_CCTRL_MODE1, 0x36),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_LOCK_CMP1_MODE1, 0x32),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_LOCK_CMP2_MODE1, 0x0f),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_BIN_VCOCAL_CMP_CODE1_MODE1, 0xdd),
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_BIN_VCOCAL_CMP_CODE2_MODE1, 0x23),
+
+	/* Rate B */
+	QMP_PHY_INIT_CFG(QSERDES_V4_COM_VCO_TUNE_MAP, 0x06),
+};
+
+static const struct qmp_phy_init_tbl sm8150_ufsphy_tx_tbl[] = {
+	QMP_PHY_INIT_CFG(QSERDES_V4_TX_PWM_GEAR_1_DIVIDER_BAND0_1, 0x06),
+	QMP_PHY_INIT_CFG(QSERDES_V4_TX_PWM_GEAR_2_DIVIDER_BAND0_1, 0x03),
+	QMP_PHY_INIT_CFG(QSERDES_V4_TX_PWM_GEAR_3_DIVIDER_BAND0_1, 0x01),
+	QMP_PHY_INIT_CFG(QSERDES_V4_TX_PWM_GEAR_4_DIVIDER_BAND0_1, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V4_TX_LANE_MODE_1, 0x05),
+	QMP_PHY_INIT_CFG(QSERDES_V4_TX_TRAN_DRVR_EMP_EN, 0x0c),
+};
+
+static const struct qmp_phy_init_tbl sm8150_ufsphy_rx_tbl[] = {
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_SIGDET_LVL, 0x24),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_SIGDET_CNTRL, 0x0f),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_SIGDET_DEGLITCH_CNTRL, 0x1e),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_BAND, 0x18),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_UCDR_FASTLOCK_FO_GAIN, 0x0a),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_UCDR_SO_SATURATION_AND_ENABLE, 0x4b),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_UCDR_PI_CONTROLS, 0xf1),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_UCDR_FASTLOCK_COUNT_LOW, 0x80),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_UCDR_PI_CTRL2, 0x80),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_UCDR_FO_GAIN, 0x0c),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_UCDR_SO_GAIN, 0x04),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_TERM_BW, 0x1b),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_EQU_ADAPTOR_CNTRL2, 0x06),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_EQU_ADAPTOR_CNTRL3, 0x04),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_EQU_ADAPTOR_CNTRL4, 0x1d),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_OFFSET_ADAPTOR_CNTRL2, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_IDAC_MEASURE_TIME, 0x10),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_IDAC_TSETTLE_LOW, 0xc0),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_IDAC_TSETTLE_HIGH, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_MODE_00_LOW, 0x36),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_MODE_00_HIGH, 0x36),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_MODE_00_HIGH2, 0xf6),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_MODE_00_HIGH3, 0x3b),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_MODE_00_HIGH4, 0x3d),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_MODE_01_LOW, 0xe0),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_MODE_01_HIGH, 0xc8),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_MODE_01_HIGH2, 0xc8),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_MODE_01_HIGH3, 0x3b),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_MODE_01_HIGH4, 0xb1),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_MODE_10_LOW, 0xe0),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_MODE_10_HIGH, 0xc8),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_MODE_10_HIGH2, 0xc8),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_MODE_10_HIGH3, 0x3b),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_MODE_10_HIGH4, 0xb1),
+
+};
+
+static const struct qmp_phy_init_tbl sm8150_ufsphy_pcs_tbl[] = {
+	QMP_PHY_INIT_CFG(QPHY_V4_PCS_UFS_RX_SIGDET_CTRL2, 0x6d),
+	QMP_PHY_INIT_CFG(QPHY_V4_PCS_UFS_TX_LARGE_AMP_DRV_LVL, 0x0a),
+	QMP_PHY_INIT_CFG(QPHY_V4_PCS_UFS_TX_SMALL_AMP_DRV_LVL, 0x02),
+	QMP_PHY_INIT_CFG(QPHY_V4_PCS_UFS_TX_MID_TERM_CTRL1, 0x43),
+	QMP_PHY_INIT_CFG(QPHY_V4_PCS_UFS_DEBUG_BUS_CLKSEL, 0x1f),
+	QMP_PHY_INIT_CFG(QPHY_V4_PCS_UFS_RX_MIN_HIBERN8_TIME, 0xff),
+	QMP_PHY_INIT_CFG(QPHY_V4_PCS_UFS_MULTI_LANE_CTRL1, 0x02),
+};
+
+static const struct qmp_phy_init_tbl sm8350_ufsphy_serdes_tbl[] = {
+	QMP_PHY_INIT_CFG(QSERDES_V5_COM_SYSCLK_EN_SEL, 0xd9),
+	QMP_PHY_INIT_CFG(QSERDES_V5_COM_HSCLK_SEL, 0x11),
+	QMP_PHY_INIT_CFG(QSERDES_V5_COM_HSCLK_HS_SWITCH_SEL, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V5_COM_LOCK_CMP_EN, 0x42),
+	QMP_PHY_INIT_CFG(QSERDES_V5_COM_VCO_TUNE_MAP, 0x02),
+	QMP_PHY_INIT_CFG(QSERDES_V5_COM_PLL_IVCO, 0x0f),
+	QMP_PHY_INIT_CFG(QSERDES_V5_COM_VCO_TUNE_INITVAL2, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V5_COM_BIN_VCOCAL_HSCLK_SEL, 0x11),
+	QMP_PHY_INIT_CFG(QSERDES_V5_COM_DEC_START_MODE0, 0x82),
+	QMP_PHY_INIT_CFG(QSERDES_V5_COM_CP_CTRL_MODE0, 0x14),
+	QMP_PHY_INIT_CFG(QSERDES_V5_COM_PLL_RCTRL_MODE0, 0x18),
+	QMP_PHY_INIT_CFG(QSERDES_V5_COM_PLL_CCTRL_MODE0, 0x18),
+	QMP_PHY_INIT_CFG(QSERDES_V5_COM_LOCK_CMP1_MODE0, 0xff),
+	QMP_PHY_INIT_CFG(QSERDES_V5_COM_LOCK_CMP2_MODE0, 0x19),
+	QMP_PHY_INIT_CFG(QSERDES_V5_COM_BIN_VCOCAL_CMP_CODE1_MODE0, 0xac),
+	QMP_PHY_INIT_CFG(QSERDES_V5_COM_BIN_VCOCAL_CMP_CODE2_MODE0, 0x1e),
+	QMP_PHY_INIT_CFG(QSERDES_V5_COM_DEC_START_MODE1, 0x98),
+	QMP_PHY_INIT_CFG(QSERDES_V5_COM_CP_CTRL_MODE1, 0x14),
+	QMP_PHY_INIT_CFG(QSERDES_V5_COM_PLL_RCTRL_MODE1, 0x18),
+	QMP_PHY_INIT_CFG(QSERDES_V5_COM_PLL_CCTRL_MODE1, 0x18),
+	QMP_PHY_INIT_CFG(QSERDES_V5_COM_LOCK_CMP1_MODE1, 0x65),
+	QMP_PHY_INIT_CFG(QSERDES_V5_COM_LOCK_CMP2_MODE1, 0x1e),
+	QMP_PHY_INIT_CFG(QSERDES_V5_COM_BIN_VCOCAL_CMP_CODE1_MODE1, 0xdd),
+	QMP_PHY_INIT_CFG(QSERDES_V5_COM_BIN_VCOCAL_CMP_CODE2_MODE1, 0x23),
+
+	/* Rate B */
+	QMP_PHY_INIT_CFG(QSERDES_V5_COM_VCO_TUNE_MAP, 0x06),
+};
+
+static const struct qmp_phy_init_tbl sm8350_ufsphy_tx_tbl[] = {
+	QMP_PHY_INIT_CFG(QSERDES_V5_TX_PWM_GEAR_1_DIVIDER_BAND0_1, 0x06),
+	QMP_PHY_INIT_CFG(QSERDES_V5_TX_PWM_GEAR_2_DIVIDER_BAND0_1, 0x03),
+	QMP_PHY_INIT_CFG(QSERDES_V5_TX_PWM_GEAR_3_DIVIDER_BAND0_1, 0x01),
+	QMP_PHY_INIT_CFG(QSERDES_V5_TX_PWM_GEAR_4_DIVIDER_BAND0_1, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V5_TX_LANE_MODE_1, 0xf5),
+	QMP_PHY_INIT_CFG(QSERDES_V5_TX_LANE_MODE_3, 0x3f),
+	QMP_PHY_INIT_CFG(QSERDES_V5_TX_RES_CODE_LANE_OFFSET_TX, 0x09),
+	QMP_PHY_INIT_CFG(QSERDES_V5_TX_RES_CODE_LANE_OFFSET_RX, 0x09),
+	QMP_PHY_INIT_CFG(QSERDES_V5_TX_TRAN_DRVR_EMP_EN, 0x0c),
+};
+
+static const struct qmp_phy_init_tbl sm8350_ufsphy_rx_tbl[] = {
+	QMP_PHY_INIT_CFG(QSERDES_V5_RX_SIGDET_LVL, 0x24),
+	QMP_PHY_INIT_CFG(QSERDES_V5_RX_SIGDET_CNTRL, 0x0f),
+	QMP_PHY_INIT_CFG(QSERDES_V5_RX_SIGDET_DEGLITCH_CNTRL, 0x1e),
+	QMP_PHY_INIT_CFG(QSERDES_V5_RX_RX_BAND, 0x18),
+	QMP_PHY_INIT_CFG(QSERDES_V5_RX_UCDR_FASTLOCK_FO_GAIN, 0x0a),
+	QMP_PHY_INIT_CFG(QSERDES_V5_RX_UCDR_SO_SATURATION_AND_ENABLE, 0x5a),
+	QMP_PHY_INIT_CFG(QSERDES_V5_RX_UCDR_PI_CONTROLS, 0xf1),
+	QMP_PHY_INIT_CFG(QSERDES_V5_RX_UCDR_FASTLOCK_COUNT_LOW, 0x80),
+	QMP_PHY_INIT_CFG(QSERDES_V5_RX_UCDR_PI_CTRL2, 0x80),
+	QMP_PHY_INIT_CFG(QSERDES_V5_RX_UCDR_FO_GAIN, 0x0e),
+	QMP_PHY_INIT_CFG(QSERDES_V5_RX_UCDR_SO_GAIN, 0x04),
+	QMP_PHY_INIT_CFG(QSERDES_V5_RX_RX_TERM_BW, 0x1b),
+	QMP_PHY_INIT_CFG(QSERDES_V5_RX_RX_EQU_ADAPTOR_CNTRL1, 0x04),
+	QMP_PHY_INIT_CFG(QSERDES_V5_RX_RX_EQU_ADAPTOR_CNTRL2, 0x06),
+	QMP_PHY_INIT_CFG(QSERDES_V5_RX_RX_EQU_ADAPTOR_CNTRL3, 0x04),
+	QMP_PHY_INIT_CFG(QSERDES_V5_RX_RX_EQU_ADAPTOR_CNTRL4, 0x1a),
+	QMP_PHY_INIT_CFG(QSERDES_V5_RX_RX_EQ_OFFSET_ADAPTOR_CNTRL1, 0x17),
+	QMP_PHY_INIT_CFG(QSERDES_V5_RX_RX_OFFSET_ADAPTOR_CNTRL2, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V5_RX_RX_IDAC_MEASURE_TIME, 0x10),
+	QMP_PHY_INIT_CFG(QSERDES_V5_RX_RX_IDAC_TSETTLE_LOW, 0xc0),
+	QMP_PHY_INIT_CFG(QSERDES_V5_RX_RX_IDAC_TSETTLE_HIGH, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V5_RX_RX_MODE_00_LOW, 0x6d),
+	QMP_PHY_INIT_CFG(QSERDES_V5_RX_RX_MODE_00_HIGH, 0x6d),
+	QMP_PHY_INIT_CFG(QSERDES_V5_RX_RX_MODE_00_HIGH2, 0xed),
+	QMP_PHY_INIT_CFG(QSERDES_V5_RX_RX_MODE_00_HIGH3, 0x3b),
+	QMP_PHY_INIT_CFG(QSERDES_V5_RX_RX_MODE_00_HIGH4, 0x3c),
+	QMP_PHY_INIT_CFG(QSERDES_V5_RX_RX_MODE_01_LOW, 0xe0),
+	QMP_PHY_INIT_CFG(QSERDES_V5_RX_RX_MODE_01_HIGH, 0xc8),
+	QMP_PHY_INIT_CFG(QSERDES_V5_RX_RX_MODE_01_HIGH2, 0xc8),
+	QMP_PHY_INIT_CFG(QSERDES_V5_RX_RX_MODE_01_HIGH3, 0x3b),
+	QMP_PHY_INIT_CFG(QSERDES_V5_RX_RX_MODE_01_HIGH4, 0xb7),
+	QMP_PHY_INIT_CFG(QSERDES_V5_RX_RX_MODE_10_LOW, 0xe0),
+	QMP_PHY_INIT_CFG(QSERDES_V5_RX_RX_MODE_10_HIGH, 0xc8),
+	QMP_PHY_INIT_CFG(QSERDES_V5_RX_RX_MODE_10_HIGH2, 0xc8),
+	QMP_PHY_INIT_CFG(QSERDES_V5_RX_RX_MODE_10_HIGH3, 0x3b),
+	QMP_PHY_INIT_CFG(QSERDES_V5_RX_RX_MODE_10_HIGH4, 0xb7),
+	QMP_PHY_INIT_CFG(QSERDES_V5_RX_DCC_CTRL1, 0x0c),
+};
+
+static const struct qmp_phy_init_tbl sm8350_ufsphy_pcs_tbl[] = {
+	QMP_PHY_INIT_CFG(QPHY_V5_PCS_UFS_RX_SIGDET_CTRL2, 0x6d),
+	QMP_PHY_INIT_CFG(QPHY_V5_PCS_UFS_TX_LARGE_AMP_DRV_LVL, 0x0a),
+	QMP_PHY_INIT_CFG(QPHY_V5_PCS_UFS_TX_SMALL_AMP_DRV_LVL, 0x02),
+	QMP_PHY_INIT_CFG(QPHY_V5_PCS_UFS_TX_MID_TERM_CTRL1, 0x43),
+	QMP_PHY_INIT_CFG(QPHY_V5_PCS_UFS_DEBUG_BUS_CLKSEL, 0x1f),
+	QMP_PHY_INIT_CFG(QPHY_V5_PCS_UFS_RX_MIN_HIBERN8_TIME, 0xff),
+	QMP_PHY_INIT_CFG(QPHY_V5_PCS_UFS_PLL_CNTL, 0x03),
+	QMP_PHY_INIT_CFG(QPHY_V5_PCS_UFS_TIMER_20US_CORECLK_STEPS_MSB, 0x16),
+	QMP_PHY_INIT_CFG(QPHY_V5_PCS_UFS_TIMER_20US_CORECLK_STEPS_LSB, 0xd8),
+	QMP_PHY_INIT_CFG(QPHY_V5_PCS_UFS_TX_PWM_GEAR_BAND, 0xaa),
+	QMP_PHY_INIT_CFG(QPHY_V5_PCS_UFS_TX_HS_GEAR_BAND, 0x06),
+	QMP_PHY_INIT_CFG(QPHY_V5_PCS_UFS_TX_HSGEAR_CAPABILITY, 0x03),
+	QMP_PHY_INIT_CFG(QPHY_V5_PCS_UFS_RX_HSGEAR_CAPABILITY, 0x03),
+	QMP_PHY_INIT_CFG(QPHY_V5_PCS_UFS_RX_SIGDET_CTRL1, 0x0e),
+	QMP_PHY_INIT_CFG(QPHY_V5_PCS_UFS_MULTI_LANE_CTRL1, 0x02),
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
+static const char * const msm8996_ufs_phy_clk_l[] = {
+	"ref",
+};
+
+static const char * const sm8450_ufs_phy_clk_l[] = {
+	"qref", "ref", "ref_aux",
+};
+
+static const char * const sdm845_ufs_phy_clk_l[] = {
+	"ref", "ref_aux",
+};
+
+/* list of regulators */
+static const char * const qmp_phy_vreg_l[] = {
+	"vdda-phy", "vdda-pll",
+};
+
+static const struct qmp_phy_cfg msm8996_ufs_cfg = {
+	.type			= PHY_TYPE_UFS,
+	.nlanes			= 1,
+
+	.serdes_tbl		= msm8996_ufs_serdes_tbl,
+	.serdes_tbl_num		= ARRAY_SIZE(msm8996_ufs_serdes_tbl),
+	.tx_tbl			= msm8996_ufs_tx_tbl,
+	.tx_tbl_num		= ARRAY_SIZE(msm8996_ufs_tx_tbl),
+	.rx_tbl			= msm8996_ufs_rx_tbl,
+	.rx_tbl_num		= ARRAY_SIZE(msm8996_ufs_rx_tbl),
+
+	.clk_list		= msm8996_ufs_phy_clk_l,
+	.num_clks		= ARRAY_SIZE(msm8996_ufs_phy_clk_l),
+
+	.vreg_list		= qmp_phy_vreg_l,
+	.num_vregs		= ARRAY_SIZE(qmp_phy_vreg_l),
+
+	.regs			= msm8996_ufsphy_regs_layout,
+
+	.start_ctrl		= SERDES_START,
+	.pwrdn_ctrl		= SW_PWRDN,
+	.phy_status		= PHYSTATUS,
+
+	.no_pcs_sw_reset	= true,
+};
+
+static const struct qmp_phy_cfg sdm845_ufsphy_cfg = {
+	.type			= PHY_TYPE_UFS,
+	.nlanes			= 2,
+
+	.serdes_tbl		= sdm845_ufsphy_serdes_tbl,
+	.serdes_tbl_num		= ARRAY_SIZE(sdm845_ufsphy_serdes_tbl),
+	.tx_tbl			= sdm845_ufsphy_tx_tbl,
+	.tx_tbl_num		= ARRAY_SIZE(sdm845_ufsphy_tx_tbl),
+	.rx_tbl			= sdm845_ufsphy_rx_tbl,
+	.rx_tbl_num		= ARRAY_SIZE(sdm845_ufsphy_rx_tbl),
+	.pcs_tbl		= sdm845_ufsphy_pcs_tbl,
+	.pcs_tbl_num		= ARRAY_SIZE(sdm845_ufsphy_pcs_tbl),
+	.clk_list		= sdm845_ufs_phy_clk_l,
+	.num_clks		= ARRAY_SIZE(sdm845_ufs_phy_clk_l),
+	.vreg_list		= qmp_phy_vreg_l,
+	.num_vregs		= ARRAY_SIZE(qmp_phy_vreg_l),
+	.regs			= sdm845_ufsphy_regs_layout,
+
+	.start_ctrl		= SERDES_START,
+	.pwrdn_ctrl		= SW_PWRDN,
+	.phy_status		= PHYSTATUS,
+
+	.is_dual_lane_phy	= true,
+	.no_pcs_sw_reset	= true,
+};
+
+static const struct qmp_phy_cfg sm6115_ufsphy_cfg = {
+	.type			= PHY_TYPE_UFS,
+	.nlanes			= 1,
+
+	.serdes_tbl		= sm6115_ufsphy_serdes_tbl,
+	.serdes_tbl_num		= ARRAY_SIZE(sm6115_ufsphy_serdes_tbl),
+	.tx_tbl			= sm6115_ufsphy_tx_tbl,
+	.tx_tbl_num		= ARRAY_SIZE(sm6115_ufsphy_tx_tbl),
+	.rx_tbl			= sm6115_ufsphy_rx_tbl,
+	.rx_tbl_num		= ARRAY_SIZE(sm6115_ufsphy_rx_tbl),
+	.pcs_tbl		= sm6115_ufsphy_pcs_tbl,
+	.pcs_tbl_num		= ARRAY_SIZE(sm6115_ufsphy_pcs_tbl),
+	.clk_list		= sdm845_ufs_phy_clk_l,
+	.num_clks		= ARRAY_SIZE(sdm845_ufs_phy_clk_l),
+	.vreg_list		= qmp_phy_vreg_l,
+	.num_vregs		= ARRAY_SIZE(qmp_phy_vreg_l),
+	.regs			= sm6115_ufsphy_regs_layout,
+
+	.start_ctrl		= SERDES_START,
+	.pwrdn_ctrl		= SW_PWRDN,
+
+	.is_dual_lane_phy	= false,
+	.no_pcs_sw_reset	= true,
+};
+
+static const struct qmp_phy_cfg sm8150_ufsphy_cfg = {
+	.type			= PHY_TYPE_UFS,
+	.nlanes			= 2,
+
+	.serdes_tbl		= sm8150_ufsphy_serdes_tbl,
+	.serdes_tbl_num		= ARRAY_SIZE(sm8150_ufsphy_serdes_tbl),
+	.tx_tbl			= sm8150_ufsphy_tx_tbl,
+	.tx_tbl_num		= ARRAY_SIZE(sm8150_ufsphy_tx_tbl),
+	.rx_tbl			= sm8150_ufsphy_rx_tbl,
+	.rx_tbl_num		= ARRAY_SIZE(sm8150_ufsphy_rx_tbl),
+	.pcs_tbl		= sm8150_ufsphy_pcs_tbl,
+	.pcs_tbl_num		= ARRAY_SIZE(sm8150_ufsphy_pcs_tbl),
+	.clk_list		= sdm845_ufs_phy_clk_l,
+	.num_clks		= ARRAY_SIZE(sdm845_ufs_phy_clk_l),
+	.vreg_list		= qmp_phy_vreg_l,
+	.num_vregs		= ARRAY_SIZE(qmp_phy_vreg_l),
+	.regs			= sm8150_ufsphy_regs_layout,
+
+	.start_ctrl		= SERDES_START,
+	.pwrdn_ctrl		= SW_PWRDN,
+	.phy_status		= PHYSTATUS,
+
+	.is_dual_lane_phy	= true,
+};
+
+static const struct qmp_phy_cfg sm8350_ufsphy_cfg = {
+	.type			= PHY_TYPE_UFS,
+	.nlanes			= 2,
+
+	.serdes_tbl		= sm8350_ufsphy_serdes_tbl,
+	.serdes_tbl_num		= ARRAY_SIZE(sm8350_ufsphy_serdes_tbl),
+	.tx_tbl			= sm8350_ufsphy_tx_tbl,
+	.tx_tbl_num		= ARRAY_SIZE(sm8350_ufsphy_tx_tbl),
+	.rx_tbl			= sm8350_ufsphy_rx_tbl,
+	.rx_tbl_num		= ARRAY_SIZE(sm8350_ufsphy_rx_tbl),
+	.pcs_tbl		= sm8350_ufsphy_pcs_tbl,
+	.pcs_tbl_num		= ARRAY_SIZE(sm8350_ufsphy_pcs_tbl),
+	.clk_list		= sdm845_ufs_phy_clk_l,
+	.num_clks		= ARRAY_SIZE(sdm845_ufs_phy_clk_l),
+	.vreg_list		= qmp_phy_vreg_l,
+	.num_vregs		= ARRAY_SIZE(qmp_phy_vreg_l),
+	.regs			= sm8150_ufsphy_regs_layout,
+
+	.start_ctrl		= SERDES_START,
+	.pwrdn_ctrl		= SW_PWRDN,
+	.phy_status		= PHYSTATUS,
+
+	.is_dual_lane_phy	= true,
+};
+
+static const struct qmp_phy_cfg sm8450_ufsphy_cfg = {
+	.type			= PHY_TYPE_UFS,
+	.nlanes			= 2,
+
+	.serdes_tbl		= sm8350_ufsphy_serdes_tbl,
+	.serdes_tbl_num		= ARRAY_SIZE(sm8350_ufsphy_serdes_tbl),
+	.tx_tbl			= sm8350_ufsphy_tx_tbl,
+	.tx_tbl_num		= ARRAY_SIZE(sm8350_ufsphy_tx_tbl),
+	.rx_tbl			= sm8350_ufsphy_rx_tbl,
+	.rx_tbl_num		= ARRAY_SIZE(sm8350_ufsphy_rx_tbl),
+	.pcs_tbl		= sm8350_ufsphy_pcs_tbl,
+	.pcs_tbl_num		= ARRAY_SIZE(sm8350_ufsphy_pcs_tbl),
+	.clk_list		= sm8450_ufs_phy_clk_l,
+	.num_clks		= ARRAY_SIZE(sm8450_ufs_phy_clk_l),
+	.vreg_list		= qmp_phy_vreg_l,
+	.num_vregs		= ARRAY_SIZE(qmp_phy_vreg_l),
+	.regs			= sm8150_ufsphy_regs_layout,
+
+	.start_ctrl		= SERDES_START,
+	.pwrdn_ctrl		= SW_PWRDN,
+	.phy_status		= PHYSTATUS,
+
+	.is_dual_lane_phy	= true,
+};
+
+static int qcom_qmp_phy_ufs_power_on(struct phy *phy)
+{
+	struct qmp_phy *qphy = phy_get_drvdata(phy);
+	struct qcom_qmp *qmp = qphy->qmp;
+	int ret;
+
+	qcom_qmp_phy_serdes_init(qphy);
+
+	qcom_qmp_phy_lanes_init(phy);
+	qcom_qmp_phy_pcs_init(phy);
+
+	ret = reset_control_deassert(qmp->ufs_reset);
+	if (ret)
+		return ret;
+
+	return qcom_qmp_phy_com_power_on(qphy);
+}
+
+static int qcom_qmp_phy_ufs_power_off(struct phy *phy)
+{
+	struct qmp_phy *qphy = phy_get_drvdata(phy);
+
+	return qcom_qmp_phy_com_power_off(qphy);
+}
+
+static int qcom_qmp_phy_ufs_enable(struct phy *phy)
+{
+	struct qmp_phy *qphy = phy_get_drvdata(phy);
+	struct qcom_qmp *qmp = qphy->qmp;
+	const struct qmp_phy_cfg *cfg = qphy->cfg;
+	int ret;
+
+	dev_vdbg(qmp->dev, "Initializing QMP phy\n");
+
+	if (cfg->no_pcs_sw_reset && !qmp->ufs_reset) {
+		qmp->ufs_reset =
+			devm_reset_control_get_exclusive(qmp->dev,
+							 "ufsphy");
+
+		if (IS_ERR(qmp->ufs_reset)) {
+			ret = PTR_ERR(qmp->ufs_reset);
+			dev_err(qmp->dev,
+				"failed to get UFS reset: %d\n",
+				ret);
+
+			qmp->ufs_reset = NULL;
+			return ret;
+		}
+	}
+
+	ret = reset_control_assert(qmp->ufs_reset);
+	if (ret)
+		return ret;
+
+	ret = qcom_qmp_phy_com_init(qphy);
+	if (ret)
+		return ret;
+
+	ret = qcom_qmp_phy_ufs_power_on(phy);
+	if (ret)
+		qcom_qmp_phy_com_exit(qphy);
+
+	return ret;
+}
+
+static int qcom_qmp_phy_ufs_disable(struct phy *phy)
+{
+	struct qmp_phy *qphy = phy_get_drvdata(phy);
+	int ret;
+
+	ret = qcom_qmp_phy_ufs_power_off(phy);
+	if (ret)
+		return ret;
+	return qcom_qmp_phy_com_exit(qphy);
+}
+
+static int qcom_qmp_phy_ufs_set_mode(struct phy *phy,
+				     enum phy_mode mode, int submode)
+{
+	struct qmp_phy *qphy = phy_get_drvdata(phy);
+
+	qphy->mode = mode;
+
+	return 0;
+}
+
+static const struct phy_ops qcom_qmp_pcie_ufs_ops = {
+	.power_on	= qcom_qmp_phy_ufs_enable,
+	.power_off	= qcom_qmp_phy_ufs_disable,
+	.set_mode	= qcom_qmp_phy_ufs_set_mode,
+	.owner		= THIS_MODULE,
+};
+
+static const struct of_device_id qcom_qmp_phy_ufs_of_match_table[] = {
+	{
+		.compatible = "qcom,msm8996-qmp-ufs-phy",
+		.data = &msm8996_ufs_cfg,
+	}, {
+		.compatible = "qcom,msm8998-qmp-ufs-phy",
+		.data = &sdm845_ufsphy_cfg,
+	}, {
+		.compatible = "qcom,sc8180x-qmp-ufs-phy",
+		.data = &sm8150_ufsphy_cfg,
+	}, {
+		.compatible = "qcom,sc8280xp-qmp-ufs-phy",
+		.data = &sm8350_ufsphy_cfg,
+	}, {
+		.compatible = "qcom,sdm845-qmp-ufs-phy",
+		.data = &sdm845_ufsphy_cfg,
+	}, {
+		.compatible = "qcom,sm6115-qmp-ufs-phy",
+		.data = &sm6115_ufsphy_cfg,
+	}, {
+		.compatible = "qcom,sm6350-qmp-ufs-phy",
+		.data = &sdm845_ufsphy_cfg,
+	}, {
+		.compatible = "qcom,sm8150-qmp-ufs-phy",
+		.data = &sm8150_ufsphy_cfg,
+	}, {
+		.compatible = "qcom,sm8250-qmp-ufs-phy",
+		.data = &sm8150_ufsphy_cfg,
+	}, {
+		.compatible = "qcom,sm8350-qmp-ufs-phy",
+		.data = &sm8350_ufsphy_cfg,
+	}, {
+		.compatible = "qcom,sm8450-qmp-ufs-phy",
+		.data = &sm8450_ufsphy_cfg,
+	},
+	{ },
+};
+MODULE_DEVICE_TABLE(of, qcom_qmp_phy_ufs_of_match_table);
+
+static int qcom_qmp_phy_ufs_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct device_node *child;
+	struct phy_provider *phy_provider;
+	void __iomem *serdes;
+	const struct qmp_phy_cfg *cfg = NULL;
+	int id;
+	int ret;
+
+	/* Get the specific init parameters of QMP phy */
+	cfg = of_device_get_match_data(dev);
+	if (!cfg)
+		return -EINVAL;
+
+	/* per PHY serdes; usually located at base address */
+	serdes = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(serdes))
+		return PTR_ERR(serdes);
+
+	ret = qcom_qmp_phy_common_init(pdev, cfg, cfg->nlanes);
+	if (ret)
+		return ret;
+
+	id = 0;
+	for_each_available_child_of_node(dev->of_node, child) {
+		/* Create per-lane phy */
+		ret = qcom_qmp_phy_create(dev, child, id, serdes, cfg, &qcom_qmp_pcie_ufs_ops);
+		if (ret) {
+			dev_err(dev, "failed to create lane%d phy, %d\n",
+				id, ret);
+			goto err_node_put;
+		}
+
+		id++;
+	}
+
+	phy_provider = devm_of_phy_provider_register(dev, of_phy_simple_xlate);
+	if (!IS_ERR(phy_provider))
+		dev_info(dev, "Registered Qcom-QMP phy\n");
+	else
+		pm_runtime_disable(dev);
+
+	return PTR_ERR_OR_ZERO(phy_provider);
+
+err_node_put:
+	of_node_put(child);
+	pm_runtime_disable(dev);
+	return ret;
+}
+
+static struct platform_driver qcom_qmp_phy_ufs_driver = {
+	.probe		= qcom_qmp_phy_ufs_probe,
+	.driver = {
+		.name	= "qcom-qmp-phy-ufs",
+		.of_match_table = qcom_qmp_phy_ufs_of_match_table,
+	},
+};
+
+module_platform_driver(qcom_qmp_phy_ufs_driver);
+
+MODULE_AUTHOR("Vivek Gautam <vivek.gautam@codeaurora.org>");
+MODULE_DESCRIPTION("Qualcomm QMP UFS PHY driver");
+MODULE_LICENSE("GPL v2");
diff --git a/drivers/phy/qualcomm/phy-qcom-qmp.c b/drivers/phy/qualcomm/phy-qcom-qmp.c
index d8c264ee6850..0fe1ed9e69c2 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp.c
@@ -25,49 +25,6 @@
 #include "phy-qcom-qmp.h"
 #include "phy-qcom-qmp-lib.h"
 
-/* QPHY_SW_RESET bit */
-#define SW_RESET				BIT(0)
-/* QPHY_POWER_DOWN_CONTROL */
-#define SW_PWRDN				BIT(0)
-#define REFCLK_DRV_DSBL				BIT(1)
-/* QPHY_START_CONTROL bits */
-#define SERDES_START				BIT(0)
-#define PCS_START				BIT(1)
-#define PLL_READY_GATE_EN			BIT(3)
-/* QPHY_PCS_STATUS bit */
-#define PHYSTATUS				BIT(6)
-#define PHYSTATUS_4_20				BIT(7)
-/* QPHY_PCS_READY_STATUS & QPHY_COM_PCS_READY_STATUS bit */
-#define PCS_READY				BIT(0)
-
-/* QPHY_V3_DP_COM_RESET_OVRD_CTRL register bits */
-/* DP PHY soft reset */
-#define SW_DPPHY_RESET				BIT(0)
-/* mux to select DP PHY reset control, 0:HW control, 1: software reset */
-#define SW_DPPHY_RESET_MUX			BIT(1)
-/* USB3 PHY soft reset */
-#define SW_USB3PHY_RESET			BIT(2)
-/* mux to select USB3 PHY reset control, 0:HW control, 1: software reset */
-#define SW_USB3PHY_RESET_MUX			BIT(3)
-
-/* QPHY_V3_DP_COM_PHY_MODE_CTRL register bits */
-#define USB3_MODE				BIT(0) /* enables USB3 mode */
-#define DP_MODE					BIT(1) /* enables DP mode */
-
-/* QPHY_PCS_AUTONOMOUS_MODE_CTRL register bits */
-#define ARCVR_DTCT_EN				BIT(0)
-#define ALFPS_DTCT_EN				BIT(1)
-#define ARCVR_DTCT_EVENT_SEL			BIT(4)
-
-/* QPHY_PCS_LFPS_RXTERM_IRQ_CLEAR register bits */
-#define IRQ_CLEAR				BIT(0)
-
-/* QPHY_PCS_LFPS_RXTERM_IRQ_STATUS register bits */
-#define RCVR_DETECT				BIT(0)
-
-/* QPHY_V3_PCS_MISC_CLAMP_ENABLE register bits */
-#define CLAMP_EN				BIT(0) /* enables i/o clamp_n */
-
 #define PHY_INIT_COMPLETE_TIMEOUT		10000
 #define POWER_DOWN_DELAY_US_MIN			10
 #define POWER_DOWN_DELAY_US_MAX			11
@@ -77,11 +34,6 @@
 /* Define the assumed distance between lanes for underspecified device trees. */
 #define QMP_PHY_LEGACY_LANE_STRIDE		0x400
 
-static const unsigned int msm8996_ufsphy_regs_layout[QPHY_LAYOUT_SIZE] = {
-	[QPHY_START_CTRL]		= 0x00,
-	[QPHY_PCS_READY_STATUS]		= 0x168,
-};
-
 static const unsigned int ipq_pciephy_gen3_regs_layout[QPHY_LAYOUT_SIZE] = {
 	[QPHY_SW_RESET]				= 0x00,
 	[QPHY_START_CTRL]			= 0x44,
@@ -177,16 +129,6 @@ static const unsigned int qcm2290_usb3phy_regs_layout[QPHY_LAYOUT_SIZE] = {
 	[QPHY_PCS_MISC_TYPEC_CTRL]	= 0x00,
 };
 
-static const unsigned int sdm845_ufsphy_regs_layout[QPHY_LAYOUT_SIZE] = {
-	[QPHY_START_CTRL]		= 0x00,
-	[QPHY_PCS_READY_STATUS]		= 0x160,
-};
-
-static const unsigned int sm6115_ufsphy_regs_layout[QPHY_LAYOUT_SIZE] = {
-	[QPHY_START_CTRL]		= 0x00,
-	[QPHY_PCS_READY_STATUS]		= 0x168,
-};
-
 static const unsigned int sm8250_pcie_regs_layout[QPHY_LAYOUT_SIZE] = {
 	[QPHY_SW_RESET]			= 0x00,
 	[QPHY_START_CTRL]		= 0x44,
@@ -194,12 +136,6 @@ static const unsigned int sm8250_pcie_regs_layout[QPHY_LAYOUT_SIZE] = {
 	[QPHY_PCS_POWER_DOWN_CONTROL]	= 0x40,
 };
 
-static const unsigned int sm8150_ufsphy_regs_layout[QPHY_LAYOUT_SIZE] = {
-	[QPHY_START_CTRL]		= QPHY_V4_PCS_UFS_PHY_START,
-	[QPHY_PCS_READY_STATUS]		= QPHY_V4_PCS_UFS_READY_STATUS,
-	[QPHY_SW_RESET]			= QPHY_V4_PCS_UFS_SW_RESET,
-};
-
 static const struct qmp_phy_init_tbl ipq8074_usb3_serdes_tbl[] = {
 	QMP_PHY_INIT_CFG(QSERDES_COM_SYSCLK_EN_SEL, 0x1a),
 	QMP_PHY_INIT_CFG(QSERDES_COM_BIAS_EN_CLKBUFLR_EN, 0x08),
@@ -435,75 +371,6 @@ static const struct qmp_phy_init_tbl msm8998_pcie_pcs_tbl[] = {
 	QMP_PHY_INIT_CFG(QPHY_V3_PCS_SIGDET_CNTRL, 0x03),
 };
 
-static const struct qmp_phy_init_tbl msm8996_ufs_serdes_tbl[] = {
-	QMP_PHY_INIT_CFG(QPHY_POWER_DOWN_CONTROL, 0x01),
-	QMP_PHY_INIT_CFG(QSERDES_COM_CMN_CONFIG, 0x0e),
-	QMP_PHY_INIT_CFG(QSERDES_COM_SYSCLK_EN_SEL, 0xd7),
-	QMP_PHY_INIT_CFG(QSERDES_COM_CLK_SELECT, 0x30),
-	QMP_PHY_INIT_CFG(QSERDES_COM_SYS_CLK_CTRL, 0x06),
-	QMP_PHY_INIT_CFG(QSERDES_COM_BIAS_EN_CLKBUFLR_EN, 0x08),
-	QMP_PHY_INIT_CFG(QSERDES_COM_BG_TIMER, 0x0a),
-	QMP_PHY_INIT_CFG(QSERDES_COM_HSCLK_SEL, 0x05),
-	QMP_PHY_INIT_CFG(QSERDES_COM_CORECLK_DIV, 0x0a),
-	QMP_PHY_INIT_CFG(QSERDES_COM_CORECLK_DIV_MODE1, 0x0a),
-	QMP_PHY_INIT_CFG(QSERDES_COM_LOCK_CMP_EN, 0x01),
-	QMP_PHY_INIT_CFG(QSERDES_COM_VCO_TUNE_CTRL, 0x10),
-	QMP_PHY_INIT_CFG(QSERDES_COM_RESETSM_CNTRL, 0x20),
-	QMP_PHY_INIT_CFG(QSERDES_COM_CORE_CLK_EN, 0x00),
-	QMP_PHY_INIT_CFG(QSERDES_COM_LOCK_CMP_CFG, 0x00),
-	QMP_PHY_INIT_CFG(QSERDES_COM_VCO_TUNE_TIMER1, 0xff),
-	QMP_PHY_INIT_CFG(QSERDES_COM_VCO_TUNE_TIMER2, 0x3f),
-	QMP_PHY_INIT_CFG(QSERDES_COM_VCO_TUNE_MAP, 0x54),
-	QMP_PHY_INIT_CFG(QSERDES_COM_SVS_MODE_CLK_SEL, 0x05),
-	QMP_PHY_INIT_CFG(QSERDES_COM_DEC_START_MODE0, 0x82),
-	QMP_PHY_INIT_CFG(QSERDES_COM_DIV_FRAC_START1_MODE0, 0x00),
-	QMP_PHY_INIT_CFG(QSERDES_COM_DIV_FRAC_START2_MODE0, 0x00),
-	QMP_PHY_INIT_CFG(QSERDES_COM_DIV_FRAC_START3_MODE0, 0x00),
-	QMP_PHY_INIT_CFG(QSERDES_COM_CP_CTRL_MODE0, 0x0b),
-	QMP_PHY_INIT_CFG(QSERDES_COM_PLL_RCTRL_MODE0, 0x16),
-	QMP_PHY_INIT_CFG(QSERDES_COM_PLL_CCTRL_MODE0, 0x28),
-	QMP_PHY_INIT_CFG(QSERDES_COM_INTEGLOOP_GAIN0_MODE0, 0x80),
-	QMP_PHY_INIT_CFG(QSERDES_COM_INTEGLOOP_GAIN1_MODE0, 0x00),
-	QMP_PHY_INIT_CFG(QSERDES_COM_VCO_TUNE1_MODE0, 0x28),
-	QMP_PHY_INIT_CFG(QSERDES_COM_VCO_TUNE2_MODE0, 0x02),
-	QMP_PHY_INIT_CFG(QSERDES_COM_LOCK_CMP1_MODE0, 0xff),
-	QMP_PHY_INIT_CFG(QSERDES_COM_LOCK_CMP2_MODE0, 0x0c),
-	QMP_PHY_INIT_CFG(QSERDES_COM_LOCK_CMP3_MODE0, 0x00),
-	QMP_PHY_INIT_CFG(QSERDES_COM_DEC_START_MODE1, 0x98),
-	QMP_PHY_INIT_CFG(QSERDES_COM_DIV_FRAC_START1_MODE1, 0x00),
-	QMP_PHY_INIT_CFG(QSERDES_COM_DIV_FRAC_START2_MODE1, 0x00),
-	QMP_PHY_INIT_CFG(QSERDES_COM_DIV_FRAC_START3_MODE1, 0x00),
-	QMP_PHY_INIT_CFG(QSERDES_COM_CP_CTRL_MODE1, 0x0b),
-	QMP_PHY_INIT_CFG(QSERDES_COM_PLL_RCTRL_MODE1, 0x16),
-	QMP_PHY_INIT_CFG(QSERDES_COM_PLL_CCTRL_MODE1, 0x28),
-	QMP_PHY_INIT_CFG(QSERDES_COM_INTEGLOOP_GAIN0_MODE1, 0x80),
-	QMP_PHY_INIT_CFG(QSERDES_COM_INTEGLOOP_GAIN1_MODE1, 0x00),
-	QMP_PHY_INIT_CFG(QSERDES_COM_VCO_TUNE1_MODE1, 0xd6),
-	QMP_PHY_INIT_CFG(QSERDES_COM_VCO_TUNE2_MODE1, 0x00),
-	QMP_PHY_INIT_CFG(QSERDES_COM_LOCK_CMP1_MODE1, 0x32),
-	QMP_PHY_INIT_CFG(QSERDES_COM_LOCK_CMP2_MODE1, 0x0f),
-	QMP_PHY_INIT_CFG(QSERDES_COM_LOCK_CMP3_MODE1, 0x00),
-};
-
-static const struct qmp_phy_init_tbl msm8996_ufs_tx_tbl[] = {
-	QMP_PHY_INIT_CFG(QSERDES_TX_HIGHZ_TRANSCEIVEREN_BIAS_DRVR_EN, 0x45),
-	QMP_PHY_INIT_CFG(QSERDES_TX_LANE_MODE, 0x02),
-};
-
-static const struct qmp_phy_init_tbl msm8996_ufs_rx_tbl[] = {
-	QMP_PHY_INIT_CFG(QSERDES_RX_SIGDET_LVL, 0x24),
-	QMP_PHY_INIT_CFG(QSERDES_RX_SIGDET_CNTRL, 0x02),
-	QMP_PHY_INIT_CFG(QSERDES_RX_RX_INTERFACE_MODE, 0x00),
-	QMP_PHY_INIT_CFG(QSERDES_RX_SIGDET_DEGLITCH_CNTRL, 0x18),
-	QMP_PHY_INIT_CFG(QSERDES_RX_UCDR_FASTLOCK_FO_GAIN, 0x0B),
-	QMP_PHY_INIT_CFG(QSERDES_RX_RX_TERM_BW, 0x5b),
-	QMP_PHY_INIT_CFG(QSERDES_RX_RX_EQ_GAIN1_LSB, 0xff),
-	QMP_PHY_INIT_CFG(QSERDES_RX_RX_EQ_GAIN1_MSB, 0x3f),
-	QMP_PHY_INIT_CFG(QSERDES_RX_RX_EQ_GAIN2_LSB, 0xff),
-	QMP_PHY_INIT_CFG(QSERDES_RX_RX_EQ_GAIN2_MSB, 0x0f),
-	QMP_PHY_INIT_CFG(QSERDES_RX_RX_EQU_ADAPTOR_CNTRL2, 0x0E),
-};
-
 static const struct qmp_phy_init_tbl msm8996_usb3_serdes_tbl[] = {
 	QMP_PHY_INIT_CFG(QSERDES_COM_SYSCLK_EN_SEL, 0x14),
 	QMP_PHY_INIT_CFG(QSERDES_COM_BIAS_EN_CLKBUFLR_EN, 0x08),
@@ -1200,175 +1067,6 @@ static const struct qmp_phy_init_tbl qmp_v3_usb3_uniphy_pcs_tbl[] = {
 	QMP_PHY_INIT_CFG(QPHY_V3_PCS_REFGEN_REQ_CONFIG2, 0x60),
 };
 
-static const struct qmp_phy_init_tbl sm6115_ufsphy_serdes_tbl[] = {
-	QMP_PHY_INIT_CFG(QSERDES_COM_CMN_CONFIG, 0x0e),
-	QMP_PHY_INIT_CFG(QSERDES_COM_SYSCLK_EN_SEL, 0x14),
-	QMP_PHY_INIT_CFG(QSERDES_COM_CLK_SELECT, 0x30),
-	QMP_PHY_INIT_CFG(QSERDES_COM_SYS_CLK_CTRL, 0x02),
-	QMP_PHY_INIT_CFG(QSERDES_COM_BIAS_EN_CLKBUFLR_EN, 0x08),
-	QMP_PHY_INIT_CFG(QSERDES_COM_BG_TIMER, 0x0a),
-	QMP_PHY_INIT_CFG(QSERDES_COM_HSCLK_SEL, 0x00),
-	QMP_PHY_INIT_CFG(QSERDES_COM_CORECLK_DIV, 0x0a),
-	QMP_PHY_INIT_CFG(QSERDES_COM_CORECLK_DIV_MODE1, 0x0a),
-	QMP_PHY_INIT_CFG(QSERDES_COM_LOCK_CMP_EN, 0x01),
-	QMP_PHY_INIT_CFG(QSERDES_COM_VCO_TUNE_CTRL, 0x00),
-	QMP_PHY_INIT_CFG(QSERDES_COM_RESETSM_CNTRL, 0x20),
-	QMP_PHY_INIT_CFG(QSERDES_COM_CORE_CLK_EN, 0x00),
-	QMP_PHY_INIT_CFG(QSERDES_COM_LOCK_CMP_CFG, 0x00),
-	QMP_PHY_INIT_CFG(QSERDES_COM_VCO_TUNE_TIMER1, 0xff),
-	QMP_PHY_INIT_CFG(QSERDES_COM_VCO_TUNE_TIMER2, 0x3f),
-	QMP_PHY_INIT_CFG(QSERDES_COM_VCO_TUNE_MAP, 0x04),
-	QMP_PHY_INIT_CFG(QSERDES_COM_SVS_MODE_CLK_SEL, 0x05),
-	QMP_PHY_INIT_CFG(QSERDES_COM_DEC_START_MODE0, 0x82),
-	QMP_PHY_INIT_CFG(QSERDES_COM_DIV_FRAC_START1_MODE0, 0x00),
-	QMP_PHY_INIT_CFG(QSERDES_COM_DIV_FRAC_START2_MODE0, 0x00),
-	QMP_PHY_INIT_CFG(QSERDES_COM_DIV_FRAC_START3_MODE0, 0x00),
-	QMP_PHY_INIT_CFG(QSERDES_COM_CP_CTRL_MODE0, 0x0b),
-	QMP_PHY_INIT_CFG(QSERDES_COM_PLL_RCTRL_MODE0, 0x16),
-	QMP_PHY_INIT_CFG(QSERDES_COM_PLL_CCTRL_MODE0, 0x28),
-	QMP_PHY_INIT_CFG(QSERDES_COM_INTEGLOOP_GAIN0_MODE0, 0x80),
-	QMP_PHY_INIT_CFG(QSERDES_COM_INTEGLOOP_GAIN1_MODE0, 0x00),
-	QMP_PHY_INIT_CFG(QSERDES_COM_VCO_TUNE1_MODE0, 0x28),
-	QMP_PHY_INIT_CFG(QSERDES_COM_VCO_TUNE2_MODE0, 0x02),
-	QMP_PHY_INIT_CFG(QSERDES_COM_LOCK_CMP1_MODE0, 0xff),
-	QMP_PHY_INIT_CFG(QSERDES_COM_LOCK_CMP2_MODE0, 0x0c),
-	QMP_PHY_INIT_CFG(QSERDES_COM_LOCK_CMP3_MODE0, 0x00),
-	QMP_PHY_INIT_CFG(QSERDES_COM_DEC_START_MODE1, 0x98),
-	QMP_PHY_INIT_CFG(QSERDES_COM_DIV_FRAC_START1_MODE1, 0x00),
-	QMP_PHY_INIT_CFG(QSERDES_COM_DIV_FRAC_START2_MODE1, 0x00),
-	QMP_PHY_INIT_CFG(QSERDES_COM_DIV_FRAC_START3_MODE1, 0x00),
-	QMP_PHY_INIT_CFG(QSERDES_COM_CP_CTRL_MODE1, 0x0b),
-	QMP_PHY_INIT_CFG(QSERDES_COM_PLL_RCTRL_MODE1, 0x16),
-	QMP_PHY_INIT_CFG(QSERDES_COM_PLL_CCTRL_MODE1, 0x28),
-	QMP_PHY_INIT_CFG(QSERDES_COM_INTEGLOOP_GAIN0_MODE1, 0x80),
-	QMP_PHY_INIT_CFG(QSERDES_COM_INTEGLOOP_GAIN1_MODE1, 0x00),
-	QMP_PHY_INIT_CFG(QSERDES_COM_VCO_TUNE1_MODE1, 0xd6),
-	QMP_PHY_INIT_CFG(QSERDES_COM_VCO_TUNE2_MODE1, 0x00),
-	QMP_PHY_INIT_CFG(QSERDES_COM_LOCK_CMP1_MODE1, 0x32),
-	QMP_PHY_INIT_CFG(QSERDES_COM_LOCK_CMP2_MODE1, 0x0f),
-	QMP_PHY_INIT_CFG(QSERDES_COM_LOCK_CMP3_MODE1, 0x00),
-	QMP_PHY_INIT_CFG(QSERDES_COM_PLL_IVCO, 0x0f),
-	QMP_PHY_INIT_CFG(QSERDES_COM_BG_TRIM, 0x0f),
-	QMP_PHY_INIT_CFG(QSERDES_COM_VCO_TUNE_INITVAL1, 0xff),
-	QMP_PHY_INIT_CFG(QSERDES_COM_VCO_TUNE_INITVAL2, 0x00),
-
-	/* Rate B */
-	QMP_PHY_INIT_CFG(QSERDES_COM_VCO_TUNE_MAP, 0x44),
-};
-
-static const struct qmp_phy_init_tbl sm6115_ufsphy_tx_tbl[] = {
-	QMP_PHY_INIT_CFG(QSERDES_TX_HIGHZ_TRANSCEIVEREN_BIAS_DRVR_EN, 0x45),
-	QMP_PHY_INIT_CFG(QSERDES_TX_LANE_MODE, 0x06),
-};
-
-static const struct qmp_phy_init_tbl sm6115_ufsphy_rx_tbl[] = {
-	QMP_PHY_INIT_CFG(QSERDES_RX_SIGDET_LVL, 0x24),
-	QMP_PHY_INIT_CFG(QSERDES_RX_SIGDET_CNTRL, 0x0F),
-	QMP_PHY_INIT_CFG(QSERDES_RX_RX_INTERFACE_MODE, 0x40),
-	QMP_PHY_INIT_CFG(QSERDES_RX_SIGDET_DEGLITCH_CNTRL, 0x1E),
-	QMP_PHY_INIT_CFG(QSERDES_RX_UCDR_FASTLOCK_FO_GAIN, 0x0B),
-	QMP_PHY_INIT_CFG(QSERDES_RX_RX_TERM_BW, 0x5B),
-	QMP_PHY_INIT_CFG(QSERDES_RX_RX_EQ_GAIN1_LSB, 0xFF),
-	QMP_PHY_INIT_CFG(QSERDES_RX_RX_EQ_GAIN1_MSB, 0x3F),
-	QMP_PHY_INIT_CFG(QSERDES_RX_RX_EQ_GAIN2_LSB, 0xFF),
-	QMP_PHY_INIT_CFG(QSERDES_RX_RX_EQ_GAIN2_MSB, 0x3F),
-	QMP_PHY_INIT_CFG(QSERDES_RX_RX_EQU_ADAPTOR_CNTRL2, 0x0D),
-	QMP_PHY_INIT_CFG(QSERDES_RX_UCDR_SVS_SO_GAIN_HALF, 0x04),
-	QMP_PHY_INIT_CFG(QSERDES_RX_UCDR_SVS_SO_GAIN_QUARTER, 0x04),
-	QMP_PHY_INIT_CFG(QSERDES_RX_UCDR_SVS_SO_GAIN, 0x04),
-	QMP_PHY_INIT_CFG(QSERDES_RX_UCDR_SO_SATURATION_AND_ENABLE, 0x5B),
-};
-
-static const struct qmp_phy_init_tbl sm6115_ufsphy_pcs_tbl[] = {
-	QMP_PHY_INIT_CFG(QPHY_RX_PWM_GEAR_BAND, 0x15),
-	QMP_PHY_INIT_CFG(QPHY_RX_SIGDET_CTRL2, 0x6d),
-	QMP_PHY_INIT_CFG(QPHY_TX_LARGE_AMP_DRV_LVL, 0x0f),
-	QMP_PHY_INIT_CFG(QPHY_TX_SMALL_AMP_DRV_LVL, 0x02),
-	QMP_PHY_INIT_CFG(QPHY_RX_MIN_STALL_NOCONFIG_TIME_CAP, 0x28),
-	QMP_PHY_INIT_CFG(QPHY_RX_SYM_RESYNC_CTRL, 0x03),
-	QMP_PHY_INIT_CFG(QPHY_TX_LARGE_AMP_POST_EMP_LVL, 0x12),
-	QMP_PHY_INIT_CFG(QPHY_TX_SMALL_AMP_POST_EMP_LVL, 0x0f),
-	QMP_PHY_INIT_CFG(QPHY_RX_MIN_HIBERN8_TIME, 0x9a), /* 8 us */
-};
-
-static const struct qmp_phy_init_tbl sdm845_ufsphy_serdes_tbl[] = {
-	QMP_PHY_INIT_CFG(QSERDES_V3_COM_SYS_CLK_CTRL, 0x02),
-	QMP_PHY_INIT_CFG(QSERDES_V3_COM_BIAS_EN_CLKBUFLR_EN, 0x04),
-	QMP_PHY_INIT_CFG(QSERDES_V3_COM_BG_TIMER, 0x0a),
-	QMP_PHY_INIT_CFG(QSERDES_V3_COM_PLL_IVCO, 0x07),
-	QMP_PHY_INIT_CFG(QSERDES_V3_COM_CMN_CONFIG, 0x06),
-	QMP_PHY_INIT_CFG(QSERDES_V3_COM_SYSCLK_EN_SEL, 0xd5),
-	QMP_PHY_INIT_CFG(QSERDES_V3_COM_RESETSM_CNTRL, 0x20),
-	QMP_PHY_INIT_CFG(QSERDES_V3_COM_CLK_SELECT, 0x30),
-	QMP_PHY_INIT_CFG(QSERDES_V3_COM_HSCLK_SEL, 0x00),
-	QMP_PHY_INIT_CFG(QSERDES_V3_COM_LOCK_CMP_EN, 0x01),
-	QMP_PHY_INIT_CFG(QSERDES_V3_COM_VCO_TUNE_CTRL, 0x00),
-	QMP_PHY_INIT_CFG(QSERDES_V3_COM_CORE_CLK_EN, 0x00),
-	QMP_PHY_INIT_CFG(QSERDES_V3_COM_VCO_TUNE_MAP, 0x04),
-	QMP_PHY_INIT_CFG(QSERDES_V3_COM_SVS_MODE_CLK_SEL, 0x05),
-	QMP_PHY_INIT_CFG(QSERDES_V3_COM_VCO_TUNE_INITVAL1, 0xff),
-	QMP_PHY_INIT_CFG(QSERDES_V3_COM_VCO_TUNE_INITVAL2, 0x00),
-	QMP_PHY_INIT_CFG(QSERDES_V3_COM_DEC_START_MODE0, 0x82),
-	QMP_PHY_INIT_CFG(QSERDES_V3_COM_CP_CTRL_MODE0, 0x06),
-	QMP_PHY_INIT_CFG(QSERDES_V3_COM_PLL_RCTRL_MODE0, 0x16),
-	QMP_PHY_INIT_CFG(QSERDES_V3_COM_PLL_CCTRL_MODE0, 0x36),
-	QMP_PHY_INIT_CFG(QSERDES_V3_COM_INTEGLOOP_GAIN0_MODE0, 0x3f),
-	QMP_PHY_INIT_CFG(QSERDES_V3_COM_INTEGLOOP_GAIN1_MODE0, 0x00),
-	QMP_PHY_INIT_CFG(QSERDES_V3_COM_VCO_TUNE1_MODE0, 0xda),
-	QMP_PHY_INIT_CFG(QSERDES_V3_COM_VCO_TUNE2_MODE0, 0x01),
-	QMP_PHY_INIT_CFG(QSERDES_V3_COM_LOCK_CMP1_MODE0, 0xff),
-	QMP_PHY_INIT_CFG(QSERDES_V3_COM_LOCK_CMP2_MODE0, 0x0c),
-	QMP_PHY_INIT_CFG(QSERDES_V3_COM_DEC_START_MODE1, 0x98),
-	QMP_PHY_INIT_CFG(QSERDES_V3_COM_CP_CTRL_MODE1, 0x06),
-	QMP_PHY_INIT_CFG(QSERDES_V3_COM_PLL_RCTRL_MODE1, 0x16),
-	QMP_PHY_INIT_CFG(QSERDES_V3_COM_PLL_CCTRL_MODE1, 0x36),
-	QMP_PHY_INIT_CFG(QSERDES_V3_COM_INTEGLOOP_GAIN0_MODE1, 0x3f),
-	QMP_PHY_INIT_CFG(QSERDES_V3_COM_INTEGLOOP_GAIN1_MODE1, 0x00),
-	QMP_PHY_INIT_CFG(QSERDES_V3_COM_VCO_TUNE1_MODE1, 0xc1),
-	QMP_PHY_INIT_CFG(QSERDES_V3_COM_VCO_TUNE2_MODE1, 0x00),
-	QMP_PHY_INIT_CFG(QSERDES_V3_COM_LOCK_CMP1_MODE1, 0x32),
-	QMP_PHY_INIT_CFG(QSERDES_V3_COM_LOCK_CMP2_MODE1, 0x0f),
-
-	/* Rate B */
-	QMP_PHY_INIT_CFG(QSERDES_V3_COM_VCO_TUNE_MAP, 0x44),
-};
-
-static const struct qmp_phy_init_tbl sdm845_ufsphy_tx_tbl[] = {
-	QMP_PHY_INIT_CFG(QSERDES_V3_TX_LANE_MODE_1, 0x06),
-	QMP_PHY_INIT_CFG(QSERDES_V3_TX_RES_CODE_LANE_OFFSET_TX, 0x04),
-	QMP_PHY_INIT_CFG(QSERDES_V3_TX_RES_CODE_LANE_OFFSET_RX, 0x07),
-};
-
-static const struct qmp_phy_init_tbl sdm845_ufsphy_rx_tbl[] = {
-	QMP_PHY_INIT_CFG(QSERDES_V3_RX_SIGDET_LVL, 0x24),
-	QMP_PHY_INIT_CFG(QSERDES_V3_RX_SIGDET_CNTRL, 0x0f),
-	QMP_PHY_INIT_CFG(QSERDES_V3_RX_SIGDET_DEGLITCH_CNTRL, 0x1e),
-	QMP_PHY_INIT_CFG(QSERDES_V3_RX_RX_INTERFACE_MODE, 0x40),
-	QMP_PHY_INIT_CFG(QSERDES_V3_RX_UCDR_FASTLOCK_FO_GAIN, 0x0b),
-	QMP_PHY_INIT_CFG(QSERDES_V3_RX_RX_TERM_BW, 0x5b),
-	QMP_PHY_INIT_CFG(QSERDES_V3_RX_RX_EQU_ADAPTOR_CNTRL2, 0x06),
-	QMP_PHY_INIT_CFG(QSERDES_V3_RX_RX_EQU_ADAPTOR_CNTRL3, 0x04),
-	QMP_PHY_INIT_CFG(QSERDES_V3_RX_RX_EQU_ADAPTOR_CNTRL4, 0x1b),
-	QMP_PHY_INIT_CFG(QSERDES_V3_RX_UCDR_SVS_SO_GAIN_HALF, 0x04),
-	QMP_PHY_INIT_CFG(QSERDES_V3_RX_UCDR_SVS_SO_GAIN_QUARTER, 0x04),
-	QMP_PHY_INIT_CFG(QSERDES_V3_RX_UCDR_SVS_SO_GAIN, 0x04),
-	QMP_PHY_INIT_CFG(QSERDES_V3_RX_UCDR_SO_SATURATION_AND_ENABLE, 0x4b),
-	QMP_PHY_INIT_CFG(QSERDES_V3_RX_UCDR_PI_CONTROLS, 0x81),
-	QMP_PHY_INIT_CFG(QSERDES_V3_RX_UCDR_FASTLOCK_COUNT_LOW, 0x80),
-	QMP_PHY_INIT_CFG(QSERDES_V3_RX_RX_MODE_00, 0x59),
-};
-
-static const struct qmp_phy_init_tbl sdm845_ufsphy_pcs_tbl[] = {
-	QMP_PHY_INIT_CFG(QPHY_V3_PCS_RX_SIGDET_CTRL2, 0x6e),
-	QMP_PHY_INIT_CFG(QPHY_V3_PCS_TX_LARGE_AMP_DRV_LVL, 0x0a),
-	QMP_PHY_INIT_CFG(QPHY_V3_PCS_TX_SMALL_AMP_DRV_LVL, 0x02),
-	QMP_PHY_INIT_CFG(QPHY_V3_PCS_RX_SYM_RESYNC_CTRL, 0x03),
-	QMP_PHY_INIT_CFG(QPHY_V3_PCS_TX_MID_TERM_CTRL1, 0x43),
-	QMP_PHY_INIT_CFG(QPHY_V3_PCS_RX_SIGDET_CTRL1, 0x0f),
-	QMP_PHY_INIT_CFG(QPHY_V3_PCS_RX_MIN_HIBERN8_TIME, 0x9a),
-	QMP_PHY_INIT_CFG(QPHY_V3_PCS_MULTI_LANE_CTRL1, 0x02),
-};
-
 static const struct qmp_phy_init_tbl msm8998_usb3_serdes_tbl[] = {
 	QMP_PHY_INIT_CFG(QSERDES_V3_COM_CLK_SELECT, 0x30),
 	QMP_PHY_INIT_CFG(QSERDES_V3_COM_BIAS_EN_CLKBUFLR_EN, 0x04),
@@ -1478,93 +1176,6 @@ static const struct qmp_phy_init_tbl msm8998_usb3_pcs_tbl[] = {
 	QMP_PHY_INIT_CFG(QPHY_V3_PCS_RXEQTRAINING_RUN_TIME, 0x13),
 };
 
-static const struct qmp_phy_init_tbl sm8150_ufsphy_serdes_tbl[] = {
-	QMP_PHY_INIT_CFG(QSERDES_V4_COM_SYSCLK_EN_SEL, 0xd9),
-	QMP_PHY_INIT_CFG(QSERDES_V4_COM_HSCLK_SEL, 0x11),
-	QMP_PHY_INIT_CFG(QSERDES_V4_COM_HSCLK_HS_SWITCH_SEL, 0x00),
-	QMP_PHY_INIT_CFG(QSERDES_V4_COM_LOCK_CMP_EN, 0x01),
-	QMP_PHY_INIT_CFG(QSERDES_V4_COM_VCO_TUNE_MAP, 0x02),
-	QMP_PHY_INIT_CFG(QSERDES_V4_COM_PLL_IVCO, 0x0f),
-	QMP_PHY_INIT_CFG(QSERDES_V4_COM_VCO_TUNE_INITVAL2, 0x00),
-	QMP_PHY_INIT_CFG(QSERDES_V4_COM_BIN_VCOCAL_HSCLK_SEL, 0x11),
-	QMP_PHY_INIT_CFG(QSERDES_V4_COM_DEC_START_MODE0, 0x82),
-	QMP_PHY_INIT_CFG(QSERDES_V4_COM_CP_CTRL_MODE0, 0x06),
-	QMP_PHY_INIT_CFG(QSERDES_V4_COM_PLL_RCTRL_MODE0, 0x16),
-	QMP_PHY_INIT_CFG(QSERDES_V4_COM_PLL_CCTRL_MODE0, 0x36),
-	QMP_PHY_INIT_CFG(QSERDES_V4_COM_LOCK_CMP1_MODE0, 0xff),
-	QMP_PHY_INIT_CFG(QSERDES_V4_COM_LOCK_CMP2_MODE0, 0x0c),
-	QMP_PHY_INIT_CFG(QSERDES_V4_COM_BIN_VCOCAL_CMP_CODE1_MODE0, 0xac),
-	QMP_PHY_INIT_CFG(QSERDES_V4_COM_BIN_VCOCAL_CMP_CODE2_MODE0, 0x1e),
-	QMP_PHY_INIT_CFG(QSERDES_V4_COM_DEC_START_MODE1, 0x98),
-	QMP_PHY_INIT_CFG(QSERDES_V4_COM_CP_CTRL_MODE1, 0x06),
-	QMP_PHY_INIT_CFG(QSERDES_V4_COM_PLL_RCTRL_MODE1, 0x16),
-	QMP_PHY_INIT_CFG(QSERDES_V4_COM_PLL_CCTRL_MODE1, 0x36),
-	QMP_PHY_INIT_CFG(QSERDES_V4_COM_LOCK_CMP1_MODE1, 0x32),
-	QMP_PHY_INIT_CFG(QSERDES_V4_COM_LOCK_CMP2_MODE1, 0x0f),
-	QMP_PHY_INIT_CFG(QSERDES_V4_COM_BIN_VCOCAL_CMP_CODE1_MODE1, 0xdd),
-	QMP_PHY_INIT_CFG(QSERDES_V4_COM_BIN_VCOCAL_CMP_CODE2_MODE1, 0x23),
-
-	/* Rate B */
-	QMP_PHY_INIT_CFG(QSERDES_V4_COM_VCO_TUNE_MAP, 0x06),
-};
-
-static const struct qmp_phy_init_tbl sm8150_ufsphy_tx_tbl[] = {
-	QMP_PHY_INIT_CFG(QSERDES_V4_TX_PWM_GEAR_1_DIVIDER_BAND0_1, 0x06),
-	QMP_PHY_INIT_CFG(QSERDES_V4_TX_PWM_GEAR_2_DIVIDER_BAND0_1, 0x03),
-	QMP_PHY_INIT_CFG(QSERDES_V4_TX_PWM_GEAR_3_DIVIDER_BAND0_1, 0x01),
-	QMP_PHY_INIT_CFG(QSERDES_V4_TX_PWM_GEAR_4_DIVIDER_BAND0_1, 0x00),
-	QMP_PHY_INIT_CFG(QSERDES_V4_TX_LANE_MODE_1, 0x05),
-	QMP_PHY_INIT_CFG(QSERDES_V4_TX_TRAN_DRVR_EMP_EN, 0x0c),
-};
-
-static const struct qmp_phy_init_tbl sm8150_ufsphy_rx_tbl[] = {
-	QMP_PHY_INIT_CFG(QSERDES_V4_RX_SIGDET_LVL, 0x24),
-	QMP_PHY_INIT_CFG(QSERDES_V4_RX_SIGDET_CNTRL, 0x0f),
-	QMP_PHY_INIT_CFG(QSERDES_V4_RX_SIGDET_DEGLITCH_CNTRL, 0x1e),
-	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_BAND, 0x18),
-	QMP_PHY_INIT_CFG(QSERDES_V4_RX_UCDR_FASTLOCK_FO_GAIN, 0x0a),
-	QMP_PHY_INIT_CFG(QSERDES_V4_RX_UCDR_SO_SATURATION_AND_ENABLE, 0x4b),
-	QMP_PHY_INIT_CFG(QSERDES_V4_RX_UCDR_PI_CONTROLS, 0xf1),
-	QMP_PHY_INIT_CFG(QSERDES_V4_RX_UCDR_FASTLOCK_COUNT_LOW, 0x80),
-	QMP_PHY_INIT_CFG(QSERDES_V4_RX_UCDR_PI_CTRL2, 0x80),
-	QMP_PHY_INIT_CFG(QSERDES_V4_RX_UCDR_FO_GAIN, 0x0c),
-	QMP_PHY_INIT_CFG(QSERDES_V4_RX_UCDR_SO_GAIN, 0x04),
-	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_TERM_BW, 0x1b),
-	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_EQU_ADAPTOR_CNTRL2, 0x06),
-	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_EQU_ADAPTOR_CNTRL3, 0x04),
-	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_EQU_ADAPTOR_CNTRL4, 0x1d),
-	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_OFFSET_ADAPTOR_CNTRL2, 0x00),
-	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_IDAC_MEASURE_TIME, 0x10),
-	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_IDAC_TSETTLE_LOW, 0xc0),
-	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_IDAC_TSETTLE_HIGH, 0x00),
-	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_MODE_00_LOW, 0x36),
-	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_MODE_00_HIGH, 0x36),
-	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_MODE_00_HIGH2, 0xf6),
-	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_MODE_00_HIGH3, 0x3b),
-	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_MODE_00_HIGH4, 0x3d),
-	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_MODE_01_LOW, 0xe0),
-	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_MODE_01_HIGH, 0xc8),
-	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_MODE_01_HIGH2, 0xc8),
-	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_MODE_01_HIGH3, 0x3b),
-	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_MODE_01_HIGH4, 0xb1),
-	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_MODE_10_LOW, 0xe0),
-	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_MODE_10_HIGH, 0xc8),
-	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_MODE_10_HIGH2, 0xc8),
-	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_MODE_10_HIGH3, 0x3b),
-	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_MODE_10_HIGH4, 0xb1),
-
-};
-
-static const struct qmp_phy_init_tbl sm8150_ufsphy_pcs_tbl[] = {
-	QMP_PHY_INIT_CFG(QPHY_V4_PCS_UFS_RX_SIGDET_CTRL2, 0x6d),
-	QMP_PHY_INIT_CFG(QPHY_V4_PCS_UFS_TX_LARGE_AMP_DRV_LVL, 0x0a),
-	QMP_PHY_INIT_CFG(QPHY_V4_PCS_UFS_TX_SMALL_AMP_DRV_LVL, 0x02),
-	QMP_PHY_INIT_CFG(QPHY_V4_PCS_UFS_TX_MID_TERM_CTRL1, 0x43),
-	QMP_PHY_INIT_CFG(QPHY_V4_PCS_UFS_DEBUG_BUS_CLKSEL, 0x1f),
-	QMP_PHY_INIT_CFG(QPHY_V4_PCS_UFS_RX_MIN_HIBERN8_TIME, 0xff),
-	QMP_PHY_INIT_CFG(QPHY_V4_PCS_UFS_MULTI_LANE_CTRL1, 0x02),
-};
-
 static const struct qmp_phy_init_tbl sm8150_usb3_serdes_tbl[] = {
 	QMP_PHY_INIT_CFG(QSERDES_V4_COM_SSC_EN_CENTER, 0x01),
 	QMP_PHY_INIT_CFG(QSERDES_V4_COM_SSC_PER1, 0x31),
@@ -2353,106 +1964,6 @@ static const struct qmp_phy_init_tbl sdx65_usb3_uniphy_rx_tbl[] = {
 	QMP_PHY_INIT_CFG(QSERDES_V5_RX_SIGDET_ENABLES, 0x00),
 };
 
-static const struct qmp_phy_init_tbl sm8350_ufsphy_serdes_tbl[] = {
-	QMP_PHY_INIT_CFG(QSERDES_V5_COM_SYSCLK_EN_SEL, 0xd9),
-	QMP_PHY_INIT_CFG(QSERDES_V5_COM_HSCLK_SEL, 0x11),
-	QMP_PHY_INIT_CFG(QSERDES_V5_COM_HSCLK_HS_SWITCH_SEL, 0x00),
-	QMP_PHY_INIT_CFG(QSERDES_V5_COM_LOCK_CMP_EN, 0x42),
-	QMP_PHY_INIT_CFG(QSERDES_V5_COM_VCO_TUNE_MAP, 0x02),
-	QMP_PHY_INIT_CFG(QSERDES_V5_COM_PLL_IVCO, 0x0f),
-	QMP_PHY_INIT_CFG(QSERDES_V5_COM_VCO_TUNE_INITVAL2, 0x00),
-	QMP_PHY_INIT_CFG(QSERDES_V5_COM_BIN_VCOCAL_HSCLK_SEL, 0x11),
-	QMP_PHY_INIT_CFG(QSERDES_V5_COM_DEC_START_MODE0, 0x82),
-	QMP_PHY_INIT_CFG(QSERDES_V5_COM_CP_CTRL_MODE0, 0x14),
-	QMP_PHY_INIT_CFG(QSERDES_V5_COM_PLL_RCTRL_MODE0, 0x18),
-	QMP_PHY_INIT_CFG(QSERDES_V5_COM_PLL_CCTRL_MODE0, 0x18),
-	QMP_PHY_INIT_CFG(QSERDES_V5_COM_LOCK_CMP1_MODE0, 0xff),
-	QMP_PHY_INIT_CFG(QSERDES_V5_COM_LOCK_CMP2_MODE0, 0x19),
-	QMP_PHY_INIT_CFG(QSERDES_V5_COM_BIN_VCOCAL_CMP_CODE1_MODE0, 0xac),
-	QMP_PHY_INIT_CFG(QSERDES_V5_COM_BIN_VCOCAL_CMP_CODE2_MODE0, 0x1e),
-	QMP_PHY_INIT_CFG(QSERDES_V5_COM_DEC_START_MODE1, 0x98),
-	QMP_PHY_INIT_CFG(QSERDES_V5_COM_CP_CTRL_MODE1, 0x14),
-	QMP_PHY_INIT_CFG(QSERDES_V5_COM_PLL_RCTRL_MODE1, 0x18),
-	QMP_PHY_INIT_CFG(QSERDES_V5_COM_PLL_CCTRL_MODE1, 0x18),
-	QMP_PHY_INIT_CFG(QSERDES_V5_COM_LOCK_CMP1_MODE1, 0x65),
-	QMP_PHY_INIT_CFG(QSERDES_V5_COM_LOCK_CMP2_MODE1, 0x1e),
-	QMP_PHY_INIT_CFG(QSERDES_V5_COM_BIN_VCOCAL_CMP_CODE1_MODE1, 0xdd),
-	QMP_PHY_INIT_CFG(QSERDES_V5_COM_BIN_VCOCAL_CMP_CODE2_MODE1, 0x23),
-
-	/* Rate B */
-	QMP_PHY_INIT_CFG(QSERDES_V5_COM_VCO_TUNE_MAP, 0x06),
-};
-
-static const struct qmp_phy_init_tbl sm8350_ufsphy_tx_tbl[] = {
-	QMP_PHY_INIT_CFG(QSERDES_V5_TX_PWM_GEAR_1_DIVIDER_BAND0_1, 0x06),
-	QMP_PHY_INIT_CFG(QSERDES_V5_TX_PWM_GEAR_2_DIVIDER_BAND0_1, 0x03),
-	QMP_PHY_INIT_CFG(QSERDES_V5_TX_PWM_GEAR_3_DIVIDER_BAND0_1, 0x01),
-	QMP_PHY_INIT_CFG(QSERDES_V5_TX_PWM_GEAR_4_DIVIDER_BAND0_1, 0x00),
-	QMP_PHY_INIT_CFG(QSERDES_V5_TX_LANE_MODE_1, 0xf5),
-	QMP_PHY_INIT_CFG(QSERDES_V5_TX_LANE_MODE_3, 0x3f),
-	QMP_PHY_INIT_CFG(QSERDES_V5_TX_RES_CODE_LANE_OFFSET_TX, 0x09),
-	QMP_PHY_INIT_CFG(QSERDES_V5_TX_RES_CODE_LANE_OFFSET_RX, 0x09),
-	QMP_PHY_INIT_CFG(QSERDES_V5_TX_TRAN_DRVR_EMP_EN, 0x0c),
-};
-
-static const struct qmp_phy_init_tbl sm8350_ufsphy_rx_tbl[] = {
-	QMP_PHY_INIT_CFG(QSERDES_V5_RX_SIGDET_LVL, 0x24),
-	QMP_PHY_INIT_CFG(QSERDES_V5_RX_SIGDET_CNTRL, 0x0f),
-	QMP_PHY_INIT_CFG(QSERDES_V5_RX_SIGDET_DEGLITCH_CNTRL, 0x1e),
-	QMP_PHY_INIT_CFG(QSERDES_V5_RX_RX_BAND, 0x18),
-	QMP_PHY_INIT_CFG(QSERDES_V5_RX_UCDR_FASTLOCK_FO_GAIN, 0x0a),
-	QMP_PHY_INIT_CFG(QSERDES_V5_RX_UCDR_SO_SATURATION_AND_ENABLE, 0x5a),
-	QMP_PHY_INIT_CFG(QSERDES_V5_RX_UCDR_PI_CONTROLS, 0xf1),
-	QMP_PHY_INIT_CFG(QSERDES_V5_RX_UCDR_FASTLOCK_COUNT_LOW, 0x80),
-	QMP_PHY_INIT_CFG(QSERDES_V5_RX_UCDR_PI_CTRL2, 0x80),
-	QMP_PHY_INIT_CFG(QSERDES_V5_RX_UCDR_FO_GAIN, 0x0e),
-	QMP_PHY_INIT_CFG(QSERDES_V5_RX_UCDR_SO_GAIN, 0x04),
-	QMP_PHY_INIT_CFG(QSERDES_V5_RX_RX_TERM_BW, 0x1b),
-	QMP_PHY_INIT_CFG(QSERDES_V5_RX_RX_EQU_ADAPTOR_CNTRL1, 0x04),
-	QMP_PHY_INIT_CFG(QSERDES_V5_RX_RX_EQU_ADAPTOR_CNTRL2, 0x06),
-	QMP_PHY_INIT_CFG(QSERDES_V5_RX_RX_EQU_ADAPTOR_CNTRL3, 0x04),
-	QMP_PHY_INIT_CFG(QSERDES_V5_RX_RX_EQU_ADAPTOR_CNTRL4, 0x1a),
-	QMP_PHY_INIT_CFG(QSERDES_V5_RX_RX_EQ_OFFSET_ADAPTOR_CNTRL1, 0x17),
-	QMP_PHY_INIT_CFG(QSERDES_V5_RX_RX_OFFSET_ADAPTOR_CNTRL2, 0x00),
-	QMP_PHY_INIT_CFG(QSERDES_V5_RX_RX_IDAC_MEASURE_TIME, 0x10),
-	QMP_PHY_INIT_CFG(QSERDES_V5_RX_RX_IDAC_TSETTLE_LOW, 0xc0),
-	QMP_PHY_INIT_CFG(QSERDES_V5_RX_RX_IDAC_TSETTLE_HIGH, 0x00),
-	QMP_PHY_INIT_CFG(QSERDES_V5_RX_RX_MODE_00_LOW, 0x6d),
-	QMP_PHY_INIT_CFG(QSERDES_V5_RX_RX_MODE_00_HIGH, 0x6d),
-	QMP_PHY_INIT_CFG(QSERDES_V5_RX_RX_MODE_00_HIGH2, 0xed),
-	QMP_PHY_INIT_CFG(QSERDES_V5_RX_RX_MODE_00_HIGH3, 0x3b),
-	QMP_PHY_INIT_CFG(QSERDES_V5_RX_RX_MODE_00_HIGH4, 0x3c),
-	QMP_PHY_INIT_CFG(QSERDES_V5_RX_RX_MODE_01_LOW, 0xe0),
-	QMP_PHY_INIT_CFG(QSERDES_V5_RX_RX_MODE_01_HIGH, 0xc8),
-	QMP_PHY_INIT_CFG(QSERDES_V5_RX_RX_MODE_01_HIGH2, 0xc8),
-	QMP_PHY_INIT_CFG(QSERDES_V5_RX_RX_MODE_01_HIGH3, 0x3b),
-	QMP_PHY_INIT_CFG(QSERDES_V5_RX_RX_MODE_01_HIGH4, 0xb7),
-	QMP_PHY_INIT_CFG(QSERDES_V5_RX_RX_MODE_10_LOW, 0xe0),
-	QMP_PHY_INIT_CFG(QSERDES_V5_RX_RX_MODE_10_HIGH, 0xc8),
-	QMP_PHY_INIT_CFG(QSERDES_V5_RX_RX_MODE_10_HIGH2, 0xc8),
-	QMP_PHY_INIT_CFG(QSERDES_V5_RX_RX_MODE_10_HIGH3, 0x3b),
-	QMP_PHY_INIT_CFG(QSERDES_V5_RX_RX_MODE_10_HIGH4, 0xb7),
-	QMP_PHY_INIT_CFG(QSERDES_V5_RX_DCC_CTRL1, 0x0c),
-};
-
-static const struct qmp_phy_init_tbl sm8350_ufsphy_pcs_tbl[] = {
-	QMP_PHY_INIT_CFG(QPHY_V5_PCS_UFS_RX_SIGDET_CTRL2, 0x6d),
-	QMP_PHY_INIT_CFG(QPHY_V5_PCS_UFS_TX_LARGE_AMP_DRV_LVL, 0x0a),
-	QMP_PHY_INIT_CFG(QPHY_V5_PCS_UFS_TX_SMALL_AMP_DRV_LVL, 0x02),
-	QMP_PHY_INIT_CFG(QPHY_V5_PCS_UFS_TX_MID_TERM_CTRL1, 0x43),
-	QMP_PHY_INIT_CFG(QPHY_V5_PCS_UFS_DEBUG_BUS_CLKSEL, 0x1f),
-	QMP_PHY_INIT_CFG(QPHY_V5_PCS_UFS_RX_MIN_HIBERN8_TIME, 0xff),
-	QMP_PHY_INIT_CFG(QPHY_V5_PCS_UFS_PLL_CNTL, 0x03),
-	QMP_PHY_INIT_CFG(QPHY_V5_PCS_UFS_TIMER_20US_CORECLK_STEPS_MSB, 0x16),
-	QMP_PHY_INIT_CFG(QPHY_V5_PCS_UFS_TIMER_20US_CORECLK_STEPS_LSB, 0xd8),
-	QMP_PHY_INIT_CFG(QPHY_V5_PCS_UFS_TX_PWM_GEAR_BAND, 0xaa),
-	QMP_PHY_INIT_CFG(QPHY_V5_PCS_UFS_TX_HS_GEAR_BAND, 0x06),
-	QMP_PHY_INIT_CFG(QPHY_V5_PCS_UFS_TX_HSGEAR_CAPABILITY, 0x03),
-	QMP_PHY_INIT_CFG(QPHY_V5_PCS_UFS_RX_HSGEAR_CAPABILITY, 0x03),
-	QMP_PHY_INIT_CFG(QPHY_V5_PCS_UFS_RX_SIGDET_CTRL1, 0x0e),
-	QMP_PHY_INIT_CFG(QPHY_V5_PCS_UFS_MULTI_LANE_CTRL1, 0x02),
-};
-
 static const struct qmp_phy_init_tbl sm8350_usb3_tx_tbl[] = {
 	QMP_PHY_INIT_CFG(QSERDES_V5_TX_RES_CODE_LANE_TX, 0x00),
 	QMP_PHY_INIT_CFG(QSERDES_V5_TX_RES_CODE_LANE_RX, 0x00),
@@ -2922,10 +2433,6 @@ static const char * const msm8996_phy_clk_l[] = {
 	"aux", "cfg_ahb", "ref",
 };
 
-static const char * const msm8996_ufs_phy_clk_l[] = {
-	"ref",
-};
-
 static const char * const qmp_v3_phy_clk_l[] = {
 	"aux", "cfg_ahb", "ref", "com_aux",
 };
@@ -2943,14 +2450,6 @@ static const char * const qmp_v4_sm8250_usbphy_clk_l[] = {
 	"aux", "ref_clk_src", "com_aux"
 };
 
-static const char * const sm8450_ufs_phy_clk_l[] = {
-	"qref", "ref", "ref_aux",
-};
-
-static const char * const sdm845_ufs_phy_clk_l[] = {
-	"ref", "ref_aux",
-};
-
 /* usb3 phy on sdx55 doesn't have com_aux clock */
 static const char * const qmp_v4_sdx55_usbphy_clk_l[] = {
 	"aux", "cfg_ahb", "ref"
@@ -3043,32 +2542,6 @@ static const struct qmp_phy_cfg msm8996_pciephy_cfg = {
 	.pwrdn_delay_max	= POWER_DOWN_DELAY_US_MAX,
 };
 
-static const struct qmp_phy_cfg msm8996_ufs_cfg = {
-	.type			= PHY_TYPE_UFS,
-	.nlanes			= 1,
-
-	.serdes_tbl		= msm8996_ufs_serdes_tbl,
-	.serdes_tbl_num		= ARRAY_SIZE(msm8996_ufs_serdes_tbl),
-	.tx_tbl			= msm8996_ufs_tx_tbl,
-	.tx_tbl_num		= ARRAY_SIZE(msm8996_ufs_tx_tbl),
-	.rx_tbl			= msm8996_ufs_rx_tbl,
-	.rx_tbl_num		= ARRAY_SIZE(msm8996_ufs_rx_tbl),
-
-	.clk_list		= msm8996_ufs_phy_clk_l,
-	.num_clks		= ARRAY_SIZE(msm8996_ufs_phy_clk_l),
-
-	.vreg_list		= qmp_phy_vreg_l,
-	.num_vregs		= ARRAY_SIZE(qmp_phy_vreg_l),
-
-	.regs			= msm8996_ufsphy_regs_layout,
-
-	.start_ctrl		= SERDES_START,
-	.pwrdn_ctrl		= SW_PWRDN,
-	.phy_status		= PHYSTATUS,
-
-	.no_pcs_sw_reset	= true,
-};
-
 static const struct qmp_phy_cfg msm8996_usb3phy_cfg = {
 	.type			= PHY_TYPE_USB3,
 	.nlanes			= 1,
@@ -3396,57 +2869,6 @@ static const struct qmp_phy_cfg qmp_v3_usb3_uniphy_cfg = {
 	.pwrdn_delay_max	= POWER_DOWN_DELAY_US_MAX,
 };
 
-static const struct qmp_phy_cfg sdm845_ufsphy_cfg = {
-	.type			= PHY_TYPE_UFS,
-	.nlanes			= 2,
-
-	.serdes_tbl		= sdm845_ufsphy_serdes_tbl,
-	.serdes_tbl_num		= ARRAY_SIZE(sdm845_ufsphy_serdes_tbl),
-	.tx_tbl			= sdm845_ufsphy_tx_tbl,
-	.tx_tbl_num		= ARRAY_SIZE(sdm845_ufsphy_tx_tbl),
-	.rx_tbl			= sdm845_ufsphy_rx_tbl,
-	.rx_tbl_num		= ARRAY_SIZE(sdm845_ufsphy_rx_tbl),
-	.pcs_tbl		= sdm845_ufsphy_pcs_tbl,
-	.pcs_tbl_num		= ARRAY_SIZE(sdm845_ufsphy_pcs_tbl),
-	.clk_list		= sdm845_ufs_phy_clk_l,
-	.num_clks		= ARRAY_SIZE(sdm845_ufs_phy_clk_l),
-	.vreg_list		= qmp_phy_vreg_l,
-	.num_vregs		= ARRAY_SIZE(qmp_phy_vreg_l),
-	.regs			= sdm845_ufsphy_regs_layout,
-
-	.start_ctrl		= SERDES_START,
-	.pwrdn_ctrl		= SW_PWRDN,
-	.phy_status		= PHYSTATUS,
-
-	.is_dual_lane_phy	= true,
-	.no_pcs_sw_reset	= true,
-};
-
-static const struct qmp_phy_cfg sm6115_ufsphy_cfg = {
-	.type			= PHY_TYPE_UFS,
-	.nlanes			= 1,
-
-	.serdes_tbl		= sm6115_ufsphy_serdes_tbl,
-	.serdes_tbl_num		= ARRAY_SIZE(sm6115_ufsphy_serdes_tbl),
-	.tx_tbl			= sm6115_ufsphy_tx_tbl,
-	.tx_tbl_num		= ARRAY_SIZE(sm6115_ufsphy_tx_tbl),
-	.rx_tbl			= sm6115_ufsphy_rx_tbl,
-	.rx_tbl_num		= ARRAY_SIZE(sm6115_ufsphy_rx_tbl),
-	.pcs_tbl		= sm6115_ufsphy_pcs_tbl,
-	.pcs_tbl_num		= ARRAY_SIZE(sm6115_ufsphy_pcs_tbl),
-	.clk_list		= sdm845_ufs_phy_clk_l,
-	.num_clks		= ARRAY_SIZE(sdm845_ufs_phy_clk_l),
-	.vreg_list		= qmp_phy_vreg_l,
-	.num_vregs		= ARRAY_SIZE(qmp_phy_vreg_l),
-	.regs			= sm6115_ufsphy_regs_layout,
-
-	.start_ctrl		= SERDES_START,
-	.pwrdn_ctrl		= SW_PWRDN,
-
-	.is_dual_lane_phy	= false,
-	.no_pcs_sw_reset	= true,
-};
-
 static const struct qmp_phy_cfg msm8998_pciephy_cfg = {
 	.type			= PHY_TYPE_PCIE,
 	.nlanes			= 1,
@@ -3499,31 +2921,6 @@ static const struct qmp_phy_cfg msm8998_usb3phy_cfg = {
 	.is_dual_lane_phy       = true,
 };
 
-static const struct qmp_phy_cfg sm8150_ufsphy_cfg = {
-	.type			= PHY_TYPE_UFS,
-	.nlanes			= 2,
-
-	.serdes_tbl		= sm8150_ufsphy_serdes_tbl,
-	.serdes_tbl_num		= ARRAY_SIZE(sm8150_ufsphy_serdes_tbl),
-	.tx_tbl			= sm8150_ufsphy_tx_tbl,
-	.tx_tbl_num		= ARRAY_SIZE(sm8150_ufsphy_tx_tbl),
-	.rx_tbl			= sm8150_ufsphy_rx_tbl,
-	.rx_tbl_num		= ARRAY_SIZE(sm8150_ufsphy_rx_tbl),
-	.pcs_tbl		= sm8150_ufsphy_pcs_tbl,
-	.pcs_tbl_num		= ARRAY_SIZE(sm8150_ufsphy_pcs_tbl),
-	.clk_list		= sdm845_ufs_phy_clk_l,
-	.num_clks		= ARRAY_SIZE(sdm845_ufs_phy_clk_l),
-	.vreg_list		= qmp_phy_vreg_l,
-	.num_vregs		= ARRAY_SIZE(qmp_phy_vreg_l),
-	.regs			= sm8150_ufsphy_regs_layout,
-
-	.start_ctrl		= SERDES_START,
-	.pwrdn_ctrl		= SW_PWRDN,
-	.phy_status		= PHYSTATUS,
-
-	.is_dual_lane_phy	= true,
-};
-
 const struct qmp_phy_cfg sm8150_usb3phy_cfg = {
 	.type			= PHY_TYPE_USB3,
 	.nlanes			= 1,
@@ -3769,31 +3166,6 @@ static const struct qmp_phy_cfg sdx65_usb3_uniphy_cfg = {
 	.pwrdn_delay_max	= POWER_DOWN_DELAY_US_MAX,
 };
 
-static const struct qmp_phy_cfg sm8350_ufsphy_cfg = {
-	.type			= PHY_TYPE_UFS,
-	.nlanes			= 2,
-
-	.serdes_tbl		= sm8350_ufsphy_serdes_tbl,
-	.serdes_tbl_num		= ARRAY_SIZE(sm8350_ufsphy_serdes_tbl),
-	.tx_tbl			= sm8350_ufsphy_tx_tbl,
-	.tx_tbl_num		= ARRAY_SIZE(sm8350_ufsphy_tx_tbl),
-	.rx_tbl			= sm8350_ufsphy_rx_tbl,
-	.rx_tbl_num		= ARRAY_SIZE(sm8350_ufsphy_rx_tbl),
-	.pcs_tbl		= sm8350_ufsphy_pcs_tbl,
-	.pcs_tbl_num		= ARRAY_SIZE(sm8350_ufsphy_pcs_tbl),
-	.clk_list		= sdm845_ufs_phy_clk_l,
-	.num_clks		= ARRAY_SIZE(sdm845_ufs_phy_clk_l),
-	.vreg_list		= qmp_phy_vreg_l,
-	.num_vregs		= ARRAY_SIZE(qmp_phy_vreg_l),
-	.regs			= sm8150_ufsphy_regs_layout,
-
-	.start_ctrl		= SERDES_START,
-	.pwrdn_ctrl		= SW_PWRDN,
-	.phy_status		= PHYSTATUS,
-
-	.is_dual_lane_phy	= true,
-};
-
 static const struct qmp_phy_cfg sm8350_usb3phy_cfg = {
 	.type			= PHY_TYPE_USB3,
 	.nlanes			= 1,
@@ -3855,31 +3227,6 @@ static const struct qmp_phy_cfg sm8350_usb3_uniphy_cfg = {
 	.pwrdn_delay_max	= POWER_DOWN_DELAY_US_MAX,
 };
 
-static const struct qmp_phy_cfg sm8450_ufsphy_cfg = {
-	.type			= PHY_TYPE_UFS,
-	.nlanes			= 2,
-
-	.serdes_tbl		= sm8350_ufsphy_serdes_tbl,
-	.serdes_tbl_num		= ARRAY_SIZE(sm8350_ufsphy_serdes_tbl),
-	.tx_tbl			= sm8350_ufsphy_tx_tbl,
-	.tx_tbl_num		= ARRAY_SIZE(sm8350_ufsphy_tx_tbl),
-	.rx_tbl			= sm8350_ufsphy_rx_tbl,
-	.rx_tbl_num		= ARRAY_SIZE(sm8350_ufsphy_rx_tbl),
-	.pcs_tbl		= sm8350_ufsphy_pcs_tbl,
-	.pcs_tbl_num		= ARRAY_SIZE(sm8350_ufsphy_pcs_tbl),
-	.clk_list		= sm8450_ufs_phy_clk_l,
-	.num_clks		= ARRAY_SIZE(sm8450_ufs_phy_clk_l),
-	.vreg_list		= qmp_phy_vreg_l,
-	.num_vregs		= ARRAY_SIZE(qmp_phy_vreg_l),
-	.regs			= sm8150_ufsphy_regs_layout,
-
-	.start_ctrl		= SERDES_START,
-	.pwrdn_ctrl		= SW_PWRDN,
-	.phy_status		= PHYSTATUS,
-
-	.is_dual_lane_phy	= true,
-};
-
 static const struct qmp_phy_cfg sm8450_qmp_gen3x1_pciephy_cfg = {
 	.type = PHY_TYPE_PCIE,
 	.nlanes = 1,
@@ -4110,6 +3457,42 @@ int qcom_qmp_phy_com_init(struct qmp_phy *qphy)
 }
 EXPORT_SYMBOL_GPL(qcom_qmp_phy_com_init);
 
+int qcom_qmp_phy_com_power_on(struct qmp_phy *qphy)
+{
+	struct qcom_qmp *qmp = qphy->qmp;
+	const struct qmp_phy_cfg *cfg = qphy->cfg;
+	void __iomem *pcs = qphy->pcs;
+	void __iomem *status;
+	unsigned int mask, val, ready;
+	int ret;
+
+	/* Pull PHY out of reset state */
+	if (!cfg->no_pcs_sw_reset)
+		qphy_clrbits(pcs, cfg->regs[QPHY_SW_RESET], SW_RESET);
+	/* start SerDes and Phy-Coding-Sublayer */
+	qphy_setbits(pcs, cfg->regs[QPHY_START_CTRL], cfg->start_ctrl);
+
+	if (cfg->type == PHY_TYPE_UFS) {
+		status = pcs + cfg->regs[QPHY_PCS_READY_STATUS];
+		mask = PCS_READY;
+		ready = PCS_READY;
+	} else {
+		status = pcs + cfg->regs[QPHY_PCS_STATUS];
+		mask = cfg->phy_status;
+		ready = 0;
+	}
+
+	ret = readl_poll_timeout(status, val, (val & mask) == ready, 10,
+				 PHY_INIT_COMPLETE_TIMEOUT);
+	if (ret) {
+		dev_err(qmp->dev, "phy initialization timed-out\n");
+		return ret;
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(qcom_qmp_phy_com_power_on);
+
 int qcom_qmp_phy_com_exit(struct qmp_phy *qphy)
 {
 	struct qcom_qmp *qmp = qphy->qmp;
@@ -4123,7 +3506,6 @@ int qcom_qmp_phy_com_exit(struct qmp_phy *qphy)
 		return 0;
 	}
 
-	reset_control_assert(qmp->ufs_reset);
 	if (cfg->has_phy_com_ctrl) {
 		qphy_setbits(serdes, cfg->regs[QPHY_COM_START_CONTROL],
 			     SERDES_START | PCS_START);
@@ -4150,42 +3532,10 @@ static int qcom_qmp_phy_init(struct phy *phy)
 {
 	struct qmp_phy *qphy = phy_get_drvdata(phy);
 	struct qcom_qmp *qmp = qphy->qmp;
-	const struct qmp_phy_cfg *cfg = qphy->cfg;
-	int ret;
-	dev_vdbg(qmp->dev, "Initializing QMP phy\n");
 
-	if (cfg->no_pcs_sw_reset) {
-		/*
-		 * Get UFS reset, which is delayed until now to avoid a
-		 * circular dependency where UFS needs its PHY, but the PHY
-		 * needs this UFS reset.
-		 */
-		if (!qmp->ufs_reset) {
-			qmp->ufs_reset =
-				devm_reset_control_get_exclusive(qmp->dev,
-								 "ufsphy");
-
-			if (IS_ERR(qmp->ufs_reset)) {
-				ret = PTR_ERR(qmp->ufs_reset);
-				dev_err(qmp->dev,
-					"failed to get UFS reset: %d\n",
-					ret);
-
-				qmp->ufs_reset = NULL;
-				return ret;
-			}
-		}
-
-		ret = reset_control_assert(qmp->ufs_reset);
-		if (ret)
-			return ret;
-	}
-
-	ret = qcom_qmp_phy_com_init(qphy);
-	if (ret)
-		return ret;
+	dev_vdbg(qmp->dev, "Initializing QMP phy\n");
 
-	return 0;
+	return qcom_qmp_phy_com_init(qphy);
 }
 
 void qcom_qmp_phy_lanes_init(struct phy *phy)
@@ -4230,6 +3580,19 @@ void qcom_qmp_phy_lanes_init(struct phy *phy)
 }
 EXPORT_SYMBOL_GPL(qcom_qmp_phy_lanes_init);
 
+void qcom_qmp_phy_pcs_init(struct phy *phy)
+{
+	struct qmp_phy *qphy = phy_get_drvdata(phy);
+	const struct qmp_phy_cfg *cfg = qphy->cfg;
+	void __iomem *pcs = qphy->pcs;
+
+	qcom_qmp_phy_configure(pcs, cfg->regs, cfg->pcs_tbl, cfg->pcs_tbl_num);
+	if (cfg->pcs_tbl_sec)
+		qcom_qmp_phy_configure(pcs, cfg->regs, cfg->pcs_tbl_sec,
+				       cfg->pcs_tbl_num_sec);
+}
+EXPORT_SYMBOL_GPL(qcom_qmp_phy_pcs_init);
+
 static int qcom_qmp_phy_power_on(struct phy *phy)
 {
 	struct qmp_phy *qphy = phy_get_drvdata(phy);
@@ -4237,8 +3600,6 @@ static int qcom_qmp_phy_power_on(struct phy *phy)
 	const struct qmp_phy_cfg *cfg = qphy->cfg;
 	void __iomem *pcs = qphy->pcs;
 	void __iomem *pcs_misc = qphy->pcs_misc;
-	void __iomem *status;
-	unsigned int mask, val, ready;
 	int ret;
 
 	qcom_qmp_phy_serdes_init(qphy);
@@ -4260,15 +3621,7 @@ static int qcom_qmp_phy_power_on(struct phy *phy)
 	}
 
 	qcom_qmp_phy_lanes_init(phy);
-
-	qcom_qmp_phy_configure(pcs, cfg->regs, cfg->pcs_tbl, cfg->pcs_tbl_num);
-	if (cfg->pcs_tbl_sec)
-		qcom_qmp_phy_configure(pcs, cfg->regs, cfg->pcs_tbl_sec,
-				       cfg->pcs_tbl_num_sec);
-
-	ret = reset_control_deassert(qmp->ufs_reset);
-	if (ret)
-		goto err_disable_pipe_clk;
+	qcom_qmp_phy_pcs_init(phy);
 
 	qcom_qmp_phy_configure(pcs_misc, cfg->regs, cfg->pcs_misc_tbl,
 			       cfg->pcs_misc_tbl_num);
@@ -4286,28 +3639,9 @@ static int qcom_qmp_phy_power_on(struct phy *phy)
 	if (cfg->has_pwrdn_delay)
 		usleep_range(cfg->pwrdn_delay_min, cfg->pwrdn_delay_max);
 
-	/* Pull PHY out of reset state */
-	if (!cfg->no_pcs_sw_reset)
-		qphy_clrbits(pcs, cfg->regs[QPHY_SW_RESET], SW_RESET);
-	/* start SerDes and Phy-Coding-Sublayer */
-	qphy_setbits(pcs, cfg->regs[QPHY_START_CTRL], cfg->start_ctrl);
-
-	if (cfg->type == PHY_TYPE_UFS) {
-		status = pcs + cfg->regs[QPHY_PCS_READY_STATUS];
-		mask = PCS_READY;
-		ready = PCS_READY;
-	} else {
-		status = pcs + cfg->regs[QPHY_PCS_STATUS];
-		mask = cfg->phy_status;
-		ready = 0;
-	}
-
-	ret = readl_poll_timeout(status, val, (val & mask) == ready, 10,
-				 PHY_INIT_COMPLETE_TIMEOUT);
-	if (ret) {
-		dev_err(qmp->dev, "phy initialization timed-out\n");
+	ret = qcom_qmp_phy_com_power_on(qphy);
+	if (ret)
 		goto err_disable_pipe_clk;
-	}
 
 	return 0;
 
@@ -4320,13 +3654,10 @@ static int qcom_qmp_phy_power_on(struct phy *phy)
 	return ret;
 }
 
-static int qcom_qmp_phy_power_off(struct phy *phy)
+int qcom_qmp_phy_com_power_off(struct qmp_phy *qphy)
 {
-	struct qmp_phy *qphy = phy_get_drvdata(phy);
 	const struct qmp_phy_cfg *cfg = qphy->cfg;
 
-	clk_disable_unprepare(qphy->pipe_clk);
-
 	/* PHY reset */
 	if (!cfg->no_pcs_sw_reset)
 		qphy_setbits(qphy->pcs, cfg->regs[QPHY_SW_RESET], SW_RESET);
@@ -4345,6 +3676,16 @@ static int qcom_qmp_phy_power_off(struct phy *phy)
 
 	return 0;
 }
+EXPORT_SYMBOL_GPL(qcom_qmp_phy_com_power_off);
+
+static int qcom_qmp_phy_power_off(struct phy *phy)
+{
+	struct qmp_phy *qphy = phy_get_drvdata(phy);
+
+	clk_disable_unprepare(qphy->pipe_clk);
+
+	return qcom_qmp_phy_com_power_off(qphy);
+}
 
 static int qcom_qmp_phy_exit(struct phy *phy)
 {
@@ -4626,7 +3967,7 @@ const struct phy_ops qcom_qmp_phy_gen_ops = {
 };
 EXPORT_SYMBOL_GPL(qcom_qmp_phy_gen_ops);
 
-static const struct phy_ops qcom_qmp_pcie_ufs_ops = {
+static const struct phy_ops qcom_qmp_pcie_ops = {
 	.power_on	= qcom_qmp_phy_enable,
 	.power_off	= qcom_qmp_phy_disable,
 	.set_mode	= qcom_qmp_phy_set_mode,
@@ -4766,18 +4107,12 @@ static const struct of_device_id qcom_qmp_phy_of_match_table[] = {
 	}, {
 		.compatible = "qcom,msm8996-qmp-pcie-phy",
 		.data = &msm8996_pciephy_cfg,
-	}, {
-		.compatible = "qcom,msm8996-qmp-ufs-phy",
-		.data = &msm8996_ufs_cfg,
 	}, {
 		.compatible = "qcom,msm8996-qmp-usb3-phy",
 		.data = &msm8996_usb3phy_cfg,
 	}, {
 		.compatible = "qcom,msm8998-qmp-pcie-phy",
 		.data = &msm8998_pciephy_cfg,
-	}, {
-		.compatible = "qcom,msm8998-qmp-ufs-phy",
-		.data = &sdm845_ufsphy_cfg,
 	}, {
 		.compatible = "qcom,ipq8074-qmp-pcie-phy",
 		.data = &ipq8074_pciephy_cfg,
@@ -4793,12 +4128,6 @@ static const struct of_device_id qcom_qmp_phy_of_match_table[] = {
 	}, {
 		.compatible = "qcom,sc8180x-qmp-pcie-phy",
 		.data = &sc8180x_pciephy_cfg,
-	}, {
-		.compatible = "qcom,sc8180x-qmp-ufs-phy",
-		.data = &sm8150_ufsphy_cfg,
-	}, {
-		.compatible = "qcom,sc8280xp-qmp-ufs-phy",
-		.data = &sm8350_ufsphy_cfg,
 	}, {
 		.compatible = "qcom,sc8180x-qmp-usb3-phy",
 		.data = &sm8150_usb3phy_cfg,
@@ -4814,24 +4143,9 @@ static const struct of_device_id qcom_qmp_phy_of_match_table[] = {
 	}, {
 		.compatible = "qcom,sdm845-qmp-usb3-uni-phy",
 		.data = &qmp_v3_usb3_uniphy_cfg,
-	}, {
-		.compatible = "qcom,sdm845-qmp-ufs-phy",
-		.data = &sdm845_ufsphy_cfg,
 	}, {
 		.compatible = "qcom,msm8998-qmp-usb3-phy",
 		.data = &msm8998_usb3phy_cfg,
-	}, {
-		.compatible = "qcom,sm6115-qmp-ufs-phy",
-		.data = &sm6115_ufsphy_cfg,
-	}, {
-		.compatible = "qcom,sm6350-qmp-ufs-phy",
-		.data = &sdm845_ufsphy_cfg,
-	}, {
-		.compatible = "qcom,sm8150-qmp-ufs-phy",
-		.data = &sm8150_ufsphy_cfg,
-	}, {
-		.compatible = "qcom,sm8250-qmp-ufs-phy",
-		.data = &sm8150_ufsphy_cfg,
 	}, {
 		.compatible = "qcom,sm8150-qmp-usb3-phy",
 		.data = &sm8150_usb3phy_cfg,
@@ -4850,9 +4164,6 @@ static const struct of_device_id qcom_qmp_phy_of_match_table[] = {
 	}, {
 		.compatible = "qcom,sm8250-qmp-gen3x2-pcie-phy",
 		.data = &sm8250_qmp_gen3x2_pciephy_cfg,
-	}, {
-		.compatible = "qcom,sm8350-qmp-ufs-phy",
-		.data = &sm8350_ufsphy_cfg,
 	}, {
 		.compatible = "qcom,sm8250-qmp-modem-pcie-phy",
 		.data = &sm8250_qmp_gen3x2_pciephy_cfg,
@@ -4877,9 +4188,6 @@ static const struct of_device_id qcom_qmp_phy_of_match_table[] = {
 	}, {
 		.compatible = "qcom,sm8450-qmp-gen4x2-pcie-phy",
 		.data = &sm8450_qmp_gen4x2_pciephy_cfg,
-	}, {
-		.compatible = "qcom,sm8450-qmp-ufs-phy",
-		.data = &sm8450_ufsphy_cfg,
 	}, {
 		.compatible = "qcom,sm8450-qmp-usb3-phy",
 		.data = &sm8350_usb3phy_cfg,
@@ -4991,8 +4299,8 @@ static int qcom_qmp_phy_probe(struct platform_device *pdev)
 	for_each_available_child_of_node(dev->of_node, child) {
 		const struct phy_ops *ops;
 
-		if (cfg->type == PHY_TYPE_UFS || cfg->type == PHY_TYPE_PCIE)
-			ops = &qcom_qmp_pcie_ufs_ops;
+		if (cfg->type == PHY_TYPE_PCIE)
+			ops = &qcom_qmp_pcie_ops;
 		else
 			ops = &qcom_qmp_phy_gen_ops;
 
diff --git a/drivers/phy/qualcomm/phy-qcom-qmp.h b/drivers/phy/qualcomm/phy-qcom-qmp.h
index 06b2556ed93a..19d5c5a661d3 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp.h
+++ b/drivers/phy/qualcomm/phy-qcom-qmp.h
@@ -1319,4 +1319,47 @@
 #define QPHY_V5_PCS_USB3_UNI_LFPS_DET_HIGH_COUNT_VAL	0x1018
 #define QPHY_V5_PCS_USB3_UNI_RXEQTRAINING_DFE_TIME_S2	0x103c
 
+/* QPHY_SW_RESET bit */
+#define SW_RESET				BIT(0)
+/* QPHY_POWER_DOWN_CONTROL */
+#define SW_PWRDN				BIT(0)
+#define REFCLK_DRV_DSBL				BIT(1)
+/* QPHY_START_CONTROL bits */
+#define SERDES_START				BIT(0)
+#define PCS_START				BIT(1)
+#define PLL_READY_GATE_EN			BIT(3)
+/* QPHY_PCS_STATUS bit */
+#define PHYSTATUS				BIT(6)
+#define PHYSTATUS_4_20				BIT(7)
+/* QPHY_PCS_READY_STATUS & QPHY_COM_PCS_READY_STATUS bit */
+#define PCS_READY				BIT(0)
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
+/* QPHY_PCS_LFPS_RXTERM_IRQ_STATUS register bits */
+#define RCVR_DETECT				BIT(0)
+
+/* QPHY_V3_PCS_MISC_CLAMP_ENABLE register bits */
+#define CLAMP_EN				BIT(0) /* enables i/o clamp_n */
+
 #endif
-- 
2.35.1

