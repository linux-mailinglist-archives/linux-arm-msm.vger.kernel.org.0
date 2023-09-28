Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1184E7B18AB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Sep 2023 12:54:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231127AbjI1Ky5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 28 Sep 2023 06:54:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39654 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231754AbjI1Kyz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 28 Sep 2023 06:54:55 -0400
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CEEB61A1
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 Sep 2023 03:54:50 -0700 (PDT)
Received: by mail-lj1-x230.google.com with SMTP id 38308e7fff4ca-2c124adf469so213239631fa.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 Sep 2023 03:54:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695898489; x=1696503289; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yl70rxw6j+gH7QmFj4s1C1nJkm733ZrDJmrxt04NnVU=;
        b=B6z1hHODhr09WXdSKMXsG7FEJ3EQ2/aUWawUIvPstCRxXkyjcoBVA27UiyVCS6I/14
         TxIlXVBHJeFFwxgsDpjfA6Z0rTrINRgyWmML1HOOHLuCB0CRm3Gx2AZ+8Nou19rsCfnN
         lK8o5MwTHLToAU1IIr9lSjVq6o5pFk5pkyYugdZ+W+PCAM6vU182/zrpQ5Z6shV6HFY9
         SP8nkyKca7zG9di6eeHtOncQqnVNUT1rJiz8bJ9SC+dD/KoPiuK31Q3oehiVZRBVXGwu
         rKvRjfOE8EkLF4zZGgDDe3ztDaLETfv+2L/F5opVBl+fbhpG0b9up1qw1Rh72C9lMdSr
         rbIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695898489; x=1696503289;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yl70rxw6j+gH7QmFj4s1C1nJkm733ZrDJmrxt04NnVU=;
        b=oA/wCYViTVepioN2kSaxePIOJsM+pLbHIissAKS5uDOBeaj0jLZZTBTpHIOGP78nEO
         2utOuxu6LldjGsRCbrUHM7ZJjCBQv9/tKGFniTyxu2ltGJEjmfKFczwNAR3KoC8b//DT
         g9ymCQzq7v3U1CjffXWQH+HwtHrDifXrcWlJ7YTA2B3GORaE+rqTVBFU0BL+SO323Vcy
         HMY06zwIjXBvYUssoVFl4/Z4Uff6Efe8n/leHyMnln8DIkFiEGn0Qir4dI+uBc5BjO36
         HS+tDOnh/bZeAon+njRUoTW7EvO2bjUJGx5zV2gk3TRtWG9e/NsQ7+UFlsOBLTdXSiID
         Qv6w==
X-Gm-Message-State: AOJu0YzgQKtT0LTj4n6NivJODqbzFDJ2/BniTJULcKbdYuxwFGjDdGTb
        uDmisFGWkEbCQ5geHSEjRWMqtA==
X-Google-Smtp-Source: AGHT+IEe3OpvGijOc8+MNS8f/nUTPwRNbTZVVVZGpeIkTR6E4ETUdgnxYtGQFi2GRBcwpCWVtoD3uA==
X-Received: by 2002:a2e:3a05:0:b0:2bc:b815:d64d with SMTP id h5-20020a2e3a05000000b002bcb815d64dmr948022lja.30.1695898488952;
        Thu, 28 Sep 2023 03:54:48 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id y24-20020a2e9d58000000b002b47a15a2eesm3551455ljj.45.2023.09.28.03.54.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Sep 2023 03:54:48 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org
Subject: [PATCH v3 3/3] phy: qcom-qmp-combo: use v6 registers in v6 regs layout
Date:   Thu, 28 Sep 2023 13:54:45 +0300
Message-Id: <20230928105445.1210861-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230928105445.1210861-1-dmitry.baryshkov@linaro.org>
References: <20230928105445.1210861-1-dmitry.baryshkov@linaro.org>
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

Make sure that we use only v6 registers in qmp_v6_usb3phy_regs_layout.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/phy/qualcomm/phy-qcom-qmp-combo.c      | 12 ++++++------
 drivers/phy/qualcomm/phy-qcom-qmp-pcs-usb-v6.h |  3 ++-
 drivers/phy/qualcomm/phy-qcom-qmp-pcs-v6.h     |  4 ++++
 3 files changed, 12 insertions(+), 7 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
index 02d22595f747..9c87845c78ec 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
@@ -194,14 +194,14 @@ static const unsigned int qmp_v5_5nm_usb3phy_regs_layout[QPHY_LAYOUT_SIZE] = {
 };
 
 static const unsigned int qmp_v6_usb3phy_regs_layout[QPHY_LAYOUT_SIZE] = {
-	[QPHY_SW_RESET]			= QPHY_V5_PCS_SW_RESET,
-	[QPHY_START_CTRL]		= QPHY_V5_PCS_START_CONTROL,
-	[QPHY_PCS_STATUS]		= QPHY_V5_PCS_PCS_STATUS1,
-	[QPHY_PCS_POWER_DOWN_CONTROL]	= QPHY_V5_PCS_POWER_DOWN_CONTROL,
+	[QPHY_SW_RESET]			= QPHY_V6_PCS_SW_RESET,
+	[QPHY_START_CTRL]		= QPHY_V6_PCS_START_CONTROL,
+	[QPHY_PCS_STATUS]		= QPHY_V6_PCS_PCS_STATUS1,
+	[QPHY_PCS_POWER_DOWN_CONTROL]	= QPHY_V6_PCS_POWER_DOWN_CONTROL,
 
 	/* In PCS_USB */
-	[QPHY_PCS_AUTONOMOUS_MODE_CTRL]	= QPHY_V5_PCS_USB3_AUTONOMOUS_MODE_CTRL,
-	[QPHY_PCS_LFPS_RXTERM_IRQ_CLEAR] = QPHY_V5_PCS_USB3_LFPS_RXTERM_IRQ_CLEAR,
+	[QPHY_PCS_AUTONOMOUS_MODE_CTRL]	= QPHY_V6_PCS_USB3_AUTONOMOUS_MODE_CTRL,
+	[QPHY_PCS_LFPS_RXTERM_IRQ_CLEAR] = QPHY_V6_PCS_USB3_LFPS_RXTERM_IRQ_CLEAR,
 
 	[QPHY_COM_RESETSM_CNTRL]	= QSERDES_V6_COM_RESETSM_CNTRL,
 	[QPHY_COM_C_READY_STATUS]	= QSERDES_V6_COM_C_READY_STATUS,
diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcs-usb-v6.h b/drivers/phy/qualcomm/phy-qcom-qmp-pcs-usb-v6.h
index 7c16af0b1cc3..df670143feb1 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-pcs-usb-v6.h
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcs-usb-v6.h
@@ -6,8 +6,9 @@
 #ifndef QCOM_PHY_QMP_PCS_USB_V6_H_
 #define QCOM_PHY_QMP_PCS_USB_V6_H_
 
-/* Only for QMP V6 PHY - USB3 have different offsets than V5 */
 #define QPHY_V6_PCS_USB3_POWER_STATE_CONFIG1		0x00
+#define QPHY_V6_PCS_USB3_AUTONOMOUS_MODE_CTRL		0x08
+#define QPHY_V6_PCS_USB3_LFPS_RXTERM_IRQ_CLEAR		0x14
 #define QPHY_V6_PCS_USB3_LFPS_DET_HIGH_COUNT_VAL	0x18
 #define QPHY_V6_PCS_USB3_RXEQTRAINING_DFE_TIME_S2	0x3c
 #define QPHY_V6_PCS_USB3_RCVR_DTCT_DLY_U3_L		0x40
diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcs-v6.h b/drivers/phy/qualcomm/phy-qcom-qmp-pcs-v6.h
index 47cedb860fef..08299d2b78f0 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-pcs-v6.h
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcs-v6.h
@@ -7,6 +7,10 @@
 #define QCOM_PHY_QMP_PCS_V6_H_
 
 /* Only for QMP V6 PHY - USB/PCIe PCS registers */
+#define QPHY_V6_PCS_SW_RESET			0x000
+#define QPHY_V6_PCS_PCS_STATUS1			0x014
+#define QPHY_V6_PCS_POWER_DOWN_CONTROL		0x040
+#define QPHY_V6_PCS_START_CONTROL		0x044
 #define QPHY_V6_PCS_POWER_STATE_CONFIG1		0x090
 #define QPHY_V6_PCS_LOCK_DETECT_CONFIG1		0x0c4
 #define QPHY_V6_PCS_LOCK_DETECT_CONFIG2		0x0c8
-- 
2.39.2

