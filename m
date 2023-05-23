Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 65AE070DC3B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 May 2023 14:16:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236694AbjEWMQN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 23 May 2023 08:16:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46294 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236713AbjEWMQL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 23 May 2023 08:16:11 -0400
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F2948198
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 May 2023 05:16:01 -0700 (PDT)
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-4ec8eca56cfso8037211e87.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 May 2023 05:16:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684844100; x=1687436100;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2XJbQtrgiFrkjr0gRTcBYqYCtImHLEqMB5lmknqfspg=;
        b=n7WDTUIUx8uYcUJBfRArsRz+juVsm4mTxtdATqMDLiqji6iPHp+K28FkBnQe+AMw8q
         O+xEGKqcC2p7aP+jSEACzCJqsQcvSIPMAckFFrO7xE0i42J8x/9c5JXkTMKv+U85pBTn
         +Z4CyBfalnal5Io6DWZB8em0Atz/bJWyTuhy853v9Y20w0oW2OGUnLn4of/7CK7OF8V5
         Yc3d3L4C40nqo+XZpCMXdD3RrxO6pH4G3c9fvXmUjaCzYnScn2hzsHrP8VNqoglZWMyp
         uJjIXbnUub3zUwTgi+OBFujoU4zo9M6RGa0A8ADwwFsfeyXiTRUUTxrIrk/nmcPQls++
         tdtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684844100; x=1687436100;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2XJbQtrgiFrkjr0gRTcBYqYCtImHLEqMB5lmknqfspg=;
        b=Rf0wIjGRZQEcg5N4elPafgIJdD5PX+DY68MmQhk4/LXsIxC6/9C1n6WiUAckf+H02u
         kC9/m5vNNy2cc9u3m58huM/EFK8POr2rnbqj87dLKFHS7CLXU/Xe/XKk9uyde9PY31a4
         3pGE+fVG/D1Le+XXzkb/X+FOCWLoxH/+erGVl+zLvTlYNoOp3eu6MjJfmKEIs6/K8CJK
         neIpvfTdyjpJGe4X8hk1E6rSzIAqLvlIOy++1Vb/3yZbK/FqYBef3099EsE2+l4QCZwl
         qZ3ICv5K4k6tSER7JoBhVQJXvUnn8IbhzHQpF7ijAGTauic+79tyzP7toM3E5S04XEuZ
         YD3Q==
X-Gm-Message-State: AC+VfDwbb5aOnusLZ4nwF+vUzKDvlh6KOyv40vvjhKgEJadmlNP1NC/i
        srv7dypZ4slIFaqicKiMyHusmQ==
X-Google-Smtp-Source: ACHHUZ6qJxwQ9GLDem0UXt4kJ6yZsQnCT/eWjJ4qWFQNjiJxNfLH5wiNwedepVWU2KMUPpGMQ48Gng==
X-Received: by 2002:ac2:596a:0:b0:4f3:7cf8:b348 with SMTP id h10-20020ac2596a000000b004f37cf8b348mr4670060lfp.5.1684844100063;
        Tue, 23 May 2023 05:15:00 -0700 (PDT)
Received: from eriador.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id c26-20020ac2531a000000b004f160559d4asm1319616lfh.183.2023.05.23.05.14.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 May 2023 05:14:59 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-phy@lists.infradead.org
Subject: [PATCH 04/15] phy: qualcomm: add MSM8x60 HDMI PHY driver
Date:   Tue, 23 May 2023 15:14:43 +0300
Message-Id: <20230523121454.3460634-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230523121454.3460634-1-dmitry.baryshkov@linaro.org>
References: <20230523121454.3460634-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Port the HDMI PHY driver for Qualcomm MSM8260 / MSM8660 / APQ8060 platforms.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/phy/qualcomm/Kconfig                 |  11 +
 drivers/phy/qualcomm/Makefile                |   1 +
 drivers/phy/qualcomm/phy-qcom-hdmi-msm8x60.c | 353 +++++++++++++++++++
 3 files changed, 365 insertions(+)
 create mode 100644 drivers/phy/qualcomm/phy-qcom-hdmi-msm8x60.c

diff --git a/drivers/phy/qualcomm/Kconfig b/drivers/phy/qualcomm/Kconfig
index 838f93ad1168..a603d4777a02 100644
--- a/drivers/phy/qualcomm/Kconfig
+++ b/drivers/phy/qualcomm/Kconfig
@@ -42,6 +42,17 @@ config PHY_QCOM_IPQ806X_SATA
 	depends on OF
 	select GENERIC_PHY
 
+config PHY_QCOM_HDMI_MSM8X60
+	tristate "Qualcomm MSM8x60 HDMI PHY driver"
+	depends on ARCH_QCOM || COMPILE_TEST
+	depends on OF
+	depends on COMMON_CLK
+	default DRM_MSM_HDMI && ARCH_MSM8X60
+	select GENERIC_PHY
+	help
+	  Enable this to support the Qualcomm HDMI PHY presend on MSM8260,
+	  MSM8660 and APQ8060 platforms.
+
 config PHY_QCOM_HDMI_MSM8960
 	tristate "Qualcomm MSM8960 HDMI PHY driver"
 	depends on ARCH_QCOM || COMPILE_TEST
diff --git a/drivers/phy/qualcomm/Makefile b/drivers/phy/qualcomm/Makefile
index 6d7d76c7fee0..cbc730c074ad 100644
--- a/drivers/phy/qualcomm/Makefile
+++ b/drivers/phy/qualcomm/Makefile
@@ -4,6 +4,7 @@ obj-$(CONFIG_PHY_QCOM_APQ8064_SATA)	+= phy-qcom-apq8064-sata.o
 obj-$(CONFIG_PHY_QCOM_EDP)		+= phy-qcom-edp.o
 obj-$(CONFIG_PHY_QCOM_IPQ4019_USB)	+= phy-qcom-ipq4019-usb.o
 obj-$(CONFIG_PHY_QCOM_IPQ806X_SATA)	+= phy-qcom-ipq806x-sata.o
+obj-$(CONFIG_PHY_QCOM_HDMI_MSM8X60)	+= phy-qcom-hdmi-msm8x60.o
 obj-$(CONFIG_PHY_QCOM_HDMI_MSM8960)	+= phy-qcom-hdmi-msm8960.o
 obj-$(CONFIG_PHY_QCOM_PCIE2)		+= phy-qcom-pcie2.o
 
diff --git a/drivers/phy/qualcomm/phy-qcom-hdmi-msm8x60.c b/drivers/phy/qualcomm/phy-qcom-hdmi-msm8x60.c
new file mode 100644
index 000000000000..a5bacab80909
--- /dev/null
+++ b/drivers/phy/qualcomm/phy-qcom-hdmi-msm8x60.c
@@ -0,0 +1,353 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2013 Red Hat
+ * Author: Rob Clark <robdclark@gmail.com>
+ * Copyright (c) 2023, Linaro Ltd.
+ */
+
+#include <linux/bitfield.h>
+#include <linux/clk.h>
+#include <linux/delay.h>
+#include <linux/iopoll.h>
+#include <linux/of_device.h>
+#include <linux/phy/phy.h>
+#include <linux/platform_device.h>
+#include <linux/regulator/consumer.h>
+
+#define REG_HDMI_8x60_PHY_REG0					0x00000000
+#define HDMI_8x60_PHY_REG0_DESER_DEL_CTRL__MASK			0x0000001c
+
+#define REG_HDMI_8x60_PHY_REG1					0x00000004
+#define HDMI_8x60_PHY_REG1_DTEST_MUX_SEL__MASK			0x000000f0
+#define HDMI_8x60_PHY_REG1_OUTVOL_SWING_CTRL__MASK		0x0000000f
+
+#define REG_HDMI_8x60_PHY_REG2					0x00000008
+#define HDMI_8x60_PHY_REG2_PD_DESER				0x00000001
+#define HDMI_8x60_PHY_REG2_PD_DRIVE_1				0x00000002
+#define HDMI_8x60_PHY_REG2_PD_DRIVE_2				0x00000004
+#define HDMI_8x60_PHY_REG2_PD_DRIVE_3				0x00000008
+#define HDMI_8x60_PHY_REG2_PD_DRIVE_4				0x00000010
+#define HDMI_8x60_PHY_REG2_PD_PLL				0x00000020
+#define HDMI_8x60_PHY_REG2_PD_PWRGEN				0x00000040
+#define HDMI_8x60_PHY_REG2_RCV_SENSE_EN				0x00000080
+
+#define REG_HDMI_8x60_PHY_REG3					0x0000000c
+#define HDMI_8x60_PHY_REG3_PLL_ENABLE				0x00000001
+
+#define REG_HDMI_8x60_PHY_REG4					0x00000010
+
+#define REG_HDMI_8x60_PHY_REG5					0x00000014
+
+#define REG_HDMI_8x60_PHY_REG6					0x00000018
+
+#define REG_HDMI_8x60_PHY_REG7					0x0000001c
+
+#define REG_HDMI_8x60_PHY_REG8					0x00000020
+
+#define REG_HDMI_8x60_PHY_REG9					0x00000024
+
+#define REG_HDMI_8x60_PHY_REG10					0x00000028
+
+#define REG_HDMI_8x60_PHY_REG11					0x0000002c
+
+#define REG_HDMI_8x60_PHY_REG12					0x00000030
+#define HDMI_8x60_PHY_REG12_RETIMING_EN				0x00000001
+#define HDMI_8x60_PHY_REG12_PLL_LOCK_DETECT_EN			0x00000002
+#define HDMI_8x60_PHY_REG12_FORCE_LOCK				0x00000010
+
+struct qcom_hdmi_8x60_phy {
+	struct device *dev;
+	struct phy *phy;
+	void __iomem *phy_reg;
+
+	struct phy_configure_opts_hdmi hdmi_opts;
+
+	struct clk *iface_clk;
+	struct regulator *vdda;
+};
+
+static inline void hdmi_phy_write(struct qcom_hdmi_8x60_phy *phy, int offset,
+				  u32 data)
+{
+	writel(data, phy->phy_reg + offset);
+}
+
+static inline u32 hdmi_phy_read(struct qcom_hdmi_8x60_phy *phy, int offset)
+{
+	return readl(phy->phy_reg + offset);
+}
+
+static int qcom_hdmi_8x60_phy_power_on(struct phy *phy)
+{
+	struct qcom_hdmi_8x60_phy *hdmi_phy = phy_get_drvdata(phy);
+	unsigned long pixclock = hdmi_phy->hdmi_opts.pixel_clk_rate;
+
+	/* De-serializer delay D/C for non-lbk mode: */
+	hdmi_phy_write(hdmi_phy, REG_HDMI_8x60_PHY_REG0,
+		       FIELD_PREP(HDMI_8x60_PHY_REG0_DESER_DEL_CTRL__MASK, 3));
+
+	if (pixclock == 27000) {
+		/* video_format == HDMI_VFRMT_720x480p60_16_9 */
+		hdmi_phy_write(hdmi_phy, REG_HDMI_8x60_PHY_REG1,
+			       FIELD_PREP(HDMI_8x60_PHY_REG1_DTEST_MUX_SEL__MASK, 5) |
+			       FIELD_PREP(HDMI_8x60_PHY_REG1_OUTVOL_SWING_CTRL__MASK, 3));
+	} else {
+		hdmi_phy_write(hdmi_phy, REG_HDMI_8x60_PHY_REG1,
+			       FIELD_PREP(HDMI_8x60_PHY_REG1_DTEST_MUX_SEL__MASK, 5) |
+			       FIELD_PREP(HDMI_8x60_PHY_REG1_OUTVOL_SWING_CTRL__MASK, 4));
+	}
+
+	/* No matter what, start from the power down mode: */
+	hdmi_phy_write(hdmi_phy, REG_HDMI_8x60_PHY_REG2,
+		       HDMI_8x60_PHY_REG2_PD_PWRGEN |
+		       HDMI_8x60_PHY_REG2_PD_PLL |
+		       HDMI_8x60_PHY_REG2_PD_DRIVE_4 |
+		       HDMI_8x60_PHY_REG2_PD_DRIVE_3 |
+		       HDMI_8x60_PHY_REG2_PD_DRIVE_2 |
+		       HDMI_8x60_PHY_REG2_PD_DRIVE_1 |
+		       HDMI_8x60_PHY_REG2_PD_DESER);
+
+	/* Turn PowerGen on: */
+	hdmi_phy_write(hdmi_phy, REG_HDMI_8x60_PHY_REG2,
+		       HDMI_8x60_PHY_REG2_PD_PLL |
+		       HDMI_8x60_PHY_REG2_PD_DRIVE_4 |
+		       HDMI_8x60_PHY_REG2_PD_DRIVE_3 |
+		       HDMI_8x60_PHY_REG2_PD_DRIVE_2 |
+		       HDMI_8x60_PHY_REG2_PD_DRIVE_1 |
+		       HDMI_8x60_PHY_REG2_PD_DESER);
+
+	/* Turn PLL power on: */
+	hdmi_phy_write(hdmi_phy, REG_HDMI_8x60_PHY_REG2,
+		       HDMI_8x60_PHY_REG2_PD_DRIVE_4 |
+		       HDMI_8x60_PHY_REG2_PD_DRIVE_3 |
+		       HDMI_8x60_PHY_REG2_PD_DRIVE_2 |
+		       HDMI_8x60_PHY_REG2_PD_DRIVE_1 |
+		       HDMI_8x60_PHY_REG2_PD_DESER);
+
+	/* Write to HIGH after PLL power down de-assert: */
+	hdmi_phy_write(hdmi_phy, REG_HDMI_8x60_PHY_REG3,
+		       HDMI_8x60_PHY_REG3_PLL_ENABLE);
+
+	/* ASIC power on; PHY REG9 = 0 */
+	hdmi_phy_write(hdmi_phy, REG_HDMI_8x60_PHY_REG9, 0);
+
+	/* Enable PLL lock detect, PLL lock det will go high after lock
+	 * Enable the re-time logic
+	 */
+	hdmi_phy_write(hdmi_phy, REG_HDMI_8x60_PHY_REG12,
+		       HDMI_8x60_PHY_REG12_RETIMING_EN |
+		       HDMI_8x60_PHY_REG12_PLL_LOCK_DETECT_EN);
+
+	/* Drivers are on: */
+	hdmi_phy_write(hdmi_phy, REG_HDMI_8x60_PHY_REG2,
+		       HDMI_8x60_PHY_REG2_PD_DESER);
+
+	/* If the RX detector is needed: */
+	hdmi_phy_write(hdmi_phy, REG_HDMI_8x60_PHY_REG2,
+		       HDMI_8x60_PHY_REG2_RCV_SENSE_EN |
+		       HDMI_8x60_PHY_REG2_PD_DESER);
+
+	hdmi_phy_write(hdmi_phy, REG_HDMI_8x60_PHY_REG4, 0);
+	hdmi_phy_write(hdmi_phy, REG_HDMI_8x60_PHY_REG5, 0);
+	hdmi_phy_write(hdmi_phy, REG_HDMI_8x60_PHY_REG6, 0);
+	hdmi_phy_write(hdmi_phy, REG_HDMI_8x60_PHY_REG7, 0);
+	hdmi_phy_write(hdmi_phy, REG_HDMI_8x60_PHY_REG8, 0);
+	hdmi_phy_write(hdmi_phy, REG_HDMI_8x60_PHY_REG9, 0);
+	hdmi_phy_write(hdmi_phy, REG_HDMI_8x60_PHY_REG10, 0);
+	hdmi_phy_write(hdmi_phy, REG_HDMI_8x60_PHY_REG11, 0);
+
+	/* If we want to use lock enable based on counting: */
+	hdmi_phy_write(hdmi_phy, REG_HDMI_8x60_PHY_REG12,
+		       HDMI_8x60_PHY_REG12_RETIMING_EN |
+		       HDMI_8x60_PHY_REG12_PLL_LOCK_DETECT_EN |
+		       HDMI_8x60_PHY_REG12_FORCE_LOCK);
+
+	return 0;
+}
+
+static int qcom_hdmi_8x60_phy_power_off(struct phy *phy)
+{
+	struct qcom_hdmi_8x60_phy *hdmi_phy = phy_get_drvdata(phy);
+
+	/* Assert RESET PHY from controller */
+#if 0
+	hdmi_phy_write(hdmi_phy, REG_HDMI_PHY_CTRL,
+		       HDMI_PHY_CTRL_SW_RESET);
+	udelay(10);
+	/* De-assert RESET PHY from controller */
+	hdmi_phy_write(hdmi_phy, REG_HDMI_PHY_CTRL, 0);
+#endif
+	/* Turn off Driver */
+	hdmi_phy_write(hdmi_phy, REG_HDMI_8x60_PHY_REG2,
+		       HDMI_8x60_PHY_REG2_PD_DRIVE_4 |
+		       HDMI_8x60_PHY_REG2_PD_DRIVE_3 |
+		       HDMI_8x60_PHY_REG2_PD_DRIVE_2 |
+		       HDMI_8x60_PHY_REG2_PD_DRIVE_1 |
+		       HDMI_8x60_PHY_REG2_PD_DESER);
+	udelay(10);
+	/* Disable PLL */
+	hdmi_phy_write(hdmi_phy, REG_HDMI_8x60_PHY_REG3, 0);
+	/* Power down PHY, but keep RX-sense: */
+	hdmi_phy_write(hdmi_phy, REG_HDMI_8x60_PHY_REG2,
+		       HDMI_8x60_PHY_REG2_RCV_SENSE_EN |
+		       HDMI_8x60_PHY_REG2_PD_PWRGEN |
+		       HDMI_8x60_PHY_REG2_PD_PLL |
+		       HDMI_8x60_PHY_REG2_PD_DRIVE_4 |
+		       HDMI_8x60_PHY_REG2_PD_DRIVE_3 |
+		       HDMI_8x60_PHY_REG2_PD_DRIVE_2 |
+		       HDMI_8x60_PHY_REG2_PD_DRIVE_1 |
+		       HDMI_8x60_PHY_REG2_PD_DESER);
+
+	return 0;
+}
+
+static int qcom_hdmi_8x60_phy_init(struct phy *phy)
+{
+	struct qcom_hdmi_8x60_phy *hdmi_phy = phy_get_drvdata(phy);
+
+	return pm_runtime_resume_and_get(hdmi_phy->dev);
+}
+
+static int qcom_hdmi_8x60_phy_exit(struct phy *phy)
+{
+	struct qcom_hdmi_8x60_phy *hdmi_phy = phy_get_drvdata(phy);
+
+	pm_runtime_put_noidle(hdmi_phy->dev);
+
+	return 0;
+}
+
+static int qcom_hdmi_8x60_phy_configure(struct phy *phy, union phy_configure_opts *opts)
+{
+        const struct phy_configure_opts_hdmi *hdmi_opts = &opts->hdmi;
+	struct qcom_hdmi_8x60_phy *hdmi_phy = phy_get_drvdata(phy);
+        int ret = 0;
+
+        memcpy(&hdmi_phy->hdmi_opts, hdmi_opts, sizeof(*hdmi_opts));
+
+        return ret;
+}
+
+static int __maybe_unused qcom_hdmi_8x60_runtime_resume(struct device *dev)
+{
+	struct qcom_hdmi_8x60_phy *hdmi_phy = dev_get_drvdata(dev);
+	int ret;
+
+	ret = regulator_enable(hdmi_phy->vdda);
+	if (ret)
+		return ret;
+
+	ret = clk_prepare_enable(hdmi_phy->iface_clk);
+	if (ret)
+		goto out_disable_supplies;
+
+	return 0;
+
+out_disable_supplies:
+	regulator_disable(hdmi_phy->vdda);
+
+	return ret;
+}
+
+static int __maybe_unused qcom_hdmi_8x60_runtime_suspend(struct device *dev)
+{
+	struct qcom_hdmi_8x60_phy *hdmi_phy = dev_get_drvdata(dev);
+
+	clk_disable_unprepare(hdmi_phy->iface_clk);
+	regulator_disable(hdmi_phy->vdda);
+
+	return 0;
+}
+
+static const struct phy_ops qcom_hdmi_8x60_phy_ops = {
+	.init		= qcom_hdmi_8x60_phy_init,
+	.configure	= qcom_hdmi_8x60_phy_configure,
+	.power_on	= qcom_hdmi_8x60_phy_power_on,
+	.power_off	= qcom_hdmi_8x60_phy_power_off,
+	.exit		= qcom_hdmi_8x60_phy_exit,
+	.owner		= THIS_MODULE,
+};
+
+static int qcom_hdmi_8x60_probe(struct platform_device *pdev)
+{
+	struct phy_provider *phy_provider;
+	struct device *dev = &pdev->dev;
+	struct qcom_hdmi_8x60_phy *hdmi_phy;
+	int ret;
+
+	hdmi_phy = devm_kzalloc(dev, sizeof(*hdmi_phy), GFP_KERNEL);
+	if (!hdmi_phy)
+		return -ENOMEM;
+
+	hdmi_phy->dev = dev;
+
+	hdmi_phy->phy_reg = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(hdmi_phy->phy_reg))
+		return PTR_ERR(hdmi_phy->phy_reg);
+
+	hdmi_phy->iface_clk = devm_clk_get(dev, "slave_iface");
+	if (IS_ERR(hdmi_phy->iface_clk)) {
+		ret = PTR_ERR(hdmi_phy->iface_clk);
+		return ret;
+	}
+
+	hdmi_phy->vdda = devm_regulator_get(dev, "core-vdda");
+	if (IS_ERR(hdmi_phy->vdda)) {
+		ret = PTR_ERR(hdmi_phy->vdda);
+		return ret;
+	}
+
+	platform_set_drvdata(pdev, hdmi_phy);
+
+	ret = devm_pm_runtime_enable(&pdev->dev);
+	if (ret)
+		return ret;
+
+	ret = pm_runtime_resume_and_get(&pdev->dev);
+	if (ret)
+		return ret;
+
+	hdmi_phy->phy = devm_phy_create(dev, pdev->dev.of_node, &qcom_hdmi_8x60_phy_ops);
+	if (IS_ERR(hdmi_phy->phy)) {
+		ret = PTR_ERR(hdmi_phy->phy);
+		goto err;
+	}
+
+	phy_set_drvdata(hdmi_phy->phy, hdmi_phy);
+
+	phy_provider = devm_of_phy_provider_register(dev, of_phy_simple_xlate);
+	pm_runtime_put_noidle(&pdev->dev);
+	return PTR_ERR_OR_ZERO(phy_provider);
+
+err:
+	pm_runtime_put_noidle(&pdev->dev);
+	return ret;
+}
+
+static const struct of_device_id qcom_hdmi_8x60_of_match_table[] = {
+	{
+		.compatible = "qcom,hdmi-phy-8x60",
+	},
+	{ },
+};
+MODULE_DEVICE_TABLE(of, qcom_hdmi_8x60_of_match_table);
+
+DEFINE_RUNTIME_DEV_PM_OPS(qcom_hdmi_8x60_pm_ops,
+			  qcom_hdmi_8x60_runtime_suspend,
+			  qcom_hdmi_8x60_runtime_resume,
+			  NULL);
+
+static struct platform_driver qcom_hdmi_8x60_driver = {
+	.probe		= qcom_hdmi_8x60_probe,
+	.driver = {
+		.name	= "qcom-8x60-hdmi-phy",
+		.of_match_table = qcom_hdmi_8x60_of_match_table,
+		.pm     = &qcom_hdmi_8x60_pm_ops,
+	},
+};
+
+module_platform_driver(qcom_hdmi_8x60_driver);
+
+MODULE_AUTHOR("Dmitry Baryshkov <dmitry.baryshkov@linaro.org>");
+MODULE_DESCRIPTION("Qualcomm MSM8x60 HDMI PHY driver");
+MODULE_LICENSE("GPL");
-- 
2.39.2

