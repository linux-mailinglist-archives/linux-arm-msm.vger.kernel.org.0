Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 258B449D537
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Jan 2022 23:18:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233197AbiAZWSY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 26 Jan 2022 17:18:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55186 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233126AbiAZWSY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 26 Jan 2022 17:18:24 -0500
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E36BFC061751
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Jan 2022 14:18:22 -0800 (PST)
Received: by mail-pj1-x1034.google.com with SMTP id d5so929948pjk.5
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Jan 2022 14:18:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=TvAg1xHZI1QjfE0M/idYsUOkdgyiQc9M7Ozsk6troqQ=;
        b=beBp5Pwo2AoqU6AjJs6BL8bOpl5i/hoEJpp+loI7jz99JgUQUadlq9iDfPNzerf35q
         TfxJ50isloRxSTSYN0mfuON7Motw3CbzwxqKiX3RgRWdIvc1VYsTc4KiVFtNrtegD1F2
         hYpuoBKGtr5LYvVXCzqp0EE/fcn9SUT0sfY3KcELCZyC44L6cQ7ineKr+k4aSb9DBOLW
         0ITMmLqELAAm5MSJdJQhs6FUaOGRO7kJ/WND1XqBRMr2MOz1dttl9oMf94g4q7Cl09c5
         SXsnUPoP9uvM9KB5OFPm3xRvLeP+NQW4it3Rp0eOwlGfEdnHphc7ldNpU3I9fgcDD3Rj
         ODjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=TvAg1xHZI1QjfE0M/idYsUOkdgyiQc9M7Ozsk6troqQ=;
        b=buYoGVw1N26/XYQHofcCzrcxnU1MfbuARkRyqBG/FteiiFhrhC4IGiBCaJmdQANZ6+
         o5bdawo3Eg1pvrsCecgbXm78zAmG3PBND03noVbDCE0DMhe1vkJgQZx/UjfpOVmzCVZb
         vBH6z9K723zvEPBzy4NOCOwtc18vZcShFbEZJ0e8JpXBXz0/hj56pBhW67R1g3Qwczo6
         9TBEaVKxtviuwD8WDnrRXuI8yih0iY6Oa02qGhS5VSOC+RwdsdnDf4HdaU3b/R9chiv7
         x5OKtZO8MWp44frpeVGqH4dZFaaHc1m4Si+iLVgjwfyDsuCHW0b8VRddkZf+L0IdIVFt
         rJrA==
X-Gm-Message-State: AOAM533Ts8Byu2v//Wx+v/TaW9aRHUvIsaMFhOSdh/vbkwc6XZb8FQ1i
        zFUoDh1iN4/GfGUvKiBZrwpmAAwmV9FJ0own
X-Google-Smtp-Source: ABdhPJxJleh1CqUwc2Rlq4VfwmCRx3TJyN0oy5lI8/j1SY/cOObeMlJE0NPZUucZM0yinz2wVNWltg==
X-Received: by 2002:a17:902:ecd0:: with SMTP id a16mr578351plh.64.1643235502199;
        Wed, 26 Jan 2022 14:18:22 -0800 (PST)
Received: from localhost.localdomain ([2401:4900:1f3a:4e9b:8fa7:36dc:a805:c73f])
        by smtp.gmail.com with ESMTPSA id t17sm4233742pgm.69.2022.01.26.14.18.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jan 2022 14:18:21 -0800 (PST)
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
To:     linux-arm-msm@vger.kernel.org
Cc:     bhupesh.sharma@linaro.org, bhupesh.linux@gmail.com,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        robh+dt@kernel.org, agross@kernel.org, sboyd@kernel.org,
        tdas@codeaurora.org, mturquette@baylibre.com,
        linux-clk@vger.kernel.org, bjorn.andersson@linaro.org,
        davem@davemloft.net, netdev@vger.kernel.org,
        Vinod Koul <vkoul@kernel.org>
Subject: [PATCH 2/8] net: stmmac: Add support for SM8150
Date:   Thu, 27 Jan 2022 03:47:19 +0530
Message-Id: <20220126221725.710167-3-bhupesh.sharma@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220126221725.710167-1-bhupesh.sharma@linaro.org>
References: <20220126221725.710167-1-bhupesh.sharma@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Vinod Koul <vkoul@kernel.org>

This adds compatible, POR config & driver data for ethernet controller
found in SM8150 SoC.

Cc: David S. Miller <davem@davemloft.net>
Signed-off-by: Vinod Koul <vkoul@kernel.org>
[bhsharma: Massage the commit log and other cosmetic changes]
Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
---
 .../ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c   | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index 2ffa0a11eea5..8cdba9d521ec 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -183,6 +183,20 @@ static const struct ethqos_emac_driver_data emac_v2_3_0_data = {
 	.num_por = ARRAY_SIZE(emac_v2_3_0_por),
 };
 
+static const struct ethqos_emac_por emac_v2_1_0_por[] = {
+	{ .offset = RGMII_IO_MACRO_CONFIG,	.value = 0x40C01343 },
+	{ .offset = SDCC_HC_REG_DLL_CONFIG,	.value = 0x2004642C },
+	{ .offset = SDCC_HC_REG_DDR_CONFIG,	.value = 0x00000000 },
+	{ .offset = SDCC_HC_REG_DLL_CONFIG2,	.value = 0x00200000 },
+	{ .offset = SDCC_USR_CTL,		.value = 0x00010800 },
+	{ .offset = RGMII_IO_MACRO_CONFIG2,	.value = 0x00002060 },
+};
+
+static const struct ethqos_emac_driver_data emac_v2_1_0_data = {
+	.por = emac_v2_1_0_por,
+	.num_por = ARRAY_SIZE(emac_v2_1_0_por),
+};
+
 static int ethqos_dll_configure(struct qcom_ethqos *ethqos)
 {
 	unsigned int val;
@@ -558,6 +572,7 @@ static int qcom_ethqos_remove(struct platform_device *pdev)
 
 static const struct of_device_id qcom_ethqos_match[] = {
 	{ .compatible = "qcom,qcs404-ethqos", .data = &emac_v2_3_0_data},
+	{ .compatible = "qcom,sm8150-ethqos", .data = &emac_v2_1_0_data},
 	{ }
 };
 MODULE_DEVICE_TABLE(of, qcom_ethqos_match);
-- 
2.34.1

