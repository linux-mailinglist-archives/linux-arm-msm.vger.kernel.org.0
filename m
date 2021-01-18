Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D9E8C2FA5FA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Jan 2021 17:23:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406241AbhARQVN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 18 Jan 2021 11:21:13 -0500
Received: from relay03.th.seeweb.it ([5.144.164.164]:40265 "EHLO
        relay03.th.seeweb.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2406571AbhARQUf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 18 Jan 2021 11:20:35 -0500
Received: from localhost.localdomain (abaf224.neoplus.adsl.tpnet.pl [83.6.169.224])
        by m-r1.th.seeweb.it (Postfix) with ESMTPA id C53A71FAFE;
        Mon, 18 Jan 2021 17:19:51 +0100 (CET)
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
Subject: [PATCH 1/2] drivers: soc: qcom: rpmpd: Add msm8994 RPM Power Domains
Date:   Mon, 18 Jan 2021 17:19:41 +0100
Message-Id: <20210118161943.105733-1-konrad.dybcio@somainline.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

MSM8994 uses similar to MSM8996, legacy-style voltage
control, but does not include a VDD_SC_CX line.

This setup is also correct for MSM8992.

Do note that there exist some boards that use a tertiary PMIC
(most likely pm8004), where SMPB on VDDGFX becomes SMPC. I
cannot test this configuration though.

Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
---
 .../devicetree/bindings/power/qcom,rpmpd.yaml |  1 +
 drivers/soc/qcom/rpmpd.c                      | 28 +++++++++++++++++++
 include/dt-bindings/power/qcom-rpmpd.h        |  9 ++++++
 3 files changed, 38 insertions(+)

diff --git a/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml b/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
index 64825128ee97..1ea21acbbd55 100644
--- a/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
+++ b/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
@@ -19,6 +19,7 @@ properties:
       - qcom,msm8916-rpmpd
       - qcom,msm8939-rpmpd
       - qcom,msm8976-rpmpd
+      - qcom,msm8994-rpmpd
       - qcom,msm8996-rpmpd
       - qcom,msm8998-rpmpd
       - qcom,qcs404-rpmpd
diff --git a/drivers/soc/qcom/rpmpd.c b/drivers/soc/qcom/rpmpd.c
index 85d1207b72d7..27733b0e7fca 100644
--- a/drivers/soc/qcom/rpmpd.c
+++ b/drivers/soc/qcom/rpmpd.c
@@ -21,6 +21,8 @@
  * RPMPD_X is X encoded as a little-endian, lower-case, ASCII string */
 #define RPMPD_SMPA 0x61706d73
 #define RPMPD_LDOA 0x616f646c
+#define RPMPD_SMPB 0x62706d73
+#define RPMPD_LDOB 0x626f646c
 #define RPMPD_RWCX 0x78637772
 #define RPMPD_RWMX 0x786d7772
 #define RPMPD_RWLC 0x636c7772
@@ -184,6 +186,31 @@ static const struct rpmpd_desc msm8976_desc = {
 	.max_state = RPM_SMD_LEVEL_TURBO_HIGH,
 };
 
+/* msm8994 RPM Power domains */
+DEFINE_RPMPD_PAIR(msm8994, vddcx, vddcx_ao, SMPA, CORNER, 1);
+DEFINE_RPMPD_PAIR(msm8994, vddmx, vddmx_ao, SMPA, CORNER, 2);
+/* Attention! *Some* 8994 boards with pm8004 may use SMPC here! */
+DEFINE_RPMPD_CORNER(msm8994, vddgfx, SMPB, 2);
+
+DEFINE_RPMPD_VFC(msm8994, vddcx_vfc, SMPA, 1);
+DEFINE_RPMPD_VFC(msm8994, vddgfx_vfc, SMPB, 2);
+
+static struct rpmpd *msm8994_rpmpds[] = {
+	[MSM8994_VDDCX] =	&msm8994_vddcx,
+	[MSM8994_VDDCX_AO] =	&msm8994_vddcx_ao,
+	[MSM8994_VDDCX_VFC] =	&msm8994_vddcx_vfc,
+	[MSM8994_VDDMX] =	&msm8994_vddmx,
+	[MSM8994_VDDMX_AO] =	&msm8994_vddmx_ao,
+	[MSM8994_VDDGFX] =	&msm8994_vddgfx,
+	[MSM8994_VDDGFX_VFC] =	&msm8994_vddgfx_vfc,
+};
+
+static const struct rpmpd_desc msm8994_desc = {
+	.rpmpds = msm8994_rpmpds,
+	.num_pds = ARRAY_SIZE(msm8994_rpmpds),
+	.max_state = MAX_CORNER_RPMPD_STATE,
+};
+
 /* msm8996 RPM Power domains */
 DEFINE_RPMPD_PAIR(msm8996, vddcx, vddcx_ao, SMPA, CORNER, 1);
 DEFINE_RPMPD_PAIR(msm8996, vddmx, vddmx_ao, SMPA, CORNER, 2);
@@ -302,6 +329,7 @@ static const struct of_device_id rpmpd_match_table[] = {
 	{ .compatible = "qcom,msm8916-rpmpd", .data = &msm8916_desc },
 	{ .compatible = "qcom,msm8939-rpmpd", .data = &msm8939_desc },
 	{ .compatible = "qcom,msm8976-rpmpd", .data = &msm8976_desc },
+	{ .compatible = "qcom,msm8994-rpmpd", .data = &msm8994_desc },
 	{ .compatible = "qcom,msm8996-rpmpd", .data = &msm8996_desc },
 	{ .compatible = "qcom,msm8998-rpmpd", .data = &msm8998_desc },
 	{ .compatible = "qcom,qcs404-rpmpd", .data = &qcs404_desc },
diff --git a/include/dt-bindings/power/qcom-rpmpd.h b/include/dt-bindings/power/qcom-rpmpd.h
index 7714487ac76b..d711e250cf2c 100644
--- a/include/dt-bindings/power/qcom-rpmpd.h
+++ b/include/dt-bindings/power/qcom-rpmpd.h
@@ -94,6 +94,15 @@
 #define MSM8976_VDDMX_AO	4
 #define MSM8976_VDDMX_VFL	5
 
+/* MSM8994 Power Domain Indexes */
+#define MSM8994_VDDCX		0
+#define MSM8994_VDDCX_AO	1
+#define MSM8994_VDDCX_VFC	2
+#define MSM8994_VDDMX		3
+#define MSM8994_VDDMX_AO	4
+#define MSM8994_VDDGFX		5
+#define MSM8994_VDDGFX_VFC	6
+
 /* MSM8996 Power Domain Indexes */
 #define MSM8996_VDDCX		0
 #define MSM8996_VDDCX_AO	1
-- 
2.29.2

