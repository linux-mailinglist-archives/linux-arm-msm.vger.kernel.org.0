Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8C5BB3B09CA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Jun 2021 18:01:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229831AbhFVQEJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 22 Jun 2021 12:04:09 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:38906 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230137AbhFVQEH (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 22 Jun 2021 12:04:07 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1624377711; h=Content-Transfer-Encoding: Content-Type:
 MIME-Version: References: In-Reply-To: Message-Id: Date: Subject: Cc:
 To: From: Sender; bh=reQr2XyCqEbk5X3j7DCj8b8wggWMKu29nhQviARLoiI=; b=pQW/lL+nvLF03d0irZIvKaiNdwkgGkPtTHTRQO4jXD7d70j8g17S1jHBsA9Mtljntg+kZ60Z
 MOF5kMMSwb6/m8BvbcJlSuZGQpkpSs5/SoZgjxbqT4ODB4T9d7glX9T+QGEMdTDEh1n0rRsO
 RF3t+Hknp6cpc7+rGBJHRQ1uc/s=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-west-2.postgun.com with SMTP id
 60d209564c54fe7431cf5c20 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 22 Jun 2021 16:01:26
 GMT
Sender: pmaliset=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id E1209C4338A; Tue, 22 Jun 2021 16:01:26 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from pmaliset-linux.qualcomm.com (unknown [202.46.22.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: pmaliset)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id E3FD3C4323A;
        Tue, 22 Jun 2021 16:01:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org E3FD3C4323A
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
Subject: [PATCH v3 4/4] PCIe: qcom: Add support to control pipe clk mux
Date:   Tue, 22 Jun 2021 21:30:51 +0530
Message-Id: <1624377651-30604-5-git-send-email-pmaliset@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1624377651-30604-1-git-send-email-pmaliset@codeaurora.org>
References: <1624377651-30604-1-git-send-email-pmaliset@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

pipe-clk mux needs to switch between pipe_clk
and XO as part of LPM squence. This is done by setting
pipe_clk mux as parent of pipe_clk after phy init.
This is a new requirement for sc7280.
For accessing to DBI registers during L23,
need to switch the pipe clock with free-running
clock (TCXO) using GCC’s registers

Signed-off-by: Prasad Malisetty <pmaliset@codeaurora.org>
---
 drivers/pci/controller/dwc/pcie-qcom.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
index 8a7a300..80e9ee4 100644
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
+		res->pipe_clk_mux = devm_clk_get(dev, "pipe_mux");
+		if (IS_ERR(res->pipe_clk_mux))
+			return PTR_ERR(res->pipe_clk_mux);
+
+		res->pipe_ext_src = devm_clk_get(dev, "phy_pipe");
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

