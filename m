Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 677223E51CA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Aug 2021 06:09:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236555AbhHJEKN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 10 Aug 2021 00:10:13 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:51104 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236966AbhHJEJ6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 10 Aug 2021 00:09:58 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1628568577; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=jj+EJdpyqlbmbnLzE53tILclU1PuLXIfSdqbeDfZAlU=; b=Rvd+mnn3MiwyEfE/JjIm0UPOHosGrOKvXLIvXMr2aOhjhD1/tk+wTL3THQ+QaPoRs1WG75nz
 yTp1mhtGgzJ6CyALJ01SkWBaQ7H8MDW3gzdoxW1Ow7kK9BA+5CDGYgzZUOvvQeELDG06q9IY
 YfN3udGy1fGTt8r+O/lKNBFfbwE=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-east-1.postgun.com with SMTP id
 6111fbf2b3873958f576d966 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 10 Aug 2021 04:09:22
 GMT
Sender: pmaliset=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 2D37FC43217; Tue, 10 Aug 2021 04:09:22 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from pmaliset-linux.qualcomm.com (unknown [202.46.22.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: pmaliset)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 83618C433D3;
        Tue, 10 Aug 2021 04:09:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 83618C433D3
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=pmaliset@codeaurora.org
From:   Prasad Malisetty <pmaliset@codeaurora.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org, bhelgaas@google.com,
        robh+dt@kernel.org, swboyd@chromium.org, lorenzo.pieralisi@arm.com,
        svarbanov@mm-sol.com
Cc:     devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        dianders@chromium.org, mka@chromium.org, vbadigan@codeaurora.org,
        sallenki@codeaurora.org, manivannan.sadhasivam@linaro.org,
        Prasad Malisetty <pmaliset@codeaurora.org>
Subject: [PATCH v5 4/4] PCI: qcom: Switch pcie_1_pipe_clk_src after PHY init in SC7280
Date:   Tue, 10 Aug 2021 09:38:36 +0530
Message-Id: <1628568516-24155-5-git-send-email-pmaliset@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1628568516-24155-1-git-send-email-pmaliset@codeaurora.org>
References: <1628568516-24155-1-git-send-email-pmaliset@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On the SC7280, By default the clock source for pcie_1_pipe is
TCXO for gdsc enable. But after the PHY is initialized, the clock
source must be switched to gcc_pcie_1_pipe_clk from TCXO.

Signed-off-by: Prasad Malisetty <pmaliset@codeaurora.org>
---
 drivers/pci/controller/dwc/pcie-qcom.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
index 8a7a300..39e3b21 100644
--- a/drivers/pci/controller/dwc/pcie-qcom.c
+++ b/drivers/pci/controller/dwc/pcie-qcom.c
@@ -166,6 +166,8 @@ struct qcom_pcie_resources_2_7_0 {
 	struct regulator_bulk_data supplies[2];
 	struct reset_control *pci_reset;
 	struct clk *pipe_clk;
+	struct clk *gcc_pcie_1_pipe_clk_src;
+	struct clk *phy_pipe_clk;
 };
 
 union qcom_pcie_resources {
@@ -1167,6 +1169,16 @@ static int qcom_pcie_get_resources_2_7_0(struct qcom_pcie *pcie)
 	if (ret < 0)
 		return ret;
 
+	if (of_device_is_compatible(dev->of_node, "qcom,pcie-sc7280")) {
+		res->gcc_pcie_1_pipe_clk_src = devm_clk_get(dev, "pipe_mux");
+		if (IS_ERR(res->gcc_pcie_1_pipe_clk_src))
+			return PTR_ERR(res->gcc_pcie_1_pipe_clk_src);
+
+		res->phy_pipe_clk = devm_clk_get(dev, "phy_pipe");
+		if (IS_ERR(res->phy_pipe_clk))
+			return PTR_ERR(res->phy_pipe_clk);
+	}
+
 	res->pipe_clk = devm_clk_get(dev, "pipe");
 	return PTR_ERR_OR_ZERO(res->pipe_clk);
 }
@@ -1255,6 +1267,12 @@ static void qcom_pcie_deinit_2_7_0(struct qcom_pcie *pcie)
 static int qcom_pcie_post_init_2_7_0(struct qcom_pcie *pcie)
 {
 	struct qcom_pcie_resources_2_7_0 *res = &pcie->res.v2_7_0;
+	struct dw_pcie *pci = pcie->pci;
+	struct device *dev = pci->dev;
+	struct device_node *node = dev->of_node;
+
+	if (of_property_read_bool(node, "pipe-clk-source-switch"))
+		clk_set_parent(res->gcc_pcie_1_pipe_clk_src, res->phy_pipe_clk);
 
 	return clk_prepare_enable(res->pipe_clk);
 }
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

