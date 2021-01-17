Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 26CDA2F95C0
	for <lists+linux-arm-msm@lfdr.de>; Sun, 17 Jan 2021 23:09:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730199AbhAQWJT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 17 Jan 2021 17:09:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41484 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730184AbhAQWJS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 17 Jan 2021 17:09:18 -0500
Received: from relay02.th.seeweb.it (relay02.th.seeweb.it [IPv6:2001:4b7a:2000:18::163])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D0C8C061574;
        Sun, 17 Jan 2021 14:08:36 -0800 (PST)
Received: from IcarusMOD.eternityproject.eu (unknown [2.237.20.237])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 739081F531;
        Sun, 17 Jan 2021 23:08:34 +0100 (CET)
From:   AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>
To:     linux-arm-msm@vger.kernel.org
Cc:     agross@kernel.org, bjorn.andersson@linaro.org, lgirdwood@gmail.com,
        broonie@kernel.org, robh+dt@kernel.org, sumit.semwal@linaro.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        phone-devel@vger.kernel.org, konrad.dybcio@somainline.org,
        marijn.suijten@somainline.org, martin.botka@somainline.org,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>
Subject: [PATCH v3 1/7] regulator: qcom-labibb: Implement voltage selector ops
Date:   Sun, 17 Jan 2021 23:08:24 +0100
Message-Id: <20210117220830.150948-2-angelogioacchino.delregno@somainline.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210117220830.150948-1-angelogioacchino.delregno@somainline.org>
References: <20210117220830.150948-1-angelogioacchino.delregno@somainline.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Implement {get,set}_voltage_sel, list_voltage, map_voltage with
the useful regulator regmap helpers in order to be able to manage
the voltage of LAB (positive) and IBB (negative) regulators.

In particular, the supported ranges are the following:
- LAB (pos):  4600mV to  6100mV with 100mV stepping,
- IBB (neg): -7700mV to -1400mV with 100mV stepping.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 drivers/regulator/qcom-labibb-regulator.c | 24 +++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/drivers/regulator/qcom-labibb-regulator.c b/drivers/regulator/qcom-labibb-regulator.c
index 8ccf572394a2..0fe0f6bce4cf 100644
--- a/drivers/regulator/qcom-labibb-regulator.c
+++ b/drivers/regulator/qcom-labibb-regulator.c
@@ -19,6 +19,12 @@
 #define PMI8998_IBB_REG_BASE		0xdc00
 
 #define REG_LABIBB_STATUS1		0x08
+
+#define REG_LABIBB_VOLTAGE		0x41
+ #define LABIBB_VOLTAGE_OVERRIDE_EN	BIT(7)
+ #define LAB_VOLTAGE_SET_MASK		GENMASK(3, 0)
+ #define IBB_VOLTAGE_SET_MASK		GENMASK(5, 0)
+
 #define REG_LABIBB_ENABLE_CTL		0x46
 #define LABIBB_STATUS1_VREG_OK_BIT	BIT(7)
 #define LABIBB_CONTROL_ENABLE		BIT(7)
@@ -51,6 +57,10 @@ static const struct regulator_ops qcom_labibb_ops = {
 	.enable			= regulator_enable_regmap,
 	.disable		= regulator_disable_regmap,
 	.is_enabled		= regulator_is_enabled_regmap,
+	.set_voltage_sel	= regulator_set_voltage_sel_regmap,
+	.get_voltage_sel	= regulator_get_voltage_sel_regmap,
+	.list_voltage		= regulator_list_voltage_linear,
+	.map_voltage		= regulator_map_voltage_linear,
 };
 
 static const struct regulator_desc pmi8998_lab_desc = {
@@ -59,9 +69,16 @@ static const struct regulator_desc pmi8998_lab_desc = {
 	.enable_val		= LABIBB_CONTROL_ENABLE,
 	.enable_time		= LAB_ENABLE_TIME,
 	.poll_enabled_time	= LABIBB_POLL_ENABLED_TIME,
+	.vsel_reg		= (PMI8998_LAB_REG_BASE + REG_LABIBB_VOLTAGE),
+	.vsel_mask		= LAB_VOLTAGE_SET_MASK,
+	.apply_reg		= (PMI8998_LAB_REG_BASE + REG_LABIBB_VOLTAGE),
+	.apply_bit		= LABIBB_VOLTAGE_OVERRIDE_EN,
 	.off_on_delay		= LABIBB_OFF_ON_DELAY,
 	.owner			= THIS_MODULE,
 	.type			= REGULATOR_VOLTAGE,
+	.min_uV			= 4600000,
+	.uV_step		= 100000,
+	.n_voltages		= 16,
 	.ops			= &qcom_labibb_ops,
 };
 
@@ -71,9 +88,16 @@ static const struct regulator_desc pmi8998_ibb_desc = {
 	.enable_val		= LABIBB_CONTROL_ENABLE,
 	.enable_time		= IBB_ENABLE_TIME,
 	.poll_enabled_time	= LABIBB_POLL_ENABLED_TIME,
+	.vsel_reg		= (PMI8998_IBB_REG_BASE + REG_LABIBB_VOLTAGE),
+	.vsel_mask		= IBB_VOLTAGE_SET_MASK,
+	.apply_reg		= (PMI8998_IBB_REG_BASE + REG_LABIBB_VOLTAGE),
+	.apply_bit		= LABIBB_VOLTAGE_OVERRIDE_EN,
 	.off_on_delay		= LABIBB_OFF_ON_DELAY,
 	.owner			= THIS_MODULE,
 	.type			= REGULATOR_VOLTAGE,
+	.min_uV			= 1400000,
+	.uV_step		= 100000,
+	.n_voltages		= 64,
 	.ops			= &qcom_labibb_ops,
 };
 
-- 
2.29.2

