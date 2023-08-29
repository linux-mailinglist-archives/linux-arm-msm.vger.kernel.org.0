Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5187F78CDF2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Aug 2023 23:00:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232260AbjH2U7f (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 29 Aug 2023 16:59:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35282 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240576AbjH2U72 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 29 Aug 2023 16:59:28 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C5CD51BF
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Aug 2023 13:59:23 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-500bdef7167so288501e87.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Aug 2023 13:59:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693342762; x=1693947562; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZClpEK+uUKPaycwTgXOUijkUQvmjkQmrL5FK82P2oPE=;
        b=QmQ1/FAUwtRhTgOE6gN1o+0iNj9yIxTbUXewz9xArIDUpbWkngaYp8juo6QojZm3iT
         lGv0c103ZUzUGgWQGfiIMxiibm7ulHyxa3e5UjhdwIBIuUK/p8hZvDypQCz8LxS0UD6m
         rt0/QlE+E9gaWZ4uFUc/q50jTDdUALmP7ck4yezrtI08Abage+tILTz+S36etLnY5l2Y
         1vhLMHwXqFhc6xx3CR/ULoRfrTn/SmPNqEyehMsAr4/vZf395CjvBf/JB2jxsHzr7dk5
         KNDgQQD9Tbl9nV0M+1GMU/G2KSVLr2z6vbFG6DtXuoG9mgFSF11GukfgioIbM6hBv4I/
         G60Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693342762; x=1693947562;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZClpEK+uUKPaycwTgXOUijkUQvmjkQmrL5FK82P2oPE=;
        b=BRL57s/9vWSbXaQgdSy0ccWusC4P61uiLtDWaO4EKrMndB2IsHciH+YOeTTrQWP2la
         QydCPnsBczW1o1B4W/SWm+HD3NPzI9aRXf7S3gR2JmryI7+lWTeVTt0gcsNm+VU1n5GO
         3ReNwPFXXEga7+h6EGWyE3dLilqWyXJhFeVAFttVzEaF37o48Sb3bwuNzQnYc7SVuiVK
         bPtIIFAihNWKDZKB9zHy41E7wyC47T+hr8cw3MxSFW92TiyugDnjjxfcJ7Od2wS0zrqp
         BPcO02XFPFsJMA03xTe9Fj/n7KUy+oXchfogZkOobJqG+Vdnp+mMcR93rp/rr6E/IacD
         TisQ==
X-Gm-Message-State: AOJu0Yx2S+dnBj+F7GixIITZbv3E0k8fwQ0uPeiaMc98gFre+83QhLJt
        1pv9Q0WdlKRpSWgAk8K9MIsDrA==
X-Google-Smtp-Source: AGHT+IHTFrDD4halxuYrCPsR6VcW7GvdIxOAeOcebEyn3hhz73/cfFfBtt9lRL4iZLg5leo05uOYsQ==
X-Received: by 2002:ac2:4e82:0:b0:4fd:c8fb:eb71 with SMTP id o2-20020ac24e82000000b004fdc8fbeb71mr105147lfr.11.1693342762069;
        Tue, 29 Aug 2023 13:59:22 -0700 (PDT)
Received: from [192.168.1.101] (abyl195.neoplus.adsl.tpnet.pl. [83.9.31.195])
        by smtp.gmail.com with ESMTPSA id q30-20020ac2515e000000b004fbad09317csm2074025lfd.189.2023.08.29.13.59.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Aug 2023 13:59:21 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Tue, 29 Aug 2023 22:59:04 +0200
Subject: [PATCH 1/2] phy: qcom-qmp-combo: Square out 8550
 POWER_STATE_CONFIG1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230829-topic-8550_usbphy-v1-1-599ddbfa094a@linaro.org>
References: <20230829-topic-8550_usbphy-v1-0-599ddbfa094a@linaro.org>
In-Reply-To: <20230829-topic-8550_usbphy-v1-0-599ddbfa094a@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Abel Vesa <abel.vesa@linaro.org>,
        Johan Hovold <johan+linaro@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1693342759; l=2561;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=ucbwZ1OoJJzdpql8jU/xLWDQeE1n/wAFfObCw093aVc=;
 b=Id79l4NM+X3WzTvMQFjDt69iOjhEsZOo/dEqkbR9V5S7/Ef7XnsbMxjOG/tqfQMc65u3RAREF
 mc8pZrjwhDkDOi16N+lcYkm62PG3/NgaDGK+OdNM3bdKYZEmdMHDqb9
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

There are two instances of the POWER_STATE_CONFIG1 register: one in
the PCS space and another one in PCS_USB.

The downstream init sequence pokes the latter one while we've been poking
the former one (and misnamed it as the latter one, impostor!). Fix that
up to avoid UB.

Fixes: 49742e9edab3 ("phy: qcom-qmp-combo: Add support for SM8550")
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/phy/qualcomm/phy-qcom-qmp-combo.c      | 2 +-
 drivers/phy/qualcomm/phy-qcom-qmp-pcs-usb-v6.h | 3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
index cbb28afce135..843099d314bf 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
@@ -859,10 +859,10 @@ static const struct qmp_phy_init_tbl sm8550_usb3_pcs_tbl[] = {
 	QMP_PHY_INIT_CFG(QPHY_USB_V6_PCS_PCS_TX_RX_CONFIG, 0x0c),
 	QMP_PHY_INIT_CFG(QPHY_USB_V6_PCS_EQ_CONFIG1, 0x4b),
 	QMP_PHY_INIT_CFG(QPHY_USB_V6_PCS_EQ_CONFIG5, 0x10),
-	QMP_PHY_INIT_CFG(QPHY_USB_V6_PCS_USB3_POWER_STATE_CONFIG1, 0x68),
 };
 
 static const struct qmp_phy_init_tbl sm8550_usb3_pcs_usb_tbl[] = {
+	QMP_PHY_INIT_CFG(QPHY_USB_Q6_PCS_USB3_POWER_STATE_CONFIG1, 0x68),
 	QMP_PHY_INIT_CFG(QPHY_USB_V6_PCS_USB3_LFPS_DET_HIGH_COUNT_VAL, 0xf8),
 	QMP_PHY_INIT_CFG(QPHY_USB_V6_PCS_USB3_RXEQTRAINING_DFE_TIME_S2, 0x07),
 	QMP_PHY_INIT_CFG(QPHY_USB_V6_PCS_USB3_RCVR_DTCT_DLY_U3_L, 0x40),
diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcs-usb-v6.h b/drivers/phy/qualcomm/phy-qcom-qmp-pcs-usb-v6.h
index 9510e63ba9d8..b9060c242fd2 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-pcs-usb-v6.h
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcs-usb-v6.h
@@ -12,7 +12,7 @@
 #define QPHY_USB_V6_PCS_LOCK_DETECT_CONFIG3		0xcc
 #define QPHY_USB_V6_PCS_LOCK_DETECT_CONFIG6		0xd8
 #define QPHY_USB_V6_PCS_REFGEN_REQ_CONFIG1		0xdc
-#define QPHY_USB_V6_PCS_USB3_POWER_STATE_CONFIG1	0x90
+#define QPHY_USB_V6_PCS_POWER_STATE_CONFIG1		0x90
 #define QPHY_USB_V6_PCS_RX_SIGDET_LVL			0x188
 #define QPHY_USB_V6_PCS_RCVR_DTCT_DLY_P1U2_L		0x190
 #define QPHY_USB_V6_PCS_RCVR_DTCT_DLY_P1U2_H		0x194
@@ -23,6 +23,7 @@
 #define QPHY_USB_V6_PCS_EQ_CONFIG1			0x1dc
 #define QPHY_USB_V6_PCS_EQ_CONFIG5			0x1ec
 
+#define QPHY_USB_Q6_PCS_USB3_POWER_STATE_CONFIG1	0x00
 #define QPHY_USB_V6_PCS_USB3_LFPS_DET_HIGH_COUNT_VAL	0x18
 #define QPHY_USB_V6_PCS_USB3_RXEQTRAINING_DFE_TIME_S2	0x3c
 #define QPHY_USB_V6_PCS_USB3_RCVR_DTCT_DLY_U3_L		0x40

-- 
2.42.0

