Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8B9CF2E7FF7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 31 Dec 2020 13:39:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726599AbgLaMjD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 31 Dec 2020 07:39:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59182 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726354AbgLaMjC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 31 Dec 2020 07:39:02 -0500
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5FBD3C06179E
        for <linux-arm-msm@vger.kernel.org>; Thu, 31 Dec 2020 04:37:51 -0800 (PST)
Received: by mail-lf1-x12b.google.com with SMTP id 23so43756991lfg.10
        for <linux-arm-msm@vger.kernel.org>; Thu, 31 Dec 2020 04:37:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=6QTU6XyhJE+Fe8Pu0vmTbS/Aow1jSJFhTkSe7oTaHFI=;
        b=nJ3yJiwOMzFiC7KyjRxfeHxyxx+YJ+4PmUFA9hnkhORAXYebdiYItOtvgxQUEAqVCU
         Hxnux0d0LWRD99BJt+toHAJMPLjRy+DqFyD7tOS/FEcJZErX1MzLdEG+91J1lqVIjw+R
         7BUaFs2VzlG382uaudijQU+v3lCHYWum+7GG3Muqsqe1xDcH50fHtqsqLWzw8QEq4cJM
         ZVxpoSRXyfBonHHZ3IlPOP0Ygece1nE5FoDRSjJGoUAfUBHTUhwMVAHbRvH0iN74WMAh
         7d1a9fDpU7uKB7+xloCE8nFg0q3cyoe87YWwij57Q/2Fc+OfN4xi12Lyr4kzNpiuHE6z
         lTBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6QTU6XyhJE+Fe8Pu0vmTbS/Aow1jSJFhTkSe7oTaHFI=;
        b=W9cjU5T13Y95xT1KGL1f3Ga0WiwJRExWTV+1ESfuk8Qv95EAOLlsFxamGk1ZSBKYwQ
         pxio9SUOyOLnhJTVTF9unKJ36NTgLsFXD3hhN5E+jnpRW6kdVIWochcEm/U+NR2pXr8B
         3712zyL4s9e97nUB6rQTOrTTGthW+cFEF17zD3VmSKldetmJIIN9uQPUzD6bG8SDi2ow
         guR7+CS0mqFVXXPF+o9aJRl51N8sc8QtbJL+6IToTSsfJ0GW5uFj8TKLQDtZMkO7vB1z
         TAx1kL8mXzcIj5Gfa34NUffApeM/Rx2HBbGoKPfBf8wrcJJzwVZn/rbyd3UM/1c92dK3
         cGbA==
X-Gm-Message-State: AOAM531V6n5df/VAb4TKAb3wbuwuP572DYJ0gCQLd/eZKPS5gKCzDSyo
        0HREeao+kanC+THyMQo7iA0s8gFGFJSLOQ==
X-Google-Smtp-Source: ABdhPJz8H5ZtFU2P3yy7TEmeA0TAVunfwPbwE9gQiSCMSKfHwKB5nzuLRSovXsgN8vgZfD9+J4tU2w==
X-Received: by 2002:a05:6512:3748:: with SMTP id a8mr11506764lfs.31.1609418269931;
        Thu, 31 Dec 2020 04:37:49 -0800 (PST)
Received: from eriador.lumag.spb.ru ([94.25.228.115])
        by smtp.gmail.com with ESMTPSA id o11sm6228624lfi.267.2020.12.31.04.37.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Dec 2020 04:37:49 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Cc:     linux-arm-msm@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        linux-pci@vger.kernel.org
Subject: [PATCH v3 2/2] PCI: qcom: add support for ddrss_sf_tbu clock
Date:   Thu, 31 Dec 2020 15:37:31 +0300
Message-Id: <20201231123731.651908-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201231123731.651908-1-dmitry.baryshkov@linaro.org>
References: <20201231123731.651908-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On SM8250 additional clock is required for PCIe devices to access NOC.
Update PCIe controller driver to control this clock.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Fixes: e1dd639e374a ("PCI: qcom: Add SM8250 SoC support")
---
 drivers/pci/controller/dwc/pcie-qcom.c | 23 ++++++++++++++++++++---
 1 file changed, 20 insertions(+), 3 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
index affa2713bf80..84c5a0a897dd 100644
--- a/drivers/pci/controller/dwc/pcie-qcom.c
+++ b/drivers/pci/controller/dwc/pcie-qcom.c
@@ -159,8 +159,9 @@ struct qcom_pcie_resources_2_3_3 {
 	struct reset_control *rst[7];
 };
 
+#define QCOM_PCIE_2_7_0_MAX_CLOCKS	6
 struct qcom_pcie_resources_2_7_0 {
-	struct clk_bulk_data clks[6];
+	struct clk_bulk_data clks[QCOM_PCIE_2_7_0_MAX_CLOCKS + 1]; /* + 1 for sf_tbu */
 	struct regulator_bulk_data supplies[2];
 	struct reset_control *pci_reset;
 	struct clk *pipe_clk;
@@ -1153,7 +1154,7 @@ static int qcom_pcie_get_resources_2_7_0(struct qcom_pcie *pcie)
 	res->clks[4].id = "slave_q2a";
 	res->clks[5].id = "tbu";
 
-	ret = devm_clk_bulk_get(dev, ARRAY_SIZE(res->clks), res->clks);
+	ret = devm_clk_bulk_get(dev, QCOM_PCIE_2_7_0_MAX_CLOCKS, res->clks);
 	if (ret < 0)
 		return ret;
 
@@ -1161,6 +1162,22 @@ static int qcom_pcie_get_resources_2_7_0(struct qcom_pcie *pcie)
 	return PTR_ERR_OR_ZERO(res->pipe_clk);
 }
 
+static int qcom_pcie_get_resources_1_9_0(struct qcom_pcie *pcie)
+{
+	struct qcom_pcie_resources_2_7_0 *res = &pcie->res.v2_7_0;
+	struct dw_pcie *pci = pcie->pci;
+	struct device *dev = pci->dev;
+	int ret;
+
+	ret = qcom_pcie_get_resources_2_7_0(pcie);
+	if (ret < 0)
+		return ret;
+
+	/* Required clock for SM8250 */
+	res->clks[6].clk = devm_clk_get_optional(dev, "ddrss_sf_tbu");
+	return PTR_ERR_OR_ZERO(res->clks[6].clk);
+}
+
 static int qcom_pcie_init_2_7_0(struct qcom_pcie *pcie)
 {
 	struct qcom_pcie_resources_2_7_0 *res = &pcie->res.v2_7_0;
@@ -1437,7 +1454,7 @@ static const struct qcom_pcie_ops ops_2_7_0 = {
 
 /* Qcom IP rev.: 1.9.0 */
 static const struct qcom_pcie_ops ops_1_9_0 = {
-	.get_resources = qcom_pcie_get_resources_2_7_0,
+	.get_resources = qcom_pcie_get_resources_1_9_0,
 	.init = qcom_pcie_init_2_7_0,
 	.deinit = qcom_pcie_deinit_2_7_0,
 	.ltssm_enable = qcom_pcie_2_3_2_ltssm_enable,
-- 
2.29.2

