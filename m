Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3A29A2C5148
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Nov 2020 10:32:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729371AbgKZJah (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 26 Nov 2020 04:30:37 -0500
Received: from mail.kernel.org ([198.145.29.99]:41404 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726721AbgKZJah (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 26 Nov 2020 04:30:37 -0500
Received: from localhost.localdomain (unknown [122.179.79.180])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 2585021D91;
        Thu, 26 Nov 2020 09:30:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1606383036;
        bh=peoe6om42rZkZB7Dd7Y61MeWRKgrzoucjoFoKjpcn6s=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=am75Q/j0U7W2Q0z6GlSu3vTxnpq0UNAeKpIeTpeCzgD7ZHX6HNyLgb5yNriuo6/7s
         1KhvHfLoERbZn8PKlu9vnaBBXKic+CsH1WaZPUlyAoBGiTadqlE1jUmu4A2+ZV+bCb
         BfwVxl922/5mApbxufwsPzIH+YCw6bjj9IOo4ZM8=
From:   Vinod Koul <vkoul@kernel.org>
To:     Mark Brown <broonie@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>, Andy Gross <agross@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH 2/2] regulator: qcom-rpmh: Add support for SDX55
Date:   Thu, 26 Nov 2020 15:00:18 +0530
Message-Id: <20201126093018.1085594-2-vkoul@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201126093018.1085594-1-vkoul@kernel.org>
References: <20201126093018.1085594-1-vkoul@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add support from RPMH regulators found in SDX55 platform

Signed-off-by: Vinod Koul <vkoul@kernel.org>
---
 drivers/regulator/qcom-rpmh-regulator.c | 31 +++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/drivers/regulator/qcom-rpmh-regulator.c b/drivers/regulator/qcom-rpmh-regulator.c
index d488325499a9..e673d48b31a1 100644
--- a/drivers/regulator/qcom-rpmh-regulator.c
+++ b/drivers/regulator/qcom-rpmh-regulator.c
@@ -930,6 +930,33 @@ static const struct rpmh_vreg_init_data pm6150l_vreg_data[] = {
 	{},
 };
 
+static const struct rpmh_vreg_init_data pmx55_vreg_data[] = {
+	RPMH_VREG("smps1",   "smp%s1",    &pmic5_ftsmps510, "vdd-s1"),
+	RPMH_VREG("smps2",   "smp%s2",    &pmic5_hfsmps510, "vdd-s2"),
+	RPMH_VREG("smps3",   "smp%s3",    &pmic5_hfsmps510, "vdd-s3"),
+	RPMH_VREG("smps4",   "smp%s4",    &pmic5_hfsmps510, "vdd-s4"),
+	RPMH_VREG("smps5",   "smp%s5",    &pmic5_hfsmps510, "vdd-s5"),
+	RPMH_VREG("smps6",   "smp%s6",    &pmic5_ftsmps510, "vdd-s6"),
+	RPMH_VREG("smps7",   "smp%s7",    &pmic5_hfsmps510, "vdd-s7"),
+	RPMH_VREG("ldo1",    "ldo%s1",    &pmic5_nldo,      "vdd-l1-l2"),
+	RPMH_VREG("ldo2",    "ldo%s2",    &pmic5_nldo,      "vdd-l1-l2"),
+	RPMH_VREG("ldo3",    "ldo%s3",    &pmic5_nldo,      "vdd-l3-l9"),
+	RPMH_VREG("ldo4",    "ldo%s4",    &pmic5_nldo,      "vdd-l4-l12"),
+	RPMH_VREG("ldo5",    "ldo%s5",    &pmic5_pldo,      "vdd-l5-l6"),
+	RPMH_VREG("ldo6",    "ldo%s6",    &pmic5_pldo,      "vdd-l5-l6"),
+	RPMH_VREG("ldo7",    "ldo%s7",    &pmic5_nldo,      "vdd-l7-l8"),
+	RPMH_VREG("ldo8",    "ldo%s8",    &pmic5_nldo,      "vdd-l7-l8"),
+	RPMH_VREG("ldo9",    "ldo%s9",    &pmic5_nldo,      "vdd-l3-l9"),
+	RPMH_VREG("ldo10",   "ldo%s10",   &pmic5_pldo,      "vdd-l10-l11-l13"),
+	RPMH_VREG("ldo11",   "ldo%s11",   &pmic5_pldo,      "vdd-l10-l11-l13"),
+	RPMH_VREG("ldo12",   "ldo%s12",   &pmic5_nldo,      "vdd-l4-l12"),
+	RPMH_VREG("ldo13",   "ldo%s13",   &pmic5_pldo,      "vdd-l10-l11-l13"),
+	RPMH_VREG("ldo14",   "ldo%s14",   &pmic5_nldo,      "vdd-l14"),
+	RPMH_VREG("ldo15",   "ldo%s15",   &pmic5_nldo,      "vdd-l15"),
+	RPMH_VREG("ldo16",   "ldo%s16",   &pmic5_pldo,      "vdd-l16"),
+	{},
+};
+
 static int rpmh_regulator_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -1000,6 +1027,10 @@ static const struct of_device_id __maybe_unused rpmh_regulator_match_table[] = {
 		.compatible = "qcom,pm6150l-rpmh-regulators",
 		.data = pm6150l_vreg_data,
 	},
+	{
+		.compatible = "qcom,pmx55-rpmh-regulators",
+		.data = pmx55_vreg_data,
+	},
 	{}
 };
 MODULE_DEVICE_TABLE(of, rpmh_regulator_match_table);
-- 
2.26.2

