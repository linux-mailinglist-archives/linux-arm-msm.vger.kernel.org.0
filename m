Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 956AE677A8D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Jan 2023 13:08:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229502AbjAWMIM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 23 Jan 2023 07:08:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53046 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229436AbjAWMIL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 23 Jan 2023 07:08:11 -0500
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 80EA910276
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Jan 2023 04:08:10 -0800 (PST)
Received: by mail-lf1-x130.google.com with SMTP id a11so17933214lfg.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Jan 2023 04:08:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5r1RWWmyZelW8ciLojcTUHVYQJpMERt0jy6Bio8UjhY=;
        b=lNjbFbUv7QFGjGr9tLAAkDAiVMiRIpalBuHXHX9HKKj4Gi+xLKd1FGb/GoaegoVisL
         VQWqq9Z2E1Nu5rTlAOFqcdOSe8gQ6k8Slzl838to6aIUxB4S4iDpS75NA641J1lU0C5P
         +htBqdP2g/1Sc0DAIKz5YK8IX/wmxi6kLvXp7iwIPWc324BDs34+Z9lbRsWPR2/q5ztS
         es2BU7lk1kiuqSHZE+65ORiYd8X1PX/p7aFgpbHfR0KDnLbO/8P/17YqTHbZMlv9n2jl
         6kEioLaauD3f3i303y4+Q6jxn7hZUg00Qlgobpu4yuRnJyS11tTHZwG7NHi5FkWkwNw3
         z5mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5r1RWWmyZelW8ciLojcTUHVYQJpMERt0jy6Bio8UjhY=;
        b=b5i4ALiDPjk5SrT6xZ4HPzBz1mV+0MaCORjRfzuXt1hoPe09eq5Ue9180BzGpKfp7d
         PnIIdo1ZWcmiQXYZGYdsnYcNI5YukJbjRXq+Kh9tdCY5LObkyLr2zJaGKhqUKk2g4UaZ
         0BH78Php4v6wJ+EW0Sno0IeOJRLeQFwEEYyc+qJqsmRJfs/Zez9qAE6R5T2fGt0NRx5v
         bv/qRJgKnb8/IEi8xkJLOUO/SjiYSmEPcAQeGanncjtZtSF32j5qFWd80NYfnhat9Lq5
         +sdCHl6twlC1IkqoVj1WfvJXyBQUpd0E9OHBPiNzrWXAeUU2GeArAqxHDvPXYI0AcqM/
         r1Lg==
X-Gm-Message-State: AFqh2kovyXJq9Ae0UrnmcrMkrPbuspAlzaxZXmiobF9TuBEEoCCMTXao
        eH5Q9NaINn9G3lrdnIH8SKAy+Q==
X-Google-Smtp-Source: AMrXdXtpQST401RG/1EsTOF0LomgSYPyj18Cx1+eQ2yHiNLFVYKo4k1GY1MmR9WgjVB6CG8rnZ9DzA==
X-Received: by 2002:a05:6512:3988:b0:4ca:fac4:5a34 with SMTP id j8-20020a056512398800b004cafac45a34mr6816378lfu.61.1674475688850;
        Mon, 23 Jan 2023 04:08:08 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id t24-20020ac25498000000b004d39af98b04sm2588486lfk.19.2023.01.23.04.08.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jan 2023 04:08:08 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        Johan Hovold <johan+linaro@kernel.org>
Subject: [PATCH] phy: qcom-qmp-combo: correct DP register offsets
Date:   Mon, 23 Jan 2023 14:08:07 +0200
Message-Id: <20230123120807.3101313-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Correct DP register offsets used with new DT bindings scheme. First, DP
TX registers reside in separate regions, not in the same regions as USB
TX registers do. Second, correct DP_PHY region offset to follow the
offset used for earlier generations/bindings.

Cc: Johan Hovold <johan+linaro@kernel.org>
Fixes: 83a0bbe39b17 ("phy: qcom-qmp-combo: add support for updated sc8280xp binding")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
index 1f022e580407..c6634f92de19 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
@@ -807,6 +807,8 @@ struct qmp_combo_offsets {
 	u16 usb3_pcs;
 	u16 usb3_pcs_usb;
 	u16 dp_serdes;
+	u16 dp_txa;
+	u16 dp_txb;
 	u16 dp_dp_phy;
 };
 
@@ -984,7 +986,9 @@ static const struct qmp_combo_offsets qmp_combo_offsets_v5 = {
 	.usb3_pcs	= 0x1400,
 	.usb3_pcs_usb	= 0x1700,
 	.dp_serdes	= 0x2000,
-	.dp_dp_phy	= 0x2200,
+	.dp_txa		= 0x2200,
+	.dp_txa		= 0x2600,
+	.dp_dp_phy	= 0x2a00,
 };
 
 static const struct qmp_phy_cfg sc7180_usb3dpphy_cfg = {
@@ -2639,8 +2643,8 @@ static int qmp_combo_parse_dt(struct qmp_combo *qmp)
 	qmp->pcs_usb = base + offs->usb3_pcs_usb;
 
 	qmp->dp_serdes = base + offs->dp_serdes;
-	qmp->dp_tx = base + offs->txa;
-	qmp->dp_tx2 = base + offs->txb;
+	qmp->dp_tx = base + offs->dp_txa;
+	qmp->dp_tx2 = base + offs->dp_txb;
 	qmp->dp_dp_phy = base + offs->dp_dp_phy;
 
 	qmp->pipe_clk = devm_clk_get(dev, "usb3_pipe");
-- 
2.39.0

