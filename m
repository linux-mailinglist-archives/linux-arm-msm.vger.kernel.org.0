Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 877E279B72D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Sep 2023 02:06:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344348AbjIKVN4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 11 Sep 2023 17:13:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45652 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244496AbjIKUiu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 11 Sep 2023 16:38:50 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E772B1AB
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Sep 2023 13:38:45 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-501eec0a373so7903852e87.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Sep 2023 13:38:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694464724; x=1695069524; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RquiWTKnMLa3BWnVMnvof5ZnWR6qWtXMTkrlacLzVqE=;
        b=w1xhrtZe840S9WTftMvyuiNkGEX/nbgRFDOwz3r9/IHgrbHmfl7wg+si6/lLtFAkiL
         bcI5aJRewB42onS1ezyNZoG1Ne06b2w6Dr8zkl/mBssLvAwxoo0xN3MT+pORVuq1wy6c
         n8pxDEY4bqkyt28J4CbFsr5rZMPaQxtANsnK/yJEeiTfqaogrb2dz/PonuPB6HPnQ4xd
         5EBCOsombQoD7IV5yfS3vpm/VLIHHZtIs5nVDI+I1YNBbtdNSr9+al7/koe7HMhsh1S8
         UnlHJZzHyEPCEEkI9Jh+CHsUpH1j2iqad6v+3wjOYgAfcdjMIgIuVQ4TWwbncJaJGnYa
         nCbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694464724; x=1695069524;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RquiWTKnMLa3BWnVMnvof5ZnWR6qWtXMTkrlacLzVqE=;
        b=BIRo0aK5heQlNeSE2NiAfsg18ZpdY7f6gtjhrcb8RskRKFNCi946XqgIZHJsHzacal
         yfe99HGJvau8iq8oGuo3wWh3/FxBFZfKNYoY/k7eEhSTm+/S1uQ6ocZOpWM/3rxNawe/
         kr907kOI7rZXBEvpjPYewrWD7BE4fb2JiU2SETmUlAbfiIqmjO0GghYl+uNPjlSWDi7s
         RteDt7BAH1w05A0YHdUa2CqVGAmWBsp5mbHT3rG7LGk1iSTS8HtYfIyAOEQauXJX1oLU
         /XeshbgAcMaxCMd5FY7EQQtC9qSxxxlwTywmlJ9ljzkdTNEsKMNDfCcgJ3v0zkUOpQEf
         zcKA==
X-Gm-Message-State: AOJu0YzNIwR0LLNDFz93dToEKSSUC87DX1PAgnPUBrAwneSlGlWdEiVq
        pnaCLyBwdBlQc/jYFiuCpEyC0xXE55YeJ0Hv1XU=
X-Google-Smtp-Source: AGHT+IGXx7xICV/kcBwxpHRx7oKp2rQPN1p/v9Z25hwi5ClQ2AEfe8APyFG4I//08fnRy7YnEcXElw==
X-Received: by 2002:a05:6512:398c:b0:4fd:fabf:b6ee with SMTP id j12-20020a056512398c00b004fdfabfb6eemr10503323lfu.9.1694464724135;
        Mon, 11 Sep 2023 13:38:44 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id l9-20020ac24309000000b00500b3157ec2sm1447753lfh.148.2023.09.11.13.38.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Sep 2023 13:38:43 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org
Subject: [PATCH v2 1/3] phy: qcom-qmp-combo: fix the prefix for the PCS_USB v6 registers
Date:   Mon, 11 Sep 2023 23:38:40 +0300
Message-Id: <20230911203842.778411-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230911203842.778411-1-dmitry.baryshkov@linaro.org>
References: <20230911203842.778411-1-dmitry.baryshkov@linaro.org>
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
 drivers/phy/qualcomm/phy-qcom-qmp-combo.c     | 38 +++++++++---------
 .../phy/qualcomm/phy-qcom-qmp-pcs-usb-v6.h    | 40 +++++++++----------
 2 files changed, 39 insertions(+), 39 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
index 5e6fc8103e9d..02d22595f747 100644
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
-	QMP_PHY_INIT_CFG(QPHY_USB_V6_PCS_USB3_POWER_STATE_CONFIG1, 0x68),
-	QMP_PHY_INIT_CFG(QPHY_USB_V6_PCS_USB3_LFPS_DET_HIGH_COUNT_VAL, 0xf8),
-	QMP_PHY_INIT_CFG(QPHY_USB_V6_PCS_USB3_RXEQTRAINING_DFE_TIME_S2, 0x07),
-	QMP_PHY_INIT_CFG(QPHY_USB_V6_PCS_USB3_RCVR_DTCT_DLY_U3_L, 0x40),
-	QMP_PHY_INIT_CFG(QPHY_USB_V6_PCS_USB3_RCVR_DTCT_DLY_U3_H, 0x00),
+	QMP_PHY_INIT_CFG(QPHY_V6_PCS_USB3_LFPS_DET_HIGH_COUNT_VAL, 0xf8),
+	QMP_PHY_INIT_CFG(QPHY_V6_PCS_USB3_RXEQTRAINING_DFE_TIME_S2, 0x07),
+	QMP_PHY_INIT_CFG(QPHY_V6_PCS_USB3_RCVR_DTCT_DLY_U3_L, 0x40),
+	QMP_PHY_INIT_CFG(QPHY_V6_PCS_USB3_RCVR_DTCT_DLY_U3_H, 0x00),
+	QMP_PHY_INIT_CFG(QPHY_V6_PCS_USB3_POWER_STATE_CONFIG1, 0x68),
 };
 
 static const struct qmp_phy_init_tbl qmp_v4_dp_serdes_tbl[] = {
diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcs-usb-v6.h b/drivers/phy/qualcomm/phy-qcom-qmp-pcs-usb-v6.h
index c38530d6776b..cf4464849006 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-pcs-usb-v6.h
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcs-usb-v6.h
@@ -7,26 +7,26 @@
 #define QCOM_PHY_QMP_PCS_USB_V6_H_
 
 /* Only for QMP V6 PHY - USB3 have different offsets than V5 */
-#define QPHY_USB_V6_PCS_LOCK_DETECT_CONFIG1		0xc4
-#define QPHY_USB_V6_PCS_LOCK_DETECT_CONFIG2		0xc8
-#define QPHY_USB_V6_PCS_LOCK_DETECT_CONFIG3		0xcc
-#define QPHY_USB_V6_PCS_LOCK_DETECT_CONFIG6		0xd8
-#define QPHY_USB_V6_PCS_REFGEN_REQ_CONFIG1		0xdc
-#define QPHY_USB_V6_PCS_POWER_STATE_CONFIG1		0x90
-#define QPHY_USB_V6_PCS_RX_SIGDET_LVL			0x188
-#define QPHY_USB_V6_PCS_RCVR_DTCT_DLY_P1U2_L		0x190
-#define QPHY_USB_V6_PCS_RCVR_DTCT_DLY_P1U2_H		0x194
-#define QPHY_USB_V6_PCS_CDR_RESET_TIME			0x1b0
-#define QPHY_USB_V6_PCS_ALIGN_DETECT_CONFIG1		0x1c0
-#define QPHY_USB_V6_PCS_ALIGN_DETECT_CONFIG2		0x1c4
-#define QPHY_USB_V6_PCS_PCS_TX_RX_CONFIG		0x1d0
-#define QPHY_USB_V6_PCS_EQ_CONFIG1			0x1dc
-#define QPHY_USB_V6_PCS_EQ_CONFIG5			0x1ec
+#define QPHY_V6_PCS_LOCK_DETECT_CONFIG1		0xc4
+#define QPHY_V6_PCS_LOCK_DETECT_CONFIG2		0xc8
+#define QPHY_V6_PCS_LOCK_DETECT_CONFIG3		0xcc
+#define QPHY_V6_PCS_LOCK_DETECT_CONFIG6		0xd8
+#define QPHY_V6_PCS_REFGEN_REQ_CONFIG1		0xdc
+#define QPHY_V6_PCS_POWER_STATE_CONFIG1		0x90
+#define QPHY_V6_PCS_RX_SIGDET_LVL			0x188
+#define QPHY_V6_PCS_RCVR_DTCT_DLY_P1U2_L		0x190
+#define QPHY_V6_PCS_RCVR_DTCT_DLY_P1U2_H		0x194
+#define QPHY_V6_PCS_CDR_RESET_TIME			0x1b0
+#define QPHY_V6_PCS_ALIGN_DETECT_CONFIG1		0x1c0
+#define QPHY_V6_PCS_ALIGN_DETECT_CONFIG2		0x1c4
+#define QPHY_V6_PCS_PCS_TX_RX_CONFIG		0x1d0
+#define QPHY_V6_PCS_EQ_CONFIG1			0x1dc
+#define QPHY_V6_PCS_EQ_CONFIG5			0x1ec
 
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

