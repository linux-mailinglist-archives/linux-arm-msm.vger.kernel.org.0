Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7C5205F0AB0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Sep 2022 13:38:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231582AbiI3LiW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 30 Sep 2022 07:38:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36376 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231590AbiI3Lhu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 30 Sep 2022 07:37:50 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C033CB39
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Sep 2022 04:29:32 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id k10so6423819lfm.4
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Sep 2022 04:29:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=er+Zi88jgLoyNNSO1jcMV3tpr4YOGZUNMhh5NotGMDc=;
        b=awktRX9xRITgnABx60mzx07mn+4s87U7AivmL4L7y+qDaRdpxyaR+NnFPgm0g7H6BM
         iBN4UuXPxlCEVN0k6ZU1cbtsRoLa3LFODWDCa4iC/tJoeY5RF/pJOMaog59ZLIeCk8SS
         k67Z6PkA3VgwRLay9pSIc+DuTbiDqSiPIAhYFPEr6b9kQ0fb2paW2XOaApqn8qVFDhve
         xxporFYOuSe2rWXasqxa5uQroXpni9zFWFHmg8ozATcVIBcZn7Qy8FbNNjxoUjNo4JXA
         kosZUHPP/efOv5ao+gXYyCOjPvj6h0yD5tKFaFXleu2kn4+v8Tzb+t7jYT/hM2LRNVt0
         wfAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=er+Zi88jgLoyNNSO1jcMV3tpr4YOGZUNMhh5NotGMDc=;
        b=fr7OK05LmPgb/jxsVPxmMJ3Fxl1oOOim+IcKDxaoCbTEDS7X+G5CYqji7foxKWXWTp
         qDKGdq+Mg58yeT+FhBTn2nZ4+Qa/AEyy4pScy5kuI03mbVUpB7VWyjy5PAI1OhPoiR4Q
         vwoCiKBj64/wHgkQzCeRcE2t0kv5PmoPLI7RdP/LqBoKJwSHfsj7wBa2gxnLrK6HwGHy
         lrppah6C/598vLEFZLmkNpNdalvjiKUByrNqrIyD3iXFhGORwEgLrPtpJEDyzZYV7q3G
         QGUJFG9njkKHlGWF4FrvNMUdAqVZd9WIqxoPIj+0nbAEVzq6ts97capo2hObc7kAVz8z
         qXag==
X-Gm-Message-State: ACrzQf2GTlTFwKWEO0P/b8eSU6vUA8JaCqiKjsYTNseSu444mveIwq4r
        omg2Mg9NmcABULSAyhrvvz4aCydTbBhmtA==
X-Google-Smtp-Source: AMsMyM5QQUwLyxpCdsyV5GfeHyrAuidDgro2QZiFcsr6dFI+abw86x3T4O18fvq3it+krRTTzOzFaA==
X-Received: by 2002:a05:6512:3d28:b0:49f:4b31:909b with SMTP id d40-20020a0565123d2800b0049f4b31909bmr3035176lfv.669.1664537370225;
        Fri, 30 Sep 2022 04:29:30 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id v18-20020a197412000000b0049493c14b17sm264672lfe.181.2022.09.30.04.29.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Sep 2022 04:29:29 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org
Subject: [PATCH v2 03/12] phy: qcom-qmp-pcie-msm8996: rework regs layout arrays
Date:   Fri, 30 Sep 2022 14:29:17 +0300
Message-Id: <20220930112926.638543-4-dmitry.baryshkov@linaro.org>
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
 drivers/phy/qualcomm/phy-qcom-qmp-pcie-msm8996.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcie-msm8996.c b/drivers/phy/qualcomm/phy-qcom-qmp-pcie-msm8996.c
index 5fdd85a1dc3e..665014955a18 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-pcie-msm8996.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcie-msm8996.c
@@ -100,9 +100,9 @@ static const unsigned int pciephy_regs_layout[QPHY_LAYOUT_SIZE] = {
 	[QPHY_COM_POWER_DOWN_CONTROL]	= 0x404,
 	[QPHY_COM_START_CONTROL]	= 0x408,
 	[QPHY_COM_PCS_READY_STATUS]	= 0x448,
-	[QPHY_SW_RESET]			= 0x00,
-	[QPHY_START_CTRL]		= 0x08,
-	[QPHY_PCS_STATUS]		= 0x174,
+	[QPHY_SW_RESET]			= QPHY_V2_PCS_SW_RESET,
+	[QPHY_START_CTRL]		= QPHY_V2_PCS_START_CONTROL,
+	[QPHY_PCS_STATUS]		= QPHY_V2_PCS_PCI_PCS_STATUS,
 };
 
 static const struct qmp_phy_init_tbl msm8996_pcie_serdes_tbl[] = {
-- 
2.35.1

