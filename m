Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6617454277A
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jun 2022 09:06:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235206AbiFHHE7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 8 Jun 2022 03:04:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55850 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245500AbiFHFzq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 8 Jun 2022 01:55:46 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D65C377B01
        for <linux-arm-msm@vger.kernel.org>; Tue,  7 Jun 2022 14:32:41 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id i29so13521292lfp.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jun 2022 14:32:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=matJENDD03EhkdkDtCt3TARGaEJsorl9M5onQ8hujOI=;
        b=BSCF9e0GHPCHP7o9hiTxQOnDMFaAEZ2yi9p6GlDte5H7jDB1PHoxX3aJ1Y2kAdgrrF
         khgmUJIfvDwJmoPDKQWTwwlw9IWSYv1PpTO159vjqovobxKNRwCxNU3JpgBmfGqdjdps
         PkKXspJvIkt7gVr0rEi+RPpNJ9js1aH5aX3GbUEJKpDJwx2ZskcuyJzukn3Krmmsr6UG
         s/agWohMjm6ET/qES7X82su0KZMguMpRc8DQmj9bvagPO3p2wcDptDjbMux3HkpjGRtf
         7Z0nmfvtSuxki0tMhad92CKnT3OgJLKm/vmTCD+KJn/OTVTn2ItD+pvyNd9mP5rtftcK
         VlaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=matJENDD03EhkdkDtCt3TARGaEJsorl9M5onQ8hujOI=;
        b=rii4PRcf+PQUey0EQI7SJ7gm+4v3s2lHtiR6Y58cQP1riUZ2cvacsJdwLnZwbEfqDp
         axhDlSH2hveUEVooXTwzgBZabIWeLjm1ngWwLZECXxVS9aAQnQKHKBV1u8Ka1QuhCwku
         fpqY/+Ch8M8jp8u2YQPch8vxs2vMQ0u93qu97LCcMD8DJeghdzWYlXeWwgajgjJMXJhc
         2R+joz5u3rN1lu326lFq2E4V/xggeEL85bHsYJUH7oDeScsWRV87xJTXWINNNd1/BHiO
         hvqmO0dpv+P2qHj6t4VWgPTzmXA8RBV7EpPl+BVMTyI50APNhLIJYw2yd7VqW4zoyK5w
         eCUw==
X-Gm-Message-State: AOAM5301IxOWNwuAjx+L0eHHqvMg2yBlr3JVjjt9auAqvhBkRc9H8P7s
        SypbYfMrcdRPwdU+J6yH9Y2sdQ==
X-Google-Smtp-Source: ABdhPJzZQUSICiJTEbANj9rHD07tP91hOy1sXeETz/+fwDrt7Vn8eJc/ja7/9GzGHUgIGtTS3HDgvA==
X-Received: by 2002:a05:6512:169f:b0:479:f44:6a2c with SMTP id bu31-20020a056512169f00b004790f446a2cmr18541371lfb.80.1654637561025;
        Tue, 07 Jun 2022 14:32:41 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id g23-20020ac24d97000000b0047255d21153sm3411343lfe.130.2022.06.07.14.32.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jun 2022 14:32:40 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org
Subject: [PATCH v1 27/30] phy: qcom-qmp-combo: use bulk reset_control API
Date:   Wed,  8 Jun 2022 00:32:00 +0300
Message-Id: <20220607213203.2819885-28-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220607213203.2819885-1-dmitry.baryshkov@linaro.org>
References: <20220607213203.2819885-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Switch qcom-qmp-combo driver to use reset_control_bulk_assert / _deassert
functions rather than hardcoding the loops in the driver itself.

Acked-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Tested-by: Bjorn Andersson <bjorn.andersson@linaro.org> # UFS, PCIe and USB on SC8180X
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 49 +++++++++--------------
 1 file changed, 18 insertions(+), 31 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
index 86dc400a037e..893b5a4bb554 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
@@ -741,7 +741,7 @@ struct qcom_qmp {
 	void __iomem *dp_com;
 
 	struct clk_bulk_data *clks;
-	struct reset_control **resets;
+	struct reset_control_bulk_data *resets;
 	struct regulator_bulk_data *vregs;
 
 	struct qmp_phy **phys;
@@ -1586,7 +1586,7 @@ static int qcom_qmp_phy_combo_com_init(struct qmp_phy *qphy)
 	const struct qmp_phy_cfg *cfg = qphy->cfg;
 	void __iomem *pcs = qphy->pcs;
 	void __iomem *dp_com = qmp->dp_com;
-	int ret, i;
+	int ret;
 
 	mutex_lock(&qmp->phy_mutex);
 	if (qmp->init_count++) {
@@ -1601,22 +1601,16 @@ static int qcom_qmp_phy_combo_com_init(struct qmp_phy *qphy)
 		goto err_unlock;
 	}
 
-	for (i = 0; i < cfg->num_resets; i++) {
-		ret = reset_control_assert(qmp->resets[i]);
-		if (ret) {
-			dev_err(qmp->dev, "%s reset assert failed\n",
-				cfg->reset_list[i]);
-			goto err_disable_regulators;
-		}
+	ret = reset_control_bulk_assert(cfg->num_resets, qmp->resets);
+	if (ret) {
+		dev_err(qmp->dev, "reset assert failed\n");
+		goto err_disable_regulators;
 	}
 
-	for (i = cfg->num_resets - 1; i >= 0; i--) {
-		ret = reset_control_deassert(qmp->resets[i]);
-		if (ret) {
-			dev_err(qmp->dev, "%s reset deassert failed\n",
-				qphy->cfg->reset_list[i]);
-			goto err_assert_reset;
-		}
+	ret = reset_control_bulk_deassert(cfg->num_resets, qmp->resets);
+	if (ret) {
+		dev_err(qmp->dev, "reset deassert failed\n");
+		goto err_disable_regulators;
 	}
 
 	ret = clk_bulk_prepare_enable(cfg->num_clks, qmp->clks);
@@ -1659,8 +1653,7 @@ static int qcom_qmp_phy_combo_com_init(struct qmp_phy *qphy)
 	return 0;
 
 err_assert_reset:
-	while (++i < cfg->num_resets)
-		reset_control_assert(qmp->resets[i]);
+	reset_control_bulk_assert(cfg->num_resets, qmp->resets);
 err_disable_regulators:
 	regulator_bulk_disable(cfg->num_vregs, qmp->vregs);
 err_unlock:
@@ -1673,7 +1666,6 @@ static int qcom_qmp_phy_combo_com_exit(struct qmp_phy *qphy)
 {
 	struct qcom_qmp *qmp = qphy->qmp;
 	const struct qmp_phy_cfg *cfg = qphy->cfg;
-	int i = cfg->num_resets;
 
 	mutex_lock(&qmp->phy_mutex);
 	if (--qmp->init_count) {
@@ -1683,8 +1675,7 @@ static int qcom_qmp_phy_combo_com_exit(struct qmp_phy *qphy)
 
 	reset_control_assert(qmp->ufs_reset);
 
-	while (--i >= 0)
-		reset_control_assert(qmp->resets[i]);
+	reset_control_bulk_assert(cfg->num_resets, qmp->resets);
 
 	clk_bulk_disable_unprepare(cfg->num_clks, qmp->clks);
 
@@ -1994,23 +1985,19 @@ static int qcom_qmp_phy_combo_reset_init(struct device *dev, const struct qmp_ph
 {
 	struct qcom_qmp *qmp = dev_get_drvdata(dev);
 	int i;
+	int ret;
 
 	qmp->resets = devm_kcalloc(dev, cfg->num_resets,
 				   sizeof(*qmp->resets), GFP_KERNEL);
 	if (!qmp->resets)
 		return -ENOMEM;
 
-	for (i = 0; i < cfg->num_resets; i++) {
-		struct reset_control *rst;
-		const char *name = cfg->reset_list[i];
+	for (i = 0; i < cfg->num_resets; i++)
+		qmp->resets[i].id = cfg->reset_list[i];
 
-		rst = devm_reset_control_get_exclusive(dev, name);
-		if (IS_ERR(rst)) {
-			dev_err(dev, "failed to get %s reset\n", name);
-			return PTR_ERR(rst);
-		}
-		qmp->resets[i] = rst;
-	}
+	ret = devm_reset_control_bulk_get_exclusive(dev, cfg->num_resets, qmp->resets);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to get resets\n");
 
 	return 0;
 }
-- 
2.35.1

