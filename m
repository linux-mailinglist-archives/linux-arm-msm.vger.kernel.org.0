Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 38E591ADF3C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Apr 2020 16:10:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730764AbgDQOFu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 17 Apr 2020 10:05:50 -0400
Received: from mail26.static.mailgun.info ([104.130.122.26]:23788 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1730998AbgDQOFt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 17 Apr 2020 10:05:49 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1587132348; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=CN4hjm7aZcN+iyfH3H8zWKIe1rY4Y4n7ceS2lTKBT6E=; b=bWLAGH+dTRwEaw/FxqUax+VgtVHINYOhn1jfByveMCO3oglX2X7Tn1dsCtuj8eIjTtB1Zf3u
 gR4sYvamiL0K4jjJk4VydSQUjYgJ6rKU+JsXL+XZMAtjqwESqYv1kttZmzlUAUmZN5INIFJC
 7t4J5YFpQuIGH+NYO177hehCEo8=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e99b7b3.7efc49ed2ca8-smtp-out-n04;
 Fri, 17 Apr 2020 14:05:39 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 7E844C494AA; Fri, 17 Apr 2020 14:05:36 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from blr-ubuntu-173.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: rnayak)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 64B3CC44788;
        Fri, 17 Apr 2020 14:05:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 64B3CC44788
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=rnayak@codeaurora.org
From:   Rajendra Nayak <rnayak@codeaurora.org>
To:     viresh.kumar@linaro.org, sboyd@kernel.org,
        bjorn.andersson@linaro.org, agross@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mka@chromium.org,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        dri-devel@lists.freedesktop.org
Subject: [PATCH v2 05/17] drm/msm/dpu: Use OPP API to set clk/perf state
Date:   Fri, 17 Apr 2020 19:34:27 +0530
Message-Id: <1587132279-27659-6-git-send-email-rnayak@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1587132279-27659-1-git-send-email-rnayak@codeaurora.org>
References: <1587132279-27659-1-git-send-email-rnayak@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On some qualcomm platforms DPU needs to express a perforamnce state
requirement on a power domain depennding on the clock rates.
Use OPP table from DT to register with OPP framework and use
dev_pm_opp_set_rate() to set the clk/perf state.

Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
Cc: Rob Clark <robdclark@gmail.com>
Cc: Sean Paul <sean@poorly.run>
Cc: dri-devel@lists.freedesktop.org
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c |  3 ++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       | 20 +++++++++++++++++++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h       |  4 ++++
 3 files changed, 25 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
index 11f2beb..fe5717df 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
@@ -7,6 +7,7 @@
 #include <linux/debugfs.h>
 #include <linux/errno.h>
 #include <linux/mutex.h>
+#include <linux/pm_opp.h>
 #include <linux/sort.h>
 #include <linux/clk.h>
 #include <linux/bitmap.h>
@@ -239,7 +240,7 @@ static int _dpu_core_perf_set_core_clk_rate(struct dpu_kms *kms, u64 rate)
 		rate = core_clk->max_rate;
 
 	core_clk->rate = rate;
-	return msm_dss_clk_set_rate(core_clk, 1);
+	return dev_pm_opp_set_rate(&kms->pdev->dev, core_clk->rate);
 }
 
 static u64 _dpu_core_perf_get_core_clk_rate(struct dpu_kms *kms)
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index ce19f1d..cfce642 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -10,6 +10,7 @@
 #include <linux/debugfs.h>
 #include <linux/dma-buf.h>
 #include <linux/of_irq.h>
+#include <linux/pm_opp.h>
 
 #include <drm/drm_crtc.h>
 #include <drm/drm_file.h>
@@ -1033,11 +1034,18 @@ static int dpu_bind(struct device *dev, struct device *master, void *data)
 	if (!dpu_kms)
 		return -ENOMEM;
 
+	dpu_kms->opp = dev_pm_opp_set_clkname(dev, "core");
+	if (IS_ERR(dpu_kms->opp))
+		return PTR_ERR(dpu_kms->opp);
+	/* OPP table is optional */
+	if (!dev_pm_opp_of_add_table(dev))
+		dpu_kms->opp_table = true;
+
 	mp = &dpu_kms->mp;
 	ret = msm_dss_parse_clock(pdev, mp);
 	if (ret) {
 		DPU_ERROR("failed to parse clocks, ret=%d\n", ret);
-		return ret;
+		goto err;
 	}
 
 	platform_set_drvdata(pdev, dpu_kms);
@@ -1051,6 +1059,11 @@ static int dpu_bind(struct device *dev, struct device *master, void *data)
 
 	priv->kms = &dpu_kms->base;
 	return ret;
+err:
+	if (dpu_kms->opp_table)
+		dev_pm_opp_of_remove_table(dev);
+	dev_pm_opp_put_clkname(dpu_kms->opp);
+	return ret;
 }
 
 static void dpu_unbind(struct device *dev, struct device *master, void *data)
@@ -1059,6 +1072,9 @@ static void dpu_unbind(struct device *dev, struct device *master, void *data)
 	struct dpu_kms *dpu_kms = platform_get_drvdata(pdev);
 	struct dss_module_power *mp = &dpu_kms->mp;
 
+	if (dpu_kms->opp_table)
+		dev_pm_opp_of_remove_table(dev);
+	dev_pm_opp_put_clkname(dpu_kms->opp);
 	msm_dss_put_clk(mp->clk_config, mp->num_clk);
 	devm_kfree(&pdev->dev, mp->clk_config);
 	mp->num_clk = 0;
@@ -1090,6 +1106,8 @@ static int __maybe_unused dpu_runtime_suspend(struct device *dev)
 	struct dpu_kms *dpu_kms = platform_get_drvdata(pdev);
 	struct dss_module_power *mp = &dpu_kms->mp;
 
+	/* Drop the performance state vote */
+	dev_pm_opp_set_rate(dev, 0);
 	rc = msm_dss_enable_clk(mp->clk_config, mp->num_clk, false);
 	if (rc)
 		DPU_ERROR("clock disable failed rc:%d\n", rc);
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
index 211f5de9..0060709 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
@@ -128,6 +128,10 @@ struct dpu_kms {
 
 	struct platform_device *pdev;
 	bool rpm_enabled;
+
+	struct opp_table *opp;
+	bool opp_table;
+
 	struct dss_module_power mp;
 
 	/* reference count bandwidth requests, so we know when we can
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
