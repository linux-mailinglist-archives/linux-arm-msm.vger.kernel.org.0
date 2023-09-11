Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 491A279BCAF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Sep 2023 02:15:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344874AbjIKVO5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 11 Sep 2023 17:14:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45654 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244500AbjIKUiv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 11 Sep 2023 16:38:51 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 97CA2127
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Sep 2023 13:38:46 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-501eec0a373so7903877e87.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Sep 2023 13:38:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694464725; x=1695069525; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=94VHlZVsf6bXdjIfoogRbhmFUuCTuzhRqvR0EtjE+eY=;
        b=rA3LSgXRpEG218TRbnBZDyGH8dE+ZW8qoOkRyYLRm1ShP+tO/bvQd6h7vPwjZj3Mvc
         m3lsTHQ1U+FbTBT3bYA64u8rp0OuDv3gEWsuuOR2nSGz4uQJ11gDDXnEi+CyM6TcBwIi
         eP7xCjHC8jdyFygxAc48CRU1HOMTNfyvDngpTjf20IIrNeHo3kYI/mWw+QfxzP07q4sC
         B5vrNQtVI6Xmi2V2saHZWmLrGXET13QTamTzmB5ZM0msRsPj3tOcBcQDncypFEEhv33c
         V541a/Ox3RzPZM/jhZrgv8Q2QL2bDdb+iQJ92c1h18ugyR3abbIzuSYO4whM9E5VvHhn
         wPxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694464725; x=1695069525;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=94VHlZVsf6bXdjIfoogRbhmFUuCTuzhRqvR0EtjE+eY=;
        b=Mvht2rtuYURRBJepchG+A3OkAVh0uLq+yN6jCOI7o0xyfQd0ZeJwvUXtRk0AqLipQ2
         kS6EhWTzut/p+2kE0j79MREmJ3sTkQvETsGgnJuhzQpNQi9uAylr7YS+7KIw28v4G0Kp
         rCr1bef2tVF2k1n7Bge6s0Gjzmnu73l6d5ak1uoq651kL8D0UkBgv8NQeegr1XmtVM2U
         GoQmIbePULb6GgLR2jvFJULh5t/zvCL9jZMHFpGcwB0Ga+nowTjsrAiGJlaoKdRyOfVy
         yDw2RI9i6qCaAHx5+x/9iWwCWiqYzAEv3pAPPwnixGqU2mCfp1Os1zH/0CL5NfcnB7tX
         fIpw==
X-Gm-Message-State: AOJu0YxyqoNwiximNoKb0QvSj7Sr0cnD98SjJNK3t1bymXm/l5SpWELA
        WNvBiVpXdwSRHVsUn+XVeNDQB9hiZGaYkpN6Tk8=
X-Google-Smtp-Source: AGHT+IGY/yB3nPn72e8seiL2VzAUiA0lIE6m0PoId/0JWMZOweBKK3le/7I+6/p29mN3EZvC+43p7w==
X-Received: by 2002:ac2:488f:0:b0:502:9253:c56f with SMTP id x15-20020ac2488f000000b005029253c56fmr7282219lfc.44.1694464724817;
        Mon, 11 Sep 2023 13:38:44 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id l9-20020ac24309000000b00500b3157ec2sm1447753lfh.148.2023.09.11.13.38.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Sep 2023 13:38:44 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org
Subject: [PATCH v2 2/3] phy: qcom-qmp-usb: move PCS v6 register to the proper header
Date:   Mon, 11 Sep 2023 23:38:41 +0300
Message-Id: <20230911203842.778411-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230911203842.778411-1-dmitry.baryshkov@linaro.org>
References: <20230911203842.778411-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The commit 39bbf82d8c2b ("phy: qcom-qmp: pcs-usb: Add v6 register
offsets") incorrectly added plain PCS registers to the PCS_USB header.
Move them to a proper location.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/phy/qualcomm/phy-qcom-qmp-pcs-usb-v6.h | 16 ----------------
 drivers/phy/qualcomm/phy-qcom-qmp-pcs-v6.h     | 16 ++++++++++++++--
 2 files changed, 14 insertions(+), 18 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcs-usb-v6.h b/drivers/phy/qualcomm/phy-qcom-qmp-pcs-usb-v6.h
index cf4464849006..7c16af0b1cc3 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-pcs-usb-v6.h
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcs-usb-v6.h
@@ -7,22 +7,6 @@
 #define QCOM_PHY_QMP_PCS_USB_V6_H_
 
 /* Only for QMP V6 PHY - USB3 have different offsets than V5 */
-#define QPHY_V6_PCS_LOCK_DETECT_CONFIG1		0xc4
-#define QPHY_V6_PCS_LOCK_DETECT_CONFIG2		0xc8
-#define QPHY_V6_PCS_LOCK_DETECT_CONFIG3		0xcc
-#define QPHY_V6_PCS_LOCK_DETECT_CONFIG6		0xd8
-#define QPHY_V6_PCS_REFGEN_REQ_CONFIG1		0xdc
-#define QPHY_V6_PCS_POWER_STATE_CONFIG1		0x90
-#define QPHY_V6_PCS_RX_SIGDET_LVL			0x188
-#define QPHY_V6_PCS_RCVR_DTCT_DLY_P1U2_L		0x190
-#define QPHY_V6_PCS_RCVR_DTCT_DLY_P1U2_H		0x194
-#define QPHY_V6_PCS_CDR_RESET_TIME			0x1b0
-#define QPHY_V6_PCS_ALIGN_DETECT_CONFIG1		0x1c0
-#define QPHY_V6_PCS_ALIGN_DETECT_CONFIG2		0x1c4
-#define QPHY_V6_PCS_PCS_TX_RX_CONFIG		0x1d0
-#define QPHY_V6_PCS_EQ_CONFIG1			0x1dc
-#define QPHY_V6_PCS_EQ_CONFIG5			0x1ec
-
 #define QPHY_V6_PCS_USB3_POWER_STATE_CONFIG1		0x00
 #define QPHY_V6_PCS_USB3_LFPS_DET_HIGH_COUNT_VAL	0x18
 #define QPHY_V6_PCS_USB3_RXEQTRAINING_DFE_TIME_S2	0x3c
diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcs-v6.h b/drivers/phy/qualcomm/phy-qcom-qmp-pcs-v6.h
index 18c4a3abe590..47cedb860fef 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-pcs-v6.h
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcs-v6.h
@@ -7,10 +7,22 @@
 #define QCOM_PHY_QMP_PCS_V6_H_
 
 /* Only for QMP V6 PHY - USB/PCIe PCS registers */
-#define QPHY_V6_PCS_REFGEN_REQ_CONFIG1		0xdc
+#define QPHY_V6_PCS_POWER_STATE_CONFIG1		0x090
+#define QPHY_V6_PCS_LOCK_DETECT_CONFIG1		0x0c4
+#define QPHY_V6_PCS_LOCK_DETECT_CONFIG2		0x0c8
+#define QPHY_V6_PCS_LOCK_DETECT_CONFIG3		0x0cc
+#define QPHY_V6_PCS_LOCK_DETECT_CONFIG6		0x0d8
+#define QPHY_V6_PCS_REFGEN_REQ_CONFIG1		0x0dc
 #define QPHY_V6_PCS_RX_SIGDET_LVL		0x188
+#define QPHY_V6_PCS_RCVR_DTCT_DLY_P1U2_L	0x190
+#define QPHY_V6_PCS_RCVR_DTCT_DLY_P1U2_H	0x194
 #define QPHY_V6_PCS_RATE_SLEW_CNTRL1		0x198
-#define QPHY_V6_PCS_EQ_CONFIG2			0x1e0
+#define QPHY_V6_PCS_CDR_RESET_TIME		0x1b0
+#define QPHY_V6_PCS_ALIGN_DETECT_CONFIG1	0x1c0
+#define QPHY_V6_PCS_ALIGN_DETECT_CONFIG2	0x1c4
 #define QPHY_V6_PCS_PCS_TX_RX_CONFIG		0x1d0
+#define QPHY_V6_PCS_EQ_CONFIG1			0x1dc
+#define QPHY_V6_PCS_EQ_CONFIG2			0x1e0
+#define QPHY_V6_PCS_EQ_CONFIG5			0x1ec
 
 #endif
-- 
2.39.2

