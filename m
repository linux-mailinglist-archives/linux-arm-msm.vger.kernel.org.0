Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 83FD82829B0
	for <lists+linux-arm-msm@lfdr.de>; Sun,  4 Oct 2020 10:51:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725826AbgJDIvb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 4 Oct 2020 04:51:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49114 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725825AbgJDIvb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 4 Oct 2020 04:51:31 -0400
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC42AC0613CE;
        Sun,  4 Oct 2020 01:51:30 -0700 (PDT)
Received: by mail-lf1-x142.google.com with SMTP id y11so7316259lfl.5;
        Sun, 04 Oct 2020 01:51:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1EMxUviwz/CJ/4qYChB+sXj1n3HdtHHkMxKQEJWzWbQ=;
        b=Zm2B9f9GM65LVyC7Ke63rPB8LZe2xCOaN0jxnc7gu0y9zG481lJ1s/3CewaYOPQqaL
         OaVaxMSy/A3LUiODYcsd9o1SUTpAMmno7rTIUGgy1f2ko9ugAFpEUSdsASsnPmBSFJwI
         m9/tfVDnrY4xccGI6qrLBheE5BWqf+EvJ7mQfj7xr8OxwGckCplZeepR2YQ4E4zGIsfR
         dIv5dziWrbeTRuoKP/OmIue40OdGFD+IfoIjwX1pqYE/UmCl+n8OgygudFtLMjuf23a0
         atCpGDz+l2a31Ge3kF5N/YKjRr5Q1p7PL+bpFtFAabjFanoRRV+xH4wu5v45FNPCKfON
         6RbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1EMxUviwz/CJ/4qYChB+sXj1n3HdtHHkMxKQEJWzWbQ=;
        b=QvgUPGpjQ3PLCk5o5tbrT3xcyxRK3kAwM+6ArZV1RWr3GI9ckI1ty3Y98ZZPQIFwL1
         Ytsut+RV4qPUrbVGvdd8WvEStcUh/JJFVgubQ3FwTcfQU8Kjq82OYrI0Cms8FlMI3eZl
         JvCX/7Z97jo1rYOuepkzkOoJPX3jPKZyYfJ4Kt6irtjRxKp28gcgJHyYoc7e1ACbHr/D
         8EFLNoakv+EPsnjSPWf5+g/S7SuRRz6JiQjTr4LhQ7FeRWKUEUpamprsAAu9/778nCYW
         SPxyl0HFGIC0L6/ffzCXXYODmdXFc64G4o8MPDFeHSZ70ojrfuDOIOL2v4f/9+qsx05p
         O/tg==
X-Gm-Message-State: AOAM533yY2G4/Fg4nMcUD4XrI4N518ELfF32VwfWMnMd8mfXapc/1DYf
        NnNwaSNm+vibfVPtBN/wofI=
X-Google-Smtp-Source: ABdhPJzNK1pYhVaarVM8ARL83DwiIyWXUid7PAbWXaU8e6SlFwx0gJcKDUknCOQXpPc16WD89WIKhw==
X-Received: by 2002:ac2:592d:: with SMTP id v13mr1703745lfi.355.1601801489157;
        Sun, 04 Oct 2020 01:51:29 -0700 (PDT)
Received: from localhost.localdomain (host-5-58-109-138.bitternet.ua. [5.58.109.138])
        by smtp.gmail.com with ESMTPSA id u1sm2217468lfu.24.2020.10.04.01.51.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2020 01:51:28 -0700 (PDT)
From:   Vladimir Lypak <junak.pub@gmail.com>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Kathiravan T <kathirav@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Cc:     Vladimir Lypak <junak.pub@gmail.com>
Subject: [PATCH 1/2] regulator: qcom_smd: add pm8953 regulators
Date:   Sun,  4 Oct 2020 11:34:12 +0300
Message-Id: <20201004083413.324351-1-junak.pub@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The PM8953 is commonly used on board with MSM8953 SoCs or its variants:
APQ8053, SDM(SDA)450 and SDM(SDA)632.
It provides 7 SMPS and 23 LDO regulators.

Signed-off-by: Vladimir Lypak <junak.pub@gmail.com>
---
 drivers/regulator/qcom_smd-regulator.c | 54 ++++++++++++++++++++++++++
 1 file changed, 54 insertions(+)

diff --git a/drivers/regulator/qcom_smd-regulator.c b/drivers/regulator/qcom_smd-regulator.c
index faa99690b7b3..bb944ee5fe3b 100644
--- a/drivers/regulator/qcom_smd-regulator.c
+++ b/drivers/regulator/qcom_smd-regulator.c
@@ -403,6 +403,24 @@ static const struct regulator_desc pm8950_pldo = {
 	.ops = &rpm_smps_ldo_ops,
 };
 
+static const struct regulator_desc pm8953_lnldo = {
+	.linear_ranges = (struct linear_range[]) {
+		REGULATOR_LINEAR_RANGE(1380000, 8, 15, 120000),
+		REGULATOR_LINEAR_RANGE(690000, 0, 7, 60000),
+	},
+	.n_linear_ranges = 2,
+	.n_voltages = 16,
+	.ops = &rpm_smps_ldo_ops,
+};
+
+static const struct regulator_desc pm8953_ult_nldo = {
+	.linear_ranges = (struct linear_range[]) {
+		REGULATOR_LINEAR_RANGE(375000, 0, 93, 12500),
+	},
+	.n_linear_ranges = 1,
+	.n_voltages = 94,
+	.ops = &rpm_smps_ldo_ops,
+};
 
 static const struct regulator_desc pm8994_hfsmps = {
 	.linear_ranges = (struct linear_range[]) {
@@ -854,6 +872,41 @@ static const struct rpm_regulator_data rpm_pm8950_regulators[] = {
 	{}
 };
 
+static const struct rpm_regulator_data rpm_pm8953_regulators[] = {
+	{  "s1", QCOM_SMD_RPM_SMPA,  1, &pm8998_hfsmps, "vdd_s1" },
+	{  "s2", QCOM_SMD_RPM_SMPA,  2, &pm8998_hfsmps, "vdd_s2" },
+	{  "s3", QCOM_SMD_RPM_SMPA,  3, &pm8998_hfsmps, "vdd_s3" },
+	{  "s4", QCOM_SMD_RPM_SMPA,  4, &pm8998_hfsmps, "vdd_s4" },
+	{  "s5", QCOM_SMD_RPM_SMPA,  5, &pm8950_ftsmps2p5, "vdd_s5" },
+	{  "s6", QCOM_SMD_RPM_SMPA,  6, &pm8950_ftsmps2p5, "vdd_s6" },
+	{  "s7", QCOM_SMD_RPM_SMPA,  7, &pm8998_hfsmps, "vdd_s7" },
+
+	{  "l1", QCOM_SMD_RPM_LDOA,  1, &pm8953_ult_nldo, "vdd_l1" },
+	{  "l2", QCOM_SMD_RPM_LDOA,  2, &pm8953_ult_nldo, "vdd_l2_l3" },
+	{  "l3", QCOM_SMD_RPM_LDOA,  3, &pm8953_ult_nldo, "vdd_l2_l3" },
+	{  "l4", QCOM_SMD_RPM_LDOA,  4, &pm8950_ult_pldo, "vdd_l4_l5_l6_l7_l16_l19" },
+	{  "l5", QCOM_SMD_RPM_LDOA,  5, &pm8950_ult_pldo, "vdd_l4_l5_l6_l7_l16_l19" },
+	{  "l6", QCOM_SMD_RPM_LDOA,  6, &pm8950_ult_pldo, "vdd_l4_l5_l6_l7_l16_l19" },
+	{  "l7", QCOM_SMD_RPM_LDOA,  7, &pm8950_ult_pldo, "vdd_l4_l5_l6_l7_l16_l19" },
+	{  "l8", QCOM_SMD_RPM_LDOA,  8, &pm8950_ult_pldo, "vdd_l8_l11_l12_l13_l14_l15" },
+	{  "l9", QCOM_SMD_RPM_LDOA,  9, &pm8950_ult_pldo, "vdd_l9_l10_l17_l18_l22" },
+	{ "l10", QCOM_SMD_RPM_LDOA, 10, &pm8950_ult_pldo, "vdd_l9_l10_l17_l18_l22" },
+	{ "l11", QCOM_SMD_RPM_LDOA, 11, &pm8950_ult_pldo, "vdd_l8_l11_l12_l13_l14_l15" },
+	{ "l12", QCOM_SMD_RPM_LDOA, 12, &pm8950_ult_pldo, "vdd_l8_l11_l12_l13_l14_l15" },
+	{ "l13", QCOM_SMD_RPM_LDOA, 13, &pm8950_ult_pldo, "vdd_l8_l11_l12_l13_l14_l15" },
+	{ "l14", QCOM_SMD_RPM_LDOA, 14, &pm8950_ult_pldo, "vdd_l8_l11_l12_l13_l14_l15" },
+	{ "l15", QCOM_SMD_RPM_LDOA, 15, &pm8950_ult_pldo, "vdd_l8_l11_l12_l13_l14_l15" },
+	{ "l16", QCOM_SMD_RPM_LDOA, 16, &pm8950_ult_pldo, "vdd_l4_l5_l6_l7_l16_l19" },
+	{ "l17", QCOM_SMD_RPM_LDOA, 17, &pm8950_ult_pldo, "vdd_l9_l10_l17_l18_l22" },
+	{ "l18", QCOM_SMD_RPM_LDOA, 18, &pm8950_ult_pldo, "vdd_l9_l10_l17_l18_l22" },
+	{ "l19", QCOM_SMD_RPM_LDOA, 19, &pm8953_ult_nldo, "vdd_l4_l5_l6_l7_l16_l19" },
+	{ "l20", QCOM_SMD_RPM_LDOA, 20, &pm8953_lnldo,    "vdd_l20" },
+	{ "l21", QCOM_SMD_RPM_LDOA, 21, &pm8953_lnldo,    "vdd_l21" },
+	{ "l22", QCOM_SMD_RPM_LDOA, 22, &pm8950_ult_pldo, "vdd_l9_l10_l17_l18_l22" },
+	{ "l23", QCOM_SMD_RPM_LDOA, 23, &pm8953_ult_nldo, "vdd_l23" },
+	{}
+};
+
 static const struct rpm_regulator_data rpm_pm8994_regulators[] = {
 	{ "s1", QCOM_SMD_RPM_SMPA, 1, &pm8994_ftsmps, "vdd_s1" },
 	{ "s2", QCOM_SMD_RPM_SMPA, 2, &pm8994_ftsmps, "vdd_s2" },
@@ -1041,6 +1094,7 @@ static const struct of_device_id rpm_of_match[] = {
 	{ .compatible = "qcom,rpm-pm8916-regulators", .data = &rpm_pm8916_regulators },
 	{ .compatible = "qcom,rpm-pm8941-regulators", .data = &rpm_pm8941_regulators },
 	{ .compatible = "qcom,rpm-pm8950-regulators", .data = &rpm_pm8950_regulators },
+	{ .compatible = "qcom,rpm-pm8953-regulators", .data = &rpm_pm8953_regulators },
 	{ .compatible = "qcom,rpm-pm8994-regulators", .data = &rpm_pm8994_regulators },
 	{ .compatible = "qcom,rpm-pm8998-regulators", .data = &rpm_pm8998_regulators },
 	{ .compatible = "qcom,rpm-pm660-regulators", .data = &rpm_pm660_regulators },
-- 
2.24.1

