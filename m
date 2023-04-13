Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 60E246E0CBA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Apr 2023 13:35:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231161AbjDMLfg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 13 Apr 2023 07:35:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36414 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231154AbjDMLfd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 13 Apr 2023 07:35:33 -0400
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 325199EEE
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Apr 2023 04:35:17 -0700 (PDT)
Received: by mail-wr1-x434.google.com with SMTP id s2so10625022wra.7
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Apr 2023 04:35:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681385699; x=1683977699;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gBrRnJy3OveOdQzWzUMXg8AtzsE0ZcvrQQU1bmsmaXo=;
        b=jXY00Mr8MInZu5bJOHcYeJEl9wN8hyVkFACDLKQ95WmjfD0WPHH/q685vSO9RcWG2A
         YkSsdbKyOpluBi5fSQawUfPXqMf2zLOjDh2I8CZvatV/SeGagdaWg8n6yyZHu4g9lhXK
         yMv0lnfoojomIneC47286HrQENocXrmMkg1VqFrTC6ehR0mwC6WXYZZ5aT8zJcEBeZPQ
         BMG6ssU0Qqok3tfWSrTogv34va21P4V9GDQ8gfhp0r09zrheda4ul3gIuWy9gqJcoHtq
         9Z95CRYM3X72wQPIr2oLYYn/jsFAJIGyv/yVludjvTzvx9cePovdfM5XVGU4XXNt8uww
         1p8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681385699; x=1683977699;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gBrRnJy3OveOdQzWzUMXg8AtzsE0ZcvrQQU1bmsmaXo=;
        b=dvXfglshQpXnANEByh++IktTrGXgi2fXuTjee/wALxccDqr2bvksVoXZX152I2HHJE
         iLP3ixLK7a4xFZYdU4nBUK5t15V7jKiaJ2M2wt6jklvSr6UNkl9OobLcatrezJhe8Zgd
         mgZfMbMsdGOaQhMhyJ22A1Tmh/BulCKZ4elRsUKanKh457QNLsbfFxhNt8xzv9CAHQRO
         N7J+3W6bRKIS9JWwK8IAoL4tNCrCD0WQZzka62i6lJ8oCeosauu5PC8HngosQnfIAA75
         MRs71oCcucmwHjOx4BtRdb6YuUMqwSaEhY/RoRJqrbfuvEsg6IYylCeCnOH2H4/9Fgr6
         njeA==
X-Gm-Message-State: AAQBX9dbQ3y5XFiPziftoPiQxobpFwnsAePwT6I1F7lAeuWTWEIQun3C
        ldPhRA93n7N9MpmGCxb11DBMkA==
X-Google-Smtp-Source: AKy350Zyqd5dEuCoe9u5RzEEEuR09j0tqJKSI69/NUwtHlAi5urEYHkgb4SrnY2TZeYYuSn6OJPdWA==
X-Received: by 2002:a05:6000:1b8c:b0:2f4:d4a3:c252 with SMTP id r12-20020a0560001b8c00b002f4d4a3c252mr1347085wru.3.1681385699368;
        Thu, 13 Apr 2023 04:34:59 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id e16-20020a5d4e90000000b002f2782978d8sm1108877wru.20.2023.04.13.04.34.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Apr 2023 04:34:58 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     linux@roeck-us.net, heikki.krogerus@linux.intel.com,
        gregkh@linuxfoundation.org, andersson@kernel.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
Cc:     caleb.connolly@linaro.org, bryan.odonoghue@linaro.org,
        konrad.dybcio@linaro.org, subbaram@quicinc.com, jackp@quicinc.com,
        robertom@qti.qualcomm.com,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Wesley Cheng <wcheng@codeaurora.org>
Subject: [PATCH v5 14/14] phy: qcom-qmp: Register as a typec switch for orientation detection
Date:   Thu, 13 Apr 2023 12:34:38 +0100
Message-Id: <20230413113438.1577658-15-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230413113438.1577658-1-bryan.odonoghue@linaro.org>
References: <20230413113438.1577658-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

The lane select switch for USB typec orientation is within the USB QMP PHY.
the current device.  It could be connected through an endpoint, to an
independent device handling the typec detection, ie the QCOM SPMI typec
driver.

bod: Fixed the logic qcom_qmp_phy_typec_switch_set() to disable phy
 on disconnect if and only if we have initialized the PHY.
 Retained CC orientation logic in qcom_qmp_phy_com_init() to simplify
 patch.

bod: Ported from earlier version of driver to phy-qcom-qmp-combo.c

Co-developed-by: Wesley Cheng <wcheng@codeaurora.org>
Signed-off-by: Wesley Cheng <wcheng@codeaurora.org>
Co-developed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/phy/qualcomm/Kconfig              |  8 +++
 drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 80 +++++++++++++++++++++--
 2 files changed, 84 insertions(+), 4 deletions(-)

diff --git a/drivers/phy/qualcomm/Kconfig b/drivers/phy/qualcomm/Kconfig
index 4850d48f31fa1..8240fffdbed4e 100644
--- a/drivers/phy/qualcomm/Kconfig
+++ b/drivers/phy/qualcomm/Kconfig
@@ -101,6 +101,14 @@ config PHY_QCOM_QMP_USB
 
 endif # PHY_QCOM_QMP
 
+config PHY_QCOM_QMP_TYPEC
+	def_bool PHY_QCOM_QMP=y && TYPEC=y || PHY_QCOM_QMP=m && TYPEC
+	help
+	  Register a type C switch from the QMP PHY driver for type C
+	  orientation support.  This has dependencies with if the type C kernel
+	  configuration is enabled or not.  This support will not be present if
+	  USB type C is disabled.
+
 config PHY_QCOM_QUSB2
 	tristate "Qualcomm QUSB2 PHY Driver"
 	depends on OF && (ARCH_QCOM || COMPILE_TEST)
diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
index 6850e04c329b8..b9a30c087423d 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
@@ -19,6 +19,7 @@
 #include <linux/regulator/consumer.h>
 #include <linux/reset.h>
 #include <linux/slab.h>
+#include <linux/usb/typec_mux.h>
 
 #include <dt-bindings/phy/phy-qcom-qmp.h>
 
@@ -63,6 +64,10 @@
 /* QPHY_V3_PCS_MISC_CLAMP_ENABLE register bits */
 #define CLAMP_EN				BIT(0) /* enables i/o clamp_n */
 
+/* QPHY_V3_DP_COM_TYPEC_CTRL register bits */
+#define SW_PORTSELECT_VAL			BIT(0)
+#define SW_PORTSELECT_MUX			BIT(1)
+
 #define PHY_INIT_COMPLETE_TIMEOUT		10000
 
 struct qmp_phy_init_tbl {
@@ -1323,6 +1328,9 @@ struct qmp_combo {
 	struct clk_fixed_rate pipe_clk_fixed;
 	struct clk_hw dp_link_hw;
 	struct clk_hw dp_pixel_hw;
+
+	struct typec_switch_dev *sw;
+	enum typec_orientation orientation;
 };
 
 static void qmp_v3_dp_aux_init(struct qmp_combo *qmp);
@@ -1955,7 +1963,8 @@ static void qmp_v3_configure_dp_tx(struct qmp_combo *qmp)
 static bool qmp_combo_configure_dp_mode(struct qmp_combo *qmp)
 {
 	u32 val;
-	bool reverse = false;
+	bool reverse = qmp->orientation == TYPEC_ORIENTATION_REVERSE;
+	const struct phy_configure_opts_dp *dp_opts = &qmp->dp_opts;
 
 	val = DP_PHY_PD_CTL_PWRDN | DP_PHY_PD_CTL_AUX_PWRDN |
 	      DP_PHY_PD_CTL_PLL_PWRDN | DP_PHY_PD_CTL_DP_CLAMP_EN;
@@ -1974,10 +1983,18 @@ static bool qmp_combo_configure_dp_mode(struct qmp_combo *qmp)
 	 * if (orientation == ORIENTATION_CC2)
 	 *	writel(0x4c, qmp->dp_dp_phy + QSERDES_V3_DP_PHY_MODE);
 	 */
+	if (dp_opts->lanes == 4 || reverse)
+		val |= DP_PHY_PD_CTL_LANE_0_1_PWRDN;
+	if (dp_opts->lanes == 4 || !reverse)
+		val |= DP_PHY_PD_CTL_LANE_2_3_PWRDN;
+
 	val |= DP_PHY_PD_CTL_LANE_2_3_PWRDN;
 	writel(val, qmp->dp_dp_phy + QSERDES_DP_PHY_PD_CTL);
 
-	writel(0x5c, qmp->dp_dp_phy + QSERDES_DP_PHY_MODE);
+	if (reverse)
+		writel(0x4c, qmp->pcs + QSERDES_DP_PHY_MODE);
+	else
+		writel(0x5c, qmp->pcs + QSERDES_DP_PHY_MODE);
 
 	return reverse;
 }
@@ -2461,6 +2478,7 @@ static int qmp_combo_com_init(struct qmp_combo *qmp)
 {
 	const struct qmp_phy_cfg *cfg = qmp->cfg;
 	void __iomem *com = qmp->com;
+	u32 val;
 	int ret;
 
 	mutex_lock(&qmp->phy_mutex);
@@ -2498,8 +2516,11 @@ static int qmp_combo_com_init(struct qmp_combo *qmp)
 			SW_DPPHY_RESET_MUX | SW_DPPHY_RESET |
 			SW_USB3PHY_RESET_MUX | SW_USB3PHY_RESET);
 
-	/* Default type-c orientation, i.e CC1 */
-	qphy_setbits(com, QPHY_V3_DP_COM_TYPEC_CTRL, 0x02);
+	/* Latch CC orientation based on reported state by TCPM */
+	val = SW_PORTSELECT_MUX;
+	if (qmp->orientation == TYPEC_ORIENTATION_REVERSE)
+		val |= SW_PORTSELECT_VAL;
+	qphy_setbits(com, QPHY_V3_DP_COM_TYPEC_CTRL, val);
 
 	qphy_setbits(com, QPHY_V3_DP_COM_PHY_MODE_CTRL, USB3_MODE | DP_MODE);
 
@@ -3338,6 +3359,53 @@ static struct phy *qmp_combo_phy_xlate(struct device *dev, struct of_phandle_arg
 	return ERR_PTR(-EINVAL);
 }
 
+#if IS_ENABLED(CONFIG_PHY_QCOM_QMP_TYPEC)
+static int qmp_combo_typec_switch_set(struct typec_switch_dev *sw,
+				      enum typec_orientation orientation)
+{
+	struct qmp_combo *qmp = typec_switch_get_drvdata(sw);
+	struct phy *dp_phy = qmp->dp_phy;
+	int ret = 0;
+
+	dev_dbg(qmp->dev, "Toggling orientation current %d requested %d\n",
+		qmp->orientation, orientation);
+
+	qmp->orientation = orientation;
+
+	if (orientation == TYPEC_ORIENTATION_NONE) {
+		if (qmp->init_count)
+			ret = qmp_combo_dp_power_off(dp_phy);
+	} else {
+		if (!qmp->init_count)
+			ret = qmp_combo_dp_power_on(dp_phy);
+	}
+
+	return 0;
+}
+
+static int qmp_combo_typec_switch_register(struct qmp_combo *qmp)
+{
+	struct typec_switch_desc sw_desc;
+	struct device *dev = qmp->dev;
+
+	sw_desc.drvdata = qmp;
+	sw_desc.fwnode = dev->fwnode;
+	sw_desc.set = qmp_combo_typec_switch_set;
+	qmp->sw = typec_switch_register(dev, &sw_desc);
+	if (IS_ERR(qmp->sw)) {
+		dev_err(dev, "Error registering typec switch: %ld\n",
+			PTR_ERR(qmp->sw));
+	}
+
+	return 0;
+}
+#else
+static int qmp_combo_typec_switch_register(struct qmp_combo *qmp)
+{
+	return 0;
+}
+#endif
+
 static int qmp_combo_probe(struct platform_device *pdev)
 {
 	struct qmp_combo *qmp;
@@ -3428,6 +3496,10 @@ static int qmp_combo_probe(struct platform_device *pdev)
 	else
 		phy_provider = devm_of_phy_provider_register(dev, of_phy_simple_xlate);
 
+	ret = qmp_combo_typec_switch_register(qmp);
+	if (ret)
+		goto err_node_put;
+
 	of_node_put(usb_np);
 	of_node_put(dp_np);
 
-- 
2.39.2

