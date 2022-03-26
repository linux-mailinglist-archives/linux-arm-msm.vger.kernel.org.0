Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 03ED84E7F56
	for <lists+linux-arm-msm@lfdr.de>; Sat, 26 Mar 2022 07:08:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231470AbiCZGKO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 26 Mar 2022 02:10:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47850 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231439AbiCZGKM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 26 Mar 2022 02:10:12 -0400
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C36CA13E16F
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Mar 2022 23:08:34 -0700 (PDT)
Received: by mail-pj1-x102b.google.com with SMTP id gb19so9402727pjb.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Mar 2022 23:08:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=f7kpz2Fm2TtOMxvRIsJ+JEa+UGwV9W6igzmwpSaJ5iw=;
        b=bbZuPm/znco2TV/6BkbyFsM2fQU/y2ul0Wv435GllqLBhusv42EihYCVJj63Vdqd0x
         tawNANvaLlO/pxrkyoLYg5+GwOxnOgoAm24v3RsDfDTShEqTvzDUUbkrlza2R9d0JZZk
         6g1yGD7mgDES4nrPgUPPvZF7P07dppXybpqg5sMu04KzTpRVB7lYQY8S8cr33iUF63ZD
         Wuf+AC/mmWKj7kumt3R39GT16v1gn83yD/bzEuinUGtevNsvRxRjAsUQ7x7TJi6pZWWR
         b7vk7uMN7He7vRYXojCDek2CvD8p9t6Uh9mluCcq+V/dhd3cfGpaXde7Y8qhIl4t/KPK
         FRAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=f7kpz2Fm2TtOMxvRIsJ+JEa+UGwV9W6igzmwpSaJ5iw=;
        b=sBPBGFTUTJpUzV+IehE7nn7n8WjLmdBDCX/gDMsn6SNFKwj3GTS4FIweEnGR9EkQdk
         0HMFAhYsLaR9dIn99qzxpeOCe1RSDrgF68d3DNIdupqZdEyh9OHvHAybJ3SwG6ObsTPU
         JzIwFX5/E+s0ohnzHG39Z6tny/s15mMKqAXfMIJHlLhK+FCAKjy3+h1JROV80nMhlhtx
         0ijl8qEh60P3hPE8Rt6+CnQjQ2QwlGR7te8yvD4jLHOG2tX0LV7I3QXt+n9FTmfHQYrz
         U+6XQX4mk1pS3JZ40DGGrRuMFLN64j/vLW7w1OhiC6gIs4UV1of2WjHNR5BCoHfSYQZu
         1Z9A==
X-Gm-Message-State: AOAM530oI92xgp+l6/cEa+gAeWkGD5aQvOn8WErnMUy8emnZNfdFOyfi
        iQWk33ftkET6suYxf4YyiAwQ0Q==
X-Google-Smtp-Source: ABdhPJzvMSzEPur0lofPwMM9mHaOCtDMUQTqgdut/Whi9XGxqkVH9zJLqoglXmu8o+BMrZD6x2i7CA==
X-Received: by 2002:a17:90a:e7c6:b0:1c7:443:3fdf with SMTP id kb6-20020a17090ae7c600b001c704433fdfmr29142182pjb.3.1648274914144;
        Fri, 25 Mar 2022 23:08:34 -0700 (PDT)
Received: from localhost.localdomain ([223.233.78.42])
        by smtp.gmail.com with ESMTPSA id p26-20020a63951a000000b003826aff3e41sm6944959pgd.33.2022.03.25.23.08.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Mar 2022 23:08:33 -0700 (PDT)
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
To:     linux-pci@vger.kernel.org
Cc:     bhupesh.sharma@linaro.org, bhupesh.linux@gmail.com,
        lorenzo.pieralisi@arm.com, agross@kernel.org,
        bjorn.andersson@linaro.org, svarbanov@mm-sol.com,
        bhelgaas@google.com, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        robh+dt@kernel.org, Vinod Koul <vkoul@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v4 2/2] PCI: qcom: Add SM8150 SoC support
Date:   Sat, 26 Mar 2022 11:38:10 +0530
Message-Id: <20220326060810.1797516-3-bhupesh.sharma@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220326060810.1797516-1-bhupesh.sharma@linaro.org>
References: <20220326060810.1797516-1-bhupesh.sharma@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The PCIe IP (rev 1.5.0) on SM8150 SoC is similar to the one used on
SM8250. Hence the support is added reusing the members of ops_1_9_0.

Cc: Vinod Koul <vkoul@kernel.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
---
 drivers/pci/controller/dwc/pcie-qcom.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
index 6ab90891801d..375f27ab9403 100644
--- a/drivers/pci/controller/dwc/pcie-qcom.c
+++ b/drivers/pci/controller/dwc/pcie-qcom.c
@@ -1523,6 +1523,13 @@ static const struct qcom_pcie_cfg sdm845_cfg = {
 	.has_tbu_clk = true,
 };
 
+static const struct qcom_pcie_cfg sm8150_cfg = {
+	/* sm8150 has qcom IP rev 1.5.0. However 1.5.0 ops are same as
+	 * 1.9.0, so reuse the same.
+	 */
+	.ops = &ops_1_9_0,
+};
+
 static const struct qcom_pcie_cfg sm8250_cfg = {
 	.ops = &ops_1_9_0,
 	.has_tbu_clk = true,
@@ -1655,6 +1662,7 @@ static const struct of_device_id qcom_pcie_match[] = {
 	{ .compatible = "qcom,pcie-ipq4019", .data = &ipq4019_cfg },
 	{ .compatible = "qcom,pcie-qcs404", .data = &ipq4019_cfg },
 	{ .compatible = "qcom,pcie-sdm845", .data = &sdm845_cfg },
+	{ .compatible = "qcom,pcie-sm8150", .data = &sm8150_cfg },
 	{ .compatible = "qcom,pcie-sm8250", .data = &sm8250_cfg },
 	{ .compatible = "qcom,pcie-sc8180x", .data = &sm8250_cfg },
 	{ .compatible = "qcom,pcie-sm8450-pcie0", .data = &sm8450_pcie0_cfg },
-- 
2.35.1

