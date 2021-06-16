Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3B4C73A9D0D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Jun 2021 16:11:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233831AbhFPONb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 16 Jun 2021 10:13:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49382 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233840AbhFPONa (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 16 Jun 2021 10:13:30 -0400
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E3C2AC0617AD
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Jun 2021 07:11:23 -0700 (PDT)
Received: by mail-wr1-x42b.google.com with SMTP id o3so2870705wri.8
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Jun 2021 07:11:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=HWrm484FRw+CXBsUVTC9kLTPetzFLV6N+ldivPXQSA0=;
        b=ivOr+KReobJtkhuIa7uOD3UErbtxb02cL0h/pdDUfPd2qxzaK7FzKkCpHpjnh4ukwG
         o1r/pj8GTabRMnFi6VXJW2E7ILfmHvZJQuD2MYwYbaJzrpl5iwksBJNc2NPnZU9xaPe5
         zw7wK4KKkEl/563ebuvmF+4iNE3ThvFxMsGfAlK14v59xaNf4afPc0kiud3mZn9yreLZ
         nJmvDR9Rx5OGjkKA9OtgHD01jt5VmEvEUNsP6iwJNTbyZXG959qJ3EloczxuOECB8UPc
         MfBoAWyV14dclN1F8gwKDXgrbnOJZm9hn15En+SUGdGSFeDyLT0NFjrrss6xG1qAlizq
         f/lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=HWrm484FRw+CXBsUVTC9kLTPetzFLV6N+ldivPXQSA0=;
        b=p4f//MHGQeanLUkP663QJMkMLb9jfWWli09xjIbRSEDBBfTBGlDhwbALDNQyNfrBBS
         dF80YQRXmouj2OGbDo8L44gg5D/eQu/jTyxUH5q0ejZ2A62jEic+sdwkcxgCwhvwHdYQ
         iJWAmmll6rmgKjJ0EMHh++KPkzD03zOkx6b/OT0ukECDaHFLyAqmv7w4vBAqdbaHZR5Q
         iBGGD2BuXegJEuhja+xEljbBYmFZQgAw0GZTfB2rQwnGzmUJdYfldnmR2hzMvnhfWad7
         ui216yeDGEkdn3z3i2k7blGQnl5H/JieUmV57MbuNtQ1SoGpZWO/8xY5+qDBXRvIMsi3
         ALKw==
X-Gm-Message-State: AOAM532IEwrw+auSlnpiCV7cvplaJmoN4uuVi/kakZ+BQHgtrT4/9Y+M
        NdoNWcqi2km//QxjZYhk3RuVdw==
X-Google-Smtp-Source: ABdhPJw3mm7O7zgao92i3rJ6WysW+SjgDk4ImvXB6e197fqQvYGczKWByxEDaN4yrrG+evFXBetgJA==
X-Received: by 2002:a5d:6b0e:: with SMTP id v14mr5661024wrw.297.1623852682379;
        Wed, 16 Jun 2021 07:11:22 -0700 (PDT)
Received: from xps7590.fritz.box ([2a02:2454:3e5:b700:9df7:76e5:7e94:bf1e])
        by smtp.gmail.com with ESMTPSA id g83sm1968375wma.10.2021.06.16.07.11.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jun 2021 07:11:22 -0700 (PDT)
From:   Robert Foss <robert.foss@linaro.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org,
        mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
        jonathan@marek.ca, tdas@codeaurora.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Vinod Koul <vinod.koul@linaro.org>
Cc:     Robert Foss <robert.foss@linaro.org>
Subject: [RFC v1 01/11] clk: qcom: common: Add runtime init/suspend/resume
Date:   Wed, 16 Jun 2021 16:10:57 +0200
Message-Id: <20210616141107.291430-2-robert.foss@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210616141107.291430-1-robert.foss@linaro.org>
References: <20210616141107.291430-1-robert.foss@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Ported over from the downstream driver. Is used by SM8350 DISPCC & VIDEOCC.

This patch includes support for initializing interconnect bandwidth voting.

Signed-off-by: Robert Foss <robert.foss@linaro.org>
---
 drivers/clk/qcom/common.c | 92 +++++++++++++++++++++++++++++++++++++++
 drivers/clk/qcom/common.h |  6 +++
 2 files changed, 98 insertions(+)

diff --git a/drivers/clk/qcom/common.c b/drivers/clk/qcom/common.c
index 60d2a78d1395..1375c5de1bd1 100644
--- a/drivers/clk/qcom/common.c
+++ b/drivers/clk/qcom/common.c
@@ -3,13 +3,17 @@
  * Copyright (c) 2013-2014, The Linux Foundation. All rights reserved.
  */
 
+#include <linux/clk.h>
 #include <linux/export.h>
+#include <linux/interconnect.h>
 #include <linux/module.h>
 #include <linux/regmap.h>
 #include <linux/platform_device.h>
 #include <linux/clk-provider.h>
 #include <linux/reset-controller.h>
 #include <linux/of.h>
+#include <linux/pm_clock.h>
+#include <linux/pm_runtime.h>
 
 #include "common.h"
 #include "clk-rcg.h"
@@ -329,4 +333,92 @@ int qcom_cc_probe_by_index(struct platform_device *pdev, int index,
 }
 EXPORT_SYMBOL_GPL(qcom_cc_probe_by_index);
 
+int qcom_cc_runtime_init(struct platform_device *pdev,
+			 struct qcom_cc_desc *desc)
+{
+	struct device *dev = &pdev->dev;
+	struct clk *clk;
+	int ret;
+
+	clk = clk_get_optional(dev, "iface");
+	if (IS_ERR(clk)) {
+		if (PTR_ERR(clk) != -EPROBE_DEFER)
+			dev_err(dev, "unable to get iface clock\n");
+		return PTR_ERR(clk);
+	}
+	clk_put(clk);
+
+	desc->path = of_icc_get(dev, NULL);
+	if (IS_ERR(desc->path)) {
+		if (PTR_ERR(desc->path) != -EPROBE_DEFER)
+			dev_err(dev, "error getting path\n");
+		return PTR_ERR(desc->path);
+	}
+
+	platform_set_drvdata(pdev, desc);
+	pm_runtime_enable(dev);
+
+	ret = pm_clk_create(dev);
+	if (ret)
+		goto disable_pm_runtime;
+
+	ret = pm_clk_add(dev, "iface");
+	if (ret < 0) {
+		dev_err(dev, "failed to acquire iface clock\n");
+		goto destroy_pm_clk;
+	}
+
+	return 0;
+
+destroy_pm_clk:
+	pm_clk_destroy(dev);
+
+disable_pm_runtime:
+	pm_runtime_disable(dev);
+	icc_put(desc->path);
+
+	return ret;
+}
+EXPORT_SYMBOL(qcom_cc_runtime_init);
+
+int qcom_cc_runtime_resume(struct device *dev)
+{
+	struct qcom_cc_desc *desc = dev_get_drvdata(dev);
+	int ret;
+
+	if (desc->path) {
+		ret = icc_set_bw(desc->path, 0, 1);
+		if (ret) {
+			dev_warn(dev, "%s: failed to vote bw\n", __func__);
+			return ret;
+		}
+	}
+
+	ret = pm_clk_resume(dev);
+	if (ret)
+		dev_warn(dev, "%s: failed to enable clocks\n", __func__);
+
+	return ret;
+}
+EXPORT_SYMBOL(qcom_cc_runtime_resume);
+
+int qcom_cc_runtime_suspend(struct device *dev)
+{
+	struct qcom_cc_desc *desc = dev_get_drvdata(dev);
+	int ret;
+
+	ret = pm_clk_suspend(dev);
+	if (ret)
+		dev_warn(dev, "%s: failed to disable clocks\n", __func__);
+
+	if (desc->path) {
+		ret = icc_set_bw(desc->path, 0, 0);
+		if (ret)
+			dev_warn(dev, "%s: failed to unvote bw\n", __func__);
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL(qcom_cc_runtime_suspend);
+
 MODULE_LICENSE("GPL v2");
diff --git a/drivers/clk/qcom/common.h b/drivers/clk/qcom/common.h
index bb39a7e106d8..e2a9dbd1529d 100644
--- a/drivers/clk/qcom/common.h
+++ b/drivers/clk/qcom/common.h
@@ -29,6 +29,7 @@ struct qcom_cc_desc {
 	size_t num_gdscs;
 	struct clk_hw **clk_hws;
 	size_t num_clk_hws;
+	struct icc_path *path;
 };
 
 /**
@@ -64,4 +65,9 @@ extern int qcom_cc_probe(struct platform_device *pdev,
 extern int qcom_cc_probe_by_index(struct platform_device *pdev, int index,
 				  const struct qcom_cc_desc *desc);
 
+int qcom_cc_runtime_init(struct platform_device *pdev,
+			 struct qcom_cc_desc *desc);
+int qcom_cc_runtime_suspend(struct device *dev);
+int qcom_cc_runtime_resume(struct device *dev);
+
 #endif
-- 
2.30.2

