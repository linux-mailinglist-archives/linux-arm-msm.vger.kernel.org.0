Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 93ED451333E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Apr 2022 14:00:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345977AbiD1MC7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 28 Apr 2022 08:02:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46702 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345985AbiD1MC6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 28 Apr 2022 08:02:58 -0400
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 91BBAAAE12
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 Apr 2022 04:59:41 -0700 (PDT)
Received: by mail-lj1-x236.google.com with SMTP id bn33so6376916ljb.6
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 Apr 2022 04:59:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=QnIIMFCldeQCYOGbcxhta8Plu5eSV7jfdfQySFyWrYQ=;
        b=v7cM9E6xsydhy7Yv4oRrYA2XWIjrwuXPpI0N59HuO5dAenhqub5/89nWcawT3+RbyI
         PSOf1hvoxgLfQzCC5Xpm22mxwQlnLqzyCCejelAkNnGjAgeE2crpC2m88vgL5JqCWjTy
         TsIir34IQlnxbUzTC4Wsx2GymtZwa6aEci898cEmqhlE33e9ybltLpjcEtgzo80PbVNx
         aDkByH0hXsMrrDgGob6FHuH8LlH6OdYhVRpf0aJ4lbOI8md3tN2TH3+wILualqikob5p
         zh3xb4n6g1boFq1VuVIr5z6YpWHZZK7ju+FdYOrynfwh3nEzNomCSP0pJoQY0BMDKopN
         UUpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=QnIIMFCldeQCYOGbcxhta8Plu5eSV7jfdfQySFyWrYQ=;
        b=2ahlF/dw2HDRbtNinoL2n35/VgFq7P4ZtIy2ugvvdU0fKx3aswHBYxxUzEpgsBRxCL
         7uj5TvWMffuSFBjvs6zC+BIdjikKk1/0UMQYcOG7m8XbCwdSXTBG8P/aYJLLKxyv7rxA
         e7gpHfhmrJcQuWETrC205lk2Xzlfsz/CJ9X3D2cBlAQltdccAVKO2CVlARYV7+nTV/Ko
         6BIUti3hVairyOnmChZ9WdR9Abw6IJ0k56ku81HDpHLaKRMD11+UaOPomh2zpIikKw52
         Yoxkmtn1WYyXgkP7RiN7SGMnXrEbNXN4b++HYYrkpFIPxjDSq0QV7OmfakFDmlvelcnU
         N9WA==
X-Gm-Message-State: AOAM5317rTDINtXO9IL8zKZxyOrD9EdYmZwfTpsf8d6/bv6wb+rAa8mX
        Zojo2CKrl7K2HMVDIA/fAEmtHQ==
X-Google-Smtp-Source: ABdhPJyWR4O3cco7dXy09sAaH9GEG3E8MbG1RWksCHhtauHJrB5HGU7crehNyvKyyWibEVQneatskw==
X-Received: by 2002:a2e:9bd4:0:b0:24f:2300:c33a with SMTP id w20-20020a2e9bd4000000b0024f2300c33amr8312908ljj.353.1651147179605;
        Thu, 28 Apr 2022 04:59:39 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id f1-20020a2e1f01000000b0024602522b5dsm2069137ljf.120.2022.04.28.04.59.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Apr 2022 04:59:39 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Jingoo Han <jingoohan1@gmail.com>,
        Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Stanimir Varbanov <svarbanov@mm-sol.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     Vinod Koul <vkoul@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-pci@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH v4 5/7] PCI: qcom: Handle MSI IRQs properly
Date:   Thu, 28 Apr 2022 14:59:32 +0300
Message-Id: <20220428115934.3414641-6-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220428115934.3414641-1-dmitry.baryshkov@linaro.org>
References: <20220428115934.3414641-1-dmitry.baryshkov@linaro.org>
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

On some of Qualcomm platforms each group of 32 MSI vectors is routed to the
separate GIC interrupt. Thus to receive higher MSI vectors properly,
add separate msi_host_init()/msi_host_deinit() handling additional host
IRQs.

Note, that if DT doesn't list extra MSI interrupts, the driver will limit
the amount of supported MSI vectors accordingly (to 32).

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/pci/controller/dwc/pcie-qcom.c | 137 ++++++++++++++++++++++++-
 1 file changed, 136 insertions(+), 1 deletion(-)

diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
index 375f27ab9403..ac16353ce5b3 100644
--- a/drivers/pci/controller/dwc/pcie-qcom.c
+++ b/drivers/pci/controller/dwc/pcie-qcom.c
@@ -194,6 +194,7 @@ struct qcom_pcie_ops {
 
 struct qcom_pcie_cfg {
 	const struct qcom_pcie_ops *ops;
+	unsigned int has_split_msi_irqs:1;
 	unsigned int pipe_clk_need_muxing:1;
 	unsigned int has_tbu_clk:1;
 	unsigned int has_ddrss_sf_tbu_clk:1;
@@ -209,6 +210,7 @@ struct qcom_pcie {
 	struct phy *phy;
 	struct gpio_desc *reset;
 	const struct qcom_pcie_cfg *cfg;
+	int msi_irqs[MAX_MSI_CTRLS];
 };
 
 #define to_qcom_pcie(x)		dev_get_drvdata((x)->dev)
@@ -1387,6 +1389,124 @@ static int qcom_pcie_config_sid_sm8250(struct qcom_pcie *pcie)
 	return 0;
 }
 
+static void qcom_chained_msi_isr(struct irq_desc *desc)
+{
+	struct irq_chip *chip = irq_desc_get_chip(desc);
+	int irq = irq_desc_get_irq(desc);
+	struct pcie_port *pp;
+	int idx, pos;
+	unsigned long val;
+	u32 status, num_ctrls;
+	struct dw_pcie *pci;
+	struct qcom_pcie *pcie;
+
+	chained_irq_enter(chip, desc);
+
+	pp = irq_desc_get_handler_data(desc);
+	pci = to_dw_pcie_from_pp(pp);
+	pcie = to_qcom_pcie(pci);
+
+	/*
+	 * Unlike generic dw_handle_msi_irq we can determine, which group of
+	 * MSIs triggered the IRQ, so process just single group.
+	 */
+	num_ctrls = pp->num_vectors / MAX_MSI_IRQS_PER_CTRL;
+
+	for (idx = 0; idx < num_ctrls; idx++) {
+		if (pcie->msi_irqs[idx] == irq)
+			break;
+	}
+
+	if (WARN_ON_ONCE(unlikely(idx == num_ctrls)))
+		goto out;
+
+	status = dw_pcie_readl_dbi(pci, PCIE_MSI_INTR0_STATUS +
+				   (idx * MSI_REG_CTRL_BLOCK_SIZE));
+	if (!status)
+		goto out;
+
+	val = status;
+	pos = 0;
+	while ((pos = find_next_bit(&val, MAX_MSI_IRQS_PER_CTRL,
+				    pos)) != MAX_MSI_IRQS_PER_CTRL) {
+		generic_handle_domain_irq(pp->irq_domain,
+					  (idx * MAX_MSI_IRQS_PER_CTRL) +
+					  pos);
+		pos++;
+	}
+
+out:
+	chained_irq_exit(chip, desc);
+}
+
+static int qcom_pcie_msi_host_init(struct pcie_port *pp)
+{
+	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
+	struct qcom_pcie *pcie = to_qcom_pcie(pci);
+	struct platform_device *pdev = to_platform_device(pci->dev);
+	char irq_name[] = "msiXXX";
+	unsigned int ctrl, num_ctrls;
+	int msi_irq, ret;
+
+	pp->msi_irq = -EINVAL;
+
+	/*
+	 * We provide our own implementation of MSI init/deinit, but rely on
+	 * using the rest of DWC MSI functionality.
+	 */
+	pp->has_msi_ctrl = true;
+
+	msi_irq = platform_get_irq_byname_optional(pdev, "msi");
+	if (msi_irq < 0) {
+		msi_irq = platform_get_irq(pdev, 0);
+		if (msi_irq < 0)
+			return msi_irq;
+	}
+
+	pcie->msi_irqs[0] = msi_irq;
+
+	for (num_ctrls = 1; num_ctrls < MAX_MSI_CTRLS; num_ctrls++) {
+		snprintf(irq_name, sizeof(irq_name), "msi%d", num_ctrls + 1);
+		msi_irq = platform_get_irq_byname_optional(pdev, irq_name);
+		if (msi_irq == -ENXIO)
+			break;
+
+		pcie->msi_irqs[num_ctrls] = msi_irq;
+	}
+
+	pp->num_vectors = num_ctrls * MAX_MSI_IRQS_PER_CTRL;
+	dev_info(&pdev->dev, "Using %d MSI vectors\n", pp->num_vectors);
+	for (ctrl = 0; ctrl < num_ctrls; ctrl++)
+		pp->irq_mask[ctrl] = ~0;
+
+	ret = dw_pcie_allocate_msi(pp);
+	if (ret)
+		return ret;
+
+	for (ctrl = 0; ctrl < num_ctrls; ctrl++)
+		irq_set_chained_handler_and_data(pcie->msi_irqs[ctrl],
+				qcom_chained_msi_isr,
+				pp);
+
+	return 0;
+}
+
+static void qcom_pcie_msi_host_deinit(struct pcie_port *pp)
+{
+	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
+	struct qcom_pcie *pcie = to_qcom_pcie(pci);
+	unsigned int ctrl, num_ctrls;
+
+	num_ctrls = pp->num_vectors / MAX_MSI_IRQS_PER_CTRL;
+
+	for (ctrl = 0; ctrl < num_ctrls; ctrl++)
+		irq_set_chained_handler_and_data(pcie->msi_irqs[ctrl],
+				NULL,
+				NULL);
+
+	dw_pcie_free_msi(pp);
+}
+
 static int qcom_pcie_host_init(struct pcie_port *pp)
 {
 	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
@@ -1435,6 +1555,12 @@ static const struct dw_pcie_host_ops qcom_pcie_dw_ops = {
 	.host_init = qcom_pcie_host_init,
 };
 
+static const struct dw_pcie_host_ops qcom_pcie_msi_dw_ops = {
+	.host_init = qcom_pcie_host_init,
+	.msi_host_init = qcom_pcie_msi_host_init,
+	.msi_host_deinit = qcom_pcie_msi_host_deinit,
+};
+
 /* Qcom IP rev.: 2.1.0	Synopsys IP rev.: 4.01a */
 static const struct qcom_pcie_ops ops_2_1_0 = {
 	.get_resources = qcom_pcie_get_resources_2_1_0,
@@ -1508,6 +1634,7 @@ static const struct qcom_pcie_cfg ipq8064_cfg = {
 
 static const struct qcom_pcie_cfg msm8996_cfg = {
 	.ops = &ops_2_3_2,
+	.has_split_msi_irqs = true,
 };
 
 static const struct qcom_pcie_cfg ipq8074_cfg = {
@@ -1520,6 +1647,7 @@ static const struct qcom_pcie_cfg ipq4019_cfg = {
 
 static const struct qcom_pcie_cfg sdm845_cfg = {
 	.ops = &ops_2_7_0,
+	.has_split_msi_irqs = true,
 	.has_tbu_clk = true,
 };
 
@@ -1532,12 +1660,14 @@ static const struct qcom_pcie_cfg sm8150_cfg = {
 
 static const struct qcom_pcie_cfg sm8250_cfg = {
 	.ops = &ops_1_9_0,
+	.has_split_msi_irqs = true,
 	.has_tbu_clk = true,
 	.has_ddrss_sf_tbu_clk = true,
 };
 
 static const struct qcom_pcie_cfg sm8450_pcie0_cfg = {
 	.ops = &ops_1_9_0,
+	.has_split_msi_irqs = true,
 	.has_ddrss_sf_tbu_clk = true,
 	.pipe_clk_need_muxing = true,
 	.has_aggre0_clk = true,
@@ -1546,6 +1676,7 @@ static const struct qcom_pcie_cfg sm8450_pcie0_cfg = {
 
 static const struct qcom_pcie_cfg sm8450_pcie1_cfg = {
 	.ops = &ops_1_9_0,
+	.has_split_msi_irqs = true,
 	.has_ddrss_sf_tbu_clk = true,
 	.pipe_clk_need_muxing = true,
 	.has_aggre1_clk = true,
@@ -1553,6 +1684,7 @@ static const struct qcom_pcie_cfg sm8450_pcie1_cfg = {
 
 static const struct qcom_pcie_cfg sc7280_cfg = {
 	.ops = &ops_1_9_0,
+	.has_split_msi_irqs = true,
 	.has_tbu_clk = true,
 	.pipe_clk_need_muxing = true,
 };
@@ -1626,7 +1758,10 @@ static int qcom_pcie_probe(struct platform_device *pdev)
 	if (ret)
 		goto err_pm_runtime_put;
 
-	pp->ops = &qcom_pcie_dw_ops;
+	if (pcie->cfg->has_split_msi_irqs)
+		pp->ops = &qcom_pcie_msi_dw_ops;
+	else
+		pp->ops = &qcom_pcie_dw_ops;
 
 	ret = phy_init(pcie->phy);
 	if (ret) {
-- 
2.35.1

