Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 714B7B9D36
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 Sep 2019 11:51:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405563AbfIUJv1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 21 Sep 2019 05:51:27 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:39204 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2405234AbfIUJv1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 21 Sep 2019 05:51:27 -0400
Received: by mail-wr1-f66.google.com with SMTP id r3so9104917wrj.6
        for <linux-arm-msm@vger.kernel.org>; Sat, 21 Sep 2019 02:51:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=gUvB2IDVhucqoDU2QjHJoWGF/q3qwY0/f00xRAU61Xc=;
        b=JFoS5ykBI8PzvRpm+qwTIXfFfXGXJOqQQUJh1GiZhfPKHago+sJ0Q1KjyZ4NbrvBub
         V1kFCKpw4kBZcaEjLFWrk8xNwH2UZtwbxWdCu0QzKwD/8a277WYNDT9XxWTgwBGJq+ZA
         HBSZ1VZRmQLUngV9x7MKa89u7oqtvs8eIeaoR9efIzuJRzkugH191hw2mL7TgWTX1/O8
         KU+ar7NvpvIKQviu0ZSUEpSQtshnshfdNOal2jNnIQZTJ34ClaLsr+k251+eBdLxKfvY
         XPmshK+vkYQHJSWybIcnWT48hqJS0wDw+ll0QUmi4EMD2zB9X+UfEbOxqPF4YZLU3h1K
         ubFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=gUvB2IDVhucqoDU2QjHJoWGF/q3qwY0/f00xRAU61Xc=;
        b=KbTPm998ogKSzmfUaf5rhgN2wrNLcuQ8fDhX8EmsJfR+Bjy+r7BFXYyDwMgwAbeuOw
         7m8fC3i3wusTc0gav6Qumn/Vz03b4vVW1hXyD7LZ/ayCa3VISgKNWyjps13LMTU/AXBz
         DyWhfnLIO7MdKlE6Hip9btSSd/KMCJQV470TW3xFCgE5ch0Ev4kPWc+E3nw6NY1aixHg
         HOcuWgS4p7NjwLkl77USo8HB8H57SlOlrJHYtXeVGPYVAtwws9QBqXOxAtJSAGq62bP0
         EfR7Ldt60GUIb9fSwj5XIlAx/GBPpQofeic9XBh59+9gZgJw2gZQF1LVJfH9tnq791pY
         5ScQ==
X-Gm-Message-State: APjAAAWU4chv41izsBtOYtpym8DMfcXri86U/RbU/l8m7ylUMoucmdGY
        lBLMNqIYuU11THF/6ui75HAaSRSjbZc=
X-Google-Smtp-Source: APXvYqz1tKsCSD3IpVNWl/0D5wILgSZMUp65qPJpU/7eDyy2OF+IE0ziKvsHgFrNg6WCqeHddeDaeA==
X-Received: by 2002:adf:f112:: with SMTP id r18mr15470191wro.88.1569059482543;
        Sat, 21 Sep 2019 02:51:22 -0700 (PDT)
Received: from IcarusMOD.eternityproject.eu ([93.51.16.173])
        by smtp.gmail.com with ESMTPSA id c8sm4947094wrr.49.2019.09.21.02.51.21
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 21 Sep 2019 02:51:21 -0700 (PDT)
From:   kholk11@gmail.com
To:     linux-arm-msm@vger.kernel.org
Cc:     kholk11@gmail.com, marijns95@gmail.com, broonie@kernel.org,
        lgirdwood@gmail.com, mark.rutland@arm.com, robh+dt@kernel.org,
        lee.jones@linaro.org, agross@kernel.org
Subject: [PATCH 2/5] regulator: qcom_spmi: Add PM8950 SPMI regulator
Date:   Sat, 21 Sep 2019 11:50:40 +0200
Message-Id: <20190921095043.62593-3-kholk11@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190921095043.62593-1-kholk11@gmail.com>
References: <20190921095043.62593-1-kholk11@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: "Angelo G. Del Regno" <kholk11@gmail.com>

The PM8950 has 5 HFSMPS, 1 FTSMPS2.5 (s5, controlling APC voltage)
and 23 LDO regulators.
Add the configuration for this chip.

Signed-off-by: Angelo G. Del Regno <kholk11@gmail.com>
---
 .../regulator/qcom,spmi-regulator.txt         | 21 ++++++++++++
 drivers/regulator/qcom_spmi-regulator.c       | 34 +++++++++++++++++++
 2 files changed, 55 insertions(+)

diff --git a/Documentation/devicetree/bindings/regulator/qcom,spmi-regulator.txt b/Documentation/devicetree/bindings/regulator/qcom,spmi-regulator.txt
index 430b8622bda1..76885fd8a3c9 100644
--- a/Documentation/devicetree/bindings/regulator/qcom,spmi-regulator.txt
+++ b/Documentation/devicetree/bindings/regulator/qcom,spmi-regulator.txt
@@ -8,6 +8,7 @@ Qualcomm SPMI Regulators
 			"qcom,pm8841-regulators"
 			"qcom,pm8916-regulators"
 			"qcom,pm8941-regulators"
+			"qcom,pm8950-regulators"
 			"qcom,pm8994-regulators"
 			"qcom,pmi8994-regulators"
 			"qcom,pms405-regulators"
@@ -72,6 +73,26 @@ Qualcomm SPMI Regulators
 	Definition: Reference to regulator supplying the input pin, as
 		    described in the data sheet.
 
+- vdd_s1-supply:
+- vdd_s2-supply:
+- vdd_s3-supply:
+- vdd_s4-supply:
+- vdd_s4-supply:
+- vdd_s5-supply:
+- vdd_s6-supply:
+- vdd_l1_l19-supply:
+- vdd_l2_l23-supply:
+- vdd_l3-supply:
+- vdd_l4_l5_l6_l7_l16-supply:
+- vdd_l8_l11_l12_l17_l22-supply:
+- vdd_l9_l10_l13_l14_l15_l18-supply:
+- vdd_l20-supply:
+- vdd_l21-supply:
+	Usage: optional (pm8950 only)
+	Value type: <phandle>
+	Definition: reference to regulator supplying the input pin, as
+		    described in the data sheet
+
 - vdd_s1-supply:
 - vdd_s2-supply:
 - vdd_s3-supply:
diff --git a/drivers/regulator/qcom_spmi-regulator.c b/drivers/regulator/qcom_spmi-regulator.c
index 5a269ec46963..3504d9054df1 100644
--- a/drivers/regulator/qcom_spmi-regulator.c
+++ b/drivers/regulator/qcom_spmi-regulator.c
@@ -1871,6 +1871,39 @@ static const struct spmi_regulator_data pm8916_regulators[] = {
 	{ }
 };
 
+static const struct spmi_regulator_data pm8950_regulators[] = {
+	{ "s1", 0x1400, "vdd_s1", },
+	{ "s2", 0x1700, "vdd_s2", },
+	{ "s3", 0x1a00, "vdd_s3", },
+	{ "s4", 0x1d00, "vdd_s4", },
+	{ "s5", 0x2000, "vdd_s5", },
+	{ "s6", 0x2300, "vdd_s6", },
+	{ "l1", 0x4000, "vdd_l1_l19", },
+	{ "l2", 0x4100, "vdd_l2_l23", },
+	{ "l3", 0x4200, "vdd_l3", },
+	{ "l4", 0x4300, "vdd_l4_l5_l6_l7_l16", },
+	{ "l5", 0x4400, "vdd_l4_l5_l6_l7_l16", },
+	{ "l6", 0x4500, "vdd_l4_l5_l6_l7_l16", },
+	{ "l7", 0x4600, "vdd_l4_l5_l6_l7_l16", },
+	{ "l8", 0x4700, "vdd_l8_l11_l12_l17_l22", },
+	{ "l9", 0x4800, "vdd_l9_l10_l13_l14_l15_l18", },
+	{ "l10", 0x4900, "vdd_l9_l10_l13_l14_l15_l18", },
+	{ "l11", 0x4a00, "vdd_l8_l11_l12_l17_l22", },
+	{ "l12", 0x4b00, "vdd_l8_l11_l12_l17_l22", },
+	{ "l13", 0x4c00, "vdd_l9_l10_l13_l14_l15_l18", },
+	{ "l14", 0x4d00, "vdd_l9_l10_l13_l14_l15_l18", },
+	{ "l15", 0x4e00, "vdd_l9_l10_l13_l14_l15_l18", },
+	{ "l16", 0x4f00, "vdd_l4_l5_l6_l7_l16", },
+	{ "l17", 0x5000, "vdd_l8_l11_l12_l17_l22", },
+	{ "l18", 0x5100, "vdd_l9_l10_l13_l14_l15_l18", },
+	{ "l19", 0x5200, "vdd_l1_l19", },
+	{ "l20", 0x5300, "vdd_l20", },
+	{ "l21", 0x5400, "vdd_l21", },
+	{ "l22", 0x5500, "vdd_l8_l11_l12_l17_l22", },
+	{ "l23", 0x5600, "vdd_l2_l23", },
+	{ }
+};
+
 static const struct spmi_regulator_data pm8994_regulators[] = {
 	{ "s1", 0x1400, "vdd_s1", },
 	{ "s2", 0x1700, "vdd_s2", },
@@ -1947,6 +1980,7 @@ static const struct of_device_id qcom_spmi_regulator_match[] = {
 	{ .compatible = "qcom,pm8841-regulators", .data = &pm8841_regulators },
 	{ .compatible = "qcom,pm8916-regulators", .data = &pm8916_regulators },
 	{ .compatible = "qcom,pm8941-regulators", .data = &pm8941_regulators },
+	{ .compatible = "qcom,pm8950-regulators", .data = &pm8950_regulators },
 	{ .compatible = "qcom,pm8994-regulators", .data = &pm8994_regulators },
 	{ .compatible = "qcom,pmi8994-regulators", .data = &pmi8994_regulators },
 	{ .compatible = "qcom,pms405-regulators", .data = &pms405_regulators },
-- 
2.21.0

