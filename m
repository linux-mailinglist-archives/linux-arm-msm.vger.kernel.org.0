Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AE1343DA2C5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Jul 2021 14:02:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232122AbhG2MC3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 29 Jul 2021 08:02:29 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:38392 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235665AbhG2MC1 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 29 Jul 2021 08:02:27 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1627560145; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=688UHfNbZQ+iDNG/VQQ6XUTKr5YW2SaiI8zFcb4yE/k=; b=C5BNfTlWbyFRlcr9870nSRvoYDpsrQRkb+OsNOY7KOHY+u5SOabJBbJWF24SFL+pfD7gSVZp
 JFAakG3p2sfFEiTOukhQcT2zap8GnQDipUwkM70YTOxRRRAJ9jZlYuYosUC86Ahe7nOS2N9i
 QDvBKqNAnuqYLPhR+hMl3mnhqOg=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-east-1.postgun.com with SMTP id
 610298821dd16c87888359ef (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 29 Jul 2021 12:01:06
 GMT
Sender: rnayak=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 85D94C4360C; Thu, 29 Jul 2021 12:01:04 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from blr-ubuntu-173.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: rnayak)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id A781EC433D3;
        Thu, 29 Jul 2021 12:01:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org A781EC433D3
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=rnayak@codeaurora.org
From:   Rajendra Nayak <rnayak@codeaurora.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org,
        srinivas.kandagatla@linaro.org, robh+dt@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, rbokka@codeaurora.org,
        dianders@chromium.org, Rajendra Nayak <rnayak@codeaurora.org>
Subject: [PATCH v2 2/3] nvmem: qfprom: sc7280: Handle the additional power-domains vote
Date:   Thu, 29 Jul 2021 17:30:35 +0530
Message-Id: <1627560036-1626-3-git-send-email-rnayak@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1627560036-1626-1-git-send-email-rnayak@codeaurora.org>
References: <1627560036-1626-1-git-send-email-rnayak@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On sc7280, to reliably blow fuses, we need an additional vote
on max performance state of 'MX' power-domain.
Add support for power-domain performance state voting in the
driver.

Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
---
 drivers/nvmem/qfprom.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/drivers/nvmem/qfprom.c b/drivers/nvmem/qfprom.c
index 81fbad5..b5f27df 100644
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
 
@@ -139,6 +141,9 @@ static void qfprom_disable_fuse_blowing(const struct qfprom_priv *priv,
 {
 	int ret;
 
+	dev_pm_genpd_set_performance_state(priv->dev, 0);
+	pm_runtime_put(priv->dev);
+
 	/*
 	 * This may be a shared rail and may be able to run at a lower rate
 	 * when we're not blowing fuses.  At the moment, the regulator framework
@@ -212,6 +217,14 @@ static int qfprom_enable_fuse_blowing(const struct qfprom_priv *priv,
 		goto err_clk_rate_set;
 	}
 
+	ret = pm_runtime_get_sync(priv->dev);
+	if (ret < 0) {
+		pm_runtime_put_noidle(priv->dev);
+		dev_err(priv->dev, "Failed to enable power-domain\n");
+		goto err_reg_enable;
+	}
+	dev_pm_genpd_set_performance_state(priv->dev, INT_MAX);
+
 	old->timer_val = readl(priv->qfpconf + QFPROM_BLOW_TIMER_OFFSET);
 	old->accel_val = readl(priv->qfpconf + QFPROM_ACCEL_OFFSET);
 	writel(priv->soc_data->qfprom_blow_timer_value,
@@ -221,6 +234,8 @@ static int qfprom_enable_fuse_blowing(const struct qfprom_priv *priv,
 
 	return 0;
 
+err_reg_enable:
+	regulator_disable(priv->vcc);
 err_clk_rate_set:
 	clk_set_rate(priv->secclk, old->clk_rate);
 err_clk_prepared:
@@ -320,6 +335,11 @@ static int qfprom_reg_read(void *context,
 	return 0;
 }
 
+static void qfprom_runtime_disable(void *data)
+{
+	pm_runtime_disable(data);
+}
+
 static const struct qfprom_soc_data qfprom_7_8_data = {
 	.accel_value = 0xD10,
 	.qfprom_blow_timer_value = 25,
@@ -420,6 +440,12 @@ static int qfprom_probe(struct platform_device *pdev)
 			econfig.reg_write = qfprom_reg_write;
 	}
 
+	ret = devm_add_action_or_reset(dev, qfprom_runtime_disable, dev);
+	if (ret)
+		return ret;
+
+	pm_runtime_enable(dev);
+
 	nvmem = devm_nvmem_register(dev, &econfig);
 
 	return PTR_ERR_OR_ZERO(nvmem);
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

