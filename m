Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 856327936A4
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Sep 2023 09:58:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231995AbjIFH6d (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 6 Sep 2023 03:58:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38346 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229530AbjIFH6c (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 6 Sep 2023 03:58:32 -0400
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B17EBCDB
        for <linux-arm-msm@vger.kernel.org>; Wed,  6 Sep 2023 00:58:28 -0700 (PDT)
Received: by mail-lj1-x231.google.com with SMTP id 38308e7fff4ca-2bb9a063f26so53187901fa.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 Sep 2023 00:58:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693987107; x=1694591907; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1WFoCDHQcZPwZJQSbyTUB9Jk4X6fahGU3WH6smo7VI4=;
        b=N741mXQ1+WQbAPTm9u7nRR7Fk/0N3P5Z/Ymz5Gg7S2sRKu7McflcqPSR/GB30wNW43
         ijcFTC/okVlzDPqchoQjevbcaaJO5WyVdc9TyIzRPpqW+/VPaO49kd++YbC5kQx2u4rt
         0XeijAN/3WqfoVmCPoQjVrP32/FjZoyIrQgQPGQHmJMkDZ/ZXZ/hmTi5y1KS2oxBc+KQ
         B6rFLkrmN/gjqEkbqnzFYcdlz/Qi//e/+7F1ZHkb85Qak8GkLG7OelKS/pzF4OXFgx45
         ujbCWzwnj+c0JC9OCu9Wa7BJSbUSj4jUXzpP+wl5SdIERph/UUXG08UiYs2Fph6IK1/h
         Da5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693987107; x=1694591907;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1WFoCDHQcZPwZJQSbyTUB9Jk4X6fahGU3WH6smo7VI4=;
        b=XDdzUSh+Ty+MFvoqpVgx0qzv1CC7EXdit3p33ULvmvQBcM0i8pAvSIjlg9CHfCXyKT
         LbqMj47Z4DMOUGG9km6vKPBmudiANhXUBQaAUpM66kkJCYygdk3bPg4LKyYWBELBWG5g
         EJIwviOlACDI+8pQ6sdOwVRRh5h1xO/0bW5DRAeAqn15r/CCkI6dXQH9YMlMQN99xzRF
         uvAzWa3YXzTdgWJ2hpP8rflOlqqpQ3ZW3ZcO7fLf8TVfm+p71ekQIqO5VshlGfaqLxSy
         2ZVfdr/UxneIxUVH5U/ucg9TQ/y1K+E302+k4yMtrWbl9q1yPo9Xgqx14Ba605t0JbrY
         GtAw==
X-Gm-Message-State: AOJu0YyNWgkuAjzVlqkrgYYWLyiiHh4KsP6nYyK1HZ5neN2mP71y8R1D
        aXqwDVja7Gh9FC7wltcOss/uXA==
X-Google-Smtp-Source: AGHT+IEMl8lnqRYkPl1R/oMJzHcJPuViCYtk0DbOVDNkuOPYrjXPOXu0cqH+CU/Q3TU6YkxJCcZ1VA==
X-Received: by 2002:a05:651c:c2:b0:2bd:ddf:8aa9 with SMTP id 2-20020a05651c00c200b002bd0ddf8aa9mr1603122ljr.24.1693987107059;
        Wed, 06 Sep 2023 00:58:27 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id z10-20020a2e7e0a000000b002b9ec22d9fasm3268324ljc.29.2023.09.06.00.58.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Sep 2023 00:58:26 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        Abel Vesa <abel.vesa@linaro.org>
Subject: [PATCH 3/4] phy: qcom-qmp-usb: move PCS v6 register to the proper header
Date:   Wed,  6 Sep 2023 10:58:22 +0300
Message-Id: <20230906075823.7957-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230906075823.7957-1-dmitry.baryshkov@linaro.org>
References: <20230906075823.7957-1-dmitry.baryshkov@linaro.org>
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
 drivers/phy/qualcomm/phy-qcom-qmp-pcs-usb-v6.h | 15 ---------------
 drivers/phy/qualcomm/phy-qcom-qmp-pcs-v6.h     | 15 +++++++++++++--
 2 files changed, 13 insertions(+), 17 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcs-usb-v6.h b/drivers/phy/qualcomm/phy-qcom-qmp-pcs-usb-v6.h
index 4fbef4eea7b5..7c16af0b1cc3 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-pcs-usb-v6.h
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcs-usb-v6.h
@@ -7,21 +7,6 @@
 #define QCOM_PHY_QMP_PCS_USB_V6_H_
 
 /* Only for QMP V6 PHY - USB3 have different offsets than V5 */
-#define QPHY_V6_PCS_LOCK_DETECT_CONFIG1			0xc4
-#define QPHY_V6_PCS_LOCK_DETECT_CONFIG2			0xc8
-#define QPHY_V6_PCS_LOCK_DETECT_CONFIG3			0xcc
-#define QPHY_V6_PCS_LOCK_DETECT_CONFIG6			0xd8
-#define QPHY_V6_PCS_REFGEN_REQ_CONFIG1			0xdc
-#define QPHY_V6_PCS_RX_SIGDET_LVL			0x188
-#define QPHY_V6_PCS_RCVR_DTCT_DLY_P1U2_L		0x190
-#define QPHY_V6_PCS_RCVR_DTCT_DLY_P1U2_H		0x194
-#define QPHY_V6_PCS_CDR_RESET_TIME			0x1b0
-#define QPHY_V6_PCS_ALIGN_DETECT_CONFIG1		0x1c0
-#define QPHY_V6_PCS_ALIGN_DETECT_CONFIG2		0x1c4
-#define QPHY_V6_PCS_PCS_TX_RX_CONFIG			0x1d0
-#define QPHY_V6_PCS_EQ_CONFIG1				0x1dc
-#define QPHY_V6_PCS_EQ_CONFIG5				0x1ec
-
 #define QPHY_V6_PCS_USB3_POWER_STATE_CONFIG1		0x00
 #define QPHY_V6_PCS_USB3_LFPS_DET_HIGH_COUNT_VAL	0x18
 #define QPHY_V6_PCS_USB3_RXEQTRAINING_DFE_TIME_S2	0x3c
diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcs-v6.h b/drivers/phy/qualcomm/phy-qcom-qmp-pcs-v6.h
index 18c4a3abe590..c95d3fabd108 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-pcs-v6.h
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcs-v6.h
@@ -7,10 +7,21 @@
 #define QCOM_PHY_QMP_PCS_V6_H_
 
 /* Only for QMP V6 PHY - USB/PCIe PCS registers */
-#define QPHY_V6_PCS_REFGEN_REQ_CONFIG1		0xdc
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

