Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0475D73894D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jun 2023 17:33:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233235AbjFUPdl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 21 Jun 2023 11:33:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37952 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233437AbjFUPd0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 21 Jun 2023 11:33:26 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D8F79170C
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jun 2023 08:33:24 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-4f8777caaa1so3896979e87.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jun 2023 08:33:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687361603; x=1689953603;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lvB3fEKCRuDwI/EV0i9EbALs6x/kgybfzFQBnpXb5js=;
        b=d0997l6TSakCBMenV1uxFKFdZqS3vM3ZbbmveefeEnQhSRLLXhWeMjQNOFTCqqjFlH
         i5wpu8Q7xuGr4FrFxKYTQOzhi28xMXVAS6cpgVNxV9Z8XbgKleeGIr9HkjAwjF+G+dEY
         29axqF+WxCUekQcGAM8nDKCtPQrXrIGJ2q/MtXTghpPhxb0Uw3xPDng4lVa1ccTxe3UV
         51JpnuSnY6H/ovBX6FO0Qw5CamHJWqOhtABRrap/ZsuOwRpEfBUmSJWoFCU3onk5yWkH
         SzeHHfYVL48RqYwu/jWOkNB1m2hCwLn0JyCVyAtZqr//zV/Rt27MjC34ssd9Qs6xFvJ6
         n2yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687361603; x=1689953603;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lvB3fEKCRuDwI/EV0i9EbALs6x/kgybfzFQBnpXb5js=;
        b=M8+8cUuMBSxsO1fymIK6QgGxwr13hprVg0RCDpbvCWVw84YE9VyPgBizjW0E15466V
         NQuwTpQAvu8vREK7F7BxwZXA3aDLa584aA4eUkGCCZo234uRcKdcvn2fZz6e0DxZLMyt
         HKYk1Zi/KuD8IpOF6tLUyBlHaN+/LDCc5o743CWH8QFYEbwcDwNKt/zmzy+GAuxuAa87
         PSkzp+HtIWA5YPv/ShnPlsnWL0Qr0+LRMiIxSYEkEeXeghJFyfxcxqYx82aMctSNIWfO
         7aqbm8fJ73LxwAT5c4cT0tVUltCFDPEOrFWFGQC8/H1icCfUVxPf51xe9ypyV57skOoa
         3c/Q==
X-Gm-Message-State: AC+VfDwTLjFTqRuCeN6oaz6sgeQD6BhFx3PuzWY5ayHt8HEJY+kwMmSk
        ag7M5yvfFOB2Wh6WiT9duQzFlQ==
X-Google-Smtp-Source: ACHHUZ7X2HoTGV6sawfJbVJw3IROeh/dS8a6vwH8GhrprJD0ZI4KUqAX9H8k1TWaSwN6jPUQRc9rkg==
X-Received: by 2002:a19:381b:0:b0:4f8:5713:4400 with SMTP id f27-20020a19381b000000b004f857134400mr8449775lfa.1.1687361603011;
        Wed, 21 Jun 2023 08:33:23 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id o3-20020a056512050300b004f8751285a5sm804888lfb.80.2023.06.21.08.33.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jun 2023 08:33:22 -0700 (PDT)
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
Subject: [RESEND PATCH 5/7] phy: qcom: qmp-combo: drop similar functions
Date:   Wed, 21 Jun 2023 18:33:15 +0300
Message-Id: <20230621153317.1025914-6-dmitry.baryshkov@linaro.org>
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

The functions qmp_v5_configure_dp_phy() and qmp_v6_configure_dp_phy()
are now copies of qmp_v4_configure_dp_phy(). Drop them and use the v4
function in all the cases.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 123 +---------------------
 1 file changed, 2 insertions(+), 121 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
index d034b4f45bd3..80a5bebf86a2 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
@@ -1433,10 +1433,7 @@ static void qmp_v4_configure_dp_tx(struct qmp_combo *qmp);
 static int qmp_v4_configure_dp_phy(struct qmp_combo *qmp);
 static int qmp_v4_calibrate_dp_phy(struct qmp_combo *qmp);
 
-static int qmp_v5_configure_dp_phy(struct qmp_combo *qmp);
-
 static void qmp_v6_dp_aux_init(struct qmp_combo *qmp);
-static int qmp_v6_configure_dp_phy(struct qmp_combo *qmp);
 
 static inline void qphy_setbits(void __iomem *base, u32 offset, u32 val)
 {
@@ -1686,7 +1683,7 @@ static const struct qmp_phy_cfg sc8280xp_usb43dpphy_cfg = {
 
 	.dp_aux_init		= qmp_v4_dp_aux_init,
 	.configure_dp_tx	= qmp_v4_configure_dp_tx,
-	.configure_dp_phy	= qmp_v5_configure_dp_phy,
+	.configure_dp_phy	= qmp_v4_configure_dp_phy,
 	.calibrate_dp_phy	= qmp_v4_calibrate_dp_phy,
 
 	.clk_list		= qmp_v4_phy_clk_l,
@@ -1875,7 +1872,7 @@ static const struct qmp_phy_cfg sm8550_usb3dpphy_cfg = {
 
 	.dp_aux_init		= qmp_v6_dp_aux_init,
 	.configure_dp_tx	= qmp_v4_configure_dp_tx,
-	.configure_dp_phy	= qmp_v6_configure_dp_phy,
+	.configure_dp_phy	= qmp_v4_configure_dp_phy,
 	.calibrate_dp_phy	= qmp_v4_calibrate_dp_phy,
 
 	.regs			= qmp_v6_usb3phy_regs_layout,
@@ -2386,122 +2383,6 @@ static int qmp_v4_configure_dp_phy(struct qmp_combo *qmp)
 	return 0;
 }
 
-static int qmp_v5_configure_dp_phy(struct qmp_combo *qmp)
-{
-	const struct qmp_phy_cfg *cfg = qmp->cfg;
-	bool reverse = (qmp->orientation == TYPEC_ORIENTATION_REVERSE);
-	const struct phy_configure_opts_dp *dp_opts = &qmp->dp_opts;
-	u32 bias0_en, drvr0_en, bias1_en, drvr1_en;
-	u32 status;
-	int ret;
-
-	ret = qmp_v456_configure_dp_phy(qmp);
-	if (ret < 0)
-		return ret;
-
-	if (dp_opts->lanes == 1) {
-		bias0_en = reverse ? 0x3e : 0x15;
-		drvr0_en = reverse ? 0x13 : 0x10;
-		bias1_en = reverse ? 0x15 : 0x3e;
-		drvr1_en = reverse ? 0x10 : 0x13;
-	} else if (dp_opts->lanes == 2) {
-		bias0_en = reverse ? 0x3f : 0x15;
-		drvr0_en = 0x10;
-		bias1_en = reverse ? 0x15 : 0x3f;
-		drvr1_en = 0x10;
-	} else {
-		bias0_en = 0x3f;
-		bias1_en = 0x3f;
-		drvr0_en = 0x10;
-		drvr1_en = 0x10;
-	}
-
-	writel(drvr0_en, qmp->dp_tx + cfg->regs[QPHY_TX_HIGHZ_DRVR_EN]);
-	writel(bias0_en, qmp->dp_tx + cfg->regs[QPHY_TX_TRANSCEIVER_BIAS_EN]);
-	writel(drvr1_en, qmp->dp_tx2 + cfg->regs[QPHY_TX_HIGHZ_DRVR_EN]);
-	writel(bias1_en, qmp->dp_tx2 + cfg->regs[QPHY_TX_TRANSCEIVER_BIAS_EN]);
-
-	writel(0x18, qmp->dp_dp_phy + QSERDES_DP_PHY_CFG);
-	udelay(2000);
-	writel(0x19, qmp->dp_dp_phy + QSERDES_DP_PHY_CFG);
-
-	if (readl_poll_timeout(qmp->dp_dp_phy + cfg->regs[QPHY_DP_PHY_STATUS],
-			status,
-			((status & BIT(1)) > 0),
-			500,
-			10000))
-		return -ETIMEDOUT;
-
-	writel(0x0a, qmp->dp_tx + cfg->regs[QPHY_TX_TX_POL_INV]);
-	writel(0x0a, qmp->dp_tx2 + cfg->regs[QPHY_TX_TX_POL_INV]);
-
-	writel(0x27, qmp->dp_tx + cfg->regs[QPHY_TX_TX_DRV_LVL]);
-	writel(0x27, qmp->dp_tx2 + cfg->regs[QPHY_TX_TX_DRV_LVL]);
-
-	writel(0x20, qmp->dp_tx + cfg->regs[QPHY_TX_TX_EMP_POST1_LVL]);
-	writel(0x20, qmp->dp_tx2 + cfg->regs[QPHY_TX_TX_EMP_POST1_LVL]);
-
-	return 0;
-}
-
-static int qmp_v6_configure_dp_phy(struct qmp_combo *qmp)
-{
-	const struct qmp_phy_cfg *cfg = qmp->cfg;
-	bool reverse = (qmp->orientation == TYPEC_ORIENTATION_REVERSE);
-	const struct phy_configure_opts_dp *dp_opts = &qmp->dp_opts;
-	u32 bias0_en, drvr0_en, bias1_en, drvr1_en;
-	u32 status;
-	int ret;
-
-	ret = qmp_v456_configure_dp_phy(qmp);
-	if (ret < 0)
-		return ret;
-
-	if (dp_opts->lanes == 1) {
-		bias0_en = reverse ? 0x3e : 0x15;
-		drvr0_en = reverse ? 0x13 : 0x10;
-		bias1_en = reverse ? 0x15 : 0x3e;
-		drvr1_en = reverse ? 0x10 : 0x13;
-	} else if (dp_opts->lanes == 2) {
-		bias0_en = reverse ? 0x3f : 0x15;
-		drvr0_en = 0x10;
-		bias1_en = reverse ? 0x15 : 0x3f;
-		drvr1_en = 0x10;
-	} else {
-		bias0_en = 0x3f;
-		bias1_en = 0x3f;
-		drvr0_en = 0x10;
-		drvr1_en = 0x10;
-	}
-
-	writel(drvr0_en, qmp->dp_tx + cfg->regs[QPHY_TX_HIGHZ_DRVR_EN]);
-	writel(bias0_en, qmp->dp_tx + cfg->regs[QPHY_TX_TRANSCEIVER_BIAS_EN]);
-	writel(drvr1_en, qmp->dp_tx2 + cfg->regs[QPHY_TX_HIGHZ_DRVR_EN]);
-	writel(bias1_en, qmp->dp_tx2 + cfg->regs[QPHY_TX_TRANSCEIVER_BIAS_EN]);
-
-	writel(0x18, qmp->dp_dp_phy + QSERDES_DP_PHY_CFG);
-	udelay(2000);
-	writel(0x19, qmp->dp_dp_phy + QSERDES_DP_PHY_CFG);
-
-	if (readl_poll_timeout(qmp->dp_dp_phy + cfg->regs[QPHY_DP_PHY_STATUS],
-			       status,
-			       ((status & BIT(1)) > 0),
-			       500,
-			       10000))
-		return -ETIMEDOUT;
-
-	writel(0x0a, qmp->dp_tx + cfg->regs[QPHY_TX_TX_POL_INV]);
-	writel(0x0a, qmp->dp_tx2 + cfg->regs[QPHY_TX_TX_POL_INV]);
-
-	writel(0x27, qmp->dp_tx + cfg->regs[QPHY_TX_TX_DRV_LVL]);
-	writel(0x27, qmp->dp_tx2 + cfg->regs[QPHY_TX_TX_DRV_LVL]);
-
-	writel(0x20, qmp->dp_tx + cfg->regs[QPHY_TX_TX_EMP_POST1_LVL]);
-	writel(0x20, qmp->dp_tx2 + cfg->regs[QPHY_TX_TX_EMP_POST1_LVL]);
-
-	return 0;
-}
-
 /*
  * We need to calibrate the aux setting here as many times
  * as the caller tries
-- 
2.39.2

