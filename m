Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 95AFF4200CC
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Oct 2021 10:33:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229960AbhJCIdw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 3 Oct 2021 04:33:52 -0400
Received: from mail.z3ntu.xyz ([128.199.32.197]:37936 "EHLO mail.z3ntu.xyz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229935AbhJCIdt (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 3 Oct 2021 04:33:49 -0400
Received: from g550jk.portal.nstrein.ns.nl (unknown [145.15.244.215])
        by mail.z3ntu.xyz (Postfix) with ESMTPSA id 43543C9102;
        Sun,  3 Oct 2021 08:32:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=z3ntu.xyz; s=z3ntu;
        t=1633249922; bh=G17NOyGRQ5zv1zY+Q3IHyS6O/yOJu2ASjYm52OSRccs=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=F9isygwMDoWwKRBfrrye/vE5j0Qy6uwjDmVw4v0tcsSJ6MScjgBLHrr1COAX60Sic
         YXYtcJKGecRE6dUUBt+drUqqIANzgZ7EgFjyfh7yr7veMjxThkBHqyOO0EGcSsJmr8
         z/K7UlzoI+i0c0dEtE6MiCgsAsJYb1uJV6NNKthE=
From:   Luca Weiss <luca@z3ntu.xyz>
To:     linux-arm-msm@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, Luca Weiss <luca@z3ntu.xyz>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org
Subject: [PATCH 03/11] regulator: qcom-rpmh: Add PM6350 regulators
Date:   Sun,  3 Oct 2021 10:31:26 +0200
Message-Id: <20211003083141.613509-4-luca@z3ntu.xyz>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211003083141.613509-1-luca@z3ntu.xyz>
References: <20211003083141.613509-1-luca@z3ntu.xyz>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add the configuration for pm6350 regulators. The supplies are not known
so use dummy ones for now.

Additionally leave out configuration of smps3 - smps5 and ldo17 as these
are not configured in the downstream kernel.

Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
---

If anybody has a datasheet for pm6350 lying around, please double check
if the configuration is correct, I'm relatively sure it is correct
though as the driver doesn't probe when e.g. pldo instead of nldo is
configured.

 drivers/regulator/qcom-rpmh-regulator.c | 32 +++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/drivers/regulator/qcom-rpmh-regulator.c b/drivers/regulator/qcom-rpmh-regulator.c
index 7f458d510483..6ea111bccadb 100644
--- a/drivers/regulator/qcom-rpmh-regulator.c
+++ b/drivers/regulator/qcom-rpmh-regulator.c
@@ -1047,6 +1047,34 @@ static const struct rpmh_vreg_init_data pm6150l_vreg_data[] = {
 	{}
 };
 
+static const struct rpmh_vreg_init_data pm6350_vreg_data[] = {
+	RPMH_VREG("smps1",  "smp%s1",  &pmic5_ftsmps510, "vdd-s1"),
+	RPMH_VREG("smps2",  "smp%s2",  &pmic5_hfsmps510, "vdd-s2"),
+	/* smps3 - smps5 not configured */
+	RPMH_VREG("ldo1",   "ldo%s1",  &pmic5_nldo,      "vdd-l1"),
+	RPMH_VREG("ldo2",   "ldo%s2",  &pmic5_pldo,      "vdd-l2"),
+	RPMH_VREG("ldo3",   "ldo%s3",  &pmic5_pldo,      "vdd-l3"),
+	RPMH_VREG("ldo4",   "ldo%s4",  &pmic5_nldo,      "vdd-l4"),
+	RPMH_VREG("ldo5",   "ldo%s5",  &pmic5_pldo,      "vdd-l5"),
+	RPMH_VREG("ldo6",   "ldo%s6",  &pmic5_pldo,      "vdd-l6"),
+	RPMH_VREG("ldo7",   "ldo%s7",  &pmic5_pldo,      "vdd-l7"),
+	RPMH_VREG("ldo8",   "ldo%s8",  &pmic5_pldo,      "vdd-l8"),
+	RPMH_VREG("ldo9",   "ldo%s9",  &pmic5_pldo,      "vdd-l9"),
+	RPMH_VREG("ldo10",  "ldo%s10", &pmic5_pldo,      "vdd-l10"),
+	RPMH_VREG("ldo11",  "ldo%s11", &pmic5_pldo,      "vdd-l11"),
+	RPMH_VREG("ldo12",  "ldo%s12", &pmic5_pldo,      "vdd-l12"),
+	RPMH_VREG("ldo13",  "ldo%s13", &pmic5_nldo,      "vdd-l13"),
+	RPMH_VREG("ldo14",  "ldo%s14", &pmic5_pldo,      "vdd-l14"),
+	RPMH_VREG("ldo15",  "ldo%s15", &pmic5_nldo,      "vdd-l15"),
+	RPMH_VREG("ldo16",  "ldo%s16", &pmic5_nldo,      "vdd-l16"),
+	/* ldo17 not configured */
+	RPMH_VREG("ldo18",  "ldo%s18", &pmic5_nldo,      "vdd-l18"),
+	RPMH_VREG("ldo19",  "ldo%s19", &pmic5_nldo,      "vdd-l19"),
+	RPMH_VREG("ldo20",  "ldo%s20", &pmic5_nldo,      "vdd-l20"),
+	RPMH_VREG("ldo21",  "ldo%s21", &pmic5_nldo,      "vdd-l21"),
+	RPMH_VREG("ldo22",  "ldo%s22", &pmic5_nldo,      "vdd-l22"),
+};
+
 static const struct rpmh_vreg_init_data pmx55_vreg_data[] = {
 	RPMH_VREG("smps1",   "smp%s1",    &pmic5_ftsmps510, "vdd-s1"),
 	RPMH_VREG("smps2",   "smp%s2",    &pmic5_hfsmps510, "vdd-s2"),
@@ -1201,6 +1229,10 @@ static const struct of_device_id __maybe_unused rpmh_regulator_match_table[] = {
 		.compatible = "qcom,pm6150l-rpmh-regulators",
 		.data = pm6150l_vreg_data,
 	},
+	{
+		.compatible = "qcom,pm6350-rpmh-regulators",
+		.data = pm6350_vreg_data,
+	},
 	{
 		.compatible = "qcom,pmc8180-rpmh-regulators",
 		.data = pm8150_vreg_data,
-- 
2.33.0

