Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B8D677B18AA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Sep 2023 12:54:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231738AbjI1Ky4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 28 Sep 2023 06:54:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39580 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231127AbjI1Kyz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 28 Sep 2023 06:54:55 -0400
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 35D4A19B
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 Sep 2023 03:54:49 -0700 (PDT)
Received: by mail-lj1-x22f.google.com with SMTP id 38308e7fff4ca-2c007d6159aso206866991fa.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 Sep 2023 03:54:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695898487; x=1696503287; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RquiWTKnMLa3BWnVMnvof5ZnWR6qWtXMTkrlacLzVqE=;
        b=tay2N4lEiyveGFDQpuPBtVPS89AAv3vNIW8MbSCqY9YS+98IenCzw/79OC6mQ3VHZ6
         VeoNrlhp6I1wqVhmTtx6+dJ9SMqqhAbge86mV4OfmA+Dk6Bbcw08/OG0YhBoMe7ZZvRq
         x3PgGOqmpSq0bBpKLwQM+tshVO7WfcO+/HAqyW9EmRi1cBQ+09XgHTd8/BATSe0qwf3G
         pBNS0DtGKHWFFLpgb6wVXTS75HAaUQiuyN8n6X7cJ4pUquY3Q82huKlbSVclPkLqoF/s
         rv6Y6uY/OIa6AkPwrfhacBHTiaPKevAY7fLY/dN3fkvAwCnWQhyvFn2s1UB1wcF5u3M1
         VZEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695898487; x=1696503287;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RquiWTKnMLa3BWnVMnvof5ZnWR6qWtXMTkrlacLzVqE=;
        b=dCDbZZDU7UxKCuohRzasIkXRyKRcJKwPQfOsyCVm3quOsSZdh+vvIFaY857ge/XGjO
         pCSKsWLomEvN9Ld/e1BWJf32w3PvJbOiLdtwAigxFGWSsrhaIdvSxtgW2s5FLARenLK/
         785foLc7PG4xYvCpsVgvrCa0HvTaJDjepn1k85/cFCqiYLuMOFsc4J9ic6Kq2aQYkjFu
         B7B3jBaeYyBnbNEojQTgTy9TXoPHHDiVH6p6zUtjThiVoSVi3QY/8Vq7cEe6xM3zO4q4
         jT3+pPz8wasUMHRMnXVy09MLYomU1g3gYljHf5z8ySytVrXrjI4yqBgoJVwntkxxRnDw
         2mqw==
X-Gm-Message-State: AOJu0Yxf6qg/0TleCRHIX3itMewl6hjmPsqeNGxgiOm1ZTC7nGfeVQl0
        F+rAkbH61RzbhXSzGPN7Xh00gcfURzFBi6QY9FuOqg==
X-Google-Smtp-Source: AGHT+IFMDpY5v/KqeeNNyc5nMT93mzbLz/kU+bXDL7wG6zC49l1GBkyZScfcQwZbw+Wgc2rOty0SiQ==
X-Received: by 2002:a2e:86d3:0:b0:2c0:2e25:5730 with SMTP id n19-20020a2e86d3000000b002c02e255730mr906808ljj.5.1695898487484;
        Thu, 28 Sep 2023 03:54:47 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id y24-20020a2e9d58000000b002b47a15a2eesm3551455ljj.45.2023.09.28.03.54.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Sep 2023 03:54:46 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org
Subject: [PATCH v3 1/3] phy: qcom-qmp-combo: fix the prefix for the PCS_USB v6 registers
Date:   Thu, 28 Sep 2023 13:54:43 +0300
Message-Id: <20230928105445.1210861-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230928105445.1210861-1-dmitry.baryshkov@linaro.org>
References: <20230928105445.1210861-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
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

