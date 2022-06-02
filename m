Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D90F553B422
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Jun 2022 09:09:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231598AbiFBHJm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 2 Jun 2022 03:09:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58434 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231610AbiFBHJj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 2 Jun 2022 03:09:39 -0400
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF41AF5B0
        for <linux-arm-msm@vger.kernel.org>; Thu,  2 Jun 2022 00:09:37 -0700 (PDT)
Received: by mail-lj1-x22c.google.com with SMTP id m26so4352386ljb.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jun 2022 00:09:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=qElKsV2vhgg9lh1oEQvLqrVV3o7kWqVpeyDDIi7LS9s=;
        b=hCDHzoLnyF0sPOP+UlBAWU0IeVswjLZbzVz0VuxNnyXw6/+Eib195M4TjStqi1N3fa
         Ewn0T6PRkhPjpqRNICHFxbnUapH9X6MDU8ablOp+L+0o1HaukOZDy8fDy4IkcU9fouO4
         c/aiR5GbJXK8d7jxjlizvUeEhvynW+4DeYyMcpW/xLAk3GiHwS/MxJvfhJhG3MR306mc
         rK2bHnU4LV9u94c3Gbkj5dYq6o7KXmuuLpG0e+5h+T/gvfQGCGDcl4d5l4qjkTL7AiQi
         X+VBVBgOMIeUSb/P+gHvZOan0NNvNiN9OFBKkxShLowmYb5x06XL0hR1HRq46GYqUhxA
         fWVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qElKsV2vhgg9lh1oEQvLqrVV3o7kWqVpeyDDIi7LS9s=;
        b=Txu4bIvwN/7X8KKFEUxcu7/s/wNBbfogM+sl2BsbCOnEVCFUEEKIlkG+9He8RYqxOl
         Bdb0ZwMYB3XtVV3YcfxD564SkpA70pXI0FuHY5xL7slXOu5wLBwiMbnzYP3OMI/csPck
         GeugLUSOQ1S+uFbsou7XzAy/2m/d0iUcbX0kFMTULxtjoPqN2uC1HK5wNI/f+SRIo5SW
         KK28LLQsvNk2AXhoVhZwRt31R/0Akn/lxED+fyqeaO9gpmo5Cn/nGUZk4u6d79HjLrYv
         8Cfac/7J/CrOBM/3XZylo/OsCHG7swKEFVK85gwNAlQ1g3MbHe1SYGiGbcXEeFmaPqNQ
         /0vw==
X-Gm-Message-State: AOAM532XEHNsVN97z65W1YsNF1eEp8e0tg8Fu4XTjm2YBLy4yGrXiTlI
        YfrW9cXyVs/5ODcguY8uSh6EiA==
X-Google-Smtp-Source: ABdhPJz6oVZYN4od2s0RhtgDmsc1k5qsUTVile3Z3At9zXsy8BLR8ZsZBq4m+K47XwsaY6v7yMvE8Q==
X-Received: by 2002:a05:651c:1029:b0:255:7038:f7e8 with SMTP id w9-20020a05651c102900b002557038f7e8mr2702182ljm.377.1654153775872;
        Thu, 02 Jun 2022 00:09:35 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id d25-20020a056512369900b0047255d21114sm870218lfs.67.2022.06.02.00.09.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jun 2022 00:09:35 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org
Subject: [RFC PATCH v3 27/30] phy: qcom-qmp-combo: use bulk reset_control API
Date:   Thu,  2 Jun 2022 10:09:06 +0300
Message-Id: <20220602070909.1666068-28-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220602070909.1666068-1-dmitry.baryshkov@linaro.org>
References: <20220602070909.1666068-1-dmitry.baryshkov@linaro.org>
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

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 49 +++++++++--------------
 1 file changed, 18 insertions(+), 31 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
index c7f8a7f7a9ba..c227880f3a4f 100644
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

