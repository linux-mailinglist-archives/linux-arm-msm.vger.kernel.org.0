Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 71A6C3DB3D2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Jul 2021 08:46:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237640AbhG3Gqy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 30 Jul 2021 02:46:54 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:44839 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237648AbhG3Gqx (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 30 Jul 2021 02:46:53 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1627627609; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=q2HjiKWyvokI6bbsPf13zxaAKnbnYtpqJtgjdG1T7G8=; b=HjipMYrjUwHax1gqh8umqnEQsP5ktYTkRsqJ26dNc8AHwNAZhPHDAKkOlKcZ55Wp94tFqzJw
 jSDpOQFmri0Xyg1v9dokJwLRONlY1BQDpnac4yjVWze+EX7EyhVo5logU0lrw+y51odNyNlJ
 r96yxrfLPEpiBhRUmVDdJ8VMT/c=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-west-2.postgun.com with SMTP id
 6103a057e81205dd0ace208e (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 30 Jul 2021 06:46:47
 GMT
Sender: rnayak=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id B9B13C43217; Fri, 30 Jul 2021 06:46:47 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from blr-ubuntu-173.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: rnayak)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id EFA9AC433D3;
        Fri, 30 Jul 2021 06:46:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org EFA9AC433D3
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=rnayak@codeaurora.org
From:   Rajendra Nayak <rnayak@codeaurora.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org,
        srinivas.kandagatla@linaro.org, robh+dt@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, rbokka@codeaurora.org,
        dianders@chromium.org, Rajendra Nayak <rnayak@codeaurora.org>
Subject: [PATCH v3 3/4] nvmem: qfprom: sc7280: Handle the additional power-domains vote
Date:   Fri, 30 Jul 2021 12:16:12 +0530
Message-Id: <1627627573-32454-4-git-send-email-rnayak@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1627627573-32454-1-git-send-email-rnayak@codeaurora.org>
References: <1627627573-32454-1-git-send-email-rnayak@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On sc7280, to reliably blow fuses, we need an additional vote
on max performance state of 'MX' power-domain.
Add support for power-domain performance state voting in the
driver.

Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
Reviewed-by: Douglas Anderson <dianders@chromium.org>
---
 drivers/nvmem/qfprom.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/drivers/nvmem/qfprom.c b/drivers/nvmem/qfprom.c
index b0ca4c6..c500d62 100644
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
 
@@ -142,6 +144,9 @@ static void qfprom_disable_fuse_blowing(const struct qfprom_priv *priv,
 	writel(old->timer_val, priv->qfpconf + QFPROM_BLOW_TIMER_OFFSET);
 	writel(old->accel_val, priv->qfpconf + QFPROM_ACCEL_OFFSET);
 
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
@@ -420,6 +440,11 @@ static int qfprom_probe(struct platform_device *pdev)
 			econfig.reg_write = qfprom_reg_write;
 	}
 
+	pm_runtime_enable(dev);
+	ret = devm_add_action_or_reset(dev, qfprom_runtime_disable, dev);
+	if (ret)
+		return ret;
+
 	nvmem = devm_nvmem_register(dev, &econfig);
 
 	return PTR_ERR_OR_ZERO(nvmem);
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

