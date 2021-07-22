Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 877783D1D64
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jul 2021 07:29:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230234AbhGVEsh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 22 Jul 2021 00:48:37 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:23125 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230187AbhGVEsg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 22 Jul 2021 00:48:36 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1626931752; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=NMzBBtYS6mPKSsDJSCvICZcI50wTwRIIqwTtE75ybxg=; b=cp9v6h+gQQXX75JDUB+w0glNHY61TZSZXtEWd76PmjgmSJTNtPj3KFZUmYAsSU5KsnL7ON9C
 gmhax+rFLG5s4Zo7S0E51goMjop6W0TJCXJ8o+Y9dXOVGg5uPMDCgumvzwLvHNJ0dQ8zaqdi
 vKBofd1bm9K08Ag2LWTpfuYrbyo=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-west-2.postgun.com with SMTP id
 60f9021ae81205dd0acd48e5 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 22 Jul 2021 05:28:58
 GMT
Sender: rnayak=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 2C019C43460; Thu, 22 Jul 2021 05:28:58 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from blr-ubuntu-173.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: rnayak)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 31C66C433D3;
        Thu, 22 Jul 2021 05:28:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 31C66C433D3
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=rnayak@codeaurora.org
From:   Rajendra Nayak <rnayak@codeaurora.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org,
        srinivas.kandagatla@linaro.org, robh+dt@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, rbokka@codeaurora.org,
        Rajendra Nayak <rnayak@codeaurora.org>
Subject: [PATCH 2/3] nvmem: qfprom: sc7280: Handle the additional power-domains vote
Date:   Thu, 22 Jul 2021 10:58:35 +0530
Message-Id: <1626931716-10591-3-git-send-email-rnayak@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1626931716-10591-1-git-send-email-rnayak@codeaurora.org>
References: <1626931716-10591-1-git-send-email-rnayak@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On sc7280, to reliably blow fuses, we need an additional vote
on max performance state of 'MX' power-domain.
Add support for power-domain performance state voting in the
driver.

Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
---
 drivers/nvmem/qfprom.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/nvmem/qfprom.c b/drivers/nvmem/qfprom.c
index 81fbad5..4d0a576 100644
--- a/drivers/nvmem/qfprom.c
+++ b/drivers/nvmem/qfprom.c
@@ -12,6 +12,8 @@
 #include <linux/mod_devicetable.h>
 #include <linux/nvmem-provider.h>
 #include <linux/platform_device.h>
+#include <linux/pm_domain.h>
+#include <linux/pm_runtime.h>
 #include <linux/property.h>
 #include <linux/regulator/consumer.h>
 
@@ -149,6 +151,11 @@ static void qfprom_disable_fuse_blowing(const struct qfprom_priv *priv,
 	if (ret)
 		dev_warn(priv->dev, "Failed to set 0 voltage (ignoring)\n");
 
+	if (priv->dev->pm_domain) {
+		dev_pm_genpd_set_performance_state(priv->dev, 0);
+		pm_runtime_put(priv->dev);
+	}
+
 	ret = regulator_disable(priv->vcc);
 	if (ret)
 		dev_warn(priv->dev, "Failed to disable regulator (ignoring)\n");
@@ -212,6 +219,16 @@ static int qfprom_enable_fuse_blowing(const struct qfprom_priv *priv,
 		goto err_clk_rate_set;
 	}
 
+	if (priv->dev->pm_domain) {
+		ret = pm_runtime_get_sync(priv->dev);
+		if (ret < 0) {
+			pm_runtime_put_noidle(priv->dev);
+			dev_err(priv->dev, "Failed to enable power-domain\n");
+			goto err_reg_enable;
+		}
+		dev_pm_genpd_set_performance_state(priv->dev, INT_MAX);
+	}
+
 	old->timer_val = readl(priv->qfpconf + QFPROM_BLOW_TIMER_OFFSET);
 	old->accel_val = readl(priv->qfpconf + QFPROM_ACCEL_OFFSET);
 	writel(priv->soc_data->qfprom_blow_timer_value,
@@ -221,6 +238,8 @@ static int qfprom_enable_fuse_blowing(const struct qfprom_priv *priv,
 
 	return 0;
 
+err_reg_enable:
+	regulator_disable(priv->vcc);
 err_clk_rate_set:
 	clk_set_rate(priv->secclk, old->clk_rate);
 err_clk_prepared:
@@ -420,6 +439,9 @@ static int qfprom_probe(struct platform_device *pdev)
 			econfig.reg_write = qfprom_reg_write;
 	}
 
+	if (dev->pm_domain)
+		pm_runtime_enable(dev);
+
 	nvmem = devm_nvmem_register(dev, &econfig);
 
 	return PTR_ERR_OR_ZERO(nvmem);
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

