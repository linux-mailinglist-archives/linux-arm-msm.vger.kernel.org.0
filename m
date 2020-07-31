Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7D468233E90
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 Jul 2020 06:58:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731052AbgGaE5x (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 31 Jul 2020 00:57:53 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:50269 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731006AbgGaE5x (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 31 Jul 2020 00:57:53 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1596171472; h=Content-Transfer-Encoding: MIME-Version:
 References: In-Reply-To: Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=g13fmLH5MWoCaZ2CBH1tKm0KPDV4tSk0QYM43fNfZuY=; b=mS7C+vvAhsZvA1RqYvptbgcdGvJquIUn2KeZwq+GQCJjg8r0Gye1yaNQfnGvxLoDDUdaPxmJ
 SRbxD+9kwkJRjgE9e8L/ISlNDbV+37cIkFdXWJ2Tpzf5xbDl4DT4RsytA9lMaQ8hmLPrUiyh
 zQ30Qm99+ubTYe2hN954OeSChgE=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n15.prod.us-east-1.postgun.com with SMTP id
 5f23a4af90893260ddaac3a8 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 31 Jul 2020 04:57:19
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 44EEFC433C9; Fri, 31 Jul 2020 04:57:18 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.0
Received: from wcheng-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: wcheng)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 26E51C433CB;
        Fri, 31 Jul 2020 04:57:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 26E51C433CB
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=wcheng@codeaurora.org
From:   Wesley Cheng <wcheng@codeaurora.org>
To:     bjorn.andersson@linaro.org, kishon@ti.com, vkoul@kernel.org,
        agross@kernel.org, balbi@kernel.org, gregkh@linuxfoundation.org,
        robh+dt@kernel.org
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        jackp@codeaurora.org, Wesley Cheng <wcheng@codeaurora.org>
Subject: [PATCH 2/3] phy: qcom-qmp: Register as a typec switch for orientation detection
Date:   Thu, 30 Jul 2020 21:57:11 -0700
Message-Id: <20200731045712.28495-3-wcheng@codeaurora.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200731045712.28495-1-wcheng@codeaurora.org>
References: <20200731045712.28495-1-wcheng@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The lane select switch for USB typec orientation is within the USB QMP PHY.
the current device.  It could be connected through an endpoint, to an
independent device handling the typec detection, ie the QCOM SPMI typec
driver.

Signed-off-by: Wesley Cheng <wcheng@codeaurora.org>
---
 drivers/phy/qualcomm/Kconfig        | 11 +++++
 drivers/phy/qualcomm/phy-qcom-qmp.c | 70 +++++++++++++++++++++++++++--
 2 files changed, 78 insertions(+), 3 deletions(-)

diff --git a/drivers/phy/qualcomm/Kconfig b/drivers/phy/qualcomm/Kconfig
index 928db510b86c..43f46a1b3db1 100644
--- a/drivers/phy/qualcomm/Kconfig
+++ b/drivers/phy/qualcomm/Kconfig
@@ -48,6 +48,17 @@ config PHY_QCOM_QMP
 	  Enable this to support the QMP PHY transceiver that is used
 	  with controllers such as PCIe, UFS, and USB on Qualcomm chips.
 
+if PHY_QCOM_QMP
+config PHY_QCOM_QMP_TYPEC
+	bool "Enable QCOM QMP PHY Type C Switch Support"
+	depends on PHY_QCOM_QMP=y && TYPEC=y || PHY_QCOM_QMP=m && TYPEC
+	help
+	  Register a type C switch from the QMP PHY driver for type C
+	  orientation support.  This has dependencies with if the type C kernel
+	  configuration is enabled or not.  This support will not be present if
+	  USB type C is disabled.
+endif
+
 config PHY_QCOM_QUSB2
 	tristate "Qualcomm QUSB2 PHY Driver"
 	depends on OF && (ARCH_QCOM || COMPILE_TEST)
diff --git a/drivers/phy/qualcomm/phy-qcom-qmp.c b/drivers/phy/qualcomm/phy-qcom-qmp.c
index 562053ce9455..29d8a3570328 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp.c
@@ -19,6 +19,7 @@
 #include <linux/regulator/consumer.h>
 #include <linux/reset.h>
 #include <linux/slab.h>
+#include <linux/usb/typec_mux.h>
 
 #include <dt-bindings/phy/phy.h>
 
@@ -66,6 +67,9 @@
 /* QPHY_V3_PCS_MISC_CLAMP_ENABLE register bits */
 #define CLAMP_EN				BIT(0) /* enables i/o clamp_n */
 
+#define SW_PORTSELECT_VAL			BIT(0)
+#define SW_PORTSELECT_MUX			BIT(1)
+
 #define PHY_INIT_COMPLETE_TIMEOUT		10000
 #define POWER_DOWN_DELAY_US_MIN			10
 #define POWER_DOWN_DELAY_US_MAX			11
@@ -1845,6 +1849,8 @@ struct qmp_phy {
  * @phy_initialized: indicate if PHY has been initialized
  * @mode: current PHY mode
  * @ufs_reset: optional UFS PHY reset handle
+ * @sw: typec switch for receiving orientation changes
+ * @orientation: carries current CC orientation
  */
 struct qcom_qmp {
 	struct device *dev;
@@ -1864,6 +1870,8 @@ struct qcom_qmp {
 	enum phy_mode mode;
 
 	struct reset_control *ufs_reset;
+	struct typec_switch *sw;
+	enum typec_orientation orientation;
 };
 
 static inline void qphy_setbits(void __iomem *base, u32 offset, u32 val)
@@ -2485,6 +2493,7 @@ static int qcom_qmp_phy_com_init(struct qmp_phy *qphy)
 	void __iomem *pcs = qphy->pcs;
 	void __iomem *dp_com = qmp->dp_com;
 	int ret, i;
+	unsigned int val;
 
 	mutex_lock(&qmp->phy_mutex);
 	if (qmp->init_count++) {
@@ -2534,6 +2543,13 @@ static int qcom_qmp_phy_com_init(struct qmp_phy *qphy)
 		qphy_setbits(dp_com, QPHY_V3_DP_COM_PHY_MODE_CTRL,
 			     USB3_MODE | DP_MODE);
 
+		if (cfg->is_dual_lane_phy) {
+			val = SW_PORTSELECT_MUX;
+			if (qmp->orientation == TYPEC_ORIENTATION_REVERSE)
+				val |= SW_PORTSELECT_VAL;
+			qphy_setbits(dp_com, QPHY_V3_DP_COM_TYPEC_CTRL, val);
+		}
+
 		/* bring both QMP USB and QMP DP PHYs PCS block out of reset */
 		qphy_clrbits(dp_com, QPHY_V3_DP_COM_RESET_OVRD_CTRL,
 			     SW_DPPHY_RESET_MUX | SW_DPPHY_RESET |
@@ -2559,7 +2575,7 @@ static int qcom_qmp_phy_com_init(struct qmp_phy *qphy)
 
 	if (cfg->has_phy_com_ctrl) {
 		void __iomem *status;
-		unsigned int mask, val;
+		unsigned int mask;
 
 		qphy_clrbits(serdes, cfg->regs[QPHY_COM_SW_RESET], SW_RESET);
 		qphy_setbits(serdes, cfg->regs[QPHY_COM_START_CONTROL],
@@ -3242,6 +3258,47 @@ static const struct dev_pm_ops qcom_qmp_phy_pm_ops = {
 			   qcom_qmp_phy_runtime_resume, NULL)
 };
 
+#if IS_ENABLED(CONFIG_PHY_QCOM_QMP_TYPEC)
+static int qcom_qmp_phy_typec_switch_set(struct typec_switch *sw,
+					 enum typec_orientation orientation)
+{
+	struct qcom_qmp *qmp = typec_switch_get_drvdata(sw);
+	struct qmp_phy *qphy = qmp->phys[0];
+
+	qmp->orientation = orientation;
+	if (qmp->phy_initialized) {
+		qcom_qmp_phy_disable(qphy->phy);
+		qcom_qmp_phy_enable(qphy->phy);
+	}
+
+	return 0;
+}
+
+static int qcom_qmp_phy_typec_switch_register(struct qcom_qmp *qmp)
+{
+	struct typec_switch_desc sw_desc;
+	struct device *dev = qmp->dev;
+
+	if (qmp->cfg->is_dual_lane_phy) {
+		sw_desc.drvdata = qmp;
+		sw_desc.fwnode = dev->fwnode;
+		sw_desc.set = qcom_qmp_phy_typec_switch_set;
+		qmp->sw = typec_switch_register(dev, &sw_desc);
+		if (IS_ERR(qmp->sw)) {
+			dev_err(dev, "Error registering typec switch: %ld\n",
+				PTR_ERR(qmp->sw));
+		}
+	}
+
+	return 0;
+}
+#else
+static int qcom_qmp_phy_typec_switch_register(struct qcom_qmp *qmp)
+{
+	return 0;
+}
+#endif
+
 static int qcom_qmp_phy_probe(struct platform_device *pdev)
 {
 	struct qcom_qmp *qmp;
@@ -3250,7 +3307,7 @@ static int qcom_qmp_phy_probe(struct platform_device *pdev)
 	struct device_node *child;
 	struct phy_provider *phy_provider;
 	void __iomem *base;
-	int num, id;
+	int num = 0, id;
 	int ret;
 
 	qmp = devm_kzalloc(dev, sizeof(*qmp), GFP_KERNEL);
@@ -3302,7 +3359,11 @@ static int qcom_qmp_phy_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	num = of_get_available_child_count(dev->of_node);
+	qcom_qmp_phy_typec_switch_register(qmp);
+	for_each_available_child_of_node(dev->of_node, child) {
+		if (!strncmp("lanes", child->name, 5))
+			num++;
+	}
 	/* do we have a rogue child node ? */
 	if (num > qmp->cfg->nlanes)
 		return -EINVAL;
@@ -3322,6 +3383,9 @@ static int qcom_qmp_phy_probe(struct platform_device *pdev)
 
 	for_each_available_child_of_node(dev->of_node, child) {
 		/* Create per-lane phy */
+		if (strncmp("lanes", child->name, 5))
+			continue;
+
 		ret = qcom_qmp_phy_create(dev, child, id);
 		if (ret) {
 			dev_err(dev, "failed to create lane%d phy, %d\n",
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

