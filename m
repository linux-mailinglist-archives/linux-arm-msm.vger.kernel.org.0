Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9806E425EC5
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Oct 2021 23:25:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239143AbhJGV1Y (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 7 Oct 2021 17:27:24 -0400
Received: from mail.z3ntu.xyz ([128.199.32.197]:58944 "EHLO mail.z3ntu.xyz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S241180AbhJGV1T (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 7 Oct 2021 17:27:19 -0400
Received: from localhost.localdomain (ip-213-127-63-121.ip.prioritytelecom.net [213.127.63.121])
        by mail.z3ntu.xyz (Postfix) with ESMTPSA id 185DFC91C3;
        Thu,  7 Oct 2021 21:25:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=z3ntu.xyz; s=z3ntu;
        t=1633641924; bh=xc4vyQgr+xipDBHuJKiNHkgUGusUrGCcYMbyMWblToc=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=N3HD4jOR9lb2xn4D3uK2D38XNpEX1/rAMGyhDidHbhPuiNOMH7NjTc52B1m7jj0xY
         NATKaIunjyy1Af63kgEclsmGTTz6O4v8mx538+pItUJYcenQHgiPUUbxre1dh2bgUt
         ac7hc2jQkoweeN9MBVgmMGxjK7mgT3wfVese3/jE=
From:   Luca Weiss <luca@z3ntu.xyz>
To:     linux-arm-msm@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht,
        konrad.dybcio@somainline.org, Luca Weiss <luca@z3ntu.xyz>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org
Subject: [PATCH v2 03/11] regulator: qcom-rpmh: Add PM6350 regulators
Date:   Thu,  7 Oct 2021 23:24:30 +0200
Message-Id: <20211007212444.328034-4-luca@z3ntu.xyz>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211007212444.328034-1-luca@z3ntu.xyz>
References: <20211007212444.328034-1-luca@z3ntu.xyz>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add the configuration for pm6350 regulators. The supplies are not known
so leave them out for now.

Additionally leave out configuration of smps3 - smps5 and ldo17 as these
are not configured in the downstream kernel and the type of them is not
known.

Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
---
v2: set supply of regulators to NULL and clarify commit message

 drivers/regulator/qcom-rpmh-regulator.c | 32 +++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/drivers/regulator/qcom-rpmh-regulator.c b/drivers/regulator/qcom-rpmh-regulator.c
index 7f458d510483..12425f667c00 100644
--- a/drivers/regulator/qcom-rpmh-regulator.c
+++ b/drivers/regulator/qcom-rpmh-regulator.c
@@ -1047,6 +1047,34 @@ static const struct rpmh_vreg_init_data pm6150l_vreg_data[] = {
 	{}
 };
 
+static const struct rpmh_vreg_init_data pm6350_vreg_data[] = {
+	RPMH_VREG("smps1",  "smp%s1",  &pmic5_ftsmps510, NULL),
+	RPMH_VREG("smps2",  "smp%s2",  &pmic5_hfsmps510, NULL),
+	/* smps3 - smps5 not configured */
+	RPMH_VREG("ldo1",   "ldo%s1",  &pmic5_nldo,      NULL),
+	RPMH_VREG("ldo2",   "ldo%s2",  &pmic5_pldo,      NULL),
+	RPMH_VREG("ldo3",   "ldo%s3",  &pmic5_pldo,      NULL),
+	RPMH_VREG("ldo4",   "ldo%s4",  &pmic5_nldo,      NULL),
+	RPMH_VREG("ldo5",   "ldo%s5",  &pmic5_pldo,      NULL),
+	RPMH_VREG("ldo6",   "ldo%s6",  &pmic5_pldo,      NULL),
+	RPMH_VREG("ldo7",   "ldo%s7",  &pmic5_pldo,      NULL),
+	RPMH_VREG("ldo8",   "ldo%s8",  &pmic5_pldo,      NULL),
+	RPMH_VREG("ldo9",   "ldo%s9",  &pmic5_pldo,      NULL),
+	RPMH_VREG("ldo10",  "ldo%s10", &pmic5_pldo,      NULL),
+	RPMH_VREG("ldo11",  "ldo%s11", &pmic5_pldo,      NULL),
+	RPMH_VREG("ldo12",  "ldo%s12", &pmic5_pldo,      NULL),
+	RPMH_VREG("ldo13",  "ldo%s13", &pmic5_nldo,      NULL),
+	RPMH_VREG("ldo14",  "ldo%s14", &pmic5_pldo,      NULL),
+	RPMH_VREG("ldo15",  "ldo%s15", &pmic5_nldo,      NULL),
+	RPMH_VREG("ldo16",  "ldo%s16", &pmic5_nldo,      NULL),
+	/* ldo17 not configured */
+	RPMH_VREG("ldo18",  "ldo%s18", &pmic5_nldo,      NULL),
+	RPMH_VREG("ldo19",  "ldo%s19", &pmic5_nldo,      NULL),
+	RPMH_VREG("ldo20",  "ldo%s20", &pmic5_nldo,      NULL),
+	RPMH_VREG("ldo21",  "ldo%s21", &pmic5_nldo,      NULL),
+	RPMH_VREG("ldo22",  "ldo%s22", &pmic5_nldo,      NULL),
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

