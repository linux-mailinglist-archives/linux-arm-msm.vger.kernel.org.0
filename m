Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D3F0C5424F1
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jun 2022 08:53:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234996AbiFHBXX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 7 Jun 2022 21:23:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48014 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243532AbiFHBJy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 7 Jun 2022 21:09:54 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 92889264DD3
        for <linux-arm-msm@vger.kernel.org>; Tue,  7 Jun 2022 14:32:45 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id a29so1775430lfk.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jun 2022 14:32:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ixHZCxbKVt8fjndP+UfhbUXTOaVi0gSAR/Uhq+eMI30=;
        b=vfJtn8aYdXMJWbYkip3toQJWuyZKEmknC+45LjsWoWiaWvQqMpLd28pY/2+1wSIiG9
         GZG0r2q/7Gloma+uVfWxHQlS8zOup5LSqvnXn9s3hhg7aHFATMrBJzUlvTt2qucjwkj8
         8H1OyMGgGURtSczmeeZ3W3n1BF05URMc6kvFPwJ81qRV9wR+gNrythENLItWaXUg1NfJ
         6onC6XeVjoOYjpP5WlRJbEF+UqPM9VMOZMsAKn/tTEPB8YUYGKfnVB+j4pTPWQ8Caq3v
         mUHV2QLOR7YsT0Vsau334Ke8aDpnWnoCq2fJ0Pv0SvsG14UqcOBDQ6EZMBp640f7iGxb
         sQlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ixHZCxbKVt8fjndP+UfhbUXTOaVi0gSAR/Uhq+eMI30=;
        b=A5YTnmLvA0BeSN9gxo25c7GkI+qpudUxnuNSsYmPhefnKgrm68lQ4u8aSgCz6zgceb
         XCUhr0M5Ik/ZpAuKlQmJxUGZtkvuKFDzSDsjRiQ8+1o3aGfAYA7uVhzFCTULwjPEbpyt
         4+dk9uvjXk9NSng0dkY4t8AjLe854MBz2/OuY6axvy4Vu+xzY/6tStvbAuU5eQO+/jFJ
         70hsAMGxwfPXFXo1L/Yc+VRCrHTnNwLZTfGKa/gr9Axdk5G0B0EUc67Hqjh/WaYkhZ+n
         uBU3z/PY2s2nuP0KgSMy8kZkC4voB+rBNvY9SJaj5zTDiBDcUwieHy3mpERi8JYUm79R
         0/5A==
X-Gm-Message-State: AOAM5317lULb5LYkvR1XrOv85LSR3iUGsG3BwG7aKPLxwK5EV++rXMsj
        txEcdajaaeaDT6CeKrSQWVlK/g==
X-Google-Smtp-Source: ABdhPJwtOMV07mmBZqOXaW4umlQR4UYyr28OqPvj6Qt38rUJsY2o5pq9fx92Eu09eIPUgG5EAdgJwA==
X-Received: by 2002:a05:6512:12c6:b0:479:44cc:7bc with SMTP id p6-20020a05651212c600b0047944cc07bcmr8355423lfg.659.1654637563783;
        Tue, 07 Jun 2022 14:32:43 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id g23-20020ac24d97000000b0047255d21153sm3411343lfe.130.2022.06.07.14.32.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jun 2022 14:32:43 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org
Subject: [PATCH v1 30/30] phy: qcom-qmp-usb: use bulk reset_control API
Date:   Wed,  8 Jun 2022 00:32:03 +0300
Message-Id: <20220607213203.2819885-31-dmitry.baryshkov@linaro.org>
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

Switch qcom-qmp-usb driver to use reset_control_bulk_assert / _deassert
functions rather than hardcoding the loops in the driver itself.

Acked-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Tested-by: Bjorn Andersson <bjorn.andersson@linaro.org> # UFS, PCIe and USB on SC8180X
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/phy/qualcomm/phy-qcom-qmp-usb.c | 49 +++++++++----------------
 1 file changed, 18 insertions(+), 31 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-usb.c b/drivers/phy/qualcomm/phy-qcom-qmp-usb.c
index 969253e7bdd9..aebe5ed4e4e3 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-usb.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-usb.c
@@ -1446,7 +1446,7 @@ struct qcom_qmp {
 	void __iomem *dp_com;
 
 	struct clk_bulk_data *clks;
-	struct reset_control **resets;
+	struct reset_control_bulk_data *resets;
 	struct regulator_bulk_data *vregs;
 
 	struct qmp_phy **phys;
@@ -2009,7 +2009,7 @@ static int qcom_qmp_phy_usb_com_init(struct qmp_phy *qphy)
 	const struct qmp_phy_cfg *cfg = qphy->cfg;
 	void __iomem *pcs = qphy->pcs;
 	void __iomem *dp_com = qmp->dp_com;
-	int ret, i;
+	int ret;
 
 	/* turn on regulator supplies */
 	ret = regulator_bulk_enable(cfg->num_vregs, qmp->vregs);
@@ -2018,22 +2018,16 @@ static int qcom_qmp_phy_usb_com_init(struct qmp_phy *qphy)
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
@@ -2074,8 +2068,7 @@ static int qcom_qmp_phy_usb_com_init(struct qmp_phy *qphy)
 	return 0;
 
 err_assert_reset:
-	while (++i < cfg->num_resets)
-		reset_control_assert(qmp->resets[i]);
+	reset_control_bulk_assert(cfg->num_resets, qmp->resets);
 err_disable_regulators:
 	regulator_bulk_disable(cfg->num_vregs, qmp->vregs);
 
@@ -2086,10 +2079,8 @@ static int qcom_qmp_phy_usb_com_exit(struct qmp_phy *qphy)
 {
 	struct qcom_qmp *qmp = qphy->qmp;
 	const struct qmp_phy_cfg *cfg = qphy->cfg;
-	int i = cfg->num_resets;
 
-	while (--i >= 0)
-		reset_control_assert(qmp->resets[i]);
+	reset_control_bulk_assert(cfg->num_resets, qmp->resets);
 
 	clk_bulk_disable_unprepare(cfg->num_clks, qmp->clks);
 
@@ -2376,23 +2367,19 @@ static int qcom_qmp_phy_usb_reset_init(struct device *dev, const struct qmp_phy_
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

