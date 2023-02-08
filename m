Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A090768F70A
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Feb 2023 19:36:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230416AbjBHSgo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 8 Feb 2023 13:36:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34372 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231941AbjBHSep (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 8 Feb 2023 13:34:45 -0500
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 77915521ED
        for <linux-arm-msm@vger.kernel.org>; Wed,  8 Feb 2023 10:34:41 -0800 (PST)
Received: by mail-wr1-x436.google.com with SMTP id e3so942933wrs.10
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Feb 2023 10:34:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1Ya6wdfqtEwU0trS7Ttm8mWl2QOJ16AufZUZRNQaQ5E=;
        b=ICJjhpv9vRi6MWiA6QmpoRou9iu+cytUd/oMxDevVHEgF8r66eeHKJC5nhmeViZ5zi
         lwwDs3j466OXvWTHH0+HJQzzjrVqTO/sEkE77Ty1v3KxwTvJ5DegNaL8s2NcocX6heU4
         HSQTPjEdJLN7jIVcHlTQlODRLTRLRU+jwiYcezSbnopThyK4X33btWxfjuMvuZmZHh+R
         /souAUTqSjq2cveQr5hxFw3vq4CLcqezbFIwrliQ/bA+mkZDF1MQBloclAaEwAxgNN0y
         820stxAkYoTbG4IJHVjR1mhOHxWKLJ+FohouXI6LE1iwLW3GMCq5JkMX7mNFOdho+ImF
         /02w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1Ya6wdfqtEwU0trS7Ttm8mWl2QOJ16AufZUZRNQaQ5E=;
        b=aqriVgbW4IaIxBP0iDA+vtRHaYOt6Kf2Am6mp6VXcSlyS9r8/tOQz3KanwgFVP4JY0
         mruuOq8+fiItaLmAArm8s97TRWAcEExHuBcJLTrlBqwtVm0OKBxKBQjxqTm+gu+Oie4u
         T6u6vqGFx6AZYtB9VLerVEpmjE637xAEhk61Zr57LlPs+5kFUzSX+wK7bpXMwUW5t11V
         NUalNVYP5O1xvw2Q+NjErOpWjRMV+N9U8GjOJVX74YSyg7BY4XuCp4X6T+GquzaG4m64
         FxUzjBd0yVKMvWfPzBPcvNWMSYHXx3GWrUaTN2UecjPoRWkJINirFOEQz/AlBQiwkLwY
         tUOA==
X-Gm-Message-State: AO0yUKUhchH+elB2C7zISw5QN1//IVHL2sJfCUnuI0DZpN61lYnszEsY
        0Gml0kg1RYh+1Wlg1H4ZpcBgkA==
X-Google-Smtp-Source: AK7set+Zu22sADB+ygZqU33idv6apRiqPIxafLFySyrGm+MEfZh42BzQ/CpNwhVofHlmGbEDVvp7aA==
X-Received: by 2002:a5d:6950:0:b0:2c3:f7f1:e703 with SMTP id r16-20020a5d6950000000b002c3f7f1e703mr8659183wrw.67.1675881279891;
        Wed, 08 Feb 2023 10:34:39 -0800 (PST)
Received: from hackbox.lan ([94.52.112.99])
        by smtp.gmail.com with ESMTPSA id v1-20020adf8b41000000b002be505ab59asm14591304wra.97.2023.02.08.10.34.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Feb 2023 10:34:39 -0800 (PST)
From:   Abel Vesa <abel.vesa@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        "vkoul@kernel.org" <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Johan Hovold <johan+linaro@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-phy@lists.infradead.org
Subject: [PATCH v6 4/6] phy: qcom-qmp: pcs-usb: Add v6 register offsets
Date:   Wed,  8 Feb 2023 20:34:19 +0200
Message-Id: <20230208183421.2874423-5-abel.vesa@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230208183421.2874423-1-abel.vesa@linaro.org>
References: <20230208183421.2874423-1-abel.vesa@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The new SM8550 SoC bumps up the HW version of QMP phy to v6 for USB.
Add the new PCS USB specific offsets in a dedicated header file.

Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---

The v5 version of this patch was here:
https://lore.kernel.org/all/20230207114024.944314-5-abel.vesa@linaro.org/

Changes since v5:
 * none

Changes since v4:
 * none

Changes since v3:
 * none

Changes since v2:
 * none

Changes since v1:
 * split all the offsets into separate patches, like Vinod suggested


 drivers/phy/qualcomm/phy-qcom-qmp-combo.c     |  1 +
 .../phy/qualcomm/phy-qcom-qmp-pcs-usb-v6.h    | 31 +++++++++++++++++++
 2 files changed, 32 insertions(+)
 create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-pcs-usb-v6.h

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
index 82b46f4c6df0..1cf643cb0218 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
@@ -26,6 +26,7 @@
 #include "phy-qcom-qmp-pcs-misc-v3.h"
 #include "phy-qcom-qmp-pcs-usb-v4.h"
 #include "phy-qcom-qmp-pcs-usb-v5.h"
+#include "phy-qcom-qmp-pcs-usb-v6.h"
 
 /* QPHY_SW_RESET bit */
 #define SW_RESET				BIT(0)
diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcs-usb-v6.h b/drivers/phy/qualcomm/phy-qcom-qmp-pcs-usb-v6.h
new file mode 100644
index 000000000000..9510e63ba9d8
--- /dev/null
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcs-usb-v6.h
@@ -0,0 +1,31 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2022, The Linux Foundation. All rights reserved.
+ */
+
+#ifndef QCOM_PHY_QMP_PCS_USB_V6_H_
+#define QCOM_PHY_QMP_PCS_USB_V6_H_
+
+/* Only for QMP V6 PHY - USB3 have different offsets than V5 */
+#define QPHY_USB_V6_PCS_LOCK_DETECT_CONFIG1		0xc4
+#define QPHY_USB_V6_PCS_LOCK_DETECT_CONFIG2		0xc8
+#define QPHY_USB_V6_PCS_LOCK_DETECT_CONFIG3		0xcc
+#define QPHY_USB_V6_PCS_LOCK_DETECT_CONFIG6		0xd8
+#define QPHY_USB_V6_PCS_REFGEN_REQ_CONFIG1		0xdc
+#define QPHY_USB_V6_PCS_USB3_POWER_STATE_CONFIG1	0x90
+#define QPHY_USB_V6_PCS_RX_SIGDET_LVL			0x188
+#define QPHY_USB_V6_PCS_RCVR_DTCT_DLY_P1U2_L		0x190
+#define QPHY_USB_V6_PCS_RCVR_DTCT_DLY_P1U2_H		0x194
+#define QPHY_USB_V6_PCS_CDR_RESET_TIME			0x1b0
+#define QPHY_USB_V6_PCS_ALIGN_DETECT_CONFIG1		0x1c0
+#define QPHY_USB_V6_PCS_ALIGN_DETECT_CONFIG2		0x1c4
+#define QPHY_USB_V6_PCS_PCS_TX_RX_CONFIG		0x1d0
+#define QPHY_USB_V6_PCS_EQ_CONFIG1			0x1dc
+#define QPHY_USB_V6_PCS_EQ_CONFIG5			0x1ec
+
+#define QPHY_USB_V6_PCS_USB3_LFPS_DET_HIGH_COUNT_VAL	0x18
+#define QPHY_USB_V6_PCS_USB3_RXEQTRAINING_DFE_TIME_S2	0x3c
+#define QPHY_USB_V6_PCS_USB3_RCVR_DTCT_DLY_U3_L		0x40
+#define QPHY_USB_V6_PCS_USB3_RCVR_DTCT_DLY_U3_H		0x44
+
+#endif
-- 
2.34.1

