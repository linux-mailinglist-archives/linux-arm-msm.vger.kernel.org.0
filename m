Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D200A7936A5
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Sep 2023 09:58:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229530AbjIFH6d (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 6 Sep 2023 03:58:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38342 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230070AbjIFH6c (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 6 Sep 2023 03:58:32 -0400
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 27953CF
        for <linux-arm-msm@vger.kernel.org>; Wed,  6 Sep 2023 00:58:28 -0700 (PDT)
Received: by mail-lj1-x235.google.com with SMTP id 38308e7fff4ca-2bcbfb3705dso52897401fa.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 Sep 2023 00:58:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693987106; x=1694591906; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IzIS+aoME72+Wjjebc1SQM60j6lmwV2sHjpkBvCUB3k=;
        b=WDFtl/Q2NGtlA+Hnk+3Xczr+ZxBBVJXO51yiD6Je3+17YkptoPMnIr1srYjDjCtkeH
         WmWOc6iaFtumuuaDLx8zwv0ijTQiTTRcsO7JLnX6HkCKZeD/9O8Xna4td07locJMO0ZD
         AeSN/ulG+p/K69H16/k+fPt98rlwp9pgQqztqsYr8JQO9XQf0DNG7z2XlMLBpH78eoIw
         xmpsXLPwmu1Al8C+DTAxJLodqxyPWbBjixgWFC7AEnyvnvwmt1vDHR8ZavvIu3brQhqg
         dMDJasITNaIwYAmzTEH2GAgGPKT8YLWesOeSgzHCuk13/9ZJPgSpcMYylux/p16xQkSZ
         joPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693987106; x=1694591906;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IzIS+aoME72+Wjjebc1SQM60j6lmwV2sHjpkBvCUB3k=;
        b=GdCD1nVKBud10givgUMdsdii47FUS7FUwBSunpmMjY2Cpl4dhyXQXIPF75vTpfF+HZ
         3LNenPrJpyYdx3VLWGboDPKnKyNRljQVTrmNq/FybexrZot0IqkW4TPRh5sIIOYOBKl/
         PQktE1dPju1YsKdNqqlQspWYK+EXxKHgDP5rd8OGF5ncGGutUrLwycv14w7D5OwoRndS
         RP7hFlZW0Pxi2YaOjTOJrKDBGkR/1hs4fwwOkQI4PpHDFc/DIZNJIPA1rmzsY7yJmbHE
         Scei6JZUC0WEbeHNhKXb/njYnkdOTy/SmvxMvLLdm+c0VNy9zS0AlPsqERlbJfI+NKZW
         SSCQ==
X-Gm-Message-State: AOJu0YxgZIINgBFbS854dxMZ7cgpVLPyL9jRE9l/VKnEKY5V2H6V6Ulg
        qjmVChZgYo6jvHvqp8sILgx2mTyci5apA4/OZ98=
X-Google-Smtp-Source: AGHT+IH25xMcUshS1gJxSCvddB9y6235LL/Rur3+WkiGMpOCsdTqFO05aqAX4f4+Wa5uo+1GKx4lNQ==
X-Received: by 2002:a2e:3a0f:0:b0:2bc:fac8:309c with SMTP id h15-20020a2e3a0f000000b002bcfac8309cmr1174784lja.16.1693987106360;
        Wed, 06 Sep 2023 00:58:26 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id z10-20020a2e7e0a000000b002b9ec22d9fasm3268324ljc.29.2023.09.06.00.58.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Sep 2023 00:58:25 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        Abel Vesa <abel.vesa@linaro.org>
Subject: [PATCH 2/4] phy: qcom-qmp-combo: fix the prefix for the PCS_USB v6 registers
Date:   Wed,  6 Sep 2023 10:58:21 +0300
Message-Id: <20230906075823.7957-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230906075823.7957-1-dmitry.baryshkov@linaro.org>
References: <20230906075823.7957-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,UPPERCASE_50_75 autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

For all other generations, we have been using just the QPHY prefix for
the PCS registers. Remove the _USB part of the QPHY_USB prefix.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/phy/qualcomm/phy-qcom-qmp-combo.c     | 38 +++++++++----------
 .../phy/qualcomm/phy-qcom-qmp-pcs-usb-v6.h    | 38 +++++++++----------
 2 files changed, 38 insertions(+), 38 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
index 41b9be56eead..bff6231d7de3 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
@@ -845,28 +845,28 @@ static const struct qmp_phy_init_tbl sm8550_usb3_rx_tbl[] = {
 };
 
 static const struct qmp_phy_init_tbl sm8550_usb3_pcs_tbl[] = {
-	QMP_PHY_INIT_CFG(QPHY_USB_V6_PCS_LOCK_DETECT_CONFIG1, 0xc4),
-	QMP_PHY_INIT_CFG(QPHY_USB_V6_PCS_LOCK_DETECT_CONFIG2, 0x89),
-	QMP_PHY_INIT_CFG(QPHY_USB_V6_PCS_LOCK_DETECT_CONFIG3, 0x20),
-	QMP_PHY_INIT_CFG(QPHY_USB_V6_PCS_LOCK_DETECT_CONFIG6, 0x13),
-	QMP_PHY_INIT_CFG(QPHY_USB_V6_PCS_REFGEN_REQ_CONFIG1, 0x21),
-	QMP_PHY_INIT_CFG(QPHY_USB_V6_PCS_RX_SIGDET_LVL, 0x99),
-	QMP_PHY_INIT_CFG(QPHY_USB_V6_PCS_RCVR_DTCT_DLY_P1U2_L, 0xe7),
-	QMP_PHY_INIT_CFG(QPHY_USB_V6_PCS_RCVR_DTCT_DLY_P1U2_H, 0x03),
-	QMP_PHY_INIT_CFG(QPHY_USB_V6_PCS_CDR_RESET_TIME, 0x0a),
-	QMP_PHY_INIT_CFG(QPHY_USB_V6_PCS_ALIGN_DETECT_CONFIG1, 0x88),
-	QMP_PHY_INIT_CFG(QPHY_USB_V6_PCS_ALIGN_DETECT_CONFIG2, 0x13),
-	QMP_PHY_INIT_CFG(QPHY_USB_V6_PCS_PCS_TX_RX_CONFIG, 0x0c),
-	QMP_PHY_INIT_CFG(QPHY_USB_V6_PCS_EQ_CONFIG1, 0x4b),
-	QMP_PHY_INIT_CFG(QPHY_USB_V6_PCS_EQ_CONFIG5, 0x10),
+	QMP_PHY_INIT_CFG(QPHY_V6_PCS_LOCK_DETECT_CONFIG1, 0xc4),
+	QMP_PHY_INIT_CFG(QPHY_V6_PCS_LOCK_DETECT_CONFIG2, 0x89),
+	QMP_PHY_INIT_CFG(QPHY_V6_PCS_LOCK_DETECT_CONFIG3, 0x20),
+	QMP_PHY_INIT_CFG(QPHY_V6_PCS_LOCK_DETECT_CONFIG6, 0x13),
+	QMP_PHY_INIT_CFG(QPHY_V6_PCS_REFGEN_REQ_CONFIG1, 0x21),
+	QMP_PHY_INIT_CFG(QPHY_V6_PCS_RX_SIGDET_LVL, 0x99),
+	QMP_PHY_INIT_CFG(QPHY_V6_PCS_RCVR_DTCT_DLY_P1U2_L, 0xe7),
+	QMP_PHY_INIT_CFG(QPHY_V6_PCS_RCVR_DTCT_DLY_P1U2_H, 0x03),
+	QMP_PHY_INIT_CFG(QPHY_V6_PCS_CDR_RESET_TIME, 0x0a),
+	QMP_PHY_INIT_CFG(QPHY_V6_PCS_ALIGN_DETECT_CONFIG1, 0x88),
+	QMP_PHY_INIT_CFG(QPHY_V6_PCS_ALIGN_DETECT_CONFIG2, 0x13),
+	QMP_PHY_INIT_CFG(QPHY_V6_PCS_PCS_TX_RX_CONFIG, 0x0c),
+	QMP_PHY_INIT_CFG(QPHY_V6_PCS_EQ_CONFIG1, 0x4b),
+	QMP_PHY_INIT_CFG(QPHY_V6_PCS_EQ_CONFIG5, 0x10),
 };
 
 static const struct qmp_phy_init_tbl sm8550_usb3_pcs_usb_tbl[] = {
-	QMP_PHY_INIT_CFG(QPHY_USB_V6_PCS_USB3_LFPS_DET_HIGH_COUNT_VAL, 0xf8),
-	QMP_PHY_INIT_CFG(QPHY_USB_V6_PCS_USB3_RXEQTRAINING_DFE_TIME_S2, 0x07),
-	QMP_PHY_INIT_CFG(QPHY_USB_V6_PCS_USB3_RCVR_DTCT_DLY_U3_L, 0x40),
-	QMP_PHY_INIT_CFG(QPHY_USB_V6_PCS_USB3_RCVR_DTCT_DLY_U3_H, 0x00),
-	QMP_PHY_INIT_CFG(QPHY_USB_V6_PCS_USB3_POWER_STATE_CONFIG1, 0x68),
+	QMP_PHY_INIT_CFG(QPHY_V6_PCS_USB3_LFPS_DET_HIGH_COUNT_VAL, 0xf8),
+	QMP_PHY_INIT_CFG(QPHY_V6_PCS_USB3_RXEQTRAINING_DFE_TIME_S2, 0x07),
+	QMP_PHY_INIT_CFG(QPHY_V6_PCS_USB3_RCVR_DTCT_DLY_U3_L, 0x40),
+	QMP_PHY_INIT_CFG(QPHY_V6_PCS_USB3_RCVR_DTCT_DLY_U3_H, 0x00),
+	QMP_PHY_INIT_CFG(QPHY_V6_PCS_USB3_POWER_STATE_CONFIG1, 0x68),
 };
 
 static const struct qmp_phy_init_tbl qmp_v4_dp_serdes_tbl[] = {
diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcs-usb-v6.h b/drivers/phy/qualcomm/phy-qcom-qmp-pcs-usb-v6.h
index 5409ddcd3eb5..4fbef4eea7b5 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-pcs-usb-v6.h
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcs-usb-v6.h
@@ -7,25 +7,25 @@
 #define QCOM_PHY_QMP_PCS_USB_V6_H_
 
 /* Only for QMP V6 PHY - USB3 have different offsets than V5 */
-#define QPHY_USB_V6_PCS_LOCK_DETECT_CONFIG1		0xc4
-#define QPHY_USB_V6_PCS_LOCK_DETECT_CONFIG2		0xc8
-#define QPHY_USB_V6_PCS_LOCK_DETECT_CONFIG3		0xcc
-#define QPHY_USB_V6_PCS_LOCK_DETECT_CONFIG6		0xd8
-#define QPHY_USB_V6_PCS_REFGEN_REQ_CONFIG1		0xdc
-#define QPHY_USB_V6_PCS_RX_SIGDET_LVL			0x188
-#define QPHY_USB_V6_PCS_RCVR_DTCT_DLY_P1U2_L		0x190
-#define QPHY_USB_V6_PCS_RCVR_DTCT_DLY_P1U2_H		0x194
-#define QPHY_USB_V6_PCS_CDR_RESET_TIME			0x1b0
-#define QPHY_USB_V6_PCS_ALIGN_DETECT_CONFIG1		0x1c0
-#define QPHY_USB_V6_PCS_ALIGN_DETECT_CONFIG2		0x1c4
-#define QPHY_USB_V6_PCS_PCS_TX_RX_CONFIG		0x1d0
-#define QPHY_USB_V6_PCS_EQ_CONFIG1			0x1dc
-#define QPHY_USB_V6_PCS_EQ_CONFIG5			0x1ec
+#define QPHY_V6_PCS_LOCK_DETECT_CONFIG1			0xc4
+#define QPHY_V6_PCS_LOCK_DETECT_CONFIG2			0xc8
+#define QPHY_V6_PCS_LOCK_DETECT_CONFIG3			0xcc
+#define QPHY_V6_PCS_LOCK_DETECT_CONFIG6			0xd8
+#define QPHY_V6_PCS_REFGEN_REQ_CONFIG1			0xdc
+#define QPHY_V6_PCS_RX_SIGDET_LVL			0x188
+#define QPHY_V6_PCS_RCVR_DTCT_DLY_P1U2_L		0x190
+#define QPHY_V6_PCS_RCVR_DTCT_DLY_P1U2_H		0x194
+#define QPHY_V6_PCS_CDR_RESET_TIME			0x1b0
+#define QPHY_V6_PCS_ALIGN_DETECT_CONFIG1		0x1c0
+#define QPHY_V6_PCS_ALIGN_DETECT_CONFIG2		0x1c4
+#define QPHY_V6_PCS_PCS_TX_RX_CONFIG			0x1d0
+#define QPHY_V6_PCS_EQ_CONFIG1				0x1dc
+#define QPHY_V6_PCS_EQ_CONFIG5				0x1ec
 
-#define QPHY_USB_V6_PCS_USB3_POWER_STATE_CONFIG1	0x00
-#define QPHY_USB_V6_PCS_USB3_LFPS_DET_HIGH_COUNT_VAL	0x18
-#define QPHY_USB_V6_PCS_USB3_RXEQTRAINING_DFE_TIME_S2	0x3c
-#define QPHY_USB_V6_PCS_USB3_RCVR_DTCT_DLY_U3_L		0x40
-#define QPHY_USB_V6_PCS_USB3_RCVR_DTCT_DLY_U3_H		0x44
+#define QPHY_V6_PCS_USB3_POWER_STATE_CONFIG1		0x00
+#define QPHY_V6_PCS_USB3_LFPS_DET_HIGH_COUNT_VAL	0x18
+#define QPHY_V6_PCS_USB3_RXEQTRAINING_DFE_TIME_S2	0x3c
+#define QPHY_V6_PCS_USB3_RCVR_DTCT_DLY_U3_L		0x40
+#define QPHY_V6_PCS_USB3_RCVR_DTCT_DLY_U3_H		0x44
 
 #endif
-- 
2.39.2

