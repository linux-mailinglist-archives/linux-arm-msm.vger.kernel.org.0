Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 321281EB92D
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Jun 2020 12:12:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728066AbgFBKKD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 2 Jun 2020 06:10:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47212 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728050AbgFBKJ7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 2 Jun 2020 06:09:59 -0400
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com [IPv6:2607:f8b0:4864:20::1044])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 563CAC05BD43
        for <linux-arm-msm@vger.kernel.org>; Tue,  2 Jun 2020 03:09:58 -0700 (PDT)
Received: by mail-pj1-x1044.google.com with SMTP id m2so1218445pjv.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 Jun 2020 03:09:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=wsqa0aiNnjxSKSxZ07dY/8X+UeLS5BJ6SaHqCOj/zLM=;
        b=lSddc/AvN4z9zX0shlWtxeHp4IJFJCOtqh4MGjrINjiStIZWUQKc3yOAQuFdZJI06k
         Vgy0UakBX9xert0KE1UF87P6NBRdcXPOptUNsYNpDvrAnNp1csMaFaG6DaxQeLZTBFt1
         +HoTwMoBRqgd7Kx6DaTJKw9XgING9jXQsWc3DtKEdhn2tKdTbZEB2kkGmk2VBgyPjTh6
         e9wj6eyF2irxqoUdh51pQk+J/3XrBBgkHPFn5f+2m0+sjSP4g2cq9nT3RbJymdxn+gOv
         bydoevKbA+rxapu0nSr+tOr1TEEJPW01CMxZe7OMGPr9/LAMY2MvEQy6dcJxQRhCg4AW
         aGdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=wsqa0aiNnjxSKSxZ07dY/8X+UeLS5BJ6SaHqCOj/zLM=;
        b=otH0ntewH53RXcfajcIsanf54e9ui6MWGhjHlKu31ilZuqPn8lF1tbmFAs0v5/9O8X
         uRQ4jFFIE2IFn3OG8cKgKLEq96jcbqpeKNc/f4jM0QRVBxGe7Ei6oEpPHT9A2u3i+pgK
         1RbqDD45Mn9g/bXQPKcRFAIKbTbDZi2Ox7UUxDHZZ4NihPRSe7ouzpY3isp8MXbjbWue
         iAKAINsg+tU8lM07h+j4o21gtCpeXxOWH3EQYgNjaBfnMQAp6wKpF0HEx7izl2BbzzYX
         qUWnrIP6oLJGhEkIrS9HMeI6bg4a3+2uQdwa5N0Ukk6HdUhLK831dtrYwc72SqniDBVc
         VyjQ==
X-Gm-Message-State: AOAM530eMMdGbrPm8cr8Rk+sU3dD7ai9muwaLTBPIzpWclr8m2xNZ0RC
        q963XfpGeZMQhyevZ3vSNVTLJw==
X-Google-Smtp-Source: ABdhPJxBYq+KqFnjJ1UQ+HHg3VFRhBmTfHQTgVlsT9+2hmQTf2hYbGj9JKW5daP2oYzepPi6Pw4uMg==
X-Received: by 2002:a17:90a:3669:: with SMTP id s96mr4644955pjb.149.1591092597818;
        Tue, 02 Jun 2020 03:09:57 -0700 (PDT)
Received: from nagraj.local ([49.206.21.239])
        by smtp.gmail.com with ESMTPSA id d8sm1931276pgb.42.2020.06.02.03.09.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2020 03:09:57 -0700 (PDT)
From:   Sumit Semwal <sumit.semwal@linaro.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org, lgirdwood@gmail.com,
        broonie@kernel.org, robh+dt@kernel.org
Cc:     nishakumari@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        kgunda@codeaurora.org, rnayak@codeaurora.org,
        Sumit Semwal <sumit.semwal@linaro.org>
Subject: [PATCH v4 5/5] regulator: qcom: labibb: Add SC interrupt handling
Date:   Tue,  2 Jun 2020 15:39:24 +0530
Message-Id: <20200602100924.26256-6-sumit.semwal@linaro.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200602100924.26256-1-sumit.semwal@linaro.org>
References: <20200602100924.26256-1-sumit.semwal@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Nisha Kumari <nishakumari@codeaurora.org>

Add Short circuit interrupt handling and recovery for the lab and ibb
regulators on qcom platforms.

The client panel drivers need to register for REGULATOR_EVENT_OVER_CURRENT
notification which will be triggered on short circuit. They should
try to enable the regulator once, and if it doesn't get enabled,
handle shutting down the panel accordingly.

Signed-off-by: Nisha Kumari <nishakumari@codeaurora.org>
Signed-off-by: Sumit Semwal <sumit.semwal@linaro.org>
    [sumits: updated to rework to use regmap_read_poll_timeout, handle it per
             regulator, add REGULATOR_EVENT_OVER_CURRENT handling and
             notification to clients and other cleanup]
--
v2: sumits: reworked handling to user regmap_read_poll_timeout, and handle it
     per-regulator instead of clearing both lab and ibb errors on either irq
     triggering. Also added REGULATOR_EVENT_OVER_CURRENT handling and
     notification to clients.
v3: sumits: updated as per review comments of v2: removed spurious check for
     irq in handler and some unused variables; inlined some of the code,
     omitted IRQF_TRIGGER_RISING as it's coming from DT.
v4: sumits: updated 'int vreg_enabled' to 'boot enabled', made sc_irq a local var
     and other review comments from v3.
---
 drivers/regulator/qcom-labibb-regulator.c | 102 +++++++++++++++++++++-
 1 file changed, 99 insertions(+), 3 deletions(-)

diff --git a/drivers/regulator/qcom-labibb-regulator.c b/drivers/regulator/qcom-labibb-regulator.c
index 33b764ac69d1..bca0308b26dd 100644
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
@@ -27,12 +29,16 @@
 #define IBB_ENABLE_TIME			(LABIBB_OFF_ON_DELAY * 10)
 #define LABIBB_POLL_ENABLED_TIME	1000
 
+#define POLLING_SCP_DONE_INTERVAL_US	5000
+#define POLLING_SCP_TIMEOUT		16000
+
 struct labibb_regulator {
 	struct regulator_desc		desc;
 	struct device			*dev;
 	struct regmap			*regmap;
 	struct regulator_dev		*rdev;
 	u16				base;
+	bool				enabled;
 	u8				type;
 };
 
@@ -59,12 +65,26 @@ static int qcom_labibb_regulator_is_enabled(struct regulator_dev *rdev)
 
 static int qcom_labibb_regulator_enable(struct regulator_dev *rdev)
 {
-	return regulator_enable_regmap(rdev);
+	int ret;
+	struct labibb_regulator *reg = rdev_get_drvdata(rdev);
+
+	ret = regulator_enable_regmap(rdev);
+	if (ret >= 0)
+		reg->enabled = true;
+
+	return ret;
 }
 
 static int qcom_labibb_regulator_disable(struct regulator_dev *rdev)
 {
-	return regulator_disable_regmap(rdev);
+	int ret = 0;
+	struct labibb_regulator *reg = rdev_get_drvdata(rdev);
+
+	ret = regulator_disable_regmap(rdev);
+	if (ret >= 0)
+		reg->enabled = false;
+
+	return ret;
 }
 
 static struct regulator_ops qcom_labibb_ops = {
@@ -73,12 +93,70 @@ static struct regulator_ops qcom_labibb_ops = {
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
+		if (!ret && labibb_reg->enabled) {
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
 static struct regulator_dev *register_labibb_regulator(struct labibb_regulator *reg,
 				const struct labibb_regulator_data *reg_data,
 				struct device_node *of_node)
 {
 	struct regulator_config cfg = {};
-	int ret;
+	int ret, sc_irq;
 
 	reg->base = reg_data->base;
 	reg->type = reg_data->type;
@@ -95,6 +173,24 @@ static struct regulator_dev *register_labibb_regulator(struct labibb_regulator *
 	reg->desc.poll_enabled_time = LABIBB_POLL_ENABLED_TIME;
 	reg->desc.off_on_delay = LABIBB_OFF_ON_DELAY;
 
+	sc_irq = of_irq_get_byname(of_node, "sc-err");
+	if (sc_irq < 0) {
+		dev_err(reg->dev, "Unable to get sc-err, ret = %d\n",
+			sc_irq);
+		return ERR_PTR(sc_irq);
+	} else {
+		ret = devm_request_threaded_irq(reg->dev,
+						sc_irq,
+						NULL, labibb_sc_err_handler,
+						IRQF_ONESHOT,
+						"sc-err", reg);
+		if (ret) {
+			dev_err(reg->dev, "Failed to register sc-err irq ret=%d\n",
+				ret);
+			return ERR_PTR(ret);
+		}
+	}
+
 	cfg.dev = reg->dev;
 	cfg.driver_data = reg;
 	cfg.regmap = reg->regmap;
-- 
2.26.2

