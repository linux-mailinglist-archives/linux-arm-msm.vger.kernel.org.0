Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DAB424C1C32
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Feb 2022 20:30:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244418AbiBWTa5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 23 Feb 2022 14:30:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48472 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244414AbiBWTa4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 23 Feb 2022 14:30:56 -0500
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED0AA48306
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Feb 2022 11:30:27 -0800 (PST)
Received: by mail-pj1-x1033.google.com with SMTP id p3-20020a17090a680300b001bbfb9d760eso3543385pjj.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Feb 2022 11:30:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=gmWYJaZH0pWHKwabinI0WhAjRwdcBswrTeeHUNfVOaA=;
        b=PbntmI/G2Aaq9TqIEomUhmWhHYSJbpwjOWbmHHWQVSOUVXNw6mSpnXrAKiYn5/If4l
         sBYQ6WYeA07YijSmZadDt2WpvxLPCvzXtVf2RZ4oIPgrb5gf5GY2YturP7O5uiGw6Pjj
         eG1jMb2PzA5LtHNi4KG83KCjVvt+o3zMaD4Y+T3jtGhc1Uro6KLGEqagaXpN4jRNppFk
         Lzz5+3WJGVeq02vKirWAXTZokY390Xz3i7+Mp3UTAKqmEnrNiFPIYQ4xyCvGDHpcdyBB
         X/RBZM921JaroIMa2sq8FASBqommKt0IyIPbvAeiho1NyB90ycxSIsHRKxcBKLlm4dqj
         CGPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=gmWYJaZH0pWHKwabinI0WhAjRwdcBswrTeeHUNfVOaA=;
        b=eY+hD4h1R1KYLEOq2lwePVqq7MlrE/ySk4lq/QgdaeWIaja1wqoWYhWWAhKnsJfUdq
         Ov5ORKIhAQBaniN+V8iGDAbGpGFGWvYzn32/t2aQWUIasrr1Xe0Dweyyl704F0Ae/myF
         ZZNkg4gTJ2HCadfhoh/q5ghZSMn54cTGTobykzvwleYu4FBmC8b0POL09Heg9dqX1IDc
         iNOBlaZiZZ46FL/6e5Q+JwgO7IBPSEdJfVP9dzyJADexPdrn3KjUji8bJQKAmKOTu7Uc
         s709xuBnmxY4DskAFxmTxlRIzL6mrhZmtz+bw5S+MNjjkEX8+uQQ/w0qOeW/upPZryKx
         oUgA==
X-Gm-Message-State: AOAM533axqTimh0trUr//i8lJ/hm5jgjDUrL/gvYhmIzqFtzLO+b+ibk
        LiQq3/eqKJJ5nhUO5CuQuMhX+rGyeNbCHg==
X-Google-Smtp-Source: ABdhPJxERevxcp24hBmYvyqpNCQhJKTRFC8wDm1bWevHRnre7u45Nhb4fXOylS461EMTj0vD8Nq5sQ==
X-Received: by 2002:a17:90a:4542:b0:1b9:bc2a:910f with SMTP id r2-20020a17090a454200b001b9bc2a910fmr857597pjm.133.1645644627164;
        Wed, 23 Feb 2022 11:30:27 -0800 (PST)
Received: from localhost.localdomain ([2402:3a80:180f:6b3c:fda0:57e9:7d44:2aa7])
        by smtp.gmail.com with ESMTPSA id z10-20020a17090a8b8a00b001b8d20074c8sm3719917pjn.33.2022.02.23.11.30.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Feb 2022 11:30:26 -0800 (PST)
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
To:     linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org
Cc:     bhupesh.sharma@linaro.org, bhupesh.linux@gmail.com,
        lorenzo.pieralisi@arm.com, agross@kernel.org,
        bjorn.andersson@linaro.org, svarbanov@mm-sol.com,
        bhelgaas@google.com, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, robh+dt@kernel.org,
        Vinod Koul <vkoul@kernel.org>
Subject: [PATCH 4/6] PCI: qcom: Add SM8150 SoC support
Date:   Thu, 24 Feb 2022 00:59:44 +0530
Message-Id: <20220223192946.473172-5-bhupesh.sharma@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220223192946.473172-1-bhupesh.sharma@linaro.org>
References: <20220223192946.473172-1-bhupesh.sharma@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The PCIe IP (rev 1.5.0) on SM8150 SoC is similar to the one used on
SM8250. Hence the support is added reusing the members of ops_2_7_0.

Cc: Vinod Koul <vkoul@kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>
Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
---
 drivers/pci/controller/dwc/pcie-qcom.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
index c19cd506ed3f..66fbc0234888 100644
--- a/drivers/pci/controller/dwc/pcie-qcom.c
+++ b/drivers/pci/controller/dwc/pcie-qcom.c
@@ -1487,6 +1487,17 @@ static const struct qcom_pcie_ops ops_1_9_0 = {
 	.config_sid = qcom_pcie_config_sid_sm8250,
 };
 
+/* Qcom IP rev.: 1.5.0 */
+static const struct qcom_pcie_ops ops_1_5_0 = {
+	.get_resources = qcom_pcie_get_resources_2_7_0,
+	.init = qcom_pcie_init_2_7_0,
+	.deinit = qcom_pcie_deinit_2_7_0,
+	.ltssm_enable = qcom_pcie_2_3_2_ltssm_enable,
+	.post_init = qcom_pcie_post_init_2_7_0,
+	.post_deinit = qcom_pcie_post_deinit_2_7_0,
+	.config_sid = qcom_pcie_config_sid_sm8250,
+};
+
 static const struct qcom_pcie_cfg apq8084_cfg = {
 	.ops = &ops_1_0_0,
 };
@@ -1511,6 +1522,10 @@ static const struct qcom_pcie_cfg sdm845_cfg = {
 	.ops = &ops_2_7_0,
 };
 
+static const struct qcom_pcie_cfg sm8150_cfg = {
+	.ops = &ops_1_5_0,
+};
+
 static const struct qcom_pcie_cfg sm8250_cfg = {
 	.ops = &ops_1_9_0,
 };
@@ -1626,6 +1641,7 @@ static const struct of_device_id qcom_pcie_match[] = {
 	{ .compatible = "qcom,pcie-ipq4019", .data = &ipq4019_cfg },
 	{ .compatible = "qcom,pcie-qcs404", .data = &ipq4019_cfg },
 	{ .compatible = "qcom,pcie-sdm845", .data = &sdm845_cfg },
+	{ .compatible = "qcom,pcie-sm8150", .data = &sm8150_cfg },
 	{ .compatible = "qcom,pcie-sm8250", .data = &sm8250_cfg },
 	{ .compatible = "qcom,pcie-sc8180x", .data = &sm8250_cfg },
 	{ .compatible = "qcom,pcie-sc7280", .data = &sc7280_cfg },
-- 
2.35.1

