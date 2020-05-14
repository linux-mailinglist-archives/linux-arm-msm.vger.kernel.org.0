Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 488DC1D3E47
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2020 21:59:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728715AbgENT64 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 14 May 2020 15:58:56 -0400
Received: from mail26.static.mailgun.info ([104.130.122.26]:20702 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729030AbgENT6z (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 14 May 2020 15:58:55 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1589486334; h=Content-Transfer-Encoding: MIME-Version:
 References: In-Reply-To: Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=4BMhupYJpODeOQiXNtxQqXSXYewQj0c5zkqBomiKNvA=; b=CgvJ7op0mQVs4sBlkkpqAXh0dgP0YGNR+mo9tP4xeOTEKp4LRljb+K+ztobzzNsU+9Ogzncw
 wRXxhhwFInGXjG4aTk5bn0zvaP155cxELCktycPzVCSLAh14QVE42gUqDqLDCBqa3zSD+cyp
 gufY7YuDRzDwCOiq7er0SmI3xLM=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-east-1.postgun.com with SMTP id
 5ebda2e961db07dc42de698b (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 14 May 2020 19:58:33
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id D3CA3C432C2; Thu, 14 May 2020 19:58:32 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from blr-ubuntu-311.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: saiprakash.ranjan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 5FE4AC433F2;
        Thu, 14 May 2020 19:58:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 5FE4AC433F2
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=saiprakash.ranjan@codeaurora.org
From:   Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To:     Mathieu Poirier <mathieu.poirier@linaro.org>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>, devicetree@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>
Cc:     Stephen Boyd <swboyd@chromium.org>, Leo Yan <leo.yan@linaro.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Tingwei Zhang <tingwei@codeaurora.org>,
        coresight@lists.linaro.org,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Subject: [PATCHv2 1/2] coresight: etm4x: Add support to skip trace unit power up
Date:   Fri, 15 May 2020 01:27:55 +0530
Message-Id: <7f2aeb36979ebfef30ea8356e6aa3111a611d6b5.1589485594.git.saiprakash.ranjan@codeaurora.org>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <cover.1589485594.git.saiprakash.ranjan@codeaurora.org>
References: <cover.1589485594.git.saiprakash.ranjan@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Tingwei Zhang <tingwei@codeaurora.org>

On some Qualcomm Technologies Inc. SoCs like SC7180, there
exists a hardware errata where the APSS (Application Processor
SubSystem)/CPU watchdog counter is stopped when the trace unit
power up ETM register is set (TRCPDCR.PU = 1). Since the ETMs
share the same power domain as that of respective CPU cores,
they are powered on when the CPU core is powered on. So we can
skip powering up of trace unit after checking for this errata
via new property called "qcom,skip-power-up".

Signed-off-by: Tingwei Zhang <tingwei@codeaurora.org>
Co-developed-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
---
 drivers/hwtracing/coresight/coresight-etm4x.c | 27 ++++++++++++-------
 drivers/hwtracing/coresight/coresight-etm4x.h |  3 +++
 2 files changed, 20 insertions(+), 10 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-etm4x.c b/drivers/hwtracing/coresight/coresight-etm4x.c
index fb0f5f4f3a91..b38214326fa4 100644
--- a/drivers/hwtracing/coresight/coresight-etm4x.c
+++ b/drivers/hwtracing/coresight/coresight-etm4x.c
@@ -196,12 +196,14 @@ static int etm4_enable_hw(struct etmv4_drvdata *drvdata)
 	writel_relaxed(config->vmid_mask0, drvdata->base + TRCVMIDCCTLR0);
 	writel_relaxed(config->vmid_mask1, drvdata->base + TRCVMIDCCTLR1);
 
-	/*
-	 * Request to keep the trace unit powered and also
-	 * emulation of powerdown
-	 */
-	writel_relaxed(readl_relaxed(drvdata->base + TRCPDCR) | TRCPDCR_PU,
-		       drvdata->base + TRCPDCR);
+	if (!drvdata->skip_power_up) {
+		/*
+		 * Request to keep the trace unit powered and also
+		 * emulation of powerdown
+		 */
+		writel_relaxed(readl_relaxed(drvdata->base + TRCPDCR) | TRCPDCR_PU,
+			       drvdata->base + TRCPDCR);
+	}
 
 	/* Enable the trace unit */
 	writel_relaxed(1, drvdata->base + TRCPRGCTLR);
@@ -476,10 +478,12 @@ static void etm4_disable_hw(void *info)
 
 	CS_UNLOCK(drvdata->base);
 
-	/* power can be removed from the trace unit now */
-	control = readl_relaxed(drvdata->base + TRCPDCR);
-	control &= ~TRCPDCR_PU;
-	writel_relaxed(control, drvdata->base + TRCPDCR);
+	if (!drvdata->skip_power_up) {
+		/* power can be removed from the trace unit now */
+		control = readl_relaxed(drvdata->base + TRCPDCR);
+		control &= ~TRCPDCR_PU;
+		writel_relaxed(control, drvdata->base + TRCPDCR);
+	}
 
 	control = readl_relaxed(drvdata->base + TRCPRGCTLR);
 
@@ -1429,6 +1433,9 @@ static int etm4_probe(struct amba_device *adev, const struct amba_id *id)
 			return -ENOMEM;
 	}
 
+	if (fwnode_property_present(dev_fwnode(dev), "qcom,skip-power-up"))
+		drvdata->skip_power_up = true;
+
 	/* Validity for the resource is already checked by the AMBA core */
 	base = devm_ioremap_resource(dev, res);
 	if (IS_ERR(base))
diff --git a/drivers/hwtracing/coresight/coresight-etm4x.h b/drivers/hwtracing/coresight/coresight-etm4x.h
index 4a695bf90582..72c9a55e67df 100644
--- a/drivers/hwtracing/coresight/coresight-etm4x.h
+++ b/drivers/hwtracing/coresight/coresight-etm4x.h
@@ -407,6 +407,8 @@ struct etmv4_save_state {
  * @config:	structure holding configuration parameters.
  * @save_state:	State to be preserved across power loss
  * @state_needs_restore: True when there is context to restore after PM exit
+ * @skip_power_up: Indicates if an implementation can skip powering up
+ *		   the trace unit.
  */
 struct etmv4_drvdata {
 	void __iomem			*base;
@@ -454,6 +456,7 @@ struct etmv4_drvdata {
 	struct etmv4_config		config;
 	struct etmv4_save_state		*save_state;
 	bool				state_needs_restore;
+	bool				skip_power_up;
 };
 
 /* Address comparator access types */
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

