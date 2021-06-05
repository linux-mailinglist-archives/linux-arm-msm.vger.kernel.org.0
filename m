Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EBBC239C923
	for <lists+linux-arm-msm@lfdr.de>; Sat,  5 Jun 2021 16:41:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230128AbhFEOn2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 5 Jun 2021 10:43:28 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:23317 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230104AbhFEOn2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 5 Jun 2021 10:43:28 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1622904100; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=lJz3OBn91o/qjgjPNyszk0lnVGUFzM2NUPqWn9dlgRE=; b=ca8Elfv7/IlzAI260O1hNyjAcpKo9gl9keJMmkB+qKT27QEGvBlStochTTkiriIZ+qICgdgZ
 zbzKUosHFz5BlJgk5urF23fGxFRp/+vSBui+ONvFm4DBJOM31xaGSFa/4yh+gXzdF/lRhD2z
 zX3QPkOLJeajOy9CwaBfwC0vOb8=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-west-2.postgun.com with SMTP id
 60bb8d1aed59bf69cc3d8859 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Sat, 05 Jun 2021 14:41:30
 GMT
Sender: pmaliset=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 24EA0C4338A; Sat,  5 Jun 2021 14:41:30 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
Received: from pmaliset-linux.qualcomm.com (unknown [202.46.22.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: pmaliset)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 15D3AC4360C;
        Sat,  5 Jun 2021 14:41:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 15D3AC4360C
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=pmaliset@codeaurora.org
From:   Prasad Malisetty <pmaliset@codeaurora.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org, bhelgaas@google.com,
        robh+dt@kernel.org, swboyd@chromium.org, lorenzo.pieralisi@arm.com,
        svarbanov@mm-sol.com
Cc:     devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        mgautam@codeaurora.org, dianders@chromium.org, mka@chromium.org,
        sanm@codeaurora.org, Prasad Malisetty <pmaliset@codeaurora.org>
Subject: [PATCH v2 3/4] PCIe: qcom: Add support to control pipe clk mux
Date:   Sat,  5 Jun 2021 20:10:58 +0530
Message-Id: <1622904059-21244-4-git-send-email-pmaliset@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1622904059-21244-1-git-send-email-pmaliset@codeaurora.org>
References: <1622904059-21244-1-git-send-email-pmaliset@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

In PCIe driver pipe-clk mux needs to switch between pipe_clk
and XO for GDSC enable. This is done by setting pipe_clk mux
as parent of pipe_clk after phy init.

Signed-off-by: Prasad Malisetty <pmaliset@codeaurora.org>
---
 drivers/pci/controller/dwc/pcie-qcom.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
index 8a7a300..5cbbea4 100644
--- a/drivers/pci/controller/dwc/pcie-qcom.c
+++ b/drivers/pci/controller/dwc/pcie-qcom.c
@@ -166,6 +166,9 @@ struct qcom_pcie_resources_2_7_0 {
 	struct regulator_bulk_data supplies[2];
 	struct reset_control *pci_reset;
 	struct clk *pipe_clk;
+	struct clk *pipe_clk_mux;
+	struct clk *pipe_ext_src;
+	struct clk *ref_clk_src;
 };
 
 union qcom_pcie_resources {
@@ -1167,6 +1170,20 @@ static int qcom_pcie_get_resources_2_7_0(struct qcom_pcie *pcie)
 	if (ret < 0)
 		return ret;
 
+	if (of_device_is_compatible(dev->of_node, "qcom,pcie-sc7280")) {
+		res->pipe_clk_mux = devm_clk_get(dev, "pipe_src");
+		if (IS_ERR(res->pipe_clk_mux))
+			return PTR_ERR(res->pipe_clk_mux);
+
+		res->pipe_ext_src = devm_clk_get(dev, "pipe_ext");
+		if (IS_ERR(res->pipe_ext_src))
+			return PTR_ERR(res->pipe_ext_src);
+
+		res->ref_clk_src = devm_clk_get(dev, "ref");
+		if (IS_ERR(res->ref_clk_src))
+			return PTR_ERR(res->ref_clk_src);
+	}
+
 	res->pipe_clk = devm_clk_get(dev, "pipe");
 	return PTR_ERR_OR_ZERO(res->pipe_clk);
 }
@@ -1255,6 +1272,11 @@ static void qcom_pcie_deinit_2_7_0(struct qcom_pcie *pcie)
 static int qcom_pcie_post_init_2_7_0(struct qcom_pcie *pcie)
 {
 	struct qcom_pcie_resources_2_7_0 *res = &pcie->res.v2_7_0;
+	struct dw_pcie *pci = pcie->pci;
+	struct device *dev = pci->dev;
+
+	if (of_device_is_compatible(dev->of_node, "qcom,pcie-sc7280"))
+		clk_set_parent(res->pipe_clk_mux, res->pipe_ext_src);
 
 	return clk_prepare_enable(res->pipe_clk);
 }
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

