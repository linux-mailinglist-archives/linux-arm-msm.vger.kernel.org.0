Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3C7F5738951
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jun 2023 17:33:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233314AbjFUPdl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 21 Jun 2023 11:33:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37702 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233365AbjFUPd2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 21 Jun 2023 11:33:28 -0400
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A88589B
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jun 2023 08:33:26 -0700 (PDT)
Received: by mail-lj1-x233.google.com with SMTP id 38308e7fff4ca-2b44eddb52dso88410751fa.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jun 2023 08:33:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687361605; x=1689953605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3qfuToZ41zkQt1uaQ5WCl4kX3p32GHMidFTGVWWTPxM=;
        b=Slt7bijDPuc00cR7GK21PI0yAGTPJ3SLGd/LET/2bbzXsuQaxdTVmVcbnrLHGXRvld
         gTT5ixFlcGeEkU9SYB0rMeRUikh4htYyuxSkl2U1i2NEyi4XcxLOUzA6NfWbjKkwjHwX
         VcqG32Qi7i6LbAGLNXmcu4CwBhHsX6GoNqE4Ss4YMuRbG5Qp3LKJg4PSMOxJC2e0LxOD
         TpO4iPSb8MJYVmTgi/8sIKe+anTDS11qp3MhzdGf5runvrmZezNmv+RocWuQ06W8kyMf
         mRUbnb3LtnhkkiNM+16a56zozpMIjW7N655xTkUkpdEIoQZv2qW7Ey8KQtbdkqMGCaiI
         J5Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687361605; x=1689953605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3qfuToZ41zkQt1uaQ5WCl4kX3p32GHMidFTGVWWTPxM=;
        b=HmsZi3Lft27WpGWHGicTXrkeo6aEpG0FbPy3szAzVliPlJ6t5R3OmEJbbDR3rayqA5
         QhRmGoROGhdwKzgDjmz7sfuHj3ATTxX6hHSkQIcEH7qlsj+vDPJDEhAoeQadCSeZBA5C
         8wzAJi0QuCh5FX9lYd750ThlcRV2HpNlWzwHnlkdIVtmxzpX3t9TWqtKTuOAB2YViAPt
         EfGkYRTbZhyk7oxknE71N3fqQ5Kukl+IKNcQHyOJk6TLeQZzbMjQEf6H2QPn4igXMMZn
         iO4mNfLdzYRyT4PNqspt7MQZFujL9o9uVVmVYhIwSoqde8euEDsFRHkgFp3CCciyrCRT
         mv/g==
X-Gm-Message-State: AC+VfDyjL8vO/Lyp/I0ocur0iKVlyOnkb0RFhgGZS3K/qns6rhAVUoKk
        7BUSLPFA1y8jvGzJfDYUMnYoLA==
X-Google-Smtp-Source: ACHHUZ6d9tnTTJ+UQb/PHI4xbPX2ZfLY0+7PMXWtXYuWS2fTmOYXQBiE5sisx78XvHknGMhia9xARw==
X-Received: by 2002:ac2:4d9a:0:b0:4f8:66ec:6ed7 with SMTP id g26-20020ac24d9a000000b004f866ec6ed7mr8373364lfe.30.1687361604991;
        Wed, 21 Jun 2023 08:33:24 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id o3-20020a056512050300b004f8751285a5sm804888lfb.80.2023.06.21.08.33.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jun 2023 08:33:24 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        Neil Armstrong <neil.armstrong@linaro.org>,
        freedreno@lists.freedesktop.org
Subject: [RESEND PATCH 7/7] phy: qcom: qmp-combo: extract common function to setup clocks
Date:   Wed, 21 Jun 2023 18:33:17 +0300
Message-Id: <20230621153317.1025914-8-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230621153317.1025914-1-dmitry.baryshkov@linaro.org>
References: <20230621153317.1025914-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Extact qmp_combo_configure_dp_clocks(), a common function to setup PHY
clocks depending on the selected link rate.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 63 ++++++++++-------------
 1 file changed, 26 insertions(+), 37 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
index ab6cfa02ecf9..d82fcd060e77 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
@@ -2074,18 +2074,12 @@ static bool qmp_combo_configure_dp_mode(struct qmp_combo *qmp)
 	return reverse;
 }
 
-static int qmp_v3_configure_dp_phy(struct qmp_combo *qmp)
+static int qmp_combo_configure_dp_clocks(struct qmp_combo *qmp)
 {
 	const struct phy_configure_opts_dp *dp_opts = &qmp->dp_opts;
-	const struct qmp_phy_cfg *cfg = qmp->cfg;
-	u32 phy_vco_div, status;
+	u32 phy_vco_div;
 	unsigned long pixel_freq;
 
-	qmp_combo_configure_dp_mode(qmp);
-
-	writel(0x05, qmp->dp_dp_phy + QSERDES_V3_DP_PHY_TX0_TX1_LANE_CTL);
-	writel(0x05, qmp->dp_dp_phy + QSERDES_V3_DP_PHY_TX2_TX3_LANE_CTL);
-
 	switch (dp_opts->link_rate) {
 	case 1620:
 		phy_vco_div = 0x1;
@@ -2107,11 +2101,29 @@ static int qmp_v3_configure_dp_phy(struct qmp_combo *qmp)
 		/* Other link rates aren't supported */
 		return -EINVAL;
 	}
-	writel(phy_vco_div, qmp->dp_dp_phy + QSERDES_V3_DP_PHY_VCO_DIV);
+	writel(phy_vco_div, qmp->dp_dp_phy + QSERDES_V4_DP_PHY_VCO_DIV);
 
 	clk_set_rate(qmp->dp_link_hw.clk, dp_opts->link_rate * 100000);
 	clk_set_rate(qmp->dp_pixel_hw.clk, pixel_freq);
 
+	return 0;
+}
+
+static int qmp_v3_configure_dp_phy(struct qmp_combo *qmp)
+{
+	const struct qmp_phy_cfg *cfg = qmp->cfg;
+	u32 status;
+	int ret;
+
+	qmp_combo_configure_dp_mode(qmp);
+
+	writel(0x05, qmp->dp_dp_phy + QSERDES_V3_DP_PHY_TX0_TX1_LANE_CTL);
+	writel(0x05, qmp->dp_dp_phy + QSERDES_V3_DP_PHY_TX2_TX3_LANE_CTL);
+
+	ret = qmp_combo_configure_dp_clocks(qmp);
+	if (ret)
+		return ret;
+
 	writel(0x04, qmp->dp_dp_phy + QSERDES_DP_PHY_AUX_CFG2);
 	writel(0x01, qmp->dp_dp_phy + QSERDES_DP_PHY_CFG);
 	writel(0x05, qmp->dp_dp_phy + QSERDES_DP_PHY_CFG);
@@ -2210,10 +2222,9 @@ static void qmp_v4_configure_dp_tx(struct qmp_combo *qmp)
 
 static int qmp_v456_configure_dp_phy(struct qmp_combo *qmp)
 {
-	const struct phy_configure_opts_dp *dp_opts = &qmp->dp_opts;
 	const struct qmp_phy_cfg *cfg = qmp->cfg;
-	u32 phy_vco_div, status;
-	unsigned long pixel_freq;
+	u32 status;
+	int ret;
 
 	writel(0x0f, qmp->dp_dp_phy + QSERDES_V4_DP_PHY_CFG_1);
 
@@ -2225,31 +2236,9 @@ static int qmp_v456_configure_dp_phy(struct qmp_combo *qmp)
 	writel(0x05, qmp->dp_dp_phy + QSERDES_V4_DP_PHY_TX0_TX1_LANE_CTL);
 	writel(0x05, qmp->dp_dp_phy + QSERDES_V4_DP_PHY_TX2_TX3_LANE_CTL);
 
-	switch (dp_opts->link_rate) {
-	case 1620:
-		phy_vco_div = 0x1;
-		pixel_freq = 1620000000UL / 2;
-		break;
-	case 2700:
-		phy_vco_div = 0x1;
-		pixel_freq = 2700000000UL / 2;
-		break;
-	case 5400:
-		phy_vco_div = 0x2;
-		pixel_freq = 5400000000UL / 4;
-		break;
-	case 8100:
-		phy_vco_div = 0x0;
-		pixel_freq = 8100000000UL / 6;
-		break;
-	default:
-		/* Other link rates aren't supported */
-		return -EINVAL;
-	}
-	writel(phy_vco_div, qmp->dp_dp_phy + QSERDES_V4_DP_PHY_VCO_DIV);
-
-	clk_set_rate(qmp->dp_link_hw.clk, dp_opts->link_rate * 100000);
-	clk_set_rate(qmp->dp_pixel_hw.clk, pixel_freq);
+	ret = qmp_combo_configure_dp_clocks(qmp);
+	if (ret)
+		return ret;
 
 	writel(0x01, qmp->dp_dp_phy + QSERDES_DP_PHY_CFG);
 	writel(0x05, qmp->dp_dp_phy + QSERDES_DP_PHY_CFG);
-- 
2.39.2

