Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7D76C534591
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 May 2022 23:03:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345244AbiEYVCh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 25 May 2022 17:02:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49678 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345226AbiEYVCg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 25 May 2022 17:02:36 -0400
Received: from alexa-out-sd-01.qualcomm.com (alexa-out-sd-01.qualcomm.com [199.106.114.38])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 65482BA570;
        Wed, 25 May 2022 14:02:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1653512555; x=1685048555;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=+k/hqfFc9sQX6DhvkkwHpoIs3mFnvmNe9v0UmitQdak=;
  b=Q2AYnblULiLwrt1ZJJgA7acf2xEpql/3jxKKBDJHDt+yqXMv0yPobIMo
   o46UEt+xB8ME14MaqARgDB27yEYWelPX5TNmHFzat2uuL49ghjAs2xLKi
   7mptlTfGtYkvkuJ456j4eqrQllEhKbnx+uQJ6l1Z9hUG0Uxvkl7Ro0q8J
   c=;
Received: from unknown (HELO ironmsg03-sd.qualcomm.com) ([10.53.140.143])
  by alexa-out-sd-01.qualcomm.com with ESMTP; 25 May 2022 14:02:35 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg03-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 May 2022 14:02:34 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Wed, 25 May 2022 14:02:34 -0700
Received: from khsieh-linux1.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Wed, 25 May 2022 14:02:33 -0700
From:   Kuogee Hsieh <quic_khsieh@quicinc.com>
To:     <dri-devel@lists.freedesktop.org>, <robdclark@gmail.com>,
        <sean@poorly.run>, <swboyd@chromium.org>, <dianders@chromium.org>,
        <vkoul@kernel.org>, <daniel@ffwll.ch>, <airlied@linux.ie>,
        <agross@kernel.org>, <dmitry.baryshkov@linaro.org>,
        <bjorn.andersson@linaro.org>
CC:     Kuogee Hsieh <quic_khsieh@quicinc.com>,
        <quic_abhinavk@quicinc.com>, <quic_aravindh@quicinc.com>,
        <quic_sbillaka@quicinc.com>, <freedreno@lists.freedesktop.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v13 2/3] phy: qcom-qmp: add regulator_set_load to dp phy
Date:   Wed, 25 May 2022 14:02:19 -0700
Message-ID: <1653512540-21956-3-git-send-email-quic_khsieh@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1653512540-21956-1-git-send-email-quic_khsieh@quicinc.com>
References: <1653512540-21956-1-git-send-email-quic_khsieh@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This patch add regulator_set_load() before enable regulator at
DP phy driver.

Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
Reviewed-by: Stephen Boyd <swboyd@chromium.org>
Reviewed-by: Douglas Anderson <dianders@chromium.org>
---
 drivers/phy/qualcomm/phy-qcom-qmp.c | 40 ++++++++++++++++++++++++++++---------
 1 file changed, 31 insertions(+), 9 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp.c b/drivers/phy/qualcomm/phy-qcom-qmp.c
index b144ae1..26b290c 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp.c
@@ -3075,6 +3075,17 @@ static const struct qmp_phy_init_tbl sm8450_qmp_gen4x2_pcie_pcs_misc_tbl[] = {
 	QMP_PHY_INIT_CFG(QPHY_V5_20_PCS_PCIE_G4_PRE_GAIN, 0x2e),
 };
 
+/* list of regulators */
+struct qmp_regulator_data {
+	const char *name;
+	unsigned int enable_load;
+};
+
+struct qmp_regulator_data qmp_phy_vreg_l[] = {
+	{ .name = "vdda-phy", .enable_load = 21800 },
+	{ .name = "vdda-pll", .enable_load = 36000 },
+};
+
 struct qmp_phy;
 
 /* struct qmp_phy_cfg - per-PHY initialization config */
@@ -3129,7 +3140,7 @@ struct qmp_phy_cfg {
 	const char * const *reset_list;
 	int num_resets;
 	/* regulators to be requested */
-	const char * const *vreg_list;
+	const struct qmp_regulator_data *vreg_list;
 	int num_vregs;
 
 	/* array of registers with different offsets */
@@ -3341,11 +3352,6 @@ static const char * const sdm845_pciephy_reset_l[] = {
 	"phy",
 };
 
-/* list of regulators */
-static const char * const qmp_phy_vreg_l[] = {
-	"vdda-phy", "vdda-pll",
-};
-
 static const struct qmp_phy_cfg ipq8074_usb3phy_cfg = {
 	.type			= PHY_TYPE_USB3,
 	.nlanes			= 1,
@@ -5488,16 +5494,32 @@ static int qcom_qmp_phy_vreg_init(struct device *dev, const struct qmp_phy_cfg *
 {
 	struct qcom_qmp *qmp = dev_get_drvdata(dev);
 	int num = cfg->num_vregs;
-	int i;
+	int ret, i;
 
 	qmp->vregs = devm_kcalloc(dev, num, sizeof(*qmp->vregs), GFP_KERNEL);
 	if (!qmp->vregs)
 		return -ENOMEM;
 
 	for (i = 0; i < num; i++)
-		qmp->vregs[i].supply = cfg->vreg_list[i];
+		qmp->vregs[i].supply = cfg->vreg_list[i].name;
 
-	return devm_regulator_bulk_get(dev, num, qmp->vregs);
+	ret = devm_regulator_bulk_get(dev, num, qmp->vregs);
+	if (ret) {
+		dev_err(dev, "failed at devm_regulator_bulk_get\n");
+		return ret;
+	}
+
+	for (i = 0; i < num; i++) {
+		ret = regulator_set_load(qmp->vregs[i].consumer,
+					 cfg->vreg_list[i].enable_load);
+		if (ret) {
+			dev_err(dev, "failed to set load at %s\n",
+				qmp->vregs[i].supply);
+			return ret;
+		}
+	}
+
+	return 0;
 }
 
 static int qcom_qmp_phy_reset_init(struct device *dev, const struct qmp_phy_cfg *cfg)
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

