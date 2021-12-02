Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 519A6466510
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Dec 2021 15:18:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1358552AbhLBOVb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 2 Dec 2021 09:21:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33848 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1358460AbhLBOV0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 2 Dec 2021 09:21:26 -0500
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 724BDC0613FC
        for <linux-arm-msm@vger.kernel.org>; Thu,  2 Dec 2021 06:17:39 -0800 (PST)
Received: by mail-lf1-x12d.google.com with SMTP id b1so71684788lfs.13
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Dec 2021 06:17:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=IbALx0XtFk2sjvQW/onR8vjjNDCw+IRJE2J+CI3Jr4A=;
        b=vM26FWhP8DucGhwTCLKaf82GBXq5cI5vaDZXMCAv4rJO09qMGy9cMX0kNbBE89QdBT
         sjuzWiafQqWSB6H9pV7rkEzdgEoTEFG5e5jY+YP3t/quv2sUSskrt3rEedYfaSBQi1CL
         +6hdRADfEWgyk9JgMzmov82TBERRFB5CjZXK0NZ0jh5EEmw7c8rTAAi0p9Ac0UlrHOmK
         7hdN6enwb5o2tp4ZJEJ5J9ZHLVF4c4l3yxZJj38TrcWInvzXgbDfFWRATtz2w1Xz7jOD
         gxxqGU81BXsCn55+7qTkwcfq2NAJWJ1hrQRQI93L+aVklmFuSJjjBtBJYvEM1YNYmM6+
         kQZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=IbALx0XtFk2sjvQW/onR8vjjNDCw+IRJE2J+CI3Jr4A=;
        b=hx1STO7OWDkdI7Yn5Swe86PPA0lltmuNIWNENfvP1gcNqt1lqbiXK1ULHg/jYptaL6
         H8chgoY/sDZSB4UlT88bujWQQwMPwAkJdOiEmPHpCXsVxCOL8tvFc3/cc7ORUOsesvZ6
         losQva1svHP7gYQOrzN2ctugNmBLtY0NwhRhCQn/EiWEX/xENWiKE8yJhqlx+zy1NK/3
         +C70BPcYJNQ2rW4P5xCWyMIUmh26HEt0Fpce0gVhNYUzNvK5w9clnC1SiZWguWmeXEBa
         9lDno0Lu+enstPXPmgsVEIt9MKtAyTehO3C4MD9011TnqkBmUfE30PZgqIKwg7vWsFdz
         4dIQ==
X-Gm-Message-State: AOAM533sZ1/0tXjlmAD3H6HK6PCTTgXhY5tKQooNYoDhoti2qV8DbVlE
        nPEyvhwoNrwbuofStYmnGNKl9g==
X-Google-Smtp-Source: ABdhPJw3etiuLd70f0wo0mSda+F/5iX6ZiPl+cMc4WJpWS2999HymXOa7d0BTghIapMyYdzdUGAsoA==
X-Received: by 2002:a05:6512:2314:: with SMTP id o20mr12067407lfu.51.1638454657683;
        Thu, 02 Dec 2021 06:17:37 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id m15sm362487lfg.165.2021.12.02.06.17.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Dec 2021 06:17:36 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Stanimir Varbanov <svarbanov@mm-sol.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Cc:     Bjorn Helgaas <bhelgaas@google.com>,
        =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
        linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org,
        devicetree@vger.kernel.org, linux-phy@lists.infradead.org
Subject: [PATCH v1 06/10] PCI: qcom: add support for SM8450 PCIe controllers
Date:   Thu,  2 Dec 2021 17:17:22 +0300
Message-Id: <20211202141726.1796793-7-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211202141726.1796793-1-dmitry.baryshkov@linaro.org>
References: <20211202141726.1796793-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On SM8450 platform PCIe hosts do not use all the clocks (and add several
additional clocks), so expand the driver to handle these requirements.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/pci/controller/dwc/pcie-qcom.c | 56 ++++++++++++++++++++------
 1 file changed, 43 insertions(+), 13 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
index e51b313da46f..8865215b0b5c 100644
--- a/drivers/pci/controller/dwc/pcie-qcom.c
+++ b/drivers/pci/controller/dwc/pcie-qcom.c
@@ -161,7 +161,7 @@ struct qcom_pcie_resources_2_3_3 {
 
 /* 6 clocks typically, 7 for sm8250 */
 struct qcom_pcie_resources_2_7_0 {
-	struct clk_bulk_data clks[7];
+	struct clk_bulk_data clks[9];
 	int num_clks;
 	struct regulator_bulk_data supplies[2];
 	struct reset_control *pci_reset;
@@ -196,7 +196,10 @@ struct qcom_pcie_cfg {
 	const struct qcom_pcie_ops *ops;
 	/* flags for ops 2.7.0 and 1.9.0 */
 	unsigned int pipe_clk_need_muxing:1;
+	unsigned int has_tbu_clk:1;
 	unsigned int has_ddrss_sf_tbu_clk:1;
+	unsigned int has_aggre0_clk:1;
+	unsigned int has_aggre1_clk:1;
 };
 
 struct qcom_pcie {
@@ -1147,6 +1150,7 @@ static int qcom_pcie_get_resources_2_7_0(struct qcom_pcie *pcie)
 	struct qcom_pcie_resources_2_7_0 *res = &pcie->res.v2_7_0;
 	struct dw_pcie *pci = pcie->pci;
 	struct device *dev = pci->dev;
+	unsigned int idx;
 	int ret;
 
 	res->pci_reset = devm_reset_control_get_exclusive(dev, "pci");
@@ -1160,18 +1164,22 @@ static int qcom_pcie_get_resources_2_7_0(struct qcom_pcie *pcie)
 	if (ret)
 		return ret;
 
-	res->clks[0].id = "aux";
-	res->clks[1].id = "cfg";
-	res->clks[2].id = "bus_master";
-	res->clks[3].id = "bus_slave";
-	res->clks[4].id = "slave_q2a";
-	res->clks[5].id = "tbu";
-	if (pcie->cfg.has_ddrss_sf_tbu_clk) {
-		res->clks[6].id = "ddrss_sf_tbu";
-		res->num_clks = 7;
-	} else {
-		res->num_clks = 6;
-	}
+	idx = 0;
+	res->clks[idx++].id = "aux";
+	res->clks[idx++].id = "cfg";
+	res->clks[idx++].id = "bus_master";
+	res->clks[idx++].id = "bus_slave";
+	res->clks[idx++].id = "slave_q2a";
+	if (pcie->cfg.has_tbu_clk)
+		res->clks[idx++].id = "tbu";
+	if (pcie->cfg.has_ddrss_sf_tbu_clk)
+		res->clks[idx++].id = "ddrss_sf_tbu";
+	if (pcie->cfg.has_aggre0_clk)
+		res->clks[idx++].id = "aggre0";
+	if (pcie->cfg.has_aggre1_clk)
+		res->clks[idx++].id = "aggre1";
+
+	res->num_clks = idx;
 
 	ret = devm_clk_bulk_get(dev, res->num_clks, res->clks);
 	if (ret < 0)
@@ -1513,15 +1521,35 @@ static const struct qcom_pcie_cfg ipq4019_cfg = {
 
 static const struct qcom_pcie_cfg sdm845_cfg = {
 	.ops = &ops_2_7_0,
+	.has_tbu_clk = true,
 };
 
 static const struct qcom_pcie_cfg sm8250_cfg = {
+	.ops = &ops_1_9_0,
+	.has_tbu_clk = true,
+	.has_ddrss_sf_tbu_clk = true,
+};
+
+/* Only for the PCIe0! */
+static const struct qcom_pcie_cfg sm8450_cfg = {
 	.ops = &ops_1_9_0,
 	.has_ddrss_sf_tbu_clk = true,
+	.pipe_clk_need_muxing = true,
+	.has_aggre0_clk = true,
+	.has_aggre1_clk = true,
+};
+
+static const struct qcom_pcie_cfg sm8450_pcie1_cfg = {
+	.ops = &ops_1_9_0,
+	.has_ddrss_sf_tbu_clk = true,
+	.pipe_clk_need_muxing = true,
+	/* .has_aggre0_clk = false, */
+	.has_aggre1_clk = true,
 };
 
 static const struct qcom_pcie_cfg sc7280_cfg = {
 	.ops = &ops_1_9_0,
+	.has_tbu_clk = true,
 	.pipe_clk_need_muxing = true,
 };
 
@@ -1632,6 +1660,8 @@ static const struct of_device_id qcom_pcie_match[] = {
 	{ .compatible = "qcom,pcie-sdm845", .data = &sdm845_cfg },
 	{ .compatible = "qcom,pcie-sm8250", .data = &sm8250_cfg },
 	{ .compatible = "qcom,pcie-sc8180x", .data = &sm8250_cfg },
+	{ .compatible = "qcom,pcie-sm8450", .data = &sm8450_cfg },
+	{ .compatible = "qcom,pcie-sm8450-pcie1", .data = &sm8450_pcie1_cfg },
 	{ .compatible = "qcom,pcie-sc7280", .data = &sc7280_cfg },
 	{ }
 };
-- 
2.33.0

