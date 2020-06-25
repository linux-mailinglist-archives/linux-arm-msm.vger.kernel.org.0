Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 787B020A635
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2020 21:55:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406920AbgFYTzI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 25 Jun 2020 15:55:08 -0400
Received: from mail29.static.mailgun.info ([104.130.122.29]:21364 "EHLO
        mail29.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2436497AbgFYTzG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 25 Jun 2020 15:55:06 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1593114905; h=Content-Transfer-Encoding: MIME-Version:
 References: In-Reply-To: Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=Fv6O68CAPyYeqDPNu3EghdR2PlPfnrPgK8OXnze7BSQ=; b=GmMkxea4OBlKOyHWOQJzcUbRwFJS1f5j7TMzhxmHIZ09G7X6n4fGCYrJVbuAwkLf/Jt2FtZR
 /1RPWf7vMG2rOpSAns3Lp+88Hp/zYnpzZKQpqO2U14NodGxATZjPc5LYbuYAzdAFUNj3NCEq
 vzRqTkC/Tl/9Oa83P/HkgUosgPs=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-east-1.postgun.com with SMTP id
 5ef501138fe116ddd937fc04 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 25 Jun 2020 19:54:59
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id EE9ACC433CA; Thu, 25 Jun 2020 19:54:58 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from wcheng-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: wcheng)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id C2660C433C6;
        Thu, 25 Jun 2020 19:54:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org C2660C433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=wcheng@codeaurora.org
From:   Wesley Cheng <wcheng@codeaurora.org>
To:     kishon@ti.com, vkoul@kernel.org, agross@kernel.org,
        bjorn.andersson@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        jackp@codeaurora.org, Wesley Cheng <wcheng@codeaurora.org>
Subject: [PATCH v3 1/2] phy: qcom-snps: Add runtime suspend and resume handlers
Date:   Thu, 25 Jun 2020 12:54:43 -0700
Message-Id: <20200625195444.15130-2-wcheng@codeaurora.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200625195444.15130-1-wcheng@codeaurora.org>
References: <20200625195444.15130-1-wcheng@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Allow for the PHY to be put into a powered down state when possible.
Add the required suspend and resume callbacks, which will determine
what resources can be turned off depending on the cable status.

Signed-off-by: Wesley Cheng <wcheng@codeaurora.org>
Reviewed-by: Vinod Koul <vkoul@kernel.org>
---
 drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c | 73 +++++++++++++++++++
 1 file changed, 73 insertions(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c b/drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c
index 4d74045271eb..152d8633f4ea 100644
--- a/drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c
+++ b/drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c
@@ -104,6 +104,63 @@ static inline void qcom_snps_hsphy_write_mask(void __iomem *base, u32 offset,
 	readl_relaxed(base + offset);
 }
 
+static int qcom_snps_hsphy_suspend(struct qcom_snps_hsphy *hsphy)
+{
+	dev_dbg(&hsphy->phy->dev, "Suspend QCOM SNPS PHY\n");
+
+	if (hsphy->mode == PHY_MODE_USB_HOST) {
+		/* Enable auto-resume to meet remote wakeup timing */
+		qcom_snps_hsphy_write_mask(hsphy->base,
+					   USB2_PHY_USB_PHY_HS_PHY_CTRL2,
+					   USB2_AUTO_RESUME,
+					   USB2_AUTO_RESUME);
+		usleep_range(500, 1000);
+		qcom_snps_hsphy_write_mask(hsphy->base,
+					   USB2_PHY_USB_PHY_HS_PHY_CTRL2,
+					   0, USB2_AUTO_RESUME);
+	}
+
+	clk_disable_unprepare(hsphy->cfg_ahb_clk);
+	return 0;
+}
+
+static int qcom_snps_hsphy_resume(struct qcom_snps_hsphy *hsphy)
+{
+	int ret;
+
+	dev_dbg(&hsphy->phy->dev, "Resume QCOM SNPS PHY, mode\n");
+
+	ret = clk_prepare_enable(hsphy->cfg_ahb_clk);
+	if (ret) {
+		dev_err(&hsphy->phy->dev, "failed to enable cfg ahb clock\n");
+		return ret;
+	}
+
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
 static int qcom_snps_hsphy_init(struct phy *phy)
 {
 	struct qcom_snps_hsphy *hsphy = phy_get_drvdata(phy);
@@ -212,6 +269,11 @@ static const struct of_device_id qcom_snps_hsphy_of_match_table[] = {
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
@@ -255,6 +317,14 @@ static int qcom_snps_hsphy_probe(struct platform_device *pdev)
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
@@ -269,6 +339,8 @@ static int qcom_snps_hsphy_probe(struct platform_device *pdev)
 	phy_provider = devm_of_phy_provider_register(dev, of_phy_simple_xlate);
 	if (!IS_ERR(phy_provider))
 		dev_dbg(dev, "Registered Qcom-SNPS HS phy\n");
+	else
+		pm_runtime_disable(dev);
 
 	return PTR_ERR_OR_ZERO(phy_provider);
 }
@@ -277,6 +349,7 @@ static struct platform_driver qcom_snps_hsphy_driver = {
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

