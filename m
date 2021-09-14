Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3C19840B6B6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Sep 2021 20:20:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231848AbhINSWD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 14 Sep 2021 14:22:03 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:43664 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231758AbhINSVe (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 14 Sep 2021 14:21:34 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1631643616; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=mIxqeLoo/GPuUD0mj31fLyk30axPThs2mYxYlSiUYWo=; b=EnMVXlgtZhlsfNKbyMlb7Div6noZk+1kcCs0d/NDRMgNFBAappizaSDLa941U1G9+veOJjEG
 XxA0aB0GwUqUyJKtKsKuEFHDpYOnSlQxPLKa73HlAY7XoO3V4MnCK7PVL0cN30Dyh2nrsxhF
 5G8Dyn9ThtkheExAGNz8xWL58rE=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-east-1.postgun.com with SMTP id
 6140e7d0d914b05182d1e2e6 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 14 Sep 2021 18:20:00
 GMT
Sender: pmaliset=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 6F992C43637; Tue, 14 Sep 2021 18:19:59 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
Received: from pmaliset-linux.qualcomm.com (unknown [202.46.22.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: pmaliset)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 191D2C43618;
        Tue, 14 Sep 2021 18:19:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 191D2C43618
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=codeaurora.org
From:   Prasad Malisetty <pmaliset@codeaurora.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org, bhelgaas@google.com,
        robh+dt@kernel.org, swboyd@chromium.org, lorenzo.pieralisi@arm.com,
        svarbanov@mm-sol.com
Cc:     devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        dianders@chromium.org, mka@chromium.org, vbadigan@codeaurora.org,
        sallenki@codeaurora.org, manivannan.sadhasivam@linaro.org,
        Prasad Malisetty <pmaliset@codeaurora.org>
Subject: [PATCH v7 4/4] PCI: qcom: Switch pcie_1_pipe_clk_src after PHY init in SC7280
Date:   Tue, 14 Sep 2021 23:49:10 +0530
Message-Id: <1631643550-29960-5-git-send-email-pmaliset@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1631643550-29960-1-git-send-email-pmaliset@codeaurora.org>
References: <1631643550-29960-1-git-send-email-pmaliset@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On the SC7280, the clock source for gcc_pcie_1_pipe_clk_src
must be the TCXO while gdsc is enabled. After PHY init successful
clock source should switch to pipe clock for gcc_pcie_1_pipe_clk_src.

Signed-off-by: Prasad Malisetty <pmaliset@codeaurora.org>
---
 drivers/pci/controller/dwc/pcie-qcom.c | 90 +++++++++++++++++++++++++++++-----
 1 file changed, 79 insertions(+), 11 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
index 8a7a300..380c962 100644
--- a/drivers/pci/controller/dwc/pcie-qcom.c
+++ b/drivers/pci/controller/dwc/pcie-qcom.c
@@ -166,6 +166,9 @@ struct qcom_pcie_resources_2_7_0 {
 	struct regulator_bulk_data supplies[2];
 	struct reset_control *pci_reset;
 	struct clk *pipe_clk;
+	struct clk *gcc_pcie_1_pipe_clk_src;
+	struct clk *phy_pipe_clk;
+	struct clk *ref_clk_src;
 };
 
 union qcom_pcie_resources {
@@ -189,6 +192,11 @@ struct qcom_pcie_ops {
 	int (*config_sid)(struct qcom_pcie *pcie);
 };
 
+struct qcom_pcie_cfg {
+	const struct qcom_pcie_ops *ops;
+	bool pcie_1_pipe_clk_src_switch;
+};
+
 struct qcom_pcie {
 	struct dw_pcie *pci;
 	void __iomem *parf;			/* DT parf */
@@ -197,6 +205,7 @@ struct qcom_pcie {
 	struct phy *phy;
 	struct gpio_desc *reset;
 	const struct qcom_pcie_ops *ops;
+	bool pcie_1_pipe_clk_src_switch;
 };
 
 #define to_qcom_pcie(x)		dev_get_drvdata((x)->dev)
@@ -1167,6 +1176,20 @@ static int qcom_pcie_get_resources_2_7_0(struct qcom_pcie *pcie)
 	if (ret < 0)
 		return ret;
 
+	if (pcie->pcie_1_pipe_clk_src_switch) {
+		res->gcc_pcie_1_pipe_clk_src = devm_clk_get(dev, "pipe_mux");
+		if (IS_ERR(res->gcc_pcie_1_pipe_clk_src))
+			return PTR_ERR(res->gcc_pcie_1_pipe_clk_src);
+
+		res->phy_pipe_clk = devm_clk_get(dev, "phy_pipe");
+		if (IS_ERR(res->phy_pipe_clk))
+			return PTR_ERR(res->phy_pipe_clk);
+
+		res->ref_clk_src = devm_clk_get(dev, "ref");
+		if (IS_ERR(res->ref_clk_src))
+			return PTR_ERR(res->ref_clk_src);
+	}
+
 	res->pipe_clk = devm_clk_get(dev, "pipe");
 	return PTR_ERR_OR_ZERO(res->pipe_clk);
 }
@@ -1185,6 +1208,10 @@ static int qcom_pcie_init_2_7_0(struct qcom_pcie *pcie)
 		return ret;
 	}
 
+	/* Set TCXO as clock source for gcc_pcie_1_pipe_clk_src */
+	if (pcie->pcie_1_pipe_clk_src_switch)
+		clk_set_parent(res->gcc_pcie_1_pipe_clk_src, res->ref_clk_src);
+
 	ret = clk_bulk_prepare_enable(res->num_clks, res->clks);
 	if (ret < 0)
 		goto err_disable_regulators;
@@ -1256,6 +1283,10 @@ static int qcom_pcie_post_init_2_7_0(struct qcom_pcie *pcie)
 {
 	struct qcom_pcie_resources_2_7_0 *res = &pcie->res.v2_7_0;
 
+	/* Set pipe clock as clock source for gcc_pcie_1_pipe_clk_src */
+	if (pcie->pcie_1_pipe_clk_src_switch)
+		clk_set_parent(res->gcc_pcie_1_pipe_clk_src, res->phy_pipe_clk);
+
 	return clk_prepare_enable(res->pipe_clk);
 }
 
@@ -1456,6 +1487,39 @@ static const struct qcom_pcie_ops ops_1_9_0 = {
 	.config_sid = qcom_pcie_config_sid_sm8250,
 };
 
+static const struct qcom_pcie_cfg apq8084_cfg = {
+	.ops = &ops_1_0_0,
+};
+
+static const struct qcom_pcie_cfg ipq8064_cfg = {
+	.ops = &ops_2_1_0,
+};
+
+static const struct qcom_pcie_cfg msm8996_cfg = {
+	.ops = &ops_2_3_2,
+};
+
+static const struct qcom_pcie_cfg ipq8074_cfg = {
+	.ops = &ops_2_3_3,
+};
+
+static const struct qcom_pcie_cfg ipq4019_cfg = {
+	.ops = &ops_2_4_0,
+};
+
+static const struct qcom_pcie_cfg sdm845_cfg = {
+	.ops = &ops_2_7_0,
+};
+
+static const struct qcom_pcie_cfg sm8250_cfg = {
+	.ops = &ops_1_9_0,
+};
+
+static const struct qcom_pcie_cfg sc7280_cfg = {
+	.ops = &ops_1_9_0,
+	.pcie_1_pipe_clk_src_switch = true,
+};
+
 static const struct dw_pcie_ops dw_pcie_ops = {
 	.link_up = qcom_pcie_link_up,
 	.start_link = qcom_pcie_start_link,
@@ -1467,6 +1531,7 @@ static int qcom_pcie_probe(struct platform_device *pdev)
 	struct pcie_port *pp;
 	struct dw_pcie *pci;
 	struct qcom_pcie *pcie;
+	const struct qcom_pcie_cfg *pcie_cfg = NULL;
 	int ret;
 
 	pcie = devm_kzalloc(dev, sizeof(*pcie), GFP_KERNEL);
@@ -1488,7 +1553,9 @@ static int qcom_pcie_probe(struct platform_device *pdev)
 
 	pcie->pci = pci;
 
-	pcie->ops = of_device_get_match_data(dev);
+	pcie_cfg = of_device_get_match_data(dev);
+	pcie->ops = pcie_cfg->ops;
+	pcie->pcie_1_pipe_clk_src_switch = pcie_cfg->pcie_1_pipe_clk_src_switch;
 
 	pcie->reset = devm_gpiod_get_optional(dev, "perst", GPIOD_OUT_HIGH);
 	if (IS_ERR(pcie->reset)) {
@@ -1545,16 +1612,17 @@ static int qcom_pcie_probe(struct platform_device *pdev)
 }
 
 static const struct of_device_id qcom_pcie_match[] = {
-	{ .compatible = "qcom,pcie-apq8084", .data = &ops_1_0_0 },
-	{ .compatible = "qcom,pcie-ipq8064", .data = &ops_2_1_0 },
-	{ .compatible = "qcom,pcie-ipq8064-v2", .data = &ops_2_1_0 },
-	{ .compatible = "qcom,pcie-apq8064", .data = &ops_2_1_0 },
-	{ .compatible = "qcom,pcie-msm8996", .data = &ops_2_3_2 },
-	{ .compatible = "qcom,pcie-ipq8074", .data = &ops_2_3_3 },
-	{ .compatible = "qcom,pcie-ipq4019", .data = &ops_2_4_0 },
-	{ .compatible = "qcom,pcie-qcs404", .data = &ops_2_4_0 },
-	{ .compatible = "qcom,pcie-sdm845", .data = &ops_2_7_0 },
-	{ .compatible = "qcom,pcie-sm8250", .data = &ops_1_9_0 },
+	{ .compatible = "qcom,pcie-apq8084", .data = &apq8084_cfg },
+	{ .compatible = "qcom,pcie-ipq8064", .data = &ipq8064_cfg },
+	{ .compatible = "qcom,pcie-ipq8064-v2", .data = &ipq8064_cfg },
+	{ .compatible = "qcom,pcie-apq8064", .data = &ipq8064_cfg },
+	{ .compatible = "qcom,pcie-msm8996", .data = &msm8996_cfg },
+	{ .compatible = "qcom,pcie-ipq8074", .data = &ipq8074_cfg },
+	{ .compatible = "qcom,pcie-ipq4019", .data = &ipq4019_cfg },
+	{ .compatible = "qcom,pcie-qcs404", .data = &ipq4019_cfg },
+	{ .compatible = "qcom,pcie-sdm845", .data = &sdm845_cfg },
+	{ .compatible = "qcom,pcie-sm8250", .data = &sm8250_cfg },
+	{ .compatible = "qcom,pcie-sc7280", .data = &sc7280_cfg },
 	{ }
 };
 
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

