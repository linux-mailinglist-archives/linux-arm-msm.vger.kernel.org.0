Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BB56A635AB4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Nov 2022 11:58:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236678AbiKWKyi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 23 Nov 2022 05:54:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53496 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236701AbiKWKyL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 23 Nov 2022 05:54:11 -0500
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A4C913183C
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Nov 2022 02:42:19 -0800 (PST)
Received: by mail-lf1-x12c.google.com with SMTP id r12so27609983lfp.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Nov 2022 02:42:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MUZDnIkfNh06R85EM0wJhtFz6lYEjKbLoF6KBFjg6J0=;
        b=kRzLpWCGhDiIVmdYa5YsXwvNmn9yH5G2s2gxc6oe5cdpWoPBut53plbm+9vMZesnL6
         QZR+8yjEOEtYWjdzIw9yYsNWfsJJbVIqFbVzrGpfhGtNjE8+sD5kMgK1TDh5J4fnAS5n
         OrgyHgbm+AmVAP2+Yst9WnXa4E7VS5aoXT4f7DBsxR23ANAgN8goxHkMfoiNfgshfHzY
         NZLYebf1jv5S+7xxwIDHw0mI7bS6rOGeIg3+5CWJvvhPGCp5lw9/BWYfglF8HcFwQNOP
         fZLelmJNvm4iHuShY5I5GReziPmnIA4TtlYOUohJV3GMoyoRLUH+j4ulgEAPNxlE417u
         6IVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MUZDnIkfNh06R85EM0wJhtFz6lYEjKbLoF6KBFjg6J0=;
        b=mgOnliO0wZjLHPmcUdHQjaZOsqGbcVra23ipnXawU4FwSNdWkEsVRNn+H3hRrMNJDS
         4DSkEtwdF7APLfyYlUkXUKMniAb7cbrajCRzBjgkzgzQPv8xk7dKYdvvLPFjkg6sSEKW
         N8WNniS2J1nKzPjus3IzjERyqpmMrg0ZutElq45qJldW//KCqSWYDX4dMDqiSHQRZkYW
         qjRc8sFuV4ebgwkF31Nsi434onowHx75haU7Cxte68qszQVUiBGn1AXW0Tt76ohEjHUF
         GjU7IfsdUeffGpH+z7cwgq4TOCG9bZ0QsFzXJDcjUs+LW0pi5vs0Lewzy56IXslkWheg
         SJkQ==
X-Gm-Message-State: ANoB5pnVmd1XzAYOpKO8U7rtC1xsnP8uh3h/WxGe9bqqpZCEMZ7DxyUR
        pBcTmiDlcc32OCJc4RLeOtNHGA==
X-Google-Smtp-Source: AA0mqf6spHUPzTHRtVhZs62fYS9lt5mGKKNzTxLT0sOmzsOED5+PDT8UZ5bVe/+XNd5E0gFXOYaosw==
X-Received: by 2002:a05:6512:38b2:b0:4b3:a022:2176 with SMTP id o18-20020a05651238b200b004b3a0222176mr9615868lft.395.1669200137668;
        Wed, 23 Nov 2022 02:42:17 -0800 (PST)
Received: from eriador.lumag.spb.ru (dzpbg0ftyyyyyyyyyyyyt-3.rev.dnainternet.fi. [2001:14ba:a302:5f12::1])
        by smtp.gmail.com with ESMTPSA id n5-20020a05651203e500b00498f570aef2sm2862908lfq.209.2022.11.23.02.42.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Nov 2022 02:42:17 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Johan Hovold <johan@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH v8 2/4] phy: renesas: Add Renesas Ethernet SERDES driver for R-Car S4-8
Date:   Wed, 23 Nov 2022 12:42:13 +0200
Message-Id: <20221123104215.3414528-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221123104215.3414528-1-dmitry.baryshkov@linaro.org>
References: <20221123104215.3414528-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Add Renesas Ethernet SERDES driver for R-Car S4-8 (r8a779f0).
The datasheet describes initialization procedure without any information
about registers' name/bits. So, this is all black magic to initialize
the hardware. Especially, all channels should be initialized at once.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Link: https://lore.kernel.org/r/20221108005500.3011449-3-yoshihiro.shimoda.uh@renesas.com
Signed-off-by: Vinod Koul <vkoul@kernel.org>
---
 drivers/phy/renesas/Kconfig                 |   8 +
 drivers/phy/renesas/Makefile                |   1 +
 drivers/phy/renesas/r8a779f0-ether-serdes.c | 417 ++++++++++++++++++++
 3 files changed, 426 insertions(+)
 create mode 100644 drivers/phy/renesas/r8a779f0-ether-serdes.c

diff --git a/drivers/phy/renesas/Kconfig b/drivers/phy/renesas/Kconfig
index 111bdcae775c..36505fc5f386 100644
--- a/drivers/phy/renesas/Kconfig
+++ b/drivers/phy/renesas/Kconfig
@@ -2,6 +2,14 @@
 #
 # Phy drivers for Renesas platforms
 #
+# NOTE: Please sorted config names alphabetically.
+config PHY_R8A779F0_ETHERNET_SERDES
+	tristate "Renesas R-Car S4-8 Ethernet SERDES driver"
+	depends on ARCH_RENESAS || COMPILE_TEST
+	select GENERIC_PHY
+	help
+	  Support for Ethernet SERDES found on Renesas R-Car S4-8 SoCs.
+
 config PHY_RCAR_GEN2
 	tristate "Renesas R-Car generation 2 USB PHY driver"
 	depends on ARCH_RENESAS
diff --git a/drivers/phy/renesas/Makefile b/drivers/phy/renesas/Makefile
index b599ff8a4349..8896d1919faa 100644
--- a/drivers/phy/renesas/Makefile
+++ b/drivers/phy/renesas/Makefile
@@ -1,4 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0
+obj-$(CONFIG_PHY_R8A779F0_ETHERNET_SERDES)	+= r8a779f0-ether-serdes.o
 obj-$(CONFIG_PHY_RCAR_GEN2)		+= phy-rcar-gen2.o
 obj-$(CONFIG_PHY_RCAR_GEN3_PCIE)	+= phy-rcar-gen3-pcie.o
 obj-$(CONFIG_PHY_RCAR_GEN3_USB2)	+= phy-rcar-gen3-usb2.o
diff --git a/drivers/phy/renesas/r8a779f0-ether-serdes.c b/drivers/phy/renesas/r8a779f0-ether-serdes.c
new file mode 100644
index 000000000000..ec6594e6dc27
--- /dev/null
+++ b/drivers/phy/renesas/r8a779f0-ether-serdes.c
@@ -0,0 +1,417 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Renesas Ethernet SERDES device driver
+ *
+ * Copyright (C) 2022 Renesas Electronics Corporation
+ */
+
+#include <linux/delay.h>
+#include <linux/err.h>
+#include <linux/iopoll.h>
+#include <linux/kernel.h>
+#include <linux/phy.h>
+#include <linux/phy/phy.h>
+#include <linux/platform_device.h>
+#include <linux/reset.h>
+
+#define R8A779F0_ETH_SERDES_NUM			3
+#define R8A779F0_ETH_SERDES_OFFSET		0x0400
+#define R8A779F0_ETH_SERDES_BANK_SELECT		0x03fc
+#define R8A779F0_ETH_SERDES_TIMEOUT_US		100000
+#define R8A779F0_ETH_SERDES_NUM_RETRY_LINKUP	3
+#define R8A779F0_ETH_SERDES_NUM_RETRY_INIT	3
+
+struct r8a779f0_eth_serdes_drv_data;
+struct r8a779f0_eth_serdes_channel {
+	struct r8a779f0_eth_serdes_drv_data *dd;
+	struct phy *phy;
+	void __iomem *addr;
+	phy_interface_t phy_interface;
+	int speed;
+	int index;
+};
+
+struct r8a779f0_eth_serdes_drv_data {
+	void __iomem *addr;
+	struct platform_device *pdev;
+	struct reset_control *reset;
+	struct r8a779f0_eth_serdes_channel channel[R8A779F0_ETH_SERDES_NUM];
+	bool initialized;
+};
+
+/*
+ * The datasheet describes initialization procedure without any information
+ * about registers' name/bits. So, this is all black magic to initialize
+ * the hardware.
+ */
+static void r8a779f0_eth_serdes_write32(void __iomem *addr, u32 offs, u32 bank, u32 data)
+{
+	iowrite32(bank, addr + R8A779F0_ETH_SERDES_BANK_SELECT);
+	iowrite32(data, addr + offs);
+}
+
+static int
+r8a779f0_eth_serdes_reg_wait(struct r8a779f0_eth_serdes_channel *channel,
+			     u32 offs, u32 bank, u32 mask, u32 expected)
+{
+	int ret;
+	u32 val;
+
+	iowrite32(bank, channel->addr + R8A779F0_ETH_SERDES_BANK_SELECT);
+
+	ret = readl_poll_timeout_atomic(channel->addr + offs, val,
+					(val & mask) == expected,
+					1, R8A779F0_ETH_SERDES_TIMEOUT_US);
+	if (ret)
+		dev_dbg(&channel->phy->dev,
+			"%s: index %d, offs %x, bank %x, mask %x, expected %x\n",
+			 __func__, channel->index, offs, bank, mask, expected);
+
+	return ret;
+}
+
+static int
+r8a779f0_eth_serdes_common_init_ram(struct r8a779f0_eth_serdes_drv_data *dd)
+{
+	struct r8a779f0_eth_serdes_channel *channel;
+	int i, ret;
+
+	for (i = 0; i < R8A779F0_ETH_SERDES_NUM; i++) {
+		channel = &dd->channel[i];
+		ret = r8a779f0_eth_serdes_reg_wait(channel, 0x026c, 0x180, BIT(0), 0x01);
+		if (ret)
+			return ret;
+	}
+
+	r8a779f0_eth_serdes_write32(dd->addr, 0x026c, 0x180, 0x03);
+
+	return ret;
+}
+
+static int
+r8a779f0_eth_serdes_common_setting(struct r8a779f0_eth_serdes_channel *channel)
+{
+	struct r8a779f0_eth_serdes_drv_data *dd = channel->dd;
+
+	switch (channel->phy_interface) {
+	case PHY_INTERFACE_MODE_SGMII:
+		r8a779f0_eth_serdes_write32(dd->addr, 0x0244, 0x180, 0x0097);
+		r8a779f0_eth_serdes_write32(dd->addr, 0x01d0, 0x180, 0x0060);
+		r8a779f0_eth_serdes_write32(dd->addr, 0x01d8, 0x180, 0x2200);
+		r8a779f0_eth_serdes_write32(dd->addr, 0x01d4, 0x180, 0x0000);
+		r8a779f0_eth_serdes_write32(dd->addr, 0x01e0, 0x180, 0x003d);
+		return 0;
+	default:
+		return -EOPNOTSUPP;
+	}
+}
+
+static int
+r8a779f0_eth_serdes_chan_setting(struct r8a779f0_eth_serdes_channel *channel)
+{
+	int ret;
+
+	switch (channel->phy_interface) {
+	case PHY_INTERFACE_MODE_SGMII:
+		r8a779f0_eth_serdes_write32(channel->addr, 0x0000, 0x380, 0x2000);
+		r8a779f0_eth_serdes_write32(channel->addr, 0x01c0, 0x180, 0x0011);
+		r8a779f0_eth_serdes_write32(channel->addr, 0x0248, 0x180, 0x0540);
+		r8a779f0_eth_serdes_write32(channel->addr, 0x0258, 0x180, 0x0015);
+		r8a779f0_eth_serdes_write32(channel->addr, 0x0144, 0x180, 0x0100);
+		r8a779f0_eth_serdes_write32(channel->addr, 0x01a0, 0x180, 0x0000);
+		r8a779f0_eth_serdes_write32(channel->addr, 0x00d0, 0x180, 0x0002);
+		r8a779f0_eth_serdes_write32(channel->addr, 0x0150, 0x180, 0x0003);
+		r8a779f0_eth_serdes_write32(channel->addr, 0x00c8, 0x180, 0x0100);
+		r8a779f0_eth_serdes_write32(channel->addr, 0x0148, 0x180, 0x0100);
+		r8a779f0_eth_serdes_write32(channel->addr, 0x0174, 0x180, 0x0000);
+		r8a779f0_eth_serdes_write32(channel->addr, 0x0160, 0x180, 0x0007);
+		r8a779f0_eth_serdes_write32(channel->addr, 0x01ac, 0x180, 0x0000);
+		r8a779f0_eth_serdes_write32(channel->addr, 0x00c4, 0x180, 0x0310);
+		r8a779f0_eth_serdes_write32(channel->addr, 0x00c8, 0x380, 0x0101);
+		ret = r8a779f0_eth_serdes_reg_wait(channel, 0x00c8, 0x0180, BIT(0), 0);
+		if (ret)
+			return ret;
+
+		r8a779f0_eth_serdes_write32(channel->addr, 0x0148, 0x180, 0x0101);
+		ret = r8a779f0_eth_serdes_reg_wait(channel, 0x0148, 0x0180, BIT(0), 0);
+		if (ret)
+			return ret;
+
+		r8a779f0_eth_serdes_write32(channel->addr, 0x00c4, 0x180, 0x1310);
+		r8a779f0_eth_serdes_write32(channel->addr, 0x00d8, 0x180, 0x1800);
+		r8a779f0_eth_serdes_write32(channel->addr, 0x00dc, 0x180, 0x0000);
+		r8a779f0_eth_serdes_write32(channel->addr, 0x001c, 0x300, 0x0001);
+		r8a779f0_eth_serdes_write32(channel->addr, 0x0000, 0x380, 0x2100);
+		ret = r8a779f0_eth_serdes_reg_wait(channel, 0x0000, 0x0380, BIT(8), 0);
+		if (ret)
+			return ret;
+
+		if (channel->speed == 1000)
+			r8a779f0_eth_serdes_write32(channel->addr, 0x0000, 0x1f00, 0x0140);
+		else if (channel->speed == 100)
+			r8a779f0_eth_serdes_write32(channel->addr, 0x0000, 0x1f00, 0x2100);
+
+		/* For AN_ON */
+		r8a779f0_eth_serdes_write32(channel->addr, 0x0004, 0x1f80, 0x0005);
+		r8a779f0_eth_serdes_write32(channel->addr, 0x0028, 0x1f80, 0x07a1);
+		r8a779f0_eth_serdes_write32(channel->addr, 0x0000, 0x1f80, 0x0208);
+		break;
+	default:
+		return -EOPNOTSUPP;
+	}
+
+	return 0;
+}
+
+static int
+r8a779f0_eth_serdes_chan_speed(struct r8a779f0_eth_serdes_channel *channel)
+{
+	int ret;
+
+	switch (channel->phy_interface) {
+	case PHY_INTERFACE_MODE_SGMII:
+		/* For AN_ON */
+		if (channel->speed == 1000)
+			r8a779f0_eth_serdes_write32(channel->addr, 0x0000, 0x1f00, 0x1140);
+		else if (channel->speed == 100)
+			r8a779f0_eth_serdes_write32(channel->addr, 0x0000, 0x1f00, 0x3100);
+		ret = r8a779f0_eth_serdes_reg_wait(channel, 0x0008, 0x1f80, BIT(0), 1);
+		if (ret)
+			return ret;
+		r8a779f0_eth_serdes_write32(channel->addr, 0x0008, 0x1f80, 0x0000);
+		break;
+	default:
+		return -EOPNOTSUPP;
+	}
+
+	return 0;
+}
+
+
+static int r8a779f0_eth_serdes_monitor_linkup(struct r8a779f0_eth_serdes_channel *channel)
+{
+	int i, ret;
+
+	for (i = 0; i < R8A779F0_ETH_SERDES_NUM_RETRY_LINKUP; i++) {
+		ret = r8a779f0_eth_serdes_reg_wait(channel, 0x0004, 0x300,
+						   BIT(2), BIT(2));
+		if (!ret)
+			break;
+
+		/* restart */
+		r8a779f0_eth_serdes_write32(channel->addr, 0x0144, 0x180, 0x0100);
+		udelay(1);
+		r8a779f0_eth_serdes_write32(channel->addr, 0x0144, 0x180, 0x0000);
+	}
+
+	return ret;
+}
+
+static int r8a779f0_eth_serdes_hw_init(struct r8a779f0_eth_serdes_channel *channel)
+{
+	struct r8a779f0_eth_serdes_drv_data *dd = channel->dd;
+	int i, ret;
+
+	if (dd->initialized)
+		return 0;
+
+	ret = r8a779f0_eth_serdes_common_init_ram(dd);
+	if (ret)
+		return ret;
+
+	for (i = 0; i < R8A779F0_ETH_SERDES_NUM; i++) {
+		ret = r8a779f0_eth_serdes_reg_wait(&dd->channel[i], 0x0000,
+						   0x300, BIT(15), 0);
+		if (ret)
+			return ret;
+	}
+
+	for (i = 0; i < R8A779F0_ETH_SERDES_NUM; i++)
+		r8a779f0_eth_serdes_write32(dd->channel[i].addr, 0x03d4, 0x380, 0x0443);
+
+	ret = r8a779f0_eth_serdes_common_setting(channel);
+	if (ret)
+		return ret;
+
+	for (i = 0; i < R8A779F0_ETH_SERDES_NUM; i++)
+		r8a779f0_eth_serdes_write32(dd->channel[i].addr, 0x03d0, 0x380, 0x0001);
+
+
+	r8a779f0_eth_serdes_write32(dd->addr, 0x0000, 0x380, 0x8000);
+
+	ret = r8a779f0_eth_serdes_common_init_ram(dd);
+	if (ret)
+		return ret;
+
+	ret = r8a779f0_eth_serdes_reg_wait(&dd->channel[0], 0x0000, 0x380, BIT(15), 0);
+	if (ret)
+		return ret;
+
+	for (i = 0; i < R8A779F0_ETH_SERDES_NUM; i++) {
+		ret = r8a779f0_eth_serdes_chan_setting(&dd->channel[i]);
+		if (ret)
+			return ret;
+	}
+
+	for (i = 0; i < R8A779F0_ETH_SERDES_NUM; i++) {
+		ret = r8a779f0_eth_serdes_chan_speed(&dd->channel[i]);
+		if (ret)
+			return ret;
+	}
+
+	for (i = 0; i < R8A779F0_ETH_SERDES_NUM; i++)
+		r8a779f0_eth_serdes_write32(dd->channel[i].addr, 0x03c0, 0x380, 0x0000);
+	for (i = 0; i < R8A779F0_ETH_SERDES_NUM; i++)
+		r8a779f0_eth_serdes_write32(dd->channel[i].addr, 0x03d0, 0x380, 0x0000);
+
+	for (i = 0; i < R8A779F0_ETH_SERDES_NUM; i++) {
+		ret = r8a779f0_eth_serdes_monitor_linkup(&dd->channel[i]);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
+static int r8a779f0_eth_serdes_init(struct phy *p)
+{
+	struct r8a779f0_eth_serdes_channel *channel = phy_get_drvdata(p);
+	int i, ret;
+
+	for (i = 0; i < R8A779F0_ETH_SERDES_NUM_RETRY_INIT; i++) {
+		ret = r8a779f0_eth_serdes_hw_init(channel);
+		if (!ret) {
+			channel->dd->initialized = true;
+			break;
+		}
+		usleep_range(1000, 2000);
+	}
+
+	return ret;
+}
+
+static int r8a779f0_eth_serdes_set_mode(struct phy *p, enum phy_mode mode,
+					int submode)
+{
+	struct r8a779f0_eth_serdes_channel *channel = phy_get_drvdata(p);
+
+	if (mode != PHY_MODE_ETHERNET)
+		return -EOPNOTSUPP;
+
+	switch (submode) {
+	case PHY_INTERFACE_MODE_GMII:
+	case PHY_INTERFACE_MODE_SGMII:
+	case PHY_INTERFACE_MODE_USXGMII:
+		channel->phy_interface = submode;
+		return 0;
+	default:
+		return -EOPNOTSUPP;
+	}
+}
+
+static int r8a779f0_eth_serdes_set_speed(struct phy *p, int speed)
+{
+	struct r8a779f0_eth_serdes_channel *channel = phy_get_drvdata(p);
+
+	channel->speed = speed;
+
+	return 0;
+}
+
+static const struct phy_ops r8a779f0_eth_serdes_ops = {
+	.init		= r8a779f0_eth_serdes_init,
+	.set_mode	= r8a779f0_eth_serdes_set_mode,
+	.set_speed	= r8a779f0_eth_serdes_set_speed,
+};
+
+static struct phy *r8a779f0_eth_serdes_xlate(struct device *dev,
+					     struct of_phandle_args *args)
+{
+	struct r8a779f0_eth_serdes_drv_data *dd = dev_get_drvdata(dev);
+
+	if (args->args[0] >= R8A779F0_ETH_SERDES_NUM)
+		return ERR_PTR(-ENODEV);
+
+	return dd->channel[args->args[0]].phy;
+}
+
+static const struct of_device_id r8a779f0_eth_serdes_of_table[] = {
+	{ .compatible = "renesas,r8a779f0-ether-serdes", },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, r8a779f0_eth_serdes_of_table);
+
+static int r8a779f0_eth_serdes_probe(struct platform_device *pdev)
+{
+	struct r8a779f0_eth_serdes_drv_data *dd;
+	struct phy_provider *provider;
+	struct resource *res;
+	int i;
+
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	if (!res) {
+		dev_err(&pdev->dev, "invalid resource\n");
+		return -EINVAL;
+	}
+
+	dd = devm_kzalloc(&pdev->dev, sizeof(*dd), GFP_KERNEL);
+	if (!dd)
+		return -ENOMEM;
+
+	platform_set_drvdata(pdev, dd);
+	dd->pdev = pdev;
+	dd->addr = devm_ioremap_resource(&pdev->dev, res);
+	if (IS_ERR(dd->addr))
+		return PTR_ERR(dd->addr);
+
+	dd->reset = devm_reset_control_get(&pdev->dev, NULL);
+	if (IS_ERR(dd->reset))
+		return PTR_ERR(dd->reset);
+
+	reset_control_reset(dd->reset);
+
+	for (i = 0; i < R8A779F0_ETH_SERDES_NUM; i++) {
+		struct r8a779f0_eth_serdes_channel *channel = &dd->channel[i];
+
+		channel->phy = devm_phy_create(&pdev->dev, NULL,
+					       &r8a779f0_eth_serdes_ops);
+		if (IS_ERR(channel->phy))
+			return PTR_ERR(channel->phy);
+		channel->addr = dd->addr + R8A779F0_ETH_SERDES_OFFSET * i;
+		channel->dd = dd;
+		channel->index = i;
+		phy_set_drvdata(channel->phy, channel);
+	}
+
+	provider = devm_of_phy_provider_register(&pdev->dev,
+						 r8a779f0_eth_serdes_xlate);
+	if (IS_ERR(provider))
+		return PTR_ERR(provider);
+
+	pm_runtime_enable(&pdev->dev);
+	pm_runtime_get_sync(&pdev->dev);
+
+	return 0;
+}
+
+static int r8a779f0_eth_serdes_remove(struct platform_device *pdev)
+{
+	pm_runtime_put(&pdev->dev);
+	pm_runtime_disable(&pdev->dev);
+
+	platform_set_drvdata(pdev, NULL);
+
+	return 0;
+}
+
+static struct platform_driver r8a779f0_eth_serdes_driver_platform = {
+	.probe = r8a779f0_eth_serdes_probe,
+	.remove = r8a779f0_eth_serdes_remove,
+	.driver = {
+		.name = "r8a779f0_eth_serdes",
+		.of_match_table = r8a779f0_eth_serdes_of_table,
+	}
+};
+module_platform_driver(r8a779f0_eth_serdes_driver_platform);
+MODULE_AUTHOR("Yoshihiro Shimoda");
+MODULE_DESCRIPTION("Renesas Ethernet SERDES device driver");
+MODULE_LICENSE("GPL");
-- 
2.35.1

