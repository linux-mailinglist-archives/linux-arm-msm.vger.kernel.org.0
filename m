Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 59F8B2CD03C
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Dec 2020 08:15:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388086AbgLCHOL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 3 Dec 2020 02:14:11 -0500
Received: from mail.kernel.org ([198.145.29.99]:59432 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388075AbgLCHOL (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 3 Dec 2020 02:14:11 -0500
From:   Vinod Koul <vkoul@kernel.org>
Authentication-Results: mail.kernel.org; dkim=permerror (bad message/signature format)
To:     Mark Brown <broonie@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>, Andy Gross <agross@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH 2/2] regulator: qcom-rpmh: Add support for PM8350/PM8350c
Date:   Thu,  3 Dec 2020 12:42:44 +0530
Message-Id: <20201203071244.2652297-2-vkoul@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201203071244.2652297-1-vkoul@kernel.org>
References: <20201203071244.2652297-1-vkoul@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add support from RPMH regulators found in PM8350 and PM8350c PMICs

Signed-off-by: Vinod Koul <vkoul@kernel.org>
---
 drivers/regulator/qcom-rpmh-regulator.c | 62 +++++++++++++++++++++++++
 1 file changed, 62 insertions(+)

diff --git a/drivers/regulator/qcom-rpmh-regulator.c b/drivers/regulator/qcom-rpmh-regulator.c
index d488325499a9..800072b90efd 100644
--- a/drivers/regulator/qcom-rpmh-regulator.c
+++ b/drivers/regulator/qcom-rpmh-regulator.c
@@ -865,6 +865,60 @@ static const struct rpmh_vreg_init_data pm8150l_vreg_data[] = {
 	{},
 };
 
+static const struct rpmh_vreg_init_data pm8350_vreg_data[] = {
+	RPMH_VREG("smps1",  "smp%s1",  &pmic5_ftsmps510, "vdd-s1"),
+	RPMH_VREG("smps2",  "smp%s2",  &pmic5_ftsmps510, "vdd-s2"),
+	RPMH_VREG("smps3",  "smp%s3",  &pmic5_ftsmps510, "vdd-s3"),
+	RPMH_VREG("smps4",  "smp%s4",  &pmic5_ftsmps510, "vdd-s4"),
+	RPMH_VREG("smps5",  "smp%s5",  &pmic5_ftsmps510, "vdd-s5"),
+	RPMH_VREG("smps6",  "smp%s6",  &pmic5_ftsmps510, "vdd-s6"),
+	RPMH_VREG("smps7",  "smp%s7",  &pmic5_ftsmps510, "vdd-s7"),
+	RPMH_VREG("smps8",  "smp%s8",  &pmic5_ftsmps510, "vdd-s8"),
+	RPMH_VREG("smps9",  "smp%s9",  &pmic5_ftsmps510, "vdd-s9"),
+	RPMH_VREG("smps10", "smp%s10", &pmic5_hfsmps510, "vdd-s10"),
+	RPMH_VREG("smps11", "smp%s11", &pmic5_hfsmps510, "vdd-s11"),
+	RPMH_VREG("smps12", "smp%s12", &pmic5_hfsmps510, "vdd-s12"),
+	RPMH_VREG("ldo1",   "ldo%s1",  &pmic5_nldo,      "vdd-l1-l4"),
+	RPMH_VREG("ldo2",   "ldo%s2",  &pmic5_pldo,      "vdd-l2-l7"),
+	RPMH_VREG("ldo3",   "ldo%s3",  &pmic5_nldo,      "vdd-l3-l5"),
+	RPMH_VREG("ldo4",   "ldo%s4",  &pmic5_nldo,      "vdd-l1-l4"),
+	RPMH_VREG("ldo5",   "ldo%s5",  &pmic5_nldo,      "vdd-l3-l5"),
+	RPMH_VREG("ldo6",   "ldo%s6",  &pmic5_nldo,      "vdd-l6-l9-l10"),
+	RPMH_VREG("ldo7",   "ldo%s7",  &pmic5_pldo,      "vdd-l2-l7"),
+	RPMH_VREG("ldo8",   "ldo%s8",  &pmic5_nldo,      "vdd-l8"),
+	RPMH_VREG("ldo9",   "ldo%s9",  &pmic5_nldo,      "vdd-l6-l9-l10"),
+	RPMH_VREG("ldo10",  "ldo%s10", &pmic5_nldo,      "vdd-l6-l9-l10"),
+	{},
+};
+
+static const struct rpmh_vreg_init_data pm8350c_vreg_data[] = {
+	RPMH_VREG("smps1",  "smp%s1",  &pmic5_hfsmps510, "vdd-s1"),
+	RPMH_VREG("smps2",  "smp%s2",  &pmic5_ftsmps510, "vdd-s2"),
+	RPMH_VREG("smps3",  "smp%s3",  &pmic5_ftsmps510, "vdd-s3"),
+	RPMH_VREG("smps4",  "smp%s4",  &pmic5_ftsmps510, "vdd-s4"),
+	RPMH_VREG("smps5",  "smp%s5",  &pmic5_ftsmps510, "vdd-s5"),
+	RPMH_VREG("smps6",  "smp%s6",  &pmic5_ftsmps510, "vdd-s6"),
+	RPMH_VREG("smps7",  "smp%s7",  &pmic5_ftsmps510, "vdd-s7"),
+	RPMH_VREG("smps8",  "smp%s8",  &pmic5_ftsmps510, "vdd-s8"),
+	RPMH_VREG("smps9",  "smp%s9",  &pmic5_ftsmps510, "vdd-s9"),
+	RPMH_VREG("smps10", "smp%s10", &pmic5_ftsmps510, "vdd-s10"),
+	RPMH_VREG("ldo1",   "ldo%s1",  &pmic5_pldo_lv,   "vdd-l1-l12"),
+	RPMH_VREG("ldo2",   "ldo%s2",  &pmic5_pldo_lv,   "vdd-l2-l8"),
+	RPMH_VREG("ldo3",   "ldo%s3",  &pmic5_pldo,      "vdd-l3-l4-l5-l7-l13"),
+	RPMH_VREG("ldo4",   "ldo%s4",  &pmic5_pldo,      "vdd-l3-l4-l5-l7-l13"),
+	RPMH_VREG("ldo5",   "ldo%s5",  &pmic5_pldo,      "vdd-l3-l4-l5-l7-l13"),
+	RPMH_VREG("ldo6",   "ldo%s6",  &pmic5_pldo,      "vdd-l6-l9-l11"),
+	RPMH_VREG("ldo7",   "ldo%s7",  &pmic5_pldo,      "vdd-l3-l4-l5-l7-l13"),
+	RPMH_VREG("ldo8",   "ldo%s8",  &pmic5_pldo_lv,   "vdd-l2-l8"),
+	RPMH_VREG("ldo9",   "ldo%s9",  &pmic5_pldo,      "vdd-l6-l9-l11"),
+	RPMH_VREG("ldo10",  "ldo%s10", &pmic5_nldo,      "vdd-l10"),
+	RPMH_VREG("ldo11",  "ldo%s11", &pmic5_pldo,      "vdd-l6-l9-l11"),
+	RPMH_VREG("ldo12",  "ldo%s12", &pmic5_pldo_lv,   "vdd-l1-l12"),
+	RPMH_VREG("ldo13",  "ldo%s13", &pmic5_pldo,      "vdd-l3-l4-l5-l7-l13"),
+	RPMH_VREG("bob",    "bob%s1",  &pmic5_bob,       "vdd-bob"),
+	{},
+};
+
 static const struct rpmh_vreg_init_data pm8009_vreg_data[] = {
 	RPMH_VREG("smps1",  "smp%s1",  &pmic5_hfsmps510, "vdd-s1"),
 	RPMH_VREG("smps2",  "smp%s2",  &pmic5_hfsmps515, "vdd-s2"),
@@ -984,6 +1038,14 @@ static const struct of_device_id __maybe_unused rpmh_regulator_match_table[] = {
 		.compatible = "qcom,pm8150l-rpmh-regulators",
 		.data = pm8150l_vreg_data,
 	},
+	{
+		.compatible = "qcom,pm8350-rpmh-regulators",
+		.data = pm8350_vreg_data,
+	},
+	{
+		.compatible = "qcom,pm8350c-rpmh-regulators",
+		.data = pm8350c_vreg_data,
+	},
 	{
 		.compatible = "qcom,pm8998-rpmh-regulators",
 		.data = pm8998_vreg_data,
-- 
2.26.2

