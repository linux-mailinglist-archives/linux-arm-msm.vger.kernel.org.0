Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 547416FD431
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 May 2023 05:21:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235595AbjEJDU6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 9 May 2023 23:20:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59534 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235579AbjEJDUR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 9 May 2023 23:20:17 -0400
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB3143AB6;
        Tue,  9 May 2023 20:20:15 -0700 (PDT)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 34A2U4Hc002448;
        Wed, 10 May 2023 03:19:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=qcppdkim1;
 bh=TpPvdtbtP8Uopr67Mwq1bk1FKu87/RDUMG5SoRWrxfU=;
 b=jbGPYhTs2NvOXcsg5noL5Ts4//p0t3jN6NKZbpvndhyKOQktKnUsf+vS5t3/NeJI6PkE
 myY7tI+n+HyFPI6QqgGNls3Bx3mIfhlldGZxbDB7yMpBYk7pem96q9abk6EPQd6dWWY1
 xDFssHi1ASXdi/WEMoCNgoTjoCIbGnZoLyeA3ls1j+56XBBCHpTR89LT1K8q6RbDYJr1
 dZ3A84i+hSQbHiZarNSCiM7foKggguE6blQyscrl0PsAIu0JiwMxoldLlc3MOGhYVXHc
 Px7rX+rHFDhYmkORgpafuIxfdf03HNmDklGzq5ab2IhE2wkuqByuwuhyBDZgg5Ommx8/ JA== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3qfyx08ae1-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 10 May 2023 03:19:38 +0000
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
        by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 34A3JaEt016023
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 10 May 2023 03:19:37 GMT
Received: from hu-bjorande-lv.qualcomm.com (10.49.16.6) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.42; Tue, 9 May 2023 20:19:36 -0700
From:   Bjorn Andersson <quic_bjorande@quicinc.com>
To:     Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Johan Hovold <johan@kernel.org>
CC:     Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-phy@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Johan Hovold <johan+linaro@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Abel Vesa <abel.vesa@linaro.org>,
        Steev Klimaszewski <steev@kali.org>
Subject: [PATCH v2 5/8] phy: qcom-qmp-combo: Introduce orientation switching
Date:   Tue, 9 May 2023 20:19:27 -0700
Message-ID: <20230510031930.1996020-6-quic_bjorande@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230510031930.1996020-1-quic_bjorande@quicinc.com>
References: <20230510031930.1996020-1-quic_bjorande@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: hACKrqlMHkw1v1qFn_60vf5PAxqS6kNB
X-Proofpoint-GUID: hACKrqlMHkw1v1qFn_60vf5PAxqS6kNB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-09_16,2023-05-05_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 priorityscore=1501 malwarescore=0 phishscore=0 mlxlogscore=999
 clxscore=1015 impostorscore=0 suspectscore=0 spamscore=0 bulkscore=0
 lowpriorityscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2304280000 definitions=main-2305100023
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The data lanes of the QMP PHY is swapped in order to handle changing
orientation of the USB Type-C cable. Register a typec_switch device to
allow a TCPM to configure the orientation.

The newly introduced orientation variable is adjusted based on the
request, and the initialized components are brought down and up again.
To keep track of what parts needs to be cycled new variables to keep
track of the individual init_count is introduced.

Both the USB and the DisplayPort altmode signals are properly switched.
For DisplayPort the controller will after the TCPM having established
orientation power on the PHY, so this is not done implicitly, but for
USB the PHY typically is kept initialized across the switch, and must
therefore then be reinitialized.

This is based on initial work by Wesley Cheng.

Link: https://lore.kernel.org/r/20201009082843.28503-3-wcheng@codeaurora.org/
Signed-off-by: Bjorn Andersson <quic_bjorande@quicinc.com>
Reviewed-by: Johan Hovold <johan+linaro@kernel.org>
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Tested-by: Abel Vesa <abel.vesa@linaro.org>
Tested-by: Steev Klimaszewski <steev@kali.org>
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on HDK8450
Tested-by: Johan Hovold <johan+linaro@kernel.org>	# X13s
---

Changes since v1:
- Add TYPEC dependency in Kconfig
- Whitespace changes

 drivers/phy/qualcomm/Kconfig              |  1 +
 drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 93 ++++++++++++++++++++---
 2 files changed, 85 insertions(+), 9 deletions(-)

diff --git a/drivers/phy/qualcomm/Kconfig b/drivers/phy/qualcomm/Kconfig
index 4850d48f31fa..45330e0f66fe 100644
--- a/drivers/phy/qualcomm/Kconfig
+++ b/drivers/phy/qualcomm/Kconfig
@@ -59,6 +59,7 @@ if PHY_QCOM_QMP
 config PHY_QCOM_QMP_COMBO
 	tristate "Qualcomm QMP Combo PHY Driver"
 	default PHY_QCOM_QMP
+	depends on TYPEC || TYPEC=n
 	select GENERIC_PHY
 	select MFD_SYSCON
 	help
diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
index e0d246e7086d..52aa2735b841 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
@@ -20,6 +20,7 @@
 #include <linux/reset.h>
 #include <linux/slab.h>
 #include <linux/usb/typec.h>
+#include <linux/usb/typec_mux.h>
 
 #include <dt-bindings/phy/phy-qcom-qmp.h>
 
@@ -1320,15 +1321,18 @@ struct qmp_combo {
 
 	struct phy *usb_phy;
 	enum phy_mode mode;
+	unsigned int usb_init_count;
 
 	struct phy *dp_phy;
 	unsigned int dp_aux_cfg;
 	struct phy_configure_opts_dp dp_opts;
+	unsigned int dp_init_count;
 
 	struct clk_fixed_rate pipe_clk_fixed;
 	struct clk_hw dp_link_hw;
 	struct clk_hw dp_pixel_hw;
 
+	struct typec_switch_dev *sw;
 	enum typec_orientation orientation;
 };
 
@@ -2467,14 +2471,14 @@ static int qmp_combo_dp_calibrate(struct phy *phy)
 	return ret;
 }
 
-static int qmp_combo_com_init(struct qmp_combo *qmp)
+static int qmp_combo_com_init(struct qmp_combo *qmp, bool force)
 {
 	const struct qmp_phy_cfg *cfg = qmp->cfg;
 	void __iomem *com = qmp->com;
 	int ret;
 	u32 val;
 
-	if (qmp->init_count++)
+	if (!force && qmp->init_count++)
 		return 0;
 
 	ret = regulator_bulk_enable(cfg->num_vregs, qmp->vregs);
@@ -2536,11 +2540,11 @@ static int qmp_combo_com_init(struct qmp_combo *qmp)
 	return ret;
 }
 
-static int qmp_combo_com_exit(struct qmp_combo *qmp)
+static int qmp_combo_com_exit(struct qmp_combo *qmp, bool force)
 {
 	const struct qmp_phy_cfg *cfg = qmp->cfg;
 
-	if (--qmp->init_count)
+	if (!force && --qmp->init_count)
 		return 0;
 
 	reset_control_bulk_assert(cfg->num_resets, qmp->resets);
@@ -2560,12 +2564,14 @@ static int qmp_combo_dp_init(struct phy *phy)
 
 	mutex_lock(&qmp->phy_mutex);
 
-	ret = qmp_combo_com_init(qmp);
+	ret = qmp_combo_com_init(qmp, false);
 	if (ret)
 		goto out_unlock;
 
 	cfg->dp_aux_init(qmp);
 
+	qmp->dp_init_count++;
+
 out_unlock:
 	mutex_unlock(&qmp->phy_mutex);
 	return ret;
@@ -2577,7 +2583,9 @@ static int qmp_combo_dp_exit(struct phy *phy)
 
 	mutex_lock(&qmp->phy_mutex);
 
-	qmp_combo_com_exit(qmp);
+	qmp_combo_com_exit(qmp, false);
+
+	qmp->dp_init_count--;
 
 	mutex_unlock(&qmp->phy_mutex);
 
@@ -2706,16 +2714,18 @@ static int qmp_combo_usb_init(struct phy *phy)
 	int ret;
 
 	mutex_lock(&qmp->phy_mutex);
-	ret = qmp_combo_com_init(qmp);
+	ret = qmp_combo_com_init(qmp, false);
 	if (ret)
 		goto out_unlock;
 
 	ret = qmp_combo_usb_power_on(phy);
 	if (ret) {
-		qmp_combo_com_exit(qmp);
+		qmp_combo_com_exit(qmp, false);
 		goto out_unlock;
 	}
 
+	qmp->usb_init_count++;
+
 out_unlock:
 	mutex_unlock(&qmp->phy_mutex);
 	return ret;
@@ -2731,10 +2741,12 @@ static int qmp_combo_usb_exit(struct phy *phy)
 	if (ret)
 		goto out_unlock;
 
-	ret = qmp_combo_com_exit(qmp);
+	ret = qmp_combo_com_exit(qmp, false);
 	if (ret)
 		goto out_unlock;
 
+	qmp->usb_init_count--;
+
 out_unlock:
 	mutex_unlock(&qmp->phy_mutex);
 	return ret;
@@ -3203,6 +3215,65 @@ static int qmp_combo_register_clocks(struct qmp_combo *qmp, struct device_node *
 	return devm_add_action_or_reset(qmp->dev, phy_clk_release_provider, dp_np);
 }
 
+#if IS_ENABLED(CONFIG_TYPEC)
+static int qmp_combo_typec_switch_set(struct typec_switch_dev *sw,
+				      enum typec_orientation orientation)
+{
+	struct qmp_combo *qmp = typec_switch_get_drvdata(sw);
+	const struct qmp_phy_cfg *cfg = qmp->cfg;
+
+	if (orientation == qmp->orientation || orientation == TYPEC_ORIENTATION_NONE)
+		return 0;
+
+	mutex_lock(&qmp->phy_mutex);
+	qmp->orientation = orientation;
+
+	if (qmp->init_count) {
+		if (qmp->usb_init_count)
+			qmp_combo_usb_power_off(qmp->usb_phy);
+		qmp_combo_com_exit(qmp, true);
+
+		qmp_combo_com_init(qmp, true);
+		if (qmp->usb_init_count)
+			qmp_combo_usb_power_on(qmp->usb_phy);
+		if (qmp->dp_init_count)
+			cfg->dp_aux_init(qmp);
+	}
+	mutex_unlock(&qmp->phy_mutex);
+
+	return 0;
+}
+
+static void qmp_combo_typec_unregister(void *data)
+{
+	struct qmp_combo *qmp = data;
+
+	typec_switch_unregister(qmp->sw);
+}
+
+static int qmp_combo_typec_switch_register(struct qmp_combo *qmp)
+{
+	struct typec_switch_desc sw_desc = {};
+	struct device *dev = qmp->dev;
+
+	sw_desc.drvdata = qmp;
+	sw_desc.fwnode = dev->fwnode;
+	sw_desc.set = qmp_combo_typec_switch_set;
+	qmp->sw = typec_switch_register(dev, &sw_desc);
+	if (IS_ERR(qmp->sw)) {
+		dev_err(dev, "Unable to register typec switch: %pe\n", qmp->sw);
+		return PTR_ERR(qmp->sw);
+	}
+
+	return devm_add_action_or_reset(dev, qmp_combo_typec_unregister, qmp);
+}
+#else
+static int qmp_combo_typec_switch_register(struct qmp_combo *qmp)
+{
+	return 0;
+}
+#endif
+
 static int qmp_combo_parse_dt_lecacy_dp(struct qmp_combo *qmp, struct device_node *np)
 {
 	struct device *dev = qmp->dev;
@@ -3403,6 +3474,10 @@ static int qmp_combo_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
+	ret = qmp_combo_typec_switch_register(qmp);
+	if (ret)
+		return ret;
+
 	/* Check for legacy binding with child nodes. */
 	usb_np = of_get_child_by_name(dev->of_node, "usb3-phy");
 	if (usb_np) {
-- 
2.39.2

