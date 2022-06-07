Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 46150542561
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jun 2022 08:54:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1386372AbiFHA7i (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 7 Jun 2022 20:59:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57988 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1380158AbiFGXiS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 7 Jun 2022 19:38:18 -0400
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C41522CBEB
        for <linux-arm-msm@vger.kernel.org>; Tue,  7 Jun 2022 14:32:44 -0700 (PDT)
Received: by mail-lj1-x233.google.com with SMTP id y15so15238839ljc.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jun 2022 14:32:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=fF4LijbDfT4JefOzp7UdYAr+EfQ5/5blmMbjsXFHank=;
        b=NzKE7qkr8gsr/JL7rFgPpeulg+CPzyuP+hY6oa709bKQ++KIdK4fUhE2LIL+mnyxUa
         D6mVy/+r5k49UN02ZeQLXPmf7vapIERQfwwuhK6Jga3COW0mwzZbzYG+pYaHW0KbG+xS
         uJcmiR6679vZUunpZWEz4k4JyosPTnhPm/lEkBeXweEodeDsJ0KCak9xAeXUBSI4b7QM
         mtTAKQ0fCtGY5/ulYgQHXXJykPvq6MKm2EYHUr89HaH+b0G5NZdakXT9XUmA1eF92k1G
         GYZQfC4z3eXu40mF70KL3RdZavDj9peZ/7mJiRIkoa4IDobsuBguBjyHu5G5VigPqWF+
         N+dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fF4LijbDfT4JefOzp7UdYAr+EfQ5/5blmMbjsXFHank=;
        b=7QKuCsu8q7vRsp8/Lr40loGczKNrC3qSV1cqD9KsbD+/wgdgc7Nqs6avV08sDK0MsS
         ddnEhWE5TsX22Vl/HW7AOQLUVilgNvVTMW195mdi4pkEN0zl8PcXGidHugLuVsEfAYuk
         CzFpKHmPy3VBx0jDwzOQX2qHPu+WJHms7+8HHWmXrJyB9zrVYhGFEGY4cd+dKvn/doXE
         11x7KrmPpwaYnAHJHqiSjy3nhGRTwnyCbr66n4acypR4x1usE0hectqyRByO5vkTVEvz
         cloHhueJ0H379Q5+h12hcyqAYSdj9SBu6wOm+rOfUdli1tt3QXSL2x4fZBdjvK4oNlDG
         nfWw==
X-Gm-Message-State: AOAM530e3WNrcWmKgjlooZcKM6zLPgbi7z/LtxHwHM680JVfuC1TuKjb
        XYc/Muc34KuycwgexvdN2WSN9OZpcQXKvYC/6HaMbA==
X-Google-Smtp-Source: ABdhPJzAVAqqy6N+Lvbykyd5AuatgMAfK0/3UNTxy+Tx+koXIo1iO57kMjjoIpRRNCJxtRB2P/aLdQ==
X-Received: by 2002:a2e:881a:0:b0:255:7c2c:46d8 with SMTP id x26-20020a2e881a000000b002557c2c46d8mr13961393ljh.364.1654637562750;
        Tue, 07 Jun 2022 14:32:42 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id g23-20020ac24d97000000b0047255d21153sm3411343lfe.130.2022.06.07.14.32.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jun 2022 14:32:42 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org
Subject: [PATCH v1 29/30] phy: qcom-qmp-pcie-msm8996: use bulk reset_control API
Date:   Wed,  8 Jun 2022 00:32:02 +0300
Message-Id: <20220607213203.2819885-30-dmitry.baryshkov@linaro.org>
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

Switch qcom-qmp-pcie-msm8996 driver to use reset_control_bulk_assert /
_deassert functions rather than hardcoding the loops in the driver
itself.

Acked-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Tested-by: Bjorn Andersson <bjorn.andersson@linaro.org> # UFS, PCIe and USB on SC8180X
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../phy/qualcomm/phy-qcom-qmp-pcie-msm8996.c  | 49 +++++++------------
 1 file changed, 18 insertions(+), 31 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcie-msm8996.c b/drivers/phy/qualcomm/phy-qcom-qmp-pcie-msm8996.c
index 51da3a3a199e..48ea1de81d7c 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-pcie-msm8996.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcie-msm8996.c
@@ -340,7 +340,7 @@ struct qcom_qmp {
 	struct device *dev;
 
 	struct clk_bulk_data *clks;
-	struct reset_control **resets;
+	struct reset_control_bulk_data *resets;
 	struct regulator_bulk_data *vregs;
 
 	struct qmp_phy **phys;
@@ -489,7 +489,7 @@ static int qcom_qmp_phy_pcie_msm8996_com_init(struct qmp_phy *qphy)
 	struct qcom_qmp *qmp = qphy->qmp;
 	const struct qmp_phy_cfg *cfg = qphy->cfg;
 	void __iomem *serdes = qphy->serdes;
-	int ret, i;
+	int ret;
 
 	mutex_lock(&qmp->phy_mutex);
 	if (qmp->init_count++) {
@@ -504,22 +504,16 @@ static int qcom_qmp_phy_pcie_msm8996_com_init(struct qmp_phy *qphy)
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
@@ -534,8 +528,7 @@ static int qcom_qmp_phy_pcie_msm8996_com_init(struct qmp_phy *qphy)
 	return 0;
 
 err_assert_reset:
-	while (++i < cfg->num_resets)
-		reset_control_assert(qmp->resets[i]);
+	reset_control_bulk_assert(cfg->num_resets, qmp->resets);
 err_disable_regulators:
 	regulator_bulk_disable(cfg->num_vregs, qmp->vregs);
 err_unlock:
@@ -549,7 +542,6 @@ static int qcom_qmp_phy_pcie_msm8996_com_exit(struct qmp_phy *qphy)
 	struct qcom_qmp *qmp = qphy->qmp;
 	const struct qmp_phy_cfg *cfg = qphy->cfg;
 	void __iomem *serdes = qphy->serdes;
-	int i = cfg->num_resets;
 
 	mutex_lock(&qmp->phy_mutex);
 	if (--qmp->init_count) {
@@ -564,8 +556,7 @@ static int qcom_qmp_phy_pcie_msm8996_com_exit(struct qmp_phy *qphy)
 	qphy_setbits(serdes, cfg->regs[QPHY_COM_POWER_DOWN_CONTROL],
 		     SW_PWRDN);
 
-	while (--i >= 0)
-		reset_control_assert(qmp->resets[i]);
+	reset_control_bulk_assert(cfg->num_resets, qmp->resets);
 
 	clk_bulk_disable_unprepare(cfg->num_clks, qmp->clks);
 
@@ -769,23 +760,19 @@ static int qcom_qmp_phy_pcie_msm8996_reset_init(struct device *dev, const struct
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

