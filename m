Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CDD407936A2
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Sep 2023 09:58:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231486AbjIFH6c (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 6 Sep 2023 03:58:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39038 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230070AbjIFH6b (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 6 Sep 2023 03:58:31 -0400
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 48101CC2
        for <linux-arm-msm@vger.kernel.org>; Wed,  6 Sep 2023 00:58:27 -0700 (PDT)
Received: by mail-lj1-x22e.google.com with SMTP id 38308e7fff4ca-2bcc14ea414so53165161fa.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 Sep 2023 00:58:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693987105; x=1694591905; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YHc26rbE/qo/UM6quw+dspiLGabdEhZRaP8hO5pgiG8=;
        b=uraw6Fz4ja3MX2qUsl9uoru+1oyXnxx3zuklXaVg8Sg8qyxGM/peZ8dFM8KhzxrxjP
         UDOlrBqPBPz+6FpRM47L+nz/UJCEZzST8z7MzPTCsDN7yvwvcgUvpLnzgs/FozjjTmy/
         escnGdrTGaJa0CrDc9Z3R2kQRYltgcQnBxyP0o7SrOOeNpobxBcL0s8+QkGf9Rq5rvM4
         wdAaJ97LYxSLsQLjKV/+9fWKwaRHG+LE/q1GFoQvSKxWXUpuwkXsX5iYwZoiIp1UhPdN
         LnCcMStRCLss6G6QStZnZvBUUSJos5z2motJ0szcZgURWlr3hNjugJ3fjvmKsyUHQs4a
         N4HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693987105; x=1694591905;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YHc26rbE/qo/UM6quw+dspiLGabdEhZRaP8hO5pgiG8=;
        b=WnUK6HzanD+wYh37vQdMmsbc9mFjNrwulpKs9ZOmYOnf0Gh5YOp5pMPyRgUXeKBsIm
         5Waj9XyYi+/E/UFlg12zhxuULxSQyex09SbjCmrTVWzVWowgmKrPCB/qBq+VDYDRiEn7
         VCK2cxfqa8pCiui6TqvL1iHYlGmPFkhwiw3CAfzuQVpd+inUTaAXQiePXIr7ZBB6jXkv
         fYzxSRzBVwjES7WTpsDC+MdKs/FzkeGHvqC722pq4+kv32xQZOOUvuR5Sdc7k70EHMpl
         J1oAIyS0NAKb+UfipQQHx8w/Bo6jmWJ6Q8wXqjvT0oAZOjbwBEzIDUrnb4kCpvcx5CD3
         w2Kw==
X-Gm-Message-State: AOJu0YzFT6Bo5QKReh2XKPg954kVpR9SvNxGZ4mjH/SpOw7DKPhG7VST
        NlJRuMbbrGN9VEz5Hl3PJygRNQ==
X-Google-Smtp-Source: AGHT+IGp7BZYEgMUGR3DjqEsHV/nzt71UbvNkQBbbU3WFAmFxPu83Ovuo+ghKPpKmXnQzEb8VLDR4g==
X-Received: by 2002:a05:651c:21b:b0:2bb:b528:87b1 with SMTP id y27-20020a05651c021b00b002bbb52887b1mr1377393ljn.50.1693987105661;
        Wed, 06 Sep 2023 00:58:25 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id z10-20020a2e7e0a000000b002b9ec22d9fasm3268324ljc.29.2023.09.06.00.58.24
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
        Abel Vesa <abel.vesa@linaro.org>, stable@vger.kernel.org
Subject: [PATCH 1/4] phy: qcom-qmp-combo: correct sm8550 PHY programming
Date:   Wed,  6 Sep 2023 10:58:20 +0300
Message-Id: <20230906075823.7957-2-dmitry.baryshkov@linaro.org>
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

Move PCS_USB3_POWER_STATE_CONFIG1 register programming from pcs_tbl to
the pcs_usb_tbl, where it belongs. Also, while we are at it, correct the
offset of this register to point to 0x00, as expected.

Fixes: 49742e9edab3 ("phy: qcom-qmp-combo: Add support for SM8550")
Fixes: 39bbf82d8c2b ("phy: qcom-qmp: pcs-usb: Add v6 register offsets")
Cc: Abel Vesa <abel.vesa@linaro.org>
Cc: stable@vger.kernel.org
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/phy/qualcomm/phy-qcom-qmp-combo.c      | 2 +-
 drivers/phy/qualcomm/phy-qcom-qmp-pcs-usb-v6.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
index cbb28afce135..41b9be56eead 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
@@ -859,7 +859,6 @@ static const struct qmp_phy_init_tbl sm8550_usb3_pcs_tbl[] = {
 	QMP_PHY_INIT_CFG(QPHY_USB_V6_PCS_PCS_TX_RX_CONFIG, 0x0c),
 	QMP_PHY_INIT_CFG(QPHY_USB_V6_PCS_EQ_CONFIG1, 0x4b),
 	QMP_PHY_INIT_CFG(QPHY_USB_V6_PCS_EQ_CONFIG5, 0x10),
-	QMP_PHY_INIT_CFG(QPHY_USB_V6_PCS_USB3_POWER_STATE_CONFIG1, 0x68),
 };
 
 static const struct qmp_phy_init_tbl sm8550_usb3_pcs_usb_tbl[] = {
@@ -867,6 +866,7 @@ static const struct qmp_phy_init_tbl sm8550_usb3_pcs_usb_tbl[] = {
 	QMP_PHY_INIT_CFG(QPHY_USB_V6_PCS_USB3_RXEQTRAINING_DFE_TIME_S2, 0x07),
 	QMP_PHY_INIT_CFG(QPHY_USB_V6_PCS_USB3_RCVR_DTCT_DLY_U3_L, 0x40),
 	QMP_PHY_INIT_CFG(QPHY_USB_V6_PCS_USB3_RCVR_DTCT_DLY_U3_H, 0x00),
+	QMP_PHY_INIT_CFG(QPHY_USB_V6_PCS_USB3_POWER_STATE_CONFIG1, 0x68),
 };
 
 static const struct qmp_phy_init_tbl qmp_v4_dp_serdes_tbl[] = {
diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcs-usb-v6.h b/drivers/phy/qualcomm/phy-qcom-qmp-pcs-usb-v6.h
index 9510e63ba9d8..5409ddcd3eb5 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-pcs-usb-v6.h
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcs-usb-v6.h
@@ -12,7 +12,6 @@
 #define QPHY_USB_V6_PCS_LOCK_DETECT_CONFIG3		0xcc
 #define QPHY_USB_V6_PCS_LOCK_DETECT_CONFIG6		0xd8
 #define QPHY_USB_V6_PCS_REFGEN_REQ_CONFIG1		0xdc
-#define QPHY_USB_V6_PCS_USB3_POWER_STATE_CONFIG1	0x90
 #define QPHY_USB_V6_PCS_RX_SIGDET_LVL			0x188
 #define QPHY_USB_V6_PCS_RCVR_DTCT_DLY_P1U2_L		0x190
 #define QPHY_USB_V6_PCS_RCVR_DTCT_DLY_P1U2_H		0x194
@@ -23,6 +22,7 @@
 #define QPHY_USB_V6_PCS_EQ_CONFIG1			0x1dc
 #define QPHY_USB_V6_PCS_EQ_CONFIG5			0x1ec
 
+#define QPHY_USB_V6_PCS_USB3_POWER_STATE_CONFIG1	0x00
 #define QPHY_USB_V6_PCS_USB3_LFPS_DET_HIGH_COUNT_VAL	0x18
 #define QPHY_USB_V6_PCS_USB3_RXEQTRAINING_DFE_TIME_S2	0x3c
 #define QPHY_USB_V6_PCS_USB3_RCVR_DTCT_DLY_U3_L		0x40
-- 
2.39.2

