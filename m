Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8D0173099AC
	for <lists+linux-arm-msm@lfdr.de>; Sun, 31 Jan 2021 02:34:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232499AbhAaBdW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 30 Jan 2021 20:33:22 -0500
Received: from relay06.th.seeweb.it ([5.144.164.167]:35359 "EHLO
        relay06.th.seeweb.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230168AbhAaBdU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 30 Jan 2021 20:33:20 -0500
Received: from localhost.localdomain (abaf219.neoplus.adsl.tpnet.pl [83.6.169.219])
        by m-r2.th.seeweb.it (Postfix) with ESMTPA id 23E873F25A;
        Sun, 31 Jan 2021 02:32:37 +0100 (CET)
From:   Konrad Dybcio <konrad.dybcio@somainline.org>
To:     phone-devel@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] soc: qcom: rpmpd: Add MDM9607 RPM Power Domains
Date:   Sun, 31 Jan 2021 02:32:32 +0100
Message-Id: <20210131013233.54666-1-konrad.dybcio@somainline.org>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This SoC while being from 8916 era, makes use of the
newer-style, floor-level management, instead of the older
floor-corner.

Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
---
 .../devicetree/bindings/power/qcom,rpmpd.yaml |  1 +
 drivers/soc/qcom/rpmpd.c                      | 22 +++++++++++++++++++
 include/dt-bindings/power/qcom-rpmpd.h        |  8 +++++++
 3 files changed, 31 insertions(+)

diff --git a/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml b/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
index 64825128ee97..9422131b4236 100644
--- a/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
+++ b/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
@@ -16,6 +16,7 @@ description:
 properties:
   compatible:
     enum:
+      - qcom,mdm9607-rpmpd
       - qcom,msm8916-rpmpd
       - qcom,msm8939-rpmpd
       - qcom,msm8976-rpmpd
diff --git a/drivers/soc/qcom/rpmpd.c b/drivers/soc/qcom/rpmpd.c
index 85d1207b72d7..ebf29a77c8b0 100644
--- a/drivers/soc/qcom/rpmpd.c
+++ b/drivers/soc/qcom/rpmpd.c
@@ -116,6 +116,27 @@ struct rpmpd_desc {
 
 static DEFINE_MUTEX(rpmpd_lock);
 
+/* mdm9607 RPM Power Domains */
+DEFINE_RPMPD_PAIR(mdm9607, vddcx, vddcx_ao, SMPA, LEVEL, 3);
+DEFINE_RPMPD_VFL(mdm9607, vddcx_vfl, SMPA, 3);
+
+DEFINE_RPMPD_PAIR(mdm9607, vddmx, vddmx_ao, LDOA, LEVEL, 12);
+DEFINE_RPMPD_VFL(mdm9607, vddmx_vfl, LDOA, 12);
+static struct rpmpd *mdm9607_rpmpds[] = {
+	[MDM9607_VDDCX] =	&mdm9607_vddcx,
+	[MDM9607_VDDCX_AO] =	&mdm9607_vddcx_ao,
+	[MDM9607_VDDCX_VFL] =	&mdm9607_vddcx_vfl,
+	[MDM9607_VDDMX] =	&mdm9607_vddmx,
+	[MDM9607_VDDMX_AO] =	&mdm9607_vddmx_ao,
+	[MDM9607_VDDMX_VFL] =	&mdm9607_vddmx_vfl,
+};
+
+static const struct rpmpd_desc mdm9607_desc = {
+	.rpmpds = mdm9607_rpmpds,
+	.num_pds = ARRAY_SIZE(mdm9607_rpmpds),
+	.max_state = RPM_SMD_LEVEL_TURBO,
+};
+
 /* msm8939 RPM Power Domains */
 DEFINE_RPMPD_PAIR(msm8939, vddmd, vddmd_ao, SMPA, CORNER, 1);
 DEFINE_RPMPD_VFC(msm8939, vddmd_vfc, SMPA, 1);
@@ -299,6 +320,7 @@ static const struct rpmpd_desc sdm660_desc = {
 };
 
 static const struct of_device_id rpmpd_match_table[] = {
+	{ .compatible = "qcom,mdm9607-rpmpd", .data = &mdm9607_desc },
 	{ .compatible = "qcom,msm8916-rpmpd", .data = &msm8916_desc },
 	{ .compatible = "qcom,msm8939-rpmpd", .data = &msm8939_desc },
 	{ .compatible = "qcom,msm8976-rpmpd", .data = &msm8976_desc },
diff --git a/include/dt-bindings/power/qcom-rpmpd.h b/include/dt-bindings/power/qcom-rpmpd.h
index 7714487ac76b..9519eb38d695 100644
--- a/include/dt-bindings/power/qcom-rpmpd.h
+++ b/include/dt-bindings/power/qcom-rpmpd.h
@@ -69,6 +69,14 @@
 #define RPMH_REGULATOR_LEVEL_TURBO	384
 #define RPMH_REGULATOR_LEVEL_TURBO_L1	416
 
+/* MDM9607 Power Domains */
+#define MDM9607_VDDCX		0
+#define MDM9607_VDDCX_AO	1
+#define MDM9607_VDDCX_VFL	2
+#define MDM9607_VDDMX		3
+#define MDM9607_VDDMX_AO	4
+#define MDM9607_VDDMX_VFL	5
+
 /* MSM8939 Power Domains */
 #define MSM8939_VDDMDCX		0
 #define MSM8939_VDDMDCX_AO	1
-- 
2.30.0

