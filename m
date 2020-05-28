Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A155E1E66AB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 May 2020 17:47:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404710AbgE1PrV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 28 May 2020 11:47:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54308 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404705AbgE1PrT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 28 May 2020 11:47:19 -0400
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 98718C08C5C7
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 May 2020 08:47:19 -0700 (PDT)
Received: by mail-pj1-x1042.google.com with SMTP id nu7so3346387pjb.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 May 2020 08:47:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=LsQCDM2neDPMHnH/0t80dBq+lQkYA0nzb5LOU64sDRo=;
        b=UmyhKM4Jpks9J00t8FKaJjhwAp3CWXCfbjL0jeNN7H8h731llMvtFA/1uul7nDsSW2
         r8lXAjZppv+TRe5sk5OVwRVS6NZpwNufyz7lViBxNmscU7XlWTvv/lpCQa1JA/1yofpT
         FJ+u7puB6jtYSEkZSTzF//xkcIvATOriQAypxMkieuU+topZgBCiB11v3kPtuO8XpZam
         6DiqgMRySkj6CFgQJbEwT2VaI+MUYJv4HL9RQ5JcTsPn1z8ysZeOlNZXZorE/M6c8DgK
         0nQv9rse0TS88b5U/AjkWMPuzVM0WTMRWkAqLP1rBt2Szu7f3FBLcBq4flH0YlSO2vj1
         pphA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=LsQCDM2neDPMHnH/0t80dBq+lQkYA0nzb5LOU64sDRo=;
        b=Dg80FrSp+rK4NINCSemIpHZ46pGvGoEhpCbHmm2JoQDhzpzUKOAg0fLR0clpv/n/bj
         JaJG/JXBBGZPjmLIod1qKyglnRYuDnPpsST51P4b6lZT7hCmqD0+7jhO21V9omAhkbiE
         IJ5xvxVF+BMgSy8W7UnNZ778hyAj0KGeZBQpJqQ8JS4tt10HTX76FWgbBja9BaliEriT
         EHxxO7E9Ygsb885j/DQjplLDXxCbWm8upsdW3CGsum53nH8S8MYFajK2eug+L6NudlV6
         RpCgCjt9sXwwLoYNLY2t0yLjJhEWZU5aDZVyJtton0lbGUHvH4hbGxD0vqFPi0M2jdxs
         5qkw==
X-Gm-Message-State: AOAM532Y/MUpAo4SxL+Kr+9VGs8FrH7qp+G6s8GPX7delpUHaqF6gcRu
        AV253RupFd9IW6nzjQstoLQ9DADZg8yH1Q==
X-Google-Smtp-Source: ABdhPJwrGVxnRHPAj6hGG65lrdgZ7wwXriSr+ERPGBBU3/A2TNUzw23m8eel0A7JJcN7JnWbDwY3XA==
X-Received: by 2002:a17:90a:c788:: with SMTP id gn8mr4431712pjb.230.1590680838985;
        Thu, 28 May 2020 08:47:18 -0700 (PDT)
Received: from nagraj.local ([49.206.21.239])
        by smtp.gmail.com with ESMTPSA id y22sm5212551pfc.132.2020.05.28.08.47.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2020 08:47:18 -0700 (PDT)
From:   Sumit Semwal <sumit.semwal@linaro.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org, lgirdwood@gmail.com,
        broonie@kernel.org, robh+dt@kernel.org
Cc:     nishakumari@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        kgunda@codeaurora.org, rnayak@codeaurora.org,
        Sumit Semwal <sumit.semwal@linaro.org>
Subject: [PATCH v3 5/5] regulator: qcom: labibb: Add SC interrupt handling
Date:   Thu, 28 May 2020 21:16:25 +0530
Message-Id: <20200528154625.17742-6-sumit.semwal@linaro.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200528154625.17742-1-sumit.semwal@linaro.org>
References: <20200528154625.17742-1-sumit.semwal@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Nisha Kumari <nishakumari@codeaurora.org>

Add Short circuit interrupt handling and recovery for the lab and
ibb regulators on qcom platforms.

The client panel drivers need to register for REGULATOR_EVENT_OVER_CURRENT
notification which will be triggered on short circuit. They should
try to enable the regulator once, and if it doesn't get enabled,
handle shutting down the panel accordingly.

Signed-off-by: Nisha Kumari <nishakumari@codeaurora.org>
Signed-off-by: Sumit Semwal <sumit.semwal@linaro.org>

--
v2: sumits: reworked handling to user regmap_read_poll_timeout, and handle it
     per-regulator instead of clearing both lab and ibb errors on either irq
     triggering. Also added REGULATOR_EVENT_OVER_CURRENT handling and
     notification to clients.
v3: sumits: updated as per review comments of v2: removed spurious check for
     irq in handler and some unused variables; inlined some of the code,
     omitted IRQF_TRIGGER_RISING as it's coming from DT.

---
 drivers/regulator/qcom-labibb-regulator.c | 92 +++++++++++++++++++++++
 1 file changed, 92 insertions(+)

diff --git a/drivers/regulator/qcom-labibb-regulator.c b/drivers/regulator/qcom-labibb-regulator.c
index 634d08461c6e..695ffac71e81 100644
--- a/drivers/regulator/qcom-labibb-regulator.c
+++ b/drivers/regulator/qcom-labibb-regulator.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0-only
 // Copyright (c) 2020, The Linux Foundation. All rights reserved.
 
+#include <linux/interrupt.h>
 #include <linux/module.h>
 #include <linux/of_irq.h>
 #include <linux/of.h>
@@ -18,6 +19,7 @@
 #define REG_LABIBB_ENABLE_CTL		0x46
 #define LABIBB_STATUS1_VREG_OK_BIT	BIT(7)
 #define LABIBB_CONTROL_ENABLE		BIT(7)
+#define LABIBB_STATUS1_SC_DETECT_BIT	BIT(6)
 
 #define LAB_ENABLE_CTL_MASK		BIT(7)
 #define IBB_ENABLE_CTL_MASK		(BIT(7) | BIT(6))
@@ -27,12 +29,17 @@
 #define IBB_POLL_ENABLED_TIME		(LABIBB_ENABLE_TIME * 10)
 #define LABIBB_OFF_ON_DELAY		(8200)
 
+#define POLLING_SCP_DONE_INTERVAL_US	5000
+#define POLLING_SCP_TIMEOUT		16000
+
 struct labibb_regulator {
 	struct regulator_desc		desc;
 	struct device			*dev;
 	struct regmap			*regmap;
 	struct regulator_dev		*rdev;
 	u16				base;
+	int				sc_irq;
+	int				vreg_enabled;
 	u8				type;
 };
 
@@ -65,6 +72,8 @@ static int qcom_labibb_regulator_enable(struct regulator_dev *rdev)
 	if (ret < 0)
 		dev_err(reg->dev, "Write failed: enable %s regulator\n",
 			reg->desc.name);
+	else
+		reg->vreg_enabled = 1;
 
 	return ret;
 }
@@ -78,6 +87,8 @@ static int qcom_labibb_regulator_disable(struct regulator_dev *rdev)
 	if (ret < 0)
 		dev_err(reg->dev, "Disable failed: disable %s\n",
 			reg->desc.name);
+	else
+		reg->vreg_enabled = 0;
 
 	return ret;
 }
@@ -88,11 +99,70 @@ static struct regulator_ops qcom_labibb_ops = {
 	.is_enabled		= qcom_labibb_regulator_is_enabled,
 };
 
+static irqreturn_t labibb_sc_err_handler(int irq, void *_reg)
+{
+	int ret;
+	u16 reg;
+	unsigned int val;
+	struct labibb_regulator *labibb_reg = _reg;
+	bool in_sc_err, scp_done = false;
+
+	ret = regmap_read(labibb_reg->regmap,
+			  labibb_reg->base + REG_LABIBB_STATUS1, &val);
+	if (ret < 0) {
+		dev_err(labibb_reg->dev, "sc_err_irq: Read failed, ret=%d\n",
+			ret);
+		return IRQ_HANDLED;
+	}
+
+	dev_dbg(labibb_reg->dev, "%s SC error triggered! STATUS1 = %d\n",
+		labibb_reg->desc.name, val);
+
+	in_sc_err = !!(val & LABIBB_STATUS1_SC_DETECT_BIT);
+
+	/*
+	 * The SC(short circuit) fault would trigger PBS(Portable Batch
+	 * System) to disable regulators for protection. This would
+	 * cause the SC_DETECT status being cleared so that it's not
+	 * able to get the SC fault status.
+	 * Check if the regulator is enabled in the driver but
+	 * disabled in hardware, this means a SC fault had happened
+	 * and SCP handling is completed by PBS.
+	 */
+	if (!in_sc_err) {
+
+		reg = labibb_reg->base + REG_LABIBB_ENABLE_CTL;
+
+		ret = regmap_read_poll_timeout(labibb_reg->regmap,
+					reg, val,
+					!(val & LABIBB_CONTROL_ENABLE),
+					POLLING_SCP_DONE_INTERVAL_US,
+					POLLING_SCP_TIMEOUT);
+
+		if (!ret && labibb_reg->vreg_enabled) {
+			dev_dbg(labibb_reg->dev,
+				"%s has been disabled by SCP\n",
+				labibb_reg->desc.name);
+			scp_done = true;
+		}
+	}
+
+	if (in_sc_err || scp_done) {
+		regulator_lock(labibb_reg->rdev);
+		regulator_notifier_call_chain(labibb_reg->rdev,
+						REGULATOR_EVENT_OVER_CURRENT,
+						NULL);
+		regulator_unlock(labibb_reg->rdev);
+	}
+	return IRQ_HANDLED;
+}
+
 static int register_labibb_regulator(struct labibb_regulator *reg,
 				const struct labibb_regulator_data *reg_data,
 				struct device_node *of_node)
 {
 	struct regulator_config cfg = {};
+	int ret;
 
 	reg->base = reg_data->base;
 	reg->type = reg_data->type;
@@ -108,6 +178,28 @@ static int register_labibb_regulator(struct labibb_regulator *reg,
 	reg->desc.poll_enabled_time = reg_data->poll_enabled_time;
 	reg->desc.off_on_delay = LABIBB_OFF_ON_DELAY;
 
+	reg->sc_irq = -EINVAL;
+	ret = of_irq_get_byname(of_node, "sc-err");
+	if (ret < 0) {
+		dev_err(reg->dev, "Unable to get sc-err, ret = %d\n",
+			ret);
+		return ret;
+	} else
+		reg->sc_irq = ret;
+
+	if (reg->sc_irq > 0) {
+		ret = devm_request_threaded_irq(reg->dev,
+						reg->sc_irq,
+						NULL, labibb_sc_err_handler,
+						IRQF_ONESHOT,
+						"sc-err", reg);
+		if (ret) {
+			dev_err(reg->dev, "Failed to register sc-err irq ret=%d\n",
+				ret);
+			return ret;
+		}
+	}
+
 	cfg.dev = reg->dev;
 	cfg.driver_data = reg;
 	cfg.regmap = reg->regmap;
-- 
2.26.2

