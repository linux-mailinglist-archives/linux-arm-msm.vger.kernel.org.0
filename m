Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 423551707FF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Feb 2020 19:48:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727362AbgBZSsY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 26 Feb 2020 13:48:24 -0500
Received: from foss.arm.com ([217.140.110.172]:41414 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727308AbgBZSsX (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 26 Feb 2020 13:48:23 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C752430E;
        Wed, 26 Feb 2020 10:48:22 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3E3BF3F881;
        Wed, 26 Feb 2020 10:48:22 -0800 (PST)
Date:   Wed, 26 Feb 2020 18:48:20 +0000
From:   Mark Brown <broonie@kernel.org>
To:     Ansuel Smith <ansuelsmth@gmail.com>
Cc:     Adrian Panella <ianchi74@outlook.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        devicetree@vger.kernel.org, Lee Jones <lee.jones@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mark Brown <broonie@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>
Subject: Applied "regulator: add smb208 support" to the regulator tree
In-Reply-To:  <20200219163711.479-1-ansuelsmth@gmail.com>
Message-Id:  <applied-20200219163711.479-1-ansuelsmth@gmail.com>
X-Patchwork-Hint: ignore
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The patch

   regulator: add smb208 support

has been applied to the regulator tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git 

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.  

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

From b5f25304aece9f2e7eaab275bbb5461c666bf38c Mon Sep 17 00:00:00 2001
From: Ansuel Smith <ansuelsmth@gmail.com>
Date: Wed, 19 Feb 2020 17:37:11 +0100
Subject: [PATCH] regulator: add smb208 support

Smb208 regulators are used on some ipq806x soc.
Add support for it to make it avaiable on some routers
that use it.

Signed-off-by: Ansuel Smith <ansuelsmth@gmail.com>
Signed-off-by: Adrian Panella <ianchi74@outlook.com>
Acked-by: Lee Jones <lee.jones@linaro.org>
Link: https://lore.kernel.org/r/20200219163711.479-1-ansuelsmth@gmail.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 Documentation/devicetree/bindings/mfd/qcom-rpm.txt | 4 ++++
 drivers/regulator/qcom_rpm-regulator.c             | 9 +++++++++
 2 files changed, 13 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/qcom-rpm.txt b/Documentation/devicetree/bindings/mfd/qcom-rpm.txt
index 3c91ad430eea..b823b8625243 100644
--- a/Documentation/devicetree/bindings/mfd/qcom-rpm.txt
+++ b/Documentation/devicetree/bindings/mfd/qcom-rpm.txt
@@ -61,6 +61,7 @@ Regulator nodes are identified by their compatible:
 		    "qcom,rpm-pm8901-regulators"
 		    "qcom,rpm-pm8921-regulators"
 		    "qcom,rpm-pm8018-regulators"
+		    "qcom,rpm-smb208-regulators"
 
 - vdd_l0_l1_lvs-supply:
 - vdd_l2_l11_l12-supply:
@@ -171,6 +172,9 @@ pm8018:
 	s1, s2, s3, s4, s5, , l1, l2, l3, l4, l5, l6, l7, l8, l9, l10, l11,
 	l12, l14, lvs1
 
+smb208:
+	s1a, s1b, s2a, s2b
+
 The content of each sub-node is defined by the standard binding for regulators -
 see regulator.txt - with additional custom properties described below:
 
diff --git a/drivers/regulator/qcom_rpm-regulator.c b/drivers/regulator/qcom_rpm-regulator.c
index 7407cd5a1b74..7fc97f23fcf4 100644
--- a/drivers/regulator/qcom_rpm-regulator.c
+++ b/drivers/regulator/qcom_rpm-regulator.c
@@ -925,12 +925,21 @@ static const struct rpm_regulator_data rpm_pm8921_regulators[] = {
 	{ }
 };
 
+static const struct rpm_regulator_data rpm_smb208_regulators[] = {
+	{ "s1a",  QCOM_RPM_SMB208_S1a, &smb208_smps, "vin_s1a" },
+	{ "s1b",  QCOM_RPM_SMB208_S1b, &smb208_smps, "vin_s1b" },
+	{ "s2a",  QCOM_RPM_SMB208_S2a, &smb208_smps, "vin_s2a" },
+	{ "s2b",  QCOM_RPM_SMB208_S2b, &smb208_smps, "vin_s2b" },
+	{ }
+};
+
 static const struct of_device_id rpm_of_match[] = {
 	{ .compatible = "qcom,rpm-pm8018-regulators",
 		.data = &rpm_pm8018_regulators },
 	{ .compatible = "qcom,rpm-pm8058-regulators", .data = &rpm_pm8058_regulators },
 	{ .compatible = "qcom,rpm-pm8901-regulators", .data = &rpm_pm8901_regulators },
 	{ .compatible = "qcom,rpm-pm8921-regulators", .data = &rpm_pm8921_regulators },
+	{ .compatible = "qcom,rpm-smb208-regulators", .data = &rpm_smb208_regulators },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, rpm_of_match);
-- 
2.20.1

