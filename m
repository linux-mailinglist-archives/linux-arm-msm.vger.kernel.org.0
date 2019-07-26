Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8EB2A761E6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jul 2019 11:24:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726672AbfGZJX5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 26 Jul 2019 05:23:57 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:58634 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726516AbfGZJX5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 26 Jul 2019 05:23:57 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 72C84616B9; Fri, 26 Jul 2019 09:23:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1564133036;
        bh=Nzqbb8E838MNEepP4OiMDFBO1YPWgk+maDnTGb4aHvY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=TmSaZ0vxoQMDQgbDZi8srZmbNLdfEQNNTWreInypaO03FK1RbXi214riuj3cdQBdI
         dIo+/AfGQfT6WjE6TkNdbne09HQ+GE/QB7w6as3HmPlcSRrSRM9G6uUoT8LHjdisz+
         DLvkqL4SSZlkIA/uePrmeY40xdNVBYWrYFwIgiUY=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
        version=3.4.0
Received: from govinds-linux.qualcomm.com (blr-c-bdr-fw-01_globalnat_allzones-outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: govinds@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 9E9CA6119E;
        Fri, 26 Jul 2019 09:23:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1564133035;
        bh=Nzqbb8E838MNEepP4OiMDFBO1YPWgk+maDnTGb4aHvY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=ewjDH+6azD+OIql/fAsfQ6DJ+N9NVIh/8TULrzlLyxoMILfngO36osyKxCdC9fX46
         HET4PJi5JcEi0YufFmU6Vqc/TjB/jcI8ICKJet4BN4ChMc/n5ZNhGQD7POFvEO6+GV
         X9tHZ7AL3PNZ6RWJ+ebSMb5zDIQgixALMv6uTWWM=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 9E9CA6119E
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=govinds@codeaurora.org
From:   Govind Singh <govinds@codeaurora.org>
To:     bjorn.andersson@linaro.org, linux-remoteproc@vger.kernel.org,
        sboyd@kernel.org, linux-clk@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Cc:     andy.gross@linaro.org, linux-soc@vger.kernel.org,
        devicetree@vger.kernel.org, Govind Singh <govinds@codeaurora.org>
Subject: [PATCH v5 5/7] remoteproc: qcom: wcss: populate hardcoded param using driver data
Date:   Fri, 26 Jul 2019 14:53:30 +0530
Message-Id: <20190726092332.25202-6-govinds@codeaurora.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190726092332.25202-1-govinds@codeaurora.org>
References: <20190726092332.25202-1-govinds@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Q6 based WiFi fw loading is supported across
different targets, ex: IPQ8074/QCS404. In order to
support different fw names/pas id etc, populate
hardcoded param using driver data.

Signed-off-by: Govind Singh <govinds@codeaurora.org>
---
 drivers/remoteproc/qcom_q6v5_wcss.c | 31 ++++++++++++++++++++++++-----
 1 file changed, 26 insertions(+), 5 deletions(-)

diff --git a/drivers/remoteproc/qcom_q6v5_wcss.c b/drivers/remoteproc/qcom_q6v5_wcss.c
index f93e1e4a1cc0..84accf1755e9 100644
--- a/drivers/remoteproc/qcom_q6v5_wcss.c
+++ b/drivers/remoteproc/qcom_q6v5_wcss.c
@@ -8,6 +8,7 @@
 #include <linux/kernel.h>
 #include <linux/mfd/syscon.h>
 #include <linux/module.h>
+#include <linux/of_device.h>
 #include <linux/of_reserved_mem.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
@@ -70,6 +71,11 @@
 #define TCSR_WCSS_CLK_MASK	0x1F
 #define TCSR_WCSS_CLK_ENABLE	0x14
 
+struct wcss_data {
+	const char *firmware_name;
+	int crash_reason_smem;
+};
+
 struct q6v5_wcss {
 	struct device *dev;
 
@@ -91,6 +97,8 @@ struct q6v5_wcss {
 	phys_addr_t mem_reloc;
 	void *mem_region;
 	size_t mem_size;
+
+	int crash_reason_smem;
 };
 
 static int q6v5_wcss_reset(struct q6v5_wcss *wcss)
@@ -427,7 +435,7 @@ static int q6v5_wcss_load(struct rproc *rproc, const struct firmware *fw)
 				     wcss->mem_size, &wcss->mem_reloc);
 }
 
-static const struct rproc_ops q6v5_wcss_ops = {
+static const struct rproc_ops q6v5_wcss_ipq8074_ops = {
 	.start = q6v5_wcss_start,
 	.stop = q6v5_wcss_stop,
 	.da_to_va = q6v5_wcss_da_to_va,
@@ -527,12 +535,17 @@ static int q6v5_alloc_memory_region(struct q6v5_wcss *wcss)
 
 static int q6v5_wcss_probe(struct platform_device *pdev)
 {
+	const struct wcss_data *desc;
 	struct q6v5_wcss *wcss;
 	struct rproc *rproc;
 	int ret;
 
-	rproc = rproc_alloc(&pdev->dev, pdev->name, &q6v5_wcss_ops,
-			    "IPQ8074/q6_fw.mdt", sizeof(*wcss));
+	desc = of_device_get_match_data(&pdev->dev);
+	if (!desc)
+		return -EINVAL;
+
+	rproc = rproc_alloc(&pdev->dev, pdev->name, &q6v5_wcss_ipq8074_ops,
+			    desc->firmware_name, sizeof(*wcss));
 	if (!rproc) {
 		dev_err(&pdev->dev, "failed to allocate rproc\n");
 		return -ENOMEM;
@@ -540,6 +553,7 @@ static int q6v5_wcss_probe(struct platform_device *pdev)
 
 	wcss = rproc->priv;
 	wcss->dev = &pdev->dev;
+	wcss->crash_reason_smem = desc->crash_reason_smem;
 
 	ret = q6v5_wcss_init_mmio(wcss, pdev);
 	if (ret)
@@ -553,7 +567,8 @@ static int q6v5_wcss_probe(struct platform_device *pdev)
 	if (ret)
 		goto free_rproc;
 
-	ret = qcom_q6v5_init(&wcss->q6v5, pdev, rproc, WCSS_CRASH_REASON, NULL);
+	ret = qcom_q6v5_init(&wcss->q6v5, pdev, rproc, desc->crash_reason_smem,
+			     NULL);
 	if (ret)
 		goto free_rproc;
 
@@ -581,8 +596,14 @@ static int q6v5_wcss_remove(struct platform_device *pdev)
 	return 0;
 }
 
+static const struct wcss_data wcss_ipq8074_res_init = {
+	.firmware_name = "IPQ8074/q6_fw.mdt",
+	.crash_reason_smem = WCSS_CRASH_REASON,
+};
+
 static const struct of_device_id q6v5_wcss_of_match[] = {
-	{ .compatible = "qcom,ipq8074-wcss-pil" },
+	{ .compatible = "qcom,ipq8074-wcss-pil", .data = &wcss_ipq8074_res_init },
+
 	{ },
 };
 MODULE_DEVICE_TABLE(of, q6v5_wcss_of_match);
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

