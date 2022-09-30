Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6BF7D5F0AB9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Sep 2022 13:39:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231804AbiI3Lie (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 30 Sep 2022 07:38:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57034 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231693AbiI3LiC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 30 Sep 2022 07:38:02 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2817725E89
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Sep 2022 04:29:38 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id c2so45360lfb.10
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Sep 2022 04:29:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=rhKbdwst/BpiiCM8rfoNFs8xFLwWZ1VpBtGfoWNHjyY=;
        b=SbDF+xVR5lG7PY23ZXYceZysJ4jjy4ueblk/PkL9nDhZzMVv3K6lsIecR3CSU6yfzH
         qMcsUiIWFD4g9z2dgF8lWDT+SpFz/MvhYoMFwQKxTeXAaYKYTLsT85fTCj+s/y9EDFJy
         EVUtv42B81iIVvNckcttXFKgOkVuH91iUOvhEHrS/BWjaUe8mcri2BGcaI4Ru4YVcYqj
         g5S5qmEG6avIZ4hjdIhSNUDHUxu2+awGRl7LRJf+v6QTuPcNKjOMyHzTferufPI5XCqa
         oF1tQmFuYcapB6WsczpFhSlds2scE/FnyZkJx76rs1O1ubQfb7+fYYjxKK2qX3cbEqYZ
         8meA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=rhKbdwst/BpiiCM8rfoNFs8xFLwWZ1VpBtGfoWNHjyY=;
        b=Ye6HnBpNpn5ldrretASIQJzJoL7i4k49g+t+wtXvp81HRA4e+RvDTZQdkddveJ/ZwO
         jzgNrz9uIpOBCKNulmwbSP3gJ0Uv0y+mr0tgI+RR8pJMYqTMRag60FwTuFM2L6VphZLN
         aqln9aguIl6Sk/VvoPvfjFWzqtK2zRphZ66IffZMeeJxAScxwCP2+k0ogkB020EEa9FR
         22EEIoy4uCZsdNAT5iHgwYv5qM6w5D+p3tAlQyRwAp/0ZflZCon5HRv8bPctSTzfhHu+
         V8o4GfGzfGZKUxkg6LWTbv7BZd0kehgAsCSR/dmLqIhuW1xJugQRxDoD8tshQdW0iVPu
         NwpQ==
X-Gm-Message-State: ACrzQf0qP9ryRD4govZpDakI7OTmQ6InN/SzLyYoxzGIvRsKWKuKQgvk
        PKZKYQzKvEaayOgN+Iq0z8bMtQ==
X-Google-Smtp-Source: AMsMyM4cKowmpUdWeUiIIEkz3wvzEVVMQC87WqGvRP4Ku9XEeyOduLgiNZSeB36AwyaVWSUeHyYbJQ==
X-Received: by 2002:a05:6512:3054:b0:49f:f05:1fa5 with SMTP id b20-20020a056512305400b0049f0f051fa5mr2988916lfb.107.1664537376227;
        Fri, 30 Sep 2022 04:29:36 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id v18-20020a197412000000b0049493c14b17sm264672lfe.181.2022.09.30.04.29.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Sep 2022 04:29:35 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org
Subject: [PATCH v2 11/12] phy: qcom-qmp-combo: rework regs layout arrays
Date:   Fri, 30 Sep 2022 14:29:25 +0300
Message-Id: <20220930112926.638543-12-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220930112926.638543-1-dmitry.baryshkov@linaro.org>
References: <20220930112926.638543-1-dmitry.baryshkov@linaro.org>
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

Use symbolic names for the values inside reg layout arrays. New register
names are added following the PCS register layout that is used by the
particular PHY.

Note: ipq8074 tables appear to use a mixture of v2 and v3 registers.
This might need additional fixes.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 24 +++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
index cf675a00e391..0561df216fb1 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
@@ -114,23 +114,23 @@ enum qphy_reg_layout {
 };
 
 static const unsigned int qmp_v3_usb3phy_regs_layout[QPHY_LAYOUT_SIZE] = {
-	[QPHY_SW_RESET]			= 0x00,
-	[QPHY_START_CTRL]		= 0x08,
-	[QPHY_PCS_STATUS]		= 0x174,
-	[QPHY_PCS_POWER_DOWN_CONTROL]	= 0x04,
-	[QPHY_PCS_AUTONOMOUS_MODE_CTRL]	= 0x0d8,
-	[QPHY_PCS_LFPS_RXTERM_IRQ_CLEAR]  = 0x0dc,
+	[QPHY_SW_RESET]			= QPHY_V3_PCS_SW_RESET,
+	[QPHY_START_CTRL]		= QPHY_V3_PCS_START_CONTROL,
+	[QPHY_PCS_STATUS]		= QPHY_V3_PCS_PCS_STATUS,
+	[QPHY_PCS_POWER_DOWN_CONTROL]	= QPHY_V3_PCS_POWER_DOWN_CONTROL,
+	[QPHY_PCS_AUTONOMOUS_MODE_CTRL]	= QPHY_V3_PCS_AUTONOMOUS_MODE_CTRL,
+	[QPHY_PCS_LFPS_RXTERM_IRQ_CLEAR] = QPHY_V3_PCS_LFPS_RXTERM_IRQ_CLEAR,
 };
 
 static const unsigned int qmp_v4_usb3phy_regs_layout[QPHY_LAYOUT_SIZE] = {
-	[QPHY_SW_RESET]			= 0x00,
-	[QPHY_START_CTRL]		= 0x44,
-	[QPHY_PCS_STATUS]		= 0x14,
-	[QPHY_PCS_POWER_DOWN_CONTROL]	= 0x40,
+	[QPHY_SW_RESET]			= QPHY_V4_PCS_SW_RESET,
+	[QPHY_START_CTRL]		= QPHY_V4_PCS_START_CONTROL,
+	[QPHY_PCS_STATUS]		= QPHY_V4_PCS_PCS_STATUS1,
+	[QPHY_PCS_POWER_DOWN_CONTROL]	= QPHY_V4_PCS_POWER_DOWN_CONTROL,
 
 	/* In PCS_USB */
-	[QPHY_PCS_AUTONOMOUS_MODE_CTRL]	= 0x008,
-	[QPHY_PCS_LFPS_RXTERM_IRQ_CLEAR] = 0x014,
+	[QPHY_PCS_AUTONOMOUS_MODE_CTRL]	= QPHY_V4_PCS_USB3_AUTONOMOUS_MODE_CTRL,
+	[QPHY_PCS_LFPS_RXTERM_IRQ_CLEAR] = QPHY_V4_PCS_USB3_LFPS_RXTERM_IRQ_CLEAR,
 };
 
 static const struct qmp_phy_init_tbl qmp_v3_usb3_serdes_tbl[] = {
-- 
2.35.1

