Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 62E7B46D96B
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Dec 2021 18:15:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237698AbhLHRSg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 8 Dec 2021 12:18:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52500 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234690AbhLHRSg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 8 Dec 2021 12:18:36 -0500
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD2CBC0617A2
        for <linux-arm-msm@vger.kernel.org>; Wed,  8 Dec 2021 09:15:03 -0800 (PST)
Received: by mail-lf1-x134.google.com with SMTP id bu18so7060565lfb.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Dec 2021 09:15:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Dt6ihFbYfqd5aPj9M//CpdMA5RnM8gPqGCN6JmxEFho=;
        b=LePC9wR8Kh0skORad1zbzTg5eJWAWBKeXylgYw9knG0Vxk8T8GsXoxJaioFtGaFzeL
         C2bt1KVKbQ3Q21iibLRhyiSFHCosVpbVT5xb1uu0uSBTYCFQUYPjE3j3megDsB3iSsG3
         PgDEhLsG/0Ne1iDK0fBEzwciTVkgF3XRcnWdDaBFfJzPOBfssvW9/T8jcV/9iawJcO/N
         UGJhGuglrshHw4YyWLMafwepsGXGpgrL7N9L1dXjqYDbFcaisDIkTG0syTfvr/1nNAGD
         2jC4C6K7Q9tKnJv1QyXRfBQJe5fKLpvv160FW+XuxwhIpiS+zdSYjB7UPJdCHPwROPCp
         Q6Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Dt6ihFbYfqd5aPj9M//CpdMA5RnM8gPqGCN6JmxEFho=;
        b=xkvnLOU5TClQxsoX5nVxy8fu979//GUxL1FzUbbuGQmg/d4qwprrtHTQvdnbfD7VCo
         oZvPG5wNKArNFQ4sUQzjfk4u3CduLep1oknqGQlvwSaidat7IeHE4GGebAI6TswarkmN
         6JSRjeyrUNsPSQOF1XidmHksL5xDOkmOoQvq2Zq7br+lOxLQ13cD4EUJtdw5OB/4yJub
         xdQUOmJV8SJLoUJY3aIFvpULu57rfRjGNb8INax8LvmJYp/dCbHroXYL9tavBgwweR03
         ZopvhGtulQhtkz2+yT2zKtyX4GD6Rr2NMxayyMpcBOHYy7MFAQrJKMDCYJ9drK+Dsfpj
         rKvQ==
X-Gm-Message-State: AOAM530123lunU3CoVGlZ2M4gY4Srmqy183jVK+v49AIpAuqxyd3/NMC
        QIBrsXTYpHLz+L1Ovyz4VMlgmA==
X-Google-Smtp-Source: ABdhPJwp2iyfGP9Wq/y45iLN3gPhc74Dj8WW6mUkO3BHNWh/VJp8RSvtgMIqv51PhVPdfpyoprGjIg==
X-Received: by 2002:a05:6512:1194:: with SMTP id g20mr716006lfr.58.1638983702065;
        Wed, 08 Dec 2021 09:15:02 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id t9sm307213lfe.88.2021.12.08.09.15.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Dec 2021 09:15:01 -0800 (PST)
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
Subject: [PATCH v2 05/10] PCI: qcom: Add ddrss_sf_tbu flag
Date:   Wed,  8 Dec 2021 20:14:37 +0300
Message-Id: <20211208171442.1327689-6-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211208171442.1327689-1-dmitry.baryshkov@linaro.org>
References: <20211208171442.1327689-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Qualcomm PCIe driver uses compatible string to check if the ddrss_sf_tbu
clock should be used. Since sc7280 support has added flags, switch to
the new mechanism to check if this clock should be used.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/pci/controller/dwc/pcie-qcom.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
index 51a0475173fb..803d3ac18c56 100644
--- a/drivers/pci/controller/dwc/pcie-qcom.c
+++ b/drivers/pci/controller/dwc/pcie-qcom.c
@@ -194,7 +194,9 @@ struct qcom_pcie_ops {
 
 struct qcom_pcie_cfg {
 	const struct qcom_pcie_ops *ops;
+	/* flags for ops 2.7.0 and 1.9.0 */
 	unsigned int pipe_clk_need_muxing:1;
+	unsigned int has_ddrss_sf_tbu_clk:1;
 };
 
 struct qcom_pcie {
@@ -1164,7 +1166,7 @@ static int qcom_pcie_get_resources_2_7_0(struct qcom_pcie *pcie)
 	res->clks[3].id = "bus_slave";
 	res->clks[4].id = "slave_q2a";
 	res->clks[5].id = "tbu";
-	if (of_device_is_compatible(dev->of_node, "qcom,pcie-sm8250")) {
+	if (pcie->cfg->has_ddrss_sf_tbu_clk) {
 		res->clks[6].id = "ddrss_sf_tbu";
 		res->num_clks = 7;
 	} else {
@@ -1512,6 +1514,7 @@ static const struct qcom_pcie_cfg sdm845_cfg = {
 
 static const struct qcom_pcie_cfg sm8250_cfg = {
 	.ops = &ops_1_9_0,
+	.has_ddrss_sf_tbu_clk = true,
 };
 
 static const struct qcom_pcie_cfg sc7280_cfg = {
-- 
2.33.0

