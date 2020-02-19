Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1F2DF164AA4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Feb 2020 17:37:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726551AbgBSQht (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 19 Feb 2020 11:37:49 -0500
Received: from mail-wr1-f68.google.com ([209.85.221.68]:37314 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726528AbgBSQhs (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 19 Feb 2020 11:37:48 -0500
Received: by mail-wr1-f68.google.com with SMTP id w15so1313695wru.4;
        Wed, 19 Feb 2020 08:37:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=KPmxyNATaLVpAQvuOpd2h7IWbWbQsEMr8UgAvD2qu28=;
        b=n8r7fYcXZK3E7JRs7OI9Y36fSnz6WoXlC7/tv+WMU15W1F3Z4yXVuy1v1ew/0JocM+
         EFWeELkDAfXJyviTQ/6Io0GTve7zs1Rf45gpbgpCpf5gKgvG5vx4K33PNaqPJz7O68O5
         m8/0IYvZBdrswT7rINpiZ/muEulYNErEQR+Nojeq/kgtLFEDLnSLCFNkNvjBjKEgWfPr
         Rix/6YVJ/9kYaKRfz21zWwM1Cxc97fOsHh6CFhv+R65xOA5TC7HgJZXphzXM9Ao+s58e
         P+sRZmkek8nooJPJZIHp4ff7pLcj2PfElXb4fXHOgJvxV0tqNGkcTiCkMfSfg3SaHUMU
         gyiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=KPmxyNATaLVpAQvuOpd2h7IWbWbQsEMr8UgAvD2qu28=;
        b=MhOYpCkDXSYxdhy8HVNSdS9uOHLh3LXJr0GmF+fQFTKN9pFHAvNMq7aOMSXCJhwnj+
         M+IV1PM6PNhqxa724x4s/S2dmPZgwV4+kHROxhWLnQ9gA+GnboW3Pi8NSG17BSKN+4st
         N/t6AX2yKATJCzZ9UYIA+YJb0OIC6qD5dyl1xntZLElA+tuKmsJaFVerlkl6xHkgYetM
         IND9aSOJfYwgb5zKzr7f8AO9DUYIL+X/h6nBogiV6tszjPq6TfzhYjbm3mXT48MJ+jbk
         otSGyjdM0AK5wePYIsNs0+oCr+gCW8wbHRr9mhQvafQLCK4PnjtpNY7sbI6ss6knUbzh
         mW8Q==
X-Gm-Message-State: APjAAAUVHt5ZmC6O/a7TGsoET5NCEVK2IU6ltrIRX3smuOtt7Dx9OBtP
        3XblfYX4hP6Noqz2B8Pb7fA=
X-Google-Smtp-Source: APXvYqzBGnSioRanirnIZ0fE6WCyTMzNuZS5g3Y2HNi1JOITTZdsNv9JQf10ibvZsl0eUnru5u5vgA==
X-Received: by 2002:a5d:5007:: with SMTP id e7mr37079257wrt.228.1582130266405;
        Wed, 19 Feb 2020 08:37:46 -0800 (PST)
Received: from Ansuel-XPS.localdomain ([5.170.104.247])
        by smtp.googlemail.com with ESMTPSA id i204sm464895wma.44.2020.02.19.08.37.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Feb 2020 08:37:45 -0800 (PST)
From:   Ansuel Smith <ansuelsmth@gmail.com>
Cc:     Ansuel Smith <ansuelsmth@gmail.com>,
        Adrian Panella <ianchi74@outlook.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Lee Jones <lee.jones@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] regulator: add smb208 support
Date:   Wed, 19 Feb 2020 17:37:11 +0100
Message-Id: <20200219163711.479-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Smb208 regulators are used on some ipq806x soc.
Add support for it to make it avaiable on some routers
that use it.

Signed-off-by: Adrian Panella <ianchi74@outlook.com>
Signed-off-by: Ansuel Smith <ansuelsmth@gmail.com>
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
2.25.0

