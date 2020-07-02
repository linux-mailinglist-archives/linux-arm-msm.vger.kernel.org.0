Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7285F2121CA
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Jul 2020 13:09:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728346AbgGBLJ5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 2 Jul 2020 07:09:57 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:57657 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728545AbgGBLJz (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 2 Jul 2020 07:09:55 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1593688195; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=VdziHzaqJ2L8vDYSBajh7gQkeREpPKM1zryKiyyoxLU=; b=Nea94jP71s3hLyUAL+J6Bw/GhoSQFAa7wGplo6gKoLeyVjbshA31c7BoJhPaQoIVaac0HepK
 eoS2oFgpiZSpSbJzCNweMcx02sYmtbngZfXQZJ+vnQ7BBOhawtZedlQjuFiGdPj1Fb4SGFqR
 N7IkOGYTSIA/cl/W1yNfqfpA4+g=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-east-1.postgun.com with SMTP id
 5efdc08386de6ccd4448d669 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 02 Jul 2020 11:09:55
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 5111FC433C8; Thu,  2 Jul 2020 11:09:54 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from blr-ubuntu-173.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: rnayak)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id E64B9C433CA;
        Thu,  2 Jul 2020 11:09:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org E64B9C433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=rnayak@codeaurora.org
From:   Rajendra Nayak <rnayak@codeaurora.org>
To:     robdclark@gmail.com, sean@poorly.run, agross@kernel.org,
        bjorn.andersson@linaro.org
Cc:     dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        mka@chromium.org, Rajendra Nayak <rnayak@codeaurora.org>
Subject: [PATCH v2 2/4] drm/msm: dsi: Use OPP API to set clk/perf state
Date:   Thu,  2 Jul 2020 16:39:09 +0530
Message-Id: <1593688151-22616-3-git-send-email-rnayak@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1593688151-22616-1-git-send-email-rnayak@codeaurora.org>
References: <1593688151-22616-1-git-send-email-rnayak@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On SDM845 and SC7180 DSI needs to express a performance state
requirement on a power domain depending on the clock rates.
Use OPP table from DT to register with OPP framework and use
dev_pm_opp_set_rate() to set the clk/perf state.

dev_pm_opp_set_rate() is designed to be equivalent to clk_set_rate()
for devices without an OPP table, hence the change works fine
on devices/platforms which only need to set a clock rate.

Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
---
 drivers/gpu/drm/msm/dsi/dsi_host.c | 26 ++++++++++++++++++++++++--
 1 file changed, 24 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
index 11ae5b8..09e16b8 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_host.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
@@ -14,6 +14,7 @@
 #include <linux/of_graph.h>
 #include <linux/of_irq.h>
 #include <linux/pinctrl/consumer.h>
+#include <linux/pm_opp.h>
 #include <linux/regmap.h>
 #include <linux/regulator/consumer.h>
 #include <linux/spinlock.h>
@@ -111,6 +112,9 @@ struct msm_dsi_host {
 	struct clk *pixel_clk_src;
 	struct clk *byte_intf_clk;
 
+	struct opp_table *opp_table;
+	bool has_opp_table;
+
 	u32 byte_clk_rate;
 	u32 pixel_clk_rate;
 	u32 esc_clk_rate;
@@ -512,9 +516,10 @@ int dsi_link_clk_set_rate_6g(struct msm_dsi_host *msm_host)
 	DBG("Set clk rates: pclk=%d, byteclk=%d",
 		msm_host->mode->clock, msm_host->byte_clk_rate);
 
-	ret = clk_set_rate(msm_host->byte_clk, msm_host->byte_clk_rate);
+	ret = dev_pm_opp_set_rate(&msm_host->pdev->dev,
+				  msm_host->byte_clk_rate);
 	if (ret) {
-		pr_err("%s: Failed to set rate byte clk, %d\n", __func__, ret);
+		pr_err("%s: dev_pm_opp_set_rate failed %d\n", __func__, ret);
 		return ret;
 	}
 
@@ -658,6 +663,8 @@ int dsi_link_clk_enable_v2(struct msm_dsi_host *msm_host)
 
 void dsi_link_clk_disable_6g(struct msm_dsi_host *msm_host)
 {
+	/* Drop the performance state vote */
+	dev_pm_opp_set_rate(&msm_host->pdev->dev, 0);
 	clk_disable_unprepare(msm_host->esc_clk);
 	clk_disable_unprepare(msm_host->pixel_clk);
 	if (msm_host->byte_intf_clk)
@@ -1879,6 +1886,18 @@ int msm_dsi_host_init(struct msm_dsi *msm_dsi)
 		goto fail;
 	}
 
+	msm_host->opp_table = dev_pm_opp_set_clkname(&pdev->dev, "byte");
+	if (IS_ERR(msm_host->opp_table))
+		return PTR_ERR(msm_host->opp_table);
+	/* OPP table is optional */
+	ret = dev_pm_opp_of_add_table(&pdev->dev);
+	if (!ret) {
+		msm_host->has_opp_table = true;
+	} else if (ret != -ENODEV) {
+		dev_err(&pdev->dev, "invalid OPP table in device tree\n");
+		return ret;
+	}
+
 	init_completion(&msm_host->dma_comp);
 	init_completion(&msm_host->video_comp);
 	mutex_init(&msm_host->dev_mutex);
@@ -1914,6 +1933,9 @@ void msm_dsi_host_destroy(struct mipi_dsi_host *host)
 	mutex_destroy(&msm_host->cmd_mutex);
 	mutex_destroy(&msm_host->dev_mutex);
 
+	if (msm_host->has_opp_table)
+		dev_pm_opp_of_remove_table(&msm_host->pdev->dev);
+	dev_pm_opp_put_clkname(msm_host->opp_table);
 	pm_runtime_disable(&msm_host->pdev->dev);
 }
 
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

