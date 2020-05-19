Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B51BC1D97E7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2020 15:36:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728939AbgESNgj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 19 May 2020 09:36:39 -0400
Received: from mail26.static.mailgun.info ([104.130.122.26]:19114 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728745AbgESNgi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 19 May 2020 09:36:38 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1589895398; h=Content-Transfer-Encoding: MIME-Version:
 References: In-Reply-To: Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=m0DzTYtf4MHXFq57EpInL6UTJxw03cFnURdsVxmGuk4=; b=ceyj3qyhL689EHJkHx1Zl5VUv1HV3nBcZ8q88WcMC/uh4r5GaIAXqE8txp66JkYvFuBytIXq
 VH6IfD3MOmM1wlZaun8GIS8hvA/hQyV+zQq55zTC6PZDNW0XCz6j3+UG0Kzovs733oWbzmO+
 Ojl1ljYcBuuhMwnj7Q1r+s0g/U8=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-east-1.postgun.com with SMTP id
 5ec3e0e432170d3ddd5b9147 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 19 May 2020 13:36:36
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 11AA6C433D2; Tue, 19 May 2020 13:36:36 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from blr-ubuntu-311.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: saiprakash.ranjan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 6FF03C433F2;
        Tue, 19 May 2020 13:36:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 6FF03C433F2
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=saiprakash.ranjan@codeaurora.org
From:   Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To:     Mathieu Poirier <mathieu.poirier@linaro.org>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>
Cc:     Stephen Boyd <swboyd@chromium.org>, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, coresight@lists.linaro.org,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Subject: [PATCHv2 3/4] coresight: replicator: Reset replicator if context is lost
Date:   Tue, 19 May 2020 19:06:02 +0530
Message-Id: <c2e02d0c92b081c05b91d07ec17e648c40af3897.1589894597.git.saiprakash.ranjan@codeaurora.org>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <cover.1589894597.git.saiprakash.ranjan@codeaurora.org>
References: <cover.1589894597.git.saiprakash.ranjan@codeaurora.org>
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
Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
---

Added Mike's suggested by for parts other than the DT property.
Perhaps I should add Co-developed-by Mike since the full skeletal
was given by Mike. I can add that if required on the next version.

---
 .../coresight/coresight-replicator.c          | 53 +++++++++++++------
 1 file changed, 36 insertions(+), 17 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-replicator.c b/drivers/hwtracing/coresight/coresight-replicator.c
index c619b456f55a..ba66160c8140 100644
--- a/drivers/hwtracing/coresight/coresight-replicator.c
+++ b/drivers/hwtracing/coresight/coresight-replicator.c
@@ -38,6 +38,7 @@ struct replicator_drvdata {
 	struct clk		*atclk;
 	struct coresight_device	*csdev;
 	spinlock_t		spinlock;
+	bool			check_idfilter_val;
 };
 
 static void dynamic_replicator_reset(struct replicator_drvdata *drvdata)
@@ -66,29 +67,43 @@ static int dynamic_replicator_enable(struct replicator_drvdata *drvdata,
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
@@ -239,6 +254,10 @@ static int replicator_probe(struct device *dev, struct resource *res)
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

