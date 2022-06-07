Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C621F542206
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jun 2022 08:45:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229584AbiFHEGa (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 8 Jun 2022 00:06:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47676 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231673AbiFHED4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 8 Jun 2022 00:03:56 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 446DB264DC9
        for <linux-arm-msm@vger.kernel.org>; Tue,  7 Jun 2022 14:32:44 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id h23so30278035lfe.4
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jun 2022 14:32:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=eUITCYEFgBSYLxAW8LXRI0XkBV+vruLWDC5eLFEPeao=;
        b=fAcjRSuCkxTDpG4O8Y+JyEJjmbD2PYBITecrllXsvkg8gzDJlntpMj3CEAlEEeGuoP
         QTGzr1GXGnSiGARILsZW7cV88HqLrvt/PANq9r253Y9pFTEdCx+hX6oL7su7yO9Hu7sB
         3NmLKkOoYK5Rb9HTsgl3tpqO7bt7eR08dOyolFxJZgXo/Fsi971y6Kog4I8jxSM+JTqJ
         5emRajvx32oGNq+d/Mhe6E16d/G6RGxL40Zi9JptuD8pFaQsWU/BcKLn2F8VGXFrYkjP
         c3hn1YXrsbUMMuxNQO6ZJAC7LO4jHlRNR9iYgpj5iWzSaFp5/FhV911c1gCqpzF+DNPM
         vAiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=eUITCYEFgBSYLxAW8LXRI0XkBV+vruLWDC5eLFEPeao=;
        b=FPBFFJ8A55KtVIXefLPmT+GYXRlAndaEctUZgxLt9fo5AaWhBFtk2hHq2XrE1giiDL
         Jfb3zb5H8fMOxTaQWcfM0/bEe+ccn37FrceKiuozOz8r8ENq4id+JWGjfbq37MfKmpyh
         Hgf10SmoS/EBXqE6LsMV7cnqxJAlOlEBRE40HN/a6s/EwFE7px3rePGWsHgxJfbp/ihm
         xRajZUB4bSZl1Hnx0hwLgKMvUS6t2kD4BuqKIzxrvjy//m7wbv8Srk/AyMDOu3BDQiGM
         XFToHTtxolBqVvD5Jdly7rdS6gxNcGZp0xZ4ihQ6CZ6r6uNLnX7aqquLf9dDbGItPmSF
         z2dQ==
X-Gm-Message-State: AOAM530UrOOBz5ESRPNcZeci0353+ojSKo71s2wDugMfPRQwy5I7Vdqc
        NFfjV6S/cwGENp3uKuWjjfBnEw==
X-Google-Smtp-Source: ABdhPJw0EwBgGfJJH3EnSASBPhOC10uvi7mNtCaP7OGGL2PoSYh2u2Uavb15KxsFxv1bcY8+lRgxFw==
X-Received: by 2002:a05:6512:234e:b0:479:3bb1:8d3c with SMTP id p14-20020a056512234e00b004793bb18d3cmr9897712lfu.478.1654637561823;
        Tue, 07 Jun 2022 14:32:41 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id g23-20020ac24d97000000b0047255d21153sm3411343lfe.130.2022.06.07.14.32.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jun 2022 14:32:41 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org
Subject: [PATCH v1 28/30] phy: qcom-qmp-pcie: use bulk reset_control API
Date:   Wed,  8 Jun 2022 00:32:01 +0300
Message-Id: <20220607213203.2819885-29-dmitry.baryshkov@linaro.org>
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

Switch qcom-qmp-pcie driver to use reset_control_bulk_assert / _deassert
functions rather than hardcoding the loops in the driver itself.

Acked-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Tested-by: Bjorn Andersson <bjorn.andersson@linaro.org> # UFS, PCIe and USB on SC8180X
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/phy/qualcomm/phy-qcom-qmp-pcie.c | 49 +++++++++---------------
 1 file changed, 18 insertions(+), 31 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
index 0676b67d3ff6..bd9f71456e32 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
@@ -1334,7 +1334,7 @@ struct qcom_qmp {
 	struct device *dev;
 
 	struct clk_bulk_data *clks;
-	struct reset_control **resets;
+	struct reset_control_bulk_data *resets;
 	struct regulator_bulk_data *vregs;
 
 	struct qmp_phy **phys;
@@ -1789,7 +1789,7 @@ static int qcom_qmp_phy_pcie_com_init(struct qmp_phy *qphy)
 	struct qcom_qmp *qmp = qphy->qmp;
 	const struct qmp_phy_cfg *cfg = qphy->cfg;
 	void __iomem *pcs = qphy->pcs;
-	int ret, i;
+	int ret;
 
 	/* turn on regulator supplies */
 	ret = regulator_bulk_enable(cfg->num_vregs, qmp->vregs);
@@ -1798,22 +1798,16 @@ static int qcom_qmp_phy_pcie_com_init(struct qmp_phy *qphy)
 		return ret;
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
@@ -1831,8 +1825,7 @@ static int qcom_qmp_phy_pcie_com_init(struct qmp_phy *qphy)
 	return 0;
 
 err_assert_reset:
-	while (++i < cfg->num_resets)
-		reset_control_assert(qmp->resets[i]);
+	reset_control_bulk_assert(cfg->num_resets, qmp->resets);
 err_disable_regulators:
 	regulator_bulk_disable(cfg->num_vregs, qmp->vregs);
 
@@ -1843,10 +1836,8 @@ static int qcom_qmp_phy_pcie_com_exit(struct qmp_phy *qphy)
 {
 	struct qcom_qmp *qmp = qphy->qmp;
 	const struct qmp_phy_cfg *cfg = qphy->cfg;
-	int i = cfg->num_resets;
 
-	while (--i >= 0)
-		reset_control_assert(qmp->resets[i]);
+	reset_control_bulk_assert(cfg->num_resets, qmp->resets);
 
 	clk_bulk_disable_unprepare(cfg->num_clks, qmp->clks);
 
@@ -2056,23 +2047,19 @@ static int qcom_qmp_phy_pcie_reset_init(struct device *dev, const struct qmp_phy
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

