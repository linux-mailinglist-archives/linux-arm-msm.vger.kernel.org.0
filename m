Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6617E3258CE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Feb 2021 22:39:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229800AbhBYVjA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 25 Feb 2021 16:39:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32934 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234568AbhBYVi5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 25 Feb 2021 16:38:57 -0500
Received: from relay07.th.seeweb.it (relay07.th.seeweb.it [IPv6:2001:4b7a:2000:18::168])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 04263C061756
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Feb 2021 13:38:00 -0800 (PST)
Received: from localhost.localdomain (abab236.neoplus.adsl.tpnet.pl [83.6.165.236])
        by m-r2.th.seeweb.it (Postfix) with ESMTPA id 59A983F400;
        Thu, 25 Feb 2021 22:37:58 +0100 (CET)
From:   Konrad Dybcio <konrad.dybcio@somainline.org>
To:     phone-devel@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, martin.botka@somainline.org,
        angelogioacchino.delregno@somainline.org,
        marijn.suijten@somainline.org,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] regulator: qcom_smd: Fix up PM8950 regulator configuration
Date:   Thu, 25 Feb 2021 22:37:44 +0100
Message-Id: <20210225213745.117498-1-konrad.dybcio@somainline.org>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Following changes have been made:

- S5, L4, L18, L20 and L21 were removed (S5 is managed by
SPMI, whereas the rest seems not to exist [or at least it's blocked
by Sony Loire /MSM8956/ RPM firmware])

- Supply maps have were adjusted to reflect regulator changes.

Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
---
 drivers/regulator/qcom_smd-regulator.c | 35 +++++++++++++-------------
 1 file changed, 17 insertions(+), 18 deletions(-)

diff --git a/drivers/regulator/qcom_smd-regulator.c b/drivers/regulator/qcom_smd-regulator.c
index bb944ee5fe3b..5188f58b4718 100644
--- a/drivers/regulator/qcom_smd-regulator.c
+++ b/drivers/regulator/qcom_smd-regulator.c
@@ -843,32 +843,31 @@ static const struct rpm_regulator_data rpm_pm8950_regulators[] = {
 	{ "s2", QCOM_SMD_RPM_SMPA, 2, &pm8950_hfsmps, "vdd_s2" },
 	{ "s3", QCOM_SMD_RPM_SMPA, 3, &pm8950_hfsmps, "vdd_s3" },
 	{ "s4", QCOM_SMD_RPM_SMPA, 4, &pm8950_hfsmps, "vdd_s4" },
-	{ "s5", QCOM_SMD_RPM_SMPA, 5, &pm8950_ftsmps2p5, "vdd_s5" },
+	/* S5 is managed via SPMI. */
 	{ "s6", QCOM_SMD_RPM_SMPA, 6, &pm8950_hfsmps, "vdd_s6" },
 
 	{ "l1", QCOM_SMD_RPM_LDOA, 1, &pm8950_ult_nldo, "vdd_l1_l19" },
 	{ "l2", QCOM_SMD_RPM_LDOA, 2, &pm8950_ult_nldo, "vdd_l2_l23" },
 	{ "l3", QCOM_SMD_RPM_LDOA, 3, &pm8950_ult_nldo, "vdd_l3" },
-	{ "l4", QCOM_SMD_RPM_LDOA, 4, &pm8950_ult_pldo, "vdd_l4_l5_l6_l7_l16" },
-	{ "l5", QCOM_SMD_RPM_LDOA, 5, &pm8950_pldo_lv, "vdd_l4_l5_l6_l7_l16" },
-	{ "l6", QCOM_SMD_RPM_LDOA, 6, &pm8950_pldo_lv, "vdd_l4_l5_l6_l7_l16" },
-	{ "l7", QCOM_SMD_RPM_LDOA, 7, &pm8950_pldo_lv, "vdd_l4_l5_l6_l7_l16" },
+	/* L4 seems not to exist. */
+	{ "l5", QCOM_SMD_RPM_LDOA, 5, &pm8950_pldo_lv, "vdd_l5_l6_l7_l16" },
+	{ "l6", QCOM_SMD_RPM_LDOA, 6, &pm8950_pldo_lv, "vdd_l5_l6_l7_l16" },
+	{ "l7", QCOM_SMD_RPM_LDOA, 7, &pm8950_pldo_lv, "vdd_l5_l6_l7_l16" },
 	{ "l8", QCOM_SMD_RPM_LDOA, 8, &pm8950_ult_pldo, "vdd_l8_l11_l12_l17_l22" },
 	{ "l9", QCOM_SMD_RPM_LDOA, 9, &pm8950_ult_pldo, "vdd_l9_l10_l13_l14_l15_l18" },
 	{ "l10", QCOM_SMD_RPM_LDOA, 10, &pm8950_ult_nldo, "vdd_l9_l10_l13_l14_l15_l18"},
-	{ "l11", QCOM_SMD_RPM_LDOA, 11, &pm8950_ult_pldo, "vdd_l8_l11_l12_l17_l22"},
-	{ "l12", QCOM_SMD_RPM_LDOA, 12, &pm8950_ult_pldo, "vdd_l8_l11_l12_l17_l22"},
-	{ "l13", QCOM_SMD_RPM_LDOA, 13, &pm8950_ult_pldo, "vdd_l9_l10_l13_l14_l15_l18"},
-	{ "l14", QCOM_SMD_RPM_LDOA, 14, &pm8950_ult_pldo, "vdd_l9_l10_l13_l14_l15_l18"},
-	{ "l15", QCOM_SMD_RPM_LDOA, 15, &pm8950_ult_pldo, "vdd_l9_l10_l13_l14_l15_l18"},
-	{ "l16", QCOM_SMD_RPM_LDOA, 16, &pm8950_ult_pldo, "vdd_l4_l5_l6_l7_l16"},
-	{ "l17", QCOM_SMD_RPM_LDOA, 17, &pm8950_ult_pldo, "vdd_l8_l11_l12_l17_l22"},
-	{ "l18", QCOM_SMD_RPM_LDOA, 18, &pm8950_ult_pldo, "vdd_l9_l10_l13_l14_l15_l18"},
-	{ "l19", QCOM_SMD_RPM_LDOA, 18, &pm8950_pldo, "vdd_l1_l19"},
-	{ "l20", QCOM_SMD_RPM_LDOA, 18, &pm8950_pldo, "vdd_l20"},
-	{ "l21", QCOM_SMD_RPM_LDOA, 18, &pm8950_pldo, "vdd_l21"},
-	{ "l22", QCOM_SMD_RPM_LDOA, 18, &pm8950_pldo, "vdd_l8_l11_l12_l17_l22"},
-	{ "l23", QCOM_SMD_RPM_LDOA, 18, &pm8950_pldo, "vdd_l2_l23"},
+	{ "l11", QCOM_SMD_RPM_LDOA, 11, &pm8950_ult_pldo, "vdd_l8_l11_l12_l17_l22" },
+	{ "l12", QCOM_SMD_RPM_LDOA, 12, &pm8950_ult_pldo, "vdd_l8_l11_l12_l17_l22" },
+	{ "l13", QCOM_SMD_RPM_LDOA, 13, &pm8950_ult_pldo, "vdd_l9_l10_l13_l14_l15_l18" },
+	{ "l14", QCOM_SMD_RPM_LDOA, 14, &pm8950_ult_pldo, "vdd_l9_l10_l13_l14_l15_l18" },
+	{ "l15", QCOM_SMD_RPM_LDOA, 15, &pm8950_ult_pldo, "vdd_l9_l10_l13_l14_l15_l18" },
+	{ "l16", QCOM_SMD_RPM_LDOA, 16, &pm8950_ult_pldo, "vdd_l5_l6_l7_l16" },
+	{ "l17", QCOM_SMD_RPM_LDOA, 17, &pm8950_ult_pldo, "vdd_l8_l11_l12_l17_l22" },
+	/* L18 seems not to exist. */
+	{ "l19", QCOM_SMD_RPM_LDOA, 19, &pm8950_pldo, "vdd_l1_l19" },
+	/* L20 & L21 seem not to exist. */
+	{ "l22", QCOM_SMD_RPM_LDOA, 22, &pm8950_pldo, "vdd_l8_l11_l12_l17_l22" },
+	{ "l23", QCOM_SMD_RPM_LDOA, 23, &pm8950_pldo, "vdd_l2_l23" },
 	{}
 };
 
-- 
2.30.1

