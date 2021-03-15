Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 43E2933B5B9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Mar 2021 14:56:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231349AbhCONzO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 15 Mar 2021 09:55:14 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:58629 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231682AbhCONzI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 15 Mar 2021 09:55:08 -0400
Received: from ironmsg07-lv.qualcomm.com (HELO ironmsg07-lv.qulacomm.com) ([10.47.202.151])
  by alexa-out.qualcomm.com with ESMTP; 15 Mar 2021 06:55:07 -0700
X-QCInternal: smtphost
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
  by ironmsg07-lv.qulacomm.com with ESMTP/TLS/AES256-SHA; 15 Mar 2021 06:55:06 -0700
X-QCInternal: smtphost
Received: from c-skakit-linux.ap.qualcomm.com (HELO c-skakit-linux.qualcomm.com) ([10.242.51.242])
  by ironmsg01-blr.qualcomm.com with ESMTP; 15 Mar 2021 19:24:34 +0530
Received: by c-skakit-linux.qualcomm.com (Postfix, from userid 2344709)
        id 5A44C49BC; Mon, 15 Mar 2021 19:24:33 +0530 (IST)
From:   satya priya <skakit@codeaurora.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, mka@chromium.org,
        rnayak@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        kgunda@codeaurora.org, David Collins <collinsd@codeaurora.org>,
        satya priya <skakit@codeaurora.org>
Subject: [PATCH V2 2/5] regulator: qcom-rpmh: Add PM7325/PMR735A regulator support
Date:   Mon, 15 Mar 2021 19:24:11 +0530
Message-Id: <1615816454-1733-3-git-send-email-skakit@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1615816454-1733-1-git-send-email-skakit@codeaurora.org>
References: <1615816454-1733-1-git-send-email-skakit@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add support for PM7325/PMR735A regulators. This ensures
that consumers are able to modify the physical state of PMIC
regulators.

Signed-off-by: satya priya <skakit@codeaurora.org>
---
Changes in V2:
 - No change.

 drivers/regulator/qcom-rpmh-regulator.c | 53 ++++++++++++++++++++++++++++++++-
 1 file changed, 52 insertions(+), 1 deletion(-)

diff --git a/drivers/regulator/qcom-rpmh-regulator.c b/drivers/regulator/qcom-rpmh-regulator.c
index 9471890..3509523 100644
--- a/drivers/regulator/qcom-rpmh-regulator.c
+++ b/drivers/regulator/qcom-rpmh-regulator.c
@@ -1,5 +1,5 @@
 // SPDX-License-Identifier: GPL-2.0
-// Copyright (c) 2018-2019, The Linux Foundation. All rights reserved.
+// Copyright (c) 2018-2021, The Linux Foundation. All rights reserved.
 
 #define pr_fmt(fmt) "%s: " fmt, __func__
 
@@ -1042,6 +1042,49 @@ static const struct rpmh_vreg_init_data pmx55_vreg_data[] = {
 	{},
 };
 
+static const struct rpmh_vreg_init_data pm7325_vreg_data[] = {
+	RPMH_VREG("smps1",  "smp%s1",  &pmic5_hfsmps510, "vdd-s1"),
+	RPMH_VREG("smps2",  "smp%s2",  &pmic5_ftsmps520, "vdd-s2"),
+	RPMH_VREG("smps3",  "smp%s3",  &pmic5_ftsmps520, "vdd-s3"),
+	RPMH_VREG("smps4",  "smp%s4",  &pmic5_ftsmps520, "vdd-s4"),
+	RPMH_VREG("smps5",  "smp%s5",  &pmic5_ftsmps520, "vdd-s5"),
+	RPMH_VREG("smps6",  "smp%s6",  &pmic5_ftsmps520, "vdd-s6"),
+	RPMH_VREG("smps7",  "smp%s7",  &pmic5_ftsmps520, "vdd-s7"),
+	RPMH_VREG("smps8",  "smp%s8",  &pmic5_hfsmps510, "vdd-s8"),
+	RPMH_VREG("ldo1",   "ldo%s1",  &pmic5_nldo,      "vdd-l1-l4-l12-l15"),
+	RPMH_VREG("ldo2",   "ldo%s2",  &pmic5_pldo,      "vdd-l2-l7"),
+	RPMH_VREG("ldo3",   "ldo%s3",  &pmic5_nldo,      "vdd-l3"),
+	RPMH_VREG("ldo4",   "ldo%s4",  &pmic5_nldo,      "vdd-l1-l4-l12-l15"),
+	RPMH_VREG("ldo5",   "ldo%s5",  &pmic5_nldo,      "vdd-l5"),
+	RPMH_VREG("ldo6",   "ldo%s6",  &pmic5_nldo,      "vdd-l6-l9-l10"),
+	RPMH_VREG("ldo7",   "ldo%s7",  &pmic5_pldo,      "vdd-l2-l7"),
+	RPMH_VREG("ldo8",   "ldo%s8",  &pmic5_nldo,      "vdd-l8"),
+	RPMH_VREG("ldo9",   "ldo%s9",  &pmic5_nldo,      "vdd-l6-l9-l10"),
+	RPMH_VREG("ldo10",  "ldo%s10", &pmic5_nldo,      "vdd-l6-l9-l10"),
+	RPMH_VREG("ldo11",  "ldo%s11", &pmic5_pldo_lv,   "vdd-l11-l17-l18-l19"),
+	RPMH_VREG("ldo12",  "ldo%s12", &pmic5_nldo,      "vdd-l1-l4-l12-l15"),
+	RPMH_VREG("ldo13",  "ldo%s13", &pmic5_nldo,      "vdd-l13"),
+	RPMH_VREG("ldo14",  "ldo%s14", &pmic5_nldo,      "vdd-l14-l16"),
+	RPMH_VREG("ldo15",  "ldo%s15", &pmic5_nldo,      "vdd-l1-l4-l12-l15"),
+	RPMH_VREG("ldo16",  "ldo%s16", &pmic5_nldo,      "vdd-l14-l16"),
+	RPMH_VREG("ldo17",  "ldo%s17", &pmic5_pldo_lv,   "vdd-l11-l17-l18-l19"),
+	RPMH_VREG("ldo18",  "ldo%s18", &pmic5_pldo_lv,   "vdd-l11-l17-l18-l19"),
+	RPMH_VREG("ldo19",  "ldo%s19", &pmic5_pldo_lv,   "vdd-l11-l17-l18-l19"),
+};
+
+static const struct rpmh_vreg_init_data pmr735a_vreg_data[] = {
+	RPMH_VREG("smps1",  "smp%s1",  &pmic5_ftsmps520, "vdd-s1"),
+	RPMH_VREG("smps2",  "smp%s2",  &pmic5_ftsmps520, "vdd-s2"),
+	RPMH_VREG("smps3",  "smp%s3",  &pmic5_hfsmps510, "vdd-s3"),
+	RPMH_VREG("ldo1",   "ldo%s1",  &pmic5_nldo,      "vdd-l1-l2"),
+	RPMH_VREG("ldo2",   "ldo%s2",  &pmic5_nldo,      "vdd-l1-l2"),
+	RPMH_VREG("ldo3",   "ldo%s3",  &pmic5_nldo,      "vdd-l3"),
+	RPMH_VREG("ldo4",   "ldo%s4",  &pmic5_pldo_lv,   "vdd-l4"),
+	RPMH_VREG("ldo5",   "ldo%s5",  &pmic5_nldo,      "vdd-l5-l6"),
+	RPMH_VREG("ldo6",   "ldo%s6",  &pmic5_nldo,      "vdd-l5-l6"),
+	RPMH_VREG("ldo7",   "ldo%s7",  &pmic5_pldo,      "vdd-l7-bob"),
+};
+
 static int rpmh_regulator_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -1136,6 +1179,14 @@ static const struct of_device_id __maybe_unused rpmh_regulator_match_table[] = {
 		.compatible = "qcom,pmx55-rpmh-regulators",
 		.data = pmx55_vreg_data,
 	},
+	{
+		.compatible = "qcom,pm7325-rpmh-regulators",
+		.data = pm7325_vreg_data,
+	},
+	{
+		.compatible = "qcom,pmr735a-rpmh-regulators",
+		.data = pmr735a_vreg_data,
+	},
 	{}
 };
 MODULE_DEVICE_TABLE(of, rpmh_regulator_match_table);
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member 
of Code Aurora Forum, hosted by The Linux Foundation

