Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CA1A11DEF52
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2020 20:37:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730893AbgEVShW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 22 May 2020 14:37:22 -0400
Received: from mail26.static.mailgun.info ([104.130.122.26]:52774 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1730892AbgEVShW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 22 May 2020 14:37:22 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1590172641; h=Content-Transfer-Encoding: MIME-Version:
 References: In-Reply-To: Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=bsyOXeinYu5RMDv+mbX2fa1+LWpDNqJcBjSNvxl338o=; b=IsR4go2u16PiCxukzLMp3qf7NawASpzLyMDXLUrw3Ag2tiW0i0zl7p6zzBPbLWNhDctien9S
 XBWqXR7cyLluzvdJgCiATpFiSc1GKZ7zI9oDFZddmuCIk/qJiC9iRck/74Zey8MiDPg9IqBq
 huKKfN7baoPh/EjNuhNXSceW/ng=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-east-1.postgun.com with SMTP id
 5ec81bd78075f6e58ca41c22 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 22 May 2020 18:37:11
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 4BEB7C43387; Fri, 22 May 2020 18:37:10 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from blr-ubuntu-311.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: saiprakash.ranjan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 482B2C433C8;
        Fri, 22 May 2020 18:37:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 482B2C433C8
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=saiprakash.ranjan@codeaurora.org
From:   Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To:     Mathieu Poirier <mathieu.poirier@linaro.org>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>, devicetree@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, Stephen Boyd <swboyd@chromium.org>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Subject: [PATCHv3 1/2] coresight: replicator: Reset replicator if context is lost
Date:   Sat, 23 May 2020 00:06:51 +0530
Message-Id: <64b324cd144377d2ce9a09bd728656a721936046.1590171891.git.saiprakash.ranjan@codeaurora.org>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <cover.1590171891.git.saiprakash.ranjan@codeaurora.org>
References: <cover.1590171891.git.saiprakash.ranjan@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On some QCOM SoCs, replicators in Always-On domain loses its
context as soon as the clock is disabled. Currently as a part
of pm_runtime workqueue, clock is disabled after the replicator
is initialized by amba_pm_runtime_suspend assuming that context
is not lost which is not true for replicators with such
limitations. So add a new property "qcom,replicator-loses-context"
to identify such replicators and reset them.

Suggested-by: Mike Leach <mike.leach@linaro.org>
Reviewed-by: Mike Leach <mike.leach@linaro.org>
Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
---
 .../coresight/coresight-replicator.c          | 55 +++++++++++++------
 1 file changed, 38 insertions(+), 17 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-replicator.c b/drivers/hwtracing/coresight/coresight-replicator.c
index e7dc1c31d20d..9d3a8f915784 100644
--- a/drivers/hwtracing/coresight/coresight-replicator.c
+++ b/drivers/hwtracing/coresight/coresight-replicator.c
@@ -14,6 +14,7 @@
 #include <linux/err.h>
 #include <linux/slab.h>
 #include <linux/pm_runtime.h>
+#include <linux/property.h>
 #include <linux/clk.h>
 #include <linux/of.h>
 #include <linux/coresight.h>
@@ -32,12 +33,14 @@ DEFINE_CORESIGHT_DEVLIST(replicator_devs, "replicator");
  * @atclk:	optional clock for the core parts of the replicator.
  * @csdev:	component vitals needed by the framework
  * @spinlock:	serialize enable/disable operations.
+ * @check_idfilter_val: check if the context is lost upon clock removal.
  */
 struct replicator_drvdata {
 	void __iomem		*base;
 	struct clk		*atclk;
 	struct coresight_device	*csdev;
 	spinlock_t		spinlock;
+	bool			check_idfilter_val;
 };
 
 static void dynamic_replicator_reset(struct replicator_drvdata *drvdata)
@@ -66,29 +69,43 @@ static int dynamic_replicator_enable(struct replicator_drvdata *drvdata,
 				     int inport, int outport)
 {
 	int rc = 0;
-	u32 reg;
-
-	switch (outport) {
-	case 0:
-		reg = REPLICATOR_IDFILTER0;
-		break;
-	case 1:
-		reg = REPLICATOR_IDFILTER1;
-		break;
-	default:
-		WARN_ON(1);
-		return -EINVAL;
-	}
+	u32 id0val, id1val;
 
 	CS_UNLOCK(drvdata->base);
 
-	if ((readl_relaxed(drvdata->base + REPLICATOR_IDFILTER0) == 0xff) &&
-	    (readl_relaxed(drvdata->base + REPLICATOR_IDFILTER1) == 0xff))
+	id0val = readl_relaxed(drvdata->base + REPLICATOR_IDFILTER0);
+	id1val = readl_relaxed(drvdata->base + REPLICATOR_IDFILTER1);
+
+	/*
+	 * Some replicator designs lose context when AMBA clocks are removed,
+	 * so have a check for this.
+	 */
+	if (drvdata->check_idfilter_val && id0val == 0x0 && id1val == 0x0)
+		id0val = id1val = 0xff;
+
+	if (id0val == 0xff && id1val == 0xff)
 		rc = coresight_claim_device_unlocked(drvdata->base);
 
+	if (!rc) {
+		switch (outport) {
+		case 0:
+			id0val = 0x0;
+			break;
+		case 1:
+			id1val = 0x0;
+			break;
+		default:
+			WARN_ON(1);
+			rc = -EINVAL;
+		}
+	}
+
 	/* Ensure that the outport is enabled. */
-	if (!rc)
-		writel_relaxed(0x00, drvdata->base + reg);
+	if (!rc) {
+		writel_relaxed(id0val, drvdata->base + REPLICATOR_IDFILTER0);
+		writel_relaxed(id1val, drvdata->base + REPLICATOR_IDFILTER1);
+	}
+
 	CS_LOCK(drvdata->base);
 
 	return rc;
@@ -239,6 +256,10 @@ static int replicator_probe(struct device *dev, struct resource *res)
 		desc.groups = replicator_groups;
 	}
 
+	if (fwnode_property_present(dev_fwnode(dev),
+				    "qcom,replicator-loses-context"))
+		drvdata->check_idfilter_val = true;
+
 	dev_set_drvdata(dev, drvdata);
 
 	pdata = coresight_get_platform_data(dev);
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

