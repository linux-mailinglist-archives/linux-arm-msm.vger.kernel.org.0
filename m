Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 499931B61EF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Apr 2020 19:28:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729893AbgDWR2v (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 23 Apr 2020 13:28:51 -0400
Received: from mail26.static.mailgun.info ([104.130.122.26]:17472 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729802AbgDWR2v (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 23 Apr 2020 13:28:51 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1587662930; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=cxfuvRu3LSOmwmNCPdvKgSuEMztyXS3OI1EIKjoDUaE=; b=GU7KFGJy6EHSDc/QQLBJ7sM9QfLiDuLK4mo/zEqlYZVhs1H5xiMGIAd2pz+EXMDoLYRGsAiC
 8DIyn5mgpvEm7ULfLq17YsiMYX7oX5uEVajcVaDk/sD1b4Scf128T4igYOfuWgbEvRwV0Dpg
 ciTT8EDmWtZJDgwVlQZea5478L0=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5ea1cfeb.7f6547a765e0-smtp-out-n02;
 Thu, 23 Apr 2020 17:27:07 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 944A8C432C2; Thu, 23 Apr 2020 17:27:06 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from wcheng-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: wcheng)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 78E6AC433CB;
        Thu, 23 Apr 2020 17:27:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 78E6AC433CB
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=wcheng@codeaurora.org
From:   Wesley Cheng <wcheng@codeaurora.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org, kishon@ti.com
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Wesley Cheng <wcheng@codeaurora.org>
Subject: [PATCH] phy: qcom-snps: Add runtime suspend and resume handlers
Date:   Thu, 23 Apr 2020 10:26:58 -0700
Message-Id: <1587662818-4461-1-git-send-email-wcheng@codeaurora.org>
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
Depends-on: phy: qcom-snps: Add SNPS USB PHY driver for QCOM based SOCs
(https://patchwork.kernel.org/patch/11486171/)
---
 drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c | 93 +++++++++++++++++++++++++++
 1 file changed, 93 insertions(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c b/drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c
index 20442a3..f48d877 100644
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
@@ -104,6 +108,77 @@ static inline void qcom_snps_hsphy_write_mask(void __iomem *base, u32 offset,
 	readl_relaxed(base + offset);
 }
 
+static int qcom_snps_hsphy_suspend(struct qcom_snps_hsphy *hsphy)
+{
+	if (hsphy->suspended)
+		return 0;
+
+	dev_dbg(&hsphy->phy->dev, "Suspend QCOM SNPS PHY, mode = %d \n", hsphy->mode);
+
+	if (hsphy->mode == PHY_MODE_USB_HOST) {
+		/* Enable auto-resume to meet remote wakeup timing */
+		qcom_snps_hsphy_write_mask(hsphy->base, USB2_PHY_USB_PHY_HS_PHY_CTRL2,
+										USB2_AUTO_RESUME, USB2_AUTO_RESUME);
+		usleep_range(500, 1000);
+		qcom_snps_hsphy_write_mask(hsphy->base, USB2_PHY_USB_PHY_HS_PHY_CTRL2,
+										0, USB2_AUTO_RESUME);
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
+	int ret = 0;
+
+	if (!hsphy->suspended)
+		return 0;
+
+	dev_dbg(&hsphy->phy->dev, "Resume QCOM SNPS PHY, mode = %d \n", hsphy->mode);
+
+	ret = clk_prepare_enable(hsphy->cfg_ahb_clk);
+	if (ret) {
+		dev_err(&hsphy->phy->dev, "failed to enable cfg ahb clock, %d\n", ret);
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
+static int qcom_snps_hsphy_set_mode(struct phy *phy, enum phy_mode mode, int submode)
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
@@ -171,6 +246,7 @@ static int qcom_snps_hsphy_init(struct phy *phy)
 					UTMI_PHY_CMN_CTRL_OVERRIDE_EN, 0);
 
 	hsphy->phy_initialized = true;
+	hsphy->suspended = false;
 
 	return 0;
 
@@ -197,6 +273,7 @@ static int qcom_snps_hsphy_exit(struct phy *phy)
 static const struct phy_ops qcom_snps_hsphy_gen_ops = {
 	.init		= qcom_snps_hsphy_init,
 	.exit		= qcom_snps_hsphy_exit,
+	.set_mode	= qcom_snps_hsphy_set_mode,
 	.owner		= THIS_MODULE,
 };
 
@@ -208,6 +285,11 @@ static int qcom_snps_hsphy_exit(struct phy *phy)
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
@@ -251,6 +333,14 @@ static int qcom_snps_hsphy_probe(struct platform_device *pdev)
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
@@ -265,6 +355,8 @@ static int qcom_snps_hsphy_probe(struct platform_device *pdev)
 	phy_provider = devm_of_phy_provider_register(dev, of_phy_simple_xlate);
 	if (!IS_ERR(phy_provider))
 		dev_dbg(dev, "Registered Qcom-SNPS HS phy\n");
+	else
+		pm_runtime_disable(dev);
 
 	return PTR_ERR_OR_ZERO(phy_provider);
 }
@@ -273,6 +365,7 @@ static int qcom_snps_hsphy_probe(struct platform_device *pdev)
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
