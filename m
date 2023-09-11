Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 457C579BBC5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Sep 2023 02:13:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344229AbjIKVNg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 11 Sep 2023 17:13:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45656 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244501AbjIKUiv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 11 Sep 2023 16:38:51 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 475761A7
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Sep 2023 13:38:47 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-5029e4bfa22so5535042e87.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Sep 2023 13:38:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694464725; x=1695069525; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rdWY449F0A/RTXzDmh1dt7uNo/RDI4zeu37xxl7ZSOY=;
        b=WO8yThyS2CdKg9ybVggKGBq6jbtDeMqDJajHKqY5cOSHdjdeGSImcWTrHB5GGF5G6q
         dq8fldFyXN20W52U45fMVU5fzE7Pt/3EAAlSUnDiOb0PVDT2Sym6ngUKXVst9SOO5lT3
         5BrgzwA42pSDPAuPnsgRawGJsv6ypP1YFyLgKVGlEwuGifhSUTKhMv9bAWnB9ESpDi0u
         K+AehVQIIYLfIeExgTBVrV27KfkR10ct9g4p/yCvS+8h/jhpm/0WmoX3xI+D1FfuoO4/
         8EekqpDoIvNgl0hV7JW5ofG1UrUFX+/ztvMJF+7PSj3o49CFSHKK9WQct1MlOaOoCbsZ
         Mh+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694464725; x=1695069525;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rdWY449F0A/RTXzDmh1dt7uNo/RDI4zeu37xxl7ZSOY=;
        b=ncV4hT3Zj3fKFFG8qgE6E24OjWuyVLEhZ1iNYVwUzulwP9mUiPQv95yVr8eKnEDNBd
         ReiDHPBWBjHp9OBcKQAt8yI+qf9mrZ1B2p47bA2LjBovXL4yYr+PdaE0Y1PSquvPktq5
         ZSMYsCnCZuDZiNGaMYm9iqtZWthasGDmNayM1nBsRtPlHpRwfUqUMp1ONP2gWoprkPdY
         vMLXO+219YjT5Cy38jHxmhlk9LYG6/FLwp6iNf64OjatOsIFuYwxo3EWOFneyGj5Z33Q
         19i1xmmM5c15F1wQmE8vDTeLPrhK/3KbkJmQTf1kyffLZMfcb0xbTKFiPri3n1LtR3nI
         kreA==
X-Gm-Message-State: AOJu0YwAke+E1Rnh735LYBdfkgvYIQ6brbYVzxifSft2YDhA/GEA9OBx
        fiJ9sCm2Sz97Y6l5bWjSARrZpw==
X-Google-Smtp-Source: AGHT+IFS3Ps/QBZINkNy+m3pMW5TCDI+8POCFXSq9WwEV1GQv+p73OXGyBUTFxZ2BsVZaA53uqF93A==
X-Received: by 2002:a05:6512:3f12:b0:500:bf33:3add with SMTP id y18-20020a0565123f1200b00500bf333addmr10307462lfa.47.1694464725579;
        Mon, 11 Sep 2023 13:38:45 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id l9-20020ac24309000000b00500b3157ec2sm1447753lfh.148.2023.09.11.13.38.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Sep 2023 13:38:45 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org
Subject: [PATCH v2 3/3] phy: qcom-qmp-combo: use v6 registers in v6 regs layout
Date:   Mon, 11 Sep 2023 23:38:42 +0300
Message-Id: <20230911203842.778411-4-dmitry.baryshkov@linaro.org>
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

Make sure that we use only v6 registers in qmp_v6_usb3phy_regs_layout.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/phy/qualcomm/phy-qcom-qmp-combo.c      | 12 ++++++------
 drivers/phy/qualcomm/phy-qcom-qmp-pcs-usb-v6.h |  2 ++
 drivers/phy/qualcomm/phy-qcom-qmp-pcs-v6.h     |  4 ++++
 3 files changed, 12 insertions(+), 6 deletions(-)

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
index 7c16af0b1cc3..0d0089898240 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-pcs-usb-v6.h
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcs-usb-v6.h
@@ -8,6 +8,8 @@
 
 /* Only for QMP V6 PHY - USB3 have different offsets than V5 */
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

