Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EBC23761DC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jul 2019 11:23:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726554AbfGZJXv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 26 Jul 2019 05:23:51 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:58268 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726653AbfGZJXu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 26 Jul 2019 05:23:50 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 8139F60FEE; Fri, 26 Jul 2019 09:23:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1564133029;
        bh=dWB85648G7zSBg/asoUnw/b4sm7cM/D8ctlHcoslwXY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=ne2HIu2p+EF5ePPoiX4rNkj5juqs58qskvKwC+qxq0/wG6M2oroZeqdk733pG+3u4
         fl6FrFStE4slWZx75EUXrvO+nUFJb2F0scE9eU7ig+zDyVjb+DOYhs9dJf4TMs+M7S
         CrOfjHAymXJsrCzcQf2/f1AO+zNG5Wrx/JmNjjVc=
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
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 1BA4960F3C;
        Fri, 26 Jul 2019 09:23:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1564133028;
        bh=dWB85648G7zSBg/asoUnw/b4sm7cM/D8ctlHcoslwXY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=ZjKegwzsrX1SiVobhMCfcTCkrZGd3XnWag7vtYcyi94e1QAhYcATrGy5HJboL/hHU
         h6stHl88xXwGoqx2mUVFhYPs9vq3ME/m3W3iNrvgl0CP/VOj3bmQZWXZYHW4lHMoCP
         fabHLqc/4DzlLFEsqRqco7Nh+FGOTcJWATLNoFn4=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 1BA4960F3C
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=govinds@codeaurora.org
From:   Govind Singh <govinds@codeaurora.org>
To:     bjorn.andersson@linaro.org, linux-remoteproc@vger.kernel.org,
        sboyd@kernel.org, linux-clk@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Cc:     andy.gross@linaro.org, linux-soc@vger.kernel.org,
        devicetree@vger.kernel.org, Govind Singh <govinds@codeaurora.org>
Subject: [PATCH v5 3/7] clk: qcom: define probe by index API as common API
Date:   Fri, 26 Jul 2019 14:53:28 +0530
Message-Id: <20190726092332.25202-4-govinds@codeaurora.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190726092332.25202-1-govinds@codeaurora.org>
References: <20190726092332.25202-1-govinds@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Extend the probe by index API in common code to be used
by other qcom clock controller.

Signed-off-by: Govind Singh <govinds@codeaurora.org>
---
 drivers/clk/qcom/common.c         | 20 ++++++++++++++++++++
 drivers/clk/qcom/common.h         |  2 ++
 drivers/clk/qcom/lpasscc-sdm845.c | 23 ++---------------------
 3 files changed, 24 insertions(+), 21 deletions(-)

diff --git a/drivers/clk/qcom/common.c b/drivers/clk/qcom/common.c
index a6b2f86112d8..28ddc747d703 100644
--- a/drivers/clk/qcom/common.c
+++ b/drivers/clk/qcom/common.c
@@ -306,4 +306,24 @@ int qcom_cc_probe(struct platform_device *pdev, const struct qcom_cc_desc *desc)
 }
 EXPORT_SYMBOL_GPL(qcom_cc_probe);
 
+int qcom_cc_probe_by_index(struct platform_device *pdev, int index,
+			   const struct qcom_cc_desc *desc)
+{
+	struct regmap *regmap;
+	struct resource *res;
+	void __iomem *base;
+
+	res = platform_get_resource(pdev, IORESOURCE_MEM, index);
+	base = devm_ioremap_resource(&pdev->dev, res);
+	if (IS_ERR(base))
+		return -ENOMEM;
+
+	regmap = devm_regmap_init_mmio(&pdev->dev, base, desc->config);
+	if (IS_ERR(regmap))
+		return PTR_ERR(regmap);
+
+	return qcom_cc_really_probe(pdev, desc, regmap);
+}
+EXPORT_SYMBOL_GPL(qcom_cc_probe_by_index);
+
 MODULE_LICENSE("GPL v2");
diff --git a/drivers/clk/qcom/common.h b/drivers/clk/qcom/common.h
index 1e2a8bdac55a..bb39a7e106d8 100644
--- a/drivers/clk/qcom/common.h
+++ b/drivers/clk/qcom/common.h
@@ -61,5 +61,7 @@ extern int qcom_cc_really_probe(struct platform_device *pdev,
 				struct regmap *regmap);
 extern int qcom_cc_probe(struct platform_device *pdev,
 			 const struct qcom_cc_desc *desc);
+extern int qcom_cc_probe_by_index(struct platform_device *pdev, int index,
+				  const struct qcom_cc_desc *desc);
 
 #endif
diff --git a/drivers/clk/qcom/lpasscc-sdm845.c b/drivers/clk/qcom/lpasscc-sdm845.c
index e246b99dfbc6..56d3e9928892 100644
--- a/drivers/clk/qcom/lpasscc-sdm845.c
+++ b/drivers/clk/qcom/lpasscc-sdm845.c
@@ -112,25 +112,6 @@ static const struct qcom_cc_desc lpass_qdsp6ss_sdm845_desc = {
 	.num_clks = ARRAY_SIZE(lpass_qdsp6ss_sdm845_clocks),
 };
 
-static int lpass_clocks_sdm845_probe(struct platform_device *pdev, int index,
-				     const struct qcom_cc_desc *desc)
-{
-	struct regmap *regmap;
-	struct resource *res;
-	void __iomem *base;
-
-	res = platform_get_resource(pdev, IORESOURCE_MEM, index);
-	base = devm_ioremap_resource(&pdev->dev, res);
-	if (IS_ERR(base))
-		return PTR_ERR(base);
-
-	regmap = devm_regmap_init_mmio(&pdev->dev, base, desc->config);
-	if (IS_ERR(regmap))
-		return PTR_ERR(regmap);
-
-	return qcom_cc_really_probe(pdev, desc, regmap);
-}
-
 static int lpass_cc_sdm845_probe(struct platform_device *pdev)
 {
 	const struct qcom_cc_desc *desc;
@@ -139,14 +120,14 @@ static int lpass_cc_sdm845_probe(struct platform_device *pdev)
 	lpass_regmap_config.name = "cc";
 	desc = &lpass_cc_sdm845_desc;
 
-	ret = lpass_clocks_sdm845_probe(pdev, 0, desc);
+	ret = qcom_cc_probe_by_index(pdev, 0, desc);
 	if (ret)
 		return ret;
 
 	lpass_regmap_config.name = "qdsp6ss";
 	desc = &lpass_qdsp6ss_sdm845_desc;
 
-	return lpass_clocks_sdm845_probe(pdev, 1, desc);
+	return qcom_cc_probe_by_index(pdev, 1, desc);
 }
 
 static const struct of_device_id lpass_cc_sdm845_match_table[] = {
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

