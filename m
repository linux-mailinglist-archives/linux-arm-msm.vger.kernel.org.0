Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 22A02CB7F1
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Oct 2019 12:09:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388513AbfJDKJZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 4 Oct 2019 06:09:25 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:37290 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388492AbfJDKJZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 4 Oct 2019 06:09:25 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id EC78B61A1B; Fri,  4 Oct 2019 10:09:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1570183764;
        bh=rr9e9nmMecK6AobsIE9/VheDVkty3tQI2wN6PYgBrxM=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=FxCs/UfyvQSOl/5qcsV8x/UI5MAC5UBn2C+/sQpUd/XOxYuV51JI0tFCUAU3KYsMu
         GEeekY08K8tAu/5ZJiWVhwkP5oZr87JRxJJsS8r4w0fQBQpUXkADp/9h63IKasNhj8
         zzpNG+GrBo3bWFcso7iYPA5ghC4NVPAZ17ptFqyU=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
        version=3.4.0
Received: from kgunda-linux.qualcomm.com (blr-c-bdr-fw-01_globalnat_allzones-outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: kgunda@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 7F4E661A1B;
        Fri,  4 Oct 2019 10:09:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1570183761;
        bh=rr9e9nmMecK6AobsIE9/VheDVkty3tQI2wN6PYgBrxM=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=JoVh7QkVxDvFOJ8XB8ZPcmwlS9DHf3cwMQygAQePmz5pGGkMb68pD8l8A2rzFjO38
         xQoqtEeUOUTh/eobj1eIyWP7eV+lSeOh0HXi0uhdsEk1VEmYqgYxvY5ieAdje+W9c9
         T7/tsYwrxPy76YW0BOAnHXDsiJ+2NCU2juYiC1ck=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 7F4E661A1B
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=kgunda@codeaurora.org
From:   Kiran Gunda <kgunda@codeaurora.org>
To:     bjorn.andersson@linaro.org, Andy Gross <agross@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Kiran Gunda <kgunda@codeaurora.org>
Subject: [PATCH V1 2/2] regulator: qcom-rpmh: add PM6150/PM6150L regulator support
Date:   Fri,  4 Oct 2019 15:38:54 +0530
Message-Id: <1570183734-30706-3-git-send-email-kgunda@codeaurora.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1570183734-30706-1-git-send-email-kgunda@codeaurora.org>
References: <1570183734-30706-1-git-send-email-kgunda@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add support for PM6150/PM6150L regulators. This ensures
that consumers are able to modify the physical state of PMIC
regulators.

Signed-off-by: Kiran Gunda <kgunda@codeaurora.org>
---
 drivers/regulator/qcom-rpmh-regulator.c | 62 ++++++++++++++++++++++++++++++++-
 1 file changed, 61 insertions(+), 1 deletion(-)

diff --git a/drivers/regulator/qcom-rpmh-regulator.c b/drivers/regulator/qcom-rpmh-regulator.c
index db6c085..8ae7ddf 100644
--- a/drivers/regulator/qcom-rpmh-regulator.c
+++ b/drivers/regulator/qcom-rpmh-regulator.c
@@ -1,5 +1,5 @@
 // SPDX-License-Identifier: GPL-2.0
-// Copyright (c) 2018, The Linux Foundation. All rights reserved.
+// Copyright (c) 2018-2019, The Linux Foundation. All rights reserved.
 
 #define pr_fmt(fmt) "%s: " fmt, __func__
 
@@ -878,6 +878,58 @@ static unsigned int rpmh_regulator_pmic4_bob_of_map_mode(unsigned int rpmh_mode)
 	{},
 };
 
+static const struct rpmh_vreg_init_data pm6150_vreg_data[] = {
+	RPMH_VREG("smps1",  "smp%s1",  &pmic5_ftsmps510, "vdd-s1"),
+	RPMH_VREG("smps2",  "smp%s2",  &pmic5_ftsmps510, "vdd-s2"),
+	RPMH_VREG("smps3",  "smp%s3",  &pmic5_ftsmps510, "vdd-s3"),
+	RPMH_VREG("smps4",  "smp%s4",  &pmic5_hfsmps510, "vdd-s4"),
+	RPMH_VREG("smps5",  "smp%s5",  &pmic5_hfsmps510, "vdd-s5"),
+	RPMH_VREG("ldo1",   "ldo%s1",  &pmic5_nldo,      "vdd-l1"),
+	RPMH_VREG("ldo2",   "ldo%s2",  &pmic5_nldo,      "vdd-l2-l3"),
+	RPMH_VREG("ldo3",   "ldo%s3",  &pmic5_nldo,      "vdd-l2-l3"),
+	RPMH_VREG("ldo4",   "ldo%s4",  &pmic5_nldo,      "vdd-l4-l7-l8"),
+	RPMH_VREG("ldo5",   "ldo%s5",  &pmic5_pldo,   "vdd-l5-l16-l17-l18-l19"),
+	RPMH_VREG("ldo6",   "ldo%s6",  &pmic5_nldo,      "vdd-l6"),
+	RPMH_VREG("ldo7",   "ldo%s7",  &pmic5_nldo,      "vdd-l4-l7-l8"),
+	RPMH_VREG("ldo8",   "ldo%s8",  &pmic5_nldo,      "vdd-l4-l7-l8"),
+	RPMH_VREG("ldo9",   "ldo%s9",  &pmic5_nldo,      "vdd-l9"),
+	RPMH_VREG("ldo10",  "ldo%s10", &pmic5_pldo_lv,   "vdd-l10-l14-l15"),
+	RPMH_VREG("ldo11",  "ldo%s11", &pmic5_pldo_lv,   "vdd-l11-l12-l13"),
+	RPMH_VREG("ldo12",  "ldo%s12", &pmic5_pldo_lv,   "vdd-l11-l12-l13"),
+	RPMH_VREG("ldo13",  "ldo%s13", &pmic5_pldo_lv,   "vdd-l11-l12-l13"),
+	RPMH_VREG("ldo14",  "ldo%s14", &pmic5_pldo_lv,   "vdd-l10-l14-l15"),
+	RPMH_VREG("ldo15",  "ldo%s15", &pmic5_pldo_lv,   "vdd-l10-l14-l15"),
+	RPMH_VREG("ldo16",  "ldo%s16", &pmic5_pldo,   "vdd-l5-l16-l17-l18-l19"),
+	RPMH_VREG("ldo17",  "ldo%s17", &pmic5_pldo,   "vdd-l5-l16-l17-l18-l19"),
+	RPMH_VREG("ldo18",  "ldo%s18", &pmic5_pldo,   "vdd-l5-l16-l17-l18-l19"),
+	RPMH_VREG("ldo19",  "ldo%s19", &pmic5_pldo,   "vdd-l5-l16-l17-l18-l19"),
+	{},
+};
+
+static const struct rpmh_vreg_init_data pm6150l_vreg_data[] = {
+	RPMH_VREG("smps1",  "smp%s1",  &pmic5_ftsmps510, "vdd-s1"),
+	RPMH_VREG("smps2",  "smp%s2",  &pmic5_ftsmps510, "vdd-s2"),
+	RPMH_VREG("smps3",  "smp%s3",  &pmic5_ftsmps510, "vdd-s3"),
+	RPMH_VREG("smps4",  "smp%s4",  &pmic5_ftsmps510, "vdd-s4"),
+	RPMH_VREG("smps5",  "smp%s5",  &pmic5_ftsmps510, "vdd-s5"),
+	RPMH_VREG("smps6",  "smp%s6",  &pmic5_ftsmps510, "vdd-s6"),
+	RPMH_VREG("smps7",  "smp%s7",  &pmic5_ftsmps510, "vdd-s7"),
+	RPMH_VREG("smps8",  "smp%s8",  &pmic5_hfsmps510, "vdd-s8"),
+	RPMH_VREG("ldo1",   "ldo%s1",  &pmic5_pldo_lv,   "vdd-l1-l8"),
+	RPMH_VREG("ldo2",   "ldo%s2",  &pmic5_nldo,      "vdd-l2-l3"),
+	RPMH_VREG("ldo3",   "ldo%s3",  &pmic5_nldo,      "vdd-l2-l3"),
+	RPMH_VREG("ldo4",   "ldo%s4",  &pmic5_pldo,      "vdd-l4-l5-l6"),
+	RPMH_VREG("ldo5",   "ldo%s5",  &pmic5_pldo,      "vdd-l4-l5-l6"),
+	RPMH_VREG("ldo6",   "ldo%s6",  &pmic5_pldo,      "vdd-l4-l5-l6"),
+	RPMH_VREG("ldo7",   "ldo%s7",  &pmic5_pldo,      "vdd-l7-l11"),
+	RPMH_VREG("ldo8",   "ldo%s8",  &pmic5_pldo,      "vdd-l1-l8"),
+	RPMH_VREG("ldo9",   "ldo%s9",  &pmic5_pldo,      "vdd-l9-l10"),
+	RPMH_VREG("ldo10",  "ldo%s10", &pmic5_pldo,      "vdd-l9-l10"),
+	RPMH_VREG("ldo11",  "ldo%s11", &pmic5_pldo,      "vdd-l7-l11"),
+	RPMH_VREG("bob",    "bob%s1",  &pmic5_bob,       "vdd-bob"),
+	{},
+};
+
 static int rpmh_regulator_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -940,6 +992,14 @@ static int rpmh_regulator_probe(struct platform_device *pdev)
 		.compatible = "qcom,pmi8998-rpmh-regulators",
 		.data = pmi8998_vreg_data,
 	},
+	{
+		.compatible = "qcom,pm6150-rpmh-regulators",
+		.data = pm6150_vreg_data,
+	},
+	{
+		.compatible = "qcom,pm6150l-rpmh-regulators",
+		.data = pm6150l_vreg_data,
+	},
 	{}
 };
 MODULE_DEVICE_TABLE(of, rpmh_regulator_match_table);
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
 a Linux Foundation Collaborative Project

