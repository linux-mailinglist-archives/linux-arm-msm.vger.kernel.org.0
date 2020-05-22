Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 92B551DDCC8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2020 03:50:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726948AbgEVBuL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 21 May 2020 21:50:11 -0400
Received: from mail26.static.mailgun.info ([104.130.122.26]:41736 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726860AbgEVBuL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 21 May 2020 21:50:11 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1590112210; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=NuvH0/XX4SUkUG7dpvDQbID3uIFUKkkCKc2S5KVLPWM=; b=oP4sXPeD1ZEtZQcjPGVb6/wK0UGLH39XfKCwLpdBTJkp5JHjAMn4vWPr15lwisZQKP5jVJmC
 fk3fvmp7zkSaYouuY7KUmRzAFh0kuTUjJbpawRRGvQ9Je7aSwwsXPqXx+ViFDiDHs5C4wVvf
 fNIAb7yBOOC8z2+qFF97NTYWjQE=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-east-1.postgun.com with SMTP id
 5ec72fce4110e147180c7d9d (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 22 May 2020 01:50:06
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 22B80C433CA; Fri, 22 May 2020 01:50:06 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from wcheng-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: wcheng)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id D9FE5C433C6;
        Fri, 22 May 2020 01:50:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org D9FE5C433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=wcheng@codeaurora.org
From:   Wesley Cheng <wcheng@codeaurora.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org, kishon@ti.com,
        vkoul@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Wesley Cheng <wcheng@codeaurora.org>
Subject: [PATCH v2] phy: qcom-snps: Add runtime suspend and resume handlers
Date:   Thu, 21 May 2020 18:50:00 -0700
Message-Id: <1590112200-1110-1-git-send-email-wcheng@codeaurora.org>
X-Mailer: git-send-email 1.9.1
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Allow for the PHY to be put into a powered down state when possible.
Add the required suspend and resume callbacks, which will determine
what resources can be turned off depending on the cable status.

Signed-off-by: Wesley Cheng <wcheng@codeaurora.org>

---
Changes in v2:
 - Addressed checkpatch alignment/line length warnings.
 - Removed superfluous init in qcom_snps_hsphy_resume().

 drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c | 100 ++++++++++++++++++++++++++
 1 file changed, 100 insertions(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c b/drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c
index 4d74045..0a4e77af 100644
--- a/drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c
+++ b/drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c
@@ -76,7 +76,9 @@
  * @iface_clk: phy interface clock
  * @phy_reset: phy reset control
  * @vregs: regulator supplies bulk data
+ * @suspended: PHY is in the suspended state
  * @phy_initialized: if PHY has been initialized correctly
+ * @mode: contains the current mode the PHY is in
  */
 struct qcom_snps_hsphy {
 	struct phy *phy;
@@ -87,7 +89,9 @@ struct qcom_snps_hsphy {
 	struct reset_control *phy_reset;
 	struct regulator_bulk_data vregs[SNPS_HS_NUM_VREGS];
 
+	bool suspended;
 	bool phy_initialized;
+	enum phy_mode mode;
 };
 
 static inline void qcom_snps_hsphy_write_mask(void __iomem *base, u32 offset,
@@ -104,6 +108,84 @@ static inline void qcom_snps_hsphy_write_mask(void __iomem *base, u32 offset,
 	readl_relaxed(base + offset);
 }
 
+static int qcom_snps_hsphy_suspend(struct qcom_snps_hsphy *hsphy)
+{
+	if (hsphy->suspended)
+		return 0;
+
+	dev_dbg(&hsphy->phy->dev, "Suspend QCOM SNPS PHY, mode:%d\n",
+		hsphy->mode);
+
+	if (hsphy->mode == PHY_MODE_USB_HOST) {
+		/* Enable auto-resume to meet remote wakeup timing */
+		qcom_snps_hsphy_write_mask(hsphy->base,
+						USB2_PHY_USB_PHY_HS_PHY_CTRL2,
+						USB2_AUTO_RESUME,
+						USB2_AUTO_RESUME);
+		usleep_range(500, 1000);
+		qcom_snps_hsphy_write_mask(hsphy->base,
+						USB2_PHY_USB_PHY_HS_PHY_CTRL2,
+						0, USB2_AUTO_RESUME);
+	}
+
+	clk_disable_unprepare(hsphy->cfg_ahb_clk);
+	hsphy->suspended = true;
+
+	return 0;
+}
+
+static int qcom_snps_hsphy_resume(struct qcom_snps_hsphy *hsphy)
+{
+	int ret;
+
+	if (!hsphy->suspended)
+		return 0;
+
+	dev_dbg(&hsphy->phy->dev, "Resume QCOM SNPS PHY, mode:%d\n",
+		hsphy->mode);
+
+	ret = clk_prepare_enable(hsphy->cfg_ahb_clk);
+	if (ret) {
+		dev_err(&hsphy->phy->dev,
+			"failed to enable cfg ahb clock, %d\n", ret);
+		return ret;
+	}
+
+	hsphy->suspended = false;
+	return 0;
+}
+
+static int __maybe_unused qcom_snps_hsphy_runtime_suspend(struct device *dev)
+{
+	struct qcom_snps_hsphy *hsphy = dev_get_drvdata(dev);
+
+	if (!hsphy->phy_initialized)
+		return 0;
+
+	qcom_snps_hsphy_suspend(hsphy);
+	return 0;
+}
+
+static int __maybe_unused qcom_snps_hsphy_runtime_resume(struct device *dev)
+{
+	struct qcom_snps_hsphy *hsphy = dev_get_drvdata(dev);
+
+	if (!hsphy->phy_initialized)
+		return 0;
+
+	qcom_snps_hsphy_resume(hsphy);
+	return 0;
+}
+
+static int qcom_snps_hsphy_set_mode(struct phy *phy, enum phy_mode mode,
+					int submode)
+{
+	struct qcom_snps_hsphy *hsphy = phy_get_drvdata(phy);
+
+	hsphy->mode = mode;
+	return 0;
+}
+
 static int qcom_snps_hsphy_init(struct phy *phy)
 {
 	struct qcom_snps_hsphy *hsphy = phy_get_drvdata(phy);
@@ -175,6 +257,7 @@ static int qcom_snps_hsphy_init(struct phy *phy)
 					UTMI_PHY_CMN_CTRL_OVERRIDE_EN, 0);
 
 	hsphy->phy_initialized = true;
+	hsphy->suspended = false;
 
 	return 0;
 
@@ -201,6 +284,7 @@ static int qcom_snps_hsphy_exit(struct phy *phy)
 static const struct phy_ops qcom_snps_hsphy_gen_ops = {
 	.init		= qcom_snps_hsphy_init,
 	.exit		= qcom_snps_hsphy_exit,
+	.set_mode	= qcom_snps_hsphy_set_mode,
 	.owner		= THIS_MODULE,
 };
 
@@ -212,6 +296,11 @@ static int qcom_snps_hsphy_exit(struct phy *phy)
 };
 MODULE_DEVICE_TABLE(of, qcom_snps_hsphy_of_match_table);
 
+static const struct dev_pm_ops qcom_snps_hsphy_pm_ops = {
+	SET_RUNTIME_PM_OPS(qcom_snps_hsphy_runtime_suspend,
+			   qcom_snps_hsphy_runtime_resume, NULL)
+};
+
 static int qcom_snps_hsphy_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -255,6 +344,14 @@ static int qcom_snps_hsphy_probe(struct platform_device *pdev)
 		return ret;
 	}
 
+	pm_runtime_set_active(dev);
+	pm_runtime_enable(dev);
+	/*
+	 * Prevent runtime pm from being ON by default. Users can enable
+	 * it using power/control in sysfs.
+	 */
+	pm_runtime_forbid(dev);
+
 	generic_phy = devm_phy_create(dev, NULL, &qcom_snps_hsphy_gen_ops);
 	if (IS_ERR(generic_phy)) {
 		ret = PTR_ERR(generic_phy);
@@ -269,6 +366,8 @@ static int qcom_snps_hsphy_probe(struct platform_device *pdev)
 	phy_provider = devm_of_phy_provider_register(dev, of_phy_simple_xlate);
 	if (!IS_ERR(phy_provider))
 		dev_dbg(dev, "Registered Qcom-SNPS HS phy\n");
+	else
+		pm_runtime_disable(dev);
 
 	return PTR_ERR_OR_ZERO(phy_provider);
 }
@@ -277,6 +376,7 @@ static int qcom_snps_hsphy_probe(struct platform_device *pdev)
 	.probe		= qcom_snps_hsphy_probe,
 	.driver = {
 		.name	= "qcom-snps-hs-femto-v2-phy",
+		.pm = &qcom_snps_hsphy_pm_ops,
 		.of_match_table = qcom_snps_hsphy_of_match_table,
 	},
 };
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

